uint64_t sub_2FCC()
{
  uint64_t v0;

  v0 = sub_12898();
  sub_D5D4(v0, qword_1DA48);
  sub_D4F0(v0, (uint64_t)qword_1DA48);
  return sub_12878();
}

uint64_t sub_3028()
{
  ObjectType = (objc_class *)swift_getObjectType();
  v2 = (void *)DSSourceNameNotes;
  *(void *)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_name] = DSSourceNameNotes;
  uint64_t v3 = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext;
  *(void *)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v4 = self;
  v5 = v0;
  id v6 = v2;
  if ([v4 isRunningUnitTests]) {
    uint64_t v7 = 4915760;
  }
  else {
    uint64_t v7 = 1573396;
  }
  v8 = self;
  [v8 startSharedContextWithOptions:v7];
  id v9 = [v8 sharedContext];
  if (v9)
  {
    v10 = v9;
    id v11 = [v9 managedObjectContext];
  }
  else
  {
    id v11 = 0;
  }
  *(void *)&v5[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_viewContext] = v11;
  id v12 = [v8 sharedContext];
  if (v12)
  {
    v13 = v12;
    id v14 = [v12 workerManagedObjectContext];
  }
  else
  {
    id v14 = 0;
  }
  v15 = *(void **)&v0[v3];
  *(void *)&v0[v3] = v14;

  v35.receiver = v5;
  v35.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v35, "init");
  v17 = self;
  v18 = (char *)v16;
  id v19 = [v17 sharedContext];
  uint64_t v20 = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext;
  v21 = *(void **)&v18[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext];
  *(void *)&v18[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext] = v19;

  v22 = *(void **)&v18[v20];
  if (v22) {
    [v22 setCloudContextDelegate:v18];
  }
  id v23 = [self sharedInstance];
  uint64_t v24 = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController;
  v25 = *(void **)&v18[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController];
  *(void *)&v18[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController] = v23;

  v26 = *(void **)&v18[v24];
  if (v26) {
    [v26 setCollaborationControllerDelegate:v18];
  }
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_12898();
  sub_D4F0(v27, (uint64_t)qword_1DA48);
  v28 = sub_12888();
  os_log_type_t v29 = sub_129E8();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_0, v28, v29, "init :: Perform and wait on viewContext", v30, 2u);
    swift_slowDealloc();
  }

  v31 = *(void **)&v18[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_viewContext];
  if (!v31) {
    goto LABEL_20;
  }
  v34[4] = sub_352C;
  v34[5] = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 1107296256;
  v34[2] = sub_3558;
  v34[3] = &unk_18CB8;
  v32 = _Block_copy(v34);
  swift_release();
  [v31 performBlockAndWait:v32];
  _Block_release(v32);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
LABEL_20:
    sub_3580();

    return (uint64_t)v18;
  }
  return result;
}

void sub_3408()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_12898();
  sub_D4F0(v0, (uint64_t)qword_1DA48);
  v1 = sub_12888();
  os_log_type_t v2 = sub_129E8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "init :: Calling ICNoteContext refreshAll", v3, 2u);
    swift_slowDealloc();
  }

  id v4 = [self sharedContext];
  [v4 refreshAll];
}

uint64_t sub_3530(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_3558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_3580()
{
  v1 = v0;
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_12898();
  sub_D4F0(v2, (uint64_t)qword_1DA48);
  uint64_t v3 = sub_12888();
  os_log_type_t v4 = sub_129E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "commonInit :: Perform and wait on MOC", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = *(void **)&v0[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext];
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v0;
    uint64_t v8 = swift_allocObject();
    id v9 = sub_E190;
    *(void *)(v8 + 16) = sub_E190;
    *(void *)(v8 + 24) = v7;
    v20[4] = sub_E3F0;
    v20[5] = v8;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 1107296256;
    v20[2] = sub_3558;
    v20[3] = &unk_18D30;
    v10 = _Block_copy(v20);
    id v11 = v6;
    id v12 = v0;
    swift_retain();
    swift_release();
    [v11 performBlockAndWait:v10];

    _Block_release(v10);
    LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
    __break(1u);
  }
  id v9 = 0;
LABEL_9:
  v13 = sub_12888();
  os_log_type_t v14 = sub_129E8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "commonInit :: Setting up cloudContext", v15, 2u);
    swift_slowDealloc();
  }

  uint64_t v16 = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext;
  v17 = *(void **)&v1[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext];
  if (v17)
  {
    [v17 setQualityOfService:33];
    v18 = *(void **)&v1[v16];
    if (v18) {
      [v18 setDisableRetryTimer:1];
    }
  }
  return sub_E1A8((uint64_t)v9);
}

id sub_3884(uint64_t a1)
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_12898();
  sub_D4F0(v2, (uint64_t)qword_1DA48);
  uint64_t v3 = sub_12888();
  os_log_type_t v4 = sub_129E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "commonInit :: Setting staleness interval on MOC to 0", v5, 2u);
    swift_slowDealloc();
  }

  id result = *(id *)(a1 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext);
  if (result)
  {
    return [result setStalenessInterval:0.0];
  }
  return result;
}

id sub_399C()
{
  ObjectType = (objc_class *)swift_getObjectType();
  [self clearSharedContext];
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for NotesDigitalSeparationSource()
{
  return self;
}

uint64_t sub_3B1C(uint64_t a1)
{
  *(void *)(v1 + 120) = a1;
  return _swift_task_switch(sub_3B3C, 0, 0);
}

uint64_t sub_3B3C()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  v0[16] = sub_D4F0(v1, (uint64_t)qword_1DA48);
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129E8();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "refreshCloudContext :: call sync on ICCloudContext", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[15];

  if (v5)
  {
    id v6 = (void *)v0[15];
    NSString v7 = sub_128B8();
    v0[17] = v7;
    v0[2] = v0;
    v0[3] = sub_3DC0;
    uint64_t v8 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_401C;
    v0[13] = &unk_18CA0;
    v0[14] = v8;
    [v6 syncWithReason:v7 completionHandler:v0 + 10];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    id v9 = sub_12888();
    uint64_t v10 = sub_129E8();
    if (os_log_type_enabled(v9, (os_log_type_t)v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_0, v9, (os_log_type_t)v10, "refreshCloudContext :: sync finished", v11, 2u);
      swift_slowDealloc();
    }

    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_3DC0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_3FAC;
  }
  else {
    uint64_t v2 = sub_3ED0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3ED0()
{
  uint64_t v1 = sub_12888();
  os_log_type_t v2 = sub_129E8();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "refreshCloudContext :: sync finished", v3, 2u);
    swift_slowDealloc();
  }

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_3FAC()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  os_log_type_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_401C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_D2D0((uint64_t *)&unk_1DFE0);
    uint64_t v4 = swift_allocError();
    void *v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_40B4(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_40D4, 0, 0);
}

