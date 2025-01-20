void sub_24C893DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void DSRemotePairing.getPairedDevices(completion:)(void (*a1)(void), uint64_t a2)
{
  v35 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F87E8);
  MEMORY[0x270FA5388]();
  v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24C895720();
  uint64_t v38 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24C8957D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C895770();
  v12 = (void *)sub_24C895760();
  uint64_t v13 = sub_24C895740();
  v14 = v35;
  uint64_t v41 = v8;
  id v34 = v12;
  uint64_t v42 = MEMORY[0x263F8EE78];
  uint64_t v15 = *(void *)(v13 + 16);
  if (v15)
  {
    v33[0] = v13;
    v33[1] = a2;
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v16 = v9 + 16;
    uint64_t v39 = v5;
    v40 = v17;
    unint64_t v18 = v13 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
    v19 = (void (**)(char *, uint64_t))(v16 - 8);
    uint64_t v36 = *(void *)(v16 + 56);
    v37 = (void (**)(char *, uint64_t))(v38 + 8);
    uint64_t v20 = v41;
    uint64_t v38 = v16;
    while (1)
    {
      v40(v11, v18, v20);
      sub_24C8957B0();
      id v21 = objc_allocWithZone((Class)DSPairedComputer);
      v22 = (void *)sub_24C895820();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v21, sel_initWithDeviceName_, v22, v33[0]);

      if (!v23) {
        break;
      }
      sub_24C8957A0();
      if (v24)
      {
        v25 = (void *)sub_24C895820();
        swift_bridgeObjectRelease();
      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(v23, sel_setSerialNumber_, v25);

      sub_24C8957C0();
      if (v26)
      {
        v27 = (void *)sub_24C895820();
        swift_bridgeObjectRelease();
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(v23, sel_setMarketingName_, v27);

      sub_24C895790();
      sub_24C895710();
      (*v37)(v7, v39);
      v28 = (void *)sub_24C895820();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setRemotePairingFrameworkIdentifier_, v28);

      sub_24C895780();
      uint64_t v29 = sub_24C8956F0();
      uint64_t v30 = *(void *)(v29 - 8);
      v31 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v4, 1, v29) != 1)
      {
        v31 = (void *)sub_24C8956E0();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v29);
      }
      objc_msgSend(v23, sel_setDatePaired_, v31);

      id v32 = v23;
      MEMORY[0x2532FE770]();
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24C895880();
      }
      sub_24C895890();
      sub_24C895870();

      uint64_t v20 = v41;
      (*v19)(v11, v41);
      v18 += v36;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        v35(0);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v14(0);
LABEL_17:
  }
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

void sub_24C894648(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_24C8956D0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t DSRemotePairing.removeAllPairedDevices()()
{
  sub_24C895770();
  v0 = (void *)sub_24C895760();
  sub_24C895750();

  return 0;
}

uint64_t sub_24C894790(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id DSRemotePairing.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id DSRemotePairing.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DSRemotePairing.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24C894988(const void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F87E8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24C895720();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24C8957D0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C895770();
  v12 = (void *)sub_24C895760();
  uint64_t v13 = sub_24C895740();
  uint64_t v42 = v8;
  uint64_t v43 = MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    v35 = v12;
    uint64_t v36 = a1;
    uint64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    uint64_t v15 = v9 + 16;
    uint64_t v39 = v4;
    v40 = v16;
    unint64_t v17 = (*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64);
    v34[1] = v13;
    unint64_t v18 = v13 + v17;
    uint64_t v19 = v15;
    uint64_t v20 = (void (**)(char *, uint64_t))(v15 - 8);
    uint64_t v41 = v19;
    uint64_t v37 = *(void *)(v19 + 56);
    uint64_t v38 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v21 = v42;
    while (1)
    {
      v40(v11, v18, v21);
      sub_24C8957B0();
      id v22 = objc_allocWithZone((Class)DSPairedComputer);
      id v23 = (void *)sub_24C895820();
      swift_bridgeObjectRelease();
      id v24 = objc_msgSend(v22, sel_initWithDeviceName_, v23);

      if (!v24) {
        break;
      }
      sub_24C8957A0();
      if (v25)
      {
        uint64_t v26 = (void *)sub_24C895820();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v26 = 0;
      }
      objc_msgSend(v24, sel_setSerialNumber_, v26);

      sub_24C8957C0();
      if (v27)
      {
        v28 = (void *)sub_24C895820();
        swift_bridgeObjectRelease();
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(v24, sel_setMarketingName_, v28);

      sub_24C895790();
      sub_24C895710();
      (*v38)(v7, v39);
      uint64_t v29 = (void *)sub_24C895820();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_setRemotePairingFrameworkIdentifier_, v29);

      sub_24C895780();
      uint64_t v30 = sub_24C8956F0();
      uint64_t v31 = *(void *)(v30 - 8);
      id v32 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v3, 1, v30) != 1)
      {
        id v32 = (void *)sub_24C8956E0();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v3, v30);
      }
      objc_msgSend(v24, sel_setDatePaired_, v32);

      id v33 = v24;
      MEMORY[0x2532FE770]();
      if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24C895880();
      }
      sub_24C895890();
      sub_24C895870();

      uint64_t v21 = v42;
      (*v20)(v11, v42);
      v18 += v37;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        v12 = v35;
        a1 = v36;
        goto LABEL_17;
      }
    }
    _Block_release(v36);
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_17:
    (*((void (**)(const void *, void))a1 + 2))(a1, 0);
  }
}

