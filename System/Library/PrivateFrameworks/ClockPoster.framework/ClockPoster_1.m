uint64_t sub_24A007D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v1 = *(void *)(v0 + 16);
  swift_release();
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC11ClockPoster5Clock_atomicClock) + 24) = &off_26FDEA7D0;
  swift_unknownObjectWeakAssign();
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC11ClockPoster5Clock_textClock)
            + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate
            + 8) = &off_26FDEA7E0;
  swift_unknownObjectWeakAssign();
  v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A007DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v9 = (char *)&v19 - v8;
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideClock);
  uint64_t v11 = type metadata accessor for OverrideTime(0);
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, 1, 1, v11);
  v13 = (os_unfair_lock_s *)(*(void *)(v10 + 40) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v13);
  swift_endAccess();
  uint64_t v14 = v10 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_249F6E790((uint64_t)v6, &qword_269751398);
  sub_249F6E6C8(v14, (uint64_t)v6, &qword_269751398);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock(v13);
  swift_endAccess();
  sub_249F6E664((uint64_t)v6, (uint64_t)v9, &qword_269751398);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
  {
    sub_249F6E790((uint64_t)v9, &qword_269751398);
    uint64_t v15 = sub_24A056238();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
  else
  {
    uint64_t v17 = sub_24A056238();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(a2, v9, v17);
    sub_249F6E790((uint64_t)v9, &qword_269751398);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v17);
  }
}

uint64_t sub_24A00808C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC11ClockPoster5Clock_dateStreamObservers);
  int v5 = *a1;
  swift_retain();

  return sub_249FF9D44(v5, v4, v2, v5, a2);
}

void sub_24A0080F0(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A057628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_24A057608();
  swift_retain();
  uint64_t v10 = sub_24A0575F8();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v12;
  *(void *)(v11 + 32) = a1;
  *(unsigned char *)(v11 + 40) = a2;
  sub_24A04CE18((uint64_t)v8, (uint64_t)&unk_2697511A8, v11);
  swift_release();
  sub_24A006BDC(a3);
}

uint64_t sub_24A008228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 32) = a5;
  *(void *)(v5 + 16) = a4;
  sub_24A057608();
  *(void *)(v5 + 24) = sub_24A0575F8();
  uint64_t v7 = sub_24A0575D8();
  return MEMORY[0x270FA2498](sub_24A0082C4, v7, v6);
}

uint64_t sub_24A0082C4()
{
  uint64_t v5 = v0;
  unsigned __int8 v1 = *(unsigned char *)(v0 + 32);
  swift_release();
  unsigned __int8 v4 = v1;
  sub_24A008F98(&v4);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24A008348@<X0>(double *a1@<X1>, uint64_t a2@<X8>)
{
  return sub_24A00A4E4(a1, a2);
}

uint64_t Clock.deinit()
{
  sub_249F6E790(v0 + OBJC_IVAR____TtC11ClockPoster5Clock_lastOverrideTime, &qword_269751398);
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ClockPoster5Clock_dateInited;
  uint64_t v2 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t Clock.__deallocating_deinit()
{
  Clock.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_24A0084BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 56) = a5;
  *(void *)(v5 + 16) = a4;
  uint64_t v6 = sub_24A056238();
  *(void *)(v5 + 24) = v6;
  *(void *)(v5 + 32) = *(void *)(v6 - 8);
  *(void *)(v5 + 40) = swift_task_alloc();
  sub_24A057608();
  *(void *)(v5 + 48) = sub_24A0575F8();
  uint64_t v8 = sub_24A0575D8();
  return MEMORY[0x270FA2498](sub_24A0085B4, v8, v7);
}

uint64_t sub_24A0085B4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 56);
  swift_release();
  id v5 = objc_msgSend(self, sel_now);
  sub_24A0561E8();

  sub_24A00538C(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24A0086B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24A0086D8, 0, 0);
}

uint64_t sub_24A0086D8()
{
  sub_24A00552C(*(void *)(v0 + 24), *(double **)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A008764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = a2;
  uint64_t v15 = a1;
  uint64_t v16 = a3;
  sub_24A005190((void (*)(char *, uint64_t))sub_24A011920);
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream)
                                      + *(void *)(**(void **)(a1
                                                                + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream)
                                                  + 104))
                          + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v9);
  swift_endAccess();
  sub_249FF4E7C(a2);
  swift_beginAccess();
  os_unfair_lock_unlock(v9);
  swift_endAccess();
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC11ClockPoster5Clock_textClock);
  sub_249F6E6C8(a2, (uint64_t)v8, &qword_2697515A0);
  uint64_t v11 = v10 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate;
  swift_beginAccess();
  sub_249F9AC10((uint64_t)v8, v11, &qword_2697515A0);
  swift_endAccess();
  sub_24A009C30();
  return sub_249F6E790((uint64_t)v8, &qword_2697515A0);
}

uint64_t sub_24A0088FC(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  v61 = a5;
  uint64_t v63 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v55 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v55 - v15;
  uint64_t v17 = sub_24A056238();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v22 = (char *)&v55 - v21;
  int v62 = *a1;
  uint64_t v24 = v23;
  sub_249F6E6C8(a3, (uint64_t)v16, &qword_2697515A0);
  v60 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v60(v16, 1, v17) != 1)
  {
    v57 = v10;
    v58 = v22;
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v22, v16, v17);
    uint64_t v59 = a4;
    uint64_t v56 = OBJC_IVAR____TtC11ClockPoster5Clock__lastOverridePublishTimeByInterval;
    uint64_t v26 = *(void *)(a4 + OBJC_IVAR____TtC11ClockPoster5Clock__lastOverridePublishTimeByInterval);
    uint64_t v27 = v24;
    v28 = (os_unfair_lock_s *)(*(void *)(v26 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v28);
    swift_beginAccess();
    uint64_t v29 = *(void *)(v26 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v28);
    swift_endAccess();
    swift_release();
    uint64_t v24 = v27;
    if (*(void *)(v29 + 16))
    {
      int v30 = v62;
      unint64_t v31 = sub_24A0156DC(v62);
      v32 = v60;
      if (v33)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v13, *(void *)(v29 + 56) + *(void *)(v27 + 72) * v31, v17);
        v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
        v35 = v13;
        uint64_t v36 = 0;
      }
      else
      {
        v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
        v35 = v13;
        uint64_t v36 = 1;
      }
      v55 = v34;
      v34(v35, v36, 1, v17);
      uint64_t v37 = (uint64_t)v57;
    }
    else
    {
      v55 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v55(v13, 1, 1, v17);
      uint64_t v37 = (uint64_t)v57;
      int v30 = v62;
      v32 = v60;
    }
    swift_bridgeObjectRelease();
    if (v32(v13, 1, v17))
    {
      sub_249F6E790((uint64_t)v13, &qword_2697515A0);
      double v38 = 0.0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v19, v13, v17);
      sub_249F6E790((uint64_t)v13, &qword_2697515A0);
      sub_24A0561C8();
      double v38 = v39;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v17);
    }
    uint64_t v19 = v58;
    sub_24A0561C8();
    double v41 = vabdd_f64(v40, v38);
    unsigned int v42 = v32(v61, 1, v17);
    if (v30)
    {
      uint64_t v43 = v59;
      if (v30 == 1) {
        double v44 = 1.0;
      }
      else {
        double v44 = 60.0;
      }
      if (v41 <= v44 && v42 != 1) {
        return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v17);
      }
    }
    else
    {
      BOOL v45 = v41 > 0.01666 || v42 == 1;
      uint64_t v43 = v59;
      if (!v45) {
        return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v17);
      }
    }
    v47 = (os_unfair_lock_s *)(*(void *)(v63 + *(void *)(*(void *)v63 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v47);
    swift_endAccess();
    sub_249FF6B0C((uint64_t)v19);
    swift_beginAccess();
    os_unfair_lock_unlock(v47);
    swift_endAccess();
    char v48 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v37, v19, v17);
    v55((char *)v37, 0, 1, v17);
    uint64_t v49 = v37;
    uint64_t v50 = *(void *)(v43 + v56);
    v51 = (os_unfair_lock_s *)(*(void *)(v50 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v51);
    swift_beginAccess();
    uint64_t v52 = *(void *)(v50 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v51);
    swift_endAccess();
    uint64_t v64 = v52;
    sub_249FEF65C(v49, v48);
    uint64_t v53 = v64;
    swift_beginAccess();
    os_unfair_lock_lock(v51);
    *(void *)(v50 + 24) = v53;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v51);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v17);
  }
  sub_249F6E790((uint64_t)v16, &qword_2697515A0);
  if (qword_26974F328 != -1) {
    swift_once();
  }
  sub_24A006BDC((uint64_t)v19);
  v25 = (os_unfair_lock_s *)(*(void *)(v63 + *(void *)(*(void *)v63 + 104)) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v25);
  swift_endAccess();
  sub_249FF6B0C((uint64_t)v19);
  swift_beginAccess();
  os_unfair_lock_unlock(v25);
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v17);
}

uint64_t sub_24A008F98(unsigned __int8 *a1)
{
  int v2 = *a1;
  uint64_t v3 = swift_allocObject();
  swift_weakInit();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(unsigned char *)(v4 + 24) = v2;
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = v2;
  id v6 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v7 = (uint64_t *)(v1 + 32);
  swift_beginAccess();
  if (!*(void *)(*(void *)(v1 + 32) + 16) || (sub_24A0156DC(v2), (v8 & 1) == 0))
  {
    if (v2)
    {
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = sub_24A011718;
      *(void *)(v9 + 24) = v4;
      if (v2 == 1)
      {
        uint64_t v23 = sub_24A011E40;
        uint64_t v24 = v9;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_24A00985C;
        v22 = &block_descriptor_145;
        uint64_t v10 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        uint64_t v23 = sub_24A011734;
        uint64_t v24 = v5;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_24A009950;
        v22 = &block_descriptor_148;
        uint64_t v11 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        id v12 = objc_msgSend(v6, sel_startSecondUpdatesWithHandler_identificationLog_, v10, v11);
      }
      else
      {
        uint64_t v23 = sub_24A011774;
        uint64_t v24 = v9;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_24A00985C;
        v22 = &block_descriptor_135;
        uint64_t v10 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        uint64_t v23 = sub_24A011734;
        uint64_t v24 = v5;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v20 = 1107296256;
        uint64_t v21 = sub_24A009950;
        v22 = &block_descriptor_138;
        uint64_t v11 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        id v12 = objc_msgSend(v6, sel_startMinuteUpdatesWithHandler_identificationLog_, v10, v11);
      }
    }
    else
    {
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = sub_24A011718;
      *(void *)(v13 + 24) = v4;
      uint64_t v23 = sub_24A011E40;
      uint64_t v24 = v13;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v20 = 1107296256;
      uint64_t v21 = sub_24A00985C;
      v22 = &block_descriptor_155;
      uint64_t v10 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      uint64_t v23 = sub_24A011734;
      uint64_t v24 = v5;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v20 = 1107296256;
      uint64_t v21 = sub_24A009950;
      v22 = &block_descriptor_158;
      uint64_t v11 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      id v12 = objc_msgSend(v6, sel_start60fpsUpdatesWithHandler_identificationLog_, v10, v11);
    }
    id v14 = v12;
    _Block_release(v11);
    _Block_release(v10);
    swift_beginAccess();
    id v15 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v7;
    *uint64_t v7 = 0x8000000000000000;
    sub_249FFF738((uint64_t)v15, v2, isUniquelyReferenced_nonNull_native);
    *uint64_t v7 = v18;
    swift_bridgeObjectRelease();
    swift_endAccess();

    id v6 = v15;
  }

  swift_release();
  return swift_release();
}

uint64_t sub_24A009494(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v8 = MEMORY[0x24C5BA430](result + 16);
    if (v8)
    {
      uint64_t v9 = v8;
      if (sub_24A00700C())
      {
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v10 = sub_24A057628();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
        sub_24A057608();
        swift_retain();
        uint64_t v11 = sub_24A0575F8();
        uint64_t v12 = swift_allocObject();
        uint64_t v13 = MEMORY[0x263F8F500];
        *(void *)(v12 + 16) = v11;
        *(void *)(v12 + 24) = v13;
        *(void *)(v12 + 32) = v9;
        *(unsigned char *)(v12 + 40) = a3;
        sub_24A039A1C((uint64_t)v6, (uint64_t)&unk_269751628, v12);
        swift_release();
        swift_release();
      }
    }
    return swift_release();
  }
  return result;
}

unint64_t sub_24A009620()
{
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  unint64_t v1 = sub_249FB9490();
  sub_24A057438();
  sub_249FB9BBC();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  sub_24A057438();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24A00973C(uint64_t a1, void (*a2)(char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A056238();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  a2(v6);
  return sub_249F6E790((uint64_t)v6, &qword_2697515A0);
}

uint64_t sub_24A00985C(uint64_t a1)
{
  uint64_t v2 = sub_24A056238();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  sub_24A0561E8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_24A009950(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  swift_release();
  uint64_t v3 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t sub_24A0099C4()
{
  sub_249FCFFE8(v0 + 16);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_24A009A04()
{
  return sub_24A057E68();
}

uint64_t sub_24A009AB8()
{
  return sub_24A057318();
}

uint64_t sub_24A009B54()
{
  return sub_24A057E68();
}

uint64_t sub_24A009C04(double *a1, double *a2)
{
  if (*a1 == *a2) {
    JUMPOUT(0x24C5B7BF0);
  }
  return 0;
}

void sub_24A009C30()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v41 = (uint64_t)v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v39 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (id *)((char *)v36 - v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (id *)((char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *(void *)&v0[OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset];
  uint64_t v13 = (os_unfair_lock_s *)(*(void *)(v12 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v13);
  swift_beginAccess();
  uint64_t v14 = *(void *)(v12 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v13);
  swift_endAccess();
  swift_release();
  uint64_t v15 = -1 << *(unsigned char *)(v14 + 32);
  uint64_t v16 = ~v15;
  uint64_t v17 = *(void *)(v14 + 64);
  uint64_t v18 = -v15;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  else {
    uint64_t v19 = -1;
  }
  uint64_t v42 = v14;
  uint64_t v43 = v14 + 64;
  uint64_t v44 = v16;
  uint64_t v45 = 0;
  uint64_t v46 = v19 & v17;
  uint64_t v47 = 0;
  uint64_t v20 = (uint64_t)&v0[OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate];
  v36[1] = (id)v14;
  swift_bridgeObjectRetain();
  v36[0] = v0;
  uint64_t v38 = v20;
  swift_beginAccess();
  sub_24A004A48(v11);
  uint64_t v21 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v4 + 48);
  uint64_t v40 = v4 + 48;
  uint64_t v37 = v21;
  if (v21(v11, 1, v3) != 1)
  {
    do
    {
      sub_249F6E664((uint64_t)v11, (uint64_t)v8, &qword_2697515D0);
      uint64_t v22 = *(int *)(v3 + 48);
      uint64_t v23 = v39;
      uint64_t v24 = (uint64_t)&v39[v22];
      uint64_t v25 = v3;
      uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697515E8) + 48);
      uint64_t v27 = (uint64_t)v8 + v22;
      *uint64_t v23 = *v8;
      sub_24A0112B0(v27, v24, type metadata accessor for TextClockDescriptor);
      v28 = *(void **)(v27 + v26);
      *(void *)(v24 + v26) = v28;
      uint64_t v29 = v41;
      sub_249F6E6C8(v38, v41, &qword_2697515A0);
      uint64_t v30 = sub_24A056238();
      uint64_t v31 = *(void *)(v30 - 8);
      int v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30);
      id v33 = v28;
      v34 = 0;
      if (v32 != 1)
      {
        uint64_t v35 = v41;
        v34 = (void *)sub_24A056198();
        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v35, v30);
      }
      objc_msgSend(v33, sel_setOverrideDate_, v34);

      sub_24A011654(v24, type metadata accessor for TextClockDescriptor);
      sub_249F6E790((uint64_t)v8, &qword_2697515D0);
      sub_24A004A48(v11);
      uint64_t v3 = v25;
    }
    while (v37(v11, 1, v25) != 1);
  }
  sub_249F71790();
  swift_bridgeObjectRelease();
}

id sub_24A00A17C()
{
  sub_24A00A268();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextClock(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24A00A268()
{
  uint64_t v1 = OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset;
  uint64_t v2 = *(void *)(v0
                 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset);
  uint64_t v3 = (os_unfair_lock_s *)(*(void *)(v2 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  swift_endAccess();
  id result = (id)swift_release();
  int64_t v6 = 0;
  uint64_t v7 = v4 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(v4 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      unint64_t v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v11) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      int64_t v6 = v14 + 1;
      if (v14 + 1 >= v11) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v7 + 8 * v6);
      if (!v15)
      {
        int64_t v6 = v14 + 2;
        if (v14 + 2 >= v11) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15)
        {
          int64_t v6 = v14 + 3;
          if (v14 + 3 >= v11) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v7 + 8 * v6);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    id result = objc_msgSend(*(id *)(*(void *)(v4 + 56) + 8 * v13), sel_removeObserver_, v0);
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v11)
  {
LABEL_23:
    swift_release();
    uint64_t v17 = *(void *)(v0 + v1);
    uint64_t v18 = (os_unfair_lock_s *)(*(void *)(v17 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v18);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v18);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    os_unfair_lock_lock(v18);
    *(void *)(v17 + 24) = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v18);
    swift_endAccess();
    return (id)swift_release();
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24A00A4E4@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for TextClockDescriptor(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (double *)((char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v38 - v13;
  uint64_t v43 = OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset;
  uint64_t v15 = *(void *)(v2
                  + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset);
  int64_t v16 = (os_unfair_lock_s *)(*(void *)(v15 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  uint64_t v17 = *(void *)(v15 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v16);
  swift_endAccess();
  swift_release();
  if (*(void *)(v17 + 16))
  {
    sub_24A01518C(a1);
    char v19 = v18;
    uint64_t v20 = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_13;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v38 = v6;
  double v39 = v8;
  uint64_t v42 = a2;
  id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD220]), sel_init);
  uint64_t v22 = v21;
  uint64_t v40 = a1;
  if (*a1 != 0.0) {
    objc_msgSend(v21, sel_setTimeOffset_, *a1);
  }
  uint64_t v41 = v3;
  uint64_t v23 = v3 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate;
  swift_beginAccess();
  sub_249F6E6C8(v23, (uint64_t)v14, &qword_2697515A0);
  uint64_t v24 = sub_24A056238();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v14, 1, v24);
  sub_249F6E790((uint64_t)v14, &qword_2697515A0);
  if (v27 != 1)
  {
    sub_249F6E6C8(v23, (uint64_t)v12, &qword_2697515A0);
    if (v26(v12, 1, v24) == 1)
    {
      v28 = 0;
    }
    else
    {
      v28 = (void *)sub_24A056198();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v24);
    }
    objc_msgSend(v22, sel_setOverrideDate_, v28);
  }
  a1 = v40;
  uint64_t v29 = (void *)sub_24A0563C8();
  objc_msgSend(v22, sel_setTimeZone_, v29);

  uint64_t v3 = v41;
  objc_msgSend(v22, sel_addObserver_, v41);
  uint64_t v30 = v39;
  sub_24A0112B0((uint64_t)a1, (uint64_t)v39, type metadata accessor for TextClockDescriptor);
  uint64_t v31 = *(void *)(v3 + v43);
  int v32 = (os_unfair_lock_s *)(*(void *)(v31 + 16) + 16);
  swift_beginAccess();
  id v33 = v22;
  swift_retain();
  os_unfair_lock_lock(v32);
  swift_beginAccess();
  uint64_t v34 = *(void *)(v31 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v32);
  swift_endAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v44 = v34;
  sub_249FFF870((uint64_t)v33, v30, isUniquelyReferenced_nonNull_native);
  uint64_t v36 = v44;
  swift_bridgeObjectRelease();
  sub_24A011654((uint64_t)v30, type metadata accessor for TextClockDescriptor);
  swift_beginAccess();
  os_unfair_lock_lock(v32);
  *(void *)(v31 + 24) = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v32);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_release();

  a2 = v42;
LABEL_13:
  MEMORY[0x270FA5388](v20);
  *(&v38 - 2) = (uint64_t)a1;
  *(&v38 - 1) = v3;
  return sub_24A004350(sub_24A011E3C, (uint64_t)(&v38 - 4), a2);
}

id sub_24A00A9A8@<X0>(double *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A056238();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v51 - v14;
  if (qword_26974F328 != -1) {
    swift_once();
  }
  sub_24A006BDC((uint64_t)v15);
  if (*a1 != 0.0)
  {
    sub_24A056188();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v13, v9);
  }
  uint64_t v16 = *(void *)(a2
                  + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset);
  uint64_t v17 = (os_unfair_lock_s *)(*(void *)(v16 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v17);
  swift_beginAccess();
  uint64_t v18 = *(void *)(v16 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v17);
  swift_endAccess();
  swift_release();
  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_24A01518C(a1), (v20 & 1) != 0))
  {
    id v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD220]), sel_init);
    uint64_t v23 = a2 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_overrideDate;
    swift_beginAccess();
    sub_249F6E6C8(v23, (uint64_t)v8, &qword_2697515A0);
    LODWORD(v23) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
    id v21 = v22;
    uint64_t v24 = 0;
    if (v23 != 1)
    {
      uint64_t v24 = (void *)sub_24A056198();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    }
    objc_msgSend(v21, sel_setOverrideDate_, v24);

    objc_msgSend(v21, sel_setTimeOffset_, *a1);
    type metadata accessor for TextClockDescriptor(0);
    uint64_t v25 = (void *)sub_24A0563C8();
    objc_msgSend(v21, sel_setTimeZone_, v25);
  }
  id result = objc_msgSend(v21, sel_timeText);
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  int v27 = result;
  uint64_t v56 = v15;
  uint64_t v28 = sub_24A0573A8();
  uint64_t v57 = v29;
  uint64_t v58 = v28;

  id result = objc_msgSend(v21, sel_timeAndDesignatorText);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v30 = result;
  uint64_t v54 = v10;
  uint64_t v55 = v9;
  uint64_t v31 = sub_24A0573A8();
  uint64_t v52 = v32;
  uint64_t v53 = v31;

  id v33 = objc_msgSend(v21, sel_designatorRangeInTimeAndDesignatorText);
  uint64_t v35 = v34;
  id result = objc_msgSend(v21, sel_timeSubstringToSeparatorText);
  if (result)
  {
    uint64_t v36 = result;
    uint64_t v37 = sub_24A0573A8();
    uint64_t v39 = v38;

    id v40 = objc_msgSend(v21, sel_separatorRangeInTimeText);
    uint64_t v42 = v41;

    uint64_t v43 = (char *)a1 + *(int *)(type metadata accessor for TextClockDescriptor(0) + 20);
    uint64_t v44 = type metadata accessor for TimeString(0);
    uint64_t v45 = &a3[*(int *)(v44 + 36)];
    uint64_t v46 = sub_24A0563F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v45, v43, v46);
    uint64_t v47 = v56;
    uint64_t v48 = v57;
    *(void *)a3 = v58;
    *((void *)a3 + 1) = v48;
    uint64_t v49 = v54;
    uint64_t v50 = v52;
    *((void *)a3 + 2) = v53;
    *((void *)a3 + 3) = v50;
    *((void *)a3 + 4) = v33;
    *((void *)a3 + 5) = v35;
    *((void *)a3 + 6) = v37;
    *((void *)a3 + 7) = v39;
    *((void *)a3 + 8) = v40;
    *((void *)a3 + 9) = v42;
    return (id)(*(uint64_t (**)(char *, char *, uint64_t))(v49 + 32))(&a3[*(int *)(v44 + 40)], v47, v55);
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_24A00AE94(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v76 = (uint64_t)&v70 - v8;
  uint64_t v9 = sub_24A056538();
  uint64_t v82 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v78 = (uint64_t)&v70 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v79 = (uint64_t)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TimeString(0);
  uint64_t v71 = *(void *)(v16 - 8);
  uint64_t v17 = *(void *)(v71 + 64);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v72 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v77 = (uint64_t)&v70 - v19;
  uint64_t v20 = type metadata accessor for TextClockDescriptor(0);
  uint64_t v83 = *(void *)(v20 - 8);
  uint64_t v21 = *(void *)(v83 + 64);
  MEMORY[0x270FA5388](v20);
  uint64_t v70 = (uint64_t)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v81 = (char *)&v70 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515C0);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v70 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515C8);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v29 = (char *)&v70 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v80 = (uint64_t)&v70 - v31;
  if (a1)
  {
    uint64_t v74 = v2;
    uint64_t v75 = v9;
    uint64_t v32 = *(void *)(v2
                    + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock__timeFormatterByOffset);
    id v33 = (os_unfair_lock_s *)(*(void *)(v32 + 16) + 16);
    swift_beginAccess();
    id v34 = a1;
    swift_retain();
    os_unfair_lock_lock(v33);
    swift_beginAccess();
    uint64_t v35 = *(void *)(v32 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v33);
    swift_endAccess();
    swift_release();
    id v73 = v34;
    sub_24A004EF8(v35, v73, (uint64_t)v26);
    swift_bridgeObjectRelease();
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515D0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 48))(v26, 1, v36) == 1)
    {
      sub_249F6E790((uint64_t)v26, &qword_2697515C0);
      uint64_t v37 = 1;
      uint64_t v38 = v80;
      uint64_t v39 = (uint64_t)v81;
    }
    else
    {
      uint64_t v42 = (uint64_t)&v26[*(int *)(v36 + 48)];

      uint64_t v38 = v80;
      sub_24A011248(v42, v80, type metadata accessor for TextClockDescriptor);
      uint64_t v37 = 0;
      uint64_t v39 = (uint64_t)v81;
    }
    uint64_t v43 = v83;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v83 + 56))(v38, v37, 1, v20);
    sub_249F6E6C8(v38, (uint64_t)v29, &qword_2697515C8);
    int v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v43 + 48))(v29, 1, v20);
    uint64_t v45 = v74;
    uint64_t v46 = v75;
    if (v44 == 1)
    {
      sub_249F6E790((uint64_t)v29, &qword_2697515C8);
      if (qword_26B16F9B8 != -1) {
        swift_once();
      }
      uint64_t v47 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      uint64_t v48 = v47;
      uint64_t v49 = v76;
      sub_249F6E6C8(v48, v76, &qword_26B16FAA8);
      uint64_t v50 = v82;
      int v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v49, 1, v46);
      uint64_t v52 = v78;
      if (v51 == 1)
      {
        sub_249FB8AA8(v78);
        sub_249F6E790(v49, &qword_26B16FAA8);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v78, v49, v46);
      }
      v67 = sub_24A056518();
      os_log_type_t v68 = sub_24A0577C8();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_249F61000, v67, v68, "Cannot map CLKTimeFormatter to listeners.", v69, 2u);
        MEMORY[0x24C5BA360](v69, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v52, v46);
    }
    else
    {
      uint64_t v53 = sub_24A011248((uint64_t)v29, v39, type metadata accessor for TextClockDescriptor);
      MEMORY[0x270FA5388](v53);
      *(&v70 - 2) = v39;
      *(&v70 - 1) = v45;
      uint64_t v54 = v77;
      sub_24A004350((uint64_t (*)(void))sub_249F6C530, (uint64_t)(&v70 - 4), v77);
      uint64_t v55 = MEMORY[0x24C5BA430](v45 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC495429TextClock_delegate);
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = sub_24A057628();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v79, 1, 1, v57);
        uint64_t v58 = v72;
        sub_24A0112B0(v54, v72, type metadata accessor for TimeString);
        uint64_t v59 = v70;
        sub_24A0112B0(v39, v70, type metadata accessor for TextClockDescriptor);
        unint64_t v60 = (*(unsigned __int8 *)(v71 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v71 + 80);
        unint64_t v61 = (v17 + *(unsigned __int8 *)(v83 + 80) + v60) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
        int v62 = (void *)swift_allocObject();
        v62[2] = 0;
        v62[3] = 0;
        v62[4] = v56;
        sub_24A011248(v58, (uint64_t)v62 + v60, type metadata accessor for TimeString);
        sub_24A011248(v59, (uint64_t)v62 + v61, type metadata accessor for TextClockDescriptor);
        swift_retain();
        sub_24A039A1C(v79, (uint64_t)&unk_2697515E0, (uint64_t)v62);
        swift_release();

        swift_release();
      }
      else
      {
      }
      sub_24A011654(v54, type metadata accessor for TimeString);
      sub_24A011654(v39, type metadata accessor for TextClockDescriptor);
    }
    return sub_249F6E790(v38, &qword_2697515C8);
  }
  else
  {
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v40 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_249F6E6C8(v40, (uint64_t)v6, &qword_26B16FAA8);
    uint64_t v41 = v82;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v6, 1, v9) == 1)
    {
      sub_249FB8AA8((uint64_t)v11);
      sub_249F6E790((uint64_t)v6, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v11, v6, v9);
    }
    uint64_t v63 = sub_24A056518();
    os_log_type_t v64 = sub_24A0577C8();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_249F61000, v63, v64, "CLKTimeFormatter must never CLKTimeFormatterObserver call is nil.", v65, 2u);
      MEMORY[0x24C5BA360](v65, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v11, v9);
  }
}

uint64_t sub_24A00B93C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v37 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v40 = (char *)&v36 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v38 = (uint64_t)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v36 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v36 - v16;
  uint64_t v18 = type metadata accessor for OverrideTime(0);
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  uint64_t v20 = (os_unfair_lock_s *)(*(void *)(v1 + 40) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v20);
  swift_endAccess();
  uint64_t v21 = v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_249F6E790((uint64_t)v17, &qword_269751398);
  sub_249F6E6C8(v21, (uint64_t)v17, &qword_269751398);
  sub_249F6E6C8(a1, (uint64_t)v14, &qword_269751398);
  sub_249F6E6C8(v21, (uint64_t)v11, &qword_269751398);
  swift_endAccess();
  swift_beginAccess();
  sub_249F9AC10((uint64_t)v14, v21, &qword_269751398);
  swift_endAccess();
  sub_24A00C07C((uint64_t)v11);
  sub_249F6E790((uint64_t)v14, &qword_269751398);
  sub_249F6E790((uint64_t)v11, &qword_269751398);
  swift_beginAccess();
  os_unfair_lock_unlock(v20);
  swift_endAccess();
  uint64_t v22 = MEMORY[0x24C5BA430](v1 + 16);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v39 = a1;
    uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
    uint64_t v25 = 1;
    int v26 = v24(v17, 1, v18);
    uint64_t v27 = sub_24A056238();
    uint64_t v28 = *(void *)(v27 - 8);
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v40, v17, v27);
      uint64_t v25 = 0;
    }
    uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
    v29(v40, v25, 1, v27);
    uint64_t v30 = v38;
    sub_249F6E6C8(v39, v38, &qword_269751398);
    if (v24((char *)v30, 1, v18) == 1)
    {
      sub_249F6E790(v30, &qword_269751398);
      uint64_t v31 = 1;
      a1 = v39;
      uint64_t v32 = (uint64_t)v37;
    }
    else
    {
      uint64_t v32 = (uint64_t)v37;
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v37, v30, v27);
      sub_24A011654(v30, type metadata accessor for OverrideTime);
      uint64_t v31 = 0;
      a1 = v39;
    }
    v29((char *)v32, v31, 1, v27);
    uint64_t v33 = MEMORY[0x24C5B9AB0]("Clock:shared");
    if (v33)
    {
      MEMORY[0x270FA5388](v33);
      *(&v36 - 4) = v23;
      *(&v36 - 3) = v32;
      uint64_t v34 = (uint64_t)v40;
      *(&v36 - 2) = (uint64_t)v40;
      sub_249F7045C(sub_24A011914, (uint64_t)(&v36 - 6));
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      uint64_t v34 = (uint64_t)v40;
    }
    sub_249F6E790(v32, &qword_2697515A0);
    sub_249F6E790(v34, &qword_2697515A0);
  }
  sub_249F6E790(a1, &qword_269751398);
  return sub_249F6E790((uint64_t)v17, &qword_269751398);
}

void (*sub_24A00BE20(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[9] = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269751398) - 8) + 64);
  uint64_t v5 = malloc(v4);
  v3[10] = v5;
  uint64_t v6 = malloc(v4);
  v3[11] = v6;
  uint64_t v7 = type metadata accessor for OverrideTime(0);
  (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  uint64_t v8 = (os_unfair_lock_s *)(*(void *)(v1 + 40) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v8);
  swift_endAccess();
  uint64_t v9 = v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_249F6E790((uint64_t)v5, &qword_269751398);
  sub_249F6E6C8(v9, (uint64_t)v5, &qword_269751398);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock(v8);
  swift_endAccess();
  sub_249F6E664((uint64_t)v5, (uint64_t)v6, &qword_269751398);
  return sub_24A00BFC0;
}

void sub_24A00BFC0(uint64_t a1, char a2)
{
}

void sub_24A00BFD8(uint64_t a1, char a2, void (*a3)(void *))
{
  size_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 80);
  uint64_t v6 = *(void **)(*(void *)a1 + 88);
  if (a2)
  {
    sub_249F6E6C8(*(void *)(*(void *)a1 + 88), (uint64_t)v5, &qword_269751398);
    a3(v5);
    sub_249F6E790((uint64_t)v6, &qword_269751398);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 88));
  }
  free(v6);
  free(v5);

  free(v4);
}

uint64_t sub_24A00C07C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v18 = v1;
  uint64_t v9 = v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  uint64_t v10 = type metadata accessor for OverrideTime(0);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
  int v12 = v11(v9, 1, v10);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (!v12)
  {
    uint64_t v15 = v9 + *(int *)(v10 + 20);
    uint64_t v13 = *(void *)(v15 + 16);
    uint64_t v14 = *(void *)(v15 + 24);
  }
  v17[0] = v14;
  v17[1] = v13;
  sub_249F6E6C8(a1, (uint64_t)v8, &qword_269751398);
  if (v11((uint64_t)v8, 1, v10) == 1)
  {
    uint64_t result = sub_249F6E790((uint64_t)v8, &qword_269751398);
    if (v12) {
      return result;
    }
    goto LABEL_9;
  }
  sub_24A011654((uint64_t)v8, type metadata accessor for OverrideTime);
  if (v12 || (sub_24A057EF8() & 1) == 0 || (uint64_t result = sub_24A057EF8(), (result & 1) == 0))
  {
LABEL_9:
    sub_249F6E6C8(v9, (uint64_t)v5, &qword_269751398);
    sub_24A00D6C0((uint64_t)v5);
    return sub_249F6E790((uint64_t)v5, &qword_269751398);
  }
  return result;
}

void *sub_24A00C294(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[3] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for CPUnfairLock();
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  v1[5] = v6;
  uint64_t v7 = (char *)v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  uint64_t v8 = type metadata accessor for OverrideTime(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)((char *)v1
            + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_advanceTimeTask) = 0;
  uint64_t v9 = (char *)v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_initializationTime;
  sub_24A0561F8();
  uint64_t v10 = sub_24A056238();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  v1[4] = a1;
  if (a1)
  {
    uint64_t v11 = sub_24A057628();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
    uint64_t v12 = swift_allocObject();
    swift_weakInit();
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = a1;
    v13[5] = v12;
    swift_retain();
    sub_24A04CE18((uint64_t)v5, (uint64_t)&unk_269751690, (uint64_t)v13);
    swift_release();
  }
  return v1;
}

uint64_t sub_24A00C4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[18] = a4;
  v5[19] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  v5[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  uint64_t v6 = sub_24A056238();
  v5[23] = v6;
  v5[24] = *(void *)(v6 - 8);
  v5[25] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v5[26] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[27] = v8;
  v5[28] = *(void *)(v8 + 64);
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB0);
  v5[33] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697516A0);
  v5[34] = v9;
  v5[35] = *(void *)(v9 - 8);
  v5[36] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB8);
  v5[37] = v10;
  v5[38] = *(void *)(v10 - 8);
  v5[39] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A00C754, 0, 0);
}

uint64_t sub_24A00C754()
{
  uint64_t v2 = v0[35];
  uint64_t v1 = v0[36];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[18];
  uint64_t v5 = *(void *)(v4 + 32);
  swift_retain();
  sub_249FF04BC(v5, v4, v1);
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[40] = v6;
  void *v6 = v0;
  v6[1] = sub_24A00C884;
  uint64_t v7 = v0[37];
  uint64_t v8 = v0[33];
  return MEMORY[0x270FA1F68](v8, 0, 0, v7);
}

uint64_t sub_24A00C884()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24A00C980, 0, 0);
}

uint64_t sub_24A00C980()
{
  uint64_t v1 = v0[33];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[27] + 48))(v1, 1, v0[26]) != 1)
  {
    sub_249F6E664(v1, v0[32], &qword_2697515A0);
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v3 = Strong;
      uint64_t v4 = v0[31];
      uint64_t v6 = v0[23];
      uint64_t v5 = v0[24];
      uint64_t v7 = Strong + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_initializationTime;
      sub_249F6E6C8(Strong + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_initializationTime, v4, &qword_2697515A0);
      uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
      uint64_t v9 = v8(v4, 1, v6);
      uint64_t v48 = v3;
      if (v9 == 1)
      {
        __break(1u);
        return MEMORY[0x270FA1F68](v9, v10, v11, v12);
      }
      uint64_t v14 = v0[30];
      uint64_t v13 = v0[31];
      uint64_t v16 = v0[24];
      uint64_t v15 = v0[25];
      uint64_t v17 = v0[23];
      uint64_t v47 = v0[22];
      uint64_t v46 = v0[21];
      sub_24A0561F8();
      sub_24A056178();
      double v19 = v18;
      uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v20(v15, v17);
      v20(v13, v17);
      sub_249F6E6C8(v7, v14, &qword_2697515A0);
      int v21 = v8(v14, 1, v17);
      sub_249F6E790(v14, &qword_2697515A0);
      uint64_t v22 = type metadata accessor for OverrideTime(0);
      uint64_t v23 = *(void *)(v22 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v46, 1, 1, v22);
      uint64_t v24 = (os_unfair_lock_s *)(*(void *)(v48 + 40) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v24);
      swift_endAccess();
      uint64_t v25 = v48 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
      swift_beginAccess();
      sub_249F6E790(v46, &qword_269751398);
      sub_249F6E6C8(v25, v46, &qword_269751398);
      swift_endAccess();
      swift_beginAccess();
      os_unfair_lock_unlock(v24);
      swift_endAccess();
      sub_249F6E664(v46, v47, &qword_269751398);
      int v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v47, 1, v22);
      uint64_t v27 = v0[22];
      if (v26 == 1)
      {
        sub_249F6E790(v27, &qword_269751398);
      }
      else
      {
        sub_249F6E790(v27, &qword_269751398);
        if (v21 != 1 && v19 <= 1.0)
        {
          sub_249F6E790(v0[32], &qword_2697515A0);
          swift_release();
LABEL_21:
          uint64_t v45 = (void *)swift_task_alloc();
          v0[40] = v45;
          *uint64_t v45 = v0;
          v45[1] = sub_24A00C884;
          uint64_t v12 = v0[37];
          uint64_t v9 = v0[33];
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          return MEMORY[0x270FA1F68](v9, v10, v11, v12);
        }
      }
      uint64_t v30 = v0[32];
      uint64_t v31 = v0[29];
      uint64_t v32 = v0[27];
      uint64_t v33 = v0[20];
      uint64_t v34 = sub_24A057628();
      uint64_t v35 = *(void *)(v34 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v33, 1, 1, v34);
      sub_249F6E6C8(v30, v31, &qword_2697515A0);
      unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      uint64_t v37 = (void *)swift_allocObject();
      v37[2] = 0;
      uint64_t v38 = v37 + 2;
      v37[3] = 0;
      v37[4] = v48;
      sub_249F6E664(v31, (uint64_t)v37 + v36, &qword_2697515A0);
      LODWORD(v31) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34);
      swift_retain();
      uint64_t v39 = v0[20];
      if (v31 == 1)
      {
        sub_249F6E790(v0[20], &qword_26974F450);
        if (*v38)
        {
LABEL_15:
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v40 = sub_24A0575D8();
          uint64_t v42 = v41;
          swift_unknownObjectRelease();
LABEL_18:
          uint64_t v43 = swift_allocObject();
          *(void *)(v43 + 16) = &unk_2697516B8;
          *(void *)(v43 + 24) = v37;
          if (v42 | v40)
          {
            v0[2] = 0;
            v0[3] = 0;
            v0[4] = v40;
            v0[5] = v42;
          }
          uint64_t v44 = v0[32];
          swift_task_create();
          swift_release();
          swift_release();
          sub_249F6E790(v44, &qword_2697515A0);
          goto LABEL_21;
        }
      }
      else
      {
        sub_24A057618();
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v34);
        if (*v38) {
          goto LABEL_15;
        }
      }
      uint64_t v40 = 0;
      uint64_t v42 = 0;
      goto LABEL_18;
    }
    sub_249F6E790(v0[32], &qword_2697515A0);
  }
  (*(void (**)(void, void))(v0[38] + 8))(v0[39], v0[37]);
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
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_24A00D040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A00D0D4, 0, 0);
}

uint64_t sub_24A00D0D4()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  uint64_t v5 = (os_unfair_lock_s *)(*(void *)(v3 + 40) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v5);
  swift_endAccess();
  sub_24A00D278(v1, v3, v2);
  swift_beginAccess();
  os_unfair_lock_unlock(v5);
  swift_endAccess();
  uint64_t v6 = MEMORY[0x24C5BA430](v3 + 16);
  if (v6)
  {
    uint64_t v7 = v6;
    if (MEMORY[0x24C5B9AB0]("Clock:shared"))
    {
      uint64_t v8 = swift_task_alloc();
      long long v9 = *(_OWORD *)(v0 + 9);
      *(void *)(v8 + 16) = v7;
      *(_OWORD *)(v8 + 24) = v9;
      sub_249F7045C(sub_24A011E34, v8);
      swift_unknownObjectRelease();
      swift_task_dealloc();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  sub_249F6E790(v0[10], &qword_2697515A0);
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24A00D278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v41 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v43 = (char *)&v38 - v9;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v40 = (uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v18 = a2 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_249F6E6C8(v18, (uint64_t)v12, &qword_269751398);
  uint64_t v19 = type metadata accessor for OverrideTime(0);
  uint64_t v20 = *(void *)(v19 - 8);
  int v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v19);
  uint64_t v42 = a2;
  if (v21)
  {
    sub_249F6E790((uint64_t)v12, &qword_269751398);
    uint64_t v22 = sub_24A056238();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v17, 1, 1, v22);
  }
  else
  {
    uint64_t v22 = sub_24A056238();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v17, v12, v22);
    sub_249F6E790((uint64_t)v12, &qword_269751398);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v17, 0, 1, v22);
  }
  sub_24A003F9C((uint64_t)v17, a1, &qword_2697515A0);
  sub_24A056238();
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  uint64_t v25 = 1;
  if (v24(a3, 1, v22) == 1) {
    goto LABEL_7;
  }
  uint64_t v39 = v19;
  uint64_t v26 = v40;
  sub_249F6E6C8(a3, v40, &qword_2697515A0);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v24)(v26, 1, v22);
  if (result != 1)
  {
    uint64_t v28 = sub_24A057F08();
    uint64_t v30 = v29;
    uint64_t v31 = sub_24A057F08();
    uint64_t v33 = v32;
    uint64_t v34 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(v43, v26, v22);
    uint64_t v25 = 0;
    uint64_t v35 = (uint64_t *)&v34[*(int *)(v39 + 20)];
    uint64_t v19 = v39;
    uint64_t *v35 = v28;
    v35[1] = v30;
    v35[2] = v31;
    v35[3] = v33;
LABEL_7:
    uint64_t v36 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v43, v25, 1, v19);
    uint64_t v37 = v41;
    sub_249F6E6C8(v18, v41, &qword_269751398);
    swift_beginAccess();
    sub_249F9AC10(v36, v18, &qword_269751398);
    swift_endAccess();
    sub_24A00C07C(v37);
    sub_249F6E790(v36, &qword_269751398);
    return sub_249F6E790(v37, &qword_269751398);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00D6C0(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_advanceTimeTask;
  if (*(void *)(v1 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_advanceTimeTask))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269751580);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
    sub_24A057688();
    swift_release();
  }
  *(void *)(v1 + v9) = 0;
  swift_release();
  sub_249F6E6C8(a1, (uint64_t)v8, &qword_269751398);
  uint64_t v10 = type metadata accessor for OverrideTime(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v8, 1, v10) == 1) {
    return sub_249F6E790((uint64_t)v8, &qword_269751398);
  }
  uint64_t v12 = &v8[*(int *)(v10 + 20)];
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *((void *)v12 + 1);
  uint64_t v15 = *((void *)v12 + 2);
  uint64_t v16 = *((void *)v12 + 3);
  sub_24A011654((uint64_t)v8, type metadata accessor for OverrideTime);
  sub_24A057F08();
  uint64_t result = sub_24A057EF8();
  if ((result & 1) == 0)
  {
    sub_24A057F08();
    uint64_t result = sub_24A057EF8();
    if ((result & 1) == 0)
    {
      uint64_t v17 = sub_24A057628();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
      uint64_t v18 = swift_allocObject();
      swift_weakInit();
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = 0;
      v19[3] = 0;
      v19[4] = v18;
      v19[5] = v13;
      v19[6] = v14;
      v19[7] = v15;
      v19[8] = v16;
      *(void *)(v1 + v9) = sub_24A039BA4((uint64_t)v5, (uint64_t)&unk_269751598, (uint64_t)v19);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24A00D980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = a7;
  v8[22] = a8;
  v8[19] = a5;
  v8[20] = a6;
  v8[17] = a1;
  v8[18] = a4;
  uint64_t v9 = sub_24A057B48();
  v8[23] = v9;
  v8[24] = *(void *)(v9 - 8);
  v8[25] = swift_task_alloc();
  uint64_t v10 = sub_24A057B28();
  v8[26] = v10;
  v8[27] = *(void *)(v10 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v8[32] = swift_task_alloc();
  uint64_t v11 = sub_24A056238();
  v8[33] = v11;
  v8[34] = *(void *)(v11 - 8);
  v8[35] = swift_task_alloc();
  v8[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A00DB90, 0, 0);
}

uint64_t sub_24A00DB90()
{
  if ((sub_24A057698() & 1) == 0)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 296) = Strong;
    if (Strong)
    {
      uint64_t v2 = Strong;
      uint64_t v3 = *(void *)(v0 + 240);
      uint64_t v31 = *(void *)(v0 + 248);
      uint64_t v4 = type metadata accessor for OverrideTime(0);
      uint64_t v5 = *(void *)(v4 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
      uint64_t v6 = (os_unfair_lock_s *)(*(void *)(v2 + 40) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v6);
      swift_endAccess();
      uint64_t v7 = v2 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
      swift_beginAccess();
      sub_249F6E790(v3, &qword_269751398);
      sub_249F6E6C8(v7, v3, &qword_269751398);
      swift_endAccess();
      swift_beginAccess();
      os_unfair_lock_unlock(v6);
      swift_endAccess();
      sub_249F6E664(v3, v31, &qword_269751398);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v31, 1, v4))
      {
        uint64_t v8 = *(void *)(v0 + 264);
        uint64_t v9 = *(void *)(v0 + 272);
        uint64_t v10 = *(void *)(v0 + 256);
        sub_249F6E790(*(void *)(v0 + 248), &qword_269751398);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v10, 1, 1, v8);
      }
      else
      {
        uint64_t v14 = *(void *)(v0 + 272);
        uint64_t v13 = *(void *)(v0 + 280);
        uint64_t v16 = *(void *)(v0 + 256);
        uint64_t v15 = *(void *)(v0 + 264);
        uint64_t v17 = *(void *)(v0 + 248);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v17, v15);
        sub_249F6E790(v17, &qword_269751398);
        sub_24A057EE8();
        sub_24A057EE8();
        sub_24A056188();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v15);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v15) != 1)
        {
          (*(void (**)(void, void, void))(*(void *)(v0 + 272) + 32))(*(void *)(v0 + 288), *(void *)(v0 + 256), *(void *)(v0 + 264));
          goto LABEL_10;
        }
      }
      uint64_t v18 = *(void *)(v0 + 256);
      sub_24A0561F8();
      sub_249F6E790(v18, &qword_2697515A0);
LABEL_10:
      uint64_t v19 = *(void *)(v0 + 288);
      uint64_t v20 = *(void *)(v0 + 224);
      uint64_t v21 = *(void *)(v0 + 208);
      uint64_t v22 = *(void *)(v0 + 216);
      uint64_t v23 = swift_task_alloc();
      *(void *)(v23 + 16) = v2;
      *(void *)(v23 + 24) = v19;
      sub_24A004650((void (*)(void *__return_ptr))sub_24A0111C4, v23);
      swift_task_dealloc();
      sub_24A057B08();
      sub_24A057EE8();
      sub_24A057EE8();
      uint64_t v24 = sub_24A057F18();
      MEMORY[0x24C5B9330](v24);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
      *(void *)(v0 + 304) = v25;
      *(void *)(v0 + 312) = (v22 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v25(v20, v21);
      *(void *)(v0 + 120) = 0;
      *(void *)(v0 + 112) = 0;
      *(unsigned char *)(v0 + 128) = 1;
      sub_24A057DA8();
      uint64_t v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v26;
      uint64_t v27 = sub_24A006908(&qword_2697515A8, MEMORY[0x263F8F710]);
      *uint64_t v26 = v0;
      v26[1] = sub_24A00E0E0;
      uint64_t v28 = *(void *)(v0 + 232);
      uint64_t v29 = *(void *)(v0 + 200);
      uint64_t v30 = *(void *)(v0 + 184);
      return MEMORY[0x270FA1FF8](v28, v0 + 112, v29, v30, v27);
    }
  }
  **(unsigned char **)(v0 + 136) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_24A00E0E0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[38];
  if (v0)
  {
    uint64_t v4 = v2[29];
    uint64_t v5 = v2[26];
    (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
    v3(v4, v5);
    uint64_t v6 = sub_24A00E7B8;
  }
  else
  {
    uint64_t v7 = v2[29];
    uint64_t v8 = v2[26];
    (*(void (**)(void, void))(v2[24] + 8))(v2[25], v2[23]);
    v3(v7, v8);
    uint64_t v6 = sub_24A00E25C;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24A00E25C()
{
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v0 + 272);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if ((sub_24A057698() & 1) == 0)
  {
    uint64_t Strong = swift_weakLoadStrong();
    *(void *)(v0 + 296) = Strong;
    if (Strong)
    {
      uint64_t v5 = Strong;
      uint64_t v6 = *(void *)(v0 + 240);
      uint64_t v34 = *(void *)(v0 + 248);
      uint64_t v7 = type metadata accessor for OverrideTime(0);
      uint64_t v8 = *(void *)(v7 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
      uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v5 + 40) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v9);
      swift_endAccess();
      uint64_t v10 = v5 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
      swift_beginAccess();
      sub_249F6E790(v6, &qword_269751398);
      sub_249F6E6C8(v10, v6, &qword_269751398);
      swift_endAccess();
      swift_beginAccess();
      os_unfair_lock_unlock(v9);
      swift_endAccess();
      sub_249F6E664(v6, v34, &qword_269751398);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v34, 1, v7))
      {
        uint64_t v11 = *(void *)(v0 + 264);
        uint64_t v12 = *(void *)(v0 + 272);
        uint64_t v13 = *(void *)(v0 + 256);
        sub_249F6E790(*(void *)(v0 + 248), &qword_269751398);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v13, 1, 1, v11);
      }
      else
      {
        uint64_t v17 = *(void *)(v0 + 272);
        uint64_t v16 = *(void *)(v0 + 280);
        uint64_t v19 = *(void *)(v0 + 256);
        uint64_t v18 = *(void *)(v0 + 264);
        uint64_t v20 = *(void *)(v0 + 248);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v20, v18);
        sub_249F6E790(v20, &qword_269751398);
        sub_24A057EE8();
        sub_24A057EE8();
        sub_24A056188();
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v19, 0, 1, v18);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v19, 1, v18) != 1)
        {
          (*(void (**)(void, void, void))(*(void *)(v0 + 272) + 32))(*(void *)(v0 + 288), *(void *)(v0 + 256), *(void *)(v0 + 264));
          goto LABEL_10;
        }
      }
      uint64_t v21 = *(void *)(v0 + 256);
      sub_24A0561F8();
      sub_249F6E790(v21, &qword_2697515A0);
LABEL_10:
      uint64_t v22 = *(void *)(v0 + 288);
      uint64_t v23 = *(void *)(v0 + 224);
      uint64_t v24 = *(void *)(v0 + 208);
      uint64_t v25 = *(void *)(v0 + 216);
      uint64_t v26 = swift_task_alloc();
      *(void *)(v26 + 16) = v5;
      *(void *)(v26 + 24) = v22;
      sub_24A004650((void (*)(void *__return_ptr))sub_24A0111C4, v26);
      swift_task_dealloc();
      sub_24A057B08();
      sub_24A057EE8();
      sub_24A057EE8();
      uint64_t v27 = sub_24A057F18();
      MEMORY[0x24C5B9330](v27);
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      *(void *)(v0 + 304) = v28;
      *(void *)(v0 + 312) = (v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v28(v23, v24);
      *(void *)(v0 + 120) = 0;
      *(void *)(v0 + 112) = 0;
      *(unsigned char *)(v0 + 128) = 1;
      sub_24A057DA8();
      uint64_t v29 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v29;
      uint64_t v30 = sub_24A006908(&qword_2697515A8, MEMORY[0x263F8F710]);
      *uint64_t v29 = v0;
      v29[1] = sub_24A00E0E0;
      uint64_t v31 = *(void *)(v0 + 232);
      uint64_t v32 = *(void *)(v0 + 200);
      uint64_t v33 = *(void *)(v0 + 184);
      return MEMORY[0x270FA1FF8](v31, v0 + 112, v32, v33, v30);
    }
  }
  **(unsigned char **)(v0 + 136) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_24A00E7B8()
{
  uint64_t v1 = v0[36];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[33];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_24A00E8AC@<X0>(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  uint64_t v4 = sub_24A00BE20(v11);
  uint64_t v6 = v5;
  uint64_t v7 = type metadata accessor for OverrideTime(0);
  int v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!v8)
  {
    uint64_t v9 = sub_24A056238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v6, a1, v9);
  }
  uint64_t result = ((uint64_t (*)(void *, void))v4)(v11, 0);
  *a2 = v8 != 0;
  return result;
}

uint64_t sub_24A00E9A0()
{
  sub_249FCFFE8(v0 + 16);
  swift_release();
  swift_release();
  sub_249F6E790(v0 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime, &qword_269751398);
  swift_release();
  sub_249F6E790(v0 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_initializationTime, &qword_2697515A0);

  return swift_deallocClassInstance();
}

uint64_t _s11ClockPoster10TimeStringV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_24A057D48() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (sub_24A057D48() & 1) == 0
    || a1[4] != a2[4]
    || a1[5] != a2[5]
    || (a1[6] != a2[6] || a1[7] != a2[7]) && (sub_24A057D48() & 1) == 0)
  {
    return 0;
  }
  if (a1[8] != a2[8]) {
    return 0;
  }
  if (a1[9] != a2[9]) {
    return 0;
  }
  uint64_t v6 = type metadata accessor for TimeString(0);
  if ((MEMORY[0x24C5B7BF0]((char *)a1 + *(int *)(v6 + 36), (char *)a2 + *(int *)(v6 + 36)) & 1) == 0) {
    return 0;
  }

  return sub_24A0561D8();
}

void *sub_24A00EB70(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751650);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v8 + *(void *)(*(void *)v8 + 96), 1, 1, v4);
  uint64_t v9 = *(void *)(*(void *)v8 + 104);
  type metadata accessor for CPUnfairLock();
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  *(void *)(v8 + v9) = v10;
  *(void *)(v8 + *(void *)(*(void *)v8 + 112)) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v8 + *(void *)(*(void *)v8 + 120)) = 0;
  a2[4] = v8;
  uint64_t v11 = sub_24A056238();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751658);
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = 0;
  v12[2] = v13;
  sub_249F6E664((uint64_t)v7, (uint64_t)v12 + *(void *)(*v12 + 96), &qword_2697515A0);
  a2[5] = v12;
  a2[2] = a1;
  a2[3] = &off_26FDEB8E0;
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  sub_24A02B6FC((uint64_t)sub_24A01192C, v14);
  swift_release_n();
  return a2;
}

uint64_t _s11ClockPoster10TimeStringV1loiySbAC_ACtFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_24A056238();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TimeString(0);
  v13[1] = a1;
  sub_24A056228();
  uint64_t v6 = sub_24A0563A8();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v3 + 8);
  v7(v5, v2);
  sub_24A056228();
  uint64_t v8 = sub_24A0563A8();
  v7(v5, v2);
  if (v6 == v8)
  {
    char v9 = sub_24A0561B8();
  }
  else
  {
    sub_24A056228();
    uint64_t v10 = sub_24A0563A8();
    v7(v5, v2);
    sub_24A056228();
    uint64_t v11 = sub_24A0563A8();
    v7(v5, v2);
    char v9 = v10 < v11;
  }
  return v9 & 1;
}

unint64_t sub_24A00EFC4()
{
  unint64_t result = qword_2697513E0;
  if (!qword_2697513E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697513E0);
  }
  return result;
}

uint64_t sub_24A00F018()
{
  return sub_249F6EE60(&qword_2697513E8, &qword_2697513F0);
}

unint64_t sub_24A00F054(uint64_t a1)
{
  unint64_t result = sub_24A00F07C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A00F07C()
{
  unint64_t result = qword_2697513F8;
  if (!qword_2697513F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697513F8);
  }
  return result;
}

uint64_t sub_24A00F0D0()
{
  return sub_24A006908((unint64_t *)&unk_269751400, (void (*)(uint64_t))type metadata accessor for TimeString);
}

uint64_t type metadata accessor for TimeString(uint64_t a1)
{
  return sub_249F95920(a1, qword_269751420);
}

unsigned char *storeEnumTagSinglePayload for ClockTimeInterval(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A00F20CLL);
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

ValueMetadata *type metadata accessor for ClockTimeInterval()
{
  return &type metadata for ClockTimeInterval;
}

uint64_t *initializeBufferWithCopyOfBuffer for OverrideTime(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24A056238();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    char v9 = (_OWORD *)((char *)a1 + v8);
    uint64_t v10 = (_OWORD *)((char *)a2 + v8);
    long long v11 = v10[1];
    _OWORD *v9 = *v10;
    v9[1] = v11;
  }
  return a1;
}

uint64_t initializeWithCopy for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  char v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t assignWithCopy for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  char v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  return a1;
}

uint64_t initializeWithTake for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  char v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t assignWithTake for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (_OWORD *)(a1 + v7);
  char v9 = (_OWORD *)(a2 + v7);
  long long v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  return a1;
}

uint64_t getEnumTagSinglePayload for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A00F554);
}

uint64_t sub_24A00F554(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for OverrideTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A00F5D4);
}

uint64_t sub_24A00F5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_24A00F644()
{
  uint64_t result = sub_24A056238();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OverrideTime.AdvancingRate()
{
  return &type metadata for OverrideTime.AdvancingRate;
}

void *initializeBufferWithCopyOfBuffer for TimeString(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = *(int *)(a3 + 36);
    uint64_t v20 = a1 + v10;
    uint64_t v11 = (uint64_t)a2 + v10;
    *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
    uint64_t v12 = sub_24A0563F8();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v20, v11, v12);
    uint64_t v14 = *(int *)(a3 + 40);
    uint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_24A056238();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v4;
}

uint64_t destroy for TimeString(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_24A0563F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  uint64_t v7 = sub_24A056238();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t initializeWithCopy for TimeString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v18 = a1 + v9;
  uint64_t v10 = a2 + v9;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v11 = sub_24A0563F8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v18, v10, v11);
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

void *assignWithCopy for TimeString(void *a1, void *a2, uint64_t a3)
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
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24A056238();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for TimeString(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  long long v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_24A056238();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for TimeString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v9 = *(int *)(a3 + 36);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24A0563F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A00FDB0);
}

uint64_t sub_24A00FDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24A0563F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24A056238();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for TimeString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A00FEF0);
}

uint64_t sub_24A00FEF0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_24A0563F8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24A056238();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_24A01001C()
{
  uint64_t result = sub_24A0563F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24A056238();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24A010100()
{
  return type metadata accessor for Clock(0);
}

uint64_t type metadata accessor for Clock(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269751438);
}

void sub_24A010128()
{
  sub_24A01045C(319, &qword_269751448, (void (*)(uint64_t))type metadata accessor for OverrideTime);
  if (v0 <= 0x3F)
  {
    sub_24A056238();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for Clock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Clock);
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Clock.now_debugString.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of Clock.isOverriding.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of Clock.overrideTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Clock.overrideTime.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of Clock.overrideTime.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of Clock.currentTime(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t type metadata accessor for AtomicClock()
{
  return self;
}

uint64_t sub_24A010370()
{
  return type metadata accessor for TextClock(0);
}

uint64_t type metadata accessor for TextClock(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_2697514D0);
}

void sub_24A010398()
{
  sub_24A01045C(319, (unint64_t *)&qword_2697514E0, MEMORY[0x263F07490]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A01045C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24A057968();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_24A0104B0()
{
  return type metadata accessor for OverrideClock(0);
}

uint64_t type metadata accessor for OverrideClock(uint64_t a1)
{
  return sub_249F95920(a1, qword_269751500);
}

void sub_24A0104D8()
{
  sub_24A01045C(319, &qword_269751448, (void (*)(uint64_t))type metadata accessor for OverrideTime);
  if (v0 <= 0x3F)
  {
    sub_24A01045C(319, (unint64_t *)&qword_2697514E0, MEMORY[0x263F07490]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t *sub_24A0105FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_24A0563F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_24A0106C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_24A0563F8();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *sub_24A010730(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *sub_24A0107AC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *sub_24A010828(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_24A0108A4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_24A0563F8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_24A010920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A010934);
}

uint64_t sub_24A010934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_24A0563F8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t sub_24A0109A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A0109B8);
}

uint64_t sub_24A0109B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_24A0563F8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t type metadata accessor for TextClockDescriptor(uint64_t a1)
{
  return sub_249F95920(a1, qword_269751518);
}

uint64_t sub_24A010A4C()
{
  uint64_t result = sub_24A0563F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for OverrideTime.CodingKeys()
{
  return &type metadata for OverrideTime.CodingKeys;
}

unsigned char *_s11ClockPoster12OverrideTimeV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24A010BCCLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for OverrideTime.AdvancingRate.CodingKeys()
{
  return &type metadata for OverrideTime.AdvancingRate.CodingKeys;
}

unint64_t sub_24A010C08()
{
  unint64_t result = qword_269751530;
  if (!qword_269751530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751530);
  }
  return result;
}

unint64_t sub_24A010C60()
{
  unint64_t result = qword_269751538;
  if (!qword_269751538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751538);
  }
  return result;
}

uint64_t sub_24A010CB4(uint64_t a1)
{
  uint64_t result = sub_24A006908(&qword_269751540, (void (*)(uint64_t))type metadata accessor for TextClockDescriptor);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24A010D0C()
{
  return sub_24A006908(&qword_269751548, (void (*)(uint64_t))type metadata accessor for TextClockDescriptor);
}

unint64_t sub_24A010D58()
{
  unint64_t result = qword_269751550;
  if (!qword_269751550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751550);
  }
  return result;
}

unint64_t sub_24A010DB0()
{
  unint64_t result = qword_269751558;
  if (!qword_269751558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751558);
  }
  return result;
}

unint64_t sub_24A010E08()
{
  unint64_t result = qword_269751560;
  if (!qword_269751560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751560);
  }
  return result;
}

unint64_t sub_24A010E60()
{
  unint64_t result = qword_269751568;
  if (!qword_269751568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751568);
  }
  return result;
}

uint64_t sub_24A010EB4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74657366666FLL && a2 == 0xE600000000000000;
  if (v2 || (sub_24A057D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A057D48();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24A010FA0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v2 || (sub_24A057D48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69636E61766461 && a2 == 0xED00006574615267)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A057D48();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24A0110A8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A0110E0()
{
  return objectdestroy_50Tm(72);
}

uint64_t sub_24A0110E8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_249F6C87C;
  return sub_24A00D980(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24A0111C4@<X0>(BOOL *a1@<X8>)
{
  return sub_24A00E8AC(*(void *)(v1 + 24), a1);
}

uint64_t sub_24A0111CC()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void *sub_24A0111DC()
{
  uint64_t v1 = *(unsigned char **)(v0 + 16);
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v0 + 24))(&v3);
  *uint64_t v1 = v3;
  v1[1] = 0;
  return result;
}

uint64_t sub_24A011220()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_24A011248(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A0112B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A011318()
{
  uint64_t v1 = (int *)(type metadata accessor for TimeString(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = (int *)(type metadata accessor for TextClockDescriptor(0) - 8);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v16 = v7 + *(void *)(*(void *)v5 + 64);
  uint64_t v8 = v2 | v6 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v9 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v0 + v3 + v1[11];
  uint64_t v11 = sub_24A0563F8();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  uint64_t v13 = v9 + v1[12];
  uint64_t v14 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v12(v0 + v5[7] + v7, v11);

  return MEMORY[0x270FA0238](v0, v16, v8);
}

uint64_t sub_24A011508()
{
  uint64_t v2 = *(void *)(type metadata accessor for TimeString(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for TextClockDescriptor(0) - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[3] = v8;
  v10[4] = v9;
  v10[1] = sub_249F9C6C0;
  v10[2] = v7;
  return MEMORY[0x270FA2498](sub_24A0086D8, 0, 0);
}

uint64_t sub_24A011654(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A0116B4()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A0116C4()
{
  return sub_24A00481C(*(void *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24));
}

uint64_t sub_24A0116D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A0116E0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_24A011718(uint64_t a1)
{
  return sub_24A009494(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_24A011724()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24A011734()
{
  return sub_24A009620();
}

uint64_t sub_24A01173C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A011774(uint64_t a1)
{
  return sub_24A00973C(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_24A01177C()
{
  return objectdestroy_50Tm(41);
}

uint64_t sub_24A011784(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_249F9C6C0;
  return sub_24A0084BC(a1, v4, v5, v6, v7);
}

uint64_t sub_24A011848()
{
  return objectdestroy_50Tm(41);
}

uint64_t sub_24A011850(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_249F9C6C0;
  return sub_24A008228(a1, v4, v5, v6, v7);
}

uint64_t sub_24A011914()
{
  return sub_24A008764(v0[2], v0[3], v0[4]);
}

uint64_t sub_24A011920(unsigned __int8 *a1, uint64_t a2)
{
  return sub_24A0088FC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(char **)(v2 + 32));
}

uint64_t sub_24A01192C(uint64_t a1)
{
  return sub_24A0269B0(a1);
}

uint64_t sub_24A011934()
{
  return objectdestroy_50Tm(40);
}

uint64_t sub_24A01193C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_249F9C6C0;
  return sub_24A007C78(a1, v4, v5, v6);
}

uint64_t sub_24A0119F0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A011A38(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_249F6C87C;
  return sub_24A00C4A4(a1, v4, v5, v7, v6);
}

uint64_t sub_24A011AF8()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v5 = sub_24A056238();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24A011C28(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_249F9C6C0;
  return sub_24A00D040(a1, v5, v6, v7, v8);
}

uint64_t sub_24A011D28(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_249F9C6C0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269752190 + dword_269752190);
  return v6(a1, v4);
}

uint64_t sub_24A011E44(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4B72656874616577;
  }
  else {
    uint64_t v3 = 0x6C616E7265746E69;
  }
  if (v2) {
    unint64_t v4 = 0xEA00000000004955;
  }
  else {
    unint64_t v4 = 0xEA00000000007469;
  }
  if (a2) {
    uint64_t v5 = 0x4B72656874616577;
  }
  else {
    uint64_t v5 = 0x6C616E7265746E69;
  }
  if (a2) {
    unint64_t v6 = 0xEA00000000007469;
  }
  else {
    unint64_t v6 = 0xEA00000000004955;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24A057D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A011EF4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1802465132;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1802465132;
  switch(v4)
  {
    case 1:
      unsigned int v6 = 1701998438;
      goto LABEL_4;
    case 2:
      unsigned int v6 = 1801675106;
LABEL_4:
      uint64_t v5 = v6 | 0x756F726700000000;
      unint64_t v3 = 0xEE0064656553646ELL;
      break;
    case 3:
      uint64_t v5 = 0x6D69546573696F6ELL;
      unint64_t v3 = 0xE900000000000065;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEE0064656553646ELL;
      if (v5 == 0x756F726765726F66) {
        goto LABEL_13;
      }
      goto LABEL_15;
    case 2:
      uint64_t v2 = 0x756F72676B636162;
      unint64_t v7 = 0xEE0064656553646ELL;
      goto LABEL_10;
    case 3:
      unint64_t v7 = 0xE900000000000065;
      if (v5 == 0x6D69546573696F6ELL) {
        goto LABEL_13;
      }
      goto LABEL_15;
    default:
LABEL_10:
      if (v5 != v2) {
        goto LABEL_15;
      }
LABEL_13:
      if (v3 == v7) {
        char v8 = 1;
      }
      else {
LABEL_15:
      }
        char v8 = sub_24A057D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t sub_24A012094(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6C617469676964;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6C617469676964;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x676F6C616E61;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x646C726F77;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x72616C6F73;
      break;
    case 4:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 2036427888;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE600000000000000;
      if (v5 == 0x676F6C616E61) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x646C726F77) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x72616C6F73;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 2036427888) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24A057D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24A012238(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 1684957547;
  }
  else {
    uint64_t v2 = 1802465132;
  }
  if (a2) {
    uint64_t v3 = 1684957547;
  }
  else {
    uint64_t v3 = 1802465132;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_24A057D48();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_24A0122A8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x6E65644965707974;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEE00726569666974;
    }
    else {
      unint64_t v4 = 0x800000024A062E40;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x6E65644965707974;
      }
      else {
        unint64_t v6 = 0xD000000000000010;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEE00726569666974;
      }
      else {
        unint64_t v7 = 0x800000024A062E40;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE600000000000000;
    unint64_t v3 = 0x73726F6C6F63;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE600000000000000;
  if (v3 != 0x73726F6C6F63)
  {
LABEL_21:
    char v8 = sub_24A057D48();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24A0123D4(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000012;
  unint64_t v4 = 0x800000024A062D00;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000013;
      unint64_t v4 = 0x800000024A062D20;
      break;
    case 2:
      int v5 = "SOLAR_CLOCK_TITLE";
      goto LABEL_6;
    case 3:
      int v5 = "WORLD_CLOCK_TITLE";
      goto LABEL_6;
    case 4:
      int v5 = "FLOAT_CLOCK_TITLE";
LABEL_6:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000011;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000012;
  unint64_t v7 = 0x800000024A062D00;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xD000000000000013;
      unint64_t v7 = 0x800000024A062D20;
      break;
    case 2:
      char v8 = "SOLAR_CLOCK_TITLE";
      goto LABEL_12;
    case 3:
      char v8 = "WORLD_CLOCK_TITLE";
      goto LABEL_12;
    case 4:
      char v8 = "FLOAT_CLOCK_TITLE";
LABEL_12:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v6 = 0xD000000000000011;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_24A057D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_24A012564(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 0x7265646E6572;
    }
    else {
      uint64_t v2 = 0x657461647075;
    }
    unint64_t v3 = 0xE600000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 0x7265646E6572;
      }
      else {
        uint64_t v5 = 0x657461647075;
      }
      unint64_t v6 = 0xE600000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE400000000000000;
    uint64_t v2 = 1953064037;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE400000000000000;
  if (v2 != 1953064037)
  {
LABEL_15:
    char v7 = sub_24A057D48();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A012660(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x746E6569626D61;
  }
  else {
    uint64_t v3 = 7368801;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE700000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x746E6569626D61;
  }
  else {
    uint64_t v5 = 7368801;
  }
  if (a2) {
    unint64_t v6 = 0xE700000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_24A057D48();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A012700(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 1802465132;
    }
    else {
      uint64_t v2 = 1684957547;
    }
    unint64_t v3 = 0xE400000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 1802465132;
      }
      else {
        uint64_t v5 = 1684957547;
      }
      unint64_t v6 = 0xE400000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE700000000000000;
    uint64_t v2 = 0x747865746E6F63;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE700000000000000;
  if (v2 != 0x747865746E6F63)
  {
LABEL_15:
    char v7 = sub_24A057D48();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A0127FC(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEE00656C62617A69;
  uint64_t v3 = 0x6D6F747375636E75;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6D6F747375636E75;
  unint64_t v6 = 0xEE00656C62617A69;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v5 = 0x726F6C6F63;
      break;
    case 2:
      uint64_t v5 = 0x746E656964617267;
      unint64_t v6 = 0xEE0079617272615FLL;
      break;
    case 3:
      uint64_t v5 = 0x6E6F5474696C7073;
      unint64_t v6 = 0xED0000625F615F65;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      if (v5 == 0x726F6C6F63) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v3 = 0x746E656964617267;
      unint64_t v2 = 0xEE0079617272615FLL;
      goto LABEL_9;
    case 3:
      unint64_t v2 = 0xED0000625F615F65;
      if (v5 == 0x6E6F5474696C7073) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v3) {
        goto LABEL_14;
      }
LABEL_12:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_24A057D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

unint64_t sub_24A0129CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751780);
  unint64_t v2 = (void *)sub_24A057C08();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_24A015260((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

unint64_t sub_24A012ACC(uint64_t a1)
{
  return sub_24A013094(a1, &qword_26974FA08, &qword_269751778, (uint64_t (*)(uint64_t))sub_24A015260);
}

unint64_t sub_24A012AF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697517A8);
  unint64_t v2 = (void *)sub_24A057C08();
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
    swift_unknownObjectRetain();
    unint64_t result = sub_24A0152F0(v5, v6);
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

unint64_t sub_24A012C10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751788);
  unint64_t v2 = (void *)sub_24A057C08();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_24A015260((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_24A012D1C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697517C0);
  unint64_t v2 = (void *)sub_24A057C08();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_24A015524((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_24A012E28(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751188);
  uint64_t v2 = sub_24A057C08();
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
    sub_249F6E6C8(v6, (uint64_t)&v15, &qword_2697517B8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24A0152F0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_24A016D5C((uint64_t)&v17, v3[7] + 32 * result);
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

unint64_t sub_24A012F60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751798);
  uint64_t v2 = (void *)sub_24A057C08();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_24A015260((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_24A01306C(uint64_t a1)
{
  return sub_24A013094(a1, &qword_26974FA18, &qword_2697517E0, (uint64_t (*)(uint64_t))sub_24A015524);
}

unint64_t sub_24A013094(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    char v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_24A057C08();
  char v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_249F6E6C8(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_249F71780(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

unint64_t sub_24A0131C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697517B0);
  uint64_t v2 = (void *)sub_24A057C08();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v7 = v4[1];
    uint64_t v8 = v4[2];
    uint64_t v9 = v4[3];
    uint64_t v10 = v4[4];
    uint64_t v11 = (void *)v4[5];
    swift_bridgeObjectRetain();
    id v12 = v11;
    unint64_t result = sub_24A0152F0(v5, v6);
    if (v14) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v15 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v15 = v5;
    v15[1] = v6;
    BOOL v16 = (uint64_t *)(v2[7] + 40 * result);
    *BOOL v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    v16[4] = (uint64_t)v12;
    uint64_t v17 = v2[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v2[2] = v19;
    v4 += 7;
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

unint64_t sub_24A013308(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697517C8);
  uint64_t v2 = sub_24A057C08();
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
    sub_249F6E6C8(v6, (uint64_t)v15, &qword_2697517D0);
    unint64_t result = sub_24A015754((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_249F71780(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t ClockPosterConfiguration.init(look:kind:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = *a2;
  uint64_t result = sub_249F7B58C(a1, a3);
  *(unsigned char *)(a3 + 97) = v4;
  return result;
}

uint64_t ClockPosterConfiguration.init(defaultLookForKind:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + 97) = *a1;
  uint64_t result = ClockFaceKind.suggestedLooks.getter();
  if (*(void *)(result + 16))
  {
    sub_249F75B7C(result + 32, a2);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ClockPosterConfiguration.look.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249F75B7C(v1, a1);
}

uint64_t ClockPosterConfiguration.look.setter(uint64_t a1)
{
  return sub_249F9AAB8(a1, v1);
}

uint64_t (*ClockPosterConfiguration.look.modify())()
{
  return CGSizeMake;
}

void ClockPosterConfiguration.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 97);
}

unsigned char *ClockPosterConfiguration.kind.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 97) = *result;
  return result;
}

uint64_t (*ClockPosterConfiguration.kind.modify())()
{
  return CGSizeMake;
}

uint64_t ClockPosterConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751730);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A013760();
  sub_24A057EB8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v13 = 0;
  sub_249F9AB68();
  sub_24A057C88();
  sub_249F7B58C((uint64_t)v11, (uint64_t)v12);
  char v13 = 1;
  sub_249FA0984();
  sub_24A057C88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12[97] = v11[0];
  sub_249F7B05C((uint64_t)v12, a2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return sub_249F7AA40((uint64_t)v12);
}

unint64_t sub_24A013760()
{
  unint64_t result = qword_269751738;
  if (!qword_269751738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751738);
  }
  return result;
}

uint64_t ClockPosterConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751740);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A013760();
  sub_24A057EC8();
  v10[15] = *(unsigned char *)(v3 + 97);
  v10[14] = 1;
  sub_249FA0AE8();
  sub_24A057CD8();
  if (!v2)
  {
    v10[13] = 0;
    sub_249F9ABBC();
    sub_24A057CD8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24A01393C(char *a1, char *a2)
{
  return sub_24A012238(*a1, *a2);
}

uint64_t sub_24A013948()
{
  return sub_24A057E68();
}

uint64_t sub_24A0139B0()
{
  sub_24A057408();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A0139FC()
{
  return sub_24A057E68();
}

uint64_t sub_24A013A60@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A057C38();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24A013AC0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1802465132;
  if (*v1) {
    uint64_t v2 = 1684957547;
  }
  *a1 = v2;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_24A013AE8()
{
  if (*v0) {
    return 1684957547;
  }
  else {
    return 1802465132;
  }
}

uint64_t sub_24A013B0C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A057C38();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_24A013B70(uint64_t a1)
{
  unint64_t v2 = sub_24A013760();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A013BAC(uint64_t a1)
{
  unint64_t v2 = sub_24A013760();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static ClockPosterConfiguration.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((_s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  char v4 = *(unsigned char *)(a2 + 97);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 97);

  return sub_24A012094(v5, v4);
}

uint64_t sub_24A013C3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ClockPosterConfiguration.init(from:)(a1, a2);
}

uint64_t sub_24A013C54(void *a1)
{
  return ClockPosterConfiguration.encode(to:)(a1);
}

uint64_t sub_24A013C6C(uint64_t a1, uint64_t a2)
{
  if ((_s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  char v4 = *(unsigned char *)(a2 + 97);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 97);

  return sub_24A012094(v5, v4);
}

__n128 static ClockPosterConfiguration.configuration(from:kind:)@<Q0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)&v43 - v12;
  uint64_t v14 = sub_24A056538();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  long long v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v43 - v19;
  char v21 = *a3;
  if (a2 >> 60 == 15)
  {
    HIBYTE(v51) = *a3;
    v49[0] = v21;
    uint64_t v22 = ClockFaceKind.suggestedLooks.getter();
    if (*(void *)(v22 + 16))
    {
      sub_249F75B7C(v22 + 32, (uint64_t)v50);
      swift_bridgeObjectRelease();
      if (qword_26B16F9B8 == -1)
      {
LABEL_4:
        uint64_t v23 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_configuration_private;
        swift_beginAccess();
        sub_249F6E6C8(v23, (uint64_t)v10, &qword_26B16FAA8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
        {
          sub_249FB8AA8((uint64_t)v17);
          sub_249F6E790((uint64_t)v10, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v10, v14);
        }
        sub_249F7B05C((uint64_t)v50, (uint64_t)v49);
        uint64_t v33 = sub_24A056518();
        os_log_type_t v34 = sub_24A057798();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v35 = swift_slowAlloc();
          uint64_t v46 = v15;
          uint64_t v36 = (uint8_t *)v35;
          uint64_t v37 = swift_slowAlloc();
          uint64_t v48 = v37;
          *(_DWORD *)uint64_t v36 = 136446210;
          uint64_t v38 = sub_249F746E8();
          uint64_t v47 = sub_249F782DC(v38, v39, &v48);
          sub_24A057978();
          swift_bridgeObjectRelease();
          sub_249F7AA40((uint64_t)v49);
          _os_log_impl(&dword_249F61000, v33, v34, "Loading default configuration:\n %{public}s", v36, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5BA360](v37, -1, -1);
          MEMORY[0x24C5BA360](v36, -1, -1);

          (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v14);
        }
        else
        {
          sub_249F7AA40((uint64_t)v49);

          (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        }
        goto LABEL_18;
      }
    }
    else
    {
      __break(1u);
    }
    swift_once();
    goto LABEL_4;
  }
  v49[0] = *a3;
  sub_249F7B434(a1, a2);
  sub_24A014334((uint64_t)v50);
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_configuration_private;
  swift_beginAccess();
  sub_249F6E6C8(v24, (uint64_t)v13, &qword_26B16FAA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_249FB8AA8((uint64_t)v20);
    sub_249F6E790((uint64_t)v13, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
  }
  sub_249F7B05C((uint64_t)v50, (uint64_t)v49);
  uint64_t v25 = sub_24A056518();
  os_log_type_t v26 = sub_24A057798();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v46 = v15;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v45 = v14;
    uint64_t v30 = v29;
    uint64_t v48 = v29;
    *(_DWORD *)uint64_t v28 = 136446210;
    uint64_t v44 = a1;
    uint64_t v31 = sub_249F746E8();
    uint64_t v47 = sub_249F782DC(v31, v32, &v48);
    sub_24A057978();
    swift_bridgeObjectRelease();
    sub_249F7AA40((uint64_t)v49);
    _os_log_impl(&dword_249F61000, v25, v26, "Loading existing configuration:\n %{public}s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v30, -1, -1);
    MEMORY[0x24C5BA360](v28, -1, -1);
    sub_24A0163A0(v44, a2);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v20, v45);
  }
  else
  {
    sub_249F7AA40((uint64_t)v49);
    sub_24A0163A0(a1, a2);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
  }
LABEL_18:
  long long v40 = v50[5];
  *(_OWORD *)(a4 + 64) = v50[4];
  *(_OWORD *)(a4 + 80) = v40;
  *(_WORD *)(a4 + 96) = v51;
  long long v41 = v50[1];
  *(_OWORD *)a4 = v50[0];
  *(_OWORD *)(a4 + 16) = v41;
  __n128 result = (__n128)v50[3];
  *(_OWORD *)(a4 + 32) = v50[2];
  *(__n128 *)(a4 + 48) = result;
  return result;
}

__n128 sub_24A014334@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24A056538();
  MEMORY[0x270FA5388](v3);
  sub_24A055FA8();
  swift_allocObject();
  sub_24A055F98();
  sub_24A016E20();
  sub_24A055F88();
  swift_release();
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 80) = v10;
  *(_WORD *)(a1 + 96) = v11;
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
  __n128 result = v8;
  *(_OWORD *)(a1 + 32) = v7;
  *(__n128 *)(a1 + 48) = v8;
  return result;
}

uint64_t static ClockPosterConfiguration.configuration(from:kind:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = *a2;
  if (!a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
LABEL_14:
    sub_249F6E790((uint64_t)&v13, &qword_2697504A8);
    uint64_t v9 = 0;
    unint64_t v10 = 0xF000000000000000;
    goto LABEL_15;
  }
  *(void *)&long long v13 = 0xD000000000000012;
  *((void *)&v13 + 1) = 0x800000024A064D60;
  sub_24A057A18();
  if (*(void *)(a1 + 16) && (unint64_t v6 = sub_24A015754((uint64_t)v12), (v7 & 1) != 0))
  {
    sub_249F7B110(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }
  sub_24A0163B4((uint64_t)v12);
  if (!*((void *)&v14 + 1)) {
    goto LABEL_14;
  }
  int v8 = swift_dynamicCast();
  if (v8) {
    uint64_t v9 = v12[0];
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    unint64_t v10 = v12[1];
  }
  else {
    unint64_t v10 = 0xF000000000000000;
  }
LABEL_15:
  LOBYTE(v12[0]) = v4;
  static ClockPosterConfiguration.configuration(from:kind:)(v9, v10, (char *)v12, a3);
  return sub_24A0163A0(v9, v10);
}

unint64_t ClockPosterConfiguration.dictionaryRepresentation.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_24A056538();
  MEMORY[0x270FA5388](v1);
  sub_24A055FE8();
  swift_allocObject();
  sub_24A055FD8();
  sub_24A055FB8();
  sub_24A016408();
  uint64_t v2 = sub_24A055FC8();
  unint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751750);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A05A510;
  sub_249F7B434(v2, v4);
  sub_24A057A18();
  *(void *)(inited + 96) = MEMORY[0x263F06F78];
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 80) = v4;
  unint64_t v6 = sub_24A013308(inited);
  sub_249F7B48C(v2, v4);
  swift_release();
  return v6;
}

uint64_t ClockPosterConfiguration.data.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_24A056538();
  MEMORY[0x270FA5388](v1);
  sub_24A055FE8();
  swift_allocObject();
  sub_24A055FD8();
  sub_24A055FB8();
  sub_24A016408();
  uint64_t v2 = sub_24A055FC8();
  swift_release();
  return v2;
}

unint64_t sub_24A0150F4(uint64_t a1)
{
  sub_24A056268();
  sub_24A016C54(&qword_269750B70, MEMORY[0x263F07508]);
  uint64_t v2 = sub_24A057308();

  return sub_24A015798(a1, v2);
}

unint64_t sub_24A01518C(double *a1)
{
  sub_24A057E28();
  sub_24A057E58();
  type metadata accessor for TextClockDescriptor(0);
  sub_24A0563F8();
  sub_24A016C54((unint64_t *)&unk_269751570, MEMORY[0x263F079C8]);
  sub_24A057318();
  uint64_t v2 = sub_24A057E68();

  return sub_24A015958(a1, v2);
}

unint64_t sub_24A015260(uint64_t a1)
{
  sub_24A0573A8();
  sub_24A057E28();
  sub_24A057408();
  uint64_t v2 = sub_24A057E68();
  swift_bridgeObjectRelease();
  return sub_24A015F1C(a1, v2);
}

unint64_t sub_24A0152F0(uint64_t a1, uint64_t a2)
{
  sub_24A057E28();
  sub_24A057408();
  uint64_t v4 = sub_24A057E68();

  return sub_24A015AB4(a1, a2, v4);
}

unint64_t sub_24A015368(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x24C5B9620](*(void *)(v1 + 40), a1, 4);

  return sub_24A015B98(a1, v3);
}

unint64_t sub_24A0153B0(uint64_t a1)
{
  sub_24A057E28();
  ClockFaceLook.hash(into:)();
  uint64_t v2 = sub_24A057E68();

  return sub_24A015C34(a1, v2);
}

unint64_t sub_24A01541C(unsigned __int8 a1)
{
  sub_24A057E28();
  sub_24A057408();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_24A057E68();

  return sub_24A015CFC(a1, v2);
}

unint64_t sub_24A015524(uint64_t a1)
{
  sub_24A0573A8();
  sub_24A057E28();
  sub_24A057408();
  uint64_t v2 = sub_24A057E68();
  swift_bridgeObjectRelease();

  return sub_24A015F1C(a1, v2);
}

unint64_t sub_24A0155B8(double a1, double a2)
{
  sub_24A057E28();
  CLLocationCoordinate2D.hash(into:)();
  uint64_t v4 = sub_24A057E68();

  return sub_24A016094(v4, a1, a2);
}

unint64_t sub_24A01562C(char a1)
{
  sub_24A057E28();
  sub_24A057408();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_24A057E68();

  return sub_24A016108(a1 & 1, v2);
}

unint64_t sub_24A0156DC(char a1)
{
  sub_24A057E28();
  sub_24A057E58();
  uint64_t v2 = sub_24A057E68();

  return sub_24A016248(a1, v2);
}

unint64_t sub_24A015754(uint64_t a1)
{
  uint64_t v2 = sub_24A0579F8();

  return sub_24A0162D8(a1, v2);
}

unint64_t sub_24A015798(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24A056268();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    long long v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    __int16 v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24A016C54(&qword_2697517A0, MEMORY[0x263F07508]);
      char v15 = sub_24A057358();
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

unint64_t sub_24A015958(double *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for TextClockDescriptor(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (double *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_24A016C9C(*(void *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if (*v8 == *a1
        && (MEMORY[0x24C5B7BF0]((char *)v8 + *(int *)(v5 + 20), (char *)a1 + *(int *)(v5 + 20), *v8) & 1) != 0)
      {
        break;
      }
      sub_24A016D00((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        return v10;
      }
    }
    sub_24A016D00((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_24A015AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A057D48() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A057D48() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24A015B98(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_24A015C34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_249F75B7C(*(void *)(v2 + 48) + 104 * v4, (uint64_t)v8);
      char v6 = _s11ClockPoster0A8FaceLookO2eeoiySbAC_ACtFZ_0();
      sub_249F75BD8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24A015CFC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE700000000000000;
      uint64_t v8 = 0x6C617469676964;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x676F6C616E61;
          break;
        case 2:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x646C726F77;
          break;
        case 3:
          unint64_t v7 = 0xE500000000000000;
          uint64_t v8 = 0x72616C6F73;
          break;
        case 4:
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 2036427888;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE700000000000000;
      uint64_t v10 = 0x6C617469676964;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xE600000000000000;
          if (v8 == 0x676F6C616E61) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 2:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x646C726F77) {
            goto LABEL_16;
          }
          goto LABEL_15;
        case 3:
          unint64_t v9 = 0xE500000000000000;
          uint64_t v10 = 0x72616C6F73;
          goto LABEL_14;
        case 4:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 2036427888) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
LABEL_14:
          if (v8 != v10) {
            goto LABEL_16;
          }
LABEL_15:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_16:
          char v11 = sub_24A057D48();
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

unint64_t sub_24A015F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24A0573A8();
    uint64_t v8 = v7;
    if (v6 == sub_24A0573A8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24A057D48();
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
          uint64_t v13 = sub_24A0573A8();
          uint64_t v15 = v14;
          if (v13 == sub_24A0573A8() && v15 == v16) {
            break;
          }
          char v18 = sub_24A057D48();
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

unint64_t sub_24A016094(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a1 & ~v4;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      uint64_t v7 = (double *)(*(void *)(v3 + 48) + 16 * result);
      double v8 = v7[1];
      BOOL v9 = *v7 == a2;
      if (v8 == a3 && v9) {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_24A016108(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    if (a1) {
      uint64_t v6 = 0x4B72656874616577;
    }
    else {
      uint64_t v6 = 0x6C616E7265746E69;
    }
    if (a1) {
      unint64_t v7 = 0xEA00000000007469;
    }
    else {
      unint64_t v7 = 0xEA00000000004955;
    }
    while (1)
    {
      uint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0x4B72656874616577 : 0x6C616E7265746E69;
      unint64_t v9 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? 0xEA00000000007469 : 0xEA00000000004955;
      if (v8 == v6 && v9 == v7) {
        break;
      }
      char v11 = sub_24A057D48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t sub_24A016248(char a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      int v7 = *(unsigned __int8 *)(*(void *)(v2 + 48) + result);
      if (a1)
      {
        if (a1 == 1)
        {
          if (v7 == 1) {
            return result;
          }
        }
        else if (v7 == 2)
        {
          return result;
        }
      }
      else if (!*(unsigned char *)(*(void *)(v2 + 48) + result))
      {
        return result;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_24A0162D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24A016DC4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5B9220](v9, a1);
      sub_24A0163B4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24A0163A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_249F7B48C(a1, a2);
  }
  return a1;
}

uint64_t sub_24A0163B4(uint64_t a1)
{
  return a1;
}

unint64_t sub_24A016408()
{
  unint64_t result = qword_269751748;
  if (!qword_269751748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751748);
  }
  return result;
}

unint64_t sub_24A01645C(uint64_t a1)
{
  unint64_t result = sub_24A016484();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A016484()
{
  unint64_t result = qword_269751758;
  if (!qword_269751758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751758);
  }
  return result;
}

uint64_t initializeWithCopy for ClockPosterConfiguration(uint64_t a1, uint64_t a2)
{
  int v4 = *(unsigned __int8 *)(a2 + 96);
  if (v4 == 2)
  {
    long long v7 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
    long long v8 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 40, a2 + 40);
    uint64_t v9 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = v9;
    *(unsigned char *)(a1 + 96) = 2;
    swift_bridgeObjectRetain();
  }
  else if (v4 == 1)
  {
    uint64_t v10 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v10;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + 96) = 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else if (*(unsigned char *)(a2 + 96))
  {
    long long v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v11;
    *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    long long v12 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    long long v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
    uint64_t v6 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    *(unsigned char *)(a1 + 96) = 0;
    swift_bridgeObjectRetain();
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  return a1;
}

uint64_t assignWithCopy for ClockPosterConfiguration(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    sub_249F75BD8(a1);
    int v4 = *((unsigned __int8 *)a2 + 96);
    if (v4 == 2)
    {
      uint64_t v6 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
      uint64_t v7 = *((void *)a2 + 8);
      *(void *)(a1 + 64) = v7;
      *(void *)(a1 + 72) = *((void *)a2 + 9);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, (uint64_t)a2 + 40);
      *(void *)(a1 + 80) = *((void *)a2 + 10);
      *(void *)(a1 + 88) = *((void *)a2 + 11);
      *(unsigned char *)(a1 + 96) = 2;
      swift_bridgeObjectRetain();
    }
    else if (v4 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(unsigned char *)(a1 + 96) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else if (*((unsigned char *)a2 + 96))
    {
      long long v8 = *a2;
      long long v9 = a2[2];
      *(_OWORD *)(a1 + 16) = a2[1];
      *(_OWORD *)(a1 + 32) = v9;
      *(_OWORD *)a1 = v8;
      long long v10 = a2[3];
      long long v11 = a2[4];
      long long v12 = a2[5];
      *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
      *(_OWORD *)(a1 + 64) = v11;
      *(_OWORD *)(a1 + 80) = v12;
      *(_OWORD *)(a1 + 48) = v10;
    }
    else
    {
      uint64_t v5 = *((void *)a2 + 3);
      *(void *)(a1 + 24) = v5;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v5 - 8))(a1, a2);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      *(unsigned char *)(a1 + 96) = 0;
      swift_bridgeObjectRetain();
    }
  }
  *(unsigned char *)(a1 + 97) = *((unsigned char *)a2 + 97);
  return a1;
}

__n128 __swift_memcpy98_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_WORD *)(a1 + 96) = *((_WORD *)a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ClockPosterConfiguration(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_249F75BD8(a1);
    long long v4 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v4;
    *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    long long v6 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v6;
  }
  *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClockPosterConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 98)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 96);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ClockPosterConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 96) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 98) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 98) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 96) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClockPosterConfiguration()
{
  return &type metadata for ClockPosterConfiguration;
}

unsigned char *storeEnumTagSinglePayload for ClockPosterConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A016A3CLL);
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

ValueMetadata *type metadata accessor for ClockPosterConfiguration.CodingKeys()
{
  return &type metadata for ClockPosterConfiguration.CodingKeys;
}

unint64_t sub_24A016A78()
{
  unint64_t result = qword_269751760;
  if (!qword_269751760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751760);
  }
  return result;
}

unint64_t sub_24A016AD0()
{
  unint64_t result = qword_269751768;
  if (!qword_269751768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751768);
  }
  return result;
}

unint64_t sub_24A016B28()
{
  unint64_t result = qword_269751770;
  if (!qword_269751770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751770);
  }
  return result;
}

unint64_t sub_24A016B7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751790);
    int v3 = (void *)sub_24A057C08();
    for (i = (void *)(a1 + 40); ; i += 2)
    {
      unsigned int v5 = *((_DWORD *)i - 2);
      uint64_t v6 = *i;
      unint64_t result = sub_24A015368(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
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

uint64_t sub_24A016C54(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A016C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TextClockDescriptor(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A016D00(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TextClockDescriptor(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A016D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697504A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A016DC4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_24A016E20()
{
  unint64_t result = qword_2697517D8;
  if (!qword_2697517D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697517D8);
  }
  return result;
}

id sub_24A016E74(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = &v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView____lazy_storage___scaler];
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  unsigned char v9[40] = 1;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView] = 0;
  uint64_t v10 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask] = 0;
  id v11 = objc_allocWithZone((Class)type metadata accessor for AnalogClockDialView());
  long long v12 = v4;
  id v13 = objc_msgSend(v11, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v14 = *(void **)&v4[v10];
  *(void *)&v4[v10] = v13;

  v16.receiver = v12;
  v16.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  return objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_24A016FEC()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v3 - 8);
  unsigned int v5 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for AnalogClockFaceView();
  v91.receiver = v0;
  v91.super_class = v6;
  objc_msgSendSuper2(&v91, sel_layoutSubviews);
  UIEdgeInsets v92 = UIView.cp_safeAreaInsets(centering:)(1);
  double top = v92.top;
  double left = v92.left;
  objc_msgSend(v0, sel_frame);
  UIEdgeInsetsInsetRect_0(v9, v10, v11, v12, top, left);
  UIRectIntegralWithViewScale();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v19 = v13;
  CGFloat v20 = v14;
  uint64_t v21 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  if (!*(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView])
  {
    id v22 = objc_msgSend(objc_allocWithZone((Class)AnalogHandsView), sel_initWithFixedSize_, v13, v14);
    uint64_t v23 = *(void **)&v0[v21];
    *(void *)&v0[v21] = v22;
  }
  sub_24A017F50();
  uint64_t v24 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask;
  if (!*(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask])
  {
    uint64_t v25 = sub_24A057628();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v5, 1, 1, v25);
    uint64_t v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_24A057608();
    swift_retain();
    uint64_t v27 = sub_24A0575F8();
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = MEMORY[0x263F8F500];
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v26;
    swift_release();
    *(void *)&v2[v24] = sub_24A039A1C((uint64_t)v5, (uint64_t)&unk_269751830, (uint64_t)v28);
    swift_release();
  }
  sub_24A01892C();
  uint64_t v30 = self;
  uint64_t v31 = (CGFloat *)swift_allocObject();
  *((void *)v31 + 2) = v2;
  v31[3] = v16;
  v31[4] = v18;
  v31[5] = v19;
  v31[6] = v20;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = sub_24A018D38;
  *(void *)(v32 + 24) = v31;
  aBlock[4] = sub_249F708EC;
  v90 = (void *)v32;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A040C30;
  aBlock[3] = &block_descriptor_49;
  uint64_t v33 = _Block_copy(aBlock);
  os_log_type_t v34 = v90;
  uint64_t v35 = v2;
  swift_retain();
  swift_release();
  objc_msgSend((id)v30, sel_performWithoutAnimation_, v33);
  _Block_release(v33);
  LOBYTE(v30) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v30)
  {
    __break(1u);
LABEL_21:

    __break(1u);
    goto LABEL_22;
  }
  uint64_t v85 = v21;
  id v36 = objc_msgSend(v35, sel_effectiveUserInterfaceLayoutDirection);
  uint64_t v37 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView;
  if (v36 == (id)1) {
    uint64_t v38 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView;
  }
  else {
    uint64_t v38 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView;
  }
  os_log_type_t v34 = *(void **)&v35[v38];
  if (v36 == (id)1) {
    uint64_t v37 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView;
  }
  uint64_t v1 = *(void **)&v35[v37];
  unint64_t v39 = &unk_269751000;
  double v87 = v19;
  double v88 = v18;
  double v86 = v20;
  if (v34)
  {
    uint64_t v40 = *(void *)&v35[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
    if (!v40)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    double v41 = v16;
    double v42 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame);
    double v43 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 8);
    double v44 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 16);
    double v45 = *(double *)(v40 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_leftComplicationFrame + 24);
    id v46 = v1;
    id v47 = v34;
    objc_msgSend(v35, sel_convertRect_fromView_, v40, v42, v43, v44, v45);
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    objc_msgSend(v47, sel_intrinsicContentSize);
    double v57 = v56;
    double v59 = v58;
    v93.origin.x = v49;
    v93.origin.y = v51;
    v93.size.width = v53;
    v93.size.height = v55;
    double MinX = CGRectGetMinX(v93);
    v94.origin.x = v49;
    v94.origin.y = v51;
    v94.size.width = v53;
    v94.size.height = v55;
    objc_msgSend(v47, sel_setFrame_, MinX, CGRectGetMidY(v94) + v59 * -0.5, v57, v59);
    CGFloat v16 = v41;
    CGFloat v19 = v87;
    CGFloat v18 = v88;
    CGFloat v20 = v86;
    unint64_t v39 = (void *)&unk_269751000;
    if (!v1) {
      goto LABEL_18;
    }
  }
  else
  {
    id v61 = v1;
    if (!v1) {
      goto LABEL_18;
    }
  }
  uint64_t v62 = *(void *)&v35[v39[257]];
  if (v62)
  {
    double v63 = v16;
    double v64 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame);
    double v65 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 8);
    double v66 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 16);
    double v67 = *(double *)(v62 + OBJC_IVAR____TtC11ClockPoster19AnalogClockDialView_rightComplicationFrame + 24);
    id v68 = v1;
    objc_msgSend(v35, (SEL)0x265282F98, v62, v64, v65, v66, v67);
    CGFloat v70 = v69;
    CGFloat v72 = v71;
    CGFloat v74 = v73;
    CGFloat v76 = v75;
    objc_msgSend(v68, (SEL)&selRef__solveForInput_);
    double v78 = v77;
    double v80 = v79;
    v95.origin.x = v70;
    v95.origin.y = v72;
    v95.size.width = v74;
    v95.size.height = v76;
    CGFloat v81 = CGRectGetMaxX(v95) - v78;
    v96.origin.x = v70;
    v96.origin.y = v72;
    v96.size.width = v74;
    v96.size.height = v76;
    objc_msgSend(v68, (SEL)&selRef_initWithString_attributes_, v81, CGRectGetMidY(v96) + v80 * -0.5, v78, v80);

    CGFloat v16 = v63;
    CGFloat v19 = v87;
    CGFloat v18 = v88;
    CGFloat v20 = v86;
LABEL_18:
    v97.origin.x = v16;
    v97.origin.y = v18;
    v97.size.width = v19;
    v97.size.height = v20;
    CGRectGetHeight(v97);
    v98.origin.x = v16;
    v98.origin.y = v18;
    v98.size.width = v19;
    v98.size.height = v20;
    CGRectGetHeight(v98);
    uint64_t v82 = *(void **)&v2[v85];
    if (v82)
    {
      id v83 = v82;
      UIRectCenteredRect();
      objc_msgSend(v83, sel_setFrame_);
      swift_release();

      return;
    }
    goto LABEL_21;
  }
LABEL_23:

  __break(1u);
}

uint64_t sub_24A017640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB0);
  v4[10] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697516A0);
  v4[11] = v6;
  v4[12] = *(void *)(v6 - 8);
  v4[13] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB8);
  v4[14] = v7;
  v4[15] = *(void *)(v7 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = sub_24A057608();
  v4[18] = sub_24A0575F8();
  uint64_t v9 = sub_24A0575D8();
  v4[19] = v9;
  v4[20] = v8;
  return MEMORY[0x270FA2498](sub_24A01783C, v9, v8);
}

uint64_t sub_24A01783C()
{
  if (qword_26974F328 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  uint64_t v4 = qword_269751340;
  uint64_t v5 = *(void *)(qword_269751340 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_249FEFFF8(v5, v4, v1);
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v6 = sub_24A0575F8();
  v0[21] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[22] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24A0179C0;
  uint64_t v8 = v0[14];
  uint64_t v9 = v0[10];
  uint64_t v10 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v9, v6, v10, v8);
}

uint64_t sub_24A0179C0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24A017B04, v3, v2);
}

uint64_t sub_24A017B04()
{
  uint64_t v1 = v0[10];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[7] + 48))(v1, 1, v0[6]) == 1)
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
    swift_release();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  uint64_t v2 = v0[5] + 16;
  sub_249F845D8(v1, v0[9]);
  uint64_t v3 = MEMORY[0x24C5BA430](v2);
  if (!v3)
  {
    uint64_t v20 = v0[15];
    uint64_t v19 = v0[16];
    uint64_t v21 = v0[14];
    uint64_t v22 = v0[9];
    swift_release();
    sub_249F6E790(v22, &qword_2697515A0);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    goto LABEL_11;
  }
  uint64_t v7 = (void *)v3;
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView);
  if (v8)
  {
    uint64_t v9 = v0[8];
    sub_249F846A0(v0[9], v9);
    uint64_t v10 = sub_24A056238();
    uint64_t v11 = *(void *)(v10 - 8);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
    id v13 = v8;
    double v14 = 0;
    if (v12 != 1)
    {
      uint64_t v15 = v0[8];
      double v14 = (void *)sub_24A056198();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v10);
    }
    uint64_t v16 = v0[9];
    objc_msgSend(v13, sel_setOverrideDate_, v14);

    sub_249F6E790(v16, &qword_2697515A0);
    uint64_t v17 = sub_24A0575F8();
    v0[21] = v17;
    CGFloat v18 = (void *)swift_task_alloc();
    v0[22] = v18;
    *CGFloat v18 = v0;
    v18[1] = sub_24A0179C0;
    uint64_t v6 = v0[14];
    uint64_t v3 = v0[10];
    uint64_t v5 = MEMORY[0x263F8F500];
    uint64_t v4 = v17;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA1F68](v3, v4, v5, v6);
}

id sub_24A017DDC(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  id result = *(id *)(a1 + OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView);
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(result, sel_setFrame_);
  id result = *(id *)(a1 + v2);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  return objc_msgSend(result, sel_layoutIfNeeded);
}

id sub_24A017F50()
{
  uint64_t v1 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView];
  if (!v2) {
    goto LABEL_8;
  }
  id v3 = v2;
  id result = objc_msgSend(v0, sel_tintColor);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = result;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = 0x406FE00000000000;
  id v7 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id v36 = sub_249F7C490;
  uint64_t v37 = v6;
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  os_log_type_t v34 = sub_249FDA198;
  uint64_t v35 = &block_descriptor_26;
  uint64_t v8 = _Block_copy(&v32);
  id v9 = v5;
  id v10 = objc_msgSend(v7, sel_initWithDynamicProvider_, v8);
  _Block_release(v8);

  swift_release();
  objc_msgSend(v3, sel_applySecondHandColor_, v10);

  id result = *(id *)&v0[v1];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  id result = objc_msgSend(result, sel_hourHandView);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v11 = result;
  int v12 = self;
  id v13 = objc_msgSend(v12, sel_whiteColor);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = 0x406FE00000000000;
  id v15 = objc_allocWithZone(MEMORY[0x263F825C8]);
  id v36 = sub_249F7C4E4;
  uint64_t v37 = v14;
  uint64_t v32 = MEMORY[0x263EF8330];
  uint64_t v33 = 1107296256;
  os_log_type_t v34 = sub_249FDA198;
  uint64_t v35 = &block_descriptor_33;
  uint64_t v16 = _Block_copy(&v32);
  id v17 = v13;
  id v18 = objc_msgSend(v15, sel_initWithDynamicProvider_, v16);
  _Block_release(v16);

  swift_release();
  objc_msgSend(v11, sel_setColor_, v18);

  id result = *(id *)&v0[v1];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id result = objc_msgSend(result, sel_minuteHandView);
  if (result)
  {
    uint64_t v19 = result;
    id v20 = objc_msgSend(v12, sel_whiteColor);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = 0x406FE00000000000;
    id v22 = objc_allocWithZone(MEMORY[0x263F825C8]);
    id v36 = sub_249F7C4E4;
    uint64_t v37 = v21;
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 1107296256;
    os_log_type_t v34 = sub_249FDA198;
    uint64_t v35 = &block_descriptor_40;
    uint64_t v23 = _Block_copy(&v32);
    id v24 = v20;
    id v25 = objc_msgSend(v22, sel_initWithDynamicProvider_, v23);
    _Block_release(v23);

    swift_release();
    objc_msgSend(v19, sel_setColor_, v25);

LABEL_8:
    uint64_t v26 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView];
    if (v26)
    {
      id v27 = v26;
      id v28 = objc_msgSend(v0, sel_tintColor);
      objc_msgSend(v27, sel_setTintColor_, v28);
    }
    uint64_t v29 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView];
    if (v29)
    {
      id v30 = v29;
      id v31 = sub_24A0183B8();
      objc_msgSend(v30, sel_setTintColor_, v31);
    }
    id result = *(id *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
    if (result) {
      return objc_msgSend(result, sel_setNeedsLayout);
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
  return result;
}

id sub_24A0183B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A0562B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A0562D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751820);
  MEMORY[0x270FA5388](v10 - 8);
  int v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor;
  id v13 = *(void **)&v1[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor];
  id v14 = v13;
  if (!v13) {
    id v14 = objc_msgSend(v1, sel_tintColor);
  }
  if (!*(void *)&v1[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView])
  {
    id v20 = v14;
    id v21 = v13;
    return v20;
  }
  id v33 = v14;
  type metadata accessor for AnalogClockFaceDateComplicationView();
  uint64_t v15 = swift_dynamicCastClass();
  id v16 = v13;
  if (v15)
  {
    uint64_t v17 = sub_24A02D200((uint64_t)&unk_26FDE5C80);
    swift_arrayDestroy();
    sub_24A056298();
    sub_24A0562C8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_24A0562A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v18 = sub_24A056288();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v12, 1, v18) == 1)
    {
      swift_bridgeObjectRelease();
      sub_249F6E790((uint64_t)v12, &qword_269751820);
    }
    else
    {
      uint64_t v23 = sub_24A056278();
      uint64_t v25 = v24;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v18);
      LOBYTE(v23) = sub_24A0187F4(v23, v25, v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0 && *(void *)&v1[v32])
      {
        id v26 = objc_msgSend(self, sel_whiteColor);
        uint64_t v27 = swift_allocObject();
        *(void *)(v27 + 16) = v26;
        id v28 = objc_allocWithZone(MEMORY[0x263F825C8]);
        aBlock[4] = sub_249FDA534;
        void aBlock[5] = v27;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_249FDA198;
        aBlock[3] = &block_descriptor_11;
        uint64_t v29 = _Block_copy(aBlock);
        id v30 = v26;
        id v31 = objc_msgSend(v28, sel_initWithDynamicProvider_, v29);
        _Block_release(v29);

        swift_release();
        return v31;
      }
    }
  }
  return v33;
}

uint64_t sub_24A0187F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24A057E28();
    sub_24A057408();
    uint64_t v6 = sub_24A057E68();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24A057D48() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24A057D48() & 1) != 0) {
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

void sub_24A01892C()
{
  id v1 = objc_msgSend(v0, sel_subviews);
  sub_249F88C30();
  unint64_t v2 = sub_24A057568();

  uint64_t v3 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView;
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView];
  if (!v4)
  {
    __break(1u);
    goto LABEL_20;
  }
  id v5 = v4;
  char v6 = sub_249FB87C4((uint64_t)v5, v2);
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    if (!*(void *)&v0[v3])
    {
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      return;
    }
    objc_msgSend(v0, sel_addSubview_);
  }
  uint64_t v7 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView];
  if (v7)
  {
    id v8 = v7;
    id v9 = objc_msgSend(v0, sel_subviews);
    unint64_t v10 = sub_24A057568();

    LOBYTE(v9) = sub_249FB87C4((uint64_t)v8, v10);
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0) {
      objc_msgSend(v0, sel_addSubview_, v8);
    }
  }
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView];
  if (v11)
  {
    id v12 = v11;
    id v13 = objc_msgSend(v0, sel_subviews);
    unint64_t v14 = sub_24A057568();

    LOBYTE(v13) = sub_249FB87C4((uint64_t)v12, v14);
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      objc_msgSend(v0, sel_addSubview_, v12);
    }
  }
  id v15 = objc_msgSend(v0, sel_subviews);
  unint64_t v16 = sub_24A057568();

  uint64_t v17 = OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView;
  uint64_t v18 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView];
  if (!v18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v19 = v18;
  char v20 = sub_249FB87C4((uint64_t)v19, v16);
  swift_bridgeObjectRelease();

  if (v20) {
    return;
  }
  if (!*(void *)&v0[v17]) {
    goto LABEL_22;
  }

  objc_msgSend(v0, sel_addSubview_);
}

id sub_24A018B78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceView()
{
  return self;
}

uint64_t sub_24A018C5C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_24A018CAC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

double UIEdgeInsetsInsetRect_0(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_24A018D00()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

id sub_24A018D38()
{
  return sub_24A017DDC(*(void *)(v0 + 16));
}

uint64_t sub_24A018D48()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A018D58()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A018D90()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A018DD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_249F6C87C;
  return sub_24A017640(a1, v4, v5, v6);
}

void sub_24A018E84()
{
  id v1 = &v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView____lazy_storage___scaler];
  *(_OWORD *)id v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  v1[40] = 1;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_secondaryTintColor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_leadingComplicationView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_trailingComplicationView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_dialView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_handsView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ClockPoster19AnalogClockFaceView_overrideStreamTask] = 0;

  sub_24A057BC8();
  __break(1u);
}

Swift::Void __swiftcall UIView.cp_applyFullscreenConstraints(inContainer:)(UIView *inContainer)
{
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974F928);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24A0611B0;
  uint64_t v5 = [(UIView *)inContainer leadingAnchor];
  id v6 = objc_msgSend(v1, sel_leadingAnchor);
  id v7 = [(NSLayoutXAxisAnchor *)v5 constraintEqualToAnchor:v6];

  *(void *)(v4 + 32) = v7;
  id v8 = [(UIView *)inContainer trailingAnchor];
  id v9 = objc_msgSend(v1, sel_trailingAnchor);
  id v10 = [(NSLayoutXAxisAnchor *)v8 constraintEqualToAnchor:v9];

  *(void *)(v4 + 40) = v10;
  uint64_t v11 = [(UIView *)inContainer topAnchor];
  id v12 = objc_msgSend(v1, sel_topAnchor);
  id v13 = [(NSLayoutYAxisAnchor *)v11 constraintEqualToAnchor:v12];

  *(void *)(v4 + 48) = v13;
  unint64_t v14 = [(UIView *)inContainer bottomAnchor];
  id v15 = objc_msgSend(v1, sel_bottomAnchor);
  id v16 = [(NSLayoutYAxisAnchor *)v14 constraintEqualToAnchor:v15];

  *(void *)(v4 + 56) = v16;
  sub_24A057588();
  sub_24A0191CC();
  id v17 = (id)sub_24A057548();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_activateConstraints_, v17);
}

unint64_t sub_24A0191CC()
{
  unint64_t result = qword_269751838;
  if (!qword_269751838)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269751838);
  }
  return result;
}

UIEdgeInsets __swiftcall UIView.cp_safeAreaInsets(centering:)(Swift::Bool centering)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A056538();
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)&double v9 = MEMORY[0x270FA5388](v7).n128_u64[0];
  uint64_t v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_safeAreaInsets, v9);
  if (v15 == *MEMORY[0x263F834E8]
    && v12 == *(double *)(MEMORY[0x263F834E8] + 8)
    && v13 == *(double *)(MEMORY[0x263F834E8] + 16)
    && v14 == *(double *)(MEMORY[0x263F834E8] + 24))
  {
    objc_msgSend(v1, sel_safeAreaInsets);
    double v19 = v26;
    double v21 = v27;
    goto LABEL_33;
  }
  double v19 = 24.0;
  if (!SBUIIsSystemApertureEnabled())
  {
    *(double *)&uint64_t v28 = 64.0;
LABEL_32:
    double v24 = *(double *)&v28;
    double v25 = 24.0;
    double v21 = *(double *)&v28;
    goto LABEL_33;
  }
  id v20 = objc_msgSend(self, sel_sharedInstanceForEmbeddedDisplay);
  objc_msgSend(v20, sel_interSensorRegionInWindowSpace);
  double v21 = CGRectGetMaxY(v44) + 1.0;
  id v22 = objc_msgSend(self, sel_mainScreen);
  uint64_t v23 = sub_24A019680();

  if (v23 == 4)
  {

    if (centering) {
      double v24 = v21;
    }
    else {
      double v24 = 64.0;
    }
    double v25 = 24.0;
    goto LABEL_33;
  }
  if (v23 != 3)
  {
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v29 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_rendering_private;
    swift_beginAccess();
    sub_249F7AA94(v29, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_249FB8AA8((uint64_t)v11);
      sub_249F9F8CC((uint64_t)v6);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v6, v7);
    }
    id v30 = v2;
    id v31 = sub_24A056518();
    os_log_type_t v32 = sub_24A0577B8();
    int v33 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v34 = swift_slowAlloc();
      int v42 = v33;
      uint64_t v35 = v34;
      id v36 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 138543618;
      v40[0] = v35 + 12;
      v40[1] = v35 + 4;
      double v43 = v30;
      id v41 = v20;
      uint64_t v37 = v30;
      sub_24A057978();
      *id v36 = v30;

      *(_WORD *)(v35 + 12) = 2050;
      double v43 = v23;
      id v20 = v41;
      sub_24A057978();
      _os_log_impl(&dword_249F61000, v31, (os_log_type_t)v42, "[%{public}@] Unsupported interface orientation %{public}ld.", (uint8_t *)v35, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v36, -1, -1);
      MEMORY[0x24C5BA360](v35, -1, -1);
    }
    else
    {

      id v31 = v30;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    *(double *)&uint64_t v28 = 49.0;
    goto LABEL_32;
  }

  double v24 = v21;
  if (!centering) {
    double v21 = 64.0;
  }
  double v25 = 24.0;
LABEL_33:
  double v38 = v19;
  double v39 = v21;
  result.right = v39;
  result.bottom = v25;
  result.double left = v24;
  result.double top = v38;
  return result;
}

double UIView.cp_safeAreaInsets.getter()
{
  return 24.0;
}

uint64_t sub_24A019680()
{
  objc_msgSend(objc_msgSend(v0, sel_coordinateSpace), sel_convertPoint_toCoordinateSpace_, objc_msgSend(v0, sel_fixedCoordinateSpace), 0.0, 0.0);
  double v2 = v1;
  double v4 = v3;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v5 = 4;
  if (v4 == 0.0) {
    uint64_t v5 = 1;
  }
  uint64_t v6 = 2;
  if (v4 == 0.0) {
    uint64_t v6 = 3;
  }
  if (v2 == 0.0) {
    return v5;
  }
  else {
    return v6;
  }
}

double sub_24A019730()
{
  objc_msgSend(v0, sel_frame);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  CGFloat MinY = CGRectGetMinY(v32);
  CGFloatMax(24.0 - MinY);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v33);
  double v31 = CGFloatMax(64.0 - MinX);
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v34.origin.CGFloat x = v10;
  v34.origin.CGFloat y = v12;
  v34.size.CGFloat width = v14;
  v34.size.CGFloat height = v16;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMaxY(v35);
  id v19 = objc_msgSend(v7, sel_mainScreen, CGFloatMax(v18 - MaxY + 24.0));
  objc_msgSend(v19, sel_bounds);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v36.origin.CGFloat x = v21;
  v36.origin.CGFloat y = v23;
  v36.size.CGFloat width = v25;
  v36.size.CGFloat height = v27;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat v29 = CGRectGetMaxX(v37);
  CGFloatMax(v29 - MaxX + 64.0);
  objc_msgSend(v0, sel_frame);
  CGRectGetWidth(v38);
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v39);
  return v31;
}

void *sub_24A019924(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_24A057C18();
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

uint64_t sub_24A0199C8(uint64_t (*a1)(void))
{
  return a1();
}

void sub_24A0199F0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24A057978();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    *id v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

id sub_24A019AA8(double a1)
{
  double v2 = (void *)*MEMORY[0x263F835E0];
  double v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_preferredFontDescriptorWithTextStyle_, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974F9E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A05A510;
  uint64_t v7 = (void *)*MEMORY[0x263F817A0];
  *(void *)(inited + 32) = *MEMORY[0x263F817A0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751840);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_24A05A510;
  double v9 = (void *)*MEMORY[0x263F81850];
  *(void *)(v8 + 32) = *MEMORY[0x263F81850];
  *(void *)(v8 + 40) = *MEMORY[0x263F81828];
  id v10 = v5;
  id v11 = v7;
  id v12 = v9;
  unint64_t v13 = sub_24A012F60(v8);
  *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_269751848);
  *(void *)(inited + 40) = v13;
  sub_24A012ACC(inited);
  type metadata accessor for AttributeName(0);
  sub_249F70D24();
  CGFloat v14 = (void *)sub_24A0572E8();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v10, sel_fontDescriptorByAddingAttributes_, v14);

  id v16 = objc_allocWithZone(MEMORY[0x263F32120]);
  id v17 = v15;
  id v18 = objc_msgSend(v16, sel_init);
  id v19 = objc_msgSend(self, sel_fontWithDescriptor_size_, v17, a1);

  objc_msgSend(v18, sel_setFont_, v19);
  objc_msgSend(v18, sel_setUppercase_, 1);

  return v18;
}

id sub_24A019CD8()
{
  type metadata accessor for ClockFaceController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269752438 = (uint64_t)result;
  return result;
}

uint64_t sub_24A019D30()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  id v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_24A0573A8();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000024 && v4 == 0x800000024A064EF0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24A057D48();
    swift_bridgeObjectRelease();
    return v6 & 1;
  }
}

ValueMetadata *type metadata accessor for PlayClockFace()
{
  return &type metadata for PlayClockFace;
}

uint64_t sub_24A019E28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A019E44@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  char v3 = HIBYTE(a2);
  uint64_t v40 = a3;
  int v5 = a2 & 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751888);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  double v9 = (uint64_t *)((char *)&KeyPath - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751890);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&KeyPath - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751898);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  CGRect v39 = (char *)&KeyPath - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  void *v9 = 0x403E000000000000;
  CGRect v38 = (char *)v9 + *(int *)(v7 + 52);
  uint64_t v17 = swift_retain();
  char v18 = v5;
  int v37 = v5;
  sub_24A030028(v17, v5);
  swift_release();
  uint64_t v19 = sub_24A021524();
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v20 = sub_24A02106C(v19);
  swift_bridgeObjectRelease();
  uint64_t v41 = v20;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(unsigned char *)(v21 + 24) = v18;
  *(unsigned char *)(v21 + 25) = v3 & 1;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_24A01B150;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697518A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697518A8);
  sub_249F6EE60(&qword_2697518B0, &qword_2697518A0);
  sub_249F6EE60(&qword_2697518B8, &qword_2697518A8);
  uint64_t v23 = (uint64_t)v39;
  sub_24A057138();
  uint64_t v24 = sub_24A0571D8();
  uint64_t v25 = swift_retain();
  sub_24A030028(v25, v37);
  swift_release();
  uint64_t v26 = sub_24A021524();
  swift_bridgeObjectRetain();
  swift_release();
  sub_249F6E6C8((uint64_t)v9, (uint64_t)v13, &qword_269751888);
  CGFloat v27 = (uint64_t *)&v13[*(int *)(v11 + 44)];
  *CGFloat v27 = v24;
  v27[1] = v26;
  sub_249F6E790((uint64_t)v9, &qword_269751888);
  uint64_t v28 = sub_24A0567F8();
  LOBYTE(v20) = sub_24A056C88();
  sub_249F6E6C8((uint64_t)v13, v23, &qword_269751890);
  uint64_t v29 = v23 + *(int *)(v15 + 44);
  *(void *)uint64_t v29 = v28;
  *(unsigned char *)(v29 + 8) = v20;
  sub_249F6E790((uint64_t)v13, &qword_269751890);
  if (qword_26974F2D0 != -1) {
    swift_once();
  }
  id v30 = (id)qword_269752370;
  uint64_t v31 = sub_24A056CE8();
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = v40;
  sub_249F6E6C8(v23, v40, &qword_269751898);
  CGRect v34 = (uint64_t *)(v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697518C0) + 36));
  uint64_t *v34 = v32;
  v34[1] = v31;
  return sub_249F6E790(v23, &qword_269751898);
}

uint64_t sub_24A01A254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W4>, uint64_t a5@<X8>)
{
  int v9 = (a1 == 2) & (a4 >> 8);
  type metadata accessor for PlayViewModel();
  sub_24A01C588(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24A056698();
  char v12 = v11;
  id v13 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v13, sel_bounds);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v25.origin.CGFloat x = v15;
  v25.origin.CGFloat y = v17;
  v25.size.CGFloat width = v19;
  v25.size.CGFloat height = v21;
  CGRectGetHeight(v25);
  sub_24A056708();
  sub_24A056708();
  uint64_t v22 = sub_24A0566F8();
  swift_release();
  swift_release();
  *(void *)a5 = a2;
  *(void *)(a5 + 8) = a3;
  *(void *)(a5 + 16) = a1;
  *(unsigned char *)(a5 + 24) = v9;
  *(void *)(a5 + 32) = v10;
  *(unsigned char *)(a5 + 40) = v12 & 1;
  *(void *)(a5 + 48) = v22;
  *(void *)(a5 + 56) = a2;
  *(void *)(a5 + 64) = a3;

  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01A3F0@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 9)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_24A019E44(*(void *)v1, v2 | *(unsigned __int8 *)(v1 + 8), a1);
}

double sub_24A01A418(uint64_t a1, char a2)
{
  double result = *(double *)&a1;
  if (a2) {
    return 10.0;
  }
  return result;
}

uint64_t sub_24A01A438(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_24A01BA18(a9, a1, a2, a3, a4, *v9);
}

uint64_t sub_24A01A448()
{
  uint64_t v1 = v0;
  sub_24A01B730();
  sub_24A01B784();
  swift_bridgeObjectRetain();
  sub_24A056BE8();
  char v2 = *(unsigned char *)(v0 + 40);
  uint64_t v3 = swift_retain();
  sub_24A030028(v3, v2);
  swift_release();
  uint64_t v4 = sub_24A01E02C();
  uint64_t result = swift_release();
  unint64_t v6 = *(void *)(v1 + 16);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v6 < *(void *)(v4 + 16))
  {
    swift_retain();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    sub_24A0571D8();
    sub_24A0571C8();
    uint64_t v7 = swift_release();
    MEMORY[0x270FA5388](v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751930);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751938);
    sub_24A01B7E8();
    sub_24A01B978();
    sub_24A056E68();
    swift_release();
    sub_249FDB2A8();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_24A01A670@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6 = *(unsigned char *)(a2 + 40);
  uint64_t v7 = swift_retain();
  sub_24A030028(v7, v6);
  swift_release();
  sub_24A01DB94();
  uint64_t v9 = v8;
  uint64_t result = swift_release();
  unint64_t v11 = *(void *)(a2 + 16);
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11 < *(void *)(v9 + 16))
  {
    uint64_t v12 = *(void *)(v9 + 8 * v11 + 32);
    swift_bridgeObjectRelease();
    sub_24A057268();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751978);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(a3, a1, v17);
    uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269751938);
    double v18 = (void *)(a3 + *(int *)(result + 36));
    *double v18 = v12;
    v18[1] = v14;
    v18[2] = v16;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A01A784()
{
  return sub_24A01A448();
}

uint64_t sub_24A01A7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24A056818();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A057208();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  v23[0] = a1;
  v23[1] = a2;
  sub_249F823CC();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_24A056D98();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F1B9A0], v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519F0);
  sub_24A01C704((uint64_t)v8, a3 + *(int *)(v21 + 36));
  *(void *)a3 = v14;
  *(void *)(a3 + 8) = v16;
  *(unsigned char *)(a3 + 16) = v20;
  *(void *)(a3 + 24) = v18;
  *(void *)(a3 + 32) = KeyPath;
  *(unsigned char *)(a3 + 40) = 0;
  sub_249F6E4F8(v14, v16, v20);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A01C768((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_249F6E5D0(v14, v16, v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A01A9E8@<X0>(uint64_t a1@<X8>)
{
  return sub_24A01A7C0(*v1, v1[1], a1);
}

uint64_t sub_24A01A9F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519D0);
  MEMORY[0x270FA5388](v46);
  uint64_t v7 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v48 = sub_24A057198();
  uint64_t v8 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v10 = &v42[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519D8);
  MEMORY[0x270FA5388](v45);
  uint64_t v12 = (uint64_t *)&v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519E0);
  MEMORY[0x270FA5388](v47);
  uint64_t v14 = &v42[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  CGFloat v53 = &v42[-v16];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v56 = a1;
  uint64_t v52 = a1;
  uint64_t v57 = a2;
  unint64_t v17 = sub_249F823CC();
  uint64_t v54 = a2;
  swift_bridgeObjectRetain();
  unint64_t v44 = v17;
  uint64_t v18 = sub_24A056D98();
  uint64_t v49 = v19;
  uint64_t v50 = v18;
  char v21 = v20;
  uint64_t v51 = v22;
  sub_24A056F28();
  uint64_t v23 = sub_24A056F48();
  swift_release();
  if (qword_26974F330 != -1) {
    swift_once();
  }
  int v43 = v21 & 1;
  id v24 = (id)qword_269752438;
  sub_24A057188();

  LOBYTE(v24) = sub_24A056C88();
  uint64_t v25 = v48;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v7, v10, v48);
  v7[*(int *)(v46 + 36)] = (_BYTE)v24;
  sub_249F6E6C8((uint64_t)v7, (uint64_t)v12 + *(int *)(v45 + 36), &qword_2697519D0);
  *uint64_t v12 = v23;
  v12[1] = 0xBFF0000000000000;
  swift_retain();
  sub_249F6E790((uint64_t)v7, &qword_2697519D0);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v25);
  swift_release();
  uint64_t v26 = swift_getKeyPath();
  uint64_t v56 = v52;
  uint64_t v57 = v54;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_24A056D98();
  uint64_t v29 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  uint64_t v34 = sub_24A056EF8();
  sub_249F6E6C8((uint64_t)v12, (uint64_t)v14, &qword_2697519D8);
  CGRect v35 = &v14[*(int *)(v47 + 36)];
  *(void *)CGRect v35 = v27;
  *((void *)v35 + 1) = v29;
  v35[16] = v31 & 1;
  *((void *)v35 + 3) = v33;
  *((void *)v35 + 4) = v26;
  v35[40] = 0;
  *((void *)v35 + 6) = v34;
  sub_249F6E790((uint64_t)v12, &qword_2697519D8);
  CGRect v36 = v53;
  sub_249F6E664((uint64_t)v14, (uint64_t)v53, &qword_2697519E0);
  sub_249F6E6C8((uint64_t)v36, (uint64_t)v14, &qword_2697519E0);
  uint64_t v38 = v49;
  uint64_t v37 = v50;
  *(void *)a3 = v50;
  *(void *)(a3 + 8) = v38;
  LOBYTE(v33) = v43;
  *(unsigned char *)(a3 + 16) = v43;
  uint64_t v39 = KeyPath;
  *(void *)(a3 + 24) = v51;
  *(void *)(a3 + 32) = v39;
  *(unsigned char *)(a3 + 40) = 0;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519E8);
  sub_249F6E6C8((uint64_t)v14, a3 + *(int *)(v40 + 48), &qword_2697519E0);
  sub_249F6E4F8(v37, v38, v33);
  swift_bridgeObjectRetain();
  j__swift_retain();
  sub_249F6E790((uint64_t)v36, &qword_2697519E0);
  sub_249F6E790((uint64_t)v14, &qword_2697519E0);
  sub_249F6E5D0(v37, v38, v33);
  swift_bridgeObjectRelease();
  return j__swift_release();
}

unint64_t sub_24A01AE9C()
{
  return 0xD000000000000016;
}

uint64_t sub_24A01AEB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519B8);
  MEMORY[0x270FA5388](v3 - 8);
  int v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *v1;
  uint64_t v6 = v1[1];
  *int v5 = sub_24A0571A8();
  v5[1] = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519C0);
  sub_24A01A9F0(v7, v6, (uint64_t)v5 + *(int *)(v9 + 44));
  sub_249F6E6C8((uint64_t)v5, a1, &qword_2697519B8);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697519C8) + 36)) = 0x3FF0000000000000;
  return sub_249F6E790((uint64_t)v5, &qword_2697519B8);
}

uint64_t sub_24A01AF98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24A0571A8();
  uint64_t v4 = v3;
  type metadata accessor for PlayViewModel();
  sub_24A01C588(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  uint64_t result = sub_24A056698();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = result;
  *(unsigned char *)(a1 + 24) = v6 & 1;
  *(unsigned char *)(a1 + 25) = 1;
  return result;
}

unint64_t sub_24A01B034(uint64_t a1)
{
  unint64_t result = sub_24A01B05C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A01B05C()
{
  unint64_t result = qword_269751870;
  if (!qword_269751870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751870);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayClockFace.TimeView()
{
  return &type metadata for PlayClockFace.TimeView;
}

uint64_t sub_24A01B0C0()
{
  return sub_249F6EE60(&qword_269751878, &qword_269751880);
}

uint64_t sub_24A01B0FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A01B118()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 26, 7);
}

uint64_t sub_24A01B150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(unsigned char *)(v4 + 25)) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  return sub_24A01A254(a1, a2, a3, v5 | *(unsigned __int8 *)(v4 + 24), a4);
}

uint64_t sub_24A01B178()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A01B1B0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t destroy for PlayClockFace.RotatableCharacter()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  char v4 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  char v4 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PlayClockFace.RotatableCharacter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlayClockFace.RotatableCharacter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlayClockFace.RotatableCharacter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayClockFace.RotatableCharacter()
{
  return &type metadata for PlayClockFace.RotatableCharacter;
}

ValueMetadata *type metadata accessor for PlayClockFace.OverlapLayout()
{
  return &type metadata for PlayClockFace.OverlapLayout;
}

unint64_t sub_24A01B418()
{
  unint64_t result = qword_2697518C8;
  if (!qword_2697518C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697518C0);
    sub_24A01C8D0(&qword_2697518D0, &qword_269751898, (void (*)(void))sub_24A01B4E4);
    sub_249F6EE60(&qword_26974FE80, &qword_26974FE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697518C8);
  }
  return result;
}

unint64_t sub_24A01B4E4()
{
  unint64_t result = qword_2697518D8;
  if (!qword_2697518D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751890);
    sub_24A01B584();
    sub_249F6EE60(&qword_269751908, &qword_269751910);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697518D8);
  }
  return result;
}

unint64_t sub_24A01B584()
{
  unint64_t result = qword_2697518E0;
  if (!qword_2697518E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751888);
    sub_249F6EE60(&qword_2697518E8, &qword_2697518F0);
    sub_24A01B624();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697518E0);
  }
  return result;
}

unint64_t sub_24A01B624()
{
  unint64_t result = qword_2697518F8;
  if (!qword_2697518F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751900);
    sub_249F6EE60(&qword_2697518B8, &qword_2697518A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697518F8);
  }
  return result;
}

unint64_t sub_24A01B6C0()
{
  unint64_t result = qword_269751918;
  if (!qword_269751918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751918);
  }
  return result;
}

uint64_t sub_24A01B714()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24A01B730()
{
  unint64_t result = qword_269751920;
  if (!qword_269751920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751920);
  }
  return result;
}

unint64_t sub_24A01B784()
{
  unint64_t result = qword_269751928;
  if (!qword_269751928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751928);
  }
  return result;
}

uint64_t sub_24A01B7E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A01A670(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_24A01B7E8()
{
  unint64_t result = qword_269751940;
  if (!qword_269751940)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751930);
    sub_24A01B888();
    sub_249F6EE60(&qword_26974F6C8, &qword_26974F6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751940);
  }
  return result;
}

unint64_t sub_24A01B888()
{
  unint64_t result = qword_269751948;
  if (!qword_269751948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751950);
    sub_24A01B8FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751948);
  }
  return result;
}

unint64_t sub_24A01B8FC()
{
  unint64_t result = qword_269751958;
  if (!qword_269751958)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751960);
    sub_24A01B730();
    sub_24A01B784();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751958);
  }
  return result;
}

unint64_t sub_24A01B978()
{
  unint64_t result = qword_269751968;
  if (!qword_269751968)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751938);
    sub_249F6EE60(&qword_269751970, &qword_269751978);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751968);
  }
  return result;
}

uint64_t sub_24A01BA18(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  v105.size.CGFloat width = a4;
  v105.size.CGFloat height = a5;
  v105.origin.CGFloat y = a3;
  v105.origin.CGFloat x = a2;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751980);
  v100 = *(unsigned int (***)(void *, uint64_t, uint64_t))(v104 - 8);
  MEMORY[0x270FA5388](v104);
  double v87 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751988);
  MEMORY[0x270FA5388](v9 - 8);
  v103 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751990);
  MEMORY[0x270FA5388](v11 - 8);
  v101 = (char **)((char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char **)((char *)&v83 - v14);
  uint64_t v16 = sub_24A056788();
  v106 = *(void (***)(char *, uint64_t, uint64_t))(v16 - 8);
  MEMORY[0x270FA5388](v16);
  CGRect v93 = (char *)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751998);
  MEMORY[0x270FA5388](v18 - 8);
  v99 = (char *)&v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697519A0);
  MEMORY[0x270FA5388](v102);
  char v21 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24A056778();
  CGRect v98 = *(char **)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  double v86 = (char *)&v83 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v83 - v25;
  uint64_t v27 = sub_24A01C588(qword_26974FD88, MEMORY[0x263F18AB8]);
  uint64_t v28 = sub_24A057738();
  uint64_t v29 = MEMORY[0x263F8EE78];
  CGRect v94 = v15;
  v108 = v21;
  uint64_t v109 = v16;
  uint64_t v95 = v27;
  uint64_t v107 = a1;
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v112 = MEMORY[0x263F8EE78];
    sub_249FBAE48(0, v28 & ~(v28 >> 63), 0);
    uint64_t result = sub_24A057728();
    if (v30 < 0) {
      goto LABEL_33;
    }
    uint64_t v32 = (void (**)(char *))(v98 + 16);
    uint64_t v33 = (void (**)(char *, uint64_t))(v98 + 8);
    do
    {
      uint64_t v34 = (void (*)(uint64_t *, void))sub_24A057778();
      (*v32)(v26);
      v34(&v111, 0);
      sub_24A056808();
      LOBYTE(v111) = v35 & 1;
      char v110 = v36 & 1;
      sub_24A056758();
      uint64_t v38 = v37;
      uint64_t v40 = v39;
      (*v33)(v26, v22);
      uint64_t v29 = v112;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249FBAE48(0, *(void *)(v29 + 16) + 1, 1);
        uint64_t v29 = v112;
      }
      unint64_t v42 = *(void *)(v29 + 16);
      unint64_t v41 = *(void *)(v29 + 24);
      if (v42 >= v41 >> 1)
      {
        sub_249FBAE48(v41 > 1, v42 + 1, 1);
        uint64_t v29 = v112;
      }
      *(void *)(v29 + 16) = v42 + 1;
      uint64_t v43 = v29 + 16 * v42;
      *(void *)(v43 + 32) = v38;
      *(void *)(v43 + 40) = v40;
      uint64_t v44 = v109;
      sub_24A057768();
      --v30;
      uint64_t v15 = v94;
    }
    while (v30);
    uint64_t v16 = v44;
    char v21 = v108;
  }
  uint64_t v45 = *(void *)(v29 + 16);
  double v46 = a6;
  if (!v45) {
    goto LABEL_18;
  }
  if (v45 == 1)
  {
    uint64_t v47 = 0;
    double v46 = a6;
  }
  else
  {
    uint64_t v47 = v45 & 0x7FFFFFFFFFFFFFFELL;
    uint64_t v48 = (double *)(v29 + 48);
    uint64_t v49 = v45 & 0x7FFFFFFFFFFFFFFELL;
    double v46 = a6;
    do
    {
      double v50 = *(v48 - 2);
      double v51 = *v48;
      v48 += 4;
      double v46 = v46 + v50 - a6 + v51 - a6;
      v49 -= 2;
    }
    while (v49);
    if (v45 == v47) {
      goto LABEL_18;
    }
  }
  uint64_t v52 = v45 - v47;
  CGFloat v53 = (double *)(v29 + 16 * v47 + 32);
  do
  {
    double v54 = *v53;
    v53 += 2;
    double v46 = v46 + v54 - a6;
    --v52;
  }
  while (v52);
LABEL_18:
  double v55 = (CGRectGetWidth(v105) - v46) * 0.5;
  uint64_t v56 = v106;
  uint64_t v57 = v106[2];
  double v58 = v99;
  UIEdgeInsets v92 = v106 + 2;
  objc_super v91 = v57;
  v57(v99, v107, v16);
  v56[4](v93, (uint64_t)v58, v16);
  sub_24A01C588(&qword_2697519A8, MEMORY[0x263F18AB8]);
  sub_24A057508();
  uint64_t v85 = *(int *)(v102 + 36);
  *(void *)&v21[v85] = 0;
  double v59 = &v21[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697519B0) + 36)];
  v90 = (void (**)(char *))(v98 + 16);
  v89 = (void (**)(char *, uint64_t))(v56 + 1);
  uint64_t v102 = (uint64_t)(v98 + 56);
  double v88 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48);
  v106 = (void (**)(char *, uint64_t, uint64_t))(v98 + 32);
  v99 = (char *)(v100 + 7);
  v100 += 6;
  uint64_t v97 = v29 + 32;
  CGRect v96 = (void (**)(char *, uint64_t))(v98 + 8);
  uint64_t v107 = v22;
  CGRect v98 = v59;
  uint64_t v84 = v29;
  id v83 = v26;
  while (1)
  {
    uint64_t v60 = *(void *)v59;
    id v61 = v21;
    uint64_t v62 = v109;
    sub_24A057758();
    if (v60 == v111)
    {
      uint64_t v63 = (uint64_t)v103;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v102)(v103, 1, 1, v22);
LABEL_22:
      sub_249F6E790(v63, &qword_269751988);
      uint64_t v66 = (uint64_t)v101;
      uint64_t v67 = v104;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))v99)(v101, 1, 1, v104);
      goto LABEL_25;
    }
    double v64 = (void (*)(uint64_t *, void))sub_24A057778();
    uint64_t v63 = (uint64_t)v103;
    (*v90)(v103);
    v64(&v111, 0);
    double v65 = v93;
    v91(v93, (uint64_t)v61, v62);
    sub_24A057768();
    (*v89)(v65, v62);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))v102)(v63, 0, 1, v22);
    if ((*v88)(v63, 1, v22) == 1) {
      goto LABEL_22;
    }
    uint64_t v68 = v104;
    uint64_t v69 = v107;
    CGFloat v70 = *v106;
    double v71 = v86;
    (*v106)(v86, v63, v107);
    CGFloat v72 = &v87[*(int *)(v68 + 48)];
    uint64_t v73 = (uint64_t)v108;
    uint64_t v74 = v85;
    uint64_t v75 = *(void *)&v108[v85];
    uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v70)(v72, v71, v69);
    if (__OFADD__(v75, 1)) {
      goto LABEL_32;
    }
    *(void *)(v73 + v74) = v75 + 1;
    CGFloat v76 = v101;
    double v77 = (char *)v101 + *(int *)(v68 + 48);
    void *v101 = v75;
    double v78 = v72;
    uint64_t v66 = (uint64_t)v76;
    v70(v77, (uint64_t)v78, v69);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))v99)(v66, 0, 1, v68);
    uint64_t v67 = v68;
    uint64_t v15 = v94;
    uint64_t v26 = v83;
    uint64_t v29 = v84;
LABEL_25:
    sub_249F6E664(v66, (uint64_t)v15, &qword_269751990);
    if ((*v100)(v15, 1, v67) == 1)
    {
      sub_249F6E790((uint64_t)v108, &qword_2697519A0);
      return swift_bridgeObjectRelease();
    }
    unint64_t v79 = *v15;
    uint64_t v22 = v107;
    uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))*v106)(v26, (char *)v15 + *(int *)(v67 + 48), v107);
    char v21 = v108;
    if ((v79 & 0x8000000000000000) != 0) {
      break;
    }
    if (v79 >= *(void *)(v29 + 16)) {
      goto LABEL_31;
    }
    double v80 = *(double *)(v97 + 16 * v79);
    CGRectGetHeight(v105);
    sub_24A057268();
    sub_24A056808();
    LOBYTE(v111) = v81 & 1;
    LOBYTE(v112) = v82 & 1;
    sub_24A056768();
    (*v96)(v26, v22);
    double v55 = v55 + v80 - a6;
    double v59 = v98;
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_24A01C588(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for PlayClockFace.Character()
{
  return &type metadata for PlayClockFace.Character;
}

ValueMetadata *type metadata accessor for PlayClockFace.BlurredSeparator()
{
  return &type metadata for PlayClockFace.BlurredSeparator;
}

uint64_t sub_24A01C5F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A01C674()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A01C690()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A01C6AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A0569D8();
  *a1 = result;
  return result;
}

uint64_t sub_24A01C6D8()
{
  return sub_24A0569E8();
}

uint64_t sub_24A01C704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056818();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A01C768(uint64_t a1)
{
  uint64_t v2 = sub_24A056818();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A01C7C8()
{
  unint64_t result = qword_2697519F8;
  if (!qword_2697519F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697519C8);
    sub_249F6EE60(&qword_269751A00, &qword_2697519B8);
    sub_249F6EE60(&qword_269750D98, &qword_269750DA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697519F8);
  }
  return result;
}

uint64_t sub_24A01C88C()
{
  return sub_24A01C8D0(&qword_269751A08, &qword_2697519F0, (void (*)(void))sub_24A01C94C);
}

uint64_t sub_24A01C8D0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A01C94C()
{
  unint64_t result = qword_269751A10;
  if (!qword_269751A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A10);
  }
  return result;
}

uint64_t sub_24A01C9A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974F448, (void (*)(uint64_t))type metadata accessor for RollingClockViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
  swift_beginAccess();
  return sub_24A02250C(v4, a2, type metadata accessor for TimeString);
}

uint64_t sub_24A01CA88(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for TimeString(0);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24A02250C(a1, (uint64_t)v6, type metadata accessor for TimeString);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  sub_24A022488(&qword_26974F448, (void (*)(uint64_t))type metadata accessor for RollingClockViewModel);
  sub_24A056468();
  swift_release();
  return sub_249F8C330((uint64_t)v6);
}

uint64_t sub_24A01CBC4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751A60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A01F4C8();
  sub_24A057EB8();
  if (!v2)
  {
    sub_249F9AB68();
    sub_24A057C88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_249F7B58C((uint64_t)v14, (uint64_t)v15);
    long long v9 = v15[5];
    *(_OWORD *)(a2 + 64) = v15[4];
    *(_OWORD *)(a2 + 80) = v9;
    *(unsigned char *)(a2 + 96) = v16;
    long long v10 = v15[1];
    *(_OWORD *)a2 = v15[0];
    *(_OWORD *)(a2 + 16) = v10;
    long long v11 = v15[3];
    *(_OWORD *)(a2 + 32) = v15[2];
    *(_OWORD *)(a2 + 48) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_24A01CD58(uint64_t a1)
{
  unint64_t v2 = sub_24A01F4C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24A01CD94(uint64_t a1)
{
  unint64_t v2 = sub_24A01F4C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24A01CDD0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A01CBC4(a1, a2);
}

uint64_t sub_24A01CDE8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751A70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24A01F4C8();
  sub_24A057EC8();
  sub_249F9ABBC();
  sub_24A057CD8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24A01CF28()
{
  return swift_retain();
}

uint64_t sub_24A01CFCC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  *a2 = *(void *)(v3 + 16);
  return swift_retain();
}

uint64_t sub_24A01D078()
{
  return swift_release();
}

uint64_t sub_24A01D158()
{
  uint64_t v1 = type metadata accessor for TimeString(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getKeyPath();
  uint64_t v12 = v0;
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v4 = *(void *)(v0 + 16);
  swift_getKeyPath();
  uint64_t v12 = v4;
  sub_24A022488(&qword_26974F448, (void (*)(uint64_t))type metadata accessor for RollingClockViewModel);
  swift_retain();
  sub_24A056478();
  swift_release();
  uint64_t v5 = v4 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
  swift_beginAccess();
  sub_24A02250C(v5, (uint64_t)v3, type metadata accessor for TimeString);
  swift_release();
  uint64_t v6 = sub_24A057418();
  uint64_t v7 = *v3;
  if (v6 == 2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v10 = 9142498;
    unint64_t v11 = 0xA300000000000000;
    sub_24A057438();
    uint64_t v7 = v10;
  }
  sub_249F8C330((uint64_t)v3);
  return v7;
}

uint64_t sub_24A01D358()
{
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24A01D408@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01D4B4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A01D598()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A01D734()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01D7D8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  *a2 = *(void *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01D884()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A01D964()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01DA08@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  *a2 = *(void *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01DAB4()
{
  return swift_bridgeObjectRelease();
}

void sub_24A01DB94()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A01D158();
  uint64_t v4 = v3;
  swift_getKeyPath();
  v8[0] = v0;
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  if (v2 == *(void *)(v0 + 24) && v4 == *(void *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_24A057D48();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0) {
      sub_24A01D598();
    }
  }
  swift_getKeyPath();
  v8[0] = v1;
  sub_24A056478();
  swift_release();
  if (*(void *)(v1 + 48)) {
    goto LABEL_11;
  }
  v8[0] = sub_24A01F744((int64_t *)0xFFFFFFFFFFFFFFFBLL, 5);
  sub_24A020A28();
  if (*(void *)(v8[0] + 16) >= 5uLL)
  {
    v8[1] = v8[0] + 32;
    long long v9 = xmmword_24A061580;
    uint64_t v10 = sub_24A01DDE0;
    uint64_t v11 = 0;
    sub_24A021224(v8);
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    swift_retain();
    sub_24A056468();
    swift_release();
    swift_release();
LABEL_11:
    swift_bridgeObjectRetain();
    return;
  }
  __break(1u);
}

double sub_24A01DDE0@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result = (double)*a1 * 0.0174532925;
  *a2 = result;
  return result;
}

uint64_t sub_24A01DDFC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01DEA0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  *a2 = *(void *)(v3 + 56);
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A01DF4C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A01E02C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A056538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v31[0] = v0;
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  if (*(void *)(v0 + 56))
  {
    uint64_t v9 = *(void *)(v0 + 56);
LABEL_6:
    swift_bridgeObjectRetain();
    return v9;
  }
  uint64_t v25 = v4;
  uint64_t v26 = v6;
  uint64_t v27 = v5;
  uint64_t v28 = v8;
  swift_getKeyPath();
  v31[0] = v0;
  sub_24A056478();
  swift_release();
  swift_beginAccess();
  sub_249F77718(v0 + 64, (uint64_t)v30);
  sub_249F75B7C((uint64_t)v30, (uint64_t)v31);
  sub_249F77B9C((uint64_t)v30);
  sub_24A021998((uint64_t)v31);
  sub_249F75BD8((uint64_t)v31);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  v31[0] = v0;
  sub_24A056468();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  v31[0] = v0;
  sub_24A056478();
  swift_release();
  if (!*(void *)(v0 + 56))
  {
    uint64_t v24 = v0 + 64;
    if (qword_26B16F9B8 != -1) {
      goto LABEL_19;
    }
    goto LABEL_8;
  }
  swift_getKeyPath();
  v31[0] = v0;
  sub_24A056478();
  swift_release();
  uint64_t v9 = *(void *)(v0 + 56);
  if (v9)
  {
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  __break(1u);
LABEL_11:
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v25, v27);
  while (1)
  {
    swift_retain_n();
    uint64_t v15 = sub_24A056518();
    os_log_type_t v16 = sub_24A0577B8();
    LODWORD(v25) = v16;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v29[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      v23[1] = v17 + 4;
      swift_getKeyPath();
      v31[0] = v1;
      sub_24A056478();
      swift_release();
      sub_249F77718(v24, (uint64_t)v30);
      sub_249F75B7C((uint64_t)v30, (uint64_t)v31);
      sub_249F77B9C((uint64_t)v30);
      uint64_t v19 = sub_249F73AC4();
      unint64_t v21 = v20;
      sub_249F75BD8((uint64_t)v31);
      v31[0] = sub_249F782DC(v19, v21, v29);
      sub_24A057978();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F61000, v15, (os_log_type_t)v25, "unsupported look for Play: %s, choosing default", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v18, -1, -1);
      MEMORY[0x24C5BA360](v17, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v27);
    uint64_t v22 = sub_249F84F24();
    if (!*(void *)(v22 + 16))
    {
      memset(v31, 0, sizeof(v31));
      unsigned __int8 v32 = -1;
      swift_bridgeObjectRelease();
      __break(1u);
    }
    sub_249F75B7C(v22 + 32, (uint64_t)v31);
    swift_bridgeObjectRelease();
    if (v32 != 255) {
      break;
    }
    __break(1u);
LABEL_19:
    swift_once();
LABEL_8:
    uint64_t v12 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    uint64_t v13 = v12;
    uint64_t v14 = (uint64_t)v25;
    sub_249F7AA94(v13, (uint64_t)v25);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v14, 1, v27) != 1) {
      goto LABEL_11;
    }
    sub_249FB8AA8((uint64_t)v28);
    sub_249F9F8CC((uint64_t)v25);
  }
  uint64_t result = sub_24A057BC8();
  __break(1u);
  return result;
}

uint64_t sub_24A01E658@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  swift_beginAccess();
  return sub_249F77718(v1 + 64, a1);
}

uint64_t sub_24A01E71C(uint64_t a1, long long *a2)
{
  uint64_t v3 = a1 + 64;
  swift_beginAccess();
  sub_24A0225D8(a2, v3);
  return swift_endAccess();
}

uint64_t (*sub_24A01E780())()
{
  return j__swift_endAccess;
}

uint64_t sub_24A01E7D4()
{
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 161);
}

uint64_t sub_24A01E888@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 161);
  return result;
}

uint64_t sub_24A01E944()
{
  return swift_release();
}

void (*sub_24A01EA14(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_getKeyPath();
  v3[5] = OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[6] = sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_24A056498();
  swift_release();
  v3[7] = sub_24A01E780();
  return sub_24A01EB30;
}

void sub_24A01EB30(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_24A056488();
  swift_release();

  free(v1);
}

uint64_t sub_24A01EBBC()
{
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  return *(unsigned __int8 *)(v0 + 162);
}

uint64_t sub_24A01EC5C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 162);
  return result;
}

uint64_t sub_24A01ED04()
{
  return swift_release();
}

uint64_t sub_24A01EDD4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_249F77B9C(v0 + 64);
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  uint64_t v2 = sub_24A0564B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_24A01EEA4()
{
  return type metadata accessor for PlayViewModel();
}

uint64_t type metadata accessor for PlayViewModel()
{
  uint64_t result = qword_269751A20;
  if (!qword_269751A20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A01EEF8()
{
  uint64_t result = sub_24A0564B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayViewModelContext()
{
  return &type metadata for PlayViewModelContext;
}

unint64_t sub_24A01EFD4(uint64_t a1)
{
  unint64_t result = sub_24A01EFFC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A01EFFC()
{
  unint64_t result = qword_269751A30;
  if (!qword_269751A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A30);
  }
  return result;
}

unint64_t sub_24A01F050(void *a1)
{
  a1[1] = sub_24A01F090();
  a1[2] = sub_24A01F0E4();
  a1[3] = sub_24A01F138();
  unint64_t result = sub_24A01F18C();
  a1[4] = result;
  return result;
}

unint64_t sub_24A01F090()
{
  unint64_t result = qword_269751A38;
  if (!qword_269751A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A38);
  }
  return result;
}

unint64_t sub_24A01F0E4()
{
  unint64_t result = qword_269751A40;
  if (!qword_269751A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A40);
  }
  return result;
}

unint64_t sub_24A01F138()
{
  unint64_t result = qword_269751A48;
  if (!qword_269751A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A48);
  }
  return result;
}

unint64_t sub_24A01F18C()
{
  unint64_t result = qword_269751A50;
  if (!qword_269751A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A50);
  }
  return result;
}

uint64_t sub_24A01F1E0()
{
  return swift_release();
}

uint64_t sub_24A01F2B0()
{
  return swift_release();
}

void (*sub_24A01F380(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A01EA14(v2);
  return sub_249F6FBD0;
}

uint64_t sub_24A01F3DC(uint64_t a1)
{
  uint64_t result = sub_24A022488(&qword_269751A58, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_24A01F43C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 162) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_24A01F45C()
{
  return sub_24A01F474();
}

uint64_t sub_24A01F474()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 161) = v2;
  return result;
}

unint64_t sub_24A01F4C8()
{
  unint64_t result = qword_269751A68;
  if (!qword_269751A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751A68);
  }
  return result;
}

size_t sub_24A01F51C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750560);
  uint64_t v3 = *(void *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      sub_24A020D3C(&v11, (uint64_t)v6 + v5, v1, a1);
      uint64_t v10 = v9;
      swift_bridgeObjectRetain();
      sub_249F71790();
      if (v10 == v1) {
        return (size_t)v6;
      }
      __break(1u);
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A01F670(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 == -1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v5 = result;
  if (v3 <= 0)
  {
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269750580);
    uint64_t v6 = (void *)swift_allocObject();
    int64_t v7 = _swift_stdlib_malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 25;
    }
    v6[2] = v3;
    v6[3] = 2 * (v8 >> 3);
  }
  size_t result = sub_24A020B70((uint64_t)&v9, (uint64_t)(v6 + 4), v3, v5, a2);
  if (result == v3) {
    return (uint64_t)v6;
  }
LABEL_14:
  __break(1u);
  return result;
}

int64_t *sub_24A01F744(int64_t *result, int64_t a2)
{
  uint64_t v2 = a2 - (void)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    if (!v2) {
      return (int64_t *)MEMORY[0x263F8EE78];
    }
    int64_t v4 = (int64_t)result;
    if (v2 <= 0)
    {
      uint64_t v5 = (int64_t *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269750580);
      uint64_t v5 = (int64_t *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v2;
      v5[3] = 2 * (v7 >> 3);
    }
    size_t result = sub_24A020BFC(v8, v5 + 4, v2, v4, a2);
    if (result == (int64_t *)v2) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24A01F80C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A88);
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A01F978(char a1, int64_t a2, char a3, void *a4)
{
  return sub_24A020034(a1, a2, a3, a4, &qword_26B16F9C8, &qword_26B16FAA0);
}

uint64_t sub_24A01F98C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A01FB14(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A98);
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A01FC80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751AA0);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A01FDE0(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750560);
  uint64_t v10 = *(void *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
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
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for WorldViewModel.Pin(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A020020(char a1, int64_t a2, char a3, void *a4)
{
  return sub_24A020034(a1, a2, a3, a4, &qword_269750480, &qword_269750598);
}

uint64_t sub_24A020034(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
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
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    void v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A0201DC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269750468);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A02033C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697505A0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A02049C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B16FAC0);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A0205EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26974F730);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A020758(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269750460);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A0208C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269750580);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

void sub_24A020A28()
{
  uint64_t v1 = *v0;
  unint64_t v2 = *(void *)(*v0 + 16);
  unint64_t v3 = v2 - 2;
  if (v2 >= 2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unint64_t v13 = 0;
      MEMORY[0x24C5BA370](&v13, 8);
      uint64_t v6 = (v13 * (unsigned __int128)v2) >> 64;
      if (v2 > v13 * v2)
      {
        unint64_t v7 = -(uint64_t)v2 % v2;
        if (v7 > v13 * v2)
        {
          do
          {
            unint64_t v13 = 0;
            MEMORY[0x24C5BA370](&v13, 8);
          }
          while (v7 > v13 * v2);
          uint64_t v6 = (v13 * (unsigned __int128)v2) >> 64;
        }
      }
      unint64_t v8 = v4 + v6;
      if (__OFADD__(v4, v6)) {
        break;
      }
      if (v4 != v8)
      {
        unint64_t v9 = *(void *)(v1 + 16);
        if (v4 >= v9) {
          goto LABEL_19;
        }
        if (v8 >= v9) {
          goto LABEL_20;
        }
        uint64_t v10 = *(void *)(v1 + 32 + 8 * v4);
        uint64_t v11 = *(void *)(v1 + 32 + 8 * v8);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v1 = sub_24A021058(v1);
        }
        unint64_t v12 = *(void *)(v1 + 16);
        if (v4 >= v12) {
          goto LABEL_21;
        }
        *(void *)(v1 + 32 + 8 * v4) = v11;
        if (v8 >= v12) {
          goto LABEL_22;
        }
        *(void *)(v1 + 32 + 8 * v8) = v10;
        *uint64_t v0 = v1;
      }
      --v2;
      if (v4++ == v3) {
        return;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
}

uint64_t sub_24A020B70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    BOOL v7 = 0;
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
    BOOL v7 = 0;
LABEL_14:
    uint64_t v8 = a4;
LABEL_15:
    *(void *)uint64_t result = a4;
    *(void *)(result + 8) = a5;
    *(void *)(result + 16) = v8;
    *(unsigned char *)(result + 24) = v7;
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_17;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a4;
  while (1)
  {
    BOOL v7 = v6 == a5;
    if (v6 != a5) {
      break;
    }
    uint64_t v8 = 0;
LABEL_8:
    *(void *)(a2 + 8 * v5) = v6;
    if (a3 - 1 == v5) {
      goto LABEL_15;
    }
    ++v5;
    BOOL v9 = v6 == a5;
    uint64_t v6 = v8;
    if (v9)
    {
      BOOL v7 = 1;
      a3 = v5;
      goto LABEL_15;
    }
  }
  uint64_t v8 = v6 + 1;
  if (!__OFADD__(v6, 1)) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

int64_t *sub_24A020BFC(int64_t *result, int64_t *a2, uint64_t a3, int64_t a4, int64_t a5)
{
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_6:
    int64_t v5 = a4;
LABEL_7:
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = v5;
    return (int64_t *)a3;
  }
  if (a3 < 0) {
    goto LABEL_31;
  }
  if (a5 == a4)
  {
LABEL_5:
    a3 = 0;
    goto LABEL_6;
  }
  if (a5 < a4) {
    goto LABEL_32;
  }
  int64_t v6 = a5 - a4;
  if (a5 > a4)
  {
    int64_t v5 = a4 + 1;
    *a2 = a4;
    if (a3 == 1) {
      goto LABEL_7;
    }
    if (v5 == a5)
    {
      a3 = 1;
      int64_t v5 = a5;
      goto LABEL_7;
    }
    unint64_t v7 = v6 - 2;
    if (v6 - 2 >= (unint64_t)(a3 - 2)) {
      unint64_t v7 = a3 - 2;
    }
    if (v7 >= ~a4 + a5) {
      unint64_t v7 = ~a4 + a5;
    }
    unint64_t v8 = v7 + 1;
    if (v8 >= 5)
    {
      uint64_t v11 = v8 & 3;
      if ((v8 & 3) == 0) {
        uint64_t v11 = 4;
      }
      unint64_t v12 = v8 - v11;
      int64_t v13 = v5 + v8 - v11;
      uint64_t v10 = &a2[v8 - v11];
      uint64_t v9 = v12 + 2;
      int64x2_t v14 = vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_24A05C6A0);
      unint64_t v15 = (int64x2_t *)(a2 + 3);
      int64x2_t v16 = vdupq_n_s64(2uLL);
      do
      {
        v15[-1] = v14;
        *unint64_t v15 = vaddq_s64(v14, v16);
        int64x2_t v14 = vaddq_s64(v14, vdupq_n_s64(4uLL));
        v15 += 2;
        v12 -= 4;
      }
      while (v12);
      int64_t v5 = v13;
    }
    else
    {
      uint64_t v9 = 2;
      uint64_t v10 = a2;
    }
    unint64_t v17 = v10 + 1;
    while (v5 < a5)
    {
      int64_t v18 = v5 + 1;
      *unint64_t v17 = v5;
      if (a3 == v9)
      {
        ++v5;
        goto LABEL_7;
      }
      ++v9;
      ++v17;
      ++v5;
      if (a5 == v18)
      {
        int64_t v5 = a5;
        a3 = a5 - a4;
        goto LABEL_7;
      }
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_24A020D3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for WorldViewModel.Pin(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int64x2_t v14 = (char *)&v29 - v13;
  uint64_t v34 = a4;
  uint64_t v17 = *(void *)(a4 + 64);
  uint64_t v16 = a4 + 64;
  uint64_t v15 = v17;
  uint64_t v18 = -1 << *(unsigned char *)(v16 - 32);
  if (-v18 < 64) {
    uint64_t v19 = ~(-1 << -(char)v18);
  }
  else {
    uint64_t v19 = -1;
  }
  unint64_t v20 = v19 & v15;
  if (!a2)
  {
    int64_t v21 = 0;
LABEL_37:
    *a1 = v34;
    a1[1] = v16;
    a1[2] = ~v18;
    a1[3] = v21;
    a1[4] = v20;
    return;
  }
  if (!a3)
  {
    int64_t v21 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v31 = -1 << *(unsigned char *)(v16 - 32);
  unsigned __int8 v32 = a1;
  int64_t v21 = 0;
  uint64_t v22 = 0;
  int64_t v33 = (unint64_t)(63 - v18) >> 6;
  int64_t v30 = v33 - 1;
  if (!v20) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  unint64_t v24 = v23 | (v21 << 6);
  while (1)
  {
    ++v22;
    uint64_t v28 = *(void *)(v9 + 72);
    sub_24A02250C(*(void *)(v34 + 56) + v28 * v24, (uint64_t)v11, type metadata accessor for WorldViewModel.Pin);
    sub_24A022574((uint64_t)v11, (uint64_t)v14);
    sub_24A022574((uint64_t)v14, a2);
    if (v22 == a3) {
      goto LABEL_36;
    }
    a2 += v28;
    if (v20) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v25 >= v33) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v16 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v20 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v21 = v25;
  }
  v21 += 2;
  if (v25 + 1 >= v33)
  {
    unint64_t v20 = 0;
    int64_t v21 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v16 + 8 * v21);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v33) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v16 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v21 = v25 + 3;
  if (v25 + 3 >= v33)
  {
    unint64_t v20 = 0;
    int64_t v21 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v16 + 8 * v21);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v21;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v33)
  {
LABEL_32:
    unint64_t v20 = 0;
LABEL_36:
    uint64_t v18 = v31;
    a1 = v32;
    goto LABEL_37;
  }
  unint64_t v26 = *(void *)(v16 + 8 * v27);
  if (v26)
  {
LABEL_17:
    int64_t v25 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v25 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v25 >= v33)
    {
      unint64_t v20 = 0;
      int64_t v21 = v30;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v16 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_24A02101C(uint64_t a1)
{
  return sub_24A01F98C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A021030(uint64_t a1)
{
  return sub_24A01FC80(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A021044(void *a1)
{
  return sub_24A01FDE0(0, a1[2], 0, a1);
}

uint64_t sub_24A021058(uint64_t a1)
{
  return sub_24A0208C8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A02106C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  unint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    int64_t v5 = v2 + 4;
    int64_t v6 = (uint64_t *)(result + 40);
    while (1)
    {
      uint64_t v7 = *(v6 - 1);
      uint64_t v8 = *v6;
      if (v3)
      {
        uint64_t result = swift_bridgeObjectRetain();
        BOOL v9 = __OFSUB__(v3--, 1);
        if (v9) {
          goto LABEL_28;
        }
      }
      else
      {
        unint64_t v10 = v2[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_29;
        }
        int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269751AC0);
        uint64_t v13 = (void *)swift_allocObject();
        uint64_t v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 24;
        void v13[2] = v12;
        v13[3] = 2 * v14;
        uint64_t v15 = v13 + 4;
        uint64_t v16 = v2[3] >> 1;
        int64_t v5 = &v13[3 * v16 + 4];
        uint64_t v17 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        if (v2[2])
        {
          if (v13 != v2 || v15 >= &v2[3 * v16 + 4]) {
            memmove(v15, v2 + 4, 24 * v16);
          }
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        uint64_t result = swift_release();
        unint64_t v2 = v13;
        BOOL v9 = __OFSUB__(v17, 1);
        uint64_t v3 = v17 - 1;
        if (v9)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
      v6 += 2;
      *int64_t v5 = v4;
      v5[1] = v7;
      v5[2] = v8;
      v5 += 3;
      if (v1 == ++v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_24:
  unint64_t v19 = v2[3];
  if (v19 >= 2)
  {
    unint64_t v20 = v19 >> 1;
    BOOL v9 = __OFSUB__(v20, v3);
    uint64_t v21 = v20 - v3;
    if (v9) {
      goto LABEL_30;
    }
    v2[2] = v21;
  }
  return (uint64_t)v2;
}

void *sub_24A021224(void *result)
{
  void *(*v46)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[2];

  long long v1 = *((_OWORD *)result + 1);
  v49[0] = *(_OWORD *)result;
  v49[1] = v1;
  uint64_t v2 = v1;
  uint64_t v3 = *((void *)&v1 + 1) >> 1;
  uint64_t v4 = (*((void *)&v1 + 1) >> 1) - v1;
  if (__OFSUB__(*((void *)&v1 + 1) >> 1, (void)v1))
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  int64_t v5 = result;
  uint64_t v6 = *((void *)&v49[0] + 1);
  if (v4 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A80);
    uint64_t v7 = (void *)swift_allocObject();
    uint64_t v8 = v7 + 4;
    int64_t v9 = _swift_stdlib_malloc_size(v7);
    uint64_t v10 = v9 - 32;
    if (v9 < 32) {
      uint64_t v10 = v9 - 25;
    }
    uint64_t v45 = *((void *)&v49[0] + 1);
    uint64_t v11 = v10 >> 3;
    v7[2] = v4;
    v7[3] = 2 * (v10 >> 3);
    uint64_t v12 = (v10 >> 3) & 0x7FFFFFFFFFFFFFFFLL;
    double v46 = (void *(*)(uint64_t *__return_ptr, uint64_t *))v5[4];
    sub_24A02236C((uint64_t)v49);
    uint64_t v13 = v2 + v12 - v3;
    uint64_t v43 = v3;
    if (v2 <= v3) {
      uint64_t v14 = v3;
    }
    else {
      uint64_t v14 = v2;
    }
    uint64_t v15 = v14 - v2;
    unint64_t v16 = v11 | 0x8000000000000000;
    uint64_t result = (void *)swift_retain();
    unint64_t v17 = 0;
    uint64_t v18 = v2;
    uint64_t v19 = 0;
    uint64_t v44 = v18;
    uint64_t v20 = v45 + 8 * v18;
    do
    {
      if (v4 == v19)
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      if (v15 == v19) {
        goto LABEL_43;
      }
      uint64_t v48 = *(void *)(v20 + 8 * v19);
      uint64_t result = v46(&v47, &v48);
      if (v16 == v19) {
        goto LABEL_44;
      }
      uint64_t v21 = v19 + 1;
      v8[v19] = v47;
      v17 -= 8;
      uint64_t v19 = v21;
    }
    while (v4 != v21);
    uint64_t v22 = &v8[v17 / 0xFFFFFFFFFFFFFFF8];
    uint64_t v2 = v44;
    uint64_t v6 = v45;
    uint64_t v23 = v44 + v21;
    uint64_t v25 = v43 - v23;
    BOOL v24 = v43 <= v23;
    if (v43 != v23) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
  if (v4 < 0) {
    goto LABEL_48;
  }
  double v46 = (void *(*)(uint64_t *__return_ptr, uint64_t *))result[4];
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  uint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 24) >> 1;
  sub_24A02236C((uint64_t)v49);
  uint64_t result = (void *)swift_retain();
  uint64_t v22 = v7 + 4;
  uint64_t v23 = v2;
  uint64_t v25 = v3 - v2;
  BOOL v24 = v3 <= v2;
  if (v3 != v2)
  {
LABEL_17:
    if (v24)
    {
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    if (v23 < v2)
    {
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    unint64_t v26 = (uint64_t *)(v6 + 8 * v23);
    while (1)
    {
      uint64_t v27 = *v26++;
      uint64_t v48 = v27;
      uint64_t result = v46(&v47, &v48);
      uint64_t v28 = v47;
      if (!v13)
      {
        unint64_t v29 = v7[3];
        if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_46;
        }
        int64_t v30 = v29 & 0xFFFFFFFFFFFFFFFELL;
        if (v30 <= 1) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = v30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269751A80);
        unsigned __int8 v32 = (void *)swift_allocObject();
        int64_t v33 = _swift_stdlib_malloc_size(v32);
        uint64_t v34 = v33 - 32;
        if (v33 < 32) {
          uint64_t v34 = v33 - 25;
        }
        uint64_t v35 = v34 >> 3;
        v32[2] = v31;
        v32[3] = 2 * (v34 >> 3);
        unint64_t v36 = (unint64_t)(v32 + 4);
        uint64_t v37 = v7[3] >> 1;
        if (v7[2])
        {
          if (v32 != v7 || v36 >= (unint64_t)&v7[v37 + 4]) {
            memmove(v32 + 4, v7 + 4, 8 * v37);
          }
          v7[2] = 0;
        }
        uint64_t v22 = (void *)(v36 + 8 * v37);
        uint64_t v13 = (v35 & 0x7FFFFFFFFFFFFFFFLL) - v37;
        uint64_t result = (void *)swift_release();
        uint64_t v7 = v32;
      }
      BOOL v39 = __OFSUB__(v13--, 1);
      if (v39) {
        break;
      }
      *v22++ = v28;
      if (!--v25) {
        goto LABEL_38;
      }
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
LABEL_38:
  sub_24A022398((uint64_t)v49);
  uint64_t result = (void *)swift_release();
  unint64_t v40 = v7[3];
  if (v40 < 2) {
    return v7;
  }
  unint64_t v41 = v40 >> 1;
  BOOL v39 = __OFSUB__(v41, v13);
  uint64_t v42 = v41 - v13;
  if (!v39)
  {
    v7[2] = v42;
    return v7;
  }
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_24A021524()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TimeString(0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A01D158();
  uint64_t v7 = v6;
  swift_getKeyPath();
  uint64_t v8 = v0 + OBJC_IVAR____TtC11ClockPoster13PlayViewModel___observationRegistrar;
  uint64_t v29 = v0;
  uint64_t v9 = sub_24A022488(&qword_26974FA48, (void (*)(uint64_t))type metadata accessor for PlayViewModel);
  sub_24A056478();
  swift_release();
  if (v5 == *(void *)(v0 + 24) && v7 == *(void *)(v0 + 32))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_24A057D48();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      sub_24A01D598();
    }
  }
  swift_getKeyPath();
  uint64_t v29 = v1;
  sub_24A056478();
  swift_release();
  uint64_t result = *(void *)(v1 + 40);
  if (!result)
  {
    swift_getKeyPath();
    uint64_t v29 = v1;
    sub_24A056478();
    swift_release();
    uint64_t v12 = *(void *)(v1 + 16);
    swift_getKeyPath();
    uint64_t v29 = v12;
    sub_24A022488(&qword_26974F448, (void (*)(uint64_t))type metadata accessor for RollingClockViewModel);
    swift_retain();
    sub_24A056478();
    swift_release();
    uint64_t v13 = v12 + OBJC_IVAR____TtC11ClockPoster21RollingClockViewModel__timeString;
    swift_beginAccess();
    sub_24A02250C(v13, (uint64_t)v4, type metadata accessor for TimeString);
    swift_release();
    if (sub_24A057418() == 2)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v27 = 9142498;
      unint64_t v28 = 0xA300000000000000;
      sub_24A057438();
    }
    sub_249F8C330((uint64_t)v4);
    uint64_t v14 = sub_24A057418();
    uint64_t v26 = v9;
    if (v14)
    {
      uint64_t v15 = v14;
      v24[1] = v8;
      uint64_t v25 = v1;
      uint64_t v27 = MEMORY[0x263F8EE78];
      uint64_t result = sub_249FBAD68(0, v14 & ~(v14 >> 63), 0);
      if (v15 < 0)
      {
        __break(1u);
        goto LABEL_21;
      }
      uint64_t v16 = v27;
      do
      {
        uint64_t v17 = sub_24A0574D8();
        uint64_t v19 = v18;
        uint64_t v27 = v16;
        unint64_t v21 = *(void *)(v16 + 16);
        unint64_t v20 = *(void *)(v16 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_249FBAD68(v20 > 1, v21 + 1, 1);
          uint64_t v16 = v27;
        }
        *(void *)(v16 + 16) = v21 + 1;
        unint64_t v22 = v16 + 16 * v21;
        *(void *)(v22 + 32) = v17;
        *(void *)(v22 + 40) = v19;
        sub_24A057428();
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      uint64_t v1 = v25;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v16 = MEMORY[0x263F8EE78];
    }
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    v24[-2] = v1;
    v24[-1] = v16;
    uint64_t v27 = v1;
    sub_24A056468();
    swift_release();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    uint64_t v27 = v1;
    sub_24A056478();
    swift_release();
    uint64_t result = *(void *)(v1 + 40);
    if (result) {
      return result;
    }
LABEL_21:
    __break(1u);
  }
  return result;
}

uint64_t sub_24A021998(uint64_t a1)
{
  sub_249F75B7C(a1, (uint64_t)v81);
  if (v83 == 2)
  {
    swift_bridgeObjectRelease();
    sub_249F7B5E8(v81, (uint64_t)v78);
    sub_249F7B5E8(&v82, (uint64_t)v75);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A78);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_24A061590;
    uint64_t v36 = v79;
    uint64_t v37 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    uint64_t v38 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v37 + 56))(v36, v37);
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v38;
    *(void *)(v39 + 24) = 0x4063200000000000;
    id v40 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C490;
    uint64_t v74 = v39;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_12;
    unint64_t v41 = _Block_copy(&aBlock);
    id v42 = v38;
    id v43 = objc_msgSend(v40, sel_initWithDynamicProvider_, v41);
    _Block_release(v41);

    swift_release();
    *(void *)(v35 + 32) = MEMORY[0x24C5B86B0](v43);
    uint64_t v44 = v76;
    uint64_t v45 = v77;
    __swift_project_boxed_opaque_existential_1(v75, v76);
    double v46 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v45 + 40))(v44, v45);
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = v46;
    *(void *)(v47 + 24) = 0x4063200000000000;
    id v48 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v47;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_76;
    uint64_t v49 = _Block_copy(&aBlock);
    id v50 = v46;
    id v51 = objc_msgSend(v48, sel_initWithDynamicProvider_, v49);
    _Block_release(v49);

    swift_release();
    *(void *)(v35 + 40) = MEMORY[0x24C5B86B0](v51);
    *(void *)(v35 + 48) = sub_24A056F08();
    uint64_t v52 = v79;
    uint64_t v53 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    double v54 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v53 + 40))(v52, v53);
    uint64_t v55 = swift_allocObject();
    *(void *)(v55 + 16) = v54;
    *(void *)(v55 + 24) = 0x4063200000000000;
    id v56 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v55;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_83;
    uint64_t v57 = _Block_copy(&aBlock);
    id v58 = v54;
    id v59 = objc_msgSend(v56, sel_initWithDynamicProvider_, v57);
    _Block_release(v57);

    swift_release();
    *(void *)(v35 + 56) = MEMORY[0x24C5B86B0](v59);
    uint64_t v60 = v76;
    uint64_t v61 = v77;
    __swift_project_boxed_opaque_existential_1(v75, v76);
    uint64_t v62 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v61 + 56))(v60, v61);
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = v62;
    *(void *)(v63 + 24) = 0x4063200000000000;
    id v64 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v63;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_90;
    double v65 = _Block_copy(&aBlock);
    id v66 = v62;
    id v67 = objc_msgSend(v64, sel_initWithDynamicProvider_, v65);
    _Block_release(v65);

    swift_release();
    *(void *)(v35 + 64) = MEMORY[0x24C5B86B0](v67);
    uint64_t aBlock = v35;
    sub_24A057588();
    uint64_t v34 = aBlock;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v75);
  }
  else
  {
    if (v83)
    {
      sub_249F75BD8((uint64_t)v81);
      return 0;
    }
    swift_bridgeObjectRelease();
    sub_249F7B5E8(v81, (uint64_t)v78);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751A78);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_24A061590;
    uint64_t v2 = v79;
    uint64_t v3 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    uint64_t v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    *(void *)(v5 + 24) = 0x4063200000000000;
    id v6 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v5;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_97;
    uint64_t v7 = _Block_copy(&aBlock);
    id v8 = v4;
    id v9 = objc_msgSend(v6, sel_initWithDynamicProvider_, v7);
    _Block_release(v7);

    swift_release();
    *(void *)(v1 + 32) = MEMORY[0x24C5B86B0](v9);
    uint64_t v10 = v79;
    uint64_t v11 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 40))(v10, v11);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    *(void *)(v13 + 24) = 0x4063200000000000;
    id v14 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v13;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_104_0;
    uint64_t v15 = _Block_copy(&aBlock);
    id v16 = v12;
    id v17 = objc_msgSend(v14, sel_initWithDynamicProvider_, v15);
    _Block_release(v15);

    swift_release();
    *(void *)(v1 + 40) = MEMORY[0x24C5B86B0](v17);
    *(void *)(v1 + 48) = sub_24A056F08();
    uint64_t v18 = v79;
    uint64_t v19 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    unint64_t v20 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 56))(v18, v19);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = 0x4063200000000000;
    id v22 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_111;
    uint64_t v23 = _Block_copy(&aBlock);
    id v24 = v20;
    id v25 = objc_msgSend(v22, sel_initWithDynamicProvider_, v23);
    _Block_release(v23);

    swift_release();
    *(void *)(v1 + 56) = MEMORY[0x24C5B86B0](v25);
    uint64_t v26 = v79;
    uint64_t v27 = v80;
    __swift_project_boxed_opaque_existential_1(v78, v79);
    unint64_t v28 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 40))(v26, v27);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v28;
    *(void *)(v29 + 24) = 0x4063200000000000;
    id v30 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v73 = sub_249F7C4E4;
    uint64_t v74 = v29;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v70 = 1107296256;
    double v71 = sub_249FDA198;
    CGFloat v72 = &block_descriptor_118;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = v28;
    id v33 = objc_msgSend(v30, sel_initWithDynamicProvider_, v31);
    _Block_release(v31);

    swift_release();
    *(void *)(v1 + 64) = MEMORY[0x24C5B86B0](v33);
    uint64_t aBlock = v1;
    sub_24A057588();
    uint64_t v34 = aBlock;
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v78);
  return v34;
}

uint64_t sub_24A0222A0()
{
  return sub_24A022308();
}

uint64_t sub_24A0222B8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_24A022308()
{
  *(void *)(*(void *)(v0 + 16) + 56) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A022354()
{
  return sub_24A0223FC();
}

uint64_t sub_24A02236C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A022398(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A0223C4()
{
  return sub_24A022438();
}

uint64_t sub_24A0223E4()
{
  return sub_24A0227EC();
}

uint64_t sub_24A0223FC()
{
  *(void *)(*(void *)(v0 + 16) + 48) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A022438()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[4];
  *(void *)(v1 + 24) = v0[3];
  *(void *)(v1 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A022488(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A0224D0()
{
  *(void *)(*(void *)(v0 + 16) + 16) = *(void *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_24A02250C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A022574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorldViewModel.Pin(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A0225D8(long long *a1, uint64_t a2)
{
  return a2;
}

unsigned char *storeEnumTagSinglePayload for PlayViewModelContext.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24A0226ACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlayViewModelContext.CodingKeys()
{
  return &type metadata for PlayViewModelContext.CodingKeys;
}

unint64_t sub_24A0226E8()
{
  unint64_t result = qword_269751AA8;
  if (!qword_269751AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751AA8);
  }
  return result;
}

unint64_t sub_24A022740()
{
  unint64_t result = qword_269751AB0;
  if (!qword_269751AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751AB0);
  }
  return result;
}

unint64_t sub_24A022798()
{
  unint64_t result = qword_269751AB8;
  if (!qword_269751AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751AB8);
  }
  return result;
}

uint64_t sub_24A0227EC()
{
  *(void *)(*(void *)(v0 + 16) + 40) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_24A02287C()
{
}

void *sub_24A022894()
{
  type metadata accessor for WorldDataProvider();
  swift_allocObject();
  unint64_t result = sub_24A0228D4();
  qword_269752440 = (uint64_t)result;
  return result;
}

void *sub_24A0228D4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B10);
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 1;
  type metadata accessor for CPUnfairLock();
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  uint64_t v3 = MEMORY[0x263F8EE80];
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v3;
  *(unsigned char *)(v1 + 40) = 0;
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B18);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4 + *(void *)(*(void *)v4 + 96);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697510E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = *(void *)(*(void *)v4 + 104);
  uint64_t v8 = swift_allocObject();
  *(void *)(v4 + v7) = v8;
  *(_DWORD *)(v8 + 16) = 0;
  *(void *)(v4 + *(void *)(*(void *)v4 + 112)) = v3;
  *(unsigned char *)(v4 + *(void *)(*(void *)v4 + 120)) = 0;
  v0[3] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B20);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  uint64_t v11 = MEMORY[0x263F8EE88];
  *(void *)(v9 + 16) = v10;
  *(void *)(v9 + 24) = v11;
  v0[4] = v9;
  uint64_t v12 = (char *)v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  uint64_t v13 = type metadata accessor for City();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  return v0;
}

uint64_t sub_24A022ABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v124 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v143 = (uint64_t)&v124 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v131 = (uint64_t)&v124 - v8;
  unint64_t v9 = sub_24A056538();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = ((char *)&v124 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  v148 = (char *)&v124 - v15;
  MEMORY[0x270FA5388](v14);
  v144 = (char *)&v124 - v16;
  uint64_t v158 = type metadata accessor for City();
  uint64_t v139 = *(void *)(v158 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v158);
  uint64_t v19 = (id *)((char *)&v124 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  v159 = (char *)&v124 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v160 = (uint64_t *)((char *)&v124 - v23);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (id *)((char *)&v124 - v25);
  MEMORY[0x270FA5388](v24);
  v141 = (uint64_t *)((char *)&v124 - v27);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v28 - 8);
  v142 = (char *)&v124 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_24A0563F8();
  id v30 = *(void **)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  v147 = (char *)&v124 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v32 = objc_msgSend(self, sel_sharedManager);
  if (!v32)
  {
    if (qword_26B16F9B8 != -1) {
LABEL_76:
    }
      swift_once();
    uint64_t v113 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_249F6E6C8(v113, (uint64_t)v5, &qword_26B16FAA8);
    int v114 = (*(uint64_t (**)(char *, uint64_t, unint64_t))(v10 + 48))(v5, 1, v9);
    uint64_t v157 = v10;
    if (v114 == 1)
    {
      unint64_t v115 = v9;
      sub_249FB8AA8((uint64_t)v13);
      sub_249F6E790((uint64_t)v5, &qword_26B16FAA8);
    }
    else
    {
      v116 = *(void (**)(NSObject *, char *, unint64_t))(v10 + 32);
      unint64_t v115 = v9;
      v116(v13, v5, v9);
    }
    swift_retain_n();
    v117 = sub_24A056518();
    os_log_type_t v118 = sub_24A0577B8();
    if (os_log_type_enabled(v117, v118))
    {
      v119 = (uint8_t *)swift_slowAlloc();
      uint64_t v120 = swift_slowAlloc();
      v163[0] = v120;
      *(_DWORD *)v119 = 136446210;
      unint64_t v156 = v115;
      v160 = v119 + 4;
      swift_retain();
      uint64_t v121 = sub_249F73AEC();
      unint64_t v123 = v122;
      swift_release();
      v161[15] = sub_249F782DC(v121, v123, v163);
      sub_24A057978();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F61000, v117, v118, "[%{public}s] WorldClockManager is nil. Cannot fetch world clock data.", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v120, -1, -1);
      MEMORY[0x24C5BA360](v119, -1, -1);

      return (*(uint64_t (**)(NSObject *, unint64_t))(v157 + 8))(v13, v156);
    }
    else
    {

      swift_release_n();
      return (*(uint64_t (**)(NSObject *, unint64_t))(v157 + 8))(v13, v115);
    }
  }
  id v33 = v32;
  objc_msgSend(v32, sel_loadCities);
  uint64_t v34 = v1[4];
  uint64_t v35 = (os_unfair_lock_s *)(*(void *)(v34 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  *(void *)(v34 + 24) = MEMORY[0x263F8EE88];
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v35);
  swift_endAccess();
  swift_release();
  id v125 = v33;
  uint64_t v36 = objc_msgSend(v33, sel_cities);
  if (!v36)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  uint64_t v13 = v36;
  uint64_t v153 = MEMORY[0x263F8EE58] + 8;
  uint64_t v5 = (char *)sub_24A057568();

  uint64_t v152 = *((void *)v5 + 2);
  if (!v152)
  {
LABEL_66:

    return swift_bridgeObjectRelease();
  }
  unint64_t v38 = 0;
  v151 = v5 + 32;
  v133 = 0;
  v134 = (void (**)(uint64_t, uint64_t, unint64_t))(v10 + 32);
  v145 = (void (**)(uint64_t, unint64_t))(v10 + 8);
  v146 = (uint64_t (**)(uint64_t, uint64_t, unint64_t))(v10 + 48);
  v140 = (uint64_t (**)(void *, uint64_t, uint64_t))(v30 + 6);
  v128 = (void (**)(uint64_t, char *, uint64_t))(v30 + 2);
  v129 = (void (**)(char *, void *, uint64_t))(v30 + 4);
  v127 = (void (**)(char *, uint64_t))(v30 + 1);
  *(void *)&long long v37 = 136446466;
  long long v126 = v37;
  *(void *)&long long v37 = 136446210;
  long long v130 = v37;
  v155 = v1;
  unint64_t v156 = v9;
  uint64_t v10 = (uint64_t)v148;
  v150 = v5;
  while (1)
  {
    if (v38 >= *((void *)v5 + 2))
    {
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    sub_249F7B110((uint64_t)&v151[32 * v38], (uint64_t)v161);
    sub_249FCFCA0(0, &qword_269751B00);
    if (swift_dynamicCast()) {
      break;
    }
    uint64_t v52 = v10;
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v53 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    uint64_t v54 = v53;
    uint64_t v55 = v143;
    sub_249F6E6C8(v54, v143, &qword_26B16FAA8);
    unint64_t v56 = v156;
    int v57 = (*v146)(v55, 1, v156);
    uint64_t v157 = v38;
    if (v57 == 1)
    {
      uint64_t v10 = v52;
      sub_249FB8AA8(v52);
      sub_249F6E790(v55, &qword_26B16FAA8);
    }
    else
    {
      unint64_t v58 = v56;
      uint64_t v10 = v52;
      (*v134)(v52, v55, v58);
    }
    swift_retain_n();
    id v30 = (void *)v10;
    uint64_t v13 = sub_24A056518();
    os_log_type_t v59 = sub_24A0577B8();
    if (!os_log_type_enabled(v13, v59))
    {

      swift_release_n();
      unint64_t v9 = v156;
      (*v145)(v10, v156);
      unint64_t v38 = v157;
LABEL_43:
      uint64_t v5 = v150;
      goto LABEL_6;
    }
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v161[0] = v40;
    *(_DWORD *)uint64_t v39 = v130;
    swift_retain();
    id v30 = (void *)sub_249F73AEC();
    unint64_t v42 = v41;
    swift_release();
    *(void *)(v39 + 4) = sub_249F782DC((uint64_t)v30, v42, v161);
    swift_release_n();
    uint64_t v1 = v155;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F61000, v13, v59, "[%{public}s] City from WorldClockManager is not the expected type, WorldClockCity.", (uint8_t *)v39, 0xCu);
    swift_arrayDestroy();
    uint64_t v10 = (uint64_t)v148;
    MEMORY[0x24C5BA360](v40, -1, -1);
    uint64_t v43 = v39;
    uint64_t v5 = v150;
    MEMORY[0x24C5BA360](v43, -1, -1);

    unint64_t v9 = v156;
    (*v145)(v10, v156);
    unint64_t v38 = v157;
LABEL_6:
    if (++v38 == v152) {
      goto LABEL_66;
    }
  }
  v154 = v162;
  id v44 = objc_msgSend(v162, sel_timeZone);
  if (!v44)
  {
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  uint64_t v45 = v44;
  sub_24A0573A8();

  id v30 = v142;
  sub_24A056398();
  swift_bridgeObjectRelease();
  uint64_t v46 = v149;
  int v47 = (*v140)(v30, 1, v149);
  uint64_t v48 = (uint64_t)v144;
  if (v47 == 1)
  {
    sub_249F6E790((uint64_t)v30, &qword_26974F440);
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v49 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    uint64_t v50 = v49;
    uint64_t v51 = v131;
    sub_249F6E6C8(v50, v131, &qword_26B16FAA8);
    if ((*v146)(v51, 1, v9) == 1)
    {
      sub_249FB8AA8(v48);
      sub_249F6E790(v51, &qword_26B16FAA8);
    }
    else
    {
      (*v134)(v48, v51, v9);
    }
    swift_retain_n();
    uint64_t v13 = v154;
    id v30 = (void *)v48;
    char v81 = sub_24A056518();
    os_log_type_t v82 = sub_24A0577B8();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = swift_slowAlloc();
      uint64_t v157 = v38;
      uint64_t v84 = v83;
      v154 = (void *)swift_slowAlloc();
      v161[0] = swift_slowAlloc();
      uint64_t v85 = v161[0];
      *(_DWORD *)uint64_t v84 = v126;
      swift_retain();
      uint64_t v86 = sub_249F73AEC();
      unint64_t v88 = v87;
      swift_release();
      *(void *)(v84 + 4) = sub_249F782DC(v86, v88, v161);
      swift_release_n();
      uint64_t v1 = v155;
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 12) = 2114;
      *(void *)(v84 + 14) = v13;
      id v30 = v154;
      void *v154 = v13;

      _os_log_impl(&dword_249F61000, v81, v82, "[%{public}s] TimeZone for %{public}@ is invalid.", (uint8_t *)v84, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v30, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v85, -1, -1);
      uint64_t v89 = v84;
      unint64_t v38 = v157;
      MEMORY[0x24C5BA360](v89, -1, -1);

      v90 = v144;
      objc_super v91 = *v145;
    }
    else
    {

      swift_release_n();
      objc_super v91 = *v145;
      v90 = (char *)v48;
    }
    unint64_t v9 = v156;
    v91((uint64_t)v90, v156);
    uint64_t v10 = (uint64_t)v148;
    goto LABEL_43;
  }
  (*v129)(v147, v30, v46);
  id v60 = v154;
  id v61 = objc_msgSend(v154, sel_alCity);
  if (!v61) {
    goto LABEL_78;
  }
  uint64_t v62 = v61;
  uint64_t v10 = v46;
  uint64_t v157 = v38;
  objc_msgSend(v61, sel_latitude);
  double v64 = v63;
  id v138 = v62;
  objc_msgSend(v62, sel_longitude);
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A50]), sel_initWithLatitude_longitude_, v64, v65);
  id v66 = objc_msgSend(v60, sel_name);
  if (!v66) {
    goto LABEL_79;
  }
  id v67 = v66;
  uint64_t v68 = sub_24A0573A8();
  uint64_t v70 = v69;

  uint64_t v71 = v158;
  CGFloat v72 = v141;
  (*v128)((uint64_t)v141 + *(int *)(v158 + 24), v147, v10);
  *CGFloat v72 = v68;
  v72[1] = v70;
  v72[2] = (uint64_t)v30;
  sub_24A024F04((uint64_t)v72, (uint64_t)v26);
  uint64_t v73 = v1[4];
  uint64_t v74 = (os_unfair_lock_s *)(*(void *)(v73 + 16) + 16);
  swift_beginAccess();
  v137 = v30;
  swift_retain();
  os_unfair_lock_lock(v74);
  swift_beginAccess();
  uint64_t v136 = v73;
  uint64_t v5 = *(char **)(v73 + 24);
  swift_bridgeObjectRetain();
  v135 = v74;
  os_unfair_lock_unlock(v74);
  swift_endAccess();
  sub_24A057E28();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24A057408();
  swift_bridgeObjectRelease();
  id v75 = v26[2];
  sub_24A057948();

  uint64_t v13 = ((char *)v26 + *(int *)(v71 + 24));
  uint64_t v132 = sub_24A025090((unint64_t *)&unk_269751570, MEMORY[0x263F079C8]);
  sub_24A057318();
  uint64_t v76 = sub_24A057E68();
  uint64_t v77 = -1 << v5[32];
  unint64_t v9 = v76 & ~v77;
  if ((*(void *)&v5[((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v9))
  {
    uint64_t v78 = ~v77;
    uint64_t v10 = *(void *)(v139 + 72);
    while (1)
    {
      sub_24A024F04(*((void *)v5 + 6) + v10 * v9, (uint64_t)v19);
      BOOL v79 = *v19 == *v26 && v19[1] == v26[1];
      if (v79 || (sub_24A057D48() & 1) != 0)
      {
        sub_249FCFCA0(0, (unint64_t *)&qword_269752090);
        if (sub_24A057938() & 1) != 0 && (MEMORY[0x24C5B7BF0]((char *)v19 + *(int *)(v158 + 24), v13)) {
          break;
        }
      }
      sub_24A024FCC((uint64_t)v19);
      unint64_t v9 = (v9 + 1) & v78;
      if (((*(void *)&v5[((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v9) & 1) == 0) {
        goto LABEL_35;
      }
    }
    sub_24A024FCC((uint64_t)v19);
    goto LABEL_60;
  }
LABEL_35:
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24A024F04((uint64_t)v26, (uint64_t)v160);
  v162 = v5;
  if (*((void *)v5 + 3) > *((void *)v5 + 2))
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_24A0257B8();
    }
    goto LABEL_58;
  }
  if (isUniquelyReferenced_nonNull_native) {
    sub_24A0250D8();
  }
  else {
    sub_24A025B8C();
  }
  UIEdgeInsets v92 = v162;
  sub_24A057E28();
  CGRect v93 = v160;
  swift_bridgeObjectRetain();
  sub_24A057408();
  swift_bridgeObjectRelease();
  id v94 = (id)v93[2];
  sub_24A057948();

  uint64_t v13 = ((char *)v93 + *(int *)(v158 + 24));
  sub_24A057318();
  uint64_t v95 = sub_24A057E68();
  uint64_t v96 = -1 << v92[32];
  unint64_t v9 = v95 & ~v96;
  if (((*(void *)&v92[((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v9) & 1) == 0)
  {
LABEL_58:
    uint64_t v5 = v162;
    *(void *)&v162[((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v9;
    sub_24A024F68((uint64_t)v160, *((void *)v5 + 6) + *(void *)(v139 + 72) * v9);
    uint64_t v100 = *((void *)v5 + 2);
    BOOL v101 = __OFADD__(v100, 1);
    uint64_t v102 = v100 + 1;
    if (v101) {
      goto LABEL_75;
    }
    *((void *)v5 + 2) = v102;
LABEL_60:
    swift_bridgeObjectRelease();
    sub_24A024FCC((uint64_t)v26);
    v103 = v135;
    swift_beginAccess();
    os_unfair_lock_lock(v103);
    *(void *)(v136 + 24) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v103);
    swift_endAccess();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v1 = v155;
    uint64_t v104 = v155[2];
    uint64_t v105 = v155[4];
    v106 = (os_unfair_lock_s *)(*(void *)(v105 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v106);
    swift_beginAccess();
    uint64_t v107 = *(void *)(v105 + 24);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v106);
    swift_endAccess();
    swift_release();
    v108 = (os_unfair_lock_s *)(*(void *)(v104 + 24) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v108);
    swift_endAccess();
    swift_beginAccess();
    uint64_t v13 = *(NSObject **)(v104 + 16);
    unint64_t v109 = v156;
    if ((unint64_t)v13 >= 2)
    {
      swift_bridgeObjectRetain();
      sub_24A003F34((uint64_t)v13);
      char v110 = sub_24A026200((uint64_t)v13, v107);
      swift_bridgeObjectRelease();
      sub_249F9BA08((uint64_t)v13);
      if (v110)
      {
        uint64_t v1 = v155;
LABEL_65:
        swift_beginAccess();
        os_unfair_lock_unlock(v108);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_release();
        id v30 = v1;
        sub_24A0240B0();

        sub_24A024FCC((uint64_t)v141);
        (*v127)(v147, v149);
        uint64_t v5 = v150;
        unint64_t v38 = v157;
        unint64_t v9 = v109;
        uint64_t v10 = (uint64_t)v148;
        goto LABEL_6;
      }
      uint64_t v13 = *(NSObject **)(v104 + 16);
      uint64_t v1 = v155;
    }
    *(void *)(v104 + 16) = v107;
    swift_bridgeObjectRetain();
    sub_249F9BA08((uint64_t)v13);
    swift_beginAccess();
    swift_retain();
    uint64_t v111 = swift_bridgeObjectRetain();
    uint64_t v13 = v133;
    sub_24A0265E4(v111, v104);
    v133 = v13;
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_65;
  }
  uint64_t v97 = ~v96;
  uint64_t v10 = *(void *)(v139 + 72);
  id v30 = v159;
  while (1)
  {
    sub_24A024F04(*((void *)v92 + 6) + v10 * v9, (uint64_t)v30);
    BOOL v98 = *v30 == *v160 && v30[1] == v160[1];
    if (v98 || (sub_24A057D48() & 1) != 0)
    {
      sub_249FCFCA0(0, (unint64_t *)&qword_269752090);
      char v99 = sub_24A057938();
      id v30 = v159;
      if (v99 & 1) != 0 && (MEMORY[0x24C5B7BF0](&v159[*(int *)(v158 + 24)], v13)) {
        break;
      }
    }
    sub_24A024FCC((uint64_t)v30);
    unint64_t v9 = (v9 + 1) & v97;
    if (((*(void *)&v92[((v9 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] >> v9) & 1) == 0) {
      goto LABEL_58;
    }
  }
LABEL_81:
  sub_24A024FCC((uint64_t)v30);
  uint64_t result = sub_24A057D68();
  __break(1u);
  return result;
}

uint64_t sub_24A023F70()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697510E8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  swift_beginAccess();
  sub_249F6E6C8(v5, (uint64_t)v3, &qword_2697510E8);
  uint64_t v6 = (os_unfair_lock_s *)(*(void *)(v4 + *(void *)(*(void *)v4 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_endAccess();
  sub_249FF4634((uint64_t)v3);
  swift_beginAccess();
  os_unfair_lock_unlock(v6);
  swift_endAccess();
  swift_release();
  return sub_249F6E790((uint64_t)v3, &qword_2697510E8);
}

uint64_t sub_24A0240B0()
{
  uint64_t v94 = type metadata accessor for City();
  uint64_t v1 = *(void *)(v94 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v94);
  uint64_t v107 = (uint64_t)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v100 = (uint64_t)&v88 - v4;
  uint64_t v5 = sub_24A056238();
  uint64_t v98 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_24A0563F8();
  char v99 = *(void **)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  uint64_t v105 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751AF0);
  MEMORY[0x270FA5388](v91);
  uint64_t v97 = (uint64_t)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v89 = (uint64_t)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v96 = (char *)&v88 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v92 = (uint64_t)&v88 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697510E8);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v90 = (uint64_t)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v88 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v88 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v88 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v88 - v28;
  uint64_t v95 = v0;
  uint64_t v30 = v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity;
  swift_beginAccess();
  uint64_t v93 = v30;
  sub_249F6E6C8(v30, (uint64_t)v29, &qword_2697510E8);
  uint64_t v31 = v1;
  uint64_t v32 = v1 + 48;
  id v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48);
  uint64_t v34 = v94;
  v103 = v33;
  uint64_t v104 = v32;
  LODWORD(v30) = ((uint64_t (*)(char *, uint64_t))v33)(v29, 1);
  uint64_t v35 = (uint64_t)v29;
  uint64_t v36 = v99;
  long long v37 = v105;
  sub_249F6E790(v35, &qword_2697510E8);
  v106 = v24;
  uint64_t v102 = v31;
  if (v30 != 1)
  {
    unint64_t v38 = v36;
    uint64_t v39 = v101;
    sub_249F6E6C8(v93, (uint64_t)v27, &qword_2697510E8);
    int v40 = v103(v27, 1, v34);
    uint64_t v88 = v5;
    if (v40)
    {
      sub_249F6E790((uint64_t)v27, &qword_2697510E8);
      unint64_t v41 = v36;
      unint64_t v42 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v36[7];
      uint64_t v43 = v92;
      v42(v92, 1, 1, v39);
    }
    else
    {
      id v44 = &v27[*(int *)(v34 + 24)];
      unint64_t v41 = v36;
      uint64_t v43 = v92;
      ((void (*)(uint64_t, char *, uint64_t))v36[2])(v92, v44, v39);
      sub_249F6E790((uint64_t)v27, &qword_2697510E8);
      unint64_t v42 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v36[7];
      v42(v43, 0, 1, v39);
    }
    uint64_t v45 = (uint64_t)v96;
    sub_24A0563E8();
    v42(v45, 0, 1, v39);
    uint64_t v46 = v97;
    uint64_t v47 = v97 + *(int *)(v91 + 48);
    sub_249F6E6C8(v43, v97, &qword_26974F440);
    uint64_t v48 = v46;
    sub_249F6E6C8(v45, v47, &qword_26974F440);
    uint64_t v49 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v41[6];
    if (v49(v48, 1, v39) == 1)
    {
      sub_249F6E790(v45, &qword_26974F440);
      uint64_t v48 = v97;
      sub_249F6E790(v43, &qword_26974F440);
      if (v49(v47, 1, v39) == 1)
      {
        uint64_t v50 = &qword_26974F440;
        uint64_t v51 = v48;
        return sub_249F6E790(v51, v50);
      }
    }
    else
    {
      uint64_t v52 = v89;
      sub_249F6E6C8(v48, v89, &qword_26974F440);
      if (v49(v47, 1, v39) != 1)
      {
        uint64_t v36 = v38;
        uint64_t v86 = (void (*)(char *, uint64_t, uint64_t))v38[4];
        long long v37 = v105;
        v86(v105, v47, v39);
        sub_24A025090(&qword_269751AF8, MEMORY[0x263F079C8]);
        LODWORD(v91) = sub_24A057358();
        unint64_t v87 = (void (*)(char *, uint64_t))v36[1];
        v87(v37, v39);
        sub_249F6E790((uint64_t)v96, &qword_26974F440);
        sub_249F6E790(v92, &qword_26974F440);
        v87((char *)v52, v39);
        uint64_t result = sub_249F6E790(v48, &qword_26974F440);
        uint64_t v5 = v88;
        uint64_t v24 = v106;
        uint64_t v31 = v102;
        uint64_t v34 = v94;
        if (v91) {
          return result;
        }
        goto LABEL_11;
      }
      sub_249F6E790((uint64_t)v96, &qword_26974F440);
      sub_249F6E790(v92, &qword_26974F440);
      ((void (*)(uint64_t, uint64_t))v38[1])(v52, v39);
    }
    sub_249F6E790(v48, &qword_269751AF0);
    uint64_t v5 = v88;
    uint64_t v31 = v102;
    uint64_t v34 = v94;
    uint64_t v36 = v38;
    long long v37 = v105;
    uint64_t v24 = v106;
  }
LABEL_11:
  uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v54 = v24;
  uint64_t v55 = v34;
  uint64_t v92 = v31 + 56;
  uint64_t v91 = (uint64_t)v53;
  v53(v54, 1, 1, v34);
  sub_24A0563E8();
  sub_24A056228();
  uint64_t v56 = sub_24A0563A8();
  uint64_t v57 = v98 + 8;
  char v99 = *(void **)(v98 + 8);
  ((void (*)(char *, uint64_t))v99)(v7, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v36[1])(v37, v101);
  uint64_t v98 = v56 + 86400;
  if (__OFADD__(v56, 86400)) {
    goto LABEL_50;
  }
  uint64_t v59 = v57;
  uint64_t v60 = *(void *)(v95 + 32);
  id v61 = (os_unfair_lock_s *)(*(void *)(v60 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v61);
  swift_beginAccess();
  uint64_t v62 = *(char **)(v60 + 24);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v61);
  swift_endAccess();
  uint64_t result = swift_release();
  uint64_t v101 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = *((void *)v62 + 7);
  uint64_t v96 = v62 + 56;
  uint64_t v105 = v62;
  uint64_t v65 = 1 << v62[32];
  uint64_t v66 = -1;
  if (v65 < 64) {
    uint64_t v66 = ~(-1 << v65);
  }
  unint64_t v67 = v66 & v64;
  uint64_t v97 = (unint64_t)(v65 + 63) >> 6;
  while (1)
  {
    if (v67)
    {
      unint64_t v69 = __clz(__rbit64(v67));
      v67 &= v67 - 1;
      unint64_t v70 = v69 | (v63 << 6);
      goto LABEL_33;
    }
    uint64_t v71 = v63 + 1;
    if (__OFADD__(v63, 1)) {
      goto LABEL_47;
    }
    if (v71 >= v97)
    {
LABEL_40:
      swift_release();
      uint64_t v83 = (uint64_t)v106;
      uint64_t v84 = v90;
      sub_249F6E6C8((uint64_t)v106, v90, &qword_2697510E8);
      uint64_t v85 = v93;
      swift_beginAccess();
      sub_24A025028(v84, v85);
      swift_endAccess();
      sub_24A023F70();
      sub_249F6E790(v84, &qword_2697510E8);
      uint64_t v51 = v83;
      uint64_t v50 = &qword_2697510E8;
      return sub_249F6E790(v51, v50);
    }
    unint64_t v72 = *(void *)&v96[8 * v71];
    ++v63;
    if (!v72)
    {
      uint64_t v63 = v71 + 1;
      if (v71 + 1 >= v97) {
        goto LABEL_40;
      }
      unint64_t v72 = *(void *)&v96[8 * v63];
      if (!v72)
      {
        uint64_t v63 = v71 + 2;
        if (v71 + 2 >= v97) {
          goto LABEL_40;
        }
        unint64_t v72 = *(void *)&v96[8 * v63];
        if (!v72) {
          break;
        }
      }
    }
LABEL_32:
    unint64_t v67 = (v72 - 1) & v72;
    unint64_t v70 = __clz(__rbit64(v72)) + (v63 << 6);
LABEL_33:
    uint64_t v74 = v100;
    sub_24A024F04(*((void *)v105 + 6) + *(void *)(v102 + 72) * v70, v100);
    sub_24A024F68(v74, v107);
    sub_24A056228();
    uint64_t v75 = sub_24A0563A8();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v99)(v7, v5);
    uint64_t v76 = v75 + 86400;
    if (__OFADD__(v75, 86400))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    uint64_t v77 = v7;
    uint64_t v78 = v59;
    uint64_t v79 = v5;
    uint64_t v80 = v76 - v98;
    if (__OFSUB__(v76, v98)) {
      goto LABEL_46;
    }
    uint64_t result = (uint64_t)v106;
    if (v80 < 0)
    {
      BOOL v81 = __OFSUB__(0, v80);
      uint64_t v80 = v98 - v76;
      if (v81) {
        goto LABEL_48;
      }
    }
    sub_249F6E6C8((uint64_t)v106, (uint64_t)v21, &qword_2697510E8);
    int v82 = v103(v21, 1, v55);
    sub_249F6E790((uint64_t)v21, &qword_2697510E8);
    if (v82 == 1 || v80 < v101)
    {
      uint64_t v68 = (uint64_t)v106;
      sub_249F6E790((uint64_t)v106, &qword_2697510E8);
      sub_24A024F68(v107, v68);
      uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v91)(v68, 0, 1, v55);
      uint64_t v101 = v80;
    }
    else
    {
      uint64_t result = sub_24A024FCC(v107);
    }
    uint64_t v5 = v79;
    uint64_t v59 = v78;
    uint64_t v7 = v77;
  }
  uint64_t v73 = v71 + 3;
  if (v73 >= v97) {
    goto LABEL_40;
  }
  unint64_t v72 = *(void *)&v96[8 * v73];
  if (v72)
  {
    uint64_t v63 = v73;
    goto LABEL_32;
  }
  while (1)
  {
    uint64_t v63 = v73 + 1;
    if (__OFADD__(v73, 1)) {
      break;
    }
    if (v63 >= v97) {
      goto LABEL_40;
    }
    unint64_t v72 = *(void *)&v96[8 * v63];
    ++v73;
    if (v72) {
      goto LABEL_32;
    }
  }
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_24A024C84()
{
  swift_release();
  swift_release();
  swift_release();
  sub_249F6E790(v0 + OBJC_IVAR____TtC11ClockPoster17WorldDataProvider_defaultCity, &qword_2697510E8);

  return swift_deallocClassInstance();
}

uint64_t sub_24A024D08()
{
  return type metadata accessor for WorldDataProvider();
}

uint64_t type metadata accessor for WorldDataProvider()
{
  uint64_t result = qword_269751AD0;
  if (!qword_269751AD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24A024D5C()
{
  sub_24A024E00();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A024E00()
{
  if (!qword_269751AE0)
  {
    type metadata accessor for City();
    unint64_t v0 = sub_24A057968();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269751AE0);
    }
  }
}

uint64_t sub_24A024E58(uint64_t a1)
{
  swift_getWitnessTable();

  return CustomStringConvertibleViaMirror.description.getter(a1);
}

uint64_t sub_24A024EAC(uint64_t a1)
{
  uint64_t result = sub_24A025090(&qword_269751AE8, (void (*)(uint64_t))type metadata accessor for WorldDataProvider);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24A024F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A024F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A024FCC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for City();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A025028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697510E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A025090(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A0250D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for City();
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (id *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B08);
  uint64_t v6 = sub_24A057A38();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v31 = v0;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    id v33 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v32 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v32) {
          goto LABEL_33;
        }
        unint64_t v19 = v33[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v19 = v33[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v19 = v33[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v31;
                uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
                if (v30 > 63) {
                  bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v33 = -1 << v30;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v33[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v34 + 72);
      sub_24A024F68(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4);
      sub_24A057E28();
      swift_bridgeObjectRetain();
      sub_24A057408();
      swift_bridgeObjectRelease();
      id v22 = v4[2];
      sub_24A057948();

      sub_24A0563F8();
      sub_24A025090((unint64_t *)&unk_269751570, MEMORY[0x263F079C8]);
      sub_24A057318();
      uint64_t result = sub_24A057E68();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_24A024F68((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24A0254E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B28);
  uint64_t result = sub_24A057A38();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v14 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v15 = v14 | (v5 << 6);
      }
      else
      {
        int64_t v16 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v10) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v5;
        if (!v17)
        {
          int64_t v5 = v16 + 1;
          if (v16 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v5];
          if (!v17)
          {
            int64_t v5 = v16 + 2;
            if (v16 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v5];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v10)
              {
LABEL_33:
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v29;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v5 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v5];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v5 << 6);
      }
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24A057E28();
      sub_24A057E58();
      sub_24A057E58();
      uint64_t result = sub_24A057E68();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v11 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void *sub_24A0257B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for City();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  int64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B08);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24A057A28();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_24A024F04(*(void *)(v6 + 48) + v19, (uint64_t)v5);
    uint64_t result = (void *)sub_24A024F68((uint64_t)v5, *(void *)(v8 + 48) + v19);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16) {
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24A0259F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A057A28();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A025B8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for City();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (id *)((char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B08);
  uint64_t v6 = sub_24A057A38();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v30 = v0;
  uint64_t v31 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v31 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v31 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v33 + 72);
    sub_24A024F04(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4);
    sub_24A057E28();
    swift_bridgeObjectRetain();
    sub_24A057408();
    swift_bridgeObjectRelease();
    id v22 = v4[2];
    sub_24A057948();

    sub_24A0563F8();
    sub_24A025090((unint64_t *)&unk_269751570, MEMORY[0x263F079C8]);
    sub_24A057318();
    uint64_t result = sub_24A057E68();
    uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24A024F68((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v30;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v31 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v32) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v31 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A025F5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B28);
  uint64_t result = sub_24A057A38();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v14 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v15 = v14 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v10) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v5;
    if (!v17)
    {
      int64_t v5 = v16 + 1;
      if (v16 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v5);
      if (!v17)
      {
        int64_t v5 = v16 + 2;
        if (v16 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v5);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v5 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24A057E28();
    sub_24A057E58();
    sub_24A057E58();
    uint64_t result = sub_24A057E68();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v11 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v5 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v5);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A026200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for City();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (id *)((char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  int64_t v10 = (id *)((char *)&v35 - v9);
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v14 = (char *)&v35 - v13;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v15 = 0;
  uint64_t v16 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & *(void *)(a1 + 56);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v21 = a2 + 56;
  uint64_t v38 = v12;
  uint64_t v39 = a1;
  uint64_t v36 = a1 + 56;
  long long v37 = v14;
  int64_t v35 = v20;
  if (!v19) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v40 = (v19 - 1) & v19;
  int64_t v41 = v15;
  for (unint64_t i = __clz(__rbit64(v19)) | (v15 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    uint64_t v27 = *(void *)(v12 + 72);
    sub_24A024F04(*(void *)(a1 + 48) + v27 * i, (uint64_t)v14);
    sub_24A024F68((uint64_t)v14, (uint64_t)v10);
    sub_24A057E28();
    swift_bridgeObjectRetain();
    sub_24A057408();
    swift_bridgeObjectRelease();
    id v28 = v10[2];
    sub_24A057948();

    uint64_t v29 = (char *)v10 + *(int *)(v4 + 24);
    sub_24A0563F8();
    sub_24A025090((unint64_t *)&unk_269751570, MEMORY[0x263F079C8]);
    sub_24A057318();
    uint64_t v30 = sub_24A057E68();
    uint64_t v31 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v32 = v30 & ~v31;
    if (((*(void *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
    {
LABEL_35:
      sub_24A024FCC((uint64_t)v10);
      return 0;
    }
    uint64_t v33 = ~v31;
    while (1)
    {
      sub_24A024F04(*(void *)(a2 + 48) + v32 * v27, (uint64_t)v7);
      BOOL v34 = *v7 == *v10 && v7[1] == v10[1];
      if (v34 || (sub_24A057D48() & 1) != 0)
      {
        sub_249FCFCA0(0, (unint64_t *)&qword_269752090);
        if (sub_24A057938() & 1) != 0 && (MEMORY[0x24C5B7BF0]((char *)v7 + *(int *)(v4 + 24), v29)) {
          break;
        }
      }
      sub_24A024FCC((uint64_t)v7);
      unint64_t v32 = (v32 + 1) & v33;
      if (((*(void *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0) {
        goto LABEL_35;
      }
    }
    sub_24A024FCC((uint64_t)v7);
    uint64_t result = sub_24A024FCC((uint64_t)v10);
    uint64_t v12 = v38;
    a1 = v39;
    uint64_t v16 = v36;
    unint64_t v14 = v37;
    int64_t v20 = v35;
    unint64_t v19 = v40;
    int64_t v15 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (v23 >= v20) {
      return 1;
    }
    unint64_t v24 = *(void *)(v16 + 8 * v23);
    int64_t v25 = v15 + 1;
    if (!v24)
    {
      int64_t v25 = v23 + 1;
      if (v23 + 1 >= v20) {
        return 1;
      }
      unint64_t v24 = *(void *)(v16 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v23 + 2;
        if (v23 + 2 >= v20) {
          return 1;
        }
        unint64_t v24 = *(void *)(v16 + 8 * v25);
        if (!v24) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v40 = (v24 - 1) & v24;
    int64_t v41 = v25;
  }
  int64_t v26 = v23 + 3;
  if (v26 >= v20) {
    return 1;
  }
  unint64_t v24 = *(void *)(v16 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v26;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v20) {
      return 1;
    }
    unint64_t v24 = *(void *)(v16 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_21;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_24A0265E4(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751260);
  int64_t v43 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751268);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v40 = a1 + 64;
  uint64_t v13 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  uint64_t v42 = a1;
  uint64_t v16 = (void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  int64_t v18 = 0;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v19 = v6 + 16;
  uint64_t v20 = v6 + 32;
  uint64_t v21 = (uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v6 + 8);
  long long v37 = (void (**)(char *, uint64_t))(v43 + 8);
  while (1)
  {
    if (v15)
    {
      unint64_t v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      int64_t v43 = v18;
      unint64_t v23 = v22 | (v18 << 6);
      goto LABEL_23;
    }
    int64_t v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v24);
    int64_t v26 = v18 + 1;
    if (!v25)
    {
      int64_t v26 = v18 + 2;
      if (v18 + 2 >= v41) {
        return swift_release();
      }
      unint64_t v25 = *(void *)(v40 + 8 * v26);
      if (!v25)
      {
        int64_t v26 = v18 + 3;
        if (v18 + 3 >= v41) {
          return swift_release();
        }
        unint64_t v25 = *(void *)(v40 + 8 * v26);
        if (!v25)
        {
          int64_t v26 = v18 + 4;
          if (v18 + 4 >= v41) {
            return swift_release();
          }
          unint64_t v25 = *(void *)(v40 + 8 * v26);
          if (!v25) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v15 = (v25 - 1) & v25;
    int64_t v43 = v26;
    unint64_t v23 = __clz(__rbit64(v25)) + (v26 << 6);
LABEL_23:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(void *)(v42 + 56) + *(void *)(v6 + 72) * v23, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    if (*v16 != 1)
    {
      uint64_t v44 = *v16;
      swift_bridgeObjectRetain();
      uint64_t v28 = v6;
      uint64_t v29 = v20;
      uint64_t v30 = v11;
      uint64_t v31 = v19;
      unint64_t v32 = v16;
      uint64_t v33 = v38;
      sub_24A057648();
      BOOL v34 = v33;
      uint64_t v16 = v32;
      uint64_t v19 = v31;
      uint64_t v11 = v30;
      uint64_t v20 = v29;
      uint64_t v6 = v28;
      uint64_t v21 = v36;
      (*v37)(v34, v39);
    }
    uint64_t result = (*v21)(v9, v5);
    int64_t v18 = v43;
  }
  uint64_t v27 = v18 + 5;
  if (v18 + 5 >= v41) {
    return swift_release();
  }
  unint64_t v25 = *(void *)(v40 + 8 * v27);
  if (v25)
  {
    int64_t v26 = v18 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v26 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v26 >= v41) {
      return swift_release();
    }
    unint64_t v25 = *(void *)(v40 + 8 * v26);
    ++v27;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24A0269B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751B70);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v12 = result;
    sub_249F6E6C8(a1, (uint64_t)v4, &qword_269751B70);
    uint64_t v13 = type metadata accessor for SystemOverrideClockData();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v4, 1, v13) == 1)
    {
      sub_249F6E790((uint64_t)v4, &qword_269751B70);
      uint64_t v14 = sub_24A056238();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
    }
    else
    {
      uint64_t v15 = sub_24A056238();
      uint64_t v16 = *(void *)(v15 - 8);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v10, v4, v15);
      sub_24A02D3A4((uint64_t)v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    }
    sub_24A026D24((uint64_t)v10);
    uint64_t v17 = *(void *)(v12 + 32);
    int64_t v18 = *(void **)(v12 + 40);
    uint64_t v19 = (os_unfair_lock_s *)(v18[2] + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v19);
    uint64_t v20 = (uint64_t)v18 + *(void *)(*v18 + 96);
    swift_beginAccess();
    sub_249F6E6C8(v20, (uint64_t)v8, &qword_2697515A0);
    os_unfair_lock_unlock(v19);
    swift_endAccess();
    swift_release();
    uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v17 + *(void *)(*(void *)v17 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v21);
    swift_endAccess();
    sub_249FF4E7C((uint64_t)v8);
    swift_beginAccess();
    os_unfair_lock_unlock(v21);
    swift_endAccess();
    sub_249F6E790((uint64_t)v8, &qword_2697515A0);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A026D24(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = *(void **)(v1 + 40);
  sub_249F6E6C8(a1, (uint64_t)&v13[-v7], &qword_2697515A0);
  uint64_t v10 = (os_unfair_lock_s *)(v9[2] + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_249F6E6C8((uint64_t)v8, (uint64_t)v6, &qword_2697515A0);
  uint64_t v11 = (uint64_t)v9 + *(void *)(*v9 + 96);
  swift_beginAccess();
  sub_24A02D198((uint64_t)v6, v11);
  swift_endAccess();
  os_unfair_lock_unlock(v10);
  swift_endAccess();
  sub_249F6E790((uint64_t)v8, &qword_2697515A0);
  swift_release();
  return sub_249F6E790(a1, &qword_2697515A0);
}

uint64_t sub_24A026E90()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SystemOverrideClock()
{
  return self;
}

uint64_t sub_24A026EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_24A026F10@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int (*a3)(char *, uint64_t, uint64_t)@<X2>, unint64_t a4@<X3>, void (*a5)(void, void, void)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v31 = a3;
  unint64_t v32 = a5;
  uint64_t v30 = a1;
  uint64_t v34 = a8;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A056238();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  int64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for SystemOverrideClockData();
  uint64_t v19 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v21 = (char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A0271C0(v30, a2, v31, a4, v32, a6, a7, (uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_24A0563F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(a7, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_249F6E790((uint64_t)v14, &qword_2697515A0);
    uint64_t v23 = 1;
    uint64_t v24 = v34;
  }
  else
  {
    unint64_t v25 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v25(v18, v14, v15);
    v25(v21, v18, v15);
    uint64_t v26 = (uint64_t)v21;
    uint64_t v27 = v34;
    sub_24A02C448(v26, v34);
    uint64_t v23 = 0;
    uint64_t v24 = v27;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v24, v23, 1, v33);
}

uint64_t sub_24A0271C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int (*a3)(char *, uint64_t, uint64_t)@<X2>, unint64_t a4@<X3>, void (*a5)(void, void, void)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v243 = a6;
  v242 = a5;
  unint64_t v249 = a4;
  v244 = a3;
  unint64_t v263 = a2;
  v254 = (char *)a1;
  uint64_t v245 = a8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v9 - 8);
  v237 = (char *)&v214 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751B40);
  MEMORY[0x270FA5388](v11 - 8);
  v248 = (char *)&v214 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = sub_24A055E58();
  uint64_t v246 = *(void *)(v256 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v256);
  v225 = (char *)&v214 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v222 = (char *)&v214 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v253 = (char *)&v214 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v257 = (char *)&v214 - v20;
  MEMORY[0x270FA5388](v19);
  v258 = (char *)&v214 - v21;
  uint64_t v260 = sub_24A0563F8();
  uint64_t v267 = *(void *)(v260 - 8);
  MEMORY[0x270FA5388](v260);
  v235 = (char *)&v214 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = sub_24A0562E8();
  uint64_t v233 = *(void *)(v234 - 8);
  MEMORY[0x270FA5388](v234);
  *(void *)&long long v232 = (char *)&v214 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v252 = sub_24A056388();
  uint64_t v251 = *(void *)(v252 - 8);
  MEMORY[0x270FA5388](v252);
  v266 = (char *)&v214 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v217 = (uint64_t)&v214 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v238 = (uint64_t)&v214 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v221 = (uint64_t)&v214 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v214 = (uint64_t)&v214 - v32;
  uint64_t v255 = sub_24A056538();
  uint64_t v259 = *(void *)(v255 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v255);
  uint64_t v218 = (uint64_t)&v214 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v247 = (char *)&v214 - v36;
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v224 = (uint64_t)&v214 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v219 = (uint64_t)&v214 - v39;
  uint64_t v40 = sub_24A056238();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v240 = (char *)&v214 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  v262 = (char *)&v214 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  v261 = (char *)&v214 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  os_log_t v231 = (os_log_t)((char *)&v214 - v49);
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  v216 = (char *)&v214 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  v215 = (char *)&v214 - v53;
  uint64_t v54 = MEMORY[0x270FA5388](v52);
  v220 = (char *)&v214 - v55;
  uint64_t v56 = MEMORY[0x270FA5388](v54);
  v223 = (char *)&v214 - v57;
  MEMORY[0x270FA5388](v56);
  v264 = (char *)&v214 - v58;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  uint64_t v60 = MEMORY[0x270FA5388](v59 - 8);
  uint64_t v236 = (uint64_t)&v214 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = MEMORY[0x270FA5388](v60);
  uint64_t v250 = (uint64_t)&v214 - v63;
  uint64_t v64 = MEMORY[0x270FA5388](v62);
  v239 = (char *)&v214 - v65;
  uint64_t v66 = MEMORY[0x270FA5388](v64);
  v230 = (char *)&v214 - v67;
  uint64_t v68 = MEMORY[0x270FA5388](v66);
  uint64_t v227 = (uint64_t)&v214 - v69;
  uint64_t v70 = MEMORY[0x270FA5388](v68);
  uint64_t v228 = (uint64_t)&v214 - v71;
  uint64_t v72 = MEMORY[0x270FA5388](v70);
  uint64_t v229 = (uint64_t)&v214 - v73;
  uint64_t v74 = MEMORY[0x270FA5388](v72);
  uint64_t v76 = (char *)&v214 - v75;
  uint64_t v77 = MEMORY[0x270FA5388](v74);
  uint64_t v79 = (char *)&v214 - v78;
  uint64_t v80 = MEMORY[0x270FA5388](v77);
  int v82 = (char *)&v214 - v81;
  uint64_t v83 = MEMORY[0x270FA5388](v80);
  uint64_t v85 = (char *)&v214 - v84;
  uint64_t v86 = MEMORY[0x270FA5388](v83);
  uint64_t v88 = (char *)&v214 - v87;
  uint64_t v89 = MEMORY[0x270FA5388](v86);
  uint64_t v91 = (char *)&v214 - v90;
  MEMORY[0x270FA5388](v89);
  uint64_t v93 = (char *)&v214 - v92;
  sub_24A029420((uint64_t)v242, v243, a7, (uint64_t)&v214 - v92);
  sub_24A02A1F4((uint64_t)v244, v249, (uint64_t)v91);
  unint64_t v249 = a7;
  sub_24A02A1F4((uint64_t)v254, v263, (uint64_t)v88);
  uint64_t v265 = v41;
  uint64_t v96 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
  uint64_t v94 = v41 + 48;
  uint64_t v95 = v96;
  v254 = v93;
  LODWORD(v93) = v96(v93, 1, v40);
  unint64_t v263 = (unint64_t)v91;
  sub_249F6E6C8((uint64_t)v91, (uint64_t)v85, &qword_2697515A0);
  if (v93 == 1)
  {
    unsigned int v97 = v95(v85, 1, v40);
    sub_249F6E790((uint64_t)v85, &qword_2697515A0);
    sub_249F6E6C8((uint64_t)v88, (uint64_t)v82, &qword_2697515A0);
    uint64_t v98 = v40;
    uint64_t v99 = (uint64_t)v88;
    uint64_t v100 = v94;
    if (v97 == 1 && v95(v82, 1, v40) == 1)
    {
      uint64_t v101 = v99;
      sub_249F6E790((uint64_t)v82, &qword_2697515A0);
      uint64_t v102 = v259;
      if (qword_26B16F9B8 != -1) {
        swift_once();
      }
      uint64_t v103 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      uint64_t v104 = v103;
      uint64_t v105 = v217;
      sub_249F6E6C8(v104, v217, &qword_26B16FAA8);
      uint64_t v106 = v255;
      int v107 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v102 + 48))(v105, 1, v255);
      uint64_t v108 = v265;
      uint64_t v109 = v218;
      if (v107 == 1)
      {
        sub_249FB8AA8(v218);
        sub_249F6E790(v105, &qword_26B16FAA8);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v102 + 32))(v218, v105, v106);
      }
      v196 = sub_24A056518();
      os_log_type_t v197 = sub_24A057798();
      if (os_log_type_enabled(v196, v197))
      {
        v198 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v198 = 0;
        _os_log_impl(&dword_249F61000, v196, v197, "Status bar overrides for all time & date entries are nil. Not using override time.", v198, 2u);
        MEMORY[0x24C5BA360](v198, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v109, v106);
      sub_249F6E790(v101, &qword_2697515A0);
      sub_249F6E790(v263, &qword_2697515A0);
      sub_249F6E790((uint64_t)v254, &qword_2697515A0);
      uint64_t v188 = 1;
      uint64_t v187 = v245;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v108 + 56))(v187, v188, 1, v98);
    }
  }
  else
  {
    sub_249F6E790((uint64_t)v85, &qword_2697515A0);
    sub_249F6E6C8((uint64_t)v88, (uint64_t)v82, &qword_2697515A0);
    uint64_t v98 = v40;
    uint64_t v99 = (uint64_t)v88;
    uint64_t v100 = v94;
  }
  sub_249F6E790((uint64_t)v82, &qword_2697515A0);
  sub_249F6E6C8(v263, (uint64_t)v79, &qword_2697515A0);
  unsigned int v110 = v95(v79, 1, v98);
  uint64_t v243 = v100;
  v244 = v95;
  uint64_t v226 = v99;
  if (v110 == 1)
  {
    sub_249F6E790((uint64_t)v79, &qword_2697515A0);
  }
  else
  {
    uint64_t v111 = v265;
    uint64_t v112 = *(void (**)(char *, char *, uint64_t))(v265 + 32);
    uint64_t v113 = v223;
    v112(v223, v79, v98);
    sub_249F6E6C8(v99, (uint64_t)v76, &qword_2697515A0);
    if (v95(v76, 1, v98) == 1)
    {
      (*(void (**)(char *, uint64_t))(v111 + 8))(v113, v98);
      sub_249F6E790((uint64_t)v76, &qword_2697515A0);
    }
    else
    {
      int v114 = v220;
      v112(v220, v76, v98);
      sub_24A02D0F8(&qword_26974FC20, MEMORY[0x263F07490]);
      if ((sub_24A057358() & 1) == 0)
      {
        v190 = v113;
        v191 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
        v191(v264, v190, v98);
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v192 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
        swift_beginAccess();
        uint64_t v193 = v214;
        sub_249F6E6C8(v192, v214, &qword_26B16FAA8);
        uint64_t v194 = v259;
        uint64_t v195 = v255;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v259 + 48))(v193, 1, v255) == 1)
        {
          sub_249FB8AA8(v219);
          sub_249F6E790(v193, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v194 + 32))(v219, v193, v195);
        }
        v199 = v215;
        v191(v215, v223, v98);
        v200 = v216;
        v191(v216, v220, v98);
        v201 = sub_24A056518();
        os_log_type_t v202 = sub_24A0577B8();
        int v203 = v202;
        if (os_log_type_enabled(v201, v202))
        {
          uint64_t v204 = swift_slowAlloc();
          v242 = (void (*)(void, void, void))swift_slowAlloc();
          v271 = v242;
          *(_DWORD *)uint64_t v204 = 136446466;
          uint64_t v205 = sub_24A02D0F8((unint64_t *)&qword_269750148, MEMORY[0x263F07490]);
          os_log_t v231 = v201;
          uint64_t v229 = v205;
          LODWORD(v230) = v203;
          uint64_t v206 = sub_24A057CF8();
          uint64_t v270 = sub_249F782DC(v206, v207, (uint64_t *)&v271);
          sub_24A057978();
          swift_bridgeObjectRelease();
          v208 = *(void (**)(char *, uint64_t))(v111 + 8);
          v208(v199, v98);
          *(_WORD *)(v204 + 12) = 2082;
          uint64_t v209 = sub_24A057CF8();
          uint64_t v270 = sub_249F782DC(v209, v210, (uint64_t *)&v271);
          sub_24A057978();
          swift_bridgeObjectRelease();
          v208(v200, v98);
          os_log_t v211 = v231;
          _os_log_impl(&dword_249F61000, v231, (os_log_type_t)v230, "Status bar overrides for timeEntry and shortTimeEntry are both set and do not match.\nChoosing timeEntry.\ntimeEntry=%{public}s\nshortTimeEntry=%{public}s'", (uint8_t *)v204, 0x16u);
          v212 = v242;
          swift_arrayDestroy();
          MEMORY[0x24C5BA360](v212, -1, -1);
          MEMORY[0x24C5BA360](v204, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v219, v255);
          v208(v220, v98);
          v208(v223, v98);
        }
        else
        {

          v213 = *(void (**)(char *, uint64_t))(v111 + 8);
          v213(v200, v98);
          v213(v199, v98);
          (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v219, v255);
          v213(v220, v98);
          v213(v223, v98);
        }
        uint64_t v95 = v244;
        uint64_t v122 = (uint64_t)v239;
        goto LABEL_22;
      }
      unint64_t v115 = *(void (**)(char *, uint64_t))(v111 + 8);
      v115(v114, v98);
      v115(v113, v98);
      uint64_t v95 = v244;
    }
  }
  uint64_t v116 = v228;
  sub_249F6E6C8(v263, v228, &qword_2697515A0);
  uint64_t v117 = v227;
  sub_249F6E6C8(v99, v227, &qword_2697515A0);
  unsigned int v118 = v95((char *)v116, 1, v98);
  os_log_t v119 = v231;
  uint64_t v120 = (uint64_t)v230;
  uint64_t v121 = v229;
  if (v118 == 1)
  {
    sub_249F845D8(v117, v229);
    sub_249F6E790(v116, &qword_2697515A0);
    uint64_t v122 = (uint64_t)v239;
    uint64_t v123 = v265;
  }
  else
  {
    sub_249F6E790(v117, &qword_2697515A0);
    uint64_t v123 = v265;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v265 + 32))(v121, v116, v98);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v123 + 56))(v121, 0, 1, v98);
    uint64_t v122 = (uint64_t)v239;
  }
  sub_249F6E6C8(v121, v120, &qword_2697515A0);
  if (v95((char *)v120, 1, v98) == 1)
  {
    sub_24A0561F8();
    sub_249F6E790(v121, &qword_2697515A0);
    sub_249F6E790(v120, &qword_2697515A0);
    uint64_t v112 = *(void (**)(char *, char *, uint64_t))(v123 + 32);
  }
  else
  {
    sub_249F6E790(v121, &qword_2697515A0);
    uint64_t v112 = *(void (**)(char *, char *, uint64_t))(v123 + 32);
    v112((char *)v119, (char *)v120, v98);
  }
  v112(v264, (char *)v119, v98);
LABEL_22:
  sub_249F6E6C8((uint64_t)v254, v122, &qword_2697515A0);
  unsigned int v124 = v95((char *)v122, 1, v98);
  uint64_t v241 = v98;
  if (v124 == 1)
  {
    sub_24A0561F8();
    sub_249F6E790(v122, &qword_2697515A0);
  }
  else
  {
    v112(v261, (char *)v122, v98);
  }
  uint64_t v125 = v233;
  uint64_t v126 = v232;
  uint64_t v127 = v234;
  (*(void (**)(void, void, uint64_t))(v233 + 104))(v232, *MEMORY[0x263F07740], v234);
  sub_24A0562F8();
  (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v127);
  v128 = *(void (**)(void, void, void))(v267 + 16);
  v239 = (char *)(v267 + 16);
  v242 = v128;
  v128(v235, v249, v260);
  sub_24A056368();
  v235 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269751B48);
  uint64_t v129 = sub_24A056378();
  uint64_t v130 = *(void *)(v129 - 8);
  uint64_t v131 = *(void *)(v130 + 72);
  uint64_t v132 = *(unsigned __int8 *)(v130 + 80);
  uint64_t v133 = (v132 + 32) & ~v132;
  uint64_t v234 = v133 + 3 * v131;
  uint64_t v233 = v132 | 7;
  uint64_t v134 = swift_allocObject();
  long long v232 = xmmword_24A05C840;
  *(_OWORD *)(v134 + 16) = xmmword_24A05C840;
  v135 = *(void (**)(uint64_t, void, uint64_t))(v130 + 104);
  v135(v134 + v133, *MEMORY[0x263F078A0], v129);
  v135(v134 + v133 + v131, *MEMORY[0x263F078A8], v129);
  v135(v134 + v133 + 2 * v131, *MEMORY[0x263F07870], v129);
  sub_24A02CDE0(v134);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24A056318();
  swift_bridgeObjectRelease();
  uint64_t v136 = swift_allocObject();
  *(_OWORD *)(v136 + 16) = v232;
  v135(v136 + v133, *MEMORY[0x263F07890], v129);
  v135(v136 + v133 + v131, *MEMORY[0x263F078C0], v129);
  v135(v136 + v133 + 2 * v131, *MEMORY[0x263F078C8], v129);
  sub_24A02CDE0(v136);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_24A056318();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v251 + 56))(v248, 1, 1, v252);
  v137 = *(char **)(v267 + 56);
  v267 += 56;
  v235 = v137;
  id v138 = v237;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v137)(v237, 1, 1, v260);
  uint64_t v234 = sub_24A055DC8();
  LODWORD(v233) = v139 & 1;
  *(void *)&long long v232 = sub_24A055DD8();
  LODWORD(v231) = v140 & 1;
  sub_24A055D88();
  sub_24A055DA8();
  sub_24A055DF8();
  sub_24A055E18();
  sub_24A055E38();
  uint64_t v141 = v260;
  v242(v138, v249, v260);
  ((void (*)(char *, void, uint64_t, uint64_t))v235)(v138, 0, 1, v141);
  sub_24A055E48();
  uint64_t v142 = v250;
  sub_24A056338();
  uint64_t v143 = v142;
  uint64_t v144 = v236;
  sub_249F6E6C8(v143, v236, &qword_2697515A0);
  uint64_t v98 = v241;
  if (v244((char *)v144, 1, v241) == 1)
  {
    sub_249F6E790(v144, &qword_2697515A0);
    uint64_t v145 = v256;
    uint64_t v146 = v246;
    uint64_t v147 = v255;
    uint64_t v148 = v259;
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v149 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    uint64_t v150 = v149;
    uint64_t v151 = v221;
    sub_249F6E6C8(v150, v221, &qword_26B16FAA8);
    int v152 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v148 + 48))(v151, 1, v147);
    uint64_t v153 = v225;
    v154 = v222;
    uint64_t v155 = v224;
    if (v152 == 1)
    {
      sub_249FB8AA8(v224);
      sub_249F6E790(v151, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 32))(v224, v151, v147);
    }
    uint64_t v158 = *(void (**)(char *, char *, uint64_t))(v146 + 16);
    v158(v154, v258, v145);
    v158(v153, v257, v145);
    v159 = sub_24A056518();
    os_log_type_t v160 = sub_24A0577B8();
    int v161 = v160;
    if (os_log_type_enabled(v159, v160))
    {
      uint64_t v162 = swift_slowAlloc();
      uint64_t v163 = swift_slowAlloc();
      uint64_t v270 = v163;
      *(_DWORD *)uint64_t v162 = 136446466;
      sub_24A02D0F8(&qword_269751B50, MEMORY[0x263F063B0]);
      LODWORD(v267) = v161;
      uint64_t v164 = sub_24A057CF8();
      uint64_t v269 = sub_249F782DC(v164, v165, &v270);
      sub_24A057978();
      swift_bridgeObjectRelease();
      v166 = *(void (**)(char *, uint64_t))(v146 + 8);
      v166(v154, v256);
      *(_WORD *)(v162 + 12) = 2082;
      v167 = v225;
      uint64_t v98 = v241;
      uint64_t v168 = sub_24A057CF8();
      uint64_t v269 = sub_249F782DC(v168, v169, &v270);
      uint64_t v147 = v255;
      sub_24A057978();
      swift_bridgeObjectRelease();
      v166(v167, v256);
      uint64_t v146 = v246;
      _os_log_impl(&dword_249F61000, v159, (os_log_type_t)v267, "Cannot combine date components.\nChoosing hours and minutes.\nday,month,year=%{public}s\nhour,minute=%{public}s'", (uint8_t *)v162, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v163, -1, -1);
      MEMORY[0x24C5BA360](v162, -1, -1);

      uint64_t v156 = v259;
      (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v224, v147);
    }
    else
    {
      v170 = *(void (**)(char *, uint64_t))(v146 + 8);
      v170(v154, v145);
      v170(v153, v145);

      uint64_t v156 = v259;
      (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v155, v147);
    }
    uint64_t v108 = v265;
    uint64_t v157 = (uint64_t)v247;
    (*(void (**)(char *, char *, uint64_t))(v265 + 16))(v262, v264, v98);
  }
  else
  {
    uint64_t v108 = v265;
    (*(void (**)(char *, uint64_t, uint64_t))(v265 + 32))(v262, v144, v98);
    uint64_t v146 = v246;
    uint64_t v147 = v255;
    uint64_t v156 = v259;
    uint64_t v157 = (uint64_t)v247;
  }
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v171 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  uint64_t v172 = v171;
  uint64_t v173 = v238;
  sub_249F6E6C8(v172, v238, &qword_26B16FAA8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v156 + 48))(v173, 1, v147) == 1)
  {
    sub_249FB8AA8(v157);
    sub_249F6E790(v173, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v156 + 32))(v157, v173, v147);
  }
  v174 = v240;
  (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v240, v262, v98);
  v175 = sub_24A056518();
  os_log_type_t v176 = sub_24A057798();
  if (os_log_type_enabled(v175, v176))
  {
    v177 = (uint8_t *)swift_slowAlloc();
    uint64_t v178 = swift_slowAlloc();
    uint64_t v269 = v178;
    *(_DWORD *)v177 = 136446210;
    sub_24A02D0F8((unint64_t *)&qword_269750148, MEMORY[0x263F07490]);
    uint64_t v179 = sub_24A057CF8();
    uint64_t v268 = sub_249F782DC(v179, v180, &v269);
    sub_24A057978();
    swift_bridgeObjectRelease();
    v181 = *(void (**)(char *, uint64_t))(v265 + 8);
    v181(v174, v98);
    _os_log_impl(&dword_249F61000, v175, v176, "Status bar override date set: %{public}s", v177, 0xCu);
    swift_arrayDestroy();
    uint64_t v182 = v178;
    uint64_t v108 = v265;
    MEMORY[0x24C5BA360](v182, -1, -1);
    MEMORY[0x24C5BA360](v177, -1, -1);

    (*(void (**)(char *, uint64_t))(v259 + 8))(v247, v255);
    sub_249F6E790(v250, &qword_2697515A0);
    v183 = *(void (**)(char *, uint64_t))(v146 + 8);
    uint64_t v184 = v256;
    v183(v253, v256);
    v183(v257, v184);
    v183(v258, v184);
  }
  else
  {

    v181 = *(void (**)(char *, uint64_t))(v108 + 8);
    v181(v174, v98);
    (*(void (**)(uint64_t, uint64_t))(v259 + 8))(v157, v147);
    sub_249F6E790(v250, &qword_2697515A0);
    v185 = *(void (**)(char *, uint64_t))(v146 + 8);
    uint64_t v186 = v256;
    v185(v253, v256);
    v185(v257, v186);
    v185(v258, v186);
  }
  (*(void (**)(char *, uint64_t))(v251 + 8))(v266, v252);
  v181(v261, v98);
  v181(v264, v98);
  sub_249F6E790(v226, &qword_2697515A0);
  sub_249F6E790(v263, &qword_2697515A0);
  sub_249F6E790((uint64_t)v254, &qword_2697515A0);
  uint64_t v187 = v245;
  (*(void (**)(uint64_t, char *, uint64_t))(v108 + 32))(v245, v262, v98);
  uint64_t v188 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v108 + 56))(v187, v188, 1, v98);
}

uint64_t sub_24A029420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v103 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v101 = (uint64_t)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v91 = (uint64_t)&v87 - v10;
  uint64_t v11 = sub_24A056538();
  uint64_t v107 = *(void *)(v11 - 8);
  uint64_t v108 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v106 = (uint8_t *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v92 = (uint64_t)&v87 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v102 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24A0563F8();
  uint64_t v99 = *(void *)(v17 - 8);
  uint64_t v100 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v98 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24A0562E8();
  uint64_t v96 = *(void *)(v19 - 8);
  uint64_t v97 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24A056388();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v105 = (char *)&v87 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v87 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751B40);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v87 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_24A055E58();
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v87 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v90 = v35;
    uint64_t v88 = v33;
    uint64_t v89 = v32;
    uint64_t v93 = v23;
    uint64_t v94 = v22;
    uint64_t v95 = a4;
    uint64_t v110 = a1;
    uint64_t v111 = a2;
    uint64_t v112 = 47;
    unint64_t v113 = 0xE100000000000000;
    sub_249F823CC();
    uint64_t v36 = sub_24A057998();
    uint64_t v37 = *(void *)(v36 + 16);
    uint64_t v104 = v36;
    if (v37)
    {
      swift_bridgeObjectRetain();
      uint64_t v38 = (uint64_t *)(v36 + 40);
      uint64_t v39 = (void *)MEMORY[0x263F8EE78];
      do
      {
        uint64_t v40 = *v38;
        uint64_t v110 = *(v38 - 1);
        uint64_t v111 = v40;
        sub_24A02A80C(&v110, (uint64_t)&v112);
        if ((v113 & 1) == 0)
        {
          uint64_t v41 = v112;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v39 = sub_249FB9F34(0, v39[2] + 1, 1, v39);
          }
          unint64_t v43 = v39[2];
          unint64_t v42 = v39[3];
          if (v43 >= v42 >> 1) {
            uint64_t v39 = sub_249FB9F34((void *)(v42 > 1), v43 + 1, 1, v39);
          }
          v39[2] = v43 + 1;
          v39[v43 + 4] = v41;
        }
        v38 += 2;
        --v37;
      }
      while (v37);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v39 = (void *)MEMORY[0x263F8EE78];
    }
    if (v39[2] == 3)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v93 + 56))(v30, 1, 1, v94);
      uint64_t v48 = v99;
      uint64_t v47 = v100;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v27, 1, 1, v100);
      uint64_t v49 = v90;
      sub_24A055E38();
      uint64_t v51 = v96;
      uint64_t v50 = v97;
      (*(void (**)(char *, void, uint64_t))(v96 + 104))(v21, *MEMORY[0x263F07740], v97);
      uint64_t v52 = v105;
      sub_24A0562F8();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v21, v50);
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v98, v103, v47);
      sub_24A056368();
      uint64_t v53 = (uint64_t)v102;
      sub_24A056338();
      uint64_t v54 = sub_24A056238();
      uint64_t v55 = *(void *)(v54 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54) == 1)
      {
        sub_249F6E790(v53, &qword_2697515A0);
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v56 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
        swift_beginAccess();
        uint64_t v57 = v91;
        sub_249F6E6C8(v56, v91, &qword_26B16FAA8);
        uint64_t v58 = v107;
        uint64_t v59 = v108;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48))(v57, 1, v108) == 1)
        {
          uint64_t v60 = v92;
          sub_249FB8AA8(v92);
          sub_249F6E790(v57, &qword_26B16FAA8);
        }
        else
        {
          uint64_t v78 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32);
          uint64_t v60 = v92;
          v78(v92, v57, v59);
        }
        swift_bridgeObjectRetain();
        uint64_t v79 = sub_24A056518();
        os_log_type_t v80 = sub_24A0577B8();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = (uint8_t *)swift_slowAlloc();
          uint64_t v82 = swift_slowAlloc();
          uint64_t v112 = v82;
          *(_DWORD *)uint64_t v81 = 136446210;
          uint64_t v106 = v81 + 4;
          uint64_t v83 = swift_bridgeObjectRetain();
          uint64_t v84 = MEMORY[0x24C5B8D90](v83, MEMORY[0x263F8D310]);
          unint64_t v86 = v85;
          swift_bridgeObjectRelease();
          uint64_t v109 = sub_249F782DC(v84, v86, &v112);
          sub_24A057978();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_249F61000, v79, v80, "Cannot convert date components ints to date. Components: '%{public}s'", v81, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C5BA360](v82, -1, -1);
          MEMORY[0x24C5BA360](v81, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v92, v108);
          (*(void (**)(char *, uint64_t))(v93 + 8))(v105, v94);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v60, v59);
          (*(void (**)(char *, uint64_t))(v93 + 8))(v52, v94);
        }
        (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v89);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v55 + 56))(v95, 1, 1, v54);
      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v93 + 8))(v52, v94);
        (*(void (**)(char *, uint64_t))(v88 + 8))(v49, v89);
        uint64_t v68 = v95;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 32))(v95, v53, v54);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v55 + 56))(v68, 0, 1, v54);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_26B16F9B8 != -1) {
        swift_once();
      }
      uint64_t v61 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      uint64_t v62 = v61;
      uint64_t v63 = v101;
      sub_249F6E6C8(v62, v101, &qword_26B16FAA8);
      uint64_t v65 = v107;
      uint64_t v64 = v108;
      int v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v107 + 48))(v63, 1, v108);
      uint64_t v67 = (uint64_t)v106;
      if (v66 == 1)
      {
        sub_249FB8AA8((uint64_t)v106);
        sub_249F6E790(v63, &qword_26B16FAA8);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t, uint64_t))(v65 + 32))(v106, v63, v64);
      }
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_24A056518();
      os_log_type_t v70 = sub_24A0577B8();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = (uint8_t *)swift_slowAlloc();
        uint64_t v72 = swift_slowAlloc();
        uint64_t v112 = v72;
        *(_DWORD *)uint64_t v71 = 136446210;
        uint64_t v73 = swift_bridgeObjectRetain();
        uint64_t v74 = MEMORY[0x24C5B8D90](v73, MEMORY[0x263F8D310]);
        unint64_t v76 = v75;
        swift_bridgeObjectRelease();
        uint64_t v109 = sub_249F782DC(v74, v76, &v112);
        sub_24A057978();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_249F61000, v69, v70, "Expected 3 date components, not '%{public}s'", v71, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C5BA360](v72, -1, -1);
        MEMORY[0x24C5BA360](v71, -1, -1);

        (*(void (**)(uint8_t *, uint64_t))(v65 + 8))(v106, v108);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v64);
      }
      uint64_t v77 = sub_24A056238();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v95, 1, 1, v77);
    }
  }
  else
  {
    uint64_t v44 = sub_24A056238();
    uint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56);
    return v45(a4, 1, 1, v44);
  }
}

uint64_t sub_24A02A1F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A056538();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v36 = (uint8_t *)v12;
    uint64_t v37 = v10;
    uint64_t v38 = v9;
    uint64_t v39 = a3;
    uint64_t v16 = qword_26FDE5B60;
    swift_bridgeObjectRetain();
    if (v16)
    {
      uint64_t v18 = *(void *)aHMmA;
      uint64_t v17 = unk_26FDE5B78;
      swift_bridgeObjectRetain();
      sub_24A02AE14(v40, a2, v18, v17, (uint64_t)v15);
      swift_bridgeObjectRelease();
      uint64_t v12 = (char *)sub_24A056238();
      uint64_t v3 = *((void *)v12 - 1);
      uint64_t v19 = *(unsigned int (**)(char *, uint64_t, char *))(v3 + 48);
      if (v19(v15, 1, v12) != 1) {
        goto LABEL_11;
      }
      sub_249F6E790((uint64_t)v15, &qword_2697515A0);
      if ((unint64_t)qword_26FDE5B60 >= 2)
      {
        uint64_t v20 = *(void *)aHhMm;
        uint64_t v21 = unk_26FDE5B88;
        swift_bridgeObjectRetain();
        sub_24A02AE14(v40, a2, v20, v21, (uint64_t)v15);
        swift_bridgeObjectRelease();
        if (v19(v15, 1, v12) != 1) {
          goto LABEL_11;
        }
        sub_249F6E790((uint64_t)v15, &qword_2697515A0);
        if ((unint64_t)qword_26FDE5B60 >= 3)
        {
          uint64_t v23 = aHhMmSs[0];
          uint64_t v22 = aHhMmSs[1];
          swift_bridgeObjectRetain();
          sub_24A02AE14(v40, a2, v23, v22, (uint64_t)v15);
          swift_bridgeObjectRelease();
          if (v19(v15, 1, v12) == 1)
          {
            sub_249F6E790((uint64_t)v15, &qword_2697515A0);
            swift_arrayDestroy();
            if (qword_26B16F9B8 == -1)
            {
LABEL_9:
              uint64_t v24 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
              swift_beginAccess();
              sub_249F6E6C8(v24, (uint64_t)v8, &qword_26B16FAA8);
              uint64_t v26 = v37;
              uint64_t v25 = v38;
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v8, 1, v38) == 1)
              {
                uint64_t v27 = (uint64_t)v36;
                sub_249FB8AA8((uint64_t)v36);
                sub_249F6E790((uint64_t)v8, &qword_26B16FAA8);
              }
              else
              {
                uint64_t v27 = (uint64_t)v36;
                (*(void (**)(uint8_t *, char *, uint64_t))(v26 + 32))(v36, v8, v25);
              }
              swift_bridgeObjectRetain();
              uint64_t v32 = sub_24A056518();
              os_log_type_t v33 = sub_24A0577B8();
              if (os_log_type_enabled(v32, v33))
              {
                uint64_t v34 = (uint8_t *)swift_slowAlloc();
                uint64_t v35 = swift_slowAlloc();
                uint64_t v42 = v35;
                *(_DWORD *)uint64_t v34 = 136315138;
                uint64_t v36 = v34 + 4;
                swift_bridgeObjectRetain();
                uint64_t v41 = sub_249F782DC(v40, a2, &v42);
                sub_24A057978();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_249F61000, v32, v33, "Couldn't convert '%s' to override date", v34, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x24C5BA360](v35, -1, -1);
                MEMORY[0x24C5BA360](v34, -1, -1);

                (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v38);
              }
              else
              {

                swift_bridgeObjectRelease_n();
                (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v25);
              }
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(v3 + 56))(v39, 1, 1, v12);
            }
LABEL_21:
            swift_once();
            goto LABEL_9;
          }
LABEL_11:
          swift_bridgeObjectRelease();
          uint64_t v28 = v39;
          (*(void (**)(uint64_t, char *, char *))(v3 + 32))(v39, v15, v12);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(v3 + 56))(v28, 0, 1, v12);
        }
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v30 = sub_24A056238();
  uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56);

  return v31(a3, 1, 1, v30);
}

uint64_t sub_24A02A80C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A056538();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  unint64_t v15 = a1[1];
  uint64_t v16 = HIBYTE(v15) & 0xF;
  uint64_t v17 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v15 & 0x2000000000000000) != 0) {
    uint64_t v18 = HIBYTE(v15) & 0xF;
  }
  else {
    uint64_t v18 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v48 = *a1;
  if (!v18) {
    goto LABEL_46;
  }
  if ((v15 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = (uint64_t)sub_24A02C590(v14, v15, 10);
    char v22 = v44;
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  if ((v15 & 0x2000000000000000) == 0)
  {
    if ((v14 & 0x1000000000000000) != 0) {
      uint64_t v19 = (unsigned __int8 *)((v15 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v19 = (unsigned __int8 *)sub_24A057AA8();
    }
    uint64_t result = (uint64_t)sub_24A02C678(v19, v17, 10);
    uint64_t v20 = result;
    char v22 = v21 & 1;
LABEL_44:
    if ((v22 & 1) == 0)
    {
      char v32 = 0;
LABEL_54:
      *(void *)a2 = v20;
      *(unsigned char *)(a2 + 8) = v32;
      return result;
    }
LABEL_46:
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v33 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_249F6E6C8(v33, (uint64_t)v8, &qword_26B16FAA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      sub_249FB8AA8((uint64_t)v13);
      sub_249F6E790((uint64_t)v8, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
    }
    swift_bridgeObjectRetain_n();
    uint64_t v34 = sub_24A056518();
    os_log_type_t v35 = sub_24A0577B8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v45 = v9;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v47 = v3;
      uint64_t v37 = (uint8_t *)v36;
      uint64_t v38 = swift_slowAlloc();
      uint64_t v46 = a2;
      uint64_t v39 = v38;
      uint64_t v51 = v38;
      *(_DWORD *)uint64_t v37 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_249F782DC(v48, v15, &v51);
      sub_24A057978();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_249F61000, v34, v35, "Couldn't covert '%{public}s' to int", v37, 0xCu);
      char v32 = 1;
      swift_arrayDestroy();
      uint64_t v40 = v39;
      a2 = v46;
      MEMORY[0x24C5BA360](v40, -1, -1);
      MEMORY[0x24C5BA360](v37, -1, -1);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v45);
      uint64_t v20 = 0;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      uint64_t v20 = 0;
      char v32 = 1;
    }
    goto LABEL_54;
  }
  v50[0] = v14;
  v50[1] = v15 & 0xFFFFFFFFFFFFFFLL;
  if (v14 == 43)
  {
    if (!v16) {
      goto LABEL_64;
    }
    if (v16 == 1 || (BYTE1(v14) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v20 = (BYTE1(v14) - 48);
    if (v16 != 2)
    {
      if ((BYTE2(v14) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v20 = 10 * (BYTE1(v14) - 48) + (BYTE2(v14) - 48);
      uint64_t v23 = v16 - 3;
      if (v23)
      {
        uint64_t v24 = (unsigned __int8 *)v50 + 3;
        while (1)
        {
          unsigned int v25 = *v24 - 48;
          if (v25 > 9) {
            goto LABEL_31;
          }
          uint64_t v26 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
            goto LABEL_31;
          }
          uint64_t v20 = v26 + v25;
          if (__OFADD__(v26, v25)) {
            goto LABEL_31;
          }
          char v22 = 0;
          ++v24;
          if (!--v23) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    char v22 = 0;
    goto LABEL_44;
  }
  if (v14 != 45)
  {
    if (!v16 || (v14 - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v20 = (v14 - 48);
    if (v16 != 1)
    {
      if ((BYTE1(v14) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v20 = 10 * (v14 - 48) + (BYTE1(v14) - 48);
      uint64_t v27 = v16 - 2;
      if (v27)
      {
        uint64_t v28 = (unsigned __int8 *)v50 + 2;
        while (1)
        {
          unsigned int v29 = *v28 - 48;
          if (v29 > 9) {
            goto LABEL_31;
          }
          uint64_t v30 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
            goto LABEL_31;
          }
          uint64_t v20 = v30 + v29;
          if (__OFADD__(v30, v29)) {
            goto LABEL_31;
          }
          char v22 = 0;
          ++v28;
          if (!--v27) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v16)
  {
    if (v16 != 1 && (BYTE1(v14) - 48) <= 9u)
    {
      if (v16 == 2)
      {
        char v22 = 0;
        uint64_t v20 = -(uint64_t)(BYTE1(v14) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v14) - 48) <= 9u)
      {
        uint64_t v20 = -10 * (BYTE1(v14) - 48) - (BYTE2(v14) - 48);
        uint64_t v31 = v16 - 3;
        if (!v31) {
          goto LABEL_43;
        }
        uint64_t v41 = (unsigned __int8 *)v50 + 3;
        while (1)
        {
          unsigned int v42 = *v41 - 48;
          if (v42 > 9) {
            break;
          }
          uint64_t v43 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63) {
            break;
          }
          uint64_t v20 = v43 - v42;
          if (__OFSUB__(v43, v42)) {
            break;
          }
          char v22 = 0;
          ++v41;
          if (!--v31) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    uint64_t v20 = 0;
    char v22 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_24A02AE14@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v63 = a4;
  uint64_t v59 = a1;
  unint64_t v60 = a2;
  uint64_t v69 = a5;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v68 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A0562E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A056388();
  uint64_t v70 = v11;
  uint64_t v75 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24A056238();
  uint64_t v66 = *(void *)(v14 - 8);
  uint64_t v67 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v54 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v53 - v17;
  sub_24A0561F8();
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  unsigned int v55 = *MEMORY[0x263F07740];
  uint64_t v74 = *(void (**)(char *))(v8 + 104);
  v74(v10);
  sub_24A0562F8();
  uint64_t v72 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v73 = v8 + 8;
  v72(v10, v7);
  uint64_t v20 = (void *)sub_24A056328();
  char v21 = *(void (**)(char *, uint64_t))(v75 + 8);
  v75 += 8;
  uint64_t v71 = v21;
  v21(v13, v11);
  objc_msgSend(v19, sel_setCalendar_, v20);

  char v22 = (void *)sub_24A0563C8();
  objc_msgSend(v19, sel_setTimeZone_, v22);

  uint64_t v23 = (void *)sub_24A057368();
  objc_msgSend(v19, sel_setDateFormat_, v23);

  uint64_t v24 = (void *)sub_24A056198();
  id v64 = v19;
  id v25 = objc_msgSend(v19, sel_stringFromDate_, v24);

  uint64_t v58 = sub_24A0573A8();
  unint64_t v57 = v26;

  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v28 = v55;
  ((void (*)(char *, void, uint64_t))v74)(v10, v55, v7);
  sub_24A0562F8();
  v72(v10, v7);
  unsigned int v29 = (void *)sub_24A056328();
  v71(v13, v70);
  objc_msgSend(v27, sel_setCalendar_, v29);

  uint64_t v30 = (void *)sub_24A0563C8();
  objc_msgSend(v27, sel_setTimeZone_, v30);

  uint64_t v31 = (void *)sub_24A057368();
  objc_msgSend(v27, sel_setDateFormat_, v31);

  uint64_t v65 = v18;
  char v32 = (void *)sub_24A056198();
  id v61 = v27;
  id v33 = objc_msgSend(v27, sel_stringFromDate_, v32);

  uint64_t v56 = sub_24A0573A8();
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  ((void (*)(char *, uint64_t, uint64_t))v74)(v10, v28, v7);
  sub_24A0562F8();
  os_log_type_t v35 = v10;
  uint64_t v36 = v7;
  uint64_t v38 = v59;
  unint64_t v37 = v60;
  v72(v35, v36);
  uint64_t v39 = (void *)sub_24A056328();
  v71(v13, v70);
  objc_msgSend(v34, sel_setCalendar_, v39);

  uint64_t v40 = (void *)sub_24A0563C8();
  objc_msgSend(v34, sel_setTimeZone_, v40);

  uint64_t v78 = 0x2D4D4D2D79797979;
  unint64_t v79 = 0xEB00000000206464;
  sub_24A057438();
  sub_24A057438();
  sub_24A057438();
  uint64_t v41 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setDateFormat_, v41);

  uint64_t v78 = v38;
  unint64_t v79 = v37;
  uint64_t v76 = 58;
  unint64_t v77 = 0xE100000000000000;
  sub_249F823CC();
  if (*(void *)(sub_24A057998() + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24A057418();
  }
  swift_bridgeObjectRelease();
  uint64_t v78 = 0;
  unint64_t v79 = 0xE000000000000000;
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  uint64_t v78 = v58;
  unint64_t v79 = v57;
  sub_24A057438();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  sub_24A057438();
  swift_bridgeObjectRelease();
  unsigned int v42 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();
  id v43 = objc_msgSend(v34, sel_dateFromString_, v42);

  uint64_t v45 = v67;
  uint64_t v44 = (uint64_t)v68;
  if (!v43)
  {

    uint64_t v50 = v66;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v45);
    uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56);
    v49(v44, 1, 1, v45);
LABEL_7:
    sub_249F6E790(v44, &qword_2697515A0);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v49)(v69, 1, 1, v45);
  }
  uint64_t v46 = v54;
  sub_24A0561E8();

  uint64_t v47 = v66;
  (*(void (**)(char *, uint64_t))(v66 + 8))(v65, v45);
  uint64_t v48 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 32);
  v48(v44, v46, v45);
  uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56);
  v49(v44, 0, 1, v45);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v44, 1, v45) == 1) {
    goto LABEL_7;
  }
  uint64_t v52 = v69;
  v48(v69, (char *)v44, v45);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v49)(v52, 0, 1, v45);
}

void sub_24A02B6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A056538();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v2 + 16))
  {
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_249F6E6C8(v12, (uint64_t)v7, &qword_26B16FAA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_249FB8AA8((uint64_t)v11);
      sub_249F6E790((uint64_t)v7, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    }
    uint64_t v13 = sub_24A056518();
    os_log_type_t v14 = sub_24A0577B8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_249F61000, v13, v14, "SystemSystemStatusBarOverrideProvider handler is not nil. Cannot replace it'", v15, 2u);
      MEMORY[0x24C5BA360](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    *(void *)(v2 + 16) = a1;
    *(void *)(v2 + 24) = a2;
    swift_retain();
    sub_249F6C9E0(0);
    sub_24A02B9A8();
  }
}

void sub_24A02B9A8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751B70);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_24A02D178;
  void aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A02BC28;
  aBlock[3] = &block_descriptor_13;
  uint64_t v6 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v4, sel_observeDataWithBlock_, v6);
  _Block_release(v6);
  id v7 = objc_msgSend(v4, sel_data);
  sub_24A02BC94(v7, (uint64_t)v3);
  uint64_t v8 = *(void (**)(char *))(v0 + 16);
  if (v8)
  {
    swift_retain();
    v8(v3);
    sub_249F6C9E0((uint64_t)v8);
  }
  sub_249F6E790((uint64_t)v3, &qword_269751B70);
}

uint64_t sub_24A02BB30(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751B70);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    sub_24A02BC94(a1, (uint64_t)v4);
    id v7 = *(void (**)(char *))(v6 + 16);
    if (v7)
    {
      swift_retain();
      v7(v4);
      sub_249F6C9E0((uint64_t)v7);
    }
    sub_249F6E790((uint64_t)v4, &qword_269751B70);
    return swift_release();
  }
  return result;
}

void sub_24A02BC28(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_24A02BC94(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24A0563F8();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v7 = a1;
    id v8 = objc_msgSend(v7, sel_customOverrides);
    id v9 = objc_msgSend(v8, sel_shortTimeEntry);

    if (v9)
    {
      unsigned __int8 v10 = objc_msgSend(v9, sel_isEnabled);

      if (v10) {
        goto LABEL_8;
      }
    }
    id v11 = objc_msgSend(v7, sel_customOverrides);
    id v12 = objc_msgSend(v11, sel_timeEntry);

    if (v12)
    {
      unsigned __int8 v13 = objc_msgSend(v12, sel_isEnabled);

      if (v13) {
        goto LABEL_8;
      }
    }
    id v14 = objc_msgSend(v7, sel_customOverrides);
    id v15 = objc_msgSend(v14, sel_dateEntry);

    if (v15)
    {
      unsigned int v16 = objc_msgSend(v15, sel_isEnabled);

      if (v16)
      {
LABEL_8:
        id v17 = objc_msgSend(v7, sel_customOverrides);
        id v18 = objc_msgSend(v17, sel_shortTimeEntry);

        if (v18)
        {
          id v19 = objc_msgSend(v18, sel_stringValue);

          id v18 = (id)sub_24A0573A8();
          unint64_t v21 = v20;
        }
        else
        {
          unint64_t v21 = 0;
        }
        id v24 = objc_msgSend(v7, sel_customOverrides);
        id v25 = objc_msgSend(v24, sel_timeEntry);

        if (v25)
        {
          id v26 = objc_msgSend(v25, sel_stringValue);

          id v25 = (id)sub_24A0573A8();
          unint64_t v28 = v27;
        }
        else
        {
          unint64_t v28 = 0;
        }
        id v29 = objc_msgSend(v7, sel_customOverrides);
        id v30 = objc_msgSend(v29, sel_dateEntry);

        if (v30)
        {
          id v31 = objc_msgSend(v30, sel_stringValue);

          id v30 = (id)sub_24A0573A8();
          uint64_t v33 = v32;
        }
        else
        {
          uint64_t v33 = 0;
        }
        sub_24A0563E8();
        sub_24A026F10((uint64_t)v18, v21, (unsigned int (*)(char *, uint64_t, uint64_t))v25, v28, (void (*)(void, void, void))v30, v33, (uint64_t)v6, a2);

        return;
      }
    }
  }
  uint64_t v22 = type metadata accessor for SystemOverrideClockData();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);

  v23(a2, 1, 1, v22);
}

uint64_t sub_24A02C00C()
{
  sub_249F6C9E0(*(void *)(v0 + 16));

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SystemSystemStatusBarOverrideProvider()
{
  return self;
}

uint64_t sub_24A02C070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_24A02C0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24A02C140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24A02C1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24A02C208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24A02C26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A02C280);
}

uint64_t sub_24A02C280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_24A02C2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A02C300);
}

uint64_t sub_24A02C300(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056238();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SystemOverrideClockData()
{
  uint64_t result = qword_269751B30;
  if (!qword_269751B30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A02C3BC()
{
  uint64_t result = sub_24A056238();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A02C448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SystemOverrideClockData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_24A02C4AC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FA78);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24A02C514(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_24A0574C8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x24C5B8C90](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_24A02C590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_24A0574E8();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_24A02C8F4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_24A057AA8();
  }
LABEL_7:
  uint64_t v11 = sub_24A02C678(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_24A02C678(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  id v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_24A02C8F4()
{
  unint64_t v0 = sub_24A0574F8();
  uint64_t v4 = sub_24A02C974(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24A02C974(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_24A02CACC(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_24A02C4AC(v9, 0);
      unint64_t v12 = sub_24A02CBCC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_24A057AA8();
LABEL_4:
        JUMPOUT(0x24C5B8C10);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x24C5B8C10](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24C5B8C10]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_24A02CACC(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_24A02C514(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_24A02C514(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_24A02CBCC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_24A02C514(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_24A057498();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_24A057AA8();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_24A02C514(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_24A057468();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24A02CDE0(uint64_t a1)
{
  uint64_t v2 = sub_24A056378();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751B58);
    uint64_t v9 = sub_24A057A48();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    os_log_type_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    id v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_24A02D0F8(&qword_269751B60, MEMORY[0x263F07908]);
      uint64_t v16 = sub_24A057308();
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
          sub_24A02D0F8(&qword_269751B68, MEMORY[0x263F07908]);
          char v23 = sub_24A057358();
          unsigned __int8 v24 = *v15;
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

uint64_t sub_24A02D0F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A02D140()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A02D178(void *a1)
{
  return sub_24A02BB30(a1);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_24A02D198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A02D200(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751B78);
    uint64_t v3 = sub_24A057A48();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_24A057E28();
      swift_bridgeObjectRetain();
      sub_24A057408();
      uint64_t result = sub_24A057E68();
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
        if (v17 || (uint64_t result = sub_24A057D48(), (result & 1) != 0))
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
          unint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_24A057D48();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
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

uint64_t sub_24A02D3A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SystemOverrideClockData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24A02D400(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace;
  type metadata accessor for PlayClockFaceView();
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  *(void *)&v1[v3] = v4;
  sub_249F75B7C(a1, (uint64_t)&v1[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look]);
  v1[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_isDisplayStyleRedMode] = 0;
  v1[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 0;
  objc_allocWithZone((Class)type metadata accessor for ClockFaceHostView());
  id v5 = v4;
  unint64_t v6 = v1;
  *(void *)&v6[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView] = sub_249FC8D90(v5);

  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for ClockFaceViewController();
  id v7 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);

  sub_249F75B7C(a1, (uint64_t)v11);
  uint64_t v8 = (uint64_t)v7 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  id v9 = v7;
  sub_249F88840((uint64_t)v11, v8);
  swift_endAccess();
  sub_24A02D608();
  sub_249F75BD8((uint64_t)v11);

  sub_249F75BD8(a1);
  return v9;
}

uint64_t sub_24A02D608()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v89 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A056538();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look];
  swift_beginAccess();
  sub_249F75B7C(v8, (uint64_t)v105);
  if (v107 == 2)
  {
    swift_bridgeObjectRelease();
    sub_249F7B5E8(v105, (uint64_t)v96);
    sub_249F7B5E8(v106, (uint64_t)v93);
    uint64_t v92 = *(void *)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26974F928);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_24A05EA80;
    uint64_t v43 = v97;
    uint64_t v44 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    uint64_t v45 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v44 + 56))(v43, v44);
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = v45;
    *(void *)(v46 + 24) = 0x4063200000000000;
    id v47 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C490;
    uint64_t v104 = v46;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_14;
    uint64_t v48 = _Block_copy(&v99);
    id v49 = v45;
    id v50 = objc_msgSend(v47, sel_initWithDynamicProvider_, v48);
    _Block_release(v48);

    swift_release();
    *(void *)(v42 + 32) = v50;
    uint64_t v51 = v94;
    uint64_t v52 = v95;
    __swift_project_boxed_opaque_existential_1(v93, v94);
    uint64_t v53 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v52 + 40))(v51, v52);
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = v53;
    *(void *)(v54 + 24) = 0x4063200000000000;
    id v55 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v54;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_28_0;
    uint64_t v56 = _Block_copy(&v99);
    id v57 = v53;
    id v58 = objc_msgSend(v55, sel_initWithDynamicProvider_, v56);
    _Block_release(v56);

    swift_release();
    *(void *)(v42 + 40) = v58;
    *(void *)(v42 + 48) = objc_msgSend(self, sel_clearColor);
    uint64_t v59 = v97;
    uint64_t v60 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    id v61 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v60 + 40))(v59, v60);
    uint64_t v62 = swift_allocObject();
    *(void *)(v62 + 16) = v61;
    *(void *)(v62 + 24) = 0x4063200000000000;
    id v63 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v62;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_35;
    id v64 = _Block_copy(&v99);
    id v65 = v61;
    id v66 = objc_msgSend(v63, sel_initWithDynamicProvider_, v64);
    _Block_release(v64);

    swift_release();
    *(void *)(v42 + 56) = v66;
    uint64_t v67 = v94;
    uint64_t v68 = v95;
    __swift_project_boxed_opaque_existential_1(v93, v94);
    uint64_t v69 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v68 + 56))(v67, v68);
    uint64_t v70 = swift_allocObject();
    *(void *)(v70 + 16) = v69;
    *(void *)(v70 + 24) = 0x4063200000000000;
    id v71 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v70;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_42;
    uint64_t v72 = _Block_copy(&v99);
    id v73 = v69;
    id v74 = objc_msgSend(v71, sel_initWithDynamicProvider_, v72);
    _Block_release(v72);

    swift_release();
    *(void *)(v42 + 64) = v74;
    uint64_t v99 = v42;
    sub_24A057588();
    sub_24A05508C(v99);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v93);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v96);
  }
  if (!v107)
  {
    swift_bridgeObjectRelease();
    sub_249F7B5E8(v105, (uint64_t)v96);
    uint64_t v92 = *(void *)&v0[OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26974F928);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_24A05EA80;
    uint64_t v10 = v97;
    uint64_t v11 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    objc_super v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v10, v11);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    *(void *)(v13 + 24) = 0x4063200000000000;
    id v14 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v13;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_49_0;
    uint64_t v15 = _Block_copy(&v99);
    id v16 = v12;
    id v17 = objc_msgSend(v14, sel_initWithDynamicProvider_, v15);
    _Block_release(v15);

    swift_release();
    *(void *)(v9 + 32) = v17;
    uint64_t v18 = v97;
    uint64_t v19 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    uint64_t v20 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 40))(v18, v19);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = 0x4063200000000000;
    id v22 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v21;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_56;
    BOOL v23 = _Block_copy(&v99);
    id v24 = v20;
    id v25 = objc_msgSend(v22, sel_initWithDynamicProvider_, v23);
    _Block_release(v23);

    swift_release();
    *(void *)(v9 + 40) = v25;
    *(void *)(v9 + 48) = objc_msgSend(self, sel_clearColor);
    uint64_t v26 = v97;
    uint64_t v27 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    BOOL v28 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 56))(v26, v27);
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v28;
    *(void *)(v29 + 24) = 0x4063200000000000;
    id v30 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v29;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_63;
    id v31 = _Block_copy(&v99);
    id v32 = v28;
    id v33 = objc_msgSend(v30, sel_initWithDynamicProvider_, v31);
    _Block_release(v31);

    swift_release();
    *(void *)(v9 + 56) = v33;
    uint64_t v34 = v97;
    uint64_t v35 = v98;
    __swift_project_boxed_opaque_existential_1(v96, v97);
    uint64_t v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v35 + 40))(v34, v35);
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v36;
    *(void *)(v37 + 24) = 0x4063200000000000;
    id v38 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v103 = sub_249F7C4E4;
    uint64_t v104 = v37;
    uint64_t v99 = MEMORY[0x263EF8330];
    uint64_t v100 = 1107296256;
    uint64_t v101 = sub_249FDA198;
    uint64_t v102 = &block_descriptor_70;
    uint64_t v39 = _Block_copy(&v99);
    id v40 = v36;
    id v41 = objc_msgSend(v38, sel_initWithDynamicProvider_, v39);
    _Block_release(v39);

    swift_release();
    *(void *)(v9 + 64) = v41;
    uint64_t v99 = v9;
    sub_24A057588();
    sub_24A05508C(v99);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v96);
  }
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v76 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  sub_249F6E6C8(v76, (uint64_t)v3, &qword_26B16FAA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249FB8AA8((uint64_t)v7);
    sub_249F6E790((uint64_t)v3, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  unint64_t v77 = v0;
  uint64_t v78 = sub_24A056518();
  os_log_type_t v79 = sub_24A0577B8();
  int v80 = v79;
  if (os_log_type_enabled(v78, v79))
  {
    uint64_t v81 = swift_slowAlloc();
    uint64_t v91 = (void *)swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    v93[0] = v92;
    *(_DWORD *)uint64_t v81 = 136446466;
    int v90 = v80;
    sub_249F75B7C(v8, (uint64_t)&v99);
    os_log_t v89 = v78;
    uint64_t v82 = sub_249F73AC4();
    unint64_t v84 = v83;
    sub_249F75BD8((uint64_t)&v99);
    uint64_t v99 = sub_249F782DC(v82, v84, v93);
    sub_24A057978();

    swift_bridgeObjectRelease();
    *(_WORD *)(v81 + 12) = 2114;
    uint64_t v99 = (uint64_t)v77;
    unint64_t v85 = v77;
    sub_24A057978();
    unint64_t v86 = v91;
    *uint64_t v91 = v77;

    os_log_t v87 = v89;
    _os_log_impl(&dword_249F61000, v89, (os_log_type_t)v90, "Unsupported look. Look: '%{public}s' for '%{public}@'", (uint8_t *)v81, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v86, -1, -1);
    uint64_t v88 = v92;
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v88, -1, -1);
    MEMORY[0x24C5BA360](v81, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_249F75BD8((uint64_t)v105);
}

uint64_t sub_24A02E2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v4[6] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FF18);
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FF20);
  v4[12] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FF28);
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FF30);
  v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = sub_24A057608();
  v4[20] = sub_24A0575F8();
  uint64_t v9 = sub_24A0575D8();
  v4[21] = v9;
  v4[22] = v8;
  return MEMORY[0x270FA2498](sub_24A02E508, v9, v8);
}

uint64_t sub_24A02E508()
{
  if (qword_26974F2C0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_269752360;
  *(void *)(v0 + 184) = qword_269752360;
  return MEMORY[0x270FA2498](sub_24A02E5A0, v1, 0);
}

uint64_t sub_24A02E5A0()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[15];
  uint64_t v3 = *(void *)(v1 + 112);
  swift_retain();
  sub_249FF09F4(v3, v1, v2);
  uint64_t v4 = v0[21];
  uint64_t v5 = v0[22];
  return MEMORY[0x270FA2498](sub_24A02E628, v4, v5);
}

uint64_t sub_24A02E628()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v4 = sub_24A0575F8();
  v0[24] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[25] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24A02E740;
  uint64_t v6 = v0[16];
  uint64_t v7 = v0[12];
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v7, v4, v8, v6);
}

uint64_t sub_24A02E740()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 176);
  uint64_t v3 = *(void *)(v1 + 168);
  return MEMORY[0x270FA2498](sub_24A02E884, v3, v2);
}

uint64_t sub_24A02E884()
{
  uint64_t v1 = v0[12];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[8] + 48))(v1, 1, v0[7]) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    swift_release();
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
  uint64_t v2 = v0[5] + 16;
  sub_249F88B08(v1, v0[11]);
  uint64_t v3 = MEMORY[0x24C5BA430](v2);
  if (!v3)
  {
    uint64_t v13 = v0[17];
    uint64_t v12 = v0[18];
    uint64_t v14 = v0[16];
    uint64_t v15 = v0[11];
    swift_release();
    sub_249F6E790(v15, &qword_26974FF18);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    goto LABEL_7;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = v0[10];
  sub_249F6E6C8(v0[11], v5, &qword_26974FF18);
  uint64_t v6 = type metadata accessor for Alarm();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);
  int v8 = v7(v5, 1, v6);
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[6];
  if (v8 == 1)
  {
    sub_249F6E790(v0[10], &qword_26974FF18);
    uint64_t v11 = sub_24A056238();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    uint64_t v18 = sub_24A056238();
    uint64_t v19 = *(void *)(v18 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v10, v9, v18);
    sub_249F88BD4(v9);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  }
  uint64_t v20 = v0[9];
  sub_249F6E6C8(v0[11], v20, &qword_26974FF18);
  int v21 = v7(v20, 1, v6);
  uint64_t v22 = v0[9];
  if (v21 == 1)
  {
    sub_249F6E790(v22, &qword_26974FF18);
    char v23 = 2;
  }
  else
  {
    char v23 = *(unsigned char *)(v22 + *(int *)(v6 + 20));
    sub_249F88BD4(v22);
  }
  uint64_t v24 = v0[11];
  uint64_t v25 = v0[6];
  sub_24A02EEE8(v25, v23);

  sub_249F6E790(v25, &qword_2697515A0);
  sub_249F6E790(v24, &qword_26974FF18);
  uint64_t v26 = sub_24A0575F8();
  v0[24] = v26;
  uint64_t v27 = (void *)swift_task_alloc();
  v0[25] = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_24A02E740;
  uint64_t v28 = v0[16];
  uint64_t v29 = v0[12];
  uint64_t v30 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v29, v26, v30, v28);
}

id sub_24A02EDF4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView);
  unsigned __int8 v10 = 2;
  char v5 = *(unsigned char *)(v1 + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode);
  id v6 = v4;
  sub_249F88C70(a1, &v10, v5);

  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
  sub_249FCAE08(a1);
  int v8 = *(void **)(v7 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
  if (v8) {
    objc_msgSend(v8, sel_setNeedsLayout);
  }
  id result = *(id *)(v7 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
  if (result)
  {
    return objc_msgSend(result, sel_setNeedsLayout);
  }
  return result;
}

id sub_24A02EEE8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v6 - 8);
  int v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A056238();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, __n128))v14)(a1, 1, v9, v11) == 1)
  {
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
    uint64_t v16 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView;
    id v17 = *(void **)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
    if (v17)
    {
      objc_msgSend(v17, sel_removeFromSuperview);
      uint64_t v18 = *(void **)(v15 + v16);
      *(void *)(v15 + v16) = 0;

      objc_msgSend(*(id *)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView), sel_setNeedsLayout);
    }
    uint64_t v19 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView;
    id result = *(id *)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
    if (result)
    {
      objc_msgSend(result, sel_removeFromSuperview);
      int v21 = *(void **)(v15 + v19);
      *(void *)(v15 + v19) = 0;

      uint64_t v22 = *(void **)(v15 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView);
      return objc_msgSend(v22, sel_setNeedsLayout);
    }
  }
  else
  {
    sub_249F6E6C8(a1, (uint64_t)v8, &qword_2697515A0);
    if (v14(v8, 1, v9) == 1)
    {
      return (id)sub_249F6E790((uint64_t)v8, &qword_2697515A0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
      if (a2 != 2)
      {
        type metadata accessor for AlarmComplicationCurvedTextView();
        uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        uint64_t v24 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);
        id v25 = objc_msgSend(v24, sel_layer);
        objc_msgSend(v25, sel_setGeometryFlipped_, 1);

        uint64_t v26 = *(void **)&v24[OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter];
        uint64_t v27 = (void *)sub_24A056198();
        objc_msgSend(v26, sel_setOverrideDate_, v27);

        uint64_t v28 = *(void *)(v3 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
        uint64_t v29 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView;
        uint64_t v30 = *(void **)(v28 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
        if (v30)
        {
          objc_msgSend(v30, sel_removeFromSuperview);
          uint64_t v31 = *(void **)(v28 + v29);
        }
        else
        {
          uint64_t v31 = 0;
        }
        *(void *)(v28 + v29) = v24;
        id v32 = v24;

        uint64_t v33 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
        objc_msgSend(*(id *)(v28 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView), sel_setNeedsLayout);

        uint64_t v34 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_init);
        id v35 = objc_msgSend(v34, sel_layer);
        objc_msgSend(v35, sel_setGeometryFlipped_, 1);

        uint64_t v36 = *(void **)&v34[OBJC_IVAR____TtC11ClockPoster31AlarmComplicationCurvedTextView_timeFormatter];
        uint64_t v37 = (void *)sub_24A056198();
        objc_msgSend(v36, sel_setOverrideDate_, v37);

        uint64_t v38 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView;
        uint64_t v39 = *(void **)(v28 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
        if (v39)
        {
          objc_msgSend(v39, sel_removeFromSuperview);
          id v40 = *(void **)(v28 + v38);
        }
        else
        {
          id v40 = 0;
        }
        *(void *)(v28 + v38) = v34;
        id v41 = v34;

        objc_msgSend(*(id *)(v28 + v33), sel_setNeedsLayout);
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  return result;
}

void sub_24A02F300()
{
  sub_249F75BD8(v0 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look);
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_clockFace);
}

id sub_24A02F340()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayClockFaceViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PlayClockFaceViewController()
{
  return self;
}

uint64_t sub_24A02F3E4(uint64_t a1)
{
  uint64_t result = sub_24A02F530(&qword_269751B90);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24A02F428@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  return sub_249F75B7C(v3, a1);
}

uint64_t sub_24A02F47C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC11ClockPoster27PlayClockFaceViewController_look;
  swift_beginAccess();
  sub_249F88840(a1, v3);
  swift_endAccess();
  sub_24A02D608();
  return sub_249F75BD8(a1);
}

uint64_t sub_24A02F4EC(uint64_t a1)
{
  uint64_t result = sub_24A02F530(&qword_269751B98);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24A02F530(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PlayClockFaceViewController();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A02F570()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_24A02F5C0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A02F5F8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A02F638(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_249F6C87C;
  return sub_24A02E2D0(a1, v4, v5, v6);
}

double sub_24A02F740@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056478();
  swift_release();
  double result = *(double *)(v3 + 32);
  *a2 = result;
  return result;
}

uint64_t sub_24A02F7E8()
{
  return swift_release();
}

uint64_t sub_24A02F8C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__solarPosition;
  swift_beginAccess();
  return sub_249F6E6C8(v4, a2, &qword_2697503D8);
}

uint64_t sub_24A02F994(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697503D8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_249F6E6C8(a1, (uint64_t)v6, &qword_2697503D8);
  uint64_t v7 = *a2;
  swift_getKeyPath();
  uint64_t v10 = v7;
  __n128 v11 = v6;
  uint64_t v12 = v7;
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056468();
  swift_release();
  return sub_249F6E790((uint64_t)v6, &qword_2697503D8);
}

uint64_t sub_24A02FAD4(uint64_t a1, char a2)
{
  return sub_24A03004C(a1, a2, 0xD000000000000015, 0x800000024A0652B0);
}

uint64_t sub_24A02FAF0(uint64_t a1, char a2)
{
  return sub_24A03004C(a1, a2, 0xD000000000000015, 0x800000024A065200);
}

uint64_t sub_24A02FB0C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_24A056A48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_24A0577C8();
    uint64_t v9 = sub_24A056C68();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      __n128 v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)__n128 v11 = 136315138;
      uint64_t v14 = sub_249F782DC(0x6C616E6F6974704FLL, 0xEE003E746E6F463CLL, &v15);
      sub_24A057978();
      _os_log_impl(&dword_249F61000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v12, -1, -1);
      MEMORY[0x24C5BA360](v11, -1, -1);
    }

    sub_24A056A38();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_24A02FD20(uint64_t a1, char a2)
{
  return sub_24A03004C(a1, a2, 0x656956646C726F57, 0xEE006C65646F4D77);
}

uint64_t sub_24A02FD44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24A056A48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FAD0);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249F6E6C8(v2, (uint64_t)v10, &qword_26974FAD0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24A0567D8();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_24A0577C8();
    uint64_t v14 = sub_24A056C68();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_249F782DC(0x694474756F79614CLL, 0xEF6E6F6974636572, &v20);
      sub_24A057978();
      _os_log_impl(&dword_249F61000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v18, -1, -1);
      MEMORY[0x24C5BA360](v16, -1, -1);
    }

    sub_24A056A38();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24A030004(uint64_t a1, char a2)
{
  return sub_24A03004C(a1, a2, 0x65695672616C6F53, 0xEE006C65646F4D77);
}

uint64_t sub_24A030028(uint64_t a1, char a2)
{
  return sub_24A03004C(a1, a2, 0x7765695679616C50, 0xED00006C65646F4DLL);
}

uint64_t sub_24A03004C(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_24A056A48();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v12 = sub_24A0577C8();
    os_log_type_t v13 = sub_24A056C68();
    os_log_type_t v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      unint64_t v21 = a4;
      os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = a3;
      uint64_t v18 = v16;
      uint64_t v23 = v16;
      *(_DWORD *)os_log_type_t v15 = 136315138;
      uint64_t v22 = sub_249F782DC(v17, v21, &v23);
      sub_24A057978();
      _os_log_impl(&dword_249F61000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v18, -1, -1);
      MEMORY[0x24C5BA360](v15, -1, -1);
    }

    sub_24A056A38();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return v23;
  }
  return a1;
}

uint64_t sub_24A030254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BD0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BD8);
  MEMORY[0x270FA5388](v27);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v26 - v10;
  MEMORY[0x270FA5388](v12);
  os_log_type_t v14 = (char *)&v26 - v13;
  long long v30 = *(_OWORD *)(a1 + 56);
  long long v28 = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057018();
  char v15 = v29;
  *(void *)uint64_t v6 = sub_24A056AE8();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE8);
  sub_24A0304EC(a1, (uint64_t)&v6[*(int *)(v16 + 44)]);
  long long v28 = *(_OWORD *)(a1 + 72);
  sub_24A057018();
  if (v29 == 1) {
    uint64_t v17 = sub_24A056F08();
  }
  else {
    uint64_t v17 = sub_24A056EF8();
  }
  uint64_t v18 = v17;
  char v19 = sub_24A056C88();
  sub_249F6E6C8((uint64_t)v6, (uint64_t)v11, &qword_269751BD0);
  uint64_t v20 = &v11[*(int *)(v27 + 36)];
  *(void *)uint64_t v20 = v18;
  v20[8] = v19;
  sub_249F6E790((uint64_t)v6, &qword_269751BD0);
  sub_249F6E664((uint64_t)v11, (uint64_t)v14, &qword_269751BD8);
  long long v28 = v30;
  sub_24A057018();
  char v21 = v29;
  char v22 = v29 ^ 1;
  sub_249F6E6C8((uint64_t)v14, (uint64_t)v8, &qword_269751BD8);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = v15;
  *(unsigned char *)(a2 + 9) = v15 ^ 1;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BF0);
  sub_249F6E6C8((uint64_t)v8, a2 + *(int *)(v23 + 48), &qword_269751BD8);
  uint64_t v24 = a2 + *(int *)(v23 + 64);
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = v22;
  *(unsigned char *)(v24 + 9) = v21;
  sub_249F6E790((uint64_t)v14, &qword_269751BD8);
  return sub_249F6E790((uint64_t)v8, &qword_269751BD8);
}

uint64_t sub_24A0304EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v75 = sub_24A056C08();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  id v73 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BF8);
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v68 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C00);
  MEMORY[0x270FA5388](v69);
  id v71 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C08);
  uint64_t v83 = *(void *)(v6 - 8);
  unint64_t v84 = (char *)v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v67 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v81 = (uint64_t)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v85 = (char *)&v67 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C18);
  MEMORY[0x270FA5388](v12 - 8);
  os_log_type_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C20);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C28);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  char v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v67 - v23;
  *(void *)uint64_t v17 = sub_24A056A68();
  *((void *)v17 + 1) = 0;
  v17[16] = 1;
  uint64_t v25 = (uint64_t)&v17[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269751C30) + 44)];
  uint64_t v76 = a1;
  sub_24A0318CC(a1, v25);
  char v26 = sub_24A056C88();
  sub_249F6E6C8((uint64_t)v17, (uint64_t)v21, &qword_269751C20);
  uint64_t v27 = &v21[*(int *)(v19 + 44)];
  *uint64_t v27 = v26;
  *((void *)v27 + 1) = 0x4040000000000000;
  *((void *)v27 + 2) = 0;
  *((void *)v27 + 3) = 0;
  *((void *)v27 + 4) = 0;
  v27[40] = 0;
  sub_249F6E790((uint64_t)v17, &qword_269751C20);
  int v80 = v24;
  sub_249F6E664((uint64_t)v21, (uint64_t)v24, &qword_269751C28);
  *(void *)&long long v87 = sub_24A0325DC();
  *((void *)&v87 + 1) = v28;
  sub_249F823CC();
  uint64_t v29 = sub_24A056D98();
  uint64_t v31 = v30;
  LOBYTE(v24) = v32 & 1;
  uint64_t v33 = sub_24A056D18();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  sub_249F6E5D0(v29, v31, (char)v24);
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_24A056CA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v14, 1, 1, v38);
  sub_24A056CB8();
  sub_249F6E790((uint64_t)v14, &qword_269751C18);
  uint64_t v39 = sub_24A056D48();
  uint64_t v78 = v40;
  uint64_t v79 = v41;
  char v43 = v42;
  uint64_t v44 = v76;
  swift_release();
  sub_249F6E5D0(v33, v35, v37);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  long long v87 = *(_OWORD *)(v44 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  uint64_t v45 = sub_24A057018();
  uint64_t v46 = 1;
  if ((v86 & 1) == 0)
  {
    MEMORY[0x270FA5388](v45);
    *(&v67 - 2) = (char *)v44;
    sub_24A056C78();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751C38);
    sub_249F6EE60(&qword_269751C40, &qword_269751C38);
    id v47 = v68;
    sub_24A056638();
    sub_24A0571A8();
    sub_24A0566D8();
    uint64_t v48 = v70;
    uint64_t v49 = (uint64_t)v71;
    uint64_t v50 = v72;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v71, v47, v72);
    uint64_t v51 = v69;
    uint64_t v52 = (_OWORD *)(v49 + *(int *)(v69 + 36));
    long long v53 = v88;
    *uint64_t v52 = v87;
    v52[1] = v53;
    v52[2] = v89;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v50);
    uint64_t v54 = v73;
    sub_24A056BF8();
    unint64_t v55 = sub_24A036308();
    uint64_t v56 = v67;
    MEMORY[0x24C5B8640](v54, v51, v55, 16.0);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v54, v75);
    sub_249F6E790(v49, &qword_269751C00);
    (*(void (**)(char *, char *, char *))(v83 + 32))(v85, v56, v84);
    uint64_t v46 = 0;
  }
  uint64_t v57 = (uint64_t)v85;
  (*(void (**)(char *, uint64_t, uint64_t, char *))(v83 + 56))(v85, v46, 1, v84);
  char v58 = v43 & 1;
  uint64_t v59 = (uint64_t)v80;
  sub_249F6E6C8((uint64_t)v80, (uint64_t)v21, &qword_269751C28);
  uint64_t v60 = v81;
  sub_249F6E6C8(v57, v81, &qword_269751C10);
  uint64_t v61 = v82;
  sub_249F6E6C8((uint64_t)v21, v82, &qword_269751C28);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C58);
  uint64_t v63 = v61 + *(int *)(v62 + 48);
  unint64_t v84 = v21;
  uint64_t v64 = KeyPath;
  uint64_t v65 = v78;
  *(void *)uint64_t v63 = v39;
  *(void *)(v63 + 8) = v65;
  *(unsigned char *)(v63 + 16) = v58;
  *(void *)(v63 + 24) = v79;
  *(void *)(v63 + 32) = v64;
  *(unsigned char *)(v63 + 40) = 2;
  sub_249F6E6C8(v60, v61 + *(int *)(v62 + 64), &qword_269751C10);
  sub_249F6E4F8(v39, v65, v58);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_249F6E790(v57, &qword_269751C10);
  sub_249F6E790(v59, &qword_269751C28);
  sub_249F6E790(v60, &qword_269751C10);
  sub_249F6E5D0(v39, v65, v58);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_249F6E790((uint64_t)v84, &qword_269751C28);
}

uint64_t sub_24A030D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v34[0] = a1;
  uint64_t v39 = a2;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
  MEMORY[0x270FA5388](v36);
  uint64_t v3 = (char *)v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v34 - v5;
  uint64_t v7 = type metadata accessor for ColorProviderGraph(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C68);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v38 = (char *)v34 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C70);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v37 = (uint64_t)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v35 = (uint64_t)v34 - v19;
  sub_24A03126C((unsigned char *)v34 - v19);
  type metadata accessor for SolarViewModel();
  v34[1] = sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  *(void *)uint64_t v9 = sub_24A056698();
  v9[8] = v20 & 1;
  LOBYTE(v40) = 1;
  sub_24A057008();
  uint64_t v21 = v42;
  unsigned char v9[16] = v41;
  *((void *)v9 + 3) = v21;
  uint64_t v22 = type metadata accessor for ColorProviderPoint(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v6, 1, 1, v22);
  sub_249F6E6C8((uint64_t)v6, (uint64_t)v3, &qword_269751C60);
  sub_24A057008();
  sub_249F6E790((uint64_t)v6, &qword_269751C60);
  uint64_t v23 = &v9[*(int *)(v7 + 28)];
  uint64_t v40 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751C78);
  sub_24A057008();
  uint64_t v24 = v42;
  *(void *)uint64_t v23 = v41;
  *((void *)v23 + 1) = v24;
  LOBYTE(v3) = *(unsigned char *)(v34[0] + 8);
  uint64_t v25 = swift_retain();
  sub_24A03004C(v25, (char)v3, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  sub_24A0363E8(&qword_269751C80, (void (*)(uint64_t))type metadata accessor for ColorProviderGraph);
  sub_24A056DF8();
  swift_release();
  sub_24A036534((uint64_t)v9, type metadata accessor for ColorProviderGraph);
  char v26 = v38;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v38, v13, v10);
  uint64_t v27 = v35;
  uint64_t v28 = v37;
  sub_249F6E6C8(v35, v37, &qword_269751C70);
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v29(v13, v26, v10);
  uint64_t v30 = v39;
  sub_249F6E6C8(v28, v39, &qword_269751C70);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C88);
  v29((char *)(v30 + *(int *)(v31 + 48)), v13, v10);
  char v32 = *(void (**)(char *, uint64_t))(v11 + 8);
  v32(v26, v10);
  sub_249F6E790(v27, &qword_269751C70);
  v32(v13, v10);
  return sub_249F6E790(v28, &qword_269751C70);
}

uint64_t sub_24A03126C@<X0>(unsigned char *a1@<X8>)
{
  char v58 = a1;
  uint64_t v2 = sub_24A056AB8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C90);
  uint64_t v61 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v4 = &v47[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v60 = &v47[-v6];
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v47[-v8];
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v47[-v11];
  long long v68 = *(_OWORD *)(v1 + 40);
  long long v64 = *(_OWORD *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750D18);
  sub_24A057038();
  long long v64 = xmmword_24A061C60;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v13 + 64) = v14;
  *(_OWORD *)(v13 + 80) = *(_OWORD *)(v1 + 64);
  *(void *)(v13 + 96) = *(void *)(v1 + 80);
  long long v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v13 + 32) = v15;
  sub_24A03643C(v1);
  sub_24A0364B0();
  uint64_t v16 = v12;
  uint64_t v17 = MEMORY[0x263F8D538];
  sub_24A0570D8();
  sub_24A056AA8();
  sub_24A056A98();
  long long v66 = v68;
  uint64_t result = sub_24A057018();
  if ((~(void)v64 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (*(double *)&v64 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(double *)&v64 < 9.22337204e18)
  {
    *(void *)&long long v66 = (uint64_t)*(double *)&v64;
    sub_24A056A78();
    sub_24A056A98();
    sub_24A056AD8();
    uint64_t v56 = sub_24A056D78();
    uint64_t v55 = v19;
    uint64_t v57 = v20;
    char v22 = v21 & 1;
    long long v66 = *(_OWORD *)(v1 + 16);
    uint64_t v67 = *(void *)(v1 + 32);
    long long v62 = *(_OWORD *)(v1 + 16);
    uint64_t v63 = *(void *)(v1 + 32);
    uint64_t v23 = v4;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CA0);
    sub_24A057118();
    long long v62 = xmmword_24A061C70;
    long long v53 = v9;
    sub_24A0570D8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697520A0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24A05A510;
    long long v64 = v66;
    uint64_t v65 = v67;
    MEMORY[0x24C5B8920](&v62, v24);
    uint64_t v26 = v62;
    uint64_t v27 = MEMORY[0x263F8D5B8];
    *(void *)(v25 + 56) = v17;
    *(void *)(v25 + 64) = v27;
    *(void *)(v25 + 32) = v26;
    *(void *)&long long v64 = sub_24A0573B8();
    *((void *)&v64 + 1) = v28;
    sub_249F823CC();
    uint64_t v50 = sub_24A056D98();
    uint64_t v49 = v29;
    uint64_t v51 = v30;
    int v48 = v31 & 1;
    char v32 = v58;
    uint64_t v33 = v60;
    uint64_t v34 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v61 + 16);
    uint64_t v54 = v16;
    uint64_t v35 = v16;
    uint64_t v36 = v59;
    v34(v60, v35, v59);
    LOBYTE(v64) = v22;
    uint64_t v37 = v23;
    uint64_t v52 = v23;
    v34(v23, v9, v36);
    v34(v32, v33, v36);
    uint64_t v38 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269751CA8);
    uint64_t v39 = &v32[v38[12]];
    uint64_t v41 = v56;
    uint64_t v40 = v57;
    uint64_t v42 = v55;
    *(void *)uint64_t v39 = v56;
    *((void *)v39 + 1) = v42;
    v39[16] = v22;
    *((void *)v39 + 3) = v40;
    v34(&v32[v38[16]], v37, v36);
    char v43 = &v32[v38[20]];
    uint64_t v44 = v50;
    uint64_t v45 = v49;
    *(void *)char v43 = v50;
    *((void *)v43 + 1) = v45;
    LOBYTE(v37) = v48;
    v43[16] = v48;
    *((void *)v43 + 3) = v51;
    sub_249F6E4F8(v41, v42, v22);
    swift_bridgeObjectRetain();
    sub_249F6E4F8(v44, v45, (char)v37);
    uint64_t v46 = *(void (**)(unsigned char *, uint64_t))(v61 + 8);
    swift_bridgeObjectRetain();
    v46(v53, v36);
    v46(v54, v36);
    sub_249F6E5D0(v44, v45, (char)v37);
    swift_bridgeObjectRelease();
    v46(v52, v36);
    sub_249F6E5D0(v41, v42, v64);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(unsigned char *, uint64_t))v46)(v60, v36);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24A0318CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CB0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (uint64_t)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (uint64_t)&v27 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CB8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v27 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v27 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v27 - v18;
  long long v33 = *(_OWORD *)(a1 + 56);
  long long v31 = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057018();
  uint64_t v27 = v4;
  if (v32 == 1)
  {
    sub_24A031CB4((uint64_t)sub_24A036598, (uint64_t)v19);
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v20(v19, 0, 1, v3);
  }
  else
  {
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v20(v19, 1, 1, v3);
  }
  sub_24A031CB4((uint64_t)sub_24A0367C8, v30);
  long long v31 = v33;
  sub_24A057018();
  if (v32)
  {
    uint64_t v21 = 1;
  }
  else
  {
    sub_24A031CB4((uint64_t)sub_24A036598, (uint64_t)v16);
    uint64_t v21 = 0;
  }
  v20(v16, v21, 1, v3);
  sub_249F6E6C8((uint64_t)v19, (uint64_t)v13, &qword_269751CB8);
  uint64_t v22 = v29;
  uint64_t v23 = v30;
  sub_249F6E6C8(v30, v29, &qword_269751CB0);
  sub_249F6E6C8((uint64_t)v16, (uint64_t)v10, &qword_269751CB8);
  uint64_t v24 = v28;
  sub_249F6E6C8((uint64_t)v13, v28, &qword_269751CB8);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CC0);
  sub_249F6E6C8(v22, v24 + *(int *)(v25 + 48), &qword_269751CB0);
  sub_249F6E6C8((uint64_t)v10, v24 + *(int *)(v25 + 64), &qword_269751CB8);
  sub_249F6E790((uint64_t)v16, &qword_269751CB8);
  sub_249F6E790(v23, &qword_269751CB0);
  sub_249F6E790((uint64_t)v19, &qword_269751CB8);
  sub_249F6E790((uint64_t)v10, &qword_269751CB8);
  sub_249F6E790(v22, &qword_269751CB0);
  return sub_249F6E790((uint64_t)v13, &qword_269751CB8);
}

uint64_t sub_24A031CB4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v37 = a2;
  uint64_t v3 = sub_24A056C58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  uint64_t v36 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CC8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CD0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751CD8);
  uint64_t v33 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  long long v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(v2 + 64);
  *(void *)(v16 + 96) = *(void *)(v2 + 80);
  long long v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  uint64_t v38 = v2;
  sub_24A03643C(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751CE0);
  sub_24A0365A8();
  sub_24A057058();
  uint64_t v19 = sub_24A056F58();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v39 = v19;
  swift_retain();
  uint64_t v21 = sub_24A0566E8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  swift_release();
  uint64_t v22 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  uint64_t *v22 = KeyPath;
  v22[1] = v21;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24A056C48();
  sub_24A0366A0();
  sub_24A0363E8(&qword_269751D10, MEMORY[0x263F1A3B8]);
  uint64_t v23 = v35;
  sub_24A056DE8();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v23);
  sub_249F6E790((uint64_t)v13, &qword_269751CD0);
  sub_24A0571A8();
  sub_24A056828();
  uint64_t v24 = v33;
  uint64_t v25 = v37;
  uint64_t v26 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v33 + 16))(v37, v15, v34);
  uint64_t v27 = (_OWORD *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269751CB0) + 36));
  long long v28 = v44;
  v27[4] = v43;
  v27[5] = v28;
  v27[6] = v45;
  long long v29 = v40;
  *uint64_t v27 = v39;
  v27[1] = v29;
  long long v30 = v42;
  v27[2] = v41;
  v27[3] = v30;
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v26);
}

uint64_t sub_24A03213C()
{
  return sub_24A057028();
}

uint64_t sub_24A0321B8@<X0>(uint64_t *a1@<X8>)
{
  sub_24A057A78();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057018();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  uint64_t v2 = sub_24A056F98();
  sub_24A056ED8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_24A0566E8();
  *a1 = v2;
  a1[1] = KeyPath;
  a1[2] = result;
  return result;
}

uint64_t sub_24A0322E8()
{
  return sub_24A057028();
}

uint64_t sub_24A032364@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v6 = *(_OWORD *)(a1 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057018();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  uint64_t v3 = sub_24A056F98();
  sub_24A057018();
  if (v6 == 1) {
    sub_24A056ED8();
  }
  else {
    sub_24A056EE8();
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_24A0566E8();
  *a2 = v3;
  a2[1] = KeyPath;
  a2[2] = result;
  return result;
}

uint64_t sub_24A032498(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2 + 8);
  uint64_t v3 = swift_retain();
  sub_24A03004C(v3, v2, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750D18);
  sub_24A057018();
  swift_getKeyPath();
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056468();
  swift_release();
  return swift_release();
}

uint64_t sub_24A0325DC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697503D8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CurrentLocationSolarPosition(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26974F328 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24A006EA0();
  uint64_t v16 = v8;
  uint64_t v17 = v9;
  char v10 = *(unsigned char *)(v0 + 8);
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_24A03004C(v11, v10, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  swift_getKeyPath();
  v15[3] = v12;
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v13 = v12 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__solarPosition;
  swift_beginAccess();
  sub_249F6E6C8(v13, (uint64_t)v3, &qword_2697503D8);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_249F6E790((uint64_t)v3, &qword_2697503D8);
  }
  else
  {
    sub_24A039544((uint64_t)v3, (uint64_t)v7, type metadata accessor for CurrentLocationSolarPosition);
    v15[1] = 10;
    _OWORD v15[2] = 0xE100000000000000;
    sub_249FA5350();
    sub_24A057438();
    swift_bridgeObjectRelease();
    sub_24A057438();
    swift_bridgeObjectRelease();
    sub_24A036534((uint64_t)v7, type metadata accessor for CurrentLocationSolarPosition);
    return v16;
  }
  return v8;
}

uint64_t sub_24A0328D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BB8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(v1 + 48);
  v11[2] = *(_OWORD *)(v1 + 32);
  v11[3] = v6;
  void v11[4] = *(_OWORD *)(v1 + 64);
  uint64_t v12 = *(void *)(v1 + 80);
  long long v7 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v7;
  *(void *)uint64_t v5 = sub_24A056A68();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751BC0);
  sub_24A030254((uint64_t)v11, (uint64_t)&v5[*(int *)(v8 + 44)]);
  uint64_t v9 = sub_24A056F28();
  sub_249F6E6C8((uint64_t)v5, a1, &qword_269751BB8);
  *(void *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269751BC8) + 36)) = v9;
  return sub_249F6E790((uint64_t)v5, &qword_269751BB8);
}

id sub_24A032A64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SolarClockFaceDebugHUDUIKitBridgeView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SolarClockFaceDebugHUDUIKitBridgeView()
{
  return self;
}

uint64_t destroy for SolarClockFaceDebugHUD()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SolarClockFaceDebugHUD(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SolarClockFaceDebugHUD(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SolarClockFaceDebugHUD(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarClockFaceDebugHUD()
{
  return &type metadata for SolarClockFaceDebugHUD;
}

uint64_t sub_24A032E28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A032E44@<X0>(char *a1@<X8>)
{
  char v140 = a1;
  uint64_t v2 = type metadata accessor for ColorProviderGraph(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v159 = v2 - 8;
  uint64_t v136 = v3;
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v137 = v4;
  uint64_t v138 = (uint64_t)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D68);
  uint64_t v128 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  uint64_t v127 = (char *)&v118 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D70);
  uint64_t v131 = *(void *)(v133 - 8);
  MEMORY[0x270FA5388](v133);
  uint64_t v129 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D78);
  uint64_t v134 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  uint64_t v132 = (char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D80);
  uint64_t v153 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  uint64_t v164 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int v152 = (char *)&v118 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D88);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v126 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D90);
  uint64_t v125 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  unsigned int v124 = (char *)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D98);
  uint64_t v143 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  uint64_t v142 = (uint64_t)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751DA0);
  uint64_t v162 = *(void *)(v15 - 8);
  uint64_t v163 = v15;
  MEMORY[0x270FA5388](v15);
  unint64_t v165 = (char *)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  int v161 = (char *)&v118 - v18;
  uint64_t v19 = type metadata accessor for ColorProviderPoint(0);
  uint64_t v157 = *(void *)(v19 - 8);
  uint64_t v158 = v19;
  MEMORY[0x270FA5388](v19);
  OpaqueTypeConformance2 = (uint64_t *)((char *)&v118 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v156 = (char *)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_24A056AB8();
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751DA8);
  uint64_t v150 = *(void *)(v151 - 8);
  MEMORY[0x270FA5388](v151);
  uint64_t v149 = (char *)&v118 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v118 - v26;
  sub_24A056AC8();
  uint64_t v155 = (void (*)(char *, char *, uint64_t))v1;
  uint64_t v29 = *(void *)(v1 + 24);
  LOBYTE(v170) = *(unsigned char *)(v1 + 16);
  char v28 = v170;
  uint64_t v171 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057038();
  uint64_t v148 = v27;
  uint64_t v30 = (uint64_t)v156;
  sub_24A0570E8();
  sub_24A056AA8();
  sub_24A056A98();
  LOBYTE(v166) = v28;
  uint64_t v167 = v29;
  sub_24A057018();
  sub_24A056A88();
  swift_bridgeObjectRelease();
  sub_24A056A98();
  sub_24A056AD8();
  uint64_t v146 = sub_24A056D78();
  uint64_t v160 = v31;
  char v33 = v32;
  uint64_t v147 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  sub_24A057018();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v157 + 48))(v30, 1, v158))
  {
    uint64_t v35 = sub_249F6E790(v30, &qword_269751C60);
    uint64_t v158 = 0;
    uint64_t v159 = 0;
    uint64_t v156 = 0;
    uint64_t v157 = 0;
  }
  else
  {
    uint64_t v36 = (void (*)(void, void, void))OpaqueTypeConformance2;
    sub_24A0396B4(v30, (uint64_t)OpaqueTypeConformance2, type metadata accessor for ColorProviderPoint);
    sub_249F6E790(v30, &qword_269751C60);
    uint64_t v37 = sub_24A03430C();
    uint64_t v39 = v38;
    sub_24A036534((uint64_t)v36, type metadata accessor for ColorProviderPoint);
    v166 = (void *)v37;
    uint64_t v167 = v39;
    sub_249F823CC();
    uint64_t v40 = sub_24A056D98();
    uint64_t v42 = v41;
    char v44 = v43 & 1;
    uint64_t v45 = sub_24A056D18();
    uint64_t v47 = v46;
    char v49 = v48 & 1;
    sub_249F6E5D0(v40, v42, v44);
    swift_bridgeObjectRelease();
    sub_24A056CD8();
    uint64_t v50 = sub_24A056D48();
    uint64_t v158 = v51;
    uint64_t v159 = v50;
    LOBYTE(v42) = v52;
    uint64_t v157 = v53;
    swift_release();
    uint64_t v156 = (char *)(v42 & 1);
    sub_249F6E5D0(v45, v47, v49);
    uint64_t v35 = swift_bridgeObjectRelease();
  }
  int v145 = v33 & 1;
  MEMORY[0x270FA5388](v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751DB0);
  sub_24A03908C();
  uint64_t v54 = v124;
  sub_24A0565D8();
  v166 = &unk_26FDE62A8;
  uint64_t v55 = sub_24A056608();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
  OpaqueTypeConformance2 = (void *)(v56 + 56);
  uint64_t v58 = (uint64_t)v126;
  uint64_t v120 = v55;
  v57(v126, 1, 1, v55);
  uint64_t v59 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v57;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751DD8);
  uint64_t v123 = MEMORY[0x263EFCD00];
  uint64_t v61 = sub_249F6EE60(&qword_269751DE0, &qword_269751D90);
  uint64_t v62 = sub_24A0391EC(&qword_269751DE8, &qword_269751DD8);
  uint64_t v63 = v142;
  long long v64 = (void *)v141;
  uint64_t v121 = v62;
  sub_24A056DB8();
  sub_249F6E790(v58, &qword_269751D88);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v125 + 8))(v54, v64);
  uint64_t v170 = sub_24A034CE4();
  v59(v58, 1, 1, v55);
  uint64_t v65 = v59;
  os_log_t v119 = v59;
  unsigned int v124 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269751DF0);
  v166 = v64;
  uint64_t v167 = v60;
  uint64_t v66 = v60;
  uint64_t v168 = (void (*)(void, void, void))v61;
  uint64_t v169 = v62;
  uint64_t v125 = MEMORY[0x263EFCDE8];
  swift_getOpaqueTypeConformance2();
  uint64_t v122 = sub_24A0391EC(&qword_269751DF8, &qword_269751DF0);
  uint64_t v67 = v165;
  uint64_t v68 = v144;
  sub_24A056DA8();
  sub_249F6E790(v58, &qword_269751D88);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v63, v68);
  (*(void (**)(char *, char *, uint64_t))(v162 + 32))(v161, v67, v163);
  sub_24A056AC8();
  uint64_t v143 = sub_24A056D78();
  uint64_t v142 = v69;
  uint64_t v144 = v70;
  LODWORD(v141) = v71 & 1;
  MEMORY[0x270FA5388](v143);
  uint64_t v72 = (uint64_t)v155;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E00);
  sub_24A039258();
  id v73 = v127;
  sub_24A0565D8();
  v166 = &unk_26FDE62D8;
  uint64_t v74 = v120;
  v65(v58, 1, 1, v120);
  uint64_t v75 = sub_249F6EE60(&qword_269751E10, &qword_269751D68);
  uint64_t v76 = v129;
  unint64_t v77 = (void *)v130;
  uint64_t v78 = v121;
  sub_24A056DB8();
  sub_249F6E790(v58, &qword_269751D88);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v128 + 8))(v73, v77);
  uint64_t v170 = sub_24A034CE4();
  v119(v58, 1, 1, v74);
  v166 = v77;
  uint64_t v167 = v66;
  uint64_t v168 = (void (*)(void, void, void))v75;
  uint64_t v169 = v78;
  OpaqueTypeConformance2 = (void *)swift_getOpaqueTypeConformance2();
  uint64_t v79 = v132;
  int v80 = (void *)v133;
  uint64_t v81 = v124;
  uint64_t v82 = v122;
  sub_24A056DA8();
  sub_249F6E790(v58, &qword_269751D88);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void *))(v131 + 8))(v76, v80);
  LOBYTE(v74) = *(unsigned char *)(v72 + 8);
  uint64_t v83 = swift_retain();
  uint64_t v84 = sub_24A03004C(v83, v74, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  swift_getKeyPath();
  v166 = (void *)v84;
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v85 = *(void *)(v84 + 24);
  swift_release();
  uint64_t v170 = v85;
  uint64_t v86 = v138;
  sub_24A0396B4(v72, v138, type metadata accessor for ColorProviderGraph);
  unint64_t v87 = (*(unsigned __int8 *)(v136 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80);
  uint64_t v88 = swift_allocObject();
  sub_24A039544(v86, v88 + v87, type metadata accessor for ColorProviderGraph);
  v166 = v80;
  uint64_t v167 = (uint64_t)v81;
  uint64_t v168 = (void (*)(void, void, void))OpaqueTypeConformance2;
  uint64_t v169 = v82;
  swift_getOpaqueTypeConformance2();
  long long v89 = v164;
  uint64_t v90 = v135;
  sub_24A056E58();
  swift_release();
  (*(void (**)(char *, uint64_t))(v134 + 8))(v79, v90);
  uint64_t v91 = v153;
  uint64_t v92 = v152;
  uint64_t v93 = v139;
  (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v152, v89, v139);
  uint64_t v94 = *(void (**)(char *, char *, uint64_t))(v150 + 16);
  uint64_t v95 = v149;
  uint64_t v96 = v151;
  v94(v149, v148, v151);
  LOBYTE(v166) = v145;
  OpaqueTypeConformance2 = *(void **)(v162 + 16);
  uint64_t v97 = v163;
  ((void (*)(char *, char *, uint64_t))OpaqueTypeConformance2)(v165, v161, v163);
  LOBYTE(v170) = v141;
  uint64_t v155 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
  uint64_t v98 = v92;
  uint64_t v99 = v93;
  v155(v89, v98, v93);
  uint64_t v100 = v140;
  v94(v140, v95, v96);
  uint64_t v101 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269751E18);
  uint64_t v102 = &v100[v101[12]];
  uint64_t v103 = v146;
  *(void *)uint64_t v102 = v146;
  uint64_t v104 = v103;
  *((void *)v102 + 1) = v160;
  LOBYTE(v94) = v145;
  v102[16] = v145;
  *((void *)v102 + 3) = v147;
  uint64_t v105 = &v100[v101[16]];
  uint64_t v106 = v158;
  *(void *)uint64_t v105 = v159;
  *((void *)v105 + 1) = v106;
  uint64_t v107 = v157;
  *((void *)v105 + 2) = v156;
  *((void *)v105 + 3) = v107;
  ((void (*)(char *, char *, uint64_t))OpaqueTypeConformance2)(&v100[v101[20]], v165, v97);
  uint64_t v108 = &v100[v101[24]];
  uint64_t v109 = v143;
  uint64_t v110 = v142;
  *(void *)uint64_t v108 = v143;
  *((void *)v108 + 1) = v110;
  LOBYTE(v93) = v141;
  v108[16] = v141;
  *((void *)v108 + 3) = v144;
  v155(&v100[v101[28]], v164, v99);
  uint64_t v111 = v160;
  sub_249F6E4F8(v104, v160, (char)v94);
  swift_bridgeObjectRetain();
  sub_24A03962C(v159, v158, (char)v156, v157);
  sub_249F6E4F8(v109, v110, v93);
  swift_bridgeObjectRetain();
  LOBYTE(v82) = (_BYTE)v94;
  sub_249F6E4F8(v104, v111, (char)v94);
  uint64_t v112 = *(void (**)(char *, uint64_t))(v153 + 8);
  swift_bridgeObjectRetain();
  v112(v152, v99);
  unint64_t v113 = *(void (**)(char *, uint64_t))(v162 + 8);
  uint64_t v114 = v163;
  v113(v161, v163);
  sub_249F6E5D0(v104, v111, v82);
  swift_bridgeObjectRelease();
  unint64_t v115 = *(void (**)(char *, uint64_t))(v150 + 8);
  uint64_t v116 = v151;
  v115(v148, v151);
  v112(v164, v99);
  sub_249F6E5D0(v143, v142, v170);
  swift_bridgeObjectRelease();
  v113(v165, v114);
  sub_24A039670(v159, v158, (char)v156, v157);
  sub_249F6E5D0(v146, v160, (char)v166);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v115)(v149, v116);
}

uint64_t sub_24A03430C()
{
  return 0x202D2065756C6156;
}

uint64_t sub_24A03450C()
{
  return sub_24A057128();
}

uint64_t sub_24A034648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v3 = type metadata accessor for ColorProviderPoint(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E68);
  uint64_t v7 = *(void *)(type metadata accessor for ColorProviderPoint.Sample(0) - 8);
  uint64_t v8 = *(void *)(v7 + 72);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24A05C840;
  uint64_t v11 = v10 + v9;
  sub_24A0396B4(a1, v11, type metadata accessor for ColorProviderPoint.Sample);
  sub_24A0396B4(a1 + *(int *)(v4 + 28), v11 + v8, type metadata accessor for ColorProviderPoint.Sample);
  sub_24A0396B4(a1 + *(int *)(v4 + 32), v11 + 2 * v8, type metadata accessor for ColorProviderPoint.Sample);
  uint64_t v22 = v10;
  sub_24A0396B4(a1, (uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ColorProviderPoint);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_24A039544((uint64_t)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, type metadata accessor for ColorProviderPoint);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E70);
  sub_24A056268();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E78);
  sub_249F6EE60(&qword_269751E80, &qword_269751E70);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751DD0);
  uint64_t v18 = sub_24A0565F8();
  uint64_t v19 = MEMORY[0x263F1B440];
  uint64_t v20 = MEMORY[0x263EFCD88];
  uint64_t v21 = MEMORY[0x263F1B420];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = v14;
  uint64_t v19 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_24A0363E8(&qword_269751E88, (void (*)(uint64_t))type metadata accessor for ColorProviderPoint.Sample);
  return sub_24A057128();
}

uint64_t sub_24A034998@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v24 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751E58);
  MEMORY[0x270FA5388](v4 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_24A0565F8();
  uint64_t v21 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751DD0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  uint64_t v23 = v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A056AC8();
  LODWORD(v25) = *(_DWORD *)(a2 + *(int *)(type metadata accessor for ColorProviderPoint(0) + 28));
  sub_24A0565C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A056AC8();
  uint64_t v13 = v20;
  LODWORD(v25) = *v20;
  sub_24A0565C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A0565E8();
  uint64_t v25 = *((void *)v13 + 1);
  uint64_t v14 = MEMORY[0x263F1B440];
  uint64_t v15 = MEMORY[0x263EFCD88];
  uint64_t v16 = MEMORY[0x263F1B420];
  sub_24A0565B8();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  uint64_t v25 = v6;
  uint64_t v26 = v14;
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  swift_getOpaqueTypeConformance2();
  uint64_t v17 = v22;
  sub_24A0565A8();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v12, v17);
}

uint64_t sub_24A034CE4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for ColorProviderPoint(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ColorProviderGraph(0) + 28));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v27 = *v11;
  uint64_t v28 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E28);
  sub_24A057018();
  unint64_t v14 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  float v15 = 0.0;
  if (v14 >= 3)
  {
    uint64_t v27 = v12;
    uint64_t v28 = v13;
    uint64_t result = sub_24A057018();
    if (*(void *)(v29 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      unint64_t v17 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
      sub_24A0396B4(v29 + *(void *)(v5 + 72) + v17, (uint64_t)v10, type metadata accessor for ColorProviderPoint);
      swift_bridgeObjectRelease();
      float v18 = *(float *)&v10[*(int *)(v4 + 28)];
      sub_24A036534((uint64_t)v10, type metadata accessor for ColorProviderPoint);
      uint64_t v27 = v12;
      uint64_t v28 = v13;
      uint64_t result = sub_24A057018();
      if (*(void *)(v29 + 16))
      {
        sub_24A0396B4(v29 + v17, (uint64_t)v7, type metadata accessor for ColorProviderPoint);
        swift_bridgeObjectRelease();
        float v19 = *(float *)&v7[*(int *)(v4 + 28)];
        sub_24A036534((uint64_t)v7, type metadata accessor for ColorProviderPoint);
        float v15 = (float)(v18 - v19) * 110.0;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_5:
  uint64_t v27 = v12;
  uint64_t v28 = v13;
  sub_24A057018();
  unint64_t v20 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v20 < 0x6F)
  {
    uint64_t v27 = v12;
    uint64_t v28 = v13;
    sub_24A057018();
    if (*(void *)(v29 + 16))
    {
      sub_24A0396B4(v29 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), (uint64_t)v3, type metadata accessor for ColorProviderPoint);
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, v25, 1, v4);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_249F6E790((uint64_t)v3, &qword_269751C60);
      float v23 = 0.0;
LABEL_16:
      __swift_instantiateConcreteTypeFromMangledName(&qword_269751E60);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_24A0593D0;
      *(float *)(result + 32) = v23;
      *(float *)(result + 36) = v15 + v23;
      return result;
    }
    float v23 = *(float *)&v3[*(int *)(v4 + 28)];
    uint64_t v24 = (uint64_t)v3;
LABEL_15:
    sub_24A036534(v24, type metadata accessor for ColorProviderPoint);
    goto LABEL_16;
  }
  uint64_t v27 = v12;
  uint64_t v28 = v13;
  sub_24A057018();
  unint64_t v21 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  uint64_t v27 = v12;
  uint64_t v28 = v13;
  uint64_t result = sub_24A057018();
  unint64_t v22 = v21 - 110;
  if (v21 < 0x6E) {
    goto LABEL_19;
  }
  if (v22 < *(void *)(v29 + 16))
  {
    sub_24A0396B4(v29+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v22, (uint64_t)v10, type metadata accessor for ColorProviderPoint);
    swift_bridgeObjectRelease();
    float v23 = *(float *)&v10[*(int *)(v4 + 28)];
    uint64_t v24 = (uint64_t)v10;
    goto LABEL_15;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_24A035148()
{
  return sub_24A057128();
}

uint64_t sub_24A0352C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v12 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751E58);
  MEMORY[0x270FA5388](v3 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v11 = sub_24A0565F8();
  uint64_t v5 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A056AC8();
  LODWORD(v13) = *(_DWORD *)(a1 + *(int *)(type metadata accessor for ColorProviderPoint(0) + 28));
  sub_24A0565C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A056AC8();
  LODWORD(v13) = *(_DWORD *)(a1 + 16);
  sub_24A0565C8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A0565E8();
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v8 = v11;
  sub_24A0565B8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v8);
}

uint64_t sub_24A035524(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v11 = type metadata accessor for ColorProviderPoint(0);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v17 = (char *)&v35 - v16;
  double v18 = *a2;
  sub_24A035928((uint64_t)&v44);
  if (!*((void *)&v45 + 1)) {
    return sub_249F6E790((uint64_t)&v44, &qword_269751E20);
  }
  uint64_t v40 = v7;
  v52[4] = v48;
  v52[5] = v49;
  v52[6] = v50;
  uint64_t v53 = v51;
  v52[0] = v44;
  v52[1] = v45;
  v52[2] = v46;
  v52[3] = v47;
  sub_249F7B6E0((uint64_t)v52, (uint64_t)&v44);
  float v19 = v18;
  sub_24A035BA4(&v44, (uint64_t)v17, v19);
  uint64_t v36 = type metadata accessor for ColorProviderGraph(0);
  uint64_t v20 = *(int *)(v36 + 28);
  uint64_t v41 = a3;
  unint64_t v21 = (uint64_t *)(a3 + v20);
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  *(void *)&long long v44 = *v21;
  *((void *)&v44 + 1) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E28);
  sub_24A057018();
  unint64_t v24 = v43;
  sub_24A0396B4((uint64_t)v17, (uint64_t)v14, type metadata accessor for ColorProviderPoint);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v39 = v10;
  uint64_t v37 = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v24 = sub_249FBA990(0, *(void *)(v24 + 16) + 1, 1, v24);
  }
  unint64_t v27 = *(void *)(v24 + 16);
  unint64_t v26 = *(void *)(v24 + 24);
  uint64_t v38 = v17;
  if (v27 >= v26 >> 1) {
    unint64_t v24 = sub_249FBA990(v26 > 1, v27 + 1, 1, v24);
  }
  *(void *)(v24 + 16) = v27 + 1;
  unint64_t v28 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v29 = *(void *)(v12 + 72);
  sub_24A039544((uint64_t)v14, v24 + v28 + v29 * v27, type metadata accessor for ColorProviderPoint);
  unint64_t v43 = v24;
  if (*(void *)(v24 + 16) >= 0x65uLL)
  {
    sub_24A04006C(0, 1);
    unint64_t v24 = v43;
  }
  *(void *)&long long v44 = v22;
  *((void *)&v44 + 1) = v23;
  unint64_t v42 = v24;
  sub_24A057028();
  *(void *)&long long v44 = v22;
  *((void *)&v44 + 1) = v23;
  sub_24A057018();
  uint64_t v30 = *(void *)(v42 + 16);
  uint64_t v31 = (uint64_t)v39;
  if (v30)
  {
    sub_24A0396B4(v42 + v28 + (v30 - 1) * v29, (uint64_t)v39, type metadata accessor for ColorProviderPoint);
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v32 = 1;
  }
  uint64_t v34 = (uint64_t)v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v31, v32, 1, v37);
  swift_bridgeObjectRelease();
  sub_249F6E6C8(v31, v34, &qword_269751C60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  sub_24A057028();
  sub_249F6E790(v31, &qword_269751C60);
  sub_24A036534((uint64_t)v38, type metadata accessor for ColorProviderPoint);
  return sub_24A03971C((uint64_t)v52);
}

uint64_t sub_24A035928@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 24);
  LOBYTE(v11[0]) = *(unsigned char *)(v1 + 16);
  v11[1] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751BE0);
  sub_24A057018();
  char v4 = *(unsigned char *)(v1 + 8);
  uint64_t v5 = swift_retain();
  uint64_t v6 = sub_24A03004C(v5, v4, 0x65695672616C6F53, 0xEE006C65646F4D77);
  swift_release();
  if (LOBYTE(v14[0]) == 1)
  {
    swift_getKeyPath();
    v11[0] = v6;
    sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
    sub_24A056478();
    swift_release();
    uint64_t v7 = v6 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__colorPalette;
    swift_beginAccess();
    sub_249F6E6C8(v7, (uint64_t)v11, &qword_269750A78);
    uint64_t result = swift_release();
    if (v12)
    {
      uint64_t v9 = &v13;
      goto LABEL_6;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  swift_getKeyPath();
  v11[0] = v6;
  sub_24A0363E8(&qword_26974FAB8, (void (*)(uint64_t))type metadata accessor for SolarViewModel);
  sub_24A056478();
  swift_release();
  uint64_t v10 = v6 + OBJC_IVAR____TtC11ClockPoster14SolarViewModel__colorPalette;
  swift_beginAccess();
  sub_249F6E6C8(v10, (uint64_t)v11, &qword_269750A78);
  uint64_t result = swift_release();
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v9 = v11;
LABEL_6:
  sub_249F7B37C((uint64_t)v9, (uint64_t)v14);
  sub_249FD598C((uint64_t)v11);
  sub_249F7B5E8(v14, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E40);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *(void *)(a1 + 112) = 0;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

uint64_t sub_24A035BA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  uint64_t v36 = type metadata accessor for ColorProviderPoint.Sample(0);
  MEMORY[0x270FA5388](v36);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v34 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v34 - v12;
  unint64_t v14 = (int *)type metadata accessor for ColorProviderPoint(0);
  sub_24A056258();
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v15);
  float v17 = (*(float (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  uint64_t v19 = a1[8];
  uint64_t v18 = a1[9];
  __swift_project_boxed_opaque_existential_1(a1 + 5, v19);
  float v20 = (*(float (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
  uint64_t v21 = a1[13];
  uint64_t v22 = a1[14];
  uint64_t v35 = a1 + 10;
  __swift_project_boxed_opaque_existential_1(a1 + 10, v21);
  float v23 = (*(float (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
  *(float *)(a2 + v14[7]) = a3;
  uint64_t v24 = sub_24A056EC8();
  sub_249F7B37C((uint64_t)a1, (uint64_t)v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751E30);
  if (swift_dynamicCast())
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    int v26 = v25;
    sub_24A039770((uint64_t)&v38);
  }
  else
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    sub_249F6E790((uint64_t)&v38, &qword_269751E38);
    int v26 = 0;
  }
  *(float *)uint64_t v13 = v17;
  *((void *)v13 + 1) = v24;
  *((_DWORD *)v13 + 4) = v26;
  sub_24A056258();
  sub_24A039544((uint64_t)v13, a2, type metadata accessor for ColorProviderPoint.Sample);
  uint64_t v27 = sub_24A056EC8();
  sub_249F7B37C((uint64_t)(a1 + 5), (uint64_t)v37);
  if (swift_dynamicCast())
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    int v29 = v28;
    sub_24A039770((uint64_t)&v38);
  }
  else
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    sub_249F6E790((uint64_t)&v38, &qword_269751E38);
    int v29 = 0;
  }
  *(float *)uint64_t v10 = v20;
  *((void *)v10 + 1) = v27;
  *((_DWORD *)v10 + 4) = v29;
  sub_24A056258();
  sub_24A039544((uint64_t)v10, a2 + v14[5], type metadata accessor for ColorProviderPoint.Sample);
  uint64_t v30 = sub_24A056EC8();
  sub_249F7B37C((uint64_t)v35, (uint64_t)v37);
  if (swift_dynamicCast())
  {
    __swift_project_boxed_opaque_existential_1(&v38, *((uint64_t *)&v39 + 1));
    noise2();
    int v32 = v31;
    sub_24A039770((uint64_t)&v38);
  }
  else
  {
    uint64_t v40 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    sub_249F6E790((uint64_t)&v38, &qword_269751E38);
    int v32 = 0;
  }
  *(float *)uint64_t v7 = v23;
  *((void *)v7 + 1) = v30;
  *((_DWORD *)v7 + 4) = v32;
  sub_24A056258();
  sub_24A03971C((uint64_t)a1);
  return sub_24A039544((uint64_t)v7, a2 + v14[6], type metadata accessor for ColorProviderPoint.Sample);
}

uint64_t sub_24A035FD4()
{
  float v1 = roundf(*v0 * 100.0);
  if ((~LODWORD(v1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v1 <= -9.2234e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v1 >= 9.2234e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (((uint64_t)v1 & 0x8000000000000000) == 0)
  {
    uint64_t v2 = 32;
LABEL_8:
    uint64_t v4 = v2;
    sub_24A057438();
    swift_bridgeObjectRelease();
    sub_24A057438();
    swift_bridgeObjectRelease();
    sub_24A057CF8();
    sub_24A057438();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (!__OFSUB__(0, (uint64_t)v1))
  {
    uint64_t v2 = 45;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_24A036100()
{
  int v1 = *(_DWORD *)(v0 + 16);
  sub_24A057438();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697520A0);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8D5C8];
  *(_OWORD *)(v2 + 16) = xmmword_24A05A510;
  uint64_t v4 = MEMORY[0x263F8D648];
  *(void *)(v2 + 56) = v3;
  *(void *)(v2 + 64) = v4;
  *(_DWORD *)(v2 + 32) = v1;
  sub_24A0573B8();
  sub_24A057438();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24A0361C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_24A056268();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_24A036238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 32);
  uint64_t v5 = sub_24A056268();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_24A0362AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24A0569B8();
  *a1 = result;
  return result;
}

uint64_t sub_24A0362D8()
{
  return sub_24A0569C8();
}

uint64_t sub_24A036300@<X0>(uint64_t a1@<X8>)
{
  return sub_24A030D6C(*(void *)(v1 + 16), a1);
}

unint64_t sub_24A036308()
{
  unint64_t result = qword_269751C48;
  if (!qword_269751C48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751C00);
    sub_249F6EE60(&qword_269751C50, &qword_269751BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751C48);
  }
  return result;
}

uint64_t type metadata accessor for ColorProviderGraph(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269751D40);
}

uint64_t type metadata accessor for ColorProviderPoint(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269751D18);
}

uint64_t sub_24A0363E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A036434(uint64_t a1)
{
  return sub_24A032498(a1, v1 + 16);
}

uint64_t sub_24A03643C(uint64_t a1)
{
  return a1;
}

unint64_t sub_24A0364B0()
{
  unint64_t result = qword_269751C98;
  if (!qword_269751C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751C98);
  }
  return result;
}

uint64_t sub_24A03650C()
{
  return sub_249FD243C(*(void *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_24A036534(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A036598()
{
  return sub_24A03213C();
}

uint64_t sub_24A0365A0@<X0>(uint64_t *a1@<X8>)
{
  return sub_24A0321B8(a1);
}

unint64_t sub_24A0365A8()
{
  unint64_t result = qword_269751CE8;
  if (!qword_269751CE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751CE0);
    sub_249F6EE60(&qword_269751CF0, &qword_269751CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751CE8);
  }
  return result;
}

uint64_t sub_24A036648@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A0569F8();
  *a1 = result;
  return result;
}

uint64_t sub_24A036674()
{
  return sub_24A056A08();
}

unint64_t sub_24A0366A0()
{
  unint64_t result = qword_269751D00;
  if (!qword_269751D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751CD0);
    sub_249F6EE60(&qword_269751D08, &qword_269751CC8);
    sub_249F6EE60(&qword_269751CF0, &qword_269751CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751D00);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_24A0367C8()
{
  return sub_24A0322E8();
}

uint64_t sub_24A0367D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_24A032364(*(void *)(v1 + 16), a1);
}

char *sub_24A0367D8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (char *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v7 = type metadata accessor for ColorProviderPoint.Sample(0);
    uint64_t v8 = *(int *)(v7 + 28);
    uint64_t v9 = &v4[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_24A056268();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[5];
    unint64_t v14 = &v4[v13];
    uint64_t v15 = (uint64_t)a2 + v13;
    *(_DWORD *)unint64_t v14 = *(_DWORD *)v15;
    *((void *)v14 + 1) = *(void *)(v15 + 8);
    *((_DWORD *)v14 + 4) = *(_DWORD *)(v15 + 16);
    uint64_t v16 = *(int *)(v7 + 28);
    float v17 = &v14[v16];
    uint64_t v18 = v15 + v16;
    swift_retain();
    v12(v17, v18, v11);
    uint64_t v19 = a3[6];
    float v20 = &v4[v19];
    uint64_t v21 = (uint64_t)a2 + v19;
    *(_DWORD *)float v20 = *(_DWORD *)v21;
    *((void *)v20 + 1) = *(void *)(v21 + 8);
    *((_DWORD *)v20 + 4) = *(_DWORD *)(v21 + 16);
    uint64_t v22 = *(int *)(v7 + 28);
    float v23 = &v20[v22];
    uint64_t v24 = v21 + v22;
    swift_retain();
    v12(v23, v24, v11);
    uint64_t v25 = a3[8];
    *(_DWORD *)&v4[a3[7]] = *(_DWORD *)((char *)a2 + a3[7]);
    v12(&v4[v25], (uint64_t)a2 + v25, v11);
  }
  return v4;
}

uint64_t type metadata accessor for ColorProviderPoint.Sample(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269751D28);
}

uint64_t sub_24A0369C8(uint64_t a1, int *a2)
{
  swift_release();
  uint64_t v4 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v5 = a1 + *(int *)(v4 + 28);
  uint64_t v6 = sub_24A056268();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v11)((void *)(v6 - 8), v5, v6);
  uint64_t v7 = a1 + a2[5];
  swift_release();
  v11(v7 + *(int *)(v4 + 28), v6);
  uint64_t v8 = a1 + a2[6];
  swift_release();
  v11(v8 + *(int *)(v4 + 28), v6);
  uint64_t v9 = a1 + a2[8];

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v6);
}

uint64_t sub_24A036AE4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056268();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[5];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  uint64_t v15 = *(int *)(v6 + 28);
  uint64_t v16 = v13 + v15;
  uint64_t v17 = v14 + v15;
  swift_retain();
  v11(v16, v17, v10);
  uint64_t v18 = a3[6];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
  *(void *)(v19 + 8) = *(void *)(v20 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(v20 + 16);
  uint64_t v21 = *(int *)(v6 + 28);
  uint64_t v22 = v19 + v21;
  uint64_t v23 = v20 + v21;
  swift_retain();
  v11(v22, v23, v10);
  uint64_t v24 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v24, a2 + v24, v10);
  return a1;
}

uint64_t sub_24A036C64(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056268();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  uint64_t v12 = a3[5];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)(a2 + v12);
  *(void *)(v13 + 8) = *(void *)(a2 + v12 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)(a2 + v15);
  *(void *)(v16 + 8) = *(void *)(a2 + v15 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + a3[8], a2 + a3[8], v10);
  return a1;
}

uint64_t sub_24A036DF8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056268();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[5];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)v17;
  *(void *)(v16 + 8) = *(void *)(v17 + 8);
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  uint64_t v18 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v18, a2 + v18, v10);
  return a1;
}

uint64_t sub_24A036F58(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v7 = *(int *)(v6 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056268();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = a3[5];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)(a2 + v12);
  *(void *)(v13 + 8) = *(void *)(a2 + v12 + 8);
  swift_release();
  *(_DWORD *)(v13 + 16) = *(_DWORD *)(v14 + 16);
  v11(v13 + *(int *)(v6 + 28), v14 + *(int *)(v6 + 28), v10);
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  *(_DWORD *)uint64_t v16 = *(_DWORD *)(a2 + v15);
  *(void *)(v16 + 8) = *(void *)(a2 + v15 + 8);
  swift_release();
  *(_DWORD *)(v16 + 16) = *(_DWORD *)(v17 + 16);
  v11(v16 + *(int *)(v6 + 28), v17 + *(int *)(v6 + 28), v10);
  uint64_t v18 = a3[8];
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  v11(a1 + v18, a2 + v18, v10);
  return a1;
}

uint64_t sub_24A0370D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A0370E4);
}

uint64_t sub_24A0370E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_24A056268();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 32);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_24A0371DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A0371F0);
}

uint64_t sub_24A0371F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_24A056268();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 32);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_24A0372F4()
{
  uint64_t result = type metadata accessor for ColorProviderPoint.Sample(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24A056268();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *sub_24A0373CC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    uint64_t v5 = *(int *)(a3 + 28);
    uint64_t v6 = a1 + v5;
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = sub_24A056268();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16);
    swift_retain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_24A0374C4(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24A056268();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_24A03753C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_24A056268();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t sub_24A0375E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_24A037688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_24A037714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_24A0377B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A0377C4);
}

uint64_t sub_24A0377C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24A056268();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24A037874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A037888);
}

uint64_t sub_24A037888(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24A056268();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24A037930()
{
  uint64_t result = sub_24A056268();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24A0379DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v14 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    char v7 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (_DWORD *)(a1 + v8);
    uint64_t v10 = (_DWORD *)((char *)a2 + v8);
    uint64_t v11 = (int *)type metadata accessor for ColorProviderPoint(0);
    uint64_t v39 = *((void *)v11 - 1);
    uint64_t v12 = *(unsigned int (**)(_DWORD *, uint64_t, int *))(v39 + 48);
    swift_retain();
    swift_retain();
    if (v12(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      _DWORD *v9 = *v10;
      *((void *)v9 + 1) = *((void *)v10 + 1);
      v9[4] = v10[4];
      uint64_t v37 = type metadata accessor for ColorProviderPoint.Sample(0);
      uint64_t v15 = *(int *)(v37 + 28);
      uint64_t v34 = (char *)v10 + v15;
      uint64_t v35 = (char *)v9 + v15;
      uint64_t v16 = sub_24A056268();
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
      swift_retain();
      v36(v35, v34, v16);
      uint64_t v17 = v11[5];
      uint64_t v18 = (char *)v9 + v17;
      uint64_t v19 = (char *)v10 + v17;
      *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
      *((void *)v18 + 1) = *((void *)v19 + 1);
      *((_DWORD *)v18 + 4) = *((_DWORD *)v19 + 4);
      uint64_t v20 = *(int *)(v37 + 28);
      uint64_t v21 = &v18[v20];
      uint64_t v22 = &v19[v20];
      swift_retain();
      v36(v21, v22, v16);
      uint64_t v23 = v11[6];
      uint64_t v24 = (char *)v9 + v23;
      uint64_t v25 = (char *)v10 + v23;
      *(_DWORD *)uint64_t v24 = *(_DWORD *)v25;
      *((void *)v24 + 1) = *((void *)v25 + 1);
      *((_DWORD *)v24 + 4) = *((_DWORD *)v25 + 4);
      uint64_t v26 = *(int *)(v37 + 28);
      long long v38 = &v24[v26];
      uint64_t v27 = &v25[v26];
      swift_retain();
      v36(v38, v27, v16);
      *(_DWORD *)((char *)v9 + v11[7]) = *(_DWORD *)((char *)v10 + v11[7]);
      v36((char *)v9 + v11[8], (char *)v10 + v11[8], v16);
      (*(void (**)(_DWORD *, void, uint64_t, int *))(v39 + 56))(v9, 0, 1, v11);
    }
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
    *(void *)((char *)v9 + *(int *)(v28 + 28)) = *(void *)((char *)v10 + *(int *)(v28 + 28));
    uint64_t v29 = *(int *)(a3 + 28);
    uint64_t v30 = (void *)(v4 + v29);
    int v31 = (uint64_t *)((char *)a2 + v29);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_24A037CF0(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  int v5 = (int *)type metadata accessor for ColorProviderPoint(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v5 - 1) + 48))(v4, 1, v5))
  {
    swift_release();
    uint64_t v6 = type metadata accessor for ColorProviderPoint.Sample(0);
    uint64_t v7 = v4 + *(int *)(v6 + 28);
    uint64_t v8 = sub_24A056268();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    v9(v7, v8);
    uint64_t v10 = v4 + v5[5];
    swift_release();
    v9(v10 + *(int *)(v6 + 28), v8);
    uint64_t v11 = v4 + v5[6];
    swift_release();
    v9(v11 + *(int *)(v6 + 28), v8);
    v9(v4 + v5[8], v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_24A037E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (_DWORD *)(a1 + v6);
  uint64_t v8 = (_DWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ColorProviderPoint(0);
  uint64_t v10 = *((void *)v9 - 1);
  uint64_t v11 = *(unsigned int (**)(_DWORD *, uint64_t, int *))(v10 + 48);
  swift_retain();
  swift_retain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    *((void *)v7 + 1) = *((void *)v8 + 1);
    v7[4] = v8[4];
    uint64_t v13 = type metadata accessor for ColorProviderPoint.Sample(0);
    uint64_t v14 = *(int *)(v13 + 28);
    uint64_t v37 = (char *)v7 + v14;
    uint64_t v38 = v13;
    uint64_t v36 = (char *)v8 + v14;
    uint64_t v15 = sub_24A056268();
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_retain();
    v16(v37, v36, v15);
    uint64_t v17 = v16;
    uint64_t v18 = v9[5];
    uint64_t v19 = (char *)v7 + v18;
    uint64_t v20 = (char *)v8 + v18;
    *(_DWORD *)uint64_t v19 = *(_DWORD *)v20;
    *((void *)v19 + 1) = *((void *)v20 + 1);
    *((_DWORD *)v19 + 4) = *((_DWORD *)v20 + 4);
    uint64_t v21 = *(int *)(v38 + 28);
    uint64_t v22 = &v19[v21];
    uint64_t v23 = &v20[v21];
    swift_retain();
    v17(v22, v23, v15);
    uint64_t v24 = v9[6];
    uint64_t v25 = (char *)v7 + v24;
    uint64_t v26 = (char *)v8 + v24;
    *(_DWORD *)uint64_t v25 = *(_DWORD *)v26;
    *((void *)v25 + 1) = *((void *)v26 + 1);
    *((_DWORD *)v25 + 4) = *((_DWORD *)v26 + 4);
    uint64_t v27 = *(int *)(v38 + 28);
    uint64_t v28 = &v25[v27];
    uint64_t v29 = &v26[v27];
    swift_retain();
    v17(v28, v29, v15);
    *(_DWORD *)((char *)v7 + v9[7]) = *(_DWORD *)((char *)v8 + v9[7]);
    v17((char *)v7 + v9[8], (char *)v8 + v9[8], v15);
    (*(void (**)(_DWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  *(void *)((char *)v7 + *(int *)(v30 + 28)) = *(void *)((char *)v8 + *(int *)(v30 + 28));
  uint64_t v31 = *(int *)(a3 + 28);
  uint64_t v32 = (void *)(a1 + v31);
  char v33 = (void *)(a2 + v31);
  uint64_t v34 = v33[1];
  *uint64_t v32 = *v33;
  v32[1] = v34;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24A038164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for ColorProviderPoint(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *(_DWORD *)uint64_t v8 = *(_DWORD *)v9;
      *(void *)(v8 + 8) = *(void *)(v9 + 8);
      swift_retain();
      swift_release();
      *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
      uint64_t v36 = type metadata accessor for ColorProviderPoint.Sample(0);
      uint64_t v37 = *(int *)(v36 + 28);
      uint64_t v53 = a3;
      uint64_t v38 = v8 + v37;
      uint64_t v39 = v9 + v37;
      uint64_t v40 = sub_24A056268();
      long long v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 24);
      v49(v38, v39, v40);
      uint64_t v41 = v10[5];
      uint64_t v42 = v8 + v41;
      uint64_t v43 = v9 + v41;
      *(_DWORD *)uint64_t v42 = *(_DWORD *)(v9 + v41);
      *(void *)(v42 + 8) = *(void *)(v9 + v41 + 8);
      swift_retain();
      swift_release();
      *(_DWORD *)(v42 + 16) = *(_DWORD *)(v43 + 16);
      v49(v42 + *(int *)(v36 + 28), v43 + *(int *)(v36 + 28), v40);
      uint64_t v44 = v10[6];
      uint64_t v45 = v8 + v44;
      uint64_t v46 = v9 + v44;
      *(_DWORD *)uint64_t v45 = *(_DWORD *)(v9 + v44);
      *(void *)(v45 + 8) = *(void *)(v9 + v44 + 8);
      swift_retain();
      a3 = v53;
      swift_release();
      *(_DWORD *)(v45 + 16) = *(_DWORD *)(v46 + 16);
      v49(v45 + *(int *)(v36 + 28), v46 + *(int *)(v36 + 28), v40);
      *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
      v49(v8 + v10[8], v9 + v10[8], v40);
      goto LABEL_7;
    }
    sub_24A036534(v8, type metadata accessor for ColorProviderPoint);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
    memcpy((void *)v8, (const void *)v9, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
  uint64_t v50 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v15 = *(int *)(v50 + 28);
  uint64_t v47 = v9 + v15;
  uint64_t v48 = v8 + v15;
  uint64_t v16 = sub_24A056268();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
  uint64_t v52 = a3;
  swift_retain();
  v17(v48, v47, v16);
  uint64_t v18 = v17;
  uint64_t v19 = v10[5];
  uint64_t v20 = v8 + v19;
  uint64_t v21 = v9 + v19;
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  *(_DWORD *)(v20 + 16) = *(_DWORD *)(v21 + 16);
  uint64_t v22 = *(int *)(v50 + 28);
  uint64_t v23 = v20 + v22;
  uint64_t v24 = v21 + v22;
  swift_retain();
  v18(v23, v24, v16);
  uint64_t v25 = v10[6];
  uint64_t v26 = v8 + v25;
  uint64_t v27 = v9 + v25;
  *(_DWORD *)uint64_t v26 = *(_DWORD *)v27;
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  *(_DWORD *)(v26 + 16) = *(_DWORD *)(v27 + 16);
  uint64_t v28 = *(int *)(v50 + 28);
  uint64_t v51 = v26 + v28;
  uint64_t v29 = v27 + v28;
  swift_retain();
  v18(v51, v29, v16);
  *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
  v18(v8 + v10[8], v9 + v10[8], v16);
  a3 = v52;
  (*(void (**)(uint64_t, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  *(void *)(v8 + *(int *)(v31 + 28)) = *(void *)(v9 + *(int *)(v31 + 28));
  swift_retain();
  swift_release();
  uint64_t v32 = *(int *)(a3 + 28);
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(void *)(a1 + v32) = *(void *)(a2 + v32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v33 + 8) = *(void *)(v34 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24A03860C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (_DWORD *)(a1 + v6);
  uint64_t v8 = (_DWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for ColorProviderPoint(0);
  uint64_t v10 = *((void *)v9 - 1);
  if ((*(unsigned int (**)(_DWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    *uint64_t v7 = *v8;
    *((void *)v7 + 1) = *((void *)v8 + 1);
    v7[4] = v8[4];
    uint64_t v27 = v3;
    uint64_t v12 = type metadata accessor for ColorProviderPoint.Sample(0);
    uint64_t v13 = *(int *)(v12 + 28);
    uint64_t v25 = (char *)v8 + v13;
    uint64_t v26 = (char *)v7 + v13;
    uint64_t v14 = sub_24A056268();
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32);
    v15(v26, v25, v14);
    uint64_t v16 = v9[5];
    uint64_t v17 = (char *)v7 + v16;
    uint64_t v18 = (char *)v8 + v16;
    *(_DWORD *)uint64_t v17 = *(_DWORD *)v18;
    *((void *)v17 + 1) = *((void *)v18 + 1);
    *((_DWORD *)v17 + 4) = *((_DWORD *)v18 + 4);
    v15(&v17[*(int *)(v12 + 28)], &v18[*(int *)(v12 + 28)], v14);
    uint64_t v19 = v9[6];
    uint64_t v20 = (char *)v7 + v19;
    uint64_t v21 = (char *)v8 + v19;
    *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
    *((void *)v20 + 1) = *((void *)v21 + 1);
    *((_DWORD *)v20 + 4) = *((_DWORD *)v21 + 4);
    uint64_t v22 = *(int *)(v12 + 28);
    uint64_t v3 = v27;
    v15(&v20[v22], &v21[v22], v14);
    *(_DWORD *)((char *)v7 + v9[7]) = *(_DWORD *)((char *)v8 + v9[7]);
    v15((char *)v7 + v9[8], (char *)v8 + v9[8], v14);
    (*(void (**)(_DWORD *, void, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  *(void *)((char *)v7 + *(int *)(v23 + 28)) = *(void *)((char *)v8 + *(int *)(v23 + 28));
  *(_OWORD *)(a1 + *(int *)(v3 + 28)) = *(_OWORD *)(a2 + *(int *)(v3 + 28));
  return a1;
}

uint64_t sub_24A038874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for ColorProviderPoint(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      *(_DWORD *)uint64_t v8 = *(_DWORD *)v9;
      *(void *)(v8 + 8) = *(void *)(v9 + 8);
      swift_release();
      *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
      uint64_t v32 = type metadata accessor for ColorProviderPoint.Sample(0);
      uint64_t v33 = *(int *)(v32 + 28);
      uint64_t v34 = v8 + v33;
      uint64_t v49 = a3;
      uint64_t v35 = v9 + v33;
      uint64_t v36 = sub_24A056268();
      uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 40);
      v37(v34, v35, v36);
      uint64_t v38 = v10[5];
      uint64_t v39 = v8 + v38;
      uint64_t v40 = v9 + v38;
      *(_DWORD *)uint64_t v39 = *(_DWORD *)(v9 + v38);
      *(void *)(v39 + 8) = *(void *)(v9 + v38 + 8);
      swift_release();
      *(_DWORD *)(v39 + 16) = *(_DWORD *)(v40 + 16);
      v37(v39 + *(int *)(v32 + 28), v40 + *(int *)(v32 + 28), v36);
      uint64_t v41 = v10[6];
      uint64_t v42 = v8 + v41;
      uint64_t v43 = v9 + v41;
      *(_DWORD *)uint64_t v42 = *(_DWORD *)(v9 + v41);
      *(void *)(v42 + 8) = *(void *)(v9 + v41 + 8);
      swift_release();
      *(_DWORD *)(v42 + 16) = *(_DWORD *)(v43 + 16);
      uint64_t v44 = *(int *)(v32 + 28);
      uint64_t v45 = v43 + v44;
      a3 = v49;
      v37(v42 + v44, v45, v36);
      *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
      v37(v8 + v10[8], v9 + v10[8], v36);
      goto LABEL_7;
    }
    sub_24A036534(v8, type metadata accessor for ColorProviderPoint);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751C60);
    memcpy((void *)v8, (const void *)v9, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(_DWORD *)(v8 + 16) = *(_DWORD *)(v9 + 16);
  uint64_t v15 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v16 = *(int *)(v15 + 28);
  uint64_t v46 = v9 + v16;
  uint64_t v47 = v8 + v16;
  uint64_t v48 = a3;
  uint64_t v17 = sub_24A056268();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32);
  v18(v47, v46, v17);
  uint64_t v19 = v10[5];
  uint64_t v20 = v8 + v19;
  uint64_t v21 = v9 + v19;
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  *(_DWORD *)(v20 + 16) = *(_DWORD *)(v21 + 16);
  v18(v20 + *(int *)(v15 + 28), v21 + *(int *)(v15 + 28), v17);
  uint64_t v22 = v10[6];
  uint64_t v23 = v8 + v22;
  uint64_t v24 = v9 + v22;
  *(_DWORD *)uint64_t v23 = *(_DWORD *)v24;
  *(void *)(v23 + 8) = *(void *)(v24 + 8);
  *(_DWORD *)(v23 + 16) = *(_DWORD *)(v24 + 16);
  v18(v23 + *(int *)(v15 + 28), v24 + *(int *)(v15 + 28), v17);
  *(_DWORD *)(v8 + v10[7]) = *(_DWORD *)(v9 + v10[7]);
  uint64_t v25 = v17;
  a3 = v48;
  v18(v8 + v10[8], v9 + v10[8], v25);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  *(void *)(v8 + *(int *)(v27 + 28)) = *(void *)(v9 + *(int *)(v27 + 28));
  swift_release();
  uint64_t v28 = *(int *)(a3 + 28);
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (void *)(a2 + v28);
  *(void *)(a1 + v28) = *v30;
  swift_bridgeObjectRelease();
  *(void *)(v29 + 8) = v30[1];
  swift_release();
  return a1;
}

uint64_t sub_24A038CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A038CB4);
}

uint64_t sub_24A038CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_24A038D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A038D90);
}

uint64_t sub_24A038D90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

void sub_24A038E54()
{
  sub_24A038EFC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24A038EFC()
{
  if (!qword_269751D50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751C60);
    unint64_t v0 = sub_24A057048();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269751D50);
    }
  }
}

unint64_t sub_24A038F5C()
{
  unint64_t result = qword_269751D58;
  if (!qword_269751D58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751BC8);
    sub_249F6EE60(&qword_269751D60, &qword_269751BB8);
    sub_249F6EE60(&qword_26974FE88, &qword_26974FE78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751D58);
  }
  return result;
}

uint64_t sub_24A039020()
{
  return sub_24A0363E8(&qword_269750B70, MEMORY[0x263F07508]);
}

uint64_t sub_24A039068()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A039084()
{
  return sub_24A03450C();
}

unint64_t sub_24A03908C()
{
  unint64_t result = qword_269751DB8;
  if (!qword_269751DB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751DB0);
    sub_24A039100();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751DB8);
  }
  return result;
}

unint64_t sub_24A039100()
{
  unint64_t result = qword_269751DC0;
  if (!qword_269751DC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751DC8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751DD0);
    sub_24A0565F8();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751DC0);
  }
  return result;
}

uint64_t sub_24A0391EC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24A039250()
{
  return sub_24A035148();
}

unint64_t sub_24A039258()
{
  unint64_t result = qword_269751E08;
  if (!qword_269751E08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269751E00);
    sub_24A0565F8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751E08);
  }
  return result;
}

uint64_t sub_24A039318()
{
  uint64_t v1 = type metadata accessor for ColorProviderGraph(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = (int *)type metadata accessor for ColorProviderPoint(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, int *))(*((void *)v6 - 1) + 48))(v5, 1, v6))
  {
    swift_release();
    uint64_t v7 = type metadata accessor for ColorProviderPoint.Sample(0);
    uint64_t v8 = v5 + *(int *)(v7 + 28);
    uint64_t v9 = sub_24A056268();
    uint64_t v15 = v0;
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    v10(v8, v9);
    uint64_t v11 = v5 + v6[5];
    swift_release();
    v10(v11 + *(int *)(v7 + 28), v9);
    uint64_t v12 = v5 + v6[6];
    swift_release();
    uint64_t v13 = *(int *)(v7 + 28);
    uint64_t v3 = (v2 + 16) & ~v2;
    v10(v12 + v13, v9);
    v10(v5 + v6[8], v9);
    uint64_t v0 = v15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751D38);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24A039544(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A0395AC(uint64_t a1, double *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorProviderGraph(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_24A035524(a1, a2, v6);
}

uint64_t sub_24A03962C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_249F6E4F8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24A039670(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_249F6E5D0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A0396B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A03971C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A039770(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A0397CC()
{
  uint64_t v1 = (int *)(type metadata accessor for ColorProviderPoint(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = type metadata accessor for ColorProviderPoint.Sample(0);
  uint64_t v8 = v6 + *(int *)(v7 + 28);
  uint64_t v9 = sub_24A056268();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  uint64_t v11 = v6 + v1[7];
  swift_release();
  v10(v11 + *(int *)(v7 + 28), v9);
  uint64_t v12 = v6 + v1[8];
  swift_release();
  v10(v12 + *(int *)(v7 + 28), v9);
  v10(v6 + v1[10], v9);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24A039948@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ColorProviderPoint(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_24A034998(a1, v6, a2);
}

uint64_t sub_24A0399C8()
{
  return sub_249F6EE60(&qword_269751E90, &qword_269751E98);
}

uint64_t sub_24A039A04()
{
  return sub_24A03650C();
}

uint64_t sub_24A039A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24A057628();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24A057618();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_249F6E790(a1, &qword_26974F450);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A0575D8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24A039BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24A057628();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24A057618();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_249F6E790(a1, &qword_26974F450);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A0575D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269751580);
  return swift_task_create();
}

uint64_t sub_24A039D2C(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_249F9A744(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      uint64_t v7 = &v3[a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      *uint64_t v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t sub_24A039E00@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_249F9A758(v5);
  }
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v7 = v6 - 1;
  uint64_t v8 = sub_24A056268();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    uint64_t result = sub_24A057C18();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    uint64_t result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    uint64_t result = swift_arrayInitWithTakeBackToFront();
  }
  *(void *)(v5 + 16) = v7;
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_24A039F5C()
{
  if (qword_26974F328 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269751340;
  swift_retain();
  uint64_t v1 = sub_24A057F18();
  uint64_t v3 = v2;
  type metadata accessor for Scheduler();
  uint64_t v4 = swift_allocObject();
  uint64_t result = sub_24A03AB60(v0, v1, v3);
  qword_269752448 = v4;
  return result;
}

uint64_t sub_24A03A000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A057628();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a1;
  v9[5] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  if (a1 == 1)
  {
    sub_249F6E790((uint64_t)v6, &qword_26974F450);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    sub_24A057618();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_24A0575D8();
      uint64_t v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_269751F28;
  *(void *)(v13 + 24) = v9;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    _OWORD v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24A03A24C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_249F9C6C0;
  return v7();
}

uint64_t (*sub_24A03A318(void (**a1)(char *, char *, uint64_t), unint64_t a2, void (**a3)(char *, uint64_t, uint64_t, uint64_t)))()
{
  unint64_t v33 = a2;
  uint64_t v6 = type metadata accessor for ScheduledTask();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751EC0);
  uint64_t v34 = swift_allocBox();
  uint64_t v13 = v12;
  uint64_t v14 = sub_24A056268();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v32(v13, 1, 1, v14);
  uint64_t v16 = (os_unfair_lock_s *)(*(void *)(v3 + 80) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v16);
  swift_endAccess();
  if (!*(void *)(v3 + 40))
  {
    uint64_t v30 = *(void *)(v3 + 32);
    uint64_t v17 = sub_24A057628();
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
    uint64_t v29 = v11;
    v18(v11, 1, 1, v17);
    uint64_t v19 = swift_allocObject();
    swift_weakInit();
    uint64_t v20 = (void *)swift_allocObject();
    uint64_t v31 = a1;
    uint64_t v21 = a3;
    uint64_t v22 = v20;
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = v30;
    v20[5] = v19;
    swift_retain();
    uint64_t v23 = (uint64_t)v22;
    a3 = v21;
    a1 = v31;
    *(void *)(v3 + 40) = sub_24A039A1C((uint64_t)v29, (uint64_t)&unk_269751EF8, v23);
    swift_release();
  }
  sub_24A03BC98(v33, a3, a1, (uint64_t)v8);
  sub_249F6E790(v13, &qword_269751EC0);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v13, v8, v14);
  v32(v13, 0, 1, v14);
  if (*(unsigned char *)(v3 + 48) == 1) {
    sub_24A03C5F4((uint64_t)v8);
  }
  sub_24A03EA80((uint64_t)v8);
  swift_beginAccess();
  os_unfair_lock_unlock(v16);
  swift_endAccess();
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v34;
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v26;
  return sub_24A03F068;
}

uint64_t sub_24A03A674()
{
  uint64_t v0 = swift_projectBox();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(result + 80) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v3);
    swift_endAccess();
    sub_24A03A738(v2, v0);
    swift_beginAccess();
    os_unfair_lock_unlock(v3);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_24A03A738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751090);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EC0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v28 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v26 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v26 - v13;
  swift_beginAccess();
  sub_249F6E6C8(a2, (uint64_t)v14, &qword_269751EC0);
  uint64_t v15 = sub_24A056268();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t result = v17(v14, 1, v15);
  if (result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v19 = type metadata accessor for ScheduledTask();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  swift_beginAccess();
  sub_249FEF8B8((uint64_t)v6, (uint64_t)v14);
  swift_endAccess();
  swift_beginAccess();
  sub_249F6E6C8(a2, (uint64_t)v11, &qword_269751EC0);
  uint64_t result = v17(v11, 1, v15);
  if (result != 1)
  {
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
    swift_beginAccess();
    uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 16);
    uint64_t v26 = a1;
    uint64_t v21 = (uint64_t)v28;
    if (v20)
    {
      swift_bridgeObjectRetain();
      sub_24A0150F4((uint64_t)v11);
      if (v22)
      {
        swift_retain();
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
        sub_24A057688();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v23 = *(void (**)(char *, uint64_t))(v16 + 8);
    v23(v11, v15);
    swift_beginAccess();
    sub_249F6E6C8(a2, v21, &qword_269751EC0);
    uint64_t result = v27(v21, 1, v15);
    if (result == 1) {
      goto LABEL_13;
    }
    swift_beginAccess();
    sub_249FFA93C(v21);
    v23((char *)v21, v15);
    swift_endAccess();
    swift_release();
    uint64_t v24 = v26;
    swift_beginAccess();
    uint64_t result = sub_24A03F17C((unint64_t *)(v24 + 72), a2);
    uint64_t v25 = *(void *)(*(void *)(v24 + 72) + 16);
    if (v25 >= result)
    {
      sub_24A040098(result, v25, (uint64_t (*)(void))sub_249FBAC34, MEMORY[0x263F07508]);
      return swift_endAccess();
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_24A03AB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751398);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x263F8EE80];
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 56) = v16;
  *(void *)(v3 + 64) = v16;
  *(void *)(v3 + 72) = MEMORY[0x263F8EE78];
  type metadata accessor for CPUnfairLock();
  uint64_t v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(void *)(v3 + 80) = v17;
  *(void *)(v3 + 24) = a3;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 16) = a2;
  uint64_t v18 = *(void *)(a1 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideClock);
  uint64_t v19 = type metadata accessor for OverrideTime(0);
  uint64_t v20 = *(void *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v9, 1, 1, v19);
  uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v18 + 40) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v21);
  swift_endAccess();
  uint64_t v22 = v18 + OBJC_IVAR____TtC11ClockPosterP33_379590E2B70ADE273C4445A41EC4954213OverrideClock_locked_overrideTime;
  swift_beginAccess();
  sub_249F6E790((uint64_t)v9, &qword_269751398);
  sub_249F6E6C8(v22, (uint64_t)v9, &qword_269751398);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock(v21);
  swift_endAccess();
  sub_249F6E664((uint64_t)v9, (uint64_t)v12, &qword_269751398);
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v19))
  {
    sub_249F6E790((uint64_t)v12, &qword_269751398);
    uint64_t v23 = sub_24A056238();
    BOOL v24 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 1, 1, v23);
  }
  else
  {
    uint64_t v25 = sub_24A056238();
    uint64_t v26 = *(void *)(v25 - 8);
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v15, v12, v25);
    sub_249F6E790((uint64_t)v12, &qword_269751398);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v15, 0, 1, v25);
    BOOL v24 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v15, 1, v25) == 1;
  }
  sub_249F6E790((uint64_t)v15, &qword_2697515A0);
  *(unsigned char *)(v3 + 48) = v24;
  return v3;
}

uint64_t sub_24A03AF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[24] = a4;
  v5[25] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  v5[26] = swift_task_alloc();
  uint64_t v6 = sub_24A056238();
  v5[27] = v6;
  v5[28] = *(void *)(v6 - 8);
  v5[29] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  v5[30] = v7;
  v5[31] = *(void *)(v7 - 8);
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB0);
  v5[34] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697516A0);
  v5[35] = v8;
  v5[36] = *(void *)(v8 - 8);
  v5[37] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB8);
  v5[38] = v9;
  v5[39] = *(void *)(v9 - 8);
  v5[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A03B164, 0, 0);
}

uint64_t sub_24A03B164()
{
  uint64_t v2 = v0[36];
  uint64_t v1 = v0[37];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[24];
  uint64_t v5 = *(void *)(v4 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_249FEFFF8(v5, v4, v1);
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[41] = 0;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[42] = v6;
  void *v6 = v0;
  v6[1] = sub_24A03B2A0;
  uint64_t v7 = v0[38];
  uint64_t v8 = v0[34];
  return MEMORY[0x270FA1F68](v8, 0, 0, v7);
}

uint64_t sub_24A03B2A0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24A03B39C, 0, 0);
}

uint64_t sub_24A03B39C()
{
  uint64_t v1 = v0[34];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[31] + 48))(v1, 1, v0[30]) == 1)
  {
    (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
LABEL_6:
    return v2();
  }
  uint64_t v3 = v0[41];
  sub_249F6E664(v1, v0[33], &qword_2697515A0);
  sub_24A0576A8();
  if (v3)
  {
    (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
    sub_249F6E790(v0[33], &qword_2697515A0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    goto LABEL_6;
  }
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    uint64_t v8 = v0[33];
    (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
    sub_249F6E790(v8, &qword_2697515A0);
    goto LABEL_3;
  }
  uint64_t v6 = Strong;
  uint64_t v7 = (os_unfair_lock_s *)(*(void *)(Strong + 80) + 16);
  swift_beginAccess();
  os_unfair_lock_lock(v7);
  swift_endAccess();
  sub_24A0576A8();
  uint64_t v9 = v0[32];
  uint64_t v10 = v0[27];
  uint64_t v11 = v0[28];
  sub_249F6E6C8(v0[33], v9, &qword_2697515A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_249F6E790(v0[32], &qword_2697515A0);
    char v12 = *(unsigned char *)(v6 + 48);
    *(unsigned char *)(v6 + 48) = 1;
    if ((v12 & 1) == 0)
    {
      swift_beginAccess();
      uint64_t v15 = swift_bridgeObjectRetain();
      sub_24A03FCF8(v15, (void (*)(char *, uint64_t))sub_24A03F178);
      swift_bridgeObjectRelease();
    }
    uint64_t v16 = 0;
  }
  else
  {
    (*(void (**)(void, void, void))(v0[28] + 32))(v0[29], v0[32], v0[27]);
    int v13 = *(unsigned __int8 *)(v6 + 48);
    *(unsigned char *)(v6 + 48) = 0;
    if (v13 == 1)
    {
      swift_beginAccess();
      uint64_t v14 = swift_bridgeObjectRetain();
      sub_24A03FCF8(v14, (void (*)(char *, uint64_t))sub_24A03F178);
      swift_bridgeObjectRelease();
    }
    uint64_t v17 = v0[28];
    uint64_t v18 = v0[29];
    uint64_t v19 = v0[27];
    uint64_t v16 = sub_24A03BB68(v18);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
  }
  swift_beginAccess();
  os_unfair_lock_unlock(v7);
  swift_endAccess();
  if (v16)
  {
    uint64_t v36 = v16[2];
    if (v36)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v20 = 0;
      while (1)
      {
        uint64_t v21 = v0[26];
        uint64_t v22 = v16;
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = *(_OWORD *)&v16[2 * v20 + 4];
        uint64_t v24 = sub_24A057628();
        uint64_t v25 = *(void *)(v24 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(v21, 1, 1, v24);
        uint64_t v26 = (void *)swift_allocObject();
        v26[2] = 0;
        uint64_t v27 = v26 + 2;
        v26[3] = 0;
        v26[4] = sub_24A03FF80;
        v26[5] = v23;
        LODWORD(v23) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v21, 1, v24);
        swift_retain_n();
        uint64_t v28 = v0[26];
        if (v23 == 1)
        {
          sub_249F6E790(v0[26], &qword_26974F450);
          if (!*v27) {
            goto LABEL_29;
          }
        }
        else
        {
          sub_24A057618();
          (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v28, v24);
          if (!*v27)
          {
LABEL_29:
            uint64_t v29 = 0;
            uint64_t v31 = 0;
            goto LABEL_30;
          }
        }
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v29 = sub_24A0575D8();
        uint64_t v31 = v30;
        swift_unknownObjectRelease();
LABEL_30:
        uint64_t v16 = v22;
        uint64_t v32 = swift_allocObject();
        *(void *)(v32 + 16) = &unk_269751F08;
        *(void *)(v32 + 24) = v26;
        if (v31 | v29)
        {
          v0[2] = 0;
          v0[3] = 0;
          v0[4] = v29;
          v0[5] = v31;
        }
        ++v20;
        swift_task_create();
        swift_release();
        swift_release();
        if (v36 == v20)
        {
          swift_bridgeObjectRelease_n();
          break;
        }
      }
    }
  }
  swift_release();
  sub_249F6E790(v0[33], &qword_2697515A0);
  swift_bridgeObjectRelease();
  v0[41] = 0;
  unint64_t v33 = (void *)swift_task_alloc();
  v0[42] = v33;
  *unint64_t v33 = v0;
  v33[1] = sub_24A03B2A0;
  uint64_t v34 = v0[38];
  uint64_t v35 = v0[34];
  return MEMORY[0x270FA1F68](v35, 0, 0, v34);
}

uint64_t sub_24A03BAE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24A03BB04, 0, 0);
}

uint64_t sub_24A03BB04()
{
  (*(void (**)(void))(v0 + 16))();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_24A03BB68(uint64_t a1)
{
  uint64_t v2 = sub_24A03D4D0(a1);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  do
  {
    if (!v6) {
      uint64_t v6 = v7;
    }
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v4;
    *(void *)(v8 + 24) = v5;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = sub_249FBAC58(0, v6[2] + 1, 1, v6);
    }
    unint64_t v10 = v6[2];
    unint64_t v9 = v6[3];
    if (v10 >= v9 >> 1) {
      uint64_t v6 = sub_249FBAC58((void *)(v9 > 1), v10 + 1, 1, v6);
    }
    v6[2] = v10 + 1;
    uint64_t v11 = &v6[2 * v10];
    void v11[4] = sub_24A03F000;
    _OWORD v11[5] = v8;
    sub_249F6C9E0(v4);
    uint64_t v4 = sub_24A03D4D0(a1);
    uint64_t v5 = v12;
  }
  while (v4);
  return v6;
}

uint64_t sub_24A03BC98@<X0>(unint64_t a1@<X0>, void (**a2)(char *, uint64_t, uint64_t, uint64_t)@<X1>, void (**a3)(char *, char *, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v99 = a1;
  uint64_t v96 = a3;
  uint64_t v97 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751ED8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v72 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ScheduledTask();
  uint64_t v78 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v80 = (uint64_t)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EE0);
  uint64_t v94 = *(unsigned int (***)(uint64_t *, uint64_t, uint64_t))(v98 - 8);
  MEMORY[0x270FA5388](v98);
  uint64_t v76 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = &qword_269751EC0;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EC0);
  MEMORY[0x270FA5388](v11 - 8);
  int v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EE8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char **)((char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  uint64_t v93 = (uint64_t *)((char *)&v72 - v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751090);
  MEMORY[0x270FA5388](v19 - 8);
  unint64_t v77 = (char *)&v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v95 = (char **)((char *)&v72 - v22);
  uint64_t v23 = sub_24A056268();
  uint64_t v86 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v92 = (char *)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v75 = (char *)&v72 - v26;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v72 - v28;
  uint64_t v30 = a4 + *(int *)(v7 + 20);
  uint64_t v31 = sub_24A056238();
  uint64_t v32 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v31 - 8) + 16);
  uint64_t v79 = v30;
  v32(v30, v96, v31);
  unint64_t v33 = v97;
  swift_retain();
  sub_24A056258();
  uint64_t v34 = (unint64_t *)(a4 + *(int *)(v7 + 24));
  unint64_t *v34 = v99;
  v34[1] = (unint64_t)v33;
  uint64_t v35 = *(void (**)(void, void, void))(v86 + 16);
  uint64_t v84 = v86 + 16;
  uint64_t v83 = (void (*)(char *, unint64_t, uint64_t))v35;
  v35(v29, a4, v23);
  uint64_t v73 = a4;
  uint64_t v36 = a4;
  uint64_t v37 = (void (**)(void, void, void, void))v95;
  sub_24A03EADC(v36, (uint64_t)v95);
  unint64_t v87 = *(void (**)(void, void, uint64_t, uint64_t))(v78 + 56);
  uint64_t v88 = v78 + 56;
  v87(v37, 0, 1, v7);
  unint64_t v38 = v100;
  uint64_t v39 = (uint64_t *)(v100 + 56);
  swift_beginAccess();
  uint64_t v91 = v39;
  sub_249FEF8B8((uint64_t)v37, (uint64_t)v29);
  swift_endAccess();
  unint64_t v74 = v38 + 72;
  swift_beginAccess();
  uint64_t v40 = *(void *)(v38 + 72);
  uint64_t v97 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56);
  uint64_t v82 = v86 + 48;
  unint64_t v99 = *(void *)(v40 + 16);
  uint64_t v95 = (char **)(v94 + 7);
  uint64_t v96 = (void (**)(char *, char *, uint64_t))(v86 + 32);
  v94 += 6;
  uint64_t v90 = (void (**)(uint64_t, uint64_t))(v86 + 8);
  long long v89 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48);
  uint64_t v41 = (uint64_t)v77;
  uint64_t v85 = v40;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v81 = 0;
  unint64_t v43 = 0;
  while (1)
  {
    unint64_t v44 = v99;
    if (v43 == v99)
    {
      (*v97)(v13, 1, 1, v23);
      unint64_t v100 = v44;
LABEL_7:
      uint64_t v47 = v98;
      uint64_t v48 = v96;
      sub_249F6E790((uint64_t)v13, v10);
      uint64_t v49 = 1;
      uint64_t v50 = v93;
      goto LABEL_10;
    }
    if (v43 >= *(void *)(v85 + 16))
    {
      __break(1u);
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v45 = v86;
    v83(v13, v85+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v43, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v13, 0, 1, v23);
    int v46 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48))(v13, 1, v23);
    unint64_t v100 = v43 + 1;
    if (v46 == 1) {
      goto LABEL_7;
    }
    uint64_t v51 = v10;
    uint64_t v52 = v7;
    uint64_t v48 = v96;
    uint64_t v53 = *v96;
    uint64_t v54 = v75;
    (*v96)(v75, v13, v23);
    uint64_t v55 = v98;
    uint64_t v56 = &v76[*(int *)(v98 + 48)];
    uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v53)(v56, v54, v23);
    uint64_t v57 = v81 + 1;
    if (__OFADD__(v81, 1)) {
      goto LABEL_25;
    }
    uint64_t v58 = (char *)v16 + *(int *)(v55 + 48);
    *uint64_t v16 = v81;
    v53(v58, v56, v23);
    uint64_t v49 = 0;
    uint64_t v81 = v57;
    uint64_t v7 = v52;
    uint64_t v47 = v55;
    unint64_t v10 = v51;
    uint64_t v50 = v93;
    uint64_t v41 = (uint64_t)v77;
LABEL_10:
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))*v95)(v16, v49, 1, v47);
    sub_249F6E664((uint64_t)v16, (uint64_t)v50, &qword_269751EE8);
    if ((*v94)(v50, 1, v47) == 1) {
      break;
    }
    uint64_t v59 = v48;
    uint64_t v60 = *v50;
    uint64_t v61 = (char *)v50 + *(int *)(v47 + 48);
    uint64_t v62 = (uint64_t)v92;
    (*v59)(v92, v61, v23);
    uint64_t v63 = *v91;
    if (*(void *)(*v91 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v64 = sub_24A0150F4(v62);
      if (v65)
      {
        sub_24A03EADC(*(void *)(v63 + 56) + *(void *)(v78 + 72) * v64, v41);
        uint64_t v66 = v41;
        uint64_t v67 = 0;
      }
      else
      {
        uint64_t v66 = v41;
        uint64_t v67 = 1;
      }
      v87(v66, v67, 1, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      v87(v41, 1, 1, v7);
    }
    (*v90)(v62, v23);
    if ((*v89)(v41, 1, v7) == 1)
    {
      uint64_t result = sub_249F6E790(v41, &qword_269751090);
      unint64_t v43 = v100;
    }
    else
    {
      uint64_t v68 = v80;
      sub_24A03EA1C(v41, v80);
      char v69 = sub_24A0561B8();
      uint64_t result = sub_24A03EA80(v68);
      unint64_t v43 = v100;
      if (v69) {
        goto LABEL_21;
      }
    }
  }
  uint64_t v60 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  unint64_t v70 = v74;
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)v70 + 16) < v60)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((v60 & 0x8000000000000000) == 0)
  {
    uint64_t v71 = (uint64_t)v72;
    v83(v72, v73, v23);
    sub_24A03EDAC(v60, v60, v71);
    return swift_endAccess();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24A03C5F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A056268();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  unint64_t v38 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v40 = (uint64_t)&v36 - v10;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = sub_24A056238();
  uint64_t v42 = *(void *)(v15 - 8);
  uint64_t v43 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v41 = (uint64_t)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A006BDC(v41);
  type metadata accessor for ScheduledTask();
  sub_24A056058();
  double v18 = v17;
  sub_24A056058();
  double v20 = v18 - v19;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v21(v14, a1, v6);
  uint64_t v22 = *(void *)(v1 + 16);
  uint64_t v36 = *(void *)(v1 + 24);
  uint64_t v37 = v22;
  v21(v11, (uint64_t)v14, v6);
  uint64_t v23 = sub_24A057628();
  uint64_t v24 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v39, 1, 1, v23);
  uint64_t v25 = swift_allocObject();
  swift_weakInit();
  uint64_t v26 = v38;
  v21(v38, (uint64_t)v14, v6);
  unint64_t v27 = (*(unsigned __int8 *)(v7 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = 0;
  *(double *)(v28 + 32) = v20;
  uint64_t v29 = v36;
  *(void *)(v28 + 40) = v37;
  *(void *)(v28 + 48) = v29;
  *(void *)(v28 + 56) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v28 + v27, v26, v6);
  uint64_t v30 = sub_24A039A1C(v24, (uint64_t)&unk_269751ED0, v28);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v44 = *(void *)(v2 + 64);
  *(void *)(v2 + 64) = 0x8000000000000000;
  uint64_t v32 = v30;
  uint64_t v33 = v40;
  sub_249FFFD2C(v32, v40, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 64) = v44;
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v34(v33, v6);
  swift_endAccess();
  v34((uint64_t)v14, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
}

uint64_t sub_24A03C9E4(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 160) = a7;
  *(void *)(v8 + 168) = a8;
  *(void *)(v8 + 144) = a5;
  *(void *)(v8 + 152) = a6;
  *(double *)(v8 + 136) = a1;
  uint64_t v9 = sub_24A057B48();
  *(void *)(v8 + 176) = v9;
  *(void *)(v8 + 184) = *(void *)(v9 - 8);
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v10 = sub_24A057B28();
  *(void *)(v8 + 200) = v10;
  *(void *)(v8 + 208) = *(void *)(v10 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A03CB18, 0, 0);
}

uint64_t sub_24A03CB18()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 152);
  sub_24A057B08();
  uint64_t v6 = sub_24A057F18();
  MEMORY[0x24C5B9330](v6);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 232) = v7;
  *(void *)(v0 + 240) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v1, v2);
  *(void *)(v0 + 112) = v5;
  *(void *)(v0 + 120) = v4;
  *(unsigned char *)(v0 + 128) = 0;
  sub_24A057DA8();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v8;
  uint64_t v9 = sub_24A03ED64(&qword_2697515A8, MEMORY[0x263F8F710]);
  *uint64_t v8 = v0;
  v8[1] = sub_24A03CC78;
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 176);
  return MEMORY[0x270FA1FF8](v10, v0 + 112, v11, v12, v9);
}

uint64_t sub_24A03CC78()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 184);
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  uint64_t v4 = (void (**)(void, void))(v3 + 8);
  uint64_t v5 = (void (*)(uint64_t, uint64_t))v2[29];
  if (v0)
  {
    uint64_t v6 = v2[28];
    uint64_t v7 = v2[25];
    (*v4)(v2[24], v2[22]);
    v5(v6, v7);
    uint64_t v8 = sub_24A03CFDC;
  }
  else
  {
    uint64_t v9 = v2[28];
    uint64_t v10 = v2[25];
    (*v4)(v2[24], v2[22]);
    v5(v9, v10);
    uint64_t v8 = sub_24A03CE0C;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_24A03CE0C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = v0[32];
    uint64_t v3 = (os_unfair_lock_s *)(*(void *)(Strong + 80) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v3);
    swift_endAccess();
    sub_24A0576A8();
    if (v2)
    {
      swift_beginAccess();
      os_unfair_lock_unlock(v3);
      swift_endAccess();
      swift_willThrow();
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v4 = (uint64_t (*)(void))v0[1];
      goto LABEL_8;
    }
    uint64_t v5 = (void (*)(uint64_t))sub_24A03D150(v0[21]);
    swift_beginAccess();
    os_unfair_lock_unlock(v3);
    swift_endAccess();
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_249F6C9E0((uint64_t)v5);
      swift_release();
      sub_249F6C9E0((uint64_t)v5);
    }
    else
    {
      swift_release();
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
LABEL_8:
  return v4();
}

uint64_t sub_24A03CFDC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24A03D05C(uint64_t a1)
{
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 64) + 16))
  {
    swift_bridgeObjectRetain();
    sub_24A0150F4(a1);
    if (v3)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
      sub_24A057688();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  sub_249FFA93C(a1);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24A03D150(uint64_t a1)
{
  uint64_t v3 = sub_24A056268();
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ScheduledTask();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751090);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v22 - v14;
  swift_beginAccess();
  uint64_t v25 = v1;
  uint64_t v16 = *(void *)(v1 + 56);
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_24A0150F4(a1);
    if (v18)
    {
      sub_24A03EADC(*(void *)(v16 + 56) + *(void *)(v7 + 72) * v17, (uint64_t)v15);
      double v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v19(v15, 0, 1, v6);
    }
    else
    {
      double v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
      v19(v15, 1, 1, v6);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v19(v15, 1, 1, v6);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v15, 1, v6))
  {
    sub_249F6E790((uint64_t)v15, &qword_269751090);
    uint64_t v20 = 0;
  }
  else
  {
    sub_24A03EADC((uint64_t)v15, (uint64_t)v9);
    sub_249F6E790((uint64_t)v15, &qword_269751090);
    uint64_t v20 = *(void *)&v9[*(int *)(v6 + 24)];
    swift_retain();
    sub_24A03EA80((uint64_t)v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v5, a1, v24);
  v19(v12, 1, 1, v6);
  swift_beginAccess();
  sub_249FEF8B8((uint64_t)v12, (uint64_t)v5);
  swift_endAccess();
  swift_beginAccess();
  sub_249FFA93C(a1);
  swift_endAccess();
  swift_release();
  return v20;
}

uint64_t sub_24A03D4D0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v76 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751090);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v58 - v7;
  uint64_t v9 = type metadata accessor for ScheduledTask();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EC0);
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v74 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v17 = (char *)&v58 - v16;
  uint64_t v18 = sub_24A056268();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v73 = (uint64_t)&v58 - v23;
  MEMORY[0x270FA5388](v24);
  unint64_t v77 = (char *)&v58 - v25;
  uint64_t v75 = (unint64_t *)(v2 + 72);
  swift_beginAccess();
  uint64_t v26 = *(void *)(v2 + 72);
  uint64_t v27 = *(void *)(v26 + 16);
  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    goto LABEL_7;
  }
  char v69 = v21;
  unint64_t v70 = v5;
  uint64_t v71 = v9;
  uint64_t v72 = v10;
  unint64_t v67 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v66 = *(void *)(v19 + 72);
  uint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
  v28(v17, v26 + v67 + v66 * (v27 - 1), v18);
  uint64_t v68 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
  v68(v17, 0, 1, v18);
  char v65 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v65(v17, 1, v18) == 1)
  {
LABEL_7:
    unint64_t v38 = &qword_269751EC0;
    uint64_t v39 = (uint64_t)v17;
LABEL_12:
    sub_249F6E790(v39, v38);
    return 0;
  }
  uint64_t v62 = (void (*)(uint64_t, char *, uint64_t))v28;
  uint64_t v29 = *(void (**)(uint64_t, unint64_t, uint64_t))(v19 + 32);
  uint64_t v30 = (uint64_t)v77;
  uint64_t v64 = v19 + 32;
  uint64_t v63 = v29;
  v29((uint64_t)v77, (unint64_t)v17, v18);
  uint64_t v61 = v2 + 56;
  swift_beginAccess();
  uint64_t v31 = *(void *)(v2 + 56);
  if (!*(void *)(v31 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v72 + 56))(v8, 1, 1, v71);
LABEL_11:
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v30, v18);
    unint64_t v38 = &qword_269751090;
    uint64_t v39 = (uint64_t)v8;
    goto LABEL_12;
  }
  uint64_t v60 = v12;
  swift_bridgeObjectRetain();
  unint64_t v32 = sub_24A0150F4(v30);
  uint64_t v34 = v72;
  if (v33)
  {
    sub_24A03EADC(*(void *)(v31 + 56) + *(void *)(v72 + 72) * v32, (uint64_t)v8);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56);
    uint64_t v36 = v8;
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v72 + 56);
    uint64_t v36 = v8;
    uint64_t v37 = 1;
  }
  uint64_t v40 = v71;
  uint64_t v59 = v35;
  v35((uint64_t)v36, v37, 1, v71);
  swift_bridgeObjectRelease();
  int v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v8, 1, v40);
  uint64_t v30 = (uint64_t)v77;
  if (v41 == 1) {
    goto LABEL_11;
  }
  uint64_t v44 = (uint64_t)v8;
  uint64_t v45 = (uint64_t)v60;
  sub_24A03EA1C(v44, (uint64_t)v60);
  if ((sub_24A0561B8() & 1) == 0)
  {
    sub_24A03EA80(v45);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v30, v18);
    return 0;
  }
  int v46 = v75;
  swift_beginAccess();
  unint64_t v47 = *v46;
  if (*(void *)(*v46 + 16))
  {
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = (uint64_t)v74;
    if (result) {
      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t result = sub_249F9A758(v47);
  unint64_t v47 = result;
LABEL_18:
  uint64_t v48 = *(void *)(v47 + 16);
  if (v48)
  {
    uint64_t v49 = v48 - 1;
    v63(v30, v47 + v67 + (v48 - 1) * v66, v18);
    *(void *)(v47 + 16) = v49;
    uint64_t v50 = v75;
    *uint64_t v75 = v47;
    v68((char *)v30, 0, 1, v18);
    if (v65((char *)v30, 1, v18) == 1)
    {
      sub_249F6E790(v30, &qword_269751EC0);
      uint64_t v51 = v73;
      sub_24A039E00(*(void *)(*v50 + 16) - 1, v73);
    }
    else
    {
      uint64_t v51 = v73;
      v63(v73, v30, v18);
    }
    uint64_t v53 = (uint64_t)v69;
    uint64_t v52 = (uint64_t)v70;
    uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v54(v51, v18);
    swift_endAccess();
    uint64_t v55 = (uint64_t)v77;
    v62(v53, v77, v18);
    uint64_t v56 = v71;
    v59(v52, 1, 1, v71);
    swift_beginAccess();
    sub_249FEF8B8(v52, v53);
    swift_endAccess();
    swift_beginAccess();
    sub_249FFA93C(v55);
    swift_endAccess();
    swift_release();
    v54(v55, v18);
    uint64_t v57 = (uint64_t)v60;
    uint64_t v42 = *(void *)&v60[*(int *)(v56 + 24)];
    swift_retain();
    sub_24A03EA80(v57);
    return v42;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A03DC24()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Scheduler()
{
  return self;
}

uint64_t *sub_24A03DCA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_24A056268();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24A056238();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
  }
  swift_retain();
  return a1;
}

uint64_t sub_24A03DDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_release();
}

uint64_t sub_24A03DE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  return a1;
}

uint64_t sub_24A03DF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24A03E048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_24A03E114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24A056238();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t sub_24A03E1EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A03E200);
}

uint64_t sub_24A03E200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A056268();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_24A056238();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_24A03E314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A03E328);
}

uint64_t sub_24A03E328(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_24A056268();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_24A056238();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for ScheduledTask()
{
  uint64_t result = qword_269751EA0;
  if (!qword_269751EA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A03E484()
{
  uint64_t result = sub_24A056268();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24A056238();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Scheduler.Schedule(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24A03E624);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Scheduler.Schedule()
{
  return &type metadata for Scheduler.Schedule;
}

unint64_t sub_24A03E660()
{
  unint64_t result = qword_269751EB0;
  if (!qword_269751EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751EB0);
  }
  return result;
}

uint64_t sub_24A03E6B4()
{
  return sub_24A057E68();
}

uint64_t sub_24A03E73C()
{
  sub_24A056268();
  sub_24A03ED64(&qword_269750B70, MEMORY[0x263F07508]);

  return sub_24A057318();
}

uint64_t sub_24A03E7C0()
{
  return sub_24A057E68();
}

BOOL sub_24A03E844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056268();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16);
  v12((char *)&v15 - v10, a1, v4, v9);
  ((void (*)(char *, uint64_t, uint64_t))v12)(v7, a2, v4);
  sub_24A03ED64(&qword_2697517A0, MEMORY[0x263F07508]);
  LOBYTE(a2) = sub_24A057358();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  v13(v11, v4);
  return (a2 & 1) == 0;
}

uint64_t sub_24A03E9D4()
{
  return sub_24A03ED64(&qword_269751EB8, (void (*)(uint64_t))type metadata accessor for ScheduledTask);
}

uint64_t sub_24A03EA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A03EA80(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A03EADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ScheduledTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A03EB40()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A03EB78()
{
  uint64_t v1 = sub_24A056268();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24A03EC4C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24A056268() - 8);
  uint64_t v5 = *((void *)v1 + 2);
  uint64_t v6 = *((void *)v1 + 3);
  double v7 = v1[4];
  uint64_t v8 = *((void *)v1 + 5);
  uint64_t v9 = *((void *)v1 + 6);
  uint64_t v10 = *((void *)v1 + 7);
  uint64_t v11 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_249F9C6C0;
  return sub_24A03C9E4(v7, a1, v5, v6, v8, v9, v10, v11);
}

uint64_t sub_24A03ED64(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A03EDAC(uint64_t a1, int64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v10 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v10) {
      int64_t v13 = v6 + v9;
    }
    else {
      int64_t v13 = v6;
    }
    unint64_t v5 = sub_249FBAC34(isUniquelyReferenced_nonNull_native, v13, 1, v5);
    *uint64_t v3 = v5;
  }
  uint64_t v14 = sub_24A056268();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v16 = v5 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v17 = *(void *)(v15 + 72);
  unint64_t v18 = v16 + v17 * a1;
  swift_arrayDestroy();
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v19 = *(void *)(v5 + 16);
  uint64_t v20 = v19 - a2;
  if (__OFSUB__(v19, a2)) {
    goto LABEL_33;
  }
  if (v20 < 0)
  {
LABEL_35:
    uint64_t result = sub_24A057C18();
    __break(1u);
    return result;
  }
  unint64_t v21 = v18 + v17;
  unint64_t v22 = v16 + v17 * a2;
  if (v18 + v17 < v22 || v21 >= v22 + v20 * v17)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v21 != v22)
  {
    swift_arrayInitWithTakeBackToFront();
  }
  uint64_t v24 = *(void *)(v5 + 16);
  BOOL v25 = __OFADD__(v24, v9);
  uint64_t v26 = v24 + v9;
  if (v25)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v5 + 16) = v26;
LABEL_25:
  if (v17 >= 1) {
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  }
  return sub_249F6E790(a3, &qword_269751ED8);
}

uint64_t sub_24A03EFC8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A03F000()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24A03F028()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A03F068()
{
  return sub_24A03A674();
}

uint64_t sub_24A03F070()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A03F0B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_249F6C87C;
  return sub_24A03AF14(a1, v4, v5, v7, v6);
}

uint64_t sub_24A03F17C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_24A056268();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v87 = (char *)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v88 = (char *)v84 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v98 = (char *)v84 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v90 = (char *)v84 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751F18);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  unint64_t v18 = (char *)v84 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751EC0);
  MEMORY[0x270FA5388](v19 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v95 = (uint64_t)v84 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v93 = (uint64_t)v84 - v23;
  MEMORY[0x270FA5388](v24);
  MEMORY[0x270FA5388](v25);
  MEMORY[0x270FA5388](v26);
  uint64_t v31 = (char *)v84 - v30;
  uint64_t v97 = a1;
  unint64_t v32 = *a1;
  uint64_t v102 = *(uint64_t (***)(uint64_t, char *, uint64_t))(*a1 + 16);
  if (!v102) {
    return 0;
  }
  unint64_t v111 = v29;
  uint64_t v92 = v28;
  uint64_t v85 = v27;
  uint64_t v96 = v15;
  unint64_t v33 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v103 = v32;
  swift_bridgeObjectRetain();
  uint64_t v106 = a2;
  swift_beginAccess();
  unint64_t v34 = v103;
  uint64_t v35 = 0;
  v84[0] = v5;
  uint64_t v109 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v105 = (void (**)(char *, void, uint64_t, uint64_t))(v5 + 56);
  uint64_t v107 = *(void *)(v5 + 72);
  uint64_t v36 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  long long v89 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v110 = v5 + 16;
  uint64_t v101 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
  unint64_t v86 = v33;
  uint64_t v108 = v13;
  uint64_t v99 = v4;
  unint64_t v100 = (unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  while (1)
  {
    uint64_t v112 = v35;
    v109(v31, v34 + v33, v4);
    uint64_t v104 = *v105;
    v104(v31, 0, 1, v4);
    uint64_t v39 = v111;
    sub_249F6E6C8(v106, v111, &qword_269751EC0);
    uint64_t v40 = *(int *)(v13 + 48);
    int v41 = v36;
    uint64_t v42 = (uint64_t)&v18[v40];
    sub_249F6E6C8((uint64_t)v31, (uint64_t)v18, &qword_269751EC0);
    sub_249F6E6C8(v39, v42, &qword_269751EC0);
    uint64_t v43 = v4;
    uint64_t v44 = *v41;
    if ((*v41)(v18, 1, v43) == 1) {
      break;
    }
    uint64_t v45 = (uint64_t)v18;
    uint64_t v46 = (uint64_t)v18;
    uint64_t v47 = v92;
    sub_249F6E6C8(v45, v92, &qword_269751EC0);
    if (v44((char *)v42, 1, v43) != 1)
    {
      uint64_t v94 = v44;
      uint64_t v48 = v90;
      (*v89)(v90, v42, v43);
      sub_24A03ED64(&qword_2697517A0, MEMORY[0x263F07508]);
      int v91 = sub_24A057358();
      uint64_t v49 = *v101;
      uint64_t v50 = v48;
      uint64_t v13 = v108;
      (*v101)(v50, v43);
      sub_249F6E790(v111, &qword_269751EC0);
      sub_249F6E790((uint64_t)v31, &qword_269751EC0);
      v49((char *)v47, v43);
      sub_249F6E790(v46, &qword_269751EC0);
      uint64_t v36 = v100;
      uint64_t v4 = v43;
      unint64_t v18 = (char *)v46;
      unint64_t v38 = (unint64_t)v112;
      if (v91) {
        goto LABEL_14;
      }
      goto LABEL_5;
    }
    sub_249F6E790(v111, &qword_269751EC0);
    sub_249F6E790((uint64_t)v31, &qword_269751EC0);
    (*v101)((char *)v47, v43);
    uint64_t v36 = v100;
    unint64_t v18 = (char *)v46;
    unint64_t v38 = (unint64_t)v112;
LABEL_4:
    sub_249F6E790((uint64_t)v18, &qword_269751F18);
    uint64_t v13 = v108;
    uint64_t v4 = v99;
LABEL_5:
    uint64_t v35 = (char *)(v38 + 1);
    v33 += v107;
    unint64_t v34 = v103;
    if (v102 == (uint64_t (**)(uint64_t, char *, uint64_t))v35)
    {
      unint64_t v51 = v103;
      swift_bridgeObjectRelease();
      return *(void *)(v51 + 16);
    }
  }
  sub_249F6E790(v39, &qword_269751EC0);
  sub_249F6E790((uint64_t)v31, &qword_269751EC0);
  unsigned int v37 = v44((char *)v42, 1, v43);
  uint64_t v36 = v41;
  unint64_t v38 = (unint64_t)v112;
  if (v37 != 1) {
    goto LABEL_4;
  }
  uint64_t v94 = v44;
  sub_249F6E790((uint64_t)v18, &qword_269751EC0);
  uint64_t v13 = v108;
  uint64_t v4 = v99;
LABEL_14:
  unint64_t v52 = v103;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v54 = v38 + 1;
  if (__OFADD__(v38, 1)) {
    goto LABEL_46;
  }
  if (v54 == *(void *)(v52 + 16)) {
    return v38;
  }
  uint64_t v55 = (char *)(v107 + v33);
  uint64_t result = swift_beginAccess();
  unint64_t v56 = v103;
  uint64_t v102 = (uint64_t (**)(uint64_t, char *, uint64_t))(v84[0] + 40);
  uint64_t v57 = v95;
  while (2)
  {
    if (v54 < *(void *)(v56 + 16))
    {
      unint64_t v111 = v54;
      uint64_t v112 = v55;
      uint64_t v60 = v13;
      uint64_t v61 = v98;
      uint64_t v62 = (void (*)(uint64_t, char *, uint64_t))v109;
      v109(v98, (unint64_t)&v55[v56], v4);
      uint64_t v63 = v93;
      v62(v93, v61, v4);
      v104((char *)v63, 0, 1, v4);
      sub_249F6E6C8(v106, v57, &qword_269751EC0);
      uint64_t v64 = *(int *)(v60 + 48);
      uint64_t v65 = v63;
      uint64_t v66 = (uint64_t)v96;
      uint64_t v67 = (uint64_t)&v96[v64];
      sub_249F6E6C8(v63, (uint64_t)v96, &qword_269751EC0);
      sub_249F6E6C8(v57, v67, &qword_269751EC0);
      uint64_t v68 = v4;
      uint64_t v69 = v4;
      unint64_t v70 = v94;
      if (v94((char *)v66, 1, v68) == 1)
      {
        sub_249F6E790(v57, &qword_269751EC0);
        sub_249F6E790(v65, &qword_269751EC0);
        unsigned int v71 = v70((char *)v67, 1, v69);
        unint64_t v72 = v111;
        uint64_t v4 = v69;
        uint64_t v58 = v112;
        if (v71 == 1)
        {
          sub_249F6E790((uint64_t)v96, &qword_269751EC0);
          uint64_t result = (*v101)(v98, v4);
          uint64_t v13 = v108;
          goto LABEL_20;
        }
LABEL_27:
        sub_249F6E790((uint64_t)v96, &qword_269751F18);
        uint64_t result = (*v101)(v98, v4);
        uint64_t v13 = v108;
      }
      else
      {
        uint64_t v73 = v85;
        sub_249F6E6C8(v66, v85, &qword_269751EC0);
        if (v70((char *)v67, 1, v69) == 1)
        {
          sub_249F6E790(v95, &qword_269751EC0);
          sub_249F6E790(v93, &qword_269751EC0);
          (*v101)((char *)v73, v69);
          unint64_t v72 = v111;
          uint64_t v4 = v69;
          uint64_t v58 = v112;
          goto LABEL_27;
        }
        uint64_t v81 = v90;
        (*v89)(v90, v67, v69);
        sub_24A03ED64(&qword_2697517A0, MEMORY[0x263F07508]);
        LODWORD(v103) = sub_24A057358();
        uint64_t v82 = *v101;
        uint64_t v83 = v81;
        uint64_t v13 = v108;
        (*v101)(v83, v69);
        sub_249F6E790(v95, &qword_269751EC0);
        sub_249F6E790(v93, &qword_269751EC0);
        v82((char *)v73, v69);
        sub_249F6E790(v66, &qword_269751EC0);
        uint64_t result = v82(v98, v69);
        unint64_t v72 = v111;
        uint64_t v4 = v69;
        uint64_t v58 = v112;
        if (v103)
        {
LABEL_20:
          unint64_t v54 = v72 + 1;
          unint64_t v56 = *v97;
          uint64_t v55 = &v58[v107];
          uint64_t v57 = v95;
          if (v54 == *(void *)(*v97 + 16)) {
            return v38;
          }
          continue;
        }
      }
      if (v72 != v38)
      {
        if ((v38 & 0x8000000000000000) != 0) {
          goto LABEL_41;
        }
        unint64_t v74 = *v97;
        unint64_t v75 = *(void *)(*v97 + 16);
        if (v38 >= v75) {
          goto LABEL_42;
        }
        uint64_t v76 = (void (*)(char *, char *, uint64_t))v109;
        unint64_t v77 = v72;
        uint64_t v78 = v38 * v107;
        uint64_t result = ((uint64_t (*)(char *, unint64_t, uint64_t))v109)(v88, v74 + v86 + v38 * v107, v4);
        if (v77 >= v75) {
          goto LABEL_43;
        }
        v76(v87, &v112[v74], v4);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v97 = v74;
        if ((result & 1) == 0)
        {
          uint64_t result = sub_249F9A758(v74);
          unint64_t v74 = result;
          *uint64_t v97 = result;
        }
        uint64_t v13 = v108;
        if (v38 >= *(void *)(v74 + 16)) {
          goto LABEL_44;
        }
        unint64_t v79 = v74 + v86 + v78;
        uint64_t v80 = *v102;
        uint64_t result = (*v102)(v79, v87, v4);
        unint64_t v72 = v111;
        if (v111 >= *(void *)(*v97 + 16)) {
          goto LABEL_45;
        }
        uint64_t v58 = v112;
        uint64_t result = v80((uint64_t)&v112[*v97], v88, v4);
      }
      if (__OFADD__(v38++, 1)) {
        goto LABEL_40;
      }
      goto LABEL_20;
    }
    break;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_24A03FCF8(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269751F10);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v24 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v25) {
      return swift_release();
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v25) {
        return swift_release();
      }
      unint64_t v21 = *(void *)(v24 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v25) {
          return swift_release();
        }
        unint64_t v21 = *(void *)(v24 + 8 * v12);
        if (!v21)
        {
          int64_t v12 = v20 + 3;
          if (v20 + 3 >= v25) {
            return swift_release();
          }
          unint64_t v21 = *(void *)(v24 + 8 * v12);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v14 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_5:
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = sub_24A056268();
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v6, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14, v16);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for ScheduledTask() - 8) + 72) * v14;
    uint64_t v19 = (uint64_t)&v6[*(int *)(v4 + 48)];
    sub_24A03EADC(v18, v19);
    a2(v6, v19);
    uint64_t result = sub_249F6E790((uint64_t)v6, &qword_269751F10);
  }
  int64_t v22 = v20 + 4;
  if (v22 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v25) {
      return swift_release();
    }
    unint64_t v21 = *(void *)(v24 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24A03FF80()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24A03FFAC()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_249F6C87C;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x270FA2498](sub_24A03BB04, 0, 0);
}

uint64_t sub_24A040058(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 48)) {
    return sub_24A03C5F4(a2);
  }
  else {
    return sub_24A03D05C(a2);
  }
}

uint64_t sub_24A04006C(uint64_t a1, uint64_t a2)
{
  return sub_24A040098(a1, a2, (uint64_t (*)(void))sub_249FBA990, type metadata accessor for ColorProviderPoint);
}

uint64_t sub_24A040098(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 - v9 > *(void *)(v6 + 24) >> 1) {
    uint64_t v6 = a3();
  }
  uint64_t v13 = *(void *)(a4(0) - 8);
  unint64_t v14 = v6 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  uint64_t v15 = *(void *)(v13 + 72);
  uint64_t v16 = v15 * a1;
  unint64_t v17 = v14 + v15 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v9) {
    goto LABEL_22;
  }
  uint64_t v19 = *(void *)(v6 + 16);
  uint64_t v20 = v19 - a2;
  if (__OFSUB__(v19, a2)) {
    goto LABEL_28;
  }
  if ((v20 & 0x8000000000000000) == 0)
  {
    if (v16 < v15 * a2 || v17 >= v14 + v15 * a2 + v20 * v15)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != v15 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v22 = *(void *)(v6 + 16);
    BOOL v23 = __OFADD__(v22, v10);
    uint64_t v24 = v22 - v9;
    if (!v23)
    {
      *(void *)(v6 + 16) = v24;
LABEL_22:
      *uint64_t v4 = v6;
      return result;
    }
    goto LABEL_29;
  }
LABEL_30:
  uint64_t result = sub_24A057C18();
  __break(1u);
  return result;
}

uint64_t objectdestroy_50Tm_0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A0402D4()
{
  uint64_t v2 = *(int **)(v0 + 32);
  long long v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *long long v3 = v1;
  v3[1] = sub_249F9C6C0;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_249F9C6C0;
  return v6();
}

uint64_t sub_24A0403F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24A04040C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t destroy for ColorProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);

  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
}

_OWORD *initializeWithCopy for ColorProvider(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for ColorProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t assignWithTake for ColorProvider(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorProvider(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ColorProvider()
{
  return &type metadata for ColorProvider;
}

uint64_t sub_24A0406C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  long long v4 = v3;
  uint64_t v8 = v3[3];
  uint64_t v9 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v8);
  sub_249F85694(a1, v8, a2, v9, (uint64_t *)v17);
  uint64_t v10 = v4[8];
  uint64_t v11 = v4[9];
  __swift_project_boxed_opaque_existential_1(v4 + 5, v10);
  sub_249F85694(a1, v10, a2, v11, (uint64_t *)v16);
  int64_t v12 = v4 + 10;
  uint64_t v13 = v4[13];
  uint64_t v14 = v4[14];
  __swift_project_boxed_opaque_existential_1(v12, v13);
  sub_249F85694(a1, v13, a2, v14, (uint64_t *)(a3 + 80));
  sub_249F7B5E8(v17, a3);
  return sub_249F7B5E8(v16, a3 + 40);
}

id sub_24A0407B8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  double v3 = (*(float (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  uint64_t v4 = v0[8];
  uint64_t v5 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v4);
  double v6 = (*(float (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v8 = v0[13];
  uint64_t v7 = v0[14];
  __swift_project_boxed_opaque_existential_1(v0 + 10, v8);
  double v9 = (*(float (**)(uint64_t, uint64_t))(v7 + 8))(v8, v7);
  id v10 = objc_allocWithZone(MEMORY[0x263F825C8]);

  return objc_msgSend(v10, sel_initWithHue_saturation_brightness_alpha_, v3, v6, v9, 1.0);
}

unint64_t sub_24A0408CC(uint64_t a1)
{
  unint64_t result = sub_24A0408F4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A0408F4()
{
  unint64_t result = qword_269751F38;
  if (!qword_269751F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751F38);
  }
  return result;
}

unint64_t sub_24A040948(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_24A0408F4();
  unint64_t result = sub_24A040978();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24A040978()
{
  unint64_t result = qword_269751F40;
  if (!qword_269751F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269751F40);
  }
  return result;
}

BOOL sub_24A0409CC(void *a1, void *a2)
{
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  double v6 = (*(float (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[9];
  __swift_project_boxed_opaque_existential_1(a1 + 5, v7);
  double v9 = (*(float (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  id v10 = a1 + 10;
  uint64_t v12 = a1[13];
  uint64_t v11 = a1[14];
  __swift_project_boxed_opaque_existential_1(v10, v12);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, v6, v9, (*(float (**)(uint64_t, uint64_t))(v11 + 8))(v12, v11), 1.0);
  uint64_t v14 = a2[3];
  uint64_t v15 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v14);
  double v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
  uint64_t v17 = a2[8];
  uint64_t v18 = a2[9];
  __swift_project_boxed_opaque_existential_1(a2 + 5, v17);
  double v19 = (*(float (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
  uint64_t v20 = a2 + 10;
  uint64_t v22 = a2[13];
  uint64_t v21 = a2[14];
  __swift_project_boxed_opaque_existential_1(v20, v22);
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithHue_saturation_brightness_alpha_, v16, v19, (*(float (**)(uint64_t, uint64_t))(v21 + 8))(v22, v21), 1.0);
  sub_24A040BC8();
  char v24 = sub_24A057938();

  return (v24 & 1) == 0;
}

unint64_t sub_24A040BC8()
{
  unint64_t result = qword_269751F48;
  if (!qword_269751F48)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269751F48);
  }
  return result;
}

uint64_t sub_24A040C08(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24A040C30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_24A040C5C(uint64_t a1)
{
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A04A164(v2, (uint64_t)v4, type metadata accessor for LocationAccuracy);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_24A049650((uint64_t)v4, type metadata accessor for LocationAccuracy);
    return 0x6E776F6E6B6E55;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v9 = sub_24A055D58();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

uint64_t sub_24A040E18()
{
  uint64_t v1 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v20 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_24A057A78();
  swift_bridgeObjectRelease();
  uint64_t v23 = 60;
  unint64_t v24 = 0xE100000000000000;
  id v7 = *v0;
  objc_msgSend(*v0, sel_coordinate);
  uint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697520A0);
  uint64_t v10 = swift_allocObject();
  long long v21 = xmmword_24A05A510;
  uint64_t v11 = MEMORY[0x263F8D538];
  *(_OWORD *)(v10 + 16) = xmmword_24A05A510;
  uint64_t v12 = MEMORY[0x263F8D5B8];
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  *(void *)(v10 + 32) = v9;
  sub_24A0573B8();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  objc_msgSend(v7, sel_coordinate);
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = v21;
  *(void *)(v15 + 56) = v11;
  *(void *)(v15 + 64) = v12;
  *(void *)(v15 + 32) = v14;
  sub_24A0573B8();
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  uint64_t v16 = type metadata accessor for CurrentLocation(0);
  sub_24A04A164(v22 + *(int *)(v16 + 20), (uint64_t)v3, type metadata accessor for LocationAccuracy);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_24A049650((uint64_t)v3, type metadata accessor for LocationAccuracy);
  }
  else
  {
    uint64_t v17 = v20;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v20, v3, v4);
    sub_24A055D58();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v17, v4);
  }
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  return v23;
}

uint64_t sub_24A041154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_249FCFCA0(0, (unint64_t *)&qword_269752090);
  if ((sub_24A057938() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);

  return sub_24A048F1C(a1 + v6, a2 + v6);
}

id sub_24A0411E8()
{
  uint64_t v0 = (objc_class *)type metadata accessor for LocationDataProvider();
  uint64_t v1 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = MEMORY[0x263F8EE80];
  v3.receiver = v1;
  v3.super_class = v0;
  id result = objc_msgSendSuper2(&v3, sel_init);
  qword_269752450 = (uint64_t)result;
  return result;
}

id sub_24A041250()
{
  uint64_t v1 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v1[14] = MEMORY[0x263F8EE80];
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t sub_24A0412AC(char *a1, char *a2)
{
  return sub_24A011E44(*a1, *a2);
}

uint64_t sub_24A0412B8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24A057C38();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_24A041318(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6C616E7265746E69;
  if (*v1) {
    uint64_t v2 = 0x4B72656874616577;
  }
  unint64_t v3 = 0xEA00000000004955;
  if (*v1) {
    unint64_t v3 = 0xEA00000000007469;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_24A041360()
{
  return sub_24A057E68();
}

uint64_t sub_24A0413EC()
{
  sub_24A057408();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A041464()
{
  return sub_24A057E68();
}

id sub_24A0414EC(char a1)
{
  int v2 = a1 & 1;
  unint64_t v3 = (uint64_t *)(v1 + 112);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 112);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_24A01562C(v2), (v6 & 1) != 0))
  {
    id v15 = *(id *)(*(void *)(v4 + 56) + 8 * v5);
    swift_endAccess();
    return v15;
  }
  else
  {
    swift_endAccess();
    id v8 = objc_allocWithZone((Class)type metadata accessor for LocationSource(0));
    if (v2)
    {
      uint64_t v10 = 0x800000024A0655E0;
      uint64_t v9 = 0xD000000000000011;
      int v11 = 0;
    }
    else
    {
      uint64_t v9 = 0xD000000000000035;
      uint64_t v10 = 0x800000024A065600;
      int v11 = 1;
    }
    id v12 = sub_24A041714(v9, v10, v11);
    swift_beginAccess();
    id v13 = v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_249FFF164((uint64_t)v13, v2, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v16;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v13;
  }
}

uint64_t sub_24A0416AC()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for LocationDataProvider()
{
  return self;
}

uint64_t sub_24A041708()
{
  return sub_249F74E8C(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

id sub_24A041714(uint64_t a1, uint64_t a2, int a3)
{
  int v36 = a3;
  uint64_t v39 = sub_24A057828();
  MEMORY[0x270FA5388](v39);
  unint64_t v38 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v37 = sub_24A057838();
  uint64_t v7 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v9 = &v35[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_24A0572B8();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752100);
  uint64_t v15 = swift_allocObject();
  type metadata accessor for CPUnfairLock();
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  *(void *)(v15 + 16) = v16;
  *(unsigned char *)(v15 + 24) = 0;
  *(void *)&v3[v14] = v15;
  uint64_t v17 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__location;
  uint64_t v18 = type metadata accessor for CurrentLocation(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 1, 1, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752108);
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = swift_allocObject();
  *(_DWORD *)(v20 + 16) = 0;
  v19[2] = v20;
  sub_24A04A2C4((uint64_t)v13, (uint64_t)v19 + *(void *)(*v19 + 96));
  *(void *)&v3[v17] = v19;
  uint64_t v21 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269752110);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v22 + *(void *)(*(void *)v22 + 96);
  uint64_t v24 = type metadata accessor for CurrentLocationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  uint64_t v25 = *(void *)(*(void *)v22 + 104);
  uint64_t v26 = swift_allocObject();
  *(_DWORD *)(v26 + 16) = 0;
  *(void *)(v22 + v25) = v26;
  *(void *)(v22 + *(void *)(*(void *)v22 + 112)) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v22 + *(void *)(*(void *)v22 + 120)) = 0;
  *(void *)&v3[v21] = v22;
  uint64_t v27 = self;
  uint64_t v28 = v3;
  id v29 = objc_msgSend((id)v27, sel_meters);
  sub_249FCFCA0(0, &qword_269751FB8);
  sub_24A055D48();
  *(void *)&v28[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion] = 0;
  *(void *)&v28[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager] = 1;
  uint64_t v30 = &v28[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source];
  *(void *)uint64_t v30 = a1;
  *((void *)v30 + 1) = a2;
  LOBYTE(v27) = v36;
  v30[16] = v36 & 1;
  unint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  sub_249F7AE5C();
  sub_24A057A78();
  swift_bridgeObjectRelease();
  unint64_t v41 = 0xD00000000000001FLL;
  unint64_t v42 = 0x800000024A065640;
  if (v27)
  {
    uint64_t v31 = (void *)sub_24A057368();
    id v32 = objc_msgSend(v31, sel_lastPathComponent);

    sub_24A0573A8();
    sub_249FDB2A8();
  }
  sub_249FCFCA0(0, (unint64_t *)&qword_2697515B0);
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A0572A8();
  (*(void (**)(unsigned char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F8F138], v37);
  unint64_t v41 = MEMORY[0x263F8EE78];
  sub_24A04A32C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752128);
  sub_24A04A384();
  sub_24A0579C8();
  *(void *)&v28[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue] = sub_24A057868();

  unint64_t v33 = (objc_class *)type metadata accessor for LocationSource(0);
  v40.receiver = v28;
  v40.super_class = v33;
  return objc_msgSendSuper2(&v40, sel_init);
}

void sub_24A041CCC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A056538();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16] & 1) == 0)
  {
    uint64_t v8 = *(void *)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 8];
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_249F6E6C8(v9, (uint64_t)v3, &qword_26B16FAA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_249FB8AA8((uint64_t)v7);
      sub_249F6E790((uint64_t)v3, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    uint64_t v10 = v0;
    uint64_t v11 = sub_24A056518();
    os_log_type_t v12 = sub_24A0577D8();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v26 = v4;
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = (void *)swift_slowAlloc();
      uint64_t v24 = v13;
      uint64_t v25 = v8;
      *(_DWORD *)id v13 = 138543362;
      uint64_t v27 = v10;
      uint64_t v14 = v10;
      sub_24A057978();
      uint64_t v15 = v23;
      *uint64_t v23 = v10;

      uint64_t v4 = v26;
      os_log_type_t v16 = v12;
      uint64_t v17 = v24;
      _os_log_impl(&dword_249F61000, v11, v16, "[%{public}@] Taking in-use assertion'", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v15, -1, -1);
      MEMORY[0x24C5BA360](v17, -1, -1);
    }
    else
    {

      uint64_t v11 = v10;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v18 = self;
    uint64_t v19 = (void *)sub_24A057368();
    uint64_t v20 = (void *)sub_24A057368();
    uint64_t v21 = (objc_class *)objc_msgSend(v18, sel_newAssertionForBundleIdentifier_withReason_, v19, v20);

    uint64_t v22 = *(Class *)((char *)&v10->isa
                   + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion);
    *(Class *)((char *)&v10->isa
             + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion) = v21;
  }
}

void *sub_24A042084()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A056538();
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)&double v6 = MEMORY[0x270FA5388](v4).n128_u64[0];
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion;
  uint64_t result = *(void **)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_inUseAssertion];
  if (result)
  {
    objc_msgSend(result, sel_invalidate, v6);
    uint64_t v11 = *(void **)&v0[v9];
    *(void *)&v0[v9] = 0;

    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v12 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_249F6E6C8(v12, (uint64_t)v3, &qword_26B16FAA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_249FB8AA8((uint64_t)v8);
      sub_249F6E790((uint64_t)v3, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
    }
    id v13 = v0;
    uint64_t v14 = sub_24A056518();
    os_log_type_t v15 = sub_24A0577D8();
    if (os_log_type_enabled(v14, v15))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v22 = v4;
      uint64_t v23 = v13;
      uint64_t v18 = (void *)v17;
      uint64_t v21 = v8;
      *(_DWORD *)os_log_type_t v16 = 138543362;
      uint64_t v19 = v13;
      uint64_t v8 = v21;
      sub_24A057978();
      *uint64_t v18 = v13;

      _os_log_impl(&dword_249F61000, v14, v15, "[%{public}@] Removing in-use assertion", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
      swift_arrayDestroy();
      uint64_t v20 = v18;
      uint64_t v4 = v22;
      MEMORY[0x24C5BA360](v20, -1, -1);
      MEMORY[0x24C5BA360](v16, -1, -1);
    }
    else
    {

      uint64_t v14 = v13;
    }

    return (void *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

void sub_24A0423C0(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520E8);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697520F0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v42 = (uint64_t)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v37 = (char *)&v32 - v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520E0);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  os_log_type_t v16 = (char *)&v32 - v15;
  uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream];
  uint64_t v18 = (os_unfair_lock_s *)(*(void *)(v17 + *(void *)(*(void *)v17 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  uint64_t v19 = v1;
  os_unfair_lock_lock(v18);
  uint64_t v20 = *(void *)(*(void *)v17 + 120);
  char v21 = *(unsigned char *)(v17 + v20);
  if ((v21 & 1) == 0) {
    *(unsigned char *)(v17 + v20) = 1;
  }
  os_unfair_lock_unlock(v18);
  swift_endAccess();
  uint64_t v22 = type metadata accessor for CurrentLocationResult(0);
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v16, 1, 1, v22);
  if ((v21 & 1) == 0)
  {
    sub_24A042D98((uint64_t)v13);
    v23(v13, 0, 1, v22);
    sub_24A003F9C((uint64_t)v13, (uint64_t)v16, &qword_2697520E0);
  }
  unint64_t v38 = v19;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F8);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v25;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v36 = v25 + 56;
  v35(v10, 1, 1, v24);
  swift_beginAccess();
  os_unfair_lock_lock(v18);
  uint64_t v27 = swift_endAccess();
  __n128 v28 = MEMORY[0x270FA5388](v27);
  *(&v32 - 2) = v17;
  *(&v32 - 1) = v29;
  uint64_t v33 = v29;
  (*(void (**)(char *, void, uint64_t, __n128))(v40 + 104))(v39, *MEMORY[0x263F8F580], v41, v28);
  uint64_t v30 = (uint64_t)v37;
  sub_24A057678();
  v35((char *)v30, 0, 1, v24);
  sub_24A003F9C(v30, (uint64_t)v10, (uint64_t *)&unk_2697520F0);
  swift_beginAccess();
  os_unfair_lock_unlock(v18);
  swift_endAccess();
  uint64_t v31 = v42;
  sub_249F6E6C8((uint64_t)v10, v42, (uint64_t *)&unk_2697520F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v31, 1, v24) == 1)
  {

    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v34, v31, v24);
    sub_249F6E790((uint64_t)v10, (uint64_t *)&unk_2697520F0);
    sub_249F6E790(v33, &qword_2697520E0);
    swift_release();
  }
}

id sub_24A0428A4()
{
  uint64_t v1 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource____lazy_storage___locationManager];
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_24A042914(v0);
    uint64_t v4 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v3;
    id v5 = v3;
    sub_24A04A29C(v4);
  }
  sub_24A04A2AC(v2);
  return v3;
}

id sub_24A042914(unsigned char *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A056538();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v6) = a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16];
  uint64_t v32 = v9;
  uint64_t v33 = v8;
  if (v6)
  {
    sub_249F7AE5C();
    if (sub_24A019D30())
    {
      sub_249FDB2A8();
      id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A60]), sel_init);
      if (v10) {
        return v10;
      }
    }
    else
    {
      os_log_type_t v16 = *(void **)&a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
      id v17 = objc_allocWithZone(MEMORY[0x263F00A60]);
      uint64_t v18 = a1;
      id v19 = v16;
      uint64_t v20 = (void *)sub_24A057368();
      sub_249FDB2A8();
      id v10 = objc_msgSend(v17, sel_initWithEffectiveBundlePath_delegate_onQueue_, v20, v18, v19);

      if (v10) {
        return v10;
      }
    }
  }
  else
  {
    uint64_t v11 = *(void **)&a1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
    id v12 = objc_allocWithZone(MEMORY[0x263F00A60]);
    sub_249F7AE5C();
    id v13 = v11;
    uint64_t v14 = a1;
    uint64_t v15 = (void *)sub_24A057368();
    sub_249FDB2A8();
    id v10 = objc_msgSend(v12, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v15, v14, v13);

    if (v10) {
      return v10;
    }
  }
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_249F6E6C8(v21, (uint64_t)v4, &qword_26B16FAA8);
  uint64_t v23 = v32;
  uint64_t v22 = v33;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v4, 1, v33) == 1)
  {
    sub_249FB8AA8((uint64_t)v7);
    sub_249F6E790((uint64_t)v4, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v7, v4, v22);
  }
  uint64_t v24 = a1;
  uint64_t v25 = sub_24A056518();
  os_log_type_t v26 = sub_24A0577C8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    __n128 v28 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 138543362;
    uint64_t v34 = v24;
    uint64_t v29 = v24;
    sub_24A057978();
    void *v28 = v24;

    uint64_t v22 = v33;
    _os_log_impl(&dword_249F61000, v25, v26, "[%{public}@] Error initing location manager'", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    uint64_t v30 = v28;
    uint64_t v23 = v32;
    MEMORY[0x24C5BA360](v30, -1, -1);
    MEMORY[0x24C5BA360](v27, -1, -1);
  }
  else
  {

    uint64_t v25 = v24;
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v22);
  return 0;
}

uint64_t sub_24A042D98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v18 - v6;
  uint64_t v8 = type metadata accessor for CurrentLocationResult(0);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  id v10 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = v7;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_24A04A204;
  *(void *)(v12 + 24) = v11;
  aBlock[4] = sub_24A03F000;
  void aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A040C30;
  aBlock[3] = &block_descriptor_43_0;
  id v13 = _Block_copy(aBlock);
  uint64_t v14 = v10;
  uint64_t v15 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v14, v13);

  _Block_release(v13);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    sub_249F6E6C8((uint64_t)v7, (uint64_t)v4, &qword_2697520E0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8);
    if (result != 1)
    {
      sub_24A04A234((uint64_t)v4, v19, type metadata accessor for CurrentLocationResult);
      sub_249F6E790((uint64_t)v7, &qword_2697520E0);
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

void sub_24A04303C(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_24A04398C())
  {
    id v6 = sub_24A0428A4();
    if (v6 && (uint64_t v7 = v6, v8 = objc_msgSend(v6, sel_location), v7, v8))
    {
      objc_msgSend(v8, sel_horizontalAccuracy);
      id v9 = objc_msgSend(self, sel_meters);
      sub_249FCFCA0(0, &qword_269751FB8);
      sub_24A055D48();
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 0, 1, v10);
      sub_249F6E790((uint64_t)a2, &qword_2697520E0);
      uint64_t v11 = type metadata accessor for CurrentLocation(0);
      sub_24A04A234((uint64_t)v5, (uint64_t)a2 + *(int *)(v11 + 20), type metadata accessor for LocationAccuracy);
      *a2 = v8;
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(a2, 0, 1, v11);
      uint64_t v12 = type metadata accessor for CurrentLocationResult(0);
      uint64_t v13 = v12;
      *((unsigned char *)a2 + *(int *)(v12 + 20)) = 2;
    }
    else
    {
      sub_249F6E790((uint64_t)a2, &qword_2697520E0);
      uint64_t v15 = type metadata accessor for CurrentLocation(0);
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 1, 1, v15);
      uint64_t v12 = type metadata accessor for CurrentLocationResult(0);
      uint64_t v13 = v12;
      *((unsigned char *)a2 + *(int *)(v12 + 20)) = 1;
    }
  }
  else
  {
    sub_249F6E790((uint64_t)a2, &qword_2697520E0);
    uint64_t v14 = type metadata accessor for CurrentLocation(0);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 1, 1, v14);
    uint64_t v12 = type metadata accessor for CurrentLocationResult(0);
    uint64_t v13 = v12;
    *((unsigned char *)a2 + *(int *)(v12 + 20)) = 0;
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a2, 0, 1, v13);
  sub_24A04333C();
}

void sub_24A04333C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A0572C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = MEMORY[0x270FA5388](v4);
  id v8 = (uint64_t *)((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = *(void **)(v0 + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue);
  *id v8 = v9;
  (*(void (**)(void *, void, uint64_t, __n128))(v5 + 104))(v8, *MEMORY[0x263F8F0E0], v4, v6);
  id v10 = v9;
  LOBYTE(v9) = sub_24A0572D8();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v8, v4);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    return;
  }
  id v11 = sub_24A0428A4();
  if (!v11)
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v3, 1, 1, v19);
    sub_24A044B2C((uint64_t)v3);
LABEL_9:
    sub_249F6E790((uint64_t)v3, &qword_2697520C8);
    return;
  }
  uint64_t v12 = v11;
  if ((sub_24A04398C() & 1) == 0)
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v3, 1, 1, v20);
    sub_24A044B2C((uint64_t)v3);

    goto LABEL_9;
  }
  uint64_t v13 = OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating;
  uint64_t v14 = *(void *)(v0
                  + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating);
  uint64_t v15 = (os_unfair_lock_s *)(*(void *)(v14 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v15);
  swift_beginAccess();
  char v16 = *(unsigned char *)(v14 + 24);
  os_unfair_lock_unlock(v15);
  swift_endAccess();
  swift_release();
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = *(void *)(v0 + v13);
    uint64_t v18 = (os_unfair_lock_s *)(*(void *)(v17 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v18);
    swift_beginAccess();
    *(unsigned char *)(v17 + 24) = 1;
    os_unfair_lock_unlock(v18);
    swift_endAccess();
    swift_release();
    objc_msgSend(v12, sel_startUpdatingLocation);
  }
}

void sub_24A043644()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A056538();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = sub_24A0428A4();
  if (v8)
  {
    id v9 = v8;
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
    swift_beginAccess();
    sub_249F6E6C8(v10, (uint64_t)v3, &qword_26B16FAA8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_249FB8AA8((uint64_t)v7);
      sub_249F6E790((uint64_t)v3, &qword_26B16FAA8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    }
    id v11 = v0;
    uint64_t v12 = sub_24A056518();
    os_log_type_t v13 = sub_24A0577D8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v21 = v4;
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      uint64_t v20 = v14;
      *(_DWORD *)uint64_t v14 = 138543362;
      uint64_t v22 = v11;
      uint64_t v15 = v11;
      sub_24A057978();
      char v16 = v19;
      *uint64_t v19 = v11;

      uint64_t v17 = v20;
      uint64_t v4 = v21;
      _os_log_impl(&dword_249F61000, v12, v13, "[%{public}@] Requesting location authorization", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v16, -1, -1);
      MEMORY[0x24C5BA360](v17, -1, -1);
    }
    else
    {

      uint64_t v12 = v11;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    objc_msgSend(v9, sel_requestWhenInUseAuthorizationWithPrompt);
  }
}

uint64_t sub_24A04398C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v86 - v5;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v86 - v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v86 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v86 - v14;
  uint64_t v16 = sub_24A056538();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v90 = v16;
  uint64_t v91 = v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v87 = (uint64_t)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v86 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v86 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v86 - v26;
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v86 - v29;
  id v89 = v0;
  uint64_t result = (uint64_t)sub_24A0428A4();
  if (result)
  {
    uint64_t v88 = result;
    switch(objc_msgSend((id)result, sel__authorizationStatus))
    {
      case 0u:
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v32 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_249F6E6C8(v32, (uint64_t)v3, &qword_26B16FAA8);
        uint64_t v33 = v90;
        uint64_t v34 = v91;
        int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v91 + 48))(v3, 1, v90);
        uint64_t v36 = v87;
        if (v35 == 1)
        {
          sub_249FB8AA8(v87);
          sub_249F6E790((uint64_t)v3, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v87, v3, v33);
        }
        uint64_t v49 = v33;
        uint64_t v50 = v89;
        unint64_t v51 = sub_24A056518();
        os_log_type_t v52 = sub_24A0577D8();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = (uint8_t *)swift_slowAlloc();
          unint64_t v54 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v53 = 138543362;
          uint64_t v92 = v50;
          uint64_t v55 = v50;
          sub_24A057978();
          *unint64_t v54 = v50;

          _os_log_impl(&dword_249F61000, v51, v52, "[%{public}@] Location Permissions - notDetermined", v53, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
          swift_arrayDestroy();
          unint64_t v56 = v54;
          uint64_t v34 = v91;
          MEMORY[0x24C5BA360](v56, -1, -1);
          uint64_t v57 = v53;
          uint64_t v36 = v87;
          MEMORY[0x24C5BA360](v57, -1, -1);
        }
        else
        {

          unint64_t v51 = v50;
        }

        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v49);
        goto LABEL_40;
      case 1u:
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v37 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_249F6E6C8(v37, (uint64_t)v6, &qword_26B16FAA8);
        uint64_t v39 = v90;
        uint64_t v38 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v6, 1, v90) == 1)
        {
          sub_249FB8AA8((uint64_t)v21);
          sub_249F6E790((uint64_t)v6, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v21, v6, v39);
        }
        uint64_t v58 = v89;
        uint64_t v59 = sub_24A056518();
        os_log_type_t v60 = sub_24A0577D8();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = (uint8_t *)swift_slowAlloc();
          uint64_t v62 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v61 = 138543362;
          uint64_t v92 = v58;
          uint64_t v63 = v58;
          sub_24A057978();
          *uint64_t v62 = v58;

          uint64_t v39 = v90;
          _os_log_impl(&dword_249F61000, v59, v60, "[%{public}@] Location Permissions - restricted", v61, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
          swift_arrayDestroy();
          uint64_t v64 = v62;
          uint64_t v38 = v91;
          MEMORY[0x24C5BA360](v64, -1, -1);
          MEMORY[0x24C5BA360](v61, -1, -1);
        }
        else
        {

          uint64_t v59 = v58;
        }

        (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v39);
        goto LABEL_45;
      case 2u:
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v40 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_249F6E6C8(v40, (uint64_t)v9, &qword_26B16FAA8);
        uint64_t v42 = v90;
        uint64_t v41 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v9, 1, v90) == 1)
        {
          sub_249FB8AA8((uint64_t)v24);
          sub_249F6E790((uint64_t)v9, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v24, v9, v42);
        }
        uint64_t v65 = v89;
        uint64_t v66 = sub_24A056518();
        os_log_type_t v67 = sub_24A0577D8();
        if (os_log_type_enabled(v66, v67))
        {
          uint64_t v68 = (uint8_t *)swift_slowAlloc();
          uint64_t v69 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v68 = 138543362;
          uint64_t v92 = v65;
          unint64_t v70 = v65;
          sub_24A057978();
          void *v69 = v65;

          uint64_t v42 = v90;
          _os_log_impl(&dword_249F61000, v66, v67, "[%{public}@] Location Permissions - denied", v68, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
          swift_arrayDestroy();
          unsigned int v71 = v69;
          uint64_t v41 = v91;
          MEMORY[0x24C5BA360](v71, -1, -1);
          MEMORY[0x24C5BA360](v68, -1, -1);
        }
        else
        {

          uint64_t v66 = v65;
        }

        (*(void (**)(char *, uint64_t))(v41 + 8))(v24, v42);
        goto LABEL_45;
      case 3u:
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v43 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_249F6E6C8(v43, (uint64_t)v15, &qword_26B16FAA8);
        uint64_t v45 = v90;
        uint64_t v44 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v15, 1, v90) == 1)
        {
          sub_249FB8AA8((uint64_t)v30);
          sub_249F6E790((uint64_t)v15, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v30, v15, v45);
        }
        unint64_t v72 = v89;
        uint64_t v73 = sub_24A056518();
        os_log_type_t v74 = sub_24A0577D8();
        if (os_log_type_enabled(v73, v74))
        {
          unint64_t v75 = (uint8_t *)swift_slowAlloc();
          uint64_t v76 = (void *)swift_slowAlloc();
          *(_DWORD *)unint64_t v75 = 138543362;
          uint64_t v92 = v72;
          unint64_t v77 = v72;
          sub_24A057978();
          *uint64_t v76 = v72;

          uint64_t v45 = v90;
          _os_log_impl(&dword_249F61000, v73, v74, "[%{public}@] Location Permissions - always", v75, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
          swift_arrayDestroy();
          MEMORY[0x24C5BA360](v76, -1, -1);
          MEMORY[0x24C5BA360](v75, -1, -1);
          unint64_t v72 = v88;
        }
        else
        {

          uint64_t v73 = v72;
        }
        uint64_t v85 = v91;

        (*(void (**)(char *, uint64_t))(v85 + 8))(v30, v45);
        goto LABEL_50;
      case 4u:
        if (qword_26B16F9B8 != -1) {
          swift_once();
        }
        uint64_t v46 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
        swift_beginAccess();
        sub_249F6E6C8(v46, (uint64_t)v12, &qword_26B16FAA8);
        uint64_t v48 = v90;
        uint64_t v47 = v91;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v91 + 48))(v12, 1, v90) == 1)
        {
          sub_249FB8AA8((uint64_t)v27);
          sub_249F6E790((uint64_t)v12, &qword_26B16FAA8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v27, v12, v48);
        }
        uint64_t v78 = v89;
        unint64_t v79 = sub_24A056518();
        os_log_type_t v80 = sub_24A0577D8();
        if (os_log_type_enabled(v79, v80))
        {
          uint64_t v81 = (uint8_t *)swift_slowAlloc();
          uint64_t v82 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v81 = 138543362;
          uint64_t v92 = v78;
          uint64_t v83 = v78;
          sub_24A057978();
          *uint64_t v82 = v78;

          uint64_t v48 = v90;
          _os_log_impl(&dword_249F61000, v79, v80, "[%{public}@] Location Permissions - whenInUse", v81, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
          swift_arrayDestroy();
          uint64_t v84 = v82;
          uint64_t v47 = v91;
          MEMORY[0x24C5BA360](v84, -1, -1);
          MEMORY[0x24C5BA360](v81, -1, -1);
        }
        else
        {

          unint64_t v79 = v78;
        }

        (*(void (**)(char *, uint64_t))(v47 + 8))(v27, v48);
LABEL_50:
        uint64_t result = 1;
        break;
      default:
LABEL_40:
        sub_24A043644();

LABEL_45:
        uint64_t result = 0;
        break;
    }
  }
  return result;
}

unint64_t sub_24A0446CC()
{
  sub_24A057A78();
  swift_bridgeObjectRelease();
  char v1 = *(unsigned char *)(v0 + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_source + 16);
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();
  if (v1)
  {
    uint64_t v2 = (void *)sub_24A057368();
    id v3 = objc_msgSend(v2, sel_lastPathComponent);

    sub_24A0573A8();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_24A057438();
  swift_bridgeObjectRelease();
  sub_24A057438();

  sub_24A057438();
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

id sub_24A0448A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationSource(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A0449CC()
{
  return type metadata accessor for LocationSource(0);
}

uint64_t type metadata accessor for LocationSource(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269751FA0);
}

void sub_24A0449F4()
{
  sub_24A044AC4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_24A044AC4()
{
  if (!qword_269751FB0)
  {
    sub_249FCFCA0(255, &qword_269751FB8);
    unint64_t v0 = sub_24A055D68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269751FB0);
    }
  }
}

uint64_t sub_24A044B2C(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v76 = (char *)a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v70 = (uint64_t)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A056538();
  uint64_t v73 = *(void *)(v5 - 8);
  os_log_type_t v74 = (char *)v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v72 = (uint64_t)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = type metadata accessor for CurrentLocationResult(0);
  MEMORY[0x270FA5388](v78);
  uint64_t v80 = (uint64_t)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CurrentLocation(0);
  uint64_t v79 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unsigned int v71 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (void **)((char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v69 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char **)((char *)&v69 - v17);
  MEMORY[0x270FA5388](v19);
  unint64_t v77 = (void **)((char *)&v69 - v20);
  uint64_t v21 = sub_24A0572C8();
  uint64_t v22 = *(void *)(v21 - 8);
  __n128 v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char **)((char *)&v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v26 = *(void **)&v2[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  void *v25 = v26;
  (*(void (**)(void *, void, uint64_t, __n128))(v22 + 104))(v25, *MEMORY[0x263F8F0E0], v21, v23);
  id v27 = v26;
  LOBYTE(v26) = sub_24A0572D8();
  uint64_t v29 = *(void (**)(void *, uint64_t))(v22 + 8);
  uint64_t v28 = (char *)(v22 + 8);
  v29(v25, v21);
  if ((v26 & 1) == 0)
  {
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v30 = *(void *)&v2[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating];
  uint64_t v31 = (os_unfair_lock_s *)(*(void *)(v30 + 16) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v31);
  swift_beginAccess();
  *(unsigned char *)(v30 + 24) = 0;
  os_unfair_lock_unlock(v31);
  swift_endAccess();
  swift_release();
  id v32 = sub_24A0428A4();
  objc_msgSend(v32, sel_stopUpdatingLocation);

  sub_249F6E6C8((uint64_t)v76, (uint64_t)v12, &qword_2697520C8);
  int v33 = (*(uint64_t (**)(void **, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  uint64_t v28 = v2;
  uint64_t v75 = v8;
  if (v33 != 1)
  {
    uint64_t v41 = *(int *)(v13 + 48);
    uint64_t v42 = (char *)v77 + v41;
    uint64_t v43 = (char *)v12 + v41;
    uint64_t v44 = *v12;
    *unint64_t v77 = *v12;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v46 = *(void *)(v45 - 8);
    uint64_t v76 = v28;
    uint64_t v73 = *(void *)(v46 + 32);
    ((void (*)(char *, char *, uint64_t))v73)(v42, v43, v45);
    os_log_type_t v74 = (char *)v18 + *(int *)(v13 + 48);
    *uint64_t v18 = v44;
    uint64_t v47 = *(void (**)(void))(v46 + 16);
    v47();
    uint64_t v48 = &v71[*(int *)(v8 + 20)];
    uint64_t v49 = v71;
    uint64_t v50 = &v69[*(int *)(v13 + 48)];
    ((void (*)(char *, char *, uint64_t))v47)(v50, v42, v45);
    ((void (*)(char *, char *, uint64_t))v73)(v48, v50, v45);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56))(v48, 0, 1, v45);
    uint64_t v51 = (uint64_t)v49;
    *uint64_t v49 = v44;
    os_log_type_t v52 = *(void (**)(char *, uint64_t))(v46 + 8);
    id v53 = v44;
    v52(v74, v45);
    uint64_t v54 = *(void *)&v76[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream];
    uint64_t v55 = v80;
    sub_24A04A164(v51, v80, type metadata accessor for CurrentLocation);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v55, 0, 1, v75);
    *(unsigned char *)(v55 + *(int *)(v78 + 20)) = 2;
    unint64_t v56 = (os_unfair_lock_s *)(*(void *)(v54 + *(void *)(*(void *)v54 + 104)) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v56);
    swift_endAccess();
    sub_249FF5F04(v55);
    swift_beginAccess();
    os_unfair_lock_unlock(v56);
    swift_endAccess();
    swift_release();
    sub_24A049650(v55, type metadata accessor for CurrentLocationResult);
    sub_24A049650(v51, type metadata accessor for CurrentLocation);
    return sub_249F6E790((uint64_t)v77, &qword_2697520D0);
  }
  sub_249F6E790((uint64_t)v12, &qword_2697520C8);
  if (qword_26B16F9B8 != -1) {
    goto LABEL_13;
  }
LABEL_4:
  uint64_t v34 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  uint64_t v35 = v34;
  uint64_t v36 = v70;
  sub_249F6E6C8(v35, v70, &qword_26B16FAA8);
  uint64_t v38 = v73;
  uint64_t v37 = v74;
  int v39 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(v73 + 48))(v36, 1, v74);
  uint64_t v40 = v72;
  if (v39 == 1)
  {
    sub_249FB8AA8(v72);
    sub_249F6E790(v36, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, char *))(v38 + 32))(v72, v36, v37);
  }
  uint64_t v58 = v28;
  uint64_t v59 = sub_24A056518();
  os_log_type_t v60 = sub_24A0577D8();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v61 = 138543362;
    uint64_t v81 = v58;
    uint64_t v63 = v58;
    uint64_t v40 = v72;
    sub_24A057978();
    *uint64_t v62 = v58;

    _os_log_impl(&dword_249F61000, v59, v60, "[%{public}@] No location found. Return fallback location", v61, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    uint64_t v64 = v62;
    uint64_t v38 = v73;
    MEMORY[0x24C5BA360](v64, -1, -1);
    uint64_t v65 = v61;
    uint64_t v37 = v74;
    MEMORY[0x24C5BA360](v65, -1, -1);
  }
  else
  {

    uint64_t v59 = v58;
  }

  (*(void (**)(uint64_t, char *))(v38 + 8))(v40, v37);
  uint64_t v66 = *(uint64_t *)((char *)&v58->isa
                   + OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_stream);
  uint64_t v67 = v80;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(v80, 1, 1, v75);
  *(unsigned char *)(v67 + *(int *)(v78 + 20)) = 0;
  uint64_t v68 = (os_unfair_lock_s *)(*(void *)(v66 + *(void *)(*(void *)v66 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v68);
  swift_endAccess();
  sub_249FF5F04(v67);
  swift_beginAccess();
  os_unfair_lock_unlock(v68);
  swift_endAccess();
  swift_release();
  return sub_24A049650(v67, type metadata accessor for CurrentLocationResult);
}

void sub_24A04551C(char *a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v67 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v68 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v65 - v11;
  uint64_t v13 = sub_24A056538();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v69 = v13;
  uint64_t v70 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v65 - v18;
  uint64_t v20 = sub_24A0572C8();
  uint64_t v21 = *(void *)(v20 - 8);
  __n128 v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (uint64_t *)((char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = *(void **)&v2[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  *uint64_t v24 = v25;
  (*(void (**)(void *, void, uint64_t, __n128))(v21 + 104))(v24, *MEMORY[0x263F8F0E0], v20, v22);
  id v26 = v25;
  LOBYTE(v25) = sub_24A0572D8();
  (*(void (**)(void *, uint64_t))(v21 + 8))(v24, v20);
  if (v25)
  {
    uint64_t v27 = *(void *)&v3[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource__isLocationUpdating];
    uint64_t v28 = (os_unfair_lock_s *)(*(void *)(v27 + 16) + 16);
    swift_beginAccess();
    swift_retain();
    os_unfair_lock_lock(v28);
    swift_beginAccess();
    *(unsigned char *)(v27 + 24) = 1;
    os_unfair_lock_unlock(v28);
    swift_endAccess();
    swift_release();
    if (!(a2 >> 62))
    {
      uint64_t v29 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v29) {
        goto LABEL_4;
      }
LABEL_22:
      swift_bridgeObjectRelease();
      if (qword_26B16F9B8 != -1) {
        swift_once();
      }
      uint64_t v54 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
      swift_beginAccess();
      sub_249F6E6C8(v54, (uint64_t)v9, &qword_26B16FAA8);
      uint64_t v56 = v69;
      uint64_t v55 = v70;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v70 + 48))(v9, 1, v69) == 1)
      {
        sub_249FB8AA8((uint64_t)v16);
        sub_249F6E790((uint64_t)v9, &qword_26B16FAA8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v16, v9, v56);
      }
      uint64_t v57 = v3;
      uint64_t v58 = sub_24A056518();
      os_log_type_t v59 = sub_24A0577A8();
      if (os_log_type_enabled(v58, v59))
      {
        os_log_type_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = (void *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v60 = 138543362;
        uint64_t v72 = v57;
        uint64_t v62 = v57;
        uint64_t v56 = v69;
        sub_24A057978();
        void *v61 = v57;

        uint64_t v55 = v70;
        _os_log_impl(&dword_249F61000, v58, v59, "[%{public}@] singleLocationUpdate ends (no location)", v60, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
        swift_arrayDestroy();
        MEMORY[0x24C5BA360](v61, -1, -1);
        MEMORY[0x24C5BA360](v60, -1, -1);
      }
      else
      {

        uint64_t v58 = v57;
      }

      (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v56);
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
      uint64_t v64 = (uint64_t)v68;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v68, 1, 1, v63);
      sub_24A044B2C(v64);
      uint64_t v53 = v64;
      goto LABEL_31;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_24A057BD8();
  if (!v29) {
    goto LABEL_22;
  }
LABEL_4:
  unint64_t v30 = v29 - 1;
  if (__OFSUB__(v29, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
LABEL_33:
    uint64_t v16 = (char *)MEMORY[0x24C5B92B0](v30, a2);
    uint64_t v31 = v70;
    goto LABEL_9;
  }
  uint64_t v31 = v70;
  if ((v30 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v30 < *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v16 = (char *)*(id *)(a2 + 8 * v30 + 32);
LABEL_9:
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v67, sel__limitsPrecision) & 1) == 0)
    {
      objc_msgSend(v16, sel_horizontalAccuracy);
      if (v32 > 1500.0)
      {

        return;
      }
    }
    if (qword_26B16F9B8 == -1) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
  __break(1u);
LABEL_36:
  swift_once();
LABEL_13:
  uint64_t v33 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_249F6E6C8(v33, (uint64_t)v12, &qword_26B16FAA8);
  uint64_t v34 = v69;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v12, 1, v69) == 1)
  {
    sub_249FB8AA8((uint64_t)v19);
    sub_249F6E790((uint64_t)v12, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v19, v12, v34);
  }
  uint64_t v35 = v3;
  uint64_t v36 = v16;
  uint64_t v37 = v35;
  uint64_t v38 = v36;
  int v39 = sub_24A056518();
  os_log_type_t v40 = sub_24A0577A8();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v67 = v19;
    uint64_t v43 = (void *)v42;
    uint64_t v66 = swift_slowAlloc();
    uint64_t v71 = (uint64_t)v37;
    uint64_t v72 = v66;
    *(_DWORD *)uint64_t v41 = 138543619;
    uint64_t v44 = v37;
    sub_24A057978();
    *uint64_t v43 = v37;

    *(_WORD *)(v41 + 12) = 2081;
    uint64_t v71 = (uint64_t)v38;
    sub_249FCFCA0(0, &qword_2697520D8);
    uint64_t v45 = v38;
    uint64_t v46 = sub_24A0573D8();
    uint64_t v71 = sub_249F782DC(v46, v47, (uint64_t *)&v72);
    sub_24A057978();

    uint64_t v48 = v68;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F61000, v39, v40, "[%{public}@] singleLocationUpdate ends (location: %{private}s)", (uint8_t *)v41, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v43, -1, -1);
    uint64_t v49 = v66;
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v49, -1, -1);
    MEMORY[0x24C5BA360](v41, -1, -1);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v69);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v34);
    uint64_t v48 = v68;
  }
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
  *(void *)uint64_t v48 = v38;
  uint64_t v51 = v38;
  objc_msgSend(v51, sel_horizontalAccuracy);
  id v52 = objc_msgSend(self, sel_meters);
  sub_249FCFCA0(0, &qword_269751FB8);
  sub_24A055D48();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v48, 0, 1, v50);
  sub_24A044B2C((uint64_t)v48);

  uint64_t v53 = (uint64_t)v48;
LABEL_31:
  sub_249F6E790(v53, &qword_2697520C8);
}

id sub_24A046088()
{
  type metadata accessor for PlacemarkNameLookup();
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  *(void *)(v0 + 112) = result;
  qword_269752458 = v0;
  return result;
}

uint64_t sub_24A0460E0(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  v2[22] = swift_task_alloc();
  uint64_t v3 = sub_24A056538();
  v2[23] = v3;
  v2[24] = *(void *)(v3 - 8);
  v2[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A0461D0, v1, 0);
}

uint64_t sub_24A0461D0()
{
  uint64_t v1 = v0[20];
  objc_super v2 = *(void **)(v0[21] + 112);
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_24A0462D4;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24A0467E4;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v2, sel_reverseGeocodeLocation_completionHandler_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24A0462D4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  uint64_t v3 = *(void *)(v1 + 168);
  if (v2) {
    uint64_t v4 = sub_24A046514;
  }
  else {
    uint64_t v4 = sub_24A0463F4;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

void sub_24A0463F4()
{
  unint64_t v1 = *(void *)(v0 + 144);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_24A057BD8();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v3 = (id)MEMORY[0x24C5B92B0](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v3 = *(id *)(v1 + 32);
  }
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24A0496B0(v4);
  uint64_t v2 = v6;

LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
  v7(v5, v2);
}

uint64_t sub_24A046514()
{
  swift_willThrow();
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  uint64_t v4 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_249F6E6C8(v4, v3, &qword_26B16FAA8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = v0[22];
    sub_249FB8AA8(v0[25]);
    sub_249F6E790(v5, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[24] + 32))(v0[25], v0[22], v0[23]);
  }
  uint64_t v6 = (void *)v0[26];
  id v7 = v6;
  id v8 = v6;
  uint64_t v9 = sub_24A056518();
  os_log_type_t v10 = sub_24A0577A8();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = (void *)v0[26];
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138477827;
    id v15 = v12;
    uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v16;
    sub_24A057978();
    *uint64_t v14 = v16;

    _os_log_impl(&dword_249F61000, v9, v10, "Error lookup name for location %{private}@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v14, -1, -1);
    MEMORY[0x24C5BA360](v13, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void, void))v0[1];
  return v17(0, 0);
}

uint64_t sub_24A0467E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_249FCFCA0(0, &qword_2697520B8);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_24A057568();
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_24A0468C0()
{
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t type metadata accessor for PlacemarkNameLookup()
{
  return self;
}

ValueMetadata *type metadata accessor for LocationSource.Source()
{
  return &type metadata for LocationSource.Source;
}

char *sub_24A04692C(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    os_log_type_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for CurrentLocation(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      BOOL v11 = *a2;
      *(void *)a1 = *a2;
      uint64_t v12 = *(int *)(v7 + 20);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = (char *)a2 + v12;
      id v15 = v11;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
      {
        uint64_t v18 = type metadata accessor for LocationAccuracy(0);
        memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v14, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    a1[*(int *)(a3 + 20)] = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t type metadata accessor for CurrentLocation(uint64_t a1)
{
  return sub_249F95920(a1, qword_269752060);
}

uint64_t type metadata accessor for LocationAccuracy(uint64_t a1)
{
  return sub_249F95920(a1, qword_269752048);
}

uint64_t sub_24A046BB8(id *a1)
{
  uint64_t v2 = type metadata accessor for CurrentLocation(0);
  uint64_t result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {

    uint64_t v4 = (char *)a1 + *(int *)(v2 + 20);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v7 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
      return v6(v4, v5);
    }
  }
  return result;
}

void **sub_24A046CCC(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CurrentLocation(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v10 = *(int *)(v6 + 20);
    BOOL v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    id v13 = v9;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
    {
      uint64_t v16 = type metadata accessor for LocationAccuracy(0);
      memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v12, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
    }
    (*(void (**)(void **, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void **sub_24A046EC8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CurrentLocation(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      __n128 v22 = *a2;
      uint64_t v23 = *a1;
      *a1 = *a2;
      id v24 = v22;

      uint64_t v25 = *(int *)(v6 + 20);
      id v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
      uint64_t v29 = *(void *)(v28 - 8);
      unint64_t v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
      int v31 = v30(v26, 1, v28);
      int v32 = v30(v27, 1, v28);
      if (v31)
      {
        if (!v32)
        {
          (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v32)
        {
          (*(void (**)(char *, char *, uint64_t))(v29 + 24))(v26, v27, v28);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
      }
      size_t v19 = *(void *)(*(void *)(type metadata accessor for LocationAccuracy(0) - 8) + 64);
      uint64_t v20 = (void **)v26;
      uint64_t v21 = (void **)v27;
      goto LABEL_8;
    }
    sub_24A049650((uint64_t)a1, type metadata accessor for CurrentLocation);
LABEL_7:
    size_t v19 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0) - 8) + 64);
    uint64_t v20 = a1;
    uint64_t v21 = a2;
LABEL_8:
    memcpy(v20, v21, v19);
    goto LABEL_14;
  }
  if (v10) {
    goto LABEL_7;
  }
  BOOL v11 = *a2;
  *a1 = *a2;
  uint64_t v12 = *(int *)(v6 + 20);
  id v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  id v15 = v11;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
  {
    uint64_t v18 = type metadata accessor for LocationAccuracy(0);
    memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v14, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_24A047240(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CurrentLocation(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v9 = *(int *)(v6 + 20);
    int v10 = (char *)a1 + v9;
    BOOL v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = type metadata accessor for LocationAccuracy(0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void **sub_24A047438(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CurrentLocation(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v20 = *a1;
      *a1 = *a2;

      uint64_t v21 = *(int *)(v6 + 20);
      __n128 v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
      uint64_t v25 = *(void *)(v24 - 8);
      id v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
      int v27 = v26(v22, 1, v24);
      int v28 = v26(v23, 1, v24);
      if (v27)
      {
        if (!v28)
        {
          (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
          goto LABEL_14;
        }
      }
      else
      {
        if (!v28)
        {
          (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
          goto LABEL_14;
        }
        (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
      }
      size_t v17 = *(void *)(*(void *)(type metadata accessor for LocationAccuracy(0) - 8) + 64);
      uint64_t v18 = (void **)v22;
      size_t v19 = v23;
      goto LABEL_8;
    }
    sub_24A049650((uint64_t)a1, type metadata accessor for CurrentLocation);
LABEL_7:
    size_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0) - 8) + 64);
    uint64_t v18 = a1;
    size_t v19 = a2;
LABEL_8:
    memcpy(v18, v19, v17);
    goto LABEL_14;
  }
  if (v10) {
    goto LABEL_7;
  }
  *a1 = *a2;
  uint64_t v11 = *(int *)(v6 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = type metadata accessor for LocationAccuracy(0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  (*(void (**)(void **, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_14:
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_24A0477A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A0477BC);
}

uint64_t sub_24A0477BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 5) {
      return v10 - 4;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_24A04787C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A047890);
}

uint64_t sub_24A047890(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 4;
  }
  return result;
}

uint64_t type metadata accessor for CurrentLocationResult(uint64_t a1)
{
  return sub_249F95920(a1, (uint64_t *)&unk_269752038);
}

void sub_24A047970()
{
  sub_249FA74D4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_24A047A04(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_24A047B54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_24A047C28(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_24A047D3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_24A047EB4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_24A047FC8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_24A048140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A048154);
}

uint64_t sub_24A048154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_24A0481C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A0481D8);
}

uint64_t sub_24A0481D8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_24A04825C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 1, v2);
}

uint64_t sub_24A0482C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 1, v4);
}

void sub_24A04833C()
{
  sub_24A044AC4();
  if (v0 <= 0x3F) {
    swift_initEnumMetadataSinglePayload();
  }
}

unsigned char *storeEnumTagSinglePayload for LocationDataProvider.Use(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24A048480);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationDataProvider.Use()
{
  return &type metadata for LocationDataProvider.Use;
}

void **sub_24A0484B8(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    int v9 = v5;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = type metadata accessor for LocationAccuracy(0);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v8, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
  }
  return a1;
}

uint64_t sub_24A048618(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void **sub_24A0486EC(void **a1, void **a2, uint64_t a3)
{
  int v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  id v8 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9))
  {
    uint64_t v11 = type metadata accessor for LocationAccuracy(0);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v6, v7, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
  }
  return a1;
}

void **sub_24A048804(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = type metadata accessor for LocationAccuracy(0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

void *sub_24A048990(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = type metadata accessor for LocationAccuracy(0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void **sub_24A048AA4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = type metadata accessor for LocationAccuracy(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_24A048C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A048C40);
}

uint64_t sub_24A048C40(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for LocationAccuracy(0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24A048CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A048D04);
}

void *sub_24A048D04(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for LocationAccuracy(0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24A048DAC()
{
  uint64_t result = type metadata accessor for LocationAccuracy(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24A048E4C()
{
  unint64_t result = qword_269752078;
  if (!qword_269752078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752078);
  }
  return result;
}

unint64_t sub_24A048EA0(uint64_t a1)
{
  unint64_t result = sub_24A048EC8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A048EC8()
{
  unint64_t result = qword_269752080;
  if (!qword_269752080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752080);
  }
  return result;
}

uint64_t sub_24A048F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752030);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LocationAccuracy(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752098);
  MEMORY[0x270FA5388](v11 - 8);
  int v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v13[*(int *)(v14 + 56)];
  sub_24A04A164(a1, (uint64_t)v13, type metadata accessor for LocationAccuracy);
  sub_24A04A164(a2, v15, type metadata accessor for LocationAccuracy);
  int v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v13, 1, v4) != 1)
  {
    sub_24A04A164((uint64_t)v13, (uint64_t)v10, type metadata accessor for LocationAccuracy);
    if (v16(v15, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      sub_249FCFCA0(0, &qword_269751FB8);
      char v17 = sub_24A055D38();
      uint64_t v18 = *(void (**)(char *, uint64_t))(v5 + 8);
      v18(v7, v4);
      v18(v10, v4);
      sub_24A049650((uint64_t)v13, type metadata accessor for LocationAccuracy);
      return v17 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_6;
  }
  if (v16(v15, 1, v4) != 1)
  {
LABEL_6:
    sub_249F6E790((uint64_t)v13, &qword_269752098);
    char v17 = 0;
    return v17 & 1;
  }
  sub_24A049650((uint64_t)v13, type metadata accessor for LocationAccuracy);
  char v17 = 1;
  return v17 & 1;
}

BOOL sub_24A049224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CurrentLocation(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697503B0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v31 = (uint64_t)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  int v16 = (char *)&v28 - v15;
  MEMORY[0x270FA5388](v17);
  size_t v19 = (char *)&v28 - v18;
  uint64_t v29 = a1;
  sub_249F6E6C8(a1, (uint64_t)&v28 - v18, &qword_2697500F0);
  uint64_t v30 = a2;
  sub_249F6E6C8(a2, (uint64_t)v16, &qword_2697500F0);
  uint64_t v20 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_249F6E6C8((uint64_t)v19, (uint64_t)v11, &qword_2697500F0);
  sub_249F6E6C8((uint64_t)v16, v20, &qword_2697500F0);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v21((uint64_t)v11, 1, v4) == 1)
  {
    sub_249F6E790((uint64_t)v16, &qword_2697500F0);
    sub_249F6E790((uint64_t)v19, &qword_2697500F0);
    if (v21(v20, 1, v4) == 1)
    {
      sub_249F6E790((uint64_t)v11, &qword_2697500F0);
LABEL_4:
      uint64_t v22 = type metadata accessor for CurrentLocationResult(0);
      return *(unsigned __int8 *)(v29 + *(int *)(v22 + 20)) == *(unsigned __int8 *)(v30 + *(int *)(v22 + 20));
    }
    goto LABEL_7;
  }
  uint64_t v24 = v31;
  sub_249F6E6C8((uint64_t)v11, v31, &qword_2697500F0);
  if (v21(v20, 1, v4) == 1)
  {
    sub_249F6E790((uint64_t)v16, &qword_2697500F0);
    sub_249F6E790((uint64_t)v19, &qword_2697500F0);
    sub_24A049650(v24, type metadata accessor for CurrentLocation);
LABEL_7:
    uint64_t v25 = &qword_2697503B0;
    uint64_t v26 = (uint64_t)v11;
LABEL_8:
    sub_249F6E790(v26, v25);
    return 0;
  }
  sub_24A04A234(v20, (uint64_t)v7, type metadata accessor for CurrentLocation);
  sub_249FCFCA0(0, (unint64_t *)&qword_269752090);
  if ((sub_24A057938() & 1) == 0)
  {
    sub_24A049650((uint64_t)v7, type metadata accessor for CurrentLocation);
    sub_249F6E790((uint64_t)v16, &qword_2697500F0);
    sub_249F6E790((uint64_t)v19, &qword_2697500F0);
    sub_24A049650(v24, type metadata accessor for CurrentLocation);
    uint64_t v26 = (uint64_t)v11;
    uint64_t v25 = &qword_2697500F0;
    goto LABEL_8;
  }
  char v27 = sub_24A048F1C(v24 + *(int *)(v4 + 20), (uint64_t)&v7[*(int *)(v4 + 20)]);
  sub_24A049650((uint64_t)v7, type metadata accessor for CurrentLocation);
  sub_249F6E790((uint64_t)v16, &qword_2697500F0);
  sub_249F6E790((uint64_t)v19, &qword_2697500F0);
  sub_24A049650(v24, type metadata accessor for CurrentLocation);
  sub_249F6E790((uint64_t)v11, &qword_2697500F0);
  if (v27) {
    goto LABEL_4;
  }
  return 0;
}

uint64_t sub_24A049650(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A0496B0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_locality);
  if (!v2)
  {
    id v2 = objc_msgSend(a1, sel_name);
    if (!v2)
    {
      id v2 = objc_msgSend(a1, sel_subAdministrativeArea);
      if (!v2)
      {
        id v2 = objc_msgSend(a1, sel_administrativeArea);
        if (!v2)
        {
          id v2 = objc_msgSend(a1, sel_inlandWater);
          if (!v2)
          {
            id v2 = objc_msgSend(a1, sel_country);
            if (!v2)
            {
              id v2 = objc_msgSend(a1, sel_ocean);
              if (!v2) {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v3 = sub_24A0573A8();

  return v3;
}

uint64_t sub_24A0497DC(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v43 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_24A056538();
  uint64_t v9 = *(v8 - 1);
  MEMORY[0x270FA5388](v8);
  uint64_t v44 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24A0572C8();
  uint64_t v12 = *(void *)(v11 - 8);
  __n128 v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (uint64_t *)((char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v42 = v1;
  int v16 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  *uint64_t v15 = v16;
  (*(void (**)(void *, void, uint64_t, __n128))(v12 + 104))(v15, *MEMORY[0x263F8F0E0], v11, v13);
  id v17 = v16;
  char v18 = sub_24A0572D8();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v15, v11);
  if (v18)
  {
    if (qword_26B16F9B8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v19 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_249F6E6C8(v19, (uint64_t)v7, &qword_26B16FAA8);
  uint64_t v20 = v9;
  int v21 = (*(uint64_t (**)(char *, uint64_t, void *))(v9 + 48))(v7, 1, v8);
  uint64_t v22 = v44;
  if (v21 == 1)
  {
    sub_249FB8AA8(v44);
    sub_249F6E790((uint64_t)v7, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(uint64_t, char *, void *))(v9 + 32))(v44, v7, v8);
  }
  id v23 = v42;
  id v24 = a1;
  id v25 = v23;
  id v26 = a1;
  char v27 = sub_24A056518();
  os_log_type_t v28 = sub_24A0577A8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    id v42 = v8;
    uint64_t v31 = (void *)v30;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = (uint64_t)v25;
    uint64_t v46 = v40;
    *(_DWORD *)uint64_t v29 = 138543618;
    uint64_t v41 = v20;
    id v32 = v25;
    sub_24A057978();
    *uint64_t v31 = v25;

    *(_WORD *)(v29 + 12) = 2082;
    uint64_t v45 = (uint64_t)a1;
    id v33 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
    uint64_t v34 = sub_24A0573D8();
    uint64_t v45 = sub_249F782DC(v34, v35, &v46);
    sub_24A057978();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_249F61000, v27, v28, "[%{public}@] singleLocationUpdate END (error: %{public}s)", (uint8_t *)v29, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v31, -1, -1);
    uint64_t v36 = v40;
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v36, -1, -1);
    MEMORY[0x24C5BA360](v29, -1, -1);

    (*(void (**)(uint64_t, id))(v41 + 8))(v44, v42);
  }
  else
  {

    (*(void (**)(uint64_t, void *))(v20 + 8))(v22, v8);
  }
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697520D0);
  uint64_t v38 = (uint64_t)v43;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v43, 1, 1, v37);
  sub_24A044B2C(v38);
  return sub_249F6E790(v38, &qword_2697520C8);
}

void sub_24A049D6C()
{
  unint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A056538();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A0572C8();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = MEMORY[0x270FA5388](v9);
  __n128 v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void **)&v1[OBJC_IVAR____TtC11ClockPosterP33_80B341479428838F1831E32E38C9D6BF14LocationSource_locationQueue];
  void *v13 = v14;
  (*(void (**)(void *, void, uint64_t, __n128))(v10 + 104))(v13, *MEMORY[0x263F8F0E0], v9, v11);
  id v15 = v14;
  LOBYTE(v14) = sub_24A0572D8();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v13, v9);
  if (v14)
  {
    if (qword_26B16F9B8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v16 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_location_private;
  swift_beginAccess();
  sub_249F6E6C8(v16, (uint64_t)v4, &qword_26B16FAA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_249FB8AA8((uint64_t)v8);
    sub_249F6E790((uint64_t)v4, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  }
  id v17 = v1;
  char v18 = sub_24A056518();
  os_log_type_t v19 = sub_24A0577A8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    int v21 = (void *)swift_slowAlloc();
    uint64_t v23 = v5;
    uint64_t v24 = v6;
    *(_DWORD *)uint64_t v20 = 138543362;
    id v25 = v17;
    uint64_t v22 = v17;
    uint64_t v5 = v23;
    uint64_t v6 = v24;
    sub_24A057978();
    *int v21 = v17;

    _os_log_impl(&dword_249F61000, v18, v19, "[%{public}@] singleLocationUpdate did change authorization", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520B0);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v21, -1, -1);
    MEMORY[0x24C5BA360](v20, -1, -1);
  }
  else
  {

    char v18 = v17;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24A04333C();
}

uint64_t sub_24A04A164(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A04A1CC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A04A204()
{
  sub_24A04303C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24A04A20C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_24A04A234(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_24A04A29C(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_24A04A2AC(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_24A04A2BC(uint64_t a1)
{
  return sub_249FF3254(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24A04A2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A04A32C()
{
  unint64_t result = qword_269752120;
  if (!qword_269752120)
  {
    sub_24A057828();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752120);
  }
  return result;
}

unint64_t sub_24A04A384()
{
  unint64_t result = qword_269752130;
  if (!qword_269752130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269752128);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752130);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LocationStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A04A4ACLL);
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

ValueMetadata *type metadata accessor for LocationStatus()
{
  return &type metadata for LocationStatus;
}

unint64_t sub_24A04A4E8()
{
  unint64_t result = qword_269752138;
  if (!qword_269752138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752138);
  }
  return result;
}

void sub_24A04A540(uint64_t a1, id a2, double a3, double a4, double a5, double a6)
{
  *(void *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack] = 0;
  *(void *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon] = 0;
  *(void *)&v6[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label] = 0;
  v41.receiver = v6;
  v41.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  id v13 = objc_msgSendSuper2(&v41, sel_initWithFrame_, a3, a4, a5, a6);
  id v14 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v15 = (char *)v13;
  id v16 = objc_msgSend(v14, sel_init);
  uint64_t v17 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack;
  char v18 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack];
  *(void *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack] = v16;

  os_log_type_t v19 = *(void **)&v15[v17];
  if (!v19)
  {
    __break(1u);
    goto LABEL_13;
  }
  objc_msgSend(v19, sel_setSpacing_, 0.0);
  uint64_t v20 = *(void **)&v15[v17];
  if (!v20)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  objc_msgSend(v20, sel_setAxis_, 0);
  int v21 = *(void **)&v15[v17];
  if (!v21)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v21, sel_setAlignment_, 3);
  uint64_t v22 = *(void **)&v15[v17];
  if (!v22)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v22, sel_setDistribution_, 3);
  uint64_t v23 = *(void **)&v15[v17];
  if (!v23)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v23, sel_setSpacing_, 4.0);
  if (!*(void *)&v15[v17])
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v15, sel_addSubview_);
  id v24 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83610]);
  id v25 = objc_msgSend(v24, sel_fontWithSize_, 18.0);

  id v26 = objc_msgSend(self, sel_configurationWithFont_, v25);
  char v27 = v26;
  if (a2)
  {
    id v29 = v26;
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    id v28 = v27;
  }
  uint64_t v30 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();
  a2 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v30, v27);

  id v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, a2);
  id v32 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  *(void *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon] = v31;

  id v33 = sub_24A019AA8(22.0);
  uint64_t v34 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label;
  unint64_t v35 = *(void **)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  *(void *)&v15[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label] = v33;

  uint64_t v36 = *(void **)&v15[v34];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = (void *)sub_24A056198();
    id v39 = objc_msgSend(self, sel_textProviderWithDate_, v38);

    objc_msgSend(v37, sel_setTextProvider_, v39);
    uint64_t v40 = sub_24A056238();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(a1, v40);
    return;
  }
LABEL_18:

  __break(1u);
}

void sub_24A04AAAC()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v2 = v1;
  id v3 = objc_msgSend(v0, sel_tintColor);
  if (!v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  unsigned int v4 = v3;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = 0x4069800000000000;
  id v6 = objc_allocWithZone(MEMORY[0x263F825C8]);
  uint64_t v23 = sub_249F7C490;
  uint64_t v24 = v5;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  int v21 = sub_249FDA198;
  uint64_t v22 = &block_descriptor_15;
  uint64_t v7 = _Block_copy(&v19);
  id v8 = v4;
  id v9 = objc_msgSend(v6, sel_initWithDynamicProvider_, v7);
  _Block_release(v7);

  swift_release();
  objc_msgSend(v2, sel_setTintColor_, v9);

  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  if (v10)
  {
    __n128 v11 = self;
    id v12 = v10;
    id v13 = objc_msgSend(v11, sel_whiteColor);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = 0x4063200000000000;
    id v15 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v23 = sub_249F7C4E4;
    uint64_t v24 = v14;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 1107296256;
    int v21 = sub_249FDA198;
    uint64_t v22 = &block_descriptor_16_0;
    id v16 = _Block_copy(&v19);
    id v17 = v13;
    id v18 = objc_msgSend(v15, sel_initWithDynamicProvider_, v16);
    _Block_release(v16);

    swift_release();
    objc_msgSend(v12, sel_setTextColor_, v18);

    return;
  }
LABEL_7:
  __break(1u);
}

void sub_24A04AD3C()
{
  uint64_t v1 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack;
  id v2 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_stack];
  if (!v2)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v3 = objc_msgSend(v2, sel_subviews);
  sub_249F88C30();
  unint64_t v4 = sub_24A057568();

  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon;
  id v6 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon];
  if (!v6)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v7 = v6;
  char v8 = sub_249FB87C4((uint64_t)v7, v4);
  swift_bridgeObjectRelease();

  if ((v8 & 1) == 0)
  {
    id v9 = *(void **)&v0[v1];
    if (!v9)
    {
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    if (!*(void *)&v0[v5])
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    objc_msgSend(v9, sel_addArrangedSubview_);
  }
  uint64_t v10 = *(void **)&v0[v1];
  if (!v10) {
    goto LABEL_19;
  }
  id v11 = objc_msgSend(v10, sel_subviews);
  unint64_t v12 = sub_24A057568();

  uint64_t v13 = OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label;
  uint64_t v14 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label];
  if (!v14)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v15 = v14;
  char v16 = sub_249FB87C4((uint64_t)v15, v12);
  swift_bridgeObjectRelease();

  if ((v16 & 1) == 0)
  {
    id v17 = *(void **)&v0[v1];
    if (!v17)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    if (!*(void *)&v0[v13])
    {
LABEL_25:
      __break(1u);
      return;
    }
    objc_msgSend(v17, sel_addArrangedSubview_);
  }
  id v18 = *(void **)&v0[v1];
  if (!v18) {
    goto LABEL_21;
  }
  id v19 = v18;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v19, sel_setFrame_);
}

id sub_24A04AF54(double a1, double a2)
{
  id result = *(id *)(v2 + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_label);
  if (result)
  {
    objc_msgSend(result, sel_sizeThatFits_);
    id result = *(id *)(v2 + OBJC_IVAR____TtC11ClockPoster36AnalogClockFaceAlarmComplicationView_icon);
    if (result) {
      return objc_msgSend(result, sel_sizeThatFits_, a1 - v6, a2);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_24A04B038()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceAlarmComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceAlarmComplicationView()
{
  return self;
}

uint64_t sub_24A04B0EC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t initializeWithCopy for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for SolarTerminatorPath(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SolarTerminatorPath(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SolarTerminatorPath(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarTerminatorPath()
{
  return &type metadata for SolarTerminatorPath;
}

BOOL sub_24A04B2D4()
{
  double v0 = COERCE_DOUBLE(sub_24A04B568());
  if (v1) {
    return 0;
  }
  long double v2 = v0;
  double v3 = sin((v0 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
  double v4 = (fmod(v2, 1.0) * 24.0 + -12.0) * 15.0;
  double v5 = tan(v3 * 0.0174532925);
  uint64_t v6 = 0;
  double v7 = fabs(v3);
  if (v7 <= 15.0 && v7 <= 10.0) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = 3;
  }
  id v9 = (void *)MEMORY[0x263F8EE78];
  do
  {
    if (v6 % v8) {
      goto LABEL_10;
    }
    double v15 = (double)v6 + -180.0;
    if (v5 == 0.0)
    {
      double v11 = 0.0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_14:
      }
        id v9 = sub_249FBA4FC(0, v9[2] + 1, 1, v9);
    }
    else
    {
      long double v10 = cos((v4 + v15) * 0.0174532925);
      double v11 = atan(-v10 / v5) * 57.2957795;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_14;
      }
    }
    unint64_t v13 = v9[2];
    unint64_t v12 = v9[3];
    if (v13 >= v12 >> 1) {
      id v9 = sub_249FBA4FC((void *)(v12 > 1), v13 + 1, 1, v9);
    }
    v9[2] = v13 + 1;
    uint64_t v14 = (double *)&v9[2 * v13];
    v14[4] = v11;
    v14[5] = v15;
LABEL_10:
    ++v6;
  }
  while (v6 != 361);
  return v3 > 0.0;
}

uint64_t sub_24A04B4D4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 8);
  uint64_t result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0) {
    return (*(void *)a1 == *(void *)a2) & ~result;
  }
  return result;
}

uint64_t sub_24A04B4FC(unsigned __int8 *a1, unsigned __int8 *a2, int32x2_t a3)
{
  if (*a1 == *a2)
  {
    unsigned __int8 v3 = a1[24];
    int v4 = a2[24];
    uint64_t v5 = *((void *)a2 + 2);
    uint64_t v6 = *((void *)a1 + 2);
    sub_24A04CBA8(*((void *)a1 + 1), *((void *)a2 + 1), a3);
    if (v7)
    {
      if (v3)
      {
        if (v4) {
          return 1;
        }
      }
      else
      {
        if (v6 == v5) {
          char v9 = v4;
        }
        else {
          char v9 = 1;
        }
        if ((v9 & 1) == 0) {
          return 1;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_24A04B568()
{
  uint64_t v0 = sub_24A055E58();
  uint64_t v45 = *(void *)(v0 - 8);
  uint64_t v46 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v44 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24A0562E8();
  uint64_t v39 = *(void *)(v2 - 8);
  uint64_t v40 = v2;
  MEMORY[0x270FA5388](v2);
  int v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A056388();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v5);
  objc_super v41 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v7 - 8);
  char v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24A056238();
  uint64_t v10 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  unint64_t v47 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A0563F8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  int v21 = (char *)&v37 - v20;
  sub_24A04BBD8((uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    uint64_t v22 = &qword_26974F440;
    uint64_t v23 = (uint64_t)v14;
LABEL_5:
    sub_249F6E790(v23, v22);
    *(double *)&uint64_t result = 0.0;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v14, v15);
  sub_24A04C0FC((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, v48) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
    uint64_t v22 = &qword_2697515A0;
    uint64_t v23 = (uint64_t)v9;
    goto LABEL_5;
  }
  uint64_t v38 = v10;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v47, v9, v48);
  uint64_t v26 = v39;
  uint64_t v25 = v40;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v4, *MEMORY[0x263F07740], v40);
  char v27 = v41;
  sub_24A0562F8();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v25);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v18, v21, v15);
  sub_24A056368();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269751B48);
  uint64_t v28 = sub_24A056378();
  uint64_t v29 = *(void *)(v28 - 8);
  unint64_t v30 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_24A05A510;
  (*(void (**)(unint64_t, void, uint64_t))(v29 + 104))(v31 + v30, *MEMORY[0x263F078C8], v28);
  sub_24A02CDE0(v31);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  id v32 = v44;
  id v33 = v47;
  sub_24A056308();
  swift_bridgeObjectRelease();
  uint64_t v34 = sub_24A055E18();
  LOBYTE(v31) = v35;
  double v36 = (double)v34 / 86400.0;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v46);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v27, v43);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v33, v48);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  if (v31) {
    *(double *)&uint64_t result = 1.0;
  }
  else {
    *(double *)&uint64_t result = v36 + 1.0;
  }
  return result;
}

uint64_t sub_24A04BBD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24A056238();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v42 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24A056538();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A0563B8();
  uint64_t v15 = sub_24A0563F8();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    uint64_t v39 = v2;
    sub_249F6E790((uint64_t)v14, &qword_26974F440);
    if (qword_26B16F9B8 != -1) {
      swift_once();
    }
    uint64_t v17 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
    swift_beginAccess();
    sub_249F7AA94(v17, (uint64_t)v7);
    uint64_t v18 = v9;
    int v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    uint64_t v40 = v8;
    if (v19 == 1)
    {
      uint64_t v20 = v11;
      sub_249FB8AA8((uint64_t)v11);
      sub_249F6E790((uint64_t)v7, &qword_26B16FAA8);
    }
    else
    {
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      uint64_t v20 = v11;
      v22(v11, v7, v8);
    }
    uint64_t v23 = v42;
    uint64_t v24 = v39;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v42, v41, v39);
    uint64_t v25 = v20;
    uint64_t v26 = sub_24A056518();
    os_log_type_t v27 = sub_24A0577B8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v38 = v25;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v41 = a1;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = v18;
      uint64_t v44 = v36;
      *(_DWORD *)uint64_t v29 = 136446210;
      v35[1] = v29 + 4;
      sub_24A04CD24();
      uint64_t v30 = sub_24A057CF8();
      uint64_t v43 = sub_249F782DC(v30, v31, &v44);
      sub_24A057978();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v24);
      _os_log_impl(&dword_249F61000, v26, v27, "[%{public}s] Cannot get GMT time zone to calculate solar curves", v29, 0xCu);
      uint64_t v21 = 1;
      uint64_t v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x24C5BA360](v32, -1, -1);
      id v33 = v29;
      a1 = v41;
      MEMORY[0x24C5BA360](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v40);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v24);

      (*(void (**)(char *, uint64_t))(v18 + 8))(v25, v40);
      uint64_t v21 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a1, v14, v15);
    uint64_t v21 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a1, v21, 1, v15);
}

uint64_t sub_24A04C0FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v81 = a1;
  uint64_t v2 = sub_24A056238();
  uint64_t v82 = *(void *)(v2 - 8);
  uint64_t v83 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v69 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v68 = (uint64_t)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24A056538();
  uint64_t v71 = *(void *)(v6 - 8);
  uint64_t v72 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v70 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v73 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24A055E58();
  uint64_t v77 = *(void *)(v10 - 8);
  uint64_t v78 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A0562E8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_24A056388();
  uint64_t v75 = *(void *)(v17 - 8);
  uint64_t v76 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v79 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F440);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24A0563F8();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v64 - v27;
  os_log_type_t v74 = v1;
  sub_24A04BBD8((uint64_t)v21);
  uint64_t v29 = v22;
  uint64_t v80 = v23;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
  {
    sub_249F6E790((uint64_t)v21, &qword_26974F440);
    uint64_t v30 = 1;
    uint64_t v31 = v81;
    uint64_t v32 = v82;
    uint64_t v33 = v83;
  }
  else
  {
    uint64_t v34 = v80;
    char v35 = v28;
    (*(void (**)(char *, char *, uint64_t))(v80 + 32))(v28, v21, v29);
    (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F07740], v13);
    uint64_t v36 = v79;
    sub_24A0562F8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v25, v35, v29);
    uint64_t v67 = v29;
    sub_24A056368();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751B48);
    uint64_t v37 = sub_24A056378();
    uint64_t v38 = *(void *)(v37 - 8);
    unint64_t v39 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_24A05A510;
    (*(void (**)(unint64_t, void, uint64_t))(v38 + 104))(v40 + v39, *MEMORY[0x263F078A0], v37);
    sub_24A02CDE0(v40);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v41 = v74;
    sub_24A056318();
    swift_bridgeObjectRelease();
    sub_24A055DE8();
    sub_24A055D98();
    sub_24A055DB8();
    sub_24A055E08();
    sub_24A055E28();
    uint64_t v42 = (uint64_t)v73;
    sub_24A056338();
    uint64_t v43 = v82;
    uint64_t v44 = v83;
    BOOL v45 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v42, 1, v83) == 1;
    uint64_t v32 = v43;
    uint64_t v46 = v12;
    if (v45)
    {
      unint64_t v47 = v41;
      uint64_t v65 = v46;
      uint64_t v66 = v35;
      sub_249F6E790(v42, &qword_2697515A0);
      if (qword_26B16F9B8 != -1) {
        swift_once();
      }
      uint64_t v48 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
      swift_beginAccess();
      uint64_t v49 = v68;
      sub_249F7AA94(v48, v68);
      uint64_t v51 = v71;
      uint64_t v50 = v72;
      int v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v49, 1, v72);
      uint64_t v53 = v69;
      uint64_t v33 = v83;
      uint64_t v54 = v70;
      if (v52 == 1)
      {
        sub_249FB8AA8(v70);
        sub_249F6E790(v49, &qword_26B16FAA8);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v70, v49, v50);
      }
      (*(void (**)(char *, uint8_t *, uint64_t))(v43 + 16))(v53, v47, v33);
      uint64_t v55 = sub_24A056518();
      uint64_t v56 = v54;
      os_log_type_t v57 = sub_24A0577B8();
      if (os_log_type_enabled(v55, v57))
      {
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = v51;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v85 = v60;
        *(_DWORD *)uint64_t v58 = 136446210;
        os_log_type_t v74 = v58 + 4;
        sub_24A04CD24();
        uint64_t v61 = sub_24A057CF8();
        uint64_t v84 = sub_249F782DC(v61, v62, &v85);
        uint64_t v32 = v82;
        sub_24A057978();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v53, v33);
        _os_log_impl(&dword_249F61000, v55, v57, "[%{public}s] Cannot get new years day", v58, 0xCu);
        uint64_t v30 = 1;
        swift_arrayDestroy();
        MEMORY[0x24C5BA360](v60, -1, -1);
        MEMORY[0x24C5BA360](v58, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v56, v72);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v65, v78);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v76);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v66, v67);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v32 + 8))(v53, v33);
        (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v56, v50);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v65, v78);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v79, v76);
        (*(void (**)(char *, uint64_t))(v80 + 8))(v66, v67);
        uint64_t v30 = 1;
      }
      uint64_t v31 = v81;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v78);
      (*(void (**)(char *, uint64_t))(v75 + 8))(v36, v76);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v35, v67);
      uint64_t v31 = v81;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v81, v42, v44);
      uint64_t v30 = 0;
      uint64_t v33 = v44;
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(v31, v30, 1, v33);
}

int32x2_t sub_24A04CBA8(uint64_t a1, uint64_t a2, int32x2_t result)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3 == *(void *)(a2 + 16) && v3 && a1 != a2)
  {
    uint64_t result = *(int32x2_t *)(a1 + 40);
    if (*(double *)(a1 + 32) == *(double *)(a2 + 32) && *(double *)&result == *(double *)(a2 + 40))
    {
      uint64_t v5 = (float64x2_t *)(a1 + 48);
      uint64_t v6 = (float64x2_t *)(a2 + 48);
      uint64_t v7 = v3 - 1;
      do
      {
        if (!v7) {
          break;
        }
        float64x2_t v8 = *v5++;
        float64x2_t v9 = v8;
        float64x2_t v10 = *v6++;
        uint64_t result = vmovn_s64(vceqq_f64(v9, v10));
        --v7;
      }
      while ((result.i32[0] & result.i32[1] & 1) != 0);
    }
  }
  return result;
}

uint64_t sub_24A04CC28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    goto LABEL_7;
  }
  if (!v2 || a1 == a2) {
    goto LABEL_6;
  }
  swift_retain();
  swift_retain();
  char v5 = sub_24A056EB8();
  swift_release();
  swift_release();
  if ((v5 & 1) == 0)
  {
LABEL_7:
    char v6 = 0;
    return v6 & 1;
  }
  if (v2 == 1)
  {
LABEL_6:
    char v6 = 1;
    return v6 & 1;
  }
  uint64_t v8 = v2 - 2;
  uint64_t v9 = a1 + 40;
  uint64_t v10 = a2 + 40;
  do
  {
    v9 += 8;
    v10 += 8;
    swift_retain();
    swift_retain();
    char v6 = sub_24A056EB8();
    swift_release();
    swift_release();
    BOOL v12 = v8-- != 0;
  }
  while ((v6 & 1) != 0 && v12);
  return v6 & 1;
}

unint64_t sub_24A04CD24()
{
  unint64_t result = qword_269750148;
  if (!qword_269750148)
  {
    sub_24A056238();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269750148);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SolarTerminatorPath.PreferredRenderingMethod(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SolarTerminatorPath.PreferredRenderingMethod(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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

uint64_t sub_24A04CDCC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A04CDE8(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarTerminatorPath.PreferredRenderingMethod()
{
  return &type metadata for SolarTerminatorPath.PreferredRenderingMethod;
}

uint64_t sub_24A04CE18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24A057628();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24A057618();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_249F6E790(a1, &qword_26974F450);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24A0575D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_24A04CFC4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v5[OBJC_IVAR____TtC11ClockPoster35AnalogClockFaceDateComplicationView_dateTextProvider] = 0;
  uint64_t v14 = (objc_class *)type metadata accessor for AnalogClockFaceDateComplicationView();
  v41.receiver = v5;
  v41.super_class = v14;
  id v15 = objc_msgSendSuper2(&v41, sel_initWithFrame_options_, a1, a2, a3, a4, a5);
  if (v15)
  {
    uint64_t v16 = (void *)*MEMORY[0x263F835E0];
    uint64_t v17 = self;
    id v18 = v15;
    id v19 = v16;
    id v20 = objc_msgSend(v17, sel_preferredFontDescriptorWithTextStyle_, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26974F9E8);
    uint64_t inited = swift_initStackObject();
    long long v40 = xmmword_24A05A510;
    *(_OWORD *)(inited + 16) = xmmword_24A05A510;
    uint64_t v22 = (void *)*MEMORY[0x263F817A0];
    *(void *)(inited + 32) = *MEMORY[0x263F817A0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269751840);
    uint64_t v23 = swift_initStackObject();
    *(_OWORD *)(v23 + 16) = v40;
    uint64_t v24 = (void *)*MEMORY[0x263F81850];
    *(void *)(v23 + 32) = *MEMORY[0x263F81850];
    *(void *)(v23 + 40) = *MEMORY[0x263F81828];
    id v25 = v20;
    id v26 = v22;
    id v27 = v24;
    unint64_t v28 = sub_24A012F60(v23);
    *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_269751848);
    *(void *)(inited + 40) = v28;
    sub_24A012ACC(inited);
    type metadata accessor for AttributeName(0);
    sub_24A04EDC8((unint64_t *)&qword_26974F8B8, type metadata accessor for AttributeName);
    uint64_t v29 = (void *)sub_24A0572E8();
    swift_bridgeObjectRelease();
    id v30 = objc_msgSend(v25, sel_fontDescriptorByAddingAttributes_, v29);

    uint64_t v31 = self;
    id v32 = v18;
    id v33 = objc_msgSend(v31, sel_fontWithDescriptor_size_, v30, 22.0);
    objc_msgSend(v32, sel_setFont_, v33);

    objc_msgSend(v32, sel_setUppercase_, 1);
    objc_msgSend(v32, sel_setTextAlignment_, 1);
    uint64_t v34 = sub_24A057628();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v13, 1, 1, v34);
    uint64_t v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_24A057608();
    swift_retain();
    uint64_t v36 = sub_24A0575F8();
    uint64_t v37 = (void *)swift_allocObject();
    uint64_t v38 = MEMORY[0x263F8F500];
    v37[2] = v36;
    v37[3] = v38;
    v37[4] = v35;
    swift_release();
    sub_24A04CE18((uint64_t)v13, (uint64_t)&unk_269752188, (uint64_t)v37);
    swift_release();
  }
  return v15;
}

uint64_t sub_24A04D3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB0);
  v4[6] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697516A0);
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974FEB8);
  v4[10] = v6;
  v4[11] = *(void *)(v6 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = sub_24A057608();
  v4[14] = sub_24A0575F8();
  uint64_t v8 = sub_24A0575D8();
  v4[15] = v8;
  v4[16] = v7;
  return MEMORY[0x270FA2498](sub_24A04D540, v8, v7);
}

uint64_t sub_24A04D540()
{
  if (qword_26974F328 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = qword_269751340;
  uint64_t v5 = *(void *)(qword_269751340 + OBJC_IVAR____TtC11ClockPoster5Clock_overrideDateStream);
  swift_retain();
  sub_249FEFFF8(v5, v4, v1);
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  uint64_t v6 = sub_24A0575F8();
  v0[17] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[18] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24A04D6C4;
  uint64_t v8 = v0[10];
  uint64_t v9 = v0[6];
  uint64_t v10 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v9, v6, v10, v8);
}

uint64_t sub_24A04D6C4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_24A04D808, v3, v2);
}

uint64_t sub_24A04D808()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697515A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    swift_release();
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
  uint64_t v3 = MEMORY[0x24C5BA430](v0[5] + 16);
  if (!v3)
  {
    uint64_t v11 = v0[6];
    (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
    swift_release();
    sub_249F6E790(v11, &qword_26974FEB0);
    goto LABEL_8;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = v0[6];
  sub_24A04DB58();

  sub_249F6E790(v5, &qword_26974FEB0);
  uint64_t v6 = sub_24A0575F8();
  v0[17] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[18] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_24A04D6C4;
  uint64_t v8 = v0[10];
  uint64_t v9 = v0[6];
  uint64_t v10 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1F68](v9, v6, v10, v8);
}

id sub_24A04DB58()
{
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752160);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v96 = (char *)&v73 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = sub_24A055E68();
  uint64_t v94 = *(void *)(v1 - 8);
  uint64_t v95 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v93 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750280);
  uint64_t v91 = *(void *)(v3 - 8);
  uint64_t v92 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v90 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_24A055F68();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v81 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v98 = (char *)&v73 - v7;
  uint64_t v8 = sub_24A056168();
  uint64_t v88 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v87 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_24A0560A8();
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_24A056128();
  uint64_t v12 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24A056158();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v73 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v73 - v23;
  uint64_t v84 = sub_24A056238();
  uint64_t v83 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  id v26 = (char *)&v73 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_24A055F08();
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v76 = (char *)&v73 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v97 = (char *)&v73 - v29;
  if (qword_26974F328 != -1) {
    swift_once();
  }
  sub_24A006BDC((uint64_t)v26);
  MEMORY[0x24C5B7540]();
  sub_24A0560F8();
  sub_24A056148();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v82);
  id v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  v30(v18, v15);
  sub_24A056098();
  sub_24A056078();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v11, v86);
  v30(v21, v15);
  uint64_t v31 = v87;
  sub_24A056068();
  v30(v24, v15);
  sub_24A04EDC8(&qword_269750288, MEMORY[0x263F07280]);
  id v32 = v97;
  uint64_t v33 = v89;
  sub_24A056218();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v31, v33);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v26, v84);
  uint64_t KeyPath = swift_getKeyPath();
  MEMORY[0x270FA5388](KeyPath);
  *(&v73 - 2) = v35;
  swift_getKeyPath();
  id v36 = objc_msgSend(self, sel_whiteColor);
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v36;
  *(void *)(v37 + 24) = 0x4063200000000000;
  id v38 = objc_allocWithZone(MEMORY[0x263F825C8]);
  uint64_t v104 = sub_249F7C490;
  uint64_t v105 = v37;
  id aBlock = (id)MEMORY[0x263EF8330];
  uint64_t v101 = 1107296256;
  uint64_t v102 = sub_249FDA198;
  unint64_t v103 = &block_descriptor_16;
  unint64_t v39 = _Block_copy(&aBlock);
  id v40 = v36;
  id v41 = objc_msgSend(v38, sel_initWithDynamicProvider_, v39);
  _Block_release(v39);

  swift_release();
  id aBlock = v41;
  sub_24A04E9D4();
  sub_24A055ED8();
  uint64_t v42 = swift_getKeyPath();
  MEMORY[0x270FA5388](v42);
  *(&v73 - 2) = v43;
  swift_getKeyPath();
  sub_249FA4094();
  uint64_t v44 = v90;
  sub_24A055F38();
  swift_release();
  BOOL v45 = v93;
  uint64_t v46 = v94;
  uint64_t v47 = v95;
  (*(void (**)(char *, void, uint64_t))(v94 + 104))(v93, *MEMORY[0x263F065D8], v95);
  uint64_t v48 = v92;
  sub_24A055F48();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  (*(void (**)(char *, uint64_t))(v91 + 8))(v44, v48);
  uint64_t v49 = swift_getKeyPath();
  MEMORY[0x270FA5388](v49);
  *(&v73 - 2) = v50;
  swift_getKeyPath();
  uint64_t v51 = v96;
  sub_24A055F38();
  swift_release();
  id result = objc_msgSend(v99, sel_tintColor);
  if (result)
  {
    uint64_t v53 = result;
    uint64_t v54 = swift_allocObject();
    *(void *)(v54 + 16) = v53;
    *(void *)(v54 + 24) = 0x4069800000000000;
    id v55 = objc_allocWithZone(MEMORY[0x263F825C8]);
    uint64_t v104 = sub_249F7C4E4;
    uint64_t v105 = v54;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v101 = 1107296256;
    uint64_t v102 = sub_249FDA198;
    unint64_t v103 = &block_descriptor_25;
    uint64_t v56 = _Block_copy(&aBlock);
    id v57 = v53;
    id v58 = objc_msgSend(v55, sel_initWithDynamicProvider_, v56);
    _Block_release(v56);

    swift_release();
    id aBlock = v58;
    uint64_t v59 = v81;
    uint64_t v60 = v80;
    sub_24A055F48();

    (*(void (**)(char *, uint64_t))(v79 + 8))(v51, v60);
    sub_24A055EE8();
    sub_24A04ED08();
    uint64_t v61 = v77;
    uint64_t v62 = v78;
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v76, v32, v78);
    uint64_t v63 = (void *)sub_24A057898();
    id v64 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F089B8]), sel_initWithAttributedString_, v63);
    id v65 = objc_msgSend(v63, sel_length);
    uint64_t v66 = swift_allocObject();
    *(void *)(v66 + 16) = v64;
    *(void *)(v66 + 24) = v63;
    uint64_t v67 = swift_allocObject();
    *(void *)(v67 + 16) = sub_24A04ED88;
    *(void *)(v67 + 24) = v66;
    uint64_t v104 = sub_24A04EDA0;
    uint64_t v105 = v67;
    id aBlock = (id)MEMORY[0x263EF8330];
    uint64_t v101 = 1107296256;
    uint64_t v102 = sub_24A04EC00;
    unint64_t v103 = &block_descriptor_34_0;
    uint64_t v68 = _Block_copy(&aBlock);
    id v69 = v64;
    id v70 = v63;
    swift_retain();
    swift_release();
    objc_msgSend(v69, sel_enumerateAttributesInRange_options_usingBlock_, 0, v65, 0, v68);
    _Block_release(v68);
    LOBYTE(v65) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    id result = (id)swift_release();
    if ((v65 & 1) == 0)
    {
      objc_msgSend(v99, sel_setAttributedText_, v69);

      uint64_t v71 = *(void (**)(char *, uint64_t))(v74 + 8);
      uint64_t v72 = v75;
      v71(v59, v75);
      v71(v98, v72);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v97, v62);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A04E8C0()
{
  return sub_24A057358() & 1;
}

id sub_24A04E94C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalogClockFaceDateComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AnalogClockFaceDateComplicationView()
{
  return self;
}

void sub_24A04E9B4()
{
}

unint64_t sub_24A04E9D4()
{
  unint64_t result = qword_269752168;
  if (!qword_269752168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752168);
  }
  return result;
}

void sub_24A04EA28()
{
}

uint64_t sub_24A04EA50()
{
  return 8;
}

uint64_t sub_24A04EA5C()
{
  return swift_release();
}

uint64_t sub_24A04EA64(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_24A04EA74()
{
  return sub_24A057328();
}

void *sub_24A04EABC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24A04EAC8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A04EB00(int a1, uint64_t a2, uint64_t a3, int a4, void *a5, id a6)
{
  id v9 = objc_msgSend(a6, sel_string);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = objc_msgSend(v9, sel_substringWithRange_, a2, a3);

    sub_24A0573A8();
    sub_24A0573E8();
    swift_bridgeObjectRelease();
    id v12 = (id)sub_24A057368();
    swift_bridgeObjectRelease();
    objc_msgSend(a5, sel_replaceCharactersInRange_withString_, a2, a3, v12);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24A04EC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for Key(0);
  sub_24A04EDC8((unint64_t *)&qword_26974F880, type metadata accessor for Key);
  uint64_t v9 = sub_24A0572F8();
  v8(v9, a3, a4, a5);

  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_24A04ECF4()
{
  return 8;
}

unint64_t sub_24A04ED08()
{
  unint64_t result = qword_269752170;
  if (!qword_269752170)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269752170);
  }
  return result;
}

uint64_t sub_24A04ED48()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A04ED88(int a1, uint64_t a2, uint64_t a3, int a4)
{
  sub_24A04EB00(a1, a2, a3, a4, *(void **)(v4 + 16), *(id *)(v4 + 24));
}

uint64_t sub_24A04ED90()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A04EDA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24A04EDC8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A04EE10()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A04EE48()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A04EE88(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_249F6C87C;
  return sub_24A04D3B4(a1, v4, v5, v6);
}

uint64_t sub_24A04EF3C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24A04F018;
  return v6(a1);
}

uint64_t sub_24A04F018()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24A04F110()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A04F148(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_249F6C87C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269752190 + dword_269752190);
  return v6(a1, v4);
}

uint64_t sub_24A04F220(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24A04F234(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_24A04F248(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24A04F25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_24A04F270()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24A04F2C0()
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)v0 + 104) + 8);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v1 + 40);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_unknownObjectRetain();
  v2(v3, v1);

  return swift_unknownObjectRelease();
}

uint64_t sub_24A04F36C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 104);
  uint64_t v2 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 24);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_unknownObjectRetain();
  char v4 = v2(v3, v1);
  swift_unknownObjectRelease();
  return v4 & 1;
}

uint64_t sub_24A04F400(uint64_t a1)
{
  uint64_t v3 = *(unsigned __int8 *)(v1[3] + qword_269752218);
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 32);
  uint64_t v6 = *(void *)(*v1 + 88);
  swift_unknownObjectRetain();
  v5(a1, v3, v6, v4);

  return swift_unknownObjectRelease();
}

uint64_t sub_24A04F4B8()
{
  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_24A04F4E0()
{
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SwiftUIClockFace()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ClockHostingController()
{
  uint64_t result = qword_269752228;
  if (!qword_269752228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A04F584()
{
  return swift_initClassMetadata2();
}

id sub_24A04F5D0()
{
  uint64_t v0 = (void *)sub_24A04FF20();

  return v0;
}

uint64_t sub_24A04F600()
{
  return sub_24A04F36C() & 1;
}

uint64_t sub_24A04F628(uint64_t a1)
{
  return sub_24A04F400(a1);
}

uint64_t (*sub_24A04F64C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = sub_24A04F36C() & 1;
  return sub_24A04F69C;
}

uint64_t sub_24A04F69C(uint64_t a1)
{
  return sub_24A04F400(*(unsigned __int8 *)(a1 + 8));
}

void sub_24A04F6C4(unsigned char *a1@<X8>)
{
}

uint64_t sub_24A04F6DC(uint64_t a1)
{
  swift_getWitnessTable();

  return CustomStringConvertibleViaMirror.description.getter(a1);
}

uint64_t sub_24A04F730()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_getObjectType();
  uint64_t v2 = swift_conformsToProtocol2();
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  if (v2) {
    uint64_t v4 = v1;
  }
  else {
    uint64_t v4 = 0;
  }
  if (!v4) {
    return 0;
  }
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  swift_unknownObjectRetain();
  char v7 = v6(ObjectType, v3);
  swift_unknownObjectRelease();
  return v7 & 1;
}

uint64_t sub_24A04F7D8(double a1, double a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  swift_getObjectType();
  uint64_t result = swift_conformsToProtocol2();
  if (result) {
    uint64_t v7 = result;
  }
  else {
    uint64_t v7 = 0;
  }
  if (result) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  if (v8)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, double, double))(v7 + 16);
    swift_unknownObjectRetain();
    v10(ObjectType, v7, a1, a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_24A04F8B4()
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)v0 + 104) + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  uint64_t v3 = *(void *)(*(void *)v0 + 88);
  swift_unknownObjectRetain();
  char v4 = v2(v3, v1);
  swift_unknownObjectRelease();
  return v4 & 1;
}

uint64_t sub_24A04F94C(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 104) + 16);
  char v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  uint64_t v5 = *(void *)(*(void *)v1 + 88);
  swift_unknownObjectRetain();
  v4(a1, v5, v3);

  return swift_unknownObjectRelease();
}

uint64_t (*sub_24A04FA00(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_24A04F8B4() & 1;
  return sub_24A04FA4C;
}

uint64_t sub_24A04FA4C(uint64_t a1)
{
  return sub_24A04F94C(*(unsigned __int8 *)(a1 + 8));
}

void sub_24A04FA74(unsigned char *a1, uint64_t a2, void *a3)
{
  a1[qword_269752218] = 0;
  a1[qword_269752220] = 0;
  id v4 = a3;

  sub_24A057BC8();
  __break(1u);
}

void sub_24A04FAF8()
{
  uint64_t v1 = v0;
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for ClockHostingController();
  objc_msgSendSuper2(&v16, sel_viewWillLayoutSubviews);
  uint64_t v2 = qword_269752220;
  if ((*((unsigned char *)v0 + qword_269752220) & 1) == 0)
  {
    id v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = (UIView *)objc_msgSend(v3, sel_superview);

      if (!v5) {
        return;
      }
      id v6 = objc_msgSend(v1, sel_view);
      if (v6)
      {
        uint64_t v7 = v6;
        objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

        id v8 = objc_msgSend(v1, sel_view);
        if (v8)
        {
          uint64_t v9 = v8;
          [(UIView *)v5 bounds];
          objc_msgSend(v9, sel_setFrame_);

          id v10 = objc_msgSend(v1, sel_view);
          if (v10)
          {
            id v11 = v10;
            UIView.cp_applyFullscreenConstraints(inContainer:)(v5);

            id v12 = objc_msgSend(v1, sel_view);
            if (v12)
            {
              uint64_t v13 = v12;
              objc_msgSend(v12, sel_invalidateIntrinsicContentSize);

              id v14 = objc_msgSend(v1, sel_view);
              if (v14)
              {
                uint64_t v15 = v14;
                objc_msgSend(v14, sel_setNeedsUpdateConstraints);

                *((unsigned char *)v1 + v2) = 1;
                return;
              }
LABEL_16:
              __break(1u);
              return;
            }
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
}

void sub_24A04FCB0(void *a1)
{
  id v1 = a1;
  sub_24A04FAF8();
}

void sub_24A04FCF8(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for ClockHostingController();
  id v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a3);
  v4[qword_269752218] = 1;
}

void sub_24A04FD6C(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for ClockHostingController();
  id v4 = v5.receiver;
  objc_msgSendSuper2(&v5, sel_viewDidDisappear_, a3);
  v4[qword_269752218] = 0;
}

uint64_t sub_24A04FDDC()
{
  return 1;
}

id sub_24A04FDE4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClockHostingController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24A04FE1C()
{
}

void sub_24A04FE4C()
{
}

uint64_t sub_24A04FE7C()
{
  return type metadata accessor for ClockHostingController();
}

uint64_t sub_24A04FE84(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24A04FEC0()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24A04FEE4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24A04FF20()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_24A04FF28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752240);
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v42 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752248);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v46 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v40 - v8;
  MEMORY[0x270FA5388](v10);
  BOOL v45 = (char *)&v40 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750CA8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v40 - v19;
  uint64_t v21 = *(void *)(v1 + 24);
  uint64_t v22 = (os_unfair_lock_s *)(*(void *)(v21 + *(void *)(*(void *)v21 + 104)) + 16);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_lock(v22);
  uint64_t v23 = *(void *)(*(void *)v21 + 120);
  char v24 = *(unsigned char *)(v21 + v23);
  if ((v24 & 1) == 0) {
    *(unsigned char *)(v21 + v23) = 1;
  }
  os_unfair_lock_unlock(v22);
  swift_endAccess();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750C48);
  id v26 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
  uint64_t v48 = v25;
  v26(v20, 1, 1);
  if ((v24 & 1) == 0)
  {
    uint64_t v27 = sub_24A057628();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v14, 1, 1, v27);
    uint64_t v28 = swift_allocObject();
    swift_weakInit();
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v28;
    sub_24A039A1C((uint64_t)v14, (uint64_t)&unk_269752258, (uint64_t)v29);
    swift_release();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v17, 1, 1, v30);
    ((void (*)(char *, void, uint64_t, uint64_t))v26)(v17, 0, 1, v48);
    sub_24A003F9C((uint64_t)v17, (uint64_t)v20, &qword_269750CA8);
  }
  uint64_t v47 = v2;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750CB0);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v34 = (uint64_t)v45;
  v33(v45, 1, 1, v31);
  swift_beginAccess();
  os_unfair_lock_lock(v22);
  uint64_t v35 = swift_endAccess();
  __n128 v36 = MEMORY[0x270FA5388](v35);
  *(&v40 - 2) = v21;
  *(&v40 - 1) = v37;
  uint64_t v40 = v37;
  (*(void (**)(char *, void, uint64_t, __n128))(v43 + 104))(v42, *MEMORY[0x263F8F580], v44, v36);
  sub_24A057678();
  v33(v9, 0, 1, v31);
  sub_24A003F9C((uint64_t)v9, v34, &qword_269752248);
  swift_beginAccess();
  os_unfair_lock_unlock(v22);
  swift_endAccess();
  uint64_t v38 = v46;
  sub_249F6E6C8(v34, v46, &qword_269752248);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v32 + 48))(v38, 1, v31) == 1)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v41, v38, v31);
    sub_249F6E790(v34, &qword_269752248);
    sub_249F6E790(v40, &qword_269750CA8);
    return swift_release();
  }
  return result;
}

uint64_t sub_24A05051C()
{
  type metadata accessor for WeatherDataProvider();
  swift_allocObject();
  uint64_t result = sub_24A050558();
  qword_269752470 = result;
  return result;
}

uint64_t sub_24A050558()
{
  uint64_t v1 = v0;
  sub_24A056458();
  *(void *)(v0 + 16) = sub_24A056448();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752288);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + *(void *)(*(void *)v2 + 96);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = *(void *)(*(void *)v2 + 104);
  type metadata accessor for CPUnfairLock();
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  *(void *)(v2 + v5) = v6;
  *(void *)(v2 + *(void *)(*(void *)v2 + 112)) = MEMORY[0x263F8EE80];
  *(unsigned char *)(v2 + *(void *)(*(void *)v2 + 120)) = 0;
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = 0;
  return v1;
}

uint64_t sub_24A05067C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26974F450);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750C48);
  v4[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752260);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F0);
  v4[20] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for CurrentLocationResult(0);
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697520E0);
  v4[24] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697500F8);
  v4[25] = v6;
  v4[26] = *(void *)(v6 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750100);
  v4[28] = v7;
  v4[29] = *(void *)(v7 - 8);
  v4[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A0508FC, 0, 0);
}

uint64_t sub_24A0508FC()
{
  if (qword_26974F348 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_269752450;
  *(void *)(v0 + 248) = qword_269752450;
  return MEMORY[0x270FA2498](sub_24A050994, v1, 0);
}

uint64_t sub_24A050994()
{
  uint64_t v1 = *(void *)(v0 + 216);
  id v2 = sub_24A0414EC(1);
  sub_24A0423C0(v1);

  return MEMORY[0x270FA2498](sub_24A050A14, 0, 0);
}

uint64_t sub_24A050A14()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[25];
  sub_24A057658();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_beginAccess();
  v0[32] = 0;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[33] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24A050B1C;
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[24];
  return MEMORY[0x270FA1F68](v6, 0, 0, v5);
}

uint64_t sub_24A050B1C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24A050C18, 0, 0);
}

uint64_t sub_24A050C18()
{
  uint64_t v1 = v0[24];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[22] + 48))(v1, 1, v0[21]) == 1) {
    goto LABEL_8;
  }
  sub_24A053204(v1, v0[23]);
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    sub_24A053268(v0[23], type metadata accessor for CurrentLocationResult);
LABEL_8:
    (*(void (**)(void, void))(v0[29] + 8))(v0[30], v0[28]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    goto LABEL_9;
  }
  uint64_t v3 = Strong;
  if (*(void *)(Strong + 32))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697520C0);
    sub_24A057688();
    swift_release();
  }
  uint64_t v4 = v0[32];
  sub_24A0576A8();
  if (v4)
  {
    uint64_t v5 = v0[29];
    uint64_t v6 = v0[30];
    uint64_t v7 = v0[28];
    uint64_t v8 = v0[23];
    swift_release();
    sub_24A053268(v8, type metadata accessor for CurrentLocationResult);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
LABEL_9:
    return v9();
  }
  uint64_t v11 = v0[20];
  sub_249F6E6C8(v0[23], v11, &qword_2697500F0);
  uint64_t v12 = type metadata accessor for CurrentLocation(0);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12);
  id v14 = (id *)v0[20];
  if (v13 == 1)
  {
    uint64_t v16 = v0[18];
    uint64_t v15 = v0[19];
    sub_249F6E790(v0[20], &qword_2697500F0);
    uint64_t v17 = sub_24A056418();
    uint64_t v18 = *(void *)(v17 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v15, 1, 1, v17);
    uint64_t v19 = *(void *)(v3 + 24);
    sub_249F6E6C8(v15, v16, &qword_269752260);
    int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
    uint64_t v22 = v0[17];
    uint64_t v21 = v0[18];
    if (v20 == 1)
    {
      sub_249F6E790(v21, &qword_269752260);
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
    }
    else
    {
      sub_24A056408();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v22, 0, 1, v34);
    }
    uint64_t v35 = v0[23];
    uint64_t v36 = v0[19];
    uint64_t v37 = v0[17];
    uint64_t v38 = (os_unfair_lock_s *)(*(void *)(v19 + *(void *)(*(void *)v19 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v38);
    swift_endAccess();
    sub_249FF700C(v37);
    swift_beginAccess();
    os_unfair_lock_unlock(v38);
    swift_endAccess();
    sub_249F6E790(v37, &qword_269750C48);
    sub_249F6E790(v36, &qword_269752260);
    sub_24A053268(v35, type metadata accessor for CurrentLocationResult);
  }
  else
  {
    uint64_t v24 = v0[16];
    id v25 = *v14;
    sub_24A053268((uint64_t)v14, type metadata accessor for CurrentLocation);
    uint64_t v26 = sub_24A057628();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56))(v24, 1, 1, v26);
    uint64_t v28 = swift_allocObject();
    swift_weakInit();
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    v29[4] = v28;
    v29[5] = v25;
    int v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v24, 1, v26);
    uint64_t v31 = v0[16];
    if (v30 == 1)
    {
      sub_249F6E790(v0[16], &qword_26974F450);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
    }
    else
    {
      sub_24A057618();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v31, v26);
      if (v29[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v32 = sub_24A0575D8();
        uint64_t v33 = v39;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
      }
    }
    if (v33 | v32)
    {
      v0[2] = 0;
      v0[3] = 0;
      v0[4] = v32;
      v0[5] = v33;
    }
    uint64_t v40 = v0[23];
    uint64_t v41 = swift_task_create();
    sub_24A053268(v40, type metadata accessor for CurrentLocationResult);
    *(void *)(v3 + 32) = v41;
    swift_release();
  }
  swift_release();
  v0[32] = 0;
  uint64_t v42 = (void *)swift_task_alloc();
  v0[33] = v42;
  *uint64_t v42 = v0;
  v42[1] = sub_24A050B1C;
  uint64_t v43 = v0[28];
  uint64_t v44 = v0[24];
  return MEMORY[0x270FA1F68](v44, 0, 0, v43);
}

uint64_t sub_24A0513B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[26] = a4;
  v5[27] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B16FAA8);
  v5[28] = swift_task_alloc();
  uint64_t v6 = sub_24A056538();
  v5[29] = v6;
  v5[30] = *(void *)(v6 - 8);
  v5[31] = swift_task_alloc();
  uint64_t v7 = sub_24A057B28();
  v5[32] = v7;
  v5[33] = *(void *)(v7 - 8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  uint64_t v8 = sub_24A057B48();
  v5[36] = v8;
  v5[37] = *(void *)(v8 - 8);
  v5[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269750C48);
  v5[39] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269752278);
  v5[40] = v9;
  v5[41] = *(void *)(v9 - 8);
  v5[42] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269752260);
  v5[43] = swift_task_alloc();
  v5[44] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24A05163C, 0, 0);
}

uint64_t sub_24A05163C()
{
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v2 = sub_24A056418();
  *(void *)(v0 + 360) = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  *(void *)(v0 + 368) = v3;
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  *(void *)(v0 + 376) = v4;
  *(void *)(v0 + 384) = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v4(v1, 1, 1, v2);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(v0 + 392) = *(void *)(Strong + 16);
    swift_retain();
    swift_release();
    sub_24A056428();
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v6;
    void *v6 = v0;
    v6[1] = sub_24A051BD4;
    uint64_t v8 = *(void *)(v0 + 336);
    uint64_t v7 = *(void *)(v0 + 344);
    uint64_t v9 = *(void *)(v0 + 216);
    return MEMORY[0x270F06EA8](v7, v9, v8, v2);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 352);
    uint64_t v11 = *(void *)(v0 + 344);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 376))(v11, 1, 1, *(void *)(v0 + 360));
    sub_24A003F9C(v11, v10, &qword_269752260);
    sub_24A0576A8();
    uint64_t v12 = swift_weakLoadStrong();
    if (v12)
    {
      uint64_t v13 = *(void *)(v0 + 360);
      uint64_t v14 = *(void *)(v0 + 368);
      uint64_t v15 = *(void *)(v0 + 352);
      uint64_t v16 = *(void *)(v12 + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13))
      {
        uint64_t v17 = *(void *)(v0 + 312);
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
      }
      else
      {
        uint64_t v19 = *(void *)(v0 + 312);
        sub_24A056408();
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
      }
      uint64_t v21 = *(void *)(v0 + 312);
      uint64_t v22 = (os_unfair_lock_s *)(*(void *)(v16 + *(void *)(*(void *)v16 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v22);
      swift_endAccess();
      sub_249FF700C(v21);
      swift_beginAccess();
      os_unfair_lock_unlock(v22);
      swift_endAccess();
      swift_release();
      sub_249F6E790(v21, &qword_269750C48);
    }
    uint64_t v24 = *(void *)(v0 + 264);
    uint64_t v23 = *(void *)(v0 + 272);
    uint64_t v25 = *(void *)(v0 + 256);
    sub_24A057B38();
    *(_OWORD *)(v0 + 184) = xmmword_24A062930;
    *(void *)(v0 + 168) = 0;
    *(void *)(v0 + 160) = 0;
    *(unsigned char *)(v0 + 176) = 1;
    uint64_t v26 = sub_24A0533D0(&qword_2697515A8, 255, MEMORY[0x263F8F710]);
    sub_24A057D88();
    sub_24A0533D0(&qword_269752280, 255, MEMORY[0x263F8F6D8]);
    sub_24A057B58();
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    *(void *)(v0 + 416) = v27;
    *(void *)(v0 + 424) = (v24 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v27(v23, v25);
    uint64_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 432) = v28;
    void *v28 = v0;
    v28[1] = sub_24A052180;
    uint64_t v30 = *(void *)(v0 + 280);
    uint64_t v29 = *(void *)(v0 + 288);
    return MEMORY[0x270FA2380](v30, v0 + 160, v29, v26);
  }
}

uint64_t sub_24A051BD4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[41] + 8))(v2[42], v2[40]);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_24A0529CC;
  }
  else {
    uint64_t v3 = sub_24A051D58;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A051D58()
{
  uint64_t v1 = *(void *)(v0 + 408);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 344);
  (*(void (**)(uint64_t, void, uint64_t, void))(v0 + 376))(v3, 0, 1, *(void *)(v0 + 360));
  sub_24A003F9C(v3, v2, &qword_269752260);
  sub_24A0576A8();
  if (v1)
  {
    sub_249F6E790(*(void *)(v0 + 352), &qword_269752260);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v7 = *(void *)(v0 + 360);
      uint64_t v8 = *(void *)(v0 + 368);
      uint64_t v9 = *(void *)(v0 + 352);
      uint64_t v10 = *(void *)(Strong + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7))
      {
        uint64_t v11 = *(void *)(v0 + 312);
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
      }
      else
      {
        uint64_t v13 = *(void *)(v0 + 312);
        sub_24A056408();
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
      }
      uint64_t v15 = *(void *)(v0 + 312);
      uint64_t v16 = (os_unfair_lock_s *)(*(void *)(v10 + *(void *)(*(void *)v10 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v16);
      swift_endAccess();
      sub_249FF700C(v15);
      swift_beginAccess();
      os_unfair_lock_unlock(v16);
      swift_endAccess();
      swift_release();
      sub_249F6E790(v15, &qword_269750C48);
    }
    uint64_t v18 = *(void *)(v0 + 264);
    uint64_t v17 = *(void *)(v0 + 272);
    uint64_t v19 = *(void *)(v0 + 256);
    sub_24A057B38();
    *(_OWORD *)(v0 + 184) = xmmword_24A062930;
    *(void *)(v0 + 168) = 0;
    *(void *)(v0 + 160) = 0;
    *(unsigned char *)(v0 + 176) = 1;
    uint64_t v20 = sub_24A0533D0(&qword_2697515A8, 255, MEMORY[0x263F8F710]);
    sub_24A057D88();
    sub_24A0533D0(&qword_269752280, 255, MEMORY[0x263F8F6D8]);
    sub_24A057B58();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    *(void *)(v0 + 416) = v21;
    *(void *)(v0 + 424) = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v21(v17, v19);
    uint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 432) = v22;
    void *v22 = v0;
    v22[1] = sub_24A052180;
    uint64_t v24 = *(void *)(v0 + 280);
    uint64_t v23 = *(void *)(v0 + 288);
    return MEMORY[0x270FA2380](v24, v0 + 160, v23, v20);
  }
}

uint64_t sub_24A052180()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 440) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 416))(*(void *)(v2 + 280), *(void *)(v2 + 256));
    uint64_t v3 = sub_24A0528C0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 296);
    uint64_t v4 = *(void *)(v2 + 304);
    uint64_t v6 = *(void *)(v2 + 288);
    (*(void (**)(void, void))(v2 + 416))(*(void *)(v2 + 280), *(void *)(v2 + 256));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_24A0522D8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24A0522D8()
{
  sub_249F6E790(*(void *)(v0 + 352), &qword_269752260);
  if (sub_24A057698())
  {
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
LABEL_3:
    return v1();
  }
  uint64_t v3 = *(void *)(v0 + 440);
  uint64_t v4 = *(void *)(v0 + 352);
  uint64_t v5 = sub_24A056418();
  *(void *)(v0 + 360) = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)(v0 + 368) = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  *(void *)(v0 + 376) = v7;
  *(void *)(v0 + 384) = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v4, 1, 1, v5);
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(v0 + 392) = *(void *)(Strong + 16);
    swift_retain();
    swift_release();
    sub_24A056428();
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 400) = v9;
    void *v9 = v0;
    v9[1] = sub_24A051BD4;
    uint64_t v11 = *(void *)(v0 + 336);
    uint64_t v10 = *(void *)(v0 + 344);
    uint64_t v12 = *(void *)(v0 + 216);
    return MEMORY[0x270F06EA8](v10, v12, v11, v5);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 352);
    uint64_t v14 = *(void *)(v0 + 344);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 376))(v14, 1, 1, *(void *)(v0 + 360));
    sub_24A003F9C(v14, v13, &qword_269752260);
    sub_24A0576A8();
    if (v3)
    {
      sub_249F6E790(*(void *)(v0 + 352), &qword_269752260);
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
      goto LABEL_3;
    }
    uint64_t v15 = swift_weakLoadStrong();
    if (v15)
    {
      uint64_t v16 = *(void *)(v0 + 360);
      uint64_t v17 = *(void *)(v0 + 368);
      uint64_t v18 = *(void *)(v0 + 352);
      uint64_t v19 = *(void *)(v15 + 24);
      swift_retain();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16))
      {
        uint64_t v20 = *(void *)(v0 + 312);
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
      }
      else
      {
        uint64_t v22 = *(void *)(v0 + 312);
        sub_24A056408();
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 0, 1, v23);
      }
      uint64_t v24 = *(void *)(v0 + 312);
      uint64_t v25 = (os_unfair_lock_s *)(*(void *)(v19 + *(void *)(*(void *)v19 + 104)) + 16);
      swift_beginAccess();
      os_unfair_lock_lock(v25);
      swift_endAccess();
      sub_249FF700C(v24);
      swift_beginAccess();
      os_unfair_lock_unlock(v25);
      swift_endAccess();
      swift_release();
      sub_249F6E790(v24, &qword_269750C48);
    }
    uint64_t v27 = *(void *)(v0 + 264);
    uint64_t v26 = *(void *)(v0 + 272);
    uint64_t v28 = *(void *)(v0 + 256);
    sub_24A057B38();
    *(_OWORD *)(v0 + 184) = xmmword_24A062930;
    *(void *)(v0 + 168) = 0;
    *(void *)(v0 + 160) = 0;
    *(unsigned char *)(v0 + 176) = 1;
    uint64_t v29 = sub_24A0533D0(&qword_2697515A8, 255, MEMORY[0x263F8F710]);
    sub_24A057D88();
    sub_24A0533D0(&qword_269752280, 255, MEMORY[0x263F8F6D8]);
    sub_24A057B58();
    uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    *(void *)(v0 + 416) = v30;
    *(void *)(v0 + 424) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v30(v26, v28);
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 432) = v31;
    *uint64_t v31 = v0;
    v31[1] = sub_24A052180;
    uint64_t v33 = *(void *)(v0 + 280);
    uint64_t v32 = *(void *)(v0 + 288);
    return MEMORY[0x270FA2380](v33, v0 + 160, v32, v29);
  }
}

uint64_t sub_24A0528C0()
{
  (*(void (**)(void, void))(v0[37] + 8))(v0[38], v0[36]);
  sub_249F6E790(v0[44], &qword_269752260);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24A0529CC()
{
  uint64_t v42 = v0;
  if (qword_26B16F9B8 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = qword_26B16FA58 + OBJC_IVAR____TtC11ClockPoster11ClockLogger_data_private;
  swift_beginAccess();
  sub_249F6E6C8(v4, v3, &qword_26B16FAA8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 224);
    sub_249FB8AA8(*(void *)(v0 + 248));
    sub_249F6E790(v5, &qword_26B16FAA8);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 240) + 32))(*(void *)(v0 + 248), *(void *)(v0 + 224), *(void *)(v0 + 232));
  }
  uint64_t v6 = *(void **)(v0 + 408);
  id v7 = v6;
  id v8 = v6;
  uint64_t v9 = sub_24A056518();
  os_log_type_t v10 = sub_24A0577B8();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = *(void **)(v0 + 408);
  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v15 = *(void *)(v0 + 232);
  if (v11)
  {
    uint64_t v40 = *(void *)(v0 + 248);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v41 = v17;
    *(_DWORD *)uint64_t v16 = 136446210;
    swift_getErrorValue();
    uint64_t v18 = sub_24A057DB8();
    *(void *)(v16 + 4) = sub_249F782DC(v18, v19, &v41);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_249F61000, v9, v10, "Cannot get weather, error: '%{public}s'", (uint8_t *)v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5BA360](v17, -1, -1);
    MEMORY[0x24C5BA360](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v40, v15);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  sub_24A0576A8();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v21 = *(void *)(v0 + 360);
    uint64_t v22 = *(void *)(v0 + 368);
    uint64_t v23 = *(void *)(v0 + 352);
    uint64_t v24 = *(void *)(Strong + 24);
    swift_retain();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v23, 1, v21))
    {
      uint64_t v25 = *(void *)(v0 + 312);
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
    }
    else
    {
      uint64_t v27 = *(void *)(v0 + 312);
      sub_24A056408();
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750BE8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
    }
    uint64_t v29 = *(void *)(v0 + 312);
    uint64_t v30 = (os_unfair_lock_s *)(*(void *)(v24 + *(void *)(*(void *)v24 + 104)) + 16);
    swift_beginAccess();
    os_unfair_lock_lock(v30);
    swift_endAccess();
    sub_249FF700C(v29);
    swift_beginAccess();
    os_unfair_lock_unlock(v30);
    swift_endAccess();
    swift_release();
    sub_249F6E790(v29, &qword_269750C48);
  }
  uint64_t v32 = *(void *)(v0 + 264);
  uint64_t v31 = *(void *)(v0 + 272);
  uint64_t v33 = *(void *)(v0 + 256);
  sub_24A057B38();
  *(_OWORD *)(v0 + 184) = xmmword_24A062930;
  *(void *)(v0 + 168) = 0;
  *(void *)(v0 + 160) = 0;
  *(unsigned char *)(v0 + 176) = 1;
  uint64_t v34 = sub_24A0533D0(&qword_2697515A8, 255, MEMORY[0x263F8F710]);
  sub_24A057D88();
  sub_24A0533D0(&qword_269752280, 255, MEMORY[0x263F8F6D8]);
  sub_24A057B58();
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
  *(void *)(v0 + 416) = v35;
  *(void *)(v0 + 424) = (v32 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v35(v31, v33);
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_24A052180;
  uint64_t v38 = *(void *)(v0 + 280);
  uint64_t v37 = *(void *)(v0 + 288);
  return MEMORY[0x270FA2380](v38, v0 + 160, v37, v34);
}

uint64_t sub_24A05300C()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeatherDataProvider()
{
  return self;
}

uint64_t sub_24A053078(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_24A0533D0(&qword_269752238, a2, (void (*)(uint64_t))type metadata accessor for WeatherDataProvider);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24A0530D0(uint64_t a1)
{
  return sub_249FF3DE4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24A0530D8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A053110()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A053150(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_249F6C87C;
  return sub_24A05067C(a1, v4, v5, v6);
}

uint64_t sub_24A053204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CurrentLocationResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A053268(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24A0532C8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24A053310(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = sub_249F9C6C0;
  return sub_24A0513B4(a1, v4, v5, v7, v6);
}

uint64_t sub_24A0533D0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t destroy for WorldMap()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorldMap(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorldMap(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v4 = *(_OWORD *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v4;
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t assignWithTake for WorldMap(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldMap(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldMap(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
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
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldMap()
{
  return &type metadata for WorldMap;
}

uint64_t sub_24A0536D8(char a1)
{
  if (a1)
  {
    sub_24A053E98(v1 + 80, (uint64_t)v3);
    sub_24A053E98((uint64_t)v3, (uint64_t)&v4);
  }
  if (qword_26974F368 != -1) {
    swift_once();
  }
  return UIPointRoundToScale();
}

uint64_t sub_24A0537E4@<X0>(void *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  double v11 = a2 + a7;
  double v12 = a3 + a6;
  double v13 = a4 - (a7 + a9);
  double v14 = a5 - (a6 + a8);
  double v15 = v9[5] - (v9[16] + v9[18]);
  double v16 = v9[6] - (v9[15] + v9[17]);
  if (v14 / v16 >= v13 / v15) {
    double v17 = v13 / v15;
  }
  else {
    double v17 = v14 / v16;
  }
  if (fabs(v17 + -1.0) <= 0.05)
  {
    uint64_t v18 = 4;
  }
  else
  {
    v24.origin.CGFloat x = a2 + a7;
    v24.origin.CGFloat y = a3 + a6;
    v24.size.CGFloat width = a4 - (a7 + a9);
    v24.size.CGFloat height = a5 - (a6 + a8);
    v25.origin.CGFloat x = v11 + (CGRectGetWidth(v24) - v15 * v17) * 0.5;
    v25.origin.CGFloat y = v12;
    v25.size.CGFloat width = v13;
    v25.size.CGFloat height = v14;
    CGRectGetHeight(v25);
    uint64_t v18 = 1;
  }
  uint64_t result = UIRectIntegralWithScale();
  *a1 = v20;
  a1[1] = v21;
  a1[2] = v22;
  a1[3] = v23;
  a1[4] = v18;
  return result;
}

uint64_t sub_24A05392C()
{
  return sub_249F7538C(*v0, v0[1], v0[2], v0[3]);
}

double sub_24A053938()
{
  *(void *)&xmmword_269752478 = 0x6946646574746F44;
  *((void *)&xmmword_269752478 + 1) = 0xEA00000000006C6CLL;
  qword_269752488 = 0xD000000000000016;
  unk_269752490 = 0x800000024A065A80;
  xmmword_269752498 = xmmword_24A0629D0;
  qword_2697524A8 = 0x4077100000000000;
  unk_2697524B0 = 0;
  *(void *)&xmmword_2697524B8 = 0;
  *((void *)&xmmword_2697524B8 + 1) = 0x4000000000000000;
  xmmword_2697524C8 = xmmword_24A0629E0;
  xmmword_2697524D8 = xmmword_24A0629F0;
  byte_2697524E8 = 0;
  unk_2697524F0 = xmmword_24A062A00;
  double result = 61.666;
  *(long long *)((char *)&xmmword_2697524F8 + 8) = xmmword_24A062A10;
  return result;
}

void sub_24A0539D8()
{
  id v0 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v0, sel_scale);
  uint64_t v2 = v1;

  qword_269752290 = v2;
}

BOOL sub_24A053A3C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  uint64_t v12 = *(void *)(a1 + 144);
  long long v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  void v11[3] = v3;
  long long v4 = *(_OWORD *)(a1 + 80);
  void v11[4] = *(_OWORD *)(a1 + 64);
  _OWORD v11[5] = v4;
  long long v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  uint64_t v14 = *(void *)(a2 + 144);
  long long v7 = *(_OWORD *)(a2 + 48);
  void v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_24A053D0C((uint64_t)v11, (uint64_t)v13);
}

uint64_t sub_24A053AD0()
{
  return sub_24A057E68();
}

uint64_t sub_24A053B2C()
{
  swift_bridgeObjectRetain();
  sub_24A057408();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A053B84()
{
  return sub_24A057E68();
}

uint64_t sub_24A053BDC()
{
  return sub_249F755F4();
}

unint64_t sub_24A053C38(uint64_t a1)
{
  unint64_t result = sub_24A053C60();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A053C60()
{
  unint64_t result = qword_269752298;
  if (!qword_269752298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269752298);
  }
  return result;
}

unint64_t sub_24A053CB8()
{
  unint64_t result = qword_2697522A0;
  if (!qword_2697522A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697522A0);
  }
  return result;
}

BOOL sub_24A053D0C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_24A057D48(), result = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = sub_24A057D48(), result = 0, (v8 & 1) != 0))
    {
      if (*(double *)(a1 + 32) != *(double *)(a2 + 32)
        || *(double *)(a1 + 40) != *(double *)(a2 + 40)
        || *(double *)(a1 + 48) != *(double *)(a2 + 48)
        || *(double *)(a1 + 56) != *(double *)(a2 + 56)
        || *(double *)(a1 + 64) != *(double *)(a2 + 64)
        || *(double *)(a1 + 72) != *(double *)(a2 + 72))
      {
        return 0;
      }
      if (*(unsigned char *)(a1 + 112))
      {
        if (!*(unsigned char *)(a2 + 112)) {
          return 0;
        }
        return *(double *)(a1 + 120) == *(double *)(a2 + 120)
            && *(double *)(a1 + 128) == *(double *)(a2 + 128)
            && *(double *)(a1 + 136) == *(double *)(a2 + 136)
            && *(double *)(a1 + 144) == *(double *)(a2 + 144);
      }
      BOOL result = 0;
      if ((*(unsigned char *)(a2 + 112) & 1) == 0
        && (~vaddv_s16((int16x4_t)vand_s8((int8x8_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 80), *(float64x2_t *)(a2 + 80)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 96), *(float64x2_t *)(a2 + 96)))), 0xFuLL)), (int8x8_t)0x8000400020001)) & 0xF) == 0)
      {
        return *(double *)(a1 + 120) == *(double *)(a2 + 120)
            && *(double *)(a1 + 128) == *(double *)(a2 + 128)
            && *(double *)(a1 + 136) == *(double *)(a2 + 136)
            && *(double *)(a1 + 144) == *(double *)(a2 + 144);
      }
    }
  }
  return result;
}

uint64_t sub_24A053E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269750108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for WorldMap.DotFillSpec()
{
  return &type metadata for WorldMap.DotFillSpec;
}

unint64_t sub_24A053F10(uint64_t a1)
{
  unint64_t result = sub_24A053F38();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24A053F38()
{
  unint64_t result = qword_2697522A8;
  if (!qword_2697522A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697522A8);
  }
  return result;
}

void sub_24A054138()
{
  uint64_t v1 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon;
  if (!*(void *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon]) {
    return;
  }
  swift_bridgeObjectRetain();
  id v2 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83610]);
  id v3 = objc_msgSend(self, sel_configurationWithFont_, v2);

  id v4 = v3;
  char v5 = (void *)sub_24A057368();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v5, v4);

  BOOL v7 = *(void **)&v0[v1];
  if (!v7)
  {
    __break(1u);
    goto LABEL_17;
  }
  objc_msgSend(v7, sel_setImage_, v6);
  char v8 = *(void **)&v0[v1];
  if (v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics + 24])
  {
    if (!v8)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    objc_msgSend(v8, sel_setContentMode_, 1);
  }
  else
  {
    if (!v8)
    {
LABEL_19:
      __break(1u);
      return;
    }
    id v9 = v8;
    if (objc_msgSend(v0, sel__shouldReverseLayoutDirection)) {
      uint64_t v10 = 12;
    }
    else {
      uint64_t v10 = 11;
    }
    objc_msgSend(v9, sel_setContentMode_, v10);
  }
  double v11 = *(void **)&v0[v1];
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v13 = v11;
  id v12 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v13, sel_setTintColor_, v12);
}

void sub_24A054378()
{
  v30.receiver = v0;
  v30.super_class = (Class)type metadata accessor for AlarmComplicationView();
  objc_msgSendSuper2(&v30, sel_layoutSubviews);
  sub_24A05471C();
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v31);
  id v1 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v1, sel_displayScale);

  UIRoundToScale();
  double v3 = v2;
  id v4 = (double *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics];
  if ((v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics + 24] & 1) == 0)
  {
    uint64_t v26 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
    if (v26)
    {
      id v27 = v26;
      objc_msgSend(v0, sel_frame);
      objc_msgSend(v27, sel_setFrame_, 0.0, 0.0, CGRectGetWidth(v35), v3);

      uint64_t v28 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel];
      if (v28)
      {
        id v22 = v28;
        objc_msgSend(v0, sel_frame);
        objc_msgSend(v22, sel_setFrame_, 0.0, v3, CGRectGetWidth(v36), v3);
LABEL_14:

        return;
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v5 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel;
  id v6 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel];
  if (!v6)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v7 = v6;
  objc_msgSend(v0, sel_frame);
  objc_msgSend(v7, sel_sizeThatFits_, v8, v9);
  double v11 = v10;

  double v12 = v4[2];
  objc_msgSend(v0, sel_frame);
  CGRectGetWidth(v32);
  id v13 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v13, sel_displayScale);

  UIRoundToScale();
  double v15 = v14;
  objc_msgSend(v0, sel_frame);
  CGRectGetHeight(v33);
  id v16 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v16, sel_displayScale);

  UIRoundToScale();
  double v18 = v17;
  id v19 = objc_msgSend(v0, sel_effectiveUserInterfaceLayoutDirection);
  uint64_t v20 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
  if (v19 == (id)1)
  {
    if (v20)
    {
      objc_msgSend(v20, sel_setFrame_, v11 + v15, v18, v12, v3);
      uint64_t v21 = *(void **)&v0[v5];
      if (v21)
      {
        id v22 = v21;
        objc_msgSend(v0, sel_frame);
        double Width = CGRectGetWidth(v34);
        CGRect v24 = v22;
        double v25 = v15;
LABEL_13:
        objc_msgSend(v24, sel_setFrame_, v25, v18, Width, v3);
        goto LABEL_14;
      }
      goto LABEL_19;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v20)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v20, sel_setFrame_, v15, v18, v12, v3);
  uint64_t v29 = *(void **)&v0[v5];
  if (v29)
  {
    id v22 = v29;
    objc_msgSend(v0, sel_frame);
    double Width = CGRectGetWidth(v37);
    CGRect v24 = v22;
    double v25 = v12 + v15;
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
}

void sub_24A05471C()
{
  id v1 = v0;
  uint64_t v2 = sub_24A056238();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel;
  if (!*(void *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmTimeLabel])
  {
    id v7 = sub_24A019AA8(*(double *)&v0[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_metrics]);
    double v8 = *(void **)&v0[v6];
    *(void *)&v0[v6] = v7;

    double v9 = *(void **)&v0[v6];
    if (v9)
    {
      id v10 = v9;
      double v11 = (void *)sub_24A057368();
      id v12 = objc_msgSend(self, sel_textProviderWithText_, v11);

      objc_msgSend(v10, sel_setTextProvider_, v12);
      id v13 = *(void **)&v1[v6];
      if (v13)
      {
        double v14 = self;
        id v15 = v13;
        id v16 = objc_msgSend(v14, sel_whiteColor);
        uint64_t v17 = swift_allocObject();
        *(void *)(v17 + 16) = v16;
        id v18 = objc_allocWithZone(MEMORY[0x263F825C8]);
        aBlock[4] = sub_249FDA534;
        void aBlock[5] = v17;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_249FDA198;
        aBlock[3] = &block_descriptor_17;
        id v19 = _Block_copy(aBlock);
        id v20 = v16;
        id v21 = objc_msgSend(v18, sel_initWithDynamicProvider_, v19);
        _Block_release(v19);

        swift_release();
        objc_msgSend(v15, sel_setTextColor_, v21);

        id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
        uint64_t v23 = OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon;
        CGRect v24 = *(void **)&v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon];
        *(void *)&v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_alarmIcon] = v22;

        if (*(void *)&v1[v23])
        {
          objc_msgSend(v1, sel_addSubview_);
          if (*(void *)&v1[v6])
          {
            objc_msgSend(v1, sel_addSubview_);
            sub_24A054138();
            if (!*(void *)&v1[v6]) {
              return;
            }
            (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, &v1[OBJC_IVAR____TtC11ClockPoster21AlarmComplicationView_fireDate], v2);
            double v25 = (void *)sub_24A056198();
            id v26 = objc_msgSend(self, sel_textProviderWithDate_, v25);

            (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
            id v27 = *(void **)&v1[v6];
            if (v27)
            {
              objc_msgSend(v27, sel_setTextProvider_, v26);

              return;
            }
LABEL_14:
            __break(1u);
            return;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

id sub_24A054ACC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AlarmComplicationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A054B94()
{
  return type metadata accessor for AlarmComplicationView();
}

uint64_t type metadata accessor for AlarmComplicationView()
{
  uint64_t result = qword_2697522C0;
  if (!qword_2697522C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24A054BE8()
{
  uint64_t result = sub_24A056238();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AlarmComplicationView.Metrics(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AlarmComplicationView.Metrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmComplicationView.Metrics()
{
  return &type metadata for AlarmComplicationView.Metrics;
}

uint64_t sub_24A054D34()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

unsigned char *storeEnumTagSinglePayload for AlarmComplicationView.Metrics.IconPosition(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x24A054E50);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AlarmComplicationView.Metrics.IconPosition()
{
  return &type metadata for AlarmComplicationView.Metrics.IconPosition;
}

unint64_t sub_24A054E8C()
{
  unint64_t result = qword_2697522D0;
  if (!qword_2697522D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697522D0);
  }
  return result;
}

char *sub_24A054EE0(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView] = 0;
  uint64_t v9 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView;
  id v10 = v4;
  *(void *)&v4[v9] = sub_24A05529C();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for PlayClockFaceView();
  double v11 = (char *)objc_msgSendSuper2(&v13, sel_initWithFrame_, a1, a2, a3, a4);
  *(void *)(*(void *)&v11[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView]
            + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_delegate
            + 8) = &off_26FDECB48;
  swift_unknownObjectWeakAssign();
  return v11;
}

uint64_t sub_24A05508C(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors;
  *(void *)(v1 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_tintColors) = a1;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + v2);
  if (v4)
  {
    uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView);
    *(void *)(*(void *)(v5 + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeLabel) + 32) = v4;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    sub_249F8BAA0();
    *(void *)(*(void *)(v5 + OBJC_IVAR____TtC11ClockPoster15RollingTimeView_offScreenTimeLabel) + 32) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_249F8BAA0();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A055148()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for PlayClockFaceView();
  objc_msgSendSuper2(&v6, sel_layoutSubviews);
  id v1 = objc_msgSend(v0, sel_subviews);
  sub_249F88C30();
  unint64_t v2 = sub_24A057568();

  id v3 = *(id *)&v0[OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_timeView];
  char v4 = sub_249FB87C4((uint64_t)v3, v2);
  swift_bridgeObjectRelease();

  if ((v4 & 1) == 0) {
    objc_msgSend(v0, sel_addSubview_, v3);
  }
  objc_msgSend(v3, sel_setFrame_, sub_24A019730());
  objc_msgSend(v0, sel_bounds);
  UIRectGetCenter();
  objc_msgSend(v3, sel_setCenter_);
  return objc_msgSend(v0, sel_setClipsToBounds_, 1);
}

uint64_t sub_24A05529C()
{
  type metadata accessor for RollingTimeView();
  uint64_t v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (qword_26974F2D0 != -1) {
    swift_once();
  }
  id v1 = (void *)qword_269752370;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_timeLabel];
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = qword_269752370;
  id v4 = v1;

  unint64_t v5 = *(void *)(v2 + 16);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_24A057BD8();
    uint64_t v6 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v6) {
      goto LABEL_12;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x24C5B92B0](i, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * i + 32);
    }
    id v10 = v9;
    objc_msgSend(v9, sel_setFont_, *(void *)(v2 + 24));
  }
LABEL_12:
  swift_bridgeObjectRelease_n();

  uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_offScreenTimeLabel];
  id v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v1;
  id v13 = v4;

  unint64_t v14 = *(void *)(v11 + 16);
  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (v15) {
      goto LABEL_14;
    }
LABEL_21:

    swift_bridgeObjectRelease_n();
    v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_blurColon] = 1;
    *(void *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_overlap] = 0x403E000000000000;
    sub_24A0573A8();
    id v19 = objc_allocWithZone(MEMORY[0x263F157C8]);
    id v20 = (void *)sub_24A057368();
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v19, sel_initWithType_, v20);

    id v22 = *(void **)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter];
    *(void *)&v0[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_compositingFilter] = v21;
    id v23 = v21;

    CGRect v24 = v0;
    sub_249FCF6F8((uint64_t)v24, (uint64_t)v24);

    v24[OBJC_IVAR____TtC11ClockPoster15RollingTimeView_transformModifier] = 1;
    unint64_t v25 = swift_bridgeObjectRetain();
    sub_249FCD3AC(v25);
    swift_bridgeObjectRelease();
    unint64_t v26 = swift_bridgeObjectRetain();
    sub_249FCD3AC(v26);
    swift_bridgeObjectRelease();
    return (uint64_t)v24;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24A057BD8();
  uint64_t v15 = result;
  if (!result) {
    goto LABEL_21;
  }
LABEL_14:
  if (v15 >= 1)
  {
    for (uint64_t j = 0; j != v15; ++j)
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v17 = (id)MEMORY[0x24C5B92B0](j, v14);
      }
      else {
        id v17 = *(id *)(v14 + 8 * j + 32);
      }
      id v18 = v17;
      objc_msgSend(v17, sel_setFont_, *(void *)(v11 + 24));
    }
    goto LABEL_21;
  }
LABEL_23:
  __break(1u);
  return result;
}

id sub_24A05560C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlayClockFaceView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PlayClockFaceView()
{
  return self;
}

void sub_24A0556D0(NSObject *a1, double a2)
{
  id v3 = *(void **)(v2 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_alarmComplicationView);
  if (v3)
  {
    id v4 = *(void **)(v2 + OBJC_IVAR____TtC11ClockPoster17PlayClockFaceView_onDeckAlarmComplicationView);
    if (v4)
    {
      id v7 = self;
      id v8 = v3;
      id v9 = v4;
      objc_msgSend(v7, sel_begin);
      if (qword_26974F2D8 != -1) {
        swift_once();
      }
      objc_msgSend(v7, sel_setAnimationTimingFunction_, qword_269752378);
      dispatch_group_enter(a1);
      id v10 = self;
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v8;
      id v27 = sub_24A055C94;
      uint64_t v28 = v11;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v24 = 1107296256;
      unint64_t v25 = sub_249F892E0;
      unint64_t v26 = &block_descriptor_18;
      id v12 = _Block_copy(&aBlock);
      id v22 = v8;
      swift_release();
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = a1;
      id v27 = sub_24A055CC0;
      uint64_t v28 = v13;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v24 = 1107296256;
      unint64_t v25 = sub_249FCE184;
      unint64_t v26 = &block_descriptor_19;
      unint64_t v14 = _Block_copy(&aBlock);
      uint64_t v15 = a1;
      swift_release();
      objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v12, v14, 0.166666667, a2);
      _Block_release(v14);
      _Block_release(v12);
      dispatch_group_enter(v15);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v9;
      id v27 = sub_24A055CC8;
      uint64_t v28 = v16;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v24 = 1107296256;
      unint64_t v25 = sub_249F892E0;
      unint64_t v26 = &block_descriptor_25_0;
      id v17 = _Block_copy(&aBlock);
      id v18 = v9;
      swift_release();
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = v15;
      id v27 = sub_24A055CDC;
      uint64_t v28 = v19;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v24 = 1107296256;
      unint64_t v25 = sub_249FCE184;
      unint64_t v26 = &block_descriptor_31;
      id v20 = _Block_copy(&aBlock);
      id v21 = v15;
      swift_release();
      objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v17, v20, 0.5, a2 + 0.166666667 + 0.5);
      _Block_release(v20);
      _Block_release(v17);
      objc_msgSend(v7, sel_commit);
    }
  }
}

void sub_24A055A88(void *a1, void *a2)
{
  if (a1)
  {
    id v23 = a1;
    id v3 = objc_msgSend(a2, sel_text);
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = sub_24A0573A8();
      uint64_t v7 = v6;

      uint64_t v8 = qword_26974F2F0;
      swift_bridgeObjectRetain();
      if (v8 != -1) {
        swift_once();
      }
      uint64_t v9 = qword_269752390;
      if (!*(void *)(qword_269752390 + 16) || (unint64_t v10 = sub_24A0152F0(v5, v7), (v11 & 1) == 0))
      {

        swift_bridgeObjectRelease_n();
        return;
      }
      uint64_t v12 = *(void *)(v9 + 56) + 40 * v10;
      double v13 = *(double *)v12;
      double v14 = *(double *)(v12 + 8);
      double v15 = *(double *)(v12 + 16);
      double v16 = *(double *)(v12 + 24);
      id v17 = *(id *)(v12 + 32);
      swift_bridgeObjectRelease_n();
      id v18 = objc_msgSend(v23, sel_superview);

      if (!v18) {
        objc_msgSend(a2, sel_addSubview_, v23);
      }
      objc_msgSend(a2, sel__tightBoundingRectOfFirstLine);
      objc_msgSend(v23, sel_setFrame_, v19 - v13, v14 + v20, v15, v16);
      id v22 = v17;
      sub_249F7BD50((uint64_t)v22);

      id v21 = v22;
    }
    else
    {
      id v21 = v23;
    }
  }
}

uint64_t sub_24A055C5C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24A055C94()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 0.0);
}

uint64_t block_copy_helper_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_18()
{
  return swift_release();
}

void sub_24A055CC0()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

id sub_24A055CC8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, 1.0);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24A055D38()
{
  return MEMORY[0x270EEDF80]();
}

uint64_t sub_24A055D48()
{
  return MEMORY[0x270EEDFA8]();
}

uint64_t sub_24A055D58()
{
  return MEMORY[0x270EEE048]();
}

uint64_t sub_24A055D68()
{
  return MEMORY[0x270EEE068]();
}

uint64_t sub_24A055D78()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24A055D88()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_24A055D98()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_24A055DA8()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_24A055DB8()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_24A055DC8()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_24A055DD8()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_24A055DE8()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_24A055DF8()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_24A055E08()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_24A055E18()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_24A055E28()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_24A055E38()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_24A055E48()
{
  return MEMORY[0x270EEE8D8]();
}

uint64_t sub_24A055E58()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24A055E68()
{
  return MEMORY[0x270EEEA00]();
}

uint64_t sub_24A055E78()
{
  return MEMORY[0x270EEEA40]();
}

uint64_t sub_24A055E88()
{
  return MEMORY[0x270F816B0]();
}

uint64_t sub_24A055E98()
{
  return MEMORY[0x270F816C0]();
}

uint64_t sub_24A055EA8()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_24A055EB8()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_24A055EC8()
{
  return MEMORY[0x270EFEB18]();
}

uint64_t sub_24A055ED8()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_24A055EE8()
{
  return MEMORY[0x270EEEBC0]();
}

uint64_t sub_24A055EF8()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_24A055F08()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24A055F18()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_24A055F28()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_24A055F38()
{
  return MEMORY[0x270EEF040]();
}

uint64_t sub_24A055F48()
{
  return MEMORY[0x270EEF050]();
}

uint64_t sub_24A055F58()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_24A055F68()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24A055F78()
{
  return MEMORY[0x270EEF180]();
}

uint64_t sub_24A055F88()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24A055F98()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24A055FA8()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24A055FB8()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_24A055FC8()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_24A055FD8()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_24A055FE8()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_24A055FF8()
{
  return MEMORY[0x270EEF810]();
}

uint64_t sub_24A056008()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_24A056018()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_24A056028()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24A056038()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24A056048()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_24A056058()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_24A056068()
{
  return MEMORY[0x270EF0400]();
}

uint64_t sub_24A056078()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_24A056088()
{
  return MEMORY[0x270EF0430]();
}

uint64_t sub_24A056098()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_24A0560A8()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_24A0560B8()
{
  return MEMORY[0x270EF04D0]();
}

uint64_t sub_24A0560C8()
{
  return MEMORY[0x270EF04E8]();
}

uint64_t sub_24A0560D8()
{
  return MEMORY[0x270EF0508]();
}

uint64_t sub_24A0560E8()
{
  return MEMORY[0x270EF0518]();
}

uint64_t sub_24A0560F8()
{
  return MEMORY[0x270EF05A0]();
}

uint64_t sub_24A056108()
{
  return MEMORY[0x270EF05B8]();
}

uint64_t sub_24A056118()
{
  return MEMORY[0x270EF05F0]();
}

uint64_t sub_24A056128()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_24A056138()
{
  return MEMORY[0x270EF0690]();
}

uint64_t sub_24A056148()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_24A056158()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24A056168()
{
  return MEMORY[0x270EF07B8]();
}

uint64_t sub_24A056178()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24A056188()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24A056198()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24A0561A8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24A0561B8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24A0561C8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_24A0561D8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24A0561E8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24A0561F8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24A056208()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_24A056218()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_24A056228()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24A056238()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A056258()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24A056268()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A056278()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_24A056288()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_24A056298()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24A0562A8()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_24A0562B8()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_24A0562C8()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_24A0562D8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24A0562E8()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_24A0562F8()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_24A056308()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_24A056318()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_24A056328()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_24A056338()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_24A056348()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24A056358()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24A056368()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_24A056378()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24A056388()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24A056398()
{
  return MEMORY[0x270EF1570]();
}

uint64_t sub_24A0563A8()
{
  return MEMORY[0x270EF15A0]();
}

uint64_t sub_24A0563B8()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_24A0563C8()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_24A0563D8()
{
  return MEMORY[0x270EF15E0]();
}

uint64_t sub_24A0563E8()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_24A0563F8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24A056408()
{
  return MEMORY[0x270F06CC0]();
}

uint64_t sub_24A056418()
{
  return MEMORY[0x270F06D78]();
}

uint64_t sub_24A056428()
{
  return MEMORY[0x270F06E80]();
}

uint64_t sub_24A056448()
{
  return MEMORY[0x270F06EB0]();
}

uint64_t sub_24A056458()
{
  return MEMORY[0x270F06EB8]();
}

uint64_t sub_24A056468()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_24A056478()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_24A056488()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_24A056498()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_24A0564A8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_24A0564B8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_24A0564C8()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_24A0564D8()
{
  return MEMORY[0x270EF17B8]();
}

uint64_t sub_24A0564E8()
{
  return MEMORY[0x270EF17D0]();
}

uint64_t sub_24A0564F8()
{
  return MEMORY[0x270EF17E0]();
}

uint64_t sub_24A056508()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24A056518()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A056528()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A056538()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A056548()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_24A056558()
{
  return MEMORY[0x270F81B18]();
}

uint64_t sub_24A056568()
{
  return MEMORY[0x270F81B20]();
}

uint64_t sub_24A056578()
{
  return MEMORY[0x270F81B30]();
}

uint64_t sub_24A056588()
{
  return MEMORY[0x270F81B38]();
}

uint64_t sub_24A056598()
{
  return MEMORY[0x270F81B40]();
}

uint64_t sub_24A0565A8()
{
  return MEMORY[0x270EE2B98]();
}

uint64_t sub_24A0565B8()
{
  return MEMORY[0x270EE2BB8]();
}

uint64_t sub_24A0565C8()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_24A0565D8()
{
  return MEMORY[0x270EE2EE8]();
}

uint64_t sub_24A0565E8()
{
  return MEMORY[0x270EE3040]();
}

uint64_t sub_24A0565F8()
{
  return MEMORY[0x270EE3048]();
}

uint64_t sub_24A056608()
{
  return MEMORY[0x270EE3058]();
}

uint64_t sub_24A056618()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_24A056628()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_24A056638()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24A056648()
{
  return MEMORY[0x270EFEE28]();
}

uint64_t sub_24A056668()
{
  return MEMORY[0x270EFEE60]();
}

uint64_t sub_24A056678()
{
  return MEMORY[0x270EFEE68]();
}

uint64_t sub_24A056688()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24A056698()
{
  return MEMORY[0x270EFEFF0]();
}

uint64_t sub_24A0566A8()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24A0566B8()
{
  return MEMORY[0x270EFF4A8]();
}

uint64_t sub_24A0566C8()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_24A0566D8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24A0566E8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24A0566F8()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_24A056708()
{
  return MEMORY[0x270EFF618]();
}

uint64_t sub_24A056718()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_24A056728()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_24A056738()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_24A056748()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24A056758()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_24A056768()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_24A056778()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_24A056788()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_24A056798()
{
  return MEMORY[0x270EFFA60]();
}

uint64_t sub_24A0567A8()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_24A0567B8()
{
  return MEMORY[0x270EFFDC0]();
}

uint64_t sub_24A0567C8()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_24A0567D8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_24A0567E8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24A0567F8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24A056808()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_24A056818()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_24A056828()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24A056838()
{
  return MEMORY[0x270F00740]();
}

uint64_t sub_24A056848()
{
  return MEMORY[0x270F00748]();
}

uint64_t sub_24A056858()
{
  return MEMORY[0x270F00750]();
}

uint64_t sub_24A056868()
{
  return MEMORY[0x270F00758]();
}

uint64_t sub_24A056878()
{
  return MEMORY[0x270F00760]();
}

uint64_t sub_24A056888()
{
  return MEMORY[0x270F00788]();
}

uint64_t sub_24A056898()
{
  return MEMORY[0x270F00790]();
}

uint64_t sub_24A0568A8()
{
  return MEMORY[0x270F00798]();
}

uint64_t sub_24A0568B8()
{
  return MEMORY[0x270F007A0]();
}

uint64_t sub_24A0568C8()
{
  return MEMORY[0x270F007A8]();
}

uint64_t sub_24A0568D8()
{
  return MEMORY[0x270F007B0]();
}

uint64_t sub_24A0568E8()
{
  return MEMORY[0x270F007B8]();
}

uint64_t sub_24A0568F8()
{
  return MEMORY[0x270F007C0]();
}

uint64_t sub_24A056908()
{
  return MEMORY[0x270F007C8]();
}

uint64_t sub_24A056918()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_24A056928()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_24A056938()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_24A056948()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_24A056958()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24A056968()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24A056978()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_24A056988()
{
  return MEMORY[0x270F00C48]();
}

uint64_t sub_24A056998()
{
  return MEMORY[0x270F00C60]();
}

uint64_t sub_24A0569A8()
{
  return MEMORY[0x270F00C68]();
}

uint64_t sub_24A0569B8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24A0569C8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24A0569D8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24A0569E8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24A0569F8()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24A056A08()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24A056A18()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_24A056A28()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_24A056A38()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24A056A48()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24A056A58()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_24A056A68()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24A056A78()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_24A056A88()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_24A056A98()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24A056AA8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24A056AB8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24A056AC8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24A056AD8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24A056AE8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24A056AF8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24A056B08()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_24A056B18()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24A056B28()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24A056B38()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24A056B48()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24A056B68()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24A056B78()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24A056B88()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24A056B98()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24A056BA8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24A056BB8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24A056BD8()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24A056BE8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24A056BF8()
{
  return MEMORY[0x270F01CA0]();
}

uint64_t sub_24A056C08()
{
  return MEMORY[0x270F01CA8]();
}

uint64_t sub_24A056C18()
{
  return MEMORY[0x270F02268]();
}

uint64_t sub_24A056C28()
{
  return MEMORY[0x270F02270]();
}

uint64_t sub_24A056C38()
{
  return MEMORY[0x270F02450]();
}

uint64_t sub_24A056C48()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_24A056C58()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_24A056C68()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24A056C78()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24A056C88()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24A056C98()
{
  return MEMORY[0x270F02AB8]();
}

uint64_t sub_24A056CA8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24A056CB8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24A056CC8()
{
  return MEMORY[0x270F02CA0]();
}

uint64_t sub_24A056CD8()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_24A056CE8()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_24A056CF8()
{
  return MEMORY[0x270F02F00]();
}

uint64_t sub_24A056D08()
{
  return MEMORY[0x270F02F10]();
}

uint64_t sub_24A056D18()
{
  return MEMORY[0x270F02F30]();
}

uint64_t sub_24A056D28()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24A056D38()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_24A056D48()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24A056D58()
{
  return MEMORY[0x270F030C0]();
}

uint64_t sub_24A056D68()
{
  return MEMORY[0x270F030C8]();
}

uint64_t sub_24A056D78()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24A056D88()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24A056D98()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24A056DA8()
{
  return MEMORY[0x270EE3098]();
}

uint64_t sub_24A056DB8()
{
  return MEMORY[0x270EE30B0]();
}

uint64_t sub_24A056DC8()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24A056DD8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24A056DE8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24A056DF8()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_24A056E08()
{
  return MEMORY[0x270F03578]();
}

uint64_t sub_24A056E18()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24A056E28()
{
  return MEMORY[0x270F036E0]();
}

uint64_t sub_24A056E38()
{
  return MEMORY[0x270F037B0]();
}

uint64_t sub_24A056E48()
{
  return MEMORY[0x270F03F00]();
}

uint64_t sub_24A056E58()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24A056E68()
{
  return MEMORY[0x270F041E0]();
}

uint64_t sub_24A056E78()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_24A056E98()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24A056EA8()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24A056EB8()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_24A056EC8()
{
  return MEMORY[0x270F043C8]();
}

uint64_t sub_24A056ED8()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_24A056EE8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24A056EF8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24A056F08()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24A056F18()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_24A056F28()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24A056F38()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_24A056F48()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24A056F58()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24A056F68()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24A056F78()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24A056F88()
{
  return MEMORY[0x270F045B8]();
}

uint64_t sub_24A056F98()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24A056FA8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24A056FB8()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_24A056FC8()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_24A056FD8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_24A056FE8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24A056FF8()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24A057008()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24A057018()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24A057028()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24A057038()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_24A057048()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24A057058()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24A057068()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24A057078()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24A057088()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_24A057098()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_24A0570A8()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_24A0570B8()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_24A0570C8()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_24A0570D8()
{
  return MEMORY[0x270F04A40]();
}

uint64_t sub_24A0570E8()
{
  return MEMORY[0x270F04AD0]();
}

uint64_t sub_24A0570F8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24A057108()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_24A057118()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_24A057128()
{
  return MEMORY[0x270EE3100]();
}

uint64_t sub_24A057138()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24A057148()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_24A057158()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_24A057168()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_24A057178()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_24A057188()
{
  return MEMORY[0x270F04F60]();
}

uint64_t sub_24A057198()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24A0571A8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24A0571B8()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_24A0571C8()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_24A0571D8()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_24A0571E8()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_24A0571F8()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_24A057208()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_24A057218()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24A057228()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24A057238()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_24A057248()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_24A057258()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_24A057268()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24A057278()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24A057288()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24A057298()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24A0572A8()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24A0572B8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24A0572C8()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24A0572D8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24A0572E8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A0572F8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24A057308()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24A057318()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24A057328()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24A057338()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_24A057348()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24A057358()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24A057368()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A057378()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_24A057388()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24A057398()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A0573A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A0573B8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24A0573C8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24A0573D8()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24A0573E8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_24A0573F8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24A057408()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A057418()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24A057428()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24A057438()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A057448()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_24A057458()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24A057468()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24A057478()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24A057498()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24A0574A8()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_24A0574B8()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_24A0574C8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24A0574D8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24A0574E8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24A0574F8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24A057508()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24A057518()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24A057528()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24A057538()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24A057548()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A057558()
{
  return MEMORY[0x270EF1B98]();
}

uint64_t sub_24A057568()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24A057578()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24A057588()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A057598()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24A0575A8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24A0575B8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24A0575C8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24A0575D8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24A0575F8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24A057608()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24A057618()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24A057628()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24A057638()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24A057648()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24A057658()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24A057678()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24A057688()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24A057698()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24A0576A8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24A0576C8()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_24A0576D8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_24A0576F8()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_24A057708()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24A057718()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24A057728()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24A057738()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24A057748()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_24A057758()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_24A057768()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24A057778()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24A057788()
{
  return MEMORY[0x270EF1D30]();
}

uint64_t sub_24A057798()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24A0577A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24A0577B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24A0577C8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24A0577D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A0577E8()
{
  return MEMORY[0x270EE58B8]();
}

uint64_t sub_24A0577F8()
{
  return MEMORY[0x270EE58D8]();
}

uint64_t sub_24A057808()
{
  return MEMORY[0x270EE58E8]();
}

uint64_t sub_24A057818()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_24A057828()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24A057838()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24A057848()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24A057858()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24A057868()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24A057878()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24A057888()
{
  return MEMORY[0x270F825F0]();
}

uint64_t sub_24A057898()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_24A0578A8()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_24A0578B8()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_24A0578C8()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_24A0578D8()
{
  return MEMORY[0x270EF2028]();
}

uint64_t sub_24A0578E8()
{
  return MEMORY[0x270F828B8]();
}

uint64_t sub_24A0578F8()
{
  return MEMORY[0x270F828C0]();
}

uint64_t sub_24A057908()
{
  return MEMORY[0x270F82928]();
}

uint64_t sub_24A057918()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_24A057928()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_24A057938()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24A057948()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24A057958()
{
  return MEMORY[0x270EF21E8]();
}

uint64_t sub_24A057968()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24A057978()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24A057988()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24A057998()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_24A0579A8()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_24A0579B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24A0579C8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24A0579D8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A0579E8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24A0579F8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24A057A08()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24A057A18()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24A057A28()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24A057A38()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24A057A48()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24A057A58()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_24A057A68()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_24A057A78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A057A88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24A057A98()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A057AA8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24A057AB8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24A057AC8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24A057AD8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24A057AE8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24A057AF8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24A057B08()
{
  return MEMORY[0x270FA2188]();
}

uint64_t sub_24A057B18()
{
  return MEMORY[0x270FA2190]();
}

uint64_t sub_24A057B28()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24A057B38()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24A057B48()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24A057B58()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24A057B68()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_24A057B78()
{
  return MEMORY[0x270F9ED50]();
}

uint64_t sub_24A057B88()
{
  return MEMORY[0x270F9ED58]();
}

uint64_t sub_24A057B98()
{
  return MEMORY[0x270F9ED60]();
}

uint64_t sub_24A057BA8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A057BB8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24A057BC8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24A057BD8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A057BE8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A057BF8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A057C08()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A057C18()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24A057C28()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_24A057C38()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24A057C48()
{
  return MEMORY[0x270F9F248]();
}

uint64_t sub_24A057C58()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24A057C68()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24A057C78()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_24A057C88()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24A057C98()
{
  return MEMORY[0x270F9F388]();
}

uint64_t sub_24A057CA8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24A057CB8()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24A057CC8()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_24A057CD8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24A057CE8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24A057CF8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24A057D08()
{
  return MEMORY[0x270F9F548]();
}

uint64_t sub_24A057D18()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_24A057D28()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t sub_24A057D38()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_24A057D48()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A057D58()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24A057D68()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24A057D78()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A057D88()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24A057DA8()
{
  return MEMORY[0x270FA2398]();
}

uint64_t sub_24A057DB8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24A057DC8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24A057DD8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24A057DE8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24A057DF8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24A057E08()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_24A057E28()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A057E38()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A057E48()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24A057E58()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24A057E68()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24A057E78()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_24A057E88()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_24A057E98()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_24A057EA8()
{
  return MEMORY[0x270F9FD48]();
}

uint64_t sub_24A057EB8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24A057EC8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24A057ED8()
{
  return MEMORY[0x270F9FF50]();
}

uint64_t sub_24A057EE8()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_24A057EF8()
{
  return MEMORY[0x270F9FFC8]();
}

uint64_t sub_24A057F08()
{
  return MEMORY[0x270F9FFE0]();
}

uint64_t sub_24A057F18()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_24A057F48()
{
  return MEMORY[0x270FA0128]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMake(CGAffineTransform *__return_ptr retstr, CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE5990](retstr, a, b, c, d, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return MEMORY[0x270EE7158]((__n128)point1, *(__n128 *)&point1.y, (__n128)point2, *(__n128 *)&point2.y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

uint64_t CLKDegreesToRadians()
{
  return MEMORY[0x270EE3178]();
}

uint64_t CLKHourMinuteSecondAnglesForTime()
{
  return MEMORY[0x270EE31A0]();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return MEMORY[0x270F16920]();
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x270EE9C00](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x270EE9E50](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return MEMORY[0x270F77268]();
}

uint64_t TextToFourCharCode()
{
  return MEMORY[0x270F247A8]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F82CB8]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x270F82D20]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x270F82E48]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x270F82E50]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x270F82E78]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

uint64_t UIRectIntegralWithViewScale()
{
  return MEMORY[0x270F82ED8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F82F18]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x270F109A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
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

uint64_t noise2()
{
  return MEMORY[0x270F54158]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

long double remainder(long double __x, long double __y)
{
  MEMORY[0x270EDB1D8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}