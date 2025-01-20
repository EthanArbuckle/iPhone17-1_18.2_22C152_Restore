uint64_t dispatch thunk of static PenetrationRateEventFilter.isAppUIEvent(appIntent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static PenetrationRateEventFilter.isSiriEvent(siriExecution:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

BOOL sub_24C955680(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_24C955694@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_24C9556A4(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for BMAppIntentHandlingStatus(uint64_t a1)
{
}

void type metadata accessor for BMAppIntentInteractionDirection(uint64_t a1)
{
}

void type metadata accessor for BMSiriExecutionTaskStep(uint64_t a1)
{
}

void sub_24C9556EC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void PenetrationRateCalculationTask.taskType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t PenetrationRateCalculationTask.eventFilter.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_24C955754()
{
  uint64_t v0 = type metadata accessor for SendSMSPenetrationRateEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 0;
  *(void *)(result + 24) = v0;
  *(void *)(result + 32) = &protocol witness table for SendSMSPenetrationRateEventFilter;
  qword_2697FE8D8 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.sendSMSCalculation.getter()
{
  return sub_24C9558B8(&qword_2697FE870);
}

uint64_t sub_24C9557C8()
{
  uint64_t v0 = type metadata accessor for SetReminderPenetrationEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 1;
  *(void *)(result + 24) = v0;
  *(void *)(result + 32) = &protocol witness table for SetReminderPenetrationEventFilter;
  qword_2697FE8E0 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.setReminderCalculation.getter()
{
  return sub_24C9558B8(&qword_2697FE878);
}

uint64_t sub_24C955840()
{
  uint64_t v0 = type metadata accessor for StartCallPenetrationRateEventFilter();
  type metadata accessor for PenetrationRateCalculationTask();
  uint64_t result = swift_allocObject();
  *(unsigned char *)(result + 16) = 2;
  *(void *)(result + 24) = v0;
  *(void *)(result + 32) = &protocol witness table for StartCallPenetrationRateEventFilter;
  qword_2697FE8E8 = result;
  return result;
}

uint64_t static PenetrationRateCalculationTask.startCallCalculation.getter()
{
  return sub_24C9558B8(&qword_2697FE880);
}

uint64_t sub_24C9558B8(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t PenetrationRateCalculationTask.deinit()
{
  return v0;
}

uint64_t PenetrationRateCalculationTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PenetrationRateCalculationTask()
{
  return self;
}

uint64_t method lookup function for PenetrationRateCalculationTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PenetrationRateCalculationTask);
}

uint64_t SiriPenetrationRateResult.countsByAggregationInterval.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateResult.countsByAggregationInterval.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SiriPenetrationRateResult.countsByAggregationInterval.modify())()
{
  return nullsub_1;
}

uint64_t SiriPenetrationRateResult.eventStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateResult.conversationStreamMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C9559C0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C9559C8()
{
  return swift_bridgeObjectRetain();
}

BOOL static SiriPenetrationRateUtils.hasViewMode(siriUI:)(uint64_t a1)
{
  return sub_24C955A94(a1, MEMORY[0x263F39648], MEMORY[0x263F39640], MEMORY[0x263F39650]);
}

BOOL static SiriPenetrationRateUtils.hasAudioInputRoute(turn:)(uint64_t a1)
{
  return sub_24C955A94(a1, MEMORY[0x263F39628], MEMORY[0x263F39620], MEMORY[0x263F396C8]);
}

BOOL static SiriPenetrationRateUtils.hasSiriInputLocale(turn:)(uint64_t a1)
{
  return sub_24C955A94(a1, MEMORY[0x263F39638], MEMORY[0x263F39630], MEMORY[0x263F396C8]);
}

BOOL sub_24C955A94(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), void (*a4)(uint64_t *__return_ptr, uint64_t, uint64_t, void, void))
{
  a2(0);
  uint64_t v6 = a3();
  a4(&v10, v6, v7, MEMORY[0x263F8D310], MEMORY[0x263F8D310]);
  swift_bridgeObjectRelease();
  uint64_t v8 = v11;
  if (v11) {
    swift_bridgeObjectRelease();
  }
  return v8 != 0;
}

uint64_t sub_24C955B28(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24C980A60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24C980A60();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x253302A80](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24C96B8C4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24C980A60();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24C980870();
}

uint64_t _s11DeepThought24SiriPenetrationRateUtilsO07alignToC15ExecutionEvents04siriiJ00K8UIEvents0K13Conversations12timeDurationSay0aB15BiomeFoundation15FeaturizedEventCGAL_ALSayAI0R12ConversationCGSdtFZ_0(unint64_t a1, unint64_t a2, unint64_t a3, double a4)
{
  unint64_t v112 = a3;
  unint64_t v130 = a2;
  uint64_t v133 = sub_24C980340();
  uint64_t v129 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  v132 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_24C9800F0();
  uint64_t v7 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v121 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_24C980720();
  uint64_t v107 = *(void *)(v134 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v134);
  uint64_t v11 = (uint64_t)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (uint64_t)&v105 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v135 = (char *)&v105 - v16;
  MEMORY[0x270FA5388](v15);
  v18 = (char *)&v105 - v17;
  uint64_t v131 = sub_24C9806C0();
  swift_allocObject();
  uint64_t v19 = sub_24C980670();
  if (a1 >> 62) {
    goto LABEL_118;
  }
  uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v124 = v19;
  uint64_t v106 = v11;
  uint64_t v120 = v14;
  v128 = (void (**)(char *, uint64_t, uint64_t))v20;
  uint64_t v116 = v7;
  if (v20)
  {
    unint64_t v138 = a1 & 0xC000000000000001;
    v137 = (void (**)(char *, uint64_t))(v107 + 8);
    v127 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v14 = 4;
    *(void *)&long long v21 = 136315394;
    long long v126 = v21;
    v119 = (void (**)(char *, uint64_t))(MEMORY[0x263F8EE58] + 8);
    uint64_t v11 = v130;
    uint64_t v7 = (uint64_t)v128;
    v125 = (void (**)(uint64_t, uint64_t))a1;
    v123 = v18;
    while (1)
    {
      uint64_t v22 = v14 - 4;
      if (v138)
      {
        MEMORY[0x253302A70](v14 - 4, a1);
        BOOL v23 = __OFADD__(v22, 1);
        uint64_t v24 = v14 - 3;
        if (v23) {
          goto LABEL_106;
        }
      }
      else
      {
        swift_retain();
        BOOL v23 = __OFADD__(v22, 1);
        uint64_t v24 = v14 - 3;
        if (v23) {
          goto LABEL_106;
        }
      }
      sub_24C980460();
      swift_retain_n();
      v25 = sub_24C980700();
      uint64_t v19 = sub_24C980920();
      if (os_log_type_enabled(v25, (os_log_type_t)v19))
      {
        uint64_t v136 = v24;
        uint64_t v26 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v139 = v11;
        *(_DWORD *)uint64_t v26 = v126;
        sub_24C9804A0();
        v27 = v121;
        sub_24C9800A0();
        sub_24C957480();
        uint64_t v7 = v122;
        v18 = (char *)sub_24C980B80();
        a1 = v28;
        (*v127)(v27, v7);
        *(void *)(v26 + 4) = sub_24C95F060((uint64_t)v18, a1, &v139);
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v26 + 12) = 2048;
        sub_24C9804A0();
        double v30 = v29;
        swift_release();
        double v31 = v30 / a4;
        if ((~COERCE__INT64(v30 / a4) & 0x7FF0000000000000) == 0) {
          goto LABEL_110;
        }
        if (v31 <= -9.22337204e18)
        {
LABEL_111:
          __break(1u);
LABEL_112:
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
          swift_bridgeObjectRetain();
          uint64_t v20 = sub_24C980A60();
          goto LABEL_3;
        }
        if (v31 >= 9.22337204e18) {
          goto LABEL_112;
        }
        *(void *)(v26 + 14) = (uint64_t)v31;
        swift_release();
        _os_log_impl(&dword_24C953000, v25, (os_log_type_t)v19, "marker: adding the event to the siriExecutionEventsByBucketizedTimestamp at time %s with bucket %ld", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x253303270](v11, -1, -1);
        MEMORY[0x253303270](v26, -1, -1);

        v18 = v123;
        (*v137)(v123, v134);
        uint64_t v11 = v130;
        a1 = (unint64_t)v125;
        uint64_t v7 = (uint64_t)v128;
        uint64_t v24 = v136;
      }
      else
      {

        swift_release_n();
        (*v137)(v18, v134);
      }
      sub_24C9804A0();
      uint64_t v19 = v124;
      sub_24C980660();
      swift_release();
      ++v14;
      if (v24 == v7)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = v120;
        goto LABEL_19;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v130;
LABEL_19:
  swift_allocObject();
  uint64_t v32 = sub_24C980670();
  if ((unint64_t)v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_24C980A60();
  }
  else
  {
    uint64_t v33 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v34 = MEMORY[0x263F8EE58];
  unint64_t v115 = v32;
  if (v33)
  {
    uint64_t v35 = sub_24C9803E0();
    v137 = (void (**)(char *, uint64_t))(v11 & 0xC000000000000001);
    unint64_t v138 = v35;
    *(void *)&long long v126 = v107 + 8;
    v119 = (void (**)(char *, uint64_t))(v116 + 8);
    uint64_t v7 = *MEMORY[0x263F39618];
    v127 = (void (**)(char *, uint64_t))(v129 + 8);
    v128 = (void (**)(char *, uint64_t, uint64_t))(v129 + 104);
    uint64_t v19 = 4;
    *(void *)&long long v36 = 136315650;
    long long v118 = v36;
    *(void *)&long long v117 = v34 + 8;
    LODWORD(v123) = v7;
    uint64_t v136 = v33;
    do
    {
      uint64_t v37 = v19 - 4;
      if (v137)
      {
        v18 = (char *)MEMORY[0x253302A70](v19 - 4, v11);
        a1 = v19 - 3;
        if (__OFADD__(v37, 1)) {
          goto LABEL_107;
        }
      }
      else
      {
        v18 = *(char **)(v11 + 8 * v19);
        swift_retain();
        a1 = v19 - 3;
        if (__OFADD__(v37, 1)) {
          goto LABEL_107;
        }
      }
      sub_24C9803D0();
      sub_24C980470();
      swift_bridgeObjectRelease();
      if (v140)
      {
        swift_bridgeObjectRelease();
        v38 = v135;
        sub_24C980460();
        swift_retain_n();
        v39 = sub_24C980700();
        int v40 = sub_24C980920();
        if (os_log_type_enabled(v39, (os_log_type_t)v40))
        {
          LODWORD(v125) = v40;
          uint64_t v14 = swift_slowAlloc();
          uint64_t v7 = swift_slowAlloc();
          v143[0] = v7;
          *(_DWORD *)uint64_t v14 = v118;
          sub_24C9804A0();
          v41 = v121;
          sub_24C9800A0();
          sub_24C957480();
          uint64_t v11 = v122;
          uint64_t v42 = sub_24C980B80();
          unint64_t v44 = v43;
          (*v119)(v41, v11);
          *(void *)(v14 + 4) = sub_24C95F060(v42, v44, v143);
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v14 + 12) = 2048;
          sub_24C9804A0();
          double v46 = v45;
          swift_release();
          double v47 = v46 / a4;
          if ((~COERCE__INT64(v46 / a4) & 0x7FF0000000000000) == 0) {
            goto LABEL_113;
          }
          if (v47 <= -9.22337204e18) {
            goto LABEL_114;
          }
          if (v47 >= 9.22337204e18) {
            goto LABEL_115;
          }
          *(void *)(v14 + 14) = (uint64_t)v47;
          swift_release();
          *(_WORD *)(v14 + 22) = 2080;
          sub_24C9803D0();
          sub_24C980470();
          swift_bridgeObjectRelease();
          if (v140) {
            uint64_t v48 = v139;
          }
          else {
            uint64_t v48 = 0;
          }
          if (v140) {
            unint64_t v49 = v140;
          }
          else {
            unint64_t v49 = 0xE000000000000000;
          }
          *(void *)(v14 + 24) = sub_24C95F060(v48, v49, v143);
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24C953000, v39, (os_log_type_t)v125, "marker: trying to add the event to the siriUIEventsByBucketizedTimestamp at time %s with bucket %ld with %s", (uint8_t *)v14, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x253303270](v7, -1, -1);
          MEMORY[0x253303270](v14, -1, -1);

          (*(void (**)(char *, uint64_t))v126)(v135, v134);
          uint64_t v7 = v123;
          uint64_t v11 = v130;
        }
        else
        {

          swift_release_n();
          (*(void (**)(char *, uint64_t))v126)(v38, v134);
        }
        v50 = v132;
        uint64_t v141 = v131;
        uint64_t v142 = MEMORY[0x263F396E0];
        uint64_t v139 = v124;
        uint64_t v51 = v7;
        uint64_t v52 = v133;
        (*v128)(v132, v51, v133);
        swift_retain();
        sub_24C980690();
        swift_release();
        swift_release();
        uint64_t v53 = v52;
        uint64_t v7 = v123;
        (*v127)(v50, v53);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
        uint64_t v14 = v120;
        uint64_t v33 = v136;
      }
      else
      {
        swift_release();
      }
      ++v19;
    }
    while (a1 != v33);
    swift_bridgeObjectRelease();
    uint64_t v19 = v124;
    int v54 = v7;
  }
  else
  {
    swift_bridgeObjectRelease();
    int v54 = *MEMORY[0x263F39618];
  }
  uint64_t v55 = v129;
  v56 = *(void (***)(char *, uint64_t))(v129 + 104);
  v57 = v132;
  LODWORD(v123) = v54;
  uint64_t v58 = v133;
  v127 = v56;
  v128 = (void (**)(char *, uint64_t, uint64_t))(v129 + 104);
  ((void (*)(char *))v56)(v132);
  sub_24C980650();
  v59 = *(void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v129 = v55 + 8;
  *(void *)&long long v126 = v59;
  v59(v57, v58);
  sub_24C980640();
  swift_allocObject();
  v18 = (char *)sub_24C980610();
  if (v112 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_24C980A60();
  }
  else
  {
    uint64_t v60 = *(void *)((v112 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v62 = v60;
  }
  unint64_t v63 = v112;
  uint64_t v7 = v123;
  v119 = (void (**)(char *, uint64_t))v18;
  if (v62)
  {
    unint64_t v64 = 0;
    unint64_t v111 = v112 & 0xC000000000000001;
    uint64_t v109 = v112 & 0xFFFFFFFFFFFFFF8;
    unint64_t v108 = v112 + 32;
    v125 = (void (**)(uint64_t, uint64_t))(v107 + 8);
    *(void *)&long long v118 = v116 + 8;
    uint64_t v11 = MEMORY[0x263F8D310];
    *(void *)&long long v61 = 136315394;
    long long v117 = v61;
    uint64_t v116 = MEMORY[0x263F8EE58] + 8;
    uint64_t v110 = v62;
    do
    {
      if (v111)
      {
        unint64_t v65 = v64;
        uint64_t v66 = MEMORY[0x253302A70](v64, v63);
        BOOL v23 = __OFADD__(v65, 1);
        unint64_t v67 = v65 + 1;
        if (v23) {
          goto LABEL_109;
        }
      }
      else
      {
        if (v64 >= *(void *)(v109 + 16)) {
          goto LABEL_116;
        }
        uint64_t v66 = *(void *)(v108 + 8 * v64);
        unint64_t v68 = v64;
        swift_retain();
        BOOL v23 = __OFADD__(v68, 1);
        unint64_t v67 = v68 + 1;
        if (v23) {
          goto LABEL_109;
        }
      }
      unint64_t v114 = v67;
      unint64_t v69 = sub_24C980560();
      a1 = v69;
      uint64_t v113 = v66;
      if (v69 >> 62)
      {
        uint64_t v70 = sub_24C980A60();
        if (v70)
        {
LABEL_59:
          uint64_t v136 = sub_24C980360();
          v137 = (void (**)(char *, uint64_t))(a1 & 0xC000000000000001);
          uint64_t v71 = 4;
          unint64_t v130 = a1;
          v135 = (char *)v70;
          do
          {
            uint64_t v74 = v71 - 4;
            if (v137)
            {
              MEMORY[0x253302A70](v71 - 4, a1);
              unint64_t v75 = v71 - 3;
              if (__OFADD__(v74, 1)) {
                goto LABEL_102;
              }
            }
            else
            {
              swift_retain();
              unint64_t v75 = v71 - 3;
              if (__OFADD__(v74, 1))
              {
LABEL_102:
                __break(1u);
LABEL_103:
                __break(1u);
LABEL_104:
                __break(1u);
LABEL_105:
                __break(1u);
LABEL_106:
                __break(1u);
LABEL_107:
                __break(1u);
LABEL_108:
                __break(1u);
LABEL_109:
                __break(1u);
LABEL_110:
                __break(1u);
                goto LABEL_111;
              }
            }
            unint64_t v138 = v75;
            sub_24C980350();
            sub_24C980590();
            swift_bridgeObjectRelease();
            if (v140 || (sub_24C980380(), sub_24C980370(), sub_24C980590(), swift_bridgeObjectRelease(), v140))
            {
              swift_bridgeObjectRelease();
              sub_24C980460();
              swift_retain_n();
              v76 = sub_24C980700();
              uint64_t v11 = sub_24C980920();
              if (os_log_type_enabled(v76, (os_log_type_t)v11))
              {
                uint64_t v19 = swift_slowAlloc();
                a1 = swift_slowAlloc();
                uint64_t v139 = a1;
                *(_DWORD *)uint64_t v19 = v117;
                sub_24C9805A0();
                v77 = v121;
                sub_24C9800A0();
                sub_24C957480();
                uint64_t v14 = v122;
                uint64_t v7 = sub_24C980B80();
                v18 = v78;
                (*(void (**)(char *, uint64_t))v118)(v77, v14);
                *(void *)(v19 + 4) = sub_24C95F060(v7, (unint64_t)v18, &v139);
                swift_release_n();
                swift_bridgeObjectRelease();
                *(_WORD *)(v19 + 12) = 2048;
                sub_24C9805A0();
                double v80 = v79;
                swift_release();
                double v81 = v80 / a4;
                if ((~COERCE__INT64(v80 / a4) & 0x7FF0000000000000) == 0) {
                  goto LABEL_103;
                }
                if (v81 <= -9.22337204e18) {
                  goto LABEL_104;
                }
                if (v81 >= 9.22337204e18) {
                  goto LABEL_105;
                }
                *(void *)(v19 + 14) = (uint64_t)v81;
                swift_release();
                _os_log_impl(&dword_24C953000, v76, (os_log_type_t)v11, "marker: trying to add the turn to the turnsByBucketizedTimestamp at time %s with bucket %ld", (uint8_t *)v19, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x253303270](a1, -1, -1);
                MEMORY[0x253303270](v19, -1, -1);

                uint64_t v14 = v120;
                (*v125)(v120, v134);
                uint64_t v19 = v124;
                uint64_t v7 = v123;
                v18 = (char *)v119;
              }
              else
              {

                swift_release_n();
                (*v125)(v14, v134);
              }
              v72 = v132;
              uint64_t v141 = v131;
              uint64_t v142 = MEMORY[0x263F396E0];
              uint64_t v139 = v19;
              uint64_t v73 = v133;
              ((void (*)(char *, uint64_t, uint64_t))v127)(v132, v7, v133);
              swift_retain();
              sub_24C980620();
              swift_release();
              swift_release();
              ((void (*)(char *, uint64_t))v126)(v72, v73);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v139);
              uint64_t v11 = MEMORY[0x263F8D310];
              a1 = v130;
            }
            else
            {
              swift_release();
            }
            ++v71;
          }
          while ((char *)v138 != v135);
        }
      }
      else
      {
        uint64_t v70 = *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v70) {
          goto LABEL_59;
        }
      }
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v64 = v114;
      unint64_t v63 = v112;
    }
    while (v114 != v110);
  }
  swift_bridgeObjectRelease();
  uint64_t v82 = v7;
  v84 = v132;
  uint64_t v83 = v133;
  ((void (*)(char *, uint64_t, uint64_t))v127)(v132, v82, v133);
  sub_24C9806B0();
  ((void (*)(char *, uint64_t))v126)(v84, v83);
  uint64_t v85 = v106;
  sub_24C980460();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  v86 = sub_24C980700();
  os_log_type_t v87 = sub_24C980920();
  if (os_log_type_enabled(v86, v87))
  {
    uint64_t v88 = swift_slowAlloc();
    uint64_t v89 = swift_slowAlloc();
    uint64_t v139 = v89;
    *(_DWORD *)uint64_t v88 = 136315650;
    uint64_t v90 = sub_24C9806A0();
    v143[0] = sub_24C95F060(v90, v91, &v139);
    sub_24C980950();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 12) = 2080;
    uint64_t v92 = sub_24C9806A0();
    v143[0] = sub_24C95F060(v92, v93, &v139);
    sub_24C980950();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v88 + 22) = 2080;
    v18 = (char *)v119;
    uint64_t v94 = sub_24C980630();
    v143[0] = sub_24C95F060(v94, v95, &v139);
    sub_24C980950();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v86, v87, "    marker: The detail of siriExecutionEventsByBucketizedTimestamp is %s,\n\n            The detail of siriUIEventsByBucketizedTimestamp is %s,\n\n            The detail of turnsByBucketizedTimestamp is %s,\n", (uint8_t *)v88, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x253303270](v89, -1, -1);
    MEMORY[0x253303270](v88, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_release_n();
  }
  (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v85, v134);
  uint64_t v139 = MEMORY[0x263F8EE78];
  uint64_t v96 = sub_24C980680();
  uint64_t v7 = v96;
  uint64_t v19 = 0;
  uint64_t v97 = v96 + 64;
  uint64_t v98 = 1 << *(unsigned char *)(v96 + 32);
  uint64_t v99 = -1;
  if (v98 < 64) {
    uint64_t v99 = ~(-1 << v98);
  }
  uint64_t v14 = v99 & *(void *)(v96 + 64);
  uint64_t v11 = (unint64_t)(v98 + 63) >> 6;
  a1 = v115;
  while (1)
  {
    if (v14)
    {
      v14 &= v14 - 1;
      goto LABEL_85;
    }
    uint64_t v101 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      goto LABEL_108;
    }
    if (v101 >= v11) {
      break;
    }
    uint64_t v102 = *(void *)(v97 + 8 * v101);
    ++v19;
    if (!v102)
    {
      uint64_t v19 = v101 + 1;
      if (v101 + 1 >= v11) {
        break;
      }
      uint64_t v102 = *(void *)(v97 + 8 * v19);
      if (!v102)
      {
        uint64_t v19 = v101 + 2;
        if (v101 + 2 >= v11) {
          break;
        }
        uint64_t v102 = *(void *)(v97 + 8 * v19);
        if (!v102)
        {
          uint64_t v103 = v101 + 3;
          if (v103 >= v11) {
            break;
          }
          uint64_t v102 = *(void *)(v97 + 8 * v103);
          if (!v102)
          {
            while (1)
            {
              uint64_t v19 = v103 + 1;
              if (__OFADD__(v103, 1)) {
                goto LABEL_117;
              }
              if (v19 >= v11) {
                goto LABEL_101;
              }
              uint64_t v102 = *(void *)(v97 + 8 * v19);
              ++v103;
              if (v102) {
                goto LABEL_100;
              }
            }
          }
          uint64_t v19 = v103;
        }
      }
    }
LABEL_100:
    uint64_t v14 = (v102 - 1) & v102;
LABEL_85:
    unint64_t v100 = swift_bridgeObjectRetain();
    sub_24C955B28(v100);
  }
LABEL_101:
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v139;
}

unint64_t sub_24C957198(uint64_t a1)
{
  unint64_t result = sub_24C9571C0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24C9571C0()
{
  unint64_t result = qword_2697FE8F0;
  if (!qword_2697FE8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FE8F0);
  }
  return result;
}

uint64_t destroy for SiriPenetrationRateResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s11DeepThought25SiriPenetrationRateResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriPenetrationRateResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SiriPenetrationRateResult(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPenetrationRateResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriPenetrationRateResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateResult()
{
  return &type metadata for SiriPenetrationRateResult;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateUtils()
{
  return &type metadata for SiriPenetrationRateUtils;
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

unint64_t sub_24C957480()
{
  unint64_t result = qword_2697FE8F8;
  if (!qword_2697FE8F8)
  {
    sub_24C9800F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FE8F8);
  }
  return result;
}

uint64_t Date.getPreviousDate(calendar:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24C980240();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07870], v2);
  sub_24C980210();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v8 = sub_24C9800F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
  }
  __break(1u);
  return result;
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

uint64_t Date.getEndOfDate(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C957710(a1, 23, 59, a2);
}

uint64_t Date.getStartOfDate(calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C957710(a1, 0, 0, a2);
}

uint64_t sub_24C957710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a1;
  uint64_t v21 = a4;
  uint64_t v4 = sub_24C9801E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24C9801F0();
  uint64_t v22 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C9801C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07780], v12);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F07800], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F077E0], v4);
  sub_24C980200();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v18 = sub_24C9800F0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(v21, v17, v18);
  }
  __break(1u);
  return result;
}

uint64_t Date.getOffsetDateByDays(calendar:numOfDays:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24C980240();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F07870], v2);
  sub_24C980210();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v8 = sub_24C9800F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v7, v8);
  }
  __break(1u);
  return result;
}

uint64_t static Calendar.currentUTC.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE920);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C980220();
  sub_24C980260();
  uint64_t v2 = sub_24C980270();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  if (result != 1) {
    return sub_24C980230();
  }
  __break(1u);
  return result;
}

uint64_t Calendar.numberOfDaysBetween(start:end:)()
{
  uint64_t v0 = sub_24C980070();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE928);
  uint64_t v4 = sub_24C980240();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24C981590;
  (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7 + v6, *MEMORY[0x263F07870], v4);
  sub_24C9582FC(v7);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24C9801D0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24C980060();
  if (v9)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = result;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v10;
  }
  return result;
}

uint64_t sub_24C957F24()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  __swift_allocate_value_buffer(v0, qword_2697FE900);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2697FE900);
  uint64_t v2 = sub_24C9800F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(v1, 1, 1, v2);
}

uint64_t static CustomDate.dateOverride.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  return sub_24C95864C(v3, a1);
}

uint64_t static CustomDate.dateOverride.setter(uint64_t a1)
{
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  sub_24C9586B4(a1, v3);
  swift_endAccess();
  return sub_24C95871C(a1);
}

uint64_t (*static CustomDate.dateOverride.modify())()
{
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  __swift_project_value_buffer(v0, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static CustomDate.current()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v2, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  sub_24C95864C(v5, (uint64_t)v4);
  uint64_t v6 = sub_24C9800F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  }
  sub_24C9800E0();
  return sub_24C95871C((uint64_t)v4);
}

uint64_t sub_24C9582FC(uint64_t a1)
{
  uint64_t v2 = sub_24C980240();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE938);
    uint64_t v9 = sub_24C9809A0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    double v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_24C958FBC(&qword_2697FE940, MEMORY[0x263F07908]);
      uint64_t v16 = sub_24C980760();
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
          sub_24C958FBC(&qword_2697FE948, MEMORY[0x263F07908]);
          char v23 = sub_24C980790();
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
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24C95864C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C9586B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C95871C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v80 = a2;
  uint64_t v71 = a1;
  uint64_t v73 = sub_24C9801E0();
  uint64_t v82 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v3 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_24C9801F0();
  uint64_t v4 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24C9801C0();
  uint64_t v83 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v74 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v69 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v72 = (char *)&v54 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = sub_24C9800F0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  int v54 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v54 - v21;
  MEMORY[0x270FA5388](v20);
  unint64_t v75 = (char *)&v54 - v23;
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v24 = __swift_project_value_buffer(v9, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  sub_24C95864C(v24, (uint64_t)v15);
  v78 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  int v25 = v78(v15, 1, v16);
  uint64_t v70 = v17;
  uint64_t v79 = v17 + 48;
  v76 = v22;
  uint64_t v77 = v16;
  if (v25 == 1)
  {
    sub_24C9800E0();
    sub_24C95871C((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
  }
  uint64_t v26 = v83;
  uint64_t v27 = v74;
  BOOL v28 = *(void (**)(void))(v83 + 104);
  unsigned int v67 = *MEMORY[0x263F07780];
  uint64_t v29 = (char *)v7;
  uint64_t v68 = v83 + 104;
  uint64_t v66 = (void (*)(char *, void, char *))v28;
  v28(v74);
  uint64_t v30 = v4;
  double v31 = *(void (**)(void))(v4 + 104);
  unsigned int v64 = *MEMORY[0x263F07800];
  uint64_t v65 = v4 + 104;
  unint64_t v63 = (void (*)(char *, void, uint64_t))v31;
  v31(v6);
  uint64_t v32 = v82;
  uint64_t v33 = *(void (**)(void))(v82 + 104);
  unsigned int v61 = *MEMORY[0x263F077E0];
  uint64_t v34 = v73;
  uint64_t v62 = v82 + 104;
  uint64_t v60 = (void (*)(char *, void, uint64_t))v33;
  v33(v3);
  uint64_t v35 = v72;
  sub_24C980200();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v82 = v32 + 8;
  v59 = v36;
  v36(v3, v34);
  uint64_t v37 = v35;
  v38 = *(void (**)(char *, uint64_t))(v30 + 8);
  uint64_t v56 = v30 + 8;
  uint64_t v55 = v6;
  uint64_t v39 = v81;
  uint64_t v58 = v38;
  v38(v6, v81);
  int v40 = *(void (**)(char *, char *))(v26 + 8);
  uint64_t v74 = v29;
  v57 = v40;
  uint64_t v83 = v26 + 8;
  v40(v27, v29);
  uint64_t result = v78(v37, 1, v77);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v42 = v39;
    uint64_t v43 = v70;
    uint64_t v44 = v77;
    v72 = *(char **)(v70 + 32);
    ((void (*)(char *, char *, uint64_t))v72)(v75, v37, v77);
    double v45 = v76;
    v76 = *(char **)(v43 + 8);
    ((void (*)(char *, uint64_t))v76)(v45, v44);
    double v46 = v74;
    v66(v27, v67, v74);
    double v47 = v55;
    v63(v55, v64, v42);
    v60(v3, v61, v34);
    uint64_t v48 = v69;
    sub_24C980200();
    v59(v3, v34);
    v58(v47, v81);
    v57(v27, v46);
    uint64_t result = v78(v48, 1, v44);
    if (result != 1)
    {
      unint64_t v49 = v54;
      ((void (*)(char *, char *, uint64_t))v72)(v54, v48, v44);
      sub_24C958FBC(&qword_2697FE930, MEMORY[0x263F07490]);
      v50 = v75;
      char v51 = sub_24C980780();
      uint64_t v52 = v49;
      uint64_t v53 = v76;
      ((void (*)(char *, uint64_t))v76)(v52, v44);
      ((void (*)(char *, uint64_t))v53)(v50, v44);
      return (v51 & 1) == 0;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for CustomDate()
{
  return &type metadata for CustomDate;
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

uint64_t sub_24C958FBC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t SiriPenetrationRateSELFReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v4 = sub_24C980140();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SiriPenetrationRateSELFReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  uint64_t v6 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  uint64_t v7 = v4 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v8 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  return v4;
}

uint64_t SiriPenetrationRateSELFReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  uint64_t v6 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  uint64_t v7 = v2 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v8 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  return v2;
}

uint64_t sub_24C95920C(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_24C959230, 0, 0);
}

void sub_24C959230()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  uint64_t v6 = v0[2] + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v5)
  {
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_20:
    uint64_t v14 = *(void *)(v1 + 48) + 16 * v10;
    double v15 = *(double *)(v14 + 8);
    uint64_t v16 = *(void *)(*(void *)(v1 + 56) + 8 * v10);
    LODWORD(v19[0]) = *(_DWORD *)v14;
    v19[1] = v15;
    swift_bridgeObjectRetain();
    uint64_t v17 = _s11DeepThought20SELFMessageConverterO27convertToODMSiriClientEvent19aggregationInterval6counts5odmId6loggerSo0g6SchemaghI0CSgAA011AggregationK0V_SayAA14CountsReportedVG10Foundation4UUIDV2os6LoggerVtFZ_0(v19, v16, v6);
    swift_bridgeObjectRelease();
    if (v17)
    {
      sub_24C959420(v17);
    }
  }
  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  if (v11 >= v7) {
    goto LABEL_22;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v11);
  ++v8;
  if (v12) {
    goto LABEL_19;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v7) {
    goto LABEL_22;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12) {
    goto LABEL_19;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v7) {
    goto LABEL_22;
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12)
  {
LABEL_19:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_20;
  }
  int64_t v13 = v11 + 3;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v2 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_26;
        }
        if (v8 >= v7) {
          goto LABEL_22;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_19;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_19;
  }
LABEL_22:
  swift_release();
  uint64_t v18 = (void (*)(void))v0[1];
  v18();
}

uint64_t sub_24C959420(void *a1)
{
  uint64_t v2 = sub_24C980140();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v8 = (char *)&v28 - v7;
  id v9 = objc_msgSend(self, sel_sharedAnalytics);
  id v10 = objc_msgSend(v9, sel_defaultMessageStream);

  sub_24C980130();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  id v11 = a1;
  unint64_t v12 = sub_24C980700();
  os_log_type_t v13 = sub_24C980920();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v33 = v2;
    uint64_t v15 = v14;
    uint64_t v30 = (void *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v35 = v31;
    *(_DWORD *)uint64_t v15 = 136315394;
    os_log_t v29 = v12;
    uint64_t v16 = sub_24C980110();
    uint64_t v34 = sub_24C95F060(v16, v17, &v35);
    id v32 = v10;
    sub_24C980950();
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
    v18(v6, v33);
    uint64_t v19 = (uint64_t (*)(char *, uint64_t))v18;
    *(_WORD *)(v15 + 12) = 2112;
    uint64_t v34 = (uint64_t)v11;
    id v20 = v11;
    id v10 = v32;
    sub_24C980950();
    uint64_t v21 = v30;
    *uint64_t v30 = v11;

    os_log_t v22 = v29;
    _os_log_impl(&dword_24C953000, v29, v13, "SELF reporter: reported task with stats, isolatedStreamUUID = %s, message = %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE978);
    swift_arrayDestroy();
    MEMORY[0x253303270](v21, -1, -1);
    uint64_t v23 = v31;
    swift_arrayDestroy();
    MEMORY[0x253303270](v23, -1, -1);
    uint64_t v24 = v15;
    uint64_t v2 = v33;
    MEMORY[0x253303270](v24, -1, -1);
  }
  else
  {

    int v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v6, v2);
    uint64_t v19 = (uint64_t (*)(char *, uint64_t))v25;
  }
  uint64_t v26 = (void *)sub_24C980120();
  objc_msgSend(v10, sel_emitMessage_isolatedStreamUUID_, v11, v26);

  return v19(v8, v2);
}

uint64_t sub_24C959798()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  uint64_t v4 = sub_24C980720();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t SiriPenetrationRateSELFReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateSELFReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_24C9599D8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_24C980820();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x270F9D8F0](a1, a2, a3, a4);
}

uint64_t sub_24C959A74(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v6 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6) {
    return 1;
  }
  else {
    return sub_24C980B70() & 1;
  }
}

id _s11DeepThought20SELFMessageConverterO30convertLocaleStringToISOLocale6localeSo08SISchemaI0CSgSSSg_tFZ_0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (a2)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24C9599D8(6, a1, (unint64_t)v2, v4);
    unint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    LOBYTE(v5) = sub_24C959A74(v5, v7, v9, v11, 0x454C41434F4CLL, 0xE600000000000000);
    swift_bridgeObjectRelease();
    if (v5)
    {
      uint64_t v22 = a1;
      id v23 = v2;
      sub_24C95D430();
      unint64_t v12 = (void *)sub_24C980970();
      if (v12[2] == 3)
      {
        swift_bridgeObjectRetain();
        os_log_type_t v13 = (void *)sub_24C9807A0();
        swift_bridgeObjectRelease();
        id v14 = v13;
        if (objc_msgSend(v14, "isEqualToString:", @"ISOLANGUAGECODE_UNKNOWN", 95, 0xE100000000000000, v22, v23))
        {
          uint64_t v15 = 0;
        }
        else if ([v14 isEqualToString:@"AB"])
        {
          uint64_t v15 = 1;
        }
        else if ([v14 isEqualToString:@"AA"])
        {
          uint64_t v15 = 2;
        }
        else if ([v14 isEqualToString:@"AF"])
        {
          uint64_t v15 = 3;
        }
        else if ([v14 isEqualToString:@"AK"])
        {
          uint64_t v15 = 4;
        }
        else if ([v14 isEqualToString:@"SQ"])
        {
          uint64_t v15 = 5;
        }
        else if ([v14 isEqualToString:@"AM"])
        {
          uint64_t v15 = 6;
        }
        else if ([v14 isEqualToString:@"AR"])
        {
          uint64_t v15 = 7;
        }
        else if ([v14 isEqualToString:@"AN"])
        {
          uint64_t v15 = 8;
        }
        else if ([v14 isEqualToString:@"HY"])
        {
          uint64_t v15 = 9;
        }
        else if ([v14 isEqualToString:@"AS"])
        {
          uint64_t v15 = 10;
        }
        else if ([v14 isEqualToString:@"AV"])
        {
          uint64_t v15 = 11;
        }
        else if ([v14 isEqualToString:@"AE"])
        {
          uint64_t v15 = 12;
        }
        else if ([v14 isEqualToString:@"AY"])
        {
          uint64_t v15 = 13;
        }
        else if ([v14 isEqualToString:@"AZ"])
        {
          uint64_t v15 = 14;
        }
        else if ([v14 isEqualToString:@"BM"])
        {
          uint64_t v15 = 15;
        }
        else if ([v14 isEqualToString:@"BA"])
        {
          uint64_t v15 = 16;
        }
        else if ([v14 isEqualToString:@"EU"])
        {
          uint64_t v15 = 17;
        }
        else if ([v14 isEqualToString:@"BE"])
        {
          uint64_t v15 = 18;
        }
        else if ([v14 isEqualToString:@"BN"])
        {
          uint64_t v15 = 19;
        }
        else if ([v14 isEqualToString:@"BI"])
        {
          uint64_t v15 = 20;
        }
        else if ([v14 isEqualToString:@"BS"])
        {
          uint64_t v15 = 21;
        }
        else if ([v14 isEqualToString:@"BR"])
        {
          uint64_t v15 = 22;
        }
        else if ([v14 isEqualToString:@"BG"])
        {
          uint64_t v15 = 23;
        }
        else if ([v14 isEqualToString:@"MY"])
        {
          uint64_t v15 = 24;
        }
        else if ([v14 isEqualToString:@"CA"])
        {
          uint64_t v15 = 25;
        }
        else if ([v14 isEqualToString:@"CH"])
        {
          uint64_t v15 = 26;
        }
        else if ([v14 isEqualToString:@"CE"])
        {
          uint64_t v15 = 27;
        }
        else if ([v14 isEqualToString:@"NY"])
        {
          uint64_t v15 = 28;
        }
        else if ([v14 isEqualToString:@"ZH"])
        {
          uint64_t v15 = 29;
        }
        else if ([v14 isEqualToString:@"CV"])
        {
          uint64_t v15 = 30;
        }
        else if ([v14 isEqualToString:@"KW"])
        {
          uint64_t v15 = 31;
        }
        else if ([v14 isEqualToString:@"CO"])
        {
          uint64_t v15 = 32;
        }
        else if ([v14 isEqualToString:@"CR"])
        {
          uint64_t v15 = 33;
        }
        else if ([v14 isEqualToString:@"HR"])
        {
          uint64_t v15 = 34;
        }
        else if ([v14 isEqualToString:@"CS"])
        {
          uint64_t v15 = 35;
        }
        else if ([v14 isEqualToString:@"DA"])
        {
          uint64_t v15 = 36;
        }
        else if ([v14 isEqualToString:@"DV"])
        {
          uint64_t v15 = 37;
        }
        else if ([v14 isEqualToString:@"NL"])
        {
          uint64_t v15 = 38;
        }
        else if ([v14 isEqualToString:@"DZ"])
        {
          uint64_t v15 = 39;
        }
        else if ([v14 isEqualToString:@"EN"])
        {
          uint64_t v15 = 40;
        }
        else if ([v14 isEqualToString:@"EO"])
        {
          uint64_t v15 = 41;
        }
        else if ([v14 isEqualToString:@"ET"])
        {
          uint64_t v15 = 42;
        }
        else if ([v14 isEqualToString:@"EE"])
        {
          uint64_t v15 = 43;
        }
        else if ([v14 isEqualToString:@"FO"])
        {
          uint64_t v15 = 44;
        }
        else if ([v14 isEqualToString:@"FJ"])
        {
          uint64_t v15 = 45;
        }
        else if ([v14 isEqualToString:@"FI"])
        {
          uint64_t v15 = 46;
        }
        else if ([v14 isEqualToString:@"FR"])
        {
          uint64_t v15 = 47;
        }
        else if ([v14 isEqualToString:@"FF"])
        {
          uint64_t v15 = 48;
        }
        else if ([v14 isEqualToString:@"GL"])
        {
          uint64_t v15 = 49;
        }
        else if ([v14 isEqualToString:@"KA"])
        {
          uint64_t v15 = 50;
        }
        else if ([v14 isEqualToString:@"DE"])
        {
          uint64_t v15 = 51;
        }
        else if ([v14 isEqualToString:@"EL"])
        {
          uint64_t v15 = 52;
        }
        else if ([v14 isEqualToString:@"GN"])
        {
          uint64_t v15 = 53;
        }
        else if ([v14 isEqualToString:@"GU"])
        {
          uint64_t v15 = 54;
        }
        else if ([v14 isEqualToString:@"HT"])
        {
          uint64_t v15 = 55;
        }
        else if ([v14 isEqualToString:@"HA"])
        {
          uint64_t v15 = 56;
        }
        else if ([v14 isEqualToString:@"HE"])
        {
          uint64_t v15 = 57;
        }
        else if ([v14 isEqualToString:@"HZ"])
        {
          uint64_t v15 = 58;
        }
        else if ([v14 isEqualToString:@"HI"])
        {
          uint64_t v15 = 59;
        }
        else if ([v14 isEqualToString:@"HO"])
        {
          uint64_t v15 = 60;
        }
        else if ([v14 isEqualToString:@"HU"])
        {
          uint64_t v15 = 61;
        }
        else if ([v14 isEqualToString:@"IA"])
        {
          uint64_t v15 = 62;
        }
        else if ([v14 isEqualToString:@"ID"])
        {
          uint64_t v15 = 63;
        }
        else if ([v14 isEqualToString:@"IE"])
        {
          uint64_t v15 = 64;
        }
        else if ([v14 isEqualToString:@"GA"])
        {
          uint64_t v15 = 65;
        }
        else if ([v14 isEqualToString:@"IG"])
        {
          uint64_t v15 = 66;
        }
        else if ([v14 isEqualToString:@"IK"])
        {
          uint64_t v15 = 67;
        }
        else if ([v14 isEqualToString:@"IO"])
        {
          uint64_t v15 = 68;
        }
        else if ([v14 isEqualToString:@"IS"])
        {
          uint64_t v15 = 69;
        }
        else if ([v14 isEqualToString:@"IT"])
        {
          uint64_t v15 = 70;
        }
        else if ([v14 isEqualToString:@"IU"])
        {
          uint64_t v15 = 71;
        }
        else if ([v14 isEqualToString:@"JA"])
        {
          uint64_t v15 = 72;
        }
        else if ([v14 isEqualToString:@"JV"])
        {
          uint64_t v15 = 73;
        }
        else if ([v14 isEqualToString:@"KL"])
        {
          uint64_t v15 = 74;
        }
        else if ([v14 isEqualToString:@"KN"])
        {
          uint64_t v15 = 75;
        }
        else if ([v14 isEqualToString:@"KR"])
        {
          uint64_t v15 = 76;
        }
        else if ([v14 isEqualToString:@"KS"])
        {
          uint64_t v15 = 77;
        }
        else if ([v14 isEqualToString:@"KK"])
        {
          uint64_t v15 = 78;
        }
        else if ([v14 isEqualToString:@"KM"])
        {
          uint64_t v15 = 79;
        }
        else if ([v14 isEqualToString:@"KI"])
        {
          uint64_t v15 = 80;
        }
        else if ([v14 isEqualToString:@"RW"])
        {
          uint64_t v15 = 81;
        }
        else if ([v14 isEqualToString:@"KY"])
        {
          uint64_t v15 = 82;
        }
        else if ([v14 isEqualToString:@"KV"])
        {
          uint64_t v15 = 83;
        }
        else if ([v14 isEqualToString:@"KG"])
        {
          uint64_t v15 = 84;
        }
        else if ([v14 isEqualToString:@"KO"])
        {
          uint64_t v15 = 85;
        }
        else if ([v14 isEqualToString:@"KU"])
        {
          uint64_t v15 = 86;
        }
        else if ([v14 isEqualToString:@"KJ"])
        {
          uint64_t v15 = 87;
        }
        else if ([v14 isEqualToString:@"LA"])
        {
          uint64_t v15 = 88;
        }
        else if ([v14 isEqualToString:@"LB"])
        {
          uint64_t v15 = 89;
        }
        else if ([v14 isEqualToString:@"LG"])
        {
          uint64_t v15 = 90;
        }
        else if ([v14 isEqualToString:@"LI"])
        {
          uint64_t v15 = 91;
        }
        else if ([v14 isEqualToString:@"LN"])
        {
          uint64_t v15 = 92;
        }
        else if ([v14 isEqualToString:@"LO"])
        {
          uint64_t v15 = 93;
        }
        else if ([v14 isEqualToString:@"LT"])
        {
          uint64_t v15 = 94;
        }
        else if ([v14 isEqualToString:@"LU"])
        {
          uint64_t v15 = 95;
        }
        else if ([v14 isEqualToString:@"LV"])
        {
          uint64_t v15 = 96;
        }
        else if ([v14 isEqualToString:@"GV"])
        {
          uint64_t v15 = 97;
        }
        else if ([v14 isEqualToString:@"MK"])
        {
          uint64_t v15 = 98;
        }
        else if ([v14 isEqualToString:@"MG"])
        {
          uint64_t v15 = 99;
        }
        else if ([v14 isEqualToString:@"MS"])
        {
          uint64_t v15 = 100;
        }
        else if ([v14 isEqualToString:@"ML"])
        {
          uint64_t v15 = 101;
        }
        else if ([v14 isEqualToString:@"MT"])
        {
          uint64_t v15 = 102;
        }
        else if ([v14 isEqualToString:@"MI"])
        {
          uint64_t v15 = 103;
        }
        else if ([v14 isEqualToString:@"MR"])
        {
          uint64_t v15 = 104;
        }
        else if ([v14 isEqualToString:@"MH"])
        {
          uint64_t v15 = 105;
        }
        else if ([v14 isEqualToString:@"MN"])
        {
          uint64_t v15 = 106;
        }
        else if ([v14 isEqualToString:@"NA"])
        {
          uint64_t v15 = 107;
        }
        else if ([v14 isEqualToString:@"NV"])
        {
          uint64_t v15 = 108;
        }
        else if ([v14 isEqualToString:@"ND"])
        {
          uint64_t v15 = 109;
        }
        else if ([v14 isEqualToString:@"NE"])
        {
          uint64_t v15 = 110;
        }
        else if ([v14 isEqualToString:@"NG"])
        {
          uint64_t v15 = 111;
        }
        else if ([v14 isEqualToString:@"NB"])
        {
          uint64_t v15 = 112;
        }
        else if ([v14 isEqualToString:@"NN"])
        {
          uint64_t v15 = 113;
        }
        else if ([v14 isEqualToString:@"NO"])
        {
          uint64_t v15 = 114;
        }
        else if ([v14 isEqualToString:@"II"])
        {
          uint64_t v15 = 115;
        }
        else if ([v14 isEqualToString:@"NR"])
        {
          uint64_t v15 = 116;
        }
        else if ([v14 isEqualToString:@"OC"])
        {
          uint64_t v15 = 117;
        }
        else if ([v14 isEqualToString:@"OJ"])
        {
          uint64_t v15 = 118;
        }
        else if ([v14 isEqualToString:@"CU"])
        {
          uint64_t v15 = 119;
        }
        else if ([v14 isEqualToString:@"OM"])
        {
          uint64_t v15 = 120;
        }
        else if ([v14 isEqualToString:@"OR"])
        {
          uint64_t v15 = 121;
        }
        else if ([v14 isEqualToString:@"OS"])
        {
          uint64_t v15 = 122;
        }
        else if ([v14 isEqualToString:@"PA"])
        {
          uint64_t v15 = 123;
        }
        else if ([v14 isEqualToString:@"PI"])
        {
          uint64_t v15 = 124;
        }
        else if ([v14 isEqualToString:@"FA"])
        {
          uint64_t v15 = 125;
        }
        else if ([v14 isEqualToString:@"PL"])
        {
          uint64_t v15 = 126;
        }
        else if ([v14 isEqualToString:@"PS"])
        {
          uint64_t v15 = 127;
        }
        else if ([v14 isEqualToString:@"PT"])
        {
          uint64_t v15 = 128;
        }
        else if ([v14 isEqualToString:@"QU"])
        {
          uint64_t v15 = 129;
        }
        else if ([v14 isEqualToString:@"RM"])
        {
          uint64_t v15 = 130;
        }
        else if ([v14 isEqualToString:@"RN"])
        {
          uint64_t v15 = 131;
        }
        else if ([v14 isEqualToString:@"RO"])
        {
          uint64_t v15 = 132;
        }
        else if ([v14 isEqualToString:@"RU"])
        {
          uint64_t v15 = 133;
        }
        else if ([v14 isEqualToString:@"SA"])
        {
          uint64_t v15 = 134;
        }
        else if ([v14 isEqualToString:@"SC"])
        {
          uint64_t v15 = 135;
        }
        else if ([v14 isEqualToString:@"SD"])
        {
          uint64_t v15 = 136;
        }
        else if ([v14 isEqualToString:@"SE"])
        {
          uint64_t v15 = 137;
        }
        else if ([v14 isEqualToString:@"SM"])
        {
          uint64_t v15 = 138;
        }
        else if ([v14 isEqualToString:@"SG"])
        {
          uint64_t v15 = 139;
        }
        else if ([v14 isEqualToString:@"SR"])
        {
          uint64_t v15 = 140;
        }
        else if ([v14 isEqualToString:@"GD"])
        {
          uint64_t v15 = 141;
        }
        else if ([v14 isEqualToString:@"SN"])
        {
          uint64_t v15 = 142;
        }
        else if ([v14 isEqualToString:@"SI"])
        {
          uint64_t v15 = 143;
        }
        else if ([v14 isEqualToString:@"SK"])
        {
          uint64_t v15 = 144;
        }
        else if ([v14 isEqualToString:@"SL"])
        {
          uint64_t v15 = 145;
        }
        else if ([v14 isEqualToString:@"SO"])
        {
          uint64_t v15 = 146;
        }
        else if ([v14 isEqualToString:@"ST"])
        {
          uint64_t v15 = 147;
        }
        else if ([v14 isEqualToString:@"ES"])
        {
          uint64_t v15 = 148;
        }
        else if ([v14 isEqualToString:@"SU"])
        {
          uint64_t v15 = 149;
        }
        else if ([v14 isEqualToString:@"SW"])
        {
          uint64_t v15 = 150;
        }
        else if ([v14 isEqualToString:@"SS"])
        {
          uint64_t v15 = 151;
        }
        else if ([v14 isEqualToString:@"SV"])
        {
          uint64_t v15 = 152;
        }
        else if ([v14 isEqualToString:@"TA"])
        {
          uint64_t v15 = 153;
        }
        else if ([v14 isEqualToString:@"TE"])
        {
          uint64_t v15 = 154;
        }
        else if ([v14 isEqualToString:@"TG"])
        {
          uint64_t v15 = 155;
        }
        else if ([v14 isEqualToString:@"TH"])
        {
          uint64_t v15 = 156;
        }
        else if ([v14 isEqualToString:@"TI"])
        {
          uint64_t v15 = 157;
        }
        else if ([v14 isEqualToString:@"BO"])
        {
          uint64_t v15 = 158;
        }
        else if ([v14 isEqualToString:@"TK"])
        {
          uint64_t v15 = 159;
        }
        else if ([v14 isEqualToString:@"TL"])
        {
          uint64_t v15 = 160;
        }
        else if ([v14 isEqualToString:@"TN"])
        {
          uint64_t v15 = 161;
        }
        else if ([v14 isEqualToString:@"TO"])
        {
          uint64_t v15 = 162;
        }
        else if ([v14 isEqualToString:@"TR"])
        {
          uint64_t v15 = 163;
        }
        else if ([v14 isEqualToString:@"TS"])
        {
          uint64_t v15 = 164;
        }
        else if ([v14 isEqualToString:@"TT"])
        {
          uint64_t v15 = 165;
        }
        else if ([v14 isEqualToString:@"TW"])
        {
          uint64_t v15 = 166;
        }
        else if ([v14 isEqualToString:@"TY"])
        {
          uint64_t v15 = 167;
        }
        else if ([v14 isEqualToString:@"UG"])
        {
          uint64_t v15 = 168;
        }
        else if ([v14 isEqualToString:@"UK"])
        {
          uint64_t v15 = 169;
        }
        else if ([v14 isEqualToString:@"UR"])
        {
          uint64_t v15 = 170;
        }
        else if ([v14 isEqualToString:@"UZ"])
        {
          uint64_t v15 = 171;
        }
        else if ([v14 isEqualToString:@"VE"])
        {
          uint64_t v15 = 172;
        }
        else if ([v14 isEqualToString:@"VI"])
        {
          uint64_t v15 = 173;
        }
        else if ([v14 isEqualToString:@"VO"])
        {
          uint64_t v15 = 174;
        }
        else if ([v14 isEqualToString:@"WA"])
        {
          uint64_t v15 = 175;
        }
        else if ([v14 isEqualToString:@"CY"])
        {
          uint64_t v15 = 176;
        }
        else if ([v14 isEqualToString:@"WO"])
        {
          uint64_t v15 = 177;
        }
        else if ([v14 isEqualToString:@"FY"])
        {
          uint64_t v15 = 178;
        }
        else if ([v14 isEqualToString:@"XH"])
        {
          uint64_t v15 = 179;
        }
        else if ([v14 isEqualToString:@"YI"])
        {
          uint64_t v15 = 180;
        }
        else if ([v14 isEqualToString:@"YO"])
        {
          uint64_t v15 = 181;
        }
        else if ([v14 isEqualToString:@"ZA"])
        {
          uint64_t v15 = 182;
        }
        else if ([v14 isEqualToString:@"ZU"])
        {
          uint64_t v15 = 183;
        }
        else if ([v14 isEqualToString:@"WUU"])
        {
          uint64_t v15 = 184;
        }
        else if ([v14 isEqualToString:@"YUE"])
        {
          uint64_t v15 = 185;
        }
        else
        {
          uint64_t v15 = 0;
        }

        uint64_t v17 = self;
        if (v12[2] >= 3uLL)
        {
          uint64_t v18 = (void *)v17;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v19 = (void *)sub_24C9807A0();
          swift_bridgeObjectRelease();
          id v2 = objc_msgSend(v18, sel_convertCountryCodeToSchemaCountryCode_, v19);

          goto LABEL_758;
        }
        __break(1u);
        goto LABEL_754;
      }
      swift_bridgeObjectRelease();
    }
    else if (sub_24C980810() == 2)
    {
      sub_24C9807F0();
      uint64_t v16 = (void *)sub_24C9807A0();
      swift_bridgeObjectRelease();
      unint64_t v12 = v16;
      if ([v12 isEqualToString:@"ISOLANGUAGECODE_UNKNOWN"])
      {
        uint64_t v15 = 0;
      }
      else if ([v12 isEqualToString:@"AB"])
      {
        uint64_t v15 = 1;
      }
      else if ([v12 isEqualToString:@"AA"])
      {
        uint64_t v15 = 2;
      }
      else if ([v12 isEqualToString:@"AF"])
      {
        uint64_t v15 = 3;
      }
      else if ([v12 isEqualToString:@"AK"])
      {
        uint64_t v15 = 4;
      }
      else if ([v12 isEqualToString:@"SQ"])
      {
        uint64_t v15 = 5;
      }
      else if ([v12 isEqualToString:@"AM"])
      {
        uint64_t v15 = 6;
      }
      else if ([v12 isEqualToString:@"AR"])
      {
        uint64_t v15 = 7;
      }
      else if ([v12 isEqualToString:@"AN"])
      {
        uint64_t v15 = 8;
      }
      else if ([v12 isEqualToString:@"HY"])
      {
        uint64_t v15 = 9;
      }
      else if ([v12 isEqualToString:@"AS"])
      {
        uint64_t v15 = 10;
      }
      else if ([v12 isEqualToString:@"AV"])
      {
        uint64_t v15 = 11;
      }
      else if ([v12 isEqualToString:@"AE"])
      {
        uint64_t v15 = 12;
      }
      else if ([v12 isEqualToString:@"AY"])
      {
        uint64_t v15 = 13;
      }
      else if ([v12 isEqualToString:@"AZ"])
      {
        uint64_t v15 = 14;
      }
      else if ([v12 isEqualToString:@"BM"])
      {
        uint64_t v15 = 15;
      }
      else if ([v12 isEqualToString:@"BA"])
      {
        uint64_t v15 = 16;
      }
      else if ([v12 isEqualToString:@"EU"])
      {
        uint64_t v15 = 17;
      }
      else if ([v12 isEqualToString:@"BE"])
      {
        uint64_t v15 = 18;
      }
      else if ([v12 isEqualToString:@"BN"])
      {
        uint64_t v15 = 19;
      }
      else if ([v12 isEqualToString:@"BI"])
      {
        uint64_t v15 = 20;
      }
      else if ([v12 isEqualToString:@"BS"])
      {
        uint64_t v15 = 21;
      }
      else if ([v12 isEqualToString:@"BR"])
      {
        uint64_t v15 = 22;
      }
      else if ([v12 isEqualToString:@"BG"])
      {
        uint64_t v15 = 23;
      }
      else if ([v12 isEqualToString:@"MY"])
      {
        uint64_t v15 = 24;
      }
      else if ([v12 isEqualToString:@"CA"])
      {
        uint64_t v15 = 25;
      }
      else if ([v12 isEqualToString:@"CH"])
      {
        uint64_t v15 = 26;
      }
      else if ([v12 isEqualToString:@"CE"])
      {
        uint64_t v15 = 27;
      }
      else if ([v12 isEqualToString:@"NY"])
      {
        uint64_t v15 = 28;
      }
      else if ([v12 isEqualToString:@"ZH"])
      {
        uint64_t v15 = 29;
      }
      else if ([v12 isEqualToString:@"CV"])
      {
        uint64_t v15 = 30;
      }
      else if ([v12 isEqualToString:@"KW"])
      {
        uint64_t v15 = 31;
      }
      else if ([v12 isEqualToString:@"CO"])
      {
        uint64_t v15 = 32;
      }
      else if ([v12 isEqualToString:@"CR"])
      {
        uint64_t v15 = 33;
      }
      else if ([v12 isEqualToString:@"HR"])
      {
        uint64_t v15 = 34;
      }
      else if ([v12 isEqualToString:@"CS"])
      {
        uint64_t v15 = 35;
      }
      else if ([v12 isEqualToString:@"DA"])
      {
        uint64_t v15 = 36;
      }
      else if ([v12 isEqualToString:@"DV"])
      {
        uint64_t v15 = 37;
      }
      else if ([v12 isEqualToString:@"NL"])
      {
        uint64_t v15 = 38;
      }
      else if ([v12 isEqualToString:@"DZ"])
      {
        uint64_t v15 = 39;
      }
      else if ([v12 isEqualToString:@"EN"])
      {
        uint64_t v15 = 40;
      }
      else if ([v12 isEqualToString:@"EO"])
      {
        uint64_t v15 = 41;
      }
      else if ([v12 isEqualToString:@"ET"])
      {
        uint64_t v15 = 42;
      }
      else if ([v12 isEqualToString:@"EE"])
      {
        uint64_t v15 = 43;
      }
      else if ([v12 isEqualToString:@"FO"])
      {
        uint64_t v15 = 44;
      }
      else if ([v12 isEqualToString:@"FJ"])
      {
        uint64_t v15 = 45;
      }
      else if ([v12 isEqualToString:@"FI"])
      {
        uint64_t v15 = 46;
      }
      else if ([v12 isEqualToString:@"FR"])
      {
        uint64_t v15 = 47;
      }
      else if ([v12 isEqualToString:@"FF"])
      {
        uint64_t v15 = 48;
      }
      else if ([v12 isEqualToString:@"GL"])
      {
        uint64_t v15 = 49;
      }
      else if ([v12 isEqualToString:@"KA"])
      {
        uint64_t v15 = 50;
      }
      else if ([v12 isEqualToString:@"DE"])
      {
        uint64_t v15 = 51;
      }
      else if ([v12 isEqualToString:@"EL"])
      {
        uint64_t v15 = 52;
      }
      else if ([v12 isEqualToString:@"GN"])
      {
        uint64_t v15 = 53;
      }
      else if ([v12 isEqualToString:@"GU"])
      {
        uint64_t v15 = 54;
      }
      else if ([v12 isEqualToString:@"HT"])
      {
        uint64_t v15 = 55;
      }
      else if ([v12 isEqualToString:@"HA"])
      {
        uint64_t v15 = 56;
      }
      else if ([v12 isEqualToString:@"HE"])
      {
        uint64_t v15 = 57;
      }
      else if ([v12 isEqualToString:@"HZ"])
      {
        uint64_t v15 = 58;
      }
      else if ([v12 isEqualToString:@"HI"])
      {
        uint64_t v15 = 59;
      }
      else if ([v12 isEqualToString:@"HO"])
      {
        uint64_t v15 = 60;
      }
      else if ([v12 isEqualToString:@"HU"])
      {
        uint64_t v15 = 61;
      }
      else if ([v12 isEqualToString:@"IA"])
      {
        uint64_t v15 = 62;
      }
      else if ([v12 isEqualToString:@"ID"])
      {
        uint64_t v15 = 63;
      }
      else if ([v12 isEqualToString:@"IE"])
      {
        uint64_t v15 = 64;
      }
      else if ([v12 isEqualToString:@"GA"])
      {
        uint64_t v15 = 65;
      }
      else if ([v12 isEqualToString:@"IG"])
      {
        uint64_t v15 = 66;
      }
      else if ([v12 isEqualToString:@"IK"])
      {
        uint64_t v15 = 67;
      }
      else if ([v12 isEqualToString:@"IO"])
      {
        uint64_t v15 = 68;
      }
      else if ([v12 isEqualToString:@"IS"])
      {
        uint64_t v15 = 69;
      }
      else if ([v12 isEqualToString:@"IT"])
      {
        uint64_t v15 = 70;
      }
      else if ([v12 isEqualToString:@"IU"])
      {
        uint64_t v15 = 71;
      }
      else if ([v12 isEqualToString:@"JA"])
      {
        uint64_t v15 = 72;
      }
      else if ([v12 isEqualToString:@"JV"])
      {
        uint64_t v15 = 73;
      }
      else if ([v12 isEqualToString:@"KL"])
      {
        uint64_t v15 = 74;
      }
      else if ([v12 isEqualToString:@"KN"])
      {
        uint64_t v15 = 75;
      }
      else if ([v12 isEqualToString:@"KR"])
      {
        uint64_t v15 = 76;
      }
      else if ([v12 isEqualToString:@"KS"])
      {
        uint64_t v15 = 77;
      }
      else if ([v12 isEqualToString:@"KK"])
      {
        uint64_t v15 = 78;
      }
      else if ([v12 isEqualToString:@"KM"])
      {
        uint64_t v15 = 79;
      }
      else if ([v12 isEqualToString:@"KI"])
      {
        uint64_t v15 = 80;
      }
      else if ([v12 isEqualToString:@"RW"])
      {
        uint64_t v15 = 81;
      }
      else if ([v12 isEqualToString:@"KY"])
      {
        uint64_t v15 = 82;
      }
      else if ([v12 isEqualToString:@"KV"])
      {
        uint64_t v15 = 83;
      }
      else if ([v12 isEqualToString:@"KG"])
      {
        uint64_t v15 = 84;
      }
      else if ([v12 isEqualToString:@"KO"])
      {
        uint64_t v15 = 85;
      }
      else if ([v12 isEqualToString:@"KU"])
      {
        uint64_t v15 = 86;
      }
      else if ([v12 isEqualToString:@"KJ"])
      {
        uint64_t v15 = 87;
      }
      else if ([v12 isEqualToString:@"LA"])
      {
        uint64_t v15 = 88;
      }
      else if ([v12 isEqualToString:@"LB"])
      {
        uint64_t v15 = 89;
      }
      else if ([v12 isEqualToString:@"LG"])
      {
        uint64_t v15 = 90;
      }
      else if ([v12 isEqualToString:@"LI"])
      {
        uint64_t v15 = 91;
      }
      else if ([v12 isEqualToString:@"LN"])
      {
        uint64_t v15 = 92;
      }
      else if ([v12 isEqualToString:@"LO"])
      {
        uint64_t v15 = 93;
      }
      else if ([v12 isEqualToString:@"LT"])
      {
        uint64_t v15 = 94;
      }
      else if ([v12 isEqualToString:@"LU"])
      {
        uint64_t v15 = 95;
      }
      else if ([v12 isEqualToString:@"LV"])
      {
        uint64_t v15 = 96;
      }
      else if ([v12 isEqualToString:@"GV"])
      {
        uint64_t v15 = 97;
      }
      else if ([v12 isEqualToString:@"MK"])
      {
        uint64_t v15 = 98;
      }
      else if ([v12 isEqualToString:@"MG"])
      {
        uint64_t v15 = 99;
      }
      else if ([v12 isEqualToString:@"MS"])
      {
        uint64_t v15 = 100;
      }
      else if ([v12 isEqualToString:@"ML"])
      {
        uint64_t v15 = 101;
      }
      else if ([v12 isEqualToString:@"MT"])
      {
        uint64_t v15 = 102;
      }
      else if ([v12 isEqualToString:@"MI"])
      {
        uint64_t v15 = 103;
      }
      else if ([v12 isEqualToString:@"MR"])
      {
        uint64_t v15 = 104;
      }
      else if ([v12 isEqualToString:@"MH"])
      {
        uint64_t v15 = 105;
      }
      else if ([v12 isEqualToString:@"MN"])
      {
        uint64_t v15 = 106;
      }
      else if ([v12 isEqualToString:@"NA"])
      {
        uint64_t v15 = 107;
      }
      else if ([v12 isEqualToString:@"NV"])
      {
        uint64_t v15 = 108;
      }
      else if ([v12 isEqualToString:@"ND"])
      {
        uint64_t v15 = 109;
      }
      else if ([v12 isEqualToString:@"NE"])
      {
        uint64_t v15 = 110;
      }
      else if ([v12 isEqualToString:@"NG"])
      {
        uint64_t v15 = 111;
      }
      else if ([v12 isEqualToString:@"NB"])
      {
        uint64_t v15 = 112;
      }
      else if ([v12 isEqualToString:@"NN"])
      {
        uint64_t v15 = 113;
      }
      else if ([v12 isEqualToString:@"NO"])
      {
        uint64_t v15 = 114;
      }
      else if ([v12 isEqualToString:@"II"])
      {
        uint64_t v15 = 115;
      }
      else if ([v12 isEqualToString:@"NR"])
      {
        uint64_t v15 = 116;
      }
      else if ([v12 isEqualToString:@"OC"])
      {
        uint64_t v15 = 117;
      }
      else if ([v12 isEqualToString:@"OJ"])
      {
        uint64_t v15 = 118;
      }
      else if ([v12 isEqualToString:@"CU"])
      {
        uint64_t v15 = 119;
      }
      else if ([v12 isEqualToString:@"OM"])
      {
        uint64_t v15 = 120;
      }
      else if ([v12 isEqualToString:@"OR"])
      {
        uint64_t v15 = 121;
      }
      else if ([v12 isEqualToString:@"OS"])
      {
        uint64_t v15 = 122;
      }
      else if ([v12 isEqualToString:@"PA"])
      {
        uint64_t v15 = 123;
      }
      else if ([v12 isEqualToString:@"PI"])
      {
        uint64_t v15 = 124;
      }
      else if ([v12 isEqualToString:@"FA"])
      {
        uint64_t v15 = 125;
      }
      else if ([v12 isEqualToString:@"PL"])
      {
        uint64_t v15 = 126;
      }
      else if ([v12 isEqualToString:@"PS"])
      {
        uint64_t v15 = 127;
      }
      else if ([v12 isEqualToString:@"PT"])
      {
        uint64_t v15 = 128;
      }
      else if ([v12 isEqualToString:@"QU"])
      {
        uint64_t v15 = 129;
      }
      else if ([v12 isEqualToString:@"RM"])
      {
        uint64_t v15 = 130;
      }
      else if ([v12 isEqualToString:@"RN"])
      {
        uint64_t v15 = 131;
      }
      else if ([v12 isEqualToString:@"RO"])
      {
        uint64_t v15 = 132;
      }
      else if ([v12 isEqualToString:@"RU"])
      {
        uint64_t v15 = 133;
      }
      else if ([v12 isEqualToString:@"SA"])
      {
        uint64_t v15 = 134;
      }
      else if ([v12 isEqualToString:@"SC"])
      {
        uint64_t v15 = 135;
      }
      else if ([v12 isEqualToString:@"SD"])
      {
        uint64_t v15 = 136;
      }
      else if ([v12 isEqualToString:@"SE"])
      {
        uint64_t v15 = 137;
      }
      else if ([v12 isEqualToString:@"SM"])
      {
        uint64_t v15 = 138;
      }
      else if ([v12 isEqualToString:@"SG"])
      {
        uint64_t v15 = 139;
      }
      else if ([v12 isEqualToString:@"SR"])
      {
        uint64_t v15 = 140;
      }
      else if ([v12 isEqualToString:@"GD"])
      {
        uint64_t v15 = 141;
      }
      else if ([v12 isEqualToString:@"SN"])
      {
        uint64_t v15 = 142;
      }
      else if ([v12 isEqualToString:@"SI"])
      {
        uint64_t v15 = 143;
      }
      else if ([v12 isEqualToString:@"SK"])
      {
        uint64_t v15 = 144;
      }
      else if ([v12 isEqualToString:@"SL"])
      {
        uint64_t v15 = 145;
      }
      else if ([v12 isEqualToString:@"SO"])
      {
        uint64_t v15 = 146;
      }
      else if ([v12 isEqualToString:@"ST"])
      {
        uint64_t v15 = 147;
      }
      else if ([v12 isEqualToString:@"ES"])
      {
        uint64_t v15 = 148;
      }
      else if ([v12 isEqualToString:@"SU"])
      {
        uint64_t v15 = 149;
      }
      else if ([v12 isEqualToString:@"SW"])
      {
        uint64_t v15 = 150;
      }
      else if ([v12 isEqualToString:@"SS"])
      {
        uint64_t v15 = 151;
      }
      else if ([v12 isEqualToString:@"SV"])
      {
        uint64_t v15 = 152;
      }
      else if ([v12 isEqualToString:@"TA"])
      {
        uint64_t v15 = 153;
      }
      else if ([v12 isEqualToString:@"TE"])
      {
        uint64_t v15 = 154;
      }
      else if ([v12 isEqualToString:@"TG"])
      {
        uint64_t v15 = 155;
      }
      else if ([v12 isEqualToString:@"TH"])
      {
        uint64_t v15 = 156;
      }
      else if ([v12 isEqualToString:@"TI"])
      {
        uint64_t v15 = 157;
      }
      else if ([v12 isEqualToString:@"BO"])
      {
        uint64_t v15 = 158;
      }
      else if ([v12 isEqualToString:@"TK"])
      {
        uint64_t v15 = 159;
      }
      else if ([v12 isEqualToString:@"TL"])
      {
        uint64_t v15 = 160;
      }
      else if ([v12 isEqualToString:@"TN"])
      {
        uint64_t v15 = 161;
      }
      else if ([v12 isEqualToString:@"TO"])
      {
        uint64_t v15 = 162;
      }
      else if ([v12 isEqualToString:@"TR"])
      {
        uint64_t v15 = 163;
      }
      else if ([v12 isEqualToString:@"TS"])
      {
        uint64_t v15 = 164;
      }
      else if ([v12 isEqualToString:@"TT"])
      {
        uint64_t v15 = 165;
      }
      else if ([v12 isEqualToString:@"TW"])
      {
        uint64_t v15 = 166;
      }
      else if ([v12 isEqualToString:@"TY"])
      {
        uint64_t v15 = 167;
      }
      else if ([v12 isEqualToString:@"UG"])
      {
        uint64_t v15 = 168;
      }
      else if ([v12 isEqualToString:@"UK"])
      {
        uint64_t v15 = 169;
      }
      else if ([v12 isEqualToString:@"UR"])
      {
        uint64_t v15 = 170;
      }
      else if ([v12 isEqualToString:@"UZ"])
      {
        uint64_t v15 = 171;
      }
      else if ([v12 isEqualToString:@"VE"])
      {
        uint64_t v15 = 172;
      }
      else if ([v12 isEqualToString:@"VI"])
      {
        uint64_t v15 = 173;
      }
      else if ([v12 isEqualToString:@"VO"])
      {
        uint64_t v15 = 174;
      }
      else if ([v12 isEqualToString:@"WA"])
      {
        uint64_t v15 = 175;
      }
      else if ([v12 isEqualToString:@"CY"])
      {
        uint64_t v15 = 176;
      }
      else if ([v12 isEqualToString:@"WO"])
      {
        uint64_t v15 = 177;
      }
      else if ([v12 isEqualToString:@"FY"])
      {
        uint64_t v15 = 178;
      }
      else if ([v12 isEqualToString:@"XH"])
      {
        uint64_t v15 = 179;
      }
      else if ([v12 isEqualToString:@"YI"])
      {
        uint64_t v15 = 180;
      }
      else if ([v12 isEqualToString:@"YO"])
      {
        uint64_t v15 = 181;
      }
      else if ([v12 isEqualToString:@"ZA"])
      {
        uint64_t v15 = 182;
      }
      else if ([v12 isEqualToString:@"ZU"])
      {
        uint64_t v15 = 183;
      }
      else
      {
        if (([v12 isEqualToString:@"WUU"] & 1) == 0)
        {
LABEL_754:
          if ([v12 isEqualToString:@"YUE"]) {
            uint64_t v15 = 185;
          }
          else {
            uint64_t v15 = 0;
          }
          goto LABEL_757;
        }
        uint64_t v15 = 184;
      }
LABEL_757:

      id v2 = 0;
      goto LABEL_758;
    }
    id v2 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_758:
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED60]), sel_init);
  objc_msgSend(v20, sel_setLanguageCode_, v15);
  objc_msgSend(v20, sel_setCountryCode_, v2);
  return v20;
}

void *sub_24C95C5C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  id v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(char *)(a1 + 64);
  unsigned int v20 = *(_DWORD *)(a1 + 68);
  unsigned int v4 = *(_DWORD *)(a1 + 80);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7B0]), sel_init);
  if (v5)
  {
    unint64_t v6 = v5;
    unsigned int v19 = v4;
    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7E0]), sel_init);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E790]), sel_init);
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = _s11DeepThought20SELFMessageConverterO30convertLocaleStringToISOLocale6localeSo08SISchemaI0CSgSSSg_tFZ_0(v1, v2);
        [v10 setSiriInputLocale:v11];

        [v10 setTaskType:dword_24C981618[v3]];
        id v12 = (id)sub_24C9807A0();
        if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_UNKNOWN"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_COMPACT"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_TV"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_BLUETOOTH_CAR"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_EYES_FREE"])
        {
          uint64_t v13 = 4;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_CARPLAY"])
        {
          uint64_t v13 = 5;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_VOX"])
        {
          uint64_t v13 = 6;
        }
        else if ([v12 isEqualToString:@"ODMSIRIUIVIEWMODE_NOT_APPLICABLE"])
        {
          uint64_t v13 = 7;
        }
        else
        {
          uint64_t v13 = 0;
        }

        [v10 setViewMode:v13];
        id v16 = (id)sub_24C9807A0();
        if ([v16 isEqualToString:@"AUDIOINPUTROUTE_UNKNOWN"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_DEVICE"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH"])
        {
          uint64_t v17 = 3;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH"])
        {
          uint64_t v17 = 4;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_APPLE_WIRED"])
        {
          uint64_t v17 = 5;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_WIRED"])
        {
          uint64_t v17 = 6;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_CARPLAY"])
        {
          uint64_t v17 = 7;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH_DO_AP_DEVICE"])
        {
          uint64_t v17 = 8;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_DO_AP_DEVICE"])
        {
          uint64_t v17 = 9;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_APPLE_BLUETOOTH_HANDS_FREE_DEVICE"])
        {
          uint64_t v17 = 10;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_THIRD_PARTY_BLUETOOTH_HANDS_FREE_DEVICE"])
        {
          uint64_t v17 = 11;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_USB_AUDIO"])
        {
          uint64_t v17 = 12;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_SIRI_ACCESSORY"])
        {
          uint64_t v17 = 13;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_AUDIO_INJECTION"])
        {
          uint64_t v17 = 14;
        }
        else if ([v16 isEqualToString:@"AUDIOINPUTROUTE_DARWIN"])
        {
          uint64_t v17 = 15;
        }
        else
        {
          uint64_t v17 = 0;
        }

        [v10 setAudioInterface:v17];
        objc_msgSend(v8, sel_setCompletedSiriTaskCount_, v20);
        objc_msgSend(v8, sel_setCompletedUITaskCount_, v19);
        objc_msgSend(v6, sel_setTaskCounts_, v8);
        objc_msgSend(v6, sel_setDimensions_, v10);

        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v8 = v6;
    }
  }
  uint64_t v10 = sub_24C980700();
  os_log_type_t v14 = sub_24C980930();
  if (os_log_type_enabled(v10, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_24C953000, v10, v14, "Unable to create ODMSiriSchemaODMSiriCounts SELF message", v15, 2u);
    MEMORY[0x253303270](v15, -1, -1);
  }
  unint64_t v6 = 0;
LABEL_59:

  return v6;
}

void *_s11DeepThought20SELFMessageConverterO27convertToODMSiriClientEvent19aggregationInterval6counts5odmId6loggerSo0g6SchemaghI0CSgAA011AggregationK0V_SayAA14CountsReportedVG10Foundation4UUIDV2os6LoggerVtFZ_0(double *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE980);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C980140();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE988);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a2 + 16);
  if (v16)
  {
    uint64_t v75 = v10;
    uint64_t v76 = v9;
    uint64_t v17 = *(unsigned int *)a1;
    double v18 = a1[1];
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A8]), sel_init);
    if (v19)
    {
      unsigned int v20 = v19;
      uint64_t v74 = a3;
      id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7D0]), sel_init);
      if (v21)
      {
        id v22 = v21;
        id v77 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7C0]), sel_init);
        if (v77)
        {
          id v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7A0]), sel_init);
          if (v73)
          {
            id v72 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6E7F8]), sel_init);
            if (v72)
            {
              id v71 = v22;
              id v23 = v73;
              objc_msgSend(v73, sel_setAggregationIntervalInDays_, v17);
              objc_msgSend(v23, sel_setAggregationIntervalStartTimestampInSecondsSince2001_, v18);
              objc_msgSend(v77, sel_setAggregationInterval_, v23);
              swift_bridgeObjectRetain();
              uint64_t v24 = 0;
              do
              {
                uint64_t v25 = *(void *)(a2 + v24 + 40);
                long long v26 = *(_OWORD *)(a2 + v24 + 48);
                long long v27 = *(_OWORD *)(a2 + v24 + 64);
                uint64_t v28 = *(void *)(a2 + v24 + 80);
                uint64_t v29 = *(void *)(a2 + v24 + 88);
                char v30 = *(unsigned char *)(a2 + v24 + 96);
                LODWORD(v78) = *(_DWORD *)(a2 + v24 + 32);
                *((void *)&v78 + 1) = v25;
                long long v79 = v26;
                long long v80 = v27;
                uint64_t v81 = v28;
                uint64_t v82 = v29;
                char v83 = v30;
                long long v84 = *(_OWORD *)(a2 + v24 + 100);
                uint64_t v31 = sub_24C95C5C4((uint64_t)&v78);
                if (v31)
                {
                  id v32 = v31;
                  objc_msgSend(v77, sel_addSiriCounts_, v31);
                }
                v24 += 88;
                --v16;
              }
              while (v16);
              swift_bridgeObjectRelease();
              sub_24C980280();
              uint64_t v37 = sub_24C9802A0();
              uint64_t v38 = *(void *)(v37 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v15, 1, v37) == 1)
              {
                sub_24C95D4E0((uint64_t)v15, &qword_2697FE988);
                uint64_t v39 = 0;
                int v40 = 0;
              }
              else
              {
                uint64_t v43 = (void *)sub_24C980290();
                (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v37);
                id v44 = objc_msgSend(v43, sel_bmltTaskId);
                sub_24C9807B0();

                uint64_t v39 = (void *)sub_24C9807A0();
                int v40 = v43;
                swift_bridgeObjectRelease();
              }
              double v45 = v71;
              id v46 = v72;
              objc_msgSend(v72, sel_setExperimentId_, v39);

              unint64_t v47 = 0x263F6E000;
              unint64_t v48 = 0x2652ED000;
              if (v40)
              {
                id v49 = objc_msgSend(v40, sel_treatmentId);
                if (v49)
                {
                  v50 = v49;
                  char v51 = v40;
                  sub_24C9807B0();

                  sub_24C980100();
                  swift_bridgeObjectRelease();
                  uint64_t v53 = v75;
                  uint64_t v52 = v76;
                  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v8, 1, v76) == 1)
                  {
                    sub_24C95D4E0((uint64_t)v8, &qword_2697FE980);
                    id v54 = 0;
                    int v40 = v51;
                    unint64_t v48 = 0x2652ED000;
                    unint64_t v47 = 0x263F6E000;
                  }
                  else
                  {
                    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v12, v8, v52);
                    id v56 = objc_allocWithZone(MEMORY[0x263F6EEE0]);
                    v57 = (void *)sub_24C980120();
                    uint64_t v58 = v56;
                    unint64_t v47 = 0x263F6E000uLL;
                    id v54 = objc_msgSend(v58, sel_initWithNSUUID_, v57);

                    (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v52);
                    int v40 = v51;
                    unint64_t v48 = 0x2652ED000uLL;
                  }
                }
                else
                {
                  id v54 = 0;
                }
                objc_msgSend(v46, sel_setTreatmentId_, v54);
                uint64_t v55 = (int)objc_msgSend(v40, sel_deploymentId);
              }
              else
              {
                objc_msgSend(v46, sel_setTreatmentId_, 0);
                id v54 = 0;
                uint64_t v55 = -1;
              }
              objc_msgSend(v46, sel_setDeploymentId_, v55);
              id v59 = objc_allocWithZone(*(Class *)(v47 + 3808));
              uint64_t v60 = (void *)sub_24C980120();
              id v61 = objc_msgSend(v59, *(SEL *)(v48 + 3536), v60);

              objc_msgSend(v45, sel_setOdmId_, v61);
              objc_msgSend(v45, sel_setTrialExperimentIdentifiers_, v46);
              id v62 = objc_msgSend(self, sel_mainBundle);
              id v63 = objc_msgSend(v62, sel_infoDictionary);

              if (v63)
              {
                uint64_t v64 = sub_24C980740();

                if (*(void *)(v64 + 16)
                  && (unint64_t v65 = sub_24C969CEC(0xD00000000000001DLL, 0x800000024C9862B0), (v66 & 1) != 0))
                {
                  sub_24C95D484(*(void *)(v64 + 56) + 32 * v65, (uint64_t)&v78);
                }
                else
                {
                  long long v78 = 0u;
                  long long v79 = 0u;
                }
                swift_bridgeObjectRelease();
                if (*((void *)&v79 + 1))
                {
                  if (swift_dynamicCast())
                  {
                    unsigned int v67 = (void *)sub_24C9807A0();
                    swift_bridgeObjectRelease();
                    id v68 = v73;
LABEL_45:
                    objc_msgSend(v45, sel_setPluginVersion_, v67);

                    objc_msgSend(v20, sel_setEventMetadata_, v45);
                    id v69 = v77;
                    objc_msgSend(v20, sel_setCountsReported_, v69);

                    return v20;
                  }
LABEL_44:
                  id v68 = v73;
                  unsigned int v67 = 0;
                  goto LABEL_45;
                }
              }
              else
              {
                long long v78 = 0u;
                long long v79 = 0u;
              }
              sub_24C95D4E0((uint64_t)&v78, &qword_2697FE990);
              goto LABEL_44;
            }

            unsigned int v20 = v22;
            id v22 = v77;
            id v41 = v73;
          }
          else
          {
            id v41 = v77;
          }

          unsigned int v20 = v22;
          id v22 = v41;
        }

        unsigned int v20 = v22;
      }
    }
    uint64_t v33 = sub_24C980700();
    os_log_type_t v34 = sub_24C980930();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      uint64_t v36 = "Unable to create ODMSiriSchemaODMSiriClientEvent SELF message";
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v33 = sub_24C980700();
    os_log_type_t v34 = sub_24C980910();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      uint64_t v36 = "no aggregations to report";
LABEL_22:
      _os_log_impl(&dword_24C953000, v33, v34, v36, v35, 2u);
      MEMORY[0x253303270](v35, -1, -1);
    }
  }

  return 0;
}

uint64_t sub_24C95D2D4()
{
  return type metadata accessor for SiriPenetrationRateSELFReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateSELFReporter()
{
  uint64_t result = qword_2697FE960;
  if (!qword_2697FE960) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C95D328()
{
  uint64_t result = sub_24C980140();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C980720();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateSELFReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateSELFReporter);
}

uint64_t dispatch thunk of SiriPenetrationRateSELFReporter.__allocating_init(_:odmId:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for SELFMessageConverter()
{
  return &type metadata for SELFMessageConverter;
}

unint64_t sub_24C95D430()
{
  unint64_t result = qword_2697FE970;
  if (!qword_2697FE970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FE970);
  }
  return result;
}

uint64_t sub_24C95D484(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C95D4E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t StreamBookmarkService.__allocating_init(bookmarkName:bookmarkFilename:bookmarkPath:logger:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a2;
  uint64_t v21 = a4;
  uint64_t v22 = a6;
  uint64_t v23 = a1;
  uint64_t v7 = sub_24C980720();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24C980090();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24C9805E0();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v26 = a5;
  v16(v14, a5, v11);
  uint64_t v17 = v22;
  uint64_t v18 = sub_24C9805D0();
  v25[3] = v15;
  v25[4] = MEMORY[0x263F396D8];
  v25[0] = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
  type metadata accessor for StreamBookmarkService();
  uint64_t v19 = swift_allocObject();
  StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(v25, v23, v24, (uint64_t)v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v17, v7);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v26, v11);
  return v19;
}

uint64_t StreamBookmarkService.__allocating_init(bookmarkStore:bookmarkName:logger:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(a1, a2, a3, a4);
  return v8;
}

uint64_t type metadata accessor for StreamBookmarkService()
{
  uint64_t result = qword_2697FE9A8;
  if (!qword_2697FE9A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_24C95DB80((uint64_t)a1, v5 + 24);
  *(void *)(v5 + 64) = a2;
  *(void *)(v5 + 72) = a3;
  uint64_t v10 = v5 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  uint64_t v11 = sub_24C980720();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v30 = a4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a4, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24C980540();
  if (v28)
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v14(a4, v11);
    __swift_destroy_boxed_opaque_existential_1(v5 + 24);
    swift_bridgeObjectRelease();
    v14(v10, v11);
    type metadata accessor for StreamBookmarkService();
    swift_deallocPartialClassInstance();
    uint64_t v15 = (uint64_t)a1;
  }
  else
  {
    uint64_t v16 = v13;
    long long v27 = a1;
    uint64_t v29 = v5;
    uint64_t v26 = v11;
    if (v13)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24C980500();
      uint64_t v16 = sub_24C9804F0();
    }
    *(void *)(v5 + 16) = v16;
    swift_retain_n();
    uint64_t v17 = sub_24C980700();
    os_log_type_t v18 = sub_24C980920();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v31 = v20;
      id v21 = objc_msgSend(*(id *)(v5 + 16), sel_debugDescription);
      uint64_t v22 = sub_24C9807B0();
      unint64_t v24 = v23;

      uint64_t v5 = v29;
      sub_24C95F060(v22, v24, &v31);
      sub_24C980950();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24C953000, v17, v18, "marker: fetched bookmark: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253303270](v20, -1, -1);
      MEMORY[0x253303270](v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v30, v26);
    }
    else
    {

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v30, v26);
    }
    uint64_t v15 = (uint64_t)v27;
  }
  __swift_destroy_boxed_opaque_existential_1(v15);
  return v5;
}

uint64_t sub_24C95DB80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

id sub_24C95DC28(char a1)
{
  uint64_t v3 = v1;
  if (a1)
  {
    sub_24C95DB80(v1 + 24, (uint64_t)v9);
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    uint64_t v4 = sub_24C980540();
    if (v2) {
      return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
    uint64_t v7 = v4;
    if (!v4)
    {
      sub_24C980500();
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_24C9804F0();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    uint64_t v8 = *(void **)(v3 + 16);
    uint64_t v6 = (id *)(v3 + 16);
    *uint64_t v6 = (id)v7;
  }
  else
  {
    uint64_t v6 = (id *)(v1 + 16);
  }
  return *v6;
}

uint64_t sub_24C95DD14()
{
  *(void *)(v1 + 96) = v0;
  return MEMORY[0x270FA2498](sub_24C95DD34, 0, 0);
}

uint64_t sub_24C95DD34()
{
  uint64_t v1 = v0[12];
  sub_24C95DB80(v1 + 24, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  id v2 = *(id *)(v1 + 16);
  sub_24C980550();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  sub_24C95DB80(v1 + 24, (uint64_t)(v0 + 7));
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[13] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C95DEB0;
  return MEMORY[0x270F257D8](0, 0, v3, v4);
}

uint64_t sub_24C95DEB0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24C95DFAC, 0, 0);
}

uint64_t sub_24C95DFAC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C95E010()
{
  id v1 = *(id *)(v0 + 16);
  char v2 = sub_24C9804E0();

  return v2 & 1;
}

uint64_t sub_24C95E060()
{
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_24C9804C0();

  return v2;
}

uint64_t sub_24C95E0B0()
{
  id v1 = *(id *)(v0 + 16);
  char v2 = sub_24C9804D0();

  return v2 & 1;
}

uint64_t sub_24C95E100(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t))
{
  return sub_24C95E1E0(a1, a2, a3, a4, MEMORY[0x263F39668], MEMORY[0x263F39678], MEMORY[0x263F396E8], "max look back set for stream=%ld,\nbookmark_date=%s, start_date=%s", "ERROR: Could not update bookmark for stream=%ld");
}

uint64_t sub_24C95E170(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t))
{
  return sub_24C95E1E0(a1, a2, a3, a4, MEMORY[0x263F39660], MEMORY[0x263F39670], MEMORY[0x263F39688], "max look back set for stream=%ld,\nbookmark_date=%s,\nstart_date=%s", "Unable to update bookmark for stream=%ld");
}

uint64_t sub_24C95E1E0(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t), void (*a5)(uint64_t), uint64_t (*a6)(uint64_t, uint64_t), uint64_t (*a7)(uint64_t), const char *a8, const char *a9)
{
  unint64_t v93 = a8;
  uint64_t v94 = a7;
  uint64_t v98 = a6;
  uint64_t v129 = a3;
  unint64_t v130 = a4;
  uint64_t v13 = sub_24C980070();
  uint64_t v112 = *(void *)(v13 - 8);
  uint64_t v113 = v13;
  MEMORY[0x270FA5388](v13);
  unint64_t v114 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24C9801E0();
  uint64_t v122 = *(void *)(v15 - 8);
  uint64_t v123 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v120 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_24C9801F0();
  uint64_t v119 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  long long v118 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_24C9801C0();
  uint64_t v117 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  uint64_t v116 = (char *)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24C980240();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v97 = (char *)&v92 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  unint64_t v115 = (char *)&v92 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v92 - v28;
  uint64_t v30 = sub_24C9800F0();
  uint64_t v127 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v96 = (char *)&v92 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  unint64_t v95 = (char *)&v92 - v34;
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  long long v126 = (char *)&v92 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v124 = (char *)&v92 - v38;
  MEMORY[0x270FA5388](v37);
  int v40 = (char *)&v92 - v39;
  uint64_t v99 = v9;
  id v41 = *(id *)(v9 + 16);
  uint64_t v101 = a1;
  a5(a1);

  uint64_t result = sub_24C9800A0();
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v125 = v40;
  unint64_t v100 = a2;
  uint64_t v43 = *(void (**)(void))(v20 + 104);
  unsigned int v105 = *MEMORY[0x263F07870];
  uint64_t v106 = v20 + 104;
  v104 = (void (*)(unint64_t, void, uint64_t))v43;
  v43(v22);
  sub_24C980210();
  uint64_t v107 = v20;
  id v44 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v108 = v19;
  v44(v22, v19);
  uint64_t v45 = v127;
  id v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v127 + 48);
  uint64_t v111 = v127 + 48;
  uint64_t v110 = v46;
  uint64_t result = v46(v29, 1, v30);
  if (result == 1)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v47 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  uint64_t v103 = v45 + 32;
  uint64_t v102 = v47;
  v47(v126, v29, v30);
  uint64_t v48 = *MEMORY[0x263F07780];
  uint64_t v109 = v30;
  v50 = v116;
  uint64_t v49 = v117;
  (*(void (**)(char *, uint64_t, uint64_t))(v117 + 104))(v116, v48, v128);
  char v51 = v118;
  uint64_t v52 = v119;
  uint64_t v53 = v121;
  (*(void (**)(char *, void, uint64_t))(v119 + 104))(v118, *MEMORY[0x263F07800], v121);
  uint64_t v55 = v122;
  uint64_t v54 = v123;
  id v56 = v120;
  (*(void (**)(char *, void, uint64_t))(v122 + 104))(v120, *MEMORY[0x263F077E0], v123);
  v57 = v115;
  sub_24C980200();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v54);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v53);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v128);
  uint64_t v58 = v109;
  uint64_t result = v110(v57, 1, v109);
  if (result == 1)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v59 = v124;
  v102(v124, v57, v58);
  uint64_t v60 = v127;
  id v61 = *(void (**)(char *, uint64_t))(v127 + 8);
  v61(v126, v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE928);
  unint64_t v62 = (*(unsigned __int8 *)(v107 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_24C981590;
  v104(v63 + v62, v105, v108);
  sub_24C9582FC(v63);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v64 = v114;
  unint64_t v65 = v125;
  sub_24C9801D0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24C980060();
  if ((v66 & 1) == 0)
  {
    uint64_t v67 = result;
    (*(void (**)(char *, uint64_t))(v112 + 8))(v64, v113);
    if (v67 < 1 || v67 <= v100)
    {
      v61(v59, v58);
      os_log_type_t v87 = v65;
    }
    else
    {
      unint64_t v130 = v61;
      id v68 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
      uint64_t v69 = (uint64_t)v97;
      v68(v97, v59, v58);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v69, 0, 1, v58);
      id v70 = *(id *)(v99 + 16);
      char v71 = v98(v101, v69);

      sub_24C95871C(v69);
      if ((v71 & 1) == 0)
      {
        uint64_t v88 = sub_24C980700();
        os_log_type_t v89 = sub_24C980930();
        BOOL v90 = os_log_type_enabled(v88, v89);
        id v61 = v130;
        if (v90)
        {
          unint64_t v91 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v91 = 134217984;
          uint64_t v132 = v94(v101);
          sub_24C980950();
          _os_log_impl(&dword_24C953000, v88, v89, a9, v91, 0xCu);
          MEMORY[0x253303270](v91, -1, -1);
        }

        v86 = v59;
        goto LABEL_16;
      }
      id v72 = v95;
      id v73 = v125;
      v68(v95, v125, v58);
      uint64_t v74 = v96;
      v68(v96, v59, v58);
      uint64_t v75 = sub_24C980700();
      os_log_type_t v76 = sub_24C980920();
      int v77 = v76;
      BOOL v78 = os_log_type_enabled(v75, v76);
      id v61 = v130;
      if (v78)
      {
        uint64_t v79 = swift_slowAlloc();
        uint64_t v129 = swift_slowAlloc();
        uint64_t v132 = v129;
        *(_DWORD *)uint64_t v79 = 134218498;
        LODWORD(v128) = v77;
        uint64_t v131 = v94(v101);
        sub_24C980950();
        *(_WORD *)(v79 + 12) = 2080;
        sub_24C957480();
        uint64_t v80 = sub_24C980B80();
        uint64_t v131 = sub_24C95F060(v80, v81, &v132);
        sub_24C980950();
        swift_bridgeObjectRelease();
        v61(v72, v58);
        *(_WORD *)(v79 + 22) = 2080;
        uint64_t v82 = v96;
        uint64_t v83 = sub_24C980B80();
        uint64_t v131 = sub_24C95F060(v83, v84, &v132);
        sub_24C980950();
        swift_bridgeObjectRelease();
        v61(v82, v58);
        _os_log_impl(&dword_24C953000, v75, (os_log_type_t)v128, v93, (uint8_t *)v79, 0x20u);
        uint64_t v85 = v129;
        swift_arrayDestroy();
        MEMORY[0x253303270](v85, -1, -1);
        MEMORY[0x253303270](v79, -1, -1);

        v86 = v124;
LABEL_16:
        v61(v86, v58);
        os_log_type_t v87 = v125;
        return ((uint64_t (*)(char *, uint64_t))v61)(v87, v58);
      }

      v61(v74, v58);
      v61(v72, v58);
      v61(v59, v58);
      os_log_type_t v87 = v73;
    }
    return ((uint64_t (*)(char *, uint64_t))v61)(v87, v58);
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t StreamBookmarkService.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t StreamBookmarkService.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought21StreamBookmarkService_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24C95EF74(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24C95EF84(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24C95EFC0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24C95EFE8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24C95F060(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24C980950();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24C95F060(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C95F134(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C95D484((uint64_t)v12, *a3);
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
      sub_24C95D484((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24C95F134(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C980960();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C95F2F0(a5, a6);
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
  uint64_t v8 = sub_24C980A20();
  if (!v8)
  {
    sub_24C980A40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C980AA0();
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

uint64_t sub_24C95F2F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C95F388(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C95F568(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C95F568(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C95F388(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C95F500(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C9809C0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C980A40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C980840();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C980AA0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C980A40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C95F500(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2697FE9C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C95F568(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2697FE9C0);
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
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

unsigned char **sub_24C95F6B8(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_24C95F6C8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_24C980AA0();
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

uint64_t sub_24C95F76C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_24C95F79C()
{
  return type metadata accessor for StreamBookmarkService();
}

uint64_t sub_24C95F7A4()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for StreamBookmarkService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StreamBookmarkService);
}

uint64_t dispatch thunk of StreamBookmarkService.__allocating_init(bookmarkStore:bookmarkName:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of StreamBookmarkService.fetchPluginBookmark(reload:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of StreamBookmarkService.storePluginBookmark()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 176) + **(int **)(*(void *)v0 + 176));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24C95F9C4;
  return v4();
}

uint64_t sub_24C95F9C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of StreamBookmarkService.updateTimeInterval(eventType:endTime:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of StreamBookmarkService.getTimeInterval(eventType:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateTimeInterval(conversationType:endTime:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateLookbackTimeInterval(eventType:numOfDays:refDate:refCalendar:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of StreamBookmarkService.updateLookbackTimeInterval(conversationType:numOfDays:refDate:refCalendar:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t BiomeDonator.__allocating_init(biomeSource:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t BiomeDonator.init(biomeSource:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

id sub_24C95FBD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_sendEvent_, a1);
}

id sub_24C95FBE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + 16), sel_sendEvent_timestamp_, a1);
}

uint64_t BiomeDonator.deinit()
{
  return v0;
}

uint64_t BiomeDonator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24C95FC54()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BiomeDonator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BiomeDonator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BiomeDonator);
}

uint64_t dispatch thunk of BiomeDonator.__allocating_init(biomeSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of BiomeDonator.donateEvent(event:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of BiomeDonator.donateEvent(event:timestamp:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void *sub_24C95FD58()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981700;
  sub_24C980450();
  *(void *)(inited + 32) = sub_24C980440();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x800000024C986AB0;
  *(void *)(inited + 80) = sub_24C9803F0();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0x736B736154646441;
  *(void *)(inited + 104) = 0xE800000000000000;
  *(void *)(inited + 128) = sub_24C980400();
  *(void *)(inited + 136) = v4;
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = 0;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FEA48 = result;
  return result;
}

uint64_t static SetReminderPenetrationEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE890);
}

void *sub_24C95FE54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981700;
  sub_24C9803C0();
  *(void *)(inited + 32) = sub_24C9803A0();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x800000024C986AB0;
  *(void *)(inited + 80) = sub_24C980390();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0xD000000000000023;
  *(void *)(inited + 104) = 0x800000024C986AD0;
  *(void *)(inited + 128) = sub_24C9803B0();
  *(void *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(void *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FEA50 = result;
  return result;
}

uint64_t static SetReminderPenetrationEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE898);
}

uint64_t sub_24C95FF54(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t SetReminderPenetrationEventFilter.deinit()
{
  return v0;
}

uint64_t SetReminderPenetrationEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

BOOL _s11DeepThought33SetReminderPenetrationEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  sub_24C980450();
  sub_24C980440();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v34 + 1);
  uint64_t v31 = v34;
  if (qword_2697FE890 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FEA48;
  uint64_t v2 = sub_24C980440();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v35 + 1))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = v32;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v30 = v7;
    if (v6) {
      uint64_t v8 = v33;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v34);
    uint64_t v30 = 0;
    uint64_t v8 = 0;
  }
  sub_24C9803F0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&v34 + 1);
  uint64_t v29 = v34;
  uint64_t v10 = off_2697FEA48;
  uint64_t v11 = sub_24C9803F0();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v35 + 1))
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v32;
    if (!v15) {
      uint64_t v16 = 0;
    }
    uint64_t v28 = v16;
    if (v15) {
      uint64_t v17 = v33;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v34);
    uint64_t v28 = 0;
    uint64_t v17 = 0;
  }
  sub_24C980400();
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v18 = v34;
  uint64_t v19 = off_2697FEA48;
  uint64_t v20 = sub_24C980400();
  if (v19[2] && (unint64_t v22 = sub_24C969CEC(v20, v21), (v23 & 1) != 0))
  {
    sub_24C95D484(v19[7] + 32 * v22, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v35 + 1))
  {
    sub_24C960840((uint64_t)&v34);
    int v24 = 2;
    if (v0) {
      goto LABEL_34;
    }
LABEL_39:
    if (!v8) {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  if (swift_dynamicCast()) {
    int v24 = v32;
  }
  else {
    int v24 = 2;
  }
  if (!v0) {
    goto LABEL_39;
  }
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v31 == v30 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  char v26 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17) {
      goto LABEL_54;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17) {
    goto LABEL_42;
  }
  if (v29 == v28 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v27 = sub_24C980B90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL result = 0;
    if ((v27 & 1) == 0) {
      return result;
    }
  }
LABEL_54:
  BOOL result = v24 == 2 && v18 == 2;
  if (v18 != 2 && v24 != 2) {
    return ((v18 & 1) == 0) ^ (v24 != 0);
  }
  return result;
}

uint64_t _s11DeepThought33SetReminderPenetrationEventFilterC06isSiriF013siriExecutionSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  sub_24C9803C0();
  sub_24C9803A0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v37 + 1);
  uint64_t v34 = v37;
  if (qword_2697FE898 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FEA50;
  uint64_t v2 = sub_24C9803A0();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = v35;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v33 = v7;
    if (v6) {
      uint64_t v8 = v36;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v33 = 0;
    uint64_t v8 = 0;
  }
  sub_24C980390();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&v37 + 1);
  uint64_t v32 = v37;
  uint64_t v10 = off_2697FEA50;
  uint64_t v11 = sub_24C980390();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v35;
    if (!v15) {
      uint64_t v16 = 0;
    }
    uint64_t v31 = v16;
    if (v15) {
      uint64_t v17 = v36;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v31 = 0;
    uint64_t v17 = 0;
  }
  sub_24C9803B0();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v30 = v37;
  char v18 = BYTE4(v37);
  uint64_t v19 = off_2697FEA50;
  uint64_t v20 = sub_24C9803B0();
  if (v19[2] && (unint64_t v22 = sub_24C969CEC(v20, v21), (v23 & 1) != 0))
  {
    sub_24C95D484(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v38 + 1))
  {
    sub_24C960840((uint64_t)&v37);
    int v25 = 0;
    uint64_t v26 = 1;
    if (v0) {
      goto LABEL_34;
    }
LABEL_39:
    if (!v8) {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  int v24 = swift_dynamicCast();
  if (v24) {
    int v25 = v35;
  }
  else {
    int v25 = 0;
  }
  uint64_t v26 = v24 ^ 1u;
  if (!v0) {
    goto LABEL_39;
  }
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  char v28 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0) {
        return (v30 == v25) & ~v26;
      }
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17) {
    goto LABEL_42;
  }
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  int v29 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0))) {
    return (v30 == v25) & ~v26;
  }
  return v29 & v26;
}

uint64_t type metadata accessor for SetReminderPenetrationEventFilter()
{
  return self;
}

uint64_t method lookup function for SetReminderPenetrationEventFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SetReminderPenetrationEventFilter);
}

uint64_t sub_24C960840(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24C9608A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB40);
  uint64_t v2 = sub_24C980A90();
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
    sub_24C963E2C(v6, (uint64_t)&v15, &qword_2697FEB48);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24C969CEC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24C963E90(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_24C9609D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB00);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB08);
  uint64_t v6 = sub_24C980A90();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24C963E2C(v12, (uint64_t)v5, &qword_2697FEB00);
    uint64_t v14 = *v5;
    unint64_t result = sub_24C969D64(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v7[6] + 8 * result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_24C9802C0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

unint64_t sub_24C960BD0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB20);
  uint64_t v2 = (void *)sub_24C980A90();
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
    uint64_t v5 = *(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v8 = v4[1];
    uint64_t v9 = v4[2];
    uint64_t v10 = v4[3];
    uint64_t v11 = v4[4];
    char v12 = *((unsigned char *)v4 + 40);
    long long v21 = *(_OWORD *)((char *)v4 + 44);
    LODWORD(v22) = *((_DWORD *)v4 - 6);
    *((void *)&v22 + 1) = v5;
    *(void *)&long long v23 = v7;
    *((void *)&v23 + 1) = v6;
    *(void *)&long long v24 = v8;
    *((void *)&v24 + 1) = v9;
    *(void *)&long long v25 = v10;
    *((void *)&v25 + 1) = v11;
    char v26 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24C969DD4((double *)&v22);
    if (v14) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v15 = v2[6] + 72 * result;
    long long v16 = v25;
    *(_OWORD *)(v15 + 32) = v24;
    *(_OWORD *)(v15 + 48) = v16;
    *(unsigned char *)(v15 + 64) = v26;
    long long v17 = v23;
    *(_OWORD *)uint64_t v15 = v22;
    *(_OWORD *)(v15 + 16) = v17;
    *(_OWORD *)(v2[7] + 16 * result) = v21;
    uint64_t v18 = v2[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v4 += 11;
    v2[2] = v20;
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

unint64_t sub_24C960D48(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB10);
  uint64_t v2 = (void *)sub_24C980A90();
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
    unint64_t result = sub_24C969CEC(v5, v6);
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

unint64_t sub_24C960E64(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB18);
  uint64_t v2 = (void *)sub_24C980A90();
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
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24C969CEC(v5, v6);
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

unint64_t static SiriPenetrationRateMetrics.DEFAULT_BOOKMARK_LOCATION.getter()
{
  return 0xD00000000000003FLL;
}

uint64_t SiriPenetrationRateMetrics.__allocating_init(bookmarkLocation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  SiriPenetrationRateMetrics.init(bookmarkLocation:)(a1, a2);
  return v4;
}

uint64_t SiriPenetrationRateMetrics.init(bookmarkLocation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v131 = sub_24C980140();
  uint64_t v137 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  uint64_t v127 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_24C980720();
  uint64_t v6 = *(void *)(v136 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v136);
  long long v126 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v129 = (char *)&v111 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v111 - v11;
  uint64_t v13 = sub_24C980090();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v128 = (char *)&v111 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  BOOL v19 = (char *)&v111 - v18;
  MEMORY[0x270FA5388](v17);
  v135 = (char *)&v111 - v20;
  uint64_t v133 = v2 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  sub_24C980130();
  uint64_t v139 = v2;
  long long v21 = (char *)(v2 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger);
  sub_24C980710();
  if (!a2)
  {
    a1 = 0xD00000000000003FLL;
    a2 = 0x800000024C986B00;
  }
  swift_bridgeObjectRetain_n();
  unint64_t v140 = v21;
  long long v22 = sub_24C980700();
  os_log_type_t v23 = sub_24C980920();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v134 = v13;
  uint64_t v141 = v6;
  uint64_t v132 = v19;
  uint64_t v138 = v14;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    v125 = v12;
    char v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    v142[0] = v27;
    *(_DWORD *)char v26 = 136315138;
    swift_bridgeObjectRetain();
    v142[7] = sub_24C95F060(a1, a2, v142);
    uint64_t v13 = v134;
    uint64_t v14 = v138;
    sub_24C980950();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24C953000, v22, v23, "marker: streams bookmark path=%s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v27;
    BOOL v19 = v132;
    uint64_t v6 = v141;
    MEMORY[0x253303270](v28, -1, -1);
    int v29 = v26;
    uint64_t v12 = v125;
    MEMORY[0x253303270](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  int v30 = v135;
  sub_24C980080();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v31(v19, v30, v13);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v33 = v136;
  v32(v12, (uint64_t)v140, v136);
  uint64_t v34 = sub_24C9805E0();
  uint64_t v35 = v134;
  v31(v128, v19, v134);
  uint64_t v36 = v32;
  uint64_t v37 = sub_24C9805D0();
  v142[3] = v34;
  v142[4] = MEMORY[0x263F396D8];
  v142[0] = v37;
  uint64_t v38 = (uint64_t)v129;
  v32(v129, (uint64_t)v12, v33);
  type metadata accessor for StreamBookmarkService();
  swift_allocObject();
  uint64_t v39 = v130;
  uint64_t v40 = StreamBookmarkService.init(bookmarkStore:bookmarkName:logger:)(v142, 0xD000000000000021, 0x800000024C986B80, v38);
  if (v39)
  {
    id v41 = *(void (**)(char *, uint64_t))(v141 + 8);
    uint64_t v42 = v136;
    v41(v12, v136);
    uint64_t v43 = *(void (**)(char *, uint64_t))(v138 + 8);
    v43(v132, v35);
    v43(v135, v35);
    (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v133, v131);
    v41(v140, v42);
    type metadata accessor for SiriPenetrationRateMetrics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v119 = 0;
    uint64_t v44 = v40;
    uint64_t v45 = v136;
    (*(void (**)(char *, uint64_t))(v141 + 8))(v12, v136);
    long long v118 = *(void (**)(char *, uint64_t))(v138 + 8);
    v138 += 8;
    v118(v132, v35);
    id v46 = objc_msgSend(objc_allocWithZone((Class)sub_24C9805F0()), sel_init);
    unint64_t v47 = v126;
    v125 = (char *)(v6 + 16);
    ((void (*)(void))v32)();
    type metadata accessor for FeaturizedBiomeDataProvider();
    uint64_t v48 = (char *)swift_allocObject();
    *((void *)v48 + 4) = v44;
    uint64_t v49 = v45;
    v50 = *(void (**)(char *, char *, uint64_t))(v141 + 32);
    v141 += 32;
    char v51 = v47;
    v50(&v48[OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger], v47, v49);
    uint64_t v132 = (char *)v50;
    uint64_t v129 = v48;
    *((void *)v48 + 2) = 13;
    *((void *)v48 + 3) = v46;
    id v52 = objc_allocWithZone((Class)sub_24C980600());
    uint64_t v53 = v44;
    swift_retain();
    id v123 = objc_msgSend(v52, sel_init);
    uint64_t v54 = v140;
    v36(v51, (uint64_t)v140, v49);
    uint64_t v55 = (char *)swift_allocObject();
    *((void *)v55 + 4) = v53;
    v50(&v55[OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger], v51, v49);
    uint64_t v128 = v55;
    *((void *)v55 + 2) = 6;
    *((void *)v55 + 3) = v123;
    id v56 = objc_allocWithZone((Class)sub_24C9805B0());
    uint64_t v57 = v53;
    swift_retain();
    id v122 = objc_msgSend(v56, sel_init);
    uint64_t v58 = v51;
    v36(v51, (uint64_t)v54, v49);
    id v59 = v36;
    uint64_t v60 = (void *)swift_allocObject();
    id v123 = v60;
    v60[4] = v57;
    ((void (*)(char *, char *, uint64_t))v132)((char *)v60 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger, v58, v49);
    v60[2] = 1;
    v60[3] = v122;
    id v122 = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA60);
    uint64_t v61 = swift_allocObject();
    long long v121 = xmmword_24C981770;
    *(_OWORD *)(v61 + 16) = xmmword_24C981770;
    id v62 = objc_allocWithZone((Class)sub_24C980520());
    uint64_t v130 = v57;
    swift_retain();
    *(void *)(v61 + 32) = objc_msgSend(v62, sel_init);
    *(void *)(v61 + 40) = objc_msgSend(objc_allocWithZone((Class)sub_24C9805C0()), sel_init);
    *(void *)(v61 + 48) = objc_msgSend(objc_allocWithZone((Class)sub_24C980510()), sel_init);
    v142[0] = v61;
    sub_24C980870();
    uint64_t v63 = v142[0];
    uint64_t v64 = v140;
    unint64_t v65 = v59;
    v59(v58, (uint64_t)v140, v49);
    type metadata accessor for FeaturizedConversationDataProvider();
    char v66 = (void *)swift_allocObject();
    v66[4] = v57;
    uint64_t v67 = v58;
    id v68 = v58;
    uint64_t v69 = v49;
    ((void (*)(char *, char *, uint64_t))v132)((char *)v66 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger, v67, v49);
    v66[2] = 0;
    v66[3] = v63;
    uint64_t v124 = (void (*)(uint64_t, uint64_t, uint64_t))v65;
    v65(v68, (uint64_t)v64, v49);
    type metadata accessor for SiriPenetrationRateDataProvider();
    uint64_t v70 = swift_allocObject();
    char v71 = v128;
    *(void *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = v129;
    *(void *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = v71;
    *(void *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = v123;
    *(void *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = v66;
    ((void (*)(uint64_t, char *, uint64_t))v132)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger, v68, v49);
    *(void *)(v70 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = v130;
    *(void *)(v139 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateDataProvider) = v70;
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = v121;
    uint64_t v73 = qword_2697FE870;
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v117 = v66;
    swift_retain();
    if (v73 != -1) {
      swift_once();
    }
    *(void *)(v72 + 32) = qword_2697FE8D8;
    uint64_t v74 = qword_2697FE878;
    swift_retain();
    if (v74 != -1) {
      swift_once();
    }
    *(void *)(v72 + 40) = qword_2697FE8E0;
    uint64_t v75 = qword_2697FE880;
    swift_retain();
    if (v75 != -1) {
      swift_once();
    }
    *(void *)(v72 + 48) = qword_2697FE8E8;
    v142[0] = v72;
    sub_24C980870();
    uint64_t v76 = v142[0];
    uint64_t v77 = (uint64_t)v126;
    BOOL v78 = v140;
    uint64_t v79 = v124;
    ((void (*)(char *))v124)(v126);
    uint64_t v80 = v79;
    type metadata accessor for SiriPenetrationRateCalculator();
    swift_allocObject();
    swift_retain();
    uint64_t v81 = SiriPenetrationRateCalculator.init(calculationTasks:logger:)(v76, v77);
    *(void *)(v139 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateWorker) = v81;
    id v82 = objc_msgSend((id)BiomeLibrary(), sel_Siri);
    swift_unknownObjectRelease();
    id v83 = objc_msgSend(v82, sel_TaskAggregation);
    swift_unknownObjectRelease();
    id v84 = objc_msgSend(v83, sel_source);

    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA68);
    uint64_t v85 = swift_allocObject();
    *(void *)(v85 + 16) = v84;
    uint64_t v86 = v85;
    *(void *)&long long v121 = v85;
    v80(v77, (uint64_t)v78, v69);
    uint64_t v87 = v69;
    unint64_t v114 = *(void (**)(char *, uint64_t, uint64_t))(v137 + 16);
    uint64_t v120 = v137 + 16;
    uint64_t v88 = v127;
    uint64_t v89 = v131;
    v114(v127, v133, v131);
    type metadata accessor for SiriPenetrationRateBiomeReporter();
    uint64_t v90 = swift_allocObject();
    *(void *)(v90 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = v86;
    uint64_t v91 = v90;
    uint64_t v116 = v90;
    ((void (*)(uint64_t, uint64_t, uint64_t))v132)(v90 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger, v77, v87);
    uint64_t v92 = *(void (**)(uint64_t, char *, uint64_t))(v137 + 32);
    v137 += 32;
    uint64_t v113 = v92;
    v92(v91 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId, v88, v89);
    v80(v77, (uint64_t)v78, v87);
    type metadata accessor for SiriPenetrationRateJsonLoggingReporter();
    uint64_t v93 = swift_allocObject();
    uint64_t v94 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
    swift_retain();
    swift_retain();
    *(void *)(v93 + v94) = sub_24C9608A0(MEMORY[0x263F8EE78]);
    uint64_t v115 = v93;
    unint64_t v95 = (void (*)(uint64_t, uint64_t, uint64_t))v132;
    ((void (*)(uint64_t, uint64_t, uint64_t))v132)(v93 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger, v77, v87);
    swift_release();
    uint64_t v96 = v77;
    v80(v77, (uint64_t)v78, v87);
    uint64_t v97 = v127;
    uint64_t v98 = v131;
    uint64_t v99 = v114;
    v114(v127, v133, v131);
    type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter();
    uint64_t v100 = swift_allocObject();
    uint64_t v112 = v100;
    uint64_t v101 = v96;
    v95(v100 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger, v96, v87);
    uint64_t v102 = v113;
    v113(v100 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId, v97, v98);
    v124(v101, (uint64_t)v140, v87);
    v99(v97, v133, v98);
    type metadata accessor for SiriPenetrationRateSELFReporter();
    uint64_t v103 = swift_allocObject();
    v95(v103 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_logger, v101, v87);
    v102(v103 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateSELFReporter_odmId, v97, v98);
    uint64_t v104 = swift_allocObject();
    *(_OWORD *)(v104 + 16) = xmmword_24C981780;
    uint64_t v105 = v115;
    *(void *)(v104 + 32) = v116;
    *(void *)(v104 + 40) = v105;
    *(void *)(v104 + 48) = v112;
    *(void *)(v104 + 56) = v103;
    v142[0] = v104;
    sub_24C980870();
    uint64_t v106 = v142[0];
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v118(v135, v134);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA70);
    uint64_t v107 = swift_allocObject();
    *(void *)(v107 + 16) = v106;
    __swift_instantiateConcreteTypeFromMangledName(qword_2697FEA78);
    uint64_t v108 = swift_allocObject();
    uint64_t v109 = v130;
    *(void *)(v108 + 16) = v107;
    *(void *)(v108 + 24) = v109;
    *(void *)(v139 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_siriPenetrationRateReporter) = v108;
  }
  return v139;
}

uint64_t type metadata accessor for SiriPenetrationRateMetrics()
{
  uint64_t result = qword_2697FEAD8;
  if (!qword_2697FEAD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C9620AC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24C9620CC, 0, 0);
}

uint64_t sub_24C9620CC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_24C962170;
  uint64_t v2 = *(void *)(v0 + 16);
  return sub_24C973860(v2);
}

uint64_t sub_24C962170()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C962264(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(v3 + 96) = *(void *)a2;
  *(void *)(v3 + 104) = v4;
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a2 + 16);
  *(void *)(v3 + 128) = *(void *)(a2 + 32);
  *(_OWORD *)(v3 + 136) = *(_OWORD *)(a2 + 40);
  *(void *)(v3 + 152) = *(void *)(a2 + 56);
  return MEMORY[0x270FA2498](sub_24C9622AC, 0, 0);
}

uint64_t sub_24C9622AC()
{
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  long long v4 = *(_OWORD *)(v0 + 112);
  long long v3 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = v4;
  *(_OWORD *)(v0 + 48) = v3;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24C962370;
  uint64_t v6 = *(void *)(v0 + 80);
  return sub_24C966538(v6, (uint64_t *)(v0 + 16));
}

uint64_t sub_24C962370()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C962468(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(void *)(v2 + 40) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_24C962498, 0, 0);
}

uint64_t sub_24C962498()
{
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2697FEA98 + dword_2697FEA98);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  void *v1 = v0;
  v1[1] = sub_24C962554;
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[3];
  return v6(v4, v2, v3);
}

uint64_t sub_24C962554()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t SiriPenetrationRateMetrics.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateMetrics.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought26SiriPenetrationRateMetrics_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24C962834(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_24C9620CC, 0, 0);
}

uint64_t sub_24C962858(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v4;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)(v3 + 96) = *(void *)a2;
  *(void *)(v3 + 104) = v5;
  *(_OWORD *)(v3 + 112) = *(_OWORD *)(a2 + 16);
  *(void *)(v3 + 128) = *(void *)(a2 + 32);
  *(_OWORD *)(v3 + 136) = *(_OWORD *)(a2 + 40);
  *(void *)(v3 + 152) = *(void *)(a2 + 56);
  return MEMORY[0x270FA2498](sub_24C9622AC, 0, 0);
}

uint64_t sub_24C9628A4(uint64_t a1)
{
  *(void *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)a1;
  *(void *)(v2 + 40) = *(void *)(a1 + 16);
  return MEMORY[0x270FA2498](sub_24C962498, 0, 0);
}

uint64_t sub_24C9628D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return MEMORY[0x270FA2498](sub_24C9628FC, 0, 0);
}

uint64_t sub_24C9628FC()
{
  unint64_t v1 = *(void *)(v0[5] + 16);
  v0[6] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24C980A60();
    uint64_t v2 = result;
    v0[7] = result;
    if (result)
    {
LABEL_3:
      if (v2 < 1)
      {
        __break(1u);
      }
      else
      {
        v0[8] = 0;
        uint64_t v4 = v0[6];
        if ((v4 & 0xC000000000000001) != 0)
        {
          uint64_t v5 = MEMORY[0x253302A70](0);
        }
        else
        {
          uint64_t v5 = *(void *)(v4 + 32);
          swift_retain();
        }
        v0[9] = v5;
        uint64_t v8 = (uint64_t (*)(void *))(*(void *)(*(void *)v5 + 80) + **(int **)(*(void *)v5 + 80));
        uint64_t v6 = (void *)swift_task_alloc();
        v0[10] = v6;
        *uint64_t v6 = v0;
        v6[1] = sub_24C962AD0;
        return v8(v0 + 2);
      }
      return result;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    v0[7] = v2;
    if (v2) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24C962AD0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24C962BCC, 0, 0);
}

uint64_t sub_24C962BCC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[7];
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v0[8] + 1;
    v0[8] = v5;
    uint64_t v6 = v0[6];
    if ((v6 & 0xC000000000000001) != 0)
    {
      uint64_t v7 = MEMORY[0x253302A70]();
    }
    else
    {
      uint64_t v7 = *(void *)(v6 + 8 * v5 + 32);
      swift_retain();
    }
    v0[9] = v7;
    uint64_t v9 = (uint64_t (*)(void *))(*(void *)(*(void *)v7 + 80) + **(int **)(*(void *)v7 + 80));
    uint64_t v8 = (void *)swift_task_alloc();
    v0[10] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24C962AD0;
    return v9(v0 + 2);
  }
}

uint64_t sub_24C962D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  uint64_t v5 = type metadata accessor for conversationStreamMetadata(0);
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  v4[14] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for eventStreamMetadata(0);
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C962EB4, 0, 0);
}

uint64_t sub_24C962EB4()
{
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2697FEB30 + dword_2697FEB30);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  void *v1 = v0;
  v1[1] = sub_24C962F68;
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[7];
  return v6(v4, v2, v3);
}

uint64_t sub_24C962F68()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C9630C0, 0, 0);
  }
}

uint64_t sub_24C9630C0()
{
  uint64_t v1 = *(void *)(v0 + 72);
  *(void *)(v0 + 40) = &type metadata for SiriPenetrationRateResult;
  unint64_t v2 = sub_24C963D10();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  *(void *)(v0 + 48) = v2;
  *(void *)(v0 + 32) = v1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), (uint64_t)&type metadata for SiriPenetrationRateResult)[1];
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 128);
    uint64_t v27 = *(void *)(v0 + 136) + *(int *)(*(void *)(v0 + 120) + 20);
    uint64_t v25 = *(void *)(*(void *)(v0 + 80) + 24);
    uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v7 = *(void *)(v5 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v8 = *(void *)(v0 + 136);
      uint64_t v9 = *(void *)(v0 + 112);
      sub_24C963D64(v6, v8, type metadata accessor for eventStreamMetadata);
      uint64_t v10 = sub_24C9800F0();
      uint64_t v11 = *(void *)(v10 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v9, v27, v10);
      sub_24C963DCC(v8, type metadata accessor for eventStreamMetadata);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      id v12 = *(id *)(v25 + 16);
      sub_24C9804E0();

      sub_24C95871C(v9);
      v6 += v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v13 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    uint64_t v15 = *(void *)(v0 + 96);
    uint64_t v28 = *(void *)(v0 + 104) + *(int *)(*(void *)(v0 + 88) + 20);
    uint64_t v26 = *(void *)(*(void *)(v0 + 80) + 24);
    uint64_t v16 = v13 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v17 = *(void *)(v15 + 72);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v18 = *(void *)(v0 + 104);
      uint64_t v19 = *(void *)(v0 + 112);
      sub_24C963D64(v16, v18, type metadata accessor for conversationStreamMetadata);
      uint64_t v20 = sub_24C9800F0();
      uint64_t v21 = *(void *)(v20 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v19, v28, v20);
      sub_24C963DCC(v18, type metadata accessor for conversationStreamMetadata);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v19, 0, 1, v20);
      id v22 = *(id *)(v26 + 16);
      sub_24C9804D0();

      sub_24C95871C(v19);
      v16 += v17;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
  }
  os_log_type_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v23;
  *os_log_type_t v23 = v0;
  v23[1] = sub_24C963448;
  return sub_24C95DD14();
}

uint64_t sub_24C963448()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0) {
    unint64_t v2 = sub_24C9635E8;
  }
  else {
    unint64_t v2 = sub_24C96355C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C96355C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C9635E8()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C963670()
{
  return sub_24C96370C(&qword_2697FEAA0);
}

uint64_t sub_24C9636A4()
{
  return sub_24C96370C(&qword_2697FEAA8);
}

uint64_t sub_24C9636D8()
{
  return sub_24C96370C(&qword_2697FEAB0);
}

uint64_t sub_24C96370C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriPenetrationRateMetrics();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24C963754()
{
  unint64_t result = qword_2697FEAB8[0];
  if (!qword_2697FEAB8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2697FEAB8);
  }
  return result;
}

uint64_t sub_24C9637AC()
{
  return type metadata accessor for SiriPenetrationRateMetrics();
}

uint64_t sub_24C9637B4()
{
  uint64_t result = sub_24C980140();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C980720();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateMetrics(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateMetrics);
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.__allocating_init(bookmarkLocation:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 128) + **(int **)(*(void *)v1 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C963EA0;
  return v6(a1);
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.doWork(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 136) + **(int **)(*(void *)v2 + 136));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24C95F9C4;
  return v8(a1, a2);
}

uint64_t dispatch thunk of SiriPenetrationRateMetrics.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 144) + **(int **)(*(void *)v1 + 144));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C963EA0;
  return v6(a1);
}

unint64_t sub_24C963BEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB28);
  uint64_t v3 = (void *)sub_24C980A90();
  int v4 = *(_DWORD *)(a1 + 32);
  double v5 = *(double *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  unint64_t result = sub_24C969E58(v4, v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v9 = (void *)(a1 + 72);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = v3[6] + 16 * result;
    *(_DWORD *)uint64_t v10 = v4;
    *(double *)(v10 + 8) = v5;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 3;
    int v4 = *((_DWORD *)v9 - 4);
    double v5 = *((double *)v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_24C969E58(v4, v5);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_24C963D10()
{
  unint64_t result = qword_2697FEB38;
  if (!qword_2697FEB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FEB38);
  }
  return result;
}

uint64_t sub_24C963D64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C963DCC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C963E2C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_24C963E90(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id BiomeEvent.biomeEvent.getter()
{
  return *v0;
}

double BiomeEvent.timestamp.getter()
{
  return *(double *)(v0 + 8);
}

uint64_t BiomeEvent.init(biomeEvent:timestamp:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(void *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t BiomeRecord.biomeEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t BiomeRecord.init(biomeEvents:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id BiomeDataProvider.biomeSource.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t BiomeDataProvider.__allocating_init(logger:biomeSource:bookmark:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  uint64_t v7 = v6 + qword_2697FEB50;
  uint64_t v8 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a1, v8);
  return v6;
}

uint64_t BiomeDataProvider.init(logger:biomeSource:bookmark:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  uint64_t v5 = v3 + qword_2697FEB50;
  uint64_t v6 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  return v3;
}

uint64_t sub_24C963FE4(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  return MEMORY[0x270FA2498](sub_24C96402C, 0, 0);
}

uint64_t sub_24C96402C()
{
  uint64_t v19 = v0;
  sub_24C964360();
  unint64_t v1 = sub_24C980310();
  type metadata accessor for BiomeEvent();
  uint64_t v17 = sub_24C980890();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24C980A60();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_10;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  do
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x253302A70](v4, v1);
    }
    else {
      id v5 = *(id *)(v1 + 8 * v4 + 32);
    }
    uint64_t v6 = v5;
    ++v4;
    sub_24C9806D0();
    uint64_t v7 = swift_dynamicCastUnknownClassUnconditional();
    sub_24C9806E0();
    *(void *)(v0 + 16) = v7;
    *(void *)(v0 + 24) = v8;
    sub_24C9808D0();
    sub_24C9808B0();
  }
  while (v2 != v4);
LABEL_10:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_24C980700();
  os_log_type_t v10 = sub_24C980920();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 134218242;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_24C980A60();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v13;
    sub_24C980950();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v14 = sub_24C980C60();
    *(void *)(v0 + 16) = sub_24C95F060(v14, v15, &v18);
    sub_24C980950();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v9, v10, "marker: read %ld events of type %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253303270](v12, -1, -1);
    MEMORY[0x253303270](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  **(void **)(v0 + 32) = v17;
  char v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24C964360()
{
  sub_24C964C18(0, &qword_2697FECF0);
  uint64_t v0 = swift_dynamicCastMetatype();
  uint64_t result = 0;
  if (!v0)
  {
    sub_24C964C18(0, &qword_2697FECF8);
    if (swift_dynamicCastMetatype())
    {
      return 1;
    }
    else
    {
      sub_24C964C18(0, &qword_2697FED00);
      if (swift_dynamicCastMetatype())
      {
        return 2;
      }
      else
      {
        sub_24C964C18(0, &qword_2697FED08);
        if (swift_dynamicCastMetatype())
        {
          return 3;
        }
        else
        {
          sub_24C964C18(0, &qword_2697FED10);
          if (swift_dynamicCastMetatype())
          {
            return 4;
          }
          else
          {
            sub_24C964C18(0, &qword_2697FED18);
            if (swift_dynamicCastMetatype())
            {
              return 6;
            }
            else
            {
              sub_24C964C18(0, &qword_2697FED20);
              if (swift_dynamicCastMetatype())
              {
                return 7;
              }
              else
              {
                sub_24C964C18(0, &qword_2697FED28);
                if (swift_dynamicCastMetatype())
                {
                  return 8;
                }
                else
                {
                  sub_24C964C18(0, &qword_2697FED30);
                  if (swift_dynamicCastMetatype())
                  {
                    return 9;
                  }
                  else
                  {
                    sub_24C964C18(0, &qword_2697FED38);
                    if (swift_dynamicCastMetatype())
                    {
                      return 10;
                    }
                    else
                    {
                      sub_24C964C18(0, &qword_2697FED40);
                      if (swift_dynamicCastMetatype())
                      {
                        return 11;
                      }
                      else
                      {
                        sub_24C964C18(0, &qword_2697FED48);
                        if (swift_dynamicCastMetatype())
                        {
                          return 12;
                        }
                        else
                        {
                          sub_24C964C18(0, &qword_2697FED50);
                          if (swift_dynamicCastMetatype())
                          {
                            return 13;
                          }
                          else
                          {
                            sub_24C964C18(0, &qword_2697FED58);
                            if (swift_dynamicCastMetatype())
                            {
                              return 16;
                            }
                            else
                            {
                              sub_24C964C18(0, &qword_2697FED60);
                              if (swift_dynamicCastMetatype())
                              {
                                return 15;
                              }
                              else
                              {
                                sub_24C964C18(0, &qword_2697FED68);
                                if (swift_dynamicCastMetatype())
                                {
                                  return 14;
                                }
                                else
                                {
                                  sub_24C964C18(0, &qword_2697FED70);
                                  if (swift_dynamicCastMetatype())
                                  {
                                    return 18;
                                  }
                                  else
                                  {
                                    sub_24C964C18(0, &qword_2697FED78);
                                    if (swift_dynamicCastMetatype()) {
                                      return 19;
                                    }
                                    else {
                                      return 5;
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
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t BiomeDataProvider.deinit()
{
  uint64_t v1 = v0 + qword_2697FEB50;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t BiomeDataProvider.__deallocating_deinit()
{
  BiomeDataProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24C964770(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 120) + **(int **)(**(void **)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

uint64_t type metadata accessor for BiomeEvent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C964894()
{
  return swift_getWitnessTable();
}

uint64_t sub_24C9648B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

void *sub_24C9648B8(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void sub_24C9648E8(id *a1)
{
}

uint64_t sub_24C9648F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24C964948(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPentrationRateCoreAnalyticsPayload(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriPentrationRateCoreAnalyticsPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for BiomeRecord()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24C964A24()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for BiomeDataProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BiomeDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BiomeDataProvider);
}

uint64_t dispatch thunk of BiomeDataProvider.__allocating_init(logger:biomeSource:bookmark:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BiomeDataProvider.loadData()(uint64_t a1)
{
  id v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

uint64_t sub_24C964C18(uint64_t a1, unint64_t *a2)
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

uint64_t static BookmarkUtils.getBookmarkEndTime(calendar:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v43 = a2;
  uint64_t v2 = sub_24C9801E0();
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v49 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_24C9801F0();
  uint64_t v48 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  unint64_t v47 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_24C9801C0();
  uint64_t v44 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  id v46 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_24C980240();
  uint64_t v6 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v45 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v39 - v13;
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)v39 - v15;
  uint64_t v17 = sub_24C9800F0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  id v56 = (char *)v39 - v22;
  if (qword_2697FE888 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v9, (uint64_t)qword_2697FE900);
  swift_beginAccess();
  sub_24C95864C(v23, (uint64_t)v16);
  uint64_t v57 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  uint64_t v24 = v17;
  if (v57(v16, 1, v17) == 1)
  {
    sub_24C9800E0();
    sub_24C95871C((uint64_t)v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, v17);
  }
  uint64_t v25 = v52;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F07870], v52);
  sub_24C980210();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v25);
  uint64_t v53 = v18 + 48;
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v57)(v14, 1, v17);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    id v41 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    uint64_t v42 = v18 + 32;
    v41(v56, v14, v17);
    uint64_t v27 = *(uint64_t (**)(char *, uint64_t))(v18 + 8);
    v39[1] = v18 + 8;
    uint64_t v40 = v27;
    v27(v21, v17);
    uint64_t v28 = v44;
    uint64_t v29 = v46;
    (*(void (**)(char *, void, uint64_t))(v44 + 104))(v46, *MEMORY[0x263F07780], v54);
    uint64_t v30 = *MEMORY[0x263F07800];
    uint64_t v31 = v48;
    uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 104);
    uint64_t v52 = v24;
    uint64_t v33 = v47;
    v32(v47, v30, v55);
    uint64_t v34 = v49;
    uint64_t v35 = v50;
    uint64_t v36 = v51;
    (*(void (**)(char *, void, uint64_t))(v50 + 104))(v49, *MEMORY[0x263F077E0], v51);
    uint64_t v37 = v45;
    sub_24C980200();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
    uint64_t v38 = v52;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v55);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v54);
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v57)(v37, 1, v38);
    if (result != 1)
    {
      v41(v43, v37, v38);
      return v40(v56, v38);
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for BookmarkUtils()
{
  return &type metadata for BookmarkUtils;
}

void *sub_24C9652D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981A10;
  sub_24C980450();
  *(void *)(inited + 32) = sub_24C980440();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000017;
  *(void *)(inited + 56) = 0x800000024C986CA0;
  *(void *)(inited + 80) = sub_24C9803F0();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0x6C61437472617453;
  *(void *)(inited + 104) = 0xE90000000000006CLL;
  *(void *)(inited + 128) = sub_24C980410();
  *(void *)(inited + 136) = v4;
  type metadata accessor for BMAppIntentHandlingStatus(0);
  *(void *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 4;
  *(void *)(inited + 176) = sub_24C980400();
  *(void *)(inited + 184) = v6;
  *(void *)(inited + 216) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 192) = 0;
  *(void *)(inited + 224) = sub_24C980430();
  *(void *)(inited + 232) = v7;
  *(void *)(inited + 264) = v2;
  *(void *)(inited + 240) = 0x676E696F6774754FLL;
  *(void *)(inited + 248) = 0xE800000000000000;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FED80 = result;
  return result;
}

uint64_t static StartCallPenetrationRateEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE8A0);
}

void *sub_24C965418()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981700;
  sub_24C9803C0();
  *(void *)(inited + 32) = sub_24C9803A0();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000017;
  *(void *)(inited + 56) = 0x800000024C986CA0;
  *(void *)(inited + 80) = sub_24C980390();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0xD000000000000023;
  *(void *)(inited + 104) = 0x800000024C986CC0;
  *(void *)(inited + 128) = sub_24C9803B0();
  *(void *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(void *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FED88 = result;
  return result;
}

uint64_t static StartCallPenetrationRateEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE8A8);
}

uint64_t StartCallPenetrationRateEventFilter.deinit()
{
  return v0;
}

uint64_t StartCallPenetrationRateEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s11DeepThought35StartCallPenetrationRateEventFilterC06isSiriG013siriExecutionSb0aB15BiomeFoundation010FeaturizedG0C_tFZ_0()
{
  sub_24C9803C0();
  sub_24C9803A0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v37 + 1);
  uint64_t v34 = v37;
  if (qword_2697FE8A8 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FED88;
  uint64_t v2 = sub_24C9803A0();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = v35;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v33 = v7;
    if (v6) {
      uint64_t v8 = v36;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v33 = 0;
    uint64_t v8 = 0;
  }
  sub_24C980390();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&v37 + 1);
  uint64_t v32 = v37;
  uint64_t v10 = off_2697FED88;
  uint64_t v11 = sub_24C980390();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v35;
    if (!v15) {
      uint64_t v16 = 0;
    }
    uint64_t v31 = v16;
    if (v15) {
      uint64_t v17 = v36;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v31 = 0;
    uint64_t v17 = 0;
  }
  sub_24C9803B0();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v30 = v37;
  char v18 = BYTE4(v37);
  uint64_t v19 = off_2697FED88;
  uint64_t v20 = sub_24C9803B0();
  if (v19[2] && (unint64_t v22 = sub_24C969CEC(v20, v21), (v23 & 1) != 0))
  {
    sub_24C95D484(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v38 + 1))
  {
    sub_24C960840((uint64_t)&v37);
    int v25 = 0;
    uint64_t v26 = 1;
    if (v0) {
      goto LABEL_34;
    }
LABEL_39:
    if (!v8) {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  int v24 = swift_dynamicCast();
  if (v24) {
    int v25 = v35;
  }
  else {
    int v25 = 0;
  }
  uint64_t v26 = v24 ^ 1u;
  if (!v0) {
    goto LABEL_39;
  }
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  char v28 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0) {
        return (v30 == v25) & ~v26;
      }
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17) {
    goto LABEL_42;
  }
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  int v29 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0))) {
    return (v30 == v25) & ~v26;
  }
  return v29 & v26;
}

uint64_t _s11DeepThought35StartCallPenetrationRateEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedG0C_tFZ_0()
{
  sub_24C980450();
  sub_24C980440();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v55 + 1);
  uint64_t v52 = v55;
  if (qword_2697FE8A0 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FED80;
  uint64_t v2 = sub_24C980440();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v56 + 1))
  {
    int v6 = swift_dynamicCast();
    unint64_t v7 = v53;
    if (!v6) {
      unint64_t v7 = 0;
    }
    unint64_t v51 = v7;
    if (v6) {
      unint64_t v8 = v54;
    }
    else {
      unint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v55);
    unint64_t v51 = 0;
    unint64_t v8 = 0;
  }
  sub_24C9803F0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  long long v9 = v55;
  uint64_t v10 = off_2697FED80;
  uint64_t v11 = sub_24C9803F0();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v56 + 1))
  {
    int v15 = swift_dynamicCast();
    unint64_t v16 = v53;
    if (!v15) {
      unint64_t v16 = 0;
    }
    unint64_t v48 = v16;
    if (v15) {
      unint64_t v17 = v54;
    }
    else {
      unint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v55);
    unint64_t v48 = 0;
    unint64_t v17 = 0;
  }
  sub_24C980410();
  type metadata accessor for BMAppIntentHandlingStatus(0);
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v46 = v55;
  char v50 = BYTE4(v55);
  char v18 = off_2697FED80;
  uint64_t v19 = sub_24C980410();
  if (v18[2] && (unint64_t v21 = sub_24C969CEC(v19, v20), (v22 & 1) != 0))
  {
    sub_24C95D484(v18[7] + 32 * v21, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v56 + 1))
  {
    int v23 = swift_dynamicCast();
    int v24 = v53;
    if (!v23) {
      int v24 = 0;
    }
    int v45 = v24;
    char v25 = v23 ^ 1;
  }
  else
  {
    sub_24C960840((uint64_t)&v55);
    int v45 = 0;
    char v25 = 1;
  }
  char v49 = v25;
  sub_24C980400();
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v47 = v55;
  uint64_t v26 = off_2697FED80;
  uint64_t v27 = sub_24C980400();
  if (v26[2] && (unint64_t v29 = sub_24C969CEC(v27, v28), (v30 & 1) != 0))
  {
    sub_24C95D484(v26[7] + 32 * v29, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v56 + 1))
  {
    if (swift_dynamicCast()) {
      int v31 = v53;
    }
    else {
      int v31 = 2;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v55);
    int v31 = 2;
  }
  sub_24C980430();
  sub_24C980470();
  swift_bridgeObjectRelease();
  long long v32 = v55;
  uint64_t v33 = off_2697FED80;
  uint64_t v34 = sub_24C980430();
  if (v33[2] && (unint64_t v36 = sub_24C969CEC(v34, v35), (v37 & 1) != 0))
  {
    sub_24C95D484(v33[7] + 32 * v36, (uint64_t)&v55);
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v56 + 1))
  {
    sub_24C960840((uint64_t)&v55);
    unint64_t v39 = 0;
    unint64_t v40 = 0;
    if (v0) {
      goto LABEL_55;
    }
LABEL_60:
    if (!v8) {
      goto LABEL_68;
    }
    goto LABEL_61;
  }
  int v38 = swift_dynamicCast();
  if (v38) {
    unint64_t v39 = v53;
  }
  else {
    unint64_t v39 = 0;
  }
  if (v38) {
    unint64_t v40 = v54;
  }
  else {
    unint64_t v40 = 0;
  }
  if (!v0) {
    goto LABEL_60;
  }
LABEL_55:
  if (!v8)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    goto LABEL_62;
  }
  if (v52 == v51 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_68;
  }
  char v43 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v43 & 1) == 0)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    goto LABEL_63;
  }
LABEL_68:
  if (!*((void *)&v9 + 1))
  {
    if (!v17) {
      goto LABEL_76;
    }
LABEL_63:
    swift_bridgeObjectRelease();
    goto LABEL_64;
  }
  if (!v17) {
    goto LABEL_63;
  }
  if (v9 == __PAIR128__(v17, v48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v44 = sub_24C980B90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v44 & 1) == 0) {
      goto LABEL_64;
    }
  }
LABEL_76:
  if (v50)
  {
    if ((v49 & 1) == 0) {
      goto LABEL_64;
    }
  }
  else if ((v49 & 1) != 0 || v46 != v45)
  {
    goto LABEL_64;
  }
  if (v47 == 2)
  {
    if (v31 == 2) {
      goto LABEL_86;
    }
LABEL_64:
    swift_bridgeObjectRelease();
    goto LABEL_65;
  }
  if (v31 == 2 || ((v47 & 1) == 0) == (v31 != 0)) {
    goto LABEL_64;
  }
LABEL_86:
  if (!*((void *)&v32 + 1))
  {
    if (!v40)
    {
      char v41 = 1;
      return v41 & 1;
    }
    goto LABEL_65;
  }
  if (!v40)
  {
LABEL_65:
    swift_bridgeObjectRelease();
    char v41 = 0;
    return v41 & 1;
  }
  if (v32 == __PAIR128__(v40, v39))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v41 = 1;
  }
  else
  {
    char v41 = sub_24C980B90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v41 & 1;
}

uint64_t type metadata accessor for StartCallPenetrationRateEventFilter()
{
  return self;
}

uint64_t method lookup function for StartCallPenetrationRateEventFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StartCallPenetrationRateEventFilter);
}

uint64_t SiriPenetrationRateCalculator.__allocating_init(calculationTasks:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  SiriPenetrationRateCalculator.init(calculationTasks:logger:)(a1, a2);
  return v4;
}

double SiriPenetrationRateCalculator.timeBucketInSec.getter()
{
  return 60.0;
}

uint64_t SiriPenetrationRateCalculator.defaultLocale.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriPenetrationRateCalculator.init(calculationTasks:logger:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE920);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v39 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24C980250();
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FED90);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24C980190();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24C9801B0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_timeBucketInSec) = 0x404E000000000000;
  id v20 = objc_msgSend(self, sel_autoupdatingCurrentLocale);
  sub_24C980170();

  sub_24C9801A0();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  sub_24C980180();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v21 = sub_24C980160();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v11, 1, v21);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    int v24 = (uint64_t *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
    uint64_t v25 = sub_24C980150();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v21);
    *int v24 = v25;
    v24[1] = v27;
    uint64_t v28 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_conversationStream;
    sub_24C980580();
    *(void *)(v3 + v28) = sub_24C980570();
    sub_24C980220();
    unint64_t v29 = v39;
    sub_24C980260();
    uint64_t v30 = sub_24C980270();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 48))(v29, 1, v30);
    if (result != 1)
    {
      uint64_t v31 = v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
      sub_24C980230();
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v31, v8, v36);
      *(void *)(v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks) = v37;
      uint64_t v32 = v3 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
      uint64_t v33 = sub_24C980720();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 32))(v32, v38, v33);
      return v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24C966538(uint64_t a1, uint64_t *a2)
{
  *(void *)(v3 + 256) = a1;
  *(void *)(v3 + 264) = v2;
  uint64_t v5 = sub_24C9800F0();
  *(void *)(v3 + 272) = v5;
  *(void *)(v3 + 280) = *(void *)(v5 - 8);
  *(void *)(v3 + 288) = swift_task_alloc();
  uint64_t v6 = sub_24C980720();
  *(void *)(v3 + 296) = v6;
  *(void *)(v3 + 304) = *(void *)(v6 - 8);
  *(void *)(v3 + 312) = swift_task_alloc();
  *(void *)(v3 + 320) = swift_task_alloc();
  *(void *)(v3 + 328) = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  *(void *)(v3 + 336) = v7;
  *(void *)(v3 + 344) = v8;
  *(void *)(v3 + 352) = v9;
  *(_OWORD *)(v3 + 360) = *((_OWORD *)a2 + 1);
  *(void *)(v3 + 376) = a2[4];
  *(_OWORD *)(v3 + 384) = *(_OWORD *)(a2 + 5);
  *(void *)(v3 + 400) = a2[7];
  return MEMORY[0x270FA2498](sub_24C9666AC, 0, 0);
}

uint64_t sub_24C9666AC()
{
  unint64_t v1 = *(void *)(v0 + 392);
  unint64_t v2 = *(void *)(v0 + 376);
  unint64_t v3 = *(void *)(v0 + 360);
  uint64_t v4 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 208) = sub_24C963BEC(MEMORY[0x263F8EE78]);
  id v84 = (NSObject **)(v0 + 208);
  *(void *)(v0 + 232) = sub_24C960BD0(v4);
  uint64_t v5 = (objc_class *)(v0 + 232);
  uint64_t v6 = _s11DeepThought24LocaleChangingPointUtilsO03getcD6Points23featurizedConversationsSayAA07DateAndC4PairVGSay0aB15BiomeFoundation22FeaturizedConversationCG_tFZ_0(v1);
  unint64_t v7 = _s11DeepThought24SiriPenetrationRateUtilsO07alignToC15ExecutionEvents04siriiJ00K8UIEvents0K13Conversations12timeDurationSay0aB15BiomeFoundation15FeaturizedEventCGAL_ALSayAI0R12ConversationCGSdtFZ_0(v3, v2, v1, 60.0);
  sub_24C980460();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_24C980700();
  LOBYTE(v9) = sub_24C980920();
  if (!os_log_type_enabled(v8, (os_log_type_t)v9))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_6;
  }
  uint64_t v10 = swift_slowAlloc();
  *(_DWORD *)uint64_t v10 = 134217984;
  if (!(v7 >> 62))
  {
    uint64_t v11 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_4;
  }
LABEL_60:
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24C980A60();
  swift_bridgeObjectRelease();
LABEL_4:
  swift_bridgeObjectRelease();
  *(void *)(v0 + 248) = v11;
  sub_24C980950();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_24C953000, v8, (os_log_type_t)v9, "marker: The size of siriExecutionEvents is %ld", (uint8_t *)v10, 0xCu);
  MEMORY[0x253303270](v10, -1, -1);
LABEL_6:

  uint64_t v72 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 304) + 8);
  v72(*(void *)(v0 + 336), *(void *)(v0 + 296));
  uint64_t v81 = (uint64_t)v6;
  sub_24C967140(v7, (uint64_t)v6, (uint64_t)v5);
  swift_bridgeObjectRelease();
  sub_24C980460();
  uint64_t v6 = sub_24C980700();
  os_log_type_t v12 = sub_24C980920();
  if (os_log_type_enabled(v6, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134217984;
    LOBYTE(v9) = (_BYTE)v13 + 12;
    swift_beginAccess();
    *((void *)v5 + 1) = *(void *)(*(void *)v5 + 16);
    sub_24C980950();
    _os_log_impl(&dword_24C953000, v6, v12, "marker: Counts are updated with SiriEvents. The size of counts is %ld", v13, 0xCu);
    MEMORY[0x253303270](v13, -1, -1);
  }
  id v68 = (Class *)((char *)v5 - 16);
  uint64_t v14 = *(void (***)(uint64_t, uint64_t))(v0 + 344);
  uint64_t v15 = *(void *)(v0 + 328);
  uint64_t v10 = *(void *)(v0 + 296);

  v72(v15, v10);
  swift_beginAccess();
  sub_24C96854C(v14, v81, (uint64_t)v5);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_24C980460();
  uint64_t v16 = *(void *)(v0 + 232);
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_24C980700();
  os_log_type_t v17 = sub_24C980920();
  unint64_t v7 = v17;
  if (os_log_type_enabled(v8, v17))
  {
    uint64_t v10 = 12;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 134217984;
    *((void *)v5 - 1) = *(void *)(v16 + 16);
    sub_24C980950();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v8, (os_log_type_t)v7, "marker: Counts are updated with UIEvents. The size of counts is %ld", v18, 0xCu);
    MEMORY[0x253303270](v18, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v72(*(void *)(v0 + 320), *(void *)(v0 + 296));
  char v71 = (void *)v0;
  uint64_t v19 = *(void *)(v0 + 232);
  uint64_t v20 = *(void *)(v19 + 64);
  uint64_t v73 = v19 + 64;
  uint64_t v21 = -1;
  uint64_t v22 = -1 << *(unsigned char *)(v19 + 32);
  if (-v22 < 64) {
    uint64_t v21 = ~(-1 << -(char)v22);
  }
  unint64_t v23 = v21 & v20;
  int64_t v74 = (unint64_t)(63 - v22) >> 6;
  uint64_t v76 = *(void *)(v0 + 232);
  swift_bridgeObjectRetain();
  int v24 = 0;
  uint64_t v0 = 0;
  if (v23)
  {
LABEL_14:
    uint64_t v79 = (v23 - 1) & v23;
    unint64_t v25 = __clz(__rbit64(v23)) | (v0 << 6);
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v26 = v0 + 1;
    if (__OFADD__(v0, 1)) {
      goto LABEL_58;
    }
    if (v26 >= v74) {
      goto LABEL_48;
    }
    unint64_t v27 = *(void *)(v73 + 8 * v26);
    ++v0;
    if (!v27)
    {
      uint64_t v0 = v26 + 1;
      if (v26 + 1 >= v74) {
        goto LABEL_48;
      }
      unint64_t v27 = *(void *)(v73 + 8 * v0);
      if (!v27)
      {
        uint64_t v0 = v26 + 2;
        if (v26 + 2 >= v74) {
          goto LABEL_48;
        }
        unint64_t v27 = *(void *)(v73 + 8 * v0);
        if (!v27)
        {
          int64_t v28 = v26 + 3;
          if (v28 >= v74)
          {
LABEL_48:
            swift_release();
            sub_24C980460();
            unint64_t v51 = sub_24C980700();
            os_log_type_t v52 = sub_24C980920();
            if (os_log_type_enabled(v51, v52))
            {
              unint64_t v53 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)unint64_t v53 = 134217984;
              swift_beginAccess();
              *id v68 = (*v84)[2].isa;
              sub_24C980950();
              _os_log_impl(&dword_24C953000, v51, v52, "marker: The size of countsToReport is %ld", v53, 0xCu);
              MEMORY[0x253303270](v53, -1, -1);
            }
            uint64_t v75 = v71[50];
            uint64_t v70 = v71[48];
            uint64_t v67 = v71[44];
            uint64_t v69 = v71[46];
            uint64_t v54 = v71[39];
            long long v55 = (char *)v71[36];
            uint64_t v56 = v71[37];
            uint64_t v57 = v71[35];
            uint64_t v77 = v71[34];
            id v59 = (void *)v71[32];
            uint64_t v58 = v71[33];

            v72(v54, v56);
            static BookmarkUtils.getBookmarkEndTime(calendar:)(v58 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar, v55);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEDC0);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_24C981700;
            *(void *)(inited + 32) = v67;
            *(void *)(inited + 40) = v69;
            *(void *)(inited + 48) = v70;
            uint64_t v61 = sub_24C970CA0(inited, (uint64_t)v55);
            swift_setDeallocating();
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697FEDC8);
            uint64_t v62 = swift_initStackObject();
            *(_OWORD *)(v62 + 16) = xmmword_24C981590;
            *(void *)(v62 + 32) = v75;
            uint64_t v63 = sub_24C970CE0(v62, (uint64_t)v55);
            swift_setDeallocating();
            (*(void (**)(char *, uint64_t))(v57 + 8))(v55, v77);
            swift_beginAccess();
            uint64_t v64 = v71[26];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_24C96BD48((uint64_t)v24);
            *id v59 = v64;
            v59[1] = v61;
            v59[2] = v63;
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            unint64_t v65 = (uint64_t (*)(void))v71[1];
            return v65();
          }
          unint64_t v27 = *(void *)(v73 + 8 * v28);
          if (!v27)
          {
            while (1)
            {
              uint64_t v0 = v28 + 1;
              if (__OFADD__(v28, 1)) {
                goto LABEL_59;
              }
              if (v0 >= v74) {
                goto LABEL_48;
              }
              unint64_t v27 = *(void *)(v73 + 8 * v0);
              ++v28;
              if (v27) {
                goto LABEL_28;
              }
            }
          }
          uint64_t v0 = v28;
        }
      }
    }
LABEL_28:
    uint64_t v79 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v0 << 6);
LABEL_29:
    unint64_t v29 = (unsigned int *)(*(void *)(v76 + 48) + 72 * v25);
    unint64_t v7 = *v29;
    double v30 = *((double *)v29 + 1);
    uint64_t v5 = (objc_class *)*((void *)v29 + 2);
    uint64_t v10 = *((void *)v29 + 3);
    uint64_t v9 = (objc_class *)*((void *)v29 + 5);
    uint64_t v80 = (objc_class *)*((void *)v29 + 4);
    uint64_t v6 = *((void *)v29 + 7);
    id v82 = (objc_class *)*((void *)v29 + 6);
    char v83 = *((unsigned char *)v29 + 64);
    uint64_t v31 = (objc_class **)(*(void *)(v76 + 56) + 16 * v25);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24C96BD48((uint64_t)v24);
    uint64_t v8 = *v84;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v36 = sub_24C969E58(v7, v30);
    Class isa = v8[2].isa;
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = (uint64_t)isa + v38;
    if (__OFADD__(isa, v38))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    char v40 = v35;
    if ((uint64_t)v8[3].isa >= v39)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24C96AED0();
      }
      goto LABEL_35;
    }
    sub_24C96A6CC(v39, isUniquelyReferenced_nonNull_native);
    unint64_t v41 = sub_24C969E58(v7, v30);
    if ((v40 & 1) != (v42 & 1)) {
      break;
    }
    unint64_t v36 = v41;
LABEL_35:
    BOOL v78 = (void *)v0;
    char *v84 = v8;
    swift_bridgeObjectRelease();
    if (v40)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v8[(v36 >> 6) + 8].Class isa = (Class)((uint64_t)v8[(v36 >> 6) + 8].isa | (1 << v36));
      uint64_t v43 = (uint64_t)v8[6].isa + 16 * v36;
      *(_DWORD *)uint64_t v43 = v7;
      *(double *)(v43 + 8) = v30;
      *((void *)v8[7].isa + v36) = MEMORY[0x263F8EE78];
      Class v44 = v8[2].isa;
      uint64_t v0 = (uint64_t)v44 + 1;
      BOOL v45 = __OFADD__(v44, 1);
      swift_bridgeObjectRetain();
      if (v45) {
        goto LABEL_57;
      }
      v8[2].Class isa = (Class)v0;
    }
    Class v46 = v8[7].isa;
    swift_bridgeObjectRelease();
    uint64_t v8 = *((void *)v46 + v36);
    char v47 = swift_isUniquelyReferenced_nonNull_native();
    *((void *)v46 + v36) = v8;
    if ((v47 & 1) == 0)
    {
      uint64_t v8 = sub_24C969BC4(0, (int64_t)v8[2].isa + 1, 1, v8);
      *((void *)v46 + v36) = v8;
    }
    unint64_t v49 = (unint64_t)v8[2].isa;
    unint64_t v48 = (unint64_t)v8[3].isa;
    if (v49 >= v48 >> 1)
    {
      uint64_t v8 = sub_24C969BC4((void *)(v48 > 1), v49 + 1, 1, v8);
      *((void *)v46 + v36) = v8;
    }
    unint64_t v23 = v79;
    v8[2].Class isa = (Class)(v49 + 1);
    char v50 = &v8[11 * v49];
    LODWORD(v50[4].isa) = v7;
    *(double *)&v50[5].Class isa = v30;
    v50[6].Class isa = v5;
    v50[7].Class isa = (Class)v10;
    v50[8].Class isa = v80;
    v50[9].Class isa = v9;
    v50[10].Class isa = v82;
    v50[11].Class isa = (Class)v6;
    LOBYTE(v50[12].isa) = v83;
    *(Class *)((char *)&v50[12].isa + 4) = v33;
    *(Class *)((char *)&v50[13].isa + 4) = v32;
    int v24 = sub_24C967130;
    uint64_t v0 = (uint64_t)v78;
    if (v79) {
      goto LABEL_14;
    }
  }
  return sub_24C980BA0();
}

void sub_24C967130(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

uint64_t sub_24C967140(unint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3)
{
  uint64_t v141 = a3;
  uint64_t v99 = a2;
  uint64_t v117 = sub_24C980720();
  uint64_t v4 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  uint64_t v131 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_24C9801E0();
  uint64_t v6 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  id v123 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_24C9801F0();
  uint64_t v8 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  long long v121 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_24C9801C0();
  uint64_t v10 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  uint64_t v119 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388](v12 - 8);
  long long v118 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE08);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v98 = (uint64_t)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = type metadata accessor for DateAndLocalePair();
  uint64_t v16 = *(char **)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v91 = (uint64_t)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_24C9800F0();
  uint64_t v18 = *(NSObject **)(v127 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v127);
  uint64_t v116 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (uint64_t)&v85 - v21;
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_62;
  }
  uint64_t v23 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v25 = v23;
  if (!v23)
  {
LABEL_63:
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  unint64_t v26 = 0;
  uint64_t v129 = v90 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  uint64_t v85 = (uint64_t *)(v90 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  uint64_t v89 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks;
  unint64_t v93 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
  uint64_t v87 = isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8;
  unint64_t v86 = isUniquelyReferenced_nonNull_native + 32;
  uint64_t v96 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  unsigned int v115 = *MEMORY[0x263F07780];
  unint64_t v114 = (void (**)(char *, void, uint64_t))(v10 + 104);
  uint64_t v113 = (void (**)(char *, void, uint64_t))(v8 + 104);
  uint64_t v112 = (void (**)(char *, void, uint64_t))(v6 + 104);
  unsigned int v111 = *MEMORY[0x263F07800];
  uint64_t v110 = (void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v109 = (void (**)(char *, uint64_t))(v8 + 8);
  unsigned int v108 = *MEMORY[0x263F077E0];
  uint64_t v107 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v106 = v18 + 6;
  uint64_t v105 = v18 + 4;
  uint64_t v128 = v18 + 1;
  uint64_t v104 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v103 = (char *)v144 + 8;
  *(void *)&long long v24 = 136315138;
  long long v102 = v24;
  long long v95 = xmmword_24C981A80;
  uint64_t v101 = MEMORY[0x263F8EE58] + 8;
  unint64_t v88 = isUniquelyReferenced_nonNull_native;
  uint64_t v8 = v127;
  uint64_t v130 = v22;
  uint64_t v92 = v25;
  while (1)
  {
    if (v93)
    {
      unint64_t v27 = v26;
      uint64_t v28 = MEMORY[0x253302A70](v26, isUniquelyReferenced_nonNull_native);
      BOOL v29 = __OFADD__(v27, 1);
      uint64_t v4 = v27 + 1;
      if (v29) {
        goto LABEL_59;
      }
    }
    else
    {
      if (v26 >= *(void *)(v87 + 16)) {
        goto LABEL_61;
      }
      uint64_t v28 = *(void *)(v86 + 8 * v26);
      unint64_t v30 = v26;
      swift_retain();
      BOOL v29 = __OFADD__(v30, 1);
      uint64_t v4 = v30 + 1;
      if (v29)
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_24C980A60();
        if (!v25) {
          goto LABEL_63;
        }
        goto LABEL_3;
      }
    }
    uint64_t v100 = v4;
    uint64_t v6 = v28;
    sub_24C9804A0();
    sub_24C9800A0();
    if ((_s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0(v22, v129) & 1) == 0) {
      break;
    }
    ((void (*)(uint64_t, uint64_t))v128->isa)(v22, v8);
    swift_release();
LABEL_5:
    unint64_t v26 = v100;
    if (v100 == v92) {
      return swift_bridgeObjectRelease();
    }
  }
  uint64_t v4 = *(void *)(v90 + v89);
  if (!((unint64_t)v4 >> 62))
  {
    char isUniquelyReferenced_nonNull_native = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_15;
    }
    goto LABEL_55;
  }
  if (v4 < 0) {
    uint64_t v6 = *(void *)(v90 + v89);
  }
  else {
    uint64_t v6 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = sub_24C980A60();
  swift_bridgeObjectRelease();
  if (!isUniquelyReferenced_nonNull_native)
  {
LABEL_55:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v22 = v130;
    uint64_t v8 = v127;
    ((void (*)(uint64_t, uint64_t))v128->isa)(v130, v127);
    char isUniquelyReferenced_nonNull_native = v88;
    goto LABEL_5;
  }
LABEL_15:
  uint64_t v31 = v85[1];
  uint64_t v94 = *v85;
  unint64_t v139 = v4 & 0xC000000000000001;
  uint64_t v22 = 4;
  uint64_t v126 = v28;
  unint64_t v132 = isUniquelyReferenced_nonNull_native;
  uint64_t v133 = v31;
  uint64_t v125 = v4;
  while (1)
  {
    uint64_t v6 = v22 - 4;
    if (v139)
    {
      uint64_t v32 = MEMORY[0x253302A70](v22 - 4, v4);
      uint64_t v33 = v22 - 3;
      if (__OFADD__(v6, 1)) {
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v32 = swift_retain();
      uint64_t v33 = v22 - 3;
      if (__OFADD__(v6, 1))
      {
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
    }
    uint64_t v143 = v33;
    uint64_t v6 = *(void *)(v32 + 24);
    uint64_t v8 = *(void *)(v32 + 32);
    int v140 = *(unsigned __int8 *)(v32 + 16);
    uint64_t v10 = v32;
    uint64_t v18 = (v8 + 16);
    uint64_t v16 = *(char **)(v8 + 16);
    swift_bridgeObjectRetain();
    if ((((uint64_t (*)(uint64_t, uint64_t, uint64_t))v16)(v28, v6, v8) & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    uint64_t v138 = v10;
    unint64_t v34 = sub_24C980480();
    unint64_t v35 = sub_24C968268(v34, MEMORY[0x263F39658], &qword_2697FEE30, &qword_2697FEE28, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_24C96BB24);
    unint64_t v36 = sub_24C96BE4C(v35);
    uint64_t v137 = v37;
    swift_bridgeObjectRelease();
    unint64_t v38 = sub_24C980490();
    uint64_t v39 = (void (*)(void))MEMORY[0x263F396D0];
    unint64_t v40 = sub_24C968268(v38, MEMORY[0x263F396D0], &qword_2697FEE20, &qword_2697FEE18, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_24C96BB90);
    uint64_t v134 = sub_24C96C4E8(v40);
    char v42 = v41;
    swift_bridgeObjectRelease();
    unint64_t v43 = sub_24C980490();
    unint64_t v44 = sub_24C968268(v43, v39, &qword_2697FEE20, &qword_2697FEE18, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_24C96BB90);
    uint64_t v45 = sub_24C96C8E4(v44);
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    uint64_t v136 = v42;
    unint64_t v135 = v36;
    if (v47)
    {
      uint64_t v142 = v47;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v48 = v98;
      static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)(v130, v99, v98);
      uint64_t v49 = v97;
      if ((*v96)(v48, 1, v97) == 1)
      {
        sub_24C96CFAC(v48);
        uint64_t v45 = v94;
        uint64_t v142 = v31;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v50 = v48;
        uint64_t v51 = v91;
        sub_24C96D00C(v50, v91);
        os_log_type_t v52 = (uint64_t *)(v51 + *(int *)(v49 + 20));
        uint64_t v45 = *v52;
        uint64_t v142 = v52[1];
        swift_bridgeObjectRetain();
        sub_24C96D070(v51);
      }
    }
    unint64_t v53 = v119;
    uint64_t v54 = v120;
    (*v114)(v119, v115, v120);
    long long v55 = v121;
    uint64_t v56 = v122;
    (*v113)(v121, v111, v122);
    uint64_t v57 = v123;
    uint64_t v58 = v124;
    (*v112)(v123, v108, v124);
    id v59 = v118;
    sub_24C980200();
    (*v110)(v57, v58);
    (*v109)(v55, v56);
    (*v107)(v53, v54);
    uint64_t v60 = v127;
    if (((unint64_t (*)(char *, uint64_t, uint64_t))v106->isa)(v59, 1, v127) == 1) {
      break;
    }
    uint64_t v61 = v116;
    ((void (*)(char *, char *, uint64_t))v105->isa)(v116, v59, v60);
    sub_24C9800B0();
    uint64_t v63 = v62;
    ((void (*)(char *, uint64_t))v128->isa)(v61, v60);
    LODWORD(v147) = 1;
    *((void *)&v147 + 1) = v63;
    uint64_t v4 = v142;
    *(void *)&long long v148 = v45;
    *((void *)&v148 + 1) = v142;
    uint64_t v10 = v137;
    *(void *)&long long v149 = v135;
    *((void *)&v149 + 1) = v137;
    uint64_t v16 = v136;
    *(void *)&long long v150 = v134;
    *((void *)&v150 + 1) = v136;
    char v151 = v140;
    uint64_t v64 = v131;
    sub_24C980460();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v18 = sub_24C980700();
    os_log_type_t v65 = sub_24C980920();
    if (os_log_type_enabled(v18, v65))
    {
      char v66 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)char v66 = v102;
      uint64_t v146 = v67;
      v144[2] = v149;
      v144[3] = v150;
      char v145 = v151;
      v144[0] = v147;
      v144[1] = v148;
      uint64_t v68 = AggregationKeys.description.getter();
      *(void *)&v144[0] = sub_24C95F060(v68, v69, &v146);
      sub_24C980950();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24C953000, v18, v65, "Updating key for %s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253303270](v67, -1, -1);
      uint64_t v70 = v66;
      uint64_t v4 = v142;
      MEMORY[0x253303270](v70, -1, -1);

      (*v104)(v131, v117);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*v104)(v64, v117);
    }
    uint64_t v28 = v126;
    char isUniquelyReferenced_nonNull_native = v132;
    uint64_t v31 = v133;
    uint64_t v8 = v138;
    uint64_t v71 = *(void *)v141;
    if (*(void *)(*(void *)v141 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v72 = sub_24C969DD4((double *)&v147);
      if (v73)
      {
        uint64_t v18 = v4;
        uint64_t v4 = *(unsigned int *)(*(void *)(v71 + 56) + 16 * v72);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = v141;
        uint64_t v75 = sub_24C968488(v144, (double *)&v147);
        if (*(unsigned char *)(v74 + 16))
        {
          ((void (*)(_OWORD *, void))v75)(v144, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v4 == -1) {
            goto LABEL_60;
          }
          *(_DWORD *)uint64_t v74 = v4 + 1;
          ((void (*)(_OWORD *, void))v75)(v144, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v4 = v125;
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v144[0] = *(void *)v141;
    uint64_t v6 = *(void *)&v144[0];
    *(void *)uint64_t v141 = 0x8000000000000000;
    unint64_t v77 = sub_24C969DD4((double *)&v147);
    uint64_t v78 = *(void *)(v6 + 16);
    BOOL v79 = (v76 & 1) == 0;
    uint64_t v80 = v78 + v79;
    if (__OFADD__(v78, v79)) {
      goto LABEL_58;
    }
    char v81 = v76;
    if (*(void *)(v6 + 24) >= v80)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_24C96ACDC();
      }
    }
    else
    {
      sub_24C96A324(v80, isUniquelyReferenced_nonNull_native);
      unint64_t v82 = sub_24C969DD4((double *)&v147);
      if ((v81 & 1) != (v83 & 1)) {
        goto LABEL_67;
      }
      unint64_t v77 = v82;
    }
    char isUniquelyReferenced_nonNull_native = v132;
    uint64_t v6 = *(void *)&v144[0];
    if (v81)
    {
      *(_OWORD *)(*(void *)(*(void *)&v144[0] + 56) + 16 * v77) = v95;
    }
    else
    {
      sub_24C96EAC4(v77, (uint64_t)&v147, 1, 0, *(void **)&v144[0]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v18 = v4;
    *(void *)uint64_t v141 = v6;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = v125;
    uint64_t v31 = v133;
LABEL_17:
    ++v22;
    if (v143 == isUniquelyReferenced_nonNull_native) {
      goto LABEL_55;
    }
  }
  __break(1u);
LABEL_67:
  uint64_t result = sub_24C980BA0();
  __break(1u);
  return result;
}

unint64_t sub_24C968268(unint64_t a1, void (*a2)(void), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v5 = a1;
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0) {
    goto LABEL_39;
  }
  uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  unint64_t v20 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_4:
  if ((v6 & 0x4000000000000000) == 0)
  {
    uint64_t v7 = *(void *)(v6 + 16);
    swift_bridgeObjectRelease();
    unint64_t v8 = (unint64_t)v7 >> 1;
    goto LABEL_6;
  }
  while (1)
  {
    swift_retain();
    uint64_t v7 = sub_24C980A60();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v19 = v7 >= 0 ? v7 : v7 + 1;
    if (v7 < -1) {
      __break(1u);
    }
    unint64_t v8 = v19 >> 1;
LABEL_6:
    if ((unint64_t)(v7 + 1) < 3) {
      return v6;
    }
    unint64_t v9 = 0;
    while (1)
    {
      unint64_t v10 = v9 + 1;
      unint64_t v5 = v7 - (v9 + 1);
      if (__OFSUB__(v7, v9 + 1)) {
        break;
      }
      if (v9 != v5)
      {
        unint64_t v11 = v20;
        if ((v20 & 0xC000000000000001) != 0)
        {
          uint64_t v13 = MEMORY[0x253302A70](v9, v20);
          uint64_t v14 = MEMORY[0x253302A70](v7 - (v9 + 1), v20);
        }
        else
        {
          if ((v9 & 0x8000000000000000) != 0) {
            goto LABEL_33;
          }
          unint64_t v12 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v9 >= v12) {
            goto LABEL_34;
          }
          uint64_t v13 = *(void *)(v20 + 8 * v9 + 32);
          swift_retain();
          if ((v5 & 0x8000000000000000) != 0) {
            goto LABEL_35;
          }
          if (v5 >= v12) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v20 + 32 + 8 * v5);
          swift_retain();
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v20 & 0x8000000000000000) != 0
          || (v20 & 0x4000000000000000) != 0)
        {
          sub_24C96B594(v20);
          unint64_t v11 = v15;
          unint64_t v20 = v15;
        }
        swift_release();
        *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * v9 + 0x20) = v14;
        sub_24C980870();
        unint64_t v16 = v20;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v20 & 0x8000000000000000) != 0
          || (v20 & 0x4000000000000000) != 0)
        {
          sub_24C96B594(v20);
          unint64_t v16 = v17;
          unint64_t v20 = v17;
        }
        if ((v5 & 0x8000000000000000) != 0) {
          goto LABEL_36;
        }
        if (v5 >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_38;
        }
        swift_release();
        *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20) = v13;
        sub_24C980870();
      }
      unint64_t v9 = v10;
      if (v8 == v10) {
        return v20;
      }
    }
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
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    uint64_t v6 = (uint64_t)sub_24C96B610(v5, a2, a3, a4, a5);
    unint64_t v20 = v6;
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
  }
}

void (*sub_24C968488(void *a1, double *a2))(void *a1)
{
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  v4[4] = a2;
  sub_24C96D0CC((uint64_t)a2);
  v4[5] = sub_24C96B23C(v4, a2);
  return sub_24C9684F8;
}

void sub_24C9684F8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  uint64_t v2 = *(void *)(*a1 + 32);
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  sub_24C96D118(v2);
  free(v1);
}

uint64_t sub_24C96854C(void (**a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v112 = a3;
  uint64_t v102 = a2;
  uint64_t v101 = sub_24C9801E0();
  unint64_t v115 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  uint64_t v100 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_24C9801F0();
  unint64_t v5 = *(void **)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  uint64_t v98 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_24C9801C0();
  uint64_t v7 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v96 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE08);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DateAndLocalePair();
  unint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v73 = (uint64_t)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24C9800F0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  long long v95 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unsigned int v108 = (char *)&v64 - v23;
  MEMORY[0x270FA5388](v22);
  char v66 = (char *)&v64 - v24;
  uint64_t v94 = v15;
  if ((unint64_t)a1 >> 62)
  {
LABEL_65:
    swift_bridgeObjectRetain();
    uint64_t v15 = v94;
    uint64_t v25 = sub_24C980A60();
  }
  else
  {
    uint64_t v25 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v65 = v25;
  if (!v25)
  {
    return swift_bridgeObjectRelease();
  }
  uint64_t v104 = v70 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  uint64_t v69 = OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calculationTasks;
  uint64_t v91 = (uint64_t *)(v70 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_defaultLocale);
  unint64_t v72 = (unint64_t)a1 & 0xC000000000000001;
  uint64_t v68 = (unint64_t)a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v67 = a1 + 4;
  uint64_t v103 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v90 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  unint64_t v16 = 0;
  unsigned int v89 = *MEMORY[0x263F07780];
  unint64_t v88 = (void (**)(char *, void, uint64_t))(v7 + 104);
  unsigned int v87 = *MEMORY[0x263F07800];
  unint64_t v86 = (void (**)(char *, void, uint64_t))(v5 + 13);
  unsigned int v85 = *MEMORY[0x263F077E0];
  id v84 = (void (**)(char *, void, uint64_t))(v115 + 104);
  char v83 = (void (**)(char *, uint64_t))(v115 + 8);
  unint64_t v82 = (void (**)(char *, uint64_t))(v5 + 1);
  char v81 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v80 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  BOOL v79 = (void (**)(char *, uint64_t, uint64_t))(v19 + 32);
  uint64_t v78 = "with negative count";
  unint64_t v77 = 0x800000024C986E30;
  uint64_t v106 = "ODMSIRIUIVIEWMODE_UNKNOWN";
  unint64_t v76 = 0x800000024C986E50;
  long long v74 = xmmword_24C981A90;
  uint64_t v93 = v11;
  uint64_t v75 = isUniquelyReferenced_nonNull_native;
  uint64_t v92 = v18;
  uint64_t v7 = (uint64_t)v108;
  uint64_t v19 = (uint64_t)v66;
  uint64_t v11 = v65;
  uint64_t v64 = (unint64_t *)a1;
  while (1)
  {
    while (1)
    {
      if (v72)
      {
        uint64_t v105 = MEMORY[0x253302A70](v16, a1);
        BOOL v26 = __OFADD__(v16++, 1);
        if (v26) {
          goto LABEL_62;
        }
      }
      else
      {
        if (v16 >= *(void *)(v68 + 16)) {
          goto LABEL_64;
        }
        uint64_t v105 = v67[v16];
        swift_retain();
        BOOL v26 = __OFADD__(v16++, 1);
        if (v26)
        {
LABEL_62:
          __break(1u);
LABEL_63:
          __break(1u);
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
      }
      unint64_t v5 = (void *)v105;
      sub_24C9804A0();
      sub_24C9800A0();
      if ((_s11DeepThought10CustomDateO15isTodayOrFuture4date8calendarSb10Foundation0D0V_AG8CalendarVtFZ_0(v19, v104) & 1) == 0) {
        break;
      }
      (*v103)(v19, v18);
      swift_release();
      if (v16 == v11) {
        return swift_bridgeObjectRelease();
      }
    }
    unint64_t v111 = *(void *)(v70 + v69);
    unint64_t v27 = v111;
    if (v111 >> 62)
    {
      swift_bridgeObjectRetain_n();
      unint64_t v27 = v111;
      unint64_t v5 = (void *)sub_24C980A60();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v5 = *(void **)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    unint64_t v71 = v16;
    if (v5) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v16 = (unint64_t)*v103;
LABEL_52:
    ((void (*)(uint64_t, uint64_t))v16)(v19, v18);
    unint64_t v16 = v71;
    if (v71 == v11) {
      return swift_bridgeObjectRelease();
    }
  }
  unint64_t v110 = v27 & 0xC000000000000001;
  uint64_t v11 = 4;
  a1 = v103;
  uint64_t v19 = v105;
  uint64_t v109 = v5;
  while (1)
  {
    unint64_t v5 = (void *)(v11 - 4);
    if (v110)
    {
      uint64_t v28 = MEMORY[0x253302A70](v11 - 4, v27);
      unint64_t v16 = v11 - 3;
      if (__OFADD__(v5, 1)) {
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v28 = *(void *)(v27 + 8 * v11);
      swift_retain();
      unint64_t v16 = v11 - 3;
      if (__OFADD__(v5, 1))
      {
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
    }
    sub_24C9804A0();
    sub_24C9800A0();
    uint64_t v29 = *(void *)(v28 + 32);
    int v114 = *(unsigned __int8 *)(v28 + 16);
    char v30 = (*(uint64_t (**)(uint64_t))(v29 + 8))(v19);
    unint64_t v115 = v16;
    if (v30) {
      break;
    }
    unint64_t v16 = (unint64_t)*a1;
    (*a1)(v7, v18);
    swift_release();
LABEL_48:
    unint64_t v5 = v109;
LABEL_49:
    ++v11;
    unint64_t v27 = v111;
    if ((void *)v115 == v5)
    {
      swift_bridgeObjectRelease();
      swift_release();
      a1 = (void (**)(uint64_t, uint64_t))v64;
      uint64_t v19 = (uint64_t)v66;
      uint64_t v11 = v65;
      goto LABEL_52;
    }
  }
  uint64_t v32 = *v91;
  uint64_t v31 = v91[1];
  swift_bridgeObjectRetain();
  static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)(v7, v102, isUniquelyReferenced_nonNull_native);
  if ((*v90)(isUniquelyReferenced_nonNull_native, 1, v15) == 1)
  {
    uint64_t v107 = v32;
    uint64_t v113 = v31;
    sub_24C96CFAC(isUniquelyReferenced_nonNull_native);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = v73;
    sub_24C96D00C(isUniquelyReferenced_nonNull_native, v73);
    unint64_t v34 = (uint64_t *)(v33 + *(int *)(v15 + 20));
    uint64_t v35 = v34[1];
    uint64_t v107 = *v34;
    uint64_t v113 = v35;
    swift_bridgeObjectRetain();
    sub_24C96D070(v33);
  }
  unint64_t v36 = v96;
  uint64_t v37 = v97;
  (*v88)(v96, v89, v97);
  unint64_t v38 = v98;
  uint64_t v39 = v99;
  (*v86)(v98, v87, v99);
  unint64_t v40 = v100;
  uint64_t v41 = v101;
  (*v84)(v100, v85, v101);
  uint64_t v42 = v93;
  sub_24C980200();
  (*v83)(v40, v41);
  (*v82)(v38, v39);
  (*v81)(v36, v37);
  uint64_t v18 = v92;
  if ((*v80)(v42, 1, v92) != 1)
  {
    unint64_t v43 = v95;
    (*v79)(v95, v42, v18);
    sub_24C9800B0();
    uint64_t v45 = v44;
    a1 = v103;
    unint64_t v16 = (unint64_t)*v103;
    (*v103)((uint64_t)v43, v18);
    LODWORD(v117) = 1;
    *((void *)&v117 + 1) = v45;
    uint64_t v7 = v112;
    uint64_t isUniquelyReferenced_nonNull_native = v113;
    *(void *)&long long v118 = v107;
    *((void *)&v118 + 1) = v113;
    *(void *)&long long v119 = 0xD000000000000019;
    *((void *)&v119 + 1) = v77;
    *(void *)&long long v120 = 0xD000000000000017;
    *((void *)&v120 + 1) = v76;
    char v121 = v114;
    uint64_t v46 = *(void *)v112;
    uint64_t v19 = (uint64_t)v78;
    if (*(void *)(*(void *)v112 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v47 = sub_24C969DD4((double *)&v117);
      if (v48)
      {
        int v114 = *(_DWORD *)(*(void *)(v46 + 56) + 16 * v47 + 12);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v50 = sub_24C968488(&v116, (double *)&v117);
        if ((*(unsigned char *)(v49 + 16) & 1) == 0)
        {
          uint64_t v15 = v94;
          uint64_t v7 = (uint64_t)v108;
          unint64_t v5 = v109;
          if (v114 == -1) {
            goto LABEL_63;
          }
          *(_DWORD *)(v49 + 12) = v114 + 1;
          ((void (*)(void **, void))v50)(&v116, 0);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          ((void (*)(uint64_t, uint64_t))v16)(v7, v18);
          uint64_t isUniquelyReferenced_nonNull_native = v75;
          uint64_t v19 = v105;
          goto LABEL_49;
        }
        ((void (*)(void **, void))v50)(&v116, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = v112;
    }
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v116 = *(void **)v7;
    unint64_t v5 = v116;
    *(void *)uint64_t v7 = 0x8000000000000000;
    unint64_t v52 = sub_24C969DD4((double *)&v117);
    uint64_t v53 = v5[2];
    BOOL v54 = (v51 & 1) == 0;
    uint64_t v55 = v53 + v54;
    if (__OFADD__(v53, v54)) {
      goto LABEL_60;
    }
    uint64_t v7 = v51;
    if (v5[3] < v55)
    {
      sub_24C96A324(v55, isUniquelyReferenced_nonNull_native);
      unint64_t v5 = v116;
      unint64_t v56 = sub_24C969DD4((double *)&v117);
      if ((v7 & 1) != (v57 & 1)) {
        goto LABEL_67;
      }
      unint64_t v52 = v56;
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v116;
      if ((v7 & 1) == 0) {
        goto LABEL_44;
      }
LABEL_40:
      *(_OWORD *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v52) = v74;
LABEL_46:
      *(void *)uint64_t v112 = isUniquelyReferenced_nonNull_native;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_47:
      uint64_t v7 = (uint64_t)v108;
      ((void (*)(char *, uint64_t))v16)(v108, v18);
      uint64_t isUniquelyReferenced_nonNull_native = v75;
      uint64_t v15 = v94;
      uint64_t v19 = v105;
      goto LABEL_48;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v116;
      if (v51) {
        goto LABEL_40;
      }
    }
    else
    {
      unint64_t v5 = &v116;
      sub_24C96ACDC();
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v116;
      if (v7) {
        goto LABEL_40;
      }
    }
LABEL_44:
    *(void *)(isUniquelyReferenced_nonNull_native + 8 * (v52 >> 6) + 64) |= 1 << v52;
    uint64_t v58 = *(void *)(isUniquelyReferenced_nonNull_native + 48) + 72 * v52;
    long long v59 = v120;
    *(_OWORD *)(v58 + 32) = v119;
    *(_OWORD *)(v58 + 48) = v59;
    *(unsigned char *)(v58 + 64) = v121;
    long long v60 = v118;
    *(_OWORD *)uint64_t v58 = v117;
    *(_OWORD *)(v58 + 16) = v60;
    *(_OWORD *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 16 * v52) = v74;
    uint64_t v61 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
    BOOL v26 = __OFADD__(v61, 1);
    uint64_t v62 = v61 + 1;
    if (v26) {
      goto LABEL_61;
    }
    *(void *)(isUniquelyReferenced_nonNull_native + 16) = v62;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_46;
  }
  __break(1u);
LABEL_67:
  uint64_t result = sub_24C980BA0();
  __break(1u);
  return result;
}

uint64_t SiriPenetrationRateCalculator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  uint64_t v4 = sub_24C980250();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateCalculator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought29SiriPenetrationRateCalculator_calendar;
  uint64_t v4 = sub_24C980250();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_24C9695F4(uint64_t a1, uint64_t *a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24C9696A0;
  return sub_24C966538(a1, a2);
}

uint64_t sub_24C9696A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24C969798(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24C969910(a1, a2, a3, a4, &qword_2697FEE38, (uint64_t (*)(void))type metadata accessor for DateAndLocalePair, (uint64_t (*)(void))type metadata accessor for DateAndLocalePair);
}

void *sub_24C9697CC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE10);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24C96BD58(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C9698DC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24C969910(a1, a2, a3, a4, &qword_2697FEDF8, type metadata accessor for eventStreamMetadata, type metadata accessor for eventStreamMetadata);
}

uint64_t sub_24C969910(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_24C980A40();
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
    sub_24C96CBC4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_24C969B90(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24C969910(a1, a2, a3, a4, &qword_2697FEDF0, type metadata accessor for conversationStreamMetadata, type metadata accessor for conversationStreamMetadata);
}

void *sub_24C969BC4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE00);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4]) {
          memmove(v12, a4 + 4, 88 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24C96CAD0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_24C969CEC(uint64_t a1, uint64_t a2)
{
  sub_24C980BC0();
  sub_24C980800();
  uint64_t v4 = sub_24C980C00();
  return sub_24C969EE8(a1, a2, v4);
}

unint64_t sub_24C969D64(uint64_t a1)
{
  sub_24C980BC0();
  sub_24C9806F0();
  sub_24C980BD0();
  uint64_t v2 = sub_24C980C00();
  return sub_24C969FCC(a1, v2);
}

unint64_t sub_24C969DD4(double *a1)
{
  sub_24C980BC0();
  AggregationKeys.hash(into:)();
  uint64_t v2 = sub_24C980C00();
  return sub_24C96A0B8(a1, v2);
}

unint64_t sub_24C969E58(int a1, double a2)
{
  sub_24C980BC0();
  sub_24C980BE0();
  sub_24C980BF0();
  uint64_t v4 = sub_24C980C00();
  return sub_24C96A2AC(a1, v4, a2);
}

unint64_t sub_24C969EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24C980B90() & 1) == 0)
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
      while (!v14 && (sub_24C980B90() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24C969FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v6 = sub_24C9806F0();
    if (v6 != sub_24C9806F0())
    {
      uint64_t v7 = ~v4;
      for (unint64_t i = (i + 1) & v7; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v7)
      {
        uint64_t v8 = sub_24C9806F0();
        if (v8 == sub_24C9806F0()) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_24C96A0B8(double *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = ~v4;
    uint64_t v7 = *(void *)(v2 + 48);
    int v8 = *(_DWORD *)a1;
    double v9 = a1[1];
    long long v21 = *((_OWORD *)a1 + 1);
    long long v22 = *((_OWORD *)a1 + 2);
    long long v23 = *((_OWORD *)a1 + 3);
    v24[0] = *((unsigned char *)a1 + 64);
    sub_24C96D164((uint64_t)v24, (uint64_t)&v25);
    do
    {
      uint64_t v10 = v7 + 72 * v5;
      if (*(_DWORD *)v10 == v8 && *(double *)(v10 + 8) == v9)
      {
        uint64_t v13 = *(void *)(v10 + 32);
        uint64_t v12 = *(void *)(v10 + 40);
        uint64_t v14 = *(void *)(v10 + 48);
        uint64_t v15 = *(void *)(v10 + 56);
        int v16 = *(unsigned __int8 *)(v10 + 64);
        BOOL v17 = *(void *)(v10 + 16) == (void)v21 && *(void *)(v10 + 24) == *((void *)&v21 + 1);
        if (v17 || (sub_24C980B90() & 1) != 0)
        {
          BOOL v18 = v13 == (void)v22 && v12 == *((void *)&v22 + 1);
          if (v18 || (sub_24C980B90() & 1) != 0)
          {
            BOOL v19 = v14 == (void)v23 && v15 == *((void *)&v23 + 1);
            if (v19 || (sub_24C980B90() & 1) != 0)
            {
              if (v16)
              {
                if (v16 == 1)
                {
                  sub_24C96D164((uint64_t)&v25, (uint64_t)&v27);
                  if (v27 == 1) {
                    return v5;
                  }
                }
                else
                {
                  sub_24C96D164((uint64_t)&v25, (uint64_t)&v28);
                  if (v28 == 2) {
                    return v5;
                  }
                }
              }
              else
              {
                sub_24C96D164((uint64_t)&v25, (uint64_t)&v26);
                if (!v26) {
                  return v5;
                }
              }
            }
          }
        }
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_24C96A2AC(int a1, uint64_t a2, double a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    do
    {
      uint64_t v8 = *(void *)(v3 + 48) + 16 * result;
      if (*(double *)(v8 + 8) == a3 && *(_DWORD *)v8 == a1) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_24C96A324(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB20);
  char v40 = a2;
  uint64_t v5 = sub_24C980A80();
  uint64_t v6 = (void *)v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    unint64_t v36 = (void *)(v4 + 64);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v4 + 64);
    int64_t v35 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v38 = v5 + 64;
    unint64_t result = swift_retain();
    int64_t v11 = 0;
    uint64_t v39 = v4;
    uint64_t v37 = v6;
    while (1)
    {
      if (v9)
      {
        uint64_t v41 = (v9 - 1) & v9;
        int64_t v42 = v11;
        unint64_t v14 = __clz(__rbit64(v9)) | (v11 << 6);
      }
      else
      {
        int64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v15 >= v35) {
          goto LABEL_23;
        }
        unint64_t v16 = v36[v15];
        int64_t v17 = v11 + 1;
        if (!v16)
        {
          int64_t v17 = v11 + 2;
          if (v11 + 2 >= v35) {
            goto LABEL_23;
          }
          unint64_t v16 = v36[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 3;
            if (v11 + 3 >= v35)
            {
LABEL_23:
              swift_release();
              if (v40)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v4 + 32);
                if (v33 > 63) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v36 = -1 << v33;
                }
                *(void *)(v4 + 16) = 0;
              }
              break;
            }
            unint64_t v16 = v36[v18];
            if (!v16)
            {
              while (1)
              {
                int64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_30;
                }
                if (v17 >= v35) {
                  goto LABEL_23;
                }
                unint64_t v16 = v36[v17];
                ++v18;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v17 = v11 + 3;
          }
        }
LABEL_20:
        uint64_t v41 = (v16 - 1) & v16;
        int64_t v42 = v17;
        unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      uint64_t v19 = *(void *)(v4 + 56);
      uint64_t v20 = *(void *)(v4 + 48) + 72 * v14;
      int v21 = *(_DWORD *)v20;
      uint64_t v22 = *(void *)(v20 + 8);
      uint64_t v23 = *(void *)(v20 + 16);
      uint64_t v25 = *(void *)(v20 + 24);
      uint64_t v24 = *(void *)(v20 + 32);
      uint64_t v26 = *(void *)(v20 + 40);
      uint64_t v27 = *(void *)(v20 + 48);
      uint64_t v28 = *(void *)(v20 + 56);
      char v29 = *(unsigned char *)(v20 + 64);
      char v30 = (uint64_t *)(v19 + 16 * v14);
      uint64_t v32 = *v30;
      uint64_t v31 = v30[1];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_24C980BC0();
      sub_24C980BE0();
      sub_24C980BF0();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24C980800();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C980800();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C980800();
      swift_bridgeObjectRelease();
      sub_24C980BD0();
      sub_24C980BD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24C980C00();
      uint64_t v6 = v37;
      unint64_t result = sub_24C980990();
      *(void *)(v38 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      uint64_t v12 = v37[6] + 72 * result;
      *(_DWORD *)uint64_t v12 = v21;
      *(void *)(v12 + 8) = v22;
      *(void *)(v12 + 16) = v23;
      *(void *)(v12 + 24) = v25;
      *(void *)(v12 + 32) = v24;
      *(void *)(v12 + 40) = v26;
      *(void *)(v12 + 48) = v27;
      *(void *)(v12 + 56) = v28;
      *(unsigned char *)(v12 + 64) = v29;
      uint64_t v13 = (void *)(v37[7] + 16 * result);
      *uint64_t v13 = v32;
      v13[1] = v31;
      ++v37[2];
      uint64_t v4 = v39;
      unint64_t v9 = v41;
      int64_t v11 = v42;
    }
  }
  unint64_t result = swift_release();
  *unint64_t v34 = v6;
  return result;
}

uint64_t sub_24C96A6CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB28);
  char v34 = a2;
  uint64_t result = sub_24C980A80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(v5 + 48) + 16 * v19;
      int v28 = *(_DWORD *)v27;
      uint64_t v29 = *(void *)(v27 + 8);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_24C980BC0();
      sub_24C980BE0();
      sub_24C980BF0();
      uint64_t result = sub_24C980C00();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = *(void *)(v7 + 48) + 16 * v16;
      *(_DWORD *)uint64_t v17 = v28;
      *(void *)(v17 + 8) = v29;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24C96A9CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB18);
  char v38 = a2;
  uint64_t v6 = sub_24C980A80();
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
  int64_t v35 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24C980BC0();
    sub_24C980800();
    uint64_t result = sub_24C980C00();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_24C96ACDC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C980A70();
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
    int64_t v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      int64_t v9 = v29 + 1;
      if (v29 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v30 = *(void *)(v6 + 8 * v9);
      if (!v30) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v30 - 1) & v30;
    unint64_t v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 72 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 72 * v15;
    int v18 = *(_DWORD *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v21 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v17 + 24);
    uint64_t v22 = *(void *)(v17 + 32);
    uint64_t v23 = *(void *)(v17 + 40);
    uint64_t v24 = *(void *)(v17 + 48);
    uint64_t v25 = *(void *)(v17 + 56);
    LOBYTE(v17) = *(unsigned char *)(v17 + 64);
    uint64_t v26 = 16 * v15;
    uint64_t v27 = *(void *)(v4 + 48) + v16;
    long long v28 = *(_OWORD *)(*(void *)(v2 + 56) + v26);
    *(_DWORD *)uint64_t v27 = v18;
    *(void *)(v27 + 8) = v19;
    *(void *)(v27 + 16) = v21;
    *(void *)(v27 + 24) = v20;
    *(void *)(v27 + 32) = v22;
    *(void *)(v27 + 40) = v23;
    *(void *)(v27 + 48) = v24;
    *(void *)(v27 + 56) = v25;
    *(unsigned char *)(v27 + 64) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v26) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v31 = v29 + 2;
  if (v31 >= v13) {
    goto LABEL_26;
  }
  unint64_t v30 = *(void *)(v6 + 8 * v31);
  if (v30)
  {
    int64_t v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v9);
    ++v31;
    if (v30) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24C96AED0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C980A70();
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
    uint64_t v17 = *(void *)(v2 + 48) + 16 * v15;
    uint64_t v18 = *(void *)(v17 + 8);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    *(_DWORD *)uint64_t v21 = *(_DWORD *)v17;
    *(void *)(v21 + 8) = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

id sub_24C96B088()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C980A70();
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
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

void (*sub_24C96B23C(void *a1, double *a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x58uLL);
  *a1 = v4;
  v4[8] = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24C96D0CC((uint64_t)a2);
  v4[9] = sub_24C96B558(v4);
  v4[10] = sub_24C96B34C(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_24C96B2D8;
}

void sub_24C96B2D8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  uint64_t v3 = *(void *)(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 80))();
  sub_24C96D118(v3);
  v2(v1, 0);
  free(v1);
}

void (*sub_24C96B34C(void *a1, double *a2, char a3))(uint64_t a1)
{
  uint64_t v4 = v3;
  uint64_t v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[3] = a2;
  v8[4] = v3;
  uint64_t v9 = *v3;
  unint64_t v11 = sub_24C969DD4(a2);
  *((unsigned char *)v8 + 17) = v10 & 1;
  uint64_t v12 = *(void *)(v9 + 16);
  char v13 = v10 ^ 1;
  uint64_t v14 = v12 + ((v10 ^ 1) & 1);
  if (__OFADD__(v12, (v10 ^ 1) & 1))
  {
    __break(1u);
  }
  else
  {
    unsigned __int8 v15 = v10;
    uint64_t v16 = *(void *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[5] = v11;
      if (v15)
      {
LABEL_8:
        uint64_t v17 = (uint64_t *)(*(void *)(*v4 + 56) + 16 * v11);
        uint64_t v18 = *v17;
        uint64_t v19 = v17[1];
LABEL_12:
        *uint64_t v8 = v18;
        v8[1] = v19;
        *((unsigned char *)v8 + 16) = v13 & 1;
        return sub_24C96B494;
      }
LABEL_11:
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_24C96ACDC();
      goto LABEL_7;
    }
    sub_24C96A324(v14, a3 & 1);
    unint64_t v20 = sub_24C969DD4(a2);
    if ((v15 & 1) == (v21 & 1))
    {
      unint64_t v11 = v20;
      v8[5] = v20;
      if (v15) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  id result = (void (*)(uint64_t))sub_24C980BA0();
  __break(1u);
  return result;
}

void sub_24C96B494(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 17);
  if (*(unsigned char *)(*(void *)a1 + 16))
  {
    if (*(unsigned char *)(*(void *)a1 + 17))
    {
      unint64_t v3 = *((void *)v1 + 5);
      uint64_t v4 = **((void **)v1 + 4);
      swift_arrayDestroy();
      sub_24C96EC04(v3, v4);
    }
  }
  else
  {
    uint64_t v5 = *(void *)v1;
    uint64_t v6 = *((void *)v1 + 1);
    uint64_t v8 = (void **)*((void *)v1 + 4);
    unint64_t v7 = *((void *)v1 + 5);
    if (v2)
    {
      uint64_t v9 = (uint64_t *)((*v8)[7] + 16 * v7);
      *uint64_t v9 = v5;
      v9[1] = v6;
    }
    else
    {
      uint64_t v10 = *((void *)v1 + 3);
      sub_24C96EAC4(v7, v10, v5, v6, *v8);
      sub_24C96D0CC(v10);
    }
  }
  free(v1);
}

uint64_t (*sub_24C96B558(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_24C96B588;
}

uint64_t sub_24C96B588(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

void sub_24C96B594(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24C980A60();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x253302A80);
}

void *sub_24C96B610(unint64_t a1, void (*a2)(void), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v10 <= 0)
    {
      unint64_t v11 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA60);
      unint64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v10;
      v11[3] = (2 * (v13 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_24C96B900((unint64_t)(v11 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v14;
    swift_bridgeObjectRelease();
    if (a5 == (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))v10) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24C980A60();
    swift_bridgeObjectRelease();
    if (!v10) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v11;
}

uint64_t sub_24C96B738(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24C96B758(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24C96B758(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE10);
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
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

uint64_t sub_24C96B8C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_24C96B900(a1, a2, a3, MEMORY[0x263F39658], &qword_2697FEE30, &qword_2697FEE28, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_24C96BB24);
}

uint64_t sub_24C96B900(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24C980A60();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_24C980A60();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_24C96D208(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          int64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          uint64_t v24 = *v23;
          swift_retain();
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
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
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

uint64_t (*sub_24C96BB24(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24C96BC40(v6, a2, a3);
  return sub_24C96BB8C;
}

uint64_t (*sub_24C96BB90(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24C96BCC8(v6, a2, a3);
  return sub_24C96BB8C;
}

void sub_24C96BBF8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_24C96BC40(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x253302A70](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return sub_24C96BCC0;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C96BCC0()
{
  return swift_release();
}

uint64_t (*sub_24C96BCC8(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x253302A70](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *unint64_t v3 = v4;
    return sub_24C96D258;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C96BD48(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24C96BD58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

unint64_t sub_24C96BE4C(unint64_t a1)
{
  uint64_t v2 = sub_24C980720();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24C980A60();
    uint64_t v37 = v3;
    uint64_t v38 = v2;
    if (v5)
    {
LABEL_3:
      sub_24C9803E0();
      if (v5 < 1)
      {
        __break(1u);
LABEL_68:
        char v35 = sub_24C980B90();
        swift_bridgeObjectRelease();
        if (v35) {
          v2 += 6;
        }
        return v2;
      }
      uint64_t v6 = 0;
      unint64_t v7 = a1 & 0xC000000000000001;
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
      unint64_t v40 = a1;
      do
      {
        if (v7) {
          MEMORY[0x253302A70](v6, a1);
        }
        else {
          swift_retain();
        }
        sub_24C9803D0();
        sub_24C980470();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v10 = v43;
        if (v43)
        {
          uint64_t v11 = (uint64_t)v42;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_24C9697CC(0, v8[2] + 1, 1, v8);
          }
          unint64_t v13 = v8[2];
          unint64_t v12 = v8[3];
          if (v13 >= v12 >> 1) {
            uint64_t v8 = sub_24C9697CC((void *)(v12 > 1), v13 + 1, 1, v8);
          }
          v8[2] = v13 + 1;
          uint64_t v9 = &v8[2 * v13];
          void v9[4] = v11;
          v9[5] = v10;
          a1 = v40;
        }
        ++v6;
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
      uint64_t v14 = v8[2];
      if (v14) {
        goto LABEL_16;
      }
LABEL_30:
      uint64_t v16 = (void *)MEMORY[0x263F8EE78];
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v37 = v3;
    uint64_t v38 = v2;
    if (v5) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (!v14) {
    goto LABEL_30;
  }
LABEL_16:
  uint64_t v15 = v8 + 5;
  uint64_t v16 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v20 = *(v15 - 1);
    uint64_t v21 = *v15;
    if (v20) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v21 == 0xE000000000000000;
    }
    if (!v22 && (sub_24C980B90() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      int64_t v42 = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_24C96B738(0, v16[2] + 1, 1);
        uint64_t v16 = v42;
      }
      unint64_t v18 = v16[2];
      unint64_t v17 = v16[3];
      if (v18 >= v17 >> 1)
      {
        sub_24C96B738(v17 > 1, v18 + 1, 1);
        uint64_t v16 = v42;
      }
      v16[2] = v18 + 1;
      uint64_t v19 = &v16[2 * v18];
      v19[4] = v20;
      v19[5] = v21;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
LABEL_31:
  swift_bridgeObjectRelease();
  if (v16[2])
  {
    uint64_t v25 = v16[4];
    unint64_t v24 = v16[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v25 = 0;
    unint64_t v24 = 0;
  }
  uint64_t v26 = v39;
  swift_release();
  sub_24C980460();
  swift_bridgeObjectRetain_n();
  uint64_t v27 = sub_24C980700();
  os_log_type_t v28 = sub_24C980920();
  if (os_log_type_enabled(v27, v28))
  {
    int64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)int64_t v29 = 136315138;
    int64_t v42 = (void *)v30;
    uint64_t v31 = v25;
    if (v24) {
      uint64_t v32 = v25;
    }
    else {
      uint64_t v32 = 0;
    }
    if (v24) {
      unint64_t v33 = v24;
    }
    else {
      unint64_t v33 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_24C95F060(v32, v33, (uint64_t *)&v42);
    sub_24C980950();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v27, v28, "Get rawViewMode for this bucket is %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253303270](v30, -1, -1);
    MEMORY[0x253303270](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v38);
  }
  else
  {
    uint64_t v31 = v25;

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
  }
  uint64_t v2 = 0xD000000000000019;
  if (v24)
  {
    if (v31 == 48 && v24 == 0xE100000000000000 || (sub_24C980B90() & 1) != 0)
    {
LABEL_56:
      swift_bridgeObjectRelease();
      return v2;
    }
    if (v31 == 52 && v24 == 0xE100000000000000 || (sub_24C980B90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 0xD00000000000001BLL;
    }
    if (v31 == 53 && v24 == 0xE100000000000000 || (sub_24C980B90() & 1) != 0) {
      goto LABEL_56;
    }
    if (v31 == 54 && v24 == 0xE100000000000000 || (sub_24C980B90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 0xD000000000000014;
    }
    if (v31 == 55 && v24 == 0xE100000000000000 || (sub_24C980B90() & 1) != 0) {
      goto LABEL_56;
    }
    if (v31 == 56 && v24 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
      return 0xD00000000000001FLL;
    }
    goto LABEL_68;
  }
  return v2;
}

uint64_t sub_24C96C4E8(unint64_t a1)
{
  uint64_t v2 = sub_24C980720();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24C980A60();
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v26 = v3;
  uint64_t v27 = v2;
  os_log_type_t v28 = v5;
  if (v6)
  {
    uint64_t result = sub_24C980360();
    if (v6 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    unint64_t v9 = a1 & 0xC000000000000001;
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
    unint64_t v29 = a1;
    do
    {
      if (v9) {
        MEMORY[0x253302A70](v8, a1);
      }
      else {
        swift_retain();
      }
      sub_24C980350();
      sub_24C980590();
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v12 = v32;
      if (v32)
      {
        uint64_t v13 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v10 = sub_24C9697CC(0, v10[2] + 1, 1, v10);
        }
        unint64_t v15 = v10[2];
        unint64_t v14 = v10[3];
        if (v15 >= v14 >> 1) {
          uint64_t v10 = sub_24C9697CC((void *)(v14 > 1), v15 + 1, 1, v10);
        }
        v10[2] = v15 + 1;
        uint64_t v11 = &v10[2 * v15];
        v11[4] = v13;
        v11[5] = v12;
        a1 = v29;
      }
      ++v8;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v5 = v28;
    if (v10[2]) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v17 = 0;
    unint64_t v16 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v17 = v10[4];
  unint64_t v16 = v10[5];
  swift_bridgeObjectRetain();
LABEL_20:
  swift_bridgeObjectRelease();
  sub_24C980460();
  swift_bridgeObjectRetain_n();
  unint64_t v18 = sub_24C980700();
  os_log_type_t v19 = sub_24C980920();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v31 = v21;
    if (v16) {
      uint64_t v22 = v17;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = v17;
    if (v16) {
      unint64_t v24 = v16;
    }
    else {
      unint64_t v24 = 0xE000000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_24C95F060(v22, v24, &v31);
    sub_24C980950();
    swift_bridgeObjectRelease_n();
    uint64_t v17 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v18, v19, "Get audioInputRoute for this bucket is %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253303270](v21, -1, -1);
    MEMORY[0x253303270](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  }
  if (v16) {
    return v17;
  }
  else {
    return 0xD000000000000017;
  }
}

uint64_t sub_24C96C8E4(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_16:
      uint64_t v9 = v5[4];
      swift_bridgeObjectRetain();
LABEL_20:
      swift_bridgeObjectRelease();
      return v9;
    }
LABEL_19:
    uint64_t v9 = 0;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_24C980A60();
  if (!v2) {
    goto LABEL_18;
  }
LABEL_3:
  uint64_t result = sub_24C980380();
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    uint64_t v10 = v2;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        MEMORY[0x253302A70](v4, a1);
      }
      else {
        swift_retain();
      }
      sub_24C980370();
      sub_24C980590();
      swift_release();
      swift_bridgeObjectRelease();
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_24C9697CC(0, v5[2] + 1, 1, v5);
        }
        unint64_t v8 = v5[2];
        unint64_t v7 = v5[3];
        if (v8 >= v7 >> 1) {
          uint64_t v5 = sub_24C9697CC((void *)(v7 > 1), v8 + 1, 1, v5);
        }
        v5[2] = v8 + 1;
        uint64_t v6 = &v5[2 * v8];
        v6[4] = v11;
        v6[5] = v12;
        uint64_t v2 = v10;
      }
      ++v4;
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    if (v5[2]) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C96CAD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 88 * a1 + 32;
    unint64_t v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

uint64_t sub_24C96CBC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_24C980AA0();
  __break(1u);
  return result;
}

uint64_t sub_24C96CD20()
{
  return type metadata accessor for SiriPenetrationRateCalculator();
}

uint64_t type metadata accessor for SiriPenetrationRateCalculator()
{
  uint64_t result = qword_2697FEDD8;
  if (!qword_2697FEDD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C96CD74()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C980250();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateCalculator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateCalculator);
}

uint64_t dispatch thunk of SiriPenetrationRateCalculator.__allocating_init(calculationTasks:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SiriPenetrationRateCalculator.doWork(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 136) + **(int **)(*(void *)v2 + 136));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unint64_t v6 = v3;
  v6[1] = sub_24C95F9C4;
  return v8(a1, a2);
}

uint64_t sub_24C96CFAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C96D00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C96D070(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C96D0CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24C96D118(uint64_t a1)
{
  return a1;
}

uint64_t sub_24C96D164(uint64_t a1, uint64_t a2)
{
  return a2;
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

uint64_t sub_24C96D208(unint64_t *a1, uint64_t *a2)
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

uint64_t SiriPenetrationRateCoreAnalyticsReporter.__allocating_init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  uint64_t v6 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  uint64_t v7 = v4 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  uint64_t v8 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  return v4;
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.init(_:odmId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  uint64_t v6 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  uint64_t v7 = v2 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  uint64_t v8 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  return v2;
}

uint64_t sub_24C96D3F0(uint64_t *a1)
{
  v2[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE988);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *a1;
  v2[10] = v4;
  v2[11] = v5;
  return MEMORY[0x270FA2498](sub_24C96D48C, 0, 0);
}

uint64_t sub_24C96D48C()
{
  char v57 = v0;
  uint64_t v1 = v0 + 2;
  uint64_t v51 = v0 + 8;
  uint64_t v2 = v0[11];
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v46 = v2 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & v3;
  int64_t v47 = (unint64_t)(63 - v5) >> 6;
  uint64_t v48 = v0[11];
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  unint64_t v52 = v0;
  while (v6)
  {
    unint64_t v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_21:
    uint64_t result = *(void *)(*(void *)(v48 + 56) + 8 * v10);
    uint64_t v14 = *(void *)(result + 16);
    if (v14)
    {
      unint64_t v49 = v6;
      int64_t v50 = v8;
      swift_bridgeObjectRetain();
      uint64_t v15 = 0;
      do
      {
        uint64_t v54 = v15;
        uint64_t v55 = v14;
        uint64_t v23 = v0[10];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v24 = sub_24C97164C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24C980280();
        uint64_t v25 = sub_24C9802A0();
        uint64_t v26 = *(void *)(v25 - 8);
        int v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v23, 1, v25);
        uint64_t v28 = v0[10];
        if (v27 == 1)
        {
          sub_24C96E720(v0[10]);
          id v29 = objc_allocWithZone(MEMORY[0x263F80E10]);
          id v30 = v24;
          uint64_t v31 = (void *)sub_24C9807A0();
          uint64_t v32 = (void *)sub_24C9807A0();
          id v33 = objc_msgSend(v29, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v31, 0xFFFFFFFFLL, v32);
        }
        else
        {
          id v33 = (id)sub_24C980290();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v25);
        }
        uint64_t v34 = (void *)sub_24C9807A0();
        uint64_t v35 = swift_allocObject();
        *(void *)(v35 + 16) = v24;
        *(void *)(v35 + 24) = v33;
        v0[6] = sub_24C96E7C0;
        v0[7] = v35;
        v0[2] = MEMORY[0x263EF8330];
        v0[3] = 1107296256;
        v0[4] = sub_24C96E694;
        v0[5] = &block_descriptor;
        uint64_t v36 = _Block_copy(v1);
        id v37 = v24;
        id v38 = v33;
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v36);

        id v39 = v37;
        id v40 = v38;
        id v41 = v39;
        id v42 = v40;
        uint64_t v43 = sub_24C980700();
        os_log_type_t v44 = sub_24C980920();
        if (os_log_type_enabled(v43, v44))
        {
          unint64_t v16 = (uint8_t *)swift_slowAlloc();
          uint64_t v17 = swift_slowAlloc();
          uint64_t v56 = v17;
          *(_DWORD *)unint64_t v16 = 136315138;
          uint64_t v53 = v17;
          sub_24C96DC78();
          sub_24C96E7DC();
          unint64_t v18 = v1;
          uint64_t v19 = sub_24C980750();
          unint64_t v21 = v20;
          swift_bridgeObjectRelease();
          uint64_t v22 = v19;
          uint64_t v1 = v18;
          *uint64_t v51 = sub_24C95F060(v22, v21, &v56);
          sub_24C980950();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_24C953000, v43, v44, "CoreAnalytics Reporter: reported task with stats, eventpayload=%s", v16, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x253303270](v53, -1, -1);
          uint64_t v0 = v52;
          MEMORY[0x253303270](v16, -1, -1);
        }
        else
        {
        }
        uint64_t v15 = v54 + 88;
        uint64_t v14 = v55 - 1;
      }
      while (v55 != 1);
      uint64_t result = swift_bridgeObjectRelease();
      unint64_t v6 = v49;
      int64_t v8 = v50;
    }
  }
  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_34:
    __break(1u);
    return result;
  }
  if (v11 >= v47) {
    goto LABEL_30;
  }
  unint64_t v12 = *(void *)(v46 + 8 * v11);
  ++v8;
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v47) {
    goto LABEL_30;
  }
  unint64_t v12 = *(void *)(v46 + 8 * v8);
  if (v12) {
    goto LABEL_20;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v47) {
    goto LABEL_30;
  }
  unint64_t v12 = *(void *)(v46 + 8 * v8);
  if (v12)
  {
LABEL_20:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_21;
  }
  int64_t v13 = v11 + 3;
  if (v13 < v47)
  {
    unint64_t v12 = *(void *)(v46 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_34;
        }
        if (v8 >= v47) {
          goto LABEL_30;
        }
        unint64_t v12 = *(void *)(v46 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_20;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_20;
  }
LABEL_30:
  swift_release();
  swift_task_dealloc();
  uint64_t v45 = (uint64_t (*)(void))v0[1];
  return v45();
}

void SiriPentrationRateCoreAnalyticsPayload.init(_:_:)(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (a2)
  {
    id v5 = a2;
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x263F80E10]);
    id v7 = a1;
    int64_t v8 = (void *)sub_24C9807A0();
    unint64_t v9 = (void *)sub_24C9807A0();
    id v5 = objc_msgSend(v6, sel_initWithBMLTTaskId_deploymentId_treatmentId_, v8, 0xFFFFFFFFLL, v9);
  }
  *a3 = a1;
  a3[1] = v5;
}

uint64_t static SiriPenetrationRateCoreAnalytics.report(payload:)(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v1 = *(void **)(a1 + 8);
  uint64_t v3 = (void *)sub_24C9807A0();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  v10[4] = sub_24C96E7C0;
  v10[5] = v4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_24C96E694;
  v10[3] = &block_descriptor_7;
  id v5 = _Block_copy(v10);
  id v6 = v2;
  id v7 = v1;
  swift_release();
  uint64_t v8 = AnalyticsSendEventLazy();
  _Block_release(v5);

  return v8;
}

id sub_24C96DC78()
{
  uint64_t v1 = *(void **)v0;
  uint64_t v2 = *(void **)(v0 + 8);
  unint64_t v3 = sub_24C960E64(MEMORY[0x263F8EE78]);
  unint64_t v67 = v3;
  id v4 = objc_msgSend(v1, sel_metadata);
  if (v4 && (v5 = v4, id v6 = objc_msgSend(v4, sel_odmId), v5, v6))
  {
    sub_24C9807B0();

    uint64_t v7 = sub_24C9807A0();
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v58 = v3;
    sub_24C96F0C0(v7, 0x64494D444FLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v67 = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  id result = objc_msgSend(v2, sel_bmltTaskId, v58);
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v10 = (uint64_t)result;
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_24C96F0C0(v10, 0xD000000000000011, 0x800000024C986FC0, v11);
  unint64_t v12 = v67;
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v2, sel_treatmentId);
  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = v13;
  uint64_t v15 = sub_24C9807B0();
  unint64_t v17 = v16;

  uint64_t v18 = HIBYTE(v17) & 0xF;
  if ((v17 & 0x2000000000000000) == 0) {
    uint64_t v18 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (!v18)
  {
LABEL_10:
    id v19 = objc_msgSend(v2, sel_factorPackId, v67);
    if (!v19)
    {
      swift_bridgeObjectRelease();

      unint64_t v12 = v67;
      goto LABEL_14;
    }
    unint64_t v20 = v19;
    sub_24C9807B0();

    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24C9807A0();
  swift_bridgeObjectRelease();
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v59 = v67;
  sub_24C96F0C0(v21, 0xD000000000000010, 0x800000024C986FE0, v22);
  swift_bridgeObjectRelease();
LABEL_14:
  objc_msgSend(v2, sel_deploymentId, v59, v67);
  uint64_t v23 = sub_24C980BB0();
  char v24 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v60 = v12;
  sub_24C96F0C0(v23, 0xD000000000000011, 0x800000024C987000, v24);
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v1, sel_dimensions);
  if (v25)
  {
    uint64_t v26 = v25;
    objc_msgSend(v25, sel_productArea);

    uint64_t v27 = sub_24C980900();
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v60 = v12;
    sub_24C96F0C0(v27, 0x6465747563657865, 0xEE006E69616D6F44, v28);
    swift_bridgeObjectRelease();
  }
  id v29 = objc_msgSend(v1, sel_metadata, v60);
  if (v29)
  {
    id v30 = v29;
    objc_msgSend(v29, sel_schedule);

    uint64_t v31 = sub_24C980BB0();
    char v32 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v61 = v12;
    sub_24C96F0C0(v31, 0xD000000000000019, 0x800000024C9870D0, v32);
    swift_bridgeObjectRelease();
  }
  id v33 = objc_msgSend(v1, sel_dimensions, v61);
  if (v33)
  {
    uint64_t v34 = v33;
    id v35 = objc_msgSend(v33, sel_siriInputLocale);

    if (v35)
    {
      sub_24C9807B0();

      uint64_t v36 = sub_24C9807A0();
      swift_bridgeObjectRelease();
      char v37 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v62 = v12;
      sub_24C96F0C0(v36, 0x61636F4C69726973, 0xEA0000000000656CLL, v37);
      swift_bridgeObjectRelease();
    }
  }
  id v38 = objc_msgSend(v1, sel_metadata, v62);
  if (v38)
  {
    id v39 = v38;
    objc_msgSend(v38, sel_aggregationWindowStartTimestamp);

    uint64_t v40 = sub_24C9808E0();
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v63 = v12;
    sub_24C96F0C0(v40, 0xD000000000000024, 0x800000024C9870A0, v41);
    swift_bridgeObjectRelease();
  }
  id v42 = objc_msgSend(v1, sel_statistics, v63);
  if (v42)
  {
    uint64_t v43 = v42;
    objc_msgSend(v42, sel_completedSystemTasks);

    uint64_t v44 = sub_24C980C10();
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v64 = v12;
    sub_24C96F0C0(v44, 0xD000000000000019, 0x800000024C987080, v45);
    swift_bridgeObjectRelease();
  }
  id v46 = objc_msgSend(v1, sel_statistics, v64);
  if (v46)
  {
    int64_t v47 = v46;
    objc_msgSend(v46, sel_failedSystemTasks);

    uint64_t v48 = sub_24C980C10();
    char v49 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v65 = v12;
    sub_24C96F0C0(v48, 0xD000000000000016, 0x800000024C987060, v49);
    swift_bridgeObjectRelease();
  }
  id v50 = objc_msgSend(v1, sel_statistics, v65);
  if (v50)
  {
    uint64_t v51 = v50;
    objc_msgSend(v50, sel_cancelledSystemTasks);

    uint64_t v52 = sub_24C980C10();
    char v53 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v66 = v12;
    sub_24C96F0C0(v52, 0xD000000000000019, 0x800000024C987040, v53);
    swift_bridgeObjectRelease();
  }
  id v54 = objc_msgSend(v1, sel_statistics, v66);
  if (v54)
  {
    uint64_t v55 = v54;
    objc_msgSend(v54, sel_tasksPerformedWithUI);

    uint64_t v56 = sub_24C980C10();
    char v57 = swift_isUniquelyReferenced_nonNull_native();
    sub_24C96F0C0(v56, 0xD000000000000019, 0x800000024C987020, v57);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return (id)v12;
}

uint64_t sub_24C96E3B0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  uint64_t v4 = sub_24C980140();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  uint64_t v4 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t SiriPenetrationRateCoreAnalyticsReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought40SiriPenetrationRateCoreAnalyticsReporter_odmId;
  uint64_t v4 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

id SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.getter()
{
  return *v0;
}

void SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.setter(void *a1)
{
  id *v1 = a1;
}

uint64_t (*SiriPentrationRateCoreAnalyticsPayload.bmSiriTaskAggregation.modify())()
{
  return nullsub_1;
}

id SiriPentrationRateCoreAnalyticsPayload.trialIds.getter()
{
  return *(id *)(v0 + 8);
}

void SiriPentrationRateCoreAnalyticsPayload.trialIds.setter(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
}

uint64_t (*SiriPentrationRateCoreAnalyticsPayload.trialIds.modify())()
{
  return nullsub_1;
}

id sub_24C96E694(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_24C96E7DC();
    uint64_t v4 = (void *)sub_24C980730();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_24C96E720(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE988);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C96E780()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

unint64_t sub_24C96E7DC()
{
  unint64_t result = qword_2697FEE58;
  if (!qword_2697FEE58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697FEE58);
  }
  return result;
}

id sub_24C96E81C()
{
  return sub_24C96DC78();
}

uint64_t sub_24C96E850()
{
  return type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateCoreAnalyticsReporter()
{
  uint64_t result = qword_2697FEE60;
  if (!qword_2697FEE60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C96E8A4()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C980140();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateCoreAnalyticsReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateCoreAnalyticsReporter);
}

uint64_t dispatch thunk of SiriPenetrationRateCoreAnalyticsReporter.__allocating_init(_:odmId:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void *initializeBufferWithCopyOfBuffer for SiriPentrationRateCoreAnalyticsPayload(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for SiriPentrationRateCoreAnalyticsPayload(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for SiriPentrationRateCoreAnalyticsPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for SiriPentrationRateCoreAnalyticsPayload(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for SiriPentrationRateCoreAnalyticsPayload()
{
  return &type metadata for SiriPentrationRateCoreAnalyticsPayload;
}

ValueMetadata *type metadata accessor for SiriPenetrationRateCoreAnalytics()
{
  return &type metadata for SiriPenetrationRateCoreAnalytics;
}

unint64_t sub_24C96EAC4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 72 * result;
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v5 + 48) = v6;
  *(unsigned char *)(v5 + 64) = *(unsigned char *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v7;
  uint64_t v8 = (void *)(a5[7] + 16 * result);
  *uint64_t v8 = a3;
  v8[1] = a4;
  uint64_t v9 = a5[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a5[2] = v11;
  }
  return result;
}

uint64_t sub_24C96EB34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24C969CEC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24C96B088();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_24C96EEE8(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24C96EC04(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24C980980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      uint64_t v21 = v4;
      uint64_t v22 = v2;
      unint64_t v23 = (result + 1) & v7;
      do
      {
        uint64_t v24 = 72 * v6;
        sub_24C980BC0();
        sub_24C980BE0();
        sub_24C980BF0();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_24C980800();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24C980800();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_24C980800();
        swift_bridgeObjectRelease();
        sub_24C980BD0();
        sub_24C980BD0();
        uint64_t v8 = sub_24C980C00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v9 = v8 & v7;
        if (v3 >= (uint64_t)v23)
        {
          if (v9 < v23)
          {
            uint64_t v4 = v21;
            uint64_t v2 = v22;
          }
          else
          {
            uint64_t v4 = v21;
            uint64_t v2 = v22;
            if (v3 >= (uint64_t)v9) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v4 = v21;
          uint64_t v2 = v22;
          if (v9 >= v23 || v3 >= (uint64_t)v9)
          {
LABEL_12:
            uint64_t v10 = *(void *)(v2 + 48);
            uint64_t result = v10 + 72 * v3;
            uint64_t v11 = (const void *)(v10 + v24);
            if (72 * v3 < v24 || result >= (unint64_t)v11 + 72 || v3 != v6) {
              uint64_t result = (unint64_t)memmove((void *)result, v11, 0x48uLL);
            }
            uint64_t v12 = *(void *)(v2 + 56);
            id v13 = (_OWORD *)(v12 + 16 * v3);
            uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v13 >= v14 + 1))
            {
              *id v13 = *v14;
              int64_t v3 = v6;
            }
          }
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v15 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v16 = *v15;
    uint64_t v17 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v15 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v17 = *v15;
    uint64_t v16 = (-1 << result) - 1;
  }
  *uint64_t v15 = v17 & v16;
  uint64_t v18 = *(void *)(v2 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = v20;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_24C96EEE8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24C980980();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24C980BC0();
        swift_bridgeObjectRetain();
        sub_24C980800();
        uint64_t v9 = sub_24C980C00();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          id v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
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
  *uint64_t v17 = v19 & v18;
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

void sub_24C96F0C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24C969CEC(a2, a3);
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
    sub_24C96B088();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_24C96A9CC(v15, a4 & 1);
  unint64_t v20 = sub_24C969CEC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_24C980BA0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t BatchReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t BookmarkedReporter.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v4 + 80) - 8) + 32))(v4 + *(void *)(*(void *)v4 + 96), a1);
  *(void *)(v4 + *(void *)(*(void *)v4 + 104)) = a2;
  return v4;
}

uint64_t BatchReporter.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_24C96F338(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = *v1;
  v2[5] = *v1;
  uint64_t v4 = *(void *)(v3 + 80);
  v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(void *)(v5 + 64);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24C96F444, 0, 0);
}

uint64_t sub_24C96F444()
{
  uint64_t v1 = v0[6];
  v0[11] = *(void *)(v0[4] + 16);
  uint64_t v2 = swift_bridgeObjectRetain();
  if (MEMORY[0x253302950](v2, v1))
  {
    char v3 = sub_24C9808A0();
    sub_24C980880();
    if (v3)
    {
      (*(void (**)(void, unint64_t, void))(v0[7] + 16))(v0[10], v0[11] + ((*(unsigned __int8 *)(v0[7] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[7] + 80)), v0[6]);
    }
    else
    {
      uint64_t v12 = v0[8];
      uint64_t v8 = sub_24C9809D0();
      if (v12 != 8)
      {
        __break(1u);
        return MEMORY[0x270F8C618](v8, v7, v9);
      }
      uint64_t v13 = v8;
      uint64_t v14 = v0[10];
      uint64_t v15 = v0[6];
      uint64_t v16 = v0[7];
      v0[2] = v13;
      (*(void (**)(uint64_t, void *, uint64_t))(v16 + 16))(v14, v0 + 2, v15);
      swift_unknownObjectRelease();
    }
    v0[12] = 1;
    uint64_t v4 = v0[5];
    (*(void (**)(void, void, void))(v0[7] + 32))(v0[9], v0[10], v0[6]);
    uint64_t v5 = *(void *)(v4 + 88);
    unint64_t v6 = (void *)swift_task_alloc();
    v0[13] = v6;
    *unint64_t v6 = v0;
    v6[1] = sub_24C96F634;
    uint64_t v7 = v0[6];
    uint64_t v8 = v0[3];
    uint64_t v9 = v5;
    return MEMORY[0x270F8C618](v8, v7, v9);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24C96F634()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24C96F964;
  }
  else
  {
    uint64_t v2 = sub_24C96F750;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C96F750()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[6];
  (*(void (**)(void, uint64_t))(v0[7] + 8))(v0[9], v3);
  if (v2 != MEMORY[0x253302950](v1, v3))
  {
    uint64_t v6 = v0[12];
    char v7 = sub_24C9808A0();
    sub_24C980880();
    if (v7)
    {
      uint64_t v8 = (*(uint64_t (**)(void, unint64_t, void))(v0[7] + 16))(v0[10], v0[11]+ ((*(unsigned __int8 *)(v0[7] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[7] + 80))+ *(void *)(v0[7] + 72) * v6, v0[6]);
    }
    else
    {
      uint64_t v14 = v0[8];
      uint64_t v8 = sub_24C9809D0();
      if (v14 != 8) {
        goto LABEL_14;
      }
      uint64_t v15 = v0[10];
      uint64_t v16 = v0[6];
      uint64_t v17 = v0[7];
      v0[2] = v8;
      (*(void (**)(uint64_t, void *, uint64_t))(v17 + 16))(v15, v0 + 2, v16);
      uint64_t v8 = swift_unknownObjectRelease();
    }
    v0[12] = v6 + 1;
    if (!__OFADD__(v6, 1))
    {
      uint64_t v11 = v0[5];
      (*(void (**)(void, void, void))(v0[7] + 32))(v0[9], v0[10], v0[6]);
      uint64_t v12 = *(void *)(v11 + 88);
      uint64_t v13 = (void *)swift_task_alloc();
      v0[13] = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_24C96F634;
      uint64_t v9 = v0[6];
      uint64_t v8 = v0[3];
      uint64_t v10 = v12;
      return MEMORY[0x270F8C618](v8, v9, v10);
    }
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x270F8C618](v8, v9, v10);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24C96F964()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[9], v0[6]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t BatchReporter.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BatchReporter.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24C96FA44(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24C95F9C4;
  return sub_24C96F338(a1);
}

uint64_t BookmarkedReporter.init(_:_:)(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 96), a1);
  *(void *)(v2 + *(void *)(*(void *)v2 + 104)) = a2;
  return v2;
}

uint64_t sub_24C96FB74(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = type metadata accessor for conversationStreamMetadata(0);
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  v2[17] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for eventStreamMetadata(0);
  v2[18] = v6;
  v2[19] = *(void *)(v6 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v7 = *(void *)(v4 + 88);
  uint64_t v8 = *(void *)(v4 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[21] = AssociatedTypeWitness;
  v2[22] = *(void *)(AssociatedTypeWitness - 8);
  v2[23] = swift_task_alloc();
  uint64_t v10 = (void *)swift_task_alloc();
  v2[24] = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24C96FDC8;
  return MEMORY[0x270F8C618](a1, v8, v7);
}

uint64_t sub_24C96FDC8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24C96FF2C, 0, 0);
  }
}

uint64_t sub_24C96FF2C()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 176) + 16))(*(void *)(v0 + 184), *(void *)(v0 + 96), *(void *)(v0 + 168));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEE80);
  if (swift_dynamicCast())
  {
    uint64_t v1 = (void *)(v0 + 16);
    sub_24C970790((long long *)(v0 + 56), v0 + 16);
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
    uint64_t v5 = *(void *)(v4 + 16);
    if (v5)
    {
      uint64_t v6 = *(void *)(v0 + 152);
      uint64_t v31 = *(void *)(v0 + 160) + *(int *)(*(void *)(v0 + 144) + 20);
      uint64_t v29 = *(void *)(*(void *)(v0 + 104) + *(void *)(**(void **)(v0 + 104) + 104));
      uint64_t v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      uint64_t v8 = *(void *)(v6 + 72);
      do
      {
        uint64_t v9 = *(void *)(v0 + 160);
        uint64_t v10 = *(void *)(v0 + 136);
        sub_24C963D64(v7, v9, type metadata accessor for eventStreamMetadata);
        uint64_t v11 = sub_24C9800F0();
        uint64_t v12 = *(void *)(v11 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v31, v11);
        sub_24C963DCC(v9, type metadata accessor for eventStreamMetadata);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
        id v13 = *(id *)(v29 + 16);
        sub_24C9804E0();

        sub_24C95D4E0(v10, &qword_2697FE918);
        v7 += v8;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      uint64_t v1 = (void *)(v0 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v16 = *(void *)(v0 + 40);
    uint64_t v17 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1(v1, v16);
    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
    uint64_t v19 = *(void *)(v18 + 16);
    if (v19)
    {
      uint64_t v20 = *(void *)(v0 + 120);
      uint64_t v32 = *(void *)(v0 + 128) + *(int *)(*(void *)(v0 + 112) + 20);
      uint64_t v30 = *(void *)(*(void *)(v0 + 104) + *(void *)(**(void **)(v0 + 104) + 104));
      uint64_t v21 = v18 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
      uint64_t v22 = *(void *)(v20 + 72);
      do
      {
        uint64_t v23 = *(void *)(v0 + 128);
        uint64_t v24 = *(void *)(v0 + 136);
        sub_24C963D64(v21, v23, type metadata accessor for conversationStreamMetadata);
        uint64_t v25 = sub_24C9800F0();
        uint64_t v26 = *(void *)(v25 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v32, v25);
        sub_24C963DCC(v23, type metadata accessor for conversationStreamMetadata);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
        id v27 = *(id *)(v30 + 16);
        sub_24C9804D0();

        sub_24C95D4E0(v24, &qword_2697FE918);
        v21 += v22;
        --v19;
      }
      while (v19);
    }
    swift_bridgeObjectRelease();
    char v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v28;
    *char v28 = v0;
    v28[1] = sub_24C9703D8;
    return sub_24C95DD14();
  }
  else
  {
    *(void *)(v0 + 88) = 0;
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    sub_24C95D4E0(v0 + 56, qword_2697FEE88);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_24C9703D8()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24C970580;
  }
  else {
    uint64_t v2 = sub_24C9704EC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C9704EC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24C970580()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t BookmarkedReporter.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 96));
  swift_release();
  return v0;
}

uint64_t BookmarkedReporter.__deallocating_deinit()
{
  BookmarkedReporter.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24C9706F8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24C963EA0;
  return sub_24C96FB74(a1);
}

uint64_t sub_24C970790(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24C9707A8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA02F8](*(void *)(a2 + 88), *(void *)(a2 + 80), a1, MEMORY[0x263F8AF30], MEMORY[0x263F8AF20]);
}

uint64_t sub_24C9707C4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BatchReporter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BatchReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BatchReporter);
}

uint64_t dispatch thunk of BatchReporter.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BatchReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 112) + **(int **)(*(void *)v1 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

uint64_t sub_24C970954()
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

uint64_t type metadata accessor for BookmarkedReporter()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for BookmarkedReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BookmarkedReporter);
}

uint64_t dispatch thunk of BookmarkedReporter.__allocating_init(_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of BookmarkedReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C963EA0;
  return v6(a1);
}

uint64_t static StreamUtils.getEventStreamMetadata(bookmarkableEventStreams:endTime:)(uint64_t a1, uint64_t a2)
{
  return sub_24C970D20(a1, a2, type metadata accessor for eventStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_24C9698DC, type metadata accessor for eventStreamMetadata);
}

uint64_t static StreamUtils.getConversationStreamMetadata(bookmarkableConversationStreams:endTime:)(uint64_t a1, uint64_t a2)
{
  return sub_24C970D20(a1, a2, type metadata accessor for conversationStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_24C969B90, type metadata accessor for conversationStreamMetadata);
}

uint64_t eventStreamMetadata.eventType.getter()
{
  return *(void *)v0;
}

uint64_t eventStreamMetadata.endTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24C970C20(type metadata accessor for eventStreamMetadata, a1);
}

uint64_t conversationStreamMetadata.endTime.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24C970C20(type metadata accessor for conversationStreamMetadata, a1);
}

uint64_t sub_24C970C20@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_24C9800F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_24C970CA0(uint64_t a1, uint64_t a2)
{
  return sub_24C970D20(a1, a2, type metadata accessor for eventStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_24C9698DC, type metadata accessor for eventStreamMetadata);
}

uint64_t sub_24C970CE0(uint64_t a1, uint64_t a2)
{
  return sub_24C970D20(a1, a2, type metadata accessor for conversationStreamMetadata, (uint64_t (*)(BOOL, uint64_t, uint64_t, uint64_t))sub_24C969B90, type metadata accessor for conversationStreamMetadata);
}

uint64_t sub_24C970D20(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(BOOL, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(void))
{
  uint64_t v23 = a2;
  uint64_t v24 = a5;
  uint64_t v22 = a3(0);
  uint64_t v7 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v9 = (char *)&v19 - v8;
  uint64_t v21 = *(void *)(a1 + 16);
  if (!v21) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v20 = a4;
  uint64_t v10 = sub_24C9800F0();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  uint64_t v13 = MEMORY[0x263F8EE78];
  do
  {
    uint64_t v14 = a1;
    uint64_t v15 = *(void *)(a1 + 8 * v12 + 32);
    v11(&v9[*(int *)(v22 + 20)], v23, v10);
    *(void *)uint64_t v9 = v15;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = v20(0, *(void *)(v13 + 16) + 1, 1, v13);
    }
    unint64_t v17 = *(void *)(v13 + 16);
    unint64_t v16 = *(void *)(v13 + 24);
    if (v17 >= v16 >> 1) {
      uint64_t v13 = v20(v16 > 1, v17 + 1, 1, v13);
    }
    ++v12;
    *(void *)(v13 + 16) = v17 + 1;
    sub_24C9714F4((uint64_t)v9, v13+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v17, v24);
    a1 = v14;
  }
  while (v21 != v12);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t type metadata accessor for eventStreamMetadata(uint64_t a1)
{
  return sub_24C970F64(a1, (uint64_t *)&unk_2697FEFB0);
}

uint64_t type metadata accessor for conversationStreamMetadata(uint64_t a1)
{
  return sub_24C970F64(a1, (uint64_t *)&unk_2697FEFC0);
}

uint64_t sub_24C970F64(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for eventStreamMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for eventStreamMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t *_s11DeepThought19eventStreamMetadataVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *long long v3 = *a2;
    long long v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_24C9800F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t _s11DeepThought19eventStreamMetadataVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_24C9800F0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

void *_s11DeepThought19eventStreamMetadataVwcp_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24C9800F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *_s11DeepThought19eventStreamMetadataVwca_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24C9800F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *_s11DeepThought19eventStreamMetadataVwtk_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24C9800F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *_s11DeepThought19eventStreamMetadataVwta_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24C9800F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for conversationStreamMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C971320);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_24C9800F0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);
  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for conversationStreamMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C9713A8);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_24C9800F0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, a2, a2, v6);
}

uint64_t sub_24C971420()
{
  uint64_t result = sub_24C9800F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of BookmarkedResult.eventStreamMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BookmarkedResult.conversationStreamMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for StreamUtils()
{
  return &type metadata for StreamUtils;
}

uint64_t sub_24C9714F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t SiriPentrationRateReporter.deinit()
{
  return v0;
}

uint64_t SiriPenetrationRateBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = a1;
  uint64_t v7 = v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  uint64_t v8 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, a2, v8);
  uint64_t v9 = v6 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v10 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a3, v10);
  return v6;
}

id sub_24C97164C()
{
  uint64_t v1 = sub_24C9800F0();
  uint64_t v33 = *(void *)(v1 - 8);
  uint64_t v34 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v4 = *v0;
  uint64_t v5 = *((void *)v0 + 3);
  uint64_t v32 = *((void *)v0 + 2);
  HIDWORD(v31) = *((unsigned __int8 *)v0 + 64);
  if (v4 == 30) {
    unsigned int v6 = 3;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v4 == 7) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6;
  }
  uint64_t v8 = (void *)sub_24C9808E0();
  if (v4 != 30)
  {
    if (v4 == 1) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = v7;
    }
    if (v4 == 7) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = v9;
    }
  }
  uint64_t v10 = (void *)sub_24C9808E0();
  sub_24C980110();
  id v11 = objc_allocWithZone(MEMORY[0x263F2A4F8]);
  uint64_t v12 = (void *)sub_24C9807A0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithSchedule_aggregationWindowStartTimestamp_aggregationWindowEndTimestamp_odmId_, v7, v8, v10, v12);

  uint64_t v14 = (void *)sub_24C980C10();
  sub_24C972784();
  uint64_t v15 = (void *)sub_24C980940();
  unint64_t v16 = (void *)sub_24C980940();
  unint64_t v17 = (void *)sub_24C980C10();
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A500]), sel_initWithCompletedSystemTasks_failedSystemTasks_cancelledSystemTasks_tasksPerformedWithUI_, v14, v15, v16, v17);

  uint64_t v19 = (HIDWORD(v31) + 1);
  id v20 = objc_allocWithZone(MEMORY[0x263F08AB0]);
  swift_bridgeObjectRetain_n();
  id v21 = objc_msgSend(v20, sel_init);
  id v22 = objc_msgSend(v21, sel_operatingSystemVersionString);

  uint64_t v23 = sub_24C9807B0();
  uint64_t v25 = v24;

  id v26 = objc_allocWithZone(MEMORY[0x263F2A4F0]);
  id v27 = sub_24C97238C(v19, v32, v5, v32, v5, 0x6E776F6E6B6E75, 0xE700000000000000, 0x6E776F6E6B6E75, 0xE700000000000000, v23, v25);
  sub_24C9800E0();
  sub_24C9800B0();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v3, v34);
  char v28 = (void *)sub_24C9808E0();
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F2A4E8]), sel_initWithAbsoluteTimestamp_metadata_statistics_dimensions_, v28, v13, v18, v27);

  return v29;
}

uint64_t sub_24C9719E0()
{
  return MEMORY[0x270FA2498](sub_24C9719FC, 0, 0);
}

uint64_t sub_24C9719FC()
{
  return sub_24C980A50();
}

uint64_t SiriPentrationRateReporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24C971A8C(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 80) + **(int **)(**(void **)v1 + 80));
  int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *int v4 = v2;
  v4[1] = sub_24C9696A0;
  return v6(a1);
}

uint64_t SiriPenetrationRateBiomeReporter.odmId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v4 = sub_24C980140();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t SiriPenetrationRateBiomeReporter.init(biomeDonator:logger:odmId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator) = a1;
  uint64_t v6 = v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  uint64_t v7 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, a2, v7);
  uint64_t v8 = v3 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v9 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a3, v9);
  return v3;
}

uint64_t sub_24C971CD4(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 24) = v1;
  *(void *)(v2 + 32) = v3;
  return MEMORY[0x270FA2498](sub_24C971CF8, 0, 0);
}

uint64_t sub_24C971CF8()
{
  uint64_t v47 = v0;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = v0 + 24;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v36 = v2;
  uint64_t v37 = v3 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v3 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & v4;
  uint64_t v35 = OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_biomeDonator;
  int64_t v38 = (unint64_t)(63 - v6) >> 6;
  uint64_t v39 = *(void *)(v1 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    uint64_t v15 = *(void *)(*(void *)(v39 + 56) + 8 * v11);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      unint64_t v40 = v7;
      int64_t v41 = v9;
      uint64_t v43 = *(void *)(v36 + v35);
      swift_bridgeObjectRetain_n();
      uint64_t v17 = 0;
      uint64_t v42 = v15;
      do
      {
        uint64_t v22 = *(void *)(v15 + v17 + 40);
        uint64_t v23 = *(void *)(v15 + v17 + 48);
        uint64_t v24 = *(void *)(v15 + v17 + 56);
        uint64_t v25 = *(void *)(v15 + v17 + 64);
        uint64_t v26 = *(void *)(v15 + v17 + 72);
        uint64_t v27 = *(void *)(v15 + v17 + 80);
        uint64_t v28 = *(void *)(v15 + v17 + 88);
        char v29 = *(unsigned char *)(v15 + v17 + 96);
        LODWORD(v44[0]) = *(_DWORD *)(v15 + v17 + 32);
        v44[1] = v22;
        v44[2] = v23;
        v44[3] = v24;
        v44[4] = v25;
        v44[5] = v26;
        v44[6] = v27;
        v44[7] = v28;
        char v45 = v29;
        long long v46 = *(_OWORD *)(v15 + v17 + 100);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v30 = sub_24C97164C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        objc_msgSend(*(id *)(v43 + 16), sel_sendEvent_, v30);

        swift_bridgeObjectRetain_n();
        uint64_t v31 = sub_24C980700();
        os_log_type_t v32 = sub_24C980920();
        if (os_log_type_enabled(v31, v32))
        {
          id v18 = (uint8_t *)swift_slowAlloc();
          uint64_t v19 = swift_slowAlloc();
          v44[0] = v19;
          *(_DWORD *)id v18 = 136315138;
          uint64_t v20 = MEMORY[0x2533028F0](v15, &type metadata for CountsReported);
          *(void *)(v1 - 8) = sub_24C95F060(v20, v21, v44);
          sub_24C980950();
          uint64_t v15 = v42;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24C953000, v31, v32, "%s", v18, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x253303270](v19, -1, -1);
          MEMORY[0x253303270](v18, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v17 += 88;
        --v16;
      }
      while (v16);
      uint64_t result = swift_bridgeObjectRelease_n();
      unint64_t v7 = v40;
      int64_t v9 = v41;
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  if (v12 >= v38) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v37 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v38) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v37 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v38) {
    goto LABEL_27;
  }
  unint64_t v13 = *(void *)(v37 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 < v38)
  {
    unint64_t v13 = *(void *)(v37 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v9 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          goto LABEL_31;
        }
        if (v9 >= v38) {
          goto LABEL_27;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v9);
        ++v14;
        if (v13) {
          goto LABEL_20;
        }
      }
    }
    int64_t v9 = v14;
    goto LABEL_20;
  }
LABEL_27:
  swift_release();
  uint64_t v33 = *(uint64_t (**)(void))(v34 + 8);
  return v33();
}

uint64_t sub_24C972120()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return swift_release();
}

uint64_t SiriPenetrationRateBiomeReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateBiomeReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_odmId;
  uint64_t v2 = sub_24C980140();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC11DeepThought32SiriPenetrationRateBiomeReporter_logger;
  uint64_t v4 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return swift_deallocClassInstance();
}

id sub_24C97238C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a3)
  {
    uint64_t v15 = (void *)sub_24C9807A0();
    swift_bridgeObjectRelease();
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (a5)
    {
LABEL_3:
      uint64_t v16 = (void *)sub_24C9807A0();
      swift_bridgeObjectRelease();
      uint64_t v17 = a9;
      if (a7) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v16 = 0;
  uint64_t v17 = a9;
  if (a7)
  {
LABEL_4:
    id v18 = (void *)sub_24C9807A0();
    swift_bridgeObjectRelease();
    uint64_t v19 = a11;
    if (v17) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v20 = 0;
    if (v19) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v21 = 0;
    goto LABEL_12;
  }
LABEL_9:
  id v18 = 0;
  uint64_t v19 = a11;
  if (!v17) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v20 = (void *)sub_24C9807A0();
  swift_bridgeObjectRelease();
  if (!v19) {
    goto LABEL_11;
  }
LABEL_6:
  unint64_t v21 = (void *)sub_24C9807A0();
  swift_bridgeObjectRelease();
LABEL_12:
  id v22 = objc_msgSend(v11, sel_initWithProductArea_siriInputLocale_systemLocale_countryCode_deviceType_systemBuild_, a1, v15, v16, v18, v20, v21);

  return v22;
}

uint64_t type metadata accessor for SiriPentrationRateReporter()
{
  return self;
}

uint64_t method lookup function for SiriPentrationRateReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPentrationRateReporter);
}

uint64_t dispatch thunk of SiriPentrationRateReporter.report(_:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 80) + **(int **)(*(void *)v1 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

uint64_t sub_24C97262C()
{
  return type metadata accessor for SiriPenetrationRateBiomeReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateBiomeReporter()
{
  uint64_t result = qword_2697FF000;
  if (!qword_2697FF000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C972680()
{
  uint64_t result = sub_24C980140();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24C980720();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateBiomeReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateBiomeReporter);
}

uint64_t dispatch thunk of SiriPenetrationRateBiomeReporter.__allocating_init(biomeDonator:logger:odmId:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_24C972784()
{
  unint64_t result = qword_2697FF010;
  if (!qword_2697FF010)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697FF010);
  }
  return result;
}

uint64_t SiriPenetrationRateJsonLoggingReporter.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
  *(void *)(v2 + v3) = sub_24C9608A0(MEMORY[0x263F8EE78]);
  uint64_t v4 = v2 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  uint64_t v5 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
  return v2;
}

uint64_t static SiriPenetrationRateJsonLoggingReporter.SAVE_TO_FILE.getter()
{
  return 0;
}

unint64_t static SiriPenetrationRateJsonLoggingReporter.FILE_PATH.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_24C972888(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C9728F4()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriPenetrationRateJsonLoggingReporter.init(_:)(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult;
  swift_retain();
  *(void *)(v1 + v3) = sub_24C9608A0(MEMORY[0x263F8EE78]);
  uint64_t v4 = v1 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  uint64_t v5 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
  swift_release();
  return v1;
}

uint64_t sub_24C9729DC(uint64_t *a1)
{
  v2[25] = v1;
  sub_24C9807E0();
  v2[26] = swift_task_alloc();
  sub_24C980010();
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = *a1;
  v2[27] = v4;
  v2[28] = v5;
  return MEMORY[0x270FA2498](sub_24C972AA0, 0, 0);
}

uint64_t sub_24C972AA0()
{
  uint64_t v28 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[25];
  sub_24C980050();
  swift_allocObject();
  sub_24C980040();
  sub_24C980000();
  sub_24C980020();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981590;
  *(void *)(inited + 32) = 0xD00000000000001BLL;
  *(void *)(inited + 40) = 0x800000024C987200;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF028);
  *(void *)(inited + 48) = v2;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_24C9608A0(inited);
  uint64_t v6 = (unint64_t *)(v3 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF030);
  uint64_t v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_24C981590;
  *(void *)(v7 + 32) = 0xD00000000000001BLL;
  *(void *)(v7 + 40) = 0x800000024C987200;
  *(void *)(v7 + 48) = v2;
  swift_bridgeObjectRetain();
  v0[22] = sub_24C960D48(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF038);
  sub_24C97304C();
  uint64_t v8 = sub_24C980030();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  sub_24C9807D0();
  uint64_t v11 = sub_24C9807C0();
  if (v12)
  {
    uint64_t v13 = v11;
    unint64_t v14 = v12;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24C980700();
    os_log_type_t v16 = sub_24C980920();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v26 = v10;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v27 = v25;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      v1[24] = sub_24C95F060(v13, v14, &v27);
      sub_24C980950();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24C953000, v15, v16, "json_string=%s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253303270](v25, -1, -1);
      id v18 = v17;
      unint64_t v10 = v26;
      MEMORY[0x253303270](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v19 = sub_24C980700();
    os_log_type_t v20 = sub_24C980930();
    if (!os_log_type_enabled(v19, v20)) {
      goto LABEL_10;
    }
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v21 = 0;
    id v22 = "Unable to convert JSON string to data.";
  }
  else
  {
    uint64_t v19 = sub_24C980700();
    os_log_type_t v20 = sub_24C980930();
    if (!os_log_type_enabled(v19, v20)) {
      goto LABEL_10;
    }
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v21 = 0;
    id v22 = "Extracting results to JSON failed";
  }
  _os_log_impl(&dword_24C953000, v19, v20, v22, v21, 2u);
  MEMORY[0x253303270](v21, -1, -1);
LABEL_10:
  sub_24C9734B8(v8, v10);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v1[1];
  return v23();
}

unint64_t sub_24C97304C()
{
  unint64_t result = qword_2697FF040;
  if (!qword_2697FF040)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697FF038);
    sub_24C9730C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF040);
  }
  return result;
}

unint64_t sub_24C9730C8()
{
  unint64_t result = qword_2697FF048;
  if (!qword_2697FF048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697FF028);
    sub_24C973144();
    sub_24C973198();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF048);
  }
  return result;
}

unint64_t sub_24C973144()
{
  unint64_t result = qword_2697FF050;
  if (!qword_2697FF050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF050);
  }
  return result;
}

unint64_t sub_24C973198()
{
  unint64_t result = qword_2697FF058;
  if (!qword_2697FF058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697FF060);
    sub_24C97320C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF058);
  }
  return result;
}

unint64_t sub_24C97320C()
{
  unint64_t result = qword_2697FF068;
  if (!qword_2697FF068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF068);
  }
  return result;
}

uint64_t sub_24C973260()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t SiriPenetrationRateJsonLoggingReporter.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriPenetrationRateJsonLoggingReporter.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_24C973400(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24C980950();
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

uint64_t sub_24C9734B8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24C973510@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC11DeepThought38SiriPenetrationRateJsonLoggingReporter_jsonResult);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24C97356C()
{
  return type metadata accessor for SiriPenetrationRateJsonLoggingReporter();
}

uint64_t type metadata accessor for SiriPenetrationRateJsonLoggingReporter()
{
  uint64_t result = qword_2697FF070;
  if (!qword_2697FF070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C9735C0()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateJsonLoggingReporter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateJsonLoggingReporter);
}

uint64_t dispatch thunk of SiriPenetrationRateJsonLoggingReporter.jsonResult.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of SiriPenetrationRateJsonLoggingReporter.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t SiriPenetrationRateDataProvider.__allocating_init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = a1;
  *(void *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = a2;
  *(void *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = a3;
  *(void *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = a4;
  uint64_t v13 = v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  uint64_t v14 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v13, a6, v14);
  *(void *)(v12 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = a5;
  return v12;
}

uint64_t FeaturizedBiomeData.featurizedEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturizedBiomeData.eventType.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t FeaturizedBiomeData.init(featurizedEvents:eventType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t SiriPenetrationRateDataProvider.init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedAppIntentProivder) = a1;
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriExecutionProvider) = a2;
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedSiriUIProvider) = a3;
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_featurizedConversationProvider) = a4;
  uint64_t v9 = v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  uint64_t v10 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a6, v10);
  *(void *)(v6 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_bookmarkService) = a5;
  return v6;
}

uint64_t sub_24C973860(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24C973880, 0, 0);
}

uint64_t sub_24C973880()
{
  sub_24C974078(7uLL);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  void *v1 = v0;
  v1[1] = sub_24C973930;
  return sub_24C974DD0(v0 + 16);
}

uint64_t sub_24C973930()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24C974018;
  }
  else {
    uint64_t v2 = sub_24C973A44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C973A44()
{
  v0[10] = v0[2];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[11] = v1;
  void *v1 = v0;
  v1[1] = sub_24C973AF4;
  return sub_24C974DD0((uint64_t)(v0 + 3));
}

uint64_t sub_24C973AF4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24C974030;
  }
  else
  {
    uint64_t v2 = sub_24C973C10;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C973C10()
{
  v0[13] = v0[3];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  void *v1 = v0;
  v1[1] = sub_24C973CC0;
  return sub_24C974DD0((uint64_t)(v0 + 4));
}

uint64_t sub_24C973CC0()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24C974048;
  }
  else
  {
    uint64_t v2 = sub_24C973DE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C973DE8()
{
  v0[16] = v0[4];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  void *v1 = v0;
  v1[1] = sub_24C973E98;
  return sub_24C976350((uint64_t)(v0 + 5));
}

uint64_t sub_24C973E98()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24C974060;
  }
  else
  {
    uint64_t v2 = sub_24C973FD4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24C973FD4()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void **)(v0 + 48);
  *uint64_t v3 = *(void *)(v0 + 80);
  v3[1] = 13;
  v3[2] = v2;
  v3[3] = 6;
  v3[4] = v1;
  v3[5] = 1;
  v3[6] = v4;
  v3[7] = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C974018()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C974030()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C974048()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C974060()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24C974078(unint64_t a1)
{
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE918);
  MEMORY[0x270FA5388](v22);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24C9800F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FE920);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24C980250();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (void (*)(char *, uint64_t))((char *)&v21 - v16);
  sub_24C980220();
  sub_24C980260();
  uint64_t v18 = sub_24C980270();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v10, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_24C980230();
    (*(void (**)(void (*)(char *, uint64_t), char *, uint64_t))(v12 + 32))(v17, v15, v11);
    if (qword_2697FE888 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v22, (uint64_t)qword_2697FE900);
    swift_beginAccess();
    sub_24C95864C(v20, (uint64_t)v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_24C9800E0();
      sub_24C95871C((uint64_t)v3);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    sub_24C95E100(13, a1, (uint64_t)v7, v17);
    sub_24C95E100(6, a1, (uint64_t)v7, v17);
    sub_24C95E100(1, a1, (uint64_t)v7, v17);
    sub_24C95E170(0, a1, (uint64_t)v7, v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(void, uint64_t))(v12 + 8))(v17, v11);
  }
  return result;
}

uint64_t SiriPenetrationRateDataProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t SiriPenetrationRateDataProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought31SiriPenetrationRateDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24C9745EC(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24C95F9C4;
  v5[6] = a1;
  v5[7] = v4;
  return MEMORY[0x270FA2498](sub_24C973880, 0, 0);
}

uint64_t initializeBufferWithCopyOfBuffer for CountsReported(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriPenetrationRateDataRecord()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for SiriPenetrationRateDataRecord(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SiriPenetrationRateDataRecord(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
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

void *assignWithTake for SiriPenetrationRateDataRecord(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriPenetrationRateDataRecord(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriPenetrationRateDataRecord(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SiriPenetrationRateDataRecord()
{
  return &type metadata for SiriPenetrationRateDataRecord;
}

void *initializeBufferWithCopyOfBuffer for FeaturizedBiomeData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeaturizedBiomeData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for FeaturizedBiomeData(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizedBiomeData()
{
  return &type metadata for FeaturizedBiomeData;
}

void *_s11DeepThought19FeaturizedBiomeDataVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for FeaturizedConversationData()
{
  return &type metadata for FeaturizedConversationData;
}

uint64_t sub_24C974A54()
{
  return type metadata accessor for SiriPenetrationRateDataProvider();
}

uint64_t type metadata accessor for SiriPenetrationRateDataProvider()
{
  uint64_t result = qword_2697FF0C0;
  if (!qword_2697FF0C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C974AA8()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SiriPenetrationRateDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SiriPenetrationRateDataProvider);
}

uint64_t dispatch thunk of SiriPenetrationRateDataProvider.__allocating_init(appIntentEventProvider:siriExecutionEventProivder:siriUIEventProvider:conversationProvider:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SiriPenetrationRateDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 136) + **(int **)(*(void *)v1 + 136));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

void *FeaturizedBiomeDataProvider.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_allocObject();
  v8[4] = a3;
  uint64_t v9 = (char *)v8 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  uint64_t v10 = sub_24C980720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a4, v10);
  v8[2] = a1;
  v8[3] = a2;
  return v8;
}

uint64_t FeaturizedBiomeEvents.featurizedEvents.getter()
{
  return swift_bridgeObjectRetain();
}

void *FeaturizedBiomeDataProvider.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  uint64_t v8 = (char *)v4 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  uint64_t v9 = sub_24C980720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a4, v9);
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t sub_24C974DD0(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24C974DF0, 0, 0);
}

uint64_t sub_24C974DF0()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF0E8);
  uint64_t v2 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697FEB00) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24C981590;
  unint64_t v5 = v4 + v3 + v2[14];
  uint64_t v6 = *(void *)(v1 + 16);
  *(void *)(v4 + v3) = v6;
  uint64_t v7 = *MEMORY[0x263F39610];
  uint64_t v8 = sub_24C9802C0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v5, v7, v8);
  sub_24C9609D8(v4);
  sub_24C980300();
  swift_allocObject();
  sub_24C9802D0();
  id v9 = *(id *)(*(void *)(v1 + 32) + 16);
  sub_24C9802E0();

  sub_24C9804B0();
  unint64_t v10 = sub_24C9802F0();
  swift_bridgeObjectRelease();
  sub_24C980330();
  uint64_t v11 = MEMORY[0x2533023B0](v6);
  unint64_t v13 = v12;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24C980700();
  os_log_type_t v15 = sub_24C980920();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = v20;
    *(_DWORD *)uint64_t v16 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_24C95F060(v11, v13, &v21);
    sub_24C980950();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2048;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_24C980A60();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v17;
    sub_24C980950();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v14, v15, "marker: fetched featurized events, eventType=%s,\ncount=%ld", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253303270](v20, -1, -1);
    MEMORY[0x253303270](v16, -1, -1);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  **(void **)(v0 + 24) = v10;
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t FeaturizedBiomeDataProvider.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FeaturizedBiomeDataProvider.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought27FeaturizedBiomeDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24C9752D4(uint64_t a1)
{
  uint64_t v4 = *v1;
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24C95F9C4;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_24C974DF0, 0, 0);
}

unint64_t sub_24C975388()
{
  unint64_t result = qword_2697FF0F0;
  if (!qword_2697FF0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF0F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturizedBiomeEvents()
{
  return &type metadata for FeaturizedBiomeEvents;
}

uint64_t sub_24C9753EC()
{
  return type metadata accessor for FeaturizedBiomeDataProvider();
}

uint64_t type metadata accessor for FeaturizedBiomeDataProvider()
{
  uint64_t result = qword_2697FF100;
  if (!qword_2697FF100) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C975440()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FeaturizedBiomeDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturizedBiomeDataProvider);
}

uint64_t dispatch thunk of FeaturizedBiomeDataProvider.__allocating_init(_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FeaturizedBiomeDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

void *sub_24C975630()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C982060;
  sub_24C980450();
  *(void *)(inited + 32) = sub_24C980440();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x800000024C9873D0;
  *(void *)(inited + 80) = sub_24C9803F0();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0x7373654D646E6553;
  *(void *)(inited + 104) = 0xEB00000000656761;
  *(void *)(inited + 128) = sub_24C980400();
  *(void *)(inited + 136) = v4;
  *(void *)(inited + 168) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = 0;
  *(void *)(inited + 176) = sub_24C980420();
  *(void *)(inited + 184) = v5;
  type metadata accessor for BMAppIntentInteractionDirection(0);
  *(void *)(inited + 216) = v6;
  *(_DWORD *)(inited + 192) = 2;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FF118 = result;
  return result;
}

uint64_t static SendSMSPenetrationRateEventFilter.expectedAppIntentIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE8B0);
}

void *sub_24C975750()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FEA58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24C981700;
  sub_24C9803C0();
  *(void *)(inited + 32) = sub_24C9803A0();
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263F8D310];
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = 0xD000000000000013;
  *(void *)(inited + 56) = 0x800000024C9873D0;
  *(void *)(inited + 80) = sub_24C980390();
  *(void *)(inited + 88) = v3;
  *(void *)(inited + 120) = v2;
  *(void *)(inited + 96) = 0xD000000000000029;
  *(void *)(inited + 104) = 0x800000024C9873F0;
  *(void *)(inited + 128) = sub_24C9803B0();
  *(void *)(inited + 136) = v4;
  type metadata accessor for BMSiriExecutionTaskStep(0);
  *(void *)(inited + 168) = v5;
  *(_DWORD *)(inited + 144) = 7;
  uint64_t result = (void *)sub_24C9608A0(inited);
  off_2697FF120 = result;
  return result;
}

uint64_t static SendSMSPenetrationRateEventFilter.expectedSiriExecutionIntraEventFeatures.getter()
{
  return sub_24C95FF54(&qword_2697FE8B8);
}

uint64_t SendSMSPenetrationRateEventFilter.deinit()
{
  return v0;
}

uint64_t SendSMSPenetrationRateEventFilter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t _s11DeepThought33SendSMSPenetrationRateEventFilterC06isSiriF013siriExecutionSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  sub_24C9803C0();
  sub_24C9803A0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v37 + 1);
  uint64_t v34 = v37;
  if (qword_2697FE8B8 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FF120;
  uint64_t v2 = sub_24C9803A0();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v6 = swift_dynamicCast();
    uint64_t v7 = v35;
    if (!v6) {
      uint64_t v7 = 0;
    }
    uint64_t v33 = v7;
    if (v6) {
      uint64_t v8 = v36;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v33 = 0;
    uint64_t v8 = 0;
  }
  sub_24C980390();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)&v37 + 1);
  uint64_t v32 = v37;
  unint64_t v10 = off_2697FF120;
  uint64_t v11 = sub_24C980390();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    int v15 = swift_dynamicCast();
    uint64_t v16 = v35;
    if (!v15) {
      uint64_t v16 = 0;
    }
    uint64_t v31 = v16;
    if (v15) {
      uint64_t v17 = v36;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v37);
    uint64_t v31 = 0;
    uint64_t v17 = 0;
  }
  sub_24C9803B0();
  type metadata accessor for BMSiriExecutionTaskStep(0);
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v30 = v37;
  char v18 = BYTE4(v37);
  uint64_t v19 = off_2697FF120;
  uint64_t v20 = sub_24C9803B0();
  if (v19[2] && (unint64_t v22 = sub_24C969CEC(v20, v21), (v23 & 1) != 0))
  {
    sub_24C95D484(v19[7] + 32 * v22, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v38 + 1))
  {
    sub_24C960840((uint64_t)&v37);
    int v25 = 0;
    uint64_t v26 = 1;
    if (v0) {
      goto LABEL_34;
    }
LABEL_39:
    if (!v8) {
      goto LABEL_45;
    }
    goto LABEL_40;
  }
  int v24 = swift_dynamicCast();
  if (v24) {
    int v25 = v35;
  }
  else {
    int v25 = 0;
  }
  uint64_t v26 = v24 ^ 1u;
  if (!v0) {
    goto LABEL_39;
  }
LABEL_34:
  if (!v8)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  if (v34 == v33 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  char v28 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
LABEL_45:
  if (!v9)
  {
    if (!v17)
    {
LABEL_51:
      if ((v18 & 1) == 0) {
        return (v30 == v25) & ~v26;
      }
      return v26;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17) {
    goto LABEL_42;
  }
  if (v32 == v31 && v9 == v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  int v29 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!(v18 & 1 | ((v29 & 1) == 0))) {
    return (v30 == v25) & ~v26;
  }
  return v29 & v26;
}

uint64_t _s11DeepThought33SendSMSPenetrationRateEventFilterC12isAppUIEvent9appIntentSb0aB15BiomeFoundation010FeaturizedF0C_tFZ_0()
{
  sub_24C980450();
  sub_24C980440();
  sub_24C980470();
  swift_bridgeObjectRelease();
  uint64_t v0 = *((void *)&v46 + 1);
  uint64_t v43 = v46;
  if (qword_2697FE8B0 != -1) {
    swift_once();
  }
  uint64_t v1 = off_2697FF118;
  uint64_t v2 = sub_24C980440();
  if (v1[2] && (unint64_t v4 = sub_24C969CEC(v2, v3), (v5 & 1) != 0))
  {
    sub_24C95D484(v1[7] + 32 * v4, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v47 + 1))
  {
    int v6 = swift_dynamicCast();
    unint64_t v7 = v44;
    if (!v6) {
      unint64_t v7 = 0;
    }
    unint64_t v42 = v7;
    if (v6) {
      unint64_t v8 = v45;
    }
    else {
      unint64_t v8 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v46);
    unint64_t v42 = 0;
    unint64_t v8 = 0;
  }
  sub_24C9803F0();
  sub_24C980470();
  swift_bridgeObjectRelease();
  long long v9 = v46;
  unint64_t v10 = off_2697FF118;
  uint64_t v11 = sub_24C9803F0();
  if (v10[2] && (unint64_t v13 = sub_24C969CEC(v11, v12), (v14 & 1) != 0))
  {
    sub_24C95D484(v10[7] + 32 * v13, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v47 + 1))
  {
    int v15 = swift_dynamicCast();
    unint64_t v16 = v44;
    if (!v15) {
      unint64_t v16 = 0;
    }
    unint64_t v39 = v16;
    if (v15) {
      unint64_t v17 = v45;
    }
    else {
      unint64_t v17 = 0;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v46);
    unint64_t v39 = 0;
    unint64_t v17 = 0;
  }
  sub_24C980400();
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v41 = v46;
  char v18 = off_2697FF118;
  uint64_t v19 = sub_24C980400();
  if (v18[2] && (unint64_t v21 = sub_24C969CEC(v19, v20), (v22 & 1) != 0))
  {
    sub_24C95D484(v18[7] + 32 * v21, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v47 + 1))
  {
    int v23 = swift_dynamicCast();
    int v24 = v44;
    if (!v23) {
      int v24 = 2;
    }
  }
  else
  {
    sub_24C960840((uint64_t)&v46);
    int v24 = 2;
  }
  int v40 = v24;
  sub_24C980420();
  type metadata accessor for BMAppIntentInteractionDirection(0);
  sub_24C980470();
  swift_bridgeObjectRelease();
  int v38 = v46;
  char v25 = BYTE4(v46);
  uint64_t v26 = off_2697FF118;
  uint64_t v27 = sub_24C980420();
  if (v26[2] && (unint64_t v29 = sub_24C969CEC(v27, v28), (v30 & 1) != 0))
  {
    sub_24C95D484(v26[7] + 32 * v29, (uint64_t)&v46);
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v47 + 1))
  {
    sub_24C960840((uint64_t)&v46);
    int v32 = 0;
    unsigned int v33 = 1;
    if (v0) {
      goto LABEL_42;
    }
LABEL_47:
    if (!v8) {
      goto LABEL_53;
    }
    goto LABEL_48;
  }
  int v31 = swift_dynamicCast();
  if (v31) {
    int v32 = v44;
  }
  else {
    int v32 = 0;
  }
  unsigned int v33 = v31 ^ 1;
  if (!v0) {
    goto LABEL_47;
  }
LABEL_42:
  if (!v8)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
  if (v43 == v42 && v0 == v8)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_53;
  }
  char v35 = sub_24C980B90();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) == 0)
  {
LABEL_49:
    swift_bridgeObjectRelease();
    goto LABEL_50;
  }
LABEL_53:
  if (!*((void *)&v9 + 1))
  {
    if (!v17) {
      goto LABEL_61;
    }
LABEL_50:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!v17) {
    goto LABEL_50;
  }
  if (v9 == __PAIR128__(v17, v39))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v36 = sub_24C980B90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v36 & 1) == 0) {
      return result;
    }
  }
LABEL_61:
  if (v41 != 2)
  {
    if (!((v40 != 2) & (((v41 & 1) == 0) ^ v40)) | v25 & 1) {
      return ((v40 != 2) & (((v41 & 1) == 0) ^ v40)) & v33;
    }
    return (v38 == v32) & ~v33;
  }
  if (v40 == 2) {
    char v37 = v25;
  }
  else {
    char v37 = 1;
  }
  if (v40 == 2) {
    uint64_t result = v33;
  }
  else {
    uint64_t result = 0;
  }
  if ((v37 & 1) == 0) {
    return (v38 == v32) & ~v33;
  }
  return result;
}

uint64_t type metadata accessor for SendSMSPenetrationRateEventFilter()
{
  return self;
}

uint64_t method lookup function for SendSMSPenetrationRateEventFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SendSMSPenetrationRateEventFilter);
}

void *FeaturizedConversationDataProvider.__allocating_init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = (void *)swift_allocObject();
  v8[4] = a3;
  long long v9 = (char *)v8 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  uint64_t v10 = sub_24C980720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9, a4, v10);
  v8[2] = a1;
  v8[3] = a2;
  return v8;
}

uint64_t FeaturizedConversationEvents.featurizedConversations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturizedConversationEvents.init(featurizedConversations:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *FeaturizedConversationDataProvider.init(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  unint64_t v8 = (char *)v4 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  uint64_t v9 = sub_24C980720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a4, v9);
  v4[2] = a1;
  v4[3] = a2;
  return v4;
}

uint64_t sub_24C976350(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24C976370, 0, 0);
}

uint64_t sub_24C976370()
{
  uint64_t v1 = v0[4];
  sub_24C980580();
  v0[5] = sub_24C980570();
  uint64_t v2 = *(void **)(*(void *)(v1 + 32) + 16);
  v0[6] = v2;
  uint64_t v3 = *(void *)(v1 + 24);
  unint64_t v7 = (uint64_t (*)(void *, uint64_t))((int)*MEMORY[0x263F39680] + MEMORY[0x263F39680]);
  id v4 = v2;
  char v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  *char v5 = v0;
  v5[1] = sub_24C97645C;
  return v7(v2, v3);
}

uint64_t sub_24C97645C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    id v4 = sub_24C976718;
  }
  else
  {

    id v4 = sub_24C976578;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24C976578()
{
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_24C980700();
  os_log_type_t v2 = sub_24C980920();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = *(void *)(v0 + 64);
  if (v3)
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v5 = 134217984;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_24C980A60();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v7 = *(void **)(v0 + 40);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v6;
    sub_24C980950();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24C953000, v1, v2, "marker: fetched SELF conversations, count=%ld", v5, 0xCu);
    MEMORY[0x253303270](v5, -1, -1);
  }
  else
  {
    unint64_t v7 = *(void **)(v0 + 40);
    swift_bridgeObjectRelease_n();
  }

  **(void **)(v0 + 24) = *(void *)(v0 + 64);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_24C976718()
{
  uint64_t v1 = *(void **)(v0 + 40);

  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t FeaturizedConversationDataProvider.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FeaturizedConversationDataProvider.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11DeepThought34FeaturizedConversationDataProvider_logger;
  uint64_t v2 = sub_24C980720();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24C9768A4(uint64_t a1)
{
  uint64_t v4 = *v1;
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24C95F9C4;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_24C976370, 0, 0);
}

unint64_t sub_24C976958()
{
  unint64_t result = qword_2697FF138;
  if (!qword_2697FF138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF138);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeaturizedConversationEvents()
{
  return &type metadata for FeaturizedConversationEvents;
}

uint64_t sub_24C9769BC()
{
  return type metadata accessor for FeaturizedConversationDataProvider();
}

uint64_t type metadata accessor for FeaturizedConversationDataProvider()
{
  uint64_t result = qword_2697FF148;
  if (!qword_2697FF148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C976A10()
{
  uint64_t result = sub_24C980720();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FeaturizedConversationDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeaturizedConversationDataProvider);
}

uint64_t dispatch thunk of FeaturizedConversationDataProvider.__allocating_init(_:_:_:_:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FeaturizedConversationDataProvider.loadData()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 120) + **(int **)(*(void *)v1 + 120));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24C95F9C4;
  return v6(a1);
}

uint64_t ProductArea.getODMTaskType()()
{
  return dword_24C9835F0[*v0];
}

uint64_t AggregationKeys.init(aggregationStartTimeSince2001:aggregationIntervalInDays:siriInputLocale:viewMode:audioInputRoute:taskType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, double a10@<D0>)
{
  char v10 = *a8;
  *(_DWORD *)a9 = result;
  *(double *)(a9 + 8) = a10;
  *(void *)(a9 + 16) = a2;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(unsigned char *)(a9 + 64) = v10;
  return result;
}

uint64_t AggregationKeys.description.getter()
{
  uint64_t v1 = sub_24C9800F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v5 = *v0;
  uint64_t v6 = *((void *)v0 + 6);
  v8[1] = *((void *)v0 + 4);
  v8[2] = v6;
  int v9 = *((unsigned __int8 *)v0 + 64);
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_24C9809B0();
  sub_24C980830();
  int v10 = v5;
  sub_24C980B80();
  sub_24C980830();
  swift_bridgeObjectRelease();
  sub_24C980830();
  sub_24C9808F0();
  sub_24C980830();
  sub_24C9800A0();
  sub_24C957480();
  sub_24C980B80();
  sub_24C980830();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_24C980830();
  swift_bridgeObjectRetain();
  sub_24C980830();
  swift_bridgeObjectRelease();
  sub_24C980830();
  swift_bridgeObjectRetain();
  sub_24C980830();
  swift_bridgeObjectRelease();
  sub_24C980830();
  swift_bridgeObjectRetain();
  sub_24C980830();
  swift_bridgeObjectRelease();
  sub_24C980830();
  LOBYTE(v10) = v9;
  sub_24C980A30();
  return v11;
}

uint64_t ProductArea.getBiomeProductArea()()
{
  return *v0 + 1;
}

uint64_t static ProductArea.MessagingType.== infix(_:_:)()
{
  return 1;
}

uint64_t ProductArea.MessagingType.hash(into:)()
{
  return sub_24C980BD0();
}

uint64_t sub_24C976F58()
{
  return 1;
}

uint64_t sub_24C976F64()
{
  return sub_24C980BD0();
}

uint64_t sub_24C976F90()
{
  return 0x534D535F444E4553;
}

uint64_t sub_24C976FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x534D535F444E4553 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24C980B90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24C977040()
{
  return 0;
}

void sub_24C97704C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24C977058(uint64_t a1)
{
  unint64_t v2 = sub_24C97A8F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C977094(uint64_t a1)
{
  unint64_t v2 = sub_24C97A8F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C9770D0()
{
  return 0;
}

uint64_t sub_24C9770DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24C97710C(uint64_t a1)
{
  unint64_t v2 = sub_24C97A944();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C977148(uint64_t a1)
{
  unint64_t v2 = sub_24C97A944();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProductArea.MessagingType.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF160);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF168);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A8F0();
  sub_24C980C30();
  sub_24C97A944();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.MessagingType.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF180);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF188);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A8F0();
  sub_24C980C20();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_24C980B10() + 16) == 1)
    {
      sub_24C97A944();
      sub_24C980AB0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_24C980A10();
      swift_allocError();
      unint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF190);
      *unint64_t v13 = &type metadata for ProductArea.MessagingType;
      sub_24C980AC0();
      sub_24C980A00();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24C977640(void *a1)
{
  return ProductArea.MessagingType.init(from:)(a1);
}

uint64_t sub_24C977658(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF160);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF168);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A8F0();
  sub_24C980C30();
  sub_24C97A944();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static ProductArea.RemindersType.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_24C977830()
{
  return 0x494D45525F544553;
}

uint64_t sub_24C977850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x494D45525F544553 && a2 == 0xEC0000005245444ELL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24C980B90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24C977900(uint64_t a1)
{
  unint64_t v2 = sub_24C97A998();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C97793C(uint64_t a1)
{
  unint64_t v2 = sub_24C97A998();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C977978(uint64_t a1)
{
  unint64_t v2 = sub_24C97A9EC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C9779B4(uint64_t a1)
{
  unint64_t v2 = sub_24C97A9EC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProductArea.RemindersType.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF198);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1A0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A998();
  sub_24C980C30();
  sub_24C97A9EC();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.RemindersType.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1B8);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1C0);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A998();
  sub_24C980C20();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_24C980B10() + 16) == 1)
    {
      sub_24C97A9EC();
      sub_24C980AB0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_24C980A10();
      swift_allocError();
      unint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF190);
      *unint64_t v13 = &type metadata for ProductArea.RemindersType;
      sub_24C980AC0();
      sub_24C980A00();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24C977EAC(void *a1)
{
  return ProductArea.RemindersType.init(from:)(a1);
}

uint64_t sub_24C977EC4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF198);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1A0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97A998();
  sub_24C980C30();
  sub_24C97A9EC();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static ProductArea.PhoneCallType.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_24C97809C()
{
  return 0x41435F5452415453;
}

uint64_t sub_24C9780B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x41435F5452415453 && a2 == 0xEA00000000004C4CLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24C980B90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24C97815C(uint64_t a1)
{
  unint64_t v2 = sub_24C97AA40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978198(uint64_t a1)
{
  unint64_t v2 = sub_24C97AA40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C9781D4(uint64_t a1)
{
  unint64_t v2 = sub_24C97AA94();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978210(uint64_t a1)
{
  unint64_t v2 = sub_24C97AA94();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProductArea.PhoneCallType.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1C8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1D0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AA40();
  sub_24C980C30();
  sub_24C97AA94();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t _s11DeepThought11ProductAreaO13MessagingTypeO9hashValueSivg_0()
{
  return sub_24C980C00();
}

uint64_t ProductArea.PhoneCallType.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1E8);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1F0);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AA40();
  sub_24C980C20();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_24C980B10() + 16) == 1)
    {
      sub_24C97AA94();
      sub_24C980AB0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_24C980A10();
      swift_allocError();
      unint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF190);
      *unint64_t v13 = &type metadata for ProductArea.PhoneCallType;
      sub_24C980AC0();
      sub_24C980A00();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24C97874C(void *a1)
{
  return ProductArea.PhoneCallType.init(from:)(a1);
}

uint64_t sub_24C978764(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1C8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1D0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AA40();
  sub_24C980C30();
  sub_24C97AA94();
  sub_24C980B20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t ProductArea.hash(into:)()
{
  return sub_24C980BD0();
}

uint64_t static ProductArea.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1)
    {
      if (v2 == 1) {
        return 1;
      }
    }
    else if (v2 == 2)
    {
      return 1;
    }
  }
  else if (!*a2)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_24C9789B8()
{
  uint64_t v1 = 0x7265646E696D6552;
  if (*v0 != 1) {
    uint64_t v1 = 0x6C6143656E6F6850;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E6967617373654DLL;
  }
}

uint64_t sub_24C978A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C97E528(a1, a2);
  *a3 = result;
  return result;
}

void sub_24C978A40(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24C978A4C(uint64_t a1)
{
  unint64_t v2 = sub_24C97AAE8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978A88(uint64_t a1)
{
  unint64_t v2 = sub_24C97AAE8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C978AC4()
{
  return 0x657079546B736174;
}

uint64_t sub_24C978AE0(uint64_t a1)
{
  unint64_t v2 = sub_24C97AC8C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978B1C(uint64_t a1)
{
  unint64_t v2 = sub_24C97AC8C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C978B58(uint64_t a1)
{
  unint64_t v2 = sub_24C97AB3C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978B94(uint64_t a1)
{
  unint64_t v2 = sub_24C97AB3C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24C978BD0()
{
  return sub_24C980C00();
}

uint64_t sub_24C978C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x657079546B736174 && a2 == 0xE800000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_24C980B90();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24C978CA8(uint64_t a1)
{
  unint64_t v2 = sub_24C97ABE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C978CE4(uint64_t a1)
{
  unint64_t v2 = sub_24C97ABE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ProductArea.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF1F8);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  char v25 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF200);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF208);
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF210);
  uint64_t v12 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  char v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AAE8();
  sub_24C980C30();
  if (v15)
  {
    if (v15 == 1)
    {
      char v30 = 1;
      sub_24C97ABE4();
      uint64_t v16 = v28;
      sub_24C980B20();
      sub_24C97AC38();
      uint64_t v17 = v24;
      sub_24C980B50();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v17);
    }
    else
    {
      char v31 = 2;
      sub_24C97AB3C();
      uint64_t v20 = v25;
      uint64_t v16 = v28;
      sub_24C980B20();
      sub_24C97AB90();
      uint64_t v21 = v27;
      sub_24C980B50();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v21);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  }
  else
  {
    char v29 = 0;
    sub_24C97AC8C();
    uint64_t v18 = v28;
    sub_24C980B20();
    sub_24C97ACE0();
    sub_24C980B50();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v18);
  }
}

uint64_t ProductArea.hashValue.getter()
{
  return sub_24C980C00();
}

uint64_t ProductArea.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  char v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF250);
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  char v36 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF258);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  uint64_t v34 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF260);
  uint64_t v32 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF268);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  char v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_24C97AAE8();
  uint64_t v17 = v38;
  sub_24C980C20();
  if (!v17)
  {
    uint64_t v18 = v36;
    uint64_t v38 = v13;
    uint64_t v19 = sub_24C980B10();
    if (*(void *)(v19 + 16) == 1)
    {
      uint64_t v29 = v19;
      int v20 = *(unsigned __int8 *)(v19 + 32);
      if (*(unsigned char *)(v19 + 32))
      {
        if (v20 != 1)
        {
          char v41 = 2;
          sub_24C97AB3C();
          sub_24C980AB0();
          sub_24C97AD34();
          uint64_t v27 = v31;
          sub_24C980AF0();
          uint64_t v28 = v38;
          (*(void (**)(char *, uint64_t))(v30 + 8))(v18, v27);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v12);
          uint64_t v25 = (uint64_t)v37;
          goto LABEL_12;
        }
        char v40 = 1;
        sub_24C97ABE4();
        sub_24C980AB0();
        sub_24C97AD88();
        uint64_t v21 = v33;
        sub_24C980AF0();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v21);
      }
      else
      {
        char v39 = 0;
        sub_24C97AC8C();
        sub_24C980AB0();
        sub_24C97ADDC();
        sub_24C980AF0();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v12);
      uint64_t v25 = (uint64_t)v37;
LABEL_12:
      *char v35 = v20;
      return __swift_destroy_boxed_opaque_existential_1(v25);
    }
    uint64_t v22 = sub_24C980A10();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF190);
    *uint64_t v24 = &type metadata for ProductArea;
    sub_24C980AC0();
    sub_24C980A00();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v12);
  }
  uint64_t v25 = (uint64_t)v37;
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

uint64_t sub_24C979788()
{
  return sub_24C980C00();
}

uint64_t sub_24C9797DC()
{
  return sub_24C980BD0();
}

uint64_t sub_24C979810()
{
  return sub_24C980C00();
}

uint64_t sub_24C979860@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return ProductArea.init(from:)(a1, a2);
}

uint64_t sub_24C979878(void *a1)
{
  return ProductArea.encode(to:)(a1);
}

BOOL sub_24C979890(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a2;
  if (*a1)
  {
    if (*a1 == 1) {
      return v2 == 1;
    }
    if (v2 != 2) {
      return 0;
    }
  }
  else if (*a2)
  {
    return 0;
  }
  return 1;
}

uint64_t AggregationInterval.aggregationIntervalInDays.getter()
{
  return *v0;
}

double AggregationInterval.aggregationIntervalStartTimestampInSecondsSince2001.getter()
{
  return *(double *)(v0 + 8);
}

uint64_t AggregationInterval.init(aggregationIntervalInDays:aggregationIntervalStartTimestampInSecondsSince2001:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  *(_DWORD *)a2 = result;
  *(double *)(a2 + 8) = a3;
  return result;
}

uint64_t AggregationInterval.hash(into:)()
{
  return sub_24C980BF0();
}

BOOL static AggregationInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

BOOL sub_24C979958(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24C979970()
{
  return sub_24C980C00();
}

uint64_t sub_24C9799B8()
{
  return sub_24C980BD0();
}

uint64_t sub_24C9799E4()
{
  return sub_24C980C00();
}

unint64_t sub_24C979A28()
{
  if (*v0) {
    return 0xD000000000000033;
  }
  else {
    return 0xD000000000000019;
  }
}

uint64_t sub_24C979A68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C97E68C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24C979A90(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24C979A9C(uint64_t a1)
{
  unint64_t v2 = sub_24C97AE30();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C979AD8(uint64_t a1)
{
  unint64_t v2 = sub_24C97AE30();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AggregationInterval.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF288);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AE30();
  sub_24C980C30();
  v8[15] = 0;
  sub_24C980B60();
  if (!v1)
  {
    v8[14] = 1;
    sub_24C980B40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t AggregationInterval.hashValue.getter()
{
  return sub_24C980C00();
}

uint64_t AggregationInterval.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF298);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97AE30();
  sub_24C980C20();
  if (!v2)
  {
    v13[15] = 0;
    int v9 = sub_24C980B00();
    v13[14] = 1;
    sub_24C980AE0();
    uint64_t v11 = v10;
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a2 = v9;
    *(void *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24C979E9C()
{
  return sub_24C980BF0();
}

uint64_t sub_24C979EE0()
{
  return sub_24C980C00();
}

uint64_t sub_24C979F40@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AggregationInterval.init(from:)(a1, a2);
}

uint64_t sub_24C979F58(void *a1)
{
  return AggregationInterval.encode(to:)(a1);
}

BOOL sub_24C979F70(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
}

uint64_t DynamicDimensions.hash(into:)()
{
  return sub_24C980BD0();
}

uint64_t sub_24C97A05C()
{
  uint64_t result = 0x75706E4969726973;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x65646F4D77656976;
      break;
    case 2:
      uint64_t result = 0x746E496F69647561;
      break;
    case 3:
      uint64_t result = 0x41746375646F7270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C97A10C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C97E778(a1, a2);
  *a3 = result;
  return result;
}

void sub_24C97A134(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24C97A140(uint64_t a1)
{
  unint64_t v2 = sub_24C97C188();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C97A17C(uint64_t a1)
{
  unint64_t v2 = sub_24C97C188();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DynamicDimensions.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF2A0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v15 = *(void *)(v1 + 24);
  uint64_t v16 = v7;
  uint64_t v8 = *(void *)(v1 + 32);
  uint64_t v13 = *(void *)(v1 + 40);
  uint64_t v14 = v8;
  HIDWORD(v12) = *(unsigned __int8 *)(v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C188();
  sub_24C980C30();
  char v22 = 0;
  uint64_t v9 = v17;
  sub_24C980B30();
  if (!v9)
  {
    char v10 = BYTE4(v12);
    char v21 = 1;
    sub_24C980B30();
    char v20 = 2;
    sub_24C980B30();
    char v19 = v10;
    char v18 = 3;
    sub_24C97C1DC();
    sub_24C980B50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t DynamicDimensions.hashValue.getter()
{
  return sub_24C980C00();
}

uint64_t DynamicDimensions.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF2B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C188();
  sub_24C980C20();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v30 = 0;
  uint64_t v9 = sub_24C980AD0();
  uint64_t v11 = v10;
  uint64_t v24 = v9;
  char v29 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_24C980AD0();
  uint64_t v25 = v13;
  uint64_t v23 = v12;
  char v28 = 2;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_24C980AD0();
  char v26 = 3;
  uint64_t v15 = v14;
  sub_24C97C230();
  uint64_t v22 = v15;
  swift_bridgeObjectRetain();
  sub_24C980AF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v17 = v27;
  uint64_t v18 = v25;
  *(void *)a2 = v24;
  *(void *)(a2 + 8) = v11;
  uint64_t v19 = v22;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v21;
  *(void *)(a2 + 40) = v19;
  *(unsigned char *)(a2 + 48) = v17;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C97A7BC()
{
  return sub_24C980C00();
}

uint64_t sub_24C97A890@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DynamicDimensions.init(from:)(a1, a2);
}

uint64_t sub_24C97A8A8(void *a1)
{
  return DynamicDimensions.encode(to:)(a1);
}

double AggregationKeys.init(aggregationInterval:dimension:)@<D0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  double result = *(double *)(a1 + 8);
  long long v4 = *a2;
  long long v5 = a2[1];
  uint64_t v6 = *((void *)a2 + 4);
  uint64_t v7 = *((void *)a2 + 5);
  char v8 = *((unsigned char *)a2 + 48);
  *(_DWORD *)a3 = *(_DWORD *)a1;
  *(double *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 16) = v4;
  *(_OWORD *)(a3 + 32) = v5;
  *(void *)(a3 + 48) = v6;
  *(void *)(a3 + 56) = v7;
  *(unsigned char *)(a3 + 64) = v8;
  return result;
}

unint64_t sub_24C97A8F0()
{
  unint64_t result = qword_2697FF170;
  if (!qword_2697FF170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF170);
  }
  return result;
}

unint64_t sub_24C97A944()
{
  unint64_t result = qword_2697FF178;
  if (!qword_2697FF178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF178);
  }
  return result;
}

unint64_t sub_24C97A998()
{
  unint64_t result = qword_2697FF1A8;
  if (!qword_2697FF1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF1A8);
  }
  return result;
}

unint64_t sub_24C97A9EC()
{
  unint64_t result = qword_2697FF1B0;
  if (!qword_2697FF1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF1B0);
  }
  return result;
}

unint64_t sub_24C97AA40()
{
  unint64_t result = qword_2697FF1D8;
  if (!qword_2697FF1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF1D8);
  }
  return result;
}

unint64_t sub_24C97AA94()
{
  unint64_t result = qword_2697FF1E0;
  if (!qword_2697FF1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF1E0);
  }
  return result;
}

unint64_t sub_24C97AAE8()
{
  unint64_t result = qword_2697FF218;
  if (!qword_2697FF218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF218);
  }
  return result;
}

unint64_t sub_24C97AB3C()
{
  unint64_t result = qword_2697FF220;
  if (!qword_2697FF220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF220);
  }
  return result;
}

unint64_t sub_24C97AB90()
{
  unint64_t result = qword_2697FF228;
  if (!qword_2697FF228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF228);
  }
  return result;
}

unint64_t sub_24C97ABE4()
{
  unint64_t result = qword_2697FF230;
  if (!qword_2697FF230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF230);
  }
  return result;
}

unint64_t sub_24C97AC38()
{
  unint64_t result = qword_2697FF238;
  if (!qword_2697FF238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF238);
  }
  return result;
}

unint64_t sub_24C97AC8C()
{
  unint64_t result = qword_2697FF240;
  if (!qword_2697FF240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF240);
  }
  return result;
}

unint64_t sub_24C97ACE0()
{
  unint64_t result = qword_2697FF248;
  if (!qword_2697FF248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF248);
  }
  return result;
}

unint64_t sub_24C97AD34()
{
  unint64_t result = qword_2697FF270;
  if (!qword_2697FF270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF270);
  }
  return result;
}

unint64_t sub_24C97AD88()
{
  unint64_t result = qword_2697FF278;
  if (!qword_2697FF278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF278);
  }
  return result;
}

unint64_t sub_24C97ADDC()
{
  unint64_t result = qword_2697FF280;
  if (!qword_2697FF280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF280);
  }
  return result;
}

unint64_t sub_24C97AE30()
{
  unint64_t result = qword_2697FF290;
  if (!qword_2697FF290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF290);
  }
  return result;
}

uint64_t AggregationKeys.hash(into:)()
{
  sub_24C980BE0();
  sub_24C980BF0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24C980800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C980800();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C980800();
  swift_bridgeObjectRelease();
  sub_24C980BD0();
  sub_24C980BD0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t AggregationKeys.hashValue.getter()
{
  return sub_24C980C00();
}

unint64_t sub_24C97B00C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C97B090()
{
  return sub_24C980C00();
}

uint64_t sub_24C97B104()
{
  return sub_24C980C00();
}

BOOL sub_24C97B174(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24C97B188()
{
  return sub_24C97B00C(*v0);
}

uint64_t sub_24C97B190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C97E994(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C97B1B8(uint64_t a1)
{
  unint64_t v2 = sub_24C97C284();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C97B1F4(uint64_t a1)
{
  unint64_t v2 = sub_24C97C284();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TaskCounts.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF2C8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v10[6] = v1[1];
  int v8 = v1[2];
  v10[2] = v1[3];
  v10[3] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C284();
  sub_24C980C30();
  char v14 = 0;
  sub_24C980B60();
  if (!v2)
  {
    char v13 = 1;
    sub_24C980B60();
    char v12 = 2;
    sub_24C980B60();
    char v11 = 3;
    sub_24C980B60();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t TaskCounts.init(from:)@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF2D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C284();
  sub_24C980C20();
  if (!v2)
  {
    char v18 = 0;
    int v9 = sub_24C980B00();
    char v17 = 1;
    int v10 = sub_24C980B00();
    char v16 = 2;
    int v14 = sub_24C980B00();
    char v15 = 3;
    int v12 = sub_24C980B00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v14;
    a2[3] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24C97B5F0@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  return TaskCounts.init(from:)(a1, a2);
}

uint64_t sub_24C97B608(void *a1)
{
  return TaskCounts.encode(to:)(a1);
}

uint64_t CountsReported.description.getter()
{
  return 0;
}

unint64_t sub_24C97B8FC()
{
  uint64_t v1 = 0x6F69736E656D6964;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E756F436B736174;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_24C97B960@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C97EB2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C97B988(uint64_t a1)
{
  unint64_t v2 = sub_24C97C2D8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C97B9C4(uint64_t a1)
{
  unint64_t v2 = sub_24C97C2D8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CountsReported.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF2E0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = *v1;
  uint64_t v9 = *((void *)v1 + 1);
  uint64_t v10 = *((void *)v1 + 2);
  uint64_t v21 = *((void *)v1 + 3);
  uint64_t v22 = v10;
  uint64_t v11 = *((void *)v1 + 4);
  uint64_t v19 = *((void *)v1 + 5);
  uint64_t v20 = v11;
  uint64_t v12 = *((void *)v1 + 6);
  uint64_t v17 = *((void *)v1 + 7);
  uint64_t v18 = v12;
  HIDWORD(v16) = *((unsigned __int8 *)v1 + 64);
  uint64_t v13 = *(void *)(v1 + 17);
  uint64_t v14 = *(void *)(v1 + 19);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C2D8();
  sub_24C980C30();
  LODWORD(v23) = v8;
  uint64_t v24 = v9;
  char v30 = 0;
  sub_24C973144();
  sub_24C980B50();
  if (!v2)
  {
    uint64_t v23 = v22;
    uint64_t v24 = v21;
    uint64_t v25 = v20;
    uint64_t v26 = v19;
    uint64_t v27 = v18;
    uint64_t v28 = v17;
    char v29 = BYTE4(v16);
    char v30 = 1;
    sub_24C97C32C();
    sub_24C980B50();
    uint64_t v23 = v13;
    uint64_t v24 = v14;
    char v30 = 2;
    sub_24C97C380();
    sub_24C980B50();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t CountsReported.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FF300);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C97C2D8();
  sub_24C980C20();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v29 = 0;
  sub_24C97C3D4();
  sub_24C980AF0();
  int v9 = v23;
  uint64_t v10 = *((void *)&v23 + 1);
  char v29 = 1;
  sub_24C97C428();
  sub_24C980AF0();
  int v21 = v9;
  uint64_t v11 = *((void *)&v23 + 1);
  uint64_t v12 = v25;
  uint64_t v19 = v24;
  uint64_t v20 = v23;
  uint64_t v13 = v27;
  uint64_t v18 = v26;
  HIDWORD(v17) = v28;
  char v29 = 2;
  sub_24C97C47C();
  uint64_t v22 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24C980AF0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v14 = v23;
  *(_DWORD *)a2 = v21;
  *(void *)(a2 + 8) = v10;
  uint64_t v15 = v22;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v12;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v13;
  *(unsigned char *)(a2 + 64) = BYTE4(v17);
  *(_OWORD *)(a2 + 68) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C97BF08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CountsReported.init(from:)(a1, a2);
}

uint64_t sub_24C97BF20(void *a1)
{
  return CountsReported.encode(to:)(a1);
}

uint64_t _s11DeepThought15AggregationKeysV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (*(_DWORD *)a1 == *(_DWORD *)a2 && *(double *)(a1 + 8) == *(double *)(a2 + 8))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v9 = *(void *)(a2 + 32);
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v11 = *(void *)(a2 + 48);
    uint64_t v12 = *(void *)(a2 + 56);
    int v13 = *(unsigned __int8 *)(a2 + 64);
    if ((*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)
       || (sub_24C980B90() & 1) != 0)
      && (v4 == v9 && v5 == v10 || (sub_24C980B90() & 1) != 0)
      && (v6 == v11 && v7 == v12 || (sub_24C980B90() & 1) != 0))
    {
      if (v8)
      {
        if (v8 == 1)
        {
          if (v13 == 1) {
            return 1;
          }
        }
        else if (v13 == 2)
        {
          return 1;
        }
      }
      else if (!v13)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s11DeepThought17DynamicDimensionsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  int v11 = *(unsigned __int8 *)(a2 + 48);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)
    || (v12 = sub_24C980B90(), uint64_t result = 0, (v12 & 1) != 0))
  {
    if (v2 == v7 && v4 == v8 || (v14 = sub_24C980B90(), uint64_t result = 0, (v14 & 1) != 0))
    {
      if (v3 == v9 && v5 == v10 || (v15 = sub_24C980B90(), uint64_t result = 0, (v15 & 1) != 0))
      {
        if (v6)
        {
          if (v6 == 1)
          {
            if (v11 == 1) {
              return 1;
            }
          }
          else if (v11 == 2)
          {
            return 1;
          }
        }
        else if (!v11)
        {
          return 1;
        }
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_24C97C188()
{
  unint64_t result = qword_2697FF2A8;
  if (!qword_2697FF2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2A8);
  }
  return result;
}

unint64_t sub_24C97C1DC()
{
  unint64_t result = qword_2697FF2B0;
  if (!qword_2697FF2B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2B0);
  }
  return result;
}

unint64_t sub_24C97C230()
{
  unint64_t result = qword_2697FF2C0;
  if (!qword_2697FF2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2C0);
  }
  return result;
}

unint64_t sub_24C97C284()
{
  unint64_t result = qword_2697FF2D0;
  if (!qword_2697FF2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2D0);
  }
  return result;
}

unint64_t sub_24C97C2D8()
{
  unint64_t result = qword_2697FF2E8;
  if (!qword_2697FF2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2E8);
  }
  return result;
}

unint64_t sub_24C97C32C()
{
  unint64_t result = qword_2697FF2F0;
  if (!qword_2697FF2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2F0);
  }
  return result;
}

unint64_t sub_24C97C380()
{
  unint64_t result = qword_2697FF2F8;
  if (!qword_2697FF2F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF2F8);
  }
  return result;
}

unint64_t sub_24C97C3D4()
{
  unint64_t result = qword_2697FF308;
  if (!qword_2697FF308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF308);
  }
  return result;
}

unint64_t sub_24C97C428()
{
  unint64_t result = qword_2697FF310;
  if (!qword_2697FF310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF310);
  }
  return result;
}

unint64_t sub_24C97C47C()
{
  unint64_t result = qword_2697FF318;
  if (!qword_2697FF318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF318);
  }
  return result;
}

unint64_t sub_24C97C4D4()
{
  unint64_t result = qword_2697FF320;
  if (!qword_2697FF320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF320);
  }
  return result;
}

unint64_t sub_24C97C52C()
{
  unint64_t result = qword_2697FF328;
  if (!qword_2697FF328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF328);
  }
  return result;
}

unint64_t sub_24C97C584()
{
  unint64_t result = qword_2697FF330;
  if (!qword_2697FF330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF330);
  }
  return result;
}

unint64_t sub_24C97C5DC()
{
  unint64_t result = qword_2697FF338;
  if (!qword_2697FF338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF338);
  }
  return result;
}

unint64_t sub_24C97C634()
{
  unint64_t result = qword_2697FF340;
  if (!qword_2697FF340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF340);
  }
  return result;
}

unint64_t sub_24C97C68C()
{
  unint64_t result = qword_2697FF348;
  if (!qword_2697FF348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF348);
  }
  return result;
}

unint64_t sub_24C97C6E4()
{
  unint64_t result = qword_2697FF350;
  if (!qword_2697FF350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF350);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProductArea(unsigned __int8 *a1, unsigned int a2)
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
  if (v6 <= 2) {
    int v7 = -1;
  }
  else {
    int v7 = v6 ^ 0xFF;
  }
  return (v7 + 1);
}

unsigned char *storeEnumTagSinglePayload for ProductArea(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C97C8A8);
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
          *unint64_t result = -(char)a2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductArea()
{
  return &type metadata for ProductArea;
}

uint64_t sub_24C97C8EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType()
{
  return &type metadata for ProductArea.MessagingType;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType()
{
  return &type metadata for ProductArea.RemindersType;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType()
{
  return &type metadata for ProductArea.PhoneCallType;
}

uint64_t storeEnumTagSinglePayload for AggregationInterval(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
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

ValueMetadata *type metadata accessor for AggregationInterval()
{
  return &type metadata for AggregationInterval;
}

uint64_t destroy for DynamicDimensions()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DynamicDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DynamicDimensions(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DynamicDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicDimensions(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DynamicDimensions(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensions()
{
  return &type metadata for DynamicDimensions;
}

uint64_t initializeWithCopy for AggregationKeys(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AggregationKeys(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
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
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AggregationKeys(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for AggregationKeys(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AggregationKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AggregationKeys()
{
  return &type metadata for AggregationKeys;
}

__n128 __swift_memcpy16_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TaskCounts(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

ValueMetadata *type metadata accessor for TaskCounts()
{
  return &type metadata for TaskCounts;
}

uint64_t _s11DeepThought14CountsReportedVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CountsReported(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 68) = *(_OWORD *)(a2 + 68);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CountsReported(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
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
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy84_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for CountsReported(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 68) = *(_OWORD *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for CountsReported(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 84)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CountsReported(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 84) = 1;
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
    *(unsigned char *)(result + 84) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CountsReported()
{
  return &type metadata for CountsReported;
}

ValueMetadata *type metadata accessor for CountsReported.CodingKeys()
{
  return &type metadata for CountsReported.CodingKeys;
}

uint64_t sub_24C97D134(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24C97D13C(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskCounts.CodingKeys()
{
  return &type metadata for TaskCounts.CodingKeys;
}

uint64_t _s11DeepThought10TaskCountsV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s11DeepThought10TaskCountsV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24C97D2B0);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicDimensions.CodingKeys()
{
  return &type metadata for DynamicDimensions.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AggregationInterval.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AggregationInterval.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24C97D444);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24C97D46C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AggregationInterval.CodingKeys()
{
  return &type metadata for AggregationInterval.CodingKeys;
}

uint64_t _s11DeepThought14CountsReportedV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s11DeepThought14CountsReportedV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x24C97D5E4);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductArea.CodingKeys()
{
  return &type metadata for ProductArea.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingCodingKeys()
{
  return &type metadata for ProductArea.MessagingCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersCodingKeys()
{
  return &type metadata for ProductArea.RemindersCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallCodingKeys()
{
  return &type metadata for ProductArea.PhoneCallCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType.CodingKeys()
{
  return &type metadata for ProductArea.PhoneCallType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.PhoneCallType.START_CALLCodingKeys()
{
  return &type metadata for ProductArea.PhoneCallType.START_CALLCodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType.CodingKeys()
{
  return &type metadata for ProductArea.RemindersType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.RemindersType.SET_REMINDERCodingKeys()
{
  return &type metadata for ProductArea.RemindersType.SET_REMINDERCodingKeys;
}

uint64_t _s11DeepThought11ProductAreaO13MessagingTypeOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s11DeepThought11ProductAreaO13MessagingTypeOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24C97D778);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType.CodingKeys()
{
  return &type metadata for ProductArea.MessagingType.CodingKeys;
}

ValueMetadata *type metadata accessor for ProductArea.MessagingType.SEND_SMSCodingKeys()
{
  return &type metadata for ProductArea.MessagingType.SEND_SMSCodingKeys;
}

unint64_t sub_24C97D7C4()
{
  unint64_t result = qword_2697FF358;
  if (!qword_2697FF358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF358);
  }
  return result;
}

unint64_t sub_24C97D81C()
{
  unint64_t result = qword_2697FF360;
  if (!qword_2697FF360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF360);
  }
  return result;
}

unint64_t sub_24C97D874()
{
  unint64_t result = qword_2697FF368;
  if (!qword_2697FF368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF368);
  }
  return result;
}

unint64_t sub_24C97D8CC()
{
  unint64_t result = qword_2697FF370;
  if (!qword_2697FF370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF370);
  }
  return result;
}

unint64_t sub_24C97D924()
{
  unint64_t result = qword_2697FF378;
  if (!qword_2697FF378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF378);
  }
  return result;
}

unint64_t sub_24C97D97C()
{
  unint64_t result = qword_2697FF380;
  if (!qword_2697FF380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF380);
  }
  return result;
}

unint64_t sub_24C97D9D4()
{
  unint64_t result = qword_2697FF388;
  if (!qword_2697FF388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF388);
  }
  return result;
}

unint64_t sub_24C97DA2C()
{
  unint64_t result = qword_2697FF390;
  if (!qword_2697FF390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF390);
  }
  return result;
}

unint64_t sub_24C97DA84()
{
  unint64_t result = qword_2697FF398;
  if (!qword_2697FF398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF398);
  }
  return result;
}

unint64_t sub_24C97DADC()
{
  unint64_t result = qword_2697FF3A0;
  if (!qword_2697FF3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3A0);
  }
  return result;
}

unint64_t sub_24C97DB34()
{
  unint64_t result = qword_2697FF3A8;
  if (!qword_2697FF3A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3A8);
  }
  return result;
}

unint64_t sub_24C97DB8C()
{
  unint64_t result = qword_2697FF3B0;
  if (!qword_2697FF3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3B0);
  }
  return result;
}

unint64_t sub_24C97DBE4()
{
  unint64_t result = qword_2697FF3B8;
  if (!qword_2697FF3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3B8);
  }
  return result;
}

unint64_t sub_24C97DC3C()
{
  unint64_t result = qword_2697FF3C0;
  if (!qword_2697FF3C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3C0);
  }
  return result;
}

unint64_t sub_24C97DC94()
{
  unint64_t result = qword_2697FF3C8;
  if (!qword_2697FF3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3C8);
  }
  return result;
}

unint64_t sub_24C97DCEC()
{
  unint64_t result = qword_2697FF3D0;
  if (!qword_2697FF3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3D0);
  }
  return result;
}

unint64_t sub_24C97DD44()
{
  unint64_t result = qword_2697FF3D8;
  if (!qword_2697FF3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3D8);
  }
  return result;
}

unint64_t sub_24C97DD9C()
{
  unint64_t result = qword_2697FF3E0;
  if (!qword_2697FF3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3E0);
  }
  return result;
}

unint64_t sub_24C97DDF4()
{
  unint64_t result = qword_2697FF3E8;
  if (!qword_2697FF3E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3E8);
  }
  return result;
}

unint64_t sub_24C97DE4C()
{
  unint64_t result = qword_2697FF3F0;
  if (!qword_2697FF3F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3F0);
  }
  return result;
}

unint64_t sub_24C97DEA4()
{
  unint64_t result = qword_2697FF3F8;
  if (!qword_2697FF3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF3F8);
  }
  return result;
}

unint64_t sub_24C97DEFC()
{
  unint64_t result = qword_2697FF400;
  if (!qword_2697FF400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF400);
  }
  return result;
}

unint64_t sub_24C97DF54()
{
  unint64_t result = qword_2697FF408;
  if (!qword_2697FF408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF408);
  }
  return result;
}

unint64_t sub_24C97DFAC()
{
  unint64_t result = qword_2697FF410;
  if (!qword_2697FF410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF410);
  }
  return result;
}

unint64_t sub_24C97E004()
{
  unint64_t result = qword_2697FF418;
  if (!qword_2697FF418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF418);
  }
  return result;
}

unint64_t sub_24C97E05C()
{
  unint64_t result = qword_2697FF420;
  if (!qword_2697FF420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF420);
  }
  return result;
}

unint64_t sub_24C97E0B4()
{
  unint64_t result = qword_2697FF428;
  if (!qword_2697FF428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF428);
  }
  return result;
}

unint64_t sub_24C97E10C()
{
  unint64_t result = qword_2697FF430;
  if (!qword_2697FF430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF430);
  }
  return result;
}

unint64_t sub_24C97E164()
{
  unint64_t result = qword_2697FF438;
  if (!qword_2697FF438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF438);
  }
  return result;
}

unint64_t sub_24C97E1BC()
{
  unint64_t result = qword_2697FF440;
  if (!qword_2697FF440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF440);
  }
  return result;
}

unint64_t sub_24C97E214()
{
  unint64_t result = qword_2697FF448;
  if (!qword_2697FF448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF448);
  }
  return result;
}

unint64_t sub_24C97E26C()
{
  unint64_t result = qword_2697FF450;
  if (!qword_2697FF450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF450);
  }
  return result;
}

unint64_t sub_24C97E2C4()
{
  unint64_t result = qword_2697FF458;
  if (!qword_2697FF458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF458);
  }
  return result;
}

unint64_t sub_24C97E31C()
{
  unint64_t result = qword_2697FF460;
  if (!qword_2697FF460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF460);
  }
  return result;
}

unint64_t sub_24C97E374()
{
  unint64_t result = qword_2697FF468;
  if (!qword_2697FF468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF468);
  }
  return result;
}

unint64_t sub_24C97E3CC()
{
  unint64_t result = qword_2697FF470;
  if (!qword_2697FF470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF470);
  }
  return result;
}

unint64_t sub_24C97E424()
{
  unint64_t result = qword_2697FF478;
  if (!qword_2697FF478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF478);
  }
  return result;
}

unint64_t sub_24C97E47C()
{
  unint64_t result = qword_2697FF480;
  if (!qword_2697FF480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF480);
  }
  return result;
}

unint64_t sub_24C97E4D4()
{
  unint64_t result = qword_2697FF488;
  if (!qword_2697FF488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697FF488);
  }
  return result;
}

uint64_t sub_24C97E528(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6967617373654DLL && a2 == 0xE900000000000067;
  if (v2 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265646E696D6552 && a2 == 0xE900000000000073 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6143656E6F6850 && a2 == 0xE90000000000006CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24C980B90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24C97E68C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000019 && a2 == 0x800000024C9870D0 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000033 && a2 == 0x800000024C987650)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24C980B90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24C97E778(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x75706E4969726973 && a2 == 0xEF656C61636F4C74;
  if (v2 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65646F4D77656976 && a2 == 0xE800000000000000 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E496F69647561 && a2 == 0xEE00656361667265 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x41746375646F7270 && a2 == 0xEB00000000616572)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24C980B90();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24C97E994(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x800000024C987690 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024C9876B0 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024C9876D0 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024C9876F0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_24C980B90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24C97EB2C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024C987710 || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_24C980B90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F436B736174 && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24C980B90();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t static LocaleChangingPointUtils.findLocaleChangingPoint(date:localeChangingPoints:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  uint64_t v5 = sub_24C9800F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = *(void *)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  if (!v9)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_6;
  }
  uint64_t v21 = type metadata accessor for DateAndLocalePair();
  uint64_t v10 = *(void *)(v21 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = a2 + v11;
  char v13 = sub_24C9800C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v13)
  {
LABEL_6:
    uint64_t v15 = type metadata accessor for DateAndLocalePair();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v22, 1, 1, v15);
  }
  if (v9 == 1)
  {
    uint64_t v14 = a2 + v11;
  }
  else
  {
    uint64_t v17 = *(void *)(v10 + 72);
    sub_24C97F9EC(&qword_2697FE930, MEMORY[0x263F07490]);
    unint64_t v18 = a2 + v17 + v11;
    uint64_t v19 = 1;
    while (1)
    {
      uint64_t result = sub_24C980780();
      if (result) {
        break;
      }
      ++v19;
      v18 += v17;
      if (v9 == v19)
      {
        uint64_t v19 = v9;
        break;
      }
    }
    if (v19 - 1 >= v9)
    {
      __break(1u);
      return result;
    }
    uint64_t v14 = v12 + (v19 - 1) * v17;
  }
  uint64_t v20 = v22;
  sub_24C97F940(v14, v22);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v21);
}

uint64_t DateAndLocalePair.hash(into:)()
{
  sub_24C9800F0();
  sub_24C97F9EC(&qword_2697FF490, MEMORY[0x263F07490]);
  sub_24C980770();
  type metadata accessor for DateAndLocalePair();
  swift_bridgeObjectRetain();
  sub_24C980800();
  return swift_bridgeObjectRelease();
}

uint64_t static DateAndLocalePair.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_24C9800D0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for DateAndLocalePair() + 20);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = (void *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1]) {
    return 1;
  }
  return sub_24C980B90();
}

uint64_t DateAndLocalePair.hashValue.getter()
{
  return sub_24C980C00();
}

uint64_t sub_24C97F138()
{
  return sub_24C980C00();
}

uint64_t sub_24C97F1F8()
{
  sub_24C9800F0();
  sub_24C97F9EC(&qword_2697FF490, MEMORY[0x263F07490]);
  sub_24C980770();
  swift_bridgeObjectRetain();
  sub_24C980800();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C97F2AC()
{
  return sub_24C980C00();
}

uint64_t sub_24C97F368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_24C9800D0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  unint64_t v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_24C980B90();
}

unint64_t _s11DeepThought24LocaleChangingPointUtilsO03getcD6Points23featurizedConversationsSayAA07DateAndC4PairVGSay0aB15BiomeFoundation22FeaturizedConversationCG_tFZ_0(unint64_t a1)
{
  uint64_t v2 = type metadata accessor for DateAndLocalePair();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v42 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v41 = (uint64_t)&v30 - v5;
  uint64_t v40 = sub_24C9800F0();
  uint64_t v6 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_38;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
  {
LABEL_39:
    swift_bridgeObjectRelease();
    unint64_t v28 = MEMORY[0x263F8EE78];
    goto LABEL_40;
  }
LABEL_3:
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v34 = a1 & 0xC000000000000001;
  uint64_t v31 = a1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v32 = a1;
  unint64_t v30 = a1 + 32;
  char v37 = (void (**)(uint64_t, char *, unint64_t))(v6 + 16);
  uint64_t v12 = (void (**)(char *, uint64_t))(v6 + 8);
  unint64_t v43 = MEMORY[0x263F8EE78];
  unint64_t v46 = 0xE000000000000000;
  a1 = v40;
  uint64_t v33 = v9;
  do
  {
    if (v34)
    {
      uint64_t v13 = MEMORY[0x253302A70](v11, v32);
      BOOL v14 = __OFADD__(v11, 1);
      unint64_t v15 = v11 + 1;
      if (v14) {
        goto LABEL_35;
      }
    }
    else
    {
      if (v11 >= *(void *)(v31 + 16)) {
        goto LABEL_37;
      }
      uint64_t v13 = swift_retain();
      BOOL v14 = __OFADD__(v11, 1);
      unint64_t v15 = v11 + 1;
      if (v14)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
    }
    uint64_t v35 = v13;
    unint64_t v36 = v15;
    uint64_t v6 = v13;
    unint64_t v16 = sub_24C980560();
    unint64_t v17 = v16;
    if (v16 >> 62)
    {
      uint64_t v18 = sub_24C980A60();
      if (!v18) {
        goto LABEL_4;
      }
LABEL_14:
      sub_24C980380();
      if (v18 >= 1)
      {
        uint64_t v19 = 0;
        unint64_t v44 = v17 & 0xC000000000000001;
        unint64_t v45 = v17;
        while (1)
        {
          if (v44) {
            MEMORY[0x253302A70](v19, v17);
          }
          else {
            swift_retain();
          }
          sub_24C9805A0();
          sub_24C9800A0();
          sub_24C980370();
          sub_24C980590();
          swift_bridgeObjectRelease();
          unint64_t v20 = v48;
          if (v48)
          {
            uint64_t v6 = v47;
            if ((v47 != v10 || v48 != v46) && (sub_24C980B90() & 1) == 0)
            {
              swift_bridgeObjectRelease();
              uint64_t v21 = v41;
              (*v37)(v41, v8, a1);
              uint64_t v22 = (uint64_t *)(v21 + *(int *)(v39 + 20));
              *uint64_t v22 = v6;
              v22[1] = v20;
              sub_24C97F940(v21, v42);
              swift_bridgeObjectRetain();
              unint64_t v23 = v43;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v23 = sub_24C969798(0, *(void *)(v23 + 16) + 1, 1, v23);
              }
              unint64_t v25 = *(void *)(v23 + 16);
              unint64_t v24 = *(void *)(v23 + 24);
              unint64_t v43 = v23;
              if (v25 >= v24 >> 1) {
                unint64_t v43 = sub_24C969798(v24 > 1, v25 + 1, 1, v43);
              }
              uint64_t v26 = v42;
              unint64_t v27 = v43;
              *(void *)(v43 + 16) = v25 + 1;
              sub_24C96D00C(v26, v27+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v25);
              swift_release();
              sub_24C96D070(v41);
              a1 = v40;
              (*v12)(v8, v40);
              unint64_t v46 = v20;
              goto LABEL_18;
            }
            (*v12)(v8, a1);
            swift_bridgeObjectRelease();
          }
          else
          {
            (*v12)(v8, a1);
          }
          swift_release();
          uint64_t v6 = v10;
LABEL_18:
          ++v19;
          uint64_t v10 = v6;
          unint64_t v17 = v45;
          if (v18 == v19) {
            goto LABEL_5;
          }
        }
      }
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_24C980A60();
      if (!v9) {
        goto LABEL_39;
      }
      goto LABEL_3;
    }
    uint64_t v18 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v18) {
      goto LABEL_14;
    }
LABEL_4:
    uint64_t v6 = v10;
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v10 = v6;
    unint64_t v11 = v36;
  }
  while (v36 != v33);
  swift_bridgeObjectRelease();
  unint64_t v28 = v43;
LABEL_40:
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t type metadata accessor for DateAndLocalePair()
{
  uint64_t result = qword_2697FF4A0;
  if (!qword_2697FF4A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C97F940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DateAndLocalePair();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C97F9A4()
{
  return sub_24C97F9EC(&qword_2697FF498, (void (*)(uint64_t))type metadata accessor for DateAndLocalePair);
}

uint64_t sub_24C97F9EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for DateAndLocalePair(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C9800F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DateAndLocalePair(uint64_t a1)
{
  uint64_t v2 = sub_24C9800F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C9800F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C9800F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C9800F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C9800F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C97FDC4);
}

uint64_t sub_24C97FDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C9800F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DateAndLocalePair(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C97FE9C);
}

uint64_t sub_24C97FE9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C9800F0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24C97FF5C()
{
  uint64_t result = sub_24C9800F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocaleChangingPointUtils()
{
  return &type metadata for LocaleChangingPointUtils;
}

uint64_t sub_24C980000()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_24C980010()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_24C980020()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_24C980030()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24C980040()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24C980050()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24C980060()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_24C980070()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24C980080()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24C980090()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24C9800A0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24C9800B0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24C9800C0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24C9800D0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24C9800E0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24C9800F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24C980100()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24C980110()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24C980120()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24C980130()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24C980140()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C980150()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_24C980160()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_24C980170()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_24C980180()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_24C980190()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_24C9801A0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_24C9801B0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24C9801C0()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_24C9801D0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_24C9801E0()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_24C9801F0()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_24C980200()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_24C980210()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24C980220()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24C980230()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_24C980240()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24C980250()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24C980260()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_24C980270()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24C980280()
{
  return MEMORY[0x270F8C5C0]();
}

uint64_t sub_24C980290()
{
  return MEMORY[0x270F8C5D0]();
}

uint64_t sub_24C9802A0()
{
  return MEMORY[0x270F8C5D8]();
}

uint64_t sub_24C9802C0()
{
  return MEMORY[0x270F255E8]();
}

uint64_t sub_24C9802D0()
{
  return MEMORY[0x270F255F0]();
}

uint64_t sub_24C9802E0()
{
  return MEMORY[0x270F255F8]();
}

uint64_t sub_24C9802F0()
{
  return MEMORY[0x270F25600]();
}

uint64_t sub_24C980300()
{
  return MEMORY[0x270F25608]();
}

uint64_t sub_24C980310()
{
  return MEMORY[0x270F25610]();
}

uint64_t sub_24C980320()
{
  return MEMORY[0x270F25640]();
}

uint64_t sub_24C980330()
{
  return MEMORY[0x270F25648]();
}

uint64_t sub_24C980340()
{
  return MEMORY[0x270F25650]();
}

uint64_t sub_24C980350()
{
  return MEMORY[0x270F25690]();
}

uint64_t sub_24C980360()
{
  return MEMORY[0x270F25698]();
}

uint64_t sub_24C980370()
{
  return MEMORY[0x270F256B8]();
}

uint64_t sub_24C980380()
{
  return MEMORY[0x270F256C0]();
}

uint64_t sub_24C980390()
{
  return MEMORY[0x270F256C8]();
}

uint64_t sub_24C9803A0()
{
  return MEMORY[0x270F256D0]();
}

uint64_t sub_24C9803B0()
{
  return MEMORY[0x270F256D8]();
}

uint64_t sub_24C9803C0()
{
  return MEMORY[0x270F256E0]();
}

uint64_t sub_24C9803D0()
{
  return MEMORY[0x270F256E8]();
}

uint64_t sub_24C9803E0()
{
  return MEMORY[0x270F256F0]();
}

uint64_t sub_24C9803F0()
{
  return MEMORY[0x270F256F8]();
}

uint64_t sub_24C980400()
{
  return MEMORY[0x270F25700]();
}

uint64_t sub_24C980410()
{
  return MEMORY[0x270F25708]();
}

uint64_t sub_24C980420()
{
  return MEMORY[0x270F25710]();
}

uint64_t sub_24C980430()
{
  return MEMORY[0x270F25718]();
}

uint64_t sub_24C980440()
{
  return MEMORY[0x270F25720]();
}

uint64_t sub_24C980450()
{
  return MEMORY[0x270F25728]();
}

uint64_t sub_24C980460()
{
  return MEMORY[0x270F25730]();
}

uint64_t sub_24C980470()
{
  return MEMORY[0x270F25738]();
}

uint64_t sub_24C980480()
{
  return MEMORY[0x270F25740]();
}

uint64_t sub_24C980490()
{
  return MEMORY[0x270F25748]();
}

uint64_t sub_24C9804A0()
{
  return MEMORY[0x270F25750]();
}

uint64_t sub_24C9804B0()
{
  return MEMORY[0x270F25758]();
}

uint64_t sub_24C9804C0()
{
  return MEMORY[0x270F25770]();
}

uint64_t sub_24C9804D0()
{
  return MEMORY[0x270F25780]();
}

uint64_t sub_24C9804E0()
{
  return MEMORY[0x270F25788]();
}

uint64_t sub_24C9804F0()
{
  return MEMORY[0x270F257A0]();
}

uint64_t sub_24C980500()
{
  return MEMORY[0x270F257A8]();
}

uint64_t sub_24C980510()
{
  return MEMORY[0x270F257C8]();
}

uint64_t sub_24C980520()
{
  return MEMORY[0x270F257D0]();
}

uint64_t sub_24C980540()
{
  return MEMORY[0x270F257E0]();
}

uint64_t sub_24C980550()
{
  return MEMORY[0x270F257E8]();
}

uint64_t sub_24C980560()
{
  return MEMORY[0x270F257F8]();
}

uint64_t sub_24C980570()
{
  return MEMORY[0x270F25830]();
}

uint64_t sub_24C980580()
{
  return MEMORY[0x270F25838]();
}

uint64_t sub_24C980590()
{
  return MEMORY[0x270F25858]();
}

uint64_t sub_24C9805A0()
{
  return MEMORY[0x270F25878]();
}

uint64_t sub_24C9805B0()
{
  return MEMORY[0x270F25888]();
}

uint64_t sub_24C9805C0()
{
  return MEMORY[0x270F25890]();
}

uint64_t sub_24C9805D0()
{
  return MEMORY[0x270F25898]();
}

uint64_t sub_24C9805E0()
{
  return MEMORY[0x270F258A0]();
}

uint64_t sub_24C9805F0()
{
  return MEMORY[0x270F258A8]();
}

uint64_t sub_24C980600()
{
  return MEMORY[0x270F258C0]();
}

uint64_t sub_24C980610()
{
  return MEMORY[0x270F258C8]();
}

uint64_t sub_24C980620()
{
  return MEMORY[0x270F258D0]();
}

uint64_t sub_24C980630()
{
  return MEMORY[0x270F258D8]();
}

uint64_t sub_24C980640()
{
  return MEMORY[0x270F258E0]();
}

uint64_t sub_24C980650()
{
  return MEMORY[0x270F258E8]();
}

uint64_t sub_24C980660()
{
  return MEMORY[0x270F258F0]();
}

uint64_t sub_24C980670()
{
  return MEMORY[0x270F258F8]();
}

uint64_t sub_24C980680()
{
  return MEMORY[0x270F25900]();
}

uint64_t sub_24C980690()
{
  return MEMORY[0x270F25908]();
}

uint64_t sub_24C9806A0()
{
  return MEMORY[0x270F25910]();
}

uint64_t sub_24C9806B0()
{
  return MEMORY[0x270F25918]();
}

uint64_t sub_24C9806C0()
{
  return MEMORY[0x270F25920]();
}

uint64_t sub_24C9806D0()
{
  return MEMORY[0x270F25928]();
}

uint64_t sub_24C9806E0()
{
  return MEMORY[0x270F25930]();
}

uint64_t sub_24C9806F0()
{
  return MEMORY[0x270F25938]();
}

uint64_t sub_24C980700()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C980710()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24C980720()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C980730()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24C980740()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24C980750()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24C980760()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24C980770()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24C980780()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24C980790()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24C9807A0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C9807B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C9807C0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24C9807D0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24C9807E0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24C9807F0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_24C980800()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C980810()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24C980820()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24C980830()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C980840()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C980860()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24C980870()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24C980880()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_24C980890()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24C9808A0()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_24C9808B0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24C9808C0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_24C9808D0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24C9808E0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_24C9808F0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24C980900()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24C980910()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24C980920()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24C980930()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C980940()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_24C980950()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C980960()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C980970()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24C980980()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24C980990()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24C9809A0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24C9809B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C9809C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C9809D0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_24C9809E0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24C9809F0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24C980A00()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24C980A10()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24C980A20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C980A30()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24C980A40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C980A50()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C980A60()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24C980A70()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24C980A80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24C980A90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24C980AA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C980AB0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24C980AC0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24C980AD0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24C980AE0()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24C980AF0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24C980B00()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_24C980B10()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24C980B20()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24C980B30()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24C980B40()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24C980B50()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24C980B60()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_24C980B70()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_24C980B80()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24C980B90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C980BA0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24C980BB0()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_24C980BC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C980BD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C980BE0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24C980BF0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24C980C00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24C980C10()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_24C980C20()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24C980C30()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24C980C60()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}