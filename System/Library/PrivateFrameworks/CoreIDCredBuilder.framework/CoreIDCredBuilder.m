id CIDCInternalSessionCryptarch.__allocating_init(role:curve:variant:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return CIDCInternalSessionCryptarch.init(role:curve:variant:)(a1, a2, a3);
}

id CIDCInternalSessionCryptarch.init(role:curve:variant:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_225C7BC00();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_225C7BC10();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225C7BBE0();
  MEMORY[0x270FA5388]();
  v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 1)
  {
    v17 = (unsigned int *)MEMORY[0x263F36170];
  }
  else
  {
    if (a1) {
      goto LABEL_8;
    }
    v17 = (unsigned int *)MEMORY[0x263F36178];
  }
  (*(void (**)(char *, void))(v14 + 104))(v16, *v17);
  if (a3 < 3)
  {
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, **((unsigned int **)&unk_2647709B8 + a3), v10);
    if (a2 < 5)
    {
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, **((unsigned int **)&unk_2647709D0 + a2), v6);
      sub_225C7BC30();
      swift_allocObject();
      v18 = (char *)v21[1];
      *(void *)&v18[OBJC_IVAR____TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch_sessionCryptarch] = sub_225C7BBF0();

      v19 = (objc_class *)type metadata accessor for CIDCInternalSessionCryptarch();
      v22.receiver = v18;
      v22.super_class = v19;
      return objc_msgSendSuper2(&v22, sel_init);
    }
  }
LABEL_8:
  id result = (id)sub_225C7BEB0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CIDCInternalSessionCryptarch()
{
  return self;
}

void sub_225C73D30()
{
  sub_225C7BBD0();
  if (v0)
  {
    sub_225C73DDC();
    sub_225C7BDE0();
    sub_225C7BE50();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
}

unint64_t sub_225C73DDC()
{
  unint64_t result = qword_268118470;
  if (!qword_268118470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268118470);
  }
  return result;
}

void sub_225C73F68()
{
  sub_225C7BBC0();
  if (v0)
  {
    sub_225C73DDC();
    sub_225C7BDE0();
    sub_225C7BE50();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
}

uint64_t sub_225C741B8(uint64_t a1, uint64_t a2)
{
  return sub_225C74228(a1, a2, MEMORY[0x263F36180]);
}

uint64_t sub_225C741FC(uint64_t a1, uint64_t a2)
{
  return sub_225C74228(a1, a2, MEMORY[0x263F36188]);
}

uint64_t sub_225C74228(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  if (v3)
  {
    sub_225C73DDC();
    sub_225C7BDE0();
    sub_225C7BE50();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  return v4;
}

id sub_225C74308(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v7 = a3;
  id v8 = a1;
  uint64_t v9 = sub_225C7BA80();
  unint64_t v11 = v10;

  uint64_t v12 = a5(v9, v11);
  unint64_t v14 = v13;

  sub_225C74AF8(v9, v11);
  uint64_t v15 = (void *)sub_225C7BA70();
  sub_225C74AF8(v12, v14);

  return v15;
}

uint64_t sub_225C74520()
{
  return sub_225C7BC20();
}

id CIDCInternalSessionCryptarch.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CIDCInternalSessionCryptarch.init()()
{
}

id CIDCInternalSessionCryptarch.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDCInternalSessionCryptarch();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_225C74624(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681183C8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v16 - v7;
  if (sub_225C7BC60() == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_225C7BF00();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return -1000;
    }
  }
  sub_225C7BC40();
  uint64_t v11 = sub_225C7BC50();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    sub_225C74BF4((uint64_t)v8, (uint64_t)v6);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v6, v11);
    if (v13 != *MEMORY[0x263F361C8])
    {
      if (v13 == *MEMORY[0x263F361A0])
      {
        uint64_t v14 = 1001;
        goto LABEL_8;
      }
      if (v13 == *MEMORY[0x263F361B0])
      {
        uint64_t v14 = 1002;
        goto LABEL_8;
      }
      if (v13 != *MEMORY[0x263F361B8])
      {
        if (v13 == *MEMORY[0x263F361A8])
        {
          uint64_t v14 = -2002;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x263F361C0])
        {
          uint64_t v14 = -3000;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x263F36198])
        {
          uint64_t v14 = -5000;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x263F36190])
        {
          uint64_t v14 = -6000;
          goto LABEL_8;
        }
        (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
      }
    }
  }
  uint64_t v14 = -1000;
LABEL_8:
  sub_225C74B94((uint64_t)v8);
  return v14;
}

