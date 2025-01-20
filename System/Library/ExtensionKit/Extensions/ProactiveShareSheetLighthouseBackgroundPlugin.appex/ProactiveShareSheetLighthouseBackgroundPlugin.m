uint64_t one-time initialization function for defaultLogger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logging.defaultLogger);
  __swift_project_value_buffer(v0, (uint64_t)static Logging.defaultLogger);
  return Logger.init(subsystem:category:)();
}

uint64_t Logging.defaultLogger.unsafeMutableAddressor()
{
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v0, (uint64_t)static Logging.defaultLogger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t BackgroundWorkerError.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000026;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x6465727265666564;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance BackgroundWorkerError(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000026;
  unint64_t v4 = 0x800000010000ED40;
  switch(a1)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xD00000000000001CLL;
      v5 = "deferredDuringDataHarvesting";
      goto LABEL_7;
    case 3:
      unint64_t v3 = 0xD00000000000001DLL;
      v5 = "deferredAfterDataStorePruning";
      goto LABEL_7;
    case 4:
      unint64_t v4 = 0x800000010000EDB0;
      unint64_t v3 = 0xD000000000000014;
      break;
    case 5:
      unint64_t v3 = 0xD000000000000015;
      v5 = "deferredAfterTraining";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v3 = 0x6465727265666564;
      unint64_t v4 = 0xEF74726174537441;
      break;
  }
  unint64_t v6 = 0xD000000000000026;
  unint64_t v7 = 0x800000010000ED40;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v6 = 0xD00000000000001CLL;
      v8 = "deferredDuringDataHarvesting";
      goto LABEL_14;
    case 3:
      unint64_t v6 = 0xD00000000000001DLL;
      v8 = "deferredAfterDataStorePruning";
      goto LABEL_14;
    case 4:
      unint64_t v7 = 0x800000010000EDB0;
      unint64_t v6 = 0xD000000000000014;
      break;
    case 5:
      unint64_t v6 = 0xD000000000000015;
      v8 = "deferredAfterTraining";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v6 = 0x6465727265666564;
      unint64_t v7 = 0xEF74726174537441;
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BackgroundWorkerError()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance BackgroundWorkerError()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BackgroundWorkerError()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance BackgroundWorkerError@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized BackgroundWorkerError.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance BackgroundWorkerError@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = BackgroundWorkerError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for Error._domain.getter in conformance BackgroundWorkerError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance BackgroundWorkerError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance BackgroundWorkerError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance BackgroundWorkerError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MigrationWorkerError()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MigrationWorkerError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MigrationWorkerError()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MigrationWorkerError()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MigrationWorkerError@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance MigrationWorkerError, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MigrationWorkerError(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x800000010000EDF0;
}

void one-time initialization function for recipeVersionKey()
{
  static ShareSheetBackgroundWorker.recipeVersionKey = 0x6E6F6973726576;
  qword_1000149C0 = 0xE700000000000000;
}

void one-time initialization function for unknownVersion()
{
  static ShareSheetBackgroundWorker.unknownVersion = 0x6E776F6E6B6E75;
  unk_1000149D0 = 0xE700000000000000;
}

void one-time initialization function for purpleBuddyDefaults(uint64_t a1)
{
}

void one-time initialization function for purpleBuddySetupKey()
{
  static ShareSheetBackgroundWorker.purpleBuddySetupKey = 0x6E6F447075746553;
  *(void *)algn_1000149E8 = 0xE900000000000065;
}

void one-time initialization function for lightHouseBackgroundPluginDefaults(uint64_t a1)
{
}

void one-time initialization function for purpleBuddyDefaults(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithSuiteName:v6];

  *a4 = v7;
}

void ShareSheetBackgroundWorker.readTrialIdentifiers()(uint64_t a1@<X8>)
{
  id v2 = [self clientWithIdentifier:210];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 experimentIdentifiersWithNamespaceName:v3];

  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logging.defaultLogger);
  id v6 = v4;
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    v10 = (void *)swift_slowAlloc();
    *(_DWORD *)char v9 = 138412290;
    if (v6)
    {
      id v11 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v4 = 0;
    }
    void *v10 = v4;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "TrialRecipe: Trial identifiers: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (!v6) {
      goto LABEL_10;
    }
LABEL_7:
    id v12 = v6;
    id v13 = [v12 experimentId];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v14 = [v12 treatmentId];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    [v12 deploymentId];
    dispatch thunk of CustomStringConvertible.description.getter();
    TrialIdentifier.init(task:treatment:deployment:)();

    uint64_t v15 = type metadata accessor for TrialIdentifier();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a1, 0, 1, v15);
    return;
  }

  if (v6) {
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v16 = type metadata accessor for TrialIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 1, 1, v16);
}

uint64_t ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1)
{
  v1[51] = a1;
  type metadata accessor for ComputationState();
  v1[52] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for SubtaskName();
  v1[53] = v2;
  v1[54] = *(void *)(v2 - 8);
  v1[55] = swift_task_alloc();
  type metadata accessor for PluginSubtask();
  v1[56] = swift_task_alloc();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  v1[59] = swift_task_alloc();
  v1[60] = swift_task_alloc();
  v1[61] = swift_task_alloc();
  uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
  v1[62] = IsTaskCancelledExecutionManager;
  v1[63] = *(void *)(IsTaskCancelledExecutionManager - 8);
  v1[64] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for ConfigManager();
  v1[65] = v4;
  v1[66] = *(void *)(v4 - 8);
  v1[67] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v1[68] = swift_task_alloc();
  return _swift_task_switch(ShareSheetBackgroundWorker.doWork(context:), 0, 0);
}

