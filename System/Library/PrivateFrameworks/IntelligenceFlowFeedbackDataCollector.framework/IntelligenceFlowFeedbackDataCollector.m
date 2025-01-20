uint64_t DeviceContextBuilder.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DeviceContextBuilder.init()()
{
  return v0;
}

id DeviceContextBuilder.getCurrentDeviceContext()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_252E629A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id result = (id)MobileGestalt_get_current_device();
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  v7 = result;
  id v8 = (id)MobileGestalt_copy_buildVersion_obj();

  if (v8)
  {
    uint64_t v9 = sub_252E62D70();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  sub_252E62990();
  uint64_t v12 = sub_252E62980();
  uint64_t v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  id result = (id)MobileGestalt_get_current_device();
  if (!result) {
    goto LABEL_11;
  }
  v15 = result;
  id v16 = (id)MobileGestalt_copy_marketingNameString_obj();

  if (v16)
  {
    uint64_t v17 = sub_252E62D70();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  sub_252E560FC(&qword_269CB6B40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252E633E0;
  *(void *)(inited + 32) = 0x79746867696DLL;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = 7104878;
  *(void *)(inited + 56) = 0xE300000000000000;
  id result = (id)sub_252E62D60();
  *a1 = v12;
  a1[1] = v14;
  a1[2] = (uint64_t)result;
  a1[3] = v9;
  a1[4] = v11;
  a1[5] = v17;
  a1[6] = v19;
  return result;
}

uint64_t sub_252E560FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t DeviceContextBuilder.deinit()
{
  return v0;
}

uint64_t DeviceContextBuilder.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for DeviceContextBuilder()
{
  return self;
}

uint64_t method lookup function for DeviceContextBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceContextBuilder);
}

uint64_t dispatch thunk of DeviceContextBuilder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t TranscriptContextBuilder.__allocating_init()()
{
  sub_252E5F2DC();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  sub_252E5620C();
  return v0;
}

uint64_t TranscriptContextBuilder.init()()
{
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  sub_252E5620C();
  return v0;
}

uint64_t sub_252E5620C()
{
  uint64_t v1 = sub_252E62970();
  sub_252E5F288();
  uint64_t v3 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  sub_252E5F2C4();
  sub_252E560FC(&qword_269CB6C28);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)v20 - v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = MEMORY[0x263F8EE78];
  id v10 = objc_msgSend((id)BiomeLibrary(), sel_IntelligenceFlow);
  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v10, sel_Transcript);
  swift_unknownObjectRelease();
  id v12 = objc_msgSend(v11, sel_Datastream);
  swift_unknownObjectRelease();
  sub_252E62960();
  sub_252E5D99C((uint64_t)v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  sub_252E5EDE4((uint64_t)v8, 0, 1, v1);
  sub_252E5EDE4((uint64_t)v6, 1, 1, v1);
  id v13 = objc_allocWithZone(MEMORY[0x263F2A8B0]);
  id v14 = sub_252E5DBC8((uint64_t)v8, (uint64_t)v6, 0, 0, 0);
  id v15 = objc_msgSend(v12, sel_publisherWithOptions_, v14);

  v25 = (void (*)(void *))nullsub_1;
  uint64_t v26 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  v23 = sub_252E5D6D8;
  v24 = &unk_27031E728;
  id v16 = _Block_copy(&aBlock);
  v25 = sub_252E5F278;
  uint64_t v26 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  v23 = sub_252E5D6D8;
  v24 = &unk_27031E750;
  uint64_t v17 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v18 = objc_msgSend(v15, sel_sinkWithCompletion_receiveInput_, v16, v17);

  _Block_release(v17);
  _Block_release(v16);

  swift_beginAccess();
  *(void *)(v20[1] + 16) = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t TranscriptContextBuilder.getTranscriptContext(clientRequestId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_retain();
  unint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_252E5731C(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_252E577CC(v7, a1, a2);
  uint64_t v9 = sub_252E57B0C(v8);
  id v10 = sub_252E58F08(v8);
  id v11 = sub_252E5A9BC(v8);
  id v12 = sub_252E5BC90(v8);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  if (*((void *)v9 + 2))
  {
    uint64_t v16 = *((void *)v9 + 4);
    uint64_t v15 = *((void *)v9 + 5);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v15 = 0;
  }
  swift_bridgeObjectRelease();
  if (*((void *)v10 + 2))
  {
    uint64_t v18 = *((void *)v10 + 4);
    uint64_t v17 = *((void *)v10 + 5);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v16;
  *(void *)(a3 + 8) = v15;
  *(void *)(a3 + 16) = v11;
  *(void *)(a3 + 24) = v18;
  *(void *)(a3 + 32) = v17;
  *(_DWORD *)(a3 + 40) = v14;
  *(unsigned char *)(a3 + 44) = BYTE4(v14) & 1;
  *(void *)(a3 + 48) = v12;
  return result;
}

uint64_t sub_252E566C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v3 = sub_252E62A20();
  MEMORY[0x270FA5388](v3 - 8);
  os_log_t v99 = (os_log_t)((char *)&v93 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_252E62AF0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v97 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v96 = (char *)&v93 - v10;
  MEMORY[0x270FA5388](v9);
  v104 = (char *)&v93 - v11;
  uint64_t v12 = sub_252E62A80();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v101 = (char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v100 = (char *)&v93 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v103 = (char *)&v93 - v19;
  MEMORY[0x270FA5388](v18);
  v21 = (char *)&v93 - v20;
  uint64_t v22 = sub_252E560FC(&qword_269CB6C28);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  v25 = (char *)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  v27 = (char *)&v93 - v26;
  uint64_t v28 = sub_252E5F00C(a1);
  unint64_t v30 = v29;
  v102 = (void (*)(char *, uint64_t))a1;
  id v31 = objc_msgSend(a1, sel_absoluteTimestamp);
  uint64_t v106 = v12;
  if (v31)
  {
    v32 = v31;
    sub_252E62950();

    uint64_t v33 = sub_252E62970();
    uint64_t v34 = (uint64_t)v25;
    uint64_t v35 = 0;
  }
  else
  {
    uint64_t v33 = sub_252E62970();
    uint64_t v34 = (uint64_t)v25;
    uint64_t v35 = 1;
  }
  sub_252E5EDE4(v34, v35, 1, v33);
  sub_252E5F070((uint64_t)v25, (uint64_t)v27, &qword_269CB6C28);
  sub_252E62970();
  int v36 = sub_252E5EDBC((uint64_t)v27, 1, v33);
  uint64_t v95 = v6;
  if (v36 == 1)
  {
    sub_252E5F0CC((uint64_t)v27, &qword_269CB6C28);
    uint64_t v37 = 0;
    unint64_t v38 = 0;
  }
  else
  {
    uint64_t v37 = sub_252E62930();
    unint64_t v38 = v39;
    (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v27, v33);
  }
  sub_252E62A60();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40 = sub_252E62A70();
  os_log_type_t v41 = sub_252E62E10();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v94 = v5;
    uint64_t v43 = v42;
    uint64_t v44 = swift_slowAlloc();
    v93 = v21;
    uint64_t v45 = v37;
    uint64_t v46 = v44;
    *(void *)&v107[0] = v44;
    *(_DWORD *)uint64_t v43 = 136315394;
    if (!v30) {
      uint64_t v28 = 0x3E4C494E3CLL;
    }
    uint64_t v98 = v13;
    if (v30) {
      unint64_t v47 = v30;
    }
    else {
      unint64_t v47 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v109 = sub_252E5E4A8(v28, v47, (uint64_t *)v107);
    sub_252E62E30();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2080;
    if (v38) {
      uint64_t v48 = v45;
    }
    else {
      uint64_t v48 = 0x3E4C494E3CLL;
    }
    if (v38) {
      unint64_t v49 = v38;
    }
    else {
      unint64_t v49 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v109 = sub_252E5E4A8(v48, v49, (uint64_t *)v107);
    uint64_t v13 = v98;
    sub_252E62E30();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_252E54000, v40, v41, "Decoding Event: %s with eventTimeStamp: %s \n", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533CE120](v46, -1, -1);
    uint64_t v50 = v43;
    uint64_t v5 = v94;
    MEMORY[0x2533CE120](v50, -1, -1);

    v51 = *(void (**)(char *, uint64_t))(v13 + 8);
    v52 = v93;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v51 = *(void (**)(char *, uint64_t))(v13 + 8);
    v52 = v21;
  }
  uint64_t v53 = v106;
  v51(v52, v106);
  v55 = v103;
  v54 = v104;
  v56 = v102;
  uint64_t v57 = sub_252E5F120(v102);
  if (v58 >> 60 == 15)
  {
    uint64_t v59 = (uint64_t)v101;
    sub_252E62A60();
    v60 = v56;
    v61 = sub_252E62A70();
    os_log_type_t v62 = sub_252E62E10();
    if (os_log_type_enabled(v61, v62))
    {
      v102 = v51;
      v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(void *)&v107[0] = v64;
      *(_DWORD *)v63 = 136315138;
      uint64_t v65 = sub_252E5F00C(v60);
      if (v66)
      {
        unint64_t v67 = v66;
      }
      else
      {
        uint64_t v65 = 0x3E4C494E3CLL;
        unint64_t v67 = 0xE500000000000000;
      }
      uint64_t v109 = sub_252E5E4A8(v65, v67, (uint64_t *)v107);
      sub_252E62E30();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_252E54000, v61, v62, "BMSageTranscript did not contain valid event payload, skipping event: %s", v63, 0xCu);
      uint64_t v68 = 1;
      swift_arrayDestroy();
      MEMORY[0x2533CE120](v64, -1, -1);
      MEMORY[0x2533CE120](v63, -1, -1);

      v102(v101, v106);
    }
    else
    {

      v51((char *)v59, v53);
      uint64_t v68 = 1;
    }
  }
  else
  {
    uint64_t v69 = v57;
    unint64_t v70 = v58;
    v102 = v51;
    uint64_t v108 = 0;
    memset(v107, 0, sizeof(v107));
    sub_252E5F184(v57, v58);
    sub_252E62A10();
    sub_252E5EFC4(&qword_269CB6B70, MEMORY[0x263F4DA00]);
    v101 = (char *)v69;
    sub_252E62A40();
    sub_252E62A60();
    uint64_t v71 = v95;
    v72 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
    v72(v96, v54, v5);
    v72(v97, v54, v5);
    v73 = sub_252E62A70();
    os_log_type_t v74 = sub_252E62E10();
    int v75 = v74;
    if (os_log_type_enabled(v73, v74))
    {
      uint64_t v77 = swift_slowAlloc();
      os_log_t v99 = v73;
      uint64_t v78 = v71;
      uint64_t v79 = v77;
      v100 = (char *)swift_slowAlloc();
      *(void *)&v107[0] = v100;
      *(_DWORD *)uint64_t v79 = 136315394;
      uint64_t v98 = v13;
      v93 = (char *)(v79 + 4);
      LODWORD(v94) = v75;
      v80 = v96;
      uint64_t v81 = sub_252E62AE0();
      uint64_t v109 = sub_252E5E4A8(v81, v82, (uint64_t *)v107);
      sub_252E62E30();
      swift_bridgeObjectRelease();
      v83 = *(void (**)(char *, uint64_t))(v78 + 8);
      v83(v80, v5);
      *(_WORD *)(v79 + 12) = 2080;
      v84 = v97;
      uint64_t v85 = sub_252E62A50();
      uint64_t v109 = sub_252E5E4A8(v85, v86, (uint64_t *)v107);
      v54 = v104;
      sub_252E62E30();
      swift_bridgeObjectRelease();
      v83(v84, v5);
      os_log_t v87 = v99;
      _os_log_impl(&dword_252E54000, v99, (os_log_type_t)v94, "Decoded SessionID: %s for event: %s \n", (uint8_t *)v79, 0x16u);
      v88 = v100;
      swift_arrayDestroy();
      MEMORY[0x2533CE120](v88, -1, -1);
      MEMORY[0x2533CE120](v79, -1, -1);

      sub_252E5F21C((uint64_t)v101, v70);
      v102(v103, v106);
      uint64_t v89 = v95;
    }
    else
    {
      sub_252E5F21C((uint64_t)v101, v70);
      uint64_t v90 = v71;
      v91 = *(void (**)(char *, uint64_t))(v71 + 8);
      v91(v96, v5);
      v91(v97, v5);

      v102(v55, v53);
      uint64_t v89 = v90;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v89 + 32))(v105, v54, v5);
    uint64_t v68 = 0;
  }
  return sub_252E5EDE4(v105, v68, 1, v5);
}

uint64_t sub_252E5731C(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_252E560FC(&qword_269CB6C10);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252E62AF0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v40 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_252E560FC(&qword_269CB6C18);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v46 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v39 = *(void *)(v46 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v46);
  uint64_t v45 = (uint64_t)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v38 = (uint64_t)&v36 - v15;
  if (a1 >> 62) {
    goto LABEL_26;
  }
  uint64_t v16 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v16; uint64_t v16 = sub_252E62EA0())
  {
    uint64_t v42 = v7;
    unint64_t v44 = a1 & 0xC000000000000001;
    int v36 = v2;
    uint64_t v37 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t v7 = 4;
    unint64_t v43 = a1;
    uint64_t v8 = v46;
    uint64_t v41 = v16;
    while (1)
    {
      uint64_t v48 = v17;
      id v18 = v44 ? (id)MEMORY[0x2533CDBF0](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      uint64_t v2 = v18;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v47 = v7 - 3;
      sub_252E566C4(v18, (uint64_t)v6);
      uint64_t v19 = v42;
      if (sub_252E5EDBC((uint64_t)v6, 1, v42) == 1)
      {
        sub_252E5F0CC((uint64_t)v6, &qword_269CB6C10);
        uint64_t v20 = 1;
      }
      else
      {
        v21 = *v37;
        uint64_t v22 = v6;
        uint64_t v23 = v40;
        (*v37)(v40, v22, v19);
        uint64_t v24 = sub_252E5F00C(v2);
        uint64_t v26 = 7104878;
        if (v25) {
          uint64_t v26 = v24;
        }
        unint64_t v27 = 0xE300000000000000;
        if (v25) {
          unint64_t v27 = v25;
        }
        *uint64_t v12 = v26;
        v12[1] = v27;
        uint64_t v28 = v23;
        uint64_t v6 = v22;
        uint64_t v8 = v46;
        v21((char *)v12 + *(int *)(v46 + 48), v28, v19);
        a1 = v43;
        uint64_t v20 = 0;
      }
      uint64_t v29 = v41;
      sub_252E5EDE4((uint64_t)v12, v20, 1, v8);

      BOOL v30 = sub_252E5EDBC((uint64_t)v12, 1, v8) == 1;
      uint64_t v17 = v48;
      if (v30)
      {
        sub_252E5F0CC((uint64_t)v12, &qword_269CB6C18);
      }
      else
      {
        uint64_t v31 = v38;
        sub_252E5F070((uint64_t)v12, v38, &qword_269CB6B68);
        sub_252E5F070(v31, v45, &qword_269CB6B68);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v17 = sub_252E5DF18(0, *(void *)(v17 + 16) + 1, 1, v17);
        }
        unint64_t v34 = *(void *)(v17 + 16);
        unint64_t v33 = *(void *)(v17 + 24);
        if (v34 >= v33 >> 1) {
          uint64_t v17 = sub_252E5DF18(v33 > 1, v34 + 1, 1, v17);
        }
        *(void *)(v17 + 16) = v34 + 1;
        sub_252E5F070(v45, v17+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(void *)(v39 + 72) * v34, &qword_269CB6B68);
        a1 = v43;
      }
      ++v7;
      if (v47 == v29)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v17;
      }
    }
    __break(1u);
LABEL_26:
    swift_bridgeObjectRetain();
  }
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_252E577CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v42 = (uint64_t)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v39 = (void *)((char *)v36 - v11);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (void *)((char *)v36 - v13);
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v45 = MEMORY[0x263F8EE78];
  uint64_t v38 = *(void *)(a1 + 16);
  if (!v38)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v15;
  }
  v36[1] = v3;
  uint64_t v37 = a1;
  unint64_t v16 = 0;
  while (v16 < *(void *)(a1 + 16))
  {
    unint64_t v17 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
    uint64_t v43 = *(void *)(v40 + 72);
    unint64_t v44 = v17;
    sub_252E5EF68(a1 + v17 + v43 * v16, (uint64_t)v14, &qword_269CB6B68);
    uint64_t v18 = *(int *)(v41 + 48);
    uint64_t v19 = v39;
    uint64_t v20 = (char *)v39 + v18;
    v21 = (char *)v14 + v18;
    uint64_t v22 = v14[1];
    *uint64_t v39 = *v14;
    v19[1] = v22;
    uint64_t v23 = sub_252E62AF0();
    uint64_t v24 = a2;
    uint64_t v25 = a3;
    uint64_t v26 = *(void *)(v23 - 8);
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v20, v21, v23);
    uint64_t v27 = sub_252E62AD0();
    uint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v23);
    a3 = v25;
    a2 = v24;
    if (v27 == v24 && v29 == a3)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      sub_252E5F070((uint64_t)v14, v42, &qword_269CB6B68);
      uint64_t v32 = v45;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      a1 = v37;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_252E612F0(0, *(void *)(v32 + 16) + 1, 1);
        uint64_t v32 = v45;
      }
      unint64_t v35 = *(void *)(v32 + 16);
      unint64_t v34 = *(void *)(v32 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_252E612F0(v34 > 1, v35 + 1, 1);
        uint64_t v32 = v45;
      }
      *(void *)(v32 + 16) = v35 + 1;
      uint64_t result = sub_252E5F070(v42, v32 + v44 + v35 * v43, &qword_269CB6B68);
      goto LABEL_16;
    }
    char v31 = sub_252E62F10();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_11;
    }
    uint64_t result = sub_252E5F0CC((uint64_t)v14, &qword_269CB6B68);
    a1 = v37;