uint64_t method lookup function for CIDCInternalSessionCryptarch(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CIDCInternalSessionCryptarch);
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.__allocating_init(role:curve:variant:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.setRemoteKey(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.deriveSessionKeys(sessionTranscript:ikm:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.decrypt(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.encrypt(data:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.publicKey.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t sub_225C74AE4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_225C74AF8(a1, a2);
  }
  return a1;
}

uint64_t sub_225C74AF8(uint64_t a1, unint64_t a2)
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

uint64_t sub_225C74B94(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681183C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_225C74BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681183C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id CIDCInternalPayloadBuilder.__allocating_init(delegate:payloadBuilder:)(uint64_t a1, void *a2)
{
  v3 = v2;
  id v5 = objc_allocWithZone(v2);
  uint64_t v6 = type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  uint64_t v13 = v6;
  uint64_t v14 = sub_225C7B040(&qword_268118430, (void (*)(uint64_t))type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate);
  uint64_t v12 = v7;
  sub_225C7BAA0();
  objc_allocWithZone((Class)sub_225C7BD00());
  id v8 = (char *)v5;
  *(void *)&v8[OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder] = sub_225C7BCF0();

  v11.receiver = v8;
  v11.super_class = v3;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  swift_unknownObjectRelease();

  return v9;
}

id CIDCInternalPayloadBuilder.init(delegate:payloadBuilder:)(uint64_t a1, void *a2)
{
  id v3 = sub_225C7AEE0();
  swift_unknownObjectRelease();

  return v3;
}

uint64_t sub_225C74E5C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_225C7BBB0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118448);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_225C7BC70();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_225C7BAA0();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118450);
  v2[14] = swift_task_alloc();
  uint64_t v6 = sub_225C7BCE0();
  v2[15] = v6;
  v2[16] = *(void *)(v6 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v7 = sub_225C7BD80();
  v2[18] = v7;
  v2[19] = *(void *)(v7 - 8);
  v2[20] = swift_task_alloc();
  uint64_t v8 = sub_225C7BCD0();
  v2[21] = v8;
  v2[22] = *(void *)(v8 - 8);
  v2[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118458);
  v2[24] = swift_task_alloc();
  uint64_t v9 = sub_225C7BB60();
  v2[25] = v9;
  v2[26] = *(void *)(v9 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118460);
  v2[29] = swift_task_alloc();
  uint64_t v10 = sub_225C7BD60();
  v2[30] = v10;
  v2[31] = *(void *)(v10 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  uint64_t v11 = sub_225C7BAE0();
  v2[34] = v11;
  v2[35] = *(void *)(v11 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118468);
  v2[39] = swift_task_alloc();
  uint64_t v12 = sub_225C7BC90();
  v2[40] = v12;
  v2[41] = *(void *)(v12 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_225C75394, 0, 0);
}

void sub_225C75394()
{
  uint64_t v1 = v0[40];
  uint64_t v2 = v0[41];
  uint64_t v3 = v0[39];
  objc_msgSend((id)v0[2], sel_format);
  sub_225C7BC80();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_225C7B6F4(v0[39], &qword_268118468);
    sub_225C7B750(0, (unint64_t *)&qword_268118470);
    sub_225C7BDE0();
    sub_225C7BE60();
    swift_willThrow();
LABEL_53:
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
    v73 = (void (*)(void))v0[1];
    v73();
    return;
  }
  uint64_t v4 = (void *)v0[2];
  (*(void (**)(void, void, void))(v0[41] + 32))(v0[43], v0[39], v0[40]);
  sub_225C7BAD0();
  swift_allocObject();
  sub_225C7BAC0();
  id v5 = objc_msgSend(v4, sel_deviceKey);
  uint64_t v6 = sub_225C7BA80();
  unint64_t v8 = v7;

  sub_225C7B040(&qword_268118478, MEMORY[0x263F2BEA8]);
  sub_225C7BAB0();
  sub_225C74AF8(v6, v8);
  swift_release();
  uint64_t v9 = v0[30];
  uint64_t v10 = v0[31];
  uint64_t v11 = v0[29];
  uint64_t v12 = (void *)v0[2];
  (*(void (**)(void, void, void))(v0[35] + 32))(v0[38], v0[37], v0[34]);
  objc_msgSend(v12, sel_signingAlgorithm);
  sub_225C7BD50();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    uint64_t v13 = v0[43];
    uint64_t v14 = v0[40];
    uint64_t v15 = v0[41];
    uint64_t v16 = v0[38];
    uint64_t v17 = v0[34];
    uint64_t v18 = v0[35];
    sub_225C7B6F4(v0[29], &qword_268118460);
    sub_225C7B750(0, (unint64_t *)&qword_268118470);
    sub_225C7BDE0();
    sub_225C7BE60();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    goto LABEL_53;
  }
  uint64_t v19 = v0[26];
  uint64_t v20 = v0[22];
  v21 = (void *)v0[2];
  (*(void (**)(void, void, void))(v0[31] + 32))(v0[33], v0[29], v0[30]);
  unint64_t v101 = sub_225C76AB8(MEMORY[0x263F8EE78]);
  id v22 = objc_msgSend(v21, sel_elements);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118480);
  uint64_t v23 = sub_225C7BDB0();

  int64_t v24 = 0;
  uint64_t v93 = v23 + 64;
  uint64_t v99 = v23;
  uint64_t v25 = -1;
  uint64_t v26 = -1 << *(unsigned char *)(v23 + 32);
  if (-v26 < 64) {
    uint64_t v25 = ~(-1 << -(char)v26);
  }
  unint64_t v27 = v25 & *(void *)(v23 + 64);
  int64_t v94 = (unint64_t)(63 - v26) >> 6;
  v121 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  v110 = (void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v113 = (void (**)(uint64_t, void, uint64_t))(v19 + 32);
  uint64_t v116 = v20;
  v106 = (void (**)(uint64_t, uint64_t))(v19 + 8);
  v105 = v0;
  if (!v27) {
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v95 = (v27 - 1) & v27;
  for (unint64_t i = __clz(__rbit64(v27)) | (v24 << 6); ; unint64_t i = __clz(__rbit64(v30)) + (v24 << 6))
  {
    int64_t v97 = v24;
    v32 = (uint64_t *)(*(void *)(v99 + 48) + 16 * i);
    uint64_t v33 = v32[1];
    uint64_t v102 = *v32;
    unint64_t v34 = *(void *)(*(void *)(v99 + 56) + 8 * i);
    if (v34 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_225C7BEC0();
      swift_bridgeObjectRelease();
      uint64_t v104 = v33;
      if (v35)
      {
LABEL_25:
        uint64_t v36 = 0;
        unint64_t v124 = v34 & 0xC000000000000001;
        v37 = (void *)MEMORY[0x263F8EE78];
        unint64_t v120 = v34;
        while (1)
        {
          id v38 = v124 ? (id)MEMORY[0x22A63D6A0](v36, v34) : *(id *)(v34 + 8 * v36 + 32);
          v39 = v38;
          if (__OFADD__(v36, 1)) {
            break;
          }
          uint64_t v40 = v0[24];
          uint64_t v41 = v0[25];
          sub_225C76FC4(v38, v40);
          v128 = v39;
          if ((*v121)(v40, 1, v41) == 1)
          {
            uint64_t v122 = v0[41];
            uint64_t v125 = v0[40];
            uint64_t v127 = v0[43];
            uint64_t v67 = v0[35];
            uint64_t v117 = v0[34];
            uint64_t v119 = v0[38];
            uint64_t v68 = v0[31];
            uint64_t v111 = v0[30];
            uint64_t v114 = v0[33];
            uint64_t v69 = v0[24];
            uint64_t v71 = v0[19];
            uint64_t v70 = v0[20];
            uint64_t v108 = v0[18];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_225C7B6F4(v69, &qword_268118458);
            sub_225C7BE70();
            swift_bridgeObjectRelease();
            id v72 = objc_msgSend(v39, sel_debugDescription);
            sub_225C7BDE0();

            sub_225C7BE00();
            swift_bridgeObjectRelease();
            sub_225C7BE00();
            (*(void (**)(uint64_t, void, uint64_t))(v71 + 104))(v70, *MEMORY[0x263F36418], v108);
            sub_225C78FA8(MEMORY[0x263F8EE78]);
            sub_225C7BD90();
            sub_225C7B040((unint64_t *)&unk_268118488, MEMORY[0x263F36628]);
            swift_allocError();
            sub_225C7BDA0();
            swift_willThrow();

            swift_release();
            (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v114, v111);
            (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v119, v117);
            (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v127, v125);
            goto LABEL_53;
          }
          uint64_t v126 = v36 + 1;
          uint64_t v42 = v0[27];
          uint64_t v43 = v0[28];
          uint64_t v44 = v0[25];
          (*v113)(v43, v0[24], v44);
          id v45 = objc_msgSend(v39, sel_elementIdentifier);
          sub_225C7BDE0();

          (*v110)(v42, v43, v44);
          sub_225C7BCC0();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v37 = (void *)sub_225C7AD04(0, v37[2] + 1, 1, v37, &qword_268118518, MEMORY[0x263F361F8]);
          }
          unint64_t v47 = v37[2];
          unint64_t v46 = v37[3];
          uint64_t v0 = v105;
          if (v47 >= v46 >> 1) {
            v37 = (void *)sub_225C7AD04(v46 > 1, v47 + 1, 1, v37, &qword_268118518, MEMORY[0x263F361F8]);
          }
          uint64_t v48 = v105[28];
          uint64_t v49 = v105[25];
          uint64_t v50 = v105[23];
          uint64_t v51 = v105[21];
          v37[2] = v47 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v116 + 32))((unint64_t)v37+ ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80))+ *(void *)(v116 + 72) * v47, v50, v51);

          (*v106)(v48, v49);
          ++v36;
          unint64_t v34 = v120;
          if (v126 == v35) {
            goto LABEL_39;
          }
        }
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        return;
      }
    }
    else
    {
      uint64_t v35 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v104 = v33;
      if (v35) {
        goto LABEL_25;
      }
    }
    v37 = (void *)MEMORY[0x263F8EE78];
LABEL_39:
    swift_bridgeObjectRelease();
    v52 = (void *)v101;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v55 = sub_225C79958(v102, v104);
    uint64_t v56 = *(void *)(v101 + 16);
    BOOL v57 = (v54 & 1) == 0;
    uint64_t v58 = v56 + v57;
    if (__OFADD__(v56, v57)) {
      goto LABEL_69;
    }
    char v59 = v54;
    if (*(void *)(v101 + 24) < v58) {
      break;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v54) {
        goto LABEL_46;
      }
    }
    else
    {
      sub_225C7AB4C();
      v52 = (void *)v101;
      if (v59)
      {
LABEL_46:
        uint64_t v62 = v52[7];
        swift_bridgeObjectRelease();
        *(void *)(v62 + 8 * v55) = v37;
        goto LABEL_50;
      }
    }