uint64_t ShareSheetBackgroundWorker.doWork(context:)()
{
  uint64_t v210 = v0;
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  v1 = (id *)(v0 + 408);
  uint64_t v2 = *(void **)(v0 + 408);
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Logging.defaultLogger);
  id v4 = v2;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  os_log_type_t v8 = *(void **)(v0 + 408);
  v199 = (id *)(v0 + 408);
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    v207[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = MLHostExtensionContext.taskId.getter();
    *(void *)(v0 + 392) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v12 = MLHostExtensionContext.taskName.getter();
    *(void *)(v0 + 400) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, v207);
    v1 = (id *)(v0 + 408);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "TaskId: %s, TaskName: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (static Task<>.isCancelled.getter())
  {
    id v14 = *v1;
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.info.getter();
    BOOL v17 = os_log_type_enabled(v15, v16);
    id v18 = *v1;
    if (v17)
    {
      uint64_t v19 = swift_slowAlloc();
      v207[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v20 = MLHostExtensionContext.taskId.getter();
      *(void *)(v0 + 376) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v19 + 12) = 2080;
      uint64_t v22 = MLHostExtensionContext.taskName.getter();
      *(void *)(v0 + 384) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v15, v16, "TaskId: %s, TaskName: %s: asked to stop!", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v208 = &type metadata for BackgroundWorkerError;
    unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
    LOBYTE(v207[0]) = 0;
    id v26 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    uint64_t v202 = MLHostResult.init(error:policy:)();
    goto LABEL_36;
  }
  if (MLHostExtensionContext.taskName.getter() == 0xD000000000000041 && v24 == 0x800000010000ECE0)
  {
    swift_bridgeObjectRelease();
    char v25 = 1;
  }
  else
  {
    char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
  }
  id v27 = specialized ShareSheetBackgroundWorker.readTrialRecipe()();
  v203 = (uint64_t *)(v0 + 16);
  char v196 = v25;
  if (v27)
  {
    id v28 = v27;
    v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Using Recipe from Trial", v31, 2u);
      swift_slowDealloc();
    }

    v32 = v28;
  }
  else
  {
    v68 = *(char **)(v0 + 544);
    ShareSheetBackgroundWorker.recipeURL.getter(v68);
    v32 = specialized ShareSheetBackgroundWorker.readPluginRecipe(at:)(v68);
    outlined destroy of URL?(*(void *)(v0 + 544), &demangling cache variable for type metadata for URL?);
  }
  uint64_t v33 = *(void *)(v0 + 536);
  uint64_t v34 = *(void *)(v0 + 504);
  uint64_t v35 = *(void *)(v0 + 512);
  uint64_t v36 = *(void *)(v0 + 496);
  uint64_t v194 = *(void *)(v0 + 488);
  v195 = v32;
  uint64_t v38 = *(void *)(v0 + 432);
  uint64_t v37 = *(void *)(v0 + 440);
  uint64_t v40 = *(void *)(v0 + 416);
  uint64_t v39 = *(void *)(v0 + 424);
  swift_bridgeObjectRetain();
  ConfigManager.init(recipe:)();
  IsTaskCancelledExecutionManager.init()();
  v41 = *(void (**)(uint64_t, void, uint64_t))(v38 + 104);
  v41(v37, enum case for SubtaskName.computeDurableFeatures(_:), v39);
  *(void *)(v0 + 40) = v36;
  *(void *)(v0 + 48) = &protocol witness table for IsTaskCancelledExecutionManager;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v203);
  v43 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v34 + 16);
  uint64_t v44 = v43(boxed_opaque_existential_1, v35, v36);
  default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v44);
  PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v37, (long long *)v203, v40, v194);
  uint64_t v45 = swift_task_alloc();
  *(void *)(v45 + 16) = v33;
  *(void *)(v45 + 24) = v35;
  PluginSubtask.performSubtask(_:)((void (*)(uint64_t))partial apply for closure #1 in ShareSheetBackgroundWorker.doWork(context:), v45);
  swift_task_dealloc();
  if (v196)
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for lightHouseBackgroundPluginDefaults != -1) {
      swift_once();
    }
    v46 = (void *)static ShareSheetBackgroundWorker.lightHouseBackgroundPluginDefaults;
    if (static ShareSheetBackgroundWorker.lightHouseBackgroundPluginDefaults)
    {
      NSString v47 = String._bridgeToObjectiveC()();
      [v46 setBool:1 forKey:v47];
    }
    uint64_t v48 = *(void *)(v0 + 536);
    uint64_t v49 = *(void *)(v0 + 528);
    uint64_t v50 = *(void *)(v0 + 520);
    uint64_t v52 = *(void *)(v0 + 504);
    uint64_t v51 = *(void *)(v0 + 512);
    uint64_t v54 = *(void *)(v0 + 488);
    uint64_t v53 = *(void *)(v0 + 496);
    id v55 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    uint64_t v56 = MLHostResult.init(status:policy:)();
    goto LABEL_35;
  }
  if (static Task<>.isCancelled.getter())
  {
    id v57 = *v199;
    swift_bridgeObjectRelease();
    id v58 = v57;
    v59 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.info.getter();
    BOOL v61 = os_log_type_enabled(v59, v60);
    id v62 = *v199;
    if (v61)
    {
      uint64_t v63 = swift_slowAlloc();
      v207[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v63 = 136315394;
      uint64_t v64 = MLHostExtensionContext.taskId.getter();
      *(void *)(v0 + 352) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v65, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v63 + 12) = 2080;
      uint64_t v66 = MLHostExtensionContext.taskName.getter();
      *(void *)(v0 + 360) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v67, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v59, v60, "TaskId: %s, TaskName: %s: plugin stopped after durable feature generation", (uint8_t *)v63, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v48 = *(void *)(v0 + 536);
    uint64_t v49 = *(void *)(v0 + 528);
    uint64_t v50 = *(void *)(v0 + 520);
    uint64_t v52 = *(void *)(v0 + 504);
    uint64_t v51 = *(void *)(v0 + 512);
    uint64_t v54 = *(void *)(v0 + 488);
    uint64_t v53 = *(void *)(v0 + 496);
    v208 = &type metadata for BackgroundWorkerError;
    unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
    LOBYTE(v207[0]) = 1;
    id v87 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    uint64_t v56 = MLHostResult.init(error:policy:)();
LABEL_35:
    uint64_t v202 = v56;
    outlined destroy of PluginSubtask(v54);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    goto LABEL_36;
  }
  *(void *)(v0 + 256) = 0;
  *(unsigned char *)(v0 + 264) = 1;
  uint64_t v204 = v0 + 256;
  if (ConfigManager.shouldHarvestData.getter())
  {
    uint64_t v197 = *(void *)(v0 + 536);
    uint64_t v69 = *(void *)(v0 + 512);
    uint64_t v70 = *(void *)(v0 + 496);
    uint64_t v71 = *(void *)(v0 + 480);
    uint64_t v72 = *(void *)(v0 + 440);
    uint64_t v73 = *(void *)(v0 + 416);
    v41(v72, enum case for SubtaskName.harvestData(_:), *(void *)(v0 + 424));
    *(void *)(v0 + 240) = v70;
    *(void *)(v0 + 248) = &protocol witness table for IsTaskCancelledExecutionManager;
    v74 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 216));
    uint64_t v75 = v43(v74, v69, v70);
    default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v75);
    PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v72, (long long *)(v0 + 216), v73, v71);
    v76 = (void *)swift_task_alloc();
    v76[2] = v197;
    v76[3] = v69;
    v76[4] = v195;
    v76[5] = v204;
    PluginSubtask.performSubtask(_:)((void (*)(uint64_t))partial apply for closure #2 in ShareSheetBackgroundWorker.doWork(context:), (uint64_t)v76);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    if (static Task<>.isCancelled.getter())
    {
      id v77 = *v199;
      v78 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.info.getter();
      BOOL v80 = os_log_type_enabled(v78, v79);
      id v81 = *v199;
      if (v80)
      {
        uint64_t v82 = swift_slowAlloc();
        v207[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v82 = 136315394;
        uint64_t v83 = MLHostExtensionContext.taskId.getter();
        *(void *)(v0 + 336) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v83, v84, v207);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v82 + 12) = 2080;
        uint64_t v85 = MLHostExtensionContext.taskName.getter();
        *(void *)(v0 + 344) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v85, v86, v207);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v78, v79, "TaskId: %s, TaskName: %s: plugin stopped after data harvesting", (uint8_t *)v82, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v126 = *(void *)(v0 + 536);
      uint64_t v127 = *(void *)(v0 + 528);
      uint64_t v128 = *(void *)(v0 + 520);
      uint64_t v130 = *(void *)(v0 + 504);
      uint64_t v129 = *(void *)(v0 + 512);
      uint64_t v132 = *(void *)(v0 + 488);
      uint64_t v131 = *(void *)(v0 + 496);
      uint64_t v133 = *(void *)(v0 + 480);
      v208 = &type metadata for BackgroundWorkerError;
      unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
      char v134 = 2;
LABEL_52:
      LOBYTE(v207[0]) = v134;
      id v135 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
      uint64_t v202 = MLHostResult.init(error:policy:)();
      outlined destroy of PluginSubtask(v133);
      outlined destroy of PluginSubtask(v132);
      (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v129, v131);
      (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v126, v128);
      goto LABEL_36;
    }
    v198 = v41;
    outlined destroy of PluginSubtask(*(void *)(v0 + 480));
  }
  else
  {
    v198 = v41;
    swift_bridgeObjectRelease();
  }
  uint64_t v90 = *(void *)(v0 + 536);
  uint64_t v91 = *(void *)(v0 + 512);
  uint64_t v92 = *(void *)(v0 + 496);
  uint64_t v93 = *(void *)(v0 + 472);
  uint64_t v94 = *(void *)(v0 + 440);
  uint64_t v95 = *(void *)(v0 + 416);
  v198(v94, enum case for SubtaskName.pruneVirtualFeatureStore(_:), *(void *)(v0 + 424));
  *(void *)(v0 + 120) = v92;
  *(void *)(v0 + 128) = &protocol witness table for IsTaskCancelledExecutionManager;
  v96 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  uint64_t v97 = v43(v96, v91, v92);
  default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v97);
  PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v94, (long long *)(v0 + 96), v95, v93);
  v98 = (void *)swift_task_alloc();
  v98[2] = v90;
  v98[3] = v91;
  v98[4] = v204;
  PluginSubtask.performSubtask(_:)((void (*)(uint64_t))partial apply for closure #3 in ShareSheetBackgroundWorker.doWork(context:), (uint64_t)v98);
  swift_task_dealloc();
  if (static Task<>.isCancelled.getter())
  {
    id v99 = *v199;
    v100 = Logger.logObject.getter();
    os_log_type_t v101 = static os_log_type_t.info.getter();
    BOOL v102 = os_log_type_enabled(v100, v101);
    id v103 = *v199;
    if (v102)
    {
      uint64_t v104 = swift_slowAlloc();
      v207[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v104 = 136315394;
      uint64_t v105 = MLHostExtensionContext.taskId.getter();
      *(void *)(v0 + 312) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v105, v106, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v104 + 12) = 2080;
      uint64_t v107 = MLHostExtensionContext.taskName.getter();
      *(void *)(v0 + 320) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v107, v108, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v100, v101, "TaskId: %s, TaskName: %s: plugin stopped after virtual feature store pruning", (uint8_t *)v104, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v126 = *(void *)(v0 + 536);
    uint64_t v127 = *(void *)(v0 + 528);
    uint64_t v128 = *(void *)(v0 + 520);
    uint64_t v130 = *(void *)(v0 + 504);
    uint64_t v129 = *(void *)(v0 + 512);
    uint64_t v132 = *(void *)(v0 + 488);
    uint64_t v131 = *(void *)(v0 + 496);
    uint64_t v133 = *(void *)(v0 + 472);
    v208 = &type metadata for BackgroundWorkerError;
    unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
    char v134 = 3;
    goto LABEL_52;
  }
  if ((ConfigManager.shouldSendMetrics.getter() & 1) == 0) {
    goto LABEL_54;
  }
  uint64_t v109 = *(void *)(v0 + 512);
  uint64_t v110 = *(void *)(v0 + 496);
  uint64_t v111 = *(void *)(v0 + 464);
  uint64_t v112 = *(void *)(v0 + 440);
  uint64_t v113 = *(void *)(v0 + 416);
  v198(v112, enum case for SubtaskName.sendMetrics(_:), *(void *)(v0 + 424));
  *(void *)(v0 + 80) = v110;
  *(void *)(v0 + 88) = &protocol witness table for IsTaskCancelledExecutionManager;
  v114 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
  uint64_t v115 = v43(v114, v109, v110);
  default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v115);
  PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v112, (long long *)(v0 + 56), v113, v111);
  PluginSubtask.performSubtask(_:)((void (*)(uint64_t))closure #4 in ShareSheetBackgroundWorker.doWork(context:), 0);
  if ((static Task<>.isCancelled.getter() & 1) == 0)
  {
    outlined destroy of PluginSubtask(*(void *)(v0 + 464));
LABEL_54:
    uint64_t v136 = *(void *)(v0 + 536);
    uint64_t v137 = *(void *)(v0 + 512);
    uint64_t v138 = *(void *)(v0 + 496);
    uint64_t v139 = *(void *)(v0 + 456);
    uint64_t v140 = *(void *)(v0 + 440);
    uint64_t v141 = *(void *)(v0 + 416);
    v198(v140, enum case for SubtaskName.attemptLocalTraining(_:), *(void *)(v0 + 424));
    *(void *)(v0 + 160) = v138;
    *(void *)(v0 + 168) = &protocol witness table for IsTaskCancelledExecutionManager;
    v142 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    uint64_t v143 = v43(v142, v137, v138);
    default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v143);
    PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v140, (long long *)(v0 + 136), v141, v139);
    uint64_t v144 = swift_task_alloc();
    *(void *)(v144 + 16) = v136;
    *(void *)(v144 + 24) = v137;
    PluginSubtask.performSubtask(_:)((void (*)(uint64_t))partial apply for closure #5 in ShareSheetBackgroundWorker.doWork(context:), v144);
    swift_task_dealloc();
    if ((static Task<>.isCancelled.getter() & 1) == 0)
    {
      uint64_t v155 = *(void *)(v0 + 536);
      uint64_t v156 = *(void *)(v0 + 512);
      uint64_t v157 = *(void *)(v0 + 496);
      uint64_t v159 = *(void *)(v0 + 440);
      uint64_t v158 = *(void *)(v0 + 448);
      uint64_t v160 = *(void *)(v0 + 416);
      v200 = *(void **)(v0 + 408);
      v198(v159, enum case for SubtaskName.attemptShadowEvaluation(_:), *(void *)(v0 + 424));
      *(void *)(v0 + 200) = v157;
      *(void *)(v0 + 208) = &protocol witness table for IsTaskCancelledExecutionManager;
      v161 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 176));
      uint64_t v162 = v43(v161, v156, v157);
      default argument 2 of PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v162);
      PluginSubtask.init(subtaskName:executionManager:subtaskResult:)(v159, (long long *)(v0 + 176), v160, v158);
      uint64_t v163 = swift_task_alloc();
      *(void *)(v163 + 16) = v155;
      *(void *)(v163 + 24) = v156;
      v164 = (void *)v0;
      PluginSubtask.performSubtask(_:)((void (*)(uint64_t))partial apply for closure #6 in ShareSheetBackgroundWorker.doWork(context:), v163);
      swift_task_dealloc();
      id v165 = v200;
      v166 = Logger.logObject.getter();
      os_log_type_t v167 = static os_log_type_t.info.getter();
      BOOL v168 = os_log_type_enabled(v166, v167);
      v169 = *(void **)(v0 + 408);
      if (v168)
      {
        uint64_t v170 = swift_slowAlloc();
        v207[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v170 = 136315394;
        uint64_t v171 = MLHostExtensionContext.taskId.getter();
        *(void *)(v0 + 328) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v171, v172, v207);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v170 + 12) = 2080;
        uint64_t v173 = MLHostExtensionContext.taskName.getter();
        *(void *)(v0 + 288) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v173, v174, v207);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v166, v167, "TaskId: %s, TaskName: %s: task completed", (uint8_t *)v170, 0x16u);
        swift_arrayDestroy();
        v164 = (void *)v0;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t v206 = v164[67];
      uint64_t v184 = v164[66];
      uint64_t v201 = v164[65];
      uint64_t v185 = v164[63];
      uint64_t v186 = v164[64];
      uint64_t v188 = v164[61];
      uint64_t v187 = v164[62];
      uint64_t v189 = v164[59];
      uint64_t v190 = v164[57];
      uint64_t v191 = *(void *)(v0 + 448);
      id v192 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
      uint64_t v202 = MLHostResult.init(status:policy:)();
      outlined destroy of PluginSubtask(v191);
      outlined destroy of PluginSubtask(v190);
      outlined destroy of PluginSubtask(v189);
      outlined destroy of PluginSubtask(v188);
      (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v186, v187);
      (*(void (**)(uint64_t, uint64_t))(v184 + 8))(v206, v201);
      goto LABEL_36;
    }
    id v145 = *v199;
    v146 = Logger.logObject.getter();
    os_log_type_t v147 = static os_log_type_t.info.getter();
    BOOL v148 = os_log_type_enabled(v146, v147);
    id v149 = *v199;
    if (v148)
    {
      uint64_t v150 = swift_slowAlloc();
      v207[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v150 = 136315394;
      uint64_t v151 = MLHostExtensionContext.taskId.getter();
      *(void *)(v0 + 272) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v151, v152, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v150 + 12) = 2080;
      uint64_t v153 = MLHostExtensionContext.taskName.getter();
      *(void *)(v0 + 280) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v153, v154, v207);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v146, v147, "TaskId: %s, TaskName: %s: plugin stopped after local training", (uint8_t *)v150, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v205 = *(void *)(v0 + 536);
    uint64_t v175 = *(void *)(v0 + 528);
    uint64_t v176 = *(void *)(v0 + 520);
    uint64_t v178 = *(void *)(v0 + 504);
    uint64_t v177 = *(void *)(v0 + 512);
    uint64_t v180 = *(void *)(v0 + 488);
    uint64_t v179 = *(void *)(v0 + 496);
    uint64_t v181 = *(void *)(v0 + 472);
    uint64_t v182 = *(void *)(v0 + 456);
    v208 = &type metadata for BackgroundWorkerError;
    unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
    char v183 = 5;
    goto LABEL_65;
  }
  id v116 = *v199;
  v117 = Logger.logObject.getter();
  os_log_type_t v118 = static os_log_type_t.info.getter();
  BOOL v119 = os_log_type_enabled(v117, v118);
  id v120 = *v199;
  if (v119)
  {
    uint64_t v121 = swift_slowAlloc();
    v207[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v121 = 136315394;
    uint64_t v122 = MLHostExtensionContext.taskId.getter();
    *(void *)(v0 + 296) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v122, v123, v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v121 + 12) = 2080;
    uint64_t v124 = MLHostExtensionContext.taskName.getter();
    *(void *)(v0 + 304) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v124, v125, v207);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v117, v118, "TaskId: %s, TaskName: %s: plugin stopped after metrics reporting", (uint8_t *)v121, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v205 = *(void *)(v0 + 536);
  uint64_t v175 = *(void *)(v0 + 528);
  uint64_t v176 = *(void *)(v0 + 520);
  uint64_t v178 = *(void *)(v0 + 504);
  uint64_t v177 = *(void *)(v0 + 512);
  uint64_t v180 = *(void *)(v0 + 488);
  uint64_t v179 = *(void *)(v0 + 496);
  uint64_t v182 = *(void *)(v0 + 464);
  uint64_t v181 = *(void *)(v0 + 472);
  v208 = &type metadata for BackgroundWorkerError;
  unint64_t v209 = lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError();
  char v183 = 4;