uint64_t sub_40D4()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DA48);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint64_t *)(v0 + 16);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = v0;
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v4 = v7;
    sub_12A48();
    *id v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error occurred while syncing iCloud context: %@", v5, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v10;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_42D0(uint64_t a1, uint64_t a2)
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_12898();
  sub_D4F0(v4, (uint64_t)qword_1DA48);
  uint64_t v5 = sub_12888();
  os_log_type_t v6 = sub_129E8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "allSharedCloudObjects :: Starting fetch of cloud objects", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = self;
  sub_D4B4(0, &qword_1DC80);
  id v9 = (void *)sub_129C8();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_DB10;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_DB28;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_46C8;
  aBlock[3] = &unk_18AE8;
  id v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v8 enumerateAllCloudObjectsInContext:a1 predicate:v9 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 batchSize:10 saveAfterBatch:0 usingBlock:v12];

  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_4550(uint64_t a1, uint64_t a2, void *a3)
{
  self;
  uint64_t result = swift_dynamicCastObjCClass();
  if (result)
  {
    uint64_t v5 = (void *)result;
    swift_unknownObjectRetain();
    if ([v5 isSharedRootObject]
      && ([v5 isDeleted] & 1) == 0
      && ((self, swift_dynamicCastObjCClass()) || (self, swift_dynamicCastObjCClass())))
    {
      os_log_type_t v6 = (objc_class *)type metadata accessor for DSCloudObject();
      uint64_t v7 = (char *)objc_allocWithZone(v6);
      *(void *)&v7[OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject] = v5;
      v8.receiver = v7;
      v8.super_class = v6;
      swift_unknownObjectRetain();
      objc_msgSendSuper2(&v8, "init");
      sub_12918();
      if (*(void *)((char *)&dword_10 + (*a3 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (*a3 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_12968();
      sub_12978();
      sub_12958();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_46C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v5(a2, a3);

  return swift_unknownObjectRelease();
}

void *sub_4724(unint64_t a1, void (*a2)(void))
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_12B58();
  uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  while (v4)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        sub_12B18();
        uint64_t v6 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        a2(0);
        if (!swift_dynamicCastClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_12B38();
        sub_12B68();
        sub_12B78();
        sub_12B48();
        if (v6 == v4) {
          return &_swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      for (uint64_t j = 0; ; ++j)
      {
        uint64_t v8 = j + 1;
        if (__OFADD__(j, 1)) {
          break;
        }
        a2(0);
        uint64_t v9 = swift_dynamicCastClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v3 = v9;
        swift_unknownObjectRetain();
        sub_12B38();
        sub_12B68();
        sub_12B78();
        sub_12B48();
        if (v8 == v4) {
          return &_swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_12BA8();
    swift_bridgeObjectRelease();
    sub_12B58();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_12BA8();
    swift_bridgeObjectRelease();
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_4914(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_12B58();
  uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        sub_12B18();
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        self;
        if (!swift_dynamicCastObjCClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_12B38();
        sub_12B68();
        sub_12B78();
        sub_12B48();
        if (v4 == v2) {
          return &_swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v6 = v1 + 32;
      while (1)
      {
        uint64_t v7 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          break;
        }
        uint64_t v8 = *(void **)(v6 + 8 * v5);
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v9;
        id v10 = v8;
        sub_12B38();
        sub_12B68();
        sub_12B78();
        sub_12B48();
        ++v5;
        if (v7 == v2) {
          return &_swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_12BA8();
    swift_bridgeObjectRelease();
    sub_12B58();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_12BA8();
    swift_bridgeObjectRelease();
  }
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_4AFC(uint64_t a1, uint64_t a2)
{
  v3[38] = a2;
  v3[39] = v2;
  v3[37] = a1;
  return _swift_task_switch(sub_4B20, 0, 0);
}

uint64_t sub_4B20()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = swift_allocObject();
  v0[40] = v2;
  *(void *)(v2 + 16) = v1;
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[41] = v3;
  uint64_t v4 = sub_D2D0(&qword_1DD88);
  *uint64_t v3 = v0;
  v3[1] = sub_4C28;
  return NSManagedObjectContext.perform<A>(_:)(v0 + 36, sub_D9FC, v2, v4);
}

uint64_t sub_4C28()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_4D40, 0, 0);
}

uint64_t sub_4D40()
{
  unint64_t v1 = v0[36];
  v0[42] = v1;
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    v0[43] = v2;
    if (v2) {
      goto LABEL_3;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    id v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_12BA8();
  swift_bridgeObjectRelease();
  v0[43] = v22;
  if (!v22) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v3 = 0;
  uint64_t v4 = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController;
  v0[44] = OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext;
  v0[45] = v4;
  p_types = &stru_1CFF8.types;
  while (1)
  {
    uint64_t v9 = v0[42];
    if ((v9 & 0xC000000000000001) != 0) {
      id v10 = sub_12B18();
    }
    else {
      id v10 = *(id *)(v9 + 8 * v3 + 32);
    }
    uint64_t v7 = v10;
    v0[46] = v10;
    v0[47] = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    uint64_t v11 = *(Class *)((char *)&v10->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
    v0[48] = v11;
    id v12 = v11;
    id v13 = objc_msgSend(v12, p_types[197]);
    v0[49] = v13;
    if (v13) {
      break;
    }
    if (qword_1DA40 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_12898();
    sub_D4F0(v14, (uint64_t)qword_1DA48);
    uint64_t v8 = v12;
    v15 = sub_12888();
    os_log_type_t v16 = sub_129F8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      *(void *)(v17 + 4) = v8;
      void *v18 = v8;
      _os_log_impl(&dword_0, v15, v16, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v17, 0xCu);
      sub_D2D0(&qword_1DCB0);
      swift_arrayDestroy();
      p_types = (char **)(&stru_1CFF8 + 8);
      swift_slowDealloc();
      swift_slowDealloc();
      uint64_t v6 = v15;
    }
    else
    {

      uint64_t v6 = v8;
      uint64_t v7 = v8;
      uint64_t v8 = v15;
    }

    uint64_t v3 = v0[47];
    if (v3 == v0[43]) {
      goto LABEL_20;
    }
  }
  uint64_t v19 = swift_allocObject();
  v0[50] = v19;
  *(void *)(v19 + 16) = v12;
  id v20 = v12;
  v21 = (void *)swift_task_alloc();
  v0[51] = v21;
  void *v21 = v0;
  v21[1] = sub_50D8;
  return NSManagedObjectContext.perform<A>(_:)((char *)v0 + 481, sub_DA18, v19, &type metadata for Bool);
}

uint64_t sub_50D8()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_51F0, 0, 0);
}

uint64_t sub_51F0()
{
  if (*(unsigned char *)(v0 + 481))
  {
    uint64_t v1 = *(void **)(*(void *)(v0 + 312) + *(void *)(v0 + 360));
    *(void *)(v0 + 448) = v1;
    if (v1)
    {
      uint64_t v2 = *(void **)(v0 + 384);
      id v3 = v1;
      id v4 = [v2 objectID];
      *(void *)(v0 + 456) = v4;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 480;
      *(void *)(v0 + 24) = sub_61D8;
      uint64_t v5 = swift_continuation_init();
      *(void *)(v0 + 144) = _NSConcreteStackBlock;
      *(void *)(v0 + 152) = 0x40000000;
      *(void *)(v0 + 160) = sub_6FA8;
      *(void *)(v0 + 168) = &unk_18A08;
      *(void *)(v0 + 176) = v5;
      [v3 removeShareIfNeededWithOwnedObjectID:v4 countParticipants:0 completionHandler:v0 + 144];
      uint64_t v6 = v0 + 16;
LABEL_6:
      return _swift_continuation_await(v6);
    }
    uint64_t v8 = *(void **)(v0 + 384);
  }
  else
  {
    uint64_t v7 = *(void **)(*(void *)(v0 + 312) + *(void *)(v0 + 352));
    *(void *)(v0 + 416) = v7;
    uint64_t v8 = *(void **)(v0 + 384);
    if (v7)
    {
      sub_D2D0(&qword_1DD90);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_13470;
      *(void *)(v9 + 32) = v8;
      sub_12958();
      sub_D4B4(0, (unint64_t *)&unk_1DFF0);
      id v10 = v8;
      id v11 = v7;
      Class isa = sub_12928().super.isa;
      *(void *)(v0 + 424) = isa;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 80) = v0;
      *(void *)(v0 + 88) = sub_57A8;
      uint64_t v13 = swift_continuation_init();
      *(void *)(v0 + 184) = _NSConcreteStackBlock;
      *(void *)(v0 + 192) = 0x40000000;
      *(void *)(v0 + 200) = sub_401C;
      *(void *)(v0 + 208) = &unk_189F0;
      *(void *)(v0 + 216) = v13;
      [v11 deleteSharesForObjects:isa completionHandler:v0 + 184];
      uint64_t v6 = v0 + 80;
      goto LABEL_6;
    }
  }
  uint64_t v14 = *(void **)(v0 + 392);
  v15 = *(void **)(v0 + 368);

  uint64_t v16 = *(void *)(v0 + 376);
  if (v16 == *(void *)(v0 + 344))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  else
  {
    v18 = (char **)(&stru_1CFF8 + 8);
    p_types = &stru_1CFF8.types;
    id v20 = qword_1DA48;
    while (1)
    {
      uint64_t v26 = *(void *)(v0 + 336);
      if ((v26 & 0xC000000000000001) != 0) {
        uint64_t v27 = sub_12B18();
      }
      else {
        uint64_t v27 = *(id *)(v26 + 8 * v16 + 32);
      }
      v31 = v27;
      *(void *)(v0 + 368) = v27;
      *(void *)(v0 + 376) = v16 + 1;
      if (__OFADD__(v16, 1))
      {
        __break(1u);
        return NSManagedObjectContext.perform<A>(_:)(v27, v28, v29, v30);
      }
      v32 = *(Class *)((char *)&v27->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
      *(void *)(v0 + 384) = v32;
      id v33 = v32;
      id v34 = [v33 v18[197]];
      *(void *)(v0 + 392) = v34;
      if (v34) {
        break;
      }
      if (p_types[328] != (char *)-1) {
        swift_once();
      }
      uint64_t v35 = sub_12898();
      sub_D4F0(v35, (uint64_t)v20);
      v36 = v33;
      v37 = sub_12888();
      os_log_type_t v38 = sub_129F8();
      if (os_log_type_enabled(v37, v38))
      {
        v21 = v20;
        uint64_t v22 = p_types;
        uint64_t v23 = swift_slowAlloc();
        uint64_t v24 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 138412290;
        *(void *)(v23 + 4) = v36;
        *uint64_t v24 = v36;
        _os_log_impl(&dword_0, v37, v38, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v23, 0xCu);
        sub_D2D0(&qword_1DCB0);
        swift_arrayDestroy();
        swift_slowDealloc();
        p_types = v22;
        id v20 = v21;
        v18 = &stru_1CFF8.types;
        swift_slowDealloc();
        uint64_t v25 = v37;
      }
      else
      {

        uint64_t v25 = v36;
        v31 = v36;
        v36 = v37;
      }

      uint64_t v16 = *(void *)(v0 + 376);
      if (v16 == *(void *)(v0 + 344)) {
        goto LABEL_11;
      }
    }
    uint64_t v39 = swift_allocObject();
    *(void *)(v0 + 400) = v39;
    *(void *)(v39 + 16) = v33;
    id v40 = v33;
    v41 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v41;
    void *v41 = v0;
    v41[1] = sub_50D8;
    v30 = &type metadata for Bool;
    v28 = sub_DA18;
    uint64_t v27 = (v0 + 481);
    uint64_t v29 = v39;
    return NSManagedObjectContext.perform<A>(_:)(v27, v28, v29, v30);
  }
}

uint64_t sub_57A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 432) = v1;
  if (v1) {
    uint64_t v2 = sub_5C18;
  }
  else {
    uint64_t v2 = sub_58B8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_58B8()
{
  uint64_t v1 = *(void **)(v0 + 416);

  uint64_t v2 = *(void **)(v0 + 392);
  id v3 = *(void **)(v0 + 368);

  uint64_t v4 = *(void *)(v0 + 376);
  if (v4 == *(void *)(v0 + 344))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    p_types = (char **)(&stru_1CFF8 + 8);
    while (1)
    {
      uint64_t v11 = *(void *)(v0 + 336);
      if ((v11 & 0xC000000000000001) != 0) {
        id v12 = sub_12B18();
      }
      else {
        id v12 = *(id *)(v11 + 8 * v4 + 32);
      }
      uint64_t v16 = v12;
      *(void *)(v0 + 368) = v12;
      *(void *)(v0 + 376) = v4 + 1;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
        return NSManagedObjectContext.perform<A>(_:)(v12, v13, v14, v15);
      }
      uint64_t v17 = *(Class *)((char *)&v12->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
      *(void *)(v0 + 384) = v17;
      id v18 = v17;
      id v19 = objc_msgSend(v18, p_types[197]);
      *(void *)(v0 + 392) = v19;
      if (v19) {
        break;
      }
      if (qword_1DA40 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_12898();
      sub_D4F0(v20, (uint64_t)qword_1DA48);
      v21 = v18;
      uint64_t v22 = sub_12888();
      os_log_type_t v23 = sub_129F8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 138412290;
        *(void *)(v8 + 4) = v21;
        *uint64_t v9 = v21;
        _os_log_impl(&dword_0, v22, v23, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v8, 0xCu);
        sub_D2D0(&qword_1DCB0);
        swift_arrayDestroy();
        p_types = &stru_1CFF8.types;
        swift_slowDealloc();
        swift_slowDealloc();
        id v10 = v22;
      }
      else
      {

        id v10 = v21;
        uint64_t v16 = v21;
        v21 = v22;
      }

      uint64_t v4 = *(void *)(v0 + 376);
      if (v4 == *(void *)(v0 + 344)) {
        goto LABEL_2;
      }
    }
    uint64_t v24 = swift_allocObject();
    *(void *)(v0 + 400) = v24;
    *(void *)(v24 + 16) = v18;
    id v25 = v18;
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v26;
    void *v26 = v0;
    v26[1] = sub_50D8;
    v15 = &type metadata for Bool;
    uint64_t v13 = sub_DA18;
    id v12 = (v0 + 481);
    uint64_t v14 = v24;
    return NSManagedObjectContext.perform<A>(_:)(v12, v13, v14, v15);
  }
}

uint64_t sub_5C18()
{
  uint64_t v1 = *(void **)(v0 + 424);
  uint64_t v2 = *(void **)(v0 + 416);
  swift_willThrow();

  swift_getErrorValue();
  uint64_t v3 = sub_7278(*(void *)(v0 + 256), *(void *)(v0 + 264));
  swift_errorRelease();
  if (v3)
  {
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v4;
    void *v4 = v0;
    v4[1] = sub_6050;
    v4[3] = *(void *)(v0 + 432);
    return _swift_task_switch(sub_6DAC, 0, 0);
  }
  else
  {
    swift_errorRelease();
    uint64_t v5 = *(void **)(v0 + 392);
    uint64_t v6 = *(void **)(v0 + 368);

    uint64_t v7 = *(void *)(v0 + 376);
    if (v7 == *(void *)(v0 + 344))
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
      return v8();
    }
    else
    {
      p_types = (char **)(&stru_1CFF8 + 8);
      while (1)
      {
        uint64_t v13 = *(void *)(v0 + 336);
        if ((v13 & 0xC000000000000001) != 0) {
          uint64_t v14 = sub_12B18();
        }
        else {
          uint64_t v14 = *(id *)(v13 + 8 * v7 + 32);
        }
        id v18 = v14;
        *(void *)(v0 + 368) = v14;
        *(void *)(v0 + 376) = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
          return NSManagedObjectContext.perform<A>(_:)(v14, v15, v16, v17);
        }
        id v19 = *(Class *)((char *)&v14->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
        *(void *)(v0 + 384) = v19;
        id v20 = v19;
        id v21 = objc_msgSend(v20, p_types[197]);
        *(void *)(v0 + 392) = v21;
        if (v21) {
          break;
        }
        if (qword_1DA40 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_12898();
        sub_D4F0(v22, (uint64_t)qword_1DA48);
        os_log_type_t v23 = v20;
        uint64_t v24 = sub_12888();
        os_log_type_t v25 = sub_129F8();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v10 = swift_slowAlloc();
          uint64_t v11 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v10 = 138412290;
          *(void *)(v10 + 4) = v23;
          *uint64_t v11 = v23;
          _os_log_impl(&dword_0, v24, v25, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v10, 0xCu);
          sub_D2D0(&qword_1DCB0);
          swift_arrayDestroy();
          p_types = &stru_1CFF8.types;
          swift_slowDealloc();
          swift_slowDealloc();
          id v12 = v24;
        }
        else
        {

          id v12 = v23;
          id v18 = v23;
          os_log_type_t v23 = v24;
        }

        uint64_t v7 = *(void *)(v0 + 376);
        if (v7 == *(void *)(v0 + 344)) {
          goto LABEL_6;
        }
      }
      uint64_t v26 = swift_allocObject();
      *(void *)(v0 + 400) = v26;
      *(void *)(v26 + 16) = v20;
      id v27 = v20;
      v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 408) = v28;
      void *v28 = v0;
      v28[1] = sub_50D8;
      uint64_t v17 = &type metadata for Bool;
      v15 = sub_DA18;
      uint64_t v14 = (v0 + 481);
      uint64_t v16 = v26;
      return NSManagedObjectContext.perform<A>(_:)(v14, v15, v16, v17);
    }
  }
}

uint64_t sub_6050()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_614C, 0, 0);
}

uint64_t sub_614C()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v2 = (void *)v0[46];
  swift_willThrow();

  uint64_t v3 = (void *)v0[49];
  swift_bridgeObjectRelease();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_61D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 464) = v1;
  if (v1) {
    uint64_t v2 = sub_664C;
  }
  else {
    uint64_t v2 = sub_62E8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_62E8()
{
  uint64_t v1 = *(void **)(v0 + 448);
  uint64_t v2 = *(void **)(v0 + 392);
  uint64_t v3 = *(void **)(v0 + 368);

  uint64_t v4 = *(void *)(v0 + 376);
  if (v4 == *(void *)(v0 + 344))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
  else
  {
    p_types = (char **)(&stru_1CFF8 + 8);
    while (1)
    {
      uint64_t v11 = *(void *)(v0 + 336);
      if ((v11 & 0xC000000000000001) != 0) {
        id v12 = sub_12B18();
      }
      else {
        id v12 = *(id *)(v11 + 8 * v4 + 32);
      }
      uint64_t v16 = v12;
      *(void *)(v0 + 368) = v12;
      *(void *)(v0 + 376) = v4 + 1;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
        return NSManagedObjectContext.perform<A>(_:)(v12, v13, v14, v15);
      }
      uint64_t v17 = *(Class *)((char *)&v12->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
      *(void *)(v0 + 384) = v17;
      id v18 = v17;
      id v19 = objc_msgSend(v18, p_types[197]);
      *(void *)(v0 + 392) = v19;
      if (v19) {
        break;
      }
      if (qword_1DA40 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_12898();
      sub_D4F0(v20, (uint64_t)qword_1DA48);
      id v21 = v18;
      uint64_t v22 = sub_12888();
      os_log_type_t v23 = sub_129F8();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v8 = 138412290;
        *(void *)(v8 + 4) = v21;
        *uint64_t v9 = v21;
        _os_log_impl(&dword_0, v22, v23, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v8, 0xCu);
        sub_D2D0(&qword_1DCB0);
        swift_arrayDestroy();
        p_types = &stru_1CFF8.types;
        swift_slowDealloc();
        swift_slowDealloc();
        uint64_t v10 = v22;
      }
      else
      {

        uint64_t v10 = v21;
        uint64_t v16 = v21;
        id v21 = v22;
      }

      uint64_t v4 = *(void *)(v0 + 376);
      if (v4 == *(void *)(v0 + 344)) {
        goto LABEL_2;
      }
    }
    uint64_t v24 = swift_allocObject();
    *(void *)(v0 + 400) = v24;
    *(void *)(v24 + 16) = v18;
    id v25 = v18;
    uint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 408) = v26;
    void *v26 = v0;
    v26[1] = sub_50D8;
    v15 = &type metadata for Bool;
    uint64_t v13 = sub_DA18;
    id v12 = (v0 + 481);
    uint64_t v14 = v24;
    return NSManagedObjectContext.perform<A>(_:)(v12, v13, v14, v15);
  }
}

uint64_t sub_664C()
{
  uint64_t v1 = *(void **)(v0 + 456);
  swift_willThrow();

  swift_getErrorValue();
  uint64_t v2 = sub_7278(*(void *)(v0 + 232), *(void *)(v0 + 240));
  swift_errorRelease();
  if (v2)
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_6A84;
    v3[3] = *(void *)(v0 + 464);
    return _swift_task_switch(sub_707C, 0, 0);
  }
  else
  {
    swift_errorRelease();
    uint64_t v4 = *(void **)(v0 + 448);
    uint64_t v5 = *(void **)(v0 + 392);
    uint64_t v6 = *(void **)(v0 + 368);

    uint64_t v7 = *(void *)(v0 + 376);
    if (v7 == *(void *)(v0 + 344))
    {
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
      return v8();
    }
    else
    {
      p_types = (char **)(&stru_1CFF8 + 8);
      while (1)
      {
        uint64_t v13 = *(void *)(v0 + 336);
        if ((v13 & 0xC000000000000001) != 0) {
          uint64_t v14 = sub_12B18();
        }
        else {
          uint64_t v14 = *(id *)(v13 + 8 * v7 + 32);
        }
        id v18 = v14;
        *(void *)(v0 + 368) = v14;
        *(void *)(v0 + 376) = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
          return NSManagedObjectContext.perform<A>(_:)(v14, v15, v16, v17);
        }
        id v19 = *(Class *)((char *)&v14->isa + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject);
        *(void *)(v0 + 384) = v19;
        id v20 = v19;
        id v21 = objc_msgSend(v20, p_types[197]);
        *(void *)(v0 + 392) = v21;
        if (v21) {
          break;
        }
        if (qword_1DA40 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_12898();
        sub_D4F0(v22, (uint64_t)qword_1DA48);
        os_log_type_t v23 = v20;
        uint64_t v24 = sub_12888();
        os_log_type_t v25 = sub_129F8();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v10 = swift_slowAlloc();
          uint64_t v11 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v10 = 138412290;
          *(void *)(v10 + 4) = v23;
          *uint64_t v11 = v23;
          _os_log_impl(&dword_0, v24, v25, "Delete of share for %@ failed due to nil managedObjectContext", (uint8_t *)v10, 0xCu);
          sub_D2D0(&qword_1DCB0);
          swift_arrayDestroy();
          p_types = &stru_1CFF8.types;
          swift_slowDealloc();
          swift_slowDealloc();
          id v12 = v24;
        }
        else
        {

          id v12 = v23;
          id v18 = v23;
          os_log_type_t v23 = v24;
        }

        uint64_t v7 = *(void *)(v0 + 376);
        if (v7 == *(void *)(v0 + 344)) {
          goto LABEL_6;
        }
      }
      uint64_t v26 = swift_allocObject();
      *(void *)(v0 + 400) = v26;
      *(void *)(v26 + 16) = v20;
      id v27 = v20;
      v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 408) = v28;
      void *v28 = v0;
      v28[1] = sub_50D8;
      uint64_t v17 = &type metadata for Bool;
      v15 = sub_DA18;
      uint64_t v14 = (v0 + 481);
      uint64_t v16 = v26;
      return NSManagedObjectContext.perform<A>(_:)(v14, v15, v16, v17);
    }
  }
}

uint64_t sub_6A84()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_6B80, 0, 0);
}