LABEL_48:
    v52[(v55 >> 6) + 8] |= 1 << v55;
    v63 = (uint64_t *)(v52[6] + 16 * v55);
    uint64_t *v63 = v102;
    v63[1] = v104;
    *(void *)(v52[7] + 8 * v55) = v37;
    uint64_t v64 = v52[2];
    BOOL v65 = __OFADD__(v64, 1);
    uint64_t v66 = v64 + 1;
    if (v65) {
      goto LABEL_71;
    }
    v52[2] = v66;
    swift_bridgeObjectRetain();
LABEL_50:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v27 = v95;
    int64_t v24 = v97;
    if (v95) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v29 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      goto LABEL_70;
    }
    if (v29 >= v94) {
      goto LABEL_56;
    }
    unint64_t v30 = *(void *)(v93 + 8 * v29);
    ++v24;
    if (!v30)
    {
      int64_t v24 = v29 + 1;
      if (v29 + 1 >= v94) {
        goto LABEL_56;
      }
      unint64_t v30 = *(void *)(v93 + 8 * v24);
      if (!v30)
      {
        int64_t v24 = v29 + 2;
        if (v29 + 2 >= v94) {
          goto LABEL_56;
        }
        unint64_t v30 = *(void *)(v93 + 8 * v24);
        if (!v30)
        {
          int64_t v31 = v29 + 3;
          if (v31 >= v94)
          {
LABEL_56:
            swift_release();
            v74 = (void *)v0[2];
            (*(void (**)(void, void, void))(v0[41] + 16))(v0[42], v0[43], v0[40]);
            id v75 = objc_msgSend(v74, sel_docType);
            sub_225C7BDE0();

            id v76 = objc_msgSend(v74, sel_validFrom);
            if (v76)
            {
              v77 = v76;
              sub_225C7BA90();
            }
            uint64_t v78 = v0[35];
            uint64_t v96 = v0[36];
            uint64_t v98 = v0[34];
            uint64_t v79 = v0[31];
            uint64_t v115 = v0[30];
            uint64_t v118 = v0[33];
            uint64_t v103 = v0[38];
            uint64_t v81 = v0[9];
            uint64_t v80 = v0[10];
            uint64_t v82 = v0[8];
            uint64_t v100 = v0[7];
            uint64_t v83 = v0[5];
            uint64_t v107 = v0[6];
            uint64_t v109 = v0[4];
            uint64_t v112 = v0[32];
            v84 = (void *)v0[2];
            uint64_t v123 = v0[3];
            (*(void (**)(void))(v0[12] + 56))();
            id v85 = objc_msgSend(v84, sel_validUntil);
            sub_225C7BA90();

            id v86 = objc_msgSend(v84, sel_timePolicy);
            v87 = (unsigned int *)MEMORY[0x263F361F0];
            v88 = (unsigned int *)MEMORY[0x263F361E8];
            if (v86 != (id)2) {
              v88 = (unsigned int *)MEMORY[0x263F361E0];
            }
            if (v86 != (id)1) {
              v87 = v88;
            }
            (*(void (**)(uint64_t, void, uint64_t))(v81 + 104))(v80, *v87, v82);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16))(v96, v103, v98);
            uint64_t v89 = sub_225C7BCA0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v100, 1, 1, v89);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v112, v118, v115);
            (*(void (**)(uint64_t, void, uint64_t))(v83 + 104))(v107, *MEMORY[0x263F36168], v109);
            sub_225C7BCB0();
            v90 = *(void **)(v123 + OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder);
            v0[44] = v90;
            v129 = (void (*)(uint64_t))((int)*MEMORY[0x263F36280] + MEMORY[0x263F36280]);
            v90;
            v91 = (void *)swift_task_alloc();
            v0[45] = v91;
            void *v91 = v0;
            v91[1] = sub_225C76398;
            uint64_t v92 = v0[17];
            v129(v92);
            return;
          }
          unint64_t v30 = *(void *)(v93 + 8 * v31);
          if (!v30)
          {
            while (1)
            {
              int64_t v24 = v31 + 1;
              if (__OFADD__(v31, 1)) {
                goto LABEL_72;
              }
              if (v24 >= v94) {
                goto LABEL_56;
              }
              unint64_t v30 = *(void *)(v93 + 8 * v24);
              ++v31;
              if (v30) {
                goto LABEL_22;
              }
            }
          }
          int64_t v24 = v31;
        }
      }
    }
LABEL_22:
    uint64_t v95 = (v30 - 1) & v30;
  }
  sub_225C7A160(v58, isUniquelyReferenced_nonNull_native);
  unint64_t v60 = sub_225C79958(v102, v104);
  if ((v59 & 1) == (v61 & 1))
  {
    unint64_t v55 = v60;
    v52 = (void *)v101;
    if (v59) {
      goto LABEL_46;
    }
    goto LABEL_48;
  }
  sub_225C7BF10();
}