LABEL_65:
  LOBYTE(v207[0]) = v183;
  id v193 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
  uint64_t v202 = MLHostResult.init(error:policy:)();
  outlined destroy of PluginSubtask(v182);
  outlined destroy of PluginSubtask(v181);
  outlined destroy of PluginSubtask(v180);
  (*(void (**)(uint64_t, uint64_t))(v178 + 8))(v177, v179);
  (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v205, v176);
LABEL_36:
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
  v88 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v88(v202);
}

uint64_t ShareSheetBackgroundWorker.recipeURL.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin();
  BOOL v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logging.defaultLogger);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Looking for default plugin recipe file", v11, 2u);
    swift_slowDealloc();
  }

  id v12 = [self mainBundle];
  if (one-time initialization token for recipeKey != -1) {
    swift_once();
  }
  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v12 URLForResource:v13 withExtension:v14];

  if (v15)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    os_log_type_t v16 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v16(v7, v5, v2);
    BOOL v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v17(v7, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) != 1)
    {
      v16(a1, v7, v2);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v17)(a1, 0, 1, v2);
    }
  }
  else
  {
    BOOL v17 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v17(v7, 1, 1, v2);
  }
  outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for URL?);
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Default plugin recipe file not found", v21, 2u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v17)(a1, 1, 1, v2);
}