uint64_t sub_6B80()
{
  uint64_t v1 = (void *)v0[48];
  uint64_t v2 = (void *)v0[49];
  uint64_t v3 = (void *)v0[46];
  swift_willThrow();

  uint64_t v4 = (void *)v0[56];
  swift_bridgeObjectRelease();

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

unint64_t sub_6C18@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t result = (unint64_t)sub_4724(a1, (void (*)(void))type metadata accessor for DSCloudObject);
  if (!result) {
    goto LABEL_16;
  }
  unint64_t v5 = result;
  if (!(result >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  unint64_t result = sub_12BA8();
  uint64_t v6 = result;
  if (!result)
  {
LABEL_15:
    unint64_t result = swift_bridgeObjectRelease();
LABEL_16:
    *a2 = &_swiftEmptyArrayStorage;
    return result;
  }
LABEL_4:
  if (v6 >= 1)
  {
    uint64_t v10 = a2;
    uint64_t v11 = v2;
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        uint64_t v8 = (char *)sub_12B18();
      }
      else {
        uint64_t v8 = (char *)*(id *)(v5 + 8 * i + 32);
      }
      uint64_t v9 = v8;
      if (objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject], "isDeleted", v10, v11))
      {
      }
      else
      {
        sub_12B38();
        sub_12B68();
        sub_12B78();
        sub_12B48();
      }
    }
    unint64_t result = swift_bridgeObjectRelease();
    a2 = v10;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_6D8C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_6DAC, 0, 0);
}

uint64_t sub_6DAC()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DA48);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint64_t *)(v0 + 16);
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = v0;
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v4 = v7;
    sub_12A48();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error occurred while deleting unowned share: %@", v5, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v10;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_6FA8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_D2D0((uint64_t *)&unk_1DFE0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_705C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_707C, 0, 0);
}

uint64_t sub_707C()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DA48);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129F8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint64_t *)(v0 + 16);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = v0;
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v4 = v7;
    sub_12A48();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error occurred while removing owned share: %@", v5, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v10;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_7278(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  id v12 = (char *)v52 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v15 = (char *)v52 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v52 - v16;
  v55 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v55((char *)v52 - v16, v3, a1);
  if (sub_12BD8())
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, a1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v18, v17, a1);
  }
  id v19 = (void *)sub_12868();
  swift_errorRelease();
  int IsCode = CKErrorIsCode();

  if (!IsCode) {
    goto LABEL_41;
  }
  v55(v15, v3, a1);
  uint64_t v21 = sub_12BD8();
  uint64_t v54 = v3;
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, a1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22, v15, a1);
  }
  os_log_type_t v23 = (void *)sub_12868();
  swift_errorRelease();
  id v24 = [v23 userInfo];

  uint64_t v25 = sub_128A8();
  uint64_t v26 = sub_128E8();
  if (*(void *)(v25 + 16) && (unint64_t v28 = sub_C288(v26, v27), (v29 & 1) != 0))
  {
    sub_D578(*(void *)(v25 + 56) + 32 * v28, (uint64_t)&v57);
  }
  else
  {
    long long v57 = 0u;
    long long v58 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v58 + 1))
  {
    sub_DA54((uint64_t)&v57, &qword_1DDB0);
    goto LABEL_40;
  }
  sub_D2D0(&qword_1DDB8);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_40:
    uint64_t v3 = v54;
LABEL_41:
    v55(v9, v3, a1);
    uint64_t v49 = sub_12BD8();
    if (v49)
    {
      uint64_t v48 = v49;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a1);
    }
    else
    {
      uint64_t v48 = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v50, v9, a1);
    }
    return v48;
  }
  v52[0] = v12;
  v52[1] = a2;
  uint64_t v53 = v6;
  int64_t v31 = 0;
  uint64_t v32 = v56 + 64;
  uint64_t v33 = 1 << *(unsigned char *)(v56 + 32);
  uint64_t v34 = -1;
  if (v33 < 64) {
    uint64_t v34 = ~(-1 << v33);
  }
  uint64_t v35 = v34 & *(void *)(v56 + 64);
  int64_t v36 = (unint64_t)(v33 + 63) >> 6;
  while (1)
  {
    if (v35)
    {
      v35 &= v35 - 1;
    }
    else
    {
      int64_t v37 = v31 + 1;
      if (__OFADD__(v31, 1))
      {
        __break(1u);
LABEL_49:
        __break(1u);
        return result;
      }
      if (v37 >= v36) {
        goto LABEL_44;
      }
      uint64_t v38 = *(void *)(v32 + 8 * v37);
      ++v31;
      if (!v38)
      {
        int64_t v31 = v37 + 1;
        if (v37 + 1 >= v36) {
          goto LABEL_44;
        }
        uint64_t v38 = *(void *)(v32 + 8 * v31);
        if (!v38)
        {
          int64_t v31 = v37 + 2;
          if (v37 + 2 >= v36) {
            goto LABEL_44;
          }
          uint64_t v38 = *(void *)(v32 + 8 * v31);
          if (!v38)
          {
            int64_t v39 = v37 + 3;
            if (v39 >= v36)
            {
LABEL_44:
              swift_release();
              return 0;
            }
            uint64_t v38 = *(void *)(v32 + 8 * v39);
            if (!v38)
            {
              while (1)
              {
                int64_t v31 = v39 + 1;
                if (__OFADD__(v39, 1)) {
                  goto LABEL_49;
                }
                if (v31 >= v36) {
                  goto LABEL_44;
                }
                uint64_t v38 = *(void *)(v32 + 8 * v31);
                ++v39;
                if (v38) {
                  goto LABEL_33;
                }
              }
            }
            int64_t v31 = v39;
          }
        }
      }
LABEL_33:
      uint64_t v35 = (v38 - 1) & v38;
    }
    swift_errorRetain();
    id v40 = (void *)sub_12868();
    char v41 = CKErrorIsCode();

    if ((v41 & 1) == 0)
    {
      v42 = (void *)sub_12868();
      char v43 = CKErrorIsCode();

      if ((v43 & 1) == 0)
      {
        v44 = (void *)sub_12868();
        int v45 = CKErrorIsCode();

        if (!v45) {
          break;
        }
      }
    }
    uint64_t result = swift_errorRelease();
  }
  uint64_t v46 = v52[0];
  v55((char *)v52[0], v54, a1);
  uint64_t v47 = sub_12BD8();
  if (v47)
  {
    uint64_t v48 = v47;
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v46, a1);
  }
  else
  {
    uint64_t v48 = swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v51, v46, a1);
    swift_errorRelease();
  }
  swift_release();
  return v48;
}

