void sub_10000433C(uint64_t a1@<X0>, char a2@<W1>, unsigned char *a3@<X8>)
{
  int v5;

  if (*(unsigned char *)a1 != 1) {
    goto LABEL_7;
  }
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(a1 + 1) = 1;
    v5 = *(unsigned __int8 *)(a1 + 2);
    if (v5 == 1)
    {
      *(unsigned char *)(a1 + 2) = 0;
      goto LABEL_8;
    }
LABEL_7:
    LOBYTE(v5) = 0;
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1) != 1) {
    goto LABEL_7;
  }
  *(_WORD *)(a1 + 1) = 256;
  *(void *)(a1 + 8) = OrchestrationWorkQueueStatusObserver.finishedWorkPlans.getter();
  *(CFAbsoluteTime *)(a1 + 16) = CFAbsoluteTimeGetCurrent();
  LOBYTE(v5) = 1;
LABEL_8:
  *a3 = v5;
}

void *initializeBufferWithCopyOfBuffer for WorkRunner(void *a1, void *a2)
{
  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

uint64_t sub_100004408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(CFAbsoluteTime *)a2 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 16);
  uint64_t result = OrchestrationWorkQueueStatusObserver.finishedWorkPlans.getter();
  uint64_t v5 = *(void *)(a1 + 8);
  BOOL v6 = __OFSUB__(result, v5);
  uint64_t v7 = result - v5;
  if (v6) {
    __break(1u);
  }
  else {
    *(void *)(a2 + 8) = v7;
  }
  return result;
}

uint64_t sub_10000446C()
{
  uint64_t v1 = type metadata accessor for GenerationWorkRequest();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v11, v10);
}

uint64_t sub_1000045DC()
{
  uint64_t v0 = type metadata accessor for DispatchTimeInterval();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (uint64_t *)((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  void *v3 = 1;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchTimeInterval.seconds(_:), v0);
  HealthAppForegroundWorkManager.forceStart(within:)();
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
  return HealthAppForegroundWorkManager.foregroundWithLegacyGeneration(completion:)();
}

uint64_t sub_1000046EC()
{
  uint64_t v1 = type metadata accessor for TransactionRecord();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_1000047D8()
{
  dispatch thunk of UnfairLock.assertOwner()();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong) {
    return Strong;
  }
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v5)
  {
    sub_10000A908(&v4, (uint64_t)v6);
    uint64_t v2 = sub_100006864((uint64_t)v6, *(void **)(v0 + 32));
    sub_10000E7F8((uint64_t)v6);
    swift_weakAssign();
  }
  else
  {
    sub_10001727C((uint64_t)&v4);
    return 0;
  }
  return v2;
}

uint64_t sub_100004884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 16));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v6 + 8;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v4 + v9) & ~v9;
  v7(v10, AssociatedTypeWitness);
  uint64_t v11 = *(void *)(v8 + 56);
  uint64_t v12 = (v11 + v9 + v10) & ~v9;
  v7(v12, AssociatedTypeWitness);
  uint64_t v13 = swift_getAssociatedTypeWitness();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (v12 + v11 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v18 = v14;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v15, 1, v13);
  if (!result)
  {
    v17 = *(uint64_t (**)(unint64_t, uint64_t))(v18 + 8);
    return v17(v15, v13);
  }
  return result;
}

void sub_100004AA0(char a1, uint64_t a2, char a3)
{
  if (a1)
  {
    uint64_t v4 = *(os_unfair_lock_s **)(a2 + 104);
    swift_retain();
    os_unfair_lock_lock(v4 + 14);
    sub_10000F914((uint64_t)&v4[4], (uint64_t)v7);
    os_unfair_lock_unlock(v4 + 14);
    Swift::Double v5 = *(double *)v7;
    Swift::Int v6 = v7[1];
    swift_release();
    if (a3) {
      OrchestrationWorkQueueStatusObserver.didStartForegroundSession(planCount:duration:)(v6, v5);
    }
  }
}

uint64_t sub_100004B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 48);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  uint64_t v10 = v8 + 16;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v10 + 48);
  uint64_t v16 = (v15 + v11 + v13) & ~v11;
  uint64_t v17 = (v15 + v11 + v14) & ~v11;
  v9(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (void *)((v15 + v20 + v16) & ~v20);
  v22 = (const void *)((v15 + v20 + v17) & ~v20);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v22, 1, v18))
  {
    if (*(_DWORD *)(v19 + 84)) {
      size_t v23 = *(void *)(v19 + 64);
    }
    else {
      size_t v23 = *(void *)(v19 + 64) + 1;
    }
    memcpy(v21, v22, v23);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v21, v22, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_100004D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *a5;
  uint64_t v10 = type metadata accessor for PriorityRuleSet.Priority();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)();
  return sub_100004F44((uint64_t)v8);
}

void sub_100004EE0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_100004F44(uint64_t a1)
{
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100004FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))GenerationWorkRequest.makeGenerationWorkBlock.getter();
  uint64_t v7 = (void *)v6(a1);
  uint64_t v9 = v8;
  swift_release();
  dispatch thunk of UnfairLock.lock()();
  swift_beginAccess();
  uint64_t v10 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = v7;
  *(void *)(a4 + 24) = v9;
  id v11 = v7;

  dispatch thunk of UnfairLock.unlock()();
  return v7;
}

id sub_10000507C(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener);
  uint64_t v6 = *(void **)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle);
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle);
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle);
  uint64_t v9 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle);
  uint64_t v10 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager);
  uint64_t v11 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities);
  id v12 = objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
  id v13 = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v14 = sub_1000077A4(v13, v7, v8, v9, v10, v11);
  id v15 = sub_100009178(a1, a2);

  return v15;
}

void sub_1000051A8()
{
  uint64_t v0 = self;
  id v1 = [v0 sharedBehavior];
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v2 = v1;
  unsigned int v3 = [v1 isiPad];

  if (!v3)
  {
LABEL_6:
    id v8 = [self standardUserDefaults];
    NSString v9 = String._bridgeToObjectiveC()();
    [v8 BOOLForKey:v9];

    return;
  }
  id v4 = [v0 sharedBehavior];
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  id v6 = [v4 features];

  if (!v6)
  {
LABEL_10:
    __break(1u);
    return;
  }
  unsigned int v7 = [v6 stanley];

  if (v7) {
    goto LABEL_6;
  }
}

uint64_t sub_1000052E4@<X0>(void *a1@<X1>, const char *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a2, v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = type metadata accessor for PinnedContentManager();
  id v14 = a1;
  uint64_t result = PinnedContentManager.__allocating_init(healthStore:domain:)();
  a3[3] = v13;
  a3[4] = (uint64_t)&protocol witness table for PinnedContentManager;
  *a3 = result;
  return result;
}

uint64_t sub_100005464(uint64_t a1, Swift::OpaquePointer a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  GeneratorPipelineManager.store.getter();
  sub_1000057EC(v24, v25);
  NSString v9 = (void *)dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
  NSManagedObjectContext.queue_createProfiles(for:)(a2);

  sub_10000E7F8((uint64_t)v24);
  GeneratorPipelineManager.store.getter();
  sub_1000057EC(v24, v25);
  uint64_t v10 = (void *)dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
  id v23 = 0;
  unsigned int v11 = [v10 save:&v23];

  id v12 = v23;
  uint64_t result = sub_10000E7F8((uint64_t)v24);
  if (!v11)
  {
    uint64_t v14 = _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.generation.getter();
    swift_errorRetain();
    swift_errorRetain();
    id v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      v24[0] = a3;
      *(_DWORD *)uint64_t v17 = 136446466;
      swift_getMetatypeMetadata();
      uint64_t v18 = String.init<A>(describing:)();
      v24[0] = sub_10000E724(v18, v19, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      v24[0] = v14;
      swift_errorRetain();
      sub_10000EC60(0, &qword_100045F48);
      uint64_t v20 = String.init<A>(describing:)();
      v24[0] = sub_10000E724(v20, v21, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s]: Unable to update stored profiles: %s", (uint8_t *)v17, 0x16u);
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
    }
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

void *sub_1000057EC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_100005830(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchTimeInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for EnvironmentalStateDescription();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unsigned int v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static EnvironmentalStateDescription.appForeground(bundleIdentifier:)();
  swift_bridgeObjectRelease();
  Swift::Bool v12 = EnvironmentalStateDescription.matches(_:)(a1);
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = *(os_unfair_lock_s **)(v2 + 104);
  v19[16] = v12;
  uint64_t v20 = v2;
  swift_retain();
  os_unfair_lock_lock(v13 + 14);
  sub_10000F930((uint64_t)&v13[4], v21);
  os_unfair_lock_unlock(v13 + 14);
  int v14 = LOBYTE(v21[0]);
  swift_release();
  if (v12)
  {
    *uint64_t v7 = 1;
    (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for DispatchTimeInterval.seconds(_:), v4);
    HealthAppForegroundWorkManager.forceStart(within:)();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
    if (v14)
    {
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = v2;
      *(unsigned char *)(v15 + 24) = 1;
      swift_retain();
      HealthAppForegroundWorkManager.foregroundWithFireOnceBarrier(_:)();
      swift_release();
    }
  }
  else
  {
    HealthAppForegroundWorkManager.endForeground()();
    if (v14)
    {
      os_log_type_t v16 = *(os_unfair_lock_s **)(v2 + 104);
      swift_retain();
      os_unfair_lock_lock(v16 + 14);
      sub_10000F914((uint64_t)&v16[4], (uint64_t)v21);
      os_unfair_lock_unlock(v16 + 14);
      Swift::Double v17 = *(double *)v21;
      Swift::Int v18 = v21[1];
      swift_release();
      OrchestrationWorkQueueStatusObserver.didEndForegroundSession(planCount:duration:)(v18, v17);
    }
  }
}

uint64_t sub_100005B18(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  GeneratorPipelineManager.store.getter();
  sub_1000057EC(v11, v11[3]);
  uint64_t v5 = dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = v4;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10000FAD4;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_10000EE20;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000EE48;
  aBlock[3] = &unk_100042010;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [(id)v5 performBlockAndWait:v8];

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v5)
  {
    __break(1u);
  }
  else
  {
    sub_10000E7F8((uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_100005CE8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005D88(a1, a2, a3, (void *)*v3, &qword_1000466C8, (uint64_t (*)(uint64_t))sub_100006054, (uint64_t (*)(void))sub_100006054);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005D38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005D88(a1, a2, a3, (void *)*v3, &qword_1000466D0, (uint64_t (*)(uint64_t))sub_100006088, (uint64_t (*)(void))sub_100006088);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100005D88(char a1, int64_t a2, char a3, void *a4, unint64_t *a5, uint64_t (*a6)(uint64_t), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v10 = a4[3];
    int64_t v11 = v10 >> 1;
    if ((uint64_t)(v10 >> 1) < a2)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v11 = a2;
      }
    }
  }
  else
  {
    int64_t v11 = a2;
  }
  uint64_t v12 = a4[2];
  if (v11 <= v12) {
    uint64_t v13 = a4[2];
  }
  else {
    uint64_t v13 = v11;
  }
  if (!v13)
  {
    Swift::Double v17 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005FEC(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v14 = *(void *)(a7(0) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  unint64_t v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  Swift::Double v17 = (void *)swift_allocObject();
  size_t v18 = j__malloc_size(v17);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v18 - v16 == 0x8000000000000000 && v15 == -1) {
    goto LABEL_34;
  }
  v17[2] = v12;
  v17[3] = 2 * ((uint64_t)(v18 - v16) / v15);
LABEL_19:
  uint64_t v20 = *(void *)(a7(0) - 8);
  unint64_t v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  uint64_t v22 = (char *)v17 + v21;
  id v23 = (char *)a4 + v21;
  if (a1)
  {
    if (v17 < a4 || v22 >= &v23[*(void *)(v20 + 72) * v12])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v17 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v24 = *(void *)(v20 + 72) * v12;
  uint64_t v25 = &v22[v24];
  unint64_t v26 = (unint64_t)&v23[v24];
  if (v23 >= v25 || (unint64_t)v22 >= v26)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v17;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100005FEC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_100006054(uint64_t a1)
{
}

void sub_100006088(uint64_t a1)
{
}

uint64_t sub_1000060BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenerationPhase();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_100006258((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_100006258(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for GenerationPhase();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
  swift_bridgeObjectRetain();
  v33 = a2;
  uint64_t v11 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    v28 = v2;
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
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_10000681C(&qword_1000469B8, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v22 = *v17;
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
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10000657C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_10000657C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for GenerationPhase();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_10002C000();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10002D1D0();
      goto LABEL_12;
    }
    sub_10002D9B4();
  }
  uint64_t v12 = *v3;
  sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10000681C(&qword_1000469B8, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
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
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000681C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006864(uint64_t a1, void *a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  sub_10000A884(a1, (uint64_t)v25);
  unint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = a1;
    uint64_t v13 = v12;
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    v23[0] = v5;
    swift_getMetatypeMetadata();
    uint64_t v22 = a2;
    uint64_t v14 = String.init<A>(describing:)();
    v23[0] = sub_10000E724(v14, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_10000A884((uint64_t)v25, (uint64_t)v23);
    sub_10000EC10(0, (unint64_t *)&qword_1000460C0);
    uint64_t v16 = String.init<A>(describing:)();
    v23[0] = sub_10000E724(v16, v17, &v24);
    a2 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000E7F8((uint64_t)v25);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s]: createSummaryTabFeedPopulationManager() readyHealthExperienceStore: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v21;
    swift_slowDealloc();
  }
  else
  {
    sub_10000E7F8((uint64_t)v25);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  type metadata accessor for SummaryTabFeedPopulationManager();
  sub_10000A884(a1, (uint64_t)v25);
  id v18 = a2;
  return SummaryTabFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:)();
}

uint64_t sub_100006B2C()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v18 = v3;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = ObjectType;
    *(_DWORD *)uint64_t v9 = 136446210;
    unint64_t v17 = v9 + 4;
    swift_getMetatypeMetadata();
    uint64_t v10 = String.init<A>(describing:)();
    uint64_t v20 = sub_10000E724(v10, v11, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%{public}s]: Beginning to watch generation to pick a new feed", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v20 = *(void *)(v1 + qword_100046A00);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10000EFAC(0, &qword_100046A60, (uint64_t (*)(uint64_t))&type metadata accessor for FeedItemChangeDomain, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
  sub_10000F020();
  swift_retain();
  uint64_t v12 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  *(void *)(v1 + qword_1000469F0) = v12;
  swift_release();
  uint64_t v20 = *(void *)(v1 + qword_100046A08);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = ObjectType;
  sub_10000EEEC();
  sub_10000F6B4(&qword_100046A78, (void (*)(uint64_t))sub_10000EEEC);
  swift_retain();
  uint64_t v15 = Publisher.sink(receiveCompletion:receiveValue:)();
  swift_release();
  swift_release();
  *(void *)(v1 + qword_1000469E8) = v15;
  return swift_release();
}

id sub_100006F08(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  v59[1] = a3;
  v60 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v74 = type metadata accessor for GenerationQueue.EnqueueResult();
  uint64_t v73 = *(void *)(v74 - 8);
  uint64_t v4 = __chkstk_darwin(v74);
  v72 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v71 = (char *)v59 - v6;
  uint64_t v7 = type metadata accessor for GenerationWorkRequest();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = __chkstk_darwin(v7);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v59 - v11;
  v85 = (char *)v59 - v11;
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v87 = *(void *)(v13 - 8);
  v76 = *(void (**)(uint64_t, char *, uint64_t))(v87 + 64);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v86 = (char *)v59 - v17;
  UUID.init()();
  type metadata accessor for UnfairLock();
  swift_allocObject();
  uint64_t v70 = UnfairLock.init()();
  uint64_t v18 = swift_allocObject();
  uint64_t v84 = v18;
  *(void *)(v18 + 16) = 0;
  *(void *)(v18 + 24) = 0;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v78 = a1;
  uint64_t v82 = v7;
  v19(v12, a1, v7);
  v79 = v19;
  uint64_t v80 = v8 + 16;
  v62 = (void (*)(uint64_t, char *, uint64_t))swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = (char *)v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v20;
  v19(v20, a1, v7);
  uint64_t v21 = v87;
  v68 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  uint64_t v22 = v13;
  uint64_t v83 = v13;
  v68(v16, v86, v13);
  uint64_t v23 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = (v23 + 16) & ~v23;
  uint64_t v25 = v23 | 7;
  uint64_t v69 = v23 | 7;
  uint64_t v77 = v24;
  uint64_t v26 = *(unsigned __int8 *)(v21 + 80);
  unint64_t v27 = (v9 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v64 = v27;
  uint64_t v28 = (v26 + v27 + 8) & ~v26;
  uint64_t v67 = v25 | v26;
  uint64_t v65 = v28;
  unint64_t v66 = (((unint64_t)v76 + v28 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  unint64_t v29 = ((unint64_t)v76 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v63 = v29;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v75 = v8;
  v76 = v31;
  uint64_t v32 = v82;
  v31(v30 + v24, v20, v82);
  *(void *)(v30 + v27) = v62;
  v62 = *(void (**)(uint64_t, char *, uint64_t))(v87 + 32);
  v33 = v16;
  v62(v30 + v28, v16, v22);
  *(void *)(v30 + v29) = ObjectType;
  GenerationWorkRequest.completionBlock.setter();
  uint64_t v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = v61;
  v79(v61, v78, v32);
  uint64_t v36 = v83;
  v68(v16, v86, v83);
  uint64_t v37 = swift_allocObject();
  v38 = v35;
  v76(v37 + v77, v35, v32);
  unint64_t v39 = v64;
  *(void *)(v37 + v64) = v34;
  uint64_t v40 = v70;
  v62(v37 + v65, v33, v36);
  uint64_t v41 = ObjectType;
  *(void *)(v37 + v63) = ObjectType;
  uint64_t v42 = v84;
  GenerationWorkRequest.notStartedCancellationBlock.setter();
  v79(v38, v78, v32);
  uint64_t v43 = swift_allocObject();
  v76(v43 + v77, v38, v32);
  *(void *)(v43 + v39) = v40;
  *(void *)(v43 + ((v39 + 15) & 0xFFFFFFFFFFFFFFF8)) = v42;
  uint64_t v44 = v40;
  swift_retain();
  swift_retain();
  GenerationWorkRequest.makeGenerationWorkBlock.setter();
  v45 = v71;
  dispatch thunk of GenerationQueue.enqueue(_:)();
  uint64_t v46 = v73;
  v47 = v72;
  v48 = v45;
  uint64_t v49 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v48, v74);
  uint64_t v50 = v46;
  uint64_t v51 = v49;
  LODWORD(v46) = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v47, v49);
  LODWORD(v49) = enum case for GenerationQueue.EnqueueResult.dropped(_:);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v51);
  if (v46 == v49)
  {
    v60(0);
    id v52 = [objc_allocWithZone((Class)NSProgress) initWithParent:0 userInfo:0];
    v53 = v86;
  }
  else
  {
    id v54 = [objc_allocWithZone((Class)NSProgress) initWithParent:0 userInfo:0];
    v55 = (void *)swift_allocObject();
    uint64_t v56 = v84;
    v55[2] = v44;
    v55[3] = v56;
    v55[4] = v41;
    aBlock[4] = sub_10002745C;
    aBlock[5] = v55;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100010A84;
    aBlock[3] = &unk_1000421A0;
    v57 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    sub_10000A8E8((uint64_t)sub_10002745C);
    swift_release();
    [v54 setCancellationHandler:v57];
    _Block_release(v57);
    swift_release();
    swift_retain();
    v53 = v86;
    id v52 = (id)dispatch thunk of CancellableProgressList.add(_:uuid:)();
    swift_release();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v85, v82);
  (*(void (**)(char *, uint64_t))(v87 + 8))(v53, v83);
  swift_release();
  return v52;
}

id sub_1000077A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a1;
  uint64_t v41 = a6;
  uint64_t v47 = a4;
  uint64_t v48 = a5;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  v36[0] = swift_getObjectType();
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  __chkstk_darwin();
  uint64_t v42 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FBEC(0);
  uint64_t v39 = v9;
  __chkstk_darwin();
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v12 = *(void *)(v38 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  *(void *)&v6[OBJC_IVAR____TtC10healthappd23HealthPluginHostService____lazy_storage___healthWelcomeFlowSignalManager] = 0;
  uint64_t v37 = OBJC_IVAR____TtC10healthappd23HealthPluginHostService_schedulerDispatchQueue;
  v36[1] = sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  uint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  uint64_t v15 = v6;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  static DispatchQoS.unspecified.getter();
  uint64_t v51 = &_swiftEmptyArrayStorage;
  sub_10000C454(&qword_1000462E0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005FEC(0, &qword_1000462E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10000ED98();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v38);
  *(void *)&v6[v37] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v16 = OBJC_IVAR____TtC10healthappd23HealthPluginHostService_lock;
  type metadata accessor for UnfairLock();
  swift_allocObject();
  *(void *)&v15[v16] = UnfairLock.init()();
  uint64_t v17 = OBJC_IVAR____TtC10healthappd23HealthPluginHostService_ongoingWork;
  type metadata accessor for CancellableProgressList();
  swift_allocObject();
  *(void *)&v15[v17] = CancellableProgressList.init()();
  static UserDefaultsKeys.appFirstLaunchDateKey.getter();
  sub_10000C49C(0, &qword_1000460D0);
  static NSUserDefaults.healthAppShared.getter();
  uint64_t v18 = type metadata accessor for Date();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v11, 1, 1, v18);
  UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)();
  static UserDefaultsKeys.appLastOpenedDateKey.getter();
  static NSUserDefaults.healthAppShared.getter();
  v19(v11, 1, 1, v18);
  UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)();
  uint64_t v21 = v40;
  uint64_t v20 = v41;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_healthExperienceStoreOracle] = v40;
  uint64_t v22 = v46;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_feedPopulationManagerOracle] = v45;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle] = v22;
  uint64_t v23 = v48;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_countryOracle] = v47;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_transactionBuilderManager] = v23;
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_backgroundGenerationActivities] = v20;
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  id v24 = v21;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v25 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  *(void *)&v15[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_availablePlugins] = v25;

  uint64_t v26 = v42;
  static Logger.daemon.getter();
  unint64_t v27 = v26;
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v51 = (void *)v36[0];
    swift_getMetatypeMetadata();
    uint64_t v31 = String.init<A>(describing:)();
    uint64_t v51 = (void *)sub_10000E724(v31, v32, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "[%s] init()", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v43 + 8))(v27, v44);
  v33 = (objc_class *)type metadata accessor for HealthPluginHostService(0);
  v50.receiver = v15;
  v50.super_class = v33;
  id v34 = objc_msgSendSuper2(&v50, "init");
  DebuggingResponder.registerForDebuggingRequests()();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v34;
}

uint64_t sub_100007EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = type metadata accessor for DispatchQueueOrchestrationScheduler();
  uint64_t v21 = &protocol witness table for DispatchQueueOrchestrationScheduler;
  v19[0] = a8;
  v18[3] = v20;
  v18[4] = &protocol witness table for DispatchQueueOrchestrationScheduler;
  v18[0] = a9;
  type metadata accessor for HealthPluginHostService.JustPrimarySnippetsFeedItemGeneratorPipelineManager(0);
  swift_allocObject();
  sub_10000A884(a1, (uint64_t)v17);
  sub_10000A884(a5, (uint64_t)v16);
  sub_10000A884((uint64_t)v19, (uint64_t)v15);
  sub_10000A884((uint64_t)v18, (uint64_t)v14);
  uint64_t v12 = FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)();
  sub_10000E7F8((uint64_t)v18);
  sub_10000E7F8((uint64_t)v19);
  sub_10000E7F8(a5);
  sub_10000E7F8(a1);
  return v12;
}

uint64_t sub_100007FEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v102 = a5;
  uint64_t v99 = a4;
  uint64_t v101 = a3;
  uint64_t v98 = a2;
  id v97 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v108 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v108 - 8);
  uint64_t v7 = __chkstk_darwin(v108);
  uint64_t v9 = (char *)v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v92 - v10;
  uint64_t v12 = type metadata accessor for DispatchTimeInterval();
  uint64_t v106 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v107 = (void *)((char *)v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000EB64();
  __chkstk_darwin(v14 - 8);
  v105 = (char *)v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000EE70();
  uint64_t v104 = v16;
  uint64_t v103 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v100 = (char *)v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006054(0);
  uint64_t v111 = v18;
  uint64_t v115 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  v114 = (char *)v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for PipelineProviderWrappers();
  uint64_t v20 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v22 = (char *)v92 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006088(0);
  uint64_t v110 = v23;
  uint64_t v113 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  v112 = (char *)v92 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  unint64_t v25 = dispatch thunk of PluginBundleProvider.availableLaunchGenerationPlugins.getter();
  swift_release();
  type metadata accessor for BundleFeedItemGenerationPluginInfo();
  sub_10000C454(&qword_100046170, (void (*)(uint64_t))&type metadata accessor for BundleFeedItemGenerationPluginInfo);
  uint64_t v26 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  if (*(void *)(v26 + 16))
  {
    uint64_t v94 = v12;
    v93 = (void *)ObjectType;
    v96 = v11;
    uint64_t v95 = v6;
    swift_bridgeObjectRelease();
    int64_t v27 = *(void *)(v26 + 16);
    if (v27)
    {
      v128 = &_swiftEmptyArrayStorage;
      sub_100005D38(0, v27, 0);
      os_log_type_t v29 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
      uint64_t v28 = (char *)(v20 + 16);
      v118 = v29;
      unint64_t v30 = (v28[64] + 32) & ~(unint64_t)v28[64];
      v92[1] = v26;
      unint64_t v31 = v26 + v30;
      v117 = *((void *)v28 + 7);
      v119 = v28;
      v116 = v28 - 8;
      uint64_t v109 = v113 + 32;
      unint64_t v32 = v26 + v30;
      int64_t v33 = v27;
      do
      {
        uint64_t v34 = v120;
        v118(v22, v32, v120);
        PipelineProviderWrappers.feedItem.getter();
        v35 = *(void (**)(char *, uint64_t))v116;
        (*(void (**)(char *, uint64_t))v116)(v22, v34);
        uint64_t v36 = v128;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100005D38(0, v36[2] + 1, 1);
          uint64_t v36 = v128;
        }
        unint64_t v38 = v36[2];
        unint64_t v37 = v36[3];
        if (v38 >= v37 >> 1)
        {
          sub_100005D38(v37 > 1, v38 + 1, 1);
          uint64_t v36 = v128;
        }
        void v36[2] = v38 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v113 + 32))((unint64_t)v36+ ((*(unsigned __int8 *)(v113 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80))+ *(void *)(v113 + 72) * v38, v112, v110);
        v128 = v36;
        v32 += (unint64_t)v117;
        --v33;
      }
      while (v33);
      v128 = &_swiftEmptyArrayStorage;
      sub_100005CE8(0, v27, 0);
      do
      {
        uint64_t v39 = v120;
        v118(v22, v31, v120);
        PipelineProviderWrappers.sharableModel.getter();
        v35(v22, v39);
        uint64_t v40 = v128;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100005CE8(0, v40[2] + 1, 1);
          uint64_t v40 = v128;
        }
        unint64_t v42 = v40[2];
        unint64_t v41 = v40[3];
        if (v42 >= v41 >> 1)
        {
          sub_100005CE8(v41 > 1, v42 + 1, 1);
          uint64_t v40 = v128;
        }
        v40[2] = v42 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v115 + 32))((unint64_t)v40+ ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80))+ *(void *)(v115 + 72) * v42, v114, v111);
        v128 = v40;
        v31 += (unint64_t)v117;
        --v27;
      }
      while (v27);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = &_swiftEmptyArrayStorage;
    }
    uint64_t v59 = type metadata accessor for DispatchQueueOrchestrationScheduler();
    uint64_t v60 = DispatchQueueOrchestrationScheduler.__allocating_init(environment:)();
    uint64_t v61 = v98;
    sub_10000A884(v98, (uint64_t)&v128);
    uint64_t v62 = v99;
    sub_10000A884(v99, (uint64_t)&v127);
    swift_retain_n();
    id v63 = v97;
    uint64_t v64 = v101;
    swift_retain();
    uint64_t v65 = v102;
    swift_retain();
    uint64_t v120 = sub_100007EBC((uint64_t)&v128, (uint64_t)v63, (uint64_t)v36, 0, (uint64_t)&v127, v64, v65, v60, v60);
    sub_10000A884(v61, (uint64_t)&v128);
    sub_10000A884(v62, (uint64_t)&v127);
    uint64_t v125 = v59;
    v126 = &protocol witness table for DispatchQueueOrchestrationScheduler;
    uint64_t v124 = v60;
    uint64_t v122 = v59;
    v123 = &protocol witness table for DispatchQueueOrchestrationScheduler;
    uint64_t v121 = v60;
    type metadata accessor for SharableModelGeneratorPipelineManager();
    swift_allocObject();
    swift_retain_n();
    id v66 = v63;
    swift_retain();
    swift_retain();
    uint64_t v67 = SharableModelGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)();
    v118 = (void (*)(char *, unint64_t, uint64_t))type metadata accessor for GeneratorPipelineGenerationOperation();
    sub_10000912C(0, &qword_1000466B0, (uint64_t)&type metadata for SourceProfile, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_100038710;
    swift_retain();
    swift_retain();
    *(void *)(v68 + 32) = static SourceProfile.primary.getter();
    v128 = (void *)v68;
    sub_10000912C(0, &qword_100046160, (uint64_t)&type metadata for SourceProfile, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
    uint64_t v69 = v100;
    Just.init(_:)();
    sub_10000C454(&qword_1000466B8, (void (*)(uint64_t))sub_10000EE70);
    uint64_t v70 = v104;
    Publisher.eraseToAnyPublisher()();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v69, v70);
    dispatch thunk of CountryOracle.currentCountry()();
    sub_100005FEC(0, &qword_1000466C0, (uint64_t (*)(uint64_t))&type metadata accessor for GenerationPhase, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v71 = type metadata accessor for GenerationPhase();
    uint64_t v72 = *(void *)(v71 - 8);
    uint64_t v73 = *(void *)(v72 + 72);
    unint64_t v74 = (*(unsigned __int8 *)(v72 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = xmmword_1000386F0;
    unint64_t v76 = v75 + v74;
    uint64_t v77 = *(void (**)(unint64_t, void, uint64_t))(v72 + 104);
    v77(v76, enum case for GenerationPhase.sharableModels(_:), v71);
    v77(v76 + v73, enum case for GenerationPhase.feedItems(_:), v71);
    uint64_t v78 = v107;
    void *v107 = 3;
    (*(void (**)(void *, void, uint64_t))(v106 + 104))(v78, enum case for DispatchTimeInterval.seconds(_:), v94);
    v119 = (char *)v67;
    v79 = (void *)GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)();
    uint64_t v80 = v96;
    static Logger.daemon.getter();
    v81 = v79;
    uint64_t v82 = Logger.logObject.getter();
    os_log_type_t v83 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = swift_slowAlloc();
      v85 = (void *)swift_slowAlloc();
      v118 = (void (*)(char *, unint64_t, uint64_t))swift_slowAlloc();
      v127 = v118;
      *(_DWORD *)uint64_t v84 = 136315394;
      v128 = v93;
      swift_getMetatypeMetadata();
      uint64_t v86 = String.init<A>(describing:)();
      v128 = (void *)sub_10000E724(v86, v87, (uint64_t *)&v127);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 12) = 2112;
      v128 = v81;
      v88 = v81;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v85 = v81;

      _os_log_impl((void *)&_mh_execute_header, v82, v83, "[%s]: Enqueuing just Summaries background generation: %@", (uint8_t *)v84, 0x16u);
      sub_10000D46C(0, (unint64_t *)&qword_100046190, &qword_100046198);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
      swift_release();
      swift_release();

      (*(void (**)(char *, uint64_t))(v95 + 8))(v96, v108);
    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v80, v108);
    }
    return (uint64_t)v81;
  }
  swift_bridgeObjectRelease();
  static Logger.daemon.getter();
  swift_bridgeObjectRetain();
  uint64_t v43 = Logger.logObject.getter();
  int v44 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v43, (os_log_type_t)v44))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v108);
    return 0;
  }
  LODWORD(v120) = v44;
  uint64_t v45 = swift_slowAlloc();
  v118 = (void (*)(char *, unint64_t, uint64_t))swift_slowAlloc();
  v127 = v118;
  *(_DWORD *)uint64_t v45 = 136315394;
  v128 = (void *)ObjectType;
  swift_getMetatypeMetadata();
  uint64_t v46 = String.init<A>(describing:)();
  v128 = (void *)sub_10000E724(v46, v47, (uint64_t *)&v127);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v45 + 12) = 2080;
  v119 = v9;
  if (v25 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v49 = v108;
  if (!v48)
  {
LABEL_34:
    uint64_t v89 = Array.description.getter();
    unint64_t v91 = v90;
    swift_bridgeObjectRelease();
    v128 = (void *)sub_10000E724(v89, v91, (uint64_t *)&v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v120, "[%s]: Unable to find launch generation plugins to enqueue launch generation. Expected launch generation plugins: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v6 + 8))(v119, v49);
    return 0;
  }
  v116 = (char *)v45;
  v117 = v43;
  uint64_t v95 = v6;
  v128 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100025C18(0, v48 & ~(v48 >> 63), 0);
  if ((v48 & 0x8000000000000000) == 0)
  {
    uint64_t v51 = 0;
    unint64_t v52 = v128;
    do
    {
      if ((v25 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t v53 = dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter();
      uint64_t v55 = v54;
      swift_release();
      v128 = v52;
      unint64_t v57 = v52[2];
      unint64_t v56 = v52[3];
      if (v57 >= v56 >> 1)
      {
        sub_100025C18(v56 > 1, v57 + 1, 1);
        unint64_t v52 = v128;
      }
      ++v51;
      v52[2] = v57 + 1;
      v58 = &v52[2 * v57];
      v58[4] = v53;
      v58[5] = v55;
    }
    while (v48 != v51);
    uint64_t v49 = v108;
    uint64_t v6 = v95;
    uint64_t v43 = v117;
    uint64_t v45 = (uint64_t)v116;
    goto LABEL_34;
  }
  __break(1u);
  return result;
}

void sub_10000912C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

id sub_100009178(void (*a1)(void), uint64_t a2)
{
  v165 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v164 = type metadata accessor for Logger();
  v166 = *(void (***)(char *, uint64_t))(v164 - 8);
  uint64_t v4 = __chkstk_darwin(v164);
  uint64_t v6 = (char *)&v135 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v135 - v7;
  v168 = (int *)type metadata accessor for PipelineProviderWrappers();
  v152 = (char *)*((void *)v168 - 1);
  __chkstk_darwin(v168);
  uint64_t v10 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006088(0);
  v167 = (void (*)(char *, char *, uint64_t))v11;
  uint64_t v170 = *((void *)v11 - 1);
  __chkstk_darwin((void (*)(char *, char *, uint64_t))v11);
  v169 = (char *)&v135 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for GenerationWorkRequest();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  v159 = (char *)&v135 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B480(0, (unint64_t *)&qword_1000466E0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))&type metadata accessor for FeedPopulationListenerSchedulerConfiguration);
  __chkstk_darwin(v16 - 8);
  uint64_t v155 = (uint64_t)&v135 - v17;
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  v153 = v18;
  __chkstk_darwin(v18);
  v154 = (void **)((char *)&v135 - v19);
  uint64_t v161 = type metadata accessor for TransactionRecord();
  uint64_t v158 = *(void *)(v161 - 8);
  uint64_t v20 = __chkstk_darwin(v161);
  uint64_t v22 = (char *)&v135 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  v157 = (char *)&v135 - v24;
  uint64_t v156 = v25;
  __chkstk_darwin(v23);
  v162 = (char *)&v135 - v26;
  uint64_t v27 = *(void *)&v2[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_lock];
  dispatch thunk of UnfairLock.lock()();
  sub_10000C4D8();
  sub_1000051A8();
  if (v28)
  {
    static Logger.daemon.getter();
    os_log_type_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v160 = a2;
      uint64_t v180 = v32;
      *(_DWORD *)uint64_t v31 = 136315650;
      *(void *)&long long aBlock = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v33 = String.init<A>(describing:)();
      *(void *)&long long aBlock = sub_10000E724(v33, v34, &v180);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      *(void *)&long long aBlock = sub_10000E724(0xD00000000000002FLL, 0x8000000100039C20, &v180);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v31 + 22) = 2080;
      *(void *)&long long aBlock = sub_10000E724(0xD000000000000032, 0x8000000100039B70, &v180);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%s] %s %s default is set - skipping work", (uint8_t *)v31, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v166[1](v6, v164);
    v165(0);
    id v35 = [self progressWithTotalUnitCount:0];
LABEL_22:
    id v62 = v35;
    goto LABEL_23;
  }
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (!v173)
  {
    sub_10001727C((uint64_t)&aBlock);
LABEL_19:
    uint64_t v56 = v164;
    static Logger.daemon.getter();
    unint64_t v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = swift_slowAlloc();
      uint64_t v180 = swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 136315394;
      uint64_t v160 = a2;
      *(void *)&long long aBlock = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v60 = String.init<A>(describing:)();
      *(void *)&long long aBlock = sub_10000E724(v60, v61, &v180);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      *(void *)&long long aBlock = sub_10000E724(0xD00000000000002FLL, 0x8000000100039C20, &v180);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "[%s] %s no readyHealthExperienceStore or feedPopulationManager - cannot start", (uint8_t *)v59, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v166[1](v8, v56);
    v165(0);
    id v35 = [self progressWithTotalUnitCount:0];
    goto LABEL_22;
  }
  v150 = v22;
  uint64_t v148 = v14;
  uint64_t v149 = v13;
  sub_10000A908(&aBlock, (uint64_t)&v180);
  uint64_t v36 = OBJC_IVAR____TtC10healthappd23HealthPluginHostService_feedPopulationManagerOracle;
  swift_retain();
  dispatch thunk of UnfairLock.lock()();
  uint64_t v37 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  swift_release();
  v151 = (char *)v37;
  if (!v37)
  {
    sub_10000E7F8((uint64_t)&v180);
    goto LABEL_19;
  }
  uint64_t v38 = *(void *)(*(void *)&v2[v36] + 16);
  if (!v38)
  {
    sub_10000E7F8((uint64_t)&v180);
    swift_release();
    goto LABEL_19;
  }
  uint64_t v160 = a2;
  uint64_t v145 = v27;
  uint64_t v39 = *(void *)&v2[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle];
  uint64_t v40 = *(void **)(v39 + 16);
  uint64_t v147 = v38;
  swift_retain();
  id v41 = v40;
  uint64_t v42 = TransactionRecord.init(name:)();
  __chkstk_darwin(v42);
  swift_retain();
  TransactionManagedCache.fetchCachedOrCreate(for:using:)();
  swift_release();
  v144 = v2;
  uint64_t v146 = *(void *)&v2[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_transactionBuilderManager];
  uint64_t v43 = *(void *)(v39 + 24);
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  uint64_t v164 = v43;
  swift_retain();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v44 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  sub_10000D774(v44);
  swift_bridgeObjectRelease();
  type metadata accessor for BundleFeedItemGenerationPluginInfo();
  sub_10000C454(&qword_100046170, (void (*)(uint64_t))&type metadata accessor for BundleFeedItemGenerationPluginInfo);
  uint64_t v45 = (char *)Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  sub_10000A884((uint64_t)&v180, (uint64_t)&aBlock);
  int64_t v46 = *((void *)v45 + 2);
  if (v46)
  {
    id v143 = v41;
    *(void *)&long long v176 = &_swiftEmptyArrayStorage;
    sub_100005D38(0, v46, 0);
    unint64_t v47 = v152 + 16;
    v166 = (void (**)(char *, uint64_t))*((void *)v152 + 2);
    unint64_t v48 = (v152[80] + 32) & ~(unint64_t)v152[80];
    v152 = v45;
    uint64_t v49 = &v45[v48];
    uint64_t v50 = *((void *)v47 + 7);
    uint64_t v51 = v47 - 8;
    do
    {
      unint64_t v52 = v168;
      ((void (*)(char *, char *, int *))v166)(v10, v49, v168);
      PipelineProviderWrappers.feedItem.getter();
      (*(void (**)(char *, int *))v51)(v10, v52);
      uint64_t v53 = v176;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005D38(0, *(void *)(v53 + 16) + 1, 1);
        uint64_t v53 = v176;
      }
      unint64_t v55 = *(void *)(v53 + 16);
      unint64_t v54 = *(void *)(v53 + 24);
      if (v55 >= v54 >> 1)
      {
        sub_100005D38(v54 > 1, v55 + 1, 1);
        uint64_t v53 = v176;
      }
      *(void *)(v53 + 16) = v55 + 1;
      (*(void (**)(unint64_t, char *, void))(v170 + 32))(v53+ ((*(unsigned __int8 *)(v170 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v170 + 80))+ *(void *)(v170 + 72) * v55, v169, v167);
      *(void *)&long long v176 = v53;
      v49 += v50;
      --v46;
    }
    while (v46);
    swift_bridgeObjectRelease();
    id v41 = v143;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  type metadata accessor for FeedItemGeneratorPipelineManager();
  sub_10000A884((uint64_t)v179, (uint64_t)&v176);
  v166 = (void (**)(char *, uint64_t))v41;
  uint64_t v64 = v164;
  swift_retain();
  uint64_t v65 = v146;
  swift_retain();
  uint64_t v66 = v64;
  uint64_t v67 = v65;
  uint64_t v68 = GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  uint64_t v69 = v151;
  swift_retain();
  uint64_t v70 = v68;
  uint64_t v170 = v68;
  *(void *)&long long aBlock = GeneratorPipelineManager.generationState.getter();
  sub_10000F640(0, &qword_1000466F8, (uint64_t (*)(uint64_t))sub_100028450, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for CurrentValueSubject);
  sub_10000EF50(&qword_100046710, &qword_1000466F8, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for CurrentValueSubject);
  uint64_t v71 = Publisher.eraseToAnyPublisher()();
  swift_release();
  uint64_t v72 = v144;
  uint64_t v73 = v153;
  unint64_t v74 = v154;
  id v75 = *(id *)&v144[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_schedulerDispatchQueue];
  static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
  static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
  unint64_t v76 = (char *)v74 + v73[11];
  uint64_t v77 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 1, 1, v77);
  *unint64_t v74 = v75;
  sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  sub_10000ED30();
  uint64_t v78 = v155;
  static FeedPopulationListenerSchedulerConfiguration.realtime(queue:)();
  id v79 = objc_allocWithZone((Class)type metadata accessor for SummaryTabForegroundFeedPopulationOperation());
  uint64_t v80 = (char *)sub_10000E1A4(v69, v71, v74, v78);
  v152 = v80;
  swift_release();
  swift_release();
  sub_10000A884((uint64_t)&v180, (uint64_t)&aBlock);
  uint64_t v177 = type metadata accessor for ProfileDashboardsFeedPopulationListener();
  v178 = &protocol witness table for ProfileDashboardsFeedPopulationListener;
  *(void *)&long long v176 = v147;
  id v81 = objc_allocWithZone((Class)type metadata accessor for ForegroundFeedPopulationListeningOperation());
  swift_retain();
  uint64_t v82 = (int *)ForegroundFeedPopulationListeningOperation.init(healthExperienceStore:listener:)();
  v153 = v82;
  os_log_type_t v83 = v166;
  uint64_t v84 = v66;
  uint64_t v85 = v66;
  uint64_t v86 = v67;
  unint64_t v87 = v72;
  v88 = (void *)sub_100007FEC(v166, (uint64_t)&v180, v85, (uint64_t)v179, v67);
  sub_10000A884((uint64_t)&v180, (uint64_t)&aBlock);
  sub_10000A884((uint64_t)v179, (uint64_t)&v176);
  uint64_t v89 = (int *)swift_allocObject();
  *((void *)v89 + 2) = v72;
  *((void *)v89 + 3) = v83;
  sub_10000A908(&aBlock, (uint64_t)(v89 + 8));
  *((void *)v89 + 9) = v84;
  *((void *)v89 + 10) = v70;
  sub_10000A908(&v176, (uint64_t)(v89 + 22));
  *((void *)v89 + 16) = v86;
  *((void *)v89 + 17) = v88;
  *((void *)v89 + 18) = v80;
  *((void *)v89 + 19) = v82;
  v169 = (char *)swift_allocObject();
  *((void *)v169 + 2) = ObjectType;
  uint64_t v90 = v158;
  v137 = *(void (**)(char *, char *, uint64_t))(v158 + 16);
  unint64_t v91 = v157;
  uint64_t v92 = v161;
  v137(v157, v162, v161);
  uint64_t v93 = *(unsigned __int8 *)(v90 + 80);
  uint64_t v139 = ~v93;
  uint64_t v141 = v93;
  v168 = (int *)(v93 | 7);
  uint64_t v138 = v156 + 7;
  uint64_t v94 = (v93 + 24) & ~v93;
  uint64_t v155 = v94;
  unint64_t v95 = (v156 + 7 + v94) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v156 = v95 + 16;
  unint64_t v96 = v95;
  v154 = (void **)v95;
  id v97 = (char *)swift_allocObject();
  *((void *)v97 + 2) = v87;
  v167 = *(void (**)(char *, char *, uint64_t))(v90 + 32);
  v167(&v97[v94], v91, v92);
  uint64_t v98 = &v97[v96];
  uint64_t v99 = v165;
  uint64_t v100 = v160;
  *(void *)uint64_t v98 = v165;
  *((void *)v98 + 1) = v100;
  id v143 = v88;
  id v142 = v88;
  uint64_t v101 = v87;
  v144 = v166;
  swift_retain();
  swift_retain();
  v136 = v101;
  swift_retain();
  v166 = v152;
  v140 = v153;
  swift_retain();
  uint64_t v102 = static GenerationPhase.allCases.getter();
  sub_1000060BC(v102);
  swift_bridgeObjectRelease();
  swift_retain();
  swift_retain();
  swift_retain();
  v152 = v97;
  uint64_t v103 = (uint64_t)v159;
  uint64_t v104 = v137;
  v153 = v89;
  GenerationWorkRequest.init(environment:pluginIdentifierSetToRun:generationPhases:commitUrgentTransaction:makeGenerationWorkBlock:completionBlock:notStartedCancellationBlock:)();
  v105 = v157;
  uint64_t v106 = v92;
  v104(v157, v162, v92);
  uint64_t v107 = swift_allocObject();
  uint64_t v108 = v136;
  *(void *)(v107 + 16) = v136;
  uint64_t v146 = v90 + 32;
  v167((char *)(v107 + v155), v105, v106);
  uint64_t v109 = (char *)v154 + v107;
  *(void *)uint64_t v109 = v99;
  *((void *)v109 + 1) = v100;
  uint64_t v110 = v108;
  swift_retain();
  v157 = v110;
  id v62 = sub_100006F08(v103, (void (*)(void))sub_100028618, v107);
  swift_release();
  id v111 = [v62 cancellationHandler];
  if (v111)
  {
    id v112 = v111;
    uint64_t v113 = swift_allocObject();
    *(void *)(v113 + 16) = v112;
    v114 = sub_100029998;
  }
  else
  {
    v114 = 0;
    uint64_t v113 = 0;
  }
  uint64_t v115 = v150;
  uint64_t v155 = (uint64_t)v114;
  uint64_t v156 = v113;
  sub_10000A8E8((uint64_t)v114);
  sub_10000A8F8((uint64_t)v114);
  v136 = *(char **)((char *)v166 + qword_1000469F8);
  v154 = (void **)swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v116 = v161;
  v104(v115, v162, v161);
  uint64_t v117 = (v141 + 48) & v139;
  unint64_t v118 = (v138 + v117) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v119 = (v118 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v120 = (v119 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v121 = (v120 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v122 = (v121 + 15) & 0xFFFFFFFFFFFFFFF8;
  v123 = (void *)swift_allocObject();
  uint64_t v124 = v155;
  v123[2] = v154;
  v123[3] = v124;
  uint64_t v125 = v157;
  v123[4] = v156;
  v123[5] = v125;
  v167((char *)v123 + v117, v150, v116);
  *(void *)((char *)v123 + v118) = v136;
  v126 = (void *)((char *)v123 + v119);
  uint64_t v127 = v160;
  void *v126 = v165;
  v126[1] = v127;
  *(void *)((char *)v123 + v120) = v143;
  v128 = v166;
  *(void *)((char *)v123 + v121) = v166;
  v129 = v140;
  *(void *)((char *)v123 + v122) = v140;
  *(void *)((char *)v123 + ((v122 + 15) & 0xFFFFFFFFFFFFFFF8)) = ObjectType;
  v174 = sub_1000287B4;
  v175 = v123;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  v172 = sub_100010A84;
  v173 = &unk_1000423A8;
  v130 = _Block_copy(&aBlock);
  v167 = (void (*)(char *, char *, uint64_t))v175;
  swift_retain();
  v131 = v157;
  v132 = v128;
  v168 = v129;
  swift_retain();
  id v133 = v142;
  uint64_t v134 = v155;
  sub_10000A8E8(v155);
  swift_retain();
  swift_retain();
  sub_10000A8E8((uint64_t)sub_1000287B4);
  swift_release();
  [v62 setCancellationHandler:v130];
  _Block_release(v130);
  swift_release();
  sub_10000A8F8(v134);
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v159, v149);
  sub_10000E7F8((uint64_t)v179);
  (*(void (**)(char *, uint64_t))(v158 + 8))(v162, v161);
  sub_10000E7F8((uint64_t)&v180);
  swift_release();
  swift_release();
LABEL_23:
  dispatch thunk of UnfairLock.unlock()();
  return v62;
}

uint64_t sub_10000A884(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A8E8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000A8F8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000A908(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10000A920(uint64_t a1, void **a2)
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v94 = v4 - 8;
  uint64_t v92 = v5;
  uint64_t v91 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v90 = (uint64_t)&v61 - v6;
  sub_10000B55C(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B480(0, &qword_100046738, (uint64_t (*)(uint64_t, uint64_t, unint64_t))&type metadata accessor for Publishers.TimeGroupingStrategy);
  uint64_t v71 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (void **)((char *)&v61 - v12);
  sub_10000F2B0();
  uint64_t v73 = v14;
  uint64_t v78 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v61 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B590(0, &qword_100046758, (uint64_t (*)(uint64_t))sub_10000F2B0, sub_10000F380, (uint64_t (*)(uint64_t, void *))&type metadata accessor for Publishers.CollectByTime);
  uint64_t v74 = v16;
  uint64_t v75 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v69 = (char *)&v61 - v17;
  sub_10000F200();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v76 = v18;
  uint64_t v77 = v19;
  __chkstk_darwin(v18);
  uint64_t v70 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F5AC();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v82 = v21;
  uint64_t v83 = v22;
  __chkstk_darwin(v21);
  uint64_t v72 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F518();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v84 = v24;
  uint64_t v85 = v25;
  __chkstk_darwin(v24);
  id v79 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F450();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v88 = v27;
  uint64_t v89 = v28;
  __chkstk_darwin(v27);
  id v81 = (char *)&v61 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B590(0, &qword_1000467A8, (uint64_t (*)(uint64_t))sub_10000F450, sub_10000F4E4, (uint64_t (*)(uint64_t, void *))&type metadata accessor for Publishers.Timeout);
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v86 = v30;
  uint64_t v87 = v31;
  __chkstk_darwin(v30);
  uint64_t v80 = (char *)&v61 - v32;
  uint64_t v95 = a1;
  sub_10000F640(0, &qword_100046748, (uint64_t (*)(uint64_t))sub_100028450, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
  sub_10000EF50(&qword_100046750, &qword_100046748, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
  Publisher.map<A>(_:)();
  sub_10000ECB0();
  unint64_t v34 = (char *)v13 + *(int *)(v33 + 48);
  id v62 = a2;
  id v35 = *a2;
  *uint64_t v13 = *a2;
  uint64_t v36 = (char *)a2 + *(int *)(v94 + 44);
  uint64_t v37 = type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v34, v36, v37);
  uint64_t v38 = v71;
  (*(void (**)(void **, void, uint64_t))(v11 + 104))(v13, enum case for Publishers.TimeGroupingStrategy.byTime<A>(_:), v71);
  uint64_t v66 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  uint64_t v39 = *(void *)(v66 - 8);
  uint64_t v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  uint64_t v68 = v39 + 56;
  v67(v9, 1, 1, v66);
  uint64_t v65 = sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  sub_10000F380();
  unint64_t v63 = sub_10000ED30();
  id v40 = v35;
  id v41 = v69;
  uint64_t v42 = v73;
  uint64_t v43 = v61;
  Publisher.collect<A>(_:options:)();
  uint64_t v64 = sub_10000B55C;
  sub_10000B4FC((uint64_t)v9, (uint64_t (*)(void))sub_10000B55C);
  (*(void (**)(void **, uint64_t))(v11 + 8))(v13, v38);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v43, v42);
  sub_10000F3B4();
  uint64_t v44 = v70;
  uint64_t v45 = v74;
  Publisher.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v41, v45);
  sub_10000C454(&qword_100046780, (void (*)(uint64_t))sub_10000F200);
  int64_t v46 = v72;
  uint64_t v47 = v76;
  Publisher.first(where:)();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v44, v47);
  uint64_t v48 = v90;
  sub_10000F808((uint64_t)v62, v90);
  unint64_t v49 = (*(unsigned __int8 *)(v92 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v92 + 80);
  unint64_t v50 = (v91 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v51 = swift_allocObject();
  sub_10000F888(v48, v51 + v49);
  *(void *)(v51 + v50) = v93;
  sub_10000C454(&qword_100046790, (void (*)(uint64_t))sub_10000F5AC);
  uint64_t v52 = v82;
  uint64_t v53 = v79;
  Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v46, v52);
  sub_10000C454(&qword_1000467A0, (void (*)(uint64_t))sub_10000F518);
  unint64_t v54 = v81;
  uint64_t v55 = v84;
  Publisher.ignoreOutput()();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v53, v55);
  v67(v9, 1, 1, v66);
  sub_10000F4E4();
  uint64_t v56 = v80;
  uint64_t v57 = v88;
  Publisher.timeout<A>(_:scheduler:options:customError:)();
  sub_10000B4FC((uint64_t)v9, (uint64_t (*)(void))v64);
  (*(void (**)(char *, uint64_t))(v89 + 8))(v54, v57);
  sub_10000F0A8();
  uint64_t v58 = v86;
  uint64_t v59 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v56, v58);
  return v59;
}

void sub_10000B480(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_10000C49C(255, (unint64_t *)&qword_100045F40);
    unint64_t v7 = sub_10000ED30();
    unint64_t v8 = a3(a1, v6, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10000B4FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10000B55C(uint64_t a1)
{
}

void sub_10000B590(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, void *))
{
  if (!*a2)
  {
    v11[0] = a3(255);
    v11[1] = sub_10000C49C(255, (unint64_t *)&qword_100045F40);
    v11[2] = a4();
    v11[3] = sub_10000ED30();
    unint64_t v9 = a5(a1, v11);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_10000B640(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, char *a10)
{
  id v98 = a8;
  uint64_t v95 = a7;
  uint64_t v93 = a6;
  uint64_t v96 = a5;
  uint64_t v94 = a4;
  uint64_t v101 = a3;
  id v102 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v88 = type metadata accessor for Logger();
  uint64_t v87 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  id v97 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for PipelineProviderWrappers();
  uint64_t v12 = *(void *)(v107 - 8);
  __chkstk_darwin(v107);
  isa = (objc_class *)((char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100006054(0);
  v105 = v14;
  uint64_t v86 = *((void *)v14 - 1);
  __chkstk_darwin(v14);
  uint64_t v108 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = type metadata accessor for DispatchTimeInterval();
  uint64_t v90 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v91 = (uint64_t *)((char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000EB64();
  __chkstk_darwin(v17 - 8);
  uint64_t v89 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F144();
  uint64_t v24 = v23;
  uint64_t v104 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v27 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  sub_10000D774(v27);
  swift_bridgeObjectRelease();
  type metadata accessor for BundleFeedItemGenerationPluginInfo();
  sub_10000C454(&qword_100046170, (void (*)(uint64_t))&type metadata accessor for BundleFeedItemGenerationPluginInfo);
  uint64_t v28 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  id v29 = objc_allocWithZone((Class)HKProfileStore);
  id v30 = [v29 initWithHealthStore:v102];
  HKProfileStore.profileIdentifiersPublisher.getter();
  sub_10000C454(&qword_100046168, (void (*)(uint64_t))&type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher);
  Publisher<>.mapToSourceProfiles(includeAgnostic:)();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  sub_10000C454(&qword_100046178, (void (*)(uint64_t))sub_10000F144);
  uint64_t v100 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v26, v24);

  uint64_t v31 = v28;
  sub_10000A884((uint64_t)v101, (uint64_t)&v112);
  int64_t v32 = *(void *)(v28 + 16);
  id v99 = v10;
  if (v32)
  {
    id v111 = &_swiftEmptyArrayStorage;
    sub_100005CE8(0, v32, 0);
    uint64_t v34 = *(void *)(v12 + 16);
    uint64_t v33 = v12 + 16;
    uint64_t v104 = v34;
    unint64_t v35 = (*(unsigned __int8 *)(v33 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 64);
    uint64_t v84 = v31;
    unint64_t v36 = v31 + v35;
    uint64_t v103 = *(void *)(v33 + 56);
    uint64_t v37 = (void (**)(objc_class *, uint64_t))(v33 - 8);
    uint64_t v38 = v86;
    do
    {
      uint64_t v39 = isa;
      uint64_t v40 = v107;
      uint64_t v41 = v33;
      ((void (*)(objc_class *, unint64_t, uint64_t))v104)(isa, v36, v107);
      PipelineProviderWrappers.sharableModel.getter();
      (*v37)(v39, v40);
      uint64_t v42 = v111;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005CE8(0, v42[2] + 1, 1);
        uint64_t v42 = v111;
      }
      unint64_t v44 = v42[2];
      unint64_t v43 = v42[3];
      if (v44 >= v43 >> 1)
      {
        sub_100005CE8(v43 > 1, v44 + 1, 1);
        uint64_t v42 = v111;
      }
      v42[2] = v44 + 1;
      (*(void (**)(unint64_t, char *, void *))(v38 + 32))((unint64_t)v42+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v44, v108, v105);
      id v111 = v42;
      v36 += v103;
      --v32;
      uint64_t v33 = v41;
    }
    while (v32);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for SharableModelGeneratorPipelineManager();
  sub_10000A884(v93, (uint64_t)&v111);
  swift_retain();
  swift_retain();
  id v45 = v102;
  uint64_t v46 = GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  type metadata accessor for GeneratorPipelineGenerationOperation();
  swift_retain();
  swift_retain();
  swift_retain();
  dispatch thunk of CountryOracle.currentCountry()();
  static GenerationPhase.allCases.getter();
  uint64_t v47 = v91;
  *uint64_t v91 = 150;
  (*(void (**)(void *, void, uint64_t))(v90 + 104))(v47, enum case for DispatchTimeInterval.seconds(_:), v92);
  uint64_t v48 = (void *)GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)();
  sub_10000C49C(0, &qword_1000462C0);
  v49._object = (void *)0x8000000100039BF0;
  v49._countAndFlagsBits = 0xD00000000000002BLL;
  v113.value = 0;
  v113.is_nil = 1;
  v50.super.isa = NSOperationQueue.init(name:maxConcurrentOperationCount:)(v49, v113).super.isa;
  [(objc_class *)v50.super.isa setQualityOfService:25];
  unint64_t v51 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t v110 = (unint64_t)&_swiftEmptyArrayStorage;
  id v52 = v98;
  if (v98)
  {
    id v53 = v98;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v110 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    unint64_t v51 = v110;
  }
  if (v51 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v54 = result;
    if (!result) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v54 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    if (!v54) {
      goto LABEL_21;
    }
  }
  if (v54 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v56 = 0;
  unint64_t v57 = v51 & 0xC000000000000001;
  uint64_t v58 = (id *)v51;
  do
  {
    if (v57) {
      id v59 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v59 = *(id *)(v51 + 8 * v56 + 32);
    }
    uint64_t v60 = v59;
    ++v56;
    objc_msgSend(v48, "addDependency:", v59, v84);

    unint64_t v51 = (unint64_t)v58;
  }
  while (v54 != v56);
LABEL_21:
  uint64_t v108 = a10;
  unint64_t v61 = a9;
  swift_bridgeObjectRelease_n();
  id v62 = v97;
  static Logger.daemon.getter();
  id v63 = v99;
  uint64_t v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.default.getter();
  int v66 = v65;
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v67 = swift_slowAlloc();
    LODWORD(v103) = v66;
    uint64_t v68 = v67;
    uint64_t v104 = swift_slowAlloc();
    uint64_t v109 = v104;
    *(_DWORD *)uint64_t v68 = 136446722;
    v105 = a9;
    uint64_t v112 = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v69 = String.init<A>(describing:)();
    isa = v50.super.isa;
    uint64_t v112 = sub_10000E724(v69, v70, &v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2082;
    swift_beginAccess();
    sub_10000C49C(0, &qword_1000466D8);
    uint64_t v107 = v46;
    swift_bridgeObjectRetain();
    uint64_t v71 = Array.description.getter();
    unint64_t v73 = v72;
    swift_bridgeObjectRelease();
    uint64_t v112 = sub_10000E724(v71, v73, &v109);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 22) = 2082;
    id v74 = v63;
    id v75 = [v74 description];
    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v78 = v77;

    uint64_t v79 = v76;
    v50.super.isa = isa;
    uint64_t v112 = sub_10000E724(v79, v78, &v109);
    unint64_t v61 = v105;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    id v52 = v98;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v64, (os_log_type_t)v103, "[%{public}s]: Enqueuing prerequisite foreground work before interactive generation: %{public}s; %{public}s",
      (uint8_t *)v68,
      0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v87 + 8))(v97, v88);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v87 + 8))(v62, v88);
  }
  uint64_t v80 = v108;
  if (v52)
  {
    id v81 = v52;
    [v61 addDependency:v81];
    [v80 addDependency:v81];
  }
  swift_beginAccess();
  sub_10000C49C(0, &qword_1000466D8);
  swift_bridgeObjectRetain();
  Class v82 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [(objc_class *)v50.super.isa addOperations:v82 waitUntilFinished:0];

  [(objc_class *)v50.super.isa addOperation:v61];
  [(objc_class *)v50.super.isa addOperation:v80];
  sub_1000057EC(v101, v101[3]);
  swift_retain();
  uint64_t v83 = (void *)dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
  dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithHighlightsFeedPresentationAnalytics(in:)();
  swift_release();

  swift_retain();
  dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithDemographicAnalytics()();
  swift_release();
  swift_retain();
  dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithImproveHealthActivityAnalytics()();
  swift_release();

  swift_release();
  swift_release();
  sub_10000C454(&qword_100046180, (void (*)(uint64_t))&type metadata accessor for GeneratorPipelineGenerationOperation);
  swift_bridgeObjectRelease();
  return (uint64_t)v48;
}

uint64_t sub_10000C454(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C49C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000C4D8()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v126 = *(void *)(v2 - 8);
  uint64_t v127 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v124 = (char *)v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v116 = (char *)v107 - v6;
  __chkstk_darwin(v5);
  unint64_t v121 = (void (*)(char *, uint64_t))((char *)v107 - v7);
  sub_100005FEC(0, &qword_1000460C8, (uint64_t (*)(uint64_t))sub_10000FBEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for UserDefault);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v107 - v11;
  sub_10000FBEC(0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v122 = (uint64_t)v107 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v123 = (char *)v107 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v107 - v18;
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v117 = (char *)v107 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v114 = (char *)v107 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)v107 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  id v111 = (char *)v107 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v115 = (char *)v107 - v32;
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)v107 - v33;
  Date.init()();
  unint64_t v35 = &v1[OBJC_IVAR____TtC10healthappd23HealthPluginHostService__appFirstLaunchDate];
  swift_beginAccess();
  unint64_t v36 = *(void (**)(char *, NSObject *, uint64_t))(v10 + 16);
  os_log_t v112 = v35;
  v36(v12, v35, v9);
  UserDefault.wrappedValue.getter();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v125 = v9;
  v37(v12, v9);
  uint64_t v128 = v21;
  uint64_t v129 = v20;
  int v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20);
  unint64_t v120 = v34;
  if (v38 == 1)
  {
    sub_10000B4FC((uint64_t)v19, (uint64_t (*)(void))sub_10000FBEC);
    uint64_t v40 = v128;
    uint64_t v39 = v129;
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v128 + 16);
    unint64_t v42 = (v128 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v41(v28, v34, v129);
    static Logger.general.getter();
    uint64_t v115 = v28;
    id v111 = (char *)v41;
    v41(v114, v28, v39);
    unint64_t v43 = v1;
    unint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.default.getter();
    int v46 = v45;
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = (void *)swift_slowAlloc();
      v107[1] = v48;
      uint64_t v109 = swift_slowAlloc();
      v130 = (char *)v109;
      *(_DWORD *)uint64_t v47 = 136446722;
      int v108 = v46;
      uint64_t v131 = ObjectType;
      swift_getMetatypeMetadata();
      unint64_t v118 = v42;
      uint64_t v49 = String.init<A>(describing:)();
      uint64_t v131 = sub_10000E724(v49, v50, (uint64_t *)&v130);
      Swift::Int_optional v113 = v1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2112;
      os_log_t v51 = (os_log_t)v114;
      Class isa = Date._bridgeToObjectiveC()().super.isa;
      uint64_t v131 = (uint64_t)isa;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v48 = isa;
      id v53 = *(void (**)(char *, uint64_t))(v40 + 8);
      uint64_t v110 = (v40 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      unint64_t v121 = v53;
      v53((char *)v51, v129);
      *(_WORD *)(v47 + 22) = 2082;
      v114 = (char *)v44;
      uint64_t v54 = v43;
      id v55 = [v54 description];
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v58 = v57;

      uint64_t v34 = v120;
      uint64_t v131 = sub_10000E724(v56, v58, (uint64_t *)&v130);
      uint64_t v1 = v113;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      unint64_t v42 = v118;
      swift_bridgeObjectRelease();
      os_log_t v59 = (os_log_t)v114;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v114, (os_log_type_t)v108, "[%{public}s]: Setting HealthApp first launch date: %@; %{public}s",
        (uint8_t *)v47,
        0x20u);
      sub_10000D46C(0, (unint64_t *)&qword_100046190, &qword_100046198);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v39 = v129;
      swift_slowDealloc();
    }
    else
    {
      id v81 = *(void (**)(char *, uint64_t))(v40 + 8);
      uint64_t v110 = (v40 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      unint64_t v121 = v81;
      v81(v114, v39);
    }
    Class v82 = v116;
    uint64_t v116 = *(char **)(v126 + 8);
    ((void (*)(char *, uint64_t))v116)(v82, v127);
    uint64_t v83 = (uint64_t)v123;
    uint64_t v80 = v124;
    uint64_t v84 = v115;
    ((void (*)(char *, char *, uint64_t))v111)(v123, v115, v39);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56))(v83, 0, 1, v39);
    sub_10000FB24(v83, v122);
    swift_beginAccess();
    UserDefault.wrappedValue.setter();
    swift_endAccess();
    sub_10000B4FC(v83, (uint64_t (*)(void))sub_10000FBEC);
    v121(v84, v39);
    goto LABEL_8;
  }
  uint64_t v40 = v128;
  uint64_t v60 = v129;
  unint64_t v61 = v115;
  (*(void (**)(char *, char *, uint64_t))(v128 + 32))(v115, v19, v129);
  static Logger.general.getter();
  unint64_t v42 = (v40 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  id v62 = v111;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v111, v61, v60);
  Swift::Int_optional v113 = v1;
  id v63 = v1;
  uint64_t v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.default.getter();
  int v66 = v65;
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v67 = swift_slowAlloc();
    unint64_t v118 = (v40 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v68 = v67;
    uint64_t v69 = (void *)swift_slowAlloc();
    uint64_t v116 = (char *)swift_slowAlloc();
    v130 = v116;
    *(_DWORD *)uint64_t v68 = 136446722;
    uint64_t v131 = ObjectType;
    swift_getMetatypeMetadata();
    os_log_t v112 = v64;
    LODWORD(v114) = v66;
    uint64_t v70 = String.init<A>(describing:)();
    uint64_t v131 = sub_10000E724(v70, v71, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2112;
    Class v72 = Date._bridgeToObjectiveC()().super.isa;
    uint64_t v131 = (uint64_t)v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v69 = v72;
    unint64_t v73 = *(void (**)(char *, uint64_t))(v128 + 8);
    v73(v62, v129);
    *(_WORD *)(v68 + 22) = 2082;
    id v74 = v63;
    id v75 = [v74 description];
    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v78 = v77;

    uint64_t v131 = sub_10000E724(v76, v78, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v79 = v112;
    _os_log_impl((void *)&_mh_execute_header, v112, (os_log_type_t)v114, "[%{public}s]: HealthApp first launch date already set: %@; %{public}s",
      (uint8_t *)v68,
      0x20u);
    sub_10000D46C(0, (unint64_t *)&qword_100046190, &qword_100046198);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    unint64_t v42 = v118;
    swift_slowDealloc();

    uint64_t v39 = v129;
    uint64_t v116 = *(char **)(v126 + 8);
    ((void (*)(void, uint64_t))v116)(v121, v127);
    unint64_t v121 = v73;
    v73(v115, v39);
    uint64_t v40 = v128;
    uint64_t v80 = v124;
    uint64_t v34 = v120;
    uint64_t v1 = v113;
LABEL_8:
    uint64_t v85 = v117;
    goto LABEL_10;
  }

  uint64_t v86 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v39 = v129;
  v86(v62, v129);
  uint64_t v116 = *(char **)(v126 + 8);
  ((void (*)(void, uint64_t))v116)(v121, v127);
  unint64_t v121 = v86;
  v86(v115, v39);
  uint64_t v34 = v120;
  uint64_t v1 = v113;
  uint64_t v85 = v117;
  uint64_t v80 = v124;
LABEL_10:
  static Logger.general.getter();
  uint64_t v117 = *(char **)(v40 + 16);
  ((void (*)(char *, char *, uint64_t))v117)(v85, v34, v39);
  uint64_t v87 = v1;
  uint64_t v88 = Logger.logObject.getter();
  os_log_type_t v89 = static os_log_type_t.default.getter();
  int v90 = v89;
  if (os_log_type_enabled(v88, v89))
  {
    uint64_t v91 = swift_slowAlloc();
    uint64_t v92 = (char *)swift_slowAlloc();
    Swift::Int_optional v113 = v92;
    uint64_t v115 = (char *)swift_slowAlloc();
    v130 = v115;
    *(_DWORD *)uint64_t v91 = 136446722;
    v114 = (char *)v88;
    uint64_t v131 = ObjectType;
    swift_getMetatypeMetadata();
    unint64_t v118 = v42;
    uint64_t v93 = String.init<A>(describing:)();
    LODWORD(ObjectType) = v90;
    uint64_t v131 = sub_10000E724(v93, v94, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v91 + 12) = 2112;
    Class v95 = Date._bridgeToObjectiveC()().super.isa;
    uint64_t v131 = (uint64_t)v95;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(void *)uint64_t v92 = v95;
    uint64_t v96 = (uint64_t (*)(char *, uint64_t))v121;
    v121(v85, v39);
    *(_WORD *)(v91 + 22) = 2082;
    id v97 = v87;
    id v98 = [v97 description];
    uint64_t v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v101 = v100;

    uint64_t v39 = v129;
    uint64_t v131 = sub_10000E724(v99, v101, (uint64_t *)&v130);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    os_log_t v102 = (os_log_t)v114;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v114, (os_log_type_t)ObjectType, "[%{public}s]: Updating HealthApp last opened date: %@; %{public}s",
      (uint8_t *)v91,
      0x20u);
    sub_10000D46C(0, (unint64_t *)&qword_100046190, &qword_100046198);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v34 = v120;
    swift_slowDealloc();

    uint64_t v103 = v124;
  }
  else
  {
    uint64_t v104 = v80;
    uint64_t v96 = (uint64_t (*)(char *, uint64_t))v121;
    v121(v85, v39);

    uint64_t v103 = v104;
  }
  ((void (*)(char *, uint64_t))v116)(v103, v127);
  uint64_t v105 = (uint64_t)v123;
  ((void (*)(char *, char *, uint64_t))v117)(v123, v34, v39);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v128 + 56))(v105, 0, 1, v39);
  sub_10000FB24(v105, v122);
  swift_beginAccess();
  UserDefault.wrappedValue.setter();
  swift_endAccess();
  sub_10000B4FC(v105, (uint64_t (*)(void))sub_10000FBEC);
  return v96(v34, v39);
}

void sub_10000D46C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_10000C49C(255, a3);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10000D52C()
{
  _StringGuts.grow(_:)(62);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getObjectType();
  sub_10000D738();
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 32;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._object = (void *)0x8000000100039A80;
  v4._countAndFlagsBits = 0xD000000000000024;
  String.append(_:)(v4);
  id v5 = *(id *)(v0 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_healthExperienceStoreOracle);
  id v6 = [v5 description];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x6E696F676E6F202CLL;
  v11._object = (void *)0xEF203A6B726F5767;
  String.append(_:)(v11);
  type metadata accessor for CancellableProgressList();
  sub_10000C454(&qword_100046658, (void (*)(uint64_t))&type metadata accessor for CancellableProgressList);
  swift_retain();
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_release();
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 62;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  return 0;
}

unint64_t sub_10000D738()
{
  unint64_t result = qword_100046650;
  if (!qword_100046650)
  {
    type metadata accessor for HealthPluginHostService(255);
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100046650);
  }
  return result;
}

void *sub_10000D774(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    unint64_t result = (void *)sub_10000E11C(a1);
    uint64_t v4 = (uint64_t)result;
    int v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 64;
    uint64_t v16 = v2;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v17 = v7;
      swift_retain();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      unint64_t result = (void *)specialized ContiguousArray._endMutation()();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v11 = *(void *)(v8 + 8 * v10);
      if ((v11 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v12 = v11 & (-2 << (v4 & 0x3F));
      if (v12)
      {
        int64_t v9 = __clz(__rbit64(v12)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v13 = v10 + 1;
        unint64_t v14 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v14)
        {
          unint64_t v15 = *(void *)(v8 + 8 * v13);
          if (v15)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v15)) + (v13 << 6);
          }
          else
          {
            while (v14 - 2 != v10)
            {
              unint64_t v15 = *(void *)(a1 + 80 + 8 * v10++);
              if (v15)
              {
                unint64_t v13 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v7 = v17 + 1;
      uint64_t v4 = v9;
      if (v17 + 1 == v16) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

uint64_t sub_10000D954@<X0>(unsigned char *a1@<X8>)
{
  sub_10000E028(0, (unint64_t *)&qword_100046700, (uint64_t (*)(uint64_t))sub_100013D08, sub_1000314AC, (uint64_t (*)(uint64_t, uint64_t, uint64_t))&type metadata accessor for GeneratorPipelineManager.GenerationState);
  uint64_t v2 = GeneratorPipelineManager.GenerationState.outstandingGenerators.getter();
  char v3 = sub_10000D9F8(v2);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v3 & 1;
  return result;
}

uint64_t sub_10000D9F8(uint64_t a1)
{
  uint64_t v61 = type metadata accessor for ContentKind();
  uint64_t v2 = *(void *)(v61 - 8);
  uint64_t v3 = __chkstk_darwin(v61);
  unint64_t v58 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v60 = (char *)&v41 - v5;
  uint64_t v52 = type metadata accessor for GeneratorDomain();
  uint64_t v6 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  os_log_t v51 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E0A8();
  uint64_t v49 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v48 = (char *)&v41 - v12;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v43 = a1 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(a1 + 32);
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v13;
  int64_t v44 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, uint64_t))(v6 + 8);
  unsigned int v46 = enum case for ContentKind.highlight(_:);
  os_log_type_t v45 = (void (**)(char *, void, uint64_t))(v2 + 104);
  uint64_t v57 = v2 + 16;
  uint64_t v42 = v2;
  os_log_t v59 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v53 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v18 = 0;
  unint64_t v50 = v11;
  while (1)
  {
    if (v16)
    {
      uint64_t v54 = (v16 - 1) & v16;
      int64_t v55 = v18;
      unint64_t v19 = __clz(__rbit64(v16)) | (v18 << 6);
    }
    else
    {
      int64_t v20 = v18 + 1;
      if (__OFADD__(v18, 1))
      {
        __break(1u);
LABEL_33:
        __break(1u);
        return result;
      }
      if (v20 >= v44) {
        goto LABEL_31;
      }
      unint64_t v21 = *(void *)(v43 + 8 * v20);
      int64_t i = v18 + 1;
      if (!v21)
      {
        int64_t i = v18 + 2;
        if (v18 + 2 >= v44) {
          goto LABEL_31;
        }
        unint64_t v21 = *(void *)(v43 + 8 * i);
        if (!v21)
        {
          int64_t i = v18 + 3;
          if (v18 + 3 >= v44) {
            goto LABEL_31;
          }
          unint64_t v21 = *(void *)(v43 + 8 * i);
          if (!v21)
          {
            int64_t i = v18 + 4;
            if (v18 + 4 >= v44) {
              goto LABEL_31;
            }
            unint64_t v21 = *(void *)(v43 + 8 * i);
            if (!v21)
            {
              uint64_t v23 = v18 + 5;
              if (v18 + 5 >= v44)
              {
LABEL_31:
                swift_release();
                return 0;
              }
              unint64_t v21 = *(void *)(v43 + 8 * v23);
              for (int64_t i = v18 + 5; !v21; ++v23)
              {
                int64_t i = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_33;
                }
                if (i >= v44) {
                  goto LABEL_31;
                }
                unint64_t v21 = *(void *)(v43 + 8 * i);
              }
            }
          }
        }
      }
      uint64_t v54 = (v21 - 1) & v21;
      int64_t v55 = i;
      unint64_t v19 = __clz(__rbit64(v21)) + (i << 6);
    }
    uint64_t v24 = v53;
    uint64_t v25 = *(void *)(v53 + 48);
    uint64_t v26 = type metadata accessor for UUID();
    uint64_t v27 = (uint64_t)v48;
    (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v48, v25 + *(void *)(*(void *)(v26 - 8) + 72) * v19, v26);
    uint64_t v28 = *(void *)(v24 + 56);
    sub_1000314E0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27 + *(int *)(v49 + 48), v28 + *(void *)(*(void *)(v29 - 8) + 72) * v19, v29);
    sub_100031568(v27, (uint64_t)v11);
    swift_getKeyPath();
    uint64_t v30 = v51;
    GeneratorPipelineManagerWrapper.subscript.getter();
    swift_release();
    uint64_t v31 = GeneratorDomain.contentKinds.getter();
    (*v47)(v30, v52);
    (*v45)(v60, v46, v61);
    if (*(void *)(v31 + 16))
    {
      sub_10000F6B4(&qword_100046A90, (void (*)(uint64_t))&type metadata accessor for ContentKind);
      uint64_t v32 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v33 = -1 << *(unsigned char *)(v31 + 32);
      unint64_t v34 = v32 & ~v33;
      if ((*(void *)(v31 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34)) {
        break;
      }
    }
LABEL_5:
    swift_bridgeObjectRelease();
    (*v59)(v60, v61);
    uint64_t v11 = v50;
    uint64_t result = sub_10003163C((uint64_t)v50);
    unint64_t v16 = v54;
    int64_t v18 = v55;
  }
  uint64_t v56 = ~v33;
  uint64_t v35 = *(void *)(v42 + 72);
  unint64_t v36 = *(void (**)(char *, unint64_t, uint64_t))(v42 + 16);
  while (1)
  {
    uint64_t v37 = v58;
    uint64_t v38 = v61;
    v36(v58, *(void *)(v31 + 48) + v35 * v34, v61);
    sub_10000F6B4(qword_100046A98, (void (*)(uint64_t))&type metadata accessor for ContentKind);
    char v39 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v40 = *v59;
    (*v59)(v37, v38);
    if (v39) {
      break;
    }
    unint64_t v34 = (v34 + 1) & v56;
    if (((*(void *)(v31 + 56 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
      goto LABEL_5;
    }
  }
  swift_bridgeObjectRelease();
  v40(v60, v61);
  sub_10003163C((uint64_t)v50);
  swift_release();
  return 1;
}

void sub_10000E028(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_10000E0A8()
{
  if (!qword_100046A80)
  {
    type metadata accessor for UUID();
    sub_1000314E0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100046A80);
    }
  }
}

uint64_t sub_10000E11C(uint64_t a1)
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

id sub_10000E1A4(char *a1, uint64_t a2, void **a3, uint64_t a4)
{
  char v5 = v4;
  uint64_t v38 = a3;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v37 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v37 - 8);
  uint64_t v9 = __chkstk_darwin(v37);
  unint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v31 - v12;
  *(void *)&v5[qword_1000469E8] = 0;
  *(void *)&v5[qword_1000469F0] = 0;
  uint64_t v14 = v5;
  static Logger.personalization.getter();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v40 = v32;
    *(_DWORD *)uint64_t v17 = 136446466;
    uint64_t v34 = a4;
    uint64_t v18 = sub_10000EA60(ObjectType);
    uint64_t v39 = sub_10000E724(v18, v19, &v40);
    uint64_t v33 = ObjectType;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v39 = sub_10000E724(0xD000000000000078, 0x8000000100039C70, &v40);
    uint64_t ObjectType = v33;
    a4 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s]: %{public}s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v13, v37);
  *(void *)&v14[qword_1000469E0] = v35;
  swift_retain();
  *(void *)&v14[qword_100046A08] = sub_10000A920(v36, v38);
  sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  sub_10000C454(&qword_100046728, (void (*)(uint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation);
  sub_10000ED30();
  *(void *)&v14[qword_100046A00] = static FeedPopulationListenerSupport.makeThrottledFeedItemSubmissionPublisher<A>(config:)();
  static Logger.analytics.getter();
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v24 = sub_10000EA60(ObjectType);
    uint64_t v36 = v8;
    uint64_t v39 = sub_10000E724(v24, v25, &v40);
    uint64_t v35 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v39 = sub_10000E724(0xD00000000000001ALL, 0x8000000100039C50, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%s]: Initialized %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v26 = v35;
  }
  else
  {

    uint64_t v26 = v11;
  }
  v20(v26, v37);
  type metadata accessor for AppSessionAnalyticsManager();
  swift_allocObject();
  *(void *)&v14[qword_1000469F8] = AppSessionAnalyticsManager.init()();

  uint64_t v27 = (objc_class *)type metadata accessor for SummaryTabForegroundFeedPopulationOperation();
  v41.receiver = v14;
  v41.super_class = v27;
  id v28 = objc_msgSendSuper2(&v41, "init");
  sub_10000B480(0, (unint64_t *)&qword_1000466E0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))&type metadata accessor for FeedPopulationListenerSchedulerConfiguration);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(a4, v29);
  sub_10000F790((uint64_t)v38);
  return v28;
}

uint64_t sub_10000E724(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E8A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000E848((uint64_t)v12, *a3);
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
      sub_10000E848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000E7F8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E7F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000E848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000E8A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100010BD4(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000EA64()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000EA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EAE4(void (*a1)(void))
{
  swift_release();
  a1(*(void *)(v1 + 24));

  return _swift_deallocObject(v1, 40, 7);
}

uint64_t sub_10000EB34()
{
  return swift_release();
}

uint64_t sub_10000EB3C()
{
  return swift_release();
}

uint64_t sub_10000EB44()
{
  return swift_release();
}

uint64_t sub_10000EB4C()
{
  return swift_release();
}

uint64_t sub_10000EB54()
{
  return swift_release();
}

void sub_10000EB64()
{
  if (!qword_100046148)
  {
    type metadata accessor for CountryRetrievalRecord();
    type metadata accessor for CountryRetrievalError();
    sub_100013EF8(&qword_100046150, (void (*)(uint64_t))&type metadata accessor for CountryRetrievalError);
    unint64_t v0 = type metadata accessor for Result();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046148);
    }
  }
}

uint64_t sub_10000EC10(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000EC60(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_10000ECB0()
{
  if (!qword_1000467B8)
  {
    sub_10000C49C(255, (unint64_t *)&qword_100045F40);
    type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1000467B8);
    }
  }
}

unint64_t sub_10000ED30()
{
  unint64_t result = qword_1000466E8;
  if (!qword_1000466E8)
  {
    sub_10000C49C(255, (unint64_t *)&qword_100045F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000466E8);
  }
  return result;
}

unint64_t sub_10000ED98()
{
  unint64_t result = qword_1000462F0;
  if (!qword_1000462F0)
  {
    sub_100017218(255, &qword_1000462E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000462F0);
  }
  return result;
}

uint64_t sub_10000EE20()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000EE48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_10000EE70()
{
  if (!qword_1000466A8)
  {
    sub_10000912C(255, &qword_100046160, (uint64_t)&type metadata for SourceProfile, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
    unint64_t v0 = type metadata accessor for Just();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000466A8);
    }
  }
}

void sub_10000EEEC()
{
  if (!qword_100046A70)
  {
    unint64_t v0 = type metadata accessor for AnyPublisher();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046A70);
    }
  }
}

uint64_t sub_10000EF50(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void *, void *))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000F640(255, a2, (uint64_t (*)(uint64_t))sub_100028450, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000EFAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t, void *, void *))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7, &type metadata for Never, &protocol witness table for Never);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_10000F020()
{
  unint64_t result = qword_100046A68;
  if (!qword_100046A68)
  {
    sub_10000EFAC(255, &qword_100046A60, (uint64_t (*)(uint64_t))&type metadata accessor for FeedItemChangeDomain, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046A68);
  }
  return result;
}

unint64_t sub_10000F0A8()
{
  unint64_t result = qword_1000467C0;
  if (!qword_1000467C0)
  {
    sub_10000B590(255, &qword_1000467A8, (uint64_t (*)(uint64_t))sub_10000F450, sub_10000F4E4, (uint64_t (*)(uint64_t, void *))&type metadata accessor for Publishers.Timeout);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000467C0);
  }
  return result;
}

void sub_10000F144()
{
  if (!qword_100046158)
  {
    type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
    sub_1000140D0(255, &qword_100046160);
    sub_100013EF8(&qword_100046168, (void (*)(uint64_t))&type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher);
    unint64_t v0 = type metadata accessor for Publishers.Map();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046158);
    }
  }
}

void sub_10000F200()
{
  if (!qword_100046768)
  {
    sub_10000B590(255, &qword_100046758, (uint64_t (*)(uint64_t))sub_10000F2B0, sub_10000F380, (uint64_t (*)(uint64_t, void *))&type metadata accessor for Publishers.CollectByTime);
    sub_10000F3B4();
    unint64_t v0 = type metadata accessor for Publishers.Map();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046768);
    }
  }
}

void sub_10000F2B0()
{
  if (!qword_100046740)
  {
    sub_10000F640(255, &qword_100046748, (uint64_t (*)(uint64_t))sub_100028450, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
    sub_10000EF50(&qword_100046750, &qword_100046748, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyPublisher);
    unint64_t v0 = type metadata accessor for Publishers.Map();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046740);
    }
  }
}

uint64_t sub_10000F380()
{
  return sub_10000C454(&qword_100046760, (void (*)(uint64_t))sub_10000F2B0);
}

unint64_t sub_10000F3B4()
{
  unint64_t result = qword_100046770;
  if (!qword_100046770)
  {
    sub_10000B590(255, &qword_100046758, (uint64_t (*)(uint64_t))sub_10000F2B0, sub_10000F380, (uint64_t (*)(uint64_t, void *))&type metadata accessor for Publishers.CollectByTime);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046770);
  }
  return result;
}

void sub_10000F450()
{
  if (!qword_100046798)
  {
    sub_10000F518();
    sub_10000C454(&qword_1000467A0, (void (*)(uint64_t))sub_10000F518);
    unint64_t v0 = type metadata accessor for Publishers.IgnoreOutput();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046798);
    }
  }
}

uint64_t sub_10000F4E4()
{
  return sub_10000C454(&qword_1000467B0, (void (*)(uint64_t))sub_10000F450);
}

void sub_10000F518()
{
  if (!qword_100046788)
  {
    sub_10000F5AC();
    sub_10000C454(&qword_100046790, (void (*)(uint64_t))sub_10000F5AC);
    unint64_t v0 = type metadata accessor for Publishers.HandleEvents();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046788);
    }
  }
}

void sub_10000F5AC()
{
  if (!qword_100046778)
  {
    sub_10000F200();
    sub_10000C454(&qword_100046780, (void (*)(uint64_t))sub_10000F200);
    unint64_t Where = type metadata accessor for Publishers.FirstWhere();
    if (!v1) {
      atomic_store(Where, (unint64_t *)&qword_100046778);
    }
  }
}

void sub_10000F640(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t, void *, void *))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7, &type metadata for Never, &protocol witness table for Never);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10000F6B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for SummaryTabForegroundFeedPopulationOperation()
{
  uint64_t result = qword_100046A10;
  if (!qword_100046A10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000F748(void *a1)
{
  id v1 = a1;
  sub_100006B2C();
}

uint64_t sub_10000F790(uint64_t a1)
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F808(uint64_t a1, uint64_t a2)
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F888(uint64_t a1, uint64_t a2)
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000F908(char a1)
{
  sub_100004AA0(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_10000F914@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004408(a1, a2);
}

void sub_10000F930(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  sub_10000433C(a1, *(unsigned char *)(v2 + 16), a2);
}

uint64_t sub_10000F954(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for HealthPluginHostService(uint64_t a1)
{
  return sub_10000F954(a1, (uint64_t *)&unk_1000465E0);
}

void *sub_10000F9AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for GenerationWorkRequest() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(v1 + v5);
  uint64_t v7 = *(void *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_100004FD0(a1, v1 + v4, v6, v7);
}

uint64_t sub_10000FA54@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000FAE0(a1);
}

uint64_t sub_10000FA6C(uint64_t a1)
{
  return sub_10000B640(a1, *(void **)(v1 + 24), (void *)(v1 + 32), *(void *)(v1 + 72), *(void *)(v1 + 80), v1 + 88, *(void *)(v1 + 128), *(void **)(v1 + 136), *(void **)(v1 + 144), *(char **)(v1 + 152));
}

uint64_t type metadata accessor for HealthPluginHostService.JustPrimarySnippetsFeedItemGeneratorPipelineManager(uint64_t a1)
{
  return sub_10000F954(a1, (uint64_t *)&unk_100046600);
}

uint64_t sub_10000FAD4()
{
  v1._rawValue = *(void **)(v0 + 24);
  return sub_100005464(*(void *)(v0 + 16), v1, *(void *)(v0 + 32));
}

uint64_t sub_10000FAE0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000052E4(*(void **)(v1 + 24), "[TransactionManagedCache]: Creating new pinned content manager for foreground", a1);
}

id sub_10000FB04(void (*a1)(void), uint64_t a2)
{
  return sub_10000507C(a1, a2, *(void *)(v2 + 8));
}

uint64_t sub_10000FB0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100004D94(a1, a2, a3, a4, &enum case for PriorityRuleSet.Priority.blocked(_:));
}

uint64_t sub_10000FB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100004D94(a1, a2, a3, a4, &enum case for PriorityRuleSet.Priority.unspecified(_:));
}

uint64_t sub_10000FB24(uint64_t a1, uint64_t a2)
{
  sub_10000FBEC(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10000FB88(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_10000FBEC(uint64_t a1)
{
}

id sub_10000FC20()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_string(empty, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);

  return empty;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v75 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v70 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v4 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for DispatchQoS();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v76 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  id v74 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  unint64_t v73 = (char *)&v68 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  unint64_t v71 = (char *)&v68 - v17;
  __chkstk_darwin(v16);
  unint64_t v19 = (char *)&v68 - v18;
  NSString v20 = String._bridgeToObjectiveC()();
  HKSetTemporaryDirectorySuffix();

  static Logger.daemon.getter();
  unint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "healthappd: Starting", v23, 2u);
    swift_slowDealloc();
  }

  uint64_t v24 = *(void (**)(void, void))(v76 + 8);
  v76 += 8;
  Class v72 = v24;
  v24(v19, v11);
  unint64_t v25 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(15, v25);
  sub_10000C49C(0, (unint64_t *)&unk_100045F38);
  sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for DispatchQoS.QoSClass.default(_:), v7);
  uint64_t v26 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v27 = static OS_dispatch_source.makeSignalSource(signal:queue:)();

  qword_100046C98 = v27;
  swift_getObjectType();
  uint64_t v84 = sub_10001094C;
  uint64_t v85 = 0;
  id aBlock = (uint64_t)_NSConcreteStackBlock;
  unint64_t v81 = 1107296256;
  Class v82 = sub_100010A84;
  uint64_t v83 = &unk_100041A90;
  id v28 = _Block_copy(&aBlock);
  static DispatchQoS.unspecified.getter();
  sub_100010AC8();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v4, v75);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v6, v69);
  swift_getObjectType();
  OS_dispatch_source.activate()();
  type metadata accessor for HealthAppPluginSource();
  static HealthAppPluginSource.knownBundles.getter();
  static HealthAppPluginSource.disabledBundleIdentifiers()();
  static HealthAppPluginSource.allowedBundleIdentifiers()();
  swift_allocObject();
  qword_100046CA0 = HealthAppPluginSource.init(bundleProvider:knownBundles:disabledBundleIdentifiers:allowedBundleIdentifiers:)();
  HealthAppPluginSource.loadPluginsFromDisk()();
  if (v29)
  {
    id aBlock = 0;
    unint64_t v81 = 0xE000000000000000;
    _StringGuts.grow(_:)(36);
    v67._countAndFlagsBits = 0xD000000000000022;
    v67._object = (void *)0x8000000100038EB0;
    String.append(_:)(v67);
    uint64_t v77 = v29;
    sub_10000EC10(0, &qword_100045F48);
    _print_unlocked<A, B>(_:_:)();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    swift_errorInMain();
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v75 = v11;
  qword_100046CA8 = 0x403E000000000000;
  qword_100046CB0 = 3;
  sub_10000EC10(0, &qword_100045F50);
  uint64_t v30 = HealthAppPluginSource.conformingPlugins<A>(_:)();
  uint64_t v70 = 0;
  qword_100046CB8 = v30;
  uint64_t v31 = type metadata accessor for DirectDispatchTarget();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v32 = DirectDispatchTarget.init(providers:)();
  uint64_t v83 = (void *)v31;
  uint64_t v84 = &protocol witness table for DirectDispatchTarget;
  id aBlock = v32;
  uint64_t v33 = type metadata accessor for TimeoutDispatchTarget();
  swift_allocObject();
  qword_100046CC0 = TimeoutDispatchTarget.init(timeout:target:)();
  uint64_t v83 = (void *)v33;
  uint64_t v84 = &protocol witness table for TimeoutDispatchTarget;
  id aBlock = qword_100046CC0;
  uint64_t v34 = type metadata accessor for DatabaseAccessibilityDispatchTarget();
  swift_allocObject();
  swift_retain();
  uint64_t v35 = DatabaseAccessibilityDispatchTarget.init(target:)();
  qword_100046CC8 = v35;
  uint64_t v83 = (void *)v34;
  uint64_t v84 = (void *)sub_100011034((unint64_t *)&unk_100045F58, (void (*)(uint64_t))&type metadata accessor for DatabaseAccessibilityDispatchTarget);
  id aBlock = v35;
  uint64_t v36 = type metadata accessor for MultiDispatcher();
  swift_allocObject();
  swift_retain();
  qword_100046CD0 = MultiDispatcher.init(target:width:)();
  type metadata accessor for DaemonHealthExperienceStoreOracle();
  qword_100046CD8 = static DaemonHealthExperienceStoreOracle.shared.getter();
  id v37 = [objc_allocWithZone((Class)HKHealthStore) init];
  qword_100045F20 = (uint64_t)v37;
  uint64_t v38 = type metadata accessor for PinnedContentManager();
  id v39 = v37;
  qword_100045F28 = PinnedContentManager.__allocating_init(healthStore:domain:)();
  type metadata accessor for HealthAppNotificationManager();
  qword_100046CE0 = HealthAppNotificationManager.__allocating_init()();
  type metadata accessor for OpenTransactionBuilderManager();
  qword_100046CE8 = static OpenTransactionBuilderManager.shared.getter();
  id v40 = [objc_allocWithZone((Class)HKProfileStore) initWithHealthStore:qword_100045F20];
  uint64_t v83 = (void *)sub_10000C49C(0, (unint64_t *)&unk_100045F60);
  uint64_t v84 = &protocol witness table for HKProfileStore;
  id aBlock = (uint64_t)v40;
  uint64_t v78 = v38;
  os_log_t v79 = &protocol witness table for PinnedContentManager;
  uint64_t v77 = qword_100045F28;
  id v41 = (id)qword_100046CD8;
  swift_retain();
  swift_retain();
  swift_retain();
  static Logger.orchestration.getter();
  [objc_allocWithZone((Class)HKHealthStore) init];
  type metadata accessor for HealthPlatformContextProvider();
  swift_allocObject();
  qword_100046CF0 = HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)();
  nullsub_1();
  [self setFlushTimerEnabled:0];
  uint64_t v43 = qword_100046CA0;
  uint64_t v44 = qword_100046CF0;
  unint64_t v45 = sub_100011034((unint64_t *)&unk_100045F68, (void (*)(uint64_t))&type metadata accessor for HealthPlatformContextProvider);
  uint64_t v83 = (void *)v36;
  uint64_t v84 = &protocol witness table for MultiDispatcher;
  id aBlock = qword_100046CD0;
  unsigned int v46 = (void *)qword_100046CD8;
  uint64_t v78 = v38;
  os_log_t v79 = &protocol witness table for PinnedContentManager;
  uint64_t v77 = qword_100045F28;
  uint64_t v47 = qword_100046CE8;
  type metadata accessor for HealthAppOrchestrationClient();
  swift_retain();
  swift_retain();
  swift_retain();
  id v48 = v46;
  swift_retain();
  swift_retain();
  static HealthAppOrchestrationClient.serviceName.getter();
  id v49 = objc_allocWithZone((Class)NSXPCListener);
  NSString v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v51 = [v49 initWithMachServiceName:v50];

  type metadata accessor for HealthAppDaemonCoordinator();
  swift_allocObject();
  uint64_t v52 = v70;
  uint64_t v53 = sub_100017954(v43, v44, v45, (uint64_t)&aBlock, v48, (uint64_t)&v77, v47, v51);
  if (v52)
  {
LABEL_13:
    int result = swift_errorInMain();
    __break(1u);
    return result;
  }
  qword_100046CF8 = (uint64_t)v53;
  uint64_t v54 = v73;
  static Logger.daemon.getter();
  int64_t v55 = Logger.logObject.getter();
  uint64_t v56 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v55, (os_log_type_t)v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    id aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v77 = qword_100046CF8;
    swift_retain();
    uint64_t v58 = String.init<A>(reflecting:)();
    uint64_t v77 = sub_10000E724(v58, v59, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v56, "healthappd: Starting daemon: %s", v57, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v60 = v75;
  uint64_t v61 = v72;
  v72(v54, v75);
  id v62 = v74;
  sub_100017404();
  static Logger.daemon.getter();
  id v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    os_log_type_t v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v65 = 0;
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "healthappd: Shutdown", v65, 2u);
    swift_slowDealloc();
  }

  v61(v62, v60);
  return 0;
}

uint64_t sub_10001094C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "healthappd: sigterm Shutdown", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return xpc_transaction_exit_clean();
}

uint64_t sub_100010A84(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100010AC8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

BOOL sub_100010BA4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_100010BB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100010BC8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100010BD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100010C6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100010E6C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100010E6C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100010C6C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100010DE4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    int result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100010DE4(uint64_t a1, uint64_t a2)
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
  sub_1000110F4(0, &qword_100045F70, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100010E6C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000110F4(0, &qword_100045F70, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100010FDC()
{
  if (!qword_100045F80)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t v0 = type metadata accessor for Array();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100045F80);
    }
  }
}

uint64_t sub_100011034(unint64_t *a1, void (*a2)(uint64_t))
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

void type metadata accessor for HDXPCGatedActivityResult(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for HKHealthAppPluginHostGenerationType(uint64_t a1)
{
}

void sub_1000110F4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_100011140()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (![self isHealthDataAvailable]) {
    return 1;
  }
  uint64_t v6 = (void *)v0[4];
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v20)
  {
    sub_10000A908(&v19, (uint64_t)v21);
    sub_100011474((uint64_t)v21);
    sub_10000E7F8((uint64_t)v21);
    return 1;
  }
  sub_100014118((uint64_t)&v19, (uint64_t (*)(void))sub_100014178);
  static Logger.daemon.getter();
  swift_retain_n();
  int64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    os_log_t v17 = v8;
    uint64_t v11 = v10;
    uint64_t v16 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(void *)&long long v19 = v18;
    *(_DWORD *)uint64_t v11 = 136315394;
    v21[0] = v1;
    swift_getMetatypeMetadata();
    uint64_t v12 = String.init<A>(describing:)();
    v21[0] = sub_10000E724(v12, v13, (uint64_t *)&v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    v21[0] = v6;
    id v14 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v16 = v6;
    swift_release_n();
    os_log_t v15 = v17;
    _os_log_impl((void *)&_mh_execute_header, v17, v9, "[%s] oracle doesn't have a store, deferring: %@", (uint8_t *)v11, 0x16u);
    sub_1000141AC();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0;
}

uint64_t sub_100011474(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v54 = type metadata accessor for GenerationQueue.EnqueueResult();
  uint64_t v52 = *(uint8_t **)(v54 - 8);
  uint64_t v5 = __chkstk_darwin(v54);
  os_log_t v53 = (os_log_t)((char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  id v51 = (char *)&v46 - v7;
  uint64_t v8 = type metadata accessor for GenerationWorkRequest();
  uint64_t v57 = *(void *)(v8 - 8);
  uint64_t v58 = v8;
  __chkstk_darwin(v8);
  unint64_t v59 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v48 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  os_log_t v15 = (char *)&v46 - v14;
  static Logger.daemon.getter();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v60 = v4;
  uint64_t v55 = v11;
  uint64_t v56 = v10;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v50 = a1;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v62 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)&v61[0] = v60;
    swift_getMetatypeMetadata();
    uint64_t v21 = String.init<A>(describing:)();
    *(void *)&v61[0] = sub_10000E724(v21, v22, &v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%s]: DAS background generation starting", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v4 = v60;
    swift_slowDealloc();
    a1 = v50;
    swift_slowDealloc();

    uint64_t v47 = *(void (**)(char *, uint64_t))(v55 + 8);
    v47(v15, v56);
  }
  else
  {

    uint64_t v47 = *(void (**)(char *, uint64_t))(v11 + 8);
    v47(v15, v10);
  }
  id v23 = [objc_allocWithZone((Class)HKHealthStore) init];
  type metadata accessor for PinnedContentManager();
  id v24 = v23;
  uint64_t v25 = PinnedContentManager.__allocating_init(healthStore:domain:)();
  uint64_t v26 = v2[8];
  sub_10000A884(a1, (uint64_t)v61);
  uint64_t v27 = (void *)swift_allocObject();
  v27[2] = v24;
  sub_10000A908(v61, (uint64_t)(v27 + 3));
  v27[8] = v25;
  v27[9] = v2;
  v27[10] = v26;
  sub_10000A884(a1, (uint64_t)v61);
  id v28 = (void *)swift_allocObject();
  v28[2] = v2;
  sub_10000A908(v61, (uint64_t)(v28 + 3));
  v28[8] = v26;
  v28[9] = v4;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v4;
  swift_retain_n();
  swift_retain_n();
  id v49 = v24;
  uint64_t v50 = v25;
  swift_retain();
  uint64_t v30 = static GenerationPhase.allCases.getter();
  sub_1000060BC(v30);
  swift_bridgeObjectRelease();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v31 = v59;
  GenerationWorkRequest.init(environment:pluginIdentifierSetToRun:generationPhases:commitUrgentTransaction:makeGenerationWorkBlock:completionBlock:notStartedCancellationBlock:)();
  uint64_t v32 = v51;
  dispatch thunk of GenerationQueue.enqueue(_:)();
  uint64_t v34 = v52;
  os_log_t v33 = v53;
  uint64_t v35 = v54;
  (*((void (**)(os_log_t, char *, uint64_t))v52 + 4))(v53, v32, v54);
  LODWORD(v32) = (*((uint64_t (**)(os_log_t, uint64_t))v34 + 11))(v33, v35);
  LODWORD(v26) = enum case for GenerationQueue.EnqueueResult.dropped(_:);
  (*((void (**)(os_log_t, uint64_t))v34 + 1))(v33, v35);
  if (v32 == v26)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v31, v58);
  }
  else
  {
    uint64_t v54 = v29;
    id v37 = v49;
    uint64_t v38 = v48;
    static Logger.daemon.getter();
    id v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      os_log_t v53 = v39;
      id v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v62 = swift_slowAlloc();
      *(_DWORD *)id v41 = 136446210;
      uint64_t v52 = v41 + 4;
      *(void *)&v61[0] = v60;
      swift_getMetatypeMetadata();
      uint64_t v42 = String.init<A>(describing:)();
      *(void *)&v61[0] = sub_10000E724(v42, v43, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      os_log_t v44 = v53;
      _os_log_impl((void *)&_mh_execute_header, v53, v40, "[%{public}s]: DAS background generation request dropped", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      swift_release();
      swift_release();
      swift_release();

      unint64_t v45 = v48;
    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();

      unint64_t v45 = v38;
    }
    v47(v45, v56);
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v59, v58);
  }
}

uint64_t sub_100011C18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 + 56);
  uint64_t v12 = *(void *)(*(void *)(a5 + 48) + 24);
  swift_retain();
  swift_retain();
  uint64_t v13 = sub_100012B90(a1, a2, a3, a4, v12, a6, v11);
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_100011CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a2;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FBEC(0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  uint64_t v14 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  sub_100013998((uint64_t)v13);
  static Logger.daemon.getter();
  os_log_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v26 = a1;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v24 = v7;
    BOOL v18 = (uint8_t *)v17;
    uint64_t v28 = swift_slowAlloc();
    *(void *)&v29[0] = a4;
    *(_DWORD *)BOOL v18 = 136446210;
    uint64_t v25 = a3;
    swift_getMetatypeMetadata();
    uint64_t v19 = String.init<A>(describing:)();
    *(void *)&v29[0] = sub_10000E724(v19, v20, &v28);
    a3 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s]: DAS background generation completed, populating feed", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v21 = static Feed.Kind.relevanceRankedFeeds.getter();
  sub_10000A884(v27, (uint64_t)v29);
  uint64_t v22 = swift_allocObject();
  sub_10000A908(v29, v22 + 16);
  *(void *)(v22 + 56) = a3;
  *(void *)(v22 + 64) = a4;
  swift_retain();
  sub_1000299FC(v21, (uint64_t (*)(uint64_t))sub_100013C08, v22);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100011FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v17[0] = a1;
    uint64_t v12 = swift_slowAlloc();
    v17[1] = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v18 = swift_slowAlloc();
    v19[0] = a3;
    *(_DWORD *)uint64_t v13 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v14 = String.init<A>(describing:)();
    v19[0] = sub_10000E724(v14, v15, &v18);
    a1 = v17[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s]: DAS feed population completed", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_10000A884(a1, (uint64_t)v19);
  sub_100013C14();
  type metadata accessor for DaemonHealthExperienceStore();
  if (swift_dynamicCast())
  {
    dispatch thunk of DaemonHealthExperienceStore.cleanUpManagedObjectContext()();
    swift_release();
  }
  return dispatch thunk of OpenTransactionBuilderManager.clearAllCachedTransactionBuilders()();
}

uint64_t sub_100012224(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = a1;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v9 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%{public}s]: DAS background generation cancelled before starting", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100012404()
{
  type metadata accessor for DaemonBackgroundGenerationActivity();
  DebuggingResponder.deregisterForDebuggingRequests()();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for DaemonBackgroundGenerationActivity()
{
  return self;
}

uint64_t sub_100012490()
{
  sub_10000FBEC(0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FB88(0, &qword_1000460C8, (uint64_t (*)(uint64_t))sub_10000FBEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for UserDefault);
  uint64_t v4 = v3;
  sub_100013CA4(v3, qword_100045FA8);
  sub_100013C6C(v4, (uint64_t)qword_100045FA8);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000C49C(0, &qword_1000460D0);
  static NSUserDefaults.healthAppShared.getter();
  uint64_t v5 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  return UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)();
}

uint64_t sub_100012604()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = v1;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v9 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%s]: debuggingInfoRequested()", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000128F0()
{
  _StringGuts.grow(_:)(39);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  sub_100012A7C();
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 32;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._object = (void *)0x8000000100039200;
  v4._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v4);
  id v5 = *(id *)(v0 + 32);
  id v6 = [v5 description];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 62;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  return 0;
}

uint64_t sub_100012A58()
{
  return sub_1000128F0();
}

unint64_t sub_100012A7C()
{
  unint64_t result = qword_1000460B0;
  if (!qword_1000460B0)
  {
    type metadata accessor for DaemonBackgroundGenerationActivity();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000460B0);
  }
  return result;
}

uint64_t sub_100012AB4()
{
  sub_10000E7F8(v0 + 24);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_100012B0C(uint64_t a1)
{
  return sub_100011C18(a1, *(void **)(v1 + 16), v1 + 24, *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80));
}

uint64_t sub_100012B20()
{
  swift_release();
  sub_10000E7F8(v0 + 24);
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100012B68()
{
  return sub_100011CB8(v0[2], (uint64_t)(v0 + 3), v0[8], v0[9]);
}

uint64_t sub_100012B78()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012B88()
{
  return sub_100012224(*(void *)(v0 + 16));
}

uint64_t sub_100012B90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v69 = a7;
  uint64_t v72 = a6;
  uint64_t v71 = a5;
  uint64_t v74 = a3;
  sub_10000FB88(0, &qword_1000460D8, (uint64_t (*)(uint64_t))sub_100013D08, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for GeneratorPipelineProviderWrapper);
  uint64_t v77 = v10;
  uint64_t v61 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  os_log_t v79 = (char *)v60 - v11;
  uint64_t v82 = type metadata accessor for PipelineProviderWrappers();
  uint64_t v70 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v13 = (char *)v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FB88(0, &qword_100046110, (uint64_t (*)(uint64_t))sub_100013F40, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for GeneratorPipelineProviderWrapper);
  uint64_t v78 = v14;
  uint64_t v80 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  unint64_t v81 = (char *)v60 - v15;
  uint64_t v68 = type metadata accessor for DispatchTimeInterval();
  uint64_t v66 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  Swift::String v67 = (void *)((char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000EB64();
  __chkstk_darwin(v17 - 8);
  os_log_type_t v65 = (char *)v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
  uint64_t v75 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F144();
  uint64_t v23 = v22;
  uint64_t v76 = *(void (**)(char *, unint64_t, uint64_t))(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85[3] = type metadata accessor for PinnedContentManager();
  v85[4] = &protocol witness table for PinnedContentManager;
  v85[0] = a4;
  swift_retain();
  uint64_t v73 = a1;
  uint64_t v26 = GenerationWorkRequest.pluginIdentifierSetToRun.getter();
  sub_100027BF8(v26);
  swift_bridgeObjectRelease();
  uint64_t v27 = type metadata accessor for BundleFeedItemGenerationPluginInfo();
  uint64_t v62 = sub_100013EF8(&qword_100046170, (void (*)(uint64_t))&type metadata accessor for BundleFeedItemGenerationPluginInfo);
  uint64_t v28 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  id v29 = objc_allocWithZone((Class)HKProfileStore);
  id v63 = a2;
  id v30 = [v29 initWithHealthStore:a2];
  HKProfileStore.profileIdentifiersPublisher.getter();
  sub_100013EF8(&qword_100046168, (void (*)(uint64_t))&type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher);
  Publisher<>.mapToSourceProfiles(includeAgnostic:)();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v21, v19);
  sub_100013EF8(&qword_100046178, (void (*)(uint64_t))sub_10000F144);
  uint64_t v64 = Publisher.eraseToAnyPublisher()();
  (*((void (**)(char *, uint64_t))v76 + 1))(v25, v23);

  uint64_t v31 = v28;
  sub_10000A884(v74, (uint64_t)v84);
  int64_t v32 = *(void *)(v28 + 16);
  if (v32)
  {
    v60[1] = v27;
    v83[0] = &_swiftEmptyArrayStorage;
    sub_100005D38(0, v32, 0);
    uint64_t v76 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
    unint64_t v33 = (*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
    v60[0] = v28;
    unint64_t v34 = v28 + v33;
    uint64_t v75 = *(void *)(v70 + 72);
    uint64_t v35 = (void (**)(char *, uint64_t))(v70 + 8);
    uint64_t v36 = v61;
    do
    {
      uint64_t v37 = v82;
      v76(v13, v34, v82);
      PipelineProviderWrappers.feedItem.getter();
      (*v35)(v13, v37);
      uint64_t v38 = v83[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005D38(0, *(void *)(v38 + 16) + 1, 1);
        uint64_t v38 = v83[0];
      }
      unint64_t v40 = *(void *)(v38 + 16);
      unint64_t v39 = *(void *)(v38 + 24);
      if (v40 >= v39 >> 1)
      {
        sub_100005D38(v39 > 1, v40 + 1, 1);
        uint64_t v38 = v83[0];
      }
      *(void *)(v38 + 16) = v40 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v38+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v40, v79, v77);
      v83[0] = v38;
      v34 += v75;
      --v32;
    }
    while (v32);
    uint64_t v31 = v60[0];
  }
  type metadata accessor for FeedItemGeneratorPipelineManager();
  sub_10000A884((uint64_t)v85, (uint64_t)v83);
  swift_retain();
  swift_retain();
  uint64_t v76 = (void (*)(char *, unint64_t, uint64_t))v63;
  uint64_t v77 = GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v41 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  sub_10001E054(v41);
  swift_bridgeObjectRelease();
  uint64_t v42 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  if (GenerationWorkRequest.commitUrgentTransaction.getter()) {
    uint64_t v43 = v42;
  }
  else {
    uint64_t v43 = v31;
  }
  swift_bridgeObjectRelease();
  sub_10000A884(v74, (uint64_t)v84);
  int64_t v44 = *(void *)(v43 + 16);
  if (v44)
  {
    v83[0] = &_swiftEmptyArrayStorage;
    sub_100005CE8(0, v44, 0);
    uint64_t v45 = v70 + 16;
    os_log_t v79 = *(char **)(v70 + 16);
    unint64_t v46 = (*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
    uint64_t v75 = v43;
    unint64_t v47 = v43 + v46;
    uint64_t v48 = *(void *)(v70 + 72);
    id v49 = (void (**)(char *, uint64_t))(v70 + 8);
    do
    {
      uint64_t v50 = v82;
      uint64_t v51 = v45;
      ((void (*)(char *, unint64_t, uint64_t))v79)(v13, v47, v82);
      PipelineProviderWrappers.sharableModel.getter();
      (*v49)(v13, v50);
      uint64_t v52 = v83[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005CE8(0, *(void *)(v52 + 16) + 1, 1);
        uint64_t v52 = v83[0];
      }
      unint64_t v54 = *(void *)(v52 + 16);
      unint64_t v53 = *(void *)(v52 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_100005CE8(v53 > 1, v54 + 1, 1);
        uint64_t v52 = v83[0];
      }
      *(void *)(v52 + 16) = v54 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v80 + 32))(v52+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(void *)(v80 + 72) * v54, v81, v78);
      v83[0] = v52;
      v47 += v48;
      --v44;
      uint64_t v45 = v51;
    }
    while (v44);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for SharableModelGeneratorPipelineManager();
  sub_10000A884((uint64_t)v85, (uint64_t)v83);
  swift_retain();
  swift_retain();
  uint64_t v55 = v76;
  GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  type metadata accessor for GeneratorPipelineGenerationOperation();
  dispatch thunk of CountryOracle.currentCountry()();
  uint64_t v56 = GenerationWorkRequest.generationPhases.getter();
  sub_10002E56C(v56);
  swift_bridgeObjectRelease();
  GenerationWorkRequest.commitUrgentTransaction.getter();
  uint64_t v57 = v67;
  *Swift::String v67 = 150;
  (*(void (**)(void *, void, uint64_t))(v66 + 104))(v57, enum case for DispatchTimeInterval.seconds(_:), v68);
  uint64_t v58 = GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)();
  sub_100013EF8(&qword_100046180, (void (*)(uint64_t))&type metadata accessor for GeneratorPipelineGenerationOperation);
  sub_10000E7F8((uint64_t)v85);
  return v58;
}

void *sub_100013708(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v12 = *v5;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[2] = 0xD00000000000002ALL;
  v6[3] = 0x8000000100039220;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a2;
  v6[7] = a4;
  v6[8] = a5;
  swift_retain();
  id v17 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  static Logger.daemon.getter();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v25 = v13;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = v12;
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v27 = sub_10000E724(v21, v22, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%s]: init()", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  type metadata accessor for DaemonBackgroundGenerationActivity();
  DebuggingResponder.registerForDebuggingRequests()();
  return v6;
}

uint64_t sub_100013998(uint64_t a1)
{
  sub_10000FB88(0, &qword_1000460C8, (uint64_t (*)(uint64_t))sub_10000FBEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for UserDefault);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v6 = (char *)&v12 - v5;
  sub_10000FBEC(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100045F30 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100013C6C(v3, (uint64_t)qword_100045FA8);
  sub_10000FB24(a1, (uint64_t)v9);
  swift_beginAccess();
  UserDefault.wrappedValue.setter();
  swift_endAccess();
  type metadata accessor for AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider();
  static AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.shared.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
  UserDefault.wrappedValue.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  dispatch thunk of AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.dateLastPredictiveGenerationRanForAnalytics.setter();
  swift_release();
  return sub_100014118(a1, (uint64_t (*)(void))sub_10000FBEC);
}

uint64_t sub_100013BC8()
{
  sub_10000E7F8(v0 + 16);
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100013C08()
{
  return sub_100011FD8(v0 + 16, *(void *)(v0 + 56), *(void *)(v0 + 64));
}

unint64_t sub_100013C14()
{
  unint64_t result = qword_1000460C0;
  if (!qword_1000460C0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000460C0);
  }
  return result;
}

uint64_t sub_100013C6C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100013CA4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100013D08(uint64_t a1)
{
}

void sub_100013D50(uint64_t a1)
{
}

void sub_100013D98(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

void sub_100013E18()
{
  if (!qword_1000460F0)
  {
    sub_1000140D0(255, (unint64_t *)&qword_1000460F8);
    unint64_t v0 = type metadata accessor for AnyGenerator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000460F0);
    }
  }
}

uint64_t sub_100013E90()
{
  return sub_100013EF8(&qword_100046100, (void (*)(uint64_t))sub_100013E18);
}

uint64_t sub_100013EC4()
{
  return sub_100013EF8(&qword_100046108, sub_100013D50);
}

uint64_t sub_100013EF8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100013F40(uint64_t a1)
{
}

void sub_100013F88(uint64_t a1)
{
}

void sub_100013FD0()
{
  if (!qword_100046128)
  {
    sub_10000FB88(255, &qword_100046130, (uint64_t (*)(uint64_t))&type metadata accessor for PluginSharableModelChange, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t v0 = type metadata accessor for AnyGenerator();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046128);
    }
  }
}

uint64_t sub_100014068()
{
  return sub_100013EF8(&qword_100046138, (void (*)(uint64_t))sub_100013FD0);
}

uint64_t sub_10001409C()
{
  return sub_100013EF8(&qword_100046140, sub_100013F88);
}

void sub_1000140D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Array();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100014118(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100014178(uint64_t a1)
{
}

void sub_1000141AC()
{
  if (!qword_100046190)
  {
    sub_10000C49C(255, &qword_100046198);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046190);
    }
  }
}

char *sub_100014214(void *a1, uint64_t a2)
{
  uint64_t v90 = a2;
  id v83 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v85 = *(void *)(v3 - 8);
  uint64_t v86 = v3;
  __chkstk_darwin(v3);
  uint64_t v84 = (char *)v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v79 = v5;
  uint64_t v80 = v6;
  __chkstk_darwin(v5);
  uint64_t v78 = (char *)v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F144();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v81 = v8;
  uint64_t v82 = v9;
  __chkstk_darwin(v8);
  uint64_t v77 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v12 = (char *)v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v13);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_signalDebuggingResponderListener;
  type metadata accessor for USR1SignalDebuggingResponderListener();
  swift_allocObject();
  uint64_t v16 = v2;
  *(void *)&v2[v15] = USR1SignalDebuggingResponderListener.init()();
  uint64_t v17 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_longRunningProcessOracle;
  uint64_t v89 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_longRunningProcessOracle;
  type metadata accessor for DaemonLongRunningProcessOracle();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = [objc_allocWithZone((Class)HKHealthStore) init];
  v74[1] = type metadata accessor for HealthAppNotificationManager();
  v18[3] = HealthAppNotificationManager.__allocating_init()();
  sub_100017304(0, &qword_1000462D0, &qword_1000462D8, (uint64_t)&protocol descriptor for PinnedContentManaging, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for TransactionManagedCache);
  swift_allocObject();
  v18[4] = TransactionManagedCache.init()();
  type metadata accessor for GenerationQueue();
  swift_allocObject();
  void v18[5] = GenerationQueue.init()();
  DebuggingResponder.registerForDebuggingRequests()();
  *(void *)&v16[v17] = v18;
  uint64_t v19 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_countryOracle;
  uint64_t v88 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_countryOracle;
  type metadata accessor for CountryOracle();
  swift_allocObject();
  *(void *)&v16[v19] = CountryOracle.init(mobileCountryCodeManagerProvider:)();
  uint64_t v20 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthStore;
  *(void *)&v16[v20] = [objc_allocWithZone((Class)HKHealthStore) init];
  uint64_t v21 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_targetQueue;
  sub_10000C49C(0, (unint64_t *)&qword_100045F40);
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000173A4(&qword_1000462E0, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100017218(0, &qword_1000462E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10000ED98();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v12, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v76);
  *(void *)&v16[v21] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v22 = v21;
  uint64_t v23 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_listener;
  id v24 = objc_allocWithZone((Class)NSXPCListener);
  NSString v25 = String._bridgeToObjectiveC()();
  id v26 = [v24 initWithMachServiceName:v25];

  *(void *)&v16[v23] = v26;
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_localeChangeObserver] = 0;
  uint64_t v27 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_notificationManager;
  *(void *)&v16[v27] = HealthAppNotificationManager.__allocating_init()();
  uint64_t v28 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthExperienceStoreOracle;
  id v29 = v83;
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthExperienceStoreOracle] = v83;
  uint64_t v30 = *(void *)&v16[v20];
  id v31 = objc_allocWithZone((Class)HKProfileStore);
  id v83 = v29;
  id v32 = [v31 initWithHealthStore:v30];
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_profileStore] = v32;
  unint64_t v33 = v78;
  HKProfileStore.profileIdentifiersPublisher.getter();
  sub_1000173A4(&qword_100046168, 255, (void (*)(uint64_t))&type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher);
  unint64_t v34 = v77;
  uint64_t v35 = v79;
  Publisher<>.mapToSourceProfiles(includeAgnostic:)();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v33, v35);
  sub_1000173A4(&qword_100046178, 255, (void (*)(uint64_t))sub_10000F144);
  uint64_t v36 = v81;
  uint64_t v37 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v34, v36);
  uint64_t v81 = v28;
  uint64_t v38 = *(void **)&v16[v28];
  unint64_t v39 = *(void **)&v16[v20];
  unint64_t v40 = *(void **)&v16[v22];
  type metadata accessor for FeedPopulationManagerOracle();
  swift_allocObject();
  id v41 = v38;
  id v42 = v39;
  swift_retain();
  id v43 = v40;
  int64_t v44 = sub_10003012C(v41, v42, v37, v43);

  uint64_t v82 = v37;
  swift_release();

  uint64_t v45 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_feedPopulationManagerOracle;
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_feedPopulationManagerOracle] = v44;
  uint64_t v46 = *(void *)&v16[v89];
  uint64_t v47 = *(void *)&v16[v88];
  objc_allocWithZone((Class)type metadata accessor for DaemonListenerDelegate());
  id v48 = v41;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v49 = v90;
  swift_retain();
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener] = sub_100033154(v48, (uint64_t)v44, v46, v47, v49);
  uint64_t v50 = v84;
  static Logger.daemon.getter();
  uint64_t v51 = v50;
  uint64_t v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v52, v53))
  {
    unint64_t v54 = (uint8_t *)swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    *(_DWORD *)unint64_t v54 = 136315138;
    aBlock[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v55 = String.init<A>(describing:)();
    aBlock[0] = sub_10000E724(v55, v56, &v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "[%s]: init()", v54, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v85 + 8))(v51, v86);
  uint64_t v57 = *(void **)&v16[v81];
  uint64_t v58 = *(void *)&v16[v89];
  uint64_t v59 = *(void *)&v16[v45];
  uint64_t v60 = *(void *)&v16[v88];
  type metadata accessor for DaemonBackgroundGenerationActivity();
  swift_allocObject();
  uint64_t v61 = v90;
  swift_retain();
  id v62 = v57;
  swift_retain();
  swift_retain();
  swift_retain();
  id v63 = sub_100013708(v62, v58, v59, v60, v61);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  *(void *)&v16[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_backgroundGenerationActivity] = v63;

  uint64_t v64 = (objc_class *)type metadata accessor for DaemonLifecycleManager();
  v93.receiver = v16;
  v93.super_class = v64;
  os_log_type_t v65 = (char *)objc_msgSendSuper2(&v93, "init");
  DebuggingResponder.registerForDebuggingRequests()();
  id v66 = [self defaultCenter];
  uint64_t v67 = swift_allocObject();
  *(void *)(v67 + 16) = ObjectType;
  aBlock[4] = sub_1000173FC;
  aBlock[5] = v67;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100014F78;
  aBlock[3] = &unk_100041C38;
  uint64_t v68 = _Block_copy(aBlock);
  swift_release();
  id v69 = [v66 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:v68];
  _Block_release(v68);

  *(void *)&v65[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_localeChangeObserver] = v69;
  swift_unknownObjectRelease();
  uint64_t v70 = *(void **)&v65[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthExperienceStoreOracle];
  uint64_t v71 = v65;
  id v72 = v70;
  dispatch thunk of HealthExperienceStoreOracle.register(observer:)();
  swift_release();

  swift_release();
  return v71;
}

void sub_100014DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = a2;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v10 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v10, v11, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s]: shutting down due to a locale change notification", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  exit(0);
}

uint64_t sub_100014F78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_10001506C()
{
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_localeChangeObserver];
  if (v1)
  {
    uint64_t v2 = self;
    swift_unknownObjectRetain();
    id v3 = [v2 defaultCenter];
    [v3 removeObserver:v1];
    swift_unknownObjectRelease();
  }
  uint64_t v4 = (objc_class *)type metadata accessor for DaemonLifecycleManager();
  DebuggingResponder.deregisterForDebuggingRequests()();
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v6 = result;
    [result removeObserver:v0];

    v7.receiver = v0;
    v7.super_class = v4;
    return objc_msgSendSuper2(&v7, "dealloc");
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000152E0()
{
  _StringGuts.grow(_:)(110);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getObjectType();
  sub_10001736C();
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 32;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  uint64_t v27 = v0;
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 0x656E657473696C20;
  v4._object = (void *)0xEB00000000203A72;
  String.append(_:)(v4);
  id v5 = *(id *)(v0 + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_listener);
  id v6 = [v5 description];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);

  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0xD00000000000001BLL;
  v11._object = (void *)0x80000001000393D0;
  String.append(_:)(v11);
  id v12 = *(id *)(v27 + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener);
  id v13 = [v12 description];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  v17._countAndFlagsBits = v14;
  v17._object = v16;
  String.append(_:)(v17);

  swift_bridgeObjectRelease();
  v18._object = (void *)0x80000001000393F0;
  v18._countAndFlagsBits = 0xD000000000000019;
  String.append(_:)(v18);
  swift_retain();
  v19._countAndFlagsBits = sub_10002B3D4();
  String.append(_:)(v19);
  swift_release();
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 0xD000000000000020;
  v20._object = (void *)0x8000000100039410;
  String.append(_:)(v20);
  swift_retain();
  uint64_t v21 = sub_1000128F0();
  uint64_t v23 = v22;
  swift_release();
  v24._countAndFlagsBits = v21;
  v24._object = v23;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 62;
  v25._object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  return 0;
}

uint64_t sub_100015574()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v26 - v8;
  static Logger.daemon.getter();
  Swift::String v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  uint64_t v28 = v7;
  uint64_t v29 = v3;
  uint64_t v27 = ObjectType;
  if (v12)
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = ObjectType;
    *(_DWORD *)id v13 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v31 = sub_10000E724(v14, v15, &v30);
    uint64_t v7 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s] startXPCListener() Starting", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v29;
    swift_slowDealloc();
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v9, v3);
  uint64_t v17 = OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_listener;
  [*(id *)(v1 + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_listener) setDelegate:*(void *)(v1 + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener)];
  [*(id *)(v1 + v17) resume];
  static Logger.daemon.getter();
  Swift::String v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    Swift::String v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    *(_DWORD *)Swift::String v20 = 136315138;
    uint64_t v31 = v27;
    swift_getMetatypeMetadata();
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v31 = sub_10000E724(v21, v22, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%s] startXPCListener() Waiting for incoming connections", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v23 = v28;
    uint64_t v24 = v29;
  }
  else
  {

    uint64_t v23 = v7;
    uint64_t v24 = v3;
  }
  return ((uint64_t (*)(char *, uint64_t))v16)(v23, v24);
}

uint64_t sub_100015914()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v29 - v8;
  static Logger.daemon.getter();
  Swift::String v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v29[1] = v1;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v31 = v7;
    id v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v30 = v3;
    *(void *)&long long v32 = v14;
    *(_DWORD *)id v13 = 136315138;
    v34[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    v34[0] = sub_10000E724(v15, v16, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s] enqueueStartupOperations()", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v30;
    swift_slowDealloc();
    uint64_t v7 = v31;
    swift_slowDealloc();
  }

  uint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  v17(v9, v3);
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v33)
  {
    sub_10000A908(&v32, (uint64_t)v34);
    sub_10000C49C(0, &qword_1000462C0);
    Swift::String v18 = (void *)static NSOperationQueue.utility.getter();
    sub_1000057EC(v34, v34[3]);
    dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
    id v19 = objc_allocWithZone((Class)type metadata accessor for HealthExperienceStoreCleanupOperation());
    Swift::String v20 = (void *)HealthExperienceStoreCleanupOperation.init(context:)();
    [v18 addOperation:v20];

    return sub_10000E7F8((uint64_t)v34);
  }
  else
  {
    sub_10001727C((uint64_t)&v32);
    static Logger.daemon.getter();
    unint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v30 = v4;
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v31 = v7;
      *(void *)&long long v32 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      v34[0] = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v26 = String.init<A>(describing:)();
      v34[0] = sub_10000E724(v26, v27, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%s]: enqueueCleanOperations() oracle doesn't have a store, not running", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v28 = v31;
    }
    else
    {

      uint64_t v28 = v7;
    }
    return ((uint64_t (*)(char *, uint64_t))v17)(v28, v3);
  }
}

uint64_t sub_100015D3C(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  if (v7)
  {
    swift_errorRetain();
    static Logger.general.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v11 = _typeName(_:qualified:)();
      uint64_t v15 = sub_10000E724(v11, v12, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      uint64_t v15 = v7;
      swift_errorRetain();
      sub_10000EC10(0, &qword_100045F48);
      uint64_t v13 = String.init<A>(describing:)();
      uint64_t v15 = sub_10000E724(v13, v14, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s Could not remove plugin feed item notifications. %{public}s", (uint8_t *)v10, 0x16u);
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
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_100015FD4()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.general.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = v14;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v7 = _typeName(_:qualified:)();
    uint64_t v15 = sub_10000E724(v7, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    type metadata accessor for PluginFeedItem.NotificationIdentifier();
    swift_bridgeObjectRetain();
    uint64_t v9 = Array.description.getter();
    uint64_t v13 = v0;
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_10000E724(v9, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s Removed all plugin feed item notification identifiers: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v13);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

uint64_t sub_100016258()
{
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (!v3) {
    return sub_10001727C((uint64_t)v2);
  }
  sub_10000EC10(0, (unint64_t *)&qword_1000460C0);
  type metadata accessor for DiskHealthExperienceStore();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    sub_1000173A4(&qword_1000462B8, v1, (void (*)(uint64_t))type metadata accessor for DaemonLifecycleManager);
    dispatch thunk of DiskHealthExperienceStore.register(observer:)();
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for DaemonLifecycleManager()
{
  return self;
}

uint64_t sub_1000163A4(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  sub_100017218(0, &qword_1000462A8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v3 - 8);
  os_log_type_t v5 = (char *)v40 - v4;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  int64_t v44 = (char *)v40 - v11;
  if (!a1 || (unint64_t v12 = (unint64_t)sub_1000169B0(a1)) == 0)
  {
    static Logger.daemon.getter();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v43 = v6;
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 136315138;
      uint64_t v46 = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v28 = String.init<A>(describing:)();
      uint64_t v46 = sub_10000E724(v28, v29, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%s]: unable to cast to uninstalled apps to LSApplicationProxy", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v43);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  unint64_t v13 = v12;
  if (v12 >> 62) {
    goto LABEL_32;
  }
  uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v14) {
    goto LABEL_28;
  }
  do
  {
    v40[1] = ObjectType;
    id v41 = v5;
    uint64_t v42 = v7;
    uint64_t v43 = v6;
    uint64_t ObjectType = kHKHealthAppBundleIdentifier;
    uint64_t v6 = 4;
    while (1)
    {
      id v15 = (v13 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
          : *(id *)(v13 + 8 * v6);
      uint64_t v16 = v15;
      os_log_type_t v5 = (char *)(v6 - 3);
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v17 = [v15 bundleIdentifier];
      if (!v17)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_7:

        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      Swift::String v18 = v17;
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v20;

      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      if (!v7) {
        goto LABEL_7;
      }
      if (v19 == v21 && v7 == v22)
      {
        swift_bridgeObjectRelease_n();
LABEL_25:
        id v31 = [self sharedBehavior];
        if (v31)
        {
          long long v32 = v31;
          unsigned int v33 = [v31 healthAppHiddenOrNotInstalled];

          if (!v33)
          {

            goto LABEL_28;
          }
        }
        else
        {
          __break(1u);
        }
        static Logger.daemon.getter();
        unint64_t v34 = Logger.logObject.getter();
        os_log_type_t v35 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v34, v35))
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          uint64_t v46 = swift_slowAlloc();
          *(_DWORD *)uint64_t v36 = 136315138;
          uint64_t v37 = sub_10000EA64();
          uint64_t v45 = sub_10000E724(v37, v38, &v46);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%s]: health app is not installed. wiping and exiting.", v36, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v43);
        uint64_t v39 = type metadata accessor for URL();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v41, 1, 1, v39);
        type metadata accessor for DiskHealthExperienceStore();
        swift_allocObject();
        DiskHealthExperienceStore.init(overrideStoreLocation:observeExternalChanges:)();
        dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()();
        swift_release();
        exit(0);
      }
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_25;
      }

LABEL_8:
      ++v6;
      if (v5 == (char *)v14) {
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  while (v14);
LABEL_28:

  return swift_bridgeObjectRelease();
}

void *sub_1000169B0(uint64_t a1)
{
  uint64_t v6 = _swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_10000E848(i, (uint64_t)v5);
    sub_10000C49C(0, &qword_1000462B0);
    if (!swift_dynamicCast()) {
      break;
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_100016B40()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  os_log_type_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = ObjectType;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v12 = sub_10000E724(v8, v9, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%s]: debuggingInfoRequested()", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100016D40(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = type metadata accessor for Notification();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a1;
  a4();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_100016E2C()
{
  uint64_t v0 = (void *)HKPreferredRegulatoryDomainProvider();

  return v0;
}

uint64_t sub_100016E58()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.general.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v14 = v1;
    uint64_t v9 = swift_slowAlloc();
    uint64_t v15 = ObjectType;
    id v10 = (uint8_t *)v9;
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)id v10 = 136315138;
    uint64_t v11 = _typeName(_:qualified:)();
    uint64_t v16 = sub_10000E724(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s Removing all plugin feed item notifications", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t ObjectType = v15;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v17 = dispatch thunk of HealthAppNotificationManager.removeAllPluginFeedItemNotifications()();
  *(void *)(swift_allocObject() + 16) = ObjectType;
  *(void *)(swift_allocObject() + 16) = ObjectType;
  sub_100017168();
  sub_1000173A4(&qword_1000462A0, 255, (void (*)(uint64_t))sub_100017168);
  Publisher.retainingSink(receiveCompletion:receiveValue:)();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100017138()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017148(uint64_t *a1)
{
  return sub_100015D3C(a1);
}

uint64_t sub_100017150()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017160()
{
  return sub_100015FD4();
}

void sub_100017168()
{
  if (!qword_100046290)
  {
    sub_100017218(255, &qword_100046298, (uint64_t (*)(uint64_t))&type metadata accessor for PluginFeedItem.NotificationIdentifier, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    sub_10000EC10(255, &qword_100045F48);
    unint64_t v0 = type metadata accessor for AnyPublisher();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046290);
    }
  }
}

void sub_100017218(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10001727C(uint64_t a1)
{
  sub_100017304(0, &qword_100046188, (unint64_t *)&qword_1000460C0, (uint64_t)&protocol descriptor for HealthExperienceStore, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100017304(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_10000EC10(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

unint64_t sub_10001736C()
{
  unint64_t result = qword_1000462C8;
  if (!qword_1000462C8)
  {
    type metadata accessor for DaemonLifecycleManager();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000462C8);
  }
  return result;
}

uint64_t sub_1000173A4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1000173EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000173FC(uint64_t a1)
{
  sub_100014DB0(a1, *(void *)(v1 + 16));
}

id sub_100017404()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v34 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v34 - 8);
  uint64_t v4 = __chkstk_darwin(v34);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v32 - v7;
  static Logger.daemon.getter();
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v33 = v2;
  if (v11)
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    v35[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    long long v32 = v12 + 4;
    uint64_t v36 = v2;
    swift_getMetatypeMetadata();
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v36 = sub_10000E724(v13, v14, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%s] start() Starting", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v8, v34);
  uint64_t v16 = v1[10];
  id result = [self defaultWorkspace];
  if (result)
  {
    uint64_t v19 = result;
    [result addObserver:v16];

    sub_100015574();
    sub_100015914();
    sub_100018634();
    uint64_t v20 = swift_allocObject();
    uint64_t v21 = v33;
    *(void *)(v20 + 16) = v1;
    *(void *)(v20 + 24) = v21;
    swift_retain();
    OrchestrationDirector.start(completion:)();
    swift_release();
    OrchestrationDirector.environment.getter();
    sub_10001B2F0(&qword_100046400, v22, (void (*)(uint64_t))type metadata accessor for HealthAppDaemonCoordinator);
    EnvironmentalStateManager.register(observer:)();
    swift_release();
    OrchestrationDirector.environment.getter();
    os_log_type_t v23 = (void *)EnvironmentalStateManager.currentState.getter();
    swift_release();
    v24._rawValue = v23;
    sub_100005830(v24);
    swift_bridgeObjectRelease();
    uint64_t v25 = (os_unfair_lock_s *)v1[13];
    swift_retain();
    os_unfair_lock_lock(v25 + 14);
    sub_10001B008((uint64_t)&v25[4]);
    os_unfair_lock_unlock(v25 + 14);
    swift_release();
    [(id)v1[12] resume];
    id v26 = [self mainRunLoop];
    [v26 run];

    static Logger.daemon.getter();
    unint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = (uint8_t *)swift_slowAlloc();
      v35[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v29 = 136315138;
      uint64_t v36 = v21;
      swift_getMetatypeMetadata();
      uint64_t v33 = v3;
      uint64_t v30 = String.init<A>(describing:)();
      uint64_t v36 = sub_10000E724(v30, v31, v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%s] start() Shutdown", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (id)((uint64_t (*)(char *, uint64_t))v15)(v6, v34);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100017954(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v83 = a8;
  uint64_t v87 = a7;
  uint64_t v88 = a4;
  uint64_t v85 = a6;
  uint64_t v86 = a2;
  unint64_t v75 = a3;
  *(void *)&long long v81 = *v8;
  uint64_t v11 = type metadata accessor for DispatchTimeInterval();
  uint64_t v76 = *(void *)(v11 - 8);
  uint64_t v77 = v11;
  __chkstk_darwin(v11);
  uint64_t v78 = (void *)((char *)v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v73 = *(void *)(v13 - 8);
  uint64_t v74 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Logger();
  __chkstk_darwin(v16 - 8);
  uint64_t v80 = (char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  sub_10001B1D4();
  uint64_t v19 = swift_allocObject();
  *(_DWORD *)(v19 + 56) = 0;
  *(_WORD *)(v19 + 16) = 256;
  *(unsigned char *)(v19 + 18) = 0;
  *(void *)(v19 + 32) = 0;
  *(void *)(v19 + 40) = 0;
  *(void *)(v19 + 24) = 0;
  *(CFAbsoluteTime *)(v19 + 48) = Current;
  v8[13] = v19;
  v8[2] = a1;
  uint64_t v84 = v8;
  v8[8] = a5;
  uint64_t v20 = type metadata accessor for BuiltinProvider();
  swift_allocObject();
  swift_retain();
  id v21 = a5;
  uint64_t v22 = BuiltinProvider.init()();
  uint64_t v23 = type metadata accessor for HealthKitProvider();
  swift_allocObject();
  Swift::OpaquePointer v24 = (uint64_t (*)(uint64_t, uint64_t))HealthKitProvider.init()();
  sub_10000EC10(0, &qword_100046418);
  uint64_t v89 = a1;
  uint64_t v25 = v82;
  uint64_t v26 = HealthAppPluginSource.conformingPlugins<A>(_:)();
  if (v25)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

    swift_release();
    os_log_type_t v28 = v84;
    uint64_t v27 = v85;
    uint64_t v29 = v88;
LABEL_6:
    sub_10000E7F8(v27);
    sub_10000E7F8(v29);
    swift_release();

    swift_release();
    swift_deallocPartialClassInstance();
    return v28;
  }
  uint64_t v30 = (void *)v26;
  uint64_t v68 = v15;
  id v71 = v21;
  static Logger.orchestration.getter();
  type metadata accessor for EnvironmentalStateManager();
  swift_allocObject();
  uint64_t v82 = 0;
  uint64_t v31 = EnvironmentalStateManager.init(logger:)();
  uint64_t v70 = (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage;
  sub_10001AF44(0, &qword_100046420, &qword_100046418, (uint64_t)&protocol descriptor for EnvironmentalStateComponentProvider, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v32 = v22;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000386F0;
  *(void *)(inited + 56) = v20;
  *(void *)(inited + 64) = &protocol witness table for BuiltinProvider;
  *(void *)(inited + 32) = v32;
  uint64_t v79 = v32;
  *(void *)(inited + 96) = v23;
  id v69 = (void (*)(uint64_t))&type metadata accessor for HealthKitProvider;
  *(void *)(inited + 104) = sub_10001B2F0(&qword_100046428, 255, (void (*)(uint64_t))&type metadata accessor for HealthKitProvider);
  *(void *)(inited + 72) = v24;
  v90[0]._rawValue = v30;
  swift_retain();
  swift_retain();
  sub_10002E9A4(inited);
  EnvironmentalStateManager.start(providers:)(v90[0]);
  swift_bridgeObjectRelease();
  uint64_t v34 = type metadata accessor for LegacyGenerationProvider();
  swift_allocObject();
  swift_retain();
  uint64_t v72 = v31;
  uint64_t v35 = LegacyGenerationProvider.init(environmentalState:)();
  sub_10001AF44(0, &qword_100046430, &qword_100046438, (uint64_t)&protocol descriptor for InputSignalProvider, v70);
  uint64_t v36 = swift_initStackObject();
  *(void *)(v36 + 32) = v79;
  *(_OWORD *)(v36 + 16) = xmmword_100038700;
  *(void *)(v36 + 56) = v20;
  *(void *)(v36 + 64) = &protocol witness table for BuiltinProvider;
  uint64_t v37 = v35;
  *(void *)(v36 + 96) = v23;
  *(void *)(v36 + 104) = sub_10001B2F0(&qword_100046440, 255, v69);
  *(void *)(v36 + 72) = v24;
  *(void *)(v36 + 136) = v34;
  *(void *)(v36 + 144) = sub_10001B2F0(&qword_100046448, 255, (void (*)(uint64_t))&type metadata accessor for LegacyGenerationProvider);
  *(void *)(v36 + 112) = v35;
  sub_10000EC10(0, &qword_100046438);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v38 = v82;
  uint64_t v39 = (void *)HealthAppPluginSource.conformingPlugins<A>(_:)();
  if (v38)
  {
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

    swift_release();
    uint64_t v29 = v88;
    os_log_type_t v28 = v84;
    uint64_t v27 = v85;
    goto LABEL_6;
  }
  uint64_t v70 = v24;
  v90[0]._rawValue = v39;
  sub_10002E7EC(v36);
  rawValue = v90[0]._rawValue;
  sub_10000EC10(0, &qword_100045F50);
  uint64_t v41 = HealthAppPluginSource.conformingPlugins<A>(_:)();
  os_log_type_t v28 = v84;
  uint64_t v82 = 0;
  uint64_t v43 = (void *)v41;
  sub_10001AF44(0, &qword_100046450, &qword_100045F50, (uint64_t)&protocol descriptor for ExecutorProvider, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v44 = swift_initStackObject();
  long long v81 = xmmword_100038710;
  *(_OWORD *)(v44 + 16) = xmmword_100038710;
  *(void *)(v44 + 56) = v34;
  *(void *)(v44 + 64) = sub_10001B2F0(&qword_100046458, 255, (void (*)(uint64_t))&type metadata accessor for LegacyGenerationProvider);
  v67[2] = v37;
  *(void *)(v44 + 32) = v37;
  v90[0]._rawValue = v43;
  swift_retain();
  sub_10002E7D0(v44);
  id v69 = (void (*)(uint64_t))v90[0]._rawValue;
  sub_10000A884(v88, (uint64_t)v90);
  swift_retain();
  swift_unknownObjectRetain();
  static Logger.orchestration.getter();
  v67[1] = rawValue;
  uint64_t v45 = v68;
  UUID.init()();
  uint64_t v46 = UUID.uuidString.getter();
  unint64_t v48 = v47;
  (*(void (**)(char *, uint64_t))(v73 + 8))(v45, v74);
  sub_10001B234(5, v46, v48);
  swift_bridgeObjectRelease();
  static String._fromSubstring(_:)();
  swift_bridgeObjectRelease();
  type metadata accessor for OrchestrationDirector();
  swift_allocObject();
  v28[3] = OrchestrationDirector.init(environment:inputSignalProviders:executorProviders:contextProvider:dispatcher:logger:debugIdentifier:)();
  uint64_t v49 = type metadata accessor for OrchestrationWorkQueueStatusObserver();
  swift_allocObject();
  uint64_t v50 = (void *)OrchestrationWorkQueueStatusObserver.init()();
  v28[6] = v50;
  uint64_t v91 = (ValueMetadata *)v49;
  unint64_t v92 = sub_10001B2F0(&qword_100046460, 255, (void (*)(uint64_t))&type metadata accessor for OrchestrationWorkQueueStatusObserver);
  v90[0]._rawValue = v50;
  swift_retain();
  OrchestrationDirector.statusObserver.setter();
  id v51 = v83;
  v28[12] = v83;
  type metadata accessor for AutoPauseController();
  swift_allocObject();
  swift_retain();
  id v83 = v51;
  swift_retain();
  v28[4] = AutoPauseController.init(target:paused:environment:)();
  sub_100004EE0(0, &qword_100046468, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentalStateDescription, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v80 = v52;
  uint64_t v53 = *(void *)(type metadata accessor for EnvironmentalStateDescription() - 8);
  unint64_t v75 = ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))
      + *(void *)(v53 + 72);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = v81;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  static EnvironmentalStateDescription.appSuspended(bundleIdentifier:)();
  swift_bridgeObjectRelease();
  AutoPauseController.pauseIfAnyMatches(descriptions:)((Swift::OpaquePointer)v54);
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for AutoPriorityThresholdController();
  swift_allocObject();
  swift_retain();
  swift_retain();
  v28[5] = AutoPriorityThresholdController.init(target:environment:)();
  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = v81;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  static EnvironmentalStateDescription.appSuspended(bundleIdentifier:)();
  swift_bridgeObjectRelease();
  AutoPriorityThresholdController.autoUpdatePriorityThreshold(pauseIfAnyMatches:)((Swift::OpaquePointer)v55);
  swift_release();
  swift_bridgeObjectRelease();
  unint64_t v56 = (void *)v28[3];
  type metadata accessor for OrchestrationRetryManager();
  swift_allocObject();
  swift_retain();
  v28[7] = OrchestrationRetryManager.init(director:)();
  id v58 = objc_allocWithZone((Class)type metadata accessor for DaemonLifecycleManager());
  id v59 = v71;
  uint64_t v60 = v87;
  swift_retain();
  uint64_t v61 = sub_100014214(v59, v60);
  v28[10] = v61;
  uint64_t v91 = &type metadata for WorkRunner;
  unint64_t v92 = sub_10001B338();
  v90[0]._rawValue = v56;
  v90[1]._rawValue = v61;
  uint64_t v62 = v77;
  id v63 = v78;
  *uint64_t v78 = 6;
  (*(void (**)(void *, void, uint64_t))(v76 + 104))(v63, enum case for DispatchTimeInterval.seconds(_:), v62);
  type metadata accessor for HealthAppForegroundWorkManager();
  swift_allocObject();
  swift_retain_n();
  uint64_t v64 = v61;
  v28[11] = HealthAppForegroundWorkManager.init(workRunner:urgentWorkTimeoutInterval:)();
  uint64_t v65 = v85;
  sub_10000A884(v85, (uint64_t)v90);
  type metadata accessor for PinnedContentStateFeedItemCacheObserver();
  swift_allocObject();
  uint64_t v66 = PinnedContentStateFeedItemCacheObserver.init(pinnedContentManager:storeOracle:)();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  sub_10000E7F8(v65);
  sub_10000E7F8(v88);
  v28[9] = v66;
  return v28;
}

void sub_100018634()
{
  uint64_t v1 = *v0;
  id v2 = [self sharedScheduler];
  NSString v3 = String._bridgeToObjectiveC()();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v1;
  v7[4] = sub_10001B094;
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  void v7[2] = sub_10001A300;
  v7[3] = &unk_100041DC0;
  uint64_t v6 = _Block_copy(v7);
  swift_release();
  [v2 registerForTaskWithIdentifier:v3 usingQueue:0 launchHandler:v6];
  _Block_release(v6);
}

void sub_1000187AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(os_unfair_lock_s **)(a1 + 104);
  swift_retain();
  os_unfair_lock_lock(v8 + 14);
  sub_100018A30((uint64_t)&v8[4], (double *)&v19);
  os_unfair_lock_unlock(v8 + 14);
  double v9 = *(double *)&v19;
  swift_release();
  double v10 = CFAbsoluteTimeGetCurrent() - v9;
  static Logger.daemon.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v17 = v4;
    uint64_t v18 = v14;
    uint64_t v19 = a2;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    uint64_t v19 = sub_10000E724(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2048;
    uint64_t v19 = *(void *)&v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%s] start() Initial orchestration run complete after %fs", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  OrchestrationWorkQueueStatusObserver.didFinishStartup(latency:)(v10);
  HealthAppForegroundWorkManager.start()();
}

double sub_100018A30@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  *(unsigned char *)a1 = 1;
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

void sub_100018A44(uint64_t a1, uint64_t a2)
{
  NSString v3 = *(void **)(a2 + 96);
  sub_10001B2F0(&qword_100046408, a2, (void (*)(uint64_t))type metadata accessor for HealthAppDaemonCoordinator);
  id v4 = objc_allocWithZone((Class)type metadata accessor for HealthAppOrchestrationListener());
  id v5 = v3;
  swift_retain();
  uint64_t v6 = HealthAppOrchestrationListener.init(listener:coordinator:)();

  *(void *)(a1 + 24) = v6;
}

id *sub_100018B00()
{
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

uint64_t sub_100018B78()
{
  sub_100018B00();

  return _swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for HealthAppDaemonCoordinator()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for HealthAppDaemonCoordinator.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for HealthAppDaemonCoordinator.State(uint64_t a1)
{
}

uint64_t initializeWithCopy for HealthAppDaemonCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for HealthAppDaemonCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  id v6 = v5;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for HealthAppDaemonCoordinator.State(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HealthAppDaemonCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthAppDaemonCoordinator.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthAppDaemonCoordinator.State(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthAppDaemonCoordinator.State()
{
  return &type metadata for HealthAppDaemonCoordinator.State;
}

uint64_t sub_100018E0C()
{
  return 1;
}

Swift::Int sub_100018E14()
{
  return Hasher._finalize()();
}

void sub_100018E58()
{
}

Swift::Int sub_100018E80()
{
  return Hasher._finalize()();
}

uint64_t sub_100018ED0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  int v34 = a2;
  uint64_t v10 = *v5;
  uint64_t v35 = a3;
  uint64_t v36 = v10;
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v31 = a4;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = v14;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v32 = a1;
    uint64_t v38 = v22;
    uint64_t v33 = a5;
    *(_DWORD *)id v21 = 136446210;
    uint64_t v29 = v21 + 4;
    uint64_t v23 = _typeName(_:qualified:)();
    uint64_t v37 = sub_10000E724(v23, v24, &v38);
    a5 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    a4 = v31;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%{public}s] Ensuring orchestration is done processing work before starting legacy background generation.", v21, 0xCu);
    swift_arrayDestroy();
    a1 = v32;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  static PriorityRuleSet.Priority.lowestPriority.getter();
  uint64_t v25 = type metadata accessor for PriorityRuleSet.Priority();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v13, 0, 1, v25);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v6;
  *(void *)(v26 + 24) = a1;
  *(unsigned char *)(v26 + 32) = v34 & 1;
  *(void *)(v26 + 40) = v35;
  *(void *)(v26 + 48) = a4;
  uint64_t v27 = v36;
  *(void *)(v26 + 56) = a5;
  *(void *)(v26 + 64) = v27;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)();
  swift_release();
  return sub_100004F44((uint64_t)v13);
}

uint64_t sub_100019250(uint64_t a1, void *a2, int a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  unint64_t v40 = a5;
  uint64_t v41 = a6;
  uint64_t v39 = a4;
  int v37 = a3;
  uint64_t v36 = a2;
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v42 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v38 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v34 = a1;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v35 = v7;
    uint64_t v44 = v17;
    *(_DWORD *)uint64_t v16 = 136446210;
    uint64_t v18 = _typeName(_:qualified:)();
    uint64_t v43 = sub_10000E724(v18, v19, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}s] Orchestration done processing work, starting legacy background generation.", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v7 = v35;
    swift_slowDealloc();
    a1 = v34;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v20 = *(void *)(*(void *)(a1 + 80) + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener);
  id v21 = *(void **)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle);
  uint64_t v22 = *(void *)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle);
  uint64_t v23 = *(void *)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle);
  uint64_t v24 = *(void *)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle);
  uint64_t v25 = *(void *)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager);
  uint64_t v26 = *(void *)(v20 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities);
  objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
  id v27 = v21;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v28 = sub_1000077A4(v27, v22, v23, v24, v25, v26);
  uint64_t v29 = (uint64_t)v38;
  static DateInterval.allTimeInterval.getter();
  if (v36) {
    uint64_t v30 = v36;
  }
  else {
    uint64_t v30 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  id v31 = sub_10001CEE0(v29, (uint64_t)v30, v37 & 1, v39, v40, v41);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v29, v7);
}

void sub_10001960C(void (*a1)(char *, uint64_t))
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 80) + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener);
  int v4 = *(void **)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle);
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle);
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle);
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager);
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities);
  id v10 = objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
  id v11 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v12 = sub_1000077A4(v11, v5, v6, v7, v8, v9);
  sub_100023FD0(a1);
}

void sub_100019744(uint64_t (*a1)(void), char *a2)
{
  uint64_t v5 = *(void *)(*(void *)(v2 + 80) + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener);
  uint64_t v6 = *(void **)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle);
  uint64_t v7 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle);
  uint64_t v8 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle);
  uint64_t v9 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle);
  uint64_t v10 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager);
  uint64_t v11 = *(void *)(v5 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities);
  id v12 = objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
  id v13 = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v14 = sub_1000077A4(v13, v7, v8, v9, v10, v11);
  sub_1000223C0(a1, a2);
}

uint64_t sub_10001988C(void (*a1)(void))
{
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v5)
  {
    sub_10000EC10(0, (unint64_t *)&qword_1000460C0);
    type metadata accessor for DiskHealthExperienceStore();
    if (swift_dynamicCast())
    {
      dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()();
      ((void (*)(void))a1)(0);
      exit(0);
    }
  }
  else
  {
    sub_10001727C((uint64_t)v4);
  }
  sub_10001AFAC();
  swift_allocError();
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  a1();

  return swift_errorRelease();
}

uint64_t sub_100019984()
{
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v5 - v1;
  uint64_t v3 = type metadata accessor for PriorityRuleSet.Priority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)();
  return sub_100004F44((uint64_t)v2);
}

uint64_t sub_100019A80()
{
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v5 - v1;
  uint64_t v3 = type metadata accessor for PriorityRuleSet.Priority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  OrchestrationDirector.recheckFailedTriggers(priorityThresholdOverride:barrier:)();
  return sub_100004F44((uint64_t)v2);
}

uint64_t sub_100019B7C()
{
  OrchestrationDirector.debugSnapshot.getter();
  uint64_t v0 = DebugSnapshot.description.getter();
  swift_release();
  return v0;
}

uint64_t sub_100019BC8()
{
  return OrchestrationDirector.orchestrationGraph()();
}

void sub_100019BF0()
{
}

void sub_100019C50()
{
}

void sub_100019C6C()
{
}

uint64_t sub_100019C8C()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100019CC4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    static Logger.daemon.getter();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v17 = a1;
      id v13 = (uint8_t *)v12;
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)id v13 = 136315138;
      v16[1] = v13 + 4;
      uint64_t v19 = a3;
      swift_getMetatypeMetadata();
      uint64_t v14 = String.init<A>(describing:)();
      uint64_t v19 = sub_10000E724(v14, v15, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s] Background generation fired.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a1 = v17;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_100019EF8(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_100019EF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  sub_100004EE0(0, &qword_1000463F0, (uint64_t (*)(uint64_t))&type metadata accessor for PriorityRuleSet.Priority, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v26 - v6;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v4;
  aBlock[4] = (uint64_t)sub_10001B0D4;
  aBlock[5] = v12;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100010A84;
  aBlock[3] = (uint64_t)&unk_100041E10;
  id v13 = _Block_copy(aBlock);
  id v14 = a1;
  swift_release();
  [v14 setExpirationHandler:v13];
  _Block_release(v13);
  static Logger.daemon.getter();
  unint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v30 = v4;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = v8;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v27 = v9;
    aBlock[0] = v19;
    *(_DWORD *)uint64_t v18 = 136446210;
    id v29 = v14;
    uint64_t v20 = _typeName(_:qualified:)();
    uint64_t v31 = sub_10000E724(v20, v21, aBlock);
    id v14 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v4 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s] Ensuring orchestration is done processing work before starting legacy background generation.", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v22 = type metadata accessor for PriorityRuleSet.Priority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v7, 1, 1, v22);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = v2;
  v23[3] = v14;
  v23[4] = v4;
  id v24 = v14;
  swift_retain();
  OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)();
  swift_release();
  return sub_100004F44((uint64_t)v7);
}

void sub_10001A300(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10001A368(void *a1, uint64_t a2)
{
  int v37 = a1;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v41 = v3;
  __chkstk_darwin(v3);
  uint64_t v39 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  __chkstk_darwin(v5);
  uint64_t v33 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v31);
  uint64_t v32 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for DispatchQoS();
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  id v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v29 = v10;
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = a2;
    aBlock[0] = v17;
    *(_DWORD *)os_log_type_t v16 = 136446210;
    uint64_t v18 = _typeName(_:qualified:)();
    uint64_t v42 = (void *)sub_10000E724(v18, v19, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%{public}s] Background generation expired.", v16, 0xCu);
    swift_arrayDestroy();
    a2 = v30;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_10001B128();
  _typeName(_:qualified:)();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10001B2F0(&qword_1000462E0, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004EE0(0, &qword_1000462E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10001B170((unint64_t *)&qword_1000462F0, &qword_1000462E8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v35);
  uint64_t v20 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v37;
  *(void *)(v21 + 16) = v37;
  *(void *)(v21 + 24) = a2;
  aBlock[4] = (uint64_t)sub_10001B168;
  aBlock[5] = v21;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100010A84;
  aBlock[3] = (uint64_t)&unk_100041E88;
  uint64_t v23 = _Block_copy(aBlock);
  id v24 = v22;
  static DispatchQoS.unspecified.getter();
  uint64_t v42 = &_swiftEmptyArrayStorage;
  sub_10001B2F0(&qword_100045F78, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004EE0(0, (unint64_t *)&qword_100045F80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_10001B170(&qword_100045F88, (unint64_t *)&qword_100045F80, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v25 = v39;
  uint64_t v26 = v41;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v40 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v38);
  return swift_release();
}

uint64_t sub_10001A9FC(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = 0;
  if ([a1 setTaskExpiredWithRetryAfter:&v18 error:60.0])
  {
    return _objc_retain_x1();
  }
  else
  {
    uint64_t v16 = (uint64_t)v18;
    id v6 = v18;
    uint64_t v7 = _convertNSErrorToError(_:)();

    swift_willThrow();
    static Logger.daemon.getter();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v16 = v7;
      uint64_t v11 = (uint8_t *)v10;
      id v18 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136446210;
      os_log_type_t v15 = v11 + 4;
      uint64_t v12 = _typeName(_:qualified:)();
      uint64_t v17 = sub_10000E724(v12, v13, (uint64_t *)&v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] Failed to retry after background generation expired. Setting task as completed.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [a1 setTaskCompleted];
    return swift_errorRelease();
  }
}

id sub_10001ACC0(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v16 = a2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = a1;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = _typeName(_:qualified:)();
    uint64_t v17 = sub_10000E724(v12, v13, &v18);
    a2 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] Orchestration done processing work, starting legacy background generation.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_retain();
  sub_100011140();
  swift_release();
  return [a2 setTaskCompleted];
}

uint64_t sub_10001AEE8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001AF30()
{
  return sub_100019250(*(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(void *)(v0 + 40), *(void (**)(void))(v0 + 48), *(void *)(v0 + 56));
}

void sub_10001AF44(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_10000EC10(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

unint64_t sub_10001AFAC()
{
  unint64_t result = qword_1000463F8;
  if (!qword_1000463F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000463F8);
  }
  return result;
}

void sub_10001B000()
{
  sub_1000187AC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10001B008(uint64_t a1)
{
  sub_100018A44(a1, v1);
}

uint64_t sub_10001B024()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001B05C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B094(void *a1)
{
  return sub_100019CC4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001B09C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001B0D4()
{
  return sub_10001A368(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001B0DC()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_10001B11C()
{
  return sub_10001ACC0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_10001B128()
{
  unint64_t result = qword_100045F40;
  if (!qword_100045F40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100045F40);
  }
  return result;
}

uint64_t sub_10001B168()
{
  return sub_10001A9FC(*(void **)(v0 + 16));
}

uint64_t sub_10001B170(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004EE0(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10001B1D4()
{
  if (!qword_100046410)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = type metadata accessor for ManagedBuffer();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046410);
    }
  }
}

uint64_t sub_10001B234(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return String.subscript.getter();
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v4 = String.index(_:offsetBy:limitedBy:)();
  if (v5) {
    unint64_t v4 = 15;
  }
  if (4 * v3 < v4 >> 14) {
    goto LABEL_12;
  }

  return String.subscript.getter();
}

uint64_t sub_10001B2F0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_10001B338()
{
  unint64_t result = qword_100046470;
  if (!qword_100046470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046470);
  }
  return result;
}

void destroy for WorkRunner(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for WorkRunner(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  unint64_t v4 = (void *)a2[1];
  char v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

__n128 initializeWithTake for WorkRunner(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for WorkRunner(uint64_t a1, _OWORD *a2)
{
  swift_release();
  unint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for WorkRunner(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WorkRunner(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WorkRunner()
{
  return &type metadata for WorkRunner;
}

uint64_t getEnumTagSinglePayload for HealthAppDaemonCoordinator.CacheError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for HealthAppDaemonCoordinator.CacheError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10001B5F8);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001B620()
{
  return 0;
}

ValueMetadata *type metadata accessor for HealthAppDaemonCoordinator.CacheError()
{
  return &type metadata for HealthAppDaemonCoordinator.CacheError;
}

unint64_t sub_10001B63C()
{
  unint64_t result = qword_100046478;
  if (!qword_100046478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046478);
  }
  return result;
}

uint64_t sub_10001B6AC()
{
  type metadata accessor for DaemonLongRunningProcessOracle();
  DebuggingResponder.deregisterForDebuggingRequests()();

  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for DaemonLongRunningProcessOracle()
{
  return self;
}

uint64_t sub_10001B728()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = v1;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v9 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%s]: debuggingInfoRequested()", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10001BA14()
{
  v0._countAndFlagsBits = 15420;
  v0._object = (void *)0xE200000000000000;
  String.append(_:)(v0);
  sub_10001BB5C();
  v1._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 32;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  _print_unlocked<A, B>(_:_:)();
  v3._countAndFlagsBits = 8224;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

uint64_t sub_10001BB38()
{
  return sub_10001BA14();
}

unint64_t sub_10001BB5C()
{
  unint64_t result = qword_100046548;
  if (!qword_100046548)
  {
    type metadata accessor for DaemonLongRunningProcessOracle();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100046548);
  }
  return result;
}

uint64_t sub_10001BB94()
{
  uint64_t v1 = OBJC_IVAR____TtC10healthappd23HealthPluginHostService____lazy_storage___healthWelcomeFlowSignalManager;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService____lazy_storage___healthWelcomeFlowSignalManager))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC10healthappd23HealthPluginHostService____lazy_storage___healthWelcomeFlowSignalManager);
  }
  else
  {
    uint64_t v2 = sub_10001BBFC(v0);
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_10001BBFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void **)(*(void *)(a1 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle) + 16);
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_countryOracle);
  uint64_t v15 = type metadata accessor for CountryOracle();
  uint64_t v16 = (void *)sub_10000C454(&qword_1000467F0, (void (*)(uint64_t))&type metadata accessor for CountryOracle);
  uint64_t v14 = v7;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for PluginAdvertisableFeatureSourceContext.DeviceSource.activePairedDevice(_:), v2);
  uint64_t v8 = type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory();
  swift_allocObject();
  id v9 = v6;
  swift_retain();
  uint64_t v10 = HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)();
  uint64_t v15 = v8;
  uint64_t v16 = &protocol witness table for HealthPluginAdvertisableFeatureManagerFactory;
  uint64_t v14 = v10;
  type metadata accessor for HealthWelcomeFlowSignalProvider();
  swift_allocObject();
  swift_retain();
  HealthWelcomeFlowSignalProvider.init()();
  v13[3] = type metadata accessor for CurrentOSUpdateDateProvider();
  v13[4] = (uint64_t)&protocol witness table for CurrentOSUpdateDateProvider;
  sub_100027048(v13);
  CurrentOSUpdateDateProvider.init()();
  type metadata accessor for HealthWelcomeFlowSignalManager();
  swift_allocObject();
  uint64_t v11 = HealthWelcomeFlowSignalManager.init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)();
  swift_release();
  return v11;
}

void sub_10001BE24(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  id v34 = [self interfaceWithProtocol:&OBJC_PROTOCOL___HealthPluginHostProtocol];
  id v3 = [v34 classesForSelector:"handleJournaledSharingEntries:completion:" argumentIndex:0 ofReply:0];
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v46 = v4;
  sub_10000C49C(0, &qword_1000467C8);
  *(void *)&long long aBlock = _swiftEmptyArrayStorage;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  sub_10000C49C(0, &qword_1000467D0);
  swift_getObjCClassFromMetadata();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  swift_getObjCClassFromMetadata();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if ((unint64_t)aBlock >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v5 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  id v6 = _swiftEmptyArrayStorage;
  uint64_t v32 = ObjectType;
  id v33 = a1;
  if (v5)
  {
    if (v5 < 1)
    {
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v7 = aBlock + 32;
    do
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v43 = 0;
        long long aBlock = 0u;
        long long v42 = 0u;
      }
      swift_unknownObjectRelease();
      if (*((void *)&v42 + 1))
      {
        long long v35 = aBlock;
        long long v37 = v42;
        uint64_t v39 = v43;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v6 = sub_10002B890(0, v6[2] + 1, 1, v6);
        }
        unint64_t v9 = v6[2];
        unint64_t v8 = v6[3];
        if (v9 >= v8 >> 1) {
          id v6 = sub_10002B890((void *)(v8 > 1), v9 + 1, 1, v6);
        }
        v6[2] = v9 + 1;
        uint64_t v10 = &v6[5 * v9];
        v10[8] = v39;
        *((_OWORD *)v10 + 2) = v35;
        *((_OWORD *)v10 + 3) = v37;
      }
      else
      {
        sub_1000277F4((uint64_t)&aBlock, &qword_1000467D8, (uint64_t)&type metadata for AnyHashable);
      }
      v7 += 8;
      --v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease_n();
  uint64_t v11 = sub_100030880((uint64_t)v6);
  swift_bridgeObjectRelease();
  sub_10001C6F4(v11);
  swift_bridgeObjectRetain();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  p_base_props = &FeedPopulationManagerOracle.base_props;
  [v34 setClasses:isa forSelector:"handleJournaledSharingEntries:completion:" argumentIndex:0 ofReply:0];

  id v14 = [v34 classesForSelector:"postNotificationWith:userInfo:" argumentIndex:1 ofReply:0];
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v45 = v15;
  sub_10000C49C(0, &qword_1000467E0);
  *(void *)&long long aBlock = _swiftEmptyArrayStorage;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  sub_10000C49C(0, &qword_1000467E8);
  swift_getObjCClassFromMetadata();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  swift_getObjCClassFromMetadata();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if (!((unint64_t)aBlock >> 62))
  {
    uint64_t v16 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16) {
      goto LABEL_26;
    }
LABEL_41:
    swift_bridgeObjectRelease_n();
    uint64_t v18 = _swiftEmptyArrayStorage;
LABEL_42:
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_100030880((uint64_t)v18);
    swift_bridgeObjectRelease();
    sub_10001C6F4(v22);
    Class v23 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v34, (SEL)p_base_props[235], v23, "postNotificationWith:userInfo:", 1, 0);

    [v33 setExportedInterface:v34];
    [v33 setExportedObject:v31];
    unsigned int v24 = [v33 processIdentifier];
    uint64_t v25 = swift_allocObject();
    *(_DWORD *)(v25 + 16) = v24;
    *(void *)(v25 + 24) = v31;
    *(void *)(v25 + 32) = v32;
    uint64_t v43 = sub_10002986C;
    uint64_t v44 = v25;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v42 = sub_100010A84;
    *((void *)&v42 + 1) = &unk_100042560;
    uint64_t v26 = _Block_copy(&aBlock);
    id v27 = v31;
    swift_release();
    [v33 setInvalidationHandler:v26];
    _Block_release(v26);
    uint64_t v28 = swift_allocObject();
    *(_DWORD *)(v28 + 16) = v24;
    *(void *)(v28 + 24) = v27;
    *(void *)(v28 + 32) = v32;
    uint64_t v43 = sub_100029894;
    uint64_t v44 = v28;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v42 = sub_100010A84;
    *((void *)&v42 + 1) = &unk_1000425B0;
    uint64_t v29 = _Block_copy(&aBlock);
    id v30 = v27;
    swift_release();
    [v33 setInterruptionHandler:v29];
    _Block_release(v29);
    [v33 resume];

    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
  if (!v16) {
    goto LABEL_41;
  }
LABEL_26:
  if (v16 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = _swiftEmptyArrayStorage;
    do
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v43 = 0;
        long long aBlock = 0u;
        long long v42 = 0u;
      }
      swift_unknownObjectRelease();
      if (*((void *)&v42 + 1))
      {
        long long v36 = aBlock;
        long long v38 = v42;
        uint64_t v40 = v43;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = sub_10002B890(0, v18[2] + 1, 1, v18);
        }
        unint64_t v20 = v18[2];
        unint64_t v19 = v18[3];
        if (v20 >= v19 >> 1) {
          uint64_t v18 = sub_10002B890((void *)(v19 > 1), v20 + 1, 1, v18);
        }
        v18[2] = v20 + 1;
        uint64_t v21 = &v18[5 * v20];
        v21[8] = v40;
        *((_OWORD *)v21 + 2) = v36;
        *((_OWORD *)v21 + 3) = v38;
      }
      else
      {
        sub_1000277F4((uint64_t)&aBlock, &qword_1000467D8, (uint64_t)&type metadata for AnyHashable);
      }
      ++v17;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease_n();
    p_base_props = (__objc2_prop_list **)(&FeedPopulationManagerOracle + 64);
    goto LABEL_42;
  }
LABEL_44:
  __break(1u);
}

uint64_t sub_10001C6F4(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_1000278B8(*(void *)(v1 + 48) + 40 * v9, (uint64_t)v16);
    v13[0] = v16[0];
    v13[1] = v16[1];
    uint64_t v14 = v17;
    sub_10002BE84((uint64_t)v15, (uint64_t)v13);
    unint64_t result = sub_100027864((uint64_t)v15);
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v7) {
    return swift_release();
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v7) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v3 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10001C878(int a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  int64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  unint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    int v19 = a1;
    uint64_t v14 = v13;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = a3;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v18 = a4;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    uint64_t v21 = sub_10000E724(v15, v16, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v21) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, v18, (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_10001CA98();
}

uint64_t sub_10001CA98()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.generation.getter();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v14[1] = v1;
    int64_t v10 = (uint8_t *)v9;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = ObjectType;
    *(_DWORD *)int64_t v10 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v16 = sub_10000E724(v11, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s] cancel()", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_retain();
  dispatch thunk of CancellableProgressList.cancelAll()();
  return swift_release();
}

void sub_10001CCAC()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001CA98();
  static Logger.generation.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = ObjectType;
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_getMetatypeMetadata();
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v11 = sub_10000E724(v8, v9, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v11 = sub_10000E724(0xD000000000000016, 0x8000000100039D60, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%s] %s, shutting down!", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  exit(0);
}

id sub_10001CEE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v7 = (void (**)(void, void))v6;
  uint64_t v131 = a6;
  v130 = a5;
  uint64_t v120 = a4;
  int v124 = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v126 = (void (*)(char *, char *, uint64_t))type metadata accessor for Logger();
  uint64_t v127 = (void (**)(void, void))*((void *)v126 - 1);
  uint64_t v9 = __chkstk_darwin(v126);
  uint64_t v11 = (char *)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v105 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v105 - v15;
  uint64_t v123 = type metadata accessor for GenerationWorkRequest();
  uint64_t v122 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  unint64_t v121 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for TransactionRecord();
  uint64_t v125 = *(void *)(v18 - 8);
  uint64_t v19 = *(void *)(v125 + 64);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  Class v23 = (char *)&v105 - v22;
  uint64_t v129 = *(void *)&v6[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_lock];
  dispatch thunk of UnfairLock.lock()();
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v135)
  {
    sub_10000A908(&v134, (uint64_t)&v136);
    sub_1000051A8();
    if (v24)
    {
      static Logger.daemon.getter();
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = swift_slowAlloc();
        *(void *)&long long v133 = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315650;
        *(void *)&long long v134 = ObjectType;
        swift_getMetatypeMetadata();
        uint64_t v28 = String.init<A>(describing:)();
        *(void *)&long long v134 = sub_10000E724(v28, v29, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        *(void *)&long long v134 = sub_10000E724(0xD000000000000061, 0x8000000100039CF0, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v27 + 22) = 2080;
        *(void *)&long long v134 = sub_10000E724(0xD000000000000032, 0x8000000100039B70, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%s] %s %s default is set - skipping work", (uint8_t *)v27, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      ((void (**)(char *, void (*)(char *, char *, uint64_t)))v127)[1](v14, v126);
      v130(0);
      id v30 = [self progressWithTotalUnitCount:0];
      goto LABEL_23;
    }
    if (*(void *)(a2 + 16))
    {
      uint64_t v37 = swift_bridgeObjectRetain();
      uint64_t v38 = sub_1000307A0(v37);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v38 = 0;
    }
    unint64_t v39 = sub_100027BF8(v38);
    if (v39 >> 62) {
      uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
    }
    else {
      uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v40)
    {
      swift_bridgeObjectRelease();
      static Logger.daemon.getter();
      swift_bridgeObjectRetain_n();
      id v71 = v6;
      uint64_t v72 = Logger.logObject.getter();
      os_log_type_t v73 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = swift_slowAlloc();
        uint64_t v125 = swift_slowAlloc();
        *(void *)&long long v133 = v125;
        *(_DWORD *)uint64_t v74 = 136315650;
        *(void *)&long long v134 = ObjectType;
        swift_getMetatypeMetadata();
        uint64_t v75 = String.init<A>(describing:)();
        *(void *)&long long v134 = sub_10000E724(v75, v76, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v74 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v77 = Array.description.getter();
        unint64_t v79 = v78;
        swift_bridgeObjectRelease();
        *(void *)&long long v134 = sub_10000E724(v77, v79, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v74 + 22) = 2080;
        uint64_t v80 = swift_bridgeObjectRetain();
        sub_10001E06C(v80);
        swift_bridgeObjectRelease();
        uint64_t v81 = Array.description.getter();
        unint64_t v83 = v82;
        swift_bridgeObjectRelease();
        *(void *)&long long v134 = sub_10000E724(v81, v83, (uint64_t *)&v133);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v72, v73, "[%s] failed to find plugin with identifiers %s, available plugins: %s", (uint8_t *)v74, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      ((void (**)(char *, void (*)(char *, char *, uint64_t)))v127)[1](v16, v126);
      v130(0);
      id v30 = [objc_allocWithZone((Class)NSProgress) init];
LABEL_23:
      id v36 = v30;
      sub_10000E7F8((uint64_t)&v136);
      goto LABEL_30;
    }
    uint64_t v115 = v38;
    id v41 = objc_retain(*(id *)(*(void *)&v6[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle]
                            + 16));
    uint64_t v42 = TransactionRecord.init(name:)();
    __chkstk_darwin(v42);
    swift_retain();
    TransactionManagedCache.fetchCachedOrCreate(for:using:)();
    swift_release();
    sub_10000A884((uint64_t)&v136, (uint64_t)&v133);
    sub_10000A884((uint64_t)&v134, (uint64_t)v132);
    uint64_t v43 = (void *)swift_allocObject();
    id v117 = v41;
    v43[2] = v41;
    sub_10000A908(&v133, (uint64_t)(v43 + 3));
    sub_10000A908(v132, (uint64_t)(v43 + 8));
    v114 = v43;
    uint64_t v44 = ObjectType;
    v43[13] = v7;
    v43[14] = v44;
    uint64_t v119 = v18;
    uint64_t v45 = v23;
    uint64_t v116 = v23;
    uint64_t v46 = v125;
    uint64_t v127 = v7;
    uint64_t v47 = v125 + 16;
    uint64_t v126 = *(void (**)(char *, char *, uint64_t))(v125 + 16);
    v126(v21, v45, v18);
    uint64_t v48 = *(unsigned __int8 *)(v46 + 80);
    uint64_t v49 = (v48 + 24) & ~v48;
    uint64_t v118 = v48 | 7;
    unint64_t v50 = (v19 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v110 = v50 + 16;
    unint64_t v51 = (v50 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v111 = v51 + 8;
    unint64_t v105 = v51;
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = v127;
    uint64_t v53 = *(void (**)(uint64_t, char *, uint64_t))(v46 + 32);
    v53(v52 + v49, v21, v119);
    uint64_t v54 = (void *)(v52 + v50);
    uint64_t v55 = v130;
    uint64_t v56 = v131;
    *uint64_t v54 = v130;
    v54[1] = v56;
    uint64_t v113 = v52;
    *(void *)(v52 + v51) = ObjectType;
    uint64_t v57 = v119;
    uint64_t v112 = v47;
    v126(v21, v116, v119);
    uint64_t v58 = swift_allocObject();
    *(void *)(v58 + 16) = v127;
    uint64_t v111 = v49;
    uint64_t v109 = v46 + 32;
    int v108 = v53;
    v53(v58 + v49, v21, v57);
    unint64_t v106 = v50;
    id v59 = (void *)(v58 + v50);
    *id v59 = v55;
    v59[1] = v56;
    *(void *)(v58 + v105) = ObjectType;
    uint64_t v107 = v21;
    if (v120 == 2)
    {
      id v63 = v127;
      uint64_t v84 = v127;
      swift_retain_n();
      id v85 = v117;
      uint64_t v86 = v84;
      uint64_t v67 = static GenerationPhase.allCases.getter();
    }
    else
    {
      if (v120 != 1)
      {
        id v60 = v117;
        uint64_t v61 = v116;
        uint64_t v62 = v119;
        id v63 = v127;
        if (v120)
        {
          Class v95 = v127;
          swift_retain_n();
          id v96 = v60;
          id v97 = v95;
          uint64_t v67 = static GenerationPhase.allCases.getter();
        }
        else
        {
          sub_100005FEC(0, &qword_1000466C0, (uint64_t (*)(uint64_t))&type metadata accessor for GenerationPhase, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
          uint64_t v64 = type metadata accessor for GenerationPhase();
          uint64_t v65 = *(void *)(v64 - 8);
          unint64_t v66 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
          uint64_t v67 = swift_allocObject();
          *(_OWORD *)(v67 + 16) = xmmword_100038710;
          (*(void (**)(unint64_t, void, uint64_t))(v65 + 104))(v67 + v66, enum case for GenerationPhase.feedItems(_:), v64);
          id v68 = v63;
          swift_retain_n();
          id v69 = v60;
          id v70 = v68;
        }
        objc_super v93 = v61;
        uint64_t v94 = v62;
        goto LABEL_29;
      }
      sub_100005FEC(0, &qword_1000466C0, (uint64_t (*)(uint64_t))&type metadata accessor for GenerationPhase, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v87 = type metadata accessor for GenerationPhase();
      uint64_t v88 = *(void *)(v87 - 8);
      unint64_t v89 = (*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
      uint64_t v67 = swift_allocObject();
      *(_OWORD *)(v67 + 16) = xmmword_100038710;
      (*(void (**)(unint64_t, void, uint64_t))(v88 + 104))(v67 + v89, enum case for GenerationPhase.sharableModels(_:), v87);
      id v63 = v127;
      uint64_t v90 = v127;
      swift_retain_n();
      id v91 = v117;
      unint64_t v92 = v90;
    }
    objc_super v93 = v116;
    uint64_t v94 = v119;
LABEL_29:
    sub_1000060BC(v67);
    swift_bridgeObjectRelease();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v98 = (uint64_t)v121;
    GenerationWorkRequest.init(environment:pluginIdentifierSetToRun:generationPhases:commitUrgentTransaction:makeGenerationWorkBlock:completionBlock:notStartedCancellationBlock:)();
    uint64_t v99 = v107;
    v126(v107, v93, v94);
    uint64_t v100 = swift_allocObject();
    *(void *)(v100 + 16) = v63;
    v108(v100 + v111, v99, v94);
    unint64_t v101 = (void *)(v100 + v106);
    uint64_t v102 = v131;
    *unint64_t v101 = v130;
    v101[1] = v102;
    id v103 = v63;
    swift_retain();
    id v36 = sub_100006F08(v98, (void (*)(void))sub_100028618, v100);

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v98, v123);
    sub_10000E7F8((uint64_t)&v134);
    (*(void (**)(char *, uint64_t))(v125 + 8))(v93, v94);
    sub_10000E7F8((uint64_t)&v136);
    goto LABEL_30;
  }
  sub_10001727C((uint64_t)&v134);
  static Logger.daemon.getter();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    *(void *)&long long v134 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    uint64_t v136 = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v34 = String.init<A>(describing:)();
    uint64_t v136 = sub_10000E724(v34, v35, (uint64_t *)&v134);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    uint64_t v136 = sub_10000E724(0xD000000000000061, 0x8000000100039CF0, (uint64_t *)&v134);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "[%s] %s no readyHealthExperienceStore - cannot start", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  ((void (**)(char *, void (*)(char *, char *, uint64_t)))v127)[1](v11, v126);
  v130(0);
  id v36 = [objc_allocWithZone((Class)NSProgress) init];
LABEL_30:
  dispatch thunk of UnfairLock.unlock()();
  return v36;
}

void *sub_10001E054(uint64_t a1)
{
  return sub_10000D774(a1);
}

void *sub_10001E06C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100025C18(0, v1, 0);
  unint64_t result = (void *)sub_10000E11C(a1);
  uint64_t v5 = (uint64_t)result;
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 64;
  int64_t v21 = v1;
  int v22 = v4;
  uint64_t v23 = a1 + 64;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v10 = (unint64_t)v5 >> 6;
    if ((*(void *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v4) {
      goto LABEL_24;
    }
    swift_retain();
    uint64_t v24 = dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter();
    uint64_t v12 = v11;
    unint64_t result = (void *)swift_release();
    unint64_t v13 = *((void *)&_swiftEmptyArrayStorage + 2);
    unint64_t v14 = *((void *)&_swiftEmptyArrayStorage + 3);
    if (v13 >= v14 >> 1) {
      unint64_t result = (void *)sub_100025C18(v14 > 1, v13 + 1, 1);
    }
    *((void *)&_swiftEmptyArrayStorage + 2) = v13 + 1;
    uint64_t v15 = (char *)&_swiftEmptyArrayStorage + 16 * v13;
    *((void *)v15 + 4) = v24;
    *((void *)v15 + 5) = v12;
    int64_t v8 = 1 << *(unsigned char *)(a1 + 32);
    if (v5 >= v8) {
      goto LABEL_25;
    }
    uint64_t v7 = a1 + 64;
    uint64_t v16 = *(void *)(v23 + 8 * v10);
    if ((v16 & (1 << v5)) == 0) {
      goto LABEL_26;
    }
    int v4 = v22;
    if (*(_DWORD *)(a1 + 36) != v22) {
      goto LABEL_27;
    }
    unint64_t v17 = v16 & (-2 << (v5 & 0x3F));
    if (v17)
    {
      int64_t v8 = __clz(__rbit64(v17)) | v5 & 0xFFFFFFFFFFFFFFC0;
      int64_t v9 = v21;
    }
    else
    {
      unint64_t v18 = v10 + 1;
      unint64_t v19 = (unint64_t)(v8 + 63) >> 6;
      int64_t v9 = v21;
      if (v10 + 1 < v19)
      {
        unint64_t v20 = *(void *)(v23 + 8 * v18);
        if (v20)
        {
LABEL_20:
          int64_t v8 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v10)
          {
            unint64_t v20 = *(void *)(a1 + 80 + 8 * v10++);
            if (v20)
            {
              unint64_t v18 = v10 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v6;
    uint64_t v5 = v8;
    if (v6 == v9) {
      return &_swiftEmptyArrayStorage;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10001E290(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *(void *)(*(void *)(a5 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle)
                  + 24);
  uint64_t v11 = *(void *)(a5 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_transactionBuilderManager);
  uint64_t v12 = *(void *)(a5 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_countryOracle);
  uint64_t v13 = a4[3];
  uint64_t v14 = a4[4];
  uint64_t v15 = (void (*)(char *, unint64_t, uint64_t))sub_1000057EC(a4, v13);
  swift_retain();
  uint64_t v16 = sub_100026328(a1, a2, a3, v15, v10, v11, v12, a6, v13, v14);
  swift_release();
  return v16;
}

uint64_t sub_10001E368(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.generation.getter();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v29 = a2;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v30 = a3;
    unint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v31 = a4;
    uint64_t v32 = v18;
    uint64_t v28 = v10;
    *(_DWORD *)unint64_t v17 = 136446210;
    uint64_t v33 = a5;
    swift_getMetatypeMetadata();
    uint64_t v19 = String.init<A>(describing:)();
    uint64_t v27 = a5;
    uint64_t v33 = sub_10000E724(v19, v20, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%{public}s]: Background generation completed/cancelled, populating feed", v17, 0xCu);
    swift_arrayDestroy();
    a4 = v31;
    swift_slowDealloc();
    a3 = v30;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
    uint64_t v21 = v27;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v21 = a5;
  }
  swift_retain();
  TransactionManagedCache.finishUse(for:)();
  swift_release();
  sub_10001BB94();
  dispatch thunk of HealthWelcomeFlowSignalManager.determineIfHealthWelcomeFlowShouldShowOnNextAppOpen(completion:)();
  swift_release();
  swift_retain();
  uint64_t v22 = static Feed.Kind.relevanceRankedFeeds.getter();
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a1;
  v23[3] = a3;
  v23[4] = a4;
  uint64_t v23[5] = v21;
  id v24 = a1;
  swift_retain();
  sub_1000299FC(v22, (uint64_t (*)(uint64_t))sub_100029828, (uint64_t)v23);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_10001E668(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.generation.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v20 = a3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = a2;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = a4;
    uint64_t v19 = v7;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    uint64_t v23 = sub_10000E724(v15, v16, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s]: Background generation feed population finished", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v21;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_100023EF8();
  return a2(1);
}

uint64_t sub_10001E89C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.generation.getter();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v21[1] = a2;
    uint64_t v15 = swift_slowAlloc();
    v21[2] = a4;
    unint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v22 = a3;
    uint64_t v23 = v17;
    v21[0] = v9;
    *(_DWORD *)unint64_t v16 = 136446210;
    uint64_t v24 = a5;
    swift_getMetatypeMetadata();
    uint64_t v18 = String.init<A>(describing:)();
    uint64_t v24 = sub_10000E724(v18, v19, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}s]: Background generation cancelled before it started.", v16, 0xCu);
    swift_arrayDestroy();
    a3 = v22;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void))(v10 + 8))(v12, v21[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  swift_retain();
  TransactionManagedCache.finishUse(for:)();
  swift_release();
  return a3(0);
}

uint64_t sub_10001EAFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = a1;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v9 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%{public}s]: Interactive generation completed/cancelled", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10001ECDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0);
}

uint64_t sub_10001ED48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4(0);
}

id sub_10001EDB4(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint8_t *a7, void *a8, void *a9, void *a10, void (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v100 = a7;
  id v101 = a8;
  uint64_t v97 = a5;
  uint64_t v98 = a4;
  v94[1] = a3;
  id v103 = a2;
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v106 = (char *)v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  unint64_t v105 = (char *)v94 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)v94 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)v94 - v22;
  static Logger.daemon.getter();
  swift_retain_n();
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v107 = v14;
  uint64_t v108 = v13;
  uint64_t v102 = v21;
  uint64_t v99 = a12;
  if (v26)
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v104 = (uint64_t (*)(char *, uint64_t))a6;
    uint64_t v28 = v27;
    v111[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136446466;
    uint64_t v109 = a12;
    swift_getMetatypeMetadata();
    uint64_t v29 = String.init<A>(describing:)();
    uint64_t v109 = sub_10000E724(v29, v30, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    sub_10000D46C(0, &qword_100046718, &qword_100046720);
    uint64_t v31 = String.init<A>(describing:)();
    uint64_t Strong = sub_10000E724(v31, v32, v111);
    uint64_t v21 = v102;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    uint64_t v13 = v108;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%{public}s]: Interactive generation cancelled: %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    uint64_t v14 = v107;
    swift_slowDealloc();
    a6 = (uint64_t)v104;
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v33 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
  uint64_t v34 = v33(v23, v13);
  id v95 = a9;
  id v96 = a10;
  if (v103) {
    v103(v34);
  }
  id v103 = a11;
  unint64_t v35 = v98;
  swift_retain();
  TransactionManagedCache.finishUse(for:)();
  swift_release();
  uint64_t v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v37 = (void *)swift_allocObject();
  uint64_t v38 = v100;
  id v39 = v101;
  v37[2] = v36;
  v37[3] = v38;
  uint64_t v40 = v99;
  v37[4] = v39;
  v37[5] = v40;
  swift_retain();
  swift_retain();
  sub_1000250A8(a6, (void (*)(void))sub_100028904, (uint64_t)v37);
  swift_release();
  swift_release();
  static Logger.generation.getter();
  id v41 = v35;
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    id v101 = v41;
    v111[0] = v45;
    *(_DWORD *)uint64_t v44 = 136446210;
    uint64_t v100 = v44 + 4;
    id v46 = v101;
    uint64_t v47 = v33;
    id v48 = [v46 description];
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v51 = v50;

    uint64_t v33 = v47;
    uint64_t Strong = sub_10000E724(v49, v51, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v13 = v108;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "[%{public}s: cancelling launch generation", v44, 0xCu);
    swift_arrayDestroy();
    id v41 = v101;
    swift_slowDealloc();
    swift_slowDealloc();

    v47(v102, v13);
  }
  else
  {

    v33(v21, v13);
  }
  uint64_t v52 = v105;
  p_base_props = &FeedPopulationManagerOracle.base_props;
  [v95 cancel];
  static Logger.personalization.getter();
  id v54 = v41;
  id v55 = v96;
  uint64_t v56 = (char *)v54;
  id v57 = v55;
  uint64_t v58 = Logger.logObject.getter();
  os_log_type_t v59 = static os_log_type_t.default.getter();
  BOOL v60 = os_log_type_enabled(v58, v59);
  uint64_t v104 = v33;
  if (v60)
  {
    uint64_t v61 = swift_slowAlloc();
    uint64_t v102 = v56;
    uint64_t v62 = v61;
    id v101 = (id)swift_slowAlloc();
    v111[0] = (uint64_t)v101;
    *(_DWORD *)uint64_t v62 = 136446466;
    id v63 = v102;
    id v64 = [v63 description];
    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v67 = v66;

    uint64_t Strong = sub_10000E724(v65, v67, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2080;
    id v68 = v57;
    id v69 = [v68 description];
    uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v72 = v71;

    uint64_t v73 = v70;
    uint64_t v33 = v104;
    uint64_t Strong = sub_10000E724(v73, v72, v111);
    p_base_props = (__objc2_prop_list **)(&FeedPopulationManagerOracle + 64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v13 = v108;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "[%{public}s: cancelling summary tab interactive picking operation %s", (uint8_t *)v62, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v56 = v102;
    swift_slowDealloc();

    uint64_t v74 = v105;
  }
  else
  {

    uint64_t v74 = v52;
  }
  v33(v74, v13);
  uint64_t v75 = v106;
  objc_msgSend(v57, (SEL)p_base_props[219]);
  static Logger.personalization.getter();
  unint64_t v76 = v56;
  uint64_t v77 = v103;
  unint64_t v78 = v76;
  unint64_t v79 = v77;
  uint64_t v80 = Logger.logObject.getter();
  os_log_type_t v81 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v80, v81))
  {
    uint64_t v82 = swift_slowAlloc();
    unint64_t v105 = (char *)swift_slowAlloc();
    v111[0] = (uint64_t)v105;
    *(_DWORD *)uint64_t v82 = 136446466;
    unint64_t v83 = v78;
    id v84 = [v83 description];
    uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v87 = v86;

    uint64_t Strong = sub_10000E724(v85, v87, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v82 + 12) = 2080;
    uint64_t v88 = v79;
    id v89 = [v88 description];
    uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v92 = v91;

    uint64_t Strong = sub_10000E724(v90, v92, v111);
    p_base_props = (__objc2_prop_list **)(&FeedPopulationManagerOracle + 64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v80, v81, "[%{public}s: cancelling profile dashboards interactive picking operation %s", (uint8_t *)v82, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v104(v106, v108);
  }
  else
  {

    v33(v75, v13);
  }
  return objc_msgSend(v79, (SEL)p_base_props[219]);
}

void sub_10001F7F0(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v8 = Strong;
    swift_retain();
    sub_10001FEFC((uint64_t)v8, (uint64_t)v8, (uint64_t)a2, a3, a4);
  }
  else
  {
    a2();
  }
}

uint64_t sub_10001F884(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = a1;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = a3;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = a4;
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v15 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v24 = sub_10000E724(v16, v17, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s]: Feed population completed after foreground generation; tearing down",
      v15,
      0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a3 = v22;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_100023EF8();
  return sub_10001FCC4(a2, a3);
}

uint64_t sub_10001FAE8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v12 = *(void *)(a8 + 24);
  uint64_t v11 = *(void *)(a8 + 32);
  uint64_t v13 = a4 & 1;
  uint64_t v14 = sub_100026FF8(a8, v12);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  uint64_t v18 = *(void *)(a9 + 24);
  uint64_t v19 = *(void *)(a9 + 32);
  uint64_t v20 = sub_100026FF8(a9, v18);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  uint64_t v24 = sub_100026E7C(a1, v26, v27, v13, v29, v30, v31, (uint64_t)v16, (uint64_t)v22, v28, v18, v12, v19, v11);
  sub_10000E7F8(a9);
  sub_10000E7F8(a8);
  return v24;
}

uint64_t sub_10001FCC4(uint64_t (*a1)(void), uint64_t a2)
{
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = a2;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = a1;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v16 = v4;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = _typeName(_:qualified:)();
    uint64_t v19 = sub_10000E724(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] Foreground generation operation completed", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v18;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100023FD0(0);
  return a1(1);
}

uint64_t sub_10001FEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for DateInterval();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  v14[5] = a5;
  int64_t v15 = *(void *)(static Feed.Kind.relevanceRankedFeeds.getter() + 16);
  if (v15)
  {
    uint64_t v27 = v13;
    uint64_t v28 = a1;
    uint64_t v29 = v11;
    uint64_t v30 = v10;
    uint64_t v31 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100025C18(0, v15, 0);
    uint64_t v16 = 0;
    uint64_t v17 = v31;
    do
    {
      uint64_t v18 = Feed.Kind.rawValue.getter();
      unint64_t v20 = v19;
      uint64_t v31 = v17;
      unint64_t v22 = v17[2];
      unint64_t v21 = v17[3];
      if (v22 >= v21 >> 1)
      {
        sub_100025C18(v21 > 1, v22 + 1, 1);
        uint64_t v17 = v31;
      }
      ++v16;
      void v17[2] = v22 + 1;
      uint64_t v23 = &v17[2 * v22];
      v23[4] = v18;
      uint64_t v23[5] = v20;
    }
    while (v15 != v16);
    swift_bridgeObjectRelease();
    uint64_t v11 = v29;
    uint64_t v10 = v30;
    unint64_t v13 = v27;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  static DateInterval.allTimeInterval.getter();
  sub_100020108((uint64_t)v17, v24, (unint64_t *)sub_100028914, (uint64_t)v14);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t sub_100020108(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000051A8();
  if (v12)
  {
    static Logger.generation.getter();
    unint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = (unint64_t *)swift_slowAlloc();
      unint64_t v32 = v28;
      *(_DWORD *)uint64_t v15 = 136315394;
      v30[0] = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v29 = a4;
      uint64_t v16 = String.init<A>(describing:)();
      v30[0] = sub_10000E724(v16, v17, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      v30[0] = sub_10000E724(0xD000000000000032, 0x8000000100039B70, (uint64_t *)&v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%s] %s default is set - skipping work", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return ((uint64_t (*)(uint64_t))a3)(v18);
  }
  else
  {
    int64_t v20 = *(void *)(a1 + 16);
    unint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (v20)
    {
      uint64_t v28 = a3;
      uint64_t v29 = a4;
      unint64_t v32 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_100025C38(0, v20, 0);
      unint64_t v21 = v32;
      unint64_t v22 = (uint64_t *)(a1 + 40);
      do
      {
        uint64_t v23 = *v22;
        v30[0] = *(v22 - 1);
        v30[1] = v23;
        sub_100020474(v30, ObjectType, &v31);
        char v24 = v31;
        unint64_t v32 = v21;
        unint64_t v26 = v21[2];
        unint64_t v25 = v21[3];
        if (v26 >= v25 >> 1)
        {
          sub_100025C38(v25 > 1, v26 + 1, 1);
          unint64_t v21 = v32;
        }
        v22 += 2;
        v21[2] = v26 + 1;
        *((unsigned char *)v21 + v26 + 32) = v24;
        --v20;
      }
      while (v20);
      a3 = v28;
      a4 = v29;
    }
    swift_retain();
    sub_1000299FC((uint64_t)v21, (uint64_t (*)(uint64_t))a3, a4);
    swift_bridgeObjectRelease();
    return swift_release();
  }
}

uint64_t sub_100020474@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  unint64_t v13 = (void *)a1[1];
  swift_bridgeObjectRetain();
  uint64_t v29 = v12;
  int v30 = Feed.Kind.init(rawValue:)();
  if (v30 == 6)
  {
    uint64_t v31 = 0;
    unint64_t v32 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(53);
    v22._object = (void *)0x8000000100039BB0;
    v22._countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v22);
    v23._countAndFlagsBits = v29;
    v23._object = v13;
    String.append(_:)(v23);
    v24._countAndFlagsBits = 0xD00000000000001ELL;
    v24._object = (void *)0x8000000100039BD0;
    String.append(_:)(v24);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    static Logger.personalization.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v26 = v9;
      uint64_t v17 = v16;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v28 = v4;
      uint64_t v33 = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v25 = v8;
      uint64_t v31 = a2;
      swift_getMetatypeMetadata();
      uint64_t v27 = a3;
      uint64_t v19 = String.init<A>(describing:)();
      uint64_t v31 = sub_10000E724(v19, v20, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_10000E724(v29, (unint64_t)v13, &v33);
      a3 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%s] Generating feed of kind %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v25);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
    *a3 = v30;
  }
  return result;
}

uint64_t sub_100020938(unint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v47 = a3;
  uint64_t v45 = (void (*)(void))a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v42 = (char *)&v41 - v12;
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v41 - v13;
  swift_retain();
  dispatch thunk of UnfairLock.lock()();
  uint64_t v15 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  swift_release();
  uint64_t v43 = v15;
  uint64_t v46 = v7;
  if (v15)
  {
    static Logger.personalization.getter();
    uint64_t v16 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      *(void *)&long long v48 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      v50[0] = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v41 = v6;
      uint64_t v19 = String.init<A>(describing:)();
      v50[0] = sub_10000E724(v19, v20, (uint64_t *)&v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      v50[0] = sub_10000E724(0xD00000000000001FLL, 0x8000000100039AF0, (uint64_t *)&v48);
      uint64_t v6 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%s] %s Request to submit training received", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v21 = v46;
    }
    else
    {

      uint64_t v21 = v7;
    }
    uint64_t v28 = *(void (**)(char *, uint64_t))(v21 + 8);
    v28(v14, v6);
    type metadata accessor for JSONDecoder();
    swift_allocObject();
    uint64_t v29 = JSONDecoder.init()();
    id v30 = v4;
    sub_100028070((unint64_t)v45, v29, v30);

    dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
    if (v49)
    {
      sub_10000A908(&v48, (uint64_t)v50);
      dispatch thunk of SummaryTabFeedPopulationManager.submitTraining(trainingEvents:store:completion:)();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      return sub_10000E7F8((uint64_t)v50);
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_10001727C((uint64_t)&v48);
      unint64_t v32 = v42;
      static Logger.generation.getter();
      uint64_t v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        *(void *)&long long v48 = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315394;
        v50[0] = ObjectType;
        swift_getMetatypeMetadata();
        uint64_t v45 = a2;
        uint64_t v36 = String.init<A>(describing:)();
        uint64_t v41 = v6;
        v50[0] = sub_10000E724(v36, v37, (uint64_t *)&v48);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v35 + 12) = 2080;
        v50[0] = sub_10000E724(0xD00000000000001FLL, 0x8000000100039AF0, (uint64_t *)&v48);
        a2 = v45;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "[%s] %s no readyHealthExperienceStore - cannot start", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v38 = v32;
        uint64_t v39 = v41;
      }
      else
      {

        uint64_t v38 = v32;
        uint64_t v39 = v6;
      }
      uint64_t v40 = ((uint64_t (*)(char *, uint64_t))v28)(v38, v39);
      a2(v40);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    static Logger.generation.getter();
    Swift::String v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      *(void *)&long long v48 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      v50[0] = ObjectType;
      swift_getMetatypeMetadata();
      uint64_t v25 = String.init<A>(describing:)();
      v50[0] = sub_10000E724(v25, v26, (uint64_t *)&v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      v50[0] = sub_10000E724(0xD00000000000001FLL, 0x8000000100039AF0, (uint64_t *)&v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%s] %s feedPopulationManager not set - cannot do work", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v27 = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v10, v6);
    return ((uint64_t (*)(uint64_t))a2)(v27);
  }
}

uint64_t sub_1000210EC(void *a1, uint64_t a2)
{
  uint64_t v33 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.generation.getter();
  id v11 = a1;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v29 = v7;
    uint64_t v15 = v14;
    *(void *)&long long v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315395;
    uint64_t v30 = v5;
    *(void *)&v36[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v31 = v4;
    uint64_t v16 = String.init<A>(describing:)();
    *(void *)&v36[0] = sub_10000E724(v16, v17, (uint64_t *)&v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2081;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&v36[0] = sub_10000E724(v18, v19, (uint64_t *)&v37);
    uint64_t v5 = v30;
    uint64_t v4 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%s] Posting notification named %{private}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v7 = v29;
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v32);
  uint64_t v20 = v33;
  memset(v36, 0, 32);
  id v21 = v11;
  Notification.init(name:object:userInfo:)();
  swift_bridgeObjectRetain();
  Notification.userInfo.setter();
  if (!v20)
  {
    long long v37 = 0u;
    long long v38 = 0u;
LABEL_14:
    sub_1000277F4((uint64_t)&v37, &qword_100046688, (uint64_t)&type metadata for Any + 8);
    goto LABEL_15;
  }
  uint64_t v34 = HealthPluginHostBufferPostNotificationUserInfoKey.getter();
  uint64_t v35 = v22;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v20 + 16) && (unint64_t v23 = sub_100026074((uint64_t)v36), (v24 & 1) != 0))
  {
    sub_10000E848(*(void *)(v20 + 56) + 32 * v23, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  sub_100027864((uint64_t)v36);
  if (!*((void *)&v38 + 1)) {
    goto LABEL_14;
  }
  if swift_dynamicCast() && (v36[0])
  {
    type metadata accessor for HealthPluginHostNotificationBuffer();
    static HealthPluginHostNotificationBuffer.shared.getter();
    dispatch thunk of HealthPluginHostNotificationBuffer.storeNotification(_:)();
    swift_release();
  }
LABEL_15:
  id v25 = [self defaultCenter];
  Class isa = Notification._bridgeToObjectiveC()().super.isa;
  [v25 postNotification:isa];

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000215E4(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v28 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v28 - 8);
  uint64_t v6 = __chkstk_darwin(v28);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - v9;
  swift_retain();
  dispatch thunk of UnfairLock.lock()();
  uint64_t v11 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  swift_release();
  if (v11)
  {
    uint64_t v27 = a1;
    static Logger.personalization.getter();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v26 = a2;
      uint64_t v15 = (uint8_t *)v14;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = ObjectType;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v16 = String.init<A>(describing:)();
      uint64_t v30 = sub_10000E724(v16, v17, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%s] Collecting diagnostic logs for feed population", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v26;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v28);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v27;
    *(void *)(v18 + 24) = a2;
    swift_retain();
    SummaryTabFeedPopulationManager.collectDiagnosticLogs(_:)();
    swift_release();
    return swift_release();
  }
  else
  {
    static Logger.generation.getter();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v26 = a2;
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = ObjectType;
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v23 = String.init<A>(describing:)();
      uint64_t v30 = sub_10000E724(v23, v24, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[%s] feedPopulationManager not set - cannot do work", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v28);
    return a1(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000219E8(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v28 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = _swiftEmptyArrayStorage;
  if (v9)
  {
    v23[1] = a3;
    unint64_t v24 = a2;
    uint64_t v29 = _swiftEmptyArrayStorage;
    sub_100025C18(0, v9, 0);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v11 = v6 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v25 = *(void *)(v11 + 56);
    uint64_t v26 = v12;
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v27 = v11;
    do
    {
      uint64_t v15 = v28;
      v26(v8, v13, v28);
      uint64_t v16 = URL.path.getter();
      uint64_t v18 = v17;
      (*v14)(v8, v15);
      uint64_t v10 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100025C18(0, v10[2] + 1, 1);
        uint64_t v10 = v29;
      }
      unint64_t v20 = v10[2];
      unint64_t v19 = v10[3];
      if (v20 >= v19 >> 1)
      {
        sub_100025C18(v19 > 1, v20 + 1, 1);
        uint64_t v10 = v29;
      }
      v10[2] = v20 + 1;
      os_log_type_t v21 = &v10[2 * v20];
      v21[4] = v16;
      void v21[5] = v18;
      v13 += v25;
      --v9;
    }
    while (v9);
    a2 = v24;
  }
  a2(v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100021D00(uint64_t a1, int a2, void (*a3)(void, void), uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v30 - v13;
  if (a1)
  {
    swift_errorRetain();
    static Logger.daemon.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v32 = v8;
      uint64_t v18 = v17;
      v30[0] = swift_slowAlloc();
      uint64_t v34 = v30[0];
      *(_DWORD *)uint64_t v18 = 136446722;
      uint64_t v31 = a3;
      uint64_t v19 = _typeName(_:qualified:)();
      uint64_t v33 = sub_10000E724(v19, v20, &v34);
      v30[1] = a4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 1024;
      LODWORD(v33) = a2 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v18 + 18) = 2082;
      uint64_t v33 = a1;
      swift_errorRetain();
      sub_10000EC60(0, &qword_100045F48);
      uint64_t v21 = String.init<A>(describing:)();
      uint64_t v33 = sub_10000E724(v21, v22, &v34);
      a3 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}s [Transaction] Transaction was not committed asUrgent %{BOOL}d: %{public}s", (uint8_t *)v18, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v32);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    swift_errorRetain();
    a3(0, a1);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    LODWORD(v31) = a2;
    static Logger.daemon.getter();
    uint64_t v23 = Logger.logObject.getter();
    uint64_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, (os_log_type_t)v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v32 = v8;
      uint64_t v34 = v26;
      *(_DWORD *)uint64_t v25 = 136446466;
      uint64_t v27 = _typeName(_:qualified:)();
      uint64_t v33 = sub_10000E724(v27, v28, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 1024;
      LODWORD(v33) = v31 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v24, "%{public}s [Transaction] Successfully committed transaction asUrgent %{BOOL}d", (uint8_t *)v25, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    return ((uint64_t (*)(uint64_t, void))a3)(1, 0);
  }
}

void sub_1000222C4(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_1000223C0(uint64_t (*a1)(void), char *a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = type metadata accessor for DateInterval();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v39 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v35 - v14;
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  uint64_t v16 = v41[3];
  sub_10001727C((uint64_t)v41);
  if (v16)
  {
    uint64_t v37 = v7;
    static Logger.daemon.getter();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v35[1] = v3;
      uint64_t v19 = swift_slowAlloc();
      v35[0] = v6;
      unint64_t v20 = (uint8_t *)v19;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v36 = v9;
      v41[0] = v21;
      *(_DWORD *)unint64_t v20 = 136446210;
      uint64_t v22 = _typeName(_:qualified:)();
      uint64_t ObjectType = (uint64_t)a1;
      uint64_t v40 = sub_10000E724(v22, v23, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      a1 = (uint64_t (*)(void))ObjectType;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%{public}s] Running feed item generation because we have a ready store", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v6 = v35[0];
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v36);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    uint64_t v31 = v39;
    static DateInterval.allTimeInterval.getter();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = a1;
    *(void *)(v32 + 24) = a2;
    uint64_t v33 = swift_retain();

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v31, v6);
  }
  else
  {
    static Logger.daemon.getter();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v37 = v10;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v39 = a2;
      uint64_t v27 = (uint8_t *)v26;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v36 = v9;
      v41[0] = v28;
      *(_DWORD *)uint64_t v27 = 136446210;
      uint64_t v29 = _typeName(_:qualified:)();
      uint64_t v40 = sub_10000E724(v29, v30, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%{public}s] Falling back to requesting generation because we don't have a ready store", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v36);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    sub_100023FD0((void (*)(char *, uint64_t))1);
    return a1();
  }
}

id sub_1000228A4(void (*a1)(void), uint64_t a2)
{
  uint64_t v89 = a2;
  uint64_t v88 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v86 = type metadata accessor for Logger();
  unint64_t v87 = *(char **)(v86 - 8);
  uint64_t v3 = __chkstk_darwin(v86);
  uint64_t v5 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  unint64_t v76 = (char *)&v75 - v7;
  __chkstk_darwin(v6);
  uint64_t v75 = (char *)&v75 - v8;
  uint64_t v84 = type metadata accessor for UUID();
  uint64_t v80 = *(void *)(v84 - 8);
  uint64_t v9 = *(void *)(v80 + 64);
  uint64_t v10 = __chkstk_darwin(v84);
  unint64_t v78 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v79 = (char *)&v75 - v11;
  uint64_t v82 = type metadata accessor for TransactionRecord();
  uint64_t v81 = *(void *)(v82 - 8);
  uint64_t v12 = *(void *)(v81 + 64);
  uint64_t v13 = __chkstk_darwin(v82);
  uint64_t v77 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v83 = (char *)&v75 - v14;
  uint64_t v15 = type metadata accessor for GenerationQueue.State();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  os_log_type_t v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = v2;
  uint64_t v20 = *(void *)&v2[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_longRunningProcessOracle];
  swift_retain();
  dispatch thunk of GenerationQueue.state.getter();
  swift_release();
  int v21 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v18, v15);
  int v22 = enum case for GenerationQueue.State.idle(_:);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if (v21 != v22)
  {
    static Logger.generation.getter();
    id v55 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v55, v56))
    {
      id v57 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)id v57 = 136446210;
      uint64_t v58 = _typeName(_:qualified:)();
      v97[0] = sub_10000E724(v58, v59, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "[%{public}s] Failed to run launch generation since generation queue is not idle", v57, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*((void (**)(char *, uint64_t))v87 + 1))(v5, v86);
    v88(0);
    return [objc_allocWithZone((Class)NSProgress) init];
  }
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (!v92)
  {
    sub_10001727C((uint64_t)&aBlock);
    BOOL v60 = v76;
    static Logger.generation.getter();
    uint64_t v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v61, v62))
    {
      id v63 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)id v63 = 136446210;
      uint64_t v64 = _typeName(_:qualified:)();
      v97[0] = sub_10000E724(v64, v65, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "[%{public}s] Failed to run launch generation since HealthExperienceStore cannot be created", v63, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*((void (**)(char *, uint64_t))v87 + 1))(v60, v86);
    v88(0);
    return [objc_allocWithZone((Class)NSProgress) init];
  }
  sub_10000A908(&aBlock, (uint64_t)v97);
  unint64_t v23 = (char *)*(id *)(v20 + 16);
  uint64_t v24 = v83;
  uint64_t v25 = TransactionRecord.init(name:)();
  __chkstk_darwin(v25);
  *(&v75 - 2) = v19;
  *(&v75 - 1) = v23;
  swift_retain();
  TransactionManagedCache.fetchCachedOrCreate(for:using:)();
  swift_release();
  uint64_t v26 = *(void *)(v20 + 24);
  uint64_t v27 = *(void *)&v19[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_transactionBuilderManager];
  swift_retain();
  unint64_t v76 = v23;
  uint64_t v28 = sub_100007FEC(v23, (uint64_t)v97, v26, (uint64_t)v96, v27);
  swift_release();
  if (v28)
  {
    uint64_t v29 = v79;
    UUID.init()();
    uint64_t v75 = (char *)swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v86 = v28;
    uint64_t v30 = v81;
    uint64_t v31 = v82;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v77, v24, v82);
    uint64_t v32 = v80;
    (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v78, v29, v84);
    uint64_t v33 = v30;
    unint64_t v34 = (*(unsigned __int8 *)(v30 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    unint64_t v35 = (v12 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + v35 + 8) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    unint64_t v37 = (v9 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v87 = v19;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v38 + v34, v77, v31);
    *(void *)(v38 + v35) = v75;
    (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v38 + v36, v78, v84);
    uint64_t v39 = (void *)(v38 + v37);
    uint64_t v40 = v88;
    uint64_t v41 = v89;
    *uint64_t v39 = v88;
    v39[1] = v41;
    *(void *)(v38 + ((v37 + 23) & 0xFFFFFFFFFFFFFFF8)) = ObjectType;
    objc_super v93 = sub_100027600;
    uint64_t v94 = (void *)v38;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    unint64_t v91 = sub_100010A84;
    unint64_t v92 = &unk_1000421F0;
    uint64_t v42 = _Block_copy(&aBlock);
    uint64_t v43 = self;
    swift_retain();
    swift_retain();
    swift_retain();
    id v44 = [v43 blockOperationWithBlock:v42];
    _Block_release(v42);
    swift_release();
    swift_release();
    uint64_t v45 = (void *)v86;
    [v44 addDependency:v86];
    sub_10000C49C(0, &qword_1000462C0);
    uint64_t v46 = (void *)static NSOperationQueue.userInitiated.getter();
    [v46 addOperation:v45];

    uint64_t v47 = (void *)static NSOperationQueue.userInitiated.getter();
    [v47 addOperation:v44];

    id v48 = [objc_allocWithZone((Class)NSProgress) init];
    uint64_t v49 = (void *)swift_allocObject();
    v49[2] = v45;
    v49[3] = v44;
    v49[4] = v40;
    v49[5] = v41;
    objc_super v93 = sub_100027764;
    uint64_t v94 = v49;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    unint64_t v91 = sub_100010A84;
    unint64_t v92 = &unk_100042240;
    unint64_t v50 = _Block_copy(&aBlock);
    swift_retain();
    id v51 = v45;
    id v52 = v44;
    sub_10000A8E8((uint64_t)sub_100027764);
    swift_release();
    [v48 setCancellationHandler:v50];
    _Block_release(v50);
    swift_release();
    swift_retain();
    uint64_t v53 = v79;
    id v54 = (id)dispatch thunk of CancellableProgressList.add(_:uuid:)();

    swift_release();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v53, v84);
    sub_10000E7F8((uint64_t)v96);
    (*(void (**)(char *, uint64_t))(v81 + 8))(v83, v82);
  }
  else
  {
    unint64_t v66 = v75;
    static Logger.generation.getter();
    unint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      id v69 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long aBlock = swift_slowAlloc();
      *(_DWORD *)id v69 = 136446210;
      uint64_t v70 = _typeName(_:qualified:)();
      uint64_t v95 = sub_10000E724(v70, v71, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "[%{public}s] Failed to run launch generation since operation cannot be created", v69, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*((void (**)(char *, uint64_t))v87 + 1))(v66, v86);
    uint64_t v72 = v82;
    uint64_t v73 = v81;
    v88(0);
    id v54 = [objc_allocWithZone((Class)NSProgress) init];

    sub_10000E7F8((uint64_t)v96);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v24, v72);
  }
  sub_10000E7F8((uint64_t)v97);
  return v54;
}

uint64_t sub_1000235F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v25 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = a3 + 16;
  static Logger.generation.getter();
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v23[1] = a2;
    uint64_t v15 = swift_slowAlloc();
    void v23[2] = a4;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v24 = a5;
    v28[0] = v17;
    v23[0] = a1;
    *(_DWORD *)uint64_t v16 = 136446210;
    uint64_t v18 = _typeName(_:qualified:)();
    uint64_t v27 = sub_10000E724(v18, v19, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%{public}s] Launch generation completed", v16, 0xCu);
    swift_arrayDestroy();
    a5 = v24;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  TransactionManagedCache.finishUse(for:)();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v21 = (void *)Strong;
    swift_retain();

    dispatch thunk of CancellableProgressList.clearProgress(for:)();
    swift_release();
  }
  return a5(1);
}

id sub_1000238AC(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  uint64_t v12 = (void *)a6(a5, v10);

  swift_release();

  return v12;
}

uint64_t sub_10002394C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), const char *a6)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void (*)(void))a5(v12);
  v15();
  swift_release();
  static Logger.daemon.getter();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v28 = a3;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v27 = v10;
    unint64_t v19 = (uint8_t *)v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v26 = a6;
    uint64_t v29 = v20;
    uint64_t v30 = a4;
    *(_DWORD *)unint64_t v19 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v30 = sub_10000E724(v21, v22, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v26, v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v24 = (void *)result;
    swift_retain();

    dispatch thunk of CancellableProgressList.clearProgress(for:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_100023BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (id *)(a2 + 16);
  dispatch thunk of UnfairLock.lock()();
  static Logger.generation.getter();
  swift_retain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v6;
    uint64_t v14 = v13;
    uint64_t v24 = swift_slowAlloc();
    v27[0] = v24;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v26 = a1;
    *(void *)&long long v28 = a3;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    *(void *)&long long v28 = sub_10000E724(v15, v16, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    swift_beginAccess();
    long long v28 = *(_OWORD *)(a2 + 16);
    os_log_type_t v17 = (void *)v28;
    sub_100027194(0, &qword_100046670, &qword_100046678);
    id v18 = v17;
    uint64_t v19 = String.init<A>(describing:)();
    *(void *)&long long v28 = sub_10000E724(v19, v20, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s] Cancelling work: %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v25);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_beginAccess();
  if (*v10) {
    [*v10 cancel];
  }
  swift_beginAccess();
  id v21 = *v10;
  *uint64_t v10 = 0;
  *(void *)(a2 + 24) = 0;

  return dispatch thunk of UnfairLock.unlock()();
}

id sub_100023EF8()
{
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v2)
  {
    sub_10000A908(&v1, (uint64_t)v3);
    sub_10000A884((uint64_t)v3, (uint64_t)&v1);
    sub_10000EC60(0, (unint64_t *)&qword_1000460C0);
    type metadata accessor for DaemonHealthExperienceStore();
    if (swift_dynamicCast())
    {
      dispatch thunk of DaemonHealthExperienceStore.cleanUpManagedObjectContext()();
      swift_release();
    }
    sub_10000E7F8((uint64_t)v3);
  }
  else
  {
    sub_10001727C((uint64_t)&v1);
  }
  return [self resetSharedInstances];
}

void sub_100023FD0(void (*a1)(char *, uint64_t))
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v39 - v10;
  static Logger.daemon.getter();
  os_log_type_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v42 = ObjectType;
  if (v14)
  {
    uint64_t v40 = v2;
    uint64_t v43 = v9;
    uint64_t v44 = v6;
    uint64_t v45 = v5;
    uint64_t v15 = 0xD000000000000014;
    uint64_t v16 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136446466;
    uint64_t v17 = _typeName(_:qualified:)();
    uint64_t v47 = sub_10000E724(v17, v18, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    uint64_t v41 = a1;
    if ((_BYTE)a1)
    {
      if (a1 == 1) {
        uint64_t v15 = 0xD00000000000001ALL;
      }
      else {
        uint64_t v15 = 0xD000000000000016;
      }
      if (a1 == 1) {
        unint64_t v19 = 0x8000000100038E30;
      }
      else {
        unint64_t v19 = 0x8000000100038E50;
      }
    }
    else
    {
      unint64_t v19 = 0x8000000100038E10;
    }
    uint64_t v47 = sub_10000E724(v15, v19, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%{public}s] Scheduling background generation %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v6 = v44;
    uint64_t v5 = v45;
    unint64_t v20 = *(void (**)(char *, uint64_t))(v44 + 8);
    v20(v11, v45);
    uint64_t v9 = v43;
    uint64_t v2 = v40;
    LOBYTE(a1) = (_BYTE)v41;
  }
  else
  {

    unint64_t v20 = *(void (**)(char *, uint64_t))(v6 + 8);
    v20(v11, v5);
  }
  uint64_t v21 = *(void *)&v2[OBJC_IVAR____TtC10healthappd23HealthPluginHostService_backgroundGenerationActivities];
  if (*(void *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_100025FA4((char)a1);
    if (v23)
    {
      id v24 = *(id *)(*(void *)(v21 + 56) + 8 * v22);
      swift_bridgeObjectRelease();
      double v25 = dbl_100038A78[(char)a1];
      uint64_t v26 = swift_allocObject();
      *(unsigned char *)(v26 + 16) = (_BYTE)a1;
      aBlock[4] = (uint64_t)sub_10002718C;
      aBlock[5] = v26;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100024DF4;
      aBlock[3] = (uint64_t)&unk_100042088;
      uint64_t v27 = _Block_copy(aBlock);
      swift_release();
      [v24 requestRunWithMaximumDelay:v27 completion:v25];
      _Block_release(v27);

      return;
    }
    swift_bridgeObjectRelease();
  }
  static Logger.daemon.getter();
  long long v28 = v2;
  uint64_t v29 = Logger.logObject.getter();
  int v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, (os_log_type_t)v30))
  {
    LODWORD(v40) = v30;
    uint64_t v41 = v20;
    uint64_t v43 = v9;
    uint64_t v44 = v6;
    uint64_t v45 = v5;
    uint64_t v31 = 0xD000000000000014;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)uint64_t v32 = 136446722;
    uint64_t v33 = _typeName(_:qualified:)();
    uint64_t v47 = sub_10000E724(v33, v34, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    if ((_BYTE)a1)
    {
      if (a1 == 1) {
        uint64_t v31 = 0xD00000000000001ALL;
      }
      else {
        uint64_t v31 = 0xD000000000000016;
      }
      if (a1 == 1) {
        unint64_t v35 = 0x8000000100038E30;
      }
      else {
        unint64_t v35 = 0x8000000100038E50;
      }
    }
    else
    {
      unint64_t v35 = 0x8000000100038E10;
    }
    uint64_t v47 = sub_10000E724(v31, v35, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2082;
    sub_10000C49C(0, (unint64_t *)&qword_100046660);
    sub_100027128();
    swift_bridgeObjectRetain();
    uint64_t v36 = Dictionary.description.getter();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v47 = sub_10000E724(v36, v38, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v40, "[%{public}s] Could not find generationType %{public}s in background generation activities %{public}s", (uint8_t *)v32, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v41(v43, v45);
  }
  else
  {

    v20(v9, v5);
  }
}

uint64_t sub_100024654(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  os_log_type_t v13 = (char *)&v44 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v44 - v15;
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v44 - v17;
  if (a1 == 2)
  {
    static Logger.daemon.getter();
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = 0xD000000000000014;
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136446210;
      if (a3)
      {
        if (a3 == 1) {
          uint64_t v31 = 0xD00000000000001ALL;
        }
        else {
          uint64_t v31 = 0xD000000000000016;
        }
        if (a3 == 1) {
          unint64_t v33 = 0x8000000100038E30;
        }
        else {
          unint64_t v33 = 0x8000000100038E50;
        }
      }
      else
      {
        unint64_t v33 = 0x8000000100038E10;
      }
      uint64_t v46 = sub_10000E724(v31, v33, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Completed background generation %{public}s with deferral", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v40 = v13;
    return v39(v40, v6);
  }
  if (a1 != 1)
  {
    if (!a1)
    {
      static Logger.daemon.getter();
      unint64_t v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = 0xD000000000000014;
        unint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(_DWORD *)unint64_t v22 = 136446210;
        if (a3)
        {
          if (a3 == 1) {
            uint64_t v21 = 0xD00000000000001ALL;
          }
          else {
            uint64_t v21 = 0xD000000000000016;
          }
          if (a3 == 1) {
            unint64_t v23 = 0x8000000100038E30;
          }
          else {
            unint64_t v23 = 0x8000000100038E50;
          }
        }
        else
        {
          unint64_t v23 = 0x8000000100038E10;
        }
        uint64_t v46 = sub_10000E724(v21, v23, &v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Completed background generation %{public}s successfully", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
      uint64_t v40 = v18;
      return v39(v40, v6);
    }
    static Logger.daemon.getter();
    unint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = 0xD000000000000014;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136446466;
      uint64_t v45 = v6;
      if (a3)
      {
        if (a3 == 1) {
          uint64_t v36 = 0xD00000000000001ALL;
        }
        else {
          uint64_t v36 = 0xD000000000000016;
        }
        if (a3 == 1) {
          unint64_t v38 = 0x8000000100038E30;
        }
        else {
          unint64_t v38 = 0x8000000100038E50;
        }
      }
      else
      {
        unint64_t v38 = 0x8000000100038E10;
      }
      uint64_t v46 = sub_10000E724(v36, v38, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2050;
      uint64_t v46 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Completed background generation %{public}s with unexpected state %{public}ld", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v45);
    }

    uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v40 = v10;
    return v39(v40, v6);
  }
  static Logger.daemon.getter();
  swift_errorRetain();
  swift_errorRetain();
  id v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v24, v25))
  {
    swift_errorRelease();
    swift_errorRelease();

    uint64_t v39 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v40 = v16;
    return v39(v40, v6);
  }
  uint64_t v26 = 0xD000000000000014;
  uint64_t v27 = swift_slowAlloc();
  uint64_t v47 = swift_slowAlloc();
  *(_DWORD *)uint64_t v27 = 136446466;
  uint64_t v45 = v6;
  if (a3)
  {
    if (a3 == 1) {
      uint64_t v26 = 0xD00000000000001ALL;
    }
    else {
      uint64_t v26 = 0xD000000000000016;
    }
    if (a3 == 1) {
      unint64_t v28 = 0x8000000100038E30;
    }
    else {
      unint64_t v28 = 0x8000000100038E50;
    }
  }
  else
  {
    unint64_t v28 = 0x8000000100038E10;
  }
  uint64_t v46 = sub_10000E724(v26, v28, &v47);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v27 + 12) = 2082;
  uint64_t v46 = a2;
  swift_errorRetain();
  sub_100027194(0, &qword_100046668, &qword_100045F48);
  uint64_t v41 = String.init<A>(reflecting:)();
  uint64_t v46 = sub_10000E724(v41, v42, &v47);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v24, v25, "Completed background generation %{public}s with error %{public}s", (uint8_t *)v27, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v16, v45);
}

void sub_100024DF4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100024E6C()
{
  long long v1 = (objc_class *)type metadata accessor for HealthPluginHostService(0);
  DebuggingResponder.deregisterForDebuggingRequests()();
  v3.receiver = v0;
  v3.super_class = v1;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_1000250A0()
{
  return type metadata accessor for HealthPluginHostService(0);
}

uint64_t sub_1000250A8(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v39 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unint64_t v38 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v13 = *(void *)(v3 + OBJC_IVAR____TtC10healthappd23HealthPluginHostService_lock);
  dispatch thunk of UnfairLock.lock()();
  static Logger.analytics.getter();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v41 = v8;
  uint64_t v42 = v7;
  uint64_t v40 = ObjectType;
  if (v16)
  {
    uint64_t v36 = a2;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v37 = v13;
    unint64_t v18 = (uint8_t *)v17;
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 136446210;
    v43[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v19 = String.init<A>(describing:)();
    v43[0] = sub_10000E724(v19, v20, &v44);
    a2 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%{public}s]: Submitting personalization analytics…", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v13 = v37;
    swift_slowDealloc();

    uint64_t v21 = *(void (**)(char *, uint64_t))(v41 + 8);
    v21(v12, v42);
  }
  else
  {

    uint64_t v21 = *(void (**)(char *, uint64_t))(v8 + 8);
    v21(v12, v7);
  }
  swift_retain();
  dispatch thunk of UnfairLock.lock()();
  uint64_t v22 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  swift_release();
  if (v22)
  {
    swift_retain();
    BaseFeedPopulationManager.healthExperienceStore.getter();
    swift_release();
    sub_1000057EC(v43, v43[3]);
    unint64_t v23 = (void *)dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
    sub_10000E7F8((uint64_t)v43);
    id v24 = (void *)swift_allocObject();
    uint64_t v25 = v40;
    v24[2] = v39;
    void v24[3] = a2;
    v24[4] = a3;
    v24[5] = v25;
    swift_retain();
    sub_10000A8E8((uint64_t)a2);
    dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithEndOfSessionAnalytics(from:in:completion:)();
    swift_release();

    swift_release();
  }
  else
  {
    uint64_t v26 = v38;
    static Logger.personalization.getter();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v37 = v13;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136446210;
      v43[0] = v40;
      swift_getMetatypeMetadata();
      uint64_t v30 = String.init<A>(describing:)();
      v43[0] = sub_10000E724(v30, v31, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[%{public}s]: Unable to resolve FeedPopulationManager for personalization analytics", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v32 = v38;
    }
    else
    {

      uint64_t v32 = v26;
    }
    uint64_t v33 = ((uint64_t (*)(char *, uint64_t))v21)(v32, v42);
    if (a2) {
      a2(v33);
    }
  }
  return dispatch thunk of UnfairLock.unlock()();
}

uint64_t sub_100025580(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of AppSessionAnalyticsManager.submitCurrentEvent(resetAfterSubmitted:)();
  static Logger.personalization.getter();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v19 = a2;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v18 = a3;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = a4;
    *(_DWORD *)uint64_t v14 = 136446210;
    swift_getMetatypeMetadata();
    uint64_t v15 = String.init<A>(describing:)();
    uint64_t v21 = sub_10000E724(v15, v16, &v20);
    a2 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%{public}s]: Analytics complete!", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a2) {
    return a2(result);
  }
  return result;
}

void sub_1000257C8()
{
  sub_100005FEC(319, &qword_1000460C8, (uint64_t (*)(uint64_t))sub_10000FBEC, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for UserDefault);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000258C8()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = ObjectType;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v12 = sub_10000E724(v8, v9, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%s]: debuggingInfoRequested()", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_100025B94()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100025BD4()
{
  uint64_t v0 = FeedItemGeneratorPipelineManager.deinit();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_100025C04()
{
  return type metadata accessor for HealthPluginHostService.JustPrimarySnippetsFeedItemGeneratorPipelineManager(0);
}

uint64_t sub_100025C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002917C(a2, a3);
}

uint64_t sub_100025C18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025CA8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100025C38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100025E34(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100025C58(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005D88(a1, a2, a3, (void *)*v3, &qword_100046698, (uint64_t (*)(uint64_t))&type metadata accessor for ModelTrainingEvent, (uint64_t (*)(void))&type metadata accessor for ModelTrainingEvent);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100025CA8(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000912C(0, &qword_100046680, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100025E34(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000912C(0, &qword_1000466A0, (uint64_t)&type metadata for Feed.Kind, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100025FA4(char a1)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();

  return sub_1000260B8(a1, v2);
}

unint64_t sub_100026074(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100026260(a1, v4);
}

unint64_t sub_1000260B8(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v13 = ~v3;
    while (1)
    {
      unint64_t v5 = 0xD00000000000001ALL;
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
      {
        unint64_t v6 = 0x8000000100038E30;
      }
      else
      {
        unint64_t v5 = 0xD000000000000016;
        unint64_t v6 = 0x8000000100038E50;
      }
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4)) {
        unint64_t v7 = v5;
      }
      else {
        unint64_t v7 = 0xD000000000000014;
      }
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4)) {
        unint64_t v8 = v6;
      }
      else {
        unint64_t v8 = 0x8000000100038E10;
      }
      if (a1)
      {
        if (a1 == 1) {
          unint64_t v9 = 0xD00000000000001ALL;
        }
        else {
          unint64_t v9 = 0xD000000000000016;
        }
        if (a1 == 1) {
          unint64_t v10 = 0x8000000100038E30;
        }
        else {
          unint64_t v10 = 0x8000000100038E50;
        }
        if (v7 != v9) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t v10 = 0x8000000100038E10;
        if (v7 != 0xD000000000000014) {
          goto LABEL_23;
        }
      }
      if (v8 == v10)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_23:
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v13;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_100026260(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000278B8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100027864((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100026328(uint64_t a1, void *a2, uint64_t a3, void (*a4)(char *, unint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v72 = a7;
  uint64_t v75 = a6;
  unint64_t v79 = a4;
  uint64_t v77 = a3;
  sub_100006088(0);
  uint64_t v80 = v13;
  uint64_t v63 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v82 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = type metadata accessor for PipelineProviderWrappers();
  uint64_t v74 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  unint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006054(0);
  uint64_t v81 = v17;
  uint64_t v83 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v84 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for DispatchTimeInterval();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v70 = (uint64_t *)((char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000EB64();
  __chkstk_darwin(v20 - 8);
  os_log_type_t v68 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
  uint64_t v67 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  id v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F144();
  uint64_t v26 = v25;
  uint64_t v78 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  os_log_type_t v28 = (char *)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88[3] = a9;
  v88[4] = a10;
  uint64_t v29 = sub_100027048(v88);
  (*(void (**)(uint64_t *, id, uint64_t))(*(void *)(a9 - 8) + 16))(v29, v79, a9);
  uint64_t v76 = a1;
  uint64_t v30 = GenerationWorkRequest.pluginIdentifierSetToRun.getter();
  sub_100027BF8(v30);
  swift_bridgeObjectRelease();
  uint64_t v31 = type metadata accessor for BundleFeedItemGenerationPluginInfo();
  uint64_t v32 = sub_10000C454(&qword_100046170, (void (*)(uint64_t))&type metadata accessor for BundleFeedItemGenerationPluginInfo);
  uint64_t v65 = v31;
  uint64_t v64 = v32;
  uint64_t v33 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  id v34 = objc_allocWithZone((Class)HKProfileStore);
  id v66 = a2;
  id v35 = [v34 initWithHealthStore:a2];
  HKProfileStore.profileIdentifiersPublisher.getter();
  sub_10000C454(&qword_100046168, (void (*)(uint64_t))&type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher);
  Publisher<>.mapToSourceProfiles(includeAgnostic:)();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v24, v22);
  sub_10000C454(&qword_100046178, (void (*)(uint64_t))sub_10000F144);
  uint64_t v67 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v28, v26);

  uint64_t v36 = v33;
  sub_10000A884(v77, (uint64_t)v87);
  int64_t v37 = *(void *)(v33 + 16);
  uint64_t v73 = a5;
  if (v37)
  {
    v86[0] = _swiftEmptyArrayStorage;
    sub_100005D38(0, v37, 0);
    unint64_t v79 = *(void (**)(char *, unint64_t, uint64_t))(v74 + 16);
    unint64_t v38 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
    uint64_t v62 = v33;
    unint64_t v39 = v33 + v38;
    uint64_t v78 = *(void *)(v74 + 72);
    uint64_t v40 = (void (**)(char *, uint64_t))(v74 + 8);
    uint64_t v41 = v63;
    do
    {
      uint64_t v42 = v85;
      v79(v16, v39, v85);
      PipelineProviderWrappers.feedItem.getter();
      (*v40)(v16, v42);
      uint64_t v43 = v86[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005D38(0, *(void *)(v43 + 16) + 1, 1);
        uint64_t v43 = v86[0];
      }
      unint64_t v45 = *(void *)(v43 + 16);
      unint64_t v44 = *(void *)(v43 + 24);
      if (v45 >= v44 >> 1)
      {
        sub_100005D38(v44 > 1, v45 + 1, 1);
        uint64_t v43 = v86[0];
      }
      *(void *)(v43 + 16) = v45 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v43+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(void *)(v41 + 72) * v45, v82, v80);
      v86[0] = v43;
      v39 += v78;
      --v37;
    }
    while (v37);
    uint64_t v46 = v74;
    uint64_t v36 = v62;
  }
  else
  {
    uint64_t v46 = v74;
  }
  type metadata accessor for FeedItemGeneratorPipelineManager();
  sub_10000A884((uint64_t)v88, (uint64_t)v86);
  swift_retain();
  swift_retain();
  unint64_t v79 = (void (*)(char *, unint64_t, uint64_t))v66;
  uint64_t v80 = GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v47 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  sub_10000D774(v47);
  swift_bridgeObjectRelease();
  uint64_t v48 = Array<A>.makeGeneratorPipelineProviderWrappers()();
  swift_bridgeObjectRelease();
  if ((GenerationWorkRequest.commitUrgentTransaction.getter() & 1) == 0) {
    uint64_t v48 = v36;
  }
  swift_bridgeObjectRelease();
  sub_10000A884(v77, (uint64_t)v87);
  int64_t v49 = *(void *)(v48 + 16);
  if (v49)
  {
    v86[0] = _swiftEmptyArrayStorage;
    sub_100005CE8(0, v49, 0);
    uint64_t v82 = *(char **)(v46 + 16);
    unint64_t v50 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    uint64_t v78 = v48;
    unint64_t v51 = v48 + v50;
    uint64_t v52 = *(void *)(v46 + 72);
    do
    {
      uint64_t v53 = v85;
      ((void (*)(char *, unint64_t, uint64_t))v82)(v16, v51, v85);
      PipelineProviderWrappers.sharableModel.getter();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v16, v53);
      uint64_t v54 = v86[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005CE8(0, *(void *)(v54 + 16) + 1, 1);
        uint64_t v54 = v86[0];
      }
      unint64_t v56 = *(void *)(v54 + 16);
      unint64_t v55 = *(void *)(v54 + 24);
      if (v56 >= v55 >> 1)
      {
        sub_100005CE8(v55 > 1, v56 + 1, 1);
        uint64_t v54 = v86[0];
      }
      *(void *)(v54 + 16) = v56 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v83 + 32))(v54+ ((*(unsigned __int8 *)(v83 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80))+ *(void *)(v83 + 72) * v56, v84, v81);
      v86[0] = v54;
      v51 += v52;
      --v49;
    }
    while (v49);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for SharableModelGeneratorPipelineManager();
  sub_10000A884((uint64_t)v88, (uint64_t)v86);
  swift_retain();
  swift_retain();
  id v57 = v79;
  GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
  type metadata accessor for GeneratorPipelineGenerationOperation();
  dispatch thunk of CountryOracle.currentCountry()();
  uint64_t v58 = GenerationWorkRequest.generationPhases.getter();
  sub_10002E56C(v58);
  swift_bridgeObjectRelease();
  GenerationWorkRequest.commitUrgentTransaction.getter();
  unint64_t v59 = v70;
  *uint64_t v70 = 150;
  (*(void (**)(void *, void, uint64_t))(v69 + 104))(v59, enum case for DispatchTimeInterval.seconds(_:), v71);
  uint64_t v60 = GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)();
  sub_10000C454(&qword_100046180, (void (*)(uint64_t))&type metadata accessor for GeneratorPipelineGenerationOperation);
  sub_10000E7F8((uint64_t)v88);
  return v60;
}

uint64_t sub_100026E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  v26[3] = a12;
  v26[4] = a14;
  uint64_t v17 = sub_100027048(v26);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a12 - 8) + 32))(v17, a8, a12);
  v25[3] = a11;
  v25[4] = a13;
  uint64_t v18 = sub_100027048(v25);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a11 - 8) + 32))(v18, a9, a11);
  type metadata accessor for HealthPluginHostService.JustPrimarySnippetsFeedItemGeneratorPipelineManager(0);
  swift_allocObject();
  sub_10000A884(a1, (uint64_t)v24);
  sub_10000A884(a5, (uint64_t)v23);
  sub_10000A884((uint64_t)v26, (uint64_t)v22);
  sub_10000A884((uint64_t)v25, (uint64_t)v21);
  uint64_t v19 = FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)();
  sub_10000E7F8((uint64_t)v25);
  sub_10000E7F8((uint64_t)v26);
  sub_10000E7F8(a5);
  sub_10000E7F8(a1);
  return v19;
}

uint64_t sub_100026FF8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_100027048(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000270AC()
{
  return sub_10000EAE4((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_1000270C4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000270D4()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002711C()
{
  return sub_100025580(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_100027128()
{
  unint64_t result = qword_100046C10;
  if (!qword_100046C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046C10);
  }
  return result;
}

uint64_t sub_10002717C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002718C(uint64_t a1, uint64_t a2)
{
  return sub_100024654(a1, a2, *(unsigned char *)(v2 + 16));
}

void sub_100027194(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_10000EC60(255, a3);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000271F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027230()
{
  return sub_100027274((uint64_t (*)(uint64_t))&GenerationWorkRequest.completionBlock.getter, "[%s] finished work, clearing progress from progress list");
}

uint64_t sub_100027254()
{
  return sub_100027274((uint64_t (*)(uint64_t))&GenerationWorkRequest.notStartedCancellationBlock.getter, "[%s] Work cancelled before starting, clearing progress from progress list");
}

uint64_t sub_100027274(uint64_t (*a1)(uint64_t), const char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for GenerationWorkRequest() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  return sub_10002394C(v2 + v6, *(void *)(v2 + v7), v2 + v9, *(void *)(v2 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8)), a1, a2);
}

uint64_t sub_100027388()
{
  uint64_t v1 = type metadata accessor for GenerationWorkRequest();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100027444()
{
  return sub_10000EAE4((void (*)(void))&_swift_release);
}

uint64_t sub_10002745C()
{
  return sub_100023BD8(v0[2], v0[3], v0[4]);
}

uint64_t sub_100027468()
{
  uint64_t v1 = type metadata accessor for TransactionRecord();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v12 = v3 | v8 | 7;
  unint64_t v10 = ((((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return _swift_deallocObject(v0, v10, v12);
}

uint64_t sub_100027600()
{
  uint64_t v1 = *(void *)(type metadata accessor for TransactionRecord() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v5 = (v3 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v0 + 16);
  uint64_t v7 = *(void *)(v0 + v3);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_1000235F0(v6, v0 + v2, v7, v0 + v5, v8);
}

uint64_t sub_10002771C()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100027764()
{
  uint64_t v1 = *(void **)(v0 + 24);
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 32);
  [*(id *)(v0 + 16) cancel];
  [v1 cancel];
  return v2(0);
}

uint64_t sub_1000277B4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000277EC(uint64_t a1)
{
  return sub_1000219E8(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000277F4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  sub_10000912C(0, a2, a3, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_100027864(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000278B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

char *sub_100027914(uint64_t a1, uint64_t a2)
{
  int64_t v3 = 0;
  uint64_t v6 = *(void *)(a1 + 64);
  unint64_t result = (char *)(a1 + 64);
  uint64_t v5 = v6;
  uint64_t v7 = 1 << *(result - 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  uint64_t i = v8 & v5;
  uint64_t v27 = result;
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v29 = a2 + 56;
  if ((v8 & v5) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  while (2)
  {
    if (!__OFADD__(v3++, 1))
    {
      if (v3 >= v28) {
        goto LABEL_42;
      }
      uint64_t v11 = *(void *)&v27[8 * v3];
      if (v11)
      {
LABEL_18:
        for (uint64_t i = (v11 - 1) & v11; ; i &= i - 1)
        {
          swift_retain();
          uint64_t v13 = dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter();
          uint64_t v15 = v14;
          if (!*(void *)(a2 + 16)) {
            goto LABEL_6;
          }
          uint64_t v16 = v13;
          Hasher.init(_seed:)();
          String.hash(into:)();
          Swift::Int v17 = Hasher._finalize()();
          uint64_t v18 = -1 << *(unsigned char *)(a2 + 32);
          unint64_t v19 = v17 & ~v18;
          if (((*(void *)(v29 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
            goto LABEL_6;
          }
          uint64_t v20 = *(void *)(a2 + 48);
          uint64_t v21 = (void *)(v20 + 16 * v19);
          BOOL v22 = *v21 == v16 && v21[1] == v15;
          if (!v22 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
LABEL_26:
          swift_bridgeObjectRelease();
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          unint64_t result = (char *)specialized ContiguousArray._endMutation()();
          if (!i) {
            goto LABEL_8;
          }
LABEL_7:
          ;
        }
        uint64_t v23 = ~v18;
        while (1)
        {
          unint64_t v19 = (v19 + 1) & v23;
          if (((*(void *)(v29 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
            break;
          }
          id v24 = (void *)(v20 + 16 * v19);
          BOOL v25 = *v24 == v16 && v24[1] == v15;
          if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_26;
          }
        }
LABEL_6:
        swift_release();
        unint64_t result = (char *)swift_bridgeObjectRelease();
        if (!i) {
          continue;
        }
        goto LABEL_7;
      }
      int64_t v12 = v3 + 1;
      if (v3 + 1 >= v28) {
        goto LABEL_42;
      }
      uint64_t v11 = *(void *)&v27[8 * v12];
      if (!v11)
      {
        int64_t v12 = v3 + 2;
        if (v3 + 2 >= v28) {
          goto LABEL_42;
        }
        uint64_t v11 = *(void *)&v27[8 * v12];
        if (!v11)
        {
          int64_t v12 = v3 + 3;
          if (v3 + 3 < v28)
          {
            uint64_t v11 = *(void *)&v27[8 * v12];
            if (v11) {
              goto LABEL_17;
            }
            int64_t v26 = v3 + 4;
            if (v3 + 4 < v28)
            {
              uint64_t v11 = *(void *)&v27[8 * v26];
              v3 += 4;
              if (v11) {
                goto LABEL_18;
              }
              while (1)
              {
                int64_t v3 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_44;
                }
                if (v3 >= v28) {
                  break;
                }
                uint64_t v11 = *(void *)&v27[8 * v3];
                ++v26;
                if (v11) {
                  goto LABEL_18;
                }
              }
            }
          }
LABEL_42:
          swift_release();
          return (char *)&_swiftEmptyArrayStorage;
        }
      }
LABEL_17:
      int64_t v3 = v12;
      goto LABEL_18;
    }
    break;
  }
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_100027BF8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BundleFeedItemPluginBundleProvider();
  static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
  uint64_t v6 = dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
  swift_release();
  if (!a1 || !*(void *)(a1 + 16))
  {
    unint64_t v9 = (unint64_t)sub_10000D774(v6);
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = (unint64_t)sub_100027914(v7, a1);
  unint64_t v9 = v8;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 == *(void *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    return v9;
  }
  static Logger.daemon.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  int64_t v12 = Logger.logObject.getter();
  int v13 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v12, (os_log_type_t)v13))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_23:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v9;
  }
  int v37 = v13;
  os_log_t v38 = v12;
  uint64_t v14 = swift_slowAlloc();
  uint64_t v36 = swift_slowAlloc();
  uint64_t v41 = v36;
  *(_DWORD *)uint64_t v14 = 136315394;
  unint64_t v39 = (uint8_t *)(v14 + 4);
  swift_bridgeObjectRetain();
  uint64_t v15 = Set.description.getter();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  uint64_t v40 = (void *)sub_10000E724(v15, v17, &v41);
  id v35 = &v41;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  unint64_t v39 = (uint8_t *)v14;
  *(_WORD *)(v14 + 12) = 2080;
  if (!v10)
  {
LABEL_22:
    int64_t v26 = v39;
    uint64_t v27 = Array.description.getter();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v40 = (void *)sub_10000E724(v27, v29, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v30 = v38;
    _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v37, "Not all plugins found with identifiers %s, but found %s", v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_bridgeObjectRelease();

    goto LABEL_23;
  }
  uint64_t v31 = v6;
  uint64_t v32 = v5;
  uint64_t v33 = v3;
  uint64_t v34 = v2;
  uint64_t v40 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100025C18(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = 0;
    unint64_t v19 = v40;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        swift_retain();
      }
      uint64_t v20 = dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter();
      uint64_t v22 = v21;
      swift_release();
      uint64_t v40 = v19;
      unint64_t v24 = v19[2];
      unint64_t v23 = v19[3];
      if (v24 >= v23 >> 1)
      {
        sub_100025C18(v23 > 1, v24 + 1, 1);
        unint64_t v19 = v40;
      }
      ++v18;
      v19[2] = v24 + 1;
      BOOL v25 = &v19[2 * v24];
      v25[4] = v20;
      uint64_t v25[5] = v22;
    }
    while (v10 != v18);
    uint64_t v3 = v33;
    uint64_t v2 = v34;
    uint64_t v5 = v32;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_100028070(unint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = a2;
  uint64_t v6 = type metadata accessor for ModelTrainingEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v32 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
    if (!v9) {
      return (uint64_t)v10;
    }
    uint64_t v36 = _swiftEmptyArrayStorage;
    uint64_t v11 = sub_100025C58(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0) {
      break;
    }
    v27[0] = a3;
    a3 = 0;
    uint64_t v10 = v36;
    v27[1] = (id)(v7 + 32);
    unint64_t v28 = a1 & 0xC000000000000001;
    unint64_t v29 = (void *)v9;
    unint64_t v30 = a1;
    while ((void *)v9 != a3)
    {
      if (v28) {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v13 = *(id *)(a1 + 8 * (void)a3 + 32);
      }
      uint64_t v14 = v13;
      uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v17 = v16;
      sub_10000C454(&qword_100046690, (void (*)(uint64_t))&type metadata accessor for ModelTrainingEvent);
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      uint64_t v11 = v15;
      unint64_t v12 = v17;
      if (v3) {
        goto LABEL_18;
      }
      sub_1000283F8(v15, v17);

      uint64_t v36 = v10;
      unint64_t v19 = v10[2];
      unint64_t v18 = v10[3];
      if (v19 >= v18 >> 1)
      {
        sub_100025C58(v18 > 1, v19 + 1, 1);
        uint64_t v10 = v36;
      }
      a3 = (char *)a3 + 1;
      v10[2] = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v19, v32, v6);
      uint64_t v9 = (uint64_t)v29;
      a1 = v30;
      if (v29 == a3) {
        return (uint64_t)v10;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_18:
  sub_1000283F8(v11, v12);
  uint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  _StringGuts.grow(_:)(42);
  id v21 = [v27[0] description];
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v24 = v23;

  v25._countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._object = (void *)0x8000000100039B40;
  v26._countAndFlagsBits = 0xD000000000000026;
  String.append(_:)(v26);
  uint64_t v33 = v3;
  sub_10000EC60(0, &qword_100045F48);
  _print_unlocked<A, B>(_:_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000283F8(uint64_t a1, unint64_t a2)
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

void sub_100028450()
{
  if (!qword_100046700)
  {
    sub_100013D08(255);
    sub_10000C454(&qword_100046708, sub_100013D08);
    unint64_t v0 = type metadata accessor for GeneratorPipelineManager.GenerationState();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046700);
    }
  }
}

uint64_t sub_1000284E4()
{
  sub_10000E7F8((uint64_t)(v0 + 4));
  swift_release();
  swift_release();
  sub_10000E7F8((uint64_t)(v0 + 11));
  swift_release();

  return _swift_deallocObject(v0, 160, 7);
}

uint64_t sub_100028564()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028574()
{
  return sub_10001EAFC(*(void *)(v0 + 16));
}

uint64_t sub_100028580()
{
  uint64_t v1 = *(void *)(type metadata accessor for TransactionRecord() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10001ECDC(v3, v0 + v2, v4);
}

uint64_t sub_10002861C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028654()
{
  uint64_t v1 = type metadata accessor for TransactionRecord();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  uint64_t v5 = (v3 + 48) & ~v3;
  unint64_t v6 = (((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v5, v1);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((v8 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

id sub_1000287B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for TransactionRecord() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001EDB4(*(void *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), v0 + v2, *(void *)(v0 + v3), *(uint8_t **)(v0 + v4), *(void **)(v0 + v4 + 8), *(void **)(v0 + v5), *(void **)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(uint64_t))(v0 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0+ ((((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10002888C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000288C4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100028904()
{
  sub_10001F7F0(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100028914()
{
  return sub_10001F884(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100028920()
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  unint64_t v2 = (int *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(*(void *)(v1 - 8) + 64);

  uint64_t v6 = v0 + v4 + v2[11];
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
  unint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v0 + v4 + v2[12], v7);
  uint64_t v9 = v0 + v4 + v2[13];
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }

  return _swift_deallocObject(v0, ((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t sub_100028ADC(unsigned __int8 *a1)
{
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *a1;

  return sub_100025C0C(v7, v1 + v5, v6);
}

uint64_t sub_100028B94(uint64_t a1, uint64_t a2, void (**a3)(void))
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = a3;
  _Block_copy(a3);
  swift_retain();
  dispatch thunk of UnfairLock.lock()();
  uint64_t v9 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  swift_release();
  if (v9)
  {
    int64_t v10 = *(void *)(a1 + 16);
    if (v10)
    {
      uint64_t v27 = _swiftEmptyArrayStorage;
      sub_100025C38(0, v10, 0);
      uint64_t v11 = v27;
      unint64_t v12 = (void **)(a1 + 40);
      while (1)
      {
        uint64_t v14 = (uint64_t)*(v12 - 1);
        id v13 = *v12;
        swift_bridgeObjectRetain_n();
        char v15 = Feed.Kind.init(rawValue:)();
        if (v15 == 6) {
          break;
        }
        char v16 = v15;
        swift_bridgeObjectRelease();
        uint64_t v27 = v11;
        unint64_t v18 = v11[2];
        unint64_t v17 = v11[3];
        if (v18 >= v17 >> 1)
        {
          sub_100025C38(v17 > 1, v18 + 1, 1);
          uint64_t v11 = v27;
        }
        v12 += 2;
        v11[2] = v18 + 1;
        *((unsigned char *)v11 + v18 + 32) = v16;
        if (!--v10) {
          goto LABEL_8;
        }
      }
      v26[1] = 0;
      void v26[2] = 0xE000000000000000;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(53);
      v23._object = (void *)0x8000000100039BB0;
      v23._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v23);
      v24._countAndFlagsBits = v14;
      v24._object = v13;
      String.append(_:)(v24);
      v25._countAndFlagsBits = 0xD00000000000001ELL;
      v25._object = (void *)0x8000000100039BD0;
      String.append(_:)(v25);
      swift_release();
      _Block_release(a3);
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
LABEL_8:
      dispatch thunk of BaseFeedPopulationManager.deleteFeed(feedKinds:completion:)();
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    static Logger.personalization.getter();
    uint64_t v20 = Logger.logObject.getter();
    uint64_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, (os_log_type_t)v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v21, "Unable to resolve FeedPopulationManager for personalization analytics", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    a3[2](a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_100028F40(uint64_t (*a1)(void, void), uint64_t a2)
{
  swift_getObjectType();
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  unint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = a2;
    uint64_t v10 = swift_slowAlloc();
    unint64_t v18 = a1;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v16 = v4;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v12 = _typeName(_:qualified:)();
    uint64_t v19 = sub_10000E724(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s] Handle journaled sharing entries by scheduling background generation", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v18;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_100023FD0((void (*)(char *, uint64_t))1);
  return a1(1, 0);
}

uint64_t sub_10002917C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B480(0, &qword_1000466F0, (uint64_t (*)(uint64_t, uint64_t, unint64_t))type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration);
  uint64_t v9 = v8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  sub_10000F808(a1, (uint64_t)v11);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  int v30 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v26 = v9;
    uint64_t v19 = v18;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v19 = 136446466;
    uint64_t v29 = v12;
    uint64_t v20 = sub_10000EA60(a2);
    uint64_t v28 = v13;
    uint64_t v31 = sub_10000E724(v20, v21, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v11[*(int *)(v26 + 36)], v4);
    uint64_t v22 = String.init<A>(describing:)();
    uint64_t v31 = sub_10000E724(v22, v23, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000F790((uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v30, "[%{public}s]: Foreground spinner picking ending because %{public}s seconds have passed without a Highlights generator", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v29);
  }
  else
  {
    sub_10000F790((uint64_t)v11);

    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_1000294E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1000052E4(*(void **)(v1 + 24), "[TransactionManagedCache]: Creating new pinned content manager for background", a1);
}

uint64_t sub_100029504()
{
  sub_10000E7F8(v0 + 24);
  sub_10000E7F8(v0 + 64);

  return _swift_deallocObject(v0, 120, 7);
}

uint64_t sub_100029554(uint64_t a1)
{
  return sub_10001E290(a1, *(void **)(v1 + 16), v1 + 24, (void *)(v1 + 64), *(void *)(v1 + 104), *(void *)(v1 + 112));
}

uint64_t sub_10002956C()
{
  return sub_100029694((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))sub_10001E368);
}

uint64_t sub_100029588()
{
  uint64_t v1 = type metadata accessor for TransactionRecord();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, ((v6 + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_10002967C()
{
  return sub_100029694((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))sub_10001E89C);
}

uint64_t sub_100029694(uint64_t (*a1)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for TransactionRecord() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *(void *)(v1 + v4);
  uint64_t v8 = *(void *)(v1 + v4 + 8);

  return a1(v5, v1 + v3, v7, v8, v6);
}

uint64_t sub_10002974C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for TransactionRecord() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_10001ED48(a1, *(void *)(v1 + 16), v1 + v4, *(uint64_t (**)(void))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000297E8()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100029828()
{
  return sub_10001E668(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100029834()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002986C()
{
  return sub_10001C878(*(_DWORD *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "[%s] (pid %d) invalidated");
}

uint64_t sub_100029894()
{
  return sub_10001C878(*(_DWORD *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), "[%s] (pid %d) interrupted");
}

uint64_t sub_1000298BC(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

void sub_1000298D4(char a1, uint64_t a2)
{
  sub_1000222C4(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000298DC()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100029914(uint64_t a1)
{
  return sub_100021D00(a1, *(unsigned __int8 *)(v1 + 16), *(void (**)(void, void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_100029924()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_100029934()
{
  uint64_t v1 = *(void *)(v0 + 16);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(v1 + 16))(v1, isa);
}

uint64_t sub_1000299FC(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v61 = a2;
  uint64_t v5 = *v3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v60 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v53 - v10;
  dispatch thunk of UnfairLock.lock()();
  uint64_t v12 = sub_1000047D8();
  dispatch thunk of UnfairLock.unlock()();
  uint64_t v59 = v6;
  if (!v12)
  {
LABEL_7:
    static Logger.general.getter();
    swift_retain_n();
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v62 = v57;
      uint64_t v63 = v5;
      *(_DWORD *)uint64_t v42 = 136315650;
      swift_getMetatypeMetadata();
      uint64_t v43 = String.init<A>(describing:)();
      uint64_t v58 = a3;
      uint64_t v63 = sub_10000E724(v43, v44, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      uint64_t v63 = v3[2];
      sub_10002BA54(0, &qword_100046990, (uint64_t (*)(uint64_t))&type metadata accessor for ProfileDashboardsFeedPopulationListener, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      swift_retain();
      uint64_t v45 = String.init<A>(describing:)();
      uint64_t v63 = sub_10000E724(v45, v46, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 22) = 2080;
      dispatch thunk of UnfairLock.lock()();
      uint64_t v47 = sub_1000047D8();
      dispatch thunk of UnfairLock.unlock()();
      uint64_t v63 = v47;
      sub_10002BA54(0, &qword_100046998, (uint64_t (*)(uint64_t))&type metadata accessor for SummaryTabFeedPopulationManager, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      uint64_t v48 = String.init<A>(describing:)();
      uint64_t v63 = sub_10000E724(v48, v49, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "[%s]: Cannot pick because dependencies unavailable: profileDashboardsFeedPopulationListener=%s, summaryTabFeedPopulationManager=%s", (uint8_t *)v42, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v50 = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v9, v59);
    }
    else
    {

      swift_release_n();
      uint64_t v50 = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v9, v6);
    }
    return v61(v50);
  }
  uint64_t v13 = v3[2];
  if (!v13)
  {
    swift_release();
    uint64_t v6 = v59;
    goto LABEL_7;
  }
  swift_retain();
  uint64_t v14 = dispatch thunk of SummaryTabFeedPopulationManager.managedFeedKinds.getter();
  uint64_t v15 = sub_100030434(v14);
  swift_bridgeObjectRelease();
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_100030434(v16);
  swift_bridgeObjectRelease();
  Swift::Int v18 = sub_10002F38C(v17, v15);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_10002E6EC(v18);
  swift_release();
  uint64_t v20 = dispatch thunk of ProfileDashboardsFeedPopulationListener.managedFeedKinds.getter();
  uint64_t v21 = sub_100030434(v20);
  swift_bridgeObjectRelease();
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = sub_100030434(v22);
  swift_bridgeObjectRelease();
  Swift::Int v24 = sub_10002F38C(v23, v21);
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_10002E6EC(v24);
  swift_release();
  uint64_t v26 = swift_bridgeObjectRetain();
  uint64_t v27 = sub_100030434(v26);
  swift_bridgeObjectRelease();
  uint64_t v63 = (uint64_t)v19;
  swift_retain();
  swift_retain();
  sub_10002E9C0((uint64_t)v25);
  uint64_t v28 = sub_10002EB0C(v63, v27);
  swift_bridgeObjectRelease();
  if (v28[2])
  {
    static Logger.personalization.getter();
    swift_retain();
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      LODWORD(v57) = v31;
      uint64_t v33 = v32;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v62 = v55;
      uint64_t v63 = v5;
      *(_DWORD *)uint64_t v33 = 136315394;
      uint64_t v58 = a3;
      uint64_t v56 = v5;
      swift_getMetatypeMetadata();
      os_log_t v54 = v29;
      uint64_t v34 = String.init<A>(describing:)();
      uint64_t v63 = sub_10000E724(v34, v35, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      v53[1] = v33 + 14;
      sub_100030514();
      swift_retain();
      uint64_t v36 = Set.description.getter();
      unint64_t v38 = v37;
      swift_release();
      uint64_t v63 = sub_10000E724(v36, v38, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      a3 = v58;
      swift_bridgeObjectRelease();
      os_log_t v39 = v54;
      _os_log_impl((void *)&_mh_execute_header, v54, (os_log_type_t)v57, "[%s]: We've been asked to populate a feed that we don't know how to: %s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v5 = v56;
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v11, v59);
  }
  else
  {
    swift_release();
  }
  uint64_t v52 = (void *)swift_allocObject();
  v52[2] = v19;
  v52[3] = v13;
  v52[4] = v25;
  v52[5] = v12;
  v52[6] = v61;
  v52[7] = a3;
  v52[8] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  dispatch thunk of BaseFeedPopulationManager.populateFeed(feedKinds:completion:)();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_10002A190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v33 = a5;
  uint64_t v34 = a7;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = v11;
    uint64_t v18 = v17;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v35 = v27;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v31 = a3;
    uint64_t v36 = v34;
    swift_getMetatypeMetadata();
    uint64_t v32 = a2;
    uint64_t v19 = String.init<A>(describing:)();
    uint64_t v30 = a6;
    uint64_t v36 = sub_10000E724(v19, v20, &v35);
    uint64_t v29 = a4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v21 = Array.description.getter();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    uint64_t v24 = v21;
    a6 = v30;
    uint64_t v36 = sub_10000E724(v24, v23, &v35);
    a4 = v29;
    a3 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s: populateFeedsIfAvailable() finished summary tab feedKinds: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v25 = (void *)swift_allocObject();
  v25[2] = a3;
  v25[3] = a4;
  v25[4] = v33;
  uint64_t v25[5] = a6;
  v25[6] = v34;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  dispatch thunk of ProfileDashboardsFeedPopulationListener.populateAllFeeds(feedKinds:completion:)();
  return swift_release();
}

uint64_t sub_10002A4B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v23[1] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v24 = a3;
    uint64_t v25 = v15;
    uint64_t v26 = a5;
    swift_getMetatypeMetadata();
    void v23[2] = a4;
    uint64_t v16 = String.init<A>(describing:)();
    uint64_t v26 = sub_10000E724(v16, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v18 = Array.description.getter();
    v23[0] = v8;
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_10000E724(v18, v20, &v25);
    a3 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: populateFeedsIfAvailable() finished profile dashboard feedKinds: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v21 = (*(uint64_t (**)(char *, void))(v9 + 8))(v11, v23[0]);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return a3(v21);
}

id *sub_10002A754()
{
  type metadata accessor for FeedPopulationManagerOracle();
  DebuggingResponder.deregisterForDebuggingRequests()();
  swift_release();

  swift_release();
  swift_weakDestroy();
  swift_release();
  return v0;
}

uint64_t sub_10002A7AC()
{
  sub_10002A754();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for FeedPopulationManagerOracle()
{
  return self;
}

uint64_t sub_10002A804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_10002B9C0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  sub_10000A884(a1, (uint64_t)v26);
  os_log_type_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    void v23[2] = a2;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    v23[1] = a3;
    uint64_t v25 = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    v23[0] = a1;
    v24[0] = v7;
    swift_getMetatypeMetadata();
    uint64_t v18 = String.init<A>(describing:)();
    v24[0] = sub_10000E724(v18, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_10000A884((uint64_t)v26, (uint64_t)v24);
    sub_10000EC10(0, (unint64_t *)&qword_1000460C0);
    uint64_t v20 = String.init<A>(describing:)();
    v24[0] = sub_10000E724(v20, v21, &v25);
    a1 = v23[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10000E7F8((uint64_t)v26);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%s]: createProfileDashboardFeedPopulationListener() readyHealthExperienceStore: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10000E7F8((uint64_t)v26);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_10000A884(a1, (uint64_t)v26);
  sub_10001B128();
  sub_10000681C((unint64_t *)&qword_1000466E8, (void (*)(uint64_t))sub_10001B128);
  swift_retain();
  static FeedPopulationListenerSchedulerConfiguration.realtime(queue:)();
  type metadata accessor for ProfileDashboardsFeedPopulationListener();
  swift_allocObject();
  return ProfileDashboardsFeedPopulationListener.init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)();
}

uint64_t sub_10002AB98()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - v8;
  uint64_t v10 = (void *)Notification.oracle.getter();
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();

  if (v30)
  {
    sub_10000A908(&v29, (uint64_t)v31);
    static Logger.daemon.getter();
    sub_10000A884((uint64_t)v31, (uint64_t)&v29);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      v27[0] = v2;
      swift_getMetatypeMetadata();
      uint64_t v26 = v3;
      uint64_t v14 = String.init<A>(describing:)();
      v27[0] = sub_10000E724(v14, v15, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      sub_10000A884((uint64_t)&v29, (uint64_t)v27);
      sub_10000EC10(0, (unint64_t *)&qword_1000460C0);
      uint64_t v16 = String.init<A>(describing:)();
      v27[0] = sub_10000E724(v16, v17, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_10000E7F8((uint64_t)&v29);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%s]: storeDidUpdate(from:) healthExperienceStore: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v26);
    }
    else
    {
      sub_10000E7F8((uint64_t)&v29);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
    uint64_t v24 = sub_10002A804((uint64_t)v31, v1[6], v1[5]);
    sub_10000E7F8((uint64_t)v31);
    v1[2] = v24;
    return swift_release();
  }
  else
  {
    sub_10001727C((uint64_t)&v29);
    static Logger.daemon.getter();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v26 = v3;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315138;
      v31[0] = v2;
      swift_getMetatypeMetadata();
      uint64_t v21 = String.init<A>(describing:)();
      v31[0] = sub_10000E724(v21, v22, (uint64_t *)&v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%s]: storeDidUpdate(from:) no store", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v26);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
  }
}

uint64_t sub_10002B0E8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = v1;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v9 = String.init<A>(describing:)();
    uint64_t v13 = sub_10000E724(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%s]: debuggingInfoRequested()", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10002B3D4()
{
  _StringGuts.grow(_:)(84);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  sub_10002B5F8();
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 32;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._object = (void *)0x8000000100039200;
  v4._countAndFlagsBits = 0xD00000000000001ELL;
  String.append(_:)(v4);
  id v5 = *(id *)(v0 + 24);
  id v6 = [v5 description];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);

  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0xD00000000000002BLL;
  v11._object = (void *)0x8000000100039FC0;
  String.append(_:)(v11);
  sub_10002BA54(0, &qword_100046990, (uint64_t (*)(uint64_t))&type metadata accessor for ProfileDashboardsFeedPopulationListener, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  swift_retain();
  v12._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 62;
  v13._object = (void *)0xE100000000000000;
  String.append(_:)(v13);
  return 0;
}

uint64_t sub_10002B5D4()
{
  return sub_10002B3D4();
}

unint64_t sub_10002B5F8()
{
  unint64_t result = qword_100046988;
  if (!qword_100046988)
  {
    type metadata accessor for FeedPopulationManagerOracle();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100046988);
  }
  return result;
}

void *sub_10002B630(void *result, int64_t a2, char a3, void *a4, unint64_t *a5, unint64_t *a6, uint64_t a7)
{
  char v9 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v11 = a2;
    goto LABEL_8;
  }
  unint64_t v10 = a4[3];
  uint64_t v11 = v10 >> 1;
  if ((uint64_t)(v10 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v11 + 0x4000000000000000 >= 0)
  {
    uint64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v10 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v11 = a2;
    }
LABEL_8:
    uint64_t v12 = a4[2];
    if (v11 <= v12) {
      uint64_t v13 = a4[2];
    }
    else {
      uint64_t v13 = v11;
    }
    if (v13)
    {
      sub_10001AF44(0, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v14 = (void *)swift_allocObject();
      size_t v15 = j__malloc_size(v14);
      void v14[2] = v12;
      v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
      uint64_t v16 = v14 + 4;
      if (v9)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[5 * v12 + 4]) {
          memmove(v16, a4 + 4, 40 * v12);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v14 = _swiftEmptyArrayStorage;
      uint64_t v16 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100030018(0, v12, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

char *sub_10002B788(char *result, int64_t a2, char a3, char *a4)
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
      sub_100030838(0, &qword_1000466A0);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
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
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10003061C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10002B890(void *result, int64_t a2, char a3, void *a4)
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
      sub_100030838(0, &qword_1000469D0);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_10003090C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_10002B9C0()
{
  if (!qword_1000466E0)
  {
    sub_10001B128();
    sub_10000681C((unint64_t *)&qword_1000466E8, (void (*)(uint64_t))sub_10001B128);
    unint64_t v0 = type metadata accessor for FeedPopulationListenerSchedulerConfiguration();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000466E0);
    }
  }
}

void sub_10002BA54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_10002BAB8(unsigned char *a1, Swift::Int a2)
{
  Swift::String v3 = v2;
  uint64_t v6 = *v2;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  Feed.Kind.rawValue.getter();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v7 = Hasher._finalize()();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = Feed.Kind.rawValue.getter();
    uint64_t v12 = v11;
    if (v10 == Feed.Kind.rawValue.getter() && v12 == v13)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_18;
    }
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15)
    {
LABEL_7:
      swift_bridgeObjectRelease();
LABEL_18:
      uint64_t result = 0;
      LOBYTE(a2) = *(unsigned char *)(*(void *)(*v3 + 48) + v9);
      goto LABEL_19;
    }
    uint64_t v16 = ~v8;
    while (1)
    {
      unint64_t v9 = (v9 + 1) & v16;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        break;
      }
      uint64_t v17 = Feed.Kind.rawValue.getter();
      uint64_t v19 = v18;
      if (v17 == Feed.Kind.rawValue.getter() && v19 == v20) {
        goto LABEL_17;
      }
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v25 = *v3;
  void *v3 = 0x8000000000000000;
  sub_10002CCA0(a2, v9, isUniquelyReferenced_nonNull_native);
  void *v3 = v25;
  swift_bridgeObjectRelease();
  uint64_t result = 1;
LABEL_19:
  *a1 = a2;
  return result;
}

uint64_t sub_10002BCD4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10002CEC8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10002BE84(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = v2;
  uint64_t v6 = *v2;
  Swift::Int v7 = *(void *)(*v2 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v8 = AnyHashable._rawHashValue(seed:)(v7);
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      sub_1000278B8(*(void *)(v6 + 48) + 40 * v10, (uint64_t)v17);
      char v12 = static AnyHashable.== infix(_:_:)();
      sub_100027864((uint64_t)v17);
      if (v12) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_100027864(a2);
    sub_1000278B8(*(void *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_1000278B8(a2, (uint64_t)v17);
    uint64_t v16 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_10002D064((Swift::Int)v17, v10, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v16;
    swift_bridgeObjectRelease();
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v14;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_10002C000()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for GenerationPhase();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin();
  os_log_type_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_10003070C();
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    long long v14 = v41;
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
                  *unint64_t v37 = -1 << v34;
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
      sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
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
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_10002C3F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000305C0();
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
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
                uint64_t v1 = v0;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
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
      char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
      Hasher.init(_seed:)();
      Feed.Kind.rawValue.getter();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      uint64_t result = Hasher._finalize()();
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
      *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10002C6CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100030A04(0, &qword_1000469C8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10002C9C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100030A04(0, &qword_1000469D8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
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
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
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
            goto LABEL_38;
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
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10002CCA0(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  char v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_10002C3F8();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_10002D478();
LABEL_22:
      uint64_t v24 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(unsigned char *)(*(void *)(v24 + 48) + a2) = v6;
      uint64_t v25 = *(void *)(v24 + 16);
      BOOL v26 = __OFADD__(v25, 1);
      uint64_t v27 = v25 + 1;
      if (!v26)
      {
        *(void *)(v24 + 16) = v27;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_10002DD60();
  }
  uint64_t v9 = *v3;
  Hasher.init(_seed:)();
  Feed.Kind.rawValue.getter();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t result = Hasher._finalize()();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v11 = Feed.Kind.rawValue.getter();
  uint64_t v13 = v12;
  if (v11 == Feed.Kind.rawValue.getter() && v13 == v14)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = ~v10;
    do
    {
      a2 = (a2 + 1) & v17;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v18 = Feed.Kind.rawValue.getter();
      uint64_t v20 = v19;
      if (v18 == Feed.Kind.rawValue.getter() && v20 == v21) {
        goto LABEL_25;
      }
      char v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v23 & 1) == 0);
  }
LABEL_26:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

Swift::Int sub_10002CEC8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10002C6CC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10002D608();
      goto LABEL_22;
    }
    sub_10002E000();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

Swift::Int sub_10002D064(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_10002C9C0();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_10002D7D0();
      goto LABEL_12;
    }
    sub_10002E2C4();
  }
  uint64_t v9 = *v3;
  uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_1000278B8(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = static AnyHashable.== infix(_:_:)();
      uint64_t result = sub_100027864((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *sub_10002D1D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for GenerationPhase();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003070C();
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  BOOL v23 = v1;
  uint64_t v24 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, v24, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v24 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v24 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_12:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v18, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v18, v5, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v24 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v24 + v12);
    ++v21;
    if (v20) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_10002D478()
{
  uint64_t v1 = v0;
  sub_1000305C0();
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
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

void *sub_10002D608()
{
  uint64_t v1 = v0;
  sub_100030A04(0, &qword_1000469C8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002D7D0()
{
  uint64_t v1 = v0;
  sub_100030A04(0, &qword_1000469D8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_1000278B8(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10002D9B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for GenerationPhase();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_10003070C();
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
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
    sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
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

uint64_t sub_10002DD60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000305C0();
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
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
    char v19 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    Hasher.init(_seed:)();
    Feed.Kind.rawValue.getter();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
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
          goto LABEL_36;
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
    *(unsigned char *)(*(void *)(v4 + 48) + v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
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

uint64_t sub_10002E000()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100030A04(0, &qword_1000469C8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    char v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002E2C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100030A04(0, &qword_1000469D8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
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
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_1000278B8(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_10002E56C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_10002BA54(0, &qword_1000466C0, (uint64_t (*)(uint64_t))&type metadata accessor for GenerationPhase, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  uint64_t v3 = *(void *)(type metadata accessor for GenerationPhase() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (char *)j__malloc_size(v6);
  if (v4)
  {
    if (&result[-v5] != (char *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)&result[-v5] / v4);
      uint64_t v9 = sub_10002FB3C(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_100030704();
      if (v9 == v1) {
        return (char *)v6;
      }
      __break(1u);
      return (char *)&_swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_10002E6EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100030838(0, &qword_1000466A0);
  uint64_t v3 = swift_allocObject();
  size_t v4 = j__malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  unint64_t v5 = sub_10002FE84(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_100030704();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v3;
}

uint64_t sub_10002E7D0(uint64_t a1)
{
  return sub_10002E808(a1, &qword_100046450, &qword_100045F50, (uint64_t)&protocol descriptor for ExecutorProvider);
}

uint64_t sub_10002E7EC(uint64_t a1)
{
  return sub_10002E808(a1, &qword_100046430, &qword_100046438, (uint64_t)&protocol descriptor for InputSignalProvider);
}

uint64_t sub_10002E808(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)v4;
  int64_t v7 = *(void *)(*(void *)v4 + 16);
  int64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v8 <= v6[3] >> 1)
  {
    unint64_t v14 = *(void *)(a1 + 16);
    if (v14) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v5) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v7 <= v8) {
    int64_t v21 = v7 + v5;
  }
  else {
    int64_t v21 = v7;
  }
  uint64_t v6 = sub_10002B630(isUniquelyReferenced_nonNull_native, v21, 1, v6, a2, a3, a4);
  unint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v15 = v6[2];
  if ((v6[3] >> 1) - v15 < (uint64_t)v14)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v16 = (unint64_t)&v6[5 * v15 + 4];
  if (a1 + 32 < v16 + 40 * v14 && v16 < a1 + 32 + 40 * v14) {
    goto LABEL_24;
  }
  sub_10000EC10(0, a3);
  swift_arrayInitWithCopy();
  if (v14 < v5)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v18 = v6[2];
  BOOL v19 = __OFADD__(v18, v14);
  uint64_t v20 = v18 + v14;
  if (!v19)
  {
    v6[2] = v20;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v4 = v6;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002E9A4(uint64_t a1)
{
  return sub_10002E808(a1, &qword_100046420, &qword_100046418, (uint64_t)&protocol descriptor for EnvironmentalStateComponentProvider);
}

uint64_t sub_10002E9C0(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    size_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_10002B788(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  size_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  size_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10002EB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
  v31[0] = a1;
  uint64_t v29 = *(void *)(a1 + 16);
  if (v29)
  {
    uint64_t v3 = a2 + 56;
    uint64_t v30 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    while (1)
    {
      ++v4;
      Hasher.init(_seed:)();
      Feed.Kind.rawValue.getter();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      Swift::Int v5 = Hasher._finalize()();
      uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v7 = v5 & ~v6;
      if ((*(void *)(v3 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
      {
        uint64_t v8 = Feed.Kind.rawValue.getter();
        uint64_t v10 = v9;
        if (v8 == Feed.Kind.rawValue.getter() && v10 == v11)
        {
LABEL_20:
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease_n();
LABEL_21:
          v31[1] = v4;
          char v22 = *(unsigned char *)(v2 + 32);
          unint64_t v23 = (unint64_t)((1 << v22) + 63) >> 6;
          size_t v24 = 8 * v23;
          if ((v22 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            __chkstk_darwin(isStackAllocationSafe);
            memcpy((char *)&v28 - ((v24 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v24);
            Swift::Int v25 = sub_10002EE88((Swift::Int)&v28 - ((v24 + 15) & 0x3FFFFFFFFFFFFFF0), v23, v2, v7, v31);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            unint64_t v26 = (void *)swift_slowAlloc();
            memcpy(v26, (const void *)(v2 + 56), v24);
            Swift::Int v25 = sub_10002EE88((Swift::Int)v26, v23, v2, v7, v31);
            swift_release();
            swift_bridgeObjectRelease();
            swift_slowDealloc();
          }
          return (void *)v25;
        }
        char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_21;
        }
        uint64_t v15 = ~v6;
        while (1)
        {
          unint64_t v7 = (v7 + 1) & v15;
          if (((*(void *)(v3 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
            break;
          }
          uint64_t v16 = Feed.Kind.rawValue.getter();
          uint64_t v18 = v17;
          if (v16 == Feed.Kind.rawValue.getter() && v18 == v19) {
            goto LABEL_20;
          }
          char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          if (v21) {
            goto LABEL_21;
          }
        }
      }
      if (v4 == v29)
      {
        swift_bridgeObjectRelease();
        return (void *)v2;
      }
    }
  }
  return (void *)v2;
}

Swift::Int sub_10002EE88(Swift::Int result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v30 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  unint64_t v8 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v8 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_10002F108(v30, a2, v7, a3);
  }
  uint64_t v31 = a3 + 56;
  while ((v8 & 0x8000000000000000) == 0)
  {
    if (v8 >= v9) {
      goto LABEL_27;
    }
    a5[1] = v8 + 1;
    Hasher.init(_seed:)();
    Feed.Kind.rawValue.getter();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v11 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v12 = result & ~v11;
    if ((*(void *)(v31 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
    {
      uint64_t v13 = Feed.Kind.rawValue.getter();
      uint64_t v15 = v14;
      if (v13 == Feed.Kind.rawValue.getter() && v15 == v16)
      {
LABEL_21:
        uint64_t result = swift_bridgeObjectRelease_n();
      }
      else
      {
        char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v18 & 1) == 0)
        {
          uint64_t v19 = ~v11;
          do
          {
            unint64_t v12 = (v12 + 1) & v19;
            if (((*(void *)(v31 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
              goto LABEL_4;
            }
            uint64_t v20 = Feed.Kind.rawValue.getter();
            uint64_t v22 = v21;
            if (v20 == Feed.Kind.rawValue.getter() && v22 == v23) {
              goto LABEL_21;
            }
            char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
          }
          while ((v25 & 1) == 0);
        }
      }
      uint64_t v26 = (v12 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v27 = *(unint64_t *)((char *)v30 + v26);
      *(unint64_t *)((char *)v30 + v26) = v27 & ~(1 << v12);
      if (((1 << v12) & v27) != 0)
      {
        if (__OFSUB__(v7--, 1)) {
          goto LABEL_28;
        }
        if (!v7) {
          return (Swift::Int)&_swiftEmptySetSingleton;
        }
      }
    }
LABEL_4:
    unint64_t v8 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v8 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002F108(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    unint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1000305C0();
  uint64_t result = static _SetStorage.allocate(capacity:)();
  unint64_t v9 = (unsigned char *)result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v14);
    Hasher.init(_seed:)();
    Feed.Kind.rawValue.getter();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << v9[32];
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(unsigned char *)(*((void *)v9 + 6) + v22) = v18;
    ++*((void *)v9 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_10002F38C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    Swift::Int v7 = sub_10002F514((Swift::Int)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    unint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    Swift::Int v7 = sub_10002F514((Swift::Int)v8, v5, a2, v3);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

Swift::Int sub_10002F514(Swift::Int result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v60 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    uint64_t v6 = 0;
    uint64_t v4 = a4 + 56;
    uint64_t v61 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v63 = (unint64_t)(v7 + 63) >> 6;
    int64_t v65 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      do
      {
LABEL_6:
        if (v9)
        {
          v9 &= v9 - 1;
        }
        else
        {
          int64_t v11 = v65 + 1;
          if (__OFADD__(v65, 1))
          {
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v11 >= v63) {
            goto LABEL_78;
          }
          uint64_t v12 = *(void *)(v61 + 8 * v11);
          int64_t v13 = v65 + 1;
          if (!v12)
          {
            int64_t v13 = v65 + 2;
            if (v65 + 2 >= v63) {
              goto LABEL_78;
            }
            uint64_t v12 = *(void *)(v61 + 8 * v13);
            if (!v12)
            {
              int64_t v13 = v65 + 3;
              if (v65 + 3 >= v63) {
                goto LABEL_78;
              }
              uint64_t v12 = *(void *)(v61 + 8 * v13);
              if (!v12)
              {
                int64_t v14 = v65 + 4;
                if (v65 + 4 >= v63)
                {
LABEL_78:
                  uint64_t v57 = a2;
LABEL_80:
                  swift_retain();
                  return sub_10002F108(v60, v57, v6, v5);
                }
                uint64_t v12 = *(void *)(v61 + 8 * v14);
                if (!v12)
                {
                  while (1)
                  {
                    int64_t v13 = v14 + 1;
                    if (__OFADD__(v14, 1)) {
                      break;
                    }
                    if (v13 >= v63) {
                      goto LABEL_78;
                    }
                    uint64_t v12 = *(void *)(v61 + 8 * v13);
                    ++v14;
                    if (v12) {
                      goto LABEL_21;
                    }
                  }
LABEL_84:
                  __break(1u);
                  goto LABEL_85;
                }
                int64_t v13 = v65 + 4;
              }
            }
          }
LABEL_21:
          uint64_t v9 = (v12 - 1) & v12;
          int64_t v65 = v13;
        }
        Hasher.init(_seed:)();
        Feed.Kind.rawValue.getter();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        uint64_t result = Hasher._finalize()();
        uint64_t v5 = a3;
        uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v16 = result & ~v15;
      }
      while (((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0);
      uint64_t v17 = Feed.Kind.rawValue.getter();
      uint64_t v19 = v18;
      if (v17 == Feed.Kind.rawValue.getter() && v19 == v20) {
        goto LABEL_36;
      }
      uint64_t v4 = v20;
      char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      if (v22)
      {
LABEL_38:
        *(unint64_t *)((char *)v60 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
        if (__OFADD__(v6++, 1))
        {
          __break(1u);
          break;
        }
      }
      else
      {
        uint64_t v23 = ~v15;
        unint64_t v16 = (v16 + 1) & v23;
        if ((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
        {
          while (1)
          {
            uint64_t v24 = Feed.Kind.rawValue.getter();
            uint64_t v26 = v25;
            if (v24 == Feed.Kind.rawValue.getter() && v26 == v27) {
              break;
            }
            uint64_t v4 = v27;
            char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v29) {
              goto LABEL_37;
            }
            unint64_t v16 = (v16 + 1) & v23;
            uint64_t v5 = a3;
            if (((*(void *)(v10 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
              goto LABEL_6;
            }
          }
LABEL_36:
          uint64_t result = swift_bridgeObjectRelease_n();
LABEL_37:
          uint64_t v5 = a3;
          goto LABEL_38;
        }
      }
    }
  }
  uint64_t v31 = 0;
  uint64_t v62 = v5 + 56;
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 < 64) {
    uint64_t v33 = ~(-1 << v32);
  }
  else {
    uint64_t v33 = -1;
  }
  unint64_t v34 = v33 & *(void *)(v5 + 56);
  int64_t v64 = (unint64_t)(v32 + 63) >> 6;
  int64_t v66 = 0;
  uint64_t v35 = v4 + 56;
LABEL_47:
  uint64_t v59 = v31;
  while (v34)
  {
    unint64_t v36 = __clz(__rbit64(v34));
    v34 &= v34 - 1;
    unint64_t v37 = v36 | (v66 << 6);
LABEL_64:
    Hasher.init(_seed:)();
    Feed.Kind.rawValue.getter();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v42 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v43 = result & ~v42;
    if ((*(void *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43))
    {
      uint64_t v44 = Feed.Kind.rawValue.getter();
      uint64_t v46 = v45;
      if (v44 == Feed.Kind.rawValue.getter() && v46 == v47)
      {
LABEL_45:
        uint64_t v4 = a4;
        uint64_t result = swift_bridgeObjectRelease_n();
LABEL_46:
        *(unint64_t *)((char *)v60 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
        uint64_t v31 = v59 + 1;
        if (__OFADD__(v59, 1)) {
          goto LABEL_83;
        }
        goto LABEL_47;
      }
      char v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v4 = a4;
      if (v49) {
        goto LABEL_46;
      }
      uint64_t v50 = ~v42;
      while (1)
      {
        unint64_t v43 = (v43 + 1) & v50;
        if (((*(void *)(v35 + ((v43 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v43) & 1) == 0) {
          break;
        }
        uint64_t v51 = Feed.Kind.rawValue.getter();
        uint64_t v53 = v52;
        if (v51 == Feed.Kind.rawValue.getter() && v53 == v54) {
          goto LABEL_45;
        }
        char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v4 = a4;
        if (v56) {
          goto LABEL_46;
        }
      }
    }
  }
  int64_t v38 = v66 + 1;
  uint64_t v5 = a3;
  if (__OFADD__(v66, 1)) {
    goto LABEL_82;
  }
  if (v38 >= v64)
  {
LABEL_79:
    uint64_t v57 = a2;
    uint64_t v6 = v59;
    goto LABEL_80;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v38);
  int64_t v40 = v66 + 1;
  if (v39) {
    goto LABEL_63;
  }
  int64_t v40 = v66 + 2;
  if (v66 + 2 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v40);
  if (v39) {
    goto LABEL_63;
  }
  int64_t v40 = v66 + 3;
  if (v66 + 3 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v40);
  if (v39)
  {
LABEL_63:
    unint64_t v34 = (v39 - 1) & v39;
    int64_t v66 = v40;
    unint64_t v37 = __clz(__rbit64(v39)) + (v40 << 6);
    goto LABEL_64;
  }
  int64_t v41 = v66 + 4;
  if (v66 + 4 >= v64) {
    goto LABEL_79;
  }
  unint64_t v39 = *(void *)(v62 + 8 * v41);
  if (v39)
  {
    int64_t v40 = v66 + 4;
    goto LABEL_63;
  }
  while (1)
  {
    int64_t v40 = v41 + 1;
    if (__OFADD__(v41, 1)) {
      break;
    }
    if (v40 >= v64) {
      goto LABEL_79;
    }
    unint64_t v39 = *(void *)(v62 + 8 * v40);
    ++v41;
    if (v39) {
      goto LABEL_63;
    }
  }
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_10002FB3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for GenerationPhase();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v42 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v10);
  int64_t v41 = (char *)&v32 - v13;
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v15 = a4 + 56;
  uint64_t v14 = v16;
  uint64_t v37 = v15;
  uint64_t v17 = -1 << *(unsigned char *)(v15 - 24);
  if (-v17 < 64) {
    uint64_t v18 = ~(-1 << -(char)v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v14;
  if (!a2)
  {
    int64_t v20 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v43;
    a1[1] = v31;
    a1[2] = ~v17;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    int64_t v20 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v34 = -1 << *(unsigned char *)(v15 - 24);
  uint64_t v35 = a1;
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v9 + 16;
  int64_t v36 = (unint64_t)(63 - v17) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v40 = a3;
  char v22 = v41;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v23 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  unint64_t v24 = v23 | (v20 << 6);
  while (1)
  {
    ++v21;
    uint64_t v28 = v42;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v42, *(void *)(v43 + 48) + v29 * v24, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v22, v28, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v8);
    a3 = v40;
    if (v21 == v40) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v19) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v36) {
      goto LABEL_32;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    if (!v26) {
      break;
    }
LABEL_18:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v25 << 6);
    int64_t v20 = v25;
  }
  v20 += 2;
  if (v25 + 1 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26) {
    goto LABEL_14;
  }
  int64_t v27 = v25 + 2;
  if (v25 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
  if (v26) {
    goto LABEL_17;
  }
  int64_t v20 = v25 + 3;
  if (v25 + 3 >= v36)
  {
    unint64_t v19 = 0;
    int64_t v20 = v25 + 2;
    goto LABEL_36;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v20);
  if (v26)
  {
LABEL_14:
    int64_t v25 = v20;
    goto LABEL_18;
  }
  int64_t v27 = v25 + 4;
  if (v25 + 4 >= v36)
  {
LABEL_32:
    unint64_t v19 = 0;
LABEL_36:
    a3 = v21;
LABEL_37:
    uint64_t v17 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  unint64_t v26 = *(void *)(v37 + 8 * v27);
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
    if (v25 >= v36)
    {
      unint64_t v19 = 0;
      int64_t v20 = v33;
      goto LABEL_36;
    }
    unint64_t v26 = *(void *)(v37 + 8 * v25);
    ++v27;
    if (v26) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_10002FE84(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_100030018(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_10000EC10(0, a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10003012C(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[2] = 0;
  swift_weakInit();
  type metadata accessor for UnfairLock();
  swift_allocObject();
  v4[8] = UnfairLock.init()();
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a4;
  v4[6] = a3;
  id v15 = a1;
  id v16 = a2;
  id v17 = a4;
  swift_retain();
  swift_retain();
  dispatch thunk of HealthExperienceStoreOracle.register(observer:)();
  swift_release();
  dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
  if (v28)
  {
    sub_10000A908(&v27, (uint64_t)v29);
    uint64_t v18 = sub_10002A804((uint64_t)v29, a3, (uint64_t)v17);
    sub_10000E7F8((uint64_t)v29);
    v5[2] = v18;
    swift_release();
  }
  else
  {
    sub_10001727C((uint64_t)&v27);
  }
  static Logger.general.getter();
  unint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v26 = v11;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    v29[0] = v10;
    swift_getMetatypeMetadata();
    uint64_t v22 = String.init<A>(describing:)();
    v29[0] = sub_10000E724(v22, v23, (uint64_t *)&v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s init()", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  type metadata accessor for FeedPopulationManagerOracle();
  DebuggingResponder.registerForDebuggingRequests()();
  return v5;
}

uint64_t sub_100030434(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100030514();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_10002BAB8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_1000304A8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100030500()
{
  return sub_10002A190(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8]);
}

unint64_t sub_100030514()
{
  unint64_t result = qword_1000469A0;
  if (!qword_1000469A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000469A0);
  }
  return result;
}

uint64_t sub_100030568()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000305B0()
{
  return sub_10002A4B4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

void sub_1000305C0()
{
  if (!qword_1000469A8)
  {
    sub_100030514();
    unint64_t v0 = type metadata accessor for _SetStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000469A8);
    }
  }
}

char *sub_10003061C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unsigned int v5 = (char *)(a4 + a1 + 32);
    char v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100030704()
{
  return swift_release();
}

void sub_10003070C()
{
  if (!qword_1000469C0)
  {
    type metadata accessor for GenerationPhase();
    sub_10000681C(&qword_1000469B0, (void (*)(uint64_t))&type metadata accessor for GenerationPhase);
    unint64_t v0 = type metadata accessor for _SetStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000469C0);
    }
  }
}

uint64_t sub_1000307A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    size_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10002BCD4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100030838(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for _ContiguousArrayStorage();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100030880(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      sub_1000278B8(v4, (uint64_t)v5);
      sub_10002BE84((uint64_t)v6, (uint64_t)v5);
      sub_100027864((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_10003090C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100030A04(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for _SetStorage();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_100030A50()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100030AB0()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_retain();

    type metadata accessor for SummaryTabFeedPopulationManager();
    FeedPopulationManaging<>.handleUpdatedFeedItems(_:)();
    return swift_release();
  }
  return result;
}

uint64_t sub_100030B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v9 = (void *)result;
    static Logger.personalization.getter();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v17 = a3;
      uint64_t v13 = (uint8_t *)v12;
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136446210;
      v16[1] = v13 + 4;
      uint64_t v19 = v17;
      swift_getMetatypeMetadata();
      uint64_t v14 = String.init<A>(describing:)();
      uint64_t v19 = sub_10000E724(v14, v15, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%{public}s]: Highlights generation publisher completed; sending request to repopulate feed",
        v13,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a3 = v17;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)(swift_allocObject() + 16) = a3;
    swift_retain();
    dispatch thunk of SummaryTabFeedPopulationManager.generateHighlightsFeedIfAppropriate(completion:)();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_100030DC8(char a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v18 = v4;
    uint64_t v11 = v10;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = a2;
    *(_DWORD *)uint64_t v11 = 136446466;
    swift_getMetatypeMetadata();
    uint64_t v12 = String.init<A>(describing:)();
    uint64_t v20 = sub_10000E724(v12, v13, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    if (a1) {
      uint64_t v14 = 1702195828;
    }
    else {
      uint64_t v14 = 0x65736C6166;
    }
    if (a1) {
      unint64_t v15 = 0xE400000000000000;
    }
    else {
      unint64_t v15 = 0xE500000000000000;
    }
    uint64_t v20 = sub_10000E724(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%{public}s]: Highlights repopulated: %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t *sub_100031024@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  uint64_t v3 = *(void *)(*result + 16);
  if (!v3) {
    goto LABEL_5;
  }
  int v4 = *(unsigned __int8 *)(v2 + 32);
  if (v4 == 1)
  {
LABEL_3:
    *a2 = v4;
    return result;
  }
  if (v3 != 1)
  {
    uint64_t v5 = 33;
    while (1)
    {
      uint64_t v6 = v5 - 31;
      if (__OFADD__(v5 - 32, 1)) {
        break;
      }
      LOBYTE(v4) = *(unsigned char *)(v2 + v5);
      if ((v4 & 1) == 0)
      {
        ++v5;
        if (v6 != v3) {
          continue;
        }
      }
      goto LABEL_3;
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    *a2 = 0;
  }
  return result;
}

BOOL sub_100031080(unsigned char *a1)
{
  return (*a1 & 1) == 0;
}

uint64_t sub_100031090()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.personalization.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SummaryTabForegroundFeedPopulationOperation removing registration for feedItemSubmissionOccurred", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = qword_1000469F0;
  if (*(void *)(v1 + qword_1000469F0))
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  *(void *)(v1 + v9) = 0;
  swift_release();
  uint64_t v10 = qword_1000469E8;
  if (*(void *)(v1 + qword_1000469E8))
  {
    swift_retain();
    AnyCancellable.cancel()();
    swift_release();
  }
  *(void *)(v1 + v10) = 0;
  return swift_release();
}

void sub_100031240()
{
}

uint64_t sub_100031270()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

id sub_1000312F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SummaryTabForegroundFeedPopulationOperation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100031328()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1000313B4()
{
  return type metadata accessor for SummaryTabForegroundFeedPopulationOperation();
}

uint64_t sub_1000313BC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000313F4()
{
  return sub_100030AB0();
}

uint64_t sub_1000313FC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031434(uint64_t a1)
{
  return sub_100030B48(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10003143C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003144C(char a1)
{
  return sub_100030DC8(a1, *(void *)(v1 + 16));
}

void sub_100031454()
{
  if (!qword_1000460F8)
  {
    unint64_t v0 = type metadata accessor for Array();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000460F8);
    }
  }
}

uint64_t sub_1000314AC()
{
  return sub_10000F6B4(&qword_100046708, sub_100013D08);
}

void sub_1000314E0()
{
  if (!qword_100046A88)
  {
    sub_10000EFAC(255, (unint64_t *)&qword_1000460F0, (uint64_t (*)(uint64_t))sub_100031454, (uint64_t (*)(uint64_t, uint64_t, void *, void *))&type metadata accessor for AnyGenerator);
    unint64_t v0 = type metadata accessor for GeneratorPipelineManagerWrapper();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046A88);
    }
  }
}

uint64_t sub_100031568(uint64_t a1, uint64_t a2)
{
  sub_10000E0A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_1000315CC()
{
  return &protocol witness table for Never;
}

uint64_t sub_1000315D8()
{
  return AnyGenerator.domain.getter();
}

uint64_t sub_10003163C(uint64_t a1)
{
  sub_10000E0A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100031698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_1000316A0()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v3 > 0x3F)
    {
      return AssociatedTypeWitness;
    }
    else
    {
      swift_getAssociatedTypeWitness();
      uint64_t v0 = type metadata accessor for Optional();
      if (v4 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v0;
}

uint64_t *sub_100031858(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v32 + 64);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = v4 + v6;
  uint64_t v8 = *(void *)(v5 + 64);
  uint64_t v9 = v8 + v6;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v8 + v12;
  if (*(_DWORD *)(v11 + 84)) {
    uint64_t v14 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v14 = *(void *)(v11 + 64) + 1;
  }
  uint64_t v15 = (v6 | *(unsigned char *)(v32 + 80) | *(unsigned char *)(v11 + 80));
  if (v15 <= 7
    && ((v13 + ((v9 + (v7 & ~(unint64_t)v6)) & ~(unint64_t)v6)) & ~v12)
     + v14 <= 0x18
    && ((v6 | *(_DWORD *)(v32 + 80) | *(_DWORD *)(v11 + 80)) & 0x100000) == 0)
  {
    size_t __n = v14;
    uint64_t v30 = ~v12;
    uint64_t v20 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v32 + 16);
    uint64_t v33 = v10;
    v20(a1, a2, v3);
    unint64_t v21 = ((unint64_t)a1 + v7) & ~(unint64_t)v6;
    unint64_t v22 = ((unint64_t)a2 + v7) & ~(unint64_t)v6;
    unint64_t v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    v23(v21, v22, AssociatedTypeWitness);
    unint64_t v24 = (v9 + v21) & ~(unint64_t)v6;
    unint64_t v25 = (v9 + v22) & ~(unint64_t)v6;
    v23(v24, v25, AssociatedTypeWitness);
    uint64_t v26 = (void *)((v24 + v13) & v30);
    long long v27 = (const void *)((v25 + v13) & v30);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v27, 1, v33))
    {
      memcpy(v26, v27, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v26, v27, v33);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v26, 0, 1, v33);
    }
    return a1;
  }
  else
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    uint64_t v19 = v18 + ((v15 + 16) & ~v15);
    swift_retain();
  }
  return (uint64_t *)v19;
}

uint64_t sub_100031BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 40);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24);
  uint64_t v10 = v8 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v31 = a1;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v10 + 40);
  uint64_t v16 = (v15 + v11 + v13) & ~v11;
  uint64_t v17 = (v15 + v11 + v14) & ~v11;
  v9(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (void *)((v15 + v20 + v16) & ~v20);
  unint64_t v22 = (void *)((v15 + v20 + v17) & ~v20);
  unint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v17) = v23(v21, 1, v18);
  int v24 = v23(v22, 1, v18);
  if (v17)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v21, v22, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      return v31;
    }
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v21, v22, v18);
      return v31;
    }
    uint64_t v28 = *(void (**)(void *, uint64_t))(v19 + 8);
    uint64_t v27 = v19 + 8;
    v28(v21, v18);
    int v25 = *(_DWORD *)(v27 + 76);
    size_t v26 = *(void *)(v27 + 56);
  }
  if (v25) {
    size_t v29 = v26;
  }
  else {
    size_t v29 = v26 + 1;
  }
  memcpy(v21, v22, v29);
  return v31;
}

uint64_t sub_100031E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 32);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32);
  uint64_t v10 = v8 + 32;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v10 + 32);
  uint64_t v16 = (v15 + v11 + v13) & ~v11;
  uint64_t v17 = (v15 + v11 + v14) & ~v11;
  v9(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (void *)((v15 + v20 + v16) & ~v20);
  unint64_t v22 = (const void *)((v15 + v20 + v17) & ~v20);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v22, 1, v18))
  {
    if (*(_DWORD *)(v19 + 84)) {
      size_t v23 = *(void *)(v19 + 64);
    }
    else {
      size_t v23 = *(void *)(v19 + 64) + 1;
    }
    memcpy(v21, v22, v23);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v21, v22, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
  }
  return a1;
}

uint64_t sub_1000320B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 24);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40);
  uint64_t v10 = v8 + 40;
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = v6 + v11;
  uint64_t v31 = a1;
  uint64_t v13 = (v6 + v11 + a1) & ~v11;
  uint64_t v14 = (v12 + a2) & ~v11;
  v9(v13, v14, AssociatedTypeWitness);
  uint64_t v15 = *(void *)(v10 + 24);
  uint64_t v16 = (v15 + v11 + v13) & ~v11;
  uint64_t v17 = (v15 + v11 + v14) & ~v11;
  v9(v16, v17, AssociatedTypeWitness);
  uint64_t v18 = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (void *)((v15 + v20 + v16) & ~v20);
  unint64_t v22 = (void *)((v15 + v20 + v17) & ~v20);
  size_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v17) = v23(v21, 1, v18);
  int v24 = v23(v22, 1, v18);
  if (v17)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 32))(v21, v22, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      return v31;
    }
    int v25 = *(_DWORD *)(v19 + 84);
    size_t v26 = *(void *)(v19 + 64);
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 40))(v21, v22, v18);
      return v31;
    }
    uint64_t v28 = *(void (**)(void *, uint64_t))(v19 + 8);
    uint64_t v27 = v19 + 8;
    v28(v21, v18);
    int v25 = *(_DWORD *)(v27 + 76);
    size_t v26 = *(void *)(v27 + 56);
  }
  if (v25) {
    size_t v29 = v26;
  }
  else {
    size_t v29 = v26 + 1;
  }
  memcpy(v21, v22, v29);
  return v31;
}

uint64_t sub_10003237C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  unsigned int v36 = v6;
  if (v8 > v6) {
    unsigned int v6 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v10 = v9;
  int v11 = *(_DWORD *)(v9 + 84);
  unsigned int v12 = v11 - 1;
  if (!v11) {
    unsigned int v12 = 0;
  }
  if (v12 <= v6) {
    unsigned int v12 = v6;
  }
  uint64_t v13 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = *(void *)(v7 + 64);
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = *(void *)(v9 + 64);
  if (v11) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = v16 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v18 = *(void *)(v5 + 64) + v13;
  uint64_t v19 = v14 + v13;
  uint64_t v20 = v14 + v15;
  unint64_t v21 = a1;
  if (a2 <= v12) {
    goto LABEL_30;
  }
  uint64_t v22 = v17 + ((v20 + ((v19 + (v18 & ~v13)) & ~v13)) & ~v15);
  char v23 = 8 * v22;
  if (v22 > 3) {
    goto LABEL_13;
  }
  unsigned int v25 = ((a2 - v12 + ~(-1 << v23)) >> v23) + 1;
  if (HIWORD(v25))
  {
    int v24 = *(_DWORD *)((char *)a1 + v22);
    if (!v24) {
      goto LABEL_30;
    }
    goto LABEL_20;
  }
  if (v25 > 0xFF)
  {
    int v24 = *(unsigned __int16 *)((char *)a1 + v22);
    if (!*(unsigned __int16 *)((char *)a1 + v22)) {
      goto LABEL_30;
    }
    goto LABEL_20;
  }
  if (v25 >= 2)
  {
LABEL_13:
    int v24 = *((unsigned __int8 *)a1 + v22);
    if (!*((unsigned char *)a1 + v22)) {
      goto LABEL_30;
    }
LABEL_20:
    int v26 = (v24 - 1) << v23;
    if (v22 > 3) {
      int v26 = 0;
    }
    if (v22)
    {
      if (v22 <= 3) {
        int v27 = v22;
      }
      else {
        int v27 = 4;
      }
      switch(v27)
      {
        case 2:
          int v28 = *a1;
          break;
        case 3:
          int v28 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v28 = *(_DWORD *)a1;
          break;
        default:
          int v28 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v28 = 0;
    }
    return v12 + (v28 | v26) + 1;
  }
LABEL_30:
  if (!v12) {
    return 0;
  }
  if (v36 == v12)
  {
    size_t v29 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
    uint64_t v30 = v36;
    uint64_t v31 = v4;
  }
  else
  {
    uint64_t v33 = ~v13;
    unint64_t v21 = (unsigned __int16 *)(((unint64_t)a1 + v18) & v33);
    if (v8 != v12)
    {
      unsigned int v34 = (*(uint64_t (**)(unint64_t))(v10 + 48))((v20 + (((unint64_t)v21 + v19) & v33)) & ~v15);
      if (v34 >= 2) {
        return v34 - 1;
      }
      else {
        return 0;
      }
    }
    size_t v29 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v30 = v8;
    uint64_t v31 = AssociatedTypeWitness;
  }

  return v29(v21, v30, v31);
}

void sub_100032730(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v44 = v5;
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = v6;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  int v10 = 0;
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v12 = v11;
  int v13 = *(_DWORD *)(v11 + 84);
  unsigned int v14 = v13 - 1;
  if (!v13) {
    unsigned int v14 = 0;
  }
  if (v14 <= v9) {
    unsigned int v15 = v9;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = *(void *)(v5 + 64) + v16;
  uint64_t v18 = *(void *)(v7 + 64);
  uint64_t v19 = v18 + v16;
  uint64_t v20 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = v18 + v20;
  uint64_t v22 = (v18 + v20 + ((v18 + v16 + (v17 & ~v16)) & ~v16)) & ~v20;
  size_t v23 = *(void *)(v11 + 64);
  if (v13) {
    size_t v24 = v23;
  }
  else {
    size_t v24 = v23 + 1;
  }
  size_t v25 = v22 + v24;
  if (a3 > v15)
  {
    if (v25 <= 3)
    {
      unsigned int v26 = ((a3 - v15 + ~(-1 << (8 * v25))) >> (8 * v25)) + 1;
      if (HIWORD(v26))
      {
        int v10 = 4;
      }
      else if (v26 >= 0x100)
      {
        int v10 = 2;
      }
      else
      {
        int v10 = v26 > 1;
      }
    }
    else
    {
      int v10 = 1;
    }
  }
  if (v15 < a2)
  {
    unsigned int v27 = ~v15 + a2;
    if (v25 < 4)
    {
      int v28 = (v27 >> (8 * v25)) + 1;
      if (v25)
      {
        int v32 = v27 & ~(-1 << (8 * v25));
        bzero(a1, v25);
        if (v25 == 3)
        {
          *(_WORD *)a1 = v32;
          a1[2] = BYTE2(v32);
        }
        else if (v25 == 2)
        {
          *(_WORD *)a1 = v32;
        }
        else
        {
          *a1 = v32;
        }
      }
    }
    else
    {
      bzero(a1, v25);
      *(_DWORD *)a1 = v27;
      int v28 = 1;
    }
    switch(v10)
    {
      case 1:
        a1[v25] = v28;
        return;
      case 2:
        *(_WORD *)&a1[v25] = v28;
        return;
      case 3:
        goto LABEL_64;
      case 4:
        *(_DWORD *)&a1[v25] = v28;
        return;
      default:
        return;
    }
  }
  uint64_t v29 = ~v16;
  uint64_t v30 = ~v20;
  uint64_t v31 = a1;
  switch(v10)
  {
    case 1:
      a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v25] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_64:
      __break(1u);
      JUMPOUT(0x100032BFCLL);
    case 4:
      *(_DWORD *)&a1[v25] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (!a2) {
        return;
      }
LABEL_32:
      if (v6 == v15)
      {
        uint64_t v33 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v44 + 56);
        uint64_t v34 = a2;
        uint64_t v35 = v6;
        uint64_t v36 = v4;
LABEL_36:
        v33(v31, v34, v35, v36);
        return;
      }
      uint64_t v31 = (unsigned char *)((unint64_t)&a1[v17] & v29);
      if (v8 == v15)
      {
        uint64_t v33 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
        uint64_t v34 = a2;
        uint64_t v35 = v8;
        uint64_t v36 = AssociatedTypeWitness;
        goto LABEL_36;
      }
      uint64_t v37 = (unsigned char *)((v21 + ((unint64_t)&v31[v19] & v29)) & v30);
      if (v14 >= a2)
      {
        int64_t v41 = *(void (**)(unint64_t, void))(v12 + 56);
        unint64_t v42 = (v21 + ((unint64_t)&v31[v19] & v29)) & v30;
        v41(v42, a2 + 1);
      }
      else
      {
        if (v24 <= 3) {
          int v38 = ~(-1 << (8 * v24));
        }
        else {
          int v38 = -1;
        }
        if (v24)
        {
          int v39 = v38 & (~v14 + a2);
          if (v24 <= 3) {
            int v40 = v24;
          }
          else {
            int v40 = 4;
          }
          bzero(v37, v24);
          switch(v40)
          {
            case 2:
              *(_WORD *)uint64_t v37 = v39;
              break;
            case 3:
              *(_WORD *)uint64_t v37 = v39;
              v37[2] = BYTE2(v39);
              break;
            case 4:
              *(_DWORD *)uint64_t v37 = v39;
              break;
            default:
              *uint64_t v37 = v39;
              break;
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SummaryTabForegroundFeedPopulationOperation.HighlightsGenerationConfiguration()
{
  return sub_100032C4C();
}

uint64_t sub_100032C4C()
{
  return swift_getGenericMetadata();
}

unint64_t sub_100032C7C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000360F0();
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (id *)(a1 + 40);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    id v6 = *v4;
    unint64_t result = sub_100025FA4(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
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

unint64_t sub_100032D7C(char a1)
{
  unint64_t result = 0xD000000000000014;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001ALL;
    }
    else {
      return 0xD000000000000016;
    }
  }
  return result;
}

uint64_t sub_100032DDC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100032DE8(*a1, *a2);
}

uint64_t sub_100032DE8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000014;
  unint64_t v3 = 0x8000000100038E10;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000001ALL;
    }
    else {
      unint64_t v5 = 0xD000000000000016;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x8000000100038E30;
    }
    else {
      unint64_t v6 = 0x8000000100038E50;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000014;
  unint64_t v6 = 0x8000000100038E10;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0xD00000000000001ALL;
    }
    else {
      unint64_t v2 = 0xD000000000000016;
    }
    if (v7 == 1) {
      unint64_t v3 = 0x8000000100038E30;
    }
    else {
      unint64_t v3 = 0x8000000100038E50;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100032EE8()
{
  return sub_100032EF0();
}

Swift::Int sub_100032EF0()
{
  return Hasher._finalize()();
}

uint64_t sub_100032F9C()
{
  return sub_100032FA4();
}

uint64_t sub_100032FA4()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100033038()
{
  return sub_100033040();
}

Swift::Int sub_100033040()
{
  return Hasher._finalize()();
}

unint64_t sub_1000330E8@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100035664(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100033118@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100032D7C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_100033144(void *a1@<X8>)
{
  *a1 = &off_100041A68;
}

uint64_t sub_100033154(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6 = v5;
  uint64_t ObjectType = (void (**)(char *, void, uint64_t))swift_getObjectType();
  uint64_t v73 = type metadata accessor for LogCategory();
  uint64_t v69 = *(void (***)(char *, uint64_t))(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v72 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  unsigned int v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities;
  uint64_t v17 = v6;
  *(void *)&v6[v16] = sub_100032C7C((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate____lazy_storage___availablePlugins] = 0;
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle] = a1;
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle] = a2;
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager] = a5;
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle] = a4;
  *(void *)&v17[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle] = a3;
  id v60 = a1;
  uint64_t v61 = a2;
  swift_retain();
  uint64_t v64 = a5;
  swift_retain();
  uint64_t v63 = a4;
  swift_retain();
  uint64_t v62 = a3;
  swift_retain();

  uint64_t v18 = (objc_class *)type metadata accessor for DaemonListenerDelegate();
  v78.receiver = v17;
  v78.super_class = v18;
  uint64_t v74 = (char *)objc_msgSendSuper2(&v78, "init");
  static Logger.daemon.getter();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315138;
    aBlock[0] = ObjectType;
    swift_getMetatypeMetadata();
    uint64_t v22 = String.init<A>(describing:)();
    aBlock[0] = sub_10000E724(v22, v23, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%s] init()", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v71);
  size_t v24 = v74;
  DebuggingResponder.registerForDebuggingRequests()();
  uint64_t v59 = OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities;
  size_t v25 = *(void **)&v24[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities];
  LODWORD(v71) = enum case for LogCategory.generation(_:);
  unsigned int v26 = v69++;
  uint64_t ObjectType = (void (**)(char *, void, uint64_t))(v26 + 13);
  os_log_type_t v68 = v77;
  swift_bridgeObjectRetain();
  uint64_t v27 = 0;
  unint64_t v66 = 0x800000010003A2F0;
  unint64_t v67 = 0x800000010003A330;
  unint64_t v65 = 0x800000010003A260;
  while (1)
  {
    int v30 = *((unsigned __int8 *)&off_1000419D8 + v27 + 32);
    if (v30 == 1) {
      unint64_t v31 = 0xD00000000000003CLL;
    }
    else {
      unint64_t v31 = 0xD00000000000003BLL;
    }
    unint64_t v32 = v66;
    if (v30 != 1) {
      unint64_t v32 = v65;
    }
    unint64_t v33 = *((unsigned char *)&off_1000419D8 + v27 + 32) ? v31 : 0xD00000000000003BLL;
    unint64_t v34 = *((unsigned char *)&off_1000419D8 + v27 + 32) ? v32 : v67;
    uint64_t v35 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v36 = swift_allocObject();
    *(unsigned char *)(v36 + 16) = v30;
    *(void *)(v36 + 24) = v33;
    *(void *)(v36 + 32) = v34;
    *(void *)(v36 + 40) = v35;
    swift_bridgeObjectRetain();
    id v37 = sub_10000FC20();
    int v38 = v72;
    uint64_t v39 = v73;
    (*ObjectType)(v72, v71, v73);
    int v40 = (void *)LogCategory.logHandle.getter();
    (*v69)(v38, v39);
    id v41 = objc_allocWithZone((Class)HDXPCGatedActivity);
    NSString v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    v77[2] = sub_1000360E0;
    v77[3] = v36;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    v77[0] = sub_100035014;
    v77[1] = &unk_100042940;
    uint64_t v43 = _Block_copy(aBlock);
    id v44 = [v41 initWithName:v42 criteria:v37 loggingCategory:v40 handler:v43];

    swift_unknownObjectRelease();
    _Block_release(v43);
    swift_release();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v25;
    unint64_t v47 = sub_100025FA4(v30);
    uint64_t v48 = v25[2];
    BOOL v49 = (v46 & 1) == 0;
    uint64_t v50 = v48 + v49;
    if (__OFADD__(v48, v49)) {
      break;
    }
    char v51 = v46;
    if (v25[3] >= v50)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        size_t v25 = (void *)aBlock[0];
        if (v46) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_1000354C4();
        size_t v25 = (void *)aBlock[0];
        if (v51) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_10003515C(v50, isUniquelyReferenced_nonNull_native);
      unint64_t v52 = sub_100025FA4(v30);
      if ((v51 & 1) != (v53 & 1)) {
        goto LABEL_31;
      }
      unint64_t v47 = v52;
      size_t v25 = (void *)aBlock[0];
      if (v51)
      {
LABEL_4:
        uint64_t v28 = v25[7];
        uint64_t v29 = 8 * v47;

        *(void *)(v28 + v29) = v44;
        goto LABEL_5;
      }
    }
    v25[(v47 >> 6) + 8] |= 1 << v47;
    *(unsigned char *)(v25[6] + v47) = v30;
    *(void *)(v25[7] + 8 * v47) = v44;
    uint64_t v54 = v25[2];
    BOOL v55 = __OFADD__(v54, 1);
    uint64_t v56 = v54 + 1;
    if (v55) {
      goto LABEL_30;
    }
    v25[2] = v56;
LABEL_5:
    swift_bridgeObjectRelease();
    if (++v27 == 3)
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v57 = v74;

      *(void *)&v57[v59] = v25;
      swift_bridgeObjectRelease();
      return (uint64_t)v57;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000338D4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v83 = a6;
  uint64_t v11 = type metadata accessor for DateInterval();
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  __chkstk_darwin(v11);
  uint64_t v73 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Logger();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v76 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v82 = (char *)&v72 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v80 = (char *)&v72 - v20;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v72 - v21;
  static Logger.daemon.getter();
  swift_bridgeObjectRetain_n();
  unint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v78 = a5;
  uint64_t v79 = a4;
  uint64_t v77 = a3;
  uint64_t v84 = v13;
  uint64_t v81 = v14;
  if (v25)
  {
    uint64_t v26 = 0xD000000000000014;
    uint64_t v27 = swift_slowAlloc();
    v87[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136446466;
    if ((_BYTE)a5)
    {
      if (a5 == 1) {
        uint64_t v26 = 0xD00000000000001ALL;
      }
      else {
        uint64_t v26 = 0xD000000000000016;
      }
      if (a5 == 1) {
        unint64_t v28 = 0x8000000100038E30;
      }
      else {
        unint64_t v28 = 0x8000000100038E50;
      }
    }
    else
    {
      unint64_t v28 = 0x8000000100038E10;
    }
    uint64_t v86 = sub_10000E724(v26, v28, v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_10000E724(v83, a7, v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Background generation of type %{public}s with identifier %{public}s received callback from gated activity handler", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v29 = *(void (**)(char *, uint64_t))(v81 + 8);
    uint64_t v13 = v84;
    v29(v22, v84);
    uint64_t v30 = v79;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
    v29(v22, v13);
    uint64_t v30 = a4;
  }
  unint64_t v31 = v80;
  unint64_t v32 = v82;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v34 = (char *)Strong;
    static Logger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v72 = v29;
    if (v37)
    {
      int v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      *(_DWORD *)int v38 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_10000E724(v83, a7, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Executing activity identifier %{public}s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v29(v82, v84);
      uint64_t v30 = v79;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v29(v32, v13);
    }
    id v44 = v76;
    uint64_t v45 = *(void *)&v34[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle];
    uint64_t v46 = *(void *)&v34[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle];
    uint64_t v47 = *(void *)&v34[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle];
    uint64_t v48 = *(void *)&v34[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager];
    id v49 = *(id *)&v34[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    unint64_t v50 = sub_100032C7C((uint64_t)_swiftEmptyArrayStorage);
    id v51 = objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
    id v52 = sub_1000077A4(v49, v45, v46, v47, v48, v50);
    static Logger.daemon.getter();
    swift_bridgeObjectRetain_n();
    char v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = 0xD000000000000014;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      *(_DWORD *)uint64_t v56 = 136446466;
      if ((_BYTE)v78)
      {
        if (v78 == 1) {
          uint64_t v55 = 0xD00000000000001ALL;
        }
        else {
          uint64_t v55 = 0xD000000000000016;
        }
        if (v78 == 1) {
          unint64_t v57 = 0x8000000100038E30;
        }
        else {
          unint64_t v57 = 0x8000000100038E50;
        }
      }
      else
      {
        unint64_t v57 = 0x8000000100038E10;
      }
      uint64_t v85 = sub_10000E724(v55, v57, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v58 = v83;
      uint64_t v85 = sub_10000E724(v83, a7, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Running background generation of type %{public}s with identifier %{public}s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v72(v76, v84);
      uint64_t v30 = v79;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v72(v44, v84);
      uint64_t v58 = v83;
    }
    uint64_t v61 = (uint64_t)v73;
    static DateInterval.allTimeInterval.getter();
    char v62 = v78;
    uint64_t v63 = qword_100038E18[(char)v78];
    BOOL v64 = v78 != 1;
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v52;
    *(unsigned char *)(v65 + 24) = v62;
    *(void *)(v65 + 32) = v58;
    *(void *)(v65 + 40) = a7;
    *(void *)(v65 + 48) = v77;
    *(void *)(v65 + 56) = v30;
    swift_bridgeObjectRetain();
    id v66 = v52;
    swift_retain();
    id v67 = sub_10001CEE0(v61, (uint64_t)_swiftEmptyArrayStorage, v64, v63, (void (*)(void))sub_100036238, v65);

    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v74 + 8))(v61, v75);
  }
  else
  {
    static Logger.daemon.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v39 = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = 0xD000000000000014;
      uint64_t v42 = swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 136446466;
      if ((_BYTE)v78)
      {
        if (v78 == 1) {
          uint64_t v41 = 0xD00000000000001ALL;
        }
        else {
          uint64_t v41 = 0xD000000000000016;
        }
        if (v78 == 1) {
          unint64_t v43 = 0x8000000100038E30;
        }
        else {
          unint64_t v43 = 0x8000000100038E50;
        }
      }
      else
      {
        unint64_t v43 = 0x8000000100038E10;
      }
      uint64_t v85 = sub_10000E724(v41, v43, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_10000E724(v83, a7, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Background generation of type %{public}s with identifier %{public}s error: DaemonListenerDelegate was deallocated", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v59 = v80;
      uint64_t v60 = v84;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v59 = v31;
      uint64_t v60 = v13;
    }
    v29(v59, v60);
    uint64_t v69 = v77;
    sub_10003619C();
    uint64_t v70 = swift_allocError();
    unsigned char *v71 = 0;
    v69(1, v70);
    return swift_errorRelease();
  }
}

uint64_t sub_1000343DC(int a1, uint64_t a2, int a3, uint64_t a4, unint64_t a5, void (*a6)(void, void), uint64_t a7)
{
  int v34 = a3;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v29 = a4;
    uint64_t v30 = v12;
    int v31 = a1;
    unint64_t v33 = a6;
    uint64_t v18 = 0xD000000000000014;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v36 = v28;
    *(_DWORD *)uint64_t v19 = 136446722;
    uint64_t v32 = a7;
    if ((_BYTE)v34)
    {
      if (v34 == 1) {
        uint64_t v18 = 0xD00000000000001ALL;
      }
      else {
        uint64_t v18 = 0xD000000000000016;
      }
      if (v34 == 1) {
        unint64_t v20 = 0x8000000100038E30;
      }
      else {
        unint64_t v20 = 0x8000000100038E50;
      }
    }
    else
    {
      unint64_t v20 = 0x8000000100038E10;
    }
    uint64_t v35 = sub_10000E724(v18, v20, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_10000E724(v29, a5, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2080;
    char v24 = v31;
    if (v31) {
      uint64_t v25 = 0x2E73736563637573;
    }
    else {
      uint64_t v25 = 0x2E6572756C696166;
    }
    uint64_t v35 = sub_10000E724(v25, 0xE800000000000000, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Background generation of type %{public}s with identifier %{public}s completion received: %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v30);
    a6 = v33;
    if (v24) {
      goto LABEL_16;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if (a1)
    {
LABEL_16:
      uint64_t v21 = 0;
      uint64_t v23 = 0;
      goto LABEL_17;
    }
  }
  sub_10003619C();
  uint64_t v21 = swift_allocError();
  unsigned char *v22 = 2;
  uint64_t v23 = 1;
LABEL_17:
  a6(v23, v21);
  return swift_errorRelease();
}

uint64_t sub_1000347D0()
{
  _StringGuts.grow(_:)(69);
  v1._countAndFlagsBits = 60;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  swift_getObjectType();
  sub_1000356B0();
  v2._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 32;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _print_unlocked<A, B>(_:_:)();
  v4._countAndFlagsBits = 32;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  _print_unlocked<A, B>(_:_:)();
  v5._object = (void *)0x800000010003A220;
  v5._countAndFlagsBits = 0xD000000000000018;
  String.append(_:)(v5);
  id v6 = *(id *)(v0 + OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle);
  id v7 = [v6 description];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);

  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0xD00000000000001FLL;
  v12._object = (void *)0x800000010003A240;
  String.append(_:)(v12);
  swift_retain();
  v13._countAndFlagsBits = sub_10002B3D4();
  String.append(_:)(v13);
  swift_release();
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 62;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  return 0;
}

id sub_1000349C0()
{
  Swift::String v1 = (objc_class *)type metadata accessor for DaemonListenerDelegate();
  DebuggingResponder.deregisterForDebuggingRequests()();
  v3.receiver = v0;
  v3.super_class = v1;
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for DaemonListenerDelegate()
{
  return self;
}

uint64_t sub_100034B50()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::String v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemon.getter();
  Swift::String v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = ObjectType;
    *(_DWORD *)id v7 = 136315138;
    swift_getMetatypeMetadata();
    uint64_t v8 = String.init<A>(describing:)();
    uint64_t v12 = sub_10000E724(v8, v9, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%s]: debuggingInfoRequested()", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

unsigned char *initializeBufferWithCopyOfBuffer for BackgroundGenerationActivityType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100034E30(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100034E38(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundGenerationActivityType()
{
  return &type metadata for BackgroundGenerationActivityType;
}

uint64_t sub_100034E50()
{
  return sub_100035FE0(&qword_100046BE0, (void (*)(uint64_t))sub_100034E98);
}

void sub_100034E98()
{
  if (!qword_100046BE8)
  {
    unint64_t v0 = type metadata accessor for Array();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046BE8);
    }
  }
}

unint64_t sub_100034EF4()
{
  unint64_t result = qword_100046BF0;
  if (!qword_100046BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046BF0);
  }
  return result;
}

BOOL sub_100034F48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100034F5C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100034FA4()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100034FD0()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100035014(uint64_t a1, void *a2, uint64_t a3, void *aBlock)
{
  os_log_type_t v6 = *(void (**)(id, uint64_t, void (*)(uint64_t, uint64_t), uint64_t))(a1 + 32);
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_retain();
  id v9 = a2;
  swift_unknownObjectRetain();
  v6(v9, a3, sub_100036194, v8);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

void sub_1000350EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_10003515C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000360F0();
  char v35 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v32 = v2;
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v20 >= v33) {
      break;
    }
    uint64_t v21 = (void *)(v5 + 64);
    unint64_t v22 = *(void *)(v34 + 8 * v20);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v20 + 1;
      if (v20 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v34 + 8 * v13);
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v33)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v32;
          if ((v35 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v22 = *(void *)(v34 + 8 * v23);
        if (!v22)
        {
          while (1)
          {
            int64_t v13 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v33) {
              goto LABEL_33;
            }
            unint64_t v22 = *(void *)(v34 + 8 * v13);
            ++v23;
            if (v22) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v23;
      }
    }
LABEL_30:
    unint64_t v10 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_31:
    char v28 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v29 = *(void **)(*(void *)(v5 + 56) + 8 * v19);
    if ((v35 & 1) == 0) {
      id v30 = v29;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v26 = v16 == v25;
        if (v16 == v25) {
          unint64_t v16 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v16);
      }
      while (v27 == -1);
      unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v28;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v32;
  uint64_t v21 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v21, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v21 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

id sub_1000354C4()
{
  Swift::UInt v1 = v0;
  sub_1000360F0();
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *Swift::UInt v1 = v4;
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
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = *(void **)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = v16;
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

unint64_t sub_100035664(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100041A00, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t sub_1000356B0()
{
  unint64_t result = qword_100046BF8;
  if (!qword_100046BF8)
  {
    type metadata accessor for DaemonListenerDelegate();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100046BF8);
  }
  return result;
}

uint64_t sub_1000356E8(void *a1)
{
  Swift::String v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v75 = *(void *)(v5 - 8);
  uint64_t v76 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v71 - v10;
  __chkstk_darwin(v9);
  int64_t v13 = (char *)&v71 - v12;
  uint64_t v14 = type metadata accessor for HealthPluginHostEntitlement();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  int64_t v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, enum case for HealthPluginHostEntitlement.allowed(_:), v14);
  sub_100035FE0((unint64_t *)&unk_100046C00, (void (*)(uint64_t))&type metadata accessor for HealthPluginHostEntitlement);
  uint64_t v18 = NSXPCConnection.value<A>(for:)();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if (v18 && (uint64_t v78 = v18, swift_dynamicCast()) && (v77 & 1) != 0)
  {
    static Logger.daemon.getter();
    id v19 = a1;
    int64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    int v22 = v21;
    BOOL v23 = os_log_type_enabled(v20, v21);
    uint64_t v74 = v19;
    if (v23)
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v73 = (void (*)(char *, uint64_t))swift_slowAlloc();
      uint64_t v77 = (uint64_t)v73;
      uint64_t v78 = ObjectType;
      *(_DWORD *)uint64_t v24 = 136315394;
      LODWORD(v72) = v22;
      swift_getMetatypeMetadata();
      os_log_t v71 = v20;
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v78 = sub_10000E724(v25, v26, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      id v27 = v19;
      id v28 = [v27 description];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v31 = v30;

      uint64_t v78 = sub_10000E724(v29, v31, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      os_log_t v32 = v71;
      _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v72, "[%s] listener:shouldAcceptNewConnection: Allowing connection: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v46 = *(void (**)(char *, uint64_t))(v75 + 8);
    v46(v13, v76);
    uint64_t v73 = v46;
    uint64_t v47 = *(void **)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_healthExperienceStoreOracle];
    uint64_t v48 = *(void *)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_feedPopulationManagerOracle];
    uint64_t v49 = *(void *)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_longRunningProcessOracle];
    uint64_t v50 = *(void *)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_countryOracle];
    uint64_t v51 = *(void *)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_transactionBuilderManager];
    uint64_t v52 = *(void *)&v2[OBJC_IVAR____TtC10healthappd22DaemonListenerDelegate_backgroundGenerationActivities];
    objc_allocWithZone((Class)type metadata accessor for HealthPluginHostService(0));
    id v53 = v47;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    id v54 = sub_1000077A4(v53, v48, v49, v50, v51, v52);
    static Logger.daemon.getter();
    uint64_t v55 = v2;
    id v56 = v54;
    unint64_t v57 = v55;
    id v58 = v56;
    uint64_t v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.default.getter();
    int v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v62 = swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      uint64_t v78 = v72;
      *(_DWORD *)uint64_t v62 = 136446466;
      LODWORD(v71) = v61;
      sub_100036028();
      sub_100027128();
      swift_bridgeObjectRetain();
      uint64_t v63 = Dictionary.Keys.description.getter();
      unint64_t v65 = v64;
      swift_bridgeObjectRelease();
      uint64_t v77 = sub_10000E724(v63, v65, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2080;
      id v66 = v58;
      id v67 = [v66 description];
      uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v70 = v69;

      uint64_t v77 = sub_10000E724(v68, v70, &v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v59, (os_log_type_t)v71, "Background generation activities %{public}s for connectionResponder %s", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v73(v11, v76);
    sub_10001BE24(v74);

    return 1;
  }
  else
  {
    static Logger.daemon.getter();
    id v33 = a1;
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v74 = (void *)swift_slowAlloc();
      uint64_t v77 = (uint64_t)v74;
      uint64_t v78 = ObjectType;
      *(_DWORD *)uint64_t v36 = 136315650;
      swift_getMetatypeMetadata();
      uint64_t v37 = String.init<A>(describing:)();
      uint64_t v78 = sub_10000E724(v37, v38, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 1024;
      unsigned int v39 = [v33 processIdentifier];

      LODWORD(v78) = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      *(_WORD *)(v36 + 18) = 2080;
      id v40 = v33;
      id v41 = [v40 description];
      uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v44 = v43;

      uint64_t v78 = sub_10000E724(v42, v44, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "[%s] listener:shouldAcceptNewConnection: NO ENTITLEMENT! NOT ALLOWING PROCESS %d: %s", (uint8_t *)v36, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v75 + 8))(v8, v76);
    return 0;
  }
}

uint64_t sub_100035FE0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100036028()
{
  unint64_t result = qword_100046660;
  if (!qword_100046660)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100046660);
  }
  return result;
}

uint64_t sub_100036068()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000360A0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000360E0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  return sub_1000338D4(a1, a2, a3, a4, *(unsigned __int8 *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32));
}

void sub_1000360F0()
{
  if (!qword_100046C18)
  {
    sub_100036028();
    sub_100027128();
    unint64_t v0 = type metadata accessor for _DictionaryStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100046C18);
    }
  }
}

uint64_t sub_10003615C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100036194(uint64_t a1, uint64_t a2)
{
  sub_1000350EC(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_10003619C()
{
  unint64_t result = qword_100046C20;
  if (!qword_100046C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046C20);
  }
  return result;
}

uint64_t sub_1000361F0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100036238(int a1)
{
  return sub_1000343DC(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void (**)(void, void))(v1 + 48), *(void *)(v1 + 56));
}

uint64_t _s10healthappd32BackgroundGenerationActivityTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s10healthappd32BackgroundGenerationActivityTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000363A8);
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

ValueMetadata *type metadata accessor for HealthPluginHostServiceXPCActivityError()
{
  return &type metadata for HealthPluginHostServiceXPCActivityError;
}

unint64_t sub_1000363E4()
{
  unint64_t result = qword_100046C28;
  if (!qword_100046C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100046C28);
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t static DateInterval.allTimeInterval.getter()
{
  return static DateInterval.allTimeInterval.getter();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for DateInterval()
{
  return type metadata accessor for DateInterval();
}

uint64_t Notification.oracle.getter()
{
  return Notification.oracle.getter();
}

NSNotification __swiftcall Notification._bridgeToObjectiveC()()
{
  return (NSNotification)Notification._bridgeToObjectiveC()();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.init(name:object:userInfo:)()
{
  return Notification.init(name:object:userInfo:)();
}

uint64_t Notification.userInfo.setter()
{
  return Notification.userInfo.setter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t DiskHealthExperienceStore.init(overrideStoreLocation:observeExternalChanges:)()
{
  return DiskHealthExperienceStore.init(overrideStoreLocation:observeExternalChanges:)();
}

uint64_t dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()()
{
  return dispatch thunk of DiskHealthExperienceStore.deleteAllObjects()();
}

uint64_t dispatch thunk of DiskHealthExperienceStore.register(observer:)()
{
  return dispatch thunk of DiskHealthExperienceStore.register(observer:)();
}

uint64_t type metadata accessor for DiskHealthExperienceStore()
{
  return type metadata accessor for DiskHealthExperienceStore();
}

uint64_t dispatch thunk of DaemonHealthExperienceStore.cleanUpManagedObjectContext()()
{
  return dispatch thunk of DaemonHealthExperienceStore.cleanUpManagedObjectContext()();
}

uint64_t type metadata accessor for DaemonHealthExperienceStore()
{
  return type metadata accessor for DaemonHealthExperienceStore();
}

uint64_t static DaemonHealthExperienceStoreOracle.shared.getter()
{
  return static DaemonHealthExperienceStoreOracle.shared.getter();
}

uint64_t type metadata accessor for DaemonHealthExperienceStoreOracle()
{
  return type metadata accessor for DaemonHealthExperienceStoreOracle();
}

uint64_t HealthKitProvider.init()()
{
  return HealthKitProvider.init()();
}

uint64_t type metadata accessor for HealthKitProvider()
{
  return type metadata accessor for HealthKitProvider();
}

uint64_t static HealthAppPluginSource.knownBundles.getter()
{
  return static HealthAppPluginSource.knownBundles.getter();
}

uint64_t HealthAppPluginSource.init(bundleProvider:knownBundles:disabledBundleIdentifiers:allowedBundleIdentifiers:)()
{
  return HealthAppPluginSource.init(bundleProvider:knownBundles:disabledBundleIdentifiers:allowedBundleIdentifiers:)();
}

uint64_t HealthAppPluginSource.conformingPlugins<A>(_:)()
{
  return HealthAppPluginSource.conformingPlugins<A>(_:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HealthAppPluginSource.loadPluginsFromDisk()()
{
}

uint64_t static HealthAppPluginSource.allowedBundleIdentifiers()()
{
  return static HealthAppPluginSource.allowedBundleIdentifiers()();
}

uint64_t static HealthAppPluginSource.disabledBundleIdentifiers()()
{
  return static HealthAppPluginSource.disabledBundleIdentifiers()();
}

uint64_t type metadata accessor for HealthAppPluginSource()
{
  return type metadata accessor for HealthAppPluginSource();
}

uint64_t dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter()
{
  return dispatch thunk of HealthExperienceStore.sharedBackgroundContext.getter();
}

uint64_t dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter()
{
  return dispatch thunk of HealthExperienceStoreOracle.readyHealthExperienceStore.getter();
}

uint64_t dispatch thunk of HealthExperienceStoreOracle.register(observer:)()
{
  return dispatch thunk of HealthExperienceStoreOracle.register(observer:)();
}

uint64_t type metadata accessor for HealthPluginHostEntitlement()
{
  return type metadata accessor for HealthPluginHostEntitlement();
}

uint64_t dispatch thunk of HealthAppNotificationManager.removeAllPluginFeedItemNotifications()()
{
  return dispatch thunk of HealthAppNotificationManager.removeAllPluginFeedItemNotifications()();
}

uint64_t HealthAppNotificationManager.__allocating_init()()
{
  return HealthAppNotificationManager.__allocating_init()();
}

uint64_t type metadata accessor for HealthAppNotificationManager()
{
  return type metadata accessor for HealthAppNotificationManager();
}

Swift::Void __swiftcall HealthAppForegroundWorkManager.endForeground()()
{
}

uint64_t HealthAppForegroundWorkManager.forceStart(within:)()
{
  return HealthAppForegroundWorkManager.forceStart(within:)();
}

uint64_t HealthAppForegroundWorkManager.init(workRunner:urgentWorkTimeoutInterval:)()
{
  return HealthAppForegroundWorkManager.init(workRunner:urgentWorkTimeoutInterval:)();
}

Swift::Void __swiftcall HealthAppForegroundWorkManager.cancelLegacyGeneration()()
{
}

uint64_t HealthAppForegroundWorkManager.foregroundWithFireOnceBarrier(_:)()
{
  return HealthAppForegroundWorkManager.foregroundWithFireOnceBarrier(_:)();
}

uint64_t HealthAppForegroundWorkManager.foregroundWithLegacyGeneration(completion:)()
{
  return HealthAppForegroundWorkManager.foregroundWithLegacyGeneration(completion:)();
}

Swift::Void __swiftcall HealthAppForegroundWorkManager.start()()
{
}

uint64_t type metadata accessor for HealthAppForegroundWorkManager()
{
  return type metadata accessor for HealthAppForegroundWorkManager();
}

uint64_t HealthAppOrchestrationListener.init(listener:coordinator:)()
{
  return HealthAppOrchestrationListener.init(listener:coordinator:)();
}

uint64_t type metadata accessor for HealthAppOrchestrationListener()
{
  return type metadata accessor for HealthAppOrchestrationListener();
}

uint64_t dispatch thunk of HealthPluginHostNotificationBuffer.storeNotification(_:)()
{
  return dispatch thunk of HealthPluginHostNotificationBuffer.storeNotification(_:)();
}

uint64_t static HealthPluginHostNotificationBuffer.shared.getter()
{
  return static HealthPluginHostNotificationBuffer.shared.getter();
}

uint64_t type metadata accessor for HealthPluginHostNotificationBuffer()
{
  return type metadata accessor for HealthPluginHostNotificationBuffer();
}

uint64_t HealthExperienceStoreCleanupOperation.init(context:)()
{
  return HealthExperienceStoreCleanupOperation.init(context:)();
}

uint64_t type metadata accessor for HealthExperienceStoreCleanupOperation()
{
  return type metadata accessor for HealthExperienceStoreCleanupOperation();
}

uint64_t HealthPluginHostBufferPostNotificationUserInfoKey.getter()
{
  return HealthPluginHostBufferPostNotificationUserInfoKey.getter();
}

uint64_t HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)()
{
  return HealthPlatformContextProvider.init(profileStore:experienceStoreOracle:pinnedContentManager:notificationManager:transactionBuilderManager:healthStore:logger:)();
}

uint64_t type metadata accessor for HealthPlatformContextProvider()
{
  return type metadata accessor for HealthPlatformContextProvider();
}

uint64_t dispatch thunk of UnfairLock.assertOwner()()
{
  return dispatch thunk of UnfairLock.assertOwner()();
}

uint64_t dispatch thunk of UnfairLock.lock()()
{
  return dispatch thunk of UnfairLock.lock()();
}

uint64_t dispatch thunk of UnfairLock.unlock()()
{
  return dispatch thunk of UnfairLock.unlock()();
}

uint64_t UnfairLock.init()()
{
  return UnfairLock.init()();
}

uint64_t type metadata accessor for UnfairLock()
{
  return type metadata accessor for UnfairLock();
}

uint64_t type metadata accessor for ContentKind()
{
  return type metadata accessor for ContentKind();
}

uint64_t LogCategory.logHandle.getter()
{
  return LogCategory.logHandle.getter();
}

uint64_t type metadata accessor for LogCategory()
{
  return type metadata accessor for LogCategory();
}

uint64_t UserDefault.wrappedValue.getter()
{
  return UserDefault.wrappedValue.getter();
}

uint64_t UserDefault.wrappedValue.setter()
{
  return UserDefault.wrappedValue.setter();
}

uint64_t UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)()
{
  return UserDefault.init(key:userDefaults:fallbackValue:isAppleInternalOnly:)();
}

uint64_t static SourceProfile.primary.getter()
{
  return static SourceProfile.primary.getter();
}

uint64_t type metadata accessor for PluginFeedItem.NotificationIdentifier()
{
  return type metadata accessor for PluginFeedItem.NotificationIdentifier();
}

uint64_t static GenerationPhase.allCases.getter()
{
  return static GenerationPhase.allCases.getter();
}

uint64_t type metadata accessor for GenerationPhase()
{
  return type metadata accessor for GenerationPhase();
}

uint64_t type metadata accessor for GenerationQueue.EnqueueResult()
{
  return type metadata accessor for GenerationQueue.EnqueueResult();
}

uint64_t dispatch thunk of GenerationQueue.cancelAllOperations()()
{
  return dispatch thunk of GenerationQueue.cancelAllOperations()();
}

uint64_t type metadata accessor for GenerationQueue.State()
{
  return type metadata accessor for GenerationQueue.State();
}

uint64_t dispatch thunk of GenerationQueue.state.getter()
{
  return dispatch thunk of GenerationQueue.state.getter();
}

uint64_t dispatch thunk of GenerationQueue.enqueue(_:)()
{
  return dispatch thunk of GenerationQueue.enqueue(_:)();
}

uint64_t GenerationQueue.init()()
{
  return GenerationQueue.init()();
}

uint64_t type metadata accessor for GenerationQueue()
{
  return type metadata accessor for GenerationQueue();
}

uint64_t GeneratorDomain.contentKinds.getter()
{
  return GeneratorDomain.contentKinds.getter();
}

uint64_t type metadata accessor for GeneratorDomain()
{
  return type metadata accessor for GeneratorDomain();
}

uint64_t static UserDefaultsKeys.appLastOpenedDateKey.getter()
{
  return static UserDefaultsKeys.appLastOpenedDateKey.getter();
}

uint64_t static UserDefaultsKeys.appFirstLaunchDateKey.getter()
{
  return static UserDefaultsKeys.appFirstLaunchDateKey.getter();
}

Swift::Void __swiftcall DebuggingResponder.registerForDebuggingRequests()()
{
}

Swift::Void __swiftcall DebuggingResponder.deregisterForDebuggingRequests()()
{
}

uint64_t PinnedContentManager.__allocating_init(healthStore:domain:)()
{
  return PinnedContentManager.__allocating_init(healthStore:domain:)();
}

uint64_t type metadata accessor for PinnedContentManager()
{
  return type metadata accessor for PinnedContentManager();
}

uint64_t type metadata accessor for CountryRetrievalError()
{
  return type metadata accessor for CountryRetrievalError();
}

uint64_t GenerationWorkRequest.makeGenerationWorkBlock.getter()
{
  return GenerationWorkRequest.makeGenerationWorkBlock.getter();
}

uint64_t GenerationWorkRequest.makeGenerationWorkBlock.setter()
{
  return GenerationWorkRequest.makeGenerationWorkBlock.setter();
}

uint64_t GenerationWorkRequest.init(environment:pluginIdentifierSetToRun:generationPhases:commitUrgentTransaction:makeGenerationWorkBlock:completionBlock:notStartedCancellationBlock:)()
{
  return GenerationWorkRequest.init(environment:pluginIdentifierSetToRun:generationPhases:commitUrgentTransaction:makeGenerationWorkBlock:completionBlock:notStartedCancellationBlock:)();
}

uint64_t GenerationWorkRequest.completionBlock.setter()
{
  return GenerationWorkRequest.completionBlock.setter();
}

uint64_t GenerationWorkRequest.generationPhases.getter()
{
  return GenerationWorkRequest.generationPhases.getter();
}

uint64_t GenerationWorkRequest.commitUrgentTransaction.getter()
{
  return GenerationWorkRequest.commitUrgentTransaction.getter();
}

uint64_t GenerationWorkRequest.pluginIdentifierSetToRun.getter()
{
  return GenerationWorkRequest.pluginIdentifierSetToRun.getter();
}

uint64_t GenerationWorkRequest.notStartedCancellationBlock.setter()
{
  return GenerationWorkRequest.notStartedCancellationBlock.setter();
}

uint64_t type metadata accessor for GenerationWorkRequest()
{
  return type metadata accessor for GenerationWorkRequest();
}

uint64_t type metadata accessor for CountryRetrievalRecord()
{
  return type metadata accessor for CountryRetrievalRecord();
}

uint64_t dispatch thunk of CancellableProgressList.clearProgress(for:)()
{
  return dispatch thunk of CancellableProgressList.clearProgress(for:)();
}

uint64_t dispatch thunk of CancellableProgressList.add(_:uuid:)()
{
  return dispatch thunk of CancellableProgressList.add(_:uuid:)();
}

uint64_t dispatch thunk of CancellableProgressList.cancelAll()()
{
  return dispatch thunk of CancellableProgressList.cancelAll()();
}

uint64_t CancellableProgressList.init()()
{
  return CancellableProgressList.init()();
}

uint64_t type metadata accessor for CancellableProgressList()
{
  return type metadata accessor for CancellableProgressList();
}

uint64_t LegacyGenerationProvider.init(environmentalState:)()
{
  return LegacyGenerationProvider.init(environmentalState:)();
}

uint64_t type metadata accessor for LegacyGenerationProvider()
{
  return type metadata accessor for LegacyGenerationProvider();
}

uint64_t OrchestrationRetryManager.init(director:)()
{
  return OrchestrationRetryManager.init(director:)();
}

uint64_t type metadata accessor for OrchestrationRetryManager()
{
  return type metadata accessor for OrchestrationRetryManager();
}

uint64_t dispatch thunk of OpenTransactionBuilderManager.clearAllCachedTransactionBuilders()()
{
  return dispatch thunk of OpenTransactionBuilderManager.clearAllCachedTransactionBuilders()();
}

uint64_t dispatch thunk of OpenTransactionBuilderManager.commitTransaction(healthStore:asUrgent:completion:)()
{
  return dispatch thunk of OpenTransactionBuilderManager.commitTransaction(healthStore:asUrgent:completion:)();
}

uint64_t static OpenTransactionBuilderManager.shared.getter()
{
  return static OpenTransactionBuilderManager.shared.getter();
}

uint64_t type metadata accessor for OpenTransactionBuilderManager()
{
  return type metadata accessor for OpenTransactionBuilderManager();
}

uint64_t DatabaseAccessibilityDispatchTarget.init(target:)()
{
  return DatabaseAccessibilityDispatchTarget.init(target:)();
}

uint64_t type metadata accessor for DatabaseAccessibilityDispatchTarget()
{
  return type metadata accessor for DatabaseAccessibilityDispatchTarget();
}

uint64_t OrchestrationWorkQueueStatusObserver.finishedWorkPlans.getter()
{
  return OrchestrationWorkQueueStatusObserver.finishedWorkPlans.getter();
}

Swift::Void __swiftcall OrchestrationWorkQueueStatusObserver.didFinishStartup(latency:)(Swift::Double latency)
{
}

Swift::Void __swiftcall OrchestrationWorkQueueStatusObserver.didEndForegroundSession(planCount:duration:)(Swift::Int planCount, Swift::Double duration)
{
}

Swift::Void __swiftcall OrchestrationWorkQueueStatusObserver.didStartForegroundSession(planCount:duration:)(Swift::Int planCount, Swift::Double duration)
{
}

uint64_t OrchestrationWorkQueueStatusObserver.init()()
{
  return OrchestrationWorkQueueStatusObserver.init()();
}

uint64_t type metadata accessor for OrchestrationWorkQueueStatusObserver()
{
  return type metadata accessor for OrchestrationWorkQueueStatusObserver();
}

uint64_t USR1SignalDebuggingResponderListener.init()()
{
  return USR1SignalDebuggingResponderListener.init()();
}

uint64_t type metadata accessor for USR1SignalDebuggingResponderListener()
{
  return type metadata accessor for USR1SignalDebuggingResponderListener();
}

uint64_t static Feed.Kind.relevanceRankedFeeds.getter()
{
  return static Feed.Kind.relevanceRankedFeeds.getter();
}

uint64_t Feed.Kind.init(rawValue:)()
{
  return Feed.Kind.init(rawValue:)();
}

uint64_t Feed.Kind.rawValue.getter()
{
  return Feed.Kind.rawValue.getter();
}

uint64_t TransactionRecord.init(name:)()
{
  return TransactionRecord.init(name:)();
}

uint64_t type metadata accessor for TransactionRecord()
{
  return type metadata accessor for TransactionRecord();
}

uint64_t TransactionManagedCache.fetchCachedOrCreate(for:using:)()
{
  return TransactionManagedCache.fetchCachedOrCreate(for:using:)();
}

uint64_t TransactionManagedCache.finishUse(for:)()
{
  return TransactionManagedCache.finishUse(for:)();
}

uint64_t TransactionManagedCache.init()()
{
  return TransactionManagedCache.init()();
}

uint64_t CurrentOSUpdateDateProvider.init()()
{
  return CurrentOSUpdateDateProvider.init()();
}

uint64_t type metadata accessor for CurrentOSUpdateDateProvider()
{
  return type metadata accessor for CurrentOSUpdateDateProvider();
}

uint64_t type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource()
{
  return type metadata accessor for PluginAdvertisableFeatureSourceContext.DeviceSource();
}

uint64_t dispatch thunk of HealthWelcomeFlowSignalManager.determineIfHealthWelcomeFlowShouldShowOnNextAppOpen(completion:)()
{
  return dispatch thunk of HealthWelcomeFlowSignalManager.determineIfHealthWelcomeFlowShouldShowOnNextAppOpen(completion:)();
}

uint64_t HealthWelcomeFlowSignalManager.init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)()
{
  return HealthWelcomeFlowSignalManager.init(advertisableFeatureManagerFactory:healthWelcomeFlowSignalProvider:currentOSUpdateDateProvider:currentDateGenerator:)();
}

uint64_t type metadata accessor for HealthWelcomeFlowSignalManager()
{
  return type metadata accessor for HealthWelcomeFlowSignalManager();
}

uint64_t HealthWelcomeFlowSignalProvider.init()()
{
  return HealthWelcomeFlowSignalProvider.init()();
}

uint64_t type metadata accessor for HealthWelcomeFlowSignalProvider()
{
  return type metadata accessor for HealthWelcomeFlowSignalProvider();
}

uint64_t HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)()
{
  return HealthPluginAdvertisableFeatureManagerFactory.init(healthStore:countryProvider:activeDeviceSource:queue:)();
}

uint64_t type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory()
{
  return type metadata accessor for HealthPluginAdvertisableFeatureManagerFactory();
}

uint64_t CountryOracle.init(mobileCountryCodeManagerProvider:)()
{
  return CountryOracle.init(mobileCountryCodeManagerProvider:)();
}

uint64_t dispatch thunk of CountryOracle.currentCountry()()
{
  return dispatch thunk of CountryOracle.currentCountry()();
}

uint64_t type metadata accessor for CountryOracle()
{
  return type metadata accessor for CountryOracle();
}

uint64_t GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)()
{
  return GeneratorPipelineGenerationOperation.__allocating_init(feedItemManager:sharableModelManager:sourceProfiles:country:generationPhases:commitAsUrgent:isLaunchGeneration:timeoutInterval:)();
}

uint64_t type metadata accessor for GeneratorPipelineGenerationOperation()
{
  return type metadata accessor for GeneratorPipelineGenerationOperation();
}

uint64_t PinnedContentStateFeedItemCacheObserver.init(pinnedContentManager:storeOracle:)()
{
  return PinnedContentStateFeedItemCacheObserver.init(pinnedContentManager:storeOracle:)();
}

uint64_t type metadata accessor for PinnedContentStateFeedItemCacheObserver()
{
  return type metadata accessor for PinnedContentStateFeedItemCacheObserver();
}

uint64_t ForegroundFeedPopulationListeningOperation.init(healthExperienceStore:listener:)()
{
  return ForegroundFeedPopulationListeningOperation.init(healthExperienceStore:listener:)();
}

uint64_t type metadata accessor for ForegroundFeedPopulationListeningOperation()
{
  return type metadata accessor for ForegroundFeedPopulationListeningOperation();
}

uint64_t static HealthAppOrchestrationClient.serviceName.getter()
{
  return static HealthAppOrchestrationClient.serviceName.getter();
}

uint64_t type metadata accessor for HealthAppOrchestrationClient()
{
  return type metadata accessor for HealthAppOrchestrationClient();
}

uint64_t static BundleFeedItemPluginBundleProvider.sharedInstance.getter()
{
  return static BundleFeedItemPluginBundleProvider.sharedInstance.getter();
}

uint64_t type metadata accessor for BundleFeedItemPluginBundleProvider()
{
  return type metadata accessor for BundleFeedItemPluginBundleProvider();
}

uint64_t AnyGenerator.domain.getter()
{
  return AnyGenerator.domain.getter();
}

uint64_t type metadata accessor for AnyGenerator()
{
  return type metadata accessor for AnyGenerator();
}

uint64_t type metadata accessor for ModelTrainingEvent()
{
  return type metadata accessor for ModelTrainingEvent();
}

uint64_t dispatch thunk of PluginBundleProvider.availablePluginsMap.getter()
{
  return dispatch thunk of PluginBundleProvider.availablePluginsMap.getter();
}

uint64_t dispatch thunk of PluginBundleProvider.availableLaunchGenerationPlugins.getter()
{
  return dispatch thunk of PluginBundleProvider.availableLaunchGenerationPlugins.getter();
}

uint64_t FeedPopulationManaging<>.handleUpdatedFeedItems(_:)()
{
  return FeedPopulationManaging<>.handleUpdatedFeedItems(_:)();
}

uint64_t GeneratorPipelineManager.GenerationState.outstandingGenerators.getter()
{
  return GeneratorPipelineManager.GenerationState.outstandingGenerators.getter();
}

uint64_t type metadata accessor for GeneratorPipelineManager.GenerationState()
{
  return type metadata accessor for GeneratorPipelineManager.GenerationState();
}

uint64_t GeneratorPipelineManager.generationState.getter()
{
  return GeneratorPipelineManager.generationState.getter();
}

uint64_t GeneratorPipelineManager.store.getter()
{
  return GeneratorPipelineManager.store.getter();
}

uint64_t GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)()
{
  return GeneratorPipelineManager.__allocating_init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:)();
}

uint64_t PipelineProviderWrappers.sharableModel.getter()
{
  return PipelineProviderWrappers.sharableModel.getter();
}

uint64_t PipelineProviderWrappers.feedItem.getter()
{
  return PipelineProviderWrappers.feedItem.getter();
}

uint64_t type metadata accessor for PipelineProviderWrappers()
{
  return type metadata accessor for PipelineProviderWrappers();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.deleteFeed(feedKinds:completion:)()
{
  return dispatch thunk of BaseFeedPopulationManager.deleteFeed(feedKinds:completion:)();
}

uint64_t dispatch thunk of BaseFeedPopulationManager.populateFeed(feedKinds:completion:)()
{
  return dispatch thunk of BaseFeedPopulationManager.populateFeed(feedKinds:completion:)();
}

uint64_t BaseFeedPopulationManager.healthExperienceStore.getter()
{
  return BaseFeedPopulationManager.healthExperienceStore.getter();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithEndOfSessionAnalytics(from:in:completion:)()
{
  return dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithEndOfSessionAnalytics(from:in:completion:)();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.dateLastPredictiveGenerationRanForAnalytics.setter()
{
  return dispatch thunk of AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.dateLastPredictiveGenerationRanForAnalytics.setter();
}

uint64_t static AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.shared.getter()
{
  return static AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider.shared.getter();
}

uint64_t type metadata accessor for AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider()
{
  return type metadata accessor for AppSessionAnalyticsManager.DefaultsPredictiveGenerationAnalyticsDateProvider();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithImproveHealthActivityAnalytics()()
{
  return dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithImproveHealthActivityAnalytics()();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithDemographicAnalytics()()
{
  return dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithDemographicAnalytics()();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithHighlightsFeedPresentationAnalytics(in:)()
{
  return dispatch thunk of AppSessionAnalyticsManager.updateCurrentEventWithHighlightsFeedPresentationAnalytics(in:)();
}

uint64_t dispatch thunk of AppSessionAnalyticsManager.submitCurrentEvent(resetAfterSubmitted:)()
{
  return dispatch thunk of AppSessionAnalyticsManager.submitCurrentEvent(resetAfterSubmitted:)();
}

uint64_t AppSessionAnalyticsManager.init()()
{
  return AppSessionAnalyticsManager.init()();
}

uint64_t type metadata accessor for AppSessionAnalyticsManager()
{
  return type metadata accessor for AppSessionAnalyticsManager();
}

uint64_t static FeedPopulationListenerSupport.makeThrottledFeedItemSubmissionPublisher<A>(config:)()
{
  return static FeedPopulationListenerSupport.makeThrottledFeedItemSubmissionPublisher<A>(config:)();
}

uint64_t GeneratorPipelineManagerWrapper.subscript.getter()
{
  return GeneratorPipelineManagerWrapper.subscript.getter();
}

uint64_t type metadata accessor for GeneratorPipelineManagerWrapper()
{
  return type metadata accessor for GeneratorPipelineManagerWrapper();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.generateHighlightsFeedIfAppropriate(completion:)()
{
  return dispatch thunk of SummaryTabFeedPopulationManager.generateHighlightsFeedIfAppropriate(completion:)();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.managedFeedKinds.getter()
{
  return dispatch thunk of SummaryTabFeedPopulationManager.managedFeedKinds.getter();
}

uint64_t dispatch thunk of SummaryTabFeedPopulationManager.submitTraining(trainingEvents:store:completion:)()
{
  return dispatch thunk of SummaryTabFeedPopulationManager.submitTraining(trainingEvents:store:completion:)();
}

uint64_t SummaryTabFeedPopulationManager.collectDiagnosticLogs(_:)()
{
  return SummaryTabFeedPopulationManager.collectDiagnosticLogs(_:)();
}

uint64_t SummaryTabFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:)()
{
  return SummaryTabFeedPopulationManager.__allocating_init(healthExperienceStore:healthStore:)();
}

uint64_t type metadata accessor for SummaryTabFeedPopulationManager()
{
  return type metadata accessor for SummaryTabFeedPopulationManager();
}

uint64_t FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)()
{
  return FeedItemGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)();
}

uint64_t type metadata accessor for FeedItemGeneratorPipelineManager()
{
  return type metadata accessor for FeedItemGeneratorPipelineManager();
}

uint64_t FeedItemGeneratorPipelineManager.deinit()
{
  return FeedItemGeneratorPipelineManager.deinit();
}

uint64_t dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter()
{
  return dispatch thunk of BundleFeedItemGenerationPluginInfo.bundleIdentifier.getter();
}

uint64_t type metadata accessor for BundleFeedItemGenerationPluginInfo()
{
  return type metadata accessor for BundleFeedItemGenerationPluginInfo();
}

uint64_t DispatchQueueOrchestrationScheduler.__allocating_init(environment:)()
{
  return DispatchQueueOrchestrationScheduler.__allocating_init(environment:)();
}

uint64_t type metadata accessor for DispatchQueueOrchestrationScheduler()
{
  return type metadata accessor for DispatchQueueOrchestrationScheduler();
}

uint64_t SharableModelGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)()
{
  return SharableModelGeneratorPipelineManager.init(store:healthStore:delegates:environment:pinnedContentManager:notificationManager:transactionBuilderManager:scheduler:queueProvider:)();
}

uint64_t type metadata accessor for SharableModelGeneratorPipelineManager()
{
  return type metadata accessor for SharableModelGeneratorPipelineManager();
}

uint64_t ProfileDashboardsFeedPopulationListener.init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)()
{
  return ProfileDashboardsFeedPopulationListener.init<A>(sourceProfilePublisher:healthExperienceStore:submissionScheduler:)();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.managedFeedKinds.getter()
{
  return dispatch thunk of ProfileDashboardsFeedPopulationListener.managedFeedKinds.getter();
}

uint64_t dispatch thunk of ProfileDashboardsFeedPopulationListener.populateAllFeeds(feedKinds:completion:)()
{
  return dispatch thunk of ProfileDashboardsFeedPopulationListener.populateAllFeeds(feedKinds:completion:)();
}

uint64_t type metadata accessor for ProfileDashboardsFeedPopulationListener()
{
  return type metadata accessor for ProfileDashboardsFeedPopulationListener();
}

uint64_t static FeedPopulationListenerSchedulerConfiguration.realtime(queue:)()
{
  return static FeedPopulationListenerSchedulerConfiguration.realtime(queue:)();
}

uint64_t type metadata accessor for FeedPopulationListenerSchedulerConfiguration()
{
  return type metadata accessor for FeedPopulationListenerSchedulerConfiguration();
}

uint64_t OrchestrationDirector.init(environment:inputSignalProviders:executorProviders:contextProvider:dispatcher:logger:debugIdentifier:)()
{
  return OrchestrationDirector.init(environment:inputSignalProviders:executorProviders:contextProvider:dispatcher:logger:debugIdentifier:)();
}

uint64_t OrchestrationDirector.environment.getter()
{
  return OrchestrationDirector.environment.getter();
}

uint64_t OrchestrationDirector.debugSnapshot.getter()
{
  return OrchestrationDirector.debugSnapshot.getter();
}

uint64_t OrchestrationDirector.statusObserver.setter()
{
  return OrchestrationDirector.statusObserver.setter();
}

uint64_t OrchestrationDirector.orchestrationGraph()()
{
  return OrchestrationDirector.orchestrationGraph()();
}

uint64_t OrchestrationDirector.recheckFailedTriggers(priorityThresholdOverride:barrier:)()
{
  return OrchestrationDirector.recheckFailedTriggers(priorityThresholdOverride:barrier:)();
}

uint64_t OrchestrationDirector.start(completion:)()
{
  return OrchestrationDirector.start(completion:)();
}

uint64_t OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)()
{
  return OrchestrationDirector.fireOnce(priorityThresholdOverride:barrier:)();
}

uint64_t type metadata accessor for OrchestrationDirector()
{
  return type metadata accessor for OrchestrationDirector();
}

uint64_t DebugSnapshot.description.getter()
{
  return DebugSnapshot.description.getter();
}

uint64_t BuiltinProvider.init()()
{
  return BuiltinProvider.init()();
}

uint64_t type metadata accessor for BuiltinProvider()
{
  return type metadata accessor for BuiltinProvider();
}

uint64_t MultiDispatcher.init(target:width:)()
{
  return MultiDispatcher.init(target:width:)();
}

uint64_t type metadata accessor for MultiDispatcher()
{
  return type metadata accessor for MultiDispatcher();
}

uint64_t static PriorityRuleSet.Priority.lowestPriority.getter()
{
  return static PriorityRuleSet.Priority.lowestPriority.getter();
}

uint64_t type metadata accessor for PriorityRuleSet.Priority()
{
  return type metadata accessor for PriorityRuleSet.Priority();
}

Swift::Void __swiftcall AutoPauseController.pauseIfAnyMatches(descriptions:)(Swift::OpaquePointer descriptions)
{
}

uint64_t AutoPauseController.init(target:paused:environment:)()
{
  return AutoPauseController.init(target:paused:environment:)();
}

uint64_t type metadata accessor for AutoPauseController()
{
  return type metadata accessor for AutoPauseController();
}

uint64_t DirectDispatchTarget.init(providers:)()
{
  return DirectDispatchTarget.init(providers:)();
}

uint64_t type metadata accessor for DirectDispatchTarget()
{
  return type metadata accessor for DirectDispatchTarget();
}

uint64_t TimeoutDispatchTarget.init(timeout:target:)()
{
  return TimeoutDispatchTarget.init(timeout:target:)();
}

uint64_t type metadata accessor for TimeoutDispatchTarget()
{
  return type metadata accessor for TimeoutDispatchTarget();
}

uint64_t EnvironmentalStateManager.currentState.getter()
{
  return EnvironmentalStateManager.currentState.getter();
}

Swift::Void __swiftcall EnvironmentalStateManager.start(providers:)(Swift::OpaquePointer providers)
{
}

uint64_t EnvironmentalStateManager.init(logger:)()
{
  return EnvironmentalStateManager.init(logger:)();
}

uint64_t EnvironmentalStateManager.register(observer:)()
{
  return EnvironmentalStateManager.register(observer:)();
}

uint64_t type metadata accessor for EnvironmentalStateManager()
{
  return type metadata accessor for EnvironmentalStateManager();
}

uint64_t static EnvironmentalStateDescription.appSuspended(bundleIdentifier:)()
{
  return static EnvironmentalStateDescription.appSuspended(bundleIdentifier:)();
}

uint64_t static EnvironmentalStateDescription.appForeground(bundleIdentifier:)()
{
  return static EnvironmentalStateDescription.appForeground(bundleIdentifier:)();
}

Swift::Bool __swiftcall EnvironmentalStateDescription.matches(_:)(Swift::OpaquePointer a1)
{
  return EnvironmentalStateDescription.matches(_:)(a1._rawValue);
}

uint64_t type metadata accessor for EnvironmentalStateDescription()
{
  return type metadata accessor for EnvironmentalStateDescription();
}

Swift::Void __swiftcall AutoPriorityThresholdController.autoUpdatePriorityThreshold(pauseIfAnyMatches:)(Swift::OpaquePointer pauseIfAnyMatches)
{
}

uint64_t AutoPriorityThresholdController.init(target:environment:)()
{
  return AutoPriorityThresholdController.init(target:environment:)();
}

uint64_t type metadata accessor for AutoPriorityThresholdController()
{
  return type metadata accessor for AutoPriorityThresholdController();
}

uint64_t static Logger.generation.getter()
{
  return static Logger.generation.getter();
}

uint64_t static Logger.orchestration.getter()
{
  return static Logger.orchestration.getter();
}

uint64_t static Logger.personalization.getter()
{
  return static Logger.personalization.getter();
}

uint64_t static Logger.daemon.getter()
{
  return static Logger.daemon.getter();
}

uint64_t static Logger.general.getter()
{
  return static Logger.general.getter();
}

uint64_t static Logger.analytics.getter()
{
  return static Logger.analytics.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for Publishers.FirstWhere()
{
  return type metadata accessor for Publishers.FirstWhere();
}

uint64_t type metadata accessor for Publishers.HandleEvents()
{
  return type metadata accessor for Publishers.HandleEvents();
}

uint64_t type metadata accessor for Publishers.IgnoreOutput()
{
  return type metadata accessor for Publishers.IgnoreOutput();
}

uint64_t type metadata accessor for Publishers.Map()
{
  return type metadata accessor for Publishers.Map();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return type metadata accessor for AnyPublisher();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for Just()
{
  return type metadata accessor for Just();
}

uint64_t Just.init(_:)()
{
  return Just.init(_:)();
}

uint64_t Publisher<>.mapToSourceProfiles(includeAgnostic:)()
{
  return Publisher<>.mapToSourceProfiles(includeAgnostic:)();
}

uint64_t Publisher.retainingSink(receiveCompletion:receiveValue:)()
{
  return Publisher.retainingSink(receiveCompletion:receiveValue:)();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)()
{
  return Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
}

uint64_t Publisher.ignoreOutput()()
{
  return Publisher.ignoreOutput()();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t Publisher.first(where:)()
{
  return Publisher.first(where:)();
}

uint64_t Publisher.collect<A>(_:options:)()
{
  return Publisher.collect<A>(_:options:)();
}

uint64_t Publisher.timeout<A>(_:scheduler:options:customError:)()
{
  return Publisher.timeout<A>(_:scheduler:options:customError:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.Keys.description.getter()
{
  return Dictionary.Keys.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t Array<A>.makeGeneratorPipelineProviderWrappers()()
{
  return Array<A>.makeGeneratorPipelineProviderWrappers()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher()
{
  return type metadata accessor for HKProfileStore.ProfileIdentifiersPublisher();
}

uint64_t HKProfileStore.profileIdentifiersPublisher.getter()
{
  return HKProfileStore.profileIdentifiersPublisher.getter();
}

uint64_t static NSUserDefaults.healthAppShared.getter()
{
  return static NSUserDefaults.healthAppShared.getter();
}

uint64_t NSXPCConnection.value<A>(for:)()
{
  return NSXPCConnection.value<A>(for:)();
}

uint64_t static NSOperationQueue.userInitiated.getter()
{
  return static NSOperationQueue.userInitiated.getter();
}

NSOperationQueue __swiftcall NSOperationQueue.init(name:maxConcurrentOperationCount:)(Swift::String name, Swift::Int_optional maxConcurrentOperationCount)
{
  return (NSOperationQueue)NSOperationQueue.init(name:maxConcurrentOperationCount:)(name._countAndFlagsBits, name._object, maxConcurrentOperationCount.value, *(void *)&maxConcurrentOperationCount.is_nil);
}

uint64_t static NSOperationQueue.utility.getter()
{
  return static NSOperationQueue.utility.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
}

Swift::Void __swiftcall NSManagedObjectContext.queue_createProfiles(for:)(Swift::OpaquePointer a1)
{
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _SetStorage()
{
  return type metadata accessor for _SetStorage();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t type metadata accessor for _DictionaryStorage()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t type metadata accessor for Result()
{
  return type metadata accessor for Result();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return _HKPreferredRegulatoryDomainProvider();
}

uint64_t HKSetTemporaryDirectorySuffix()
{
  return _HKSetTemporaryDirectorySuffix();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}