uint64_t sub_225C76398(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  unint64_t v7 = *(void **)(*v3 + 352);
  *(void *)(*v3 + 368) = v2;
  swift_task_dealloc();

  if (v2)
  {
    unint64_t v8 = sub_225C766D0;
  }
  else
  {
    *(void *)(v6 + 376) = a2;
    *(void *)(v6 + 384) = a1;
    unint64_t v8 = sub_225C764E4;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_225C764E4()
{
  uint64_t v1 = v0[43];
  uint64_t v3 = v0[40];
  uint64_t v2 = v0[41];
  uint64_t v4 = v0[38];
  uint64_t v5 = v0[35];
  uint64_t v6 = v0[33];
  uint64_t v7 = v0[34];
  uint64_t v8 = v0[31];
  uint64_t v9 = v0[30];
  (*(void (**)(void))(v0[16] + 8))();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
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
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v12 = v0[47];
  uint64_t v11 = v0[48];
  return v10(v11, v12);
}

uint64_t sub_225C766D0()
{
  uint64_t v1 = v0[43];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[41];
  uint64_t v4 = v0[38];
  uint64_t v5 = v0[34];
  uint64_t v6 = v0[35];
  uint64_t v7 = v0[33];
  uint64_t v8 = v0[30];
  uint64_t v9 = v0[31];
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

unint64_t sub_225C768B8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268118568);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118560);
  uint64_t v6 = sub_225C7BEF0();
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
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_225C7B9C4(v12, (uint64_t)v5, &qword_268118568);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_225C79958(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_225C7BB60();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
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

unint64_t sub_225C76AB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118510);
  uint64_t v2 = (void *)sub_225C7BEF0();
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
    unint64_t result = sub_225C79958(v5, v6);
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

uint64_t sub_225C76D50(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_225C76E14;
  return sub_225C74E5C((uint64_t)v6);
}

uint64_t sub_225C76E14(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v3;
  uint64_t v8 = *(void **)(*v3 + 24);
  uint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  if (v4)
  {
    uint64_t v11 = sub_225C7BA60();

    uint64_t v12 = 0;
    uint64_t v13 = (void *)v11;
  }
  else
  {
    uint64_t v12 = sub_225C7BA70();
    sub_225C74AF8(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = (void *)v12;
  }
  uint64_t v14 = *(void (***)(void, void, void))(v7 + 32);
  v14[2](v14, v12, v11);

  _Block_release(v14);
  uint64_t v15 = *(uint64_t (**)(void))(v10 + 8);
  return v15();
}

uint64_t sub_225C76FC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v187 = a2;
  uint64_t v3 = sub_225C7BD20();
  MEMORY[0x270FA5388](v3 - 8);
  v178 = (void (**)(char *, uint64_t))((char *)&v170 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_225C7BBA0();
  MEMORY[0x270FA5388](v5 - 8);
  v181 = (void (**)(int64_t, int64_t, uint64_t))((char *)&v170
                                                                       - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_225C7BB80();
  MEMORY[0x270FA5388](v7 - 8);
  v179 = (void (**)(char *, uint64_t))((char *)&v170 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268118458);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  v180 = (unsigned int (**)(char *, uint64_t, uint64_t))((char *)&v170 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v184 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))((char *)&v170 - v13);
  MEMORY[0x270FA5388](v12);
  v186 = (char *)&v170 - v14;
  uint64_t v15 = sub_225C7BB60();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v188 = v15;
  uint64_t v189 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v183 = (char *)&v170 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v182 = (char *)&v170 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v185 = (char *)&v170 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v170 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  v28 = (char *)&v170 - v27;
  MEMORY[0x270FA5388](v26);
  unint64_t v30 = (char *)&v170 - v29;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268118450);
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v33 = (char *)&v170 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_225C7BAA0();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  id v38 = (char *)&v170 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v170 - v39;
  uint64_t v41 = a1;
  id v42 = objc_msgSend(a1, sel_stringValue);
  if (v42)
  {
    uint64_t v43 = v42;
    sub_225C7BDE0();

    uint64_t v44 = v187;
    sub_225C7BB10();
LABEL_5:
    uint64_t v47 = v188;
    uint64_t v48 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v189 + 56);
    return v48(v44, 0, 1, v47);
  }
  v170 = v40;
  uint64_t v171 = (uint64_t)v38;
  v172 = v33;
  uint64_t v173 = v35;
  uint64_t v174 = v34;
  int64_t v175 = (int64_t)v28;
  int64_t v176 = (int64_t)v30;
  v177 = v25;
  id v45 = objc_msgSend(a1, sel_dataValue);
  if (v45)
  {
    unint64_t v46 = v45;
    sub_225C7BA80();

    uint64_t v44 = v187;
    sub_225C7BAF0();
    goto LABEL_5;
  }
  id v50 = objc_msgSend(a1, sel_dateValue);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = v171;
    sub_225C7BA90();

    unint64_t v54 = (unint64_t)v172;
    uint64_t v53 = v173;
    unint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v173 + 32);
    uint64_t v56 = v174;
    v55(v172, v52, v174);
    (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v53 + 56))(v54, 0, 1, v56);
    int v57 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v56);
    unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v186;
    if (v57 != 1)
    {
      char v59 = v170;
      v55(v170, v54, v56);
      (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v52, v59, v56);
      uint64_t v60 = v187;
      sub_225C7BB00();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v59, v56);
      char v61 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
      uint64_t v62 = v60;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v54 = (unint64_t)v172;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v173 + 56))(v172, 1, 1, v174);
    unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v186;
  }
  sub_225C7B6F4(v54, &qword_268118450);
  id v63 = objc_msgSend(v41, sel_numberValue);
  if (v63)
  {
    uint64_t v64 = v63;
    objc_msgSend(v63, sel_integerValue);
    uint64_t v65 = v187;
    sub_225C7BB20();

    goto LABEL_14;
  }
  id v68 = objc_msgSend(v41, sel_arrayValue);
  uint64_t v69 = v188;
  if (v68)
  {
    uint64_t v70 = v68;
    sub_225C7B750(0, &qword_268118548);
    unint64_t v54 = sub_225C7BE10();

    if (v54 >> 62) {
      goto LABEL_124;
    }
    uint64_t v71 = *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      int64_t v72 = v176;
      if (!v71) {
        break;
      }
      v183 = (char *)(v189 + 48);
      v184 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 & 0xC000000000000001);
      v185 = (char *)(v189 + 32);
      v180 = (unsigned int (**)(char *, uint64_t, uint64_t))(v189 + 8);
      v181 = (void (**)(int64_t, int64_t, uint64_t))(v189 + 16);
      v73 = (void *)MEMORY[0x263F8EE78];
      uint64_t v74 = 4;
      v182 = (char *)v71;
      while (1)
      {
        id v75 = v184 ? (id)MEMORY[0x22A63D6A0](v74 - 4, v54) : *(id *)(v54 + 8 * v74);
        id v76 = v75;
        v77 = (char *)(v74 - 3);
        if (__OFADD__(v74 - 4, 1)) {
          break;
        }
        sub_225C76FC4(v75);
        if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))v183)(isUniquelyReferenced_nonNull_native, 1, v69) == 1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          uint64_t v120 = isUniquelyReferenced_nonNull_native;
          goto LABEL_71;
        }
        uint64_t v78 = *(void (**)(unint64_t, int64_t, uint64_t))v185;
        (*(void (**)(int64_t, unint64_t, uint64_t))v185)(v72, isUniquelyReferenced_nonNull_native, v69);
        int64_t v79 = v175;
        (*v181)(v175, v72, v69);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v73 = (void *)sub_225C7AD04(0, v73[2] + 1, 1, v73, &qword_268118558, MEMORY[0x263F36028]);
        }
        unint64_t v81 = v73[2];
        unint64_t v80 = v73[3];
        if (v81 >= v80 >> 1) {
          v73 = (void *)sub_225C7AD04(v80 > 1, v81 + 1, 1, v73, &qword_268118558, MEMORY[0x263F36028]);
        }
        v73[2] = v81 + 1;
        unint64_t v82 = (unint64_t)v73
            + ((*(unsigned __int8 *)(v189 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v189 + 80))
            + *(void *)(v189 + 72) * v81;
        uint64_t v69 = v188;
        v78(v82, v79, v188);

        int64_t v72 = v176;
        (*(void (**)(int64_t, uint64_t))(v189 + 8))(v176, v69);
        ++v74;
        unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v186;
        if (v77 == v182) {
          goto LABEL_64;
        }
      }
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
      swift_bridgeObjectRetain();
      uint64_t v71 = sub_225C7BEC0();
      swift_bridgeObjectRelease();
    }
LABEL_64:
    swift_bridgeObjectRelease();
    sub_225C7BB70();
    uint64_t v119 = v187;
    sub_225C7BB50();