id *_s15DSRemotePairingAAC21removeSelectedDevices_27invokingCompletionHandlerOn10completionySaySo16DSPairedComputerCG_So17OS_dispatch_queueCSgys5Error_pSgctF_0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F87F8);
  MEMORY[0x270FA5388]();
  uint64_t v37 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_24C8957E0();
  uint64_t v30 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24C8957F0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t i = *(void *)(sub_24C895810() - 8);
  uint64_t result = (id *)MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_19:
    v35 = result;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24C8958D0();
    swift_bridgeObjectRelease();
    uint64_t result = v35;
    if (v24) {
      goto LABEL_3;
    }
LABEL_20:
    if (!a2)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    uint64_t v25 = (char *)result;
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v39;
    *(void *)(v26 + 16) = v38;
    *(void *)(v26 + 24) = v27;
    aBlock[4] = sub_24C89558C;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24C894790;
    aBlock[3] = &block_descriptor;
    v28 = _Block_copy(aBlock);
    swift_retain();
    sub_24C895800();
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_24C8955D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8808);
    sub_24C895628();
    sub_24C8958B0();
    MEMORY[0x2532FE7D0](0, v16, v12, v28);
    _Block_release(v28);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(char *, char *))(i + 8))(v16, v25);
    return (id *)swift_release();
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_20;
  }
LABEL_3:
  sub_24C895770();
  unint64_t v18 = (void *)sub_24C895760();
  if (v17)
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_24C8958D0();
    if (v17)
    {
LABEL_5:
      v35 = (id *)a1;
      uint64_t v33 = a2;
      unint64_t v34 = a1 & 0xC000000000000001;
      unsigned int v32 = *MEMORY[0x263F63738];
      uint64_t v31 = (void (**)(char *, void, uint64_t))(v30 + 104);
      v12 = (char *)(v30 + 8);
      for (uint64_t i = 4; ; ++i)
      {
        a1 = i - 4;
        if (v34) {
          uint64_t result = (id *)MEMORY[0x2532FE7F0](i - 4, v35);
        }
        else {
          uint64_t result = (id *)v35[i];
        }
        uint64_t v16 = (char *)result;
        a2 = i - 3;
        if (__OFADD__(a1, 1))
        {
          __break(1u);
          goto LABEL_19;
        }
        uint64_t result = (id *)objc_msgSend(result, sel_remotePairingFrameworkIdentifier);
        if (!result) {
          break;
        }
        uint64_t v19 = result;
        sub_24C895830();

        uint64_t v20 = v37;
        sub_24C895700();
        uint64_t v9 = (uint64_t)v20;
        swift_bridgeObjectRelease();
        uint64_t v21 = sub_24C895720();
        uint64_t v22 = *(void *)(v21 - 8);
        uint64_t result = (id *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v9, 1, v21);
        if (result == 1) {
          goto LABEL_24;
        }
        (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(v8, v9, v21);
        uint64_t v10 = v36;
        (*v31)(v8, v32, v36);
        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = v38;
        *(void *)(v23 + 24) = v39;
        swift_retain();
        sub_24C895730();

        swift_release();
        (*(void (**)(char *, uint64_t))v12)(v8, v10);
        if (a2 == v17)
        {

          return (id *)swift_bridgeObjectRelease();
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
  }
  else
  {
    unint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_5;
    }
  }

  return (id *)swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for DSRemotePairing()
{
  return self;
}

unint64_t sub_24C8954AC()
{
  unint64_t result = qword_2697F87F0;
  if (!qword_2697F87F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697F87F0);
  }
  return result;
}

uint64_t sub_24C8954EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24C895524(uint64_t a1)
{
  sub_24C894648(a1, *(void *)(v1 + 16));
}

uint64_t sub_24C89552C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24C895564()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24C89558C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
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

unint64_t sub_24C8955D0()
{
  unint64_t result = qword_2697F8800;
  if (!qword_2697F8800)
  {
    sub_24C8957F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8800);
  }
  return result;
}

unint64_t sub_24C895628()
{
  unint64_t result = qword_2697F8810;
  if (!qword_2697F8810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F8808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F8810);
  }
  return result;
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

uint64_t sub_24C8956D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24C8956E0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24C8956F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24C895700()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24C895710()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24C895720()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C895730()
{
  return MEMORY[0x270F5A8E8]();
}

uint64_t sub_24C895740()
{
  return MEMORY[0x270F5A8F0]();
}

uint64_t sub_24C895750()
{
  return MEMORY[0x270F5A8F8]();
}

uint64_t sub_24C895760()
{
  return MEMORY[0x270F5A900]();
}

uint64_t sub_24C895770()
{
  return MEMORY[0x270F5A908]();
}

uint64_t sub_24C895780()
{
  return MEMORY[0x270F5A910]();
}

uint64_t sub_24C895790()
{
  return MEMORY[0x270F5A918]();
}

uint64_t sub_24C8957A0()
{
  return MEMORY[0x270F5A920]();
}

uint64_t sub_24C8957B0()
{
  return MEMORY[0x270F5A928]();
}

uint64_t sub_24C8957C0()
{
  return MEMORY[0x270F5A930]();
}

uint64_t sub_24C8957D0()
{
  return MEMORY[0x270F5A938]();
}

uint64_t sub_24C8957E0()
{
  return MEMORY[0x270F5A940]();
}

uint64_t sub_24C8957F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24C895800()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24C895810()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24C895820()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C895830()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C895840()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24C895850()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24C895860()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24C895870()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24C895880()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24C895890()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24C8958A0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24C8958B0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24C8958C0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24C8958D0()
{
  return MEMORY[0x270F9F080]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

uint64_t lockdown_copy_paired_host_info()
{
  return MEMORY[0x270F99B30]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}