uint64_t closure #1 in ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfigManager();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DurableFeatureManager();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
  v16[3] = IsTaskCancelledExecutionManager;
  v16[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(IsTaskCancelledExecutionManager - 8) + 16))(boxed_opaque_existential_1, a2, IsTaskCancelledExecutionManager);
  DurableFeatureManager.init(config:executionManager:)();
  DurableFeatureManager.computeFeaturesAndSendToBiome()();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t closure #2 in ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v40 = a4;
  uint64_t v37 = a3;
  uint64_t v38 = a2;
  uint64_t v36 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FeaturizationConfig?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TrialIdentifier?);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for FeaturizationConfig();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  NSString v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ConfigManager();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for DataHarvestingManager();
  uint64_t v18 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  os_log_type_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v36, v14);
  uint64_t v21 = v37;
  uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
  v42[3] = IsTaskCancelledExecutionManager;
  v42[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v42);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(IsTaskCancelledExecutionManager - 8) + 16))(boxed_opaque_existential_1, v38, IsTaskCancelledExecutionManager);
  String.init<A>(describing:)();
  DataHarvestingManager.init(config:executionManager:readerName:)();
  if (!v21) {
    goto LABEL_7;
  }
  if (one-time initialization token for recipeVersionKey == -1)
  {
    if (!*(void *)(v21 + 16)) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v21 + 16)) {
      goto LABEL_7;
    }
  }
  uint64_t v24 = qword_1000149C0;
  uint64_t v25 = static ShareSheetBackgroundWorker.recipeVersionKey;
  swift_bridgeObjectRetain();
  unint64_t v26 = specialized __RawDictionaryStorage.find<A>(_:)(v25, v24);
  if (v27)
  {
    uint64_t v28 = *(void *)(*(void *)(v21 + 56) + 8 * v26);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    v42[0] = 0;
    v42[1] = 0xE000000000000000;
    uint64_t v41 = v28;
    _print_unlocked<A, B>(_:_:)();
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
LABEL_7:
  if (one-time initialization token for unknownVersion != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
LABEL_10:
  FeaturizationConfig.init(identifier:)();
  ShareSheetBackgroundWorker.readTrialIdentifiers()((uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v6, v13, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)();
  uint64_t v30 = v29;
  char v32 = v31;
  outlined destroy of URL?((uint64_t)v6, &demangling cache variable for type metadata for FeaturizationConfig?);
  outlined destroy of URL?((uint64_t)v9, &demangling cache variable for type metadata for TrialIdentifier?);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v39);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v34 = v40;
  *uint64_t v40 = v30;
  *((unsigned char *)v34 + 8) = v32 & 1;
  return result;
}

uint64_t closure #3 in ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = type metadata accessor for ConfigManager();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DataHarvestingManager();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  NSString v13 = (char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
  v19[3] = IsTaskCancelledExecutionManager;
  v19[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(IsTaskCancelledExecutionManager - 8) + 16))(boxed_opaque_existential_1, a2, IsTaskCancelledExecutionManager);
  String.init<A>(describing:)();
  DataHarvestingManager.init(config:executionManager:readerName:)();
  uint64_t v16 = *a3;
  DataHarvestingManager.pruneVirtualFeatureStore(from:)(*(Swift::Double_optional *)(&v16 - 1));
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t closure #4 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return static PeopleSuggesterMetricsCollector.sendMetrics()();
}