LABEL_65:
    char v61 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
    uint64_t v62 = v119;
    uint64_t v66 = 0;
    goto LABEL_73;
  }
  id v83 = objc_msgSend(v41, sel_dictionaryValue);
  if (!v83)
  {
    id v121 = objc_msgSend(v41, sel_integerKeyedDictionaryValue);
    if (!v121)
    {
LABEL_72:
      char v61 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
      uint64_t v62 = v187;
      uint64_t v66 = 1;
LABEL_73:
      uint64_t v67 = v69;
      return v61(v62, v66, 1, v67);
    }
    uint64_t v122 = v121;
    uint64_t v123 = sub_225C7B750(0, &qword_268118540);
    uint64_t v124 = sub_225C7B750(0, &qword_268118548);
    sub_225C7B78C();
    v172 = (char *)v124;
    uint64_t v173 = v123;
    unint64_t v125 = sub_225C7BDB0();

    unint64_t v126 = sub_225C7B7F4(MEMORY[0x263F8EE78]);
    if ((v125 & 0xC000000000000001) != 0)
    {
      uint64_t v127 = sub_225C7BE90();
      v177 = 0;
      v128 = 0;
      unint64_t v129 = 0;
      unint64_t v125 = v127 | 0x8000000000000000;
    }
    else
    {
      uint64_t v130 = -1 << *(unsigned char *)(v125 + 32);
      uint64_t v131 = *(void *)(v125 + 64);
      v177 = (char *)(v125 + 64);
      uint64_t v132 = ~v130;
      uint64_t v133 = -v130;
      if (v133 < 64) {
        uint64_t v134 = ~(-1 << v133);
      }
      else {
        uint64_t v134 = -1;
      }
      unint64_t v129 = v134 & v131;
      v128 = (char *)v132;
    }
    uint64_t v135 = (uint64_t)v180;
    uint64_t v136 = 0;
    uint64_t v174 = v125 & 0x7FFFFFFFFFFFFFFFLL;
    v170 = v128;
    v184 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v189 + 48);
    v185 = (char *)(v189 + 32);
    v181 = (void (**)(int64_t, int64_t, uint64_t))(v189 + 16);
    int64_t v175 = (unint64_t)(v128 + 64) >> 6;
    int64_t v176 = v189 + 40;
    v179 = (void (**)(char *, uint64_t))(v189 + 8);
    uint64_t v171 = MEMORY[0x263F8EE50] + 8;
    while (1)
    {
      if ((v125 & 0x8000000000000000) != 0)
      {
        uint64_t v142 = sub_225C7BEA0();
        if (!v142) {
          goto LABEL_118;
        }
        uint64_t v144 = v143;
        uint64_t v190 = v142;
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v145 = v191;
        swift_unknownObjectRelease();
        uint64_t v190 = v144;
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v146 = v191;
        swift_unknownObjectRelease();
        uint64_t v141 = v136;
        uint64_t v139 = v129;
        uint64_t v135 = (uint64_t)v180;
      }
      else
      {
        if (v129)
        {
          uint64_t v139 = (v129 - 1) & v129;
          unint64_t v140 = __clz(__rbit64(v129)) | (v136 << 6);
          uint64_t v141 = v136;
        }
        else
        {
          int64_t v147 = v136 + 1;
          if (__OFADD__(v136, 1)) {
            goto LABEL_127;
          }
          if (v147 >= v175)
          {
LABEL_118:
            sub_225C7B9BC();
            sub_225C7BB70();
            uint64_t v65 = v187;
            sub_225C7BB30();
LABEL_14:
            char v61 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56);
            uint64_t v62 = v65;
LABEL_15:
            uint64_t v66 = 0;
            uint64_t v67 = v188;
            return v61(v62, v66, 1, v67);
          }
          unint64_t v148 = *(void *)&v177[8 * v147];
          uint64_t v141 = v136 + 1;
          if (!v148)
          {
            uint64_t v141 = v136 + 2;
            if (v136 + 2 >= v175) {
              goto LABEL_118;
            }
            unint64_t v148 = *(void *)&v177[8 * v141];
            if (!v148)
            {
              uint64_t v141 = v136 + 3;
              if (v136 + 3 >= v175) {
                goto LABEL_118;
              }
              unint64_t v148 = *(void *)&v177[8 * v141];
              if (!v148)
              {
                uint64_t v141 = v136 + 4;
                if (v136 + 4 >= v175) {
                  goto LABEL_118;
                }
                unint64_t v148 = *(void *)&v177[8 * v141];
                if (!v148)
                {
                  uint64_t v149 = v136 + 5;
                  do
                  {
                    if (v175 == v149) {
                      goto LABEL_118;
                    }
                    unint64_t v148 = *(void *)&v177[8 * v149++];
                  }
                  while (!v148);
                  uint64_t v141 = v149 - 1;
                }
              }
            }
          }
          uint64_t v139 = (v148 - 1) & v148;
          unint64_t v140 = __clz(__rbit64(v148)) + (v141 << 6);
        }
        uint64_t v150 = 8 * v140;
        v151 = *(void **)(*(void *)(v125 + 56) + v150);
        id v145 = *(id *)(*(void *)(v125 + 48) + v150);
        id v146 = v151;
      }
      if (!v145) {
        goto LABEL_118;
      }
      sub_225C76FC4(v146);
      uint64_t v152 = v188;
      if ((*v184)(v135, 1, v188) == 1)
      {

        sub_225C7B9BC();
        swift_bridgeObjectRelease();
        sub_225C7B6F4(v135, &qword_268118458);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v189 + 56))(v187, 1, 1, v152);
      }
      uint64_t v69 = (uint64_t)v145;
      unint64_t v54 = (unint64_t)v146;
      v186 = (char *)v139;
      uint64_t v153 = v141;
      unint64_t v154 = v125;
      v155 = *(void (**)(unint64_t, int64_t, uint64_t))v185;
      v156 = v182;
      (*(void (**)(char *, uint64_t, uint64_t))v185)(v182, v135, v152);
      id v157 = objc_msgSend(v145, sel_integerValue, v170, v171);
      (*v181)((int64_t)v183, (int64_t)v156, v152);
      unint64_t v158 = v126;
      unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v191 = (void *)v158;
      unint64_t v160 = sub_225C79914((uint64_t)v157);
      uint64_t v161 = *(void *)(v158 + 16);
      BOOL v162 = (v159 & 1) == 0;
      uint64_t v163 = v161 + v162;
      if (__OFADD__(v161, v162)) {
        goto LABEL_123;
      }
      char v164 = v159;
      if (*(void *)(v158 + 24) >= v163)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          v167 = v191;
          if (v159) {
            goto LABEL_81;
          }
        }
        else
        {
          sub_225C7A5F8();
          v167 = v191;
          if (v164) {
            goto LABEL_81;
          }
        }
      }
      else
      {
        sub_225C799D0(v163, isUniquelyReferenced_nonNull_native);
        unint64_t v165 = sub_225C79914((uint64_t)v157);
        if ((v164 & 1) != (v166 & 1)) {
          goto LABEL_129;
        }
        unint64_t v160 = v165;
        v167 = v191;
        if (v164)
        {
LABEL_81:
          uint64_t v137 = v188;
          (*(void (**)(unint64_t, char *, uint64_t))(v189 + 40))(v167[7] + *(void *)(v189 + 72) * v160, v183, v188);
          goto LABEL_82;
        }
      }
      v167[(v160 >> 6) + 8] |= 1 << v160;
      *(void *)(v167[6] + 8 * v160) = v157;
      uint64_t v137 = v188;
      v155(v167[7] + *(void *)(v189 + 72) * v160, (int64_t)v183, v188);
      uint64_t v168 = v167[2];
      BOOL v117 = __OFADD__(v168, 1);
      uint64_t v169 = v168 + 1;
      if (v117)
      {
        __break(1u);
        goto LABEL_126;
      }
      v167[2] = v169;