uint64_t sub_7890(void (*a1)(void *, uint64_t), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = sub_D2D0(&qword_1DCC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)&v3[OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext];
  if (v10)
  {
    uint64_t v11 = sub_129A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
    id v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = v3;
    v12[5] = a1;
    v12[6] = a2;
    v12[7] = v10;
    v12[8] = ObjectType;
    id v13 = v10;
    uint64_t v14 = v3;
    swift_retain();
    sub_7F38((uint64_t)v9, (uint64_t)&unk_1DE80, (uint64_t)v12);

    swift_release();
    return sub_DA54((uint64_t)v9, &qword_1DCC0);
  }
  else
  {
    sub_D970();
    uint64_t v16 = swift_allocError();
    unsigned char *v17 = 0;
    a1(&_swiftEmptyArrayStorage, v16);
    return swift_errorRelease();
  }
}

uint64_t sub_7A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  return _swift_task_switch(sub_7A84, 0, 0);
}

uint64_t sub_7A84()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  v0[10] = sub_D4F0(v1, (uint64_t)qword_1DA48);
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "fetchSharedResources :: Calling refreshCloudContext", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[6];

  uint64_t v6 = *(void **)(v5 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext);
  v0[11] = v6;
  id v7 = v6;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[12] = v8;
  void *v8 = v0;
  v8[1] = sub_7C08;
  v8[6] = v6;
  return _swift_task_switch(sub_C404, 0, 0);
}

uint64_t sub_7C08()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v3 = sub_7E70;
  }
  else
  {

    os_log_type_t v3 = sub_7D24;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_7D24()
{
  uint64_t v1 = sub_12888();
  os_log_type_t v2 = sub_129E8();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "fetchSharedResources :: refreshCloudContext finished", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void *)v0[9];

  unint64_t v5 = sub_C994(v4);
  if (v5 >> 62)
  {
    sub_D2D0(&qword_1DD78);
    uint64_t v6 = sub_12B98();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_12BF8();
    uint64_t v6 = v5;
  }
  id v7 = (void (*)(uint64_t, void))v0[7];
  swift_bridgeObjectRelease();
  v7(v6, 0);
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_7E70()
{
  uint64_t v1 = *(void (**)(void *, uint64_t))(v0 + 56);

  swift_getErrorValue();
  uint64_t v2 = sub_7278(*(void *)(v0 + 24), *(void *)(v0 + 32));
  v1(&_swiftEmptyArrayStorage, v2);
  swift_errorRelease();
  swift_errorRelease();
  os_log_type_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_7F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_D2D0(&qword_1DCC0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E000(a1, (uint64_t)v8);
  uint64_t v9 = sub_129A8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_DA54((uint64_t)v8, &qword_1DCC0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_12988();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_12998();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

void sub_81B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_D2D0(&qword_1DD78);
  v5.super.Class isa = sub_12928().super.isa;
  if (a2) {
    uint64_t v6 = sub_12868();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

uint64_t sub_824C(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_826C, 0, 0);
}

uint64_t sub_826C()
{
  uint64_t v1 = *(void **)(v0[3] + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext);
  v0[4] = v1;
  if (v1)
  {
    uint64_t v2 = v0[2];
    sub_D2D0(&qword_1DD90);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_13470;
    *(void *)(v3 + 32) = v2;
    uint64_t v10 = v3;
    sub_12958();
    v0[5] = v10;
    id v4 = v1;
    swift_unknownObjectRetain();
    NSArray v5 = (void *)swift_task_alloc();
    v0[6] = v5;
    void *v5 = v0;
    v5[1] = sub_83FC;
    uint64_t v6 = v0[3];
    v5[38] = v4;
    v5[39] = v6;
    v5[37] = v10;
    return _swift_task_switch(sub_4B20, 0, 0);
  }
  else
  {
    sub_D970();
    swift_allocError();
    *id v7 = 0;
    swift_willThrow();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_83FC()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_857C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_8518;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_8518()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_857C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  swift_bridgeObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_8764(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v6 = a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[2] = a1;
  v7[3] = v6;
  v7[1] = sub_E428;
  return _swift_task_switch(sub_826C, 0, 0);
}

uint64_t sub_8840(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return _swift_task_switch(sub_8860, 0, 0);
}

uint64_t sub_8860()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext);
  *(void *)(v0 + 64) = v2;
  if (!v2)
  {
    sub_D970();
    swift_allocError();
    *uint64_t v16 = 0;
LABEL_14:
    swift_willThrow();
    id v19 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_15;
  }
  type metadata accessor for DSParticipant();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3)
  {
    sub_D970();
    swift_allocError();
    char v18 = 4;
LABEL_13:
    char *v17 = v18;
    goto LABEL_14;
  }
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_cloudContext);
  *(void *)(v0 + 72) = v4;
  if (!v4)
  {
    sub_D970();
    swift_allocError();
    char v18 = 1;
    goto LABEL_13;
  }
  NSArray v5 = *(void **)(v1 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_collaborationController);
  *(void *)(v0 + 80) = v5;
  if (!v5)
  {
    sub_D970();
    swift_allocError();
    char v18 = 2;
    goto LABEL_13;
  }
  uint64_t v6 = v3;
  id v7 = v2;
  swift_unknownObjectRetain();
  id v8 = v4;
  id v9 = v5;
  unint64_t v10 = sub_C994(v7);
  swift_unknownObjectRetain();
  unint64_t v11 = (unint64_t)sub_CC24(v10, v6);
  *(void *)(v0 + 88) = v11;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (v11 >> 62)
  {
    uint64_t v26 = sub_12BA8();
    *(void *)(v0 + 96) = v26;
    if (v26) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    *(void *)(v0 + 96) = v12;
    if (v12)
    {
LABEL_7:
      uint64_t v13 = *(void **)(v6 + OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant);
      *(void *)(v0 + 104) = v13;
      uint64_t v14 = *(void *)(v0 + 88);
      if ((v14 & 0xC000000000000001) != 0)
      {
        id v15 = (id)sub_12B18();
        uint64_t v13 = *(void **)(v0 + 104);
      }
      else
      {
        id v15 = *(id *)(v14 + 32);
      }
      *(void *)(v0 + 112) = v15;
      *(void *)(v0 + 120) = 1;
      uint64_t v22 = *(void *)(v0 + 72);
      uint64_t v21 = *(void *)(v0 + 80);
      *(void *)(v0 + 128) = OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject;
      sub_D2D0(&qword_1DD90);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_13470;
      *(void *)(v23 + 32) = v13;
      uint64_t v29 = v23;
      sub_12958();
      *(void *)(v0 + 136) = v29;
      id v24 = v13;
      uint64_t v25 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v25;
      void *v25 = v0;
      v25[1] = sub_8BB0;
      return sub_E504(v29, v22, v21);
    }
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v27 = *(void **)(v0 + 72);
  unint64_t v28 = *(void **)(v0 + 64);

  id v19 = *(uint64_t (**)(void))(v0 + 8);
LABEL_15:
  return v19();
}

uint64_t sub_8BB0(void *a1)
{
  *(void *)(*(void *)v2 + 152) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_8EA4;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v4 = sub_8CDC;
  }
  return _swift_task_switch(v4, 0, 0);
}

id sub_8CDC()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);

  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v3 = *(void **)(v0 + 72);
    uint64_t v4 = *(void **)(v0 + 64);

    NSArray v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 120);
    uint64_t v8 = *(void *)(v0 + 88);
    if ((v8 & 0xC000000000000001) != 0) {
      id result = (id)sub_12B18();
    }
    else {
      id result = *(id *)(v8 + 8 * v7 + 32);
    }
    *(void *)(v0 + 112) = result;
    *(void *)(v0 + 120) = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
    }
    else
    {
      id v9 = *(void **)(v0 + 104);
      uint64_t v11 = *(void *)(v0 + 72);
      uint64_t v10 = *(void *)(v0 + 80);
      *(void *)(v0 + 128) = OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject;
      sub_D2D0(&qword_1DD90);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_13470;
      *(void *)(v12 + 32) = v9;
      uint64_t v15 = v12;
      sub_12958();
      *(void *)(v0 + 136) = v15;
      id v13 = v9;
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_8BB0;
      return (id)sub_E504(v15, v11, v10);
    }
  }
  return result;
}

uint64_t sub_8EA4()
{
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  uint64_t v1 = sub_7278(*(void *)(v0 + 24), *(void *)(v0 + 32));
  swift_errorRelease();
  if (v1)
  {
    id v2 = [*(id *)(*(void *)(v0 + 112) + *(void *)(v0 + 128)) managedObjectContext];
    *(void *)(v0 + 160) = v2;
    uint64_t v3 = *(void *)(v0 + 152);
    uint64_t v4 = *(void **)(v0 + 112);
    if (v2)
    {
      uint64_t v5 = swift_allocObject();
      *(void *)(v0 + 168) = v5;
      *(void *)(v5 + 16) = v4;
      *(void *)(v5 + 24) = v3;
      id v6 = v4;
      swift_errorRetain();
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v7;
      *uint64_t v7 = v0;
      v7[1] = sub_91E8;
      uint64_t v8 = (char *)&type metadata for () + 8;
      id v9 = sub_DD44;
      uint64_t v10 = v5;
      return NSManagedObjectContext.perform<A>(_:)(v7, v9, v10, v8);
    }
    uint64_t v16 = *(void **)(v0 + 80);
    char v18 = *(void **)(v0 + 64);
    uint64_t v17 = *(void **)(v0 + 72);
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  swift_errorRelease();
  uint64_t v11 = *(void *)(v0 + 120);
  uint64_t v12 = *(void *)(v0 + 96);

  if (v11 == v12)
  {
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    id v13 = *(void **)(v0 + 72);
    uint64_t v14 = *(void **)(v0 + 64);

    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
    return v15();
  }
  uint64_t v20 = *(void *)(v0 + 120);
  uint64_t v21 = *(void *)(v0 + 88);
  if ((v21 & 0xC000000000000001) != 0) {
    uint64_t v7 = (void *)sub_12B18();
  }
  else {
    uint64_t v7 = *(id *)(v21 + 8 * v20 + 32);
  }
  *(void *)(v0 + 112) = v7;
  *(void *)(v0 + 120) = v20 + 1;
  if (__OFADD__(v20, 1))
  {
    __break(1u);
    return NSManagedObjectContext.perform<A>(_:)(v7, v9, v10, v8);
  }
  uint64_t v22 = *(void **)(v0 + 104);
  uint64_t v24 = *(void *)(v0 + 72);
  uint64_t v23 = *(void *)(v0 + 80);
  *(void *)(v0 + 128) = OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject;
  sub_D2D0(&qword_1DD90);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_13470;
  *(void *)(v25 + 32) = v22;
  uint64_t v28 = v25;
  sub_12958();
  *(void *)(v0 + 136) = v28;
  id v26 = v22;
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_8BB0;
  return sub_E504(v28, v24, v23);
}

uint64_t sub_91E8()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 160);
  swift_task_dealloc();
  swift_release();

  return _swift_task_switch(sub_9318, 0, 0);
}

