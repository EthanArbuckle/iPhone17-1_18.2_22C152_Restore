id sub_2C54()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DSFriend();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DSFriend()
{
  return self;
}

void type metadata accessor for DSSourceName(uint64_t a1)
{
}

void type metadata accessor for DSParticipationRole(uint64_t a1)
{
}

void sub_2D28(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2D70(uint64_t a1, uint64_t a2)
{
  return sub_3094(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_2D88(uint64_t a1, id *a2)
{
  uint64_t result = sub_9558();
  *a2 = 0;
  return result;
}

uint64_t sub_2E00(uint64_t a1, id *a2)
{
  char v3 = sub_9568();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2E80@<X0>(void *a1@<X8>)
{
  sub_9578();
  NSString v2 = sub_9548();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2EC4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_9548();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2F0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9578();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2F38(uint64_t a1)
{
  uint64_t v2 = sub_3038(&qword_11A78);
  uint64_t v3 = sub_3038((unint64_t *)&unk_11A80);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2FD0()
{
  return sub_3038(&qword_11A60);
}

uint64_t sub_3004()
{
  return sub_3038(&qword_11A68);
}

uint64_t sub_3038(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSourceName(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_307C(uint64_t a1, uint64_t a2)
{
  return sub_3094(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_3094(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_9578();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_30D8()
{
  sub_9578();
  sub_9598();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_312C()
{
  sub_9578();
  sub_9708();
  sub_9598();
  Swift::Int v0 = sub_9718();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_31A0()
{
  uint64_t v0 = sub_9578();
  uint64_t v2 = v1;
  if (v0 == sub_9578() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_96E8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_322C()
{
  return sub_3038(&qword_11A70);
}

uint64_t sub_3270()
{
  uint64_t v0 = sub_9538();
  sub_8034(v0, qword_11C10);
  uint64_t v1 = sub_6E38(v0, (uint64_t)qword_11C10);
  if (qword_11948 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_6E38(v0, (uint64_t)qword_121C0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_3338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  sub_6DF4(&qword_11D70);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_9538();
  sub_6E38(v9, (uint64_t)qword_11C10);
  v10 = sub_9518();
  os_log_type_t v11 = sub_9648();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v18 = a2;
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    uint64_t v19 = sub_76CC(0xD000000000000021, 0x800000000000A230, &v20);
    a2 = v18;
    sub_9658();
    _os_log_impl(&dword_0, v10, v11, "%{public}s Attempting to fetch shared resources", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v13 = sub_9628();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v3;
  v14[5] = a1;
  v14[6] = a2;
  v14[7] = ObjectType;
  id v15 = v3;
  swift_retain();
  sub_3A9C((uint64_t)v8, (uint64_t)&unk_11DE0, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_35C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[6] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_365C;
  return sub_3D70();
}

uint64_t sub_365C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v5 = sub_37FC;
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    char v5 = sub_3784;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_3784()
{
  (*(void (**)(void, void))(v0 + 32))(*(void *)(v0 + 64), 0);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_37FC()
{
  v12 = v0;
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_9538();
  sub_6E38(v1, (uint64_t)qword_11C10);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_9518();
  os_log_type_t v3 = sub_9638();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    char v5 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446466;
    v0[2] = sub_76CC(0xD000000000000021, 0x800000000000A230, &v11);
    sub_9658();
    *(_WORD *)(v4 + 12) = 2114;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v6;
    sub_9658();
    *char v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "%{public}s error %{public}@", (uint8_t *)v4, 0x16u);
    sub_6DF4(&qword_11DF8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v7 = v0[7];
  v8 = (void (*)(void *, uint64_t))v0[4];
  swift_errorRetain();
  v8(&_swiftEmptyArrayStorage, v7);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_3A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9628();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_9618();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_89E0(a1, &qword_11D70);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_9608();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_3CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_6DF4(&qword_11E88);
  v5.super.isa = sub_95C8().super.isa;
  if (a2) {
    uint64_t v6 = sub_9428();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

uint64_t sub_3D70()
{
  v1[11] = v0;
  uint64_t v2 = sub_94C8();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v3 = sub_9498();
  v1[15] = v3;
  v1[16] = *(void *)(v3 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  return _swift_task_switch(sub_3ED4, 0, 0);
}

uint64_t sub_3ED4()
{
  uint64_t v8 = v0;
  v0[7] = &_swiftEmptyArrayStorage;
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_9538();
  v0[20] = sub_6E38(v1, (uint64_t)qword_11C10);
  uint64_t v2 = sub_9518();
  os_log_type_t v3 = sub_9648();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    v0[10] = sub_76CC(0xD000000000000010, 0x800000000000A210, &v7);
    sub_9658();
    _os_log_impl(&dword_0, v2, v3, "%{public}s Attempting to fetch friends following my location", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v0[21] = *(void *)(v0[11]
                     + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session);
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[22] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_4118;
  return Session.friendsFollowingMyLocation()();
}

uint64_t sub_4118(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 184) = a1;
  *(void *)(v3 + 192) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_4BC4;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_4298;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_4298()
{
  v90 = v0;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_9518();
  os_log_type_t v2 = sub_9648();
  if (os_log_type_enabled(v1, v2))
  {
    Class super_class = v0[11].super_class;
    uint64_t v4 = swift_slowAlloc();
    v89[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446466;
    v0[4].id receiver = (id)sub_76CC(0xD000000000000010, 0x800000000000A210, v89);
    sub_9658();
    *(_WORD *)(v4 + 12) = 2048;
    v0[4].Class super_class = (Class)*((void *)super_class + 2);
    sub_9658();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v1, v2, "%{public}s Got friends sharing with me: %ld", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  id v5 = objc_allocWithZone((Class)CNContactStore);
  uint64_t v6 = CNContactIdentifierKey;
  id v7 = [v5 init];
  sub_6DF4(&qword_11CF8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_A9F0;
  *(void *)(v8 + 32) = v6;
  v89[0] = v8;
  sub_95D8();
  uint64_t v9 = v6;
  sub_6DF4(&qword_11D60);
  Class isa = sub_95C8().super.isa;
  swift_bridgeObjectRelease();
  v0[3].id receiver = 0;
  id v11 = objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", isa, &v0[3]);

  id receiver = v0[3].receiver;
  Class v13 = v0[11].super_class;
  id v80 = v11;
  if (v11)
  {
    uint64_t v14 = *((void *)v13 + 2);
    if (v14)
    {
      v78 = v0 + 2;
      id v15 = (unsigned __int8 *)v0[8].receiver;
      v84 = (void (*)(Class))*((void *)v15 + 2);
      v16 = (char *)v13 + ((v15[80] + 32) & ~(unint64_t)v15[80]);
      v83 = (void (**)(id, id))((char *)v0[6].super_class + 8);
      uint64_t v17 = (void (**)(id, Class))(v15 + 8);
      uint64_t v77 = *((void *)v15 + 9);
      id v18 = receiver;
      uint64_t v19 = v16;
      v79 = v9;
      p_Class super_class = &v0[3].super_class;
      v82 = v17;
      v88 = v0;
      while (1)
      {
        v86 = v19;
        uint64_t v87 = v14;
        id v23 = v0[9].receiver;
        Class v22 = v0[9].super_class;
        id v24 = v0[7].receiver;
        Class v25 = v0[7].super_class;
        id v26 = v88[6].receiver;
        v84(v22);
        ((void (*)(id, Class, Class))v84)(v23, v22, v25);
        v27 = (objc_class *)type metadata accessor for DSFriend();
        v28 = (char *)objc_allocWithZone(v27);
        *(void *)&v28[OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_role] = 2;
        v29 = v28;
        sub_9488();
        uint64_t v30 = sub_94A8();
        uint64_t v32 = v31;
        v33 = *v83;
        (*v83)(v24, v26);
        v34 = (uint64_t *)&v29[OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendIdentifier];
        uint64_t *v34 = v30;
        v34[1] = v32;
        sub_9488();
        uint64_t v35 = sub_94B8();
        uint64_t v37 = v36;
        id v38 = v26;
        uint64_t v0 = v88;
        v81 = v33;
        v33(v24, v38);
        v39 = (uint64_t *)&v29[OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendContactIdentifier];
        uint64_t *v39 = v35;
        v39[1] = v37;

        v88[2].id receiver = v29;
        v88[2].Class super_class = v27;
        v40 = [(objc_super *)v78 init];
        v41 = *v82;
        (*v82)(v23, v25);
        v85 = v40;
        uint64_t v42 = *(uint64_t *)((char *)&v40->receiver
                         + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendContactIdentifier);
        uint64_t v43 = *(uint64_t *)((char *)&v40->super_class
                         + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendContactIdentifier);
        swift_bridgeObjectRetain();
        id v44 = [v80 identifier];
        uint64_t v45 = sub_9578();
        uint64_t v47 = v46;

        if (!v43) {
          break;
        }
        if (v42 == v45 && v43 == v47)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v48 = sub_96E8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v48 & 1) == 0) {
            goto LABEL_17;
          }
        }
        v49 = sub_9518();
        os_log_type_t v50 = sub_9648();
        if (os_log_type_enabled(v49, v50))
        {
          v51 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_0, v49, v50, "Found myself as a friend, skipping adding to the participants", v51, 2u);
          swift_slowDealloc();
        }

        uint64_t v9 = v79;
        uint64_t v20 = v87;
        v21 = v85;
LABEL_8:

        v41(v88[9].super_class, v88[7].super_class);
        uint64_t v19 = &v86[v77];
        uint64_t v14 = v20 - 1;
        if (!v14) {
          goto LABEL_28;
        }
      }
      swift_bridgeObjectRelease();
LABEL_17:
      ((void (*)(Class, Class, Class))v84)(v88[8].super_class, v88[9].super_class, v88[7].super_class);
      v52 = sub_9518();
      os_log_type_t v53 = sub_9648();
      BOOL v54 = os_log_type_enabled(v52, v53);
      Class v55 = v88[8].super_class;
      if (v54)
      {
        id v56 = v88[7].receiver;
        id v57 = v88[6].receiver;
        Class v75 = v88[7].super_class;
        uint64_t v58 = swift_slowAlloc();
        v89[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = 141558275;
        *(void *)(v58 + 4) = 1752392040;
        *(_WORD *)(v58 + 12) = 2081;
        sub_9488();
        sub_8858();
        uint64_t v59 = sub_96D8();
        v60 = v41;
        unint64_t v62 = v61;
        v81(v56, v57);
        *(void *)(v58 + 14) = sub_76CC(v59, v62, v89);
        v41 = v60;
        swift_bridgeObjectRelease();
        v60(v55, v75);
        _os_log_impl(&dword_0, v52, v53, "Appending %{private,mask.hash}s to participants", (uint8_t *)v58, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v41(v88[8].super_class, v88[7].super_class);
      }

      uint64_t v9 = v79;
      v21 = v85;
      v63 = v85;
      sub_95B8();
      if (*(void *)((char *)&dword_10 + (*p_super_class & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                                + (*p_super_class & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_95E8();
      sub_95F8();
      sub_95D8();
      uint64_t v20 = v87;
      goto LABEL_8;
    }
    id v67 = receiver;
LABEL_28:
    swift_bridgeObjectRelease();
    Class v68 = v0[3].super_class;
    v69 = (objc_class *)type metadata accessor for DSPeopleSharedResouce();
    v70 = (char *)objc_allocWithZone(v69);
    *(void *)&v70[OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation21DSPeopleSharedResouce_dsFriends] = v68;
    v0[1].id receiver = v70;
    v0[1].Class super_class = v69;
    id v71 = objc_msgSendSuper2(v0 + 1, "init");
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_A9F0;
    *(void *)(v72 + 32) = v71;
    v89[0] = v72;
    sub_95D8();
    uint64_t v73 = v89[0];

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v74 = (uint64_t (*)(uint64_t))v0->super_class;
    return v74(v73);
  }
  else
  {
    id v64 = receiver;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_9438();

    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v65 = (uint64_t (*)(void))v0->super_class;
    return v65();
  }
}

uint64_t sub_4BC4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_4E04(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v7 = (uint64_t (__cdecl *)())((char *)&dword_11E80 + dword_11E80);
  swift_unknownObjectRetain();
  a3;
  id v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  *id v5 = v3;
  v5[1] = sub_91A8;
  return v7();
}

uint64_t sub_4ED8(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  sub_6DF4(&qword_11CD8);
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_9478();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  return _swift_task_switch(sub_4FC8, 0, 0);
}

uint64_t sub_4FC8()
{
  uint64_t v19 = v0;
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_9538();
  sub_6E38(v1, (uint64_t)qword_11C10);
  swift_unknownObjectRetain_n();
  os_log_type_t v2 = sub_9518();
  os_log_type_t v3 = sub_9648();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[6];
  if (v4)
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446466;
    v0[3] = sub_76CC(0xD00000000000001DLL, 0x800000000000A150, &v18);
    sub_9658();
    *(_WORD *)(v6 + 12) = 2080;
    v0[4] = v5;
    swift_unknownObjectRetain();
    sub_6DF4(&qword_11CF0);
    uint64_t v7 = sub_9588();
    v0[5] = sub_76CC(v7, v8, &v18);
    sub_9658();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_0, v2, v3, "%{public}s Attempting to stop sharing with participant: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  type metadata accessor for DSFriend();
  uint64_t v9 = swift_dynamicCastClass();
  v0[12] = v9;
  if (v9)
  {
    uint64_t v10 = v0[7];
    uint64_t v11 = OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session;
    v0[13] = OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session;
    v0[14] = *(void *)(v10 + v11);
    swift_unknownObjectRetain();
    swift_retain();
    v12 = (void *)swift_task_alloc();
    v0[15] = v12;
    void *v12 = v0;
    v12[1] = sub_53FC;
    return Session.friendsFollowingMyLocation()();
  }
  else
  {
    Class v13 = sub_9518();
    os_log_type_t v14 = sub_9638();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136446210;
      v0[2] = sub_76CC(0xD00000000000001DLL, 0x800000000000A150, &v18);
      sub_9658();
      _os_log_impl(&dword_0, v13, v14, "%{public}s Shared resource isn't the right type", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
}

uint64_t sub_53FC(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_58A0;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 136) = a1;
    uint64_t v5 = sub_552C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_552C()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  swift_unknownObjectRetain();
  uint64_t v6 = sub_84F4(v1, v2);
  v0[18] = v6;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v0[19] = *(void *)(v5 + v3);
  uint64_t v7 = sub_94C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  swift_retain();
  unint64_t v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  void *v8 = v0;
  v8[1] = sub_567C;
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[8];
  return Session.stopSharingMyLocation(with:from:isFromGroup:)(v9, v6, v10, 0);
}

uint64_t sub_567C()
{
  uint64_t v2 = *v1;
  (*v1)[21] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_89E0(v2[8], &qword_11CD8);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_5924;
  }
  else
  {
    uint64_t v5 = v2[10];
    uint64_t v4 = v2[11];
    unint64_t v8 = v2 + 8;
    uint64_t v7 = v2[8];
    uint64_t v6 = v8[1];
    swift_release();
    swift_bridgeObjectRelease();
    sub_89E0(v7, &qword_11CD8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_5828;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_5828()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_58A0()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_5924()
{
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_5B1C(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[5] = v6;
  void *v6 = v3;
  v6[1] = sub_5BE0;
  return sub_4ED8(a1);
}

uint64_t sub_5BE0()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 24);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  swift_unknownObjectRelease();

  uint64_t v7 = *(void *)(v3 + 32);
  if (v2)
  {
    uint64_t v8 = (void *)sub_9428();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

uint64_t sub_5D80()
{
  v1[3] = v0;
  uint64_t v2 = sub_9498();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  uint64_t v3 = sub_94C8();
  v1[7] = v3;
  v1[8] = *(void *)(v3 - 8);
  v1[9] = swift_task_alloc();
  sub_6DF4(&qword_11CD8);
  v1[10] = swift_task_alloc();
  uint64_t v4 = sub_9478();
  v1[11] = v4;
  v1[12] = *(void *)(v4 - 8);
  v1[13] = swift_task_alloc();
  return _swift_task_switch(sub_5F28, 0, 0);
}

uint64_t sub_5F28()
{
  uint64_t v10 = v0;
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_9538();
  sub_6E38(v1, (uint64_t)qword_11C10);
  uint64_t v2 = sub_9518();
  os_log_type_t v3 = sub_9648();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    v0[2] = sub_76CC(0xD000000000000010, 0x8000000000009EE0, &v9);
    sub_9658();
    _os_log_impl(&dword_0, v2, v3, "%{public}s Attempting to stop all sharing", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = v0[3];
  uint64_t v6 = OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session;
  v0[14] = OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation35FindMyPeopleDigitalSeparationSource_session;
  v0[15] = *(void *)(v5 + v6);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_6134;
  return Session.friendsFollowingMyLocation()();
}

uint64_t sub_6134(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_6704;
  }
  else
  {
    swift_release();
    uint64_t v4 = sub_6250;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_6250()
{
  uint64_t v1 = v0[17];
  v0[19] = *(void *)(v0[3] + v0[14]);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[8];
    uint64_t v4 = v0[5];
    v21 = &_swiftEmptyArrayStorage;
    swift_retain();
    sub_7D24(0, v2, 0);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v5 = v4 + 16;
    uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64));
    uint64_t v19 = *(void *)(v5 + 56);
    uint64_t v20 = v6;
    uint64_t v8 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = v0[6];
      uint64_t v10 = v0[4];
      v20(v9, v7, v10);
      sub_9488();
      (*(void (**)(uint64_t, uint64_t))(v5 - 8))(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_7D24(0, v8[2] + 1, 1);
        uint64_t v8 = v21;
      }
      unint64_t v12 = v8[2];
      unint64_t v11 = v8[3];
      if (v12 >= v11 >> 1)
      {
        sub_7D24(v11 > 1, v12 + 1, 1);
        uint64_t v8 = v21;
      }
      uint64_t v13 = v0[9];
      uint64_t v14 = v0[7];
      v8[2] = v12 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v12, v13, v14);
      v21 = v8;
      v7 += v19;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRelease();
    uint64_t v8 = &_swiftEmptyArrayStorage;
  }
  v0[20] = v8;
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[8] + 56))(v0[10], 1, 1, v0[7]);
  id v15 = (void *)swift_task_alloc();
  v0[21] = v15;
  *id v15 = v0;
  v15[1] = sub_64CC;
  uint64_t v16 = v0[13];
  uint64_t v17 = v0[10];
  return Session.stopSharingMyLocation(with:from:isFromGroup:)(v16, v8, v17, 0);
}

uint64_t sub_64CC()
{
  int64_t v2 = *v1;
  (*v1)[22] = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_89E0(v2[10], &qword_11CD8);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = sub_6798;
  }
  else
  {
    uint64_t v5 = v2[12];
    uint64_t v4 = v2[13];
    uint64_t v8 = v2 + 10;
    uint64_t v7 = v2[10];
    uint64_t v6 = v8[1];
    swift_bridgeObjectRelease();
    swift_release();
    sub_89E0(v7, &qword_11CD8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_6678;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_6678()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6704()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_6798()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_698C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6A34;
  return sub_5D80();
}

uint64_t sub_6A34()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_9428();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id sub_6D50()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for FindMyPeopleDigitalSeparationSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FindMyPeopleDigitalSeparationSource()
{
  return self;
}

uint64_t sub_6DF4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6E38(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_6E70(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6F4C;
  return v6(a1);
}

uint64_t sub_6F4C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_7044(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_91A0;
  return v6();
}

uint64_t sub_7110(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_91A0;
  return v7();
}

uint64_t sub_71DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_9628();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_9618();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_89E0(a1, &qword_11D70);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_9608();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_7388(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_91AC;
  return v6(a1);
}

uint64_t sub_7464(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_6DF4(&qword_11CE8);
  uint64_t v10 = *(void *)(sub_94C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_9698();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_94C8() - 8);
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
    sub_839C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_76CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_77A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_7D94((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_7D94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_7D44((uint64_t)v12);
  return v7;
}

uint64_t sub_77A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_9668();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_795C(a5, a6);
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
  uint64_t v8 = sub_9688();
  if (!v8)
  {
    sub_9698();
    __break(1u);
LABEL_17:
    uint64_t result = sub_96B8();
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

uint64_t sub_795C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_79F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_7BD4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_7BD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_79F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_7B6C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_9678();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_9698();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_95A8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_96B8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_9698();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_7B6C(uint64_t a1, uint64_t a2)
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
  sub_6DF4(&qword_11CE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_7BD4(char a1, int64_t a2, char a3, char *a4)
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
    sub_6DF4(&qword_11CE0);
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
  uint64_t result = sub_96B8();
  __break(1u);
  return result;
}

uint64_t sub_7D24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_7DF4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_7D44(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_7D94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7DF4(char a1, int64_t a2, char a3, void *a4)
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
  sub_6DF4(&qword_11CE8);
  uint64_t v10 = *(void *)(sub_94C8() - 8);
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
  uint64_t v16 = *(void *)(sub_94C8() - 8);
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
  v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_96B8();
  __break(1u);
  return result;
}

uint64_t *sub_8034(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_8098()
{
  *(void *)(v1 + 24) = v0;
  return _swift_task_switch(sub_80B8, 0, 0);
}

uint64_t sub_80B8()
{
  uint64_t v8 = v0;
  if (qword_11940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_9538();
  sub_6E38(v1, (uint64_t)qword_11C10);
  uint64_t v2 = sub_9518();
  os_log_type_t v3 = sub_9648();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)unint64_t v4 = 136446210;
    *(void *)(v0 + 16) = sub_76CC(0x72616853706F7473, 0xEF293A5F28676E69, &v7);
    sub_9658();
    _os_log_impl(&dword_0, v2, v3, "%{public}s Attempting to stop all sharing, only one resource.", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v5;
  *size_t v5 = v0;
  v5[1] = sub_82A8;
  return sub_5D80();
}

uint64_t sub_82A8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_839C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_94C8() - 8);
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
  uint64_t result = sub_96B8();
  __break(1u);
  return result;
}

char *sub_84F4(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = sub_94C8();
  uint64_t v5 = *(void *)(v40 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v39 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v32 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v35 = (char *)v32 - v12;
  __chkstk_darwin(v11);
  v34 = (char *)v32 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  v32[2] = v2;
  uint64_t v15 = *(void *)(sub_9498() - 8);
  uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v17 = *(void *)(a2 + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendIdentifier + 8);
  uint64_t v38 = *(void *)(a2 + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation8DSFriend_friendIdentifier);
  uint64_t v37 = *(void *)(v15 + 72);
  uint64_t v36 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v33 = v5;
  unint64_t v18 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  v32[1] = a1;
  swift_bridgeObjectRetain();
  uint64_t v19 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    sub_9488();
    uint64_t v20 = sub_94A8();
    uint64_t v22 = v21;
    (*v36)(v10, v40);
    if (v20 == v38 && v22 == v17)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v23 = sub_96E8();
      swift_bridgeObjectRelease();
      if ((v23 & 1) == 0) {
        goto LABEL_4;
      }
    }
    id v24 = v35;
    sub_9488();
    Class v25 = *v18;
    id v26 = v34;
    v27 = v24;
    uint64_t v28 = v40;
    (*v18)(v34, v27, v40);
    v25(v39, v26, v28);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v19 = (char *)sub_7464(0, *((void *)v19 + 2) + 1, 1, (unint64_t)v19);
    }
    unint64_t v30 = *((void *)v19 + 2);
    unint64_t v29 = *((void *)v19 + 3);
    if (v30 >= v29 >> 1) {
      uint64_t v19 = (char *)sub_7464(v29 > 1, v30 + 1, 1, (unint64_t)v19);
    }
    *((void *)v19 + 2) = v30 + 1;
    v25(&v19[((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(void *)(v33 + 72) * v30], v39, v40);
LABEL_4:
    v16 += v37;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v19;
}

unint64_t sub_8858()
{
  unint64_t result = qword_11D68;
  if (!qword_11D68)
  {
    sub_94C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_11D68);
  }
  return result;
}

uint64_t sub_88B0()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_88F8()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 40);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_91A0;
  *(_OWORD *)(v2 + 32) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_365C;
  return sub_3D70();
}

uint64_t sub_89E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6DF4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_8A3C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8A74(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8B2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_11DE8 + dword_11DE8);
  return v6(a1, v4);
}

uint64_t sub_8B2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_8C20()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8C60()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_91A0;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_11E00 + dword_11E00);
  return v5(v2, v3);
}

uint64_t sub_8D10()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_91A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_11E10 + dword_11E10);
  return v6(v2, v3, v4);
}

uint64_t sub_8DD4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_91A0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_11E20 + dword_11E20);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_8EA0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_91A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_11E30 + dword_11E30);
  return v6(a1, v4);
}

uint64_t sub_8F5C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_8B2C;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_11E40 + dword_11E40);
  return v6(v2, v3, v4);
}

uint64_t sub_901C()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_9064()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_91A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_11E60 + dword_11E60);
  return v6(v2, v3, v4);
}

uint64_t sub_9120()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_9160()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_9198(uint64_t a1, uint64_t a2)
{
  sub_3CD4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_926C()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC29FindMyPeopleDigitalSeparation21DSPeopleSharedResouce_dsFriends);
  swift_bridgeObjectRetain();
  if (v1 >> 62)
  {
    sub_6DF4(&qword_11CF0);
    uint64_t v3 = sub_96A8();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    sub_96F8();
    return v1;
  }
}

id sub_933C()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for DSPeopleSharedResouce();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DSPeopleSharedResouce()
{
  return self;
}

uint64_t sub_93A4()
{
  uint64_t v0 = sub_9538();
  sub_8034(v0, qword_121C0);
  sub_6E38(v0, (uint64_t)qword_121C0);
  return sub_9528();
}

uint64_t sub_9428()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_9438()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_9448()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t sub_9458()
{
  return type metadata accessor for RequestOrigin();
}

uint64_t sub_9468()
{
  return RequestOrigin.init(_:)();
}

uint64_t sub_9478()
{
  return type metadata accessor for FriendshipRequestResult();
}

uint64_t sub_9488()
{
  return Friend.handle.getter();
}

uint64_t sub_9498()
{
  return type metadata accessor for Friend();
}

uint64_t sub_94A8()
{
  return Handle.identifier.getter();
}

uint64_t sub_94B8()
{
  return Handle.contactIdentifier.getter();
}

uint64_t sub_94C8()
{
  return type metadata accessor for Handle();
}

uint64_t sub_94F8()
{
  return type metadata accessor for Session();
}

uint64_t sub_9508()
{
  return Session.init(_:)();
}

uint64_t sub_9518()
{
  return Logger.logObject.getter();
}

uint64_t sub_9528()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_9538()
{
  return type metadata accessor for Logger();
}

NSString sub_9548()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_9558()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_9568()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_9578()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_9588()
{
  return String.init<A>(describing:)();
}

uint64_t sub_9598()
{
  return String.hash(into:)();
}

Swift::Int sub_95A8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_95B8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_95C8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_95D8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_95E8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_95F8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_9608()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_9618()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_9628()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_9638()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_9648()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_9658()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_9668()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_9678()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_9688()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_9698()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_96A8()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_96B8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_96D8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_96E8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_96F8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_9708()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_9718()
{
  return Hasher._finalize()();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}