LABEL_16:
    if (v38 == ++v16)
    {
      uint64_t v15 = v45;
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

char *sub_252E57B0C(uint64_t a1)
{
  uint64_t v2 = sub_252E62A80();
  v152 = *(void (***)(char *, uint64_t))(v2 - 8);
  uint64_t v153 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v134 = (char *)&v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v141 = (char *)&v116 - v5;
  uint64_t v125 = sub_252E62D20();
  v155 = *(void (***)(char *, uint64_t))(v125 - 8);
  MEMORY[0x270FA5388](v125);
  v124 = (char *)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_252E62AB0();
  v151 = *(void (***)(char *, char *, uint64_t))(v129 - 8);
  MEMORY[0x270FA5388](v129);
  v128 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_252E62AA0();
  uint64_t v150 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v130 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_252E560FC(&qword_269CB6BE8);
  MEMORY[0x270FA5388](v9 - 8);
  v139 = (char *)&v116 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_252E560FC(&qword_269CB6BF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v132 = (uint64_t)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v145 = (uint64_t)&v116 - v14;
  uint64_t v144 = sub_252E62B30();
  *(void *)&long long v148 = *(void *)(v144 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v144);
  v136 = (char *)&v116 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v146 = (char *)&v116 - v17;
  uint64_t v18 = sub_252E560FC(&qword_269CB6B58);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v116 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_252E560FC(&qword_269CB6B60);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v143 = (uint64_t)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v116 - v24;
  uint64_t v26 = sub_252E62AF0();
  uint64_t v147 = *(void *)(v26 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))((char *)&v116 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v27);
  char v31 = (char *)&v116 - v30;
  uint64_t v157 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v32 = *(void *)(v157 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v157);
  unint64_t v35 = (char *)&v116 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v33);
  uint64_t v158 = (uint64_t)&v116 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v39 = (void (***)(char *, uint64_t))((char *)&v116 - v38);
  uint64_t v161 = MEMORY[0x263F8EE78];
  uint64_t v40 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  v149 = v20;
  v160 = v25;
  uint64_t v140 = v26;
  v159 = v31;
  uint64_t v154 = v32;
  if (v40)
  {
    v156 = v29;
    unint64_t v41 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    uint64_t v42 = *(void *)(v32 + 72);
    uint64_t v142 = a1;
    uint64_t v43 = a1 + v41;
    uint64_t v44 = MEMORY[0x263F8EE78];
    do
    {
      sub_252E5EF68(v43, (uint64_t)v39, &qword_269CB6B68);
      BOOL v45 = *v39 == 0x74736575716552 && v39[1] == 0xE700000000000000;
      if (v45 || (sub_252E62F10() & 1) != 0)
      {
        sub_252E5F070((uint64_t)v39, (uint64_t)v35, &qword_269CB6B68);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_252E612F0(0, *(void *)(v44 + 16) + 1, 1);
        }
        uint64_t v44 = v161;
        unint64_t v47 = *(void *)(v161 + 16);
        unint64_t v46 = *(void *)(v161 + 24);
        if (v47 >= v46 >> 1)
        {
          sub_252E612F0(v46 > 1, v47 + 1, 1);
          uint64_t v44 = v161;
        }
        *(void *)(v44 + 16) = v47 + 1;
        sub_252E5F070((uint64_t)v35, v44 + v41 + v47 * v42, &qword_269CB6B68);
        char v31 = v159;
      }
      else
      {
        sub_252E5F0CC((uint64_t)v39, &qword_269CB6B68);
      }
      v43 += v42;
      --v40;
    }
    while (v40);
    uint64_t v48 = v161;
    uint64_t v20 = v149;
    uint64_t v26 = v140;
    uint64_t v29 = v156;
  }
  else
  {
    uint64_t v48 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v50 = *(void *)(v48 + 16);
  if (v50)
  {
    uint64_t v157 = v158 + *(int *)(v157 + 48);
    unint64_t v51 = (*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80);
    uint64_t v127 = v48;
    uint64_t v52 = v48 + v51;
    v156 = (void (**)(char *, uint64_t, uint64_t))(v147 + 32);
    v137 = (void (**)(char *, uint64_t, uint64_t))(v148 + 32);
    v117 = (void (**)(char *, uint64_t, uint64_t))(v155 + 4);
    v116 = v155 + 1;
    v138 = (void (**)(char *, uint64_t))(v148 + 8);
    uint64_t v154 = *(void *)(v154 + 72);
    v155 = (void (**)(char *, uint64_t))(v147 + 8);
    v120 = (void (**)(char *, uint64_t, uint64_t))(v151 + 4);
    v119 = (void (**)(char *, uint64_t))(v151 + 1);
    LODWORD(v142) = *MEMORY[0x263F4DC18];
    v123 = (void (**)(char *, uint64_t, uint64_t))(v150 + 32);
    v122 = (void (**)(char *, uint64_t))(v150 + 8);
    int v126 = *MEMORY[0x263F4DD00];
    v133 = (void (**)(char *, char *, uint64_t))(v148 + 16);
    v151 = (void (**)(char *, char *, uint64_t))(v147 + 16);
    ++v152;
    v135 = (char *)MEMORY[0x263F8EE78];
    int v121 = *MEMORY[0x263F4DD08];
    int v118 = *MEMORY[0x263F4DCF8];
    *(void *)&long long v49 = 136315138;
    long long v148 = v49;
    uint64_t v147 = MEMORY[0x263F8EE58] + 8;
    uint64_t v53 = v134;
    while (1)
    {
      sub_252E5EF68(v52, v158, &qword_269CB6B68);
      swift_bridgeObjectRelease();
      (*v156)(v31, v157, v26);
      sub_252E62AC0();
      uint64_t v54 = sub_252E62B10();
      if (sub_252E5EDBC((uint64_t)v20, 1, v54) == 1)
      {
        sub_252E5F0CC((uint64_t)v20, &qword_269CB6B58);
        uint64_t v55 = sub_252E62C20();
        sub_252E5EDE4((uint64_t)v160, 1, 1, v55);
LABEL_26:
        sub_252E62A60();
        (*v151)((char *)v29, v31, v26);
        uint64_t v64 = v53;
        uint64_t v65 = (char *)v29;
        unint64_t v66 = sub_252E62A70();
        os_log_type_t v67 = sub_252E62E10();
        if (os_log_type_enabled(v66, v67))
        {
          uint64_t v68 = swift_slowAlloc();
          uint64_t v69 = swift_slowAlloc();
          uint64_t v161 = v69;
          *(_DWORD *)uint64_t v68 = v148;
          sub_252E5EFC4(&qword_269CB6B70, MEMORY[0x263F4DA00]);
          uint64_t v70 = sub_252E62A50();
          *(void *)(v68 + 4) = sub_252E5E4A8(v70, v71, &v161);
          swift_bridgeObjectRelease();
          uint64_t v150 = v52;
          v72 = *v155;
          (*v155)(v65, v26);
          _os_log_impl(&dword_252E54000, v66, v67, "Unable to convert eventPayload into Request event: %s", (uint8_t *)v68, 0xCu);
          swift_arrayDestroy();
          uint64_t v73 = v69;
          char v31 = v159;
          MEMORY[0x2533CE120](v73, -1, -1);
          uint64_t v74 = v68;
          uint64_t v20 = v149;
          MEMORY[0x2533CE120](v74, -1, -1);

          (*v152)(v64, v153);
          v72(v31, v26);
          uint64_t v52 = v150;
        }
        else
        {

          int v75 = *v155;
          (*v155)(v65, v26);
          (*v152)(v64, v153);
          v75(v31, v26);
        }
        uint64_t v29 = (void (**)(char *, uint64_t, uint64_t))v65;
        uint64_t v53 = v64;
        goto LABEL_30;
      }
      uint64_t v56 = (uint64_t)v160;
      sub_252E62B00();
      (*(void (**)(char *, uint64_t))(*(void *)(v54 - 8) + 8))(v20, v54);
      uint64_t v57 = sub_252E62C20();
      if (sub_252E5EDBC(v56, 1, v57) == 1) {
        goto LABEL_26;
      }
      uint64_t v58 = v143;
      sub_252E5EF68((uint64_t)v160, v143, &qword_269CB6B60);
      uint64_t v59 = *(void *)(v57 - 8);
      int v60 = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 88))(v58, v57);
      if (v60 != v142)
      {
        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v58, v57);
        char v31 = v159;
        goto LABEL_26;
      }
      (*(void (**)(uint64_t, uint64_t))(v59 + 96))(v58, v57);
      (*v137)(v146, v58, v144);
      uint64_t v61 = (uint64_t)v139;
      sub_252E62B20();
      uint64_t v62 = sub_252E62C70();
      if (sub_252E5EDBC(v61, 1, v62) == 1) {
        break;
      }
      uint64_t v76 = v145;
      sub_252E62C60();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 8))(v61, v62);
      uint64_t v77 = sub_252E62CE0();
      if (sub_252E5EDBC(v76, 1, v77) == 1) {
        goto LABEL_33;
      }
      uint64_t v89 = v132;
      sub_252E5EF68(v145, v132, &qword_269CB6BF0);
      uint64_t v90 = *(void *)(v77 - 8);
      int v91 = (*(uint64_t (**)(uint64_t, uint64_t))(v90 + 88))(v89, v77);
      if (v91 == v126)
      {
        (*(void (**)(uint64_t, uint64_t))(v90 + 96))(v89, v77);
        (*v123)(v130, v89, v131);
        uint64_t v92 = sub_252E62A90();
        uint64_t v94 = v93;
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v95 = v135;
        }
        else {
          uint64_t v95 = sub_252E5DD30(0, *((void *)v135 + 2) + 1, 1, (uint64_t)v135);
        }
        unint64_t v97 = *((void *)v95 + 2);
        unint64_t v96 = *((void *)v95 + 3);
        if (v97 >= v96 >> 1) {
          uint64_t v95 = sub_252E5DD30((char *)(v96 > 1), v97 + 1, 1, (uint64_t)v95);
        }
        *((void *)v95 + 2) = v97 + 1;
        v135 = v95;
        uint64_t v98 = &v95[16 * v97];
        *((void *)v98 + 4) = v92;
        *((void *)v98 + 5) = v94;
        (*v122)(v130, v131);
      }
      else if (v91 == v121)
      {
        uint64_t v99 = v132;
        (*(void (**)(uint64_t, uint64_t))(v90 + 96))(v132, v77);
        (*v120)(v128, v99, v129);
        sub_252E5EFC4(&qword_269CB6C08, MEMORY[0x263F4D340]);
        uint64_t v100 = sub_252E62A50();
        uint64_t v102 = v101;
        if (swift_isUniquelyReferenced_nonNull_native()) {
          v103 = v135;
        }
        else {
          v103 = sub_252E5DD30(0, *((void *)v135 + 2) + 1, 1, (uint64_t)v135);
        }
        unint64_t v105 = *((void *)v103 + 2);
        unint64_t v104 = *((void *)v103 + 3);
        if (v105 >= v104 >> 1) {
          v103 = sub_252E5DD30((char *)(v104 > 1), v105 + 1, 1, (uint64_t)v103);
        }
        *((void *)v103 + 2) = v105 + 1;
        v135 = v103;
        uint64_t v106 = &v103[16 * v105];
        *((void *)v106 + 4) = v100;
        *((void *)v106 + 5) = v102;
        (*v119)(v128, v129);
      }
      else
      {
        if (v91 != v118)
        {
          (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v132, v77);
LABEL_33:
          sub_252E62A60();
          uint64_t v78 = v136;
          uint64_t v79 = v144;
          (*v133)(v136, v146, v144);
          v80 = sub_252E62A70();
          os_log_type_t v81 = sub_252E62E10();
          if (os_log_type_enabled(v80, v81))
          {
            uint64_t v82 = swift_slowAlloc();
            uint64_t v150 = swift_slowAlloc();
            uint64_t v161 = v150;
            *(_DWORD *)uint64_t v82 = v148;
            sub_252E5EFC4(&qword_269CB6BF8, MEMORY[0x263F4DB68]);
            uint64_t v83 = sub_252E62A50();
            *(void *)(v82 + 4) = sub_252E5E4A8(v83, v84, &v161);
            swift_bridgeObjectRelease();
            uint64_t v85 = *v138;
            (*v138)(v78, v79);
            _os_log_impl(&dword_252E54000, v80, v81, "Request event does not contain a requestContextEnum: %s", (uint8_t *)v82, 0xCu);
            uint64_t v86 = v150;
            swift_arrayDestroy();
            MEMORY[0x2533CE120](v86, -1, -1);
            uint64_t v87 = v82;
            uint64_t v20 = v149;
            MEMORY[0x2533CE120](v87, -1, -1);

            (*v152)(v141, v153);
            v85(v146, v79);
            uint64_t v53 = v134;
          }
          else
          {

            v88 = *v138;
            (*v138)(v78, v79);
            (*v152)(v141, v153);
            v88(v146, v79);
          }
          goto LABEL_55;
        }
        uint64_t v107 = v132;
        (*(void (**)(uint64_t, uint64_t))(v90 + 96))(v132, v77);
        (*v117)(v124, v107, v125);
        sub_252E5EFC4(&qword_269CB6C00, MEMORY[0x263F4DD58]);
        uint64_t v108 = sub_252E62A50();
        uint64_t v110 = v109;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v135 = sub_252E5DD30(0, *((void *)v135 + 2) + 1, 1, (uint64_t)v135);
        }
        v111 = v135;
        unint64_t v113 = *((void *)v135 + 2);
        unint64_t v112 = *((void *)v135 + 3);
        if (v113 >= v112 >> 1) {
          v111 = sub_252E5DD30((char *)(v112 > 1), v113 + 1, 1, (uint64_t)v135);
        }
        *((void *)v111 + 2) = v113 + 1;
        v135 = v111;
        v114 = &v111[16 * v113];
        *((void *)v114 + 4) = v108;
        *((void *)v114 + 5) = v110;
        (*v116)(v124, v125);
      }
      (*v138)(v146, v144);
LABEL_55:
      char v31 = v159;
      uint64_t v26 = v140;
      (*v155)(v159, v140);
      sub_252E5F0CC(v145, &qword_269CB6BF0);