uint64_t closure #5 in ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfigManager();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LocalTrainingManager();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = ConfigManager.shouldAttemptLocalTraining.getter();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
    v16[3] = IsTaskCancelledExecutionManager;
    v16[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(IsTaskCancelledExecutionManager - 8) + 16))(boxed_opaque_existential_1, a2, IsTaskCancelledExecutionManager);
    LocalTrainingManager.init(config:executionManager:)();
    LocalTrainingManager.attemptLocalTrain()();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t closure #6 in ShareSheetBackgroundWorker.doWork(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TrialIdentifier?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ConfigManager();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ShadowEvaluationManager();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = ConfigManager.shouldAttemptShadowEvaluation.getter();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
    uint64_t IsTaskCancelledExecutionManager = type metadata accessor for IsTaskCancelledExecutionManager();
    v28[3] = IsTaskCancelledExecutionManager;
    v28[4] = (uint64_t)&protocol witness table for IsTaskCancelledExecutionManager;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(IsTaskCancelledExecutionManager - 8) + 16))(boxed_opaque_existential_1, a2, IsTaskCancelledExecutionManager);
    ShareSheetBackgroundWorker.readTrialIdentifiers()((uint64_t)v6);
    ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)();
    if (!(unint64_t)ShadowEvaluationManager.attemptShadowEvaluation()()) {
      specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
    }
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Logging.defaultLogger);
    swift_bridgeObjectRetain();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      v28[0] = swift_slowAlloc();
      uint64_t v26 = v11;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v25 = v21 + 4;
      swift_bridgeObjectRetain();
      uint64_t v22 = Dictionary.description.getter();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      uint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v24, v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Shadow evaluation results:\n%s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v26);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
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
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
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

uint64_t protocol witness for MLHostExtension.shouldRun(context:) in conformance ShareSheetBackgroundWorker(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&async function pointer to specialized ShareSheetBackgroundWorker.shouldRun(context:)
                                       + async function pointer to specialized ShareSheetBackgroundWorker.shouldRun(context:));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for MLHostExtension.shouldRun(context:) in conformance ShareSheetBackgroundWorker;
  return v5(a1);
}

uint64_t protocol witness for MLHostExtension.doWork(context:) in conformance ShareSheetBackgroundWorker(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for MLHostExtension.doWork(context:) in conformance ShareSheetBackgroundWorker;
  return ShareSheetBackgroundWorker.doWork(context:)(a1);
}

{
  uint64_t *v1;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t protocol witness for MLHostExtension.loadConfig<A>(context:) in conformance ShareSheetBackgroundWorker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = protocol witness for MLHostExtension.loadConfig<A>(context:) in conformance ShareSheetBackgroundWorker;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t protocol witness for MLHostExtension.loadConfig<A>(context:) in conformance ShareSheetBackgroundWorker()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t protocol witness for AppExtension.configuration.getter in conformance ShareSheetBackgroundWorker(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker();

  return MLHostExtension.configuration.getter(a1, v2);
}

void one-time initialization function for recipeKey()
{
  static ShareSheetBackgroundWorker.recipeKey = 0x657069636572;
  unk_100014A00 = 0xE600000000000000;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RecipeError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance RecipeError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance RecipeError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RecipeError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
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
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized BackgroundWorkerError.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of BackgroundWorkerError.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
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

id specialized ShareSheetBackgroundWorker.readTrialRecipe()()
{
  uint64_t v0 = (void *)type metadata accessor for URL.DirectoryHint();
  uint64_t v46 = *(v0 - 1);
  __chkstk_darwin();
  uint64_t v44 = (char *)&v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin();
  v42 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for URL();
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin();
  v43 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self clientWithIdentifier:210];
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v4 experimentIdentifiersWithNamespaceName:v5];

  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)static Logging.defaultLogger);
  id v9 = v6;
  uint64_t v48 = v8;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v40 = v0;
    id v41 = v4;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    if (v9)
    {
      v50[0] = v9;
      id v14 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      v50[0] = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v6 = 0;
    }
    *uint64_t v13 = v6;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "TrialRecipe: Trial identifiers: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v0 = v40;
    id v4 = v41;
  }
  else
  {
  }
  if (one-time initialization token for recipeKey != -1) {
    swift_once();
  }
  NSString v15 = String._bridgeToObjectiveC()();
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v4 levelForFactor:v15 withNamespaceName:v16];

  if (!v17)
  {

    goto LABEL_26;
  }
  id result = [v17 fileValue];
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v19 = result;
  id v20 = [result path];

  if (!v20)
  {
    uint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      v50[0] = (id)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001FLL, 0x800000010000EE20, (uint64_t *)v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "TrialRecipe: Config recipe path not found in %s namespace", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }

LABEL_26:
    return 0;
  }
  uint64_t v40 = v9;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v21 = v45;
  uint64_t v22 = v47;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v42, 1, 1, v47);
  (*(void (**)(char *, void, void *))(v46 + 104))(v44, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  unint64_t v23 = v43;
  URL.init(filePath:directoryHint:relativeTo:)();
  uint64_t v32 = Data.init(contentsOf:options:)();
  unint64_t v34 = v33;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v22);
  uint64_t v35 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v50[0] = 0;
  id v37 = [v35 JSONObjectWithData:isa options:0 error:v50];

  if (!v37)
  {
    id v39 = v50[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v32, v34);
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      id v41 = v4;
      *(_DWORD *)uint64_t v26 = 138412290;
      swift_errorRetain();
      uint64_t v28 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v50[0] = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v27 = v28;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "TrialRecipe: Failed to retrieve the recipe. Error: %@.", v26, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
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
    return 0;
  }
  id v38 = v50[0];
  _bridgeAnyObjectToAny(_:)();

  outlined consume of Data._Representation(v32, v34);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  if (swift_dynamicCast()) {
    return (id)v49;
  }
  else {
    return 0;
  }
}

uint64_t specialized ShareSheetBackgroundWorker.shouldRun(context:)(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(specialized ShareSheetBackgroundWorker.shouldRun(context:), 0, 0);
}