LABEL_82:
      v138 = v182;
      unint64_t v125 = v154;
      unint64_t v126 = (unint64_t)v191;

      swift_bridgeObjectRelease();
      (*v179)(v138, v137);
      uint64_t v136 = v153;
      unint64_t v129 = (unint64_t)v186;
      uint64_t v135 = (uint64_t)v180;
    }
  }
  v84 = v83;
  sub_225C7B750(0, &qword_268118548);
  uint64_t v85 = sub_225C7BDB0();

  unint64_t isUniquelyReferenced_nonNull_native = sub_225C768B8(MEMORY[0x263F8EE78]);
  id v86 = 0;
  uint64_t v87 = *(void *)(v85 + 64);
  int64_t v175 = v85 + 64;
  uint64_t v88 = 1 << *(unsigned char *)(v85 + 32);
  uint64_t v89 = -1;
  if (v88 < 64) {
    uint64_t v89 = ~(-1 << v88);
  }
  unint64_t v90 = v89 & v87;
  int64_t v176 = (unint64_t)(v88 + 63) >> 6;
  v182 = (char *)v85;
  v183 = (char *)(v189 + 32);
  v179 = (void (**)(char *, uint64_t))(v189 + 16);
  v180 = (unsigned int (**)(char *, uint64_t, uint64_t))(v189 + 48);
  uint64_t v174 = v189 + 40;
  v178 = (void (**)(char *, uint64_t))(v189 + 8);
  v91 = (char *)v184;
  uint64_t v92 = v185;
  while (1)
  {
    if (v90)
    {
      unint64_t v94 = __clz(__rbit64(v90));
      v90 &= v90 - 1;
      v186 = v86;
      unint64_t v95 = v94 | ((void)v86 << 6);
      goto LABEL_54;
    }
    int64_t v96 = (int64_t)(v86 + 1);
    if (__OFADD__(v86, 1)) {
      goto LABEL_122;
    }
    if (v96 >= v176)
    {
LABEL_75:
      swift_release();
      sub_225C7BB70();
      uint64_t v119 = v187;
      sub_225C7BB40();
      goto LABEL_65;
    }
    unint64_t v97 = *(void *)(v175 + 8 * v96);
    int64_t v98 = (int64_t)(v86 + 1);
    if (!v97)
    {
      int64_t v98 = (int64_t)(v86 + 2);
      if ((uint64_t)(v86 + 2) >= v176) {
        goto LABEL_75;
      }
      unint64_t v97 = *(void *)(v175 + 8 * v98);
      if (!v97)
      {
        int64_t v98 = (int64_t)(v86 + 3);
        if ((uint64_t)(v86 + 3) >= v176) {
          goto LABEL_75;
        }
        unint64_t v97 = *(void *)(v175 + 8 * v98);
        if (!v97) {
          break;
        }
      }
    }
LABEL_53:
    unint64_t v90 = (v97 - 1) & v97;
    v186 = (char *)v98;
    unint64_t v95 = __clz(__rbit64(v97)) + (v98 << 6);
LABEL_54:
    uint64_t v100 = (uint64_t *)(*((void *)v182 + 6) + 16 * v95);
    uint64_t v101 = *v100;
    unint64_t v54 = v100[1];
    uint64_t v102 = *(void **)(*((void *)v182 + 7) + 8 * v95);
    swift_bridgeObjectRetain();
    id v103 = v102;
    sub_225C76FC4(v103);
    if ((*v180)(v91, 1, v69) == 1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();

      uint64_t v120 = (uint64_t)v91;
LABEL_71:
      sub_225C7B6F4(v120, &qword_268118458);
      goto LABEL_72;
    }
    uint64_t v104 = *(unsigned int (**)(unint64_t, char *, uint64_t))v183;
    v105 = v177;
    (*(void (**)(char *, char *, uint64_t))v183)(v177, v91, v69);
    ((void (*)(char *, char *, uint64_t))*v179)(v92, v105, v69);
    uint64_t v69 = swift_isUniquelyReferenced_nonNull_native();
    v191 = (void *)isUniquelyReferenced_nonNull_native;
    unint64_t v107 = sub_225C79958(v101, v54);
    uint64_t v108 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
    BOOL v109 = (v106 & 1) == 0;
    uint64_t v110 = v108 + v109;
    if (__OFADD__(v108, v109)) {
      goto LABEL_120;
    }
    char v111 = v106;
    if (*(void *)(isUniquelyReferenced_nonNull_native + 24) >= v110)
    {
      if ((v69 & 1) == 0) {
        sub_225C7A888();
      }
    }
    else
    {
      sub_225C79D78(v110, v69);
      unint64_t v112 = sub_225C79958(v101, v54);
      if ((v111 & 1) != (v113 & 1)) {
        goto LABEL_128;
      }
      unint64_t v107 = v112;
    }
    uint64_t v69 = v188;
    uint64_t v114 = v191;
    if (v111)
    {
      uint64_t v92 = v185;
      (*(void (**)(unint64_t, char *, uint64_t))(v189 + 40))(v191[7] + *(void *)(v189 + 72) * v107, v185, v188);
    }
    else
    {
      v191[(v107 >> 6) + 8] |= 1 << v107;
      uint64_t v115 = (uint64_t *)(v114[6] + 16 * v107);
      *uint64_t v115 = v101;
      v115[1] = v54;
      uint64_t v92 = v185;
      v104(v114[7] + *(void *)(v189 + 72) * v107, v185, v69);
      uint64_t v116 = v114[2];
      BOOL v117 = __OFADD__(v116, 1);
      uint64_t v118 = v116 + 1;
      if (v117) {
        goto LABEL_121;
      }
      v114[2] = v118;
      swift_bridgeObjectRetain();
    }
    v91 = (char *)v184;
    uint64_t v93 = v177;
    unint64_t isUniquelyReferenced_nonNull_native = (unint64_t)v191;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*v178)(v93, v69);
    id v86 = v186;
  }
  uint64_t v99 = v86 + 4;
  if ((uint64_t)(v86 + 4) >= v176) {
    goto LABEL_75;
  }
  unint64_t v97 = *(void *)(v175 + 8 * (void)v99);
  if (v97)
  {
    int64_t v98 = (int64_t)(v86 + 4);
    goto LABEL_53;
  }
  while (1)
  {
    int64_t v98 = (int64_t)(v99 + 1);
    if (__OFADD__(v99, 1)) {
      break;
    }
    if (v98 >= v176) {
      goto LABEL_75;
    }
    unint64_t v97 = *(void *)(v175 + 8 * v98);
    ++v99;
    if (v97) {
      goto LABEL_53;
    }
  }
LABEL_126:
  __break(1u);
LABEL_127:
  __break(1u);
LABEL_128:
  sub_225C7BF10();
  __break(1u);
LABEL_129:
  uint64_t result = sub_225C7BF10();
  __break(1u);
  return result;
}

uint64_t sub_225C7831C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[18] = a4;
  v5[19] = v4;
  v5[16] = a1;
  v5[17] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118460);
  v5[20] = swift_task_alloc();
  uint64_t v6 = sub_225C7BD60();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_225C78420, 0, 0);
}