LABEL_30:
      sub_252E5F0CC((uint64_t)v160, &qword_269CB6B60);
      v52 += v154;
      if (!--v50)
      {
        swift_release();
        return v135;
      }
    }
    sub_252E5F0CC(v61, &qword_269CB6BE8);
    uint64_t v63 = sub_252E62CE0();
    sub_252E5EDE4(v145, 1, 1, v63);
    goto LABEL_33;
  }
  swift_release();
  return (char *)MEMORY[0x263F8EE78];
}

char *sub_252E58F08(uint64_t a1)
{
  uint64_t v207 = sub_252E62A80();
  v202 = *(void (***)(char *, uint64_t))(v207 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v207);
  v181 = (char *)&v148 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v191 = (char *)&v148 - v4;
  uint64_t v169 = sub_252E62C10();
  v201 = *(void (***)(char *, char *, uint64_t))(v169 - 8);
  MEMORY[0x270FA5388](v169);
  v168 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_252E62CD0();
  uint64_t v200 = *(void *)(v171 - 8);
  MEMORY[0x270FA5388](v171);
  v170 = (char *)&v148 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_252E62C00();
  *(void *)&long long v198 = *(void *)(v178 - 8);
  MEMORY[0x270FA5388](v178);
  v177 = (char *)&v148 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = sub_252E62B70();
  uint64_t v197 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  v174 = (char *)&v148 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = sub_252E62B50();
  v204 = *(void (***)(char *, uint64_t))(v167 - 8);
  MEMORY[0x270FA5388](v167);
  v166 = (char *)&v148 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_252E62C50();
  v184 = *(void (***)(char *, char *, uint64_t))(v173 - 8);
  MEMORY[0x270FA5388](v173);
  v172 = (char *)&v148 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_252E560FC(&qword_269CB6BB8);
  MEMORY[0x270FA5388](v11 - 8);
  v188 = (char *)&v148 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_252E560FC(&qword_269CB6BC0);
  MEMORY[0x270FA5388](v13 - 8);
  v183 = (char *)&v148 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_252E560FC(&qword_269CB6BC8);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v179 = (uint64_t)&v148 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v195 = (uint64_t)&v148 - v18;
  uint64_t v193 = sub_252E62CB0();
  v182 = *(char **)(v193 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v193);
  v187 = (char *)&v148 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v196 = (char *)&v148 - v21;
  uint64_t v22 = sub_252E560FC(&qword_269CB6B58);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v148 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_252E560FC(&qword_269CB6B60);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v194 = (uint64_t)&v148 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v148 - v28;
  uint64_t v30 = sub_252E62AF0();
  uint64_t v180 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v148 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  unint64_t v35 = (char *)&v148 - v34;
  uint64_t v192 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v203 = *(void *)(v192 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v192);
  uint64_t v38 = (char *)&v148 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x270FA5388](v36);
  uint64_t v208 = (uint64_t)&v148 - v40;
  MEMORY[0x270FA5388](v39);
  uint64_t v42 = (uint64_t *)((char *)&v148 - v41);
  uint64_t v43 = MEMORY[0x263F8EE78];
  uint64_t v211 = MEMORY[0x263F8EE78];
  uint64_t v44 = (void (**)(char *, uint64_t, uint64_t))a1;
  uint64_t v45 = *(void *)(a1 + 16);
  unint64_t v46 = v44;
  swift_bridgeObjectRetain();
  v199 = v24;
  v210 = v29;
  uint64_t v190 = v30;
  v189 = v33;
  v209 = v35;
  if (v45)
  {
    unint64_t v47 = (*(unsigned __int8 *)(v203 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v203 + 80);
    uint64_t v48 = *(void *)(v203 + 72);
    v186 = v46;
    unint64_t v206 = v47;
    uint64_t v49 = (uint64_t)v46 + v47;
    v205 = "onRequestCreated";
    do
    {
      sub_252E5EF68(v49, (uint64_t)v42, &qword_269CB6B68);
      if (*v42 == 0xD000000000000017 && v42[1] == 0x8000000252E63ED0 || (sub_252E62F10() & 1) != 0)
      {
        sub_252E5F070((uint64_t)v42, (uint64_t)v38, &qword_269CB6B68);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_252E612F0(0, *(void *)(v43 + 16) + 1, 1);
        }
        uint64_t v43 = v211;
        unint64_t v51 = *(void *)(v211 + 16);
        unint64_t v50 = *(void *)(v211 + 24);
        if (v51 >= v50 >> 1)
        {
          sub_252E612F0(v50 > 1, v51 + 1, 1);
          uint64_t v43 = v211;
        }
        *(void *)(v43 + 16) = v51 + 1;
        sub_252E5F070((uint64_t)v38, v43 + v206 + v51 * v48, &qword_269CB6B68);
        unint64_t v35 = v209;
        uint64_t v29 = v210;
      }
      else
      {
        sub_252E5F0CC((uint64_t)v42, &qword_269CB6B68);
      }
      v49 += v48;
      --v45;
    }
    while (v45);
    uint64_t v43 = v211;
    uint64_t v24 = v199;
    uint64_t v30 = v190;
    uint64_t v33 = v189;
  }
  swift_bridgeObjectRelease();
  uint64_t v53 = *(void *)(v43 + 16);
  if (v53)
  {
    unint64_t v206 = v208 + *(int *)(v192 + 48);
    unint64_t v54 = (*(unsigned __int8 *)(v203 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v203 + 80);
    uint64_t v176 = v43;
    uint64_t v55 = v43 + v54;
    v205 = (char *)(v180 + 32);
    v186 = (void (**)(char *, uint64_t, uint64_t))(v182 + 32);
    uint64_t v150 = (void (**)(char *, uint64_t, uint64_t))(v204 + 4);
    v149 = v204 + 1;
    v185 = (void (**)(char *, uint64_t))(v182 + 8);
    v204 = (void (**)(char *, uint64_t))(v180 + 8);
    uint64_t v153 = (void (**)(char *, uint64_t, uint64_t))(v201 + 4);
    v152 = (void (**)(char *, uint64_t))(v201 + 1);
    v156 = (void (**)(char *, uint64_t, uint64_t))(v200 + 32);
    uint64_t v56 = *(void *)(v203 + 72);
    v155 = (void (**)(char *, uint64_t))(v200 + 8);
    uint64_t v158 = (void (**)(char *, uint64_t, uint64_t))(v184 + 4);
    LODWORD(v192) = *MEMORY[0x263F4DC08];
    uint64_t v157 = (void (**)(char *, uint64_t))(v184 + 1);
    uint64_t v161 = (void (**)(char *, uint64_t, uint64_t))(v197 + 32);
    int v165 = *MEMORY[0x263F4DC40];
    v160 = (void (**)(char *, uint64_t))(v197 + 8);
    v164 = (void (**)(char *, uint64_t, uint64_t))(v198 + 32);
    int v163 = *MEMORY[0x263F4DC60];
    v162 = (void (**)(char *, uint64_t))(v198 + 8);
    v184 = (void (**)(char *, char *, uint64_t))(v182 + 16);
    int v159 = *MEMORY[0x263F4DC50];
    v201 = (void (**)(char *, char *, uint64_t))(v180 + 16);
    ++v202;
    v182 = (char *)MEMORY[0x263F8EE78];
    *(void *)&long long v52 = 136315138;
    long long v198 = v52;
    LODWORD(v180) = *MEMORY[0x263F4DC58];
    int v154 = *MEMORY[0x263F4DC48];
    int v151 = *MEMORY[0x263F4DC38];
    uint64_t v197 = MEMORY[0x263F8EE58] + 8;
    uint64_t v57 = v181;
    uint64_t v203 = v56;
    while (1)
    {
      sub_252E5EF68(v55, v208, &qword_269CB6B68);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, unint64_t, uint64_t))v205)(v35, v206, v30);
      sub_252E62AC0();
      uint64_t v58 = sub_252E62B10();
      if (sub_252E5EDBC((uint64_t)v24, 1, v58) == 1)
      {
        sub_252E5F0CC((uint64_t)v24, &qword_269CB6B58);
        uint64_t v59 = sub_252E62C20();
        sub_252E5EDE4((uint64_t)v29, 1, 1, v59);
        goto LABEL_23;
      }
      sub_252E62B00();
      (*(void (**)(char *, uint64_t))(*(void *)(v58 - 8) + 8))(v24, v58);
      uint64_t v60 = sub_252E62C20();
      if (sub_252E5EDBC((uint64_t)v29, 1, v60) == 1) {
        goto LABEL_23;
      }
      uint64_t v61 = v194;
      sub_252E5EF68((uint64_t)v29, v194, &qword_269CB6B60);
      uint64_t v62 = *(void *)(v60 - 8);
      int v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 88))(v61, v60);
      if (v63 != v192)
      {
        (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v60);
        unint64_t v35 = v209;
LABEL_23:
        sub_252E62A60();
        (*v201)(v33, v35, v30);
        uint64_t v68 = v33;
        uint64_t v69 = sub_252E62A70();
        os_log_type_t v70 = sub_252E62E10();
        if (os_log_type_enabled(v69, v70))
        {
          uint64_t v71 = swift_slowAlloc();
          uint64_t v72 = swift_slowAlloc();
          uint64_t v211 = v72;
          *(_DWORD *)uint64_t v71 = v198;
          sub_252E5EFC4(&qword_269CB6B70, MEMORY[0x263F4DA00]);
          uint64_t v73 = sub_252E62A50();
          *(void *)(v71 + 4) = sub_252E5E4A8(v73, v74, &v211);
          swift_bridgeObjectRelease();
          uint64_t v200 = v55;
          int v75 = *v204;
          (*v204)(v68, v30);
          _os_log_impl(&dword_252E54000, v69, v70, "Unable to convert eventPayload into SystemResponseGenerated event: %s", (uint8_t *)v71, 0xCu);
          swift_arrayDestroy();
          uint64_t v76 = v72;
          unint64_t v35 = v209;
          MEMORY[0x2533CE120](v76, -1, -1);
          uint64_t v77 = v71;
          uint64_t v24 = v199;
          MEMORY[0x2533CE120](v77, -1, -1);

          (*v202)(v57, v207);
          v75(v35, v30);
          uint64_t v78 = v203;
          uint64_t v55 = v200;
          uint64_t v33 = v68;
          uint64_t v29 = v210;
        }
        else
        {

          uint64_t v79 = *v204;
          (*v204)(v68, v30);
          (*v202)(v57, v207);
          v79(v35, v30);
          uint64_t v33 = v68;
          uint64_t v29 = v210;
          uint64_t v78 = v203;
        }
        goto LABEL_35;
      }
      (*(void (**)(uint64_t, uint64_t))(v62 + 96))(v61, v60);
      (*v186)(v196, v61, v193);
      uint64_t v64 = (uint64_t)v188;
      sub_252E62CA0();
      uint64_t v65 = sub_252E62C90();
      if (sub_252E5EDBC(v64, 1, v65) == 1) {
        break;
      }
      uint64_t v80 = (uint64_t)v183;
      sub_252E62C80();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v65 - 8) + 8))(v64, v65);
      uint64_t v81 = sub_252E62BE0();
      if (sub_252E5EDBC(v80, 1, v81) == 1)
      {
        uint64_t v66 = v80;
        os_log_type_t v67 = &qword_269CB6BC0;
        goto LABEL_28;
      }
      uint64_t v95 = v195;
      sub_252E62BD0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v81 - 8) + 8))(v80, v81);
      uint64_t v96 = sub_252E62C30();
      int v97 = sub_252E5EDBC(v95, 1, v96);
      uint64_t v83 = v191;
      if (v97 == 1) {
        goto LABEL_30;
      }
      uint64_t v98 = v179;
      sub_252E5EF68(v195, v179, &qword_269CB6BC8);
      uint64_t v99 = *(void *)(v96 - 8);
      int v100 = (*(uint64_t (**)(uint64_t, uint64_t))(v99 + 88))(v98, v96);
      if (v100 == v165)
      {
        (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v98, v96);
        (*v164)(v177, v98, v178);
        uint64_t v101 = sub_252E62A90();
        uint64_t v103 = v102;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v30 = v190;
        uint64_t v105 = v203;
        if (isUniquelyReferenced_nonNull_native) {
          uint64_t v106 = v182;
        }
        else {
          uint64_t v106 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
        }
        unint64_t v108 = *((void *)v106 + 2);
        unint64_t v107 = *((void *)v106 + 3);
        if (v108 >= v107 >> 1) {
          uint64_t v106 = sub_252E5DD30((char *)(v107 > 1), v108 + 1, 1, (uint64_t)v106);
        }
        *((void *)v106 + 2) = v108 + 1;
        v182 = v106;
        uint64_t v109 = &v106[16 * v108];
        *((void *)v109 + 4) = v101;
        *((void *)v109 + 5) = v103;
        (*v162)(v177, v178);
      }
      else
      {
        uint64_t v30 = v190;
        if (v100 == v163)
        {
          uint64_t v110 = v179;
          (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v179, v96);
          (*v161)(v174, v110, v175);
          uint64_t v111 = sub_252E62A90();
          uint64_t v113 = v112;
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            uint64_t v105 = v203;
          }
          else
          {
            uint64_t v105 = v203;
            v182 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
          }
          v114 = v182;
          unint64_t v116 = *((void *)v182 + 2);
          unint64_t v115 = *((void *)v182 + 3);
          if (v116 >= v115 >> 1) {
            v114 = sub_252E5DD30((char *)(v115 > 1), v116 + 1, 1, (uint64_t)v182);
          }
          *((void *)v114 + 2) = v116 + 1;
          v182 = v114;
          v117 = &v114[16 * v116];
          *((void *)v117 + 4) = v111;
          *((void *)v117 + 5) = v113;
          (*v160)(v174, v175);
        }
        else
        {
          uint64_t v118 = v179;
          if (v100 == v159)
          {
            (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v179, v96);
            (*v158)(v172, v118, v173);
            uint64_t v119 = sub_252E62A90();
            uint64_t v121 = v120;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
              uint64_t v105 = v203;
            }
            else
            {
              uint64_t v105 = v203;
              v182 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
            }
            v122 = v182;
            unint64_t v124 = *((void *)v182 + 2);
            unint64_t v123 = *((void *)v182 + 3);
            if (v124 >= v123 >> 1) {
              v122 = sub_252E5DD30((char *)(v123 > 1), v124 + 1, 1, (uint64_t)v182);
            }
            *((void *)v122 + 2) = v124 + 1;
            v182 = v122;
            uint64_t v125 = &v122[16 * v124];
            *((void *)v125 + 4) = v119;
            *((void *)v125 + 5) = v121;
            (*v157)(v172, v173);
          }
          else if (v100 == v180)
          {
            (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v179, v96);
            (*v156)(v170, v118, v171);
            sub_252E5EFC4(&qword_269CB6BE0, MEMORY[0x263F4DCE0]);
            uint64_t v126 = sub_252E62A50();
            uint64_t v128 = v127;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
              uint64_t v105 = v203;
            }
            else
            {
              uint64_t v105 = v203;
              v182 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
            }
            uint64_t v129 = v182;
            unint64_t v131 = *((void *)v182 + 2);
            unint64_t v130 = *((void *)v182 + 3);
            if (v131 >= v130 >> 1) {
              uint64_t v129 = sub_252E5DD30((char *)(v130 > 1), v131 + 1, 1, (uint64_t)v182);
            }
            *((void *)v129 + 2) = v131 + 1;
            v182 = v129;
            uint64_t v132 = &v129[16 * v131];
            *((void *)v132 + 4) = v126;
            *((void *)v132 + 5) = v128;
            (*v155)(v170, v171);
          }
          else if (v100 == v154)
          {
            (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v179, v96);
            (*v153)(v168, v118, v169);
            sub_252E5EFC4(&qword_269CB6BD8, MEMORY[0x263F4DBE8]);
            uint64_t v133 = sub_252E62A50();
            uint64_t v135 = v134;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
              uint64_t v105 = v203;
            }
            else
            {
              uint64_t v105 = v203;
              v182 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
            }
            v136 = v182;
            unint64_t v138 = *((void *)v182 + 2);
            unint64_t v137 = *((void *)v182 + 3);
            if (v138 >= v137 >> 1) {
              v136 = sub_252E5DD30((char *)(v137 > 1), v138 + 1, 1, (uint64_t)v182);
            }
            *((void *)v136 + 2) = v138 + 1;
            v182 = v136;
            v139 = &v136[16 * v138];
            *((void *)v139 + 4) = v133;
            *((void *)v139 + 5) = v135;
            (*v152)(v168, v169);
          }
          else
          {
            if (v100 != v151)
            {
              (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v179, v96);
              goto LABEL_29;
            }
            (*(void (**)(uint64_t, uint64_t))(v99 + 96))(v179, v96);
            (*v150)(v166, v118, v167);
            uint64_t v140 = sub_252E62A90();
            uint64_t v142 = v141;
            if (swift_isUniquelyReferenced_nonNull_native())
            {
              uint64_t v105 = v203;
            }
            else
            {
              uint64_t v105 = v203;
              v182 = sub_252E5DD30(0, *((void *)v182 + 2) + 1, 1, (uint64_t)v182);
            }
            uint64_t v143 = v182;
            unint64_t v145 = *((void *)v182 + 2);
            unint64_t v144 = *((void *)v182 + 3);
            if (v145 >= v144 >> 1) {
              uint64_t v143 = sub_252E5DD30((char *)(v144 > 1), v145 + 1, 1, (uint64_t)v182);
            }
            *((void *)v143 + 2) = v145 + 1;
            v182 = v143;
            v146 = &v143[16 * v145];
            *((void *)v146 + 4) = v140;
            *((void *)v146 + 5) = v142;
            (*v149)(v166, v167);
          }
        }
      }
      (*v185)(v196, v193);
      unint64_t v35 = v209;
      (*v204)(v209, v30);
      uint64_t v57 = v181;
      uint64_t v78 = v105;
      uint64_t v29 = v210;