uint64_t specialized ShareSheetBackgroundWorker.shouldRun(context:)()
{
  uint64_t v40 = v0;
  uint64_t v1 = (void **)(v0 + 24);
  if (MLHostExtensionContext.taskName.getter() == 0xD000000000000041 && v2 == 0x800000010000ECE0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v3 & 1) == 0)
    {
LABEL_28:
      objc_allocWithZone((Class)type metadata accessor for MLHostResult());
      goto LABEL_29;
    }
  }
  if (one-time initialization token for lightHouseBackgroundPluginDefaults != -1) {
    swift_once();
  }
  if (static ShareSheetBackgroundWorker.lightHouseBackgroundPluginDefaults)
  {
    id v4 = (id)static ShareSheetBackgroundWorker.lightHouseBackgroundPluginDefaults;
    NSString v5 = String._bridgeToObjectiveC()();
    unsigned int v6 = [v4 BOOLForKey:v5];

    if (v6)
    {
      objc_allocWithZone((Class)type metadata accessor for MLHostResult());
LABEL_29:
      uint64_t v36 = MLHostResult.init(status:policy:)();
      goto LABEL_30;
    }
  }
  uint64_t v7 = (uint64_t *)(v0 + 16);
  if (one-time initialization token for purpleBuddyDefaults != -1) {
    swift_once();
  }
  if (static ShareSheetBackgroundWorker.purpleBuddyDefaults)
  {
    uint64_t v8 = one-time initialization token for purpleBuddySetupKey;
    id v9 = (id)static ShareSheetBackgroundWorker.purpleBuddyDefaults;
    if (v8 != -1) {
      swift_once();
    }
    NSString v10 = String._bridgeToObjectiveC()();
    unsigned int v11 = [v9 BOOLForKey:v10];

    if (v11)
    {
      if (one-time initialization token for defaultLogger != -1) {
        swift_once();
      }
      uint64_t v12 = *v1;
      uint64_t v13 = type metadata accessor for Logger();
      __swift_project_value_buffer(v13, (uint64_t)static Logging.defaultLogger);
      id v14 = v12;
      NSString v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.info.getter();
      BOOL v17 = os_log_type_enabled(v15, v16);
      uint64_t v18 = *v1;
      if (v17)
      {
        uint64_t v19 = swift_slowAlloc();
        v39[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315394;
        uint64_t v20 = MLHostExtensionContext.taskId.getter();
        *uint64_t v7 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v19 + 12) = 2080;
        uint64_t v22 = MLHostExtensionContext.taskName.getter();
        *uint64_t v7 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Migration task: TaskId: %s, TaskName: %s PurpleBuddy is complete", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      goto LABEL_28;
    }
  }
  if (one-time initialization token for defaultLogger != -1) {
    swift_once();
  }
  unint64_t v24 = *v1;
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)static Logging.defaultLogger);
  id v26 = v24;
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  os_log_type_t v30 = *v1;
  if (v29)
  {
    uint64_t v31 = swift_slowAlloc();
    v39[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315394;
    uint64_t v32 = MLHostExtensionContext.taskId.getter();
    *uint64_t v7 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v34 = MLHostExtensionContext.taskName.getter();
    *uint64_t v7 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v34, v35, v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Rescheduling TaskId: %s, TaskName: %s since PurpleBuddy is not complete", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v39[3] = (uint64_t)&type metadata for MigrationWorkerError;
  v39[4] = lazy protocol witness table accessor for type MigrationWorkerError and conformance MigrationWorkerError();
  objc_allocWithZone((Class)type metadata accessor for MLHostResult());
  uint64_t v36 = MLHostResult.init(error:policy:)();
LABEL_30:
  id v37 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v37(v36);
}

void *specialized ShareSheetBackgroundWorker.readPluginRecipe(at:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))__chkstk_darwin)();
  NSString v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  NSString v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)v35 - v11;
  outlined init with copy of URL?((uint64_t)a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of URL?((uint64_t)v5, &demangling cache variable for type metadata for URL?);
    lazy protocol witness table accessor for type RecipeError and conformance RecipeError();
    swift_allocError();
    *uint64_t v13 = 0;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    if (one-time initialization token for defaultLogger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logging.defaultLogger);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    NSString v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v36 = v1;
      uint64_t v18 = (uint8_t *)v17;
      a1 = (void *)swift_slowAlloc();
      v39[0] = a1;
      id v37 = (void (*)(char *, uint64_t))v7;
      *(_DWORD *)uint64_t v18 = 136315138;
      v35[1] = v18 + 4;
      lazy protocol witness table accessor for type URL and conformance URL();
      uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, (uint64_t *)v39);
      unint64_t v21 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v22 = (void (*)(char *, uint64_t))*((void *)v21 + 1);
      v22(v10, v6);
      os_log_type_t v23 = v16;
      unint64_t v24 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, v23, "Attempting to read plugin recipe: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v36;
      swift_slowDealloc();
    }
    else
    {
      unint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
      v24(v10, v6);
    }

    uint64_t v25 = Data.init(contentsOf:options:)();
    if (!v2)
    {
      uint64_t v27 = v25;
      a1 = v26;
      id v37 = v24;
      os_log_type_t v28 = self;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      v39[0] = 0;
      id v30 = [v28 JSONObjectWithData:isa options:0 error:v39];

      if (v30)
      {
        id v31 = v39[0];
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
        if (swift_dynamicCast())
        {
          outlined consume of Data._Representation(v27, (unint64_t)a1);
          a1 = (void *)v38;
          v37(v12, v6);
          return a1;
        }
        lazy protocol witness table accessor for type RecipeError and conformance RecipeError();
        swift_allocError();
        *unint64_t v33 = 1;
      }
      else
      {
        id v32 = v39[0];
        _convertNSErrorToError(_:)();
      }
      swift_willThrow();
      outlined consume of Data._Representation(v27, (unint64_t)a1);
      v37(v12, v6);
      return a1;
    }
    v24(v12, v6);
  }
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t partial apply for closure #1 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return closure #1 in ShareSheetBackgroundWorker.doWork(context:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t partial apply for closure #3 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return closure #3 in ShareSheetBackgroundWorker.doWork(context:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t partial apply for closure #5 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return closure #5 in ShareSheetBackgroundWorker.doWork(context:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t partial apply for closure #6 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return closure #6 in ShareSheetBackgroundWorker.doWork(context:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t outlined destroy of PluginSubtask(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PluginSubtask();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type BackgroundWorkerError and conformance BackgroundWorkerError()
{
  unint64_t result = lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError;
  if (!lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError;
  if (!lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError;
  if (!lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError;
  if (!lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BackgroundWorkerError and conformance BackgroundWorkerError);
  }
  return result;
}

uint64_t partial apply for closure #2 in ShareSheetBackgroundWorker.doWork(context:)()
{
  return closure #2 in ShareSheetBackgroundWorker.doWork(context:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

unint64_t lazy protocol witness table accessor for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker()
{
  unint64_t result = lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker;
  if (!lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker;
  if (!lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ShareSheetBackgroundWorker and conformance ShareSheetBackgroundWorker);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MigrationWorkerError and conformance MigrationWorkerError()
{
  unint64_t result = lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError;
  if (!lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError;
  if (!lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError;
  if (!lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError;
  if (!lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MigrationWorkerError and conformance MigrationWorkerError);
  }
  return result;
}

uint64_t associated type witness table accessor for AppExtension.Configuration : AppExtensionConfiguration in ShareSheetBackgroundWorker()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BackgroundWorkerError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BackgroundWorkerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B7A4);
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

uint64_t getEnumTag for BackgroundWorkerError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for BackgroundWorkerError(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundWorkerError()
{
  return &type metadata for BackgroundWorkerError;
}

uint64_t getEnumTagSinglePayload for MigrationWorkerError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MigrationWorkerError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10000B8DCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for MigrationWorkerError()
{
  return 0;
}

ValueMetadata *type metadata accessor for MigrationWorkerError()
{
  return &type metadata for MigrationWorkerError;
}

ValueMetadata *type metadata accessor for ShareSheetBackgroundWorker()
{
  return &type metadata for ShareSheetBackgroundWorker;
}

uint64_t outlined destroy of URL?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type RecipeError and conformance RecipeError()
{
  unint64_t result = lazy protocol witness table cache variable for type RecipeError and conformance RecipeError;
  if (!lazy protocol witness table cache variable for type RecipeError and conformance RecipeError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RecipeError and conformance RecipeError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type RecipeError and conformance RecipeError;
  if (!lazy protocol witness table cache variable for type RecipeError and conformance RecipeError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RecipeError and conformance RecipeError);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
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

uint64_t getEnumTagSinglePayload for RecipeError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecipeError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000BDB8);
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

unsigned char *destructiveInjectEnumTag for RecipeError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for RecipeError()
{
  return &unk_100010A48;
}

uint64_t type metadata accessor for PluginSubtask()
{
  uint64_t result = type metadata singleton initialization cache for PluginSubtask;
  if (!type metadata singleton initialization cache for PluginSubtask) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PluginSubtask.performSubtask(_:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v115 = a2;
  id v116 = a1;
  uint64_t v2 = type metadata accessor for ComputationState();
  uint64_t v124 = *(void *)(v2 - 8);
  uint64_t v125 = v2;
  __chkstk_darwin(v2);
  uint64_t v113 = (char *)v108 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v114 = (char *)v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  NSString v10 = (char *)v108 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v110 = (char *)v108 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  BOOL v119 = (char *)v108 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v122 = (char *)v108 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (void (*)(char *, uint64_t))((char *)v108 - v17);
  uint64_t v19 = type metadata accessor for SubtaskName();
  unint64_t v20 = *(char **)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  v117 = (char *)v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v111 = (char *)v108 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v109 = (char *)v108 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  os_log_type_t v118 = (char *)v108 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  id v120 = (char *)v108 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v121 = (char *)v108 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  unint64_t v35 = (char *)v108 - v34;
  __chkstk_darwin(v33);
  id v37 = (char *)v108 - v36;
  uint64_t v38 = (void (*)(char *, uint64_t, uint64_t))*((void *)v20 + 2);
  v38((char *)v108 - v36, v136, v19);
  uint64_t v39 = Logging.defaultLogger.unsafeMutableAddressor();
  uint64_t v134 = v5;
  uint64_t v40 = v5;
  uint64_t v41 = v4;
  v42 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  uint64_t v128 = v39;
  uint64_t v129 = v42;
  uint64_t v130 = v40 + 16;
  ((void (*)(void (*)(char *, uint64_t)))v42)(v18);
  uint64_t v131 = v20 + 16;
  uint64_t v132 = v37;
  id v135 = (void (*)(char *, char *, uint64_t))v38;
  v38(v35, (uint64_t)v37, v19);
  uint64_t v127 = v18;
  v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.debug.getter();
  BOOL v45 = os_log_type_enabled(v43, v44);
  uint64_t v133 = v20;
  uint64_t v112 = v10;
  uint64_t v123 = v4;
  if (v45)
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v138 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315138;
    lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName();
    uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v137 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, &v138);
    uint64_t v41 = v123;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v49 = (void (*)(char *, uint64_t))*((void *)v20 + 1);
    v49(v35, v19);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Attempting to run subtask %s", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v49 = (void (*)(char *, uint64_t))*((void *)v20 + 1);
    v49(v35, v19);
  }

  uint64_t v126 = *(void (**)(char *, uint64_t))(v134 + 8);
  v126((char *)v127, v41);
  uint64_t v50 = v19;
  uint64_t v51 = v132;
  uint64_t v52 = type metadata accessor for PluginSubtask();
  uint64_t v53 = (void *)(v136 + *(int *)(v52 + 20));
  __swift_project_boxed_opaque_existential_1(v53, v53[3]);
  char v54 = dispatch thunk of ExecutionManager.shouldStop.getter();
  id v55 = v121;
  v135(v121, v51, v50);
  uint64_t v127 = v49;
  if (v54)
  {
    v49(v55, v50);
LABEL_9:
    v74 = v122;
    v129(v122, v128, v41);
    uint64_t v75 = v120;
    v135(v120, v51, v50);
    v76 = Logger.logObject.getter();
    os_log_type_t v77 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v138 = swift_slowAlloc();
      *(_DWORD *)v78 = 136315138;
      lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName();
      uint64_t v79 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v137 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v80, &v138);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v81 = v127;
      v127(v75, v50);
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "Skipping subtask %s", v78, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v126(v122, v123);
      v81(v132, v50);
    }
    else
    {

      uint64_t v82 = v127;
      v127(v75, v50);
      v126(v74, v41);
      v82(v51, v50);
    }
    uint64_t v84 = v124;
    uint64_t v83 = v125;
    uint64_t v85 = v136 + *(int *)(v52 + 24);
    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v85, v125);
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v84 + 104))(v85, enum case for ComputationState.taskSkipped(_:), v83);
  }
  uint64_t v56 = (void *)userDefaults.getter();
  char v57 = NSUserDefaults.shouldCompute(_:)();

  v108[1] = v133 + 8;
  v49(v55, v50);
  if ((v57 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v58 = v136 + *(int *)(v52 + 24);
  uint64_t v59 = v124;
  os_log_type_t v60 = *(char **)(v124 + 8);
  uint64_t v61 = v125;
  uint64_t v121 = (char *)(v124 + 8);
  id v120 = v60;
  ((void (*)(uint64_t, uint64_t))v60)(v58, v125);
  id v62 = *(char **)(v59 + 104);
  uint64_t v122 = (char *)(v59 + 104);
  ((void (*)(uint64_t, void, uint64_t))v62)(v58, enum case for ComputationState.taskStarted(_:), v61);
  uint64_t v63 = v119;
  v129(v119, v128, v41);
  uint64_t v64 = v118;
  v135(v118, v51, v50);
  unint64_t v65 = Logger.logObject.getter();
  uint64_t v66 = v41;
  os_log_type_t v67 = static os_log_type_t.info.getter();
  BOOL v68 = os_log_type_enabled(v65, v67);
  uint64_t v136 = v58;
  uint64_t v133 = v62;
  if (v68)
  {
    uint64_t v69 = (uint8_t *)swift_slowAlloc();
    uint64_t v138 = swift_slowAlloc();
    *(_DWORD *)uint64_t v69 = 136315138;
    lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName();
    uint64_t v70 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v137 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, &v138);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v127(v64, v50);
    _os_log_impl((void *)&_mh_execute_header, v65, v67, "Running subtask %s", v69, 0xCu);
    swift_arrayDestroy();
    uint64_t v61 = v125;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v72 = v123;
    uint64_t v73 = ((uint64_t (*)(char *, uint64_t))v126)(v119, v123);
  }
  else
  {
    v127(v64, v50);

    uint64_t v73 = ((uint64_t (*)(char *, uint64_t))v126)(v63, v66);
    uint64_t v72 = v66;
  }
  id v87 = v132;
  v116(v73);
  uint64_t v88 = v136;
  ((void (*)(uint64_t, uint64_t))v120)(v136, v61);
  ((void (*)(uint64_t, void, uint64_t))v133)(v88, enum case for ComputationState.taskCompleted(_:), v61);
  __swift_project_boxed_opaque_existential_1(v53, v53[3]);
  if (dispatch thunk of ExecutionManager.shouldStop.getter())
  {
    v89 = v110;
    v129(v110, v128, v72);
    uint64_t v90 = v109;
    v135(v109, v87, v50);
    uint64_t v91 = Logger.logObject.getter();
    os_log_type_t v92 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = (uint8_t *)swift_slowAlloc();
      uint64_t v124 = swift_slowAlloc();
      uint64_t v138 = v124;
      *(_DWORD *)uint64_t v93 = 136315138;
      lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName();
      uint64_t v94 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v137 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v94, v95, &v138);
      uint64_t v72 = v123;
      id v87 = v132;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v127(v90, v50);
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "Plugin was asked to stop while running subtask %s", v93, 0xCu);
      swift_arrayDestroy();
      uint64_t v61 = v125;
      swift_slowDealloc();
      swift_slowDealloc();

      v96 = v110;
    }
    else
    {
      v127(v90, v50);

      v96 = v89;
    }
    v126(v96, v72);
    uint64_t v100 = v136;
    ((void (*)(uint64_t, uint64_t))v120)(v136, v61);
    ((void (*)(uint64_t, void, uint64_t))v133)(v100, enum case for ComputationState.taskStopped(_:), v61);
    v98 = v112;
    id v99 = v111;
  }
  else
  {
    uint64_t v97 = (void *)userDefaults.getter();
    NSUserDefaults.saveComputationDate(_:)();

    v98 = v112;
    id v99 = v111;
  }
  v129(v98, v128, v72);
  v135(v99, v87, v50);
  os_log_type_t v101 = Logger.logObject.getter();
  os_log_type_t v102 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v101, v102))
  {
    id v103 = (uint8_t *)swift_slowAlloc();
    uint64_t v136 = swift_slowAlloc();
    uint64_t v138 = v136;
    *(_DWORD *)id v103 = 136315138;
    lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName();
    uint64_t v104 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v137 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v104, v105, &v138);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v106 = (uint64_t (*)(char *, uint64_t))v127;
    v127(v99, v50);
    _os_log_impl((void *)&_mh_execute_header, v101, v102, "Finished running subtask %s", v103, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v126(v112, v123);
    return v106(v87, v50);
  }
  else
  {

    uint64_t v107 = (uint64_t (*)(char *, uint64_t))v127;
    v127(v99, v50);
    v126(v98, v72);
    return v107(v87, v50);
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t variable initialization expression of PluginSubtask.subtaskResult@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = enum case for ComputationState.taskNotExecuted(_:);
  uint64_t v3 = type metadata accessor for ComputationState();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t PluginSubtask.init(subtaskName:executionManager:subtaskResult:)@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t v9 = type metadata accessor for PluginSubtask();
  outlined init with take of ExecutionManager(a2, a4 + *(int *)(v9 + 20));
  uint64_t v10 = a4 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for ComputationState();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32);

  return v12(v10, a3, v11);
}