uint64_t sub_225C78420()
{
  uint64_t v1 = MEMORY[0x22A63DC40](v0[19] + 16);
  v0[25] = v1;
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = MEMORY[0x22A63DC40](v0[19] + 24);
    v0[26] = v3;
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_225C7BA70();
      v0[27] = v5;
      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_225C78698;
      uint64_t v6 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_225C78C18;
      v0[13] = &block_descriptor;
      v0[14] = v6;
      objc_msgSend(v2, sel_signPayloadWithBuilder_data_completion_, v4, v5, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    sub_225C7B750(0, (unint64_t *)&qword_268118470);
    sub_225C7BDE0();
    sub_225C7BE60();
    swift_willThrow();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_225C7B750(0, (unint64_t *)&qword_268118470);
    sub_225C7BDE0();
    sub_225C7BE60();
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_225C78698()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_225C78B74;
  }
  else {
    uint64_t v2 = sub_225C787A8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_225C787A8()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void **)(v0 + 120);

  objc_msgSend(v4, sel_signingAlgorithm);
  sub_225C7BD50();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = *(void **)(v0 + 208);
    sub_225C7B6F4(*(void *)(v0 + 160), &qword_268118460);
    sub_225C7B750(0, (unint64_t *)&qword_268118470);
    sub_225C7BDE0();
    sub_225C7BE60();
    swift_willThrow();

    swift_unknownObjectRelease();
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 176) + 32))(*(void *)(v0 + 192), *(void *)(v0 + 160), *(void *)(v0 + 168));
  id v7 = objc_msgSend(v4, sel_issuerCertificate);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v10 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 168);
    uint64_t v12 = *(void *)(v0 + 176);
    sub_225C7BE10();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v9, v11);
    id v13 = objc_msgSend(v4, sel_signature);
    sub_225C7BA80();

    sub_225C7BD30();
  }
  else
  {
    id v14 = objc_msgSend(v4, sel_issuerKey);
    if (!v14)
    {
      uint64_t v26 = *(void **)(v0 + 208);
      uint64_t v27 = *(void *)(v0 + 192);
      uint64_t v28 = *(void *)(v0 + 168);
      uint64_t v29 = *(void *)(v0 + 176);
      sub_225C7B750(0, (unint64_t *)&qword_268118470);
      sub_225C7BDE0();
      sub_225C7BE60();
      swift_willThrow();

      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
      goto LABEL_3;
    }
    uint64_t v15 = v14;
    uint64_t v17 = *(void *)(v0 + 184);
    uint64_t v16 = *(void *)(v0 + 192);
    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v19 = *(void *)(v0 + 176);
    sub_225C7BA80();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
    id v20 = objc_msgSend(v4, sel_signature);
    sub_225C7BA80();

    sub_225C7BD40();
  }
  uint64_t v21 = *(void **)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 192);
  uint64_t v23 = *(void *)(v0 + 168);
  uint64_t v24 = *(void *)(v0 + 176);

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
  return v6();
}

uint64_t sub_225C78B74()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = (void *)v0[26];
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_225C78C18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681184C0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_225C78CD8()
{
  sub_225C7B2F8(v0 + 16);
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_225C78D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_225C78DDC;
  return sub_225C7831C(a1, a2, a3, a4);
}

uint64_t sub_225C78DDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id CIDCInternalPayloadBuilder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CIDCInternalPayloadBuilder.init()()
{
}

id CIDCInternalPayloadBuilder.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDCInternalPayloadBuilder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_225C78FA8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268118520);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    id v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118528);
  uint64_t v6 = sub_225C7BEF0();
  id v7 = (void *)v6;
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
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_225C7B9C4(v12, (uint64_t)v5, &qword_268118520);
    unint64_t result = sub_225C791A4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_225C7BD70();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_225C7B6E4(v9, (_OWORD *)(v7[7] + 32 * v16));
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

unint64_t sub_225C791A4(uint64_t a1)
{
  sub_225C7BD70();
  sub_225C7B040(&qword_268118530, MEMORY[0x263F36400]);
  uint64_t v2 = sub_225C7BDC0();

  return sub_225C7923C(a1, v2);
}

unint64_t sub_225C7923C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_225C7BD70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_225C7B040(&qword_268118538, MEMORY[0x263F36400]);
      char v15 = sub_225C7BDD0();
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

uint64_t sub_225C793FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_225C7BA28;
  return v6();
}

uint64_t sub_225C794C8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_225C7BA28;
  return v7();
}

uint64_t sub_225C79594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_225C7BE40();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_225C7BE30();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_225C7B6F4(a1, &qword_2681184C8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_225C7BE20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_225C79740(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_225C7981C;
  return v6(a1);
}

uint64_t sub_225C7981C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_225C79914(uint64_t a1)
{
  uint64_t v2 = sub_225C7BF20();

  return sub_225C7A478(a1, v2);
}

unint64_t sub_225C79958(uint64_t a1, uint64_t a2)
{
  sub_225C7BF30();
  sub_225C7BDF0();
  uint64_t v4 = sub_225C7BF40();

  return sub_225C7A514(a1, a2, v4);
}

uint64_t sub_225C799D0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = sub_225C7BB60();
  uint64_t v5 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118570);
  int v40 = a2;
  uint64_t result = sub_225C7BEE0();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v36 = v3;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    id v38 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v37 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v39 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    unint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v19 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v20 = v19 | (v11 << 6);
      }
      else
      {
        int64_t v21 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v38;
        if (v21 >= v37) {
          goto LABEL_34;
        }
        unint64_t v22 = v38[v21];
        ++v11;
        if (!v22)
        {
          int64_t v11 = v21 + 1;
          if (v21 + 1 >= v37) {
            goto LABEL_34;
          }
          unint64_t v22 = v38[v11];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_34:
              if ((v40 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v36;
                goto LABEL_41;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
              if (v35 >= 64) {
                bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *id v38 = -1 << v35;
              }
              uint64_t v3 = v36;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v11 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v37) {
                  goto LABEL_34;
                }
                unint64_t v22 = v38[v11];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v23;
          }
        }
LABEL_21:
        unint64_t v15 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v11 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
      uint64_t v25 = v5;
      uint64_t v26 = *(void *)(v5 + 72);
      unint64_t v27 = *(void *)(v8 + 56) + v26 * v20;
      if (v40) {
        (*v16)(v7, v27, v41);
      }
      else {
        (*v39)(v7, v27, v41);
      }
      uint64_t result = sub_225C7BF20();
      uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v29) & ~*(void *)(v17 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v17 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v18 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v10 + 48) + 8 * v18) = v24;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v10 + 56) + v26 * v18, v7, v41);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v25;
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_225C79D78(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_225C7BB60();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118560);
  int v47 = a2;
  uint64_t v8 = sub_225C7BEE0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  id v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  id v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    int64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_225C7BF30();
    sub_225C7BDF0();
    uint64_t result = sub_225C7BF40();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  int64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

uint64_t sub_225C7A160(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118510);
  char v36 = a2;
  uint64_t v6 = sub_225C7BEE0();
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
    int64_t v22 = (void *)(v5 + 64);
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
      swift_bridgeObjectRetain();
    }
    sub_225C7BF30();
    sub_225C7BDF0();
    uint64_t result = sub_225C7BF40();
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
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_225C7A478(uint64_t a1, uint64_t a2)
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

unint64_t sub_225C7A514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_225C7BF00() & 1) == 0)
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
      while (!v14 && (sub_225C7BF00() & 1) == 0);
    }
  }
  return v6;
}

void *sub_225C7A5F8()
{
  uint64_t v1 = sub_225C7BB60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118570);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_225C7BED0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  unint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    unint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
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
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v5 + 48) + 8 * v15);
    unint64_t v18 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 56) + v18, v1);
    *(void *)(*(void *)(v7 + 48) + v16) = v17;
    unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 56) + v18, v4, v1);
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

void *sub_225C7A888()
{
  uint64_t v35 = sub_225C7BB60();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118560);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_225C7BED0();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    uint64_t v27 = v30;
LABEL_25:
    *uint64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  unint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    unint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    unint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *unint64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    unint64_t result = (void *)swift_release();
    uint64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_225C7AB4C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268118510);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_225C7BED0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