LABEL_34:
      sub_252E5F0CC(v195, &qword_269CB6BC8);
LABEL_35:
      sub_252E5F0CC((uint64_t)v29, &qword_269CB6B60);
      v55 += v78;
      if (!--v53)
      {
        swift_release();
        return v182;
      }
    }
    uint64_t v66 = v64;
    os_log_type_t v67 = &qword_269CB6BB8;
LABEL_28:
    sub_252E5F0CC(v66, v67);
    uint64_t v82 = sub_252E62C30();
    sub_252E5EDE4(v195, 1, 1, v82);
LABEL_29:
    uint64_t v83 = v191;
LABEL_30:
    sub_252E62A60();
    unint64_t v84 = v187;
    uint64_t v85 = v193;
    (*v184)(v187, v196, v193);
    uint64_t v86 = sub_252E62A70();
    os_log_type_t v87 = sub_252E62E10();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = swift_slowAlloc();
      uint64_t v200 = swift_slowAlloc();
      uint64_t v211 = v200;
      *(_DWORD *)uint64_t v88 = v198;
      sub_252E5EFC4(&qword_269CB6BD0, MEMORY[0x263F4DCA8]);
      uint64_t v89 = sub_252E62A50();
      *(void *)(v88 + 4) = sub_252E5E4A8(v89, v90, &v211);
      swift_bridgeObjectRelease();
      int v91 = *v185;
      (*v185)(v84, v85);
      _os_log_impl(&dword_252E54000, v86, v87, "SystemResponseGenerated event does not contain a dialogFormat: %s", (uint8_t *)v88, 0xCu);
      uint64_t v92 = v200;
      swift_arrayDestroy();
      MEMORY[0x2533CE120](v92, -1, -1);
      uint64_t v93 = v88;
      uint64_t v24 = v199;
      MEMORY[0x2533CE120](v93, -1, -1);

      (*v202)(v191, v207);
      v91(v196, v85);
    }
    else
    {

      uint64_t v94 = *v185;
      (*v185)(v84, v85);
      (*v202)(v83, v207);
      v94(v196, v85);
    }
    unint64_t v35 = v209;
    uint64_t v30 = v190;
    (*v204)(v209, v190);
    uint64_t v29 = v210;
    uint64_t v33 = v189;
    uint64_t v78 = v203;
    goto LABEL_34;
  }
  swift_release();
  return (char *)MEMORY[0x263F8EE78];
}

char *sub_252E5A9BC(uint64_t a1)
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  uint64_t v152 = sub_252E62A80();
  uint64_t v157 = *(void *)(v152 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v152);
  uint64_t v4 = (char *)&v120 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v148 = (char *)&v120 - v5;
  uint64_t v6 = sub_252E62DA0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v128 = (char *)&v120 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252E62A00();
  uint64_t v9 = *(char **)(v8 - 8);
  uint64_t v155 = v8;
  v156 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v158 = (char *)&v120 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_252E62CC0();
  uint64_t v123 = *(void *)(v160 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v160);
  unint64_t v145 = (char *)&v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v120 - v13;
  uint64_t v124 = sub_252E62D40();
  uint64_t v151 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v127 = (char *)&v120 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_252E560FC(&qword_269CB6B58);
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v131 = (char *)&v120 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_252E560FC(&qword_269CB6B60);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v126 = (uint64_t)&v120 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v149 = (uint64_t)&v120 - v21;
  uint64_t v143 = sub_252E62AF0();
  unint64_t v147 = *(void *)(v143 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v143);
  uint64_t v133 = (char *)&v120 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v142 = (char *)&v120 - v24;
  uint64_t v25 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v120 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v140 = (uint64_t)&v120 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (uint64_t *)((char *)&v120 - v32);
  uint64_t v34 = MEMORY[0x263F8EE78];
  *(void *)&long long v165 = MEMORY[0x263F8EE78];
  uint64_t v35 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  int v159 = v4;
  v146 = v14;
  uint64_t v141 = v26;
  if (v35)
  {
    uint64_t v153 = (void (**)(char *, uint64_t))v25;
    int v154 = (void (**)(char *, uint64_t))a1;
    uint64_t v36 = *(void *)(v26 + 72);
    unint64_t v162 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    uint64_t v37 = a1 + v162;
    uint64_t v38 = MEMORY[0x263F8EE78];
    uint64_t v161 = "Swift/UnsafeBufferPointer.swift";
    do
    {
      sub_252E5EF68(v37, (uint64_t)v33, &qword_269CB6B68);
      if (*v33 == 0xD000000000000020 && v33[1] == 0x8000000252E63EA0 || (sub_252E62F10() & 1) != 0)
      {
        sub_252E5F070((uint64_t)v33, (uint64_t)v29, &qword_269CB6B68);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_252E612F0(0, *(void *)(v38 + 16) + 1, 1);
        }
        uint64_t v38 = v165;
        unint64_t v40 = *(void *)(v165 + 16);
        unint64_t v39 = *(void *)(v165 + 24);
        if (v40 >= v39 >> 1)
        {
          sub_252E612F0(v39 > 1, v40 + 1, 1);
          uint64_t v38 = v165;
        }
        *(void *)(v38 + 16) = v40 + 1;
        sub_252E5F070((uint64_t)v29, v38 + v162 + v40 * v36, &qword_269CB6B68);
        uint64_t v4 = v159;
      }
      else
      {
        sub_252E5F0CC((uint64_t)v33, &qword_269CB6B68);
      }
      v37 += v36;
      --v35;
    }
    while (v35);
    uint64_t v41 = v165;
    uint64_t v14 = v146;
    uint64_t v25 = (uint64_t)v153;
  }
  else
  {
    uint64_t v41 = v34;
  }
  swift_bridgeObjectRelease();
  uint64_t v43 = v160;
  uint64_t v44 = (uint64_t)v131;
  uint64_t v45 = v143;
  unint64_t v46 = v142;
  uint64_t v139 = *(void *)(v41 + 16);
  if (v139)
  {
    unint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v137 = v140 + *(int *)(v25 + 48);
    uint64_t v136 = v41 + ((*(unsigned __int8 *)(v141 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v141 + 80));
    uint64_t v135 = (void (**)(char *, uint64_t, uint64_t))(v147 + 32);
    int v125 = *MEMORY[0x263F4DC10];
    v122 = (void (**)(char *, uint64_t, uint64_t))(v151 + 32);
    uint64_t v153 = (void (**)(char *, uint64_t))(v123 + 8);
    int v154 = (void (**)(char *, uint64_t))(v156 + 8);
    uint64_t v150 = (void (**)(char *, uint64_t))(v157 + 8);
    uint64_t v121 = (void (**)(char *, uint64_t))(v151 + 8);
    uint64_t v134 = (void (**)(char *, uint64_t))(v147 + 8);
    uint64_t v132 = (void (**)(char *, char *, uint64_t))(v147 + 16);
    unint64_t v130 = (char *)MEMORY[0x263F8EE78];
    *(void *)&long long v42 = 136315138;
    long long v144 = v42;
    uint64_t v129 = MEMORY[0x263F8EE58] + 8;
    uint64_t v49 = v148;
    uint64_t v151 = v123 + 16;
    uint64_t v138 = v41;
    while (1)
    {
      if (v47 >= *(void *)(v41 + 16)) {
        __break(1u);
      }
      uint64_t v50 = *(void *)(v141 + 72);
      unint64_t v147 = v47;
      sub_252E5EF68(v136 + v50 * v47, v140, &qword_269CB6B68);
      swift_bridgeObjectRelease();
      (*v135)(v46, v137, v45);
      sub_252E62AC0();
      uint64_t v51 = sub_252E62B10();
      if (sub_252E5EDBC(v44, 1, v51) == 1)
      {
        sub_252E5F0CC(v44, &qword_269CB6B58);
        uint64_t v52 = sub_252E62C20();
        sub_252E5EDE4(v149, 1, 1, v52);
      }
      else
      {
        uint64_t v53 = v149;
        sub_252E62B00();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v51 - 8) + 8))(v44, v51);
        uint64_t v54 = sub_252E62C20();
        uint64_t v55 = v53;
        uint64_t v49 = v148;
        if (sub_252E5EDBC(v55, 1, v54) != 1)
        {
          uint64_t v56 = v126;
          sub_252E5EF68(v149, v126, &qword_269CB6B60);
          uint64_t v57 = *(void *)(v54 - 8);
          int v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 88))(v56, v54);
          if (v58 == v125)
          {
            (*(void (**)(uint64_t, uint64_t))(v57 + 96))(v56, v54);
            uint64_t v59 = v124;
            (*v122)(v127, v56, v124);
            uint64_t v60 = sub_252E62D30();
            uint64_t v61 = *(const char **)(v60 + 16);
            if (!v61)
            {
              swift_bridgeObjectRelease();
LABEL_53:
              (*v121)(v127, v59);
              unint64_t v46 = v142;
              uint64_t v45 = v143;
              (*v134)(v142, v143);
              uint64_t v41 = v138;
              goto LABEL_49;
            }
            unint64_t v62 = (*(unsigned __int8 *)(v123 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80);
            uint64_t v120 = v60;
            unint64_t v63 = v60 + v62;
            uint64_t v64 = *(void *)(v123 + 72);
            uint64_t v65 = *(char **)(v123 + 16);
            uint64_t v66 = v158;
            v156 = v65;
            uint64_t v157 = v64;
            while (2)
            {
              uint64_t v161 = v61;
              unint64_t v162 = v63;
              ((void (*)(char *, unint64_t, uint64_t))v65)(v14, v63, v43);
              sub_252E629F0();
              sub_252E5EFC4(&qword_269CB6BA8, MEMORY[0x263F4DCB8]);
              uint64_t v67 = sub_252E62A30();
              if (v48)
              {
                (*v154)(v66, v155);
                sub_252E62A60();
                uint64_t v69 = v145;
                ((void (*)(char *, char *, uint64_t))v65)(v145, v14, v43);
                os_log_type_t v70 = v14;
                uint64_t v71 = sub_252E62A70();
                os_log_type_t v72 = sub_252E62E20();
                if (os_log_type_enabled(v71, v72))
                {
                  uint64_t v73 = swift_slowAlloc();
                  uint64_t v74 = swift_slowAlloc();
                  *(void *)&long long v165 = v74;
                  *(_DWORD *)uint64_t v73 = v144;
                  uint64_t v75 = sub_252E62A50();
                  *(void *)(v73 + 4) = sub_252E5E4A8(v75, v76, (uint64_t *)&v165);
                  swift_bridgeObjectRelease();
                  uint64_t v77 = *v153;
                  (*v153)(v69, v160);
                  _os_log_impl(&dword_252E54000, v71, v72, "Unable to get json string for statementResult: %s", (uint8_t *)v73, 0xCu);
                  swift_arrayDestroy();
                  uint64_t v78 = v74;
                  uint64_t v4 = v159;
                  MEMORY[0x2533CE120](v78, -1, -1);
                  uint64_t v79 = v73;
                  uint64_t v43 = v160;
                  MEMORY[0x2533CE120](v79, -1, -1);
                }
                else
                {

                  uint64_t v77 = *v153;
                  (*v153)(v69, v43);
                }
                (*v150)(v4, v152);
                v77(v70, v43);
                uint64_t v48 = 0;
                uint64_t v66 = v158;
                uint64_t v14 = v70;
                uint64_t v101 = v161;
                unint64_t v89 = v162;
                goto LABEL_42;
              }
              uint64_t v80 = v67;
              unint64_t v81 = v68;
              (*v154)(v66, v155);
              uint64_t v82 = self;
              uint64_t v83 = (void *)sub_252E62910();
              id v163 = 0;
              id v84 = objc_msgSend(v82, sel_JSONObjectWithData_options_error_, v83, 0, &v163, v120);

              id v85 = v163;
              if (v84)
              {
                sub_252E62E50();
                swift_unknownObjectRelease();
                sub_252E5EF14(&v164, &v165);
                sub_252E5EF24(&v165, v166);
                uint64_t v86 = sub_252E62F00();
                *(void *)&long long v164 = 0;
                id v87 = objc_msgSend(v82, sel_dataWithJSONObject_options_error_, v86, 3, &v164);
                swift_unknownObjectRelease();
                id v88 = (id)v164;
                unint64_t v89 = v162;
                if (v87)
                {
                  uint64_t v90 = sub_252E62920();
                  unint64_t v92 = v91;

                  sub_252E62D90();
                  uint64_t v93 = sub_252E62D80();
                  uint64_t v95 = v94;
                  sub_252E5EE0C(v90, v92);
                  sub_252E5EEC4((uint64_t)&v165);
                  sub_252E5EE0C(v80, v81);
                  if (v95)
                  {
                    uint64_t v96 = v130;
                    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                    uint64_t v4 = v159;
                    uint64_t v43 = v160;
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                      uint64_t v96 = sub_252E5DD30(0, *((void *)v96 + 2) + 1, 1, (uint64_t)v96);
                    }
                    unint64_t v99 = *((void *)v96 + 2);
                    unint64_t v98 = *((void *)v96 + 3);
                    if (v99 >= v98 >> 1) {
                      uint64_t v96 = sub_252E5DD30((char *)(v98 > 1), v99 + 1, 1, (uint64_t)v96);
                    }
                    *((void *)v96 + 2) = v99 + 1;
                    unint64_t v130 = v96;
                    int v100 = &v96[16 * v99];
                    *((void *)v100 + 4) = v93;
                    *((void *)v100 + 5) = v95;
                    uint64_t v14 = v146;
                    (*v153)(v146, v43);
                    uint64_t v66 = v158;
                    uint64_t v101 = v161;
LABEL_42:
                    uint64_t v65 = v156;
                    unint64_t v63 = v89 + v157;
                    uint64_t v61 = v101 - 1;
                    if (!v61)
                    {
                      swift_bridgeObjectRelease();
                      uint64_t v59 = v124;
                      uint64_t v44 = (uint64_t)v131;
                      goto LABEL_53;
                    }
                    continue;
                  }
                  uint64_t v4 = v159;
                }
                else
                {
                  unint64_t v104 = v88;
                  uint64_t v105 = (void *)sub_252E62900();

                  swift_willThrow();
                  sub_252E5EEC4((uint64_t)&v165);
                  sub_252E5EE0C(v80, v81);
                  uint64_t v48 = 0;
                }
                uint64_t v43 = v160;
                uint64_t v101 = v161;
              }
              else
              {
                uint64_t v102 = v85;
                uint64_t v103 = (void *)sub_252E62900();

                swift_willThrow();
                sub_252E5EE0C(v80, v81);
                uint64_t v48 = 0;
                uint64_t v43 = v160;
                uint64_t v101 = v161;
                unint64_t v89 = v162;
              }
              break;
            }
            uint64_t v14 = v146;
            (*v153)(v146, v43);
            uint64_t v66 = v158;
            goto LABEL_42;
          }
          (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v54);
          uint64_t v49 = v148;
        }
      }
      sub_252E62A60();
      uint64_t v106 = v133;
      unint64_t v107 = v142;
      uint64_t v45 = v143;
      (*v132)(v133, v142, v143);
      unint64_t v108 = sub_252E62A70();
      os_log_type_t v109 = sub_252E62E10();
      if (os_log_type_enabled(v108, v109))
      {
        uint64_t v110 = swift_slowAlloc();
        uint64_t v111 = swift_slowAlloc();
        *(void *)&long long v165 = v111;
        *(_DWORD *)uint64_t v110 = v144;
        sub_252E5EFC4(&qword_269CB6B70, MEMORY[0x263F4DA00]);
        uint64_t v112 = sub_252E62A50();
        *(void *)(v110 + 4) = sub_252E5E4A8(v112, v113, (uint64_t *)&v165);
        swift_bridgeObjectRelease();
        unint64_t v162 = (unint64_t)v48;
        v114 = *v134;
        (*v134)(v106, v45);
        _os_log_impl(&dword_252E54000, v108, v109, "Unable to convert eventPayload into ResponseGenerationRequestCreated event: %s", (uint8_t *)v110, 0xCu);
        swift_arrayDestroy();
        uint64_t v115 = v111;
        uint64_t v44 = (uint64_t)v131;
        MEMORY[0x2533CE120](v115, -1, -1);
        MEMORY[0x2533CE120](v110, -1, -1);

        (*v150)(v148, v152);
        v114(v107, v45);
        uint64_t v48 = (void *)v162;
      }
      else
      {

        unint64_t v116 = *v134;
        (*v134)(v106, v45);
        (*v150)(v49, v152);
        v116(v107, v45);
      }
      uint64_t v14 = v146;
      unint64_t v46 = v107;
      uint64_t v4 = v159;
      uint64_t v41 = v138;