unint64_t lazy protocol witness table accessor for type SubtaskName and conformance SubtaskName()
{
  unint64_t result = lazy protocol witness table cache variable for type SubtaskName and conformance SubtaskName;
  if (!lazy protocol witness table cache variable for type SubtaskName and conformance SubtaskName)
  {
    type metadata accessor for SubtaskName();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SubtaskName and conformance SubtaskName);
  }
  return result;
}

uint64_t outlined init with take of ExecutionManager(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for PluginSubtask(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for SubtaskName();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for ComputationState();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t destroy for PluginSubtask(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  __swift_destroy_boxed_opaque_existential_0(a1 + *(int *)(a2 + 20));
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for ComputationState();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  return a1;
}

uint64_t assignWithCopy for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  long long v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_0(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for ComputationState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000DBBC);
}

uint64_t sub_10000DBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for SubtaskName();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComputationState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for PluginSubtask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DD00);
}

uint64_t sub_10000DD00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for SubtaskName();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for ComputationState();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata completion function for PluginSubtask()
{
  uint64_t result = type metadata accessor for SubtaskName();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ComputationState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static PeopleSuggesterMetricsCollector.sendMetrics()()
{
  return static PeopleSuggesterMetricsCollector.sendMetrics()();
}

uint64_t static AppExtension.main()()
{
  return static AppExtension.main()();
}

uint64_t MLHostResult.init(error:policy:)()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t MLHostResult.init(status:policy:)()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t type metadata accessor for MLHostResult()
{
  return type metadata accessor for MLHostResult();
}

uint64_t MLHostExtensionContext.taskId.getter()
{
  return MLHostExtensionContext.taskId.getter();
}

uint64_t MLHostExtensionContext.taskName.getter()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

Swift::Void __swiftcall DataHarvestingManager.pruneVirtualFeatureStore(from:)(Swift::Double_optional from)
{
}

uint64_t DataHarvestingManager.init(config:executionManager:readerName:)()
{
  return DataHarvestingManager.init(config:executionManager:readerName:)();
}

uint64_t DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)()
{
  return DataHarvestingManager.harvest(appendingTrialIdentifier:appendingFeaturizationConfig:inTests:)();
}