size_t sub_225C7AD04(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

id sub_225C7AEE0()
{
  uint64_t v1 = type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate();
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  uint64_t v7 = v1;
  uint64_t v8 = sub_225C7B040(&qword_268118430, (void (*)(uint64_t))type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate);
  uint64_t v6 = v2;
  sub_225C7BAA0();
  objc_allocWithZone((Class)sub_225C7BD00());
  uint64_t v3 = v0;
  *(void *)&v3[OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder] = sub_225C7BCF0();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for CIDCInternalPayloadBuilder();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate()
{
  return self;
}

uint64_t sub_225C7B040(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for CIDCInternalPayloadBuilder()
{
  return self;
}

uint64_t method lookup function for CIDCInternalPayloadBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CIDCInternalPayloadBuilder);
}

uint64_t dispatch thunk of CIDCInternalPayloadBuilder.__allocating_init(delegate:payloadBuilder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CIDCInternalPayloadBuilder.buildPayload(details:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x78);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *objc_super v5 = v2;
  v5[1] = sub_225C7B1EC;
  return v7(a1);
}

uint64_t sub_225C7B1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_225C7B2F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_225C7B320()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_225C7B368()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_225C78DDC;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_2681184D0 + dword_2681184D0);
  return v6(v2, v3, v4);
}

uint64_t sub_225C7B420()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  objc_super v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *objc_super v5 = v1;
  v5[1] = sub_225C7BA28;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2681184E0 + dword_2681184E0);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_21Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_225C7B524(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_225C7BA28;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2681184F0 + dword_2681184F0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_225C7B5F0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_225C7B628(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_225C78DDC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268118500 + dword_268118500);
  return v6(a1, v4);
}

_OWORD *sub_225C7B6E4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_225C7B6F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_225C7B750(uint64_t a1, unint64_t *a2)
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

unint64_t sub_225C7B78C()
{
  unint64_t result = qword_268118550;
  if (!qword_268118550)
  {
    sub_225C7B750(255, &qword_268118540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268118550);
  }
  return result;
}

unint64_t sub_225C7B7F4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268118578);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268118570);
    uint64_t v7 = (void *)sub_225C7BEF0();
    uint64_t v8 = (char *)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_225C7B9C4(v9, (uint64_t)v5, &qword_268118578);
      uint64_t v11 = *v5;
      unint64_t result = sub_225C79914(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = sub_225C7BB60();
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v8, v16);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
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

uint64_t sub_225C7B9BC()
{
  return swift_release();
}

uint64_t sub_225C7B9C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_225C7BA2C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for BundleToken()
{
  return self;
}

uint64_t sub_225C7BA60()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_225C7BA70()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_225C7BA80()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_225C7BA90()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_225C7BAA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_225C7BAB0()
{
  return MEMORY[0x270F12B68]();
}

uint64_t sub_225C7BAC0()
{
  return MEMORY[0x270F12B78]();
}

uint64_t sub_225C7BAD0()
{
  return MEMORY[0x270F12B80]();
}

uint64_t sub_225C7BAE0()
{
  return MEMORY[0x270F12BD8]();
}

uint64_t sub_225C7BAF0()
{
  return MEMORY[0x270F195B8]();
}

uint64_t sub_225C7BB00()
{
  return MEMORY[0x270F195C0]();
}

uint64_t sub_225C7BB10()
{
  return MEMORY[0x270F195C8]();
}

uint64_t sub_225C7BB20()
{
  return MEMORY[0x270F195D0]();
}

uint64_t sub_225C7BB30()
{
  return MEMORY[0x270F195D8]();
}

uint64_t sub_225C7BB40()
{
  return MEMORY[0x270F195E0]();
}

uint64_t sub_225C7BB50()
{
  return MEMORY[0x270F195E8]();
}

uint64_t sub_225C7BB60()
{
  return MEMORY[0x270F195F0]();
}

uint64_t sub_225C7BB70()
{
  return MEMORY[0x270F19780]();
}

uint64_t sub_225C7BB80()
{
  return MEMORY[0x270F19788]();
}

uint64_t sub_225C7BB90()
{
  return MEMORY[0x270F198D8]();
}

uint64_t sub_225C7BBA0()
{
  return MEMORY[0x270F198E0]();
}

uint64_t sub_225C7BBB0()
{
  return MEMORY[0x270F19BA8]();
}

uint64_t sub_225C7BBC0()
{
  return MEMORY[0x270F19BC0]();
}

uint64_t sub_225C7BBD0()
{
  return MEMORY[0x270F19BC8]();
}

uint64_t sub_225C7BBE0()
{
  return MEMORY[0x270F19BD0]();
}

uint64_t sub_225C7BBF0()
{
  return MEMORY[0x270F19BD8]();
}

uint64_t sub_225C7BC00()
{
  return MEMORY[0x270F19BE0]();
}

uint64_t sub_225C7BC10()
{
  return MEMORY[0x270F19BE8]();
}

uint64_t sub_225C7BC20()
{
  return MEMORY[0x270F19BF0]();
}

uint64_t sub_225C7BC30()
{
  return MEMORY[0x270F19BF8]();
}

uint64_t sub_225C7BC40()
{
  return MEMORY[0x270F19C00]();
}

uint64_t sub_225C7BC50()
{
  return MEMORY[0x270F19C08]();
}

uint64_t sub_225C7BC60()
{
  return MEMORY[0x270F19D80]();
}

uint64_t sub_225C7BC70()
{
  return MEMORY[0x270F19D88]();
}

uint64_t sub_225C7BC80()
{
  return MEMORY[0x270F19F80]();
}

uint64_t sub_225C7BC90()
{
  return MEMORY[0x270F19F88]();
}

uint64_t sub_225C7BCA0()
{
  return MEMORY[0x270F19F90]();
}

uint64_t sub_225C7BCB0()
{
  return MEMORY[0x270F19F98]();
}

uint64_t sub_225C7BCC0()
{
  return MEMORY[0x270F19FA0]();
}

uint64_t sub_225C7BCD0()
{
  return MEMORY[0x270F19FA8]();
}

uint64_t sub_225C7BCE0()
{
  return MEMORY[0x270F19FB0]();
}

uint64_t sub_225C7BCF0()
{
  return MEMORY[0x270F1A1C8]();
}

uint64_t sub_225C7BD00()
{
  return MEMORY[0x270F1A1D0]();
}

uint64_t sub_225C7BD10()
{
  return MEMORY[0x270F1A1E8]();
}

uint64_t sub_225C7BD20()
{
  return MEMORY[0x270F1A1F0]();
}

uint64_t sub_225C7BD30()
{
  return MEMORY[0x270F1A1F8]();
}

uint64_t sub_225C7BD40()
{
  return MEMORY[0x270F1A200]();
}

uint64_t sub_225C7BD50()
{
  return MEMORY[0x270F1A240]();
}

uint64_t sub_225C7BD60()
{
  return MEMORY[0x270F1A248]();
}

uint64_t sub_225C7BD70()
{
  return MEMORY[0x270F1A330]();
}

uint64_t sub_225C7BD80()
{
  return MEMORY[0x270F1A350]();
}

uint64_t sub_225C7BD90()
{
  return MEMORY[0x270F1A358]();
}

uint64_t sub_225C7BDA0()
{
  return MEMORY[0x270F1A360]();
}

uint64_t sub_225C7BDB0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_225C7BDC0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_225C7BDD0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_225C7BDE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_225C7BDF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_225C7BE00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_225C7BE10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_225C7BE20()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_225C7BE30()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_225C7BE40()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_225C7BE50()
{
  return MEMORY[0x270F1A3B8]();
}

uint64_t sub_225C7BE60()
{
  return MEMORY[0x270F1A3C0]();
}

uint64_t sub_225C7BE70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_225C7BE80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_225C7BE90()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_225C7BEA0()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_225C7BEB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_225C7BEC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_225C7BED0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_225C7BEE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_225C7BEF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_225C7BF00()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_225C7BF10()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_225C7BF20()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_225C7BF30()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_225C7BF40()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}