LABEL_49:
      unint64_t v117 = v147 + 1;
      sub_252E5F0CC(v149, &qword_269CB6B60);
      unint64_t v47 = v117;
      BOOL v118 = v117 == v139;
      uint64_t v49 = v148;
      if (v118)
      {
        swift_release();
        return v130;
      }
    }
  }
  swift_release();
  return (char *)MEMORY[0x263F8EE78];
}

char *sub_252E5BC90(uint64_t a1)
{
  uint64_t v218 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_252E62A80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v210 = v2;
  uint64_t v211 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v180 = (char *)&v157 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v157 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v200 = (char *)&v157 - v9;
  uint64_t v179 = sub_252E62A00();
  v209 = *(void (***)(char *, uint64_t))(v179 - 8);
  MEMORY[0x270FA5388](v179);
  uint64_t v178 = (char *)&v157 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v185 = sub_252E62D50();
  uint64_t v208 = *(void *)(v185 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v185);
  uint64_t v13 = (char *)&v157 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v188 = (char *)&v157 - v14;
  uint64_t v15 = sub_252E560FC(&qword_269CB6B48);
  MEMORY[0x270FA5388](v15 - 8);
  v199 = (char *)&v157 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_252E560FC(&qword_269CB6B50);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v184 = (uint64_t)&v157 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v213 = (uint64_t)&v157 - v20;
  uint64_t v203 = sub_252E62BC0();
  uint64_t v167 = *(void *)(v203 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v203 - 8);
  unint64_t v206 = (char *)&v157 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v202 = (char *)&v157 - v23;
  uint64_t v170 = sub_252E62D10();
  v204 = *(char **)(v170 - 8);
  MEMORY[0x270FA5388](v170);
  uint64_t v169 = (char *)&v157 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_252E560FC(&qword_269CB6B58);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v194 = (char *)&v157 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_252E560FC(&qword_269CB6B60);
  uint64_t v28 = MEMORY[0x270FA5388](v27 - 8);
  uint64_t v174 = (uint64_t)&v157 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v157 - v30;
  uint64_t v32 = sub_252E62AF0();
  *(void *)&long long v201 = *(void *)(v32 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  v189 = (char *)&v157 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v166 = (char *)&v157 - v35;
  uint64_t v207 = sub_252E560FC(&qword_269CB6B68);
  uint64_t v36 = *(void *)(v207 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v207);
  unint64_t v39 = (char *)&v157 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v197 = (uint64_t)&v157 - v41;
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (uint64_t *)((char *)&v157 - v42);
  uint64_t v44 = MEMORY[0x263F8EE78];
  *(void *)&long long v216 = MEMORY[0x263F8EE78];
  uint64_t v45 = a1;
  uint64_t v46 = *(void *)(a1 + 16);
  uint64_t v47 = v45;
  swift_bridgeObjectRetain();
  v186 = v31;
  uint64_t v205 = v32;
  uint64_t v173 = v13;
  uint64_t v198 = v36;
  if (v46)
  {
    unint64_t v48 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v49 = *(void *)(v36 + 72);
    uint64_t v196 = v47;
    v212 = (void (*)(char *, char *, uint64_t))v48;
    uint64_t v50 = v47 + v48;
    uint64_t v51 = MEMORY[0x263F8EE78];
    do
    {
      sub_252E5EF68(v50, (uint64_t)v43, &qword_269CB6B68);
      BOOL v52 = *v43 == 0x746552736C6F6F54 && v43[1] == 0xEE00646576656972;
      if (v52 || (sub_252E62F10() & 1) != 0)
      {
        sub_252E5F070((uint64_t)v43, (uint64_t)v39, &qword_269CB6B68);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_252E612F0(0, *(void *)(v51 + 16) + 1, 1);
        }
        uint64_t v51 = v216;
        unint64_t v54 = *(void *)(v216 + 16);
        unint64_t v53 = *(void *)(v216 + 24);
        if (v54 >= v53 >> 1)
        {
          sub_252E612F0(v53 > 1, v54 + 1, 1);
          uint64_t v51 = v216;
        }
        *(void *)(v51 + 16) = v54 + 1;
        sub_252E5F070((uint64_t)v39, (uint64_t)v212 + v51 + v54 * v49, &qword_269CB6B68);
        uint64_t v32 = v205;
      }
      else
      {
        sub_252E5F0CC((uint64_t)v43, &qword_269CB6B68);
      }
      v50 += v49;
      --v46;
    }
    while (v46);
    uint64_t v44 = v216;
    uint64_t v31 = v186;
    uint64_t v36 = v198;
    uint64_t v55 = v211;
  }
  else
  {
    uint64_t v55 = v211;
  }
  swift_bridgeObjectRelease();
  uint64_t v195 = *(void *)(v44 + 16);
  if (!v195)
  {
    swift_release();
    uint64_t result = (char *)MEMORY[0x263F8EE78];
    char v156 = 1;
    goto LABEL_81;
  }
  LODWORD(v212) = 0;
  unint64_t v57 = 0;
  v183 = 0;
  uint64_t v193 = v197 + *(int *)(v207 + 48);
  unint64_t v58 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v196 = v44;
  uint64_t v192 = v44 + v58;
  v191 = (void (**)(char *, uint64_t, uint64_t))(v201 + 32);
  int v172 = *MEMORY[0x263F4DC00];
  long long v165 = (void (**)(char *, uint64_t, uint64_t))(v204 + 32);
  uint64_t v211 = v167 + 16;
  int v182 = *MEMORY[0x263F4DBB8];
  v177 = (void (**)(char *, uint64_t, uint64_t))(v208 + 32);
  uint64_t v176 = v209 + 1;
  uint64_t v175 = (void (**)(char *, uint64_t))(v208 + 8);
  uint64_t v207 = v167 + 8;
  uint64_t v171 = (void (**)(char *, char *, uint64_t))(v208 + 16);
  v209 = (void (**)(char *, uint64_t))(v55 + 8);
  long long v164 = (void (**)(char *, uint64_t))(v204 + 8);
  uint64_t v190 = (void (**)(char *, uint64_t))(v201 + 8);
  v187 = (void (**)(char *, char *, uint64_t))(v201 + 16);
  unint64_t v162 = (char *)MEMORY[0x263F8EE78];
  *(void *)&long long v56 = 136315138;
  long long v201 = v56;
  uint64_t v208 = 1;
  uint64_t v181 = MEMORY[0x263F8EE58] + 8;
  uint64_t v161 = v8;
  uint64_t v59 = (uint64_t)v194;
  uint64_t v60 = v166;
  do
  {
    if (v57 >= *(void *)(v196 + 16)) {
      __break(1u);
    }
    sub_252E5EF68(v192 + *(void *)(v198 + 72) * v57, v197, &qword_269CB6B68);
    swift_bridgeObjectRelease();
    (*v191)(v60, v193, v32);
    sub_252E62AC0();
    uint64_t v61 = sub_252E62B10();
    if (sub_252E5EDBC(v59, 1, v61) == 1)
    {
      sub_252E5F0CC(v59, &qword_269CB6B58);
      uint64_t v62 = sub_252E62C20();
      sub_252E5EDE4((uint64_t)v31, 1, 1, v62);
LABEL_72:
      unint64_t v140 = v57;
      sub_252E62A60();
      uint64_t v141 = v60;
      uint64_t v142 = v189;
      (*v187)(v189, v141, v32);
      uint64_t v143 = sub_252E62A70();
      long long v144 = v8;
      os_log_type_t v145 = sub_252E62E10();
      if (os_log_type_enabled(v143, v145))
      {
        uint64_t v146 = swift_slowAlloc();
        uint64_t v147 = swift_slowAlloc();
        *(void *)&long long v216 = v147;
        *(_DWORD *)uint64_t v146 = v201;
        sub_252E5EFC4(&qword_269CB6B70, MEMORY[0x263F4DA00]);
        uint64_t v148 = sub_252E62A50();
        *(void *)(v146 + 4) = sub_252E5E4A8(v148, v149, (uint64_t *)&v216);
        swift_bridgeObjectRelease();
        uint64_t v150 = *v190;
        (*v190)(v142, v205);
        _os_log_impl(&dword_252E54000, v143, v145, "Unable to convert eventPayload into ToolsRetrieved event: %s", (uint8_t *)v146, 0xCu);
        swift_arrayDestroy();
        uint64_t v151 = v147;
        uint64_t v32 = v205;
        MEMORY[0x2533CE120](v151, -1, -1);
        uint64_t v152 = v146;
        uint64_t v31 = v186;
        MEMORY[0x2533CE120](v152, -1, -1);

        (*v209)(v144, v210);
        v150(v141, v32);
      }
      else
      {

        uint64_t v153 = *v190;
        (*v190)(v142, v32);
        (*v209)(v144, v210);
        v153(v141, v32);
      }
      uint64_t v8 = v144;
      uint64_t v60 = v141;
      unint64_t v154 = v140;
      uint64_t v59 = (uint64_t)v194;
      goto LABEL_76;
    }
    sub_252E62B00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 8))(v59, v61);
    uint64_t v63 = sub_252E62C20();
    if (sub_252E5EDBC((uint64_t)v31, 1, v63) == 1) {
      goto LABEL_72;
    }
    uint64_t v64 = (uint64_t)v31;
    uint64_t v65 = v174;
    sub_252E5EF68(v64, v174, &qword_269CB6B60);
    uint64_t v66 = *(void *)(v63 - 8);
    int v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v66 + 88))(v65, v63);
    if (v67 != v172)
    {
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v63);
      uint64_t v31 = v186;
      goto LABEL_72;
    }
    unint64_t v168 = v57;
    (*(void (**)(uint64_t, uint64_t))(v66 + 96))(v65, v63);
    unint64_t v68 = v169;
    uint64_t v69 = v170;
    (*v165)(v169, v65, v170);
    sub_252E62CF0();
    int v71 = v70;
    uint64_t v72 = sub_252E62D00();
    uint64_t v73 = *(char **)(v72 + 16);
    if (v73)
    {
      unint64_t v74 = (*(unsigned __int8 *)(v167 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v167 + 80);
      uint64_t v163 = v72;
      uint64_t v75 = (char *)(v72 + v74);
      uint64_t v208 = *(void *)(v167 + 72);
      v212 = *(void (**)(char *, char *, uint64_t))(v167 + 16);
      unint64_t v76 = v200;
      uint64_t v77 = (uint64_t)v199;
      uint64_t v78 = v203;
      uint64_t v79 = v202;
      while (1)
      {
        v212(v79, v75, v78);
        sub_252E62BB0();
        uint64_t v80 = sub_252E62BA0();
        if (sub_252E5EDBC(v77, 1, v80) == 1) {
          break;
        }
        uint64_t v82 = v213;
        sub_252E62B90();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v80 - 8) + 8))(v77, v80);
        uint64_t v83 = sub_252E62B80();
        uint64_t v79 = v202;
        uint64_t v78 = v203;
        if (sub_252E5EDBC(v82, 1, v83) == 1) {
          goto LABEL_35;
        }
        uint64_t v84 = v184;
        sub_252E5EF68(v213, v184, &qword_269CB6B50);
        uint64_t v85 = *(void *)(v83 - 8);
        int v86 = (*(uint64_t (**)(uint64_t, uint64_t))(v85 + 88))(v84, v83);
        if (v86 != v182)
        {
          (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v83);
          uint64_t v78 = v203;
          uint64_t v79 = v202;
LABEL_35:
          sub_252E62A60();
          unint64_t v104 = v206;
          v212(v206, v79, v78);
          uint64_t v105 = sub_252E62A70();
          os_log_type_t v106 = sub_252E62E10();
          if (os_log_type_enabled(v105, v106))
          {
            uint64_t v107 = swift_slowAlloc();
            uint64_t v108 = swift_slowAlloc();
            *(void *)&long long v216 = v108;
            *(_DWORD *)uint64_t v107 = v201;
            sub_252E5EFC4(&qword_269CB6B78, MEMORY[0x263F4DBC8]);
            uint64_t v109 = sub_252E62A50();
            *(void *)(v107 + 4) = sub_252E5E4A8(v109, v110, (uint64_t *)&v216);
            swift_bridgeObjectRelease();
            v204 = v75;
            uint64_t v111 = *(void (**)(char *, uint64_t))v207;
            (*(void (**)(char *, uint64_t))v207)(v104, v78);
            _os_log_impl(&dword_252E54000, v105, v106, "ToolsRetrieved event does not contain a implementation defiintion: %s", (uint8_t *)v107, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2533CE120](v108, -1, -1);
            uint64_t v112 = v107;
            uint64_t v77 = (uint64_t)v199;
            unint64_t v76 = v200;
            MEMORY[0x2533CE120](v112, -1, -1);

            (*v209)(v76, v210);
            v111(v79, v78);
            uint64_t v75 = v204;
          }
          else
          {

            unint64_t v113 = *(void (**)(char *, uint64_t))v207;
            (*(void (**)(char *, uint64_t))v207)(v104, v78);
            (*v209)(v76, v210);
            v113(v79, v78);
          }
          goto LABEL_38;
        }
        (*(void (**)(uint64_t, uint64_t))(v85 + 96))(v84, v83);
        (*v177)(v188, v84, v185);
        id v87 = v178;
        sub_252E629F0();
        id v88 = (char *)sub_252E5EFC4(&qword_269CB6B80, MEMORY[0x263F80360]);
        unint64_t v89 = v183;
        uint64_t v90 = sub_252E62A30();
        if (v89)
        {
          (*v176)(v87, v179);
          unint64_t v92 = v89;
          v183 = 0;
LABEL_32:
          uint64_t v93 = v180;
          sub_252E62A60();
          uint64_t v94 = v173;
          uint64_t v95 = v185;
          (*v171)(v173, v188, v185);
          uint64_t v96 = sub_252E62A70();
          os_log_type_t v97 = sub_252E62E20();
          if (os_log_type_enabled(v96, v97))
          {
            uint64_t v98 = swift_slowAlloc();
            uint64_t v99 = swift_slowAlloc();
            v204 = v92;
            uint64_t v100 = v99;
            *(void *)&long long v216 = v99;
            *(_DWORD *)uint64_t v98 = v201;
            uint64_t v101 = sub_252E62A50();
            *(void *)(v98 + 4) = sub_252E5E4A8(v101, v102, (uint64_t *)&v216);
            swift_bridgeObjectRelease();
            uint64_t v103 = *v175;
            (*v175)(v94, v95);
            _os_log_impl(&dword_252E54000, v96, v97, "Unable to get jsonData tool implementation defintion: %s", (uint8_t *)v98, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2533CE120](v100, -1, -1);
            MEMORY[0x2533CE120](v98, -1, -1);

            (*v209)(v180, v210);
            v103(v188, v95);
          }
          else
          {

            v114 = *v175;
            (*v175)(v94, v95);
            (*v209)(v93, v210);
            v114(v188, v95);
          }
          uint64_t v79 = v202;
          uint64_t v78 = v203;
          (*(void (**)(char *, uint64_t))v207)(v202, v203);
          unint64_t v76 = v200;
          uint64_t v77 = (uint64_t)v199;
          goto LABEL_38;
        }
        uint64_t v115 = v90;
        v204 = v88;
        unint64_t v116 = v91;
        (*v176)(v87, v179);
        unint64_t v117 = self;
        BOOL v118 = (void *)sub_252E62910();
        *(void *)&long long v216 = 0;
        id v119 = objc_msgSend(v117, sel_JSONObjectWithData_options_error_, v118, 0, &v216);

        if (!v119)
        {
          id v127 = (id)v216;
          uint64_t v128 = sub_252E62900();

          unint64_t v92 = (char *)v128;
          swift_willThrow();
          sub_252E5EE0C(v115, v116);
          v183 = 0;
          goto LABEL_32;
        }
        id v120 = (id)v216;
        sub_252E62E50();
        swift_unknownObjectRelease();
        sub_252E560FC(&qword_269CB6B88);
        char v121 = swift_dynamicCast();
        v183 = 0;
        if (v121)
        {
          uint64_t v160 = v115;
          v204 = v73;
          uint64_t v122 = v214;
          uint64_t v123 = v188;
          if (*(void *)(v214 + 16))
          {
            unint64_t v124 = sub_252E5EC60(25705, 0xE200000000000000);
            int v125 = v162;
            if ((v126 & 1) != 0
              && (sub_252E5EE64(*(void *)(v122 + 56) + 32 * v124, (uint64_t)&v216), (swift_dynamicCast() & 1) != 0))
            {
              uint64_t v159 = v214;
              uint64_t v158 = v215;
            }
            else
            {
              uint64_t v159 = 0;
              uint64_t v158 = 0;
            }
          }
          else
          {
            uint64_t v159 = 0;
            uint64_t v158 = 0;
            int v125 = v162;
          }
          if (*(void *)(v122 + 16)
            && (unint64_t v129 = sub_252E5EC60(1701667182, 0xE400000000000000), (v130 & 1) != 0)
            && (sub_252E5EE64(*(void *)(v122 + 56) + 32 * v129, (uint64_t)&v216), (swift_dynamicCast() & 1) != 0))
          {
            uint64_t v131 = v215;
            uint64_t v157 = v214;
          }
          else
          {
            uint64_t v157 = 0;
            uint64_t v131 = 0;
          }
          if (*(void *)(v122 + 16)
            && (unint64_t v132 = sub_252E5EC60(0x657079546C6F6F74, 0xE800000000000000), (v133 & 1) != 0))
          {
            sub_252E5EE64(*(void *)(v122 + 56) + 32 * v132, (uint64_t)&v216);
          }
          else
          {
            long long v216 = 0u;
            long long v217 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v217 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v134 = v214;
              uint64_t v135 = v215;
LABEL_66:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                int v125 = sub_252E5DE20(0, *((void *)v125 + 2) + 1, 1, (uint64_t)v125);
              }
              unint64_t v137 = *((void *)v125 + 2);
              unint64_t v136 = *((void *)v125 + 3);
              if (v137 >= v136 >> 1) {
                int v125 = sub_252E5DE20((char *)(v136 > 1), v137 + 1, 1, (uint64_t)v125);
              }
              *((void *)v125 + 2) = v137 + 1;
              unint64_t v162 = v125;
              uint64_t v138 = &v125[48 * v137];
              uint64_t v139 = v158;
              *((void *)v138 + 4) = v159;
              *((void *)v138 + 5) = v139;
              *((void *)v138 + 6) = v157;
              *((void *)v138 + 7) = v131;
              *((void *)v138 + 8) = v134;
              *((void *)v138 + 9) = v135;
              sub_252E5EE0C(v160, v116);
              (*v175)(v123, v185);
              uint64_t v79 = v202;
              uint64_t v78 = v203;
              (*(void (**)(char *, uint64_t))v207)(v202, v203);
              unint64_t v76 = v200;
              uint64_t v77 = (uint64_t)v199;
              uint64_t v73 = v204;
              goto LABEL_38;
            }
          }
          else
          {
            sub_252E5F0CC((uint64_t)&v216, &qword_269CB6B90);
          }
          uint64_t v134 = 0;
          uint64_t v135 = 0;
          goto LABEL_66;
        }
        sub_252E5EE0C(v115, v116);
        (*v175)(v188, v185);
        uint64_t v79 = v202;
        uint64_t v78 = v203;
        (*(void (**)(char *, uint64_t))v207)(v202, v203);