uint64_t type metadata accessor for DataHarvestingManager()
{
  return type metadata accessor for DataHarvestingManager();
}

uint64_t type metadata accessor for SubtaskName()
{
  return type metadata accessor for SubtaskName();
}

uint64_t userDefaults.getter()
{
  return userDefaults.getter();
}

uint64_t ConfigManager.shouldHarvestData.getter()
{
  return ConfigManager.shouldHarvestData.getter();
}

uint64_t ConfigManager.shouldSendMetrics.getter()
{
  return ConfigManager.shouldSendMetrics.getter();
}

uint64_t ConfigManager.shouldAttemptLocalTraining.getter()
{
  return ConfigManager.shouldAttemptLocalTraining.getter();
}

uint64_t ConfigManager.shouldAttemptShadowEvaluation.getter()
{
  return ConfigManager.shouldAttemptShadowEvaluation.getter();
}

uint64_t ConfigManager.init(recipe:)()
{
  return ConfigManager.init(recipe:)();
}

uint64_t type metadata accessor for ConfigManager()
{
  return type metadata accessor for ConfigManager();
}

uint64_t TrialIdentifier.init(task:treatment:deployment:)()
{
  return TrialIdentifier.init(task:treatment:deployment:)();
}

uint64_t type metadata accessor for TrialIdentifier()
{
  return type metadata accessor for TrialIdentifier();
}

uint64_t type metadata accessor for ComputationState()
{
  return type metadata accessor for ComputationState();
}

uint64_t dispatch thunk of ExecutionManager.shouldStop.getter()
{
  return dispatch thunk of ExecutionManager.shouldStop.getter();
}

uint64_t FeaturizationConfig.init(identifier:)()
{
  return FeaturizationConfig.init(identifier:)();
}

uint64_t type metadata accessor for FeaturizationConfig()
{
  return type metadata accessor for FeaturizationConfig();
}

Swift::Void __swiftcall LocalTrainingManager.attemptLocalTrain()()
{
}

uint64_t LocalTrainingManager.init(config:executionManager:)()
{
  return LocalTrainingManager.init(config:executionManager:)();
}

uint64_t type metadata accessor for LocalTrainingManager()
{
  return type metadata accessor for LocalTrainingManager();
}

Swift::Void __swiftcall DurableFeatureManager.computeFeaturesAndSendToBiome()()
{
}

uint64_t DurableFeatureManager.init(config:executionManager:)()
{
  return DurableFeatureManager.init(config:executionManager:)();
}

uint64_t type metadata accessor for DurableFeatureManager()
{
  return type metadata accessor for DurableFeatureManager();
}

Swift::OpaquePointer_optional __swiftcall ShadowEvaluationManager.attemptShadowEvaluation()()
{
  uint64_t v0 = (void *)ShadowEvaluationManager.attemptShadowEvaluation()();
  result.value._rawValue = v0;
  result.is_nil = v1;
  return result;
}

uint64_t ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)()
{
  return ShadowEvaluationManager.init(config:executionManager:trialIdentifier:)();
}

uint64_t type metadata accessor for ShadowEvaluationManager()
{
  return type metadata accessor for ShadowEvaluationManager();
}

uint64_t IsTaskCancelledExecutionManager.init()()
{
  return IsTaskCancelledExecutionManager.init()();
}

uint64_t type metadata accessor for IsTaskCancelledExecutionManager()
{
  return type metadata accessor for IsTaskCancelledExecutionManager();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
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

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t NSUserDefaults.shouldCompute(_:)()
{
  return NSUserDefaults.shouldCompute(_:)();
}

uint64_t NSUserDefaults.saveComputationDate(_:)()
{
  return NSUserDefaults.saveComputationDate(_:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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