uint64_t sub_9318()
{
  uint64_t v1 = (void *)v0[14];
  id v2 = (void *)v0[10];
  uint64_t v4 = (void *)v0[8];
  uint64_t v3 = (void *)v0[9];
  swift_willThrow();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void sub_93C4(void *a1)
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_12898();
  sub_D4F0(v2, (uint64_t)qword_1DA48);
  id v3 = a1;
  swift_errorRetain();
  uint64_t v4 = (char *)v3;
  swift_errorRetain();
  uint64_t v5 = sub_12888();
  os_log_type_t v6 = sub_129F8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412546;
    log = v5;
    id v9 = *(void **)&v4[OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject];
    id v10 = v9;
    sub_12A48();
    void *v8 = v9;

    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain();
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    sub_12A48();
    v8[1] = v12;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, log, v6, "Removing participant failed for object %@ with error %@", (uint8_t *)v7, 0x16u);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_9774(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_9850;
  v7[6] = a1;
  v7[7] = v6;
  return _swift_task_switch(sub_8860, 0, 0);
}

uint64_t sub_9850()
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
    uint64_t v8 = (void *)sub_12868();
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

uint64_t sub_99F0()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(sub_9A10, 0, 0);
}

uint64_t sub_9A10()
{
  uint64_t v1 = *(void **)(v0[2] + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext);
  v0[3] = v1;
  if (v1)
  {
    id v2 = v1;
    unint64_t v3 = sub_C994(v2);
    if (v3 >> 62)
    {
      sub_D2D0(&qword_1DD78);
      uint64_t v4 = sub_12B98();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_12BF8();
      uint64_t v4 = v3;
    }
    v0[4] = v4;
    swift_bridgeObjectRelease();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[5] = v5;
    void *v5 = v0;
    v5[1] = sub_9BA4;
    uint64_t v6 = v0[2];
    v5[38] = v2;
    v5[39] = v6;
    v5[37] = v4;
    return _swift_task_switch(sub_4B20, 0, 0);
  }
  else
  {
    sub_D970();
    swift_allocError();
    *uint64_t v7 = 0;
    swift_willThrow();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_9BA4()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_9D24;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v2 = sub_9CC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_9CC0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_9D24()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_bridgeObjectRelease();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_9EF4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  id v4 = a2;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[4] = v5;
  void *v5 = v2;
  v5[1] = sub_9FB4;
  v5[2] = v4;
  return _swift_task_switch(sub_9A10, 0, 0);
}

uint64_t sub_9FB4()
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
    uint64_t v8 = (void *)sub_12868();
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

void sub_A138(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  sub_D4B4(0, &qword_1DC80);
  sub_D2D0(&qword_1DC88);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_13480;
  char v43 = a1;
  id v8 = [a1 ownerName];
  uint64_t v9 = sub_128E8();
  uint64_t v11 = v10;

  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_D460();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  id v40 = (id)sub_129C8();
  sub_D4B4(0, (unint64_t *)&unk_1DFF0);
  id v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), "ic_objectsMatchingPredicate:context:", v40, a2);
  sub_D4B4(0, &qword_1DCA0);
  unint64_t v13 = sub_12938();

  unint64_t v14 = (unint64_t)sub_4914(v13);
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_35;
  }
  v44 = &_swiftEmptyArrayStorage;
  uint64_t v15 = v14 & 0xFFFFFFFFFFFFFF8;
  if (v14 >> 62) {
    goto LABEL_21;
  }
  uint64_t v16 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
  id v17 = v43;
  unint64_t v18 = a4;
  if (v16)
  {
    while (1)
    {
      uint64_t v38 = a2;
      unint64_t v19 = 0;
      a2 = (void *)(v14 & 0xC000000000000001);
      unint64_t v41 = v14 & 0xC000000000000001;
      v42 = (id *)v14;
      while (a2)
      {
        id v20 = (id)sub_12B18();
LABEL_10:
        uint64_t v21 = v20;
        unint64_t v22 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_20;
        }
        id v23 = [v20 recordID];
        if (v23
          && (uint64_t v24 = v23, v25 = [v23 zoneID], v24, v25))
        {
          uint64_t v26 = v16;
          uint64_t v27 = v15;
          uint64_t v28 = a3;
          sub_D4B4(0, &qword_1DCA8);
          id v29 = v43;
          id v30 = v25;
          char v31 = sub_12A38();

          if (v31)
          {
            sub_12B38();
            sub_12B68();
            sub_12B78();
            sub_12B48();
          }
          else
          {
          }
          a3 = v28;
          uint64_t v15 = v27;
          uint64_t v16 = v26;
          a2 = (void *)v41;
          unint64_t v14 = (unint64_t)v42;
        }
        else
        {
        }
        ++v19;
        if (v22 == v16)
        {
          unint64_t v32 = (unint64_t)v44;
          a2 = v38;
          unint64_t v18 = a4;
          goto LABEL_23;
        }
      }
      if (v19 < *(void *)(v15 + 16)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      id v33 = v43;
      uint64_t v16 = sub_12BA8();
      unint64_t v18 = a4;
      if (!v16) {
        goto LABEL_22;
      }
    }
    id v20 = *(id *)(v14 + 8 * v19 + 32);
    goto LABEL_10;
  }
LABEL_22:
  unint64_t v32 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_23:
  swift_bridgeObjectRelease();

  if ((v32 & 0x8000000000000000) != 0 || (v32 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_12BA8();
    swift_release();
    if (v34) {
      goto LABEL_26;
    }
LABEL_34:
    swift_release();
    goto LABEL_35;
  }
  uint64_t v34 = *(void *)(v32 + 16);
  if (!v34) {
    goto LABEL_34;
  }
LABEL_26:
  if (v34 < 1)
  {
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = 0;
  do
  {
    if ((v32 & 0xC000000000000001) != 0) {
      id v36 = (id)sub_12B18();
    }
    else {
      id v36 = *(id *)(v32 + 8 * v35 + 32);
    }
    int64_t v37 = v36;
    ++v35;
    v44 = v36;
    sub_A554(&v44, a3, v18);
  }
  while (v34 != v35);
  swift_release_n();
  objc_msgSend(a2, "ic_save");
LABEL_35:
}

id sub_A554(void **a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = *a1;
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_12898();
  sub_D4F0(v6, (uint64_t)qword_1DA48);
  id v7 = v5;
  swift_bridgeObjectRetain_n();
  id v8 = v7;
  uint64_t v9 = sub_12888();
  os_log_type_t v10 = sub_129E8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v15 = a2;
    uint64_t v11 = swift_slowAlloc();
    unint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412546;
    id v12 = v8;
    sub_12A48();
    *unint64_t v14 = v8;

    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_BC30(v15, a3, &v16);
    sub_12A48();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v9, v10, "Deleting shared %@ for accountID %s from local database", (uint8_t *)v11, 0x16u);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return [v8 deleteFromLocalDatabase];
}

uint64_t sub_A7C4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_A898(char **a1, uint64_t a2)
{
  id v3 = [self allCloudKitAccountsInContext:a2];
  sub_D4B4(0, &qword_1DC70);
  unint64_t v4 = sub_12938();

  uint64_t v5 = sub_A950(v4);
  swift_bridgeObjectRelease();
  *a1 = v5;

  return swift_bridgeObjectRelease();
}