LABEL_38:
        sub_252E5F0CC(v213, &qword_269CB6B50);
        v75 += v208;
        if (!--v73)
        {
          swift_bridgeObjectRelease();
          uint64_t v69 = v170;
          unint64_t v68 = v169;
          uint64_t v59 = (uint64_t)v194;
          uint64_t v32 = v205;
          uint64_t v8 = v161;
          uint64_t v60 = v166;
          goto LABEL_79;
        }
      }
      sub_252E5F0CC(v77, &qword_269CB6B48);
      uint64_t v81 = sub_252E62B80();
      sub_252E5EDE4(v213, 1, 1, v81);
      goto LABEL_35;
    }
    swift_bridgeObjectRelease();
LABEL_79:
    LODWORD(v212) = v71;
    (*v164)(v68, v69);
    (*v190)(v60, v32);
    uint64_t v208 = 0;
    uint64_t v31 = v186;
    unint64_t v154 = v168;
LABEL_76:
    unint64_t v57 = v154 + 1;
    sub_252E5F0CC((uint64_t)v31, &qword_269CB6B60);
  }
  while (v57 != v195);
  swift_release();
  uint64_t result = v162;
  char v156 = v208;
LABEL_81:
  LOBYTE(v216) = v156 & 1;
  return result;
}

void sub_252E5D6DC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_252E62A80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_eventBody);
  if (v8)
  {
    uint64_t v9 = v8;
    swift_beginAccess();
    id v10 = v9;
    MEMORY[0x2533CDB50]();
    sub_252E5DD04(*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_252E62E00();
    sub_252E62DE0();
    swift_endAccess();
  }
  else
  {
    sub_252E62A60();
    uint64_t v11 = sub_252E62A70();
    os_log_type_t v12 = sub_252E62E20();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_252E54000, v11, v12, "Receiving SageTranscriptEvent Biome events with no eventBody", v13, 2u);
      MEMORY[0x2533CE120](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_252E5D894(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t TranscriptContextBuilder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TranscriptContextBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_252E5F2DC();
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for TranscriptContextBuilder()
{
  return self;
}

uint64_t method lookup function for TranscriptContextBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TranscriptContextBuilder);
}

uint64_t dispatch thunk of TranscriptContextBuilder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_252E5D99C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_252E62970();
  sub_252E5F288();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  sub_252E5F2B4();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = sub_252E629D0();
  sub_252E5F288();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388]();
  sub_252E5F2B4();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_252E629E0();
  sub_252E5F288();
  uint64_t v16 = v15;
  MEMORY[0x270FA5388]();
  sub_252E5F2B4();
  uint64_t v19 = v18 - v17;
  sub_252E560FC(&qword_269CB6C28);
  MEMORY[0x270FA5388]();
  sub_252E5F2C4();
  sub_252E629C0();
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x263F078C0], v8);
  sub_252E62960();
  sub_252E629B0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v2);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v8);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v14);
  uint64_t result = sub_252E5EDBC(v1, 1, v2);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a1, v1, v2);
  }
  __break(1u);
  return result;
}

id sub_252E5DBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = sub_252E62970();
  uint64_t v13 = 0;
  if (sub_252E5EDBC(a1, 1, v12) != 1)
  {
    uint64_t v13 = (void *)sub_252E62940();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (sub_252E5EDBC(a2, 1, v12) == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = (void *)sub_252E62940();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_252E5DD04(uint64_t result)
{
  unint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (result + 1 > (uint64_t)(v2 >> 1)) {
    return MEMORY[0x270F9DBF0](v2 > 1);
  }
  return result;
}

char *sub_252E5DD30(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_252E560FC(&qword_269CB6BB0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_252E60E9C((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252E5E14C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_252E5DE20(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_252E560FC(&qword_269CB6B98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_252E60FF8((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252E5E244(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_252E5DF18(char a1, int64_t a2, char a3, uint64_t a4)
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
        goto LABEL_24;
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_252E560FC(&qword_269CB6C20);
  uint64_t v10 = *(void *)(sub_252E560FC(&qword_269CB6B68) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_252E62E90();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_252E560FC(&qword_269CB6B68) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_252E60EF8(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252E5E344(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_252E5E14C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_252E62EB0();
  __break(1u);
  return result;
}

uint64_t sub_252E5E244(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_252E62EB0();
  __break(1u);
  return result;
}

uint64_t sub_252E5E344(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_252E560FC(&qword_269CB6B68) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_252E62EB0();
  __break(1u);
  return result;
}

uint64_t sub_252E5E4A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_252E5E57C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_252E5EE64((uint64_t)v12, *a3);
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
      sub_252E5EE64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_252E5EEC4((uint64_t)v12);
  return v7;
}

uint64_t sub_252E5E57C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_252E5E6D4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_252E62E40();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_252E5E7AC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_252E62E80();
    if (!v8)
    {
      uint64_t result = sub_252E62E90();
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

void *sub_252E5E6D4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_252E62EB0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_252E5E7AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_252E5E844(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_252E5EA20(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_252E5EA20((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_252E5E844(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_252E62DC0();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_252E5E9B8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_252E62E60();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_252E62EB0();
  __break(1u);
LABEL_14:
  uint64_t result = sub_252E62E90();
  __break(1u);
  return result;
}

void *sub_252E5E9B8(uint64_t a1, uint64_t a2)
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
  sub_252E560FC(&qword_269CB6BA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_252E5EA20(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_252E560FC(&qword_269CB6BA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_252E5EBD0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252E5EAF8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_252E5EAF8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_252E62EB0();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_252E5EBD0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_252E62EB0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_252E5EC60(uint64_t a1, uint64_t a2)
{
  sub_252E62F60();
  sub_252E62DB0();
  uint64_t v4 = sub_252E62F80();
  return sub_252E5ECD8(a1, a2, v4);
}

unint64_t sub_252E5ECD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_252E62F10() & 1) == 0)
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
      while (!v14 && (sub_252E62F10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_252E5EDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_252E5EDE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_252E5EE0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_252E5EE64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_252E5EEC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_252E5EF14(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_252E5EF24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_252E5EF68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252E560FC(a3);
  sub_252E5F2A4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_252E5EFC4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252E5F00C(void *a1)
{
  id v1 = objc_msgSend(a1, sel_eventType);
  if (!v1) {
    return 0;
  }
  long long v2 = v1;
  uint64_t v3 = sub_252E62D70();

  return v3;
}

uint64_t sub_252E5F070(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252E560FC(a3);
  sub_252E5F2A4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_252E5F0CC(uint64_t a1, uint64_t *a2)
{
  sub_252E560FC(a2);
  sub_252E5F2A4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_252E5F120(void *a1)
{
  id v1 = objc_msgSend(a1, sel_data);
  if (!v1) {
    return 0;
  }
  long long v2 = v1;
  uint64_t v3 = sub_252E62920();

  return v3;
}

uint64_t sub_252E5F184(uint64_t a1, unint64_t a2)
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

unint64_t sub_252E5F1DC()
{
  unint64_t result = qword_269CB6C38;
  if (!qword_269CB6C38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269CB6C38);
  }
  return result;
}

uint64_t sub_252E5F21C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_252E5EE0C(a1, a2);
  }
  return a1;
}

uint64_t sub_252E5F230()
{
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_252E5F2DC();
  return MEMORY[0x270FA0238](v0);
}

uint64_t sub_252E5F260(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252E5F270()
{
  return swift_release();
}

void sub_252E5F278(void *a1)
{
  sub_252E5D6DC(a1, v1);
}

uint64_t sub_252E5F2DC()
{
  return v0;
}

void __swiftcall RetrievedTool.init(id:name:toolType:)(IntelligenceFlowFeedbackDataCollector::RetrievedTool *__return_ptr retstr, Swift::String_optional id, Swift::String_optional name, Swift::String_optional toolType)
{
  retstr->id = id;
  retstr->name = name;
  retstr->toolType = toolType;
}

unint64_t sub_252E5F2FC(char a1)
{
  if (!a1) {
    return 0xD00000000000001ELL;
  }
  if (a1 == 1) {
    return 0xD00000000000001DLL;
  }
  return 0xD00000000000002ALL;
}

BOOL sub_252E5F358(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_252E5F368(char *a1, char *a2)
{
  return sub_252E5F358(*a1, *a2);
}

unint64_t sub_252E5F388()
{
  return sub_252E5F2FC(*v0);
}

uint64_t (*TranscriptContext.userUtterance.modify())()
{
  return nullsub_1;
}

uint64_t (*TranscriptContext.rgInputPayload.modify())()
{
  return nullsub_1;
}

uint64_t (*TranscriptContext.finalResponse.modify())()
{
  return nullsub_1;
}

unint64_t TranscriptContext.toolRetrievalConfidence.getter()
{
  return sub_252E6281C(*(unsigned int *)(v0 + 40));
}

uint64_t TranscriptContext.toolRetrievalConfidence.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 40) = result;
  *(unsigned char *)(v1 + 44) = BYTE4(result) & 1;
  return result;
}

uint64_t (*TranscriptContext.toolRetrievalConfidence.modify())()
{
  return nullsub_1;
}

uint64_t TranscriptContext.toolRetrievalOutputs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TranscriptContext.toolRetrievalOutputs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*TranscriptContext.toolRetrievalOutputs.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.locale.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.assetsInfo.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.osVersion.modify())()
{
  return nullsub_1;
}

uint64_t (*DeviceContext.deviceType.modify())()
{
  return nullsub_1;
}

uint64_t DeviceContext.toDict()()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  unint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  unint64_t v7 = v0[6];
  sub_252E560FC(&qword_269CB6C48);
  uint64_t inited = swift_initStackObject();
  uint64_t v9 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_252E634C0;
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = 0x656C61636F6CLL;
  *(void *)(inited + 40) = 0xE600000000000000;
  if (v1) {
    uint64_t v11 = v2;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = 0xE000000000000000;
  if (v1) {
    unint64_t v12 = v1;
  }
  *(void *)(inited + 48) = v11;
  *(void *)(inited + 56) = v12;
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = 0x6E49737465737361;
  *(void *)(inited + 88) = 0xEA00000000006F66;
  *(void *)(inited + 120) = sub_252E560FC(&qword_269CB6C50);
  swift_bridgeObjectRetain();
  if (v3) {
    uint64_t v13 = v3;
  }
  else {
    uint64_t v13 = sub_252E62D60();
  }
  v9[12] = v13;
  v9[16] = 0x6F6973726556736FLL;
  v9[17] = 0xE90000000000006ELL;
  if (v5) {
    uint64_t v14 = v4;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = 0xE000000000000000;
  if (v5) {
    unint64_t v16 = v5;
  }
  else {
    unint64_t v16 = 0xE000000000000000;
  }
  v9[18] = v14;
  v9[19] = v16;
  v9[21] = v10;
  v9[22] = 0x7954656369766564;
  v9[27] = v10;
  if (v7) {
    uint64_t v17 = v6;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v7) {
    unint64_t v15 = v7;
  }
  v9[23] = 0xEA00000000006570;
  v9[24] = v17;
  v9[25] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_252E62D60();
}

uint64_t RetrievedTool.id.getter()
{
  return sub_252E627E8();
}

uint64_t RetrievedTool.id.setter()
{
  uint64_t result = sub_252E6284C();
  *unint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*RetrievedTool.id.modify())()
{
  return nullsub_1;
}

uint64_t RetrievedTool.name.getter()
{
  return sub_252E627E8();
}

uint64_t RetrievedTool.name.setter()
{
  sub_252E627F4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*RetrievedTool.name.modify())()
{
  return nullsub_1;
}

uint64_t RetrievedTool.toolType.getter()
{
  return sub_252E627E8();
}

uint64_t RetrievedTool.toolType.setter()
{
  sub_252E627F4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*RetrievedTool.toolType.modify())()
{
  return nullsub_1;
}

uint64_t RetrievedTool.toDict()()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  unint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  sub_252E560FC(&qword_269CB6B40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252E634D0;
  *(void *)(inited + 32) = 25705;
  *(void *)(inited + 40) = 0xE200000000000000;
  if (v1) {
    uint64_t v8 = v2;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v1) {
    unint64_t v9 = v1;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v9;
  *(void *)(inited + 64) = 1701667182;
  *(void *)(inited + 72) = 0xE400000000000000;
  if (v3) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v3) {
    unint64_t v11 = v3;
  }
  else {
    unint64_t v11 = 0xE000000000000000;
  }
  *(void *)(inited + 80) = v10;
  *(void *)(inited + 88) = v11;
  sub_252E628BC();
  v12[12] = v14;
  v12[13] = 0xE800000000000000;
  if (v5) {
    uint64_t v15 = v6;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v5) {
    uint64_t v13 = v5;
  }
  v12[14] = v15;
  v12[15] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_252E62D60();
}

uint64_t FeedbackDataView.OriginalContent.userUtterance.getter()
{
  return sub_252E627E8();
}

uint64_t FeedbackDataView.OriginalContent.userUtterance.setter()
{
  uint64_t result = sub_252E6284C();
  *unint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*FeedbackDataView.OriginalContent.userUtterance.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.OriginalContent.toDict()()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  sub_252E560FC(&qword_269CB6B40);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252E633E0;
  uint64_t v5 = sub_252E62868(inited, 0x6574745572657375);
  if (v4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v2;
  }
  unint64_t v7 = 0xE000000000000000;
  if (!v4) {
    unint64_t v7 = v1;
  }
  *(void *)(v5 + 48) = v6;
  *(void *)(v5 + 56) = v7;
  swift_bridgeObjectRetain();
  return sub_252E62D60();
}

uint64_t FeedbackDataView.GeneratedContent.rgInputPayload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeedbackDataView.GeneratedContent.rgInputPayload.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*FeedbackDataView.GeneratedContent.rgInputPayload.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.GeneratedContent.finalResponse.getter()
{
  return sub_252E627E8();
}

uint64_t FeedbackDataView.GeneratedContent.finalResponse.setter()
{
  sub_252E627F4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t (*FeedbackDataView.GeneratedContent.finalResponse.modify())()
{
  return nullsub_1;
}

unint64_t FeedbackDataView.GeneratedContent.toolRetrievalConfidence.getter()
{
  return sub_252E6281C(*(unsigned int *)(v0 + 32));
}

uint64_t FeedbackDataView.GeneratedContent.toolRetrievalConfidence.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t (*FeedbackDataView.GeneratedContent.toolRetrievalConfidence.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.GeneratedContent.init(rgInputPayload:finalResponse:toolRetrievalOutputs:toolRetrievalConfidence:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(_DWORD *)(a6 + 32) = a5;
  *(unsigned char *)(a6 + 36) = BYTE4(a5) & 1;
  return result;
}

uint64_t FeedbackDataView.GeneratedContent.toDict()()
{
  uint64_t v1 = *v0;
  uint64_t v37 = v0[1];
  unint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  int v4 = *((_DWORD *)v0 + 8);
  int v41 = *((unsigned __int8 *)v0 + 36);
  if (v3)
  {
    int v40 = v4;
    int64_t v5 = *(void *)(v3 + 16);
    uint64_t v6 = MEMORY[0x263F8EE78];
    if (v5)
    {
      unint64_t v35 = v2;
      uint64_t v36 = v1;
      *(void *)&long long v38 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_252E61310(0, v5, 0);
      unint64_t v7 = (unint64_t *)(v3 + 40);
      do
      {
        uint64_t v9 = *(v7 - 1);
        unint64_t v8 = *v7;
        unint64_t v11 = v7[1];
        unint64_t v10 = v7[2];
        unint64_t v13 = v7[3];
        unint64_t v12 = v7[4];
        sub_252E560FC(&qword_269CB6B40);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_252E634D0;
        *(void *)(inited + 32) = 25705;
        if (v8) {
          uint64_t v15 = v9;
        }
        else {
          uint64_t v15 = 0;
        }
        if (v8) {
          unint64_t v16 = v8;
        }
        else {
          unint64_t v16 = 0xE000000000000000;
        }
        *(void *)(inited + 40) = 0xE200000000000000;
        *(void *)(inited + 48) = v15;
        *(void *)(inited + 56) = v16;
        *(void *)(inited + 64) = 1701667182;
        if (v10) {
          unint64_t v17 = v11;
        }
        else {
          unint64_t v17 = 0;
        }
        *(void *)(inited + 72) = 0xE400000000000000;
        *(void *)(inited + 80) = v17;
        sub_252E628BC();
        v18[11] = v21;
        v18[12] = v20;
        if (v12) {
          unint64_t v22 = v13;
        }
        else {
          unint64_t v22 = 0;
        }
        if (v12) {
          unint64_t v23 = v12;
        }
        else {
          unint64_t v23 = v19;
        }
        v18[13] = 0xE800000000000000;
        v18[14] = v22;
        v18[15] = v23;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v24 = sub_252E62D60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = v38;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_252E61310(0, *(void *)(v38 + 16) + 1, 1);
          uint64_t v6 = v38;
        }
        unint64_t v26 = *(void *)(v6 + 16);
        unint64_t v25 = *(void *)(v6 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_252E61310((char *)(v25 > 1), v26 + 1, 1);
          uint64_t v6 = v38;
        }
        v7 += 6;
        *(void *)(v6 + 16) = v26 + 1;
        *(void *)(v6 + 8 * v26 + 32) = v24;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      uint64_t v1 = v36;
      int v4 = v40;
      unint64_t v2 = v35;
    }
    else
    {
      int v4 = v40;
    }
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  sub_252E560FC(&qword_269CB6C48);
  uint64_t v27 = swift_initStackObject();
  *(_OWORD *)(v27 + 16) = xmmword_252E634C0;
  uint64_t v29 = sub_252E62868(v27, 0x7365526C616E6966);
  if (v28) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v37;
  }
  if (v28) {
    unint64_t v31 = 0xE000000000000000;
  }
  else {
    unint64_t v31 = v2;
  }
  *(void *)(v29 + 48) = v30;
  *(void *)(v29 + 56) = v31;
  uint64_t v32 = MEMORY[0x263F8D310];
  *(void *)(v29 + 72) = MEMORY[0x263F8D310];
  strcpy((char *)(v29 + 80), "rgInputPayload");
  *(unsigned char *)(v29 + 95) = -18;
  if (v1)
  {
    uint64_t v39 = sub_252E560FC(&qword_269CB6C68);
    *(void *)&long long v38 = v1;
    sub_252E5EF14(&v38, (_OWORD *)(v27 + 96));
  }
  else
  {
    *(void *)(v27 + 120) = v32;
    *(void *)(v27 + 96) = 0;
    *(void *)(v27 + 104) = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  *(void *)(v27 + 128) = 0xD000000000000014;
  *(void *)(v27 + 136) = 0x8000000252E63F90;
  uint64_t v33 = sub_252E560FC(&qword_269CB6C58);
  *(void *)(v27 + 144) = v6;
  *(void *)(v27 + 168) = v33;
  *(void *)(v27 + 176) = 0xD000000000000017;
  *(void *)(v27 + 184) = 0x8000000252E63FB0;
  *(void *)(v27 + 216) = sub_252E560FC(&qword_269CB6C60);
  *(_DWORD *)(v27 + 192) = v4;
  *(unsigned char *)(v27 + 196) = v41;
  swift_bridgeObjectRetain();
  return sub_252E62D60();
}

uint64_t FeedbackDataView.AdditionalDiagnostics.locale.getter()
{
  return sub_252E627E8();
}

uint64_t FeedbackDataView.AdditionalDiagnostics.locale.setter()
{
  uint64_t result = sub_252E6284C();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.locale.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.AdditionalDiagnostics.assetsInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeedbackDataView.AdditionalDiagnostics.assetsInfo.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.assetsInfo.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.AdditionalDiagnostics.osVersion.getter()
{
  return sub_252E627E8();
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextV13finalResponseSSSgvs_0()
{
  sub_252E627F4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v0;
  return result;
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.osVersion.modify())()
{
  return nullsub_1;
}

uint64_t FeedbackDataView.AdditionalDiagnostics.deviceType.getter()
{
  return sub_252E627E8();
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector13DeviceContextV10deviceTypeSSSgvs_0()
{
  sub_252E627F4();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  return result;
}

uint64_t (*FeedbackDataView.AdditionalDiagnostics.deviceType.modify())()
{
  return nullsub_1;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackDataView.AdditionalDiagnostics.JSON()()
{
  uint64_t v1 = sub_252E62DA0();
  MEMORY[0x270FA5388](v1 - 8);
  sub_252E5F2B4();
  uint64_t v4 = v3 - v2;
  sub_252E628F0();
  swift_allocObject();
  uint64_t v5 = sub_252E628E0();
  sub_252E61330();
  uint64_t v6 = sub_252E628D0();
  unint64_t v8 = v7;
  swift_release();
  if (!v0)
  {
    sub_252E62D90();
    uint64_t v9 = sub_252E62D80();
    if (v10)
    {
      uint64_t v4 = v9;
      uint64_t v5 = v10;
    }
    else
    {
      unint64_t v13 = sub_252E6137C();
      sub_252E628A4((uint64_t)&unk_27031EBB8, v13);
      *uint64_t v14 = 2;
      swift_willThrow();
    }
    sub_252E5EE0C(v6, v8);
  }
  uint64_t v11 = v4;
  unint64_t v12 = (void *)v5;
  result._object = v12;
  result._countAndFlagsBits = v11;
  return result;
}

uint64_t sub_252E6025C()
{
  return sub_252E62F70();
}

uint64_t sub_252E60284(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_252E62F10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E49737465737361 && a2 == 0xEA00000000006F66;
    if (v6 || (sub_252E62F10() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL;
      if (v7 || (sub_252E62F10() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_252E62F10();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252E60428()
{
  return 4;
}

uint64_t sub_252E60430()
{
  return sub_252E62F80();
}

uint64_t sub_252E60478()
{
  return 0;
}

uint64_t sub_252E60484(char a1)
{
  return *(void *)&aLocale_0[8 * a1];
}

uint64_t sub_252E604A4()
{
  return sub_252E60430();
}

uint64_t sub_252E604C0()
{
  return sub_252E6025C();
}

uint64_t sub_252E604C8()
{
  return sub_252E62F80();
}

uint64_t sub_252E6050C()
{
  return sub_252E60484(*v0);
}

uint64_t sub_252E60514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252E60284(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252E6053C()
{
  return sub_252E60478();
}

uint64_t sub_252E6055C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252E60428();
  *a1 = result;
  return result;
}

uint64_t sub_252E60584(uint64_t a1)
{
  unint64_t v2 = sub_252E613C8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252E605C0(uint64_t a1)
{
  unint64_t v2 = sub_252E613C8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FeedbackDataView.AdditionalDiagnostics.encode(to:)(void *a1)
{
  sub_252E560FC(&qword_269CB6C80);
  sub_252E62788();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_252E5F2B4();
  uint64_t v8 = v7 - v6;
  sub_252E5EF24(a1, a1[3]);
  sub_252E613C8();
  sub_252E62FA0();
  sub_252E62EE0();
  if (!v10)
  {
    sub_252E560FC(&qword_269CB6C50);
    sub_252E6145C(&qword_269CB6C90);
    sub_252E62EF0();
    sub_252E62EE0();
    sub_252E62EE0();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v8, v1);
}

uint64_t FeedbackDataView.AdditionalDiagnostics.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_252E560FC(&qword_269CB6C98);
  sub_252E62788();
  MEMORY[0x270FA5388](v5);
  sub_252E5F2B4();
  sub_252E5EF24(a1, a1[3]);
  sub_252E613C8();
  sub_252E62F90();
  if (v2)
  {
    sub_252E5EEC4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = 0;
    uint64_t v7 = sub_252E62830((uint64_t)&v24);
    uint64_t v9 = v8;
    sub_252E560FC(&qword_269CB6C50);
    v23[1] = 1;
    sub_252E6145C(&qword_269CB6CA0);
    swift_bridgeObjectRetain();
    sub_252E62ED0();
    uint64_t v20 = a2;
    v23[0] = 2;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_252E62830((uint64_t)v23);
    uint64_t v12 = v11;
    uint64_t v19 = v10;
    char v22 = 3;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_252E62830((uint64_t)&v22);
    uint64_t v15 = v14;
    uint64_t v18 = v13;
    uint64_t v16 = sub_252E627A8();
    v17(v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v20 = v7;
    v20[1] = v9;
    void v20[2] = v21;
    v20[3] = v19;
    v20[4] = v12;
    v20[5] = v18;
    v20[6] = v15;
    sub_252E5EEC4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_252E60AE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return FeedbackDataView.AdditionalDiagnostics.init(from:)(a1, a2);
}

uint64_t sub_252E60AF8(void *a1)
{
  return FeedbackDataView.AdditionalDiagnostics.encode(to:)(a1);
}

uint64_t FeedbackDataView.__allocating_init(clientRequestId:)()
{
  sub_252E627F4();
  uint64_t v2 = swift_allocObject();
  FeedbackDataView.init(clientRequestId:)(v1, v0);
  return v2;
}

uint64_t FeedbackDataView.init(clientRequestId:)(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + 16) = xmmword_252E634E0;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(void *)(v2 + 80) = 1;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(void *)(v2 + 120) = 0;
  type metadata accessor for TranscriptContextBuilder();
  *(void *)(swift_initStackObject() + 16) = MEMORY[0x263F8EE78];
  sub_252E5620C();
  TranscriptContextBuilder.getTranscriptContext(clientRequestId:)(a1, a2, (uint64_t)&v17);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  uint64_t v5 = v19;
  uint64_t v6 = v20;
  uint64_t v7 = 0x100000000;
  if (!BYTE12(v19)) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | DWORD2(v19);
  uint64_t v9 = *(void *)(v2 + 16);
  uint64_t v10 = *(void *)(v2 + 24);
  long long v11 = v18;
  *(_OWORD *)(v2 + 16) = v17;
  *(_OWORD *)(v2 + 32) = v11;
  *(void *)(v2 + 48) = v5;
  *(void *)(v2 + 56) = v8;
  *(void *)(v2 + 64) = v6;
  sub_252E614C0(v9, v10);
  type metadata accessor for DeviceContextBuilder();
  swift_initStackObject();
  DeviceContextBuilder.getCurrentDeviceContext()((uint64_t *)&v17);
  uint64_t v12 = *(void *)(v2 + 72);
  uint64_t v13 = *(void *)(v2 + 80);
  long long v14 = v18;
  *(_OWORD *)(v2 + 72) = v17;
  uint64_t v15 = v20;
  *(_OWORD *)(v2 + 88) = v14;
  *(_OWORD *)(v2 + 104) = v19;
  *(void *)(v2 + 120) = v15;
  sub_252E614C0(v12, v13);
  return v2;
}

IntelligenceFlowFeedbackDataCollector::FeedbackDataView::OriginalContent __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackDataView.originalContent()()
{
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2 == 1)
  {
    unint64_t v3 = sub_252E6137C();
    sub_252E628A4((uint64_t)&unk_27031EBB8, v3);
    *uint64_t v4 = 0;
    uint64_t v5 = swift_willThrow();
  }
  else
  {
    *uint64_t v0 = *(void *)(v1 + 16);
    v0[1] = v2;
    uint64_t v5 = swift_bridgeObjectRetain();
  }
  result.userUtterance.value._object = v6;
  result.userUtterance.value._countAndFlagsBits = v5;
  return result;
}

uint64_t FeedbackDataView.generatedContent()@<X0>(uint64_t a1@<X8>)
{
  if (*(void *)(v1 + 24) == 1)
  {
    unint64_t v2 = sub_252E6137C();
    sub_252E628A4((uint64_t)&unk_27031EBB8, v2);
    *unint64_t v3 = 0;
    return swift_willThrow();
  }
  else
  {
    uint64_t v6 = *(void *)(v1 + 56);
    uint64_t v5 = *(void *)(v1 + 64);
    uint64_t v7 = *(void *)(v1 + 48);
    *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v5;
    *(_DWORD *)(a1 + 32) = v6;
    *(unsigned char *)(a1 + 36) = BYTE4(v6) & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
}

uint64_t FeedbackDataView.additionalDiagnostics()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 80);
  if (v2 == 1)
  {
    unint64_t v3 = sub_252E6137C();
    sub_252E628A4((uint64_t)&unk_27031EBB8, v3);
    *uint64_t v4 = 1;
    return swift_willThrow();
  }
  else
  {
    uint64_t v6 = *(void *)(v1 + 120);
    *(void *)a1 = *(void *)(v1 + 72);
    *(void *)(a1 + 8) = v2;
    long long v7 = *(_OWORD *)(v1 + 104);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v1 + 88);
    *(_OWORD *)(a1 + 32) = v7;
    *(void *)(a1 + 48) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
}

uint64_t *FeedbackDataView.deinit()
{
  sub_252E614C0(v0[2], v0[3]);
  sub_252E614C0(v0[9], v0[10]);
  return v0;
}

uint64_t FeedbackDataView.__deallocating_deinit()
{
  FeedbackDataView.deinit();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

char *sub_252E60E9C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_252E62774();
    IntelligenceFlowFeedbackDataCollector::FeedbackDataView::OriginalContent result = (char *)sub_252E627BC();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_252E62800(a3, result);
  }
  return result;
}

uint64_t sub_252E60EF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_252E62774();
    uint64_t v7 = sub_252E627BC();
    __break(1u);
    return MEMORY[0x270FA01D0](v7);
  }
  if (a3 < a1
    || (uint64_t result = sub_252E560FC(&qword_269CB6B68), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    sub_252E560FC(&qword_269CB6B68);
    uint64_t v8 = sub_252E62890();
    return MEMORY[0x270FA01D8](v8);
  }
  else if (a3 != a1)
  {
    uint64_t v7 = sub_252E62890();
    return MEMORY[0x270FA01D0](v7);
  }
  return result;
}

char *sub_252E60FF8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_252E62774();
    uint64_t result = (char *)sub_252E627BC();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)sub_252E62800(a3, result);
  }
  return result;
}

char *sub_252E6105C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_252E62EB0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_252E610F0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((sub_252E627F4(),
         uint64_t v6 = *(void *)(*(void *)(sub_252E560FC(&qword_269CB6B68) - 8) + 72) * v3,
         unint64_t v7 = a3 + v6,
         unint64_t v8 = v4 + v6,
         v7 > v4)
      ? (BOOL v9 = v8 > a3)
      : (BOOL v9 = 0),
        v9))
  {
    sub_252E62774();
    uint64_t result = sub_252E62EB0();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_252E611F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (BOOL v3 = a1 + 8 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = sub_252E62EB0();
    __break(1u);
  }
  else
  {
    sub_252E560FC(&qword_269CB6C50);
    return swift_arrayInitWithCopy();
  }
  return result;
}

size_t sub_252E612F0(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_252E624A8(a1, a2, a3, *v3);
  *BOOL v3 = result;
  return result;
}

char *sub_252E61310(char *a1, int64_t a2, char a3)
{
  size_t result = sub_252E6264C(a1, a2, a3, *v3);
  *BOOL v3 = (uint64_t)result;
  return result;
}

unint64_t sub_252E61330()
{
  unint64_t result = qword_269CB6C70;
  if (!qword_269CB6C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6C70);
  }
  return result;
}

unint64_t sub_252E6137C()
{
  unint64_t result = qword_269CB6C78;
  if (!qword_269CB6C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6C78);
  }
  return result;
}

unint64_t sub_252E613C8()
{
  unint64_t result = qword_269CB6C88;
  if (!qword_269CB6C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6C88);
  }
  return result;
}

uint64_t sub_252E61414(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_252E6145C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252E61414(&qword_269CB6C50);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252E614C0(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TranscriptContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TranscriptContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TranscriptContext(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TranscriptContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for TranscriptContext()
{
}

void type metadata accessor for DeviceContext()
{
}

uint64_t destroy for RetrievedTool()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RetrievedTool(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RetrievedTool(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for RetrievedTool(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for RetrievedTool(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RetrievedTool(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RetrievedTool(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for RetrievedTool()
{
}

uint64_t type metadata accessor for FeedbackDataView()
{
  return self;
}

uint64_t method lookup function for FeedbackDataView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FeedbackDataView);
}

uint64_t dispatch thunk of FeedbackDataView.__allocating_init(clientRequestId:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *initializeBufferWithCopyOfBuffer for FeedbackDataView.OriginalContent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeedbackDataView.OriginalContent()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for FeedbackDataView.OriginalContent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for FeedbackDataView.OriginalContent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for FeedbackDataView.OriginalContent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.OriginalContent(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackDataView.OriginalContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for FeedbackDataView.OriginalContent()
{
}

uint64_t initializeBufferWithCopyOfBuffer for FeedbackDataView.GeneratedContent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FeedbackDataView.GeneratedContent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  return a1;
}

__n128 initializeWithTake for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 29) = *(void *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FeedbackDataView.GeneratedContent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.GeneratedContent(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 37))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackDataView.GeneratedContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 37) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 37) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

void type metadata accessor for FeedbackDataView.GeneratedContent()
{
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwxx_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwcp_0(void *a1, void *a2)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwca_0(void *a1, void *a2)
{
  sub_252E6287C(a1, a2);
  v3[1] = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[2] = v2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[3] = v2[3];
  v3[4] = v2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[5] = v2[5];
  v3[6] = v2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector13DeviceContextVwta_0(void *a1, void *a2)
{
  sub_252E6287C(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + 32);
  *(void *)(v3 + 24) = *(void *)(v2 + 24);
  *(void *)(v3 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v2 + 48);
  *(void *)(v3 + 40) = *(void *)(v2 + 40);
  *(void *)(v3 + 48) = v5;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s37IntelligenceFlowFeedbackDataCollector17TranscriptContextVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for FeedbackDataView.AdditionalDiagnostics()
{
}

unsigned char *initializeBufferWithCopyOfBuffer for FeedbackDataView.AdditionalDiagnostics.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FeedbackDataView.AdditionalDiagnostics.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeedbackDataView.AdditionalDiagnostics.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252E62198);
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

uint64_t sub_252E621C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_252E621C8(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeedbackDataView.AdditionalDiagnostics.CodingKeys()
{
  return &type metadata for FeedbackDataView.AdditionalDiagnostics.CodingKeys;
}

uint64_t sub_252E621E0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_252E62268(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252E62334);
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

void type metadata accessor for FeedbackDataError()
{
}

unint64_t sub_252E6236C()
{
  unint64_t result = qword_269CB6CA8;
  if (!qword_269CB6CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6CA8);
  }
  return result;
}

unint64_t sub_252E623BC()
{
  unint64_t result = qword_269CB6CB0;
  if (!qword_269CB6CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6CB0);
  }
  return result;
}

unint64_t sub_252E6240C()
{
  unint64_t result = qword_269CB6CB8;
  if (!qword_269CB6CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6CB8);
  }
  return result;
}

unint64_t sub_252E6245C()
{
  unint64_t result = qword_269CB6CC0;
  if (!qword_269CB6CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269CB6CC0);
  }
  return result;
}

size_t sub_252E624A8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_252E560FC(&qword_269CB6C20);
  uint64_t v10 = *(void *)(sub_252E560FC(&qword_269CB6B68) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  unint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_252E560FC(&qword_269CB6B68) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_252E60EF8(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252E610F0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_252E6264C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    sub_252E560FC(&qword_269CB6CC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_252E6105C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252E611F0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_252E627A8()
{
  return v0;
}

uint64_t sub_252E627BC()
{
  return sub_252E62EB0();
}

uint64_t sub_252E627E8()
{
  return v0;
}

void *sub_252E62800@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

unint64_t sub_252E6281C@<X0>(uint64_t a1@<X8>)
{
  return a1 | ((unint64_t)v1 << 32);
}

uint64_t sub_252E62830(uint64_t a1)
{
  return MEMORY[0x270F9F270](a1, v1);
}

uint64_t sub_252E6284C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_252E62868@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = v2 | 0xED00006500000000;
  return result;
}

void *sub_252E6287C(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_252E62890()
{
  return v0;
}

uint64_t sub_252E628A4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0190](a1, a2, 0, 0);
}

uint64_t sub_252E628D0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_252E628E0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_252E628F0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_252E62900()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_252E62910()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_252E62920()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_252E62930()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_252E62940()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_252E62950()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_252E62960()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_252E62970()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252E62980()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_252E62990()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_252E629A0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252E629B0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_252E629C0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_252E629D0()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_252E629E0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_252E629F0()
{
  return MEMORY[0x270F44A90]();
}

uint64_t sub_252E62A00()
{
  return MEMORY[0x270F44A98]();
}

uint64_t sub_252E62A10()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_252E62A20()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_252E62A30()
{
  return MEMORY[0x270F44C80]();
}

uint64_t sub_252E62A40()
{
  return MEMORY[0x270F44CA0]();
}

uint64_t sub_252E62A50()
{
  return MEMORY[0x270F44CD0]();
}

uint64_t sub_252E62A60()
{
  return MEMORY[0x270F41A88]();
}

uint64_t sub_252E62A70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252E62A80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252E62A90()
{
  return MEMORY[0x270F3F8C0]();
}

uint64_t sub_252E62AA0()
{
  return MEMORY[0x270F3F8C8]();
}

uint64_t sub_252E62AB0()
{
  return MEMORY[0x270F3F8D0]();
}

uint64_t sub_252E62AC0()
{
  return MEMORY[0x270F40340]();
}

uint64_t sub_252E62AD0()
{
  return MEMORY[0x270F40350]();
}

uint64_t sub_252E62AE0()
{
  return MEMORY[0x270F40358]();
}

uint64_t sub_252E62AF0()
{
  return MEMORY[0x270F40368]();
}

uint64_t sub_252E62B00()
{
  return MEMORY[0x270F40810]();
}

uint64_t sub_252E62B10()
{
  return MEMORY[0x270F40818]();
}

uint64_t sub_252E62B20()
{
  return MEMORY[0x270F40820]();
}

uint64_t sub_252E62B30()
{
  return MEMORY[0x270F40828]();
}

uint64_t sub_252E62B40()
{
  return MEMORY[0x270F408A8]();
}

uint64_t sub_252E62B50()
{
  return MEMORY[0x270F408B0]();
}

uint64_t sub_252E62B60()
{
  return MEMORY[0x270F408B8]();
}

uint64_t sub_252E62B70()
{
  return MEMORY[0x270F408C0]();
}

uint64_t sub_252E62B80()
{
  return MEMORY[0x270F408C8]();
}

uint64_t sub_252E62B90()
{
  return MEMORY[0x270F408D0]();
}

uint64_t sub_252E62BA0()
{
  return MEMORY[0x270F408D8]();
}

uint64_t sub_252E62BB0()
{
  return MEMORY[0x270F408E0]();
}

uint64_t sub_252E62BC0()
{
  return MEMORY[0x270F408E8]();
}

uint64_t sub_252E62BD0()
{
  return MEMORY[0x270F40950]();
}

uint64_t sub_252E62BE0()
{
  return MEMORY[0x270F40958]();
}

uint64_t sub_252E62BF0()
{
  return MEMORY[0x270F40960]();
}

uint64_t sub_252E62C00()
{
  return MEMORY[0x270F40968]();
}

uint64_t sub_252E62C10()
{
  return MEMORY[0x270F40970]();
}

uint64_t sub_252E62C20()
{
  return MEMORY[0x270F40990]();
}

uint64_t sub_252E62C30()
{
  return MEMORY[0x270F409E0]();
}

uint64_t sub_252E62C40()
{
  return MEMORY[0x270F40A00]();
}

uint64_t sub_252E62C50()
{
  return MEMORY[0x270F40A08]();
}

uint64_t sub_252E62C60()
{
  return MEMORY[0x270F40A48]();
}

uint64_t sub_252E62C70()
{
  return MEMORY[0x270F40A50]();
}

uint64_t sub_252E62C80()
{
  return MEMORY[0x270F40A58]();
}

uint64_t sub_252E62C90()
{
  return MEMORY[0x270F40A60]();
}

uint64_t sub_252E62CA0()
{
  return MEMORY[0x270F40A68]();
}

uint64_t sub_252E62CB0()
{
  return MEMORY[0x270F40A70]();
}

uint64_t sub_252E62CC0()
{
  return MEMORY[0x270F40A78]();
}

uint64_t sub_252E62CD0()
{
  return MEMORY[0x270F40A98]();
}

uint64_t sub_252E62CE0()
{
  return MEMORY[0x270F40AC8]();
}

uint64_t sub_252E62CF0()
{
  return MEMORY[0x270F40B18]();
}

uint64_t sub_252E62D00()
{
  return MEMORY[0x270F40B20]();
}

uint64_t sub_252E62D10()
{
  return MEMORY[0x270F40B28]();
}

uint64_t sub_252E62D20()
{
  return MEMORY[0x270F40B60]();
}

uint64_t sub_252E62D30()
{
  return MEMORY[0x270F40B68]();
}

uint64_t sub_252E62D40()
{
  return MEMORY[0x270F40B70]();
}

uint64_t sub_252E62D50()
{
  return MEMORY[0x270F7FE30]();
}

uint64_t sub_252E62D60()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_252E62D70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252E62D80()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_252E62D90()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_252E62DA0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_252E62DB0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252E62DC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252E62DD0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_252E62DE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252E62E00()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_252E62E10()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252E62E20()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252E62E30()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252E62E40()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252E62E50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252E62E60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252E62E70()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252E62E80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252E62E90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252E62EA0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252E62EB0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252E62ED0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_252E62EE0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_252E62EF0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_252E62F00()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_252E62F10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252E62F20()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252E62F30()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252E62F40()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252E62F50()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252E62F60()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252E62F70()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252E62F80()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252E62F90()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_252E62FA0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x270F96038]();
}

uint64_t MobileGestalt_copy_marketingNameString_obj()
{
  return MEMORY[0x270F96078]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}