char *sub_A950(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_12BA8())
  {
    id v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)sub_12B18() : *(id *)(a1 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 identifier];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_128E8();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v3 = sub_BB20(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v14 = *((void *)v3 + 2);
        unint64_t v13 = *((void *)v3 + 3);
        if (v14 >= v13 >> 1) {
          id v3 = sub_BB20((char *)(v13 > 1), v14 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v14 + 1;
        uint64_t v15 = &v3[16 * v14];
        *((void *)v15 + 4) = v10;
        *((void *)v15 + 5) = v12;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  id v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

id sub_AC58(void *a1, uint64_t a2, void *a3, SEL *a4, uint64_t a5)
{
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a1;
  id v12 = [v9 sharedContext];
  if (!v12 || (v13 = v12, id v14 = [v12 *a4], v13, !v14)) {
    id v14 = [objc_allocWithZone((Class)NSManagedObjectContext) initWithConcurrencyType:a5];
  }

  return v14;
}

BOOL sub_ADE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_ADFC()
{
  Swift::UInt v1 = *v0;
  sub_12C58();
  sub_12C68(v1);
  return sub_12C78();
}

void sub_AE44()
{
  sub_12C68(*v0);
}

Swift::Int sub_AE70()
{
  Swift::UInt v1 = *v0;
  sub_12C58();
  sub_12C68(v1);
  return sub_12C78();
}

id sub_AEEC(void *a1, uint64_t a2, void *a3, SEL *a4)
{
  uint64_t v7 = self;
  id v8 = a3;
  id v9 = a1;
  id v10 = [v7 sharedContext];
  if (v10)
  {
    id v11 = v10;
    id v12 = [v10 *a4];

    id v8 = v9;
    id v9 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void type metadata accessor for DSSourceName()
{
  if (!qword_1DBE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1DBE0);
    }
  }
}

uint64_t sub_B03C(uint64_t a1, uint64_t a2)
{
  return sub_B31C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_B054(uint64_t a1, id *a2)
{
  uint64_t result = sub_128C8();
  *a2 = 0;
  return result;
}

uint64_t sub_B0CC(uint64_t a1, id *a2)
{
  char v3 = sub_128D8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_B14C@<X0>(void *a1@<X8>)
{
  sub_128E8();
  NSString v2 = sub_128B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_B190@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_128B8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_B1D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_128E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_B204(uint64_t a1)
{
  uint64_t v2 = sub_B4E8(&qword_1DC00);
  uint64_t v3 = sub_B4E8(&qword_1DC08);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_B29C()
{
  return sub_B4E8(&qword_1DBE8);
}

uint64_t sub_B2D0()
{
  return sub_B4E8(&qword_1DBF0);
}

uint64_t sub_B304(uint64_t a1, uint64_t a2)
{
  return sub_B31C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_B31C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_128E8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_B360()
{
  sub_128E8();
  sub_128F8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_B3B4()
{
  sub_128E8();
  sub_12C58();
  sub_128F8();
  Swift::Int v0 = sub_12C78();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_B428()
{
  uint64_t v0 = sub_128E8();
  uint64_t v2 = v1;
  if (v0 == sub_128E8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_12BE8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_B4B4()
{
  return sub_B4E8(&qword_1DBF8);
}

uint64_t sub_B4E8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DSSourceName();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_B52C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_B608;
  return v6(a1);
}

uint64_t sub_B608()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_B700(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_E3F4;
  return v6();
}

uint64_t sub_B7CC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_E3F4;
  return v7();
}

uint64_t sub_B898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_129A8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_12998();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_DA54(a1, &qword_1DCC0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_12988();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_BA44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_E42C;
  return v6(a1);
}

char *sub_BB20(char *result, int64_t a2, char a3, char *a4)
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
      sub_D2D0(&qword_1DC78);
      id v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_D314(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_BC30(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_BD04(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_D578((uint64_t)v12, *a3);
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
      sub_D578((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_D528((uint64_t)v12);
  return v7;
}

uint64_t sub_BD04(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_12A58();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_BEC0(a5, a6);
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
  uint64_t v8 = sub_12B28();
  if (!v8)
  {
    sub_12B88();
    __break(1u);
LABEL_17:
    uint64_t result = sub_12BB8();
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

uint64_t sub_BEC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_BF58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_C138(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_C138(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_BF58(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_C0D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_12B08();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_12B88();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_12908();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_12BB8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_12B88();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_C0D0(uint64_t a1, uint64_t a2)
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
  sub_D2D0(&qword_1DCB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_C138(char a1, int64_t a2, char a3, char *a4)
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
    sub_D2D0(&qword_1DCB8);
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
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_12BB8();
  __break(1u);
  return result;
}

unint64_t sub_C288(uint64_t a1, uint64_t a2)
{
  sub_12C58();
  sub_128F8();
  Swift::Int v4 = sub_12C78();

  return sub_C300(a1, a2, v4);
}

unint64_t sub_C300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_12BE8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_12BE8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_C3E4(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return _swift_task_switch(sub_C404, 0, 0);
}

uint64_t sub_C404()
{
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DA48);
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129E8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "refreshCloudContext :: call updateState on ICCloudContext", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void **)(v0 + 48);

  [v5 updateCloudContextState];
  unint64_t v6 = sub_12888();
  os_log_type_t v7 = sub_129E8();
  if (os_log_type_enabled(v6, v7))
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "refreshCloudContext :: updateState finished", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_C5EC;
  v9[15] = *(void *)(v0 + 48);
  return _swift_task_switch(sub_3B3C, 0, 0);
}

uint64_t sub_C5EC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_C720, 0, 0);
  }
  else
  {
    os_log_type_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_C720()
{
  swift_getErrorValue();
  uint64_t v1 = sub_7278(v0[3], v0[4]);
  swift_errorRelease();
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[9] = v2;
    void *v2 = v0;
    v2[1] = sub_C82C;
    v2[3] = v0[8];
    return _swift_task_switch(sub_40D4, 0, 0);
  }
  else
  {
    swift_errorRelease();
    os_log_type_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
}

uint64_t sub_C82C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_C928, 0, 0);
}

uint64_t sub_C928()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_C994(void *a1)
{
  uint64_t v16 = &_swiftEmptyArrayStorage;
  if (qword_1DA40 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_12898();
  sub_D4F0(v2, (uint64_t)qword_1DA48);
  uint64_t v3 = sub_12888();
  os_log_type_t v4 = sub_129E8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "allSharedCloudObjects :: Perform and wait on MOC", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = &v16;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_DAE8;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_E3F0;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3558;
  aBlock[3] = &unk_18A70;
  int64_t v8 = _Block_copy(aBlock);
  id v9 = a1;
  swift_retain();
  swift_release();
  [v9 performBlockAndWait:v8];
  _Block_release(v8);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v9)
  {
    __break(1u);
  }
  else
  {
    uint64_t v11 = sub_12888();
    os_log_type_t v12 = sub_129E8();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_0, v11, v12, "allSharedCloudObjects :: Finished fetch of cloud objects", v13, 2u);
      swift_slowDealloc();
    }

    BOOL v14 = v16;
    swift_release();
    return (uint64_t)v14;
  }
  return result;
}

void *sub_CC24(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v32 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v34 = &_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_47;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
LABEL_3:
  uint64_t v6 = &_swiftEmptyArrayStorage;
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v29 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v30 = a1 & 0xC000000000000001;
    unint64_t v26 = a1;
    uint64_t v27 = v5;
    unint64_t v28 = a1 + 32;
    while (1)
    {
      if (v30)
      {
        int64_t v8 = (char *)sub_12B18();
      }
      else
      {
        if (v7 >= *(void *)(v29 + 16))
        {
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        int64_t v8 = (char *)*(id *)(v28 + 8 * v7);
      }
      id v9 = v8;
      if (__OFADD__(v7++, 1)) {
        goto LABEL_44;
      }
      id v11 = objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject], "managedObjectContext", v26);
      if (v11)
      {
        os_log_type_t v12 = v11;
        __chkstk_darwin(v11);
        a1 = (unint64_t)v25;
        v25[2] = v9;
        sub_D2D0(&qword_1DF70);
        sub_12A18();

        if (v33) {
          unint64_t v13 = v33;
        }
        else {
          unint64_t v13 = &_swiftEmptyArrayStorage;
        }
      }
      else
      {
        unint64_t v13 = &_swiftEmptyArrayStorage;
      }
      unint64_t v14 = (unint64_t)sub_4724((unint64_t)v13, (void (*)(void))type metadata accessor for DSParticipant);
      swift_bridgeObjectRelease();
      if (v14)
      {
        if (v14 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v15 = sub_12BA8();
          if (!v15)
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
            uint64_t v5 = v27;
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v15 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
          if (!v15) {
            goto LABEL_39;
          }
        }
        uint64_t v16 = v3;
        if ((v14 & 0xC000000000000001) != 0) {
          id v17 = (id)sub_12B18();
        }
        else {
          id v17 = *(id *)(v14 + 32);
        }
        unint64_t v18 = v17;
        a1 = sub_12A38();

        if (a1)
        {
LABEL_22:
          uint64_t v3 = v16;
          uint64_t v5 = v27;
          swift_bridgeObjectRelease_n();
          sub_12B38();
          a1 = v34[2];
          sub_12B68();
          sub_12B78();
          sub_12B48();
        }
        else
        {
          if (v15 != 1)
          {
            if ((v14 & 0xC000000000000001) != 0)
            {
              uint64_t v3 = 1;
              while (1)
              {
                uint64_t v19 = sub_12B18();
                uint64_t v20 = v3 + 1;
                if (__OFADD__(v3, 1)) {
                  goto LABEL_45;
                }
                a1 = v19;
                char v21 = sub_12A38();
                swift_unknownObjectRelease();
                if (v21) {
                  goto LABEL_22;
                }
                ++v3;
                if (v20 == v15) {
                  goto LABEL_35;
                }
              }
            }
            uint64_t v22 = 5;
            while (1)
            {
              uint64_t v3 = v22 - 3;
              if (__OFADD__(v22 - 4, 1)) {
                break;
              }
              a1 = (unint64_t)*(id *)(v14 + 8 * v22);
              char v23 = sub_12A38();

              if (v23) {
                goto LABEL_22;
              }
              ++v22;
              if (v3 == v15)
              {
LABEL_35:

                swift_bridgeObjectRelease_n();
                uint64_t v3 = v16;
                goto LABEL_36;
              }
            }
LABEL_46:
            __break(1u);
LABEL_47:
            uint64_t v5 = sub_12BA8();
            goto LABEL_3;
          }
          uint64_t v3 = v16;

          swift_bridgeObjectRelease_n();
LABEL_36:
          uint64_t v5 = v27;
        }
      }
      else
      {
      }
LABEL_6:
      if (v7 == v5) {
        return v34;
      }
    }
  }
  return v6;
}

void sub_CFBC(void *a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v4 = *(void **)(v3 + OBJC_IVAR____TtC13DSNotesPlugin28NotesDigitalSeparationSource_managedObjectContext);
  if (v4)
  {
    int64_t v8 = (void *)swift_allocObject();
    v8[2] = a1;
    v8[3] = v4;
    v8[4] = a2;
    v8[5] = a3;
    v12[4] = sub_D454;
    v12[5] = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_A7C4;
    uint64_t v12[3] = &unk_188D8;
    id v9 = _Block_copy(v12);
    id v10 = v4;
    id v11 = a1;
    swift_bridgeObjectRetain();
    swift_release();
    [v10 performBlock:v9];
    _Block_release(v9);
  }
}

uint64_t sub_D0D0(void *a1)
{
  id v9 = &_swiftEmptyArrayStorage;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v9;
  *(void *)(v2 + 24) = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_D278;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_D290;
  aBlock[5] = v3;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3558;
  aBlock[3] = &unk_18888;
  os_log_type_t v4 = _Block_copy(aBlock);
  id v5 = a1;
  swift_retain();
  swift_release();
  [v5 performBlockAndWait:v4];
  _Block_release(v4);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v9;
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_D240()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D278()
{
  return sub_A898(*(char ***)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_D280()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D290()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_D2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_D2C8()
{
  return swift_release();
}

uint64_t sub_D2D0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_D314(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_12BB8();
  __break(1u);
  return result;
}

uint64_t sub_D40C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_D454()
{
  sub_A138(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_D460()
{
  unint64_t result = qword_1DC90;
  if (!qword_1DC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1DC90);
  }
  return result;
}

uint64_t sub_D4B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_D4F0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_D528(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_D578(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_D5D4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_D638()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D678()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_E3F4;
  unint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1DCC8 + dword_1DCC8);
  return v5(v2, v3);
}

uint64_t sub_D728()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_E3F4;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1DCD8 + dword_1DCD8);
  return v6(v2, v3, v4);
}

uint64_t sub_D7EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_E3F4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1DCE8 + dword_1DCE8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_D8B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_E3F4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1DCF8 + dword_1DCF8);
  return v6(a1, v4);
}

unint64_t sub_D970()
{
  unint64_t result = qword_1DD10;
  if (!qword_1DD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1DD10);
  }
  return result;
}

uint64_t sub_D9C4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_D9FC@<X0>(void *a1@<X8>)
{
  return sub_6C18(*(void *)(v1 + 16), a1);
}

id sub_DA18@<X0>(unsigned char *a1@<X8>)
{
  id result = [*(id *)(v1 + 16) isOwnedByCurrentUser];
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_DA54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_D2D0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_DAB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DAE8()
{
  return sub_42D0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_DAF0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DB00()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_DB10(uint64_t a1, uint64_t a2)
{
  return sub_4550(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_DB18()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DB28()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_DB54()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_DC08;
  unint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_1DE20 + dword_1DE20);
  return v6(v2, v3, v4);
}

uint64_t sub_DC08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_DD04()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_DD44()
{
  sub_93C4(*(void **)(v0 + 16));
}

id sub_DD60@<X0>(void *a1@<X8>)
{
  return sub_FE98(*(void *)(v1 + 16), a1);
}

uint64_t sub_DD80()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_DDC8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_E3F4;
  unint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_1DE50 + dword_1DE50);
  return v6(v2, v3, v4);
}

uint64_t sub_DE84()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_DEC4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_DEFC(uint64_t a1, uint64_t a2)
{
  sub_81B0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_DF04()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_DF54()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_E3F4;
  *(_OWORD *)(v2 + 48) = v3;
  *(_OWORD *)(v2 + 64) = v4;
  return _swift_task_switch(sub_7A84, 0, 0);
}

uint64_t sub_E000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_D2D0(&qword_1DCC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_E068()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_E0A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_DC08;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1DE88 + dword_1DE88);
  return v6(a1, v4);
}

uint64_t sub_E158()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_E190()
{
  return sub_3884(*(void *)(v0 + 16));
}

uint64_t sub_E198()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_E1A8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_E1B8(uint64_t a1)
{
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for NotesDigitalSeparationSource.NotesDigitalSeparationError(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NotesDigitalSeparationSource.NotesDigitalSeparationError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NotesDigitalSeparationSource.NotesDigitalSeparationError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 5;
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
        JUMPOUT(0xE34CLL);
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
          *id result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_E374(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_E380(unsigned char *result, char a2)
{
  *id result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NotesDigitalSeparationSource.NotesDigitalSeparationError()
{
  return &type metadata for NotesDigitalSeparationSource.NotesDigitalSeparationError;
}

unint64_t sub_E39C()
{
  unint64_t result = qword_1DEB0;
  if (!qword_1DEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1DEB0);
  }
  return result;
}

void *sub_E430()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject) managedObjectContext];
  if (!v1
    || (v2 = v1, __chkstk_darwin(v1), sub_D2D0(&qword_1DF70), sub_12A18(), v2, (unint64_t result = v4) == 0))
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_E504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[50] = a3;
  v4[51] = v3;
  v4[48] = a1;
  v4[49] = a2;
  return _swift_task_switch(sub_E528, 0, 0);
}

uint64_t sub_E528()
{
  id v1 = [*(id *)(v0 + 408) managedObjectContext];
  *(void *)(v0 + 416) = v1;
  if (!v1)
  {
LABEL_17:
    id v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17(0);
  }
  int v2 = v1;
  uint64_t v3 = *(void *)(v0 + 408);
  *(void *)(swift_task_alloc() + 16) = v3;
  sub_D2D0(&qword_1DF98);
  sub_12A18();
  swift_task_dealloc();
  if (*(unsigned char *)(v0 + 512))
  {
    if ((*(unsigned char *)(v0 + 513) & 1) == 0)
    {
      id v4 = [self serverShareIfRootObject:*(void *)(v0 + 408) managedObjectContext:v2];
      *(void *)(v0 + 448) = v4;
      if (v4)
      {
        uint64_t v5 = v4;
        unint64_t v6 = *(void *)(v0 + 384);
        if (v6 >> 62)
        {
          id v18 = v4;
          swift_bridgeObjectRetain();
          uint64_t v9 = sub_12BA8();
          uint64_t v7 = v9;
          if (!v9) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v7 = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
          id v8 = v4;
          uint64_t v9 = swift_bridgeObjectRetain();
          if (!v7) {
            goto LABEL_21;
          }
        }
        if (v7 < 1)
        {
          __break(1u);
          return _swift_continuation_await(v9);
        }
        uint64_t v10 = 0;
        unint64_t v11 = v6 & 0xC000000000000001;
        uint64_t v12 = *(void *)(v0 + 384) + 32;
        do
        {
          if (v11) {
            id v13 = (id)sub_12B18();
          }
          else {
            id v13 = *(id *)(v12 + 8 * v10);
          }
          unint64_t v14 = v13;
          ++v10;
          [v5 removeParticipant:v13];
        }
        while (v7 != v10);
LABEL_21:
        uint64_t v20 = *(void **)(v0 + 400);
        uint64_t v19 = *(void *)(v0 + 408);

        swift_bridgeObjectRelease();
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 360;
        *(void *)(v0 + 24) = sub_ECB4;
        uint64_t v21 = swift_continuation_init();
        *(void *)(v0 + 232) = _NSConcreteStackBlock;
        *(void *)(v0 + 240) = 0x40000000;
        *(void *)(v0 + 248) = sub_10864;
        *(void *)(v0 + 256) = &unk_18DE8;
        *(void *)(v0 + 264) = v21;
        [v20 prepareShare:v5 forObject:v19 qualityOfService:33 completionHandler:v0 + 232];
        uint64_t v9 = v0 + 16;
        return _swift_continuation_await(v9);
      }
    }

    goto LABEL_17;
  }
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 424) = v15;
  void *v15 = v0;
  v15[1] = sub_E8AC;
  uint64_t v16 = *(void *)(v0 + 408);
  v15[15] = *(void *)(v0 + 392);
  v15[16] = v16;
  return _swift_task_switch(sub_10300, 0, 0);
}

uint64_t sub_E8AC()
{
  *(void *)(*(void *)v1 + 432) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_EA28;
  }
  else {
    int v2 = sub_E9C0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_E9C0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_EA28()
{
  swift_getErrorValue();
  uint64_t v1 = sub_7278(*(void *)(v0 + 280), *(void *)(v0 + 288));
  swift_errorRelease();
  if (v1)
  {
    int v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v2;
    void *v2 = v0;
    v2[1] = sub_EB44;
    uint64_t v3 = *(void *)(v0 + 408);
    v2[3] = *(void *)(v0 + 432);
    v2[4] = v3;
    return _swift_task_switch(sub_10614, 0, 0);
  }
  else
  {
    swift_errorRelease();

    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4(0);
  }
}

uint64_t sub_EB44()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_EC40, 0, 0);
}

uint64_t sub_EC40()
{
  swift_willThrow();

  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_ECB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 456) = v1;
  if (v1) {
    int v2 = sub_F3DC;
  }
  else {
    int v2 = sub_EDC4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_EDC4()
{
  uint64_t v1 = *(void **)(v0 + 360);
  *(void *)(v0 + 464) = v1;
  if (!v1)
  {

    id v3 = *(id *)(v0 + 416);
    goto LABEL_8;
  }
  unint64_t v2 = *(void *)(v0 + 384);
  id v3 = v1;
  id v4 = objc_msgSend(v3, "ic_nonCurrentUserParticipants");
  sub_D4B4(0, (unint64_t *)&unk_1DF78);
  unint64_t v5 = sub_12938();

  uint64_t v6 = sub_120BC(v5);
  swift_bridgeObjectRelease();
  LOBYTE(v2) = sub_11270(v2, v6);
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    if (qword_1DA60 == -1)
    {
LABEL_12:
      uint64_t v18 = sub_12898();
      sub_D4F0(v18, (uint64_t)qword_1DF20);
      uint64_t v19 = sub_12888();
      os_log_type_t v20 = sub_129F8();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_0, v19, v20, "Specified participants are not all removed from the share", v21, 2u);
        swift_slowDealloc();
      }
      uint64_t v22 = *(void **)(v0 + 448);

      sub_D970();
      swift_allocError();
      *uint64_t v23 = 5;
      swift_willThrow();

      uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
      return v24();
    }
LABEL_26:
    swift_once();
    goto LABEL_12;
  }
  id v8 = *(void **)(v0 + 408);
  uint64_t v7 = *(void **)(v0 + 416);
  uint64_t v9 = *(void *)(v0 + 384);
  uint64_t v10 = swift_allocObject();
  *(void *)(v0 + 480) = v10;
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_12250;
  *(void *)(v11 + 24) = v10;
  *(void *)(v0 + 176) = sub_12268;
  *(void *)(v0 + 184) = v11;
  *(void *)(v0 + 144) = _NSConcreteStackBlock;
  *(void *)(v0 + 152) = 1107296256;
  *(void *)(v0 + 160) = sub_3558;
  *(void *)(v0 + 168) = &unk_18E50;
  uint64_t v12 = _Block_copy((const void *)(v0 + 144));
  swift_bridgeObjectRetain();
  id v13 = v8;
  swift_retain();
  swift_release();
  [v7 performBlockAndWait:v12];
  _Block_release(v12);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v7)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (objc_msgSend(v3, "ic_nonOwnerInvitedParticipantsCount")
    || (objc_msgSend(v3, "ic_isPublicShare") & 1) != 0)
  {
    unint64_t v14 = *(void **)(v0 + 448);
    uint64_t v15 = *(void **)(v0 + 416);
    swift_release();

LABEL_8:
    uint64_t v16 = *(uint64_t (**)(void *))(v0 + 8);
    return v16(v1);
  }
  if (qword_1DA60 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_12898();
  sub_D4F0(v25, (uint64_t)qword_1DF20);
  id v26 = v3;
  uint64_t v27 = sub_12888();
  os_log_type_t v28 = sub_129E8();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    unint64_t v30 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 138412290;
    *(void *)(v0 + 344) = v26;
    id v31 = v26;
    sub_12A48();
    void *v30 = v1;

    _os_log_impl(&dword_0, v27, v28, "No non-owner participants left on share, removing share %@", v29, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v32 = *(void **)(v0 + 400);
  id v33 = [*(id *)(v0 + 408) objectID];
  *(void *)(v0 + 488) = v33;
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 120) = v0 + 514;
  *(void *)(v0 + 88) = sub_F69C;
  uint64_t v34 = swift_continuation_init();
  *(void *)(v0 + 192) = _NSConcreteStackBlock;
  *(void *)(v0 + 200) = 0x40000000;
  *(void *)(v0 + 208) = sub_6FA8;
  *(void *)(v0 + 216) = &unk_18E78;
  *(void *)(v0 + 224) = v34;
  [v32 removeShareIfNeededWithOwnedObjectID:v33 countParticipants:0 completionHandler:v0 + 192];
  return _swift_continuation_await(v0 + 80);
}

uint64_t sub_F3DC()
{
  swift_willThrow();
  swift_getErrorValue();
  uint64_t v1 = sub_7278(*(void *)(v0 + 328), *(void *)(v0 + 336));
  swift_errorRelease();
  if (v1)
  {
    unint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v2;
    void *v2 = v0;
    v2[1] = sub_F528;
    v2[3] = *(void *)(v0 + 456);
    return _swift_task_switch(sub_10944, 0, 0);
  }
  else
  {
    id v3 = *(void **)(v0 + 448);
    swift_errorRelease();

    id v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4(0);
  }
}

uint64_t sub_F528()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_F624, 0, 0);
}

uint64_t sub_F624()
{
  uint64_t v1 = *(void **)(v0 + 448);
  swift_willThrow();

  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_F69C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 496) = v1;
  if (v1) {
    unint64_t v2 = sub_F83C;
  }
  else {
    unint64_t v2 = sub_F7AC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_F7AC()
{
  uint64_t v1 = *(void **)(v0 + 464);
  swift_release();

  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

uint64_t sub_F83C()
{
  uint64_t v1 = *(void **)(v0 + 488);
  swift_willThrow();

  swift_getErrorValue();
  uint64_t v2 = sub_7278(*(void *)(v0 + 304), *(void *)(v0 + 312));
  swift_errorRelease();
  if (v2)
  {
    id v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 504) = v3;
    *id v3 = v0;
    v3[1] = sub_F9A8;
    v3[3] = *(void *)(v0 + 496);
    return _swift_task_switch(sub_10DD4, 0, 0);
  }
  else
  {
    swift_errorRelease();
    uint64_t v4 = *(void **)(v0 + 464);

    swift_release();
    unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5(0);
  }
}

uint64_t sub_F9A8()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_FAA4, 0, 0);
}

uint64_t sub_FAA4()
{
  uint64_t v1 = *(void **)(v0 + 464);
  uint64_t v2 = *(void **)(v0 + 448);
  swift_willThrow();

  swift_release();
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_FB40()
{
  uint64_t v0 = sub_12898();
  sub_D5D4(v0, qword_1DF20);
  sub_D4F0(v0, (uint64_t)qword_1DF20);
  return sub_12878();
}

uint64_t sub_FB8C(uint64_t a1)
{
  swift_getObjectType();
  sub_1021C(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_101BC((uint64_t)v6);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  sub_D4B4(0, &qword_1DF88);
  id v2 = *(id *)&v5[OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject];
  char v3 = sub_12A38();

  return v3 & 1;
}

id sub_FE98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = [*(id *)(a1 + OBJC_IVAR____TtC13DSNotesPlugin13DSCloudObject_cloudSyncingObject) serverShare];
  uint64_t v4 = result;
  if (result)
  {
    id v5 = [result participants];

    sub_D4B4(0, (unint64_t *)&unk_1DF78);
    unint64_t v6 = sub_12938();

    uint64_t v4 = sub_FF68(v6);
    id result = (id)swift_bridgeObjectRelease();
  }
  *a2 = v4;
  return result;
}

void *sub_FF68(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    id result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t v11 = &_swiftEmptyArrayStorage;
    id result = (void *)sub_12B58();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_12B18();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      unint64_t v6 = v5;
      ++v4;
      uint64_t v7 = (objc_class *)type metadata accessor for DSParticipant();
      id v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant] = v6;
      v10.receiver = v8;
      v10.super_class = v7;
      id v9 = v6;
      objc_msgSendSuper2(&v10, "init");

      sub_12B38();
      sub_12B68();
      sub_12B78();
      sub_12B48();
      if (v2 == v4) {
        return v11;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_12BA8();
    swift_bridgeObjectRelease();
  }
  return result;
}

id sub_10150()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DSCloudObject()
{
  return self;
}

uint64_t sub_101BC(uint64_t a1)
{
  uint64_t v2 = sub_D2D0(&qword_1DDB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1021C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_D2D0(&qword_1DDB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_10284@<X0>(unsigned char *a1@<X8>)
{
  char v3 = *(void **)(v1 + 16);
  *a1 = [v3 isOwnedByCurrentUser];
  id result = [v3 isDeleted];
  a1[1] = (_BYTE)result;
  return result;
}

uint64_t sub_102E0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return _swift_task_switch(sub_10300, 0, 0);
}

uint64_t sub_10300()
{
  uint64_t v1 = (void *)v0[15];
  uint64_t v2 = (void *)v0[16];
  sub_D2D0(&qword_1DD90);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_13470;
  *(void *)(v3 + 32) = v2;
  sub_12958();
  sub_D4B4(0, (unint64_t *)&unk_1DFF0);
  id v4 = v2;
  Class isa = sub_12928().super.isa;
  v0[17] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_10480;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_401C;
  v0[13] = &unk_18E90;
  v0[14] = v6;
  [v1 deleteSharesForObjects:isa completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10480()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    uint64_t v2 = sub_3FAC;
  }
  else {
    uint64_t v2 = sub_10590;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10590()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_105F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return _swift_task_switch(sub_10614, 0, 0);
}

uint64_t sub_10614()
{
  if (qword_1DA60 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = sub_12898();
  sub_D4F0(v2, (uint64_t)qword_1DF20);
  id v3 = v1;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  id v5 = sub_12888();
  os_log_type_t v6 = sub_129F8();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[4];
  if (v7)
  {
    id v9 = v0 + 2;
    os_log_type_t type = v6;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v0;
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    v0[2] = v8;
    uint64_t v12 = v5;
    id v13 = v8;
    sub_12A48();
    *uint64_t v11 = v8;

    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    *id v9 = v14;
    id v5 = v12;
    sub_12A48();
    v11[1] = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v12, type, "Remote delete of share for %@ failed with error %@", (uint8_t *)v10, 0x16u);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v18;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_10864(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_D2D0((uint64_t *)&unk_1DFE0);
    uint64_t v5 = swift_allocError();
    *os_log_type_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
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
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t sub_10924(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10944, 0, 0);
}

uint64_t sub_10944()
{
  if (qword_1DA60 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DF20);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129F8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint64_t *)(v0 + 16);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = v0;
    os_log_type_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v4 = v7;
    sub_12A48();
    *os_log_type_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error occurred while preparing share: %@", v5, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v10;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

void sub_10B40(uint64_t a1, void *a2)
{
  if (qword_1DA60 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_12898();
  sub_D4F0(v3, (uint64_t)qword_1DF20);
  swift_bridgeObjectRetain_n();
  id v4 = a2;
  uint64_t v5 = sub_12888();
  os_log_type_t v6 = sub_129D8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_D4B4(0, (unint64_t *)&unk_1DF78);
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_12948();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_BC30(v9, v11, &v13);
    sub_12A48();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2112;
    id v12 = v4;
    sub_12A48();
    void *v8 = v4;

    _os_log_impl(&dword_0, v5, v6, "Successfully removed %s from shared resource %@", (uint8_t *)v7, 0x16u);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_10DB4(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10DD4, 0, 0);
}

uint64_t sub_10DD4()
{
  if (qword_1DA60 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_12898();
  sub_D4F0(v1, (uint64_t)qword_1DF20);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_12888();
  os_log_type_t v3 = sub_129F8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint64_t *)(v0 + 16);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = v0;
    os_log_type_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t *v4 = v7;
    sub_12A48();
    *os_log_type_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error occurred while removing owned share: %@", v5, 0xCu);
    sub_D2D0(&qword_1DCB0);
    swift_arrayDestroy();
    uint64_t v0 = v10;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10FD0(void *a1, void *a2)
{
  os_log_type_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_12AA8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_D4B4(0, (unint64_t *)&unk_1DF78);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_12A98();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_115F0(v7, result + 1);
    os_log_type_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_117E8();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_11A88((uint64_t)v8, v23);
    *os_log_type_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_12A28(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_D4B4(0, (unint64_t *)&unk_1DF78);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_12A38();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        os_log_type_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_12A38();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *os_log_type_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_11B0C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *os_log_type_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_11270(unint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (!sub_12A98()) {
      return 1;
    }
  }
  else if (!*(void *)(a2 + 16))
  {
    return 1;
  }
  if (a1 >> 62) {
    goto LABEL_41;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_12BA8())
  {
    sub_D4B4(0, (unint64_t *)&unk_1DF78);
    uint64_t v35 = v5;
    unint64_t v36 = v4;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = 0;
      uint64_t v7 = a2 + 56;
      while (1)
      {
        sub_12B18();
        if (__OFADD__(v6++, 1)) {
          break;
        }
        if (v4)
        {
          char v8 = sub_12AC8();
          swift_unknownObjectRelease();
          if (v8) {
            goto LABEL_37;
          }
          if (v6 == v5) {
            goto LABEL_21;
          }
        }
        else
        {
          if (*(void *)(a2 + 16))
          {
            Swift::Int v10 = sub_12A28(*(void *)(a2 + 40));
            uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
            unint64_t v12 = v10 & ~v11;
            if ((*(void *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
            {
              id v13 = *(id *)(*(void *)(a2 + 48) + 8 * v12);
              char v14 = sub_12A38();

              if (v14)
              {
LABEL_36:
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
                return 0;
              }
              uint64_t v15 = ~v11;
              while (1)
              {
                unint64_t v12 = (v12 + 1) & v15;
                if (((*(void *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
                  break;
                }
                id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v12);
                char v17 = sub_12A38();

                if (v17) {
                  goto LABEL_36;
                }
              }
            }
          }
          swift_unknownObjectRelease();
          uint64_t v5 = v35;
          unint64_t v4 = v36;
          if (v6 == v35) {
            goto LABEL_21;
          }
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v19 = 0;
      unint64_t v20 = a1 + 32;
      uint64_t v37 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
      uint64_t v21 = a2 + 56;
      while (v19 != v37)
      {
        id v24 = *(void **)(v20 + 8 * v19);
        if (v4)
        {
          id v22 = v24;
          char v23 = sub_12AC8();

          if (v23)
          {
LABEL_37:
            swift_bridgeObjectRelease();
            return 0;
          }
        }
        else if (*(void *)(a2 + 16))
        {
          Swift::Int v25 = *(void *)(a2 + 40);
          id v26 = v24;
          Swift::Int v27 = sub_12A28(v25);
          uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
          unint64_t v29 = v27 & ~v28;
          if ((*(void *)(v21 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29))
          {
            id v30 = *(id *)(*(void *)(a2 + 48) + 8 * v29);
            char v31 = sub_12A38();

            if (v31)
            {
LABEL_38:
              swift_bridgeObjectRelease();

              return 0;
            }
            uint64_t v32 = ~v28;
            while (1)
            {
              unint64_t v29 = (v29 + 1) & v32;
              if (((*(void *)(v21 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0) {
                break;
              }
              id v33 = *(id *)(*(void *)(a2 + 48) + 8 * v29);
              char v34 = sub_12A38();

              if (v34) {
                goto LABEL_38;
              }
            }
          }

          uint64_t v5 = v35;
          unint64_t v4 = v36;
          unint64_t v20 = a1 + 32;
        }
        if (++v19 == v5) {
          goto LABEL_21;
        }
      }
    }
    __break(1u);
LABEL_41:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 1;
}

Swift::Int sub_115F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_D2D0(&qword_1DFD8);
    uint64_t v2 = sub_12AF8();
    uint64_t v14 = v2;
    sub_12A88();
    if (sub_12AB8())
    {
      sub_D4B4(0, (unint64_t *)&unk_1DF78);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_117E8();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_12A28(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_12AB8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_117E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_D2D0(&qword_1DFD8);
  uint64_t v3 = sub_12AE8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_12A28(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_11A88(uint64_t a1, void *a2)
{
  sub_12A28(a2[5]);
  unint64_t result = sub_12A78();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_11B0C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_117E8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_11C94();
      goto LABEL_14;
    }
    sub_11E40();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_12A28(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_D4B4(0, (unint64_t *)&unk_1DF78);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_12A38();

    if (v12)
    {
LABEL_13:
      sub_12C08();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_12A38();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_11C94()
{
  uint64_t v1 = v0;
  sub_D2D0(&qword_1DFD8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_12AD8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_11E40()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_D2D0(&qword_1DFD8);
  uint64_t v3 = sub_12AE8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_12A28(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_120BC(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_12BA8();
    swift_bridgeObjectRelease();
  }
  sub_D4B4(0, (unint64_t *)&unk_1DF78);
  sub_12288();
  uint64_t result = sub_129B8();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_12BA8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_12B18();
        sub_10FD0(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_10FD0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_12210()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_12250()
{
  sub_10B40(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_12258()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_12268()
{
  return sub_3530(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_12270(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_12280()
{
  return swift_release();
}

unint64_t sub_12288()
{
  unint64_t result = qword_1DFD0;
  if (!qword_1DFD0)
  {
    sub_D4B4(255, (unint64_t *)&unk_1DF78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1DFD0);
  }
  return result;
}

uint64_t sub_122F4(uint64_t a1)
{
  swift_getObjectType();
  sub_1021C(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_101BC((uint64_t)v6);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  sub_12828();
  id v2 = *(id *)&v5[OBJC_IVAR____TtC13DSNotesPlugin13DSParticipant_participant];
  char v3 = sub_12A38();

  return v3 & 1;
}

uint64_t CKUserIdentity.unifiedContactIdentifier.getter()
{
  id v1 = [v0 contactIdentifiers];
  uint64_t v2 = sub_12938();

  if (*(void *)(v2 + 16))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t CKUserIdentity.emailAddress.getter()
{
  return sub_1276C((SEL *)&selRef_emailAddress);
}

id sub_126A8(void *a1, uint64_t a2, SEL *a3)
{
  id v4 = a1;
  id v5 = [v4 lookupInfo];
  if (v5 && (uint64_t v6 = v5, v7 = [v5 *a3], v6, v7))
  {
    sub_128E8();

    NSString v8 = sub_128B8();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v8 = 0;
  }

  return v8;
}

uint64_t CKUserIdentity.phoneNumber.getter()
{
  return sub_1276C((SEL *)&selRef_phoneNumber);
}

uint64_t sub_1276C(SEL *a1)
{
  id v3 = [v1 lookupInfo];
  id v4 = v3;
  if (!v3) {
    return 0;
  }
  id v5 = [v3 *a1];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = sub_128E8();

  return v6;
}

uint64_t type metadata accessor for DSParticipant()
{
  return self;
}

unint64_t sub_12828()
{
  unint64_t result = qword_1DF88;
  if (!qword_1DF88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1DF88);
  }
  return result;
}

uint64_t sub_12868()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_12878()
{
  return static Logger.digitalSeparation.getter();
}

uint64_t sub_12888()
{
  return Logger.logObject.getter();
}

uint64_t sub_12898()
{
  return type metadata accessor for Logger();
}

uint64_t sub_128A8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_128B8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_128C8()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_128D8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_128E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_128F8()
{
  return String.hash(into:)();
}

Swift::Int sub_12908()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_12918()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_12928()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_12938()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_12948()
{
  return Array.description.getter();
}

uint64_t sub_12958()
{
  return specialized Array._endMutation()();
}

uint64_t sub_12968()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_12978()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_12988()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_12998()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_129A8()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_129B8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_129C8()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_129D8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_129E8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_129F8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_12A18()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

Swift::Int sub_12A28(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_12A38()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_12A48()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_12A58()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_12A68()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_12A78()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_12A88()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_12A98()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_12AA8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_12AB8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_12AC8()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_12AD8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_12AE8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_12AF8()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_12B08()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_12B18()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_12B28()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_12B38()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_12B48()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_12B58()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_12B68()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_12B78()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_12B88()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_12B98()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_12BA8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_12BB8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_12BD8()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_12BE8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_12BF8()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_12C08()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_12C18()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_12C28()
{
  return Error._code.getter();
}

uint64_t sub_12C38()
{
  return Error._domain.getter();
}

uint64_t sub_12C48()
{
  return Error._userInfo.getter();
}

uint64_t sub_12C58()
{
  return Hasher.init(_seed:)();
}

void sub_12C68(Swift::UInt a1)
{
}

Swift::Int sub_12C78()
{
  return Hasher._finalize()();
}

uint64_t CKErrorIsCode()
{
  return _CKErrorIsCode();
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

void bzero(void *a1, size_t a2)
{
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}