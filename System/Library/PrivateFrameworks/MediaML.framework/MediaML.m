uint64_t one-time initialization function for logger()
{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ModelEvaluation", 0xFuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, logger);
  __swift_project_value_buffer(v1, (uint64_t)logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataValidation", 0xEuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static SQLiteDB.logger);
  __swift_project_value_buffer(v1, (uint64_t)static SQLiteDB.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sql", 3uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static WifiModel.logger);
  __swift_project_value_buffer(v1, (uint64_t)static WifiModel.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("WifiModel", 9uLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static CellularModel.logger);
  __swift_project_value_buffer(v1, (uint64_t)static CellularModel.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CellularModel", 0xDuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static DataWriter.logger);
  __swift_project_value_buffer(v1, (uint64_t)static DataWriter.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DataWriter", 0xAuLL, 1);
  return Logger.init(subsystem:category:)();
}

{
  uint64_t v1;

  v1 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v1, static MediaML.logger);
  __swift_project_value_buffer(v1, (uint64_t)static MediaML.logger);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.MediaML", 0x11uLL, 1);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("MediaML", 7uLL, 1);
  return Logger.init(subsystem:category:)();
}

uint64_t logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

{
  uint64_t v0;

  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

Swift::Double __swiftcall meanAbsolutePercentageError(yRealList:yPredList:)(Swift::OpaquePointer yRealList, Swift::OpaquePointer yPredList)
{
  rawValue = yRealList._rawValue;
  v148 = yPredList._rawValue;
  v122 = partial apply for implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:);
  v123 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  v124 = partial apply for implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:);
  v125 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v126 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v128 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
  v129 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v130 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v131 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v132 = closure #1 in meanAbsolutePercentageError(yRealList:yPredList:);
  v133 = partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool);
  v134 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v135 = closure #2 in meanAbsolutePercentageError(yRealList:yPredList:);
  v136 = (void (*)(char *, char *))partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double);
  v137 = implicit closure #3 in meanAbsolutePercentageError(yRealList:yPredList:);
  double v138 = -1.0;
  uint64_t v176 = 0;
  uint64_t v175 = 0;
  uint64_t v139 = 0;
  uint64_t v163 = 0;
  uint64_t v155 = 0;
  Swift::Double v151 = 0.0;
  double v150 = 0.0;
  uint64_t v141 = type metadata accessor for Logger();
  uint64_t v142 = *(void *)(v141 - 8);
  uint64_t v143 = v141 - 8;
  unint64_t v144 = (*(void *)(v142 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](rawValue);
  v145 = (char *)v47 - v144;
  unint64_t v146 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v147 = (char *)v47 - v146;
  uint64_t v176 = v4;
  uint64_t v175 = v5;
  uint64_t v149 = MEMORY[0x25A2984D0]();
  uint64_t v6 = MEMORY[0x25A2984D0](v148);
  if (v149 != v6)
  {
    v22 = v145;
    uint64_t v23 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v22, v23, v141);
    swift_bridgeObjectRetain();
    uint64_t v58 = 24;
    uint64_t v68 = 7;
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = rawValue;
    swift_bridgeObjectRetain();
    uint64_t v69 = swift_allocObject();
    *(void *)(v69 + 16) = v148;
    v80 = Logger.logObject.getter();
    int v81 = static os_log_type_t.error.getter();
    v61 = &v173;
    uint64_t v173 = 22;
    unint64_t v59 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v60 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v62 = v174;
    uint64_t v65 = 17;
    uint64_t v71 = swift_allocObject();
    *(unsigned char *)(v71 + 16) = 0;
    uint64_t v72 = swift_allocObject();
    int v66 = 8;
    *(unsigned char *)(v72 + 16) = 8;
    uint64_t v67 = 32;
    uint64_t v24 = swift_allocObject();
    uint64_t v25 = v63;
    uint64_t v64 = v24;
    *(void *)(v24 + 16) = v122;
    *(void *)(v24 + 24) = v25;
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v64;
    uint64_t v73 = v26;
    *(void *)(v26 + 16) = v123;
    *(void *)(v26 + 24) = v27;
    uint64_t v74 = swift_allocObject();
    *(unsigned char *)(v74 + 16) = 0;
    uint64_t v75 = swift_allocObject();
    *(unsigned char *)(v75 + 16) = v66;
    uint64_t v28 = swift_allocObject();
    uint64_t v29 = v69;
    uint64_t v70 = v28;
    *(void *)(v28 + 16) = v124;
    *(void *)(v28 + 24) = v29;
    uint64_t v30 = swift_allocObject();
    uint64_t v31 = v70;
    uint64_t v77 = v30;
    *(void *)(v30 + 16) = v125;
    *(void *)(v30 + 24) = v31;
    uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v76 = _allocateUninitializedArray<A>(_:)();
    v78 = v32;
    swift_retain();
    uint64_t v33 = v71;
    v34 = v78;
    *v78 = v126;
    v34[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v33;
    swift_retain();
    uint64_t v35 = v72;
    v36 = v78;
    v78[2] = v127;
    v36[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
    swift_retain();
    v37 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v73;
    v38 = v78;
    v78[4] = v128;
    v38[5] = v37;
    swift_retain();
    uint64_t v39 = v74;
    v40 = v78;
    v78[6] = v129;
    v40[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39;
    swift_retain();
    uint64_t v41 = v75;
    v42 = v78;
    v78[8] = v130;
    v42[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v41;
    swift_retain();
    v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v77;
    v44 = v78;
    v78[10] = v131;
    v44[11] = v43;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v80, (os_log_type_t)v81))
    {
      uint64_t v45 = v139;
      v51 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v50 = 0;
      uint64_t v52 = createStorage<A>(capacity:type:)(0);
      uint64_t v53 = createStorage<A>(capacity:type:)(v50);
      v54 = &v172;
      v172 = v51;
      v55 = &v171;
      uint64_t v171 = v52;
      v56 = &v170;
      uint64_t v170 = v53;
      serialize(_:at:)(0, &v172);
      serialize(_:at:)(2, v54);
      v168 = v126;
      uint64_t v169 = v71;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56);
      uint64_t v57 = v45;
      if (v45)
      {
        __break(1u);
      }
      else
      {
        v168 = v127;
        uint64_t v169 = v72;
        closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v172, (uint64_t)&v171, (uint64_t)&v170);
        uint64_t v48 = 0;
        uint64_t v46 = v48;
        v168 = v128;
        uint64_t v169 = v73;
        closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v172, (uint64_t)&v171, (uint64_t)&v170);
        v47[3] = v46;
        v168 = v129;
        uint64_t v169 = v74;
        closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v172, (uint64_t)&v171, (uint64_t)&v170);
        v47[2] = 0;
        v168 = v130;
        uint64_t v169 = v75;
        closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v172, (uint64_t)&v171, (uint64_t)&v170);
        v47[1] = 0;
        v168 = v131;
        uint64_t v169 = v77;
        closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v172, (uint64_t)&v171, (uint64_t)&v170);
        _os_log_impl(&dword_255CF7000, v80, (os_log_type_t)v81, "Length mismatch between yRealList(%ld) and yPredList(%ld", v51, v62);
        v47[0] = 0;
        destroyStorage<A>(_:count:)(v52, 0, v49);
        destroyStorage<A>(_:count:)(v53, v47[0], MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v51, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v142 + 8))(v145, v141);
    return v138;
  }
  uint64_t v7 = v139;
  v115 = v167;
  v167[0] = rawValue;
  v113 = &v166;
  v166 = v148;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  unint64_t v116 = lazy protocol witness table accessor for type [Double] and conformance [A]();
  zip<A, B>(_:_:)();
  uint64_t v164 = v167[1];
  uint64_t v165 = v167[2];
  v117 = v47;
  MEMORY[0x270FA5388](v47);
  v8 = &v47[-4];
  v118 = &v47[-4];
  v8[2] = (uint64_t)v132;
  v8[3] = 0;
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Zip2Sequence<[Double], [Double]>);
  lazy protocol witness table accessor for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>();
  uint64_t v9 = Sequence.filter(_:)();
  uint64_t v120 = v7;
  uint64_t v121 = v9;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t v112 = v121;
    uint64_t v163 = v121;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Double, Double));
    if (MEMORY[0x25A2984C0](v112, v11) <= 0)
    {
      v16 = v147;
      uint64_t v17 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v16, v17, v141);
      v100 = Logger.logObject.getter();
      int v99 = static os_log_type_t.error.getter();
      v97 = &v161;
      uint64_t v161 = 2;
      unint64_t v95 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v96 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v98 = v162;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v101 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v100, (os_log_type_t)v99))
      {
        uint64_t v18 = v120;
        v85 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v84 = 0;
        uint64_t v86 = createStorage<A>(capacity:type:)(0);
        uint64_t v87 = createStorage<A>(capacity:type:)(v84);
        v91 = &v160;
        v160 = v85;
        v92 = &v159;
        uint64_t v159 = v86;
        v89 = &v158;
        uint64_t v158 = v87;
        unsigned int v88 = 0;
        serialize(_:at:)(0, &v160);
        serialize(_:at:)(v88, v91);
        uint64_t v157 = v101;
        v90 = v47;
        MEMORY[0x270FA5388](v47);
        v19 = v92;
        v20 = &v47[-6];
        v93 = &v47[-6];
        v20[2] = (uint64_t)v91;
        v20[3] = (uint64_t)v19;
        v20[4] = v21;
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v18)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_255CF7000, v100, (os_log_type_t)v99, "Length of non-zero yReal & yPred is zero", v85, v98);
          uint64_t v82 = 0;
          destroyStorage<A>(_:count:)(v86, 0, v83);
          destroyStorage<A>(_:count:)(v87, v82, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A298650](v85, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v142 + 8))(v147, v141);
      swift_bridgeObjectRelease();
      return v138;
    }
    uint64_t v12 = v120;
    uint64_t v156 = v112;
    v106 = v47;
    MEMORY[0x270FA5388](v47);
    v13 = &v47[-4];
    v107 = &v47[-4];
    v13[2] = (uint64_t)v135;
    v13[3] = 0;
    uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(Double, Double)]);
    unint64_t v14 = lazy protocol witness table accessor for type [(Double, Double)] and conformance [A]();
    uint64_t v15 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(v136, (uint64_t)v107, v108, MEMORY[0x263F8D538], MEMORY[0x263F8E628], v14, MEMORY[0x263F8E658], v109);
    uint64_t v110 = v12;
    uint64_t v111 = v15;
    if (!v12)
    {
      uint64_t v105 = v111;
      uint64_t v155 = v111;
      uint64_t v153 = v111;
      uint64_t v152 = 0;
      Sequence.reduce<A>(_:_:)();
      Swift::Double v102 = Double.init(_:)(v154);
      Swift::Double v151 = v102;
      double v150 = (double)MEMORY[0x25A2984D0](v105);
      Swift::Double v103 = v102 / v150;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v103;
    }
  }
  __break(1u);
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return MEMORY[0x25A2984D0]();
}

uint64_t sub_255CF9E38()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return implicit closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)();
}

uint64_t implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return MEMORY[0x25A2984D0]();
}

uint64_t sub_255CF9E98()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  return implicit closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)();
}

BOOL closure #1 in meanAbsolutePercentageError(yRealList:yPredList:)(double a1, double a2)
{
  return a1 > 0.0 && a2 > 0.0;
}

uint64_t thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]) & 1;
}

double closure #2 in meanAbsolutePercentageError(yRealList:yPredList:)()
{
  abs<A>(_:)();
  double v1 = Double.init(_:)(v3);
  abs<A>(_:)();
  return v1 / Double.init(_:)(v2);
}

void thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(double *a1@<X0>, double (*a2)(double, double)@<X1>, double *a3@<X8>)
{
  *a3 = a2(*a1, a1[1]);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v55 = a3;
  uint64_t v45 = a4;
  uint64_t v32 = a5;
  uint64_t v54 = a6;
  uint64_t v34 = a8;
  uint64_t v35 = "Fatal error";
  v36 = "Index out of bounds";
  v37 = "Swift/Collection.swift";
  v38 = "Range requires lowerBound <= upperBound";
  uint64_t v39 = "Swift/Range.swift";
  v40 = "Index out of range";
  uint64_t v70 = a3;
  uint64_t v69 = a4;
  uint64_t v68 = a5;
  uint64_t v41 = *(void *)(a5 - 8);
  uint64_t v42 = a5 - 8;
  unint64_t v43 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  v44 = (char *)&v15 - v43;
  uint64_t v46 = 0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v49 = AssociatedTypeWitness - 8;
  unint64_t v50 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v46);
  v51 = (char *)&v15 - v50;
  unint64_t v52 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v53 = (char *)&v15 - v52;
  uint64_t v56 = swift_getAssociatedTypeWitness();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v55);
  unint64_t v60 = (char *)&v15 - v59;
  unint64_t v61 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint32_t v62 = (char *)&v15 - v61;
  Swift::Int v63 = dispatch thunk of Collection.count.getter();
  if (v63)
  {
    uint64_t v67 = MEMORY[0x25A2987D0](v45);
    uint64_t v29 = type metadata accessor for ContiguousArray();
    ContiguousArray.reserveCapacity(_:)(v63);
    uint64_t result = dispatch thunk of Collection.startIndex.getter();
    if (v63 >= 0)
    {
      uint64_t v27 = 0;
      for (uint64_t i = v33; ; uint64_t i = v18)
      {
        uint64_t v25 = i;
        uint64_t v26 = v27;
        if (v27 == v63) {
          goto LABEL_17;
        }
        if (v26 < 0 || v26 >= v63) {
          goto LABEL_16;
        }
        uint64_t v65 = v26;
        if (v63 < 0) {
          goto LABEL_15;
        }
        if (v26 >= v63) {
          break;
        }
        uint64_t v24 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          return result;
        }
        char v66 = 0;
        uint64_t v23 = v24;
LABEL_18:
        uint64_t v22 = v23;
        if (v66)
        {
          (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v60, v62, v56);
          _expectEnd<A>(of:is:)();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v56);
          uint64_t v19 = v67;
          swift_retain();
          swift_release();
          uint64_t v20 = v19;
          uint64_t v21 = v25;
          return v20;
        }
        uint64_t v17 = &v64;
        v16 = (void (*)(void))dispatch thunk of Collection.subscript.read();
        (*(void (**)(char *))(v48 + 16))(v51);
        v16();
        uint64_t v14 = v25;
        v30(v51, v44);
        uint64_t v18 = v14;
        if (v14)
        {
          (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v57 + 8))(v62, v56);
          outlined destroy of ContiguousArray<A1>();
          (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v34, v44, v32);
          return v15;
        }
        (*(void (**)(char *, uint64_t))(v48 + 8))(v51, AssociatedTypeWitness);
        ContiguousArray.append(_:)();
        dispatch thunk of Collection.formIndex(after:)();
        uint64_t result = v18;
        uint64_t v27 = v22;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_15:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_16:
      _fatalErrorMessage(_:_:file:line:flags:)();
      __break(1u);
LABEL_17:
      uint64_t v65 = 0;
      char v66 = 1;
      uint64_t v23 = v26;
      goto LABEL_18;
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v20 = static Array._allocateUninitialized(_:)();
  uint64_t v21 = v33;
  return v20;
}

double implicit closure #3 in meanAbsolutePercentageError(yRealList:yPredList:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
    return WitnessTable;
  }
  return v2;
}

uint64_t createStorage<A>(capacity:type:)(uint64_t a1)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)();
  }
  else {
    return 0;
  }
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t destroyStorage<A>(_:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result;
  if (result)
  {
    UnsafeMutablePointer.deinitialize(count:)();
    return MEMORY[0x25A298650](v3, a3);
  }
  return result;
}

Swift::Void __swiftcall Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a1;
  uint64_t v21 = a6;
  v13[1] = a7;
  uint64_t v14 = partial apply for closure #1 in serialize<A>(_:at:);
  uint64_t v25 = a6;
  uint64_t v18 = *(void *)(a6 - 8);
  uint64_t v19 = a6 - 8;
  v13[0] = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v20 = (uint64_t)v13 - v13[0];
  v8(v7);
  uint64_t v16 = dispatch thunk of static FixedWidthInteger.bitWidth.getter() >> 3;
  uint64_t v23 = *v17;
  uint64_t v24 = v23 + v16;
  _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v20, v14, (uint64_t)v22, v21, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v15);
  uint64_t v9 = v18;
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  *v17 += v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t _ss27_withUnprotectedUnsafeBytes2of_q0_x_q0_SWq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = a2;
  uint64_t v12 = a5;
  uint64_t v13 = a8;
  uint64_t v23 = a4;
  uint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = a5 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388]();
  uint64_t v18 = (char *)&v12 - v16;
  uint64_t v20 = v9 + *(void *)(*(void *)(v10 - 8) + 64);
  uint64_t result = v17();
  uint64_t v19 = v8;
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v13, v18, v12);
  }
  return result;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_255CFAFAC()
{
  return swift_deallocObject();
}

unsigned char **partial apply for closure #1 in OSLogArguments.append(_:)(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255CFAFE0()
{
  return swift_deallocObject();
}

unsigned char **closure #1 in OSLogArguments.append(_:)partial apply(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255CFB014()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255CFB060()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in OSLogArguments.append<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255CFB190()
{
  return swift_deallocObject();
}

uint64_t sub_255CFB1C4()
{
  return swift_deallocObject();
}

uint64_t sub_255CFB1F8()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255CFB244()
{
  return swift_deallocObject();
}

uint64_t closure #1 in OSLogArguments.append<A>(_:)partial apply(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t vars8;

  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _finalizeUninitializedArray<A>(_:)()
{
}

unint64_t lazy protocol witness table accessor for type [Double] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [Double] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Double] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(double *a1)
{
  return thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Bool)(a1, *(uint64_t (**)(double, double))(v1 + 16)) & 1;
}

unint64_t lazy protocol witness table accessor for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>;
  if (!lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Zip2Sequence<[Double], [Double]>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Zip2Sequence<[Double], [Double]> and conformance Zip2Sequence<A, B>);
    return WitnessTable;
  }
  return v2;
}

uint64_t partial apply for closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

unint64_t lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(_:_:_:)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(_:_:_:)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void partial apply for thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(double *a1@<X0>, double *a2@<X8>)
{
  thunk for @callee_guaranteed (@unowned Double, @unowned Double) -> (@unowned Double)(a1, *(double (**)(double, double))(v2 + 16), a2);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of ContiguousArray<A1>()
{
}

uint64_t partial apply for closure #1 in serialize<A>(_:at:)()
{
  return closure #1 in serialize<A>(_:at:)();
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

Swift::Double __swiftcall getMean(nums:)(Swift::OpaquePointer nums)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence.reduce<A>(_:_:)();
  double v3 = Double.init(_:)(v4);
  return v3 / (double)MEMORY[0x25A2984D0](nums._rawValue);
}

double implicit closure #1 in getMean(nums:)@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

Swift::Double __swiftcall getMedian(nums:)(Swift::OpaquePointer nums)
{
  uint64_t v9 = MEMORY[0x25A2984D0]() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
  lazy protocol witness table accessor for type [Double] and conformance [A]();
  Sequence<>.sorted()();
  if (MEMORY[0x25A2984D0]() % 2)
  {
    specialized Array.subscript.getter();
    Swift::Double v5 = Double.init(_:)(v4);
    swift_bridgeObjectRelease();
    return v5;
  }
  specialized Array.subscript.getter();
  double v8 = result;
  if (!__OFSUB__(v9, 1))
  {
    specialized Array.subscript.getter();
    Swift::Double v6 = Double.init(_:)((v8 + v3) / 2.0);
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

{
  Swift::Double result;
  Swift::Double v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v7 = MEMORY[0x25A2984E0]() / 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  lazy protocol witness table accessor for type [Int] and conformance [A]();
  double v8 = Sequence<>.sorted()();
  if (MEMORY[0x25A2984E0]() % 2)
  {
    Swift::Double v4 = (double)MEMORY[0x25A298540](v7, v8);
    swift_bridgeObjectRelease();
    return v4;
  }
  Swift::Double v6 = MEMORY[0x25A298540](v7, v8);
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = MEMORY[0x25A298540](v7 - 1, v8);
    if (!__OFADD__(v6, v9))
    {
      swift_bridgeObjectRelease();
      return (double)((v6 + v9) / 2);
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [Int] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [Int] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Int] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Int]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Int] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t getSteadyList(windowSize:rssiThreshold:rssiList:)(uint64_t a1)
{
  uint64_t v15 = MEMORY[0x25A2984E0]();
  uint64_t v13 = a1 / 2;
  uint64_t v25 = _allocateUninitializedArray<A>(_:)();
  if (v15 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  specialized Collection<>.makeIterator()();
  while (1)
  {
    uint64_t result = specialized IndexingIterator.next()();
    uint64_t v12 = result;
    if (v2)
    {
      swift_bridgeObjectRetain();
      outlined destroy of [Int]();
      return v25;
    }
    if (v13 < v15)
    {
      if (result >= v13)
      {
        if (__OFSUB__(result, v13)) {
          goto LABEL_49;
        }
        uint64_t result = max<A>(_:_:)();
        uint64_t v24 = v18;
        if (__OFADD__(v12, v13)) {
          goto LABEL_50;
        }
        if (__OFSUB__(v15, 1)) {
          goto LABEL_51;
        }
        min<A>(_:_:)();
        uint64_t v23 = v17;
      }
      else
      {
        uint64_t v24 = 0;
        if (__OFADD__(result, v13)) {
          goto LABEL_52;
        }
        if (__OFSUB__(v15, 1)) {
          goto LABEL_53;
        }
        min<A>(_:_:)();
        uint64_t v23 = v16;
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (__OFSUB__(v15, 1)) {
        goto LABEL_54;
      }
      uint64_t v23 = v15 - 1;
    }
    if (v23 < v24)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
    lazy protocol witness table accessor for type [Int] and conformance [A]();
    lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
    MutableCollection.subscript.getter();
    outlined destroy of [Int]();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
    lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
    Sequence<>.max()();
    if (v22)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = v21;
    }
    uint64_t result = Sequence<>.min()();
    if (v20)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    else
    {
      uint64_t v10 = v19;
    }
    if (__OFSUB__(v11, v10)) {
      break;
    }
    abs<A>(_:)();
    specialized Array.append(_:)();
    swift_unknownObjectRelease();
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Int]()
{
}

unint64_t lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>;
  if (!lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ClosedRange<Int>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ClosedRange<Int> and conformance ClosedRange<A>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Int>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Int> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t getFlatList(durationThreshold:steadyList:)(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = MEMORY[0x25A2984E0]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  uint64_t v2 = _allocateUninitializedArray<A>(_:)();
  uint64_t result = v33;
  uint64_t v37 = v2;
  char v36 = 0;
  uint64_t v35 = 0;
  if (v33 < a1)
  {
LABEL_93:
    swift_bridgeObjectRetain();
    outlined destroy of [(start: Int, end: Int, count: Int)]();
    return v37;
  }
  if (!__OFSUB__(v33, 2))
  {
    if (v33 - 2 < 0)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    specialized Collection<>.makeIterator()();
    while (1)
    {
      uint64_t v34 = specialized IndexingIterator.next()();
      if (v6) {
        goto LABEL_93;
      }
      BOOL v30 = MEMORY[0x25A298540](v34, a2, v5) != 0;
      uint64_t result = swift_bridgeObjectRetain();
      if (v30)
      {
        BOOL v29 = 0;
      }
      else
      {
        if (__OFADD__(v34, 1)) {
          goto LABEL_107;
        }
        BOOL v29 = MEMORY[0x25A298540](v34 + 1, a2) == 1;
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (v29)
      {
        char v36 = 0;
        if (__OFADD__(v34, 1)) {
          goto LABEL_106;
        }
        uint64_t v35 = v34 + 1;
      }
      else
      {
        BOOL v28 = MEMORY[0x25A298540](v34, a2) != 1;
        uint64_t result = swift_bridgeObjectRetain();
        if (v28)
        {
          BOOL v27 = 0;
        }
        else
        {
          if (__OFADD__(v34, 1)) {
            goto LABEL_105;
          }
          BOOL v27 = MEMORY[0x25A298540](v34 + 1, a2) == 0;
        }
        uint64_t result = swift_bridgeObjectRelease();
        if (v27)
        {
          char v36 = 0;
          if (__OFSUB__(v34, v35)) {
            goto LABEL_102;
          }
          if (v34 - v35 >= a1)
          {
            if (__OFSUB__(v34, v35)) {
              goto LABEL_103;
            }
            if (__OFADD__(v34 - v35, 1)) {
              goto LABEL_104;
            }
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
            uint64_t result = Array.append(_:)();
          }
        }
        else
        {
          BOOL v26 = MEMORY[0x25A298540](v34, a2) != 1;
          uint64_t result = swift_bridgeObjectRetain();
          if (v26)
          {
            BOOL v25 = 0;
          }
          else
          {
            if (__OFADD__(v34, 1)) {
              goto LABEL_101;
            }
            BOOL v25 = MEMORY[0x25A298540](v34 + 1, a2) == 1;
          }
          uint64_t result = swift_bridgeObjectRelease();
          if (v25)
          {
            char v36 = 1;
          }
          else
          {
            BOOL v24 = MEMORY[0x25A298540](v34, a2) != 0;
            uint64_t result = swift_bridgeObjectRetain();
            if (v24)
            {
              BOOL v23 = 0;
            }
            else
            {
              if (__OFADD__(v34, 1)) {
                goto LABEL_100;
              }
              BOOL v23 = MEMORY[0x25A298540](v34 + 1, a2) == 0;
            }
            uint64_t result = swift_bridgeObjectRelease();
            if (v23) {
              char v36 = 0;
            }
          }
        }
      }
      if (__OFSUB__(v33, 2)) {
        goto LABEL_95;
      }
      if (v34 == v33 - 2 && (v36 & 1) == 1)
      {
        uint64_t v21 = v33 - 1;
        if (__OFSUB__(v33, 1)) {
          goto LABEL_98;
        }
        if (__OFSUB__(v21, v35)) {
          goto LABEL_99;
        }
        BOOL v20 = v21 - v35 >= a1;
      }
      else
      {
        BOOL v20 = 0;
      }
      if (v20)
      {
        if (__OFSUB__(v33, 1)) {
          goto LABEL_96;
        }
        if (__OFSUB__(v33, v35)) {
          goto LABEL_97;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
        Array.append(_:)();
      }
    }
  }
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  __break(1u);
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
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
  return result;
}

uint64_t getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
  uint64_t v34 = _allocateUninitializedArray<A>(_:)();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (start: Int, end: Int, count: Int));
  if (MEMORY[0x25A2984C0](a1, v1) > 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
    lazy protocol witness table accessor for type [(start: Int, end: Int, count: Int)] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[(start: Int, end: Int, count: Int)]>);
      IndexingIterator.next()();
      if (v33) {
        break;
      }
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double]);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClosedRange<Int>);
      lazy protocol witness table accessor for type [Double] and conformance [A]();
      lazy protocol witness table accessor for type ClosedRange<Int> and conformance ClosedRange<A>();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Double>);
      lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>();
      uint64_t nums = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<Int>);
      lazy protocol witness table accessor for type ArraySlice<Int> and conformance ArraySlice<A>();
      uint64_t v21 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      uint64_t v20 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      uint64_t v19 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Double]();
      uint64_t v18 = Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      MutableCollection.subscript.getter();
      outlined destroy of [Int]();
      Array.init<A>(_:)();
      if (v32 < v31)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      MutableCollection.subscript.getter();
      outlined destroy of [String]();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<String>);
      lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>();
      Array.init<A>(_:)();
      Swift::Double v13 = getMedian(nums:)((Swift::OpaquePointer)nums);
      Swift::Double v14 = getMedian(nums:)((Swift::OpaquePointer)v21);
      Swift::Double v15 = getMedian(nums:)((Swift::OpaquePointer)v20);
      Swift::Double v16 = getMedian(nums:)((Swift::OpaquePointer)v19);
      Swift::Double v17 = getMedian(nums:)((Swift::OpaquePointer)v18);
      lazy protocol witness table accessor for type [Int] and conformance [A]();
      Sequence<>.min()();
      if (v30)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        uint64_t v12 = v29;
      }
      Sequence<>.min()();
      if (v28)
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      else
      {
        uint64_t v11 = v27;
      }
      lazy protocol witness table accessor for type [String] and conformance [A]();
      Sequence<>.min()();
      if (v26)
      {
        uint64_t v9 = v25;
        uint64_t v10 = v26;
      }
      else
      {
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
      }
      uint64_t v24 = MEMORY[0x25A2984E0](v21);
      specialized _allocateUninitializedArray<A>(_:)();
      double v8 = v2;
      uint64_t v3 = MEMORY[0x263F8D538];
      uint64_t v4 = MEMORY[0x263F8D538];
      v2[3] = MEMORY[0x263F8D538];
      *(Swift::Double *)uint64_t v2 = v13;
      v2[7] = v4;
      *((Swift::Double *)v2 + 4) = v14;
      v2[11] = v3;
      *((Swift::Double *)v2 + 8) = v15;
      v2[15] = v3;
      *((Swift::Double *)v2 + 12) = v16;
      v2[19] = v3;
      *((Swift::Double *)v2 + 16) = v17;
      uint64_t v5 = MEMORY[0x263F8D6C8];
      uint64_t v7 = MEMORY[0x263F8D6C8];
      v2[23] = MEMORY[0x263F8D6C8];
      v2[20] = v12;
      v2[27] = v5;
      v2[24] = v11;
      swift_bridgeObjectRetain();
      v8[31] = MEMORY[0x263F8D310];
      v8[28] = v9;
      v8[29] = v10;
      v8[35] = v7;
      v8[32] = v24;
      _finalizeUninitializedArray<A>(_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[Any]]);
      Array.append(_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    outlined destroy of IndexingIterator<[(start: Int, end: Int, count: Int)]>();
  }
  swift_bridgeObjectRetain();
  outlined destroy of [[Any]]();
  return v34;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [[Any]]()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Double]()
{
}

unint64_t lazy protocol witness table accessor for type ArraySlice<Double> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<Double>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<Double> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [String]()
{
}

unint64_t lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<String>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t preprocessData(rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)()
{
  uint64_t v3 = getSteadyList(windowSize:rssiThreshold:rssiList:)(7);
  uint64_t v2 = getFlatList(durationThreshold:steadyList:)(3, v3);
  uint64_t v1 = getReducedData(flatList:rssiList:obrList:noiseList:txRateList:rxRateList:dowList:hourList:ssidList:)(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall checkValidInterfaceType(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  char v10 = 0;
  kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A298290](v9);
  outlined destroy of String();
  if (v9[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v8;
      char v7 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      char v7 = 1;
    }
    uint64_t v4 = v6;
    char v5 = v7;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v9);
    uint64_t v4 = 0;
    char v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v4 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    return 0;
  }
  char v10 = 1;
  return 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String()
{
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

Swift::Bool __swiftcall checkValidThroughputTrue(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  char v9 = 0;
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A298290](v8);
  outlined destroy of String();
  if (v8[3])
  {
    if (swift_dynamicCast())
    {
      double v5 = v7;
      char v6 = 0;
    }
    else
    {
      double v5 = 0.0;
      char v6 = 1;
    }
    double v3 = v5;
    char v4 = v6;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8);
    double v3 = 0.0;
    char v4 = 1;
  }
  if (v4) {
    return 0;
  }
  if (v3 <= 0.0) {
    return 0;
  }
  char v9 = 1;
  return 1;
}

Swift::Bool __swiftcall validateAppName(text:)(Swift::String text)
{
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  Swift::Double v13 = 0;
  Swift::String v21 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Za-z0-9./]{1,155}$", 0x16uLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  char v10 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t v19 = v2;
    uint64_t v17 = 0;
    uint64_t v18 = String.count.getter();
    swift_bridgeObjectRetain();
    id v6 = (id)MEMORY[0x25A298300](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v14 = 0;
    uint64_t v15 = v18;
    id v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    Swift::Double v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    BOOL v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

unint64_t type metadata accessor for NSRegularExpression()
{
  uint64_t v2 = lazy cache variable for type metadata for NSRegularExpression;
  if (!lazy cache variable for type metadata for NSRegularExpression)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpression);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for NSRegularExpressionOptions()
{
  uint64_t v4 = lazy cache variable for type metadata for NSRegularExpressionOptions;
  if (!lazy cache variable for type metadata for NSRegularExpressionOptions)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSRegularExpressionOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions;
  if (!lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions)
  {
    type metadata accessor for NSRegularExpressionOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions);
    return WitnessTable;
  }
  return v2;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSRegularExpression.__allocating_init(pattern:options:)(NSRegularExpression *__return_ptr retstr, Swift::String pattern, NSRegularExpressionOptions options)
{
  uint64_t countAndFlagsBits = pattern._countAndFlagsBits;
  object = pattern._object;
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  @nonobjc NSRegularExpression.init(pattern:options:)(countAndFlagsBits, (uint64_t)object, options);
}

uint64_t type metadata accessor for NSMatchingOptions()
{
  uint64_t v4 = lazy cache variable for type metadata for NSMatchingOptions;
  if (!lazy cache variable for type metadata for NSMatchingOptions)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSMatchingOptions);
      return v1;
    }
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions;
  if (!lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions)
  {
    type metadata accessor for NSMatchingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSMatchingOptions and conformance NSMatchingOptions);
    return WitnessTable;
  }
  return v2;
}

unint64_t type metadata accessor for NSTextCheckingResult()
{
  uint64_t v2 = lazy cache variable for type metadata for NSTextCheckingResult;
  if (!lazy cache variable for type metadata for NSTextCheckingResult)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSTextCheckingResult);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [NSTextCheckingResult] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [NSTextCheckingResult]()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of NSTextCheckingResult?(id *a1)
{
}

Swift::Bool __swiftcall validateSessionID(text:)(Swift::String text)
{
  uint64_t v19 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  Swift::Double v13 = 0;
  Swift::String v21 = text;
  type metadata accessor for NSRegularExpression();
  Swift::String pattern = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}$", 0x3EuLL, 1);
  type metadata accessor for NSRegularExpressionOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  NSRegularExpression.__allocating_init(pattern:options:)(v1, pattern, v20);
  char v10 = v2;
  if (v3)
  {
    Swift::Bool result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t v19 = v2;
    uint64_t v17 = 0;
    uint64_t v18 = String.count.getter();
    swift_bridgeObjectRetain();
    id v6 = (id)MEMORY[0x25A298300](text._countAndFlagsBits, text._object);
    swift_bridgeObjectRelease();
    type metadata accessor for NSMatchingOptions();
    _allocateUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
    SetAlgebra<>.init(arrayLiteral:)();
    uint64_t v14 = 0;
    uint64_t v15 = v18;
    id v7 = objc_msgSend(v10, sel_matchesInString_options_range_, v6, v16, 0, v18);

    type metadata accessor for NSTextCheckingResult();
    Swift::Double v13 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    v11[1] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSTextCheckingResult]);
    lazy protocol witness table accessor for type [NSTextCheckingResult] and conformance [A]();
    Collection.first.getter();
    outlined destroy of [NSTextCheckingResult]();
    v11[0] = v12;
    BOOL v5 = v12 != 0;
    outlined destroy of NSTextCheckingResult?(v11);
    swift_bridgeObjectRelease();

    return v5;
  }
  return result;
}

Swift::Bool __swiftcall validateSSID(text:)(Swift::String text)
{
  uint64_t countAndFlagsBits = text._countAndFlagsBits;
  object = text._object;
  uint64_t v27 = partial apply for closure #1 in validateSSID(text:);
  uint64_t v33 = 0;
  uint64_t v28 = 0;
  Swift::String v35 = text;
  char v34 = 0;
  Swift::Int v29 = String.count.getter();
  BOOL v31 = *maxSSIDLength.unsafeMutableAddressor() >= v29;
  swift_bridgeObjectRetain();
  if (v31)
  {
    Swift::Int v24 = String.count.getter();
    BOOL v25 = v24 < *minSSIDLength.unsafeMutableAddressor();
  }
  else
  {
    BOOL v25 = 1;
  }
  BOOL v23 = v25;
  swift_bridgeObjectRelease();
  if (v25)
  {
    int v22 = 0;
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F8D310];
    uint64_t v14 = _allocateUninitializedArray<A>(_:)();
    Swift::Double v13 = v1;
    uint64_t v11 = 6;
    int v12 = 1;
    *unint64_t v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("select", 6uLL, 1);
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1);
    char v3 = v12;
    v13[1] = v2;
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop table", 0xAuLL, v3 & 1);
    uint64_t v5 = v14;
    void v13[2] = v4;
    _finalizeUninitializedArray<A>(_:)();
    uint64_t v16 = v5;
    uint64_t v33 = v5;
    uint64_t v32 = v5;
    swift_bridgeObjectRetain();
    uint64_t v17 = &v9;
    uint64_t v18 = 32;
    MEMORY[0x270FA5388]();
    id v6 = (char *)&v9 - v18;
    uint64_t v19 = v6;
    *((void *)v6 + 2) = countAndFlagsBits;
    *((void *)v6 + 3) = v7;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    int v21 = Sequence.contains(where:)();
    int v9 = v21;
    swift_bridgeObjectRelease();
    int v10 = v9 ^ 1;
    char v34 = (v9 ^ 1) & 1;
    swift_bridgeObjectRelease();
    int v22 = v10;
  }
  return v22 & 1;
}

uint64_t closure #1 in validateSSID(text:)()
{
  String.lowercased()();
  lazy protocol witness table accessor for type String and conformance String();
  lazy protocol witness table accessor for type String and conformance String();
  char v1 = BidirectionalCollection<>.starts<A>(with:)();
  outlined destroy of String();
  return v1 & 1;
}

uint64_t partial apply for closure #1 in validateSSID(text:)()
{
  return closure #1 in validateSSID(text:)() & 1;
}

Swift::Bool __swiftcall checkValidTextInputs(data:)(Swift::OpaquePointer data)
{
  rawValue = data._rawValue;
  v186 = partial apply for implicit closure #1 in checkValidTextInputs(data:);
  v187 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v188 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v189 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v190 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v191 = partial apply for implicit closure #2 in checkValidTextInputs(data:);
  v192 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v194 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v195 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v196 = partial apply for implicit closure #3 in checkValidTextInputs(data:);
  v197 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  v198 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v199 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v200 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v260 = 0;
  char v259 = 0;
  uint64_t v255 = 0;
  v256 = 0;
  uint64_t v201 = 0;
  uint64_t v244 = 0;
  v245 = 0;
  uint64_t v227 = 0;
  v228 = 0;
  uint64_t v202 = type metadata accessor for Logger();
  uint64_t v203 = *(void *)(v202 - 8);
  uint64_t v204 = v202 - 8;
  unint64_t v205 = (*(void *)(v203 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](rawValue);
  v206 = (char *)&v59 - v205;
  unint64_t v207 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v208 = (char *)&v59 - v207;
  unint64_t v209 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v210 = (char *)&v59 - v209;
  uint64_t v260 = v5;
  char v259 = 0;
  Swift::String v211 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v213 = &v257;
  Swift::String v257 = v211;
  MEMORY[0x25A298290](v258);
  outlined destroy of String();
  if (v258[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v184 = v214;
      v185 = v215;
    }
    else
    {
      uint64_t v184 = 0;
      v185 = 0;
    }
    uint64_t v182 = v184;
    v183 = v185;
  }
  else
  {
    unint64_t v60 = 0;
    outlined destroy of Any?((uint64_t)v258);
    uint64_t v182 = (uint64_t)v60;
    v183 = v60;
  }
  v180 = v183;
  uint64_t v181 = v182;
  if (!v183)
  {
    int v116 = 0;
    return v116 & 1;
  }
  uint64_t v178 = v181;
  v179 = v180;
  v6._uint64_t countAndFlagsBits = v181;
  v6._object = v180;
  uint64_t v176 = v180;
  uint64_t v177 = v181;
  uint64_t v255 = v181;
  v256 = v180;
  if (validateAppName(text:)(v6))
  {
    Swift::String v174 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    uint64_t v175 = &v246;
    Swift::String v246 = v174;
    MEMORY[0x25A298290](v247);
    outlined destroy of String();
    if (v247[3])
    {
      if (swift_dynamicCast())
      {
        uint64_t v172 = v216;
        uint64_t v173 = v217;
      }
      else
      {
        uint64_t v172 = 0;
        uint64_t v173 = 0;
      }
      uint64_t v170 = v172;
      uint64_t v171 = v173;
    }
    else
    {
      uint64_t v87 = 0;
      outlined destroy of Any?((uint64_t)v247);
      uint64_t v170 = (uint64_t)v87;
      uint64_t v171 = v87;
    }
    v168 = v171;
    uint64_t v169 = v170;
    if (!v171)
    {
      swift_bridgeObjectRelease();
      int v116 = 0;
      return v116 & 1;
    }
    uint64_t v166 = v169;
    v167 = v168;
    v7._uint64_t countAndFlagsBits = v169;
    v7._object = v168;
    uint64_t v164 = v168;
    uint64_t v165 = v169;
    uint64_t v244 = v169;
    v245 = v168;
    if (validateSessionID(text:)(v7))
    {
      Swift::String v162 = *kMediaML_interfaceType.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      uint64_t v163 = &v235;
      Swift::String v235 = v162;
      MEMORY[0x25A298290](v236);
      outlined destroy of String();
      if (v236[3])
      {
        if (swift_dynamicCast())
        {
          uint64_t v160 = v218;
          int v161 = 0;
        }
        else
        {
          uint64_t v160 = 0;
          int v161 = 1;
        }
        uint64_t v158 = v160;
        int v159 = v161;
      }
      else
      {
        uint64_t v114 = 0;
        outlined destroy of Any?((uint64_t)v236);
        uint64_t v158 = v114;
        int v159 = 1;
      }
      int v157 = v159;
      uint64_t v156 = v158;
      Swift::Int v8 = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
      uint64_t v231 = v156;
      char v232 = v157 & 1;
      Swift::Int v233 = v8;
      char v234 = 0;
      if (!((v157 & 1) == 0
          && (outlined init with copy of Int?((uint64_t)&v231, (uint64_t)v219), (v234 & 1) == 0)
          && v219[0] == v233))
        goto LABEL_45;
      Swift::String v153 = *kMediaML_ssid.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      Swift::Double v154 = &v229;
      Swift::String v229 = v153;
      MEMORY[0x25A298290](v230);
      outlined destroy of String();
      if (v230[3])
      {
        if (swift_dynamicCast())
        {
          uint64_t v151 = v219[2];
          uint64_t v152 = (void *)v219[3];
        }
        else
        {
          uint64_t v151 = 0;
          uint64_t v152 = 0;
        }
        uint64_t v149 = v151;
        double v150 = v152;
      }
      else
      {
        v115 = 0;
        outlined destroy of Any?((uint64_t)v230);
        uint64_t v149 = (uint64_t)v115;
        double v150 = v115;
      }
      v147 = v150;
      uint64_t v148 = v149;
      if (v150)
      {
        uint64_t v145 = v148;
        unint64_t v146 = v147;
        v9._uint64_t countAndFlagsBits = v148;
        v9._object = v147;
        uint64_t v143 = v147;
        uint64_t v144 = v148;
        uint64_t v227 = v148;
        v228 = v147;
        if (validateSSID(text:)(v9))
        {
          swift_bridgeObjectRelease();
LABEL_45:
          char v259 = 1;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          int v116 = 1;
          return v116 & 1;
        }
        int v10 = v210;
        uint64_t v11 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v10, v11, v202);
        swift_bridgeObjectRetain();
        uint64_t v131 = 32;
        uint64_t v132 = 7;
        uint64_t v12 = swift_allocObject();
        Swift::Double v13 = v143;
        uint64_t v133 = v12;
        *(void *)(v12 + 16) = v144;
        *(void *)(v12 + 24) = v13;
        uint64_t v141 = Logger.logObject.getter();
        int v142 = static os_log_type_t.error.getter();
        v128 = &v225;
        uint64_t v225 = 12;
        unint64_t v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v127 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v129 = v226;
        uint64_t v130 = 17;
        uint64_t v135 = swift_allocObject();
        *(unsigned char *)(v135 + 16) = 32;
        uint64_t v136 = swift_allocObject();
        *(unsigned char *)(v136 + 16) = 8;
        uint64_t v14 = swift_allocObject();
        uint64_t v15 = v133;
        uint64_t v134 = v14;
        *(void *)(v14 + 16) = v196;
        *(void *)(v14 + 24) = v15;
        uint64_t v16 = swift_allocObject();
        uint64_t v17 = v134;
        uint64_t v138 = v16;
        *(void *)(v16 + 16) = v197;
        *(void *)(v16 + 24) = v17;
        uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v137 = _allocateUninitializedArray<A>(_:)();
        uint64_t v139 = v18;
        swift_retain();
        uint64_t v19 = v135;
        uint64_t v20 = v139;
        *uint64_t v139 = v198;
        v20[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v19;
        swift_retain();
        uint64_t v21 = v136;
        int v22 = v139;
        v139[2] = v199;
        v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
        swift_retain();
        BOOL v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v138;
        Swift::Int v24 = v139;
        v139[4] = v200;
        v24[5] = v23;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v141, (os_log_type_t)v142))
        {
          uint64_t v25 = v201;
          uint64_t v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v120 = createStorage<A>(capacity:type:)(0);
          uint64_t v121 = createStorage<A>(capacity:type:)(1);
          v122 = &v224;
          v224 = v119;
          v123 = &v223;
          uint64_t v223 = v120;
          v124 = &v222;
          uint64_t v222 = v121;
          serialize(_:at:)(2, &v224);
          serialize(_:at:)(1, v122);
          v220 = v198;
          uint64_t v221 = v135;
          closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
          uint64_t v125 = v25;
          if (v25)
          {
            __break(1u);
          }
          else
          {
            v220 = v199;
            uint64_t v221 = v136;
            closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)&v224, (uint64_t)&v223, (uint64_t)&v222);
            uint64_t v117 = 0;
            v220 = v200;
            uint64_t v221 = v138;
            closure #1 in osLogInternal(_:log:type:)(&v220, (uint64_t)&v224, (uint64_t)&v223, (uint64_t)&v222);
            _os_log_impl(&dword_255CF7000, v141, (os_log_type_t)v142, "ssid in data directory failed validation: %s", v119, v129);
            destroyStorage<A>(_:count:)(v120, 0, v118);
            destroyStorage<A>(_:count:)(v121, 1, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x25A298650](v119, MEMORY[0x263F8E778]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v203 + 8))(v210, v202);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v116 = 0;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int v116 = 0;
      }
    }
    else
    {
      uint64_t v26 = v208;
      uint64_t v27 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v26, v27, v202);
      swift_bridgeObjectRetain();
      uint64_t v102 = 32;
      uint64_t v103 = 7;
      uint64_t v28 = swift_allocObject();
      Swift::Int v29 = v164;
      uint64_t v104 = v28;
      *(void *)(v28 + 16) = v165;
      *(void *)(v28 + 24) = v29;
      uint64_t v112 = Logger.logObject.getter();
      int v113 = static os_log_type_t.error.getter();
      int v99 = &v242;
      uint64_t v242 = 12;
      unint64_t v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v98 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v100 = v243;
      uint64_t v101 = 17;
      uint64_t v106 = swift_allocObject();
      *(unsigned char *)(v106 + 16) = 32;
      uint64_t v107 = swift_allocObject();
      *(unsigned char *)(v107 + 16) = 8;
      uint64_t v30 = swift_allocObject();
      uint64_t v31 = v104;
      uint64_t v105 = v30;
      *(void *)(v30 + 16) = v191;
      *(void *)(v30 + 24) = v31;
      uint64_t v32 = swift_allocObject();
      uint64_t v33 = v105;
      uint64_t v109 = v32;
      *(void *)(v32 + 16) = v192;
      *(void *)(v32 + 24) = v33;
      uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v108 = _allocateUninitializedArray<A>(_:)();
      uint64_t v110 = v34;
      swift_retain();
      uint64_t v35 = v106;
      char v36 = v110;
      *uint64_t v110 = v193;
      v36[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
      swift_retain();
      uint64_t v37 = v107;
      v38 = v110;
      v110[2] = v194;
      v38[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v37;
      swift_retain();
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
      v40 = v110;
      v110[4] = v195;
      v40[5] = v39;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v112, (os_log_type_t)v113))
      {
        uint64_t v41 = v201;
        v90 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v91 = createStorage<A>(capacity:type:)(0);
        uint64_t v92 = createStorage<A>(capacity:type:)(1);
        v93 = &v241;
        v241 = v90;
        uint64_t v94 = &v240;
        uint64_t v240 = v91;
        unint64_t v95 = &v239;
        uint64_t v239 = v92;
        serialize(_:at:)(2, &v241);
        serialize(_:at:)(1, v93);
        v237 = v193;
        uint64_t v238 = v106;
        closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)v93, (uint64_t)v94, (uint64_t)v95);
        uint64_t v96 = v41;
        if (v41)
        {
          __break(1u);
        }
        else
        {
          v237 = v194;
          uint64_t v238 = v107;
          closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)&v241, (uint64_t)&v240, (uint64_t)&v239);
          uint64_t v88 = 0;
          v237 = v195;
          uint64_t v238 = v109;
          closure #1 in osLogInternal(_:log:type:)(&v237, (uint64_t)&v241, (uint64_t)&v240, (uint64_t)&v239);
          _os_log_impl(&dword_255CF7000, v112, (os_log_type_t)v113, "sessionID in data directory failed validation: %s", v90, v100);
          destroyStorage<A>(_:count:)(v91, 0, v89);
          destroyStorage<A>(_:count:)(v92, 1, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A298650](v90, MEMORY[0x263F8E778]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v203 + 8))(v208, v202);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v116 = 0;
    }
  }
  else
  {
    uint64_t v42 = v206;
    uint64_t v43 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v203 + 16))(v42, v43, v202);
    swift_bridgeObjectRetain();
    uint64_t v75 = 32;
    uint64_t v76 = 7;
    uint64_t v44 = swift_allocObject();
    uint64_t v45 = v176;
    uint64_t v77 = v44;
    *(void *)(v44 + 16) = v177;
    *(void *)(v44 + 24) = v45;
    v85 = Logger.logObject.getter();
    int v86 = static os_log_type_t.error.getter();
    uint64_t v72 = &v253;
    uint64_t v253 = 12;
    unint64_t v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v73 = v254;
    uint64_t v74 = 17;
    uint64_t v79 = swift_allocObject();
    *(unsigned char *)(v79 + 16) = 32;
    uint64_t v80 = swift_allocObject();
    *(unsigned char *)(v80 + 16) = 8;
    uint64_t v46 = swift_allocObject();
    uint64_t v47 = v77;
    uint64_t v78 = v46;
    *(void *)(v46 + 16) = v186;
    *(void *)(v46 + 24) = v47;
    uint64_t v48 = swift_allocObject();
    uint64_t v49 = v78;
    uint64_t v82 = v48;
    *(void *)(v48 + 16) = v187;
    *(void *)(v48 + 24) = v49;
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v81 = _allocateUninitializedArray<A>(_:)();
    uint64_t v83 = v50;
    swift_retain();
    uint64_t v51 = v79;
    unint64_t v52 = v83;
    *uint64_t v83 = v188;
    v52[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v51;
    swift_retain();
    uint64_t v53 = v80;
    uint64_t v54 = v83;
    v83[2] = v189;
    v54[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
    swift_retain();
    uint64_t v55 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v82;
    uint64_t v56 = v83;
    v83[4] = v190;
    v56[5] = v55;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v85, (os_log_type_t)v86))
    {
      uint64_t v57 = v201;
      Swift::Int v63 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v64 = createStorage<A>(capacity:type:)(0);
      uint64_t v65 = createStorage<A>(capacity:type:)(1);
      char v66 = &v252;
      v252 = v63;
      uint64_t v67 = &v251;
      uint64_t v251 = v64;
      uint64_t v68 = &v250;
      uint64_t v250 = v65;
      serialize(_:at:)(2, &v252);
      serialize(_:at:)(1, v66);
      v248 = v188;
      uint64_t v249 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68);
      uint64_t v69 = v57;
      if (v57)
      {
        __break(1u);
      }
      else
      {
        v248 = v189;
        uint64_t v249 = v80;
        closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)&v252, (uint64_t)&v251, (uint64_t)&v250);
        uint64_t v61 = 0;
        v248 = v190;
        uint64_t v249 = v82;
        closure #1 in osLogInternal(_:log:type:)(&v248, (uint64_t)&v252, (uint64_t)&v251, (uint64_t)&v250);
        _os_log_impl(&dword_255CF7000, v85, (os_log_type_t)v86, "AppName in data directory failed validation: %s", v63, v73);
        destroyStorage<A>(_:count:)(v64, 0, v62);
        destroyStorage<A>(_:count:)(v65, 1, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v63, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v203 + 8))(v206, v202);
    swift_bridgeObjectRelease();
    int v116 = 0;
  }
  return v116 & 1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #1 in checkValidTextInputs(data:)()
{
}

uint64_t sub_255D00B3C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #1 in checkValidTextInputs(data:)();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #2 in checkValidTextInputs(data:)()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> implicit closure #3 in checkValidTextInputs(data:)()
{
}

Swift::Bool __swiftcall checkValidNumericInputRange(data:)(Swift::OpaquePointer data)
{
  uint64_t v546 = MEMORY[0x270FA5388](data._rawValue);
  v477 = partial apply for implicit closure #11 in checkValidNumericInputRange(data:);
  v478 = _sSiIegd_SiIegr_TRTA_0;
  v479 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v480 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v481 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v482 = partial apply for implicit closure #13 in checkValidNumericInputRange(data:);
  v483 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v484 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v485 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v486 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v487 = partial apply for implicit closure #15 in checkValidNumericInputRange(data:);
  v488 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v489 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v490 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v491 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v492 = partial apply for implicit closure #17 in checkValidNumericInputRange(data:);
  v493 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v494 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v495 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v496 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v497 = partial apply for implicit closure #19 in checkValidNumericInputRange(data:);
  v498 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v499 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v500 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v501 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v502 = partial apply for implicit closure #21 in checkValidNumericInputRange(data:);
  v503 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v504 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v505 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v506 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v507 = partial apply for implicit closure #23 in checkValidNumericInputRange(data:);
  v508 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
  v509 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v510 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v511 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v512 = partial apply for implicit closure #25 in checkValidNumericInputRange(data:);
  v513 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  v514 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v515 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v516 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v517 = partial apply for implicit closure #27 in checkValidNumericInputRange(data:);
  v518 = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  v519 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v520 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  v521 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
  uint64_t v675 = 0;
  char v674 = 0;
  Swift::Int v668 = 0;
  Swift::Int v662 = 0;
  Swift::Int v656 = 0;
  Swift::Int v650 = 0;
  Swift::Int v644 = 0;
  Swift::Int v638 = 0;
  double v632 = 0.0;
  double v626 = 0.0;
  Swift::Int v620 = 0;
  uint64_t v522 = 0;
  uint64_t v523 = type metadata accessor for Logger();
  uint64_t v524 = *(void *)(v523 - 8);
  uint64_t v525 = v523 - 8;
  uint64_t v526 = *(void *)(v524 + 64);
  unint64_t v527 = (v526 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v546);
  v528 = (char *)&v145 - v527;
  unint64_t v529 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  v530 = (char *)&v145 - v529;
  unint64_t v531 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v532 = (char *)&v145 - v531;
  unint64_t v533 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v534 = (char *)&v145 - v533;
  unint64_t v535 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v536 = (char *)&v145 - v535;
  unint64_t v537 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v538 = (char *)&v145 - v537;
  unint64_t v539 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v540 = (char *)&v145 - v539;
  unint64_t v541 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v542 = (char *)&v145 - v541;
  unint64_t v543 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v544 = (char *)&v145 - v543;
  uint64_t v675 = v17;
  char v674 = 0;
  Swift::String v545 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v547 = &v671;
  Swift::String v671 = v545;
  MEMORY[0x25A298290](v672);
  outlined destroy of String();
  if (v672[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v475 = v548;
      int v476 = 0;
    }
    else
    {
      Swift::Int v475 = 0;
      int v476 = 1;
    }
    Swift::Int v473 = v475;
    int v474 = v476;
  }
  else
  {
    Swift::Int v145 = 0;
    outlined destroy of Any?((uint64_t)v672);
    Swift::Int v473 = v145;
    int v474 = 1;
  }
  Swift::Int v669 = v473;
  char v670 = v474 & 1;
  if (v474) {
    Swift::Int v673 = 0;
  }
  else {
    Swift::Int v673 = v669;
  }
  Swift::Int v470 = v673;
  Swift::Int v668 = v673;
  Swift::String v471 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v472 = &v665;
  Swift::String v665 = v471;
  MEMORY[0x25A298290](v666);
  outlined destroy of String();
  if (v666[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v468 = v549;
      int v469 = 0;
    }
    else
    {
      Swift::Int v468 = 0;
      int v469 = 1;
    }
    Swift::Int v466 = v468;
    int v467 = v469;
  }
  else
  {
    Swift::Int v146 = 0;
    outlined destroy of Any?((uint64_t)v666);
    Swift::Int v466 = v146;
    int v467 = 1;
  }
  Swift::Int v663 = v466;
  char v664 = v467 & 1;
  if (v467) {
    Swift::Int v667 = 0;
  }
  else {
    Swift::Int v667 = v663;
  }
  Swift::Int v463 = v667;
  Swift::Int v662 = v667;
  Swift::String v464 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v465 = &v659;
  Swift::String v659 = v464;
  MEMORY[0x25A298290](v660);
  outlined destroy of String();
  if (v660[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v461 = v550;
      int v462 = 0;
    }
    else
    {
      Swift::Int v461 = 0;
      int v462 = 1;
    }
    Swift::Int v459 = v461;
    int v460 = v462;
  }
  else
  {
    Swift::Int v147 = 0;
    outlined destroy of Any?((uint64_t)v660);
    Swift::Int v459 = v147;
    int v460 = 1;
  }
  Swift::Int v657 = v459;
  char v658 = v460 & 1;
  if (v460) {
    Swift::Int v661 = 0;
  }
  else {
    Swift::Int v661 = v657;
  }
  Swift::Int v456 = v661;
  Swift::Int v656 = v661;
  Swift::String v457 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v458 = &v653;
  Swift::String v653 = v457;
  MEMORY[0x25A298290](v654);
  outlined destroy of String();
  if (v654[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v454 = v551;
      int v455 = 0;
    }
    else
    {
      Swift::Int v454 = 0;
      int v455 = 1;
    }
    Swift::Int v452 = v454;
    int v453 = v455;
  }
  else
  {
    Swift::Int v148 = 0;
    outlined destroy of Any?((uint64_t)v654);
    Swift::Int v452 = v148;
    int v453 = 1;
  }
  Swift::Int v651 = v452;
  char v652 = v453 & 1;
  if (v453) {
    Swift::Int v655 = 0;
  }
  else {
    Swift::Int v655 = v651;
  }
  Swift::Int v449 = v655;
  Swift::Int v650 = v655;
  Swift::String v450 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v451 = &v647;
  Swift::String v647 = v450;
  MEMORY[0x25A298290](v648);
  outlined destroy of String();
  if (v648[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v447 = v552;
      int v448 = 0;
    }
    else
    {
      Swift::Int v447 = 0;
      int v448 = 1;
    }
    Swift::Int v445 = v447;
    int v446 = v448;
  }
  else
  {
    Swift::Int v149 = 0;
    outlined destroy of Any?((uint64_t)v648);
    Swift::Int v445 = v149;
    int v446 = 1;
  }
  Swift::Int v645 = v445;
  char v646 = v446 & 1;
  if (v446) {
    Swift::Int v649 = 0;
  }
  else {
    Swift::Int v649 = v645;
  }
  Swift::Int v442 = v649;
  Swift::Int v644 = v649;
  Swift::String v443 = *kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v444 = &v641;
  Swift::String v641 = v443;
  MEMORY[0x25A298290](v642);
  outlined destroy of String();
  if (v642[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v440 = v553;
      int v441 = 0;
    }
    else
    {
      Swift::Int v440 = 0;
      int v441 = 1;
    }
    Swift::Int v438 = v440;
    int v439 = v441;
  }
  else
  {
    Swift::Int v150 = 0;
    outlined destroy of Any?((uint64_t)v642);
    Swift::Int v438 = v150;
    int v439 = 1;
  }
  Swift::Int v639 = v438;
  char v640 = v439 & 1;
  if (v439) {
    Swift::Int v643 = 0;
  }
  else {
    Swift::Int v643 = v639;
  }
  Swift::Int v435 = v643;
  Swift::Int v638 = v643;
  Swift::String v436 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v437 = &v635;
  Swift::String v635 = v436;
  MEMORY[0x25A298290](v636);
  outlined destroy of String();
  if (v636[3])
  {
    if (swift_dynamicCast())
    {
      double v433 = v554;
      int v434 = 0;
    }
    else
    {
      double v433 = 0.0;
      int v434 = 1;
    }
    double v431 = v433;
    int v432 = v434;
  }
  else
  {
    double v151 = 0.0;
    outlined destroy of Any?((uint64_t)v636);
    double v431 = v151;
    int v432 = 1;
  }
  double v633 = v431;
  char v634 = v432 & 1;
  if (v432) {
    double v637 = 0.0;
  }
  else {
    double v637 = v633;
  }
  Swift::Double v428 = v637;
  double v632 = v637;
  Swift::String v429 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v430 = &v629;
  Swift::String v629 = v429;
  MEMORY[0x25A298290](v630);
  outlined destroy of String();
  if (v630[3])
  {
    if (swift_dynamicCast())
    {
      double v426 = v555;
      int v427 = 0;
    }
    else
    {
      double v426 = 0.0;
      int v427 = 1;
    }
    double v424 = v426;
    int v425 = v427;
  }
  else
  {
    double v152 = 0.0;
    outlined destroy of Any?((uint64_t)v630);
    double v424 = v152;
    int v425 = 1;
  }
  double v627 = v424;
  char v628 = v425 & 1;
  if (v425) {
    double v631 = 0.0;
  }
  else {
    double v631 = v627;
  }
  Swift::Double v421 = v631;
  double v626 = v631;
  Swift::String v422 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v423 = &v623;
  Swift::String v623 = v422;
  MEMORY[0x25A298290](v624);
  outlined destroy of String();
  if (v624[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v419 = v556;
      int v420 = 0;
    }
    else
    {
      Swift::Int v419 = 0;
      int v420 = 1;
    }
    Swift::Int v417 = v419;
    int v418 = v420;
  }
  else
  {
    Swift::Int v153 = 0;
    outlined destroy of Any?((uint64_t)v624);
    Swift::Int v417 = v153;
    int v418 = 1;
  }
  Swift::Int v621 = v417;
  char v622 = v418 & 1;
  if (v418) {
    Swift::Int v625 = 0;
  }
  else {
    Swift::Int v625 = v621;
  }
  Swift::Int v416 = v625;
  Swift::Int v620 = v625;
  if (v470 <= 0 && v470 >= *minSignalStrength.unsafeMutableAddressor())
  {
    if (v463 <= 0 && v463 >= *minSignalStrength.unsafeMutableAddressor())
    {
      if (v456 <= 0 && v456 >= *minSignalStrength.unsafeMutableAddressor())
      {
        if (v449 <= 0 && v449 >= *minSignalStrength.unsafeMutableAddressor())
        {
          if (v442 <= 0 && v442 >= *minNoise.unsafeMutableAddressor())
          {
            if (v435 >= 0 && *maxBars.unsafeMutableAddressor() >= v435)
            {
              if (v428 >= 0.0 && v428 <= *maxRxRate.unsafeMutableAddressor())
              {
                if (v421 >= 0.0 && v421 <= *maxTxRate.unsafeMutableAddressor())
                {
                  if (v416 > 0 && *maxThroughput.unsafeMutableAddressor() >= v416)
                  {
                    char v674 = 1;
                    int v406 = 1;
                  }
                  else
                  {
                    uint64_t v18 = v544;
                    uint64_t v19 = logger.unsafeMutableAddressor();
                    (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v18, v19, v523);
                    uint64_t v395 = 7;
                    uint64_t v396 = swift_allocObject();
                    *(void *)(v396 + 16) = v416;
                    v404 = Logger.logObject.getter();
                    int v405 = static os_log_type_t.error.getter();
                    v391 = &v562;
                    uint64_t v562 = 12;
                    unint64_t v389 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    unint64_t v390 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                    lazy protocol witness table accessor for type Int and conformance Int();
                    UnsignedInteger<>.init<A>(_:)();
                    uint32_t v392 = v563;
                    uint64_t v393 = 17;
                    uint64_t v398 = swift_allocObject();
                    *(unsigned char *)(v398 + 16) = 0;
                    uint64_t v399 = swift_allocObject();
                    *(unsigned char *)(v399 + 16) = 8;
                    uint64_t v394 = 32;
                    uint64_t v20 = swift_allocObject();
                    uint64_t v21 = v396;
                    uint64_t v397 = v20;
                    *(void *)(v20 + 16) = v517;
                    *(void *)(v20 + 24) = v21;
                    uint64_t v22 = swift_allocObject();
                    uint64_t v23 = v397;
                    uint64_t v401 = v22;
                    *(void *)(v22 + 16) = v518;
                    *(void *)(v22 + 24) = v23;
                    uint64_t v403 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                    uint64_t v400 = _allocateUninitializedArray<A>(_:)();
                    v402 = v24;
                    swift_retain();
                    uint64_t v25 = v398;
                    uint64_t v26 = v402;
                    *v402 = v519;
                    v26[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v25;
                    swift_retain();
                    uint64_t v27 = v399;
                    uint64_t v28 = v402;
                    v402[2] = v520;
                    v28[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v27;
                    swift_retain();
                    Swift::Int v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v401;
                    uint64_t v30 = v402;
                    v402[4] = v521;
                    v30[5] = v29;
                    _finalizeUninitializedArray<A>(_:)();
                    swift_bridgeObjectRelease();
                    if (os_log_type_enabled(v404, (os_log_type_t)v405))
                    {
                      uint64_t v31 = v522;
                      v382 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                      uint64_t v380 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                      uint64_t v381 = 0;
                      uint64_t v383 = createStorage<A>(capacity:type:)(0);
                      uint64_t v384 = createStorage<A>(capacity:type:)(v381);
                      v385 = &v561;
                      v561 = v382;
                      v386 = &v560;
                      uint64_t v560 = v383;
                      v387 = &v559;
                      uint64_t v559 = v384;
                      serialize(_:at:)(0, &v561);
                      serialize(_:at:)(1, v385);
                      v557 = v519;
                      uint64_t v558 = v398;
                      closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)v385, (uint64_t)v386, (uint64_t)v387);
                      uint64_t v388 = v31;
                      if (v31)
                      {
                        __break(1u);
                      }
                      else
                      {
                        v557 = v520;
                        uint64_t v558 = v399;
                        closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)&v561, (uint64_t)&v560, (uint64_t)&v559);
                        uint64_t v379 = 0;
                        v557 = v521;
                        uint64_t v558 = v401;
                        closure #1 in osLogInternal(_:log:type:)(&v557, (uint64_t)&v561, (uint64_t)&v560, (uint64_t)&v559);
                        _os_log_impl(&dword_255CF7000, v404, (os_log_type_t)v405, "throughput_true in data directory failed validation: %ld", v382, v392);
                        uint64_t v378 = 0;
                        destroyStorage<A>(_:count:)(v383, 0, v380);
                        destroyStorage<A>(_:count:)(v384, v378, MEMORY[0x263F8EE58] + 8);
                        MEMORY[0x25A298650](v382, MEMORY[0x263F8E778]);
                        swift_release();
                        swift_release();
                        swift_release();
                      }
                    }
                    else
                    {
                      swift_release();
                      swift_release();
                      swift_release();
                    }

                    (*(void (**)(char *, uint64_t))(v524 + 8))(v544, v523);
                    int v406 = 0;
                  }
                }
                else
                {
                  uint64_t v32 = v542;
                  uint64_t v33 = logger.unsafeMutableAddressor();
                  (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v32, v33, v523);
                  uint64_t v367 = 7;
                  uint64_t v368 = swift_allocObject();
                  *(Swift::Double *)(v368 + 16) = v421;
                  v376 = Logger.logObject.getter();
                  int v377 = static os_log_type_t.error.getter();
                  v363 = &v569;
                  uint64_t v569 = 12;
                  unint64_t v361 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  unint64_t v362 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                  lazy protocol witness table accessor for type Int and conformance Int();
                  UnsignedInteger<>.init<A>(_:)();
                  uint32_t v364 = v570;
                  uint64_t v365 = 17;
                  uint64_t v370 = swift_allocObject();
                  *(unsigned char *)(v370 + 16) = 0;
                  uint64_t v371 = swift_allocObject();
                  *(unsigned char *)(v371 + 16) = 8;
                  uint64_t v366 = 32;
                  uint64_t v34 = swift_allocObject();
                  uint64_t v35 = v368;
                  uint64_t v369 = v34;
                  *(void *)(v34 + 16) = v512;
                  *(void *)(v34 + 24) = v35;
                  uint64_t v36 = swift_allocObject();
                  uint64_t v37 = v369;
                  uint64_t v373 = v36;
                  *(void *)(v36 + 16) = v513;
                  *(void *)(v36 + 24) = v37;
                  uint64_t v375 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                  uint64_t v372 = _allocateUninitializedArray<A>(_:)();
                  v374 = v38;
                  swift_retain();
                  uint64_t v39 = v370;
                  v40 = v374;
                  *v374 = v514;
                  v40[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v39;
                  swift_retain();
                  uint64_t v41 = v371;
                  uint64_t v42 = v374;
                  v374[2] = v515;
                  v42[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v41;
                  swift_retain();
                  uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v373;
                  uint64_t v44 = v374;
                  v374[4] = v516;
                  v44[5] = v43;
                  _finalizeUninitializedArray<A>(_:)();
                  swift_bridgeObjectRelease();
                  if (os_log_type_enabled(v376, (os_log_type_t)v377))
                  {
                    uint64_t v45 = v522;
                    v354 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                    uint64_t v352 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                    uint64_t v353 = 0;
                    uint64_t v355 = createStorage<A>(capacity:type:)(0);
                    uint64_t v356 = createStorage<A>(capacity:type:)(v353);
                    v357 = &v568;
                    v568 = v354;
                    v358 = &v567;
                    uint64_t v567 = v355;
                    v359 = &v566;
                    uint64_t v566 = v356;
                    serialize(_:at:)(0, &v568);
                    serialize(_:at:)(1, v357);
                    v564 = v514;
                    uint64_t v565 = v370;
                    closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)v357, (uint64_t)v358, (uint64_t)v359);
                    uint64_t v360 = v45;
                    if (v45)
                    {
                      __break(1u);
                    }
                    else
                    {
                      v564 = v515;
                      uint64_t v565 = v371;
                      closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)&v568, (uint64_t)&v567, (uint64_t)&v566);
                      uint64_t v351 = 0;
                      v564 = v516;
                      uint64_t v565 = v373;
                      closure #1 in osLogInternal(_:log:type:)(&v564, (uint64_t)&v568, (uint64_t)&v567, (uint64_t)&v566);
                      _os_log_impl(&dword_255CF7000, v376, (os_log_type_t)v377, "txRate in data directory failed validation: %f", v354, v364);
                      uint64_t v350 = 0;
                      destroyStorage<A>(_:count:)(v355, 0, v352);
                      destroyStorage<A>(_:count:)(v356, v350, MEMORY[0x263F8EE58] + 8);
                      MEMORY[0x25A298650](v354, MEMORY[0x263F8E778]);
                      swift_release();
                      swift_release();
                      swift_release();
                    }
                  }
                  else
                  {
                    swift_release();
                    swift_release();
                    swift_release();
                  }

                  (*(void (**)(char *, uint64_t))(v524 + 8))(v542, v523);
                  int v406 = 0;
                }
              }
              else
              {
                uint64_t v46 = v540;
                uint64_t v47 = logger.unsafeMutableAddressor();
                (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v46, v47, v523);
                uint64_t v339 = 7;
                uint64_t v340 = swift_allocObject();
                *(Swift::Double *)(v340 + 16) = v428;
                v348 = Logger.logObject.getter();
                int v349 = static os_log_type_t.error.getter();
                v335 = &v576;
                uint64_t v576 = 12;
                unint64_t v333 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                unint64_t v334 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
                lazy protocol witness table accessor for type Int and conformance Int();
                UnsignedInteger<>.init<A>(_:)();
                uint32_t v336 = v577;
                uint64_t v337 = 17;
                uint64_t v342 = swift_allocObject();
                *(unsigned char *)(v342 + 16) = 0;
                uint64_t v343 = swift_allocObject();
                *(unsigned char *)(v343 + 16) = 8;
                uint64_t v338 = 32;
                uint64_t v48 = swift_allocObject();
                uint64_t v49 = v340;
                uint64_t v341 = v48;
                *(void *)(v48 + 16) = v507;
                *(void *)(v48 + 24) = v49;
                uint64_t v50 = swift_allocObject();
                uint64_t v51 = v341;
                uint64_t v345 = v50;
                *(void *)(v50 + 16) = v508;
                *(void *)(v50 + 24) = v51;
                uint64_t v347 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
                uint64_t v344 = _allocateUninitializedArray<A>(_:)();
                v346 = v52;
                swift_retain();
                uint64_t v53 = v342;
                uint64_t v54 = v346;
                *v346 = v509;
                v54[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
                swift_retain();
                uint64_t v55 = v343;
                uint64_t v56 = v346;
                v346[2] = v510;
                v56[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v55;
                swift_retain();
                uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v345;
                uint64_t v58 = v346;
                v346[4] = v511;
                v58[5] = v57;
                _finalizeUninitializedArray<A>(_:)();
                swift_bridgeObjectRelease();
                if (os_log_type_enabled(v348, (os_log_type_t)v349))
                {
                  uint64_t v59 = v522;
                  v326 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                  uint64_t v324 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  uint64_t v325 = 0;
                  uint64_t v327 = createStorage<A>(capacity:type:)(0);
                  uint64_t v328 = createStorage<A>(capacity:type:)(v325);
                  v329 = &v575;
                  v575 = v326;
                  v330 = &v574;
                  uint64_t v574 = v327;
                  v331 = &v573;
                  uint64_t v573 = v328;
                  serialize(_:at:)(0, &v575);
                  serialize(_:at:)(1, v329);
                  v571 = v509;
                  uint64_t v572 = v342;
                  closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)v329, (uint64_t)v330, (uint64_t)v331);
                  uint64_t v332 = v59;
                  if (v59)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v571 = v510;
                    uint64_t v572 = v343;
                    closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)&v575, (uint64_t)&v574, (uint64_t)&v573);
                    uint64_t v323 = 0;
                    v571 = v511;
                    uint64_t v572 = v345;
                    closure #1 in osLogInternal(_:log:type:)(&v571, (uint64_t)&v575, (uint64_t)&v574, (uint64_t)&v573);
                    _os_log_impl(&dword_255CF7000, v348, (os_log_type_t)v349, "rxRate in data directory failed validation: %f", v326, v336);
                    uint64_t v322 = 0;
                    destroyStorage<A>(_:count:)(v327, 0, v324);
                    destroyStorage<A>(_:count:)(v328, v322, MEMORY[0x263F8EE58] + 8);
                    MEMORY[0x25A298650](v326, MEMORY[0x263F8E778]);
                    swift_release();
                    swift_release();
                    swift_release();
                  }
                }
                else
                {
                  swift_release();
                  swift_release();
                  swift_release();
                }

                (*(void (**)(char *, uint64_t))(v524 + 8))(v540, v523);
                int v406 = 0;
              }
            }
            else
            {
              unint64_t v60 = v538;
              uint64_t v61 = logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v60, v61, v523);
              uint64_t v311 = 7;
              uint64_t v312 = swift_allocObject();
              *(void *)(v312 + 16) = v435;
              v320 = Logger.logObject.getter();
              int v321 = static os_log_type_t.error.getter();
              v307 = &v583;
              uint64_t v583 = 12;
              unint64_t v305 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              unint64_t v306 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              uint32_t v308 = v584;
              uint64_t v309 = 17;
              uint64_t v314 = swift_allocObject();
              *(unsigned char *)(v314 + 16) = 0;
              uint64_t v315 = swift_allocObject();
              *(unsigned char *)(v315 + 16) = 8;
              uint64_t v310 = 32;
              uint64_t v62 = swift_allocObject();
              uint64_t v63 = v312;
              uint64_t v313 = v62;
              *(void *)(v62 + 16) = v502;
              *(void *)(v62 + 24) = v63;
              uint64_t v64 = swift_allocObject();
              uint64_t v65 = v313;
              uint64_t v317 = v64;
              *(void *)(v64 + 16) = v503;
              *(void *)(v64 + 24) = v65;
              uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              uint64_t v316 = _allocateUninitializedArray<A>(_:)();
              v318 = v66;
              swift_retain();
              uint64_t v67 = v314;
              uint64_t v68 = v318;
              *v318 = v504;
              v68[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v67;
              swift_retain();
              uint64_t v69 = v315;
              unint64_t v70 = v318;
              v318[2] = v505;
              v70[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v69;
              swift_retain();
              unint64_t v71 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v317;
              uint64_t v72 = v318;
              v318[4] = v506;
              v72[5] = v71;
              _finalizeUninitializedArray<A>(_:)();
              swift_bridgeObjectRelease();
              if (os_log_type_enabled(v320, (os_log_type_t)v321))
              {
                uint64_t v73 = v522;
                v298 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                uint64_t v296 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                uint64_t v297 = 0;
                uint64_t v299 = createStorage<A>(capacity:type:)(0);
                uint64_t v300 = createStorage<A>(capacity:type:)(v297);
                v301 = &v582;
                v582 = v298;
                v302 = &v581;
                uint64_t v581 = v299;
                v303 = &v580;
                uint64_t v580 = v300;
                serialize(_:at:)(0, &v582);
                serialize(_:at:)(1, v301);
                v578 = v504;
                uint64_t v579 = v314;
                closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)v301, (uint64_t)v302, (uint64_t)v303);
                uint64_t v304 = v73;
                if (v73)
                {
                  __break(1u);
                }
                else
                {
                  v578 = v505;
                  uint64_t v579 = v315;
                  closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)&v582, (uint64_t)&v581, (uint64_t)&v580);
                  uint64_t v295 = 0;
                  v578 = v506;
                  uint64_t v579 = v317;
                  closure #1 in osLogInternal(_:log:type:)(&v578, (uint64_t)&v582, (uint64_t)&v581, (uint64_t)&v580);
                  _os_log_impl(&dword_255CF7000, v320, (os_log_type_t)v321, "bars in data directory failed validation: %ld", v298, v308);
                  uint64_t v294 = 0;
                  destroyStorage<A>(_:count:)(v299, 0, v296);
                  destroyStorage<A>(_:count:)(v300, v294, MEMORY[0x263F8EE58] + 8);
                  MEMORY[0x25A298650](v298, MEMORY[0x263F8E778]);
                  swift_release();
                  swift_release();
                  swift_release();
                }
              }
              else
              {
                swift_release();
                swift_release();
                swift_release();
              }

              (*(void (**)(char *, uint64_t))(v524 + 8))(v538, v523);
              int v406 = 0;
            }
          }
          else
          {
            uint64_t v74 = v536;
            uint64_t v75 = logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v74, v75, v523);
            uint64_t v283 = 7;
            uint64_t v284 = swift_allocObject();
            *(void *)(v284 + 16) = v442;
            v292 = Logger.logObject.getter();
            int v293 = static os_log_type_t.error.getter();
            v279 = &v590;
            uint64_t v590 = 12;
            unint64_t v277 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            unint64_t v278 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            uint32_t v280 = v591;
            uint64_t v281 = 17;
            uint64_t v286 = swift_allocObject();
            *(unsigned char *)(v286 + 16) = 0;
            uint64_t v287 = swift_allocObject();
            *(unsigned char *)(v287 + 16) = 8;
            uint64_t v282 = 32;
            uint64_t v76 = swift_allocObject();
            uint64_t v77 = v284;
            uint64_t v285 = v76;
            *(void *)(v76 + 16) = v497;
            *(void *)(v76 + 24) = v77;
            uint64_t v78 = swift_allocObject();
            uint64_t v79 = v285;
            uint64_t v289 = v78;
            *(void *)(v78 + 16) = v498;
            *(void *)(v78 + 24) = v79;
            uint64_t v291 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            uint64_t v288 = _allocateUninitializedArray<A>(_:)();
            v290 = v80;
            swift_retain();
            uint64_t v81 = v286;
            uint64_t v82 = v290;
            *v290 = v499;
            v82[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v81;
            swift_retain();
            uint64_t v83 = v287;
            uint64_t v84 = v290;
            v290[2] = v500;
            v84[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v83;
            swift_retain();
            v85 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v289;
            int v86 = v290;
            v290[4] = v501;
            v86[5] = v85;
            _finalizeUninitializedArray<A>(_:)();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v292, (os_log_type_t)v293))
            {
              uint64_t v87 = v522;
              v270 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              uint64_t v268 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              uint64_t v269 = 0;
              uint64_t v271 = createStorage<A>(capacity:type:)(0);
              uint64_t v272 = createStorage<A>(capacity:type:)(v269);
              v273 = &v589;
              v589 = v270;
              v274 = &v588;
              uint64_t v588 = v271;
              v275 = &v587;
              uint64_t v587 = v272;
              serialize(_:at:)(0, &v589);
              serialize(_:at:)(1, v273);
              v585 = v499;
              uint64_t v586 = v286;
              closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)v273, (uint64_t)v274, (uint64_t)v275);
              uint64_t v276 = v87;
              if (v87)
              {
                __break(1u);
              }
              else
              {
                v585 = v500;
                uint64_t v586 = v287;
                closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)&v589, (uint64_t)&v588, (uint64_t)&v587);
                uint64_t v267 = 0;
                v585 = v501;
                uint64_t v586 = v289;
                closure #1 in osLogInternal(_:log:type:)(&v585, (uint64_t)&v589, (uint64_t)&v588, (uint64_t)&v587);
                _os_log_impl(&dword_255CF7000, v292, (os_log_type_t)v293, "noise in data directory failed validation: %ld", v270, v280);
                uint64_t v266 = 0;
                destroyStorage<A>(_:count:)(v271, 0, v268);
                destroyStorage<A>(_:count:)(v272, v266, MEMORY[0x263F8EE58] + 8);
                MEMORY[0x25A298650](v270, MEMORY[0x263F8E778]);
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            (*(void (**)(char *, uint64_t))(v524 + 8))(v536, v523);
            int v406 = 0;
          }
        }
        else
        {
          uint64_t v88 = v534;
          uint64_t v89 = logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v88, v89, v523);
          uint64_t v255 = 7;
          uint64_t v256 = swift_allocObject();
          *(void *)(v256 + 16) = v449;
          v264 = Logger.logObject.getter();
          int v265 = static os_log_type_t.error.getter();
          uint64_t v251 = &v597;
          uint64_t v597 = 12;
          unint64_t v249 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v250 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v252 = v598;
          uint64_t v253 = 17;
          uint64_t v258 = swift_allocObject();
          *(unsigned char *)(v258 + 16) = 0;
          uint64_t v259 = swift_allocObject();
          *(unsigned char *)(v259 + 16) = 8;
          uint64_t v254 = 32;
          uint64_t v90 = swift_allocObject();
          uint64_t v91 = v256;
          uint64_t v257 = v90;
          *(void *)(v90 + 16) = v492;
          *(void *)(v90 + 24) = v91;
          uint64_t v92 = swift_allocObject();
          uint64_t v93 = v257;
          uint64_t v261 = v92;
          *(void *)(v92 + 16) = v493;
          *(void *)(v92 + 24) = v93;
          uint64_t v263 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v260 = _allocateUninitializedArray<A>(_:)();
          v262 = v94;
          swift_retain();
          uint64_t v95 = v258;
          uint64_t v96 = v262;
          *v262 = v494;
          v96[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v95;
          swift_retain();
          uint64_t v97 = v259;
          unint64_t v98 = v262;
          v262[2] = v495;
          v98[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v97;
          swift_retain();
          int v99 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v261;
          uint32_t v100 = v262;
          v262[4] = v496;
          v100[5] = v99;
          _finalizeUninitializedArray<A>(_:)();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v264, (os_log_type_t)v265))
          {
            uint64_t v101 = v522;
            uint64_t v242 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v241 = 0;
            uint64_t v243 = createStorage<A>(capacity:type:)(0);
            uint64_t v244 = createStorage<A>(capacity:type:)(v241);
            v245 = &v596;
            v596 = v242;
            Swift::String v246 = &v595;
            uint64_t v595 = v243;
            v247 = &v594;
            uint64_t v594 = v244;
            serialize(_:at:)(0, &v596);
            serialize(_:at:)(1, v245);
            v592 = v494;
            uint64_t v593 = v258;
            closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)v245, (uint64_t)v246, (uint64_t)v247);
            uint64_t v248 = v101;
            if (v101)
            {
              __break(1u);
            }
            else
            {
              v592 = v495;
              uint64_t v593 = v259;
              closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)&v596, (uint64_t)&v595, (uint64_t)&v594);
              uint64_t v239 = 0;
              v592 = v496;
              uint64_t v593 = v261;
              closure #1 in osLogInternal(_:log:type:)(&v592, (uint64_t)&v596, (uint64_t)&v595, (uint64_t)&v594);
              _os_log_impl(&dword_255CF7000, v264, (os_log_type_t)v265, "rscp in data directory failed validation: %ld", v242, v252);
              uint64_t v238 = 0;
              destroyStorage<A>(_:count:)(v243, 0, v240);
              destroyStorage<A>(_:count:)(v244, v238, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x25A298650](v242, MEMORY[0x263F8E778]);
              swift_release();
              swift_release();
              swift_release();
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(char *, uint64_t))(v524 + 8))(v534, v523);
          int v406 = 0;
        }
      }
      else
      {
        uint64_t v102 = v532;
        uint64_t v103 = logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v102, v103, v523);
        uint64_t v227 = 7;
        uint64_t v228 = swift_allocObject();
        *(void *)(v228 + 16) = v456;
        v236 = Logger.logObject.getter();
        int v237 = static os_log_type_t.error.getter();
        uint64_t v223 = &v604;
        uint64_t v604 = 12;
        unint64_t v221 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v222 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v224 = v605;
        uint64_t v225 = 17;
        uint64_t v230 = swift_allocObject();
        *(unsigned char *)(v230 + 16) = 0;
        uint64_t v231 = swift_allocObject();
        *(unsigned char *)(v231 + 16) = 8;
        uint64_t v226 = 32;
        uint64_t v104 = swift_allocObject();
        uint64_t v105 = v228;
        uint64_t v229 = v104;
        *(void *)(v104 + 16) = v487;
        *(void *)(v104 + 24) = v105;
        uint64_t v106 = swift_allocObject();
        uint64_t v107 = v229;
        uint64_t v233 = v106;
        *(void *)(v106 + 16) = v488;
        *(void *)(v106 + 24) = v107;
        uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v232 = _allocateUninitializedArray<A>(_:)();
        char v234 = v108;
        swift_retain();
        uint64_t v109 = v230;
        uint64_t v110 = v234;
        *char v234 = v489;
        v110[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v109;
        swift_retain();
        uint64_t v111 = v231;
        uint64_t v112 = v234;
        v234[2] = v490;
        v112[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v111;
        swift_retain();
        int v113 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v233;
        uint64_t v114 = v234;
        v234[4] = v491;
        v114[5] = v113;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v236, (os_log_type_t)v237))
        {
          uint64_t v115 = v522;
          uint64_t v214 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v213 = 0;
          uint64_t v215 = createStorage<A>(capacity:type:)(0);
          uint64_t v216 = createStorage<A>(capacity:type:)(v213);
          v217 = &v603;
          v603 = v214;
          uint64_t v218 = &v602;
          uint64_t v602 = v215;
          v219 = &v601;
          uint64_t v601 = v216;
          serialize(_:at:)(0, &v603);
          serialize(_:at:)(1, v217);
          v599 = v489;
          uint64_t v600 = v230;
          closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219);
          uint64_t v220 = v115;
          if (v115)
          {
            __break(1u);
          }
          else
          {
            v599 = v490;
            uint64_t v600 = v231;
            closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)&v603, (uint64_t)&v602, (uint64_t)&v601);
            uint64_t v211 = 0;
            v599 = v491;
            uint64_t v600 = v233;
            closure #1 in osLogInternal(_:log:type:)(&v599, (uint64_t)&v603, (uint64_t)&v602, (uint64_t)&v601);
            _os_log_impl(&dword_255CF7000, v236, (os_log_type_t)v237, "rsrq in data directory failed validation: %ld", v214, v224);
            uint64_t v210 = 0;
            destroyStorage<A>(_:count:)(v215, 0, v212);
            destroyStorage<A>(_:count:)(v216, v210, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x25A298650](v214, MEMORY[0x263F8E778]);
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v524 + 8))(v532, v523);
        int v406 = 0;
      }
    }
    else
    {
      int v116 = v530;
      uint64_t v117 = logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v116, v117, v523);
      uint64_t v199 = 7;
      uint64_t v200 = swift_allocObject();
      *(void *)(v200 + 16) = v463;
      v208 = Logger.logObject.getter();
      int v209 = static os_log_type_t.error.getter();
      v195 = &v611;
      uint64_t v611 = 12;
      unint64_t v193 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v194 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v196 = v612;
      uint64_t v197 = 17;
      uint64_t v202 = swift_allocObject();
      *(unsigned char *)(v202 + 16) = 0;
      uint64_t v203 = swift_allocObject();
      *(unsigned char *)(v203 + 16) = 8;
      uint64_t v198 = 32;
      uint64_t v118 = swift_allocObject();
      uint64_t v119 = v200;
      uint64_t v201 = v118;
      *(void *)(v118 + 16) = v482;
      *(void *)(v118 + 24) = v119;
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v201;
      uint64_t v205 = v120;
      *(void *)(v120 + 16) = v483;
      *(void *)(v120 + 24) = v121;
      uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v204 = _allocateUninitializedArray<A>(_:)();
      v206 = v122;
      swift_retain();
      uint64_t v123 = v202;
      v124 = v206;
      char *v206 = v484;
      v124[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v123;
      swift_retain();
      uint64_t v125 = v203;
      unint64_t v126 = v206;
      v206[2] = v485;
      v126[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v125;
      swift_retain();
      unint64_t v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v205;
      v128 = v206;
      v206[4] = v486;
      v128[5] = v127;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v208, (os_log_type_t)v209))
      {
        uint64_t v129 = v522;
        v186 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v185 = 0;
        uint64_t v187 = createStorage<A>(capacity:type:)(0);
        uint64_t v188 = createStorage<A>(capacity:type:)(v185);
        v189 = &v610;
        v610 = v186;
        v190 = &v609;
        uint64_t v609 = v187;
        v191 = &v608;
        uint64_t v608 = v188;
        serialize(_:at:)(0, &v610);
        serialize(_:at:)(1, v189);
        v606 = v484;
        uint64_t v607 = v202;
        closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)v189, (uint64_t)v190, (uint64_t)v191);
        uint64_t v192 = v129;
        if (v129)
        {
          __break(1u);
        }
        else
        {
          v606 = v485;
          uint64_t v607 = v203;
          closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)&v610, (uint64_t)&v609, (uint64_t)&v608);
          uint64_t v183 = 0;
          v606 = v486;
          uint64_t v607 = v205;
          closure #1 in osLogInternal(_:log:type:)(&v606, (uint64_t)&v610, (uint64_t)&v609, (uint64_t)&v608);
          _os_log_impl(&dword_255CF7000, v208, (os_log_type_t)v209, "rsrp in data directory failed validation: %ld", v186, v196);
          uint64_t v182 = 0;
          destroyStorage<A>(_:count:)(v187, 0, v184);
          destroyStorage<A>(_:count:)(v188, v182, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A298650](v186, MEMORY[0x263F8E778]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v524 + 8))(v530, v523);
      int v406 = 0;
    }
  }
  else
  {
    uint64_t v130 = v528;
    uint64_t v131 = logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v524 + 16))(v130, v131, v523);
    uint64_t v171 = 7;
    uint64_t v172 = swift_allocObject();
    *(void *)(v172 + 16) = v470;
    v180 = Logger.logObject.getter();
    int v181 = static os_log_type_t.error.getter();
    v167 = &v618;
    uint64_t v618 = 12;
    unint64_t v165 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v168 = v619;
    uint64_t v169 = 17;
    uint64_t v174 = swift_allocObject();
    *(unsigned char *)(v174 + 16) = 0;
    uint64_t v175 = swift_allocObject();
    *(unsigned char *)(v175 + 16) = 8;
    uint64_t v170 = 32;
    uint64_t v132 = swift_allocObject();
    uint64_t v133 = v172;
    uint64_t v173 = v132;
    *(void *)(v132 + 16) = v477;
    *(void *)(v132 + 24) = v133;
    uint64_t v134 = swift_allocObject();
    uint64_t v135 = v173;
    uint64_t v177 = v134;
    *(void *)(v134 + 16) = v478;
    *(void *)(v134 + 24) = v135;
    uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v176 = _allocateUninitializedArray<A>(_:)();
    uint64_t v178 = v136;
    swift_retain();
    uint64_t v137 = v174;
    uint64_t v138 = v178;
    *uint64_t v178 = v479;
    v138[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v137;
    swift_retain();
    uint64_t v139 = v175;
    uint64_t v140 = v178;
    v178[2] = v480;
    v140[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v139;
    swift_retain();
    uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v177;
    int v142 = v178;
    v178[4] = v481;
    v142[5] = v141;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v180, (os_log_type_t)v181))
    {
      uint64_t v143 = v522;
      uint64_t v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v157 = 0;
      uint64_t v159 = createStorage<A>(capacity:type:)(0);
      uint64_t v160 = createStorage<A>(capacity:type:)(v157);
      int v161 = &v617;
      v617 = v158;
      Swift::String v162 = &v616;
      uint64_t v616 = v159;
      uint64_t v163 = &v615;
      uint64_t v615 = v160;
      serialize(_:at:)(0, &v617);
      serialize(_:at:)(1, v161);
      v613 = v479;
      uint64_t v614 = v174;
      closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163);
      uint64_t v164 = v143;
      if (v143)
      {
        __break(1u);
      }
      else
      {
        v613 = v480;
        uint64_t v614 = v175;
        closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)&v617, (uint64_t)&v616, (uint64_t)&v615);
        uint64_t v155 = 0;
        v613 = v481;
        uint64_t v614 = v177;
        closure #1 in osLogInternal(_:log:type:)(&v613, (uint64_t)&v617, (uint64_t)&v616, (uint64_t)&v615);
        _os_log_impl(&dword_255CF7000, v180, (os_log_type_t)v181, "rssi in data directory failed validation: %ld", v158, v168);
        uint64_t v154 = 0;
        destroyStorage<A>(_:count:)(v159, 0, v156);
        destroyStorage<A>(_:count:)(v160, v154, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v158, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v524 + 8))(v528, v523);
    int v406 = 0;
  }
  return v406 & 1;
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (id)MEMORY[0x25A298300]();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
  lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>();
  _convertInOutToPointerArgument<A>(_:)();
  id v9 = objc_msgSend(v6, sel_initWithPattern_options_error_, v7, a3, v10);
  id v3 = 0;

  if (v9)
  {

    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_bridgeObjectRelease();
    return (id)v5;
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSRegularExpressionOptions()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSMatchingOptions()
{
  return OptionSet<>.init()();
}

uint64_t protocol witness for SetAlgebra.contains(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.contains(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance NSMatchingOptions()
{
  return OptionSet.union(_:)();
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance NSMatchingOptions()
{
  return OptionSet.intersection(_:)();
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSMatchingOptions()
{
  return OptionSet.symmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.insert(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.insert(_:)() & 1;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.remove(_:)();
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance NSMatchingOptions()
{
  return OptionSet<>.update(with:)();
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formUnion(_:)();
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formIntersection(_:)();
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSMatchingOptions()
{
  return OptionSet<>.formSymmetricDifference(_:)();
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtracting(_:)();
}

uint64_t protocol witness for SetAlgebra.isSubset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSubset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isDisjoint(with:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isSuperset(of:) in conformance NSMatchingOptions()
{
  return SetAlgebra.isSuperset(of:)() & 1;
}

uint64_t protocol witness for SetAlgebra.isEmpty.getter in conformance NSMatchingOptions()
{
  return SetAlgebra.isEmpty.getter() & 1;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.init<A>(_:)();
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance NSMatchingOptions()
{
  return SetAlgebra.subtract(_:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSRegularExpressionOptions()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSRegularExpressionOptions()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSRegularExpressionOptions protocol witness for OptionSet.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, NSRegularExpressionOptions *a2@<X8>)
{
  NSRegularExpressionOptions result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSMatchingOptions()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSMatchingOptions()
{
  return SetAlgebra<>.init(arrayLiteral:)();
}

NSMatchingOptions protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, NSMatchingOptions *a2@<X8>)
{
  NSMatchingOptions result = NSMatchingOptions.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSRegularExpressionOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSRegularExpressionOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSRegularExpressionOptions result = NSRegularExpressionOptions.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSRegularExpressionOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSRegularExpressionOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

NSMatchingOptions protocol witness for RawRepresentable.init(rawValue:) in conformance NSMatchingOptions@<X0>(Swift::UInt *a1@<X0>, uint64_t a2@<X8>)
{
  NSMatchingOptions result = NSMatchingOptions.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSMatchingOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSMatchingOptions.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v5, a3);
  uint64_t v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  uint64_t result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = specialized _StringGuts._deconstructUTF8<A>(scratch:)((uint64_t)&v17, 0, 0, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x263F8DBE0];
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }
      else
      {
        int64_t v16 = 0;
      }
      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(v21, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter();
          *uint64_t v17 = a2;
          uint64_t v11 = 0;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          char v22 = v13 & 1;
          char v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    uint64_t v6 = _StringGuts._allocateForDeconstruct()(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  uint64_t result = _StringObject.sharedUTF8.getter();
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v4 = v6[2];
  specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v4);
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v4, 0);
  specialized Array._endMutation()();
  swift_retain();
  uint64_t v5 = specialized Array.count.getter((uint64_t)v6);
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    return (void *)specialized ContiguousArray.init()();
  }
  uint64_t v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v7, 0);
  swift_retain();
  swift_release();
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)();
  uint64_t v6 = result;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    outlined destroy of String.UTF8View();
    if (v6 == (void *)v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = specialized Array.count.getter(*v3);
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }
  return result;
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24) >> 1 < result + 1)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(*(void *)(*(void *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }
  return result;
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(unsigned char *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void specialized Array._endMutation()()
{
  *uint64_t v0 = *v0;
}

{
  void *v0;

  *uint64_t v0 = *v0;
}

uint64_t specialized Array.count.getter(uint64_t a1)
{
  return specialized Array._getCount()(a1);
}

{
  return specialized Array._getCount()(a1);
}

{
  return specialized Array._getCount()(a1);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v6 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    swift_retain();
    return (void *)v3;
  }
}

uint64_t specialized ContiguousArray.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  swift_retain();
  return v1;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  swift_retain();
  uint64_t result = swift_retain();
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if (a3)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }
  else
  {
    uint64_t v11 = a2;
  }
  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v8 = (void *)swift_allocObject();
    if (_swift_stdlib_has_malloc_size())
    {
      size_t v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * (v6 - (void)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      void v8[3] = 2 * v9;
    }
    swift_release();
    uint64_t v7 = (char *)v8;
  }
  else
  {
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    swift_retain();
    uint64_t v7 = v5;
  }
  if (a1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    specialized UnsafeMutablePointer.initialize(from:count:)((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t specialized Array._getCount()(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

{
  return *(void *)(a1 + 16);
}

{
  return *(void *)(a1 + 16);
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

uint64_t sub_255D063B8()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255D063EC()
{
  return swift_deallocObject();
}

uint64_t sub_255D06420()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D0646C()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D064B8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #2 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_255D06504()
{
  return swift_deallocObject();
}

uint64_t sub_255D06538()
{
  return swift_deallocObject();
}

uint64_t sub_255D0656C()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D065B8()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D06604()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in checkValidTextInputs(data:)()
{
  uint64_t result = *(void *)(v0 + 16);
  implicit closure #3 in checkValidTextInputs(data:)();
  return result;
}

uint64_t sub_255D06650()
{
  return swift_deallocObject();
}

uint64_t sub_255D06684()
{
  return swift_deallocObject();
}

uint64_t sub_255D066B8()
{
  return swift_deallocObject();
}

uint64_t sub_255D06704()
{
  return swift_deallocObject();
}

uint64_t outlined init with copy of Int?(uint64_t a1, uint64_t a2)
{
  uint64_t result = a2;
  *(void *)a2 = *(void *)a1;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t sub_255D0676C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #11 in checkValidNumericInputRange(data:)()
{
  return implicit closure #11 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D067A0()
{
  return swift_deallocObject();
}

uint64_t sub_255D067D4()
{
  return swift_deallocObject();
}

uint64_t sub_255D06808()
{
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_0@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255D06854()
{
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255D06908()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #13 in checkValidNumericInputRange(data:)()
{
  return implicit closure #13 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D0693C()
{
  return swift_deallocObject();
}

uint64_t sub_255D06970()
{
  return swift_deallocObject();
}

uint64_t sub_255D069A4()
{
  return swift_deallocObject();
}

uint64_t sub_255D069F0()
{
  return swift_deallocObject();
}

uint64_t sub_255D06AA4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #15 in checkValidNumericInputRange(data:)()
{
  return implicit closure #15 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D06AD8()
{
  return swift_deallocObject();
}

uint64_t sub_255D06B0C()
{
  return swift_deallocObject();
}

uint64_t sub_255D06B40()
{
  return swift_deallocObject();
}

uint64_t sub_255D06B8C()
{
  return swift_deallocObject();
}

uint64_t sub_255D06C40()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #17 in checkValidNumericInputRange(data:)()
{
  return implicit closure #17 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D06C74()
{
  return swift_deallocObject();
}

uint64_t sub_255D06CA8()
{
  return swift_deallocObject();
}

uint64_t sub_255D06CDC()
{
  return swift_deallocObject();
}

uint64_t sub_255D06D28()
{
  return swift_deallocObject();
}

uint64_t sub_255D06DDC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #19 in checkValidNumericInputRange(data:)()
{
  return implicit closure #19 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D06E10()
{
  return swift_deallocObject();
}

uint64_t sub_255D06E44()
{
  return swift_deallocObject();
}

uint64_t sub_255D06E78()
{
  return swift_deallocObject();
}

uint64_t sub_255D06EC4()
{
  return swift_deallocObject();
}

uint64_t sub_255D06F78()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #21 in checkValidNumericInputRange(data:)()
{
  return implicit closure #21 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D06FAC()
{
  return swift_deallocObject();
}

uint64_t sub_255D06FE0()
{
  return swift_deallocObject();
}

uint64_t sub_255D07014()
{
  return swift_deallocObject();
}

uint64_t sub_255D07060()
{
  return swift_deallocObject();
}

uint64_t sub_255D07114()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #23 in checkValidNumericInputRange(data:)()
{
  return implicit closure #23 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_255D07148()
{
  return swift_deallocObject();
}

uint64_t sub_255D0717C()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_255D071D8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

void *closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_255D07290()
{
  return swift_deallocObject();
}

void *partial apply for closure #1 in OSLogArguments.append(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D072DC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #25 in checkValidNumericInputRange(data:)()
{
  return implicit closure #25 in checkValidNumericInputRange(data:)(*(double *)(v0 + 16));
}

uint64_t sub_255D07310()
{
  return swift_deallocObject();
}

uint64_t sub_255D07344()
{
  return swift_deallocObject();
}

uint64_t sub_255D07378()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D073C4()
{
  return swift_deallocObject();
}

void *closure #1 in OSLogArguments.append(_:)partial apply(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D07410()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #27 in checkValidNumericInputRange(data:)()
{
  return implicit closure #27 in checkValidNumericInputRange(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D07444()
{
  return swift_deallocObject();
}

uint64_t sub_255D07478()
{
  return swift_deallocObject();
}

uint64_t sub_255D074AC()
{
  return swift_deallocObject();
}

uint64_t sub_255D074F8()
{
  return swift_deallocObject();
}

unint64_t base witness table accessor for RawRepresentable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for RawRepresentable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for SetAlgebra in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSMatchingOptions()
{
  return lazy protocol witness table accessor for type NSMatchingOptions and conformance NSMatchingOptions();
}

unint64_t base witness table accessor for Equatable in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t base witness table accessor for ExpressibleByArrayLiteral in NSRegularExpressionOptions()
{
  return lazy protocol witness table accessor for type NSRegularExpressionOptions and conformance NSRegularExpressionOptions();
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String.UTF8View()
{
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  uint64_t v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>;
  if (!lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for AutoreleasingUnsafeMutablePointer<NSError?>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type AutoreleasingUnsafeMutablePointer<NSError?> and conformance AutoreleasingUnsafeMutablePointer<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t SQLError.description.getter(int a1, uint64_t a2, void *a3)
{
  v11._uint64_t countAndFlagsBits = a2;
  v11._object = a3;
  swift_bridgeObjectRetain();
  if (v11._object)
  {
    Swift::String v12 = v11;
  }
  else
  {
    Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SQL Error", 9uLL, 1);
    outlined destroy of String?();
  }
  uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(": ", 2uLL, 1)._countAndFlagsBits;
  uint64_t v8 = MEMORY[0x25A298350](v12._countAndFlagsBits, v12._object, countAndFlagsBits);
  uint64_t v9 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!sqlite3_errstr(a1))
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v5 = String.init(cString:)();
  uint64_t v7 = MEMORY[0x25A298350](v8, v9, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of String?()
{
}

uint64_t SQLError.errorDescription.getter(int a1, uint64_t a2, void *a3)
{
  return SQLError.description.getter(a1, a2, a3);
}

uint64_t SQLError.code.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*SQLError.code.modify())()
{
  return SQLError.code.modify;
}

uint64_t variable initialization expression of SQLError.desc()
{
  return 0;
}

uint64_t SQLError.desc.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t SQLError.desc.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*SQLError.desc.modify())()
{
  return SQLError.desc.modify;
}

uint64_t default argument 1 of SQLError.init(code:desc:)()
{
  return 0;
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance SQLError()
{
  return SQLError.errorDescription.getter(*(_DWORD *)v0, *(void *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance SQLError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance SQLError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance SQLError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SQLError()
{
  return SQLError.description.getter(*(_DWORD *)v0, *(void *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t protocol witness for Error._domain.getter in conformance SQLError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance SQLError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance SQLError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance SQLError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t DBError.description.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned too many rows", 0x20uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned wrong columns count", 0x26uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("closed", 6uLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("statement returned no rows", 0x1AuLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t DBError.errorDescription.getter(char a1)
{
  return DBError.description.getter(a1);
}

BOOL static DBError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t DBError.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t DBError.hashValue.getter()
{
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type DBError and conformance DBError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type DBError and conformance DBError;
  if (!lazy protocol witness table cache variable for type DBError and conformance DBError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DBError and conformance DBError);
    return WitnessTable;
  }
  return v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DBError(char *a1, char *a2)
{
  return static DBError.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance DBError()
{
  return DBError.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance DBError()
{
  return DBError.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DBError(Swift::Int a1)
{
  return Hashable._rawHashValue(seed:)(a1);
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance DBError()
{
  return DBError.errorDescription.getter(*v0);
}

uint64_t protocol witness for LocalizedError.failureReason.getter in conformance DBError()
{
  return LocalizedError.failureReason.getter();
}

uint64_t protocol witness for LocalizedError.recoverySuggestion.getter in conformance DBError()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t protocol witness for LocalizedError.helpAnchor.getter in conformance DBError()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DBError()
{
  return DBError.description.getter(*v0);
}

uint64_t protocol witness for Error._domain.getter in conformance DBError()
{
  return Error._domain.getter();
}

uint64_t protocol witness for Error._code.getter in conformance DBError()
{
  return Error._code.getter();
}

uint64_t protocol witness for Error._userInfo.getter in conformance DBError()
{
  return Error._userInfo.getter();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance DBError()
{
  return Error._getEmbeddedNSError()();
}

uint64_t SQLiteDB.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static SQLiteDB.logger);
}

uint64_t SQLiteDB.Location.path.getter()
{
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v7 = 0;
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v8 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v9 = (char *)&v4 - v8;
  uint64_t v17 = (char *)&v4 - v8;
  unint64_t v11 = (*(void *)(*(void *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = (const void *)MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v4 - v11;
  uint64_t v16 = v0;
  outlined init with copy of SQLiteDB.Location(v0, (char *)&v4 - v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v15, 1, v14) == 1)
  {
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(":memory:", 8uLL, 1);
  }
  else
  {
    uint64_t v1 = v9;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v15, v14);
    uint64_t v17 = v1;
    v5._uint64_t countAndFlagsBits = URL.path.getter();
    v5._object = v2;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v14);
    Swift::String v6 = v5;
  }
  return v6._countAndFlagsBits;
}

uint64_t type metadata accessor for SQLiteDB.Location()
{
  uint64_t v1 = type metadata singleton initialization cache for SQLiteDB.Location;
  if (!type metadata singleton initialization cache for SQLiteDB.Location) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void *outlined init with copy of SQLiteDB.Location(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = type metadata accessor for SQLiteDB.Location();
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t SQLiteDB.DBHandle.__allocating_init(location:)(uint64_t a1)
{
  swift_allocObject();
  uint64_t v5 = SQLiteDB.DBHandle.init(location:)(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t SQLiteDB.DBHandle.init(location:)(uint64_t a1)
{
  v14[1] = *(sqlite3 **)MEMORY[0x263EF8340];
  *(unsigned char *)(v1 + 24) = 0;
  v14[0] = 0;
  SQLiteDB.Location.path.getter();
  uint64_t v12 = String.utf8CString.getter();
  swift_retain();
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease();
  unsigned int v13 = sqlite3_open_v2((const char *)(v12 + 32), v14, 32774, 0);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (!v14[0] || v13)
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to open database", 0x17uLL, 1);
    int v10 = SQLError.init(code:desc:)(v13, v3._countAndFlagsBits, v3._object);
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v6 = v10;
    *(void *)(v6 + 8) = v8;
    *(void *)(v6 + 16) = v9;
    swift_willThrow();
    swift_deallocPartialClassInstance();
    outlined destroy of SQLiteDB.Location(a1);
    return v7;
  }
  else
  {
    *(sqlite3 **)(v1 + 16) = v14[0];
    outlined destroy of SQLiteDB.Location(a1);
    return v1;
  }
}

unint64_t lazy protocol witness table accessor for type SQLError and conformance SQLError()
{
  uint64_t v2 = lazy protocol witness table cache variable for type SQLError and conformance SQLError;
  if (!lazy protocol witness table cache variable for type SQLError and conformance SQLError)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type SQLError and conformance SQLError);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of SQLiteDB.Location(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t SQLiteDB.DBHandle.close()()
{
  swift_beginAccess();
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t result = swift_endAccess();
  if ((v3 & 1) == 0)
  {
    swift_beginAccess();
    *(unsigned char *)(v2 + 24) = 1;
    swift_endAccess();
    return sqlite3_close_v2(*(sqlite3 **)(v2 + 16));
  }
  return result;
}

uint64_t SQLiteDB.DBHandle.deinit()
{
  SQLiteDB.DBHandle.close()();
  return v1;
}

uint64_t SQLiteDB.DBHandle.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.Statement.handle.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SQLiteDB.Statement.sqlString.getter()
{
  uint64_t v4 = sqlite3_expanded_sql(*(sqlite3_stmt **)(v0 + 16));
  if (!v4) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
  }
  uint64_t v2 = String.init(cString:)();
  $defer #1 () in SQLiteDB.Statement.sqlString.getter(v4);
  return v2;
}

void $defer #1 () in SQLiteDB.Statement.sqlString.getter(void *a1)
{
}

uint64_t variable initialization expression of SQLiteDB.Statement.finished()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Statement.finished : SQLiteDB.Statement@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 104))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Statement.finished : SQLiteDB.Statement(char *a1)
{
  char v2 = *a1;
  swift_retain();
  SQLiteDB.Statement.finished.setter(v2 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Statement.finished.getter()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Statement.finished.setter(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Statement.finished.modify())()
{
  return SQLiteDB.Statement.finished.modify;
}

uint64_t SQLiteDB.Statement.finished.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Statement.__allocating_init(handle:)(uint64_t a1)
{
  return SQLiteDB.Statement.init(handle:)(a1);
}

uint64_t SQLiteDB.Statement.init(handle:)(uint64_t a1)
{
  uint64_t result = v1;
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t SQLiteDB.Statement.step()()
{
  unsigned int v16 = sqlite3_step(*(sqlite3_stmt **)(v0 + 16));
  if (v16 == 100)
  {
    swift_retain();
    return ((uint64_t (*)())SQLiteDB.Row.init(statement:))();
  }
  else
  {
    if (v16 != 101)
    {
      DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Statement ((", 0xCuLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v1);
      uint64_t v2 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))(*(void *)v15 + 96))(v2);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      outlined destroy of String();
      Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(")) could not be executed", 0x18uLL, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of DefaultStringInterpolation();
      uint64_t v4 = String.init(stringInterpolation:)();
      int v12 = SQLError.init(code:desc:)(v16, v4, v5);
      uint64_t v10 = v6;
      uint64_t v11 = v7;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)uint64_t v8 = v12;
      *(void *)(v8 + 8) = v10;
      *(void *)(v8 + 16) = v11;
      swift_willThrow();
      return v13;
    }
    swift_beginAccess();
    v15[24] = 1;
    swift_endAccess();
    return 0;
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DefaultStringInterpolation()
{
}

uint64_t SQLiteDB.Statement.forEach(handler:)(void (*a1)(void))
{
  while (1)
  {
    uint64_t result = SQLiteDB.Statement.step()();
    if (v3 || !result) {
      break;
    }
    a1();
    swift_release();
    uint64_t v3 = 0;
  }
  return result;
}

uint64_t SQLiteDB.Statement.queryOneRow<A>(handler:)@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v32 = a4;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v46 = 0;
  uint64_t v45 = 0;
  uint64_t v50 = a3;
  uint64_t v36 = *(void *)(a3 - 8);
  uint64_t v37 = a3 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v39 = (char *)v14 - v38;
  uint64_t v49 = (char *)v14 - v38;
  uint64_t v47 = MEMORY[0x270FA5388](a1);
  uint64_t v48 = v6;
  uint64_t v46 = v4;
  uint64_t result = SQLiteDB.Statement.step()();
  uint64_t v40 = v5;
  uint64_t v41 = result;
  uint64_t v42 = v5;
  if (v5)
  {
    uint64_t v17 = v42;
  }
  else
  {
    uint64_t v31 = v41;
    if (v41)
    {
      uint64_t v30 = v31;
      uint64_t v8 = v40;
      uint64_t v27 = v31;
      uint64_t v45 = v31;
      v33();
      uint64_t v28 = v8;
      uint64_t v29 = v8;
      uint64_t v9 = SQLiteDB.Statement.step()();
      *(_DWORD *)&v24[8] = 0;
      uint64_t v25 = v9;
      uint64_t v26 = 0;
      uint64_t v44 = v9;
      *(void *)uint64_t v24 = v9 != 0;
      BOOL v23 = v9 != 0;
      outlined destroy of SQLiteDB.Row?();
      if (v23)
      {
        for (uint64_t i = *(void *)&v24[4]; ; uint64_t i = *(void *)&v19[4])
        {
          uint64_t v10 = i;
          uint64_t v11 = SQLiteDB.Statement.step()();
          *(void *)&v19[4] = v10;
          uint64_t v20 = v11;
          uint64_t v21 = v10;
          if (v10) {
            break;
          }
          uint64_t v43 = v20;
          *(void *)uint64_t v19 = v20 != 0;
          BOOL v18 = v20 != 0;
          outlined destroy of SQLiteDB.Row?();
          if (!v18)
          {
            lazy protocol witness table accessor for type DBError and conformance DBError();
            uint64_t v16 = swift_allocError();
            *int v12 = 1;
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
            swift_release();
            uint64_t result = v16;
            uint64_t v17 = v16;
            return result;
          }
        }
        v14[1] = v21;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
        return swift_release();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v32, v39, v35);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v39, v35);
        return swift_release();
      }
    }
    else
    {
      lazy protocol witness table accessor for type DBError and conformance DBError();
      uint64_t v15 = swift_allocError();
      unsigned char *v13 = 0;
      swift_willThrow();
      uint64_t result = v15;
      uint64_t v17 = v15;
    }
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of SQLiteDB.Row?()
{
}

uint64_t SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v7 = v2;
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  return (*(uint64_t (**)(uint64_t (*)(uint64_t), unsigned char *))(*(void *)v2 + 152))(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v4);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v5)(uint64_t (*)(uint64_t), unsigned char *, uint64_t);
  unsigned char v6[16];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v10 = a1;
  uint64_t v9 = v2;
  uint64_t v7 = a1;
  uint64_t v8 = a2;
  uint64_t v5 = *(uint64_t (**)(uint64_t (*)(uint64_t), unsigned char *, uint64_t))(*(void *)v2 + 152);
  uint64_t v3 = type metadata accessor for Optional();
  return v5(partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>(), v6, v3);
}

uint64_t closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *uint64_t v4 = 2;
    return swift_willThrow();
  }
}

{
  unsigned char *v4;

  if (SQLiteDB.Row.count.getter(a1) == 1)
  {
    swift_retain();
    return (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a1, 0);
  }
  else
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    swift_allocError();
    *uint64_t v4 = 2;
    return swift_willThrow();
  }
}

uint64_t partial apply for closure #1 in SQLiteDB.Statement.queryOne<A>()(uint64_t a1)
{
  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

{
  uint64_t v1;

  return closure #1 in SQLiteDB.Statement.queryOne<A>()(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t SQLiteDB.Row.count.getter(uint64_t a1)
{
  swift_retain();
  pStmt = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  return sqlite3_column_count(pStmt);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Statement.execute()()
{
  while (1)
  {
    *(_DWORD *)&v0[8] = HIDWORD(v2);
    uint64_t v1 = SQLiteDB.Statement.step()();
    if (v2) {
      break;
    }
    outlined destroy of SQLiteDB.Row?();
    if (!v1) {
      break;
    }
    *(void *)uint64_t v0 = 1;
    uint64_t v2 = *(void *)&v0[4];
  }
}

uint64_t SQLiteDB.Statement.bind(at:to:)(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[3];
  uint64_t v5 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(v6, a1, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

void *SQLiteDB.Statement.bind(values:)(uint64_t a1)
{
  memset(v14, 0, 32);
  void v14[4] = a1;
  v12[6] = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SQLBindable]);
  unint64_t v1 = lazy protocol witness table accessor for type [SQLBindable] and conformance [A]();
  MEMORY[0x25A2983F0](&v13, v6, v1);
  v12[5] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>);
  EnumeratedSequence.makeIterator()();
  for (uint64_t i = v7; ; uint64_t i = 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EnumeratedSequence<[SQLBindable]>.Iterator);
    EnumeratedSequence.Iterator.next()();
    outlined init with take of (offset: Int, element: SQLBindable)?(v10, &v11);
    if (!v12[3])
    {
      uint64_t result = v14;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    uint64_t v4 = v11;
    uint64_t result = outlined init with take of SQLBindable(v12, __dst);
    if (__OFADD__(v4, 1)) {
      break;
    }
    (*(void (**)(uint64_t, unsigned char *))(*(void *)v5 + 184))(v4 + 1, __dst);
    if (i)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
      uint64_t result = v14;
      outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator();
      return result;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)__dst);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [SQLBindable] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [SQLBindable] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SQLBindable] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SQLBindable]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [SQLBindable] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void *outlined init with take of (offset: Int, element: SQLBindable)?(const void *a1, void *a2)
{
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of EnumeratedSequence<[SQLBindable]>.Iterator()
{
}

void *outlined init with take of SQLBindable(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

uint64_t SQLiteDB.Statement.deinit()
{
  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  return v2;
}

uint64_t SQLiteDB.Statement.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Row.statement.getter()
{
}

uint64_t SQLiteDB.Row.get<A>(at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

{
  swift_retain();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a1);
}

uint64_t variable initialization expression of SQLiteDB.Transaction.finalized()
{
  return 0;
}

uint64_t key path getter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 96))(v2) & 1;
  return swift_release();
}

uint64_t key path setter for SQLiteDB.Transaction.finalized : SQLiteDB.Transaction(char *a1, uint64_t *a2)
{
  char v4 = *a1;
  uint64_t v3 = *a2;
  swift_retain();
  (*(void (**)(void))(*(void *)v3 + 104))(v4 & 1);
  return swift_release();
}

uint64_t SQLiteDB.Transaction.finalized.getter()
{
  swift_beginAccess();
  char v2 = *(unsigned char *)(v0 + 24);
  swift_endAccess();
  return v2 & 1;
}

uint64_t SQLiteDB.Transaction.finalized.setter(char a1)
{
  swift_beginAccess();
  *(unsigned char *)(v1 + 24) = a1 & 1;
  return swift_endAccess();
}

uint64_t (*SQLiteDB.Transaction.finalized.modify())()
{
  return SQLiteDB.Transaction.finalized.modify;
}

uint64_t SQLiteDB.Transaction.finalized.modify()
{
  return swift_endAccess();
}

uint64_t SQLiteDB.Transaction.__allocating_init(_:)(uint64_t a1)
{
  return SQLiteDB.Transaction.init(_:)(a1);
}

uint64_t SQLiteDB.Transaction.init(_:)(uint64_t a1)
{
  *(unsigned char *)(v1 + 24) = 0;
  swift_retain();
  *(void *)(v1 + 16) = a1;
  swift_release();
  return v4;
}

uint64_t SQLiteDB.Transaction.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  if ((*(uint64_t (**)(void))(*(void *)v3 + 96))())
  {
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    int v11 = SQLError.init(code:desc:)(1, v5._countAndFlagsBits, v5._object);
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    uint64_t v12 = swift_allocError();
    *(_DWORD *)uint64_t v8 = v11;
    *(void *)(v8 + 8) = v9;
    *(void *)(v8 + 16) = v10;
    swift_willThrow();
    return v12;
  }
  else
  {
    swift_retain();
    uint64_t v13 = SQLiteDB.makeStatement(with:)(a1, a2);
    if (!v17)
    {
      swift_release();
      swift_retain();
      a3(v13);
      swift_release();
    }
    return swift_release();
  }
}

uint64_t SQLiteDB.makeStatement(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v34 = partial apply for closure #1 in SQLiteDB.makeStatement(with:);
  uint64_t v41 = 0;
  unsigned int v39 = 0;
  uint64_t v38 = 0;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v44 = v2;
  uint64_t v36 = *(void *)(v2 + 112);
  swift_retain();
  uint64_t v35 = &v43;
  swift_beginAccess();
  int v37 = *(unsigned __int8 *)(v36 + 24);
  swift_endAccess();
  swift_release();
  if (v37)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    uint64_t v14 = swift_allocError();
    *uint64_t v12 = 3;
    swift_willThrow();
    uint64_t v20 = v14;
  }
  else
  {
    uint64_t v27 = &v42;
    uint64_t v42 = 0;
    uint64_t v3 = v33;
    uint64_t v28 = String.utf8CString.getter();
    uint64_t v41 = v28;
    swift_retain();
    swift_retain();
    uint64_t v29 = &v13;
    MEMORY[0x270FA5388](v34);
    ContiguousArray.withUnsafeBufferPointer<A>(_:)();
    uint64_t v30 = v3;
    if (v3)
    {
      __break(1u);
    }
    else
    {
      swift_release();
      swift_release();
      unsigned int v24 = v40;
      unsigned int v39 = v40;
      uint64_t v25 = v42;
      if (v42)
      {
        uint64_t v23 = v25;
        uint64_t v22 = v25;
        uint64_t v38 = v25;
        if (!v24)
        {
          type metadata accessor for SQLiteDB.Statement();
          uint64_t v21 = SQLiteDB.Statement.__allocating_init(handle:)(v22);
          swift_release();
          return v21;
        }
      }
      Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to prepare statement", 0x1BuLL, 1);
      uint64_t countAndFlagsBits = v5._countAndFlagsBits;
      int v18 = SQLError.init(code:desc:)(v24, v5._countAndFlagsBits, v5._object);
      uint64_t v16 = v6;
      uint64_t v17 = v7;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v8 = swift_allocError();
      uint64_t v9 = v16;
      uint64_t v10 = v17;
      uint64_t v19 = v8;
      *(_DWORD *)uint64_t v11 = v18;
      *(void *)(v11 + 8) = v9;
      *(void *)(v11 + 16) = v10;
      swift_willThrow();
      swift_release();
      uint64_t v20 = v19;
    }
  }
  return v26;
}

Swift::Int64 __swiftcall SQLiteDB.Transaction.changes()()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_retain();
  uint64_t v3 = *(void *)(v2 + 112);
  swift_retain();
  swift_release();
  uint64_t v4 = *(sqlite3 **)(v3 + 16);
  swift_release();
  return sqlite3_changes64(v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.commit()()
{
  if ((*(uint64_t (**)(void))(*(void *)v0 + 96))())
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    int v7 = SQLError.init(code:desc:)(1, v1._countAndFlagsBits, v1._object);
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = v7;
    *(void *)(v4 + 8) = v5;
    *(void *)(v4 + 16) = v6;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v9) {
      (*(void (**)(uint64_t))(*(void *)v8 + 104))(1);
    }
  }
}

uint64_t SQLiteDB.executeRaw(_:)()
{
  uint64_t v18 = *(void *)(v0 + 112);
  swift_retain();
  swift_beginAccess();
  char v19 = *(unsigned char *)(v18 + 24);
  swift_endAccess();
  swift_release();
  if (v19)
  {
    lazy protocol witness table accessor for type DBError and conformance DBError();
    uint64_t v7 = swift_allocError();
    *uint64_t v6 = 3;
    swift_willThrow();
    return v7;
  }
  else
  {
    uint64_t v13 = *(void *)(v17 + 112);
    swift_retain();
    uint64_t v14 = *(sqlite3 **)(v13 + 16);
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v15 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    swift_bridgeObjectRelease();
    unsigned int v16 = sqlite3_exec(v14, (const char *)(v15 + 32), 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = v16;
    if (v16)
    {
      uint64_t v8 = default argument 1 of SQLError.init(code:desc:)();
      int v11 = SQLError.init(code:desc:)(v16, v8, v2);
      uint64_t v9 = v3;
      uint64_t v10 = v4;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v12 = swift_allocError();
      *(_DWORD *)uint64_t v5 = v11;
      *(void *)(v5 + 8) = v9;
      *(void *)(v5 + 16) = v10;
      swift_willThrow();
      return v12;
    }
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.Transaction.rollback()()
{
  if ((*(uint64_t (**)(void))(*(void *)v0 + 96))())
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("transaction already finalized", 0x1DuLL, 1);
    int v7 = SQLError.init(code:desc:)(1, v1._countAndFlagsBits, v1._object);
    uint64_t v5 = v2;
    uint64_t v6 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = v7;
    *(void *)(v4 + 8) = v5;
    *(void *)(v4 + 16) = v6;
    swift_willThrow();
  }
  else
  {
    swift_retain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ROLLBACK", 8uLL, 1);
    SQLiteDB.executeRaw(_:)();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v9) {
      (*(void (**)(uint64_t))(*(void *)v8 + 104))(1);
    }
  }
}

uint64_t SQLiteDB.Transaction.deinit()
{
  swift_release();
  return v1;
}

uint64_t SQLiteDB.Transaction.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SQLiteDB.__allocating_init(_:)(const void *a1)
{
  swift_allocObject();
  uint64_t v5 = SQLiteDB.init(_:)(a1);
  if (v3) {
    return v2;
  }
  else {
    return v5;
  }
}

uint64_t SQLiteDB.init(_:)(const void *a1)
{
  uint64_t v49 = a1;
  uint64_t v45 = *v1;
  uint64_t v59 = 0;
  uint64_t v58 = 0;
  uint64_t v57 = 0;
  unsigned int v56 = 0;
  unsigned int v55 = 0;
  uint64_t v48 = 0;
  unint64_t v47 = (*(void *)(*(void *)(type metadata accessor for SQLiteDB.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v46);
  uint64_t v51 = (char *)v21 - v47;
  uint64_t v59 = v3;
  uint64_t v58 = v2;
  swift_defaultActor_initialize();
  type metadata accessor for SQLiteDB.DBHandle();
  outlined init with copy of SQLiteDB.Location(v49, v51);
  uint64_t v4 = v50;
  uint64_t v5 = SQLiteDB.DBHandle.__allocating_init(location:)((uint64_t)v51);
  uint64_t v52 = v4;
  uint64_t v53 = v5;
  uint64_t v54 = v4;
  if (v4)
  {
    uint64_t v32 = v54;
    uint64_t v33 = v46;
  }
  else
  {
    uint64_t v39 = v53;
    uint64_t v57 = v53;
    uint64_t v41 = *(sqlite3 **)(v53 + 16);
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA journal_mode=WAL;", 0x18uLL, 1)._object;
    uint64_t v42 = String.utf8CString.getter();
    swift_retain();
    swift_release();
    swift_retain();
    unsigned int v40 = (const char *)(v42 + 32);
    swift_bridgeObjectRelease();
    unsigned int v44 = sqlite3_exec(v41, v40, 0, 0, 0);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    unsigned int v56 = v44;
    if (v44)
    {
      Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable WAL", 0x14uLL, 1);
      v21[3] = v14._countAndFlagsBits;
      int v24 = SQLError.init(code:desc:)(v44, v14._countAndFlagsBits, v14._object);
      uint64_t v22 = v15;
      uint64_t v23 = v16;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v17 = swift_allocError();
      uint64_t v18 = v22;
      uint64_t v19 = v23;
      uint64_t v25 = v17;
      *(_DWORD *)uint64_t v20 = v24;
      *(void *)(v20 + 8) = v18;
      *(void *)(v20 + 16) = v19;
      swift_willThrow();
      swift_release();
      uint64_t v32 = v25;
      uint64_t v33 = v46;
    }
    else
    {
      uint64_t v35 = *(sqlite3 **)(v39 + 16);
      int v37 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PRAGMA foreign_keys=ON;", 0x17uLL, 1)._object;
      uint64_t v36 = String.utf8CString.getter();
      swift_retain();
      swift_release();
      swift_retain();
      uint64_t v34 = (const char *)(v36 + 32);
      swift_bridgeObjectRelease();
      unsigned int v38 = sqlite3_exec(v35, v34, 0, 0, 0);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v55 = v38;
      if (!v38)
      {
        swift_retain();
        *(void *)(v46 + 112) = v39;
        swift_release();
        outlined destroy of SQLiteDB.Location((uint64_t)v49);
        return v46;
      }
      Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to enable FK", 0x13uLL, 1);
      uint64_t countAndFlagsBits = v7._countAndFlagsBits;
      int v30 = SQLError.init(code:desc:)(v38, v7._countAndFlagsBits, v7._object);
      uint64_t v28 = v8;
      uint64_t v29 = v9;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      uint64_t v10 = swift_allocError();
      uint64_t v11 = v28;
      uint64_t v12 = v29;
      uint64_t v31 = v10;
      *(_DWORD *)uint64_t v13 = v30;
      *(void *)(v13 + 8) = v11;
      *(void *)(v13 + 16) = v12;
      swift_willThrow();
      swift_release();
      uint64_t v32 = v31;
      uint64_t v33 = v46;
    }
  }
  v21[1] = v33;
  v21[2] = v32;
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  outlined destroy of SQLiteDB.Location((uint64_t)v49);
  return v26;
}

uint64_t closure #1 in SQLiteDB.makeStatement(with:)@<X0>(uint64_t a1@<X2>, sqlite3_stmt **a2@<X4>, _DWORD *a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 112);
  swift_retain();
  Swift::String v7 = *(sqlite3 **)(v6 + 16);
  swift_release();
  uint64_t v8 = (const char *)UnsafeBufferPointer.baseAddress.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  ContiguousArray.count.getter();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_prepare_v2(v7, v8, v9, a2, 0);
  *a3 = result;
  return result;
}

uint64_t partial apply for closure #1 in SQLiteDB.makeStatement(with:)@<X0>(_DWORD *a1@<X8>)
{
  return closure #1 in SQLiteDB.makeStatement(with:)(*(void *)(v1 + 16), *(sqlite3_stmt ***)(v1 + 32), a1);
}

uint64_t type metadata accessor for SQLiteDB.Statement()
{
  return self;
}

uint64_t type metadata accessor for SQLiteDB.DBHandle()
{
  return self;
}

uint64_t SQLiteDB.withStatement<A>(sql:handler:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t result = SQLiteDB.makeStatement(with:)(a1, a2);
  if (!v3)
  {
    a3();
    return swift_release();
  }
  return result;
}

uint64_t SQLiteDB.withTransaction<A>(handler:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = a4;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
  uint64_t v43 = a3;
  uint64_t v28 = *(void *)(a3 - 8);
  uint64_t v29 = a3 - 8;
  unint64_t v30 = (*(void *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = (char *)v13 - v30;
  uint64_t v42 = (char *)v13 - v30;
  uint64_t v40 = MEMORY[0x270FA5388](a1);
  uint64_t v41 = v5;
  uint64_t v39 = v4;
  type metadata accessor for SQLiteDB.Transaction();
  swift_retain();
  uint64_t v33 = SQLiteDB.Transaction.__allocating_init(_:)(v32);
  uint64_t v38 = v33;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("BEGIN TRANSACTION", 0x11uLL, 1);
  uint64_t v7 = v34;
  object = v6._object;
  SQLiteDB.executeRaw(_:)();
  uint64_t v36 = v7;
  uint64_t v37 = v7;
  if (v7)
  {
    uint64_t v15 = v37;
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    uint64_t v16 = v15;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = v36;
    uint64_t v9 = v25(v33);
    uint64_t v22 = v8;
    uint64_t v23 = v8;
    if (v8)
    {
      uint64_t v14 = v23;
      uint64_t result = swift_release();
      uint64_t v16 = v14;
    }
    else
    {
      if ((*(uint64_t (**)(uint64_t))(*(void *)v33 + 96))(v9))
      {
        uint64_t v18 = v22;
        goto LABEL_7;
      }
      Swift::String v10 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("COMMIT", 6uLL, 1);
      uint64_t v11 = v22;
      uint64_t v19 = v10._object;
      SQLiteDB.executeRaw(_:)();
      uint64_t v20 = v11;
      uint64_t v21 = v11;
      if (!v11)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = v20;
LABEL_7:
        uint64_t v17 = v18;
        (*(void (**)(uint64_t, char *, uint64_t))(v28 + 16))(v24, v31, v27);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
        return swift_release();
      }
      v13[1] = v21;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
      return swift_release();
    }
  }
  return result;
}

uint64_t type metadata accessor for SQLiteDB.Transaction()
{
  return self;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDB.execute(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall SQLiteDB.close()()
{
}

uint64_t SQLiteDB.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t SQLiteDB.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t SQLiteDB.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance SQLiteDB()
{
  return SQLiteDB.unownedExecutor.getter();
}

uint64_t SQLNullableType<>.init(with:column:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v11 = a5;
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  unint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = a3;
  uint64_t v14 = *(void *)(a3 - 8);
  uint64_t v15 = a3 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v17 = (char *)&v10 - v16;
  unint64_t v18 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v19 = (char *)&v10 - v18;
  unint64_t v30 = (char *)&v10 - v18;
  uint64_t v29 = v7;
  uint64_t v28 = v8;
  swift_retain();
  uint64_t v25 = *(sqlite3_stmt **)(v20 + 16);
  swift_release();
  uint64_t v24 = &v26;
  uint64_t v26 = v21;
  unint64_t v22 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  unint64_t v23 = lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_type(v25, v27) == 5)
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1, 1, v12);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v20, v21);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v17, v12);
    (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v11, v19, v12);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v12);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v12);
  }
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
    return WitnessTable;
  }
  return v2;
}

uint64_t Int.init(with:column:)(uint64_t a1)
{
  swift_retain();
  uint64_t v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int(v2, v4);
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int and conformance Int();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

uint64_t Int.bind(to:at:)(uint64_t a1)
{
  uint64_t v9 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_int(v9, v12, v11);
  unsigned int v10 = result;
  if (result)
  {
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int", 0x12uLL, 1);
    int v8 = SQLError.init(code:desc:)(v10, v2._countAndFlagsBits, v2._object);
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v5 = v8;
    *(void *)(v5 + 8) = v6;
    *(void *)(v5 + 16) = v7;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Int.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int(uint64_t a1)
{
  return Int.bind(to:at:)(a1);
}

uint64_t Int64.init(with:column:)(uint64_t a1)
{
  swift_retain();
  Swift::String v2 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  sqlite3_column_int64(v2, v4);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  SignedInteger<>.init<A>(_:)();
  swift_release();
  return v5;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
    return WitnessTable;
  }
  return v2;
}

uint64_t Int64.bind(to:at:)(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  int v11 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_int64(v11, v14, a3);
  unsigned int v13 = result;
  if (result)
  {
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Int64", 0x14uLL, 1);
    int v10 = SQLError.init(code:desc:)(v13, v4._countAndFlagsBits, v4._object);
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v7 = v10;
    *(void *)(v7 + 8) = v8;
    *(void *)(v7 + 16) = v9;
    return swift_willThrow();
  }
  return result;
}

uint64_t protocol witness for SQLType.init(with:column:) in conformance Int64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = Int64.init(with:column:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Int64(uint64_t a1, uint64_t a2)
{
  return Int64.bind(to:at:)(a1, a2, *v2);
}

double Double.init(with:column:)(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  double v1 = sqlite3_column_double(v3, v5);
  double v6 = Double.init(_:)(v1);
  swift_release();
  return v6;
}

uint64_t Double.bind(to:at:)(uint64_t a1, double a2)
{
  int v10 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t result = sqlite3_bind_double(v10, v13, a2);
  unsigned int v12 = result;
  if (result)
  {
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind Double", 0x15uLL, 1);
    int v9 = SQLError.init(code:desc:)(v12, v3._countAndFlagsBits, v3._object);
    uint64_t v7 = v4;
    uint64_t v8 = v5;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v6 = v9;
    *(void *)(v6 + 8) = v7;
    *(void *)(v6 + 16) = v8;
    return swift_willThrow();
  }
  return result;
}

void protocol witness for SQLType.init(with:column:) in conformance Double(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = Double.init(with:column:)(a1);
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance Double(uint64_t a1)
{
  return Double.bind(to:at:)(a1, *v1);
}

uint64_t String.init(with:column:)(uint64_t a1)
{
  swift_retain();
  uint64_t v5 = *(sqlite3_stmt **)(a1 + 16);
  swift_release();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  if (sqlite3_column_text(v5, v6))
  {
    uint64_t v2 = String.init(cString:)();
    swift_bridgeObjectRetain();
    swift_release();
    outlined destroy of String();
    return v2;
  }
  else
  {
    swift_release();
    return 0;
  }
}

uint64_t String.bind(to:at:)()
{
  String.utf8CString.getter();
  swift_retain();
  swift_retain();
  uint64_t result = ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    if (v9)
    {
      Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to bind String", 0x15uLL, 1);
      int v7 = SQLError.init(code:desc:)(v9, v1._countAndFlagsBits, v1._object);
      uint64_t v5 = v2;
      uint64_t v6 = v3;
      lazy protocol witness table accessor for type SQLError and conformance SQLError();
      swift_allocError();
      *(_DWORD *)uint64_t v4 = v7;
      *(void *)(v4 + 8) = v5;
      *(void *)(v4 + 16) = v6;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in String.bind(to:at:)@<X0>(uint64_t a1@<X2>, _DWORD *a2@<X8>)
{
  uint64_t v5 = *(sqlite3_stmt **)(a1 + 16);
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int32 and conformance Int32();
  lazy protocol witness table accessor for type Int and conformance Int();
  SignedInteger<>.init<A>(_:)();
  uint64_t v4 = (char *)UnsafeBufferPointer.baseAddress.getter();
  ContiguousArray.count.getter();
  SignedInteger<>.init<A>(_:)();
  uint64_t v2 = SQLITE_TRANSIENT.unsafeMutableAddressor();
  uint64_t result = sqlite3_bind_text(v5, v8, v4, v7, (void (__cdecl *)(void *))*v2);
  *a2 = result;
  return result;
}

uint64_t partial apply for closure #1 in String.bind(to:at:)@<X0>(_DWORD *a1@<X8>)
{
  return closure #1 in String.bind(to:at:)(*(void *)(v1 + 16), a1);
}

uint64_t *SQLITE_TRANSIENT.unsafeMutableAddressor()
{
  if (one-time initialization token for SQLITE_TRANSIENT != -1) {
    swift_once();
  }
  return &SQLITE_TRANSIENT;
}

uint64_t protocol witness for SQLNullableType.init(with:column:) in conformance String@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = String.init(with:column:)(a1);
  *a2 = result;
  a2[1] = v3;
  return result;
}

uint64_t protocol witness for SQLBindable.bind(to:at:) in conformance String()
{
  return String.bind(to:at:)();
}

void one-time initialization function for SQLITE_TRANSIENT()
{
  SQLITE_TRANSIENT = -1;
}

unint64_t base witness table accessor for Error in SQLError()
{
  return lazy protocol witness table accessor for type SQLError and conformance SQLError();
}

unint64_t base witness table accessor for Equatable in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

unint64_t base witness table accessor for Error in DBError()
{
  return lazy protocol witness table accessor for type DBError and conformance DBError();
}

uint64_t initializeBufferWithCopyOfBuffer for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t destroy for SQLError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + 16) = v4;
  return result;
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24))
    {
      int v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)(a1 + 16))) {
        int v4 = *(void *)(a1 + 16);
      }
      int v2 = v4 - 1;
      if (v4 - 1 < 0) {
        int v2 = -1;
      }
      int v5 = v2;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 24) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLError()
{
  return &type metadata for SQLError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DBError(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DBError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *__n128 result = a2 + 3;
    }
  }
  return result;
}

uint64_t getEnumTag for DBError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for DBError(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DBError()
{
  return &type metadata for DBError;
}

uint64_t type metadata accessor for SQLiteDB()
{
  return self;
}

unint64_t initializeBufferWithCopyOfBuffer for SQLiteDB.Location(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v10 = *(void *)(a3 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  if ((v11 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    swift_retain();
    *a1 = v6;
    return *a1 + ((v11 + 16) & ~(unint64_t)v11);
  }
  else
  {
    uint64_t v4 = type metadata accessor for URL();
    uint64_t v5 = *(void *)(v4 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v5 + 48))(a2, 1))
    {
      memcpy(a1, a2, *(void *)(v10 + 64));
    }
    else
    {
      (*(void (**)(void *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
    }
    return (unint64_t)a1;
  }
}

uint64_t destroy for SQLiteDB.Location(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1);
  if (!result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithCopy for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v7);
  }
  return a1;
}

void *initializeWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v8 + 48))(a2, 1))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for SQLiteDB.Location(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a1, 1))
  {
    if (v9(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  else if (v9(a2, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v7);
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v7);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_255D0EE10(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for URL();
  unsigned int v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)(v2 - 8) + 48))(a1, a2);
  if (v3 > 1) {
    return v3 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SQLiteDB.Location()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_255D0EEB4(uint64_t a1, int a2, unsigned int a3)
{
  if (a2) {
    unsigned int v3 = a2 + 1;
  }
  else {
    unsigned int v3 = 0;
  }
  unsigned int v7 = v3;
  uint64_t v4 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, void, void))(*(void *)(v4 - 8) + 56))(a1, v7, a3);
}

uint64_t getEnumTag for SQLiteDB.Location(uint64_t a1)
{
  uint64_t v1 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for SQLiteDB.Location(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56))(a1, a2, 1);
}

uint64_t type metadata completion function for SQLiteDB.Location()
{
  uint64_t v2 = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return v2;
}

ValueMetadata *type metadata accessor for SQLiteDB.Row()
{
  return &type metadata for SQLiteDB.Row;
}

Swift::Double *kSecondsFromNanoseconds.unsafeMutableAddressor()
{
  return &kSecondsFromNanoseconds;
}

uint64_t one-time initialization function for kMediaML_rssi()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rssi", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rssuint64_t i = v1;
  return result;
}

Swift::String *kMediaML_rssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rssi != -1) {
    swift_once();
  }
  return &kMediaML_rssi;
}

uint64_t one-time initialization function for kMediaML_cca()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cca", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_cca = v1;
  return result;
}

Swift::String *kMediaML_cca.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_cca != -1) {
    swift_once();
  }
  return &kMediaML_cca;
}

uint64_t one-time initialization function for kMediaML_snr()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("snr", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_snr = v1;
  return result;
}

Swift::String *kMediaML_snr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_snr != -1) {
    swift_once();
  }
  return &kMediaML_snr;
}

uint64_t one-time initialization function for kMediaML_noise()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("noise", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_noise = v1;
  return result;
}

Swift::String *kMediaML_noise.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_noise != -1) {
    swift_once();
  }
  return &kMediaML_noise;
}

uint64_t one-time initialization function for kMediaML_throughputTrue()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("throughput_true", 0xFuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputTrue = v1;
  return result;
}

Swift::String *kMediaML_throughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputTrue != -1) {
    swift_once();
  }
  return &kMediaML_throughputTrue;
}

uint64_t one-time initialization function for kMediaML_txRate()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tx_rate", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_txRate = v1;
  return result;
}

Swift::String *kMediaML_txRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_txRate != -1) {
    swift_once();
  }
  return &kMediaML_txRate;
}

uint64_t one-time initialization function for kMediaML_rxRate()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rx_rate", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rxRate = v1;
  return result;
}

Swift::String *kMediaML_rxRate.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rxRate != -1) {
    swift_once();
  }
  return &kMediaML_rxRate;
}

uint64_t one-time initialization function for kMediaML_dayOfWeek()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dow", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_dayOfWeek = v1;
  return result;
}

Swift::String *kMediaML_dayOfWeek.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_dayOfWeek != -1) {
    swift_once();
  }
  return &kMediaML_dayOfWeek;
}

uint64_t one-time initialization function for kMediaML_hourOfDay()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_hourOfDay = v1;
  return result;
}

Swift::String *kMediaML_hourOfDay.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_hourOfDay != -1) {
    swift_once();
  }
  return &kMediaML_hourOfDay;
}

uint64_t one-time initialization function for kMediaML_ssid()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssid", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_ssid = v1;
  return result;
}

Swift::String *kMediaML_ssid.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssid != -1) {
    swift_once();
  }
  return &kMediaML_ssid;
}

uint64_t one-time initialization function for kMediaML_interfaceType()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ifty", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_interfaceType = v1;
  return result;
}

Swift::String *kMediaML_interfaceType.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_interfaceType != -1) {
    swift_once();
  }
  return &kMediaML_interfaceType;
}

uint64_t one-time initialization function for kMediaML_nData()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ndata", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_nData = v1;
  return result;
}

Swift::String *kMediaML_nData.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_nData != -1) {
    swift_once();
  }
  return &kMediaML_nData;
}

uint64_t one-time initialization function for kMediaML_appName()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app_name", 8uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_appName = v1;
  return result;
}

Swift::String *kMediaML_appName.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appName != -1) {
    swift_once();
  }
  return &kMediaML_appName;
}

uint64_t one-time initialization function for kMediaML_sessionID()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("session_id", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_sessionID = v1;
  return result;
}

Swift::String *kMediaML_sessionID.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionID != -1) {
    swift_once();
  }
  return &kMediaML_sessionID;
}

uint64_t one-time initialization function for kMediaML_carrier()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carrier", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_carrier = v1;
  return result;
}

Swift::String *kMediaML_carrier.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_carrier != -1) {
    swift_once();
  }
  return &kMediaML_carrier;
}

uint64_t one-time initialization function for kMediaML_rsrp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrp", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rsrp = v1;
  return result;
}

Swift::String *kMediaML_rsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrp != -1) {
    swift_once();
  }
  return &kMediaML_rsrp;
}

uint64_t one-time initialization function for kMediaML_rscp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rscp", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rscp = v1;
  return result;
}

Swift::String *kMediaML_rscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rscp != -1) {
    swift_once();
  }
  return &kMediaML_rscp;
}

uint64_t one-time initialization function for kMediaML_rsrq()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rsrq", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_rsrq = v1;
  return result;
}

Swift::String *kMediaML_rsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_rsrq != -1) {
    swift_once();
  }
  return &kMediaML_rsrq;
}

uint64_t one-time initialization function for kMediaML_bars()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_bars = v1;
  return result;
}

Swift::String *kMediaML_bars.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_bars != -1) {
    swift_once();
  }
  return &kMediaML_bars;
}

uint64_t one-time initialization function for kMediaML_count()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("count", 5uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_count = v1;
  return result;
}

Swift::String *kMediaML_count.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_count != -1) {
    swift_once();
  }
  return &kMediaML_count;
}

uint64_t one-time initialization function for kMediaML_medianThroughputTrue()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("quantile(throughput_true)", 0x19uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_medianThroughputTrue = v1;
  return result;
}

Swift::String *kMediaML_medianThroughputTrue.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_medianThroughputTrue != -1) {
    swift_once();
  }
  return &kMediaML_medianThroughputTrue;
}

uint64_t one-time initialization function for kMediaML_binnedRssi()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rssi", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRssuint64_t i = v1;
  return result;
}

Swift::String *kMediaML_binnedRssi.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRssi != -1) {
    swift_once();
  }
  return &kMediaML_binnedRssi;
}

uint64_t one-time initialization function for kMediaML_binnedRsrp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrp", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRsrp = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrp != -1) {
    swift_once();
  }
  return &kMediaML_binnedRsrp;
}

uint64_t one-time initialization function for kMediaML_binnedRsrq()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rsrq", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRsrq = v1;
  return result;
}

Swift::String *kMediaML_binnedRsrq.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRsrq != -1) {
    swift_once();
  }
  return &kMediaML_binnedRsrq;
}

uint64_t one-time initialization function for kMediaML_binnedRscp()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_rscp", 0xBuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedRscp = v1;
  return result;
}

Swift::String *kMediaML_binnedRscp.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedRscp != -1) {
    swift_once();
  }
  return &kMediaML_binnedRscp;
}

uint64_t one-time initialization function for kMediaML_binnedSnr()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("binned_snr", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_binnedSnr = v1;
  return result;
}

Swift::String *kMediaML_binnedSnr.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_binnedSnr != -1) {
    swift_once();
  }
  return &kMediaML_binnedSnr;
}

uint64_t one-time initialization function for kMediaML_throughputStdDev()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predStdDev", 0xAuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputStdDev = v1;
  return result;
}

Swift::String *kMediaML_throughputStdDev.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputStdDev != -1) {
    swift_once();
  }
  return &kMediaML_throughputStdDev;
}

uint64_t one-time initialization function for kMediaML_throughputPrediction()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("predVal", 7uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_throughputPrediction = v1;
  return result;
}

Swift::String *kMediaML_throughputPrediction.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_throughputPrediction != -1) {
    swift_once();
  }
  return &kMediaML_throughputPrediction;
}

Swift::Int *cell_signal_binsize.unsafeMutableAddressor()
{
  return &cell_signal_binsize;
}

Swift::Int *cell_snr_binsize.unsafeMutableAddressor()
{
  return &cell_snr_binsize;
}

Swift::Int *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_low_medium_boundary;
}

Swift::Int *rssiBucket_medium_high_boundary.unsafeMutableAddressor()
{
  return &rssiBucket_medium_high_boundary;
}

uint64_t one-time initialization function for rssiBucket_low()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("low", 3uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_low = v1;
  return result;
}

Swift::String *rssiBucket_low.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_low != -1) {
    swift_once();
  }
  return &rssiBucket_low;
}

uint64_t one-time initialization function for rssiBucket_medium()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_medium = v1;
  return result;
}

Swift::String *rssiBucket_medium.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_medium != -1) {
    swift_once();
  }
  return &rssiBucket_medium;
}

uint64_t one-time initialization function for rssiBucket_high()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("high", 4uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  rssiBucket_high = v1;
  return result;
}

Swift::String *rssiBucket_high.unsafeMutableAddressor()
{
  if (one-time initialization token for rssiBucket_high != -1) {
    swift_once();
  }
  return &rssiBucket_high;
}

uint64_t one-time initialization function for kMediaML_trainingRowCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingRowCount", 0x10uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_trainingRowCount = v1;
  return result;
}

Swift::String *kMediaML_trainingRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingRowCount != -1) {
    swift_once();
  }
  return &kMediaML_trainingRowCount;
}

uint64_t one-time initialization function for kMediaML_validationRowCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationRowCount", 0x12uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_validationRowCount = v1;
  return result;
}

Swift::String *kMediaML_validationRowCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationRowCount != -1) {
    swift_once();
  }
  return &kMediaML_validationRowCount;
}

uint64_t one-time initialization function for kMediaML_ssidCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ssidCount", 9uLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_ssidCount = v1;
  return result;
}

Swift::String *kMediaML_ssidCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_ssidCount != -1) {
    swift_once();
  }
  return &kMediaML_ssidCount;
}

uint64_t one-time initialization function for kMediaML_appNameCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appNameCount", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_appNameCount = v1;
  return result;
}

Swift::String *kMediaML_appNameCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_appNameCount != -1) {
    swift_once();
  }
  return &kMediaML_appNameCount;
}

uint64_t one-time initialization function for kMediaML_sessionIDCount()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sessionIDCount", 0xEuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_sessionIDCount = v1;
  return result;
}

Swift::String *kMediaML_sessionIDCount.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_sessionIDCount != -1) {
    swift_once();
  }
  return &kMediaML_sessionIDCount;
}

uint64_t one-time initialization function for kMediaML_trainingMAPE()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("trainingMAPE", 0xCuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_trainingMAPE = v1;
  return result;
}

Swift::String *kMediaML_trainingMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_trainingMAPE != -1) {
    swift_once();
  }
  return &kMediaML_trainingMAPE;
}

uint64_t one-time initialization function for kMediaML_validationMAPE()
{
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("validationMAPE", 0xEuLL, 1);
  uint64_t result = v1._countAndFlagsBits;
  kMediaML_validationMAPE = v1;
  return result;
}

Swift::String *kMediaML_validationMAPE.unsafeMutableAddressor()
{
  if (one-time initialization token for kMediaML_validationMAPE != -1) {
    swift_once();
  }
  return &kMediaML_validationMAPE;
}

uint64_t one-time initialization function for mediaMLBaseDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLBaseDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLBaseDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/", 0x24uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLBaseDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLBaseDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLBaseDirectory);
}

uint64_t one-time initialization function for mediaMLModelDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLModelDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLModelDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/model/", 0x2AuLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLModelDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLModelDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLModelDirectory);
}

uint64_t one-time initialization function for mediaMLDataDirectory()
{
  uint64_t v1 = type metadata accessor for URL();
  __swift_allocate_value_buffer(v1, mediaMLDataDirectory);
  __swift_project_value_buffer(v1, (uint64_t)mediaMLDataDirectory);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/private/var/mobile/Library/MediaML/data/", 0x29uLL, 1);
  URL.init(fileURLWithPath:)();
  return swift_bridgeObjectRelease();
}

uint64_t mediaMLDataDirectory.unsafeMutableAddressor()
{
  if (one-time initialization token for mediaMLDataDirectory != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)mediaMLDataDirectory);
}

Swift::Int *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_RAW_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_PRUNE;
}

Swift::Int *MAX_ALLOWED_PROCESSED_DATASIZE_WRITE.unsafeMutableAddressor()
{
  return &MAX_ALLOWED_PROCESSED_DATASIZE_WRITE;
}

Swift::Int *DB_DELETION_BUCKET_SIZE.unsafeMutableAddressor()
{
  return &DB_DELETION_BUCKET_SIZE;
}

Swift::Int *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_WiFi;
}

Swift::Int *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor()
{
  return &kMediaML_InterfaceType_Cellular;
}

Swift::Int *maxThroughput.unsafeMutableAddressor()
{
  return &maxThroughput;
}

Swift::Int *minSignalStrength.unsafeMutableAddressor()
{
  return &minSignalStrength;
}

Swift::Int *minNoise.unsafeMutableAddressor()
{
  return &minNoise;
}

Swift::Double *maxTxRate.unsafeMutableAddressor()
{
  return &maxTxRate;
}

Swift::Double *maxRxRate.unsafeMutableAddressor()
{
  return &maxRxRate;
}

Swift::Int *minSSIDLength.unsafeMutableAddressor()
{
  return &minSSIDLength;
}

Swift::Int *maxSSIDLength.unsafeMutableAddressor()
{
  return &maxSSIDLength;
}

Swift::Int *maxBars.unsafeMutableAddressor()
{
  return &maxBars;
}

Swift::Double *testTrainSplitRatio.unsafeMutableAddressor()
{
  return &testTrainSplitRatio;
}

Swift::Int *seed.unsafeMutableAddressor()
{
  return &seed;
}

Swift::Int *maxIters.unsafeMutableAddressor()
{
  return &maxIters;
}

Swift::Int *maxDepth.unsafeMutableAddressor()
{
  return &maxDepth;
}

Swift::Double *minimumLossReduction.unsafeMutableAddressor()
{
  return &minimumLossReduction;
}

Swift::Int *parallelTreeCount.unsafeMutableAddressor()
{
  return &parallelTreeCount;
}

Swift::Double *modelMAPEThreshold.unsafeMutableAddressor()
{
  return &modelMAPEThreshold;
}

uint64_t variable initialization expression of ModelStats.interfaceType()
{
  return 0;
}

uint64_t ModelStats.interfaceType.getter()
{
  return *(void *)v0;
}

uint64_t ModelStats.interfaceType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ModelStats.interfaceType.modify())()
{
  return ModelStats.interfaceType.modify;
}

uint64_t variable initialization expression of ModelStats.trainingRowCount()
{
  return 0;
}

uint64_t ModelStats.trainingRowCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ModelStats.trainingRowCount.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*ModelStats.trainingRowCount.modify())()
{
  return ModelStats.trainingRowCount.modify;
}

uint64_t variable initialization expression of ModelStats.validationRowCount()
{
  return 0;
}

uint64_t ModelStats.validationRowCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ModelStats.validationRowCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*ModelStats.validationRowCount.modify())()
{
  return ModelStats.validationRowCount.modify;
}

uint64_t variable initialization expression of ModelStats.carrierCount()
{
  return 0;
}

uint64_t ModelStats.carrierCount.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t ModelStats.carrierCount.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*ModelStats.carrierCount.modify())()
{
  return ModelStats.carrierCount.modify;
}

uint64_t variable initialization expression of ModelStats.ssidCount()
{
  return 0;
}

uint64_t ModelStats.ssidCount.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t ModelStats.ssidCount.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*ModelStats.ssidCount.modify())()
{
  return ModelStats.ssidCount.modify;
}

uint64_t variable initialization expression of ModelStats.appNameCount()
{
  return 0;
}

uint64_t ModelStats.appNameCount.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t ModelStats.appNameCount.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*ModelStats.appNameCount.modify())()
{
  return ModelStats.appNameCount.modify;
}

uint64_t variable initialization expression of ModelStats.sessionIDCount()
{
  return 0;
}

uint64_t ModelStats.sessionIDCount.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t ModelStats.sessionIDCount.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*ModelStats.sessionIDCount.modify())()
{
  return ModelStats.sessionIDCount.modify;
}

double variable initialization expression of ModelStats.trainingMAPE()
{
  return 0.0;
}

double ModelStats.trainingMAPE.getter()
{
  return *(double *)(v0 + 56);
}

void ModelStats.trainingMAPE.setter(double a1)
{
  *(double *)(v1 + 56) = a1;
}

uint64_t (*ModelStats.trainingMAPE.modify())()
{
  return ModelStats.trainingMAPE.modify;
}

double variable initialization expression of ModelStats.validationMAPE()
{
  return 0.0;
}

double ModelStats.validationMAPE.getter()
{
  return *(double *)(v0 + 64);
}

void ModelStats.validationMAPE.setter(double a1)
{
  *(double *)(v1 + 64) = a1;
}

uint64_t (*ModelStats.validationMAPE.modify())()
{
  return ModelStats.validationMAPE.modify;
}

uint64_t variable initialization expression of ModelStats.trainingDate()
{
  return 0;
}

uint64_t ModelStats.trainingDate.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t ModelStats.trainingDate.setter(uint64_t result)
{
  *(void *)(v1 + 72) = result;
  return result;
}

uint64_t (*ModelStats.trainingDate.modify())()
{
  return ModelStats.trainingDate.modify;
}

void __swiftcall ModelStats.init()(MediaML::ModelStats *__return_ptr retstr)
{
  retstr->interfaceType = 0;
  retstr->trainingRowCount = 0;
  retstr->validationRowCount = 0;
  retstr->carrierCount = 0;
  retstr->ssidCount = 0;
  retstr->appNameCount = 0;
  retstr->sessionIDCount = 0;
  retstr->trainingMAPE = 0.0;
  retstr->validationMAPE = 0.0;
  retstr->trainingDate = 0;
}

uint64_t default argument 0 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 1 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 2 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 3 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 4 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 5 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

uint64_t default argument 6 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

double default argument 7 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0.0;
}

double default argument 8 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0.0;
}

uint64_t default argument 9 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)()
{
  return 0;
}

void __swiftcall ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)(MediaML::ModelStats *__return_ptr retstr, Swift::Int interfaceType, Swift::Int trainingRowCount, Swift::Int validationRowCount, Swift::Int carrierCount, Swift::Int ssidCount, Swift::Int appNameCount, Swift::Int sessionIDCount, Swift::Double trainingMAPE, Swift::Double validationMAPE, Swift::Int trainingDate)
{
  retstr->interfaceType = interfaceType;
  retstr->trainingRowCount = trainingRowCount;
  retstr->validationRowCount = validationRowCount;
  retstr->carrierCount = carrierCount;
  retstr->ssidCount = ssidCount;
  retstr->appNameCount = appNameCount;
  retstr->sessionIDCount = sessionIDCount;
  retstr->trainingMAPE = trainingMAPE;
  retstr->validationMAPE = validationMAPE;
  retstr->trainingDate = trainingDate;
}

Swift::Int __swiftcall getDateInEpoch()()
{
  v2[0] = "Fatal error";
  v2[1] = "Double value cannot be converted to Int because it is either infinite or NaN";
  v2[2] = "Swift/IntegerTypes.swift";
  v2[3] = "Double value cannot be converted to Int because the result would be less than Int.min";
  v2[4] = "Double value cannot be converted to Int because the result would be greater than Int.max";
  uint64_t v9 = 0;
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v7 - 8);
  uint64_t v5 = v7 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v6 = (char *)v2 - v3;
  Date.init()();
  Date.timeIntervalSince1970.getter();
  double v8 = v0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v7);
  if (((*(void *)&v8 >> 52) & 0x7FFLL) == 0x7FF)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v8 <= -9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v8 >= 9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return (uint64_t)v8;
}

uint64_t WiFiModelGuts.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  unint64_t v47 = 0;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  uint64_t v35 = *(void *)(v38 - 8);
  uint64_t v36 = v38 - 8;
  unint64_t v17 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v17 - v17;
  uint64_t v49 = (char *)&v17 - v17;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OneHotEncoder<String>);
  unint64_t v18 = (*(void *)(*(void *)(v25 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v25);
  uint64_t v24 = (char *)&v17 - v18;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  uint64_t v39 = *(void *)(v42 - 8);
  uint64_t v40 = v42 - 8;
  unint64_t v19 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v17 - v19;
  uint64_t v48 = (char *)&v17 - v19;
  uint64_t v46 = type metadata accessor for BoostedTreeConfiguration();
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = v46 - 8;
  unint64_t v20 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v46);
  uint64_t v32 = (char *)&v17 - v20;
  unint64_t v21 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v17 - v20);
  uint64_t v45 = (char *)&v17 - v21;
  unint64_t v47 = (char *)&v17 - v21;
  BoostedTreeConfiguration.init()();
  BoostedTreeConfiguration.randomSeed.setter();
  BoostedTreeConfiguration.maximumIterations.setter();
  BoostedTreeConfiguration.maximumDepth.setter();
  uint64_t v28 = MEMORY[0x263F8D310];
  uint64_t v23 = _allocateUninitializedArray<A>(_:)();
  unint64_t v22 = v2;
  unint64_t v3 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v3, v22);
  uint64_t v4 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v4, v22 + 2);
  uint64_t v5 = v23;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v26 = v5;
  OneHotEncoder.init()();
  lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
  ColumnSelector.init(columns:estimator:)();
  Swift::String v30 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v29 = _allocateUninitializedArray<A>(_:)();
  int v27 = v6;
  uint64_t v7 = kMediaML_rssi.unsafeMutableAddressor();
  outlined init with copy of String(v7, v27);
  double v8 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v8, v27 + 2);
  uint64_t v9 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v9, v27 + 4);
  uint64_t v10 = kMediaML_hourOfDay.unsafeMutableAddressor();
  outlined init with copy of String(v10, v27 + 6);
  int v11 = kMediaML_dayOfWeek.unsafeMutableAddressor();
  outlined init with copy of String(v11, v27 + 8);
  unsigned int v12 = kMediaML_noise.unsafeMutableAddressor();
  outlined init with copy of String(v12, v27 + 10);
  int v13 = kMediaML_txRate.unsafeMutableAddressor();
  outlined init with copy of String(v13, v27 + 12);
  int v14 = kMediaML_rxRate.unsafeMutableAddressor();
  outlined init with copy of String(v14, v27 + 14);
  uint64_t v15 = v29;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v31 = v15;
  BoostedTreeConfiguration.init()();
  BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)();
  unint64_t v34 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  UpdatableTabularEstimator.appending<A>(_:)();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v45, v46);
}

void *outlined init with copy of String(void *a1, void *a2)
{
  *a2 = *a1;
  uint64_t v4 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  a2[1] = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>;
  if (!lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for OneHotEncoder<String>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>;
  if (!lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for OneHotEncoder<String>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type OneHotEncoder<String> and conformance OneHotEncoder<A>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>;
  if (!lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>;
  if (!lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>);
    return WitnessTable;
  }
  return v2;
}

uint64_t CellModelGuts.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  unint64_t v47 = 0;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  uint64_t v35 = *(void *)(v38 - 8);
  uint64_t v36 = v38 - 8;
  unint64_t v16 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v38);
  uint64_t v37 = (char *)&v16 - v16;
  uint64_t v49 = (char *)&v16 - v16;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OneHotEncoder<String>);
  unint64_t v17 = (*(void *)(*(void *)(v24 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24);
  uint64_t v23 = (char *)&v16 - v17;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  uint64_t v39 = *(void *)(v42 - 8);
  uint64_t v40 = v42 - 8;
  unint64_t v18 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v16 - v18;
  uint64_t v48 = (char *)&v16 - v18;
  uint64_t v46 = type metadata accessor for BoostedTreeConfiguration();
  uint64_t v43 = *(void *)(v46 - 8);
  uint64_t v44 = v46 - 8;
  unint64_t v19 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v46);
  uint64_t v31 = (char *)&v16 - v19;
  unint64_t v20 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v19);
  uint64_t v45 = (char *)&v16 - v20;
  unint64_t v47 = (char *)&v16 - v20;
  BoostedTreeConfiguration.init()();
  BoostedTreeConfiguration.randomSeed.setter();
  uint64_t v27 = MEMORY[0x263F8D310];
  uint64_t v22 = _allocateUninitializedArray<A>(_:)();
  unint64_t v21 = v2;
  unint64_t v3 = kMediaML_carrier.unsafeMutableAddressor();
  outlined init with copy of String(v3, v21);
  uint64_t v4 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v4, v21 + 2);
  uint64_t v5 = v22;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v25 = v5;
  OneHotEncoder.init()();
  lazy protocol witness table accessor for type OneHotEncoder<String> and conformance OneHotEncoder<A>();
  ColumnSelector.init(columns:estimator:)();
  uint64_t v6 = kMediaML_throughputTrue.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v6->_countAndFlagsBits;
  object = v6->_object;
  swift_bridgeObjectRetain();
  uint64_t v28 = _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v7;
  double v8 = kMediaML_binnedRssi.unsafeMutableAddressor();
  outlined init with copy of String(v8, v26);
  uint64_t v9 = kMediaML_binnedRsrp.unsafeMutableAddressor();
  outlined init with copy of String(v9, v26 + 2);
  uint64_t v10 = kMediaML_binnedRsrq.unsafeMutableAddressor();
  outlined init with copy of String(v10, v26 + 4);
  int v11 = kMediaML_binnedRscp.unsafeMutableAddressor();
  outlined init with copy of String(v11, v26 + 6);
  unsigned int v12 = kMediaML_binnedSnr.unsafeMutableAddressor();
  outlined init with copy of String(v12, v26 + 8);
  int v13 = kMediaML_bars.unsafeMutableAddressor();
  outlined init with copy of String(v13, v26 + 10);
  uint64_t v14 = v28;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v30 = v14;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v31, v45, v46);
  BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)();
  unint64_t v34 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  UpdatableTabularEstimator.appending<A>(_:)();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v45, v46);
}

uint64_t WifiModel.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static WifiModel.logger);
}

uint64_t static WifiModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = WifiModel.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

void variable initialization expression of WifiModel.model(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
}

uint64_t key path getter for WifiModel.model : WifiModel@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  uint64_t v7 = v4;
  (*(void (**)(uint64_t))(*(void *)v4 + 120))(v2);
  outlined init with take of Transformer?(v6, a2);
  return swift_release();
}

uint64_t key path setter for WifiModel.model : WifiModel(void *a1, uint64_t *a2)
{
  outlined init with copy of Transformer?(a1, v5);
  uint64_t v4 = *a2;
  swift_retain();
  (*(void (**)(void *))(*(void *)v4 + 128))(v5);
  return swift_release();
}

uint64_t WifiModel.model.getter@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  outlined init with copy of Transformer?((void *)(v1 + 112), a1);
  return swift_endAccess();
}

void *outlined init with copy of Transformer?(void *a1, void *a2)
{
  if (a1[3])
  {
    uint64_t v2 = a1[3];
    a2[3] = v2;
    a2[4] = a1[4];
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t WifiModel.model.setter(void *a1)
{
  outlined init with copy of Transformer?(a1, v4);
  swift_beginAccess();
  outlined assign with take of Transformer?(v4, (void *)(v1 + 112));
  swift_endAccess();
  return outlined destroy of Transformer?((uint64_t)a1);
}

void *outlined assign with take of Transformer?(const void *a1, void *a2)
{
  if (a2[3])
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a2);
    memcpy(a2, a1, 0x28uLL);
  }
  else
  {
    memcpy(a2, a1, 0x28uLL);
  }
  return a2;
}

uint64_t outlined destroy of Transformer?(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t (*WifiModel.model.modify())()
{
  return WifiModel.model.modify;
}

uint64_t WifiModel.model.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of WifiModel.parametersURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v1 = (char *)&v4 - v5;
  uint64_t v10 = (char *)&v4 - v5;
  uint64_t v2 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v1, v2, v11);
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wifiParameters.pkg", 0x12uLL, 1)._object;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t WifiModel.parametersURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of WifiModel.targetColumnID()
{
  return ColumnID.init(_:_:)();
}

uint64_t WifiModel.targetColumnID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of WifiModel.estimator@<X0>(uint64_t a1@<X8>)
{
  return WiFiModelGuts.estimator.getter(a1);
}

uint64_t WifiModel.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t WifiModel.__allocating_init()()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = WifiModel.__allocating_init();
  return WifiModel.init()();
}

uint64_t WifiModel.__allocating_init()(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t WifiModel.init()()
{
  v1[9] = v0;
  v1[2] = v1;
  v1[3] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v7 - 8);
  uint64_t v6 = swift_task_alloc();
  v1[13] = v6;
  v1[3] = v9;
  swift_defaultActor_initialize();
  v9[14] = 0;
  v9[15] = 0;
  v9[16] = 0;
  v9[17] = 0;
  v9[18] = 0;
  uint64_t v3 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v7);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wifiParameters.pkg", 0x12uLL, 1);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  ColumnID.init(_:_:)();
  uint64_t v8 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  WiFiModelGuts.init()();
  WiFiModelGuts.estimator.getter((uint64_t)v9 + v8);
  return MEMORY[0x270FA2498](WifiModel.init(), v9, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 88);
  unint64_t v16 = *(void *)(v0 + 80);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = WifiModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v1, v2, v16);
  unint64_t v19 = Logger.logObject.getter();
  unint64_t v18 = static os_log_type_t.info.getter();
  *(void *)(v0 + 32) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  unint64_t v17 = *(unsigned int *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  unint64_t v20 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v19, v18))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v11 = createStorage<A>(capacity:type:)(0);
    unsigned int v12 = createStorage<A>(capacity:type:)(0);
    *(void *)(v14 + 40) = buf;
    *(void *)(v14 + 48) = v11;
    *(void *)(v14 + 56) = v12;
    serialize(_:at:)(0, (unsigned char **)(v14 + 40));
    serialize(_:at:)(0, (unsigned char **)(v14 + 40));
    *(void *)(v14 + 64) = v20;
    int v13 = (void *)swift_task_alloc();
    void v13[2] = v14 + 40;
    v13[3] = v14 + 48;
    void v13[4] = v14 + 56;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, v19, v18, "New WiFi Model created", buf, v17);
    destroyStorage<A>(_:count:)(v11, 0, v9);
    destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v14 + 96);
  uint64_t v7 = *(void *)(v14 + 80);
  uint64_t v6 = *(void *)(v14 + 88);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v14 + 16) + 8);
  uint64_t v4 = *(void *)(v14 + 72);
  return v3(v4);
}

uint64_t WifiModel.train(traindata_url:)(uint64_t a1, uint64_t a2)
{
  v3[18] = v2;
  v3[17] = a2;
  v3[16] = a1;
  v3[13] = v3;
  v3[14] = 0;
  v3[15] = 0;
  type metadata accessor for CSVReadingOptions();
  v3[19] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for URL();
  v3[20] = v4;
  v3[21] = *(void *)(v4 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DataFrame();
  v3[23] = v5;
  v3[24] = *(void *)(v5 - 8);
  v3[25] = swift_task_alloc();
  v3[14] = a2;
  v3[15] = v8;
  return MEMORY[0x270FA2498](WifiModel.train(traindata_url:), v8, 0);
}

uint64_t WifiModel.train(traindata_url:)()
{
  uint64_t v1 = v0[21];
  uint64_t v7 = v0[19];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 16))();
  default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)(v7);
  DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v6 + 144) + 160)
                                                + **(int **)(**(void **)(v6 + 144) + 160));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 208) = v2;
  *uint64_t v2 = *(void *)(v6 + 104);
  v2[1] = WifiModel.train(traindata_url:);
  uint64_t v3 = *(void *)(v6 + 200);
  return v5(v6 + 16, v3);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[13] = *v1;
  v5[27] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[18];
    uint64_t v3 = WifiModel.train(traindata_url:);
  }
  else
  {
    uint64_t v2 = v5[18];
    uint64_t v3 = WifiModel.train(traindata_url:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void *__dst;
  uint64_t v5;

  uint64_t v1 = v0[24];
  __dst = (void *)v0[16];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 8))();
  outlined init with take of ModelStats?(v0 + 2, __dst);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[25];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[23];
  v0[13] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[13] + 8);
  return v4();
}

uint64_t default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)()
{
  uint64_t v0 = specialized static Array._allocateUninitialized(_:)(0);
  return specialized Dictionary.init(dictionaryLiteral:)(v0);
}

uint64_t default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v9 = a1;
  uint64_t v6 = type metadata accessor for CSVType();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v5 = v6 - 8;
  unint64_t v3 = (*(void *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  unsigned int v12 = (char *)&v2 - v3;
  uint64_t v14 = default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  uint64_t v10 = default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  uint64_t v11 = default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v12, *MEMORY[0x263F1BF38], v6);
  Builtin::Word v7 = 1;
  int v13 = 1;
  Swift::String v8 = Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(",", 1uLL, 1);
  Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)("\\"", v7, v13 & 1);
  return CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)();
}

uint64_t WifiModel.train(dataFrame:)(uint64_t a1, uint64_t a2)
{
  v3[42] = v2;
  v3[41] = a2;
  v3[40] = a1;
  v3[43] = *v2;
  v3[27] = v3;
  v3[28] = 0;
  v3[29] = 0;
  v3[35] = 0;
  v3[36] = 0;
  memset(v3 + 12, 0, 0x50uLL);
  uint64_t v4 = type metadata accessor for URL();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AnyColumnSlice();
  v3[53] = v6;
  v3[54] = *(void *)(v6 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v3[58] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame.Rows();
  v3[59] = v7;
  v3[60] = *(void *)(v7 - 8);
  v3[61] = swift_task_alloc();
  v3[62] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  v3[63] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v3[64] = v8;
  v3[65] = *(void *)(v8 - 8);
  v3[66] = swift_task_alloc();
  v3[67] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v3[68] = v9;
  v3[69] = *(void *)(v9 - 8);
  v3[70] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for DataFrame();
  v3[71] = v10;
  v3[72] = *(void *)(v10 - 8);
  v3[73] = swift_task_alloc();
  v3[74] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for DataFrame.Slice();
  v3[75] = v11;
  v3[76] = *(void *)(v11 - 8);
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[80] = swift_task_alloc();
  v3[28] = a2;
  v3[29] = v14;
  return MEMORY[0x270FA2498](WifiModel.train(dataFrame:), v14, 0);
}

uint64_t WifiModel.train(dataFrame:)()
{
  uint64_t v56 = v0[80];
  uint64_t v61 = v0[79];
  uint64_t v58 = v0[78];
  uint64_t v62 = v0[77];
  uint64_t v57 = v0[76];
  uint64_t v59 = v0[75];
  v0[27] = v0;
  DataFrameProtocol.randomSplit(by:seed:)();
  unint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  v60(v58, v56, v59);
  DataFrame.init(_:)();
  v60(v58, v61, v59);
  DataFrame.init(_:)();
  BOOL v63 = DataFrame.Slice.shape.getter() <= 0;
  v60(v62, v61, v59);
  BOOL v54 = !v63 && DataFrame.Slice.shape.getter() > 0;
  uint64_t v1 = *(void *)(v55 + 616);
  uint64_t v2 = *(void *)(v55 + 600);
  uint64_t v3 = *(void *)(v55 + 608) + 8;
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))v3;
  *(void *)(v55 + 648) = *(void *)v3;
  *(void *)(v55 + 656) = v3 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v53(v1, v2);
  if (v54)
  {
    uint64_t v44 = *(void *)(v55 + 584);
    uint64_t v45 = *(void *)(v55 + 568);
    uint64_t v4 = *(void *)(v55 + 536);
    uint64_t v5 = *(void *)(v55 + 512);
    uint64_t v46 = *(void *)(v55 + 504);
    uint64_t v43 = *(void *)(v55 + 576);
    uint64_t v47 = *(void *)(v55 + 344);
    uint64_t v6 = *(void *)(v55 + 336) + OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
    uint64_t v7 = *(void *)(v55 + 520) + 16;
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))v7;
    *(void *)(v55 + 664) = *(void *)v7;
    *(void *)(v55 + 672) = v7 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v8(v4, v6, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v46, v44, v45);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v46, 0, 1, v45);
    uint64_t v9 = swift_allocObject();
    *(void *)(v55 + 680) = v9;
    *(void *)(v9 + 16) = v47;
    uint64_t v51 = v9;
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    unint64_t v50 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    unint64_t v10 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    *(void *)(v55 + 176) = v48;
    *(void *)(v55 + 184) = v49;
    *(void *)(v55 + 192) = v50;
    *(void *)(v55 + 200) = v10;
    *(void *)(v55 + 208) = MEMORY[0x263F8D568];
    uint64_t v52 = *(void *)(swift_getOpaqueTypeConformance2() + 8);
    *(void *)(v55 + 688) = v52;
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v55 + 696) = v11;
    *uint64_t v11 = *(void *)(v55 + 216);
    v11[1] = WifiModel.train(dataFrame:);
    uint64_t v12 = *(void *)(v55 + 592);
    uint64_t v13 = *(void *)(v55 + 560);
    uint64_t v14 = *(void *)(v55 + 512);
    uint64_t v15 = *(void *)(v55 + 504);
    return MEMORY[0x270EEA810](v13, v12, v15, partial apply for closure #1 in WifiModel.train(dataFrame:), v51, v14, v52);
  }
  else
  {
    uint64_t v16 = *(void *)(v55 + 392);
    uint64_t v38 = *(void *)(v55 + 376);
    uint64_t v37 = *(void *)(v55 + 384);
    uint64_t v17 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v16, v17, v38);
    oslog = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    *(void *)(v55 + 240) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v55 + 784);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v42 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v40))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v34 = createStorage<A>(capacity:type:)(0);
      uint64_t v35 = createStorage<A>(capacity:type:)(0);
      *(void *)(v55 + 248) = buf;
      *(void *)(v55 + 256) = v34;
      *(void *)(v55 + 264) = v35;
      serialize(_:at:)(0, (unsigned char **)(v55 + 248));
      serialize(_:at:)(0, (unsigned char **)(v55 + 248));
      *(void *)(v55 + 272) = v42;
      uint64_t v36 = (void *)swift_task_alloc();
      v36[2] = v55 + 248;
      v36[3] = v55 + 256;
      v36[4] = v55 + 264;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, oslog, v40, "Wifi: Training or validation data is empty", buf, size);
      destroyStorage<A>(_:count:)(v34, 0, v32);
      destroyStorage<A>(_:count:)(v35, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v29 = *(void *)(v55 + 640);
    uint64_t v28 = *(void *)(v55 + 632);
    uint64_t v30 = *(void *)(v55 + 600);
    uint64_t v25 = *(void *)(v55 + 592);
    uint64_t v24 = *(void *)(v55 + 584);
    uint64_t v26 = *(void *)(v55 + 568);
    uint64_t v21 = *(void *)(v55 + 392);
    uint64_t v22 = *(void *)(v55 + 376);
    uint64_t v23 = *(void *)(v55 + 576);
    uint64_t v20 = *(void *)(v55 + 384);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v27(v24, v26);
    v27(v25, v26);
    v53(v28, v30);
    v53(v29, v30);
    uint64_t v31 = *(void *)(v55 + 320);
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
    swift_task_dealloc();
    *(void *)uint64_t v31 = 0;
    *(void *)(v31 + 8) = 0;
    *(void *)(v31 + 16) = 0;
    *(void *)(v31 + 24) = 0;
    *(void *)(v31 + 32) = 0;
    *(void *)(v31 + 40) = 0;
    *(void *)(v31 + 48) = 0;
    *(void *)(v31 + 56) = 0;
    *(void *)(v31 + 64) = 0;
    *(void *)(v31 + 72) = 0;
    *(unsigned char *)(v31 + 80) = 1;
    unint64_t v18 = *(uint64_t (**)(void))(*(void *)(v55 + 216) + 8);
    return v18();
  }
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;

  uint64_t v15 = (void *)*v1;
  v15[27] = *v1;
  v15[88] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = v15[42];
    return MEMORY[0x270FA2498](WifiModel.train(dataFrame:), v8, 0);
  }
  else
  {
    uint64_t v12 = v15[67];
    unint64_t v10 = v15[65];
    uint64_t v11 = v15[64];
    uint64_t v9 = v15[63];
    uint64_t v13 = v15[42];
    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in WifiModel.train(dataFrame:));
    outlined destroy of DataFrame?(v9);
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v15[89] = v2;
    v15[90] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v2(v12, v11);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v13 + 168)
                                                            + **(int **)(*(void *)v13 + 168));
    uint64_t v3 = (void *)swift_task_alloc();
    v15[91] = v3;
    v15[92] = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
    *uint64_t v3 = v15[27];
    v3[1] = WifiModel.train(dataFrame:);
    uint64_t v4 = v15[74];
    uint64_t v5 = v15[70];
    uint64_t v6 = v15[68];
    return v14(v4, v5, v6);
  }
}

{
  uint64_t v0;
  Swift::String *v1;
  Swift::String *v2;
  Swift::Int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(void);
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint32_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *log;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint32_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  NSObject *oslog;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint8_t *buf;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t);
  uint64_t v102;
  uint64_t countAndFlagsBits;
  uint64_t v104;
  void *object;
  uint64_t v106;
  Swift::String v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t trainingRowCount;
  uint64_t validationRowCount;
  uint64_t ssidCount;
  uint64_t appNameCount;
  uint64_t sessionIDCount;
  Swift::Double trainingMAPE;
  Swift::Double validationMAPE;
  Swift::Int trainingDate;
  Swift::Int interfaceType;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  NSObject *v160;
  os_log_type_t v161;
  uint8_t *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  uint64_t v166;
  uint8_t *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t (*v170)(uint64_t, uint64_t, uint64_t);
  uint64_t v171;
  uint8_t *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t (*v175)(uint64_t, uint64_t, uint64_t);
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;

  uint64_t v177 = v0;
  validationMAPE = *(double *)(v0 + 768);
  trainingMAPE = *(double *)(v0 + 744);
  int v99 = *(void *)(v0 + 496);
  uint64_t v102 = *(void *)(v0 + 488);
  unint64_t v98 = *(void *)(v0 + 480);
  uint32_t v100 = *(void *)(v0 + 472);
  uint64_t v106 = *(void *)(v0 + 464);
  uint64_t v108 = *(void *)(v0 + 456);
  uint64_t v115 = *(void *)(v0 + 448);
  uint64_t v110 = *(void *)(v0 + 440);
  uint64_t v104 = *(void *)(v0 + 432);
  int v113 = *(void *)(v0 + 424);
  uint64_t v112 = *(void *)(v0 + 416);
  uint64_t v135 = *(void *)(v0 + 384);
  uint64_t v136 = *(void *)(v0 + 376);
  *(void *)(v0 + 216) = v0;
  *(Swift::Double *)(v0 + 288) = validationMAPE;
  interfaceType = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
  DataFrame.Slice.rows.getter();
  trainingRowCount = DataFrame.Rows.count.getter();
  uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v101(v99, v100);
  DataFrame.Slice.rows.getter();
  validationRowCount = DataFrame.Rows.count.getter();
  v101(v102, v100);
  uint64_t v1 = kMediaML_ssid.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v1->_countAndFlagsBits;
  object = v1->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x25A298040](countAndFlagsBits, object);
  AnyColumnSlice.distinct()();
  uint64_t v114 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
  v114(v108, v113);
  swift_bridgeObjectRelease();
  ssidCount = AnyColumnSlice.count.getter();
  v114(v106, v113);
  uint64_t v107 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A298040](v107._countAndFlagsBits, v107._object);
  AnyColumnSlice.distinct()();
  v114(v115, v113);
  swift_bridgeObjectRelease();
  appNameCount = AnyColumnSlice.count.getter();
  v114(v108, v113);
  uint64_t v2 = kMediaML_sessionID.unsafeMutableAddressor();
  uint64_t v109 = v2->_countAndFlagsBits;
  uint64_t v111 = v2->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x25A298040](v109, v111);
  AnyColumnSlice.distinct()();
  v114(v110, v113);
  swift_bridgeObjectRelease();
  sessionIDCount = AnyColumnSlice.count.getter();
  v114(v115, v113);
  trainingDate = getDateInEpoch()();
  uint64_t v3 = default argument 3 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)((MediaML::ModelStats *)(v0 + 16), interfaceType, trainingRowCount, validationRowCount, v3, ssidCount, appNameCount, sessionIDCount, trainingMAPE, validationMAPE, trainingDate);
  uint64_t v125 = *(void *)(v0 + 16);
  unint64_t v126 = *(void *)(v0 + 24);
  unint64_t v127 = *(void *)(v0 + 32);
  v128 = *(void *)(v0 + 40);
  uint64_t v129 = *(void *)(v0 + 48);
  uint64_t v130 = *(void *)(v0 + 56);
  uint64_t v131 = *(void *)(v0 + 64);
  uint64_t v132 = *(void *)(v0 + 72);
  uint64_t v133 = *(void *)(v0 + 80);
  uint64_t v134 = *(void *)(v0 + 88);
  *(void *)(v0 + 96) = v125;
  *(void *)(v0 + 104) = v126;
  *(void *)(v0 + 112) = v127;
  *(void *)(v0 + 120) = v128;
  *(void *)(v0 + 128) = v129;
  *(void *)(v0 + 136) = v130;
  *(void *)(v0 + 144) = v131;
  *(void *)(v0 + 152) = v132;
  *(void *)(v0 + 160) = v133;
  *(void *)(v0 + 168) = v134;
  uint64_t v4 = WifiModel.logger.unsafeMutableAddressor();
  uint64_t v137 = *(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16);
  v137(v112, v4, v136);
  uint64_t v139 = swift_allocObject();
  memcpy((void *)(v139 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v141 = swift_allocObject();
  memcpy((void *)(v141 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v143 = swift_allocObject();
  memcpy((void *)(v143 + 16), (const void *)(v0 + 16), 0x50uLL);
  Swift::Int v145 = swift_allocObject();
  memcpy((void *)(v145 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v160 = Logger.logObject.getter();
  int v161 = static os_log_type_t.info.getter();
  *(void *)(v0 + 296) = 42;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 788);
  Swift::Int v147 = swift_allocObject();
  *(unsigned char *)(v147 + 16) = 0;
  Swift::Int v148 = swift_allocObject();
  *(unsigned char *)(v148 + 16) = 8;
  uint64_t v140 = swift_allocObject();
  *(void *)(v140 + 16) = partial apply for implicit closure #2 in WifiModel.train(dataFrame:);
  *(void *)(v140 + 24) = v139;
  Swift::Int v149 = swift_allocObject();
  *(void *)(v149 + 16) = _sSiIegd_SiIegr_TRTA_1;
  *(void *)(v149 + 24) = v140;
  Swift::Int v150 = swift_allocObject();
  *(unsigned char *)(v150 + 16) = 0;
  double v151 = swift_allocObject();
  *(unsigned char *)(v151 + 16) = 8;
  int v142 = swift_allocObject();
  *(void *)(v142 + 16) = partial apply for implicit closure #3 in WifiModel.train(dataFrame:);
  *(void *)(v142 + 24) = v141;
  double v152 = swift_allocObject();
  *(void *)(v152 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v152 + 24) = v142;
  Swift::Int v153 = swift_allocObject();
  *(unsigned char *)(v153 + 16) = 0;
  uint64_t v154 = swift_allocObject();
  *(unsigned char *)(v154 + 16) = 8;
  uint64_t v144 = swift_allocObject();
  *(void *)(v144 + 16) = partial apply for implicit closure #4 in WifiModel.train(dataFrame:);
  *(void *)(v144 + 24) = v143;
  uint64_t v155 = swift_allocObject();
  *(void *)(v155 + 16) = _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0;
  *(void *)(v155 + 24) = v144;
  uint64_t v156 = swift_allocObject();
  *(unsigned char *)(v156 + 16) = 0;
  uint64_t v157 = swift_allocObject();
  *(unsigned char *)(v157 + 16) = 8;
  Swift::Int v146 = swift_allocObject();
  *(void *)(v146 + 16) = partial apply for implicit closure #5 in WifiModel.train(dataFrame:);
  *(void *)(v146 + 24) = v145;
  uint64_t v158 = swift_allocObject();
  *(void *)(v158 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v158 + 24) = v146;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v159 = v5;
  swift_retain();
  *uint64_t v159 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v159[1] = v147;
  swift_retain();
  v159[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[3] = v148;
  swift_retain();
  v159[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v159[5] = v149;
  swift_retain();
  v159[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[7] = v150;
  swift_retain();
  v159[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[9] = v151;
  swift_retain();
  v159[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v159[11] = v152;
  swift_retain();
  v159[12] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[13] = v153;
  swift_retain();
  v159[14] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[15] = v154;
  swift_retain();
  v159[16] = _s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
  v159[17] = v155;
  swift_retain();
  v159[18] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[19] = v156;
  swift_retain();
  v159[20] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[21] = v157;
  swift_retain();
  v159[22] = closure #1 in OSLogArguments.append(_:)partial apply;
  v159[23] = v158;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v160, v161))
  {
    uint64_t v6 = *(void *)(v97 + 776);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v95 = createStorage<A>(capacity:type:)(0);
    uint64_t v96 = createStorage<A>(capacity:type:)(0);
    uint64_t v172 = buf;
    uint64_t v173 = v95;
    uint64_t v174 = v96;
    serialize(_:at:)(0, &v172);
    serialize(_:at:)(4, &v172);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    uint64_t v176 = v147;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    if (v6) {
      return result;
    }
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v148;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    uint64_t v176 = v149;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v150;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v151;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v176 = v152;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v153;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v154;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    uint64_t v176 = v155;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v156;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v157;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    uint64_t v175 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v176 = v158;
    closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v172, (uint64_t)&v173, (uint64_t)&v174);
    _os_log_impl(&dword_255CF7000, v160, v161, "Wifi model stats: trainingRowCount: %ld validationRowCount: %ld trainingMAPE:%f, validationMAPE: %f", buf, size);
    destroyStorage<A>(_:count:)(v95, 0, v93);
    destroyStorage<A>(_:count:)(v96, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
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
    uint64_t v92 = 0;
  }
  else
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
    swift_release();
    swift_release();
    swift_release();
    uint64_t v92 = *(void *)(v97 + 776);
  }
  uint64_t v91 = *(double *)(v97 + 768);
  uint64_t v88 = *(void *)(v97 + 416);
  uint64_t v89 = *(void *)(v97 + 376);
  uint64_t v87 = *(void *)(v97 + 384);

  uint64_t v90 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
  v90(v88, v89);
  v8.n128_f64[0] = v91;
  if (v91 >= 0.7)
  {
    uint64_t v49 = *(void *)(v97 + 768);
    uint64_t v12 = *(void *)(v97 + 400);
    uint64_t v48 = *(void *)(v97 + 376);
    uint64_t v13 = WifiModel.logger.unsafeMutableAddressor();
    v137(v12, v13, v48);
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v49;
    log = Logger.logObject.getter();
    uint64_t v62 = static os_log_type_t.info.getter();
    *(void *)(v97 + 304) = 22;
    UnsignedInteger<>.init<A>(_:)();
    unint64_t v50 = *(_DWORD *)(v97 + 792);
    BOOL v54 = swift_allocObject();
    *(unsigned char *)(v54 + 16) = 0;
    uint64_t v55 = swift_allocObject();
    *(unsigned char *)(v55 + 16) = 8;
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = partial apply for implicit closure #7 in WifiModel.train(dataFrame:);
    *(void *)(v52 + 24) = v51;
    uint64_t v56 = swift_allocObject();
    *(void *)(v56 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(void *)(v56 + 24) = v52;
    uint64_t v57 = swift_allocObject();
    *(unsigned char *)(v57 + 16) = 0;
    uint64_t v58 = swift_allocObject();
    *(unsigned char *)(v58 + 16) = 8;
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = implicit closure #8 in WifiModel.train(dataFrame:);
    *(void *)(v53 + 24) = 0;
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(void *)(v59 + 24) = v53;
    _allocateUninitializedArray<A>(_:)();
    unint64_t v60 = v14;
    swift_retain();
    *unint64_t v60 = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[1] = v54;
    swift_retain();
    v60[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[3] = v55;
    swift_retain();
    v60[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[5] = v56;
    swift_retain();
    v60[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[7] = v57;
    swift_retain();
    v60[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[9] = v58;
    swift_retain();
    v60[10] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[11] = v59;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v62))
    {
      uint64_t v45 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v46 = createStorage<A>(capacity:type:)(0);
      uint64_t v47 = createStorage<A>(capacity:type:)(0);
      Swift::String v162 = v45;
      uint64_t v163 = v46;
      uint64_t v164 = v47;
      serialize(_:at:)(0, &v162);
      serialize(_:at:)(2, &v162);
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v54;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      if (v92) {
        return result;
      }
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v55;
      closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v57;
      closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v58;
      closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      unint64_t v165 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      unint64_t v166 = v59;
      closure #1 in osLogInternal(_:log:type:)(&v165, (uint64_t)&v162, (uint64_t)&v163, (uint64_t)&v164);
      _os_log_impl(&dword_255CF7000, log, v62, "Wifi model not updated. Validation MAPE %f exceeds modelMAPEThreshold %f. ", v45, v50);
      destroyStorage<A>(_:count:)(v46, 0, v44);
      destroyStorage<A>(_:count:)(v47, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v45, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v42 = *(void *)(v97 + 400);
    uint64_t v43 = *(void *)(v97 + 376);

    v90(v42, v43);
    goto LABEL_18;
  }
  int v86 = *(void *)(v97 + 368);
  v85 = *(void *)(v97 + 352);
  uint64_t v83 = *(void *)(v97 + 336);
  uint64_t v84 = *(void *)(v97 + 360);
  (*(void (**)(void, uint64_t, __n128))(v97 + 664))(*(void *)(v97 + 528), v83 + OBJC_IVAR____TtC7MediaML9WifiModel_estimator, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v86, v83 + OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL, v85);
  default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)();
  SupervisedTabularEstimator.write(_:to:overwrite:)();
  if (!v92)
  {
    unint64_t v71 = *(void (**)(uint64_t, uint64_t))(v97 + 712);
    uint64_t v69 = *(void *)(v97 + 528);
    unint64_t v70 = *(void *)(v97 + 512);
    uint64_t v9 = *(void *)(v97 + 408);
    uint64_t v72 = *(void *)(v97 + 376);
    uint64_t v73 = *(void *)(v97 + 336);
    (*(void (**)(void, void))(*(void *)(v97 + 360) + 8))(*(void *)(v97 + 368), *(void *)(v97 + 352));
    v71(v69, v70);
    unint64_t v10 = WifiModel.logger.unsafeMutableAddressor();
    v137(v9, v10, v72);
    swift_retain();
    swift_retain();
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = partial apply for implicit closure #6 in WifiModel.train(dataFrame:);
    *(void *)(v75 + 24) = v73;
    swift_release();
    oslog = Logger.logObject.getter();
    uint64_t v82 = static os_log_type_t.info.getter();
    *(void *)(v97 + 312) = 12;
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v74 = *(_DWORD *)(v97 + 796);
    uint64_t v77 = swift_allocObject();
    *(unsigned char *)(v77 + 16) = 32;
    uint64_t v78 = swift_allocObject();
    *(unsigned char *)(v78 + 16) = 8;
    uint64_t v76 = swift_allocObject();
    *(void *)(v76 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:);
    *(void *)(v76 + 24) = v75;
    uint64_t v79 = swift_allocObject();
    *(void *)(v79 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0;
    *(void *)(v79 + 24) = v76;
    _allocateUninitializedArray<A>(_:)();
    uint64_t v80 = v11;
    swift_retain();
    NSObject *v80 = closure #1 in OSLogArguments.append(_:)partial apply;
    v80[1] = v77;
    swift_retain();
    v80[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v80[3] = v78;
    swift_retain();
    v80[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
    v80[5] = v79;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v82))
    {
      char v66 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v67 = createStorage<A>(capacity:type:)(0);
      uint64_t v68 = createStorage<A>(capacity:type:)(1);
      v167 = v66;
      uint32_t v168 = v67;
      uint64_t v169 = v68;
      serialize(_:at:)(2, &v167);
      serialize(_:at:)(1, &v167);
      uint64_t v170 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v171 = v77;
      closure #1 in osLogInternal(_:log:type:)(&v170, (uint64_t)&v167, (uint64_t)&v168, (uint64_t)&v169);
      uint64_t v170 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v171 = v78;
      closure #1 in osLogInternal(_:log:type:)(&v170, (uint64_t)&v167, (uint64_t)&v168, (uint64_t)&v169);
      uint64_t v170 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0;
      uint64_t v171 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v170, (uint64_t)&v167, (uint64_t)&v168, (uint64_t)&v169);
      _os_log_impl(&dword_255CF7000, oslog, v82, "Updated wifi model written to: %s", v66, v74);
      destroyStorage<A>(_:count:)(v67, 0, v65);
      destroyStorage<A>(_:count:)(v68, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v66, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    BOOL v63 = *(void *)(v97 + 408);
    uint64_t v64 = *(void *)(v97 + 376);

    v90(v63, v64);
LABEL_18:
    os_log_type_t v40 = *(void (**)(uint64_t, uint64_t))(v97 + 648);
    uint64_t v38 = *(void *)(v97 + 640);
    uint64_t v37 = *(void *)(v97 + 632);
    uint64_t v39 = *(void *)(v97 + 600);
    uint64_t v34 = *(void *)(v97 + 592);
    uint64_t v33 = *(void *)(v97 + 584);
    uint64_t v35 = *(void *)(v97 + 568);
    uint64_t v32 = *(void *)(v97 + 576);
    (*(void (**)(void, void))(*(void *)(v97 + 552) + 8))(*(void *)(v97 + 560), *(void *)(v97 + 544));
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v36(v33, v35);
    v36(v34, v35);
    v40(v37, v39);
    v40(v38, v39);
    uint64_t v41 = *(void *)(v97 + 320);
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
    swift_task_dealloc();
    *(void *)uint64_t v41 = v125;
    *(void *)(v41 + 8) = v126;
    *(void *)(v41 + 16) = v127;
    *(void *)(v41 + 24) = v128;
    *(void *)(v41 + 32) = v129;
    *(void *)(v41 + 40) = v130;
    *(void *)(v41 + 48) = v131;
    *(void *)(v41 + 56) = v132;
    *(void *)(v41 + 64) = v133;
    *(void *)(v41 + 72) = v134;
    *(unsigned char *)(v41 + 80) = 0;
    uint64_t v15 = *(uint64_t (**)(void))(*(void *)(v97 + 216) + 8);
    return v15();
  }
  unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v97 + 712);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v97 + 648);
  uint64_t v29 = *(void *)(v97 + 640);
  uint64_t v28 = *(void *)(v97 + 632);
  uint64_t v30 = *(void *)(v97 + 600);
  uint64_t v25 = *(void *)(v97 + 592);
  uint64_t v24 = *(void *)(v97 + 584);
  uint64_t v26 = *(void *)(v97 + 568);
  uint64_t v21 = *(void *)(v97 + 560);
  uint64_t v22 = *(void *)(v97 + 544);
  uint64_t v17 = *(void *)(v97 + 528);
  unint64_t v18 = *(void *)(v97 + 512);
  uint64_t v23 = *(void *)(v97 + 576);
  uint64_t v20 = *(void *)(v97 + 552);
  (*(void (**)(void, void))(*(void *)(v97 + 360) + 8))(*(void *)(v97 + 368), *(void *)(v97 + 352));
  v19(v17, v18);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v27(v24, v26);
  v27(v25, v26);
  v31(v28, v30);
  v31(v29, v30);
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
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(*(void *)(v97 + 216) + 8);
  return v16();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;

  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[81];
  uint64_t v13 = v0[80];
  uint64_t v12 = v0[79];
  uint64_t v14 = v0[75];
  uint64_t v9 = v0[74];
  uint64_t v8 = v0[73];
  uint64_t v7 = v0[72];
  unint64_t v10 = v0[71];
  uint64_t v6 = v0[67];
  uint64_t v4 = v0[65];
  uint64_t v5 = v0[64];
  uint64_t v3 = v0[63];
  v0[27] = v0;
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in WifiModel.train(dataFrame:));
  outlined destroy of DataFrame?(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v11(v8, v10);
  v11(v9, v10);
  v15(v12, v14);
  v15(v13, v14);
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
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[27] + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;

  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[81];
  uint64_t v12 = v0[80];
  uint64_t v11 = v0[79];
  uint64_t v13 = v0[75];
  uint64_t v8 = v0[74];
  uint64_t v7 = v0[73];
  uint64_t v6 = v0[72];
  uint64_t v9 = v0[71];
  uint64_t v1 = v0[70];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[68];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
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
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[27] + 8);
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;

  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[81];
  uint64_t v12 = v0[80];
  uint64_t v11 = v0[79];
  uint64_t v13 = v0[75];
  uint64_t v8 = v0[74];
  uint64_t v7 = v0[73];
  uint64_t v6 = v0[72];
  uint64_t v9 = v0[71];
  uint64_t v1 = v0[70];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[68];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
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
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[27] + 8);
  return v4();
}

uint64_t WifiModel.train(dataFrame:)(double a1)
{
  uint64_t v13 = *v2;
  *(void *)(v13 + 216) = *v2;
  *(double *)(v13 + 744) = a1;
  *(void *)(v13 + 752) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v10 = *(void *)(v13 + 336);
    return MEMORY[0x270FA2498](WifiModel.train(dataFrame:), v10, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v13 + 336);
    *(double *)(v13 + 280) = a1;
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 168)
                                                                     + **(int **)(*(void *)v3 + 168));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v13 + 760) = v4;
    *uint64_t v4 = *(void *)(v13 + 216);
    v4[1] = WifiModel.train(dataFrame:);
    uint64_t v5 = *(void *)(v13 + 736);
    uint64_t v6 = *(void *)(v13 + 584);
    uint64_t v7 = *(void *)(v13 + 560);
    uint64_t v8 = *(void *)(v13 + 544);
    return v11(v6, v7, v8, v5);
  }
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;

  uint64_t v6 = *v2;
  *(void *)(v6 + 216) = *v2;
  *(double *)(v6 + 768) = a1;
  *(void *)(v6 + 776) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = *(void *)(v6 + 336);
    uint64_t v4 = WifiModel.train(dataFrame:);
  }
  else
  {
    uint64_t v3 = *(void *)(v6 + 336);
    uint64_t v4 = WifiModel.train(dataFrame:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t closure #1 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  uint64_t v61 = 0;
  uint64_t v55 = partial apply for implicit closure #1 in closure #1 in WifiModel.train(dataFrame:);
  uint64_t v56 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v59 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v84 = 0;
  uint64_t v82 = 0;
  uint64_t v60 = 0;
  uint64_t v62 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = v62 - 8;
  unint64_t v65 = (*(void *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  char v66 = (char *)v18 - v65;
  uint64_t v70 = type metadata accessor for MetricsKey();
  uint64_t v67 = *(void *)(v70 - 8);
  uint64_t v68 = v70 - 8;
  unint64_t v69 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v70);
  uint64_t v72 = (char *)v18 - v69;
  uint64_t v84 = a1;
  uint64_t v73 = Event.metrics.getter();
  static MetricsKey.validationError.getter();
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
  unint64_t v2 = lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey();
  MEMORY[0x25A298290](v83, v72, v73, v70, v71, v2);
  swift_bridgeObjectRelease();
  if (v83[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v50 = v74;
      int v51 = 0;
    }
    else
    {
      uint64_t v50 = 0;
      int v51 = 1;
    }
    int v49 = v51;
    uint64_t v48 = v50;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v72, v70);
    uint64_t v53 = v48;
    int v54 = v49;
  }
  else
  {
    uint64_t v52 = 0;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v72, v70);
    uint64_t result = outlined destroy of Sendable?((uint64_t)v83);
    uint64_t v53 = v52;
    int v54 = 1;
  }
  uint64_t v47 = v53;
  if ((v54 & 1) == 0)
  {
    uint64_t v46 = v47;
    uint64_t v4 = v66;
    uint64_t v28 = v47;
    uint64_t v82 = v47;
    uint64_t v5 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v4, v5, v62);
    uint64_t v35 = 7;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v28;
    uint64_t v44 = Logger.logObject.getter();
    int v45 = static os_log_type_t.info.getter();
    uint64_t v31 = &v80;
    uint64_t v80 = 12;
    unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v30 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v32 = v81;
    uint64_t v33 = 17;
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 0;
    uint64_t v39 = swift_allocObject();
    *(unsigned char *)(v39 + 16) = 8;
    uint64_t v34 = 32;
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = v36;
    uint64_t v37 = v6;
    *(void *)(v6 + 16) = v55;
    *(void *)(v6 + 24) = v7;
    uint64_t v8 = swift_allocObject();
    uint64_t v9 = v37;
    uint64_t v41 = v8;
    *(void *)(v8 + 16) = v56;
    *(void *)(v8 + 24) = v9;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v40 = _allocateUninitializedArray<A>(_:)();
    uint64_t v42 = v10;
    swift_retain();
    uint64_t v11 = v38;
    uint64_t v12 = v42;
    *uint64_t v42 = v57;
    v12[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
    swift_retain();
    uint64_t v13 = v39;
    uint64_t v14 = v42;
    v42[2] = v58;
    v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
    swift_retain();
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v41;
    uint64_t v16 = v42;
    v42[4] = v59;
    v16[5] = v15;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      uint64_t v17 = v60;
      uint64_t v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v20 = 0;
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      uint64_t v23 = createStorage<A>(capacity:type:)(v20);
      uint64_t v24 = &v79;
      uint64_t v79 = v21;
      uint64_t v25 = &v78;
      uint64_t v78 = v22;
      uint64_t v26 = &v77;
      uint64_t v77 = v23;
      serialize(_:at:)(0, &v79);
      serialize(_:at:)(1, v24);
      uint64_t v75 = v57;
      uint64_t v76 = v38;
      closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
      uint64_t v27 = v17;
      if (v17)
      {
        __break(1u);
      }
      else
      {
        uint64_t v75 = v58;
        uint64_t v76 = v39;
        closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
        v18[1] = 0;
        uint64_t v75 = v59;
        uint64_t v76 = v41;
        closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
        _os_log_impl(&dword_255CF7000, v44, (os_log_type_t)v45, "Validation error: %f", v21, v32);
        v18[0] = 0;
        destroyStorage<A>(_:count:)(v22, 0, v19);
        destroyStorage<A>(_:count:)(v23, v18[0], MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v21, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v62);
  }
  return result;
}

uint64_t implicit closure #2 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t implicit closure #3 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

double implicit closure #4 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double implicit closure #5 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

uint64_t default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)()
{
  return 1;
}

uint64_t implicit closure #6 in WifiModel.train(dataFrame:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1 + v4);
}

double implicit closure #8 in WifiModel.train(dataFrame:)()
{
  return 0.7;
}

uint64_t WifiModel.getMAPE<A>(data:transformer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[20] = v4;
  v5[19] = a4;
  v5[18] = a3;
  v5[17] = a2;
  v5[16] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  void v5[5] = 0;
  v5[6] = 0;
  v5[13] = 0;
  v5[15] = 0;
  uint64_t v6 = type metadata accessor for Logger();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v5[25] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame();
  v5[26] = v7;
  v5[27] = *(void *)(v7 - 8);
  v5[28] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v5[29] = v8;
  v5[30] = *(void *)(v8 - 8);
  v5[31] = swift_task_alloc();
  v5[3] = a1;
  v5[4] = a2;
  void v5[5] = v11;
  return MEMORY[0x270FA2498](WifiModel.getMAPE<A>(data:transformer:), v11, 0);
}

uint64_t WifiModel.getMAPE<A>(data:transformer:)()
{
  uint64_t v32 = *(void *)(v0 + 248);
  uint64_t v31 = *(void *)(v0 + 240);
  uint64_t v33 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 160);
  *(void *)(v0 + 16) = v0;
  *(double *)(v0 + 48) = -1.0;
  uint64_t v2 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v31 + 16);
  *(void *)(v0 + 256) = v3;
  *(void *)(v0 + 264) = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v32, v1 + v2);
  v34._uint64_t countAndFlagsBits = ColumnID.name.getter();
  v34._object = v4;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  *(void *)(v0 + 272) = v5;
  *(void *)(v0 + 280) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v32, v33);
  Swift::Bool v35 = DataFrame.containsColumn(_:)(v34);
  swift_bridgeObjectRelease();
  if (v35)
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v30 + 288) = v6;
    *uint64_t v6 = *(void *)(v30 + 16);
    v6[1] = WifiModel.getMAPE<A>(data:transformer:);
    uint64_t v7 = *(void *)(v30 + 224);
    uint64_t v8 = *(void *)(v30 + 152);
    uint64_t v9 = *(void *)(v30 + 144);
    uint64_t v10 = *(void *)(v30 + 128);
    return MEMORY[0x270EEA5C8](v7, v10, 0, 0, v9, v8);
  }
  else
  {
    uint64_t v11 = *(void *)(v30 + 184);
    uint64_t v25 = *(void *)(v30 + 168);
    uint64_t v24 = *(void *)(v30 + 176);
    uint64_t v12 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v11, v12, v25);
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    *(void *)(v30 + 56) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v26 = *(_DWORD *)(v30 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v29 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v28, v27))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v21 = createStorage<A>(capacity:type:)(0);
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      *(void *)(v30 + 64) = buf;
      *(void *)(v30 + 72) = v21;
      *(void *)(v30 + 80) = v22;
      serialize(_:at:)(0, (unsigned char **)(v30 + 64));
      serialize(_:at:)(0, (unsigned char **)(v30 + 64));
      *(void *)(v30 + 88) = v29;
      uint64_t v23 = (void *)swift_task_alloc();
      v23[2] = v30 + 64;
      v23[3] = v30 + 72;
      v23[4] = v30 + 80;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v28, v27, "No target column in data frame", buf, v26);
      destroyStorage<A>(_:count:)(v21, 0, v19);
      destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(v30 + 184);
    uint64_t v18 = *(void *)(v30 + 168);
    uint64_t v16 = *(void *)(v30 + 176);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(__n128))(*(void *)(v30 + 16) + 8);
    v14.n128_u64[0] = -1.0;
    return v13(v14);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[2] = *v1;
  v5[37] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[20];
    uint64_t v3 = WifiModel.getMAPE<A>(data:transformer:);
  }
  else
  {
    uint64_t v2 = v5[20];
    uint64_t v3 = WifiModel.getMAPE<A>(data:transformer:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  void *v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t result;
  __n128 v4;
  uint64_t (*v5)(__n128);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Double v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Double *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  Swift::OpaquePointer v22;
  uint64_t v23;

  uint64_t v1 = v0[37];
  uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[34];
  uint64_t v2 = (void (*)(void))v0[32];
  uint64_t v20 = v0[31];
  uint64_t v18 = v0[29];
  v0[2] = v0;
  v2();
  DataFrame.subscript.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
  lazy protocol witness table accessor for type Column<Double> and conformance Column<A>();
  uint64_t v21 = Array.init<A>(_:)();
  v19(v20, v18);
  unsigned char v0[12] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double?]);
  lazy protocol witness table accessor for type [Double?] and conformance [A]();
  uint64_t result = Sequence.compactMap<A>(_:)();
  v22._rawValue = (void *)result;
  if (!v1)
  {
    uint64_t v13 = (void (*)(uint64_t, uint64_t))*((void *)v17 + 34);
    uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))*((void *)v17 + 32);
    __n128 v14 = *((void *)v17 + 31);
    uint64_t v12 = *((void *)v17 + 29);
    uint64_t v10 = *((void *)v17 + 20);
    outlined destroy of [Double?]();
    *((void *)v17 + 13) = result;
    v11(v14, v10 + OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID, v12);
    DataFrame.subscript.getter();
    uint64_t v15 = Array.init<A>(_:)();
    v13(v14, v12);
    *((void *)v17 + 14) = v15;
    uint64_t v16 = Sequence.compactMap<A>(_:)();
    uint64_t v7 = *((void *)v17 + 28);
    uint64_t v8 = *((void *)v17 + 26);
    uint64_t v6 = *((void *)v17 + 27);
    outlined destroy of [Double?]();
    *((void *)v17 + 15) = v16;
    uint64_t v9 = meanAbsolutePercentageError(yRealList:yPredList:)((Swift::OpaquePointer)v16, v22);
    v17[6] = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4.n128_f64[0] = v9;
    uint64_t v5 = *(uint64_t (**)(__n128))(*((void *)v17 + 2) + 8);
    return v5(v4);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t (*v1)(__n128);
  __n128 v2;
  unint64_t v4;
  uint64_t v5;

  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(__n128))(*(void *)(v0 + 16) + 8);
  v2.n128_u64[0] = v4;
  return v1(v2);
}

uint64_t closure #1 in WifiModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8) & 1;
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t closure #2 in WifiModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8) & 1;
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

Swift::Void __swiftcall WifiModel.readModelFile()()
{
  v3[37] = 0;
  uint64_t v22 = MEMORY[0x263F04418];
  v3[31] = partial apply for implicit closure #1 in WifiModel.readModelFile();
  v3[32] = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  v3[33] = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  v3[34] = closure #1 in OSLogArguments.append(_:)partial apply;
  v3[35] = closure #1 in OSLogArguments.append(_:)partial apply;
  v3[36] = partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v4 - 8;
  unint64_t v7 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v8 = (char *)v3 - v7;
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v9 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v17);
  uint64_t v25 = (char *)v3 - v9;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  uint64_t v12 = *(void *)(v24 - 8);
  uint64_t v10 = v24 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24);
  uint64_t v13 = (char *)v3 - v11;
  uint64_t v36 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)v3 - v11, v16 + OBJC_IVAR____TtC7MediaML9WifiModel_estimator);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v25, v16 + OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL, v17);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  uint64_t v18 = (uint64_t *)v33;
  uint64_t v34 = v0;
  unint64_t v35 = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  unint64_t v21 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  unint64_t v1 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  uint64_t v28 = v19;
  uint64_t v29 = v20;
  unint64_t v30 = v21;
  unint64_t v31 = v1;
  uint64_t v32 = MEMORY[0x263F8D568];
  swift_getOpaqueTypeConformance2();
  SupervisedTabularEstimator.read(from:)();
  uint64_t v26 = 0;
  uint64_t v2 = v16;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v25, v17);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v13, v24);
  (*(void (**)(unsigned char *))(*(void *)v2 + 128))(v33);
}

void *implicit closure #1 in WifiModel.readModelFile()(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1)._countAndFlagsBits;
}

uint64_t WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  uint64_t v12 = v10;
  uint64_t v30 = v12;
  *(void *)(v11 + 416) = v12;
  *(double *)(v11 + 408) = a10;
  *(double *)(v11 + 400) = a9;
  *(void *)(v11 + 392) = a8;
  *(void *)(v11 + 384) = a7;
  *(void *)(v11 + 376) = a6;
  *(void *)(v11 + 368) = a5;
  *(void *)(v11 + 360) = a4;
  *(void *)(v11 + 352) = a3;
  *(void *)(v11 + 344) = a2;
  *(void *)(v11 + 336) = a1;
  *(void *)(v11 + 224) = v11;
  *(void *)(v11 + 176) = 0;
  *(void *)(v11 + 184) = 0;
  *(void *)(v11 + 192) = 0;
  *(void *)(v11 + 200) = 0;
  *(void *)(v11 + 232) = 0;
  *(void *)(v11 + 240) = 0;
  *(void *)(v11 + 248) = 0;
  *(void *)(v11 + 256) = 0;
  *(void *)(v11 + 264) = 0;
  *(void *)(v11 + 272) = 0;
  *(void *)(v11 + 280) = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  *(void *)(v11 + 424) = v14;
  *(void *)(v11 + 432) = *(void *)(v14 - 8);
  *(void *)(v11 + 440) = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  *(void *)(v11 + 448) = v15;
  *(void *)(v11 + 456) = *(void *)(v15 - 8);
  *(void *)(v11 + 464) = swift_task_alloc();
  uint64_t v16 = type metadata accessor for DataFrame();
  *(void *)(v11 + 472) = v16;
  uint64_t v20 = *(void *)(v16 - 8);
  *(void *)(v11 + 480) = v20;
  *(void *)(v11 + 488) = *(void *)(v20 + 64);
  *(void *)(v11 + 496) = swift_task_alloc();
  *(void *)(v11 + 504) = swift_task_alloc();
  *(void *)(v11 + 512) = swift_task_alloc();
  uint64_t v17 = type metadata accessor for Logger();
  *(void *)(v11 + 520) = v17;
  *(void *)(v11 + 528) = *(void *)(v17 - 8);
  *(void *)(v11 + 536) = swift_task_alloc();
  *(void *)(v11 + 544) = swift_task_alloc();
  uint64_t v18 = type metadata accessor for DispatchTime();
  *(void *)(v11 + 552) = v18;
  uint64_t v21 = *(void *)(v18 - 8);
  *(void *)(v11 + 560) = v21;
  *(void *)(v11 + 568) = *(void *)(v21 + 64);
  *(void *)(v11 + 576) = swift_task_alloc();
  *(void *)(v11 + 584) = swift_task_alloc();
  *(void *)(v11 + 592) = swift_task_alloc();
  *(void *)(v11 + 600) = swift_task_alloc();
  *(void *)(v11 + 176) = a1;
  *(void *)(v11 + 184) = a2;
  *(void *)(v11 + 192) = a3;
  *(void *)(v11 + 200) = a4;
  *(void *)(v11 + 232) = a5;
  *(void *)(v11 + 240) = a6;
  *(void *)(v11 + 248) = a7;
  *(void *)(v11 + 256) = a8;
  *(double *)(v11 + 264) = a9;
  *(double *)(v11 + 272) = a10;
  *(void *)(v11 + 280) = v30;
  return MEMORY[0x270FA2498](WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:), v30, 0);
}

uint64_t WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  uint64_t v1 = v0[52];
  v0[28] = v0;
  uint64_t v2 = static DispatchTime.now()();
  (*(void (**)(uint64_t))(*(void *)v1 + 120))(v2);
  BOOL v77 = v0[5] == 0;
  outlined destroy of Transformer?((uint64_t)(v78 + 2));
  if (v77)
  {
    uint64_t v3 = v78[68];
    uint64_t v72 = v78[65];
    uint64_t v71 = v78[66];
    uint64_t v4 = WifiModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16))(v3, v4, v72);
    uint64_t v75 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.debug.getter();
    v78[37] = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v73 = *((_DWORD *)v78 + 156);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v76 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v75, v74))
    {
      uint64_t v67 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v68 = createStorage<A>(capacity:type:)(0);
      uint64_t v69 = createStorage<A>(capacity:type:)(0);
      v78[38] = v67;
      v78[39] = v68;
      v78[40] = v69;
      serialize(_:at:)(0, (unsigned char **)v78 + 38);
      serialize(_:at:)(0, (unsigned char **)v78 + 38);
      v78[41] = v76;
      uint64_t v70 = (void *)swift_task_alloc();
      v70[2] = v78 + 38;
      v70[3] = v78 + 39;
      v70[4] = v78 + 40;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v75, v74, "Reading wifi model from disk...", v67, v73);
      destroyStorage<A>(_:count:)(v68, 0, v66);
      destroyStorage<A>(_:count:)(v69, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v67, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v64 = v78[68];
    uint64_t v65 = v78[65];
    uint64_t v5 = v78[52];
    uint64_t v63 = v78[66];

    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8))(v64, v65);
    (*(void (**)(uint64_t))(*(void *)v5 + 176))(v6);
  }
  uint64_t v7 = v78[52];
  uint64_t v61 = v78[51];
  uint64_t v59 = v78[50];
  uint64_t v58 = v78[49];
  uint64_t v56 = v78[48];
  uint64_t v55 = v78[47];
  uint64_t v54 = v78[46];
  uint64_t v53 = v78[45];
  uint64_t v51 = v78[44];
  uint64_t v48 = v78[43];
  uint64_t v46 = v78[42];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, [Any?]));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v62 = v8;
  unint64_t v9 = kMediaML_ssid.unsafeMutableAddressor();
  outlined init with copy of String(v9, v62);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v45 = _allocateUninitializedArray<A>(_:)();
  uint64_t v47 = v10;
  swift_bridgeObjectRetain();
  uint64_t v50 = MEMORY[0x263F8D310];
  v47[3] = MEMORY[0x263F8D310];
  *uint64_t v47 = v46;
  v47[1] = v48;
  _finalizeUninitializedArray<A>(_:)();
  v62[2] = v45;
  uint64_t v11 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v11, v62 + 3);
  uint64_t v49 = _allocateUninitializedArray<A>(_:)();
  uint64_t v52 = v12;
  swift_bridgeObjectRetain();
  v52[3] = v50;
  *uint64_t v52 = v51;
  v52[1] = v53;
  _finalizeUninitializedArray<A>(_:)();
  v62[5] = v49;
  uint64_t v13 = kMediaML_hourOfDay.unsafeMutableAddressor();
  outlined init with copy of String(v13, v62 + 6);
  uint64_t v14 = _allocateUninitializedArray<A>(_:)();
  uint64_t v57 = MEMORY[0x263F8D6C8];
  v15[3] = MEMORY[0x263F8D6C8];
  *uint64_t v15 = v54;
  _finalizeUninitializedArray<A>(_:)();
  v62[8] = v14;
  uint64_t v16 = kMediaML_dayOfWeek.unsafeMutableAddressor();
  outlined init with copy of String(v16, v62 + 9);
  uint64_t v17 = _allocateUninitializedArray<A>(_:)();
  uint64_t v18[3] = v57;
  *uint64_t v18 = v55;
  _finalizeUninitializedArray<A>(_:)();
  v62[11] = v17;
  uint64_t v19 = kMediaML_rssi.unsafeMutableAddressor();
  outlined init with copy of String(v19, v62 + 12);
  uint64_t v20 = _allocateUninitializedArray<A>(_:)();
  v21[3] = v57;
  *uint64_t v21 = v56;
  _finalizeUninitializedArray<A>(_:)();
  v62[14] = v20;
  uint64_t v22 = kMediaML_noise.unsafeMutableAddressor();
  outlined init with copy of String(v22, v62 + 15);
  uint64_t v23 = _allocateUninitializedArray<A>(_:)();
  v24[3] = v57;
  *uint64_t v24 = v58;
  _finalizeUninitializedArray<A>(_:)();
  v62[17] = v23;
  uint64_t v25 = kMediaML_txRate.unsafeMutableAddressor();
  outlined init with copy of String(v25, v62 + 18);
  uint64_t v26 = _allocateUninitializedArray<A>(_:)();
  uint64_t v60 = MEMORY[0x263F8D538];
  v27[3] = MEMORY[0x263F8D538];
  *uint64_t v27 = v59;
  _finalizeUninitializedArray<A>(_:)();
  v62[20] = v26;
  uint64_t v28 = kMediaML_rxRate.unsafeMutableAddressor();
  outlined init with copy of String(v28, v62 + 21);
  uint64_t v29 = _allocateUninitializedArray<A>(_:)();
  v30[3] = v60;
  *uint64_t v30 = v61;
  _finalizeUninitializedArray<A>(_:)();
  v62[23] = v29;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v31 = DataFrame.init(dictionaryLiteral:)();
  (*(void (**)(uint64_t))(*(void *)v7 + 120))(v31);
  if (v78[20])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TabularTransformer);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v78[12] = 0;
      v78[13] = 0;
      v78[14] = 0;
      v78[15] = 0;
      v78[16] = 0;
    }
  }
  else
  {
    outlined destroy of Transformer?((uint64_t)(v78 + 17));
    v78[12] = 0;
    v78[13] = 0;
    v78[14] = 0;
    v78[15] = 0;
    v78[16] = 0;
  }
  if (v78[15])
  {
    outlined init with take of TabularTransformer(v78 + 12, v78 + 7);
    uint64_t v43 = v78[10];
    uint64_t v44 = v78[11];
    __swift_project_boxed_opaque_existential_1(v78 + 7, v43);
    uint64_t v32 = (void *)swift_task_alloc();
    v78[76] = v32;
    *uint64_t v32 = v78[28];
    v32[1] = WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
    uint64_t v33 = v78[64];
    uint64_t v34 = v78[63];
    return MEMORY[0x270EEA5C8](v34, v33, 0, 0, v43, v44);
  }
  else
  {
    uint64_t v41 = v78[75];
    uint64_t v42 = v78[69];
    uint64_t v39 = v78[64];
    uint64_t v38 = v78[59];
    uint64_t v40 = v78[70];
    uint64_t v37 = v78[60];
    outlined destroy of TabularTransformer?((uint64_t)(v78 + 12));
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v42);
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
    unint64_t v35 = *(uint64_t (**)(void, void))(v78[28] + 8);
    return v35(0, 0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[28] = *v1;
  v5[77] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[52];
    uint64_t v3 = WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  }
  else
  {
    uint64_t v2 = v5[52];
    uint64_t v3 = WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t, void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint8_t *buf;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  os_log_type_t v74 = v0;
  uint64_t v45 = *(void *)(v0 + 600);
  uint64_t v44 = *(void *)(v0 + 592);
  uint64_t v50 = *(void *)(v0 + 584);
  uint64_t v52 = *(void *)(v0 + 576);
  uint64_t v47 = *(void *)(v0 + 568);
  uint64_t v48 = *(void *)(v0 + 560);
  uint64_t v53 = *(void *)(v0 + 552);
  uint64_t v1 = *(void *)(v0 + 536);
  unint64_t v35 = *(void *)(v0 + 528);
  uint64_t v36 = *(void *)(v0 + 520);
  uint64_t v37 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 496);
  uint64_t v38 = *(void *)(v0 + 488);
  uint64_t v39 = *(void *)(v0 + 480);
  uint64_t v42 = *(void *)(v0 + 472);
  uint64_t v43 = *(void *)(v0 + 416);
  *(void *)(v0 + 224) = v0;
  static DispatchTime.now()();
  uint64_t v2 = WifiModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v1, v2, v36);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v41, v37, v42);
  swift_retain();
  uint64_t v40 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v56 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v39 + 32))(v56 + v40, v41, v42);
  *(void *)(v56 + ((v40 + v38 + 7) & 0xFFFFFFFFFFFFFFF8)) = v43;
  uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  v46(v50, v44, v53);
  v46(v52, v45, v53);
  uint64_t v3 = *(_DWORD *)(v48 + 80);
  uint64_t v49 = (v3 + 16) & ~v3;
  uint64_t v51 = (v49 + v47 + v3) & ~v3;
  uint64_t v58 = swift_allocObject();
  uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
  v54(v58 + v49, v50, v53);
  v54(v58 + v51, v52, v53);
  uint64_t v67 = Logger.logObject.getter();
  uint64_t v68 = static os_log_type_t.default.getter();
  *(void *)(v0 + 288) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 220);
  uint64_t v60 = swift_allocObject();
  *(unsigned char *)(v60 + 16) = 0;
  uint64_t v61 = swift_allocObject();
  *(unsigned char *)(v61 + 16) = 8;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = partial apply for implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  *(void *)(v57 + 24) = v56;
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v62 + 24) = v57;
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = 0;
  uint64_t v64 = swift_allocObject();
  *(unsigned char *)(v64 + 16) = 8;
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = partial apply for implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:);
  *(void *)(v59 + 24) = v58;
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v65 + 24) = v59;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v66 = v4;
  swift_retain();
  *uint64_t v66 = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[1] = v60;
  swift_retain();
  v66[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[3] = v61;
  swift_retain();
  v66[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[5] = v62;
  swift_retain();
  v66[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[7] = v63;
  swift_retain();
  v66[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[9] = v64;
  swift_retain();
  v66[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[11] = v65;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v5 = *(void *)(v34 + 616);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v32 = createStorage<A>(capacity:type:)(0);
    uint64_t v33 = createStorage<A>(capacity:type:)(0);
    uint64_t v69 = buf;
    uint64_t v70 = v32;
    uint64_t v71 = v33;
    serialize(_:at:)(0, &v69);
    serialize(_:at:)(2, &v69);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v60;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    if (v5) {
      return result;
    }
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v62;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v63;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v64;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint32_t v73 = v65;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    _os_log_impl(&dword_255CF7000, v67, v68, "Finished prediction with wifi model. Predicted value = %f Time taken = %f [ns]", buf, size);
    destroyStorage<A>(_:count:)(v32, 0, v30);
    destroyStorage<A>(_:count:)(v33, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v19 = *(void *)(v34 + 536);
  uint64_t v20 = *(void *)(v34 + 520);
  uint64_t v24 = *(void *)(v34 + 464);
  uint64_t v23 = *(void *)(v34 + 448);
  uint64_t v26 = *(void *)(v34 + 440);
  uint64_t v27 = *(void *)(v34 + 424);
  uint64_t v21 = *(void *)(v34 + 416);
  uint64_t v18 = *(void *)(v34 + 528);
  uint64_t v22 = *(void *)(v34 + 456);
  uint64_t v25 = *(void *)(v34 + 432);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v24, v21 + OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID, v23);
  DataFrame.subscript.getter();
  Column.subscript.getter();
  uint64_t v28 = *(void *)(v34 + 208);
  uint64_t v29 = *(unsigned char *)(v34 + 216);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  if (v29) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v15 = *(void *)(v34 + 600);
  unint64_t v9 = *(void *)(v34 + 592);
  uint64_t v16 = *(void *)(v34 + 552);
  uint64_t v12 = *(void *)(v34 + 512);
  uint64_t v11 = *(void *)(v34 + 504);
  uint64_t v13 = *(void *)(v34 + 472);
  uint64_t v8 = *(void *)(v34 + 560);
  uint64_t v10 = *(void *)(v34 + 480);
  (*(void (**)(void, void))(*(void *)(v34 + 456) + 8))(*(void *)(v34 + 464), *(void *)(v34 + 448));
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v17(v9, v16);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v14(v11, v13);
  __swift_destroy_boxed_opaque_existential_1(v34 + 56);
  v14(v12, v13);
  v17(v15, v16);
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
  uint64_t v7 = *(uint64_t (**)(uint64_t, void))(*(void *)(v34 + 224) + 8);
  return v7(v28, v29 & 1);
}

{
  void *v0;
  uint64_t (*v1)();
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v7 = v0[75];
  uint64_t v5 = v0[70];
  uint64_t v6 = v0[69];
  uint64_t v8 = v0[64];
  uint64_t v3 = v0[60];
  uint64_t v4 = v0[59];
  v0[28] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
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
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v9 + 224) + 8);
  return v1();
}

double implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a2;
  uint64_t v5 = "Fatal error";
  uint64_t v6 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v7 = "MediaML/MLModel.swift";
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v8 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v18);
  uint64_t v17 = (char *)&v3 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t v11 = v10 - 8;
  unint64_t v12 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v3 - v12;
  (*(void (**)(void))(v13 + 16))();
  DataFrame.subscript.getter();
  Column.subscript.getter();
  double v19 = v21;
  int v20 = v22;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  if (v20)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    double v4 = v19;
  }
  double v3 = v4;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v10);
  return v3;
}

uint64_t implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  unint64_t v2 = DispatchTime.uptimeNanoseconds.getter();
  unint64_t v0 = DispatchTime.uptimeNanoseconds.getter();
  uint64_t result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t WifiModel.deinit()
{
  outlined destroy of Transformer?(v0 + 112);
  uint64_t v5 = OBJC_IVAR____TtC7MediaML9WifiModel_parametersURL;
  uint64_t v1 = type metadata accessor for URL();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v5);
  uint64_t v6 = OBJC_IVAR____TtC7MediaML9WifiModel_targetColumnID;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v0 + v6);
  uint64_t v7 = OBJC_IVAR____TtC7MediaML9WifiModel_estimator;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v7);
  swift_defaultActor_destroy();
  return v8;
}

uint64_t WifiModel.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t WifiModel.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance WifiModel()
{
  return WifiModel.unownedExecutor.getter();
}

uint64_t CellularModel.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static CellularModel.logger);
}

uint64_t static CellularModel.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = CellularModel.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of CellularModel.targetColumnID()
{
  return ColumnID.init(_:_:)();
}

uint64_t CellularModel.targetColumnID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

void variable initialization expression of CellularModel.model(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = 0;
}

uint64_t key path getter for CellularModel.model : CellularModel@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  uint64_t v7 = v4;
  (*(void (**)(uint64_t))(*(void *)v4 + 120))(v2);
  outlined init with take of Transformer?(v6, a2);
  return swift_release();
}

uint64_t key path setter for CellularModel.model : CellularModel(void *a1, uint64_t *a2)
{
  outlined init with copy of Transformer?(a1, v5);
  uint64_t v4 = *a2;
  swift_retain();
  (*(void (**)(void *))(*(void *)v4 + 128))(v5);
  return swift_release();
}

uint64_t CellularModel.model.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  swift_beginAccess();
  outlined init with copy of Transformer?(v3, a1);
  return swift_endAccess();
}

uint64_t CellularModel.model.setter(void *a1)
{
  outlined init with copy of Transformer?(a1, v5);
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  swift_beginAccess();
  outlined assign with take of Transformer?(v5, v3);
  swift_endAccess();
  return outlined destroy of Transformer?((uint64_t)a1);
}

uint64_t (*CellularModel.model.modify())()
{
  return CellularModel.model.modify;
}

uint64_t CellularModel.model.modify()
{
  return swift_endAccess();
}

uint64_t variable initialization expression of CellularModel.cellParametersURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  uint64_t v1 = (char *)&v4 - v5;
  uint64_t v10 = (char *)&v4 - v5;
  uint64_t v2 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v1, v2, v11);
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cellParameters.pkg", 0x12uLL, 1)._object;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t CellularModel.cellParametersURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t variable initialization expression of CellularModel.estimator@<X0>(uint64_t a1@<X8>)
{
  return CellModelGuts.estimator.getter(a1);
}

uint64_t CellularModel.estimator.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t CellularModel.__allocating_init()()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = CellularModel.__allocating_init();
  return CellularModel.init()();
}

uint64_t CellularModel.__allocating_init()(uint64_t a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 16) = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 8);
  return v2(a1);
}

uint64_t CellularModel.init()()
{
  v1[9] = v0;
  v1[2] = v1;
  v1[3] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v8 - 8);
  uint64_t v7 = swift_task_alloc();
  v1[13] = v7;
  v1[3] = v10;
  swift_defaultActor_initialize();
  kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  ColumnID.init(_:_:)();
  uint64_t v3 = (void *)(v10 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  *uint64_t v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = 0;
  uint64_t v4 = mediaMLModelDirectory.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v4, v8);
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cellParameters.pkg", 0x12uLL, 1);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  uint64_t v9 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  CellModelGuts.init()();
  CellModelGuts.estimator.getter(v10 + v9);
  return MEMORY[0x270FA2498](CellularModel.init(), v10, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v16 = *(void *)(v0 + 80);
  *(void *)(v0 + 16) = v0;
  uint64_t v2 = CellularModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v1, v2, v16);
  double v19 = Logger.logObject.getter();
  uint64_t v18 = static os_log_type_t.info.getter();
  *(void *)(v0 + 32) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v17 = *(unsigned int *)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  int v20 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v19, v18))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v11 = createStorage<A>(capacity:type:)(0);
    unint64_t v12 = createStorage<A>(capacity:type:)(0);
    *(void *)(v14 + 40) = buf;
    *(void *)(v14 + 48) = v11;
    *(void *)(v14 + 56) = v12;
    serialize(_:at:)(0, (unsigned char **)(v14 + 40));
    serialize(_:at:)(0, (unsigned char **)(v14 + 40));
    *(void *)(v14 + 64) = v20;
    uint64_t v13 = (void *)swift_task_alloc();
    void v13[2] = v14 + 40;
    v13[3] = v14 + 48;
    void v13[4] = v14 + 56;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, v19, v18, "New Cell Model created", buf, v17);
    destroyStorage<A>(_:count:)(v11, 0, v9);
    destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v14 + 96);
  uint64_t v7 = *(void *)(v14 + 80);
  uint64_t v6 = *(void *)(v14 + 88);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(v14 + 16) + 8);
  uint64_t v4 = *(void *)(v14 + 72);
  return v3(v4);
}

uint64_t CellularModel.getMAPE<A>(data:transformer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[20] = v4;
  v5[19] = a4;
  v5[18] = a3;
  v5[17] = a2;
  v5[16] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  void v5[5] = 0;
  v5[6] = 0;
  v5[13] = 0;
  v5[15] = 0;
  uint64_t v6 = type metadata accessor for Logger();
  v5[21] = v6;
  v5[22] = *(void *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v5[25] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame();
  v5[26] = v7;
  v5[27] = *(void *)(v7 - 8);
  v5[28] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v5[29] = v8;
  v5[30] = *(void *)(v8 - 8);
  v5[31] = swift_task_alloc();
  v5[3] = a1;
  v5[4] = a2;
  void v5[5] = v11;
  return MEMORY[0x270FA2498](CellularModel.getMAPE<A>(data:transformer:), v11, 0);
}

uint64_t CellularModel.getMAPE<A>(data:transformer:)()
{
  uint64_t v32 = *(void *)(v0 + 248);
  uint64_t v31 = *(void *)(v0 + 240);
  uint64_t v33 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 160);
  *(void *)(v0 + 16) = v0;
  *(double *)(v0 + 48) = -1.0;
  uint64_t v2 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v31 + 16);
  *(void *)(v0 + 256) = v3;
  *(void *)(v0 + 264) = (v31 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v32, v1 + v2);
  v34._uint64_t countAndFlagsBits = ColumnID.name.getter();
  v34._object = v4;
  unint64_t v5 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  *(void *)(v0 + 272) = v5;
  *(void *)(v0 + 280) = (v31 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v32, v33);
  Swift::Bool v35 = DataFrame.containsColumn(_:)(v34);
  swift_bridgeObjectRelease();
  if (v35)
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v30 + 288) = v6;
    *uint64_t v6 = *(void *)(v30 + 16);
    v6[1] = CellularModel.getMAPE<A>(data:transformer:);
    uint64_t v7 = *(void *)(v30 + 224);
    uint64_t v8 = *(void *)(v30 + 152);
    uint64_t v9 = *(void *)(v30 + 144);
    uint64_t v10 = *(void *)(v30 + 128);
    return MEMORY[0x270EEA5C8](v7, v10, 0, 0, v9, v8);
  }
  else
  {
    uint64_t v11 = *(void *)(v30 + 184);
    uint64_t v25 = *(void *)(v30 + 168);
    uint64_t v24 = *(void *)(v30 + 176);
    uint64_t v12 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v11, v12, v25);
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    *(void *)(v30 + 56) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v26 = *(_DWORD *)(v30 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v29 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v28, v27))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v21 = createStorage<A>(capacity:type:)(0);
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      *(void *)(v30 + 64) = buf;
      *(void *)(v30 + 72) = v21;
      *(void *)(v30 + 80) = v22;
      serialize(_:at:)(0, (unsigned char **)(v30 + 64));
      serialize(_:at:)(0, (unsigned char **)(v30 + 64));
      *(void *)(v30 + 88) = v29;
      uint64_t v23 = (void *)swift_task_alloc();
      v23[2] = v30 + 64;
      v23[3] = v30 + 72;
      v23[4] = v30 + 80;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v28, v27, "No target column in data frame", buf, v26);
      destroyStorage<A>(_:count:)(v21, 0, v19);
      destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(v30 + 184);
    uint64_t v18 = *(void *)(v30 + 168);
    uint64_t v16 = *(void *)(v30 + 176);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(__n128))(*(void *)(v30 + 16) + 8);
    v14.n128_u64[0] = -1.0;
    return v13(v14);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  unint64_t v5 = (void *)*v1;
  v5[2] = *v1;
  v5[37] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[20];
    uint64_t v3 = CellularModel.getMAPE<A>(data:transformer:);
  }
  else
  {
    uint64_t v2 = v5[20];
    uint64_t v3 = CellularModel.getMAPE<A>(data:transformer:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  void *v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t result;
  __n128 v4;
  uint64_t (*v5)(__n128);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Double v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Double *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  Swift::OpaquePointer v22;
  uint64_t v23;

  uint64_t v1 = v0[37];
  uint64_t v19 = (void (*)(uint64_t, uint64_t))v0[34];
  uint64_t v2 = (void (*)(void))v0[32];
  int v20 = v0[31];
  uint64_t v18 = v0[29];
  v0[2] = v0;
  v2();
  DataFrame.subscript.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
  lazy protocol witness table accessor for type Column<Double> and conformance Column<A>();
  uint64_t v21 = Array.init<A>(_:)();
  v19(v20, v18);
  unsigned char v0[12] = v21;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Double?]);
  lazy protocol witness table accessor for type [Double?] and conformance [A]();
  uint64_t result = Sequence.compactMap<A>(_:)();
  v22._rawValue = (void *)result;
  if (!v1)
  {
    uint64_t v13 = (void (*)(uint64_t, uint64_t))*((void *)v17 + 34);
    uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))*((void *)v17 + 32);
    __n128 v14 = *((void *)v17 + 31);
    uint64_t v12 = *((void *)v17 + 29);
    uint64_t v10 = *((void *)v17 + 20);
    outlined destroy of [Double?]();
    *((void *)v17 + 13) = result;
    v11(v14, v10 + OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID, v12);
    DataFrame.subscript.getter();
    uint64_t v15 = Array.init<A>(_:)();
    v13(v14, v12);
    *((void *)v17 + 14) = v15;
    uint64_t v16 = Sequence.compactMap<A>(_:)();
    uint64_t v7 = *((void *)v17 + 28);
    uint64_t v8 = *((void *)v17 + 26);
    uint64_t v6 = *((void *)v17 + 27);
    outlined destroy of [Double?]();
    *((void *)v17 + 15) = v16;
    uint64_t v9 = meanAbsolutePercentageError(yRealList:yPredList:)((Swift::OpaquePointer)v16, v22);
    v17[6] = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4.n128_f64[0] = v9;
    unint64_t v5 = *(uint64_t (**)(__n128))(*((void *)v17 + 2) + 8);
    return v5(v4);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t (*v1)(__n128);
  __n128 v2;
  unint64_t v4;
  uint64_t v5;

  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(__n128))(*(void *)(v0 + 16) + 8);
  v2.n128_u64[0] = v4;
  return v1(v2);
}

uint64_t closure #1 in CellularModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8) & 1;
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t closure #2 in CellularModel.getMAPE<A>(data:transformer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8) & 1;
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t CellularModel.train(traindata_url:)(uint64_t a1, uint64_t a2)
{
  v3[18] = v2;
  v3[17] = a2;
  v3[16] = a1;
  v3[13] = v3;
  v3[14] = 0;
  v3[15] = 0;
  type metadata accessor for CSVReadingOptions();
  v3[19] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for URL();
  v3[20] = v4;
  v3[21] = *(void *)(v4 - 8);
  v3[22] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for DataFrame();
  v3[23] = v5;
  v3[24] = *(void *)(v5 - 8);
  v3[25] = swift_task_alloc();
  v3[14] = a2;
  v3[15] = v8;
  return MEMORY[0x270FA2498](CellularModel.train(traindata_url:), v8, 0);
}

uint64_t CellularModel.train(traindata_url:)()
{
  uint64_t v1 = v0[21];
  uint64_t v7 = v0[19];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 16))();
  default argument 3 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  default argument 4 of DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)(v7);
  DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(**(void **)(v6 + 144) + 168)
                                                + **(int **)(**(void **)(v6 + 144) + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v6 + 208) = v2;
  *uint64_t v2 = *(void *)(v6 + 104);
  v2[1] = CellularModel.train(traindata_url:);
  uint64_t v3 = *(void *)(v6 + 200);
  return v5(v6 + 16, v3);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[13] = *v1;
  v5[27] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[18];
    uint64_t v3 = CellularModel.train(traindata_url:);
  }
  else
  {
    uint64_t v2 = v5[18];
    uint64_t v3 = CellularModel.train(traindata_url:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void *__dst;
  uint64_t v5;

  uint64_t v1 = v0[24];
  __dst = (void *)v0[16];
  v0[13] = v0;
  (*(void (**)(void))(v1 + 8))();
  outlined init with take of ModelStats?(v0 + 2, __dst);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0[13] + 8);
  return v2();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = v0[25];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[23];
  v0[13] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[13] + 8);
  return v4();
}

uint64_t CellularModel.train(dataFrame:)(uint64_t a1, uint64_t a2)
{
  v3[42] = v2;
  v3[41] = a2;
  v3[40] = a1;
  v3[43] = *v2;
  v3[27] = v3;
  v3[28] = 0;
  v3[29] = 0;
  v3[35] = 0;
  v3[36] = 0;
  memset(v3 + 12, 0, 0x50uLL);
  uint64_t v4 = type metadata accessor for URL();
  v3[44] = v4;
  v3[45] = *(void *)(v4 - 8);
  v3[46] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v3[47] = v5;
  v3[48] = *(void *)(v5 - 8);
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for AnyColumnSlice();
  v3[53] = v6;
  v3[54] = *(void *)(v6 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DataFrame.Rows();
  v3[58] = v7;
  v3[59] = *(void *)(v7 - 8);
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DataFrame?);
  v3[62] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  v3[63] = v8;
  v3[64] = *(void *)(v8 - 8);
  v3[65] = swift_task_alloc();
  v3[66] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  v3[67] = v9;
  v3[68] = *(void *)(v9 - 8);
  v3[69] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for DataFrame();
  v3[70] = v10;
  v3[71] = *(void *)(v10 - 8);
  v3[72] = swift_task_alloc();
  v3[73] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for DataFrame.Slice();
  v3[74] = v11;
  v3[75] = *(void *)(v11 - 8);
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[28] = a2;
  v3[29] = v14;
  return MEMORY[0x270FA2498](CellularModel.train(dataFrame:), v14, 0);
}

uint64_t CellularModel.train(dataFrame:)()
{
  uint64_t v56 = v0[79];
  uint64_t v61 = v0[78];
  uint64_t v58 = v0[77];
  uint64_t v62 = v0[76];
  uint64_t v57 = v0[75];
  uint64_t v59 = v0[74];
  v0[27] = v0;
  DataFrameProtocol.randomSplit(by:seed:)();
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  v60(v58, v56, v59);
  DataFrame.init(_:)();
  v60(v58, v61, v59);
  DataFrame.init(_:)();
  BOOL v63 = DataFrame.Slice.shape.getter() <= 0;
  v60(v62, v61, v59);
  BOOL v54 = !v63 && DataFrame.Slice.shape.getter() > 0;
  uint64_t v1 = *(void *)(v55 + 608);
  uint64_t v2 = *(void *)(v55 + 592);
  uint64_t v3 = *(void *)(v55 + 600) + 8;
  uint64_t v53 = *(void (**)(uint64_t, uint64_t))v3;
  *(void *)(v55 + 640) = *(void *)v3;
  *(void *)(v55 + 648) = v3 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v53(v1, v2);
  if (v54)
  {
    uint64_t v44 = *(void *)(v55 + 576);
    uint64_t v45 = *(void *)(v55 + 560);
    uint64_t v4 = *(void *)(v55 + 528);
    uint64_t v5 = *(void *)(v55 + 504);
    uint64_t v46 = *(void *)(v55 + 496);
    uint64_t v43 = *(void *)(v55 + 568);
    uint64_t v47 = *(void *)(v55 + 344);
    uint64_t v6 = *(void *)(v55 + 336) + OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
    uint64_t v7 = *(void *)(v55 + 512) + 16;
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))v7;
    *(void *)(v55 + 656) = *(void *)v7;
    *(void *)(v55 + 664) = v7 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v8(v4, v6, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v46, v44, v45);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v46, 0, 1, v45);
    uint64_t v9 = swift_allocObject();
    *(void *)(v55 + 672) = v9;
    *(void *)(v9 + 16) = v47;
    uint64_t v51 = v9;
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    unint64_t v50 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    unint64_t v10 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    *(void *)(v55 + 176) = v48;
    *(void *)(v55 + 184) = v49;
    *(void *)(v55 + 192) = v50;
    *(void *)(v55 + 200) = v10;
    *(void *)(v55 + 208) = MEMORY[0x263F8D568];
    uint64_t v52 = *(void *)(swift_getOpaqueTypeConformance2() + 8);
    *(void *)(v55 + 680) = v52;
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v55 + 688) = v11;
    *uint64_t v11 = *(void *)(v55 + 216);
    v11[1] = CellularModel.train(dataFrame:);
    uint64_t v12 = *(void *)(v55 + 584);
    uint64_t v13 = *(void *)(v55 + 552);
    uint64_t v14 = *(void *)(v55 + 504);
    uint64_t v15 = *(void *)(v55 + 496);
    return MEMORY[0x270EEA810](v13, v12, v15, partial apply for closure #1 in CellularModel.train(dataFrame:), v51, v14, v52);
  }
  else
  {
    uint64_t v16 = *(void *)(v55 + 392);
    uint64_t v38 = *(void *)(v55 + 376);
    uint64_t v37 = *(void *)(v55 + 384);
    uint64_t v17 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v16, v17, v38);
    oslog = Logger.logObject.getter();
    os_log_type_t v40 = static os_log_type_t.error.getter();
    *(void *)(v55 + 240) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v55 + 776);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v42 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v40))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v34 = createStorage<A>(capacity:type:)(0);
      uint64_t v35 = createStorage<A>(capacity:type:)(0);
      *(void *)(v55 + 248) = buf;
      *(void *)(v55 + 256) = v34;
      *(void *)(v55 + 264) = v35;
      serialize(_:at:)(0, (unsigned char **)(v55 + 248));
      serialize(_:at:)(0, (unsigned char **)(v55 + 248));
      *(void *)(v55 + 272) = v42;
      uint64_t v36 = (void *)swift_task_alloc();
      v36[2] = v55 + 248;
      v36[3] = v55 + 256;
      v36[4] = v55 + 264;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, oslog, v40, "Cell: Training or validation data is empty", buf, size);
      destroyStorage<A>(_:count:)(v34, 0, v32);
      destroyStorage<A>(_:count:)(v35, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v29 = *(void *)(v55 + 632);
    uint64_t v28 = *(void *)(v55 + 624);
    uint64_t v30 = *(void *)(v55 + 592);
    uint64_t v25 = *(void *)(v55 + 584);
    uint64_t v24 = *(void *)(v55 + 576);
    uint64_t v26 = *(void *)(v55 + 560);
    uint64_t v21 = *(void *)(v55 + 392);
    uint64_t v22 = *(void *)(v55 + 376);
    uint64_t v23 = *(void *)(v55 + 568);
    uint64_t v20 = *(void *)(v55 + 384);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    os_log_type_t v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v27(v24, v26);
    v27(v25, v26);
    v53(v28, v30);
    v53(v29, v30);
    uint64_t v31 = *(void *)(v55 + 320);
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
    *(void *)uint64_t v31 = 0;
    *(void *)(v31 + 8) = 0;
    *(void *)(v31 + 16) = 0;
    *(void *)(v31 + 24) = 0;
    *(void *)(v31 + 32) = 0;
    *(void *)(v31 + 40) = 0;
    *(void *)(v31 + 48) = 0;
    *(void *)(v31 + 56) = 0;
    *(void *)(v31 + 64) = 0;
    *(void *)(v31 + 72) = 0;
    *(unsigned char *)(v31 + 80) = 1;
    uint64_t v18 = *(uint64_t (**)(void))(*(void *)(v55 + 216) + 8);
    return v18();
  }
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;

  uint64_t v15 = (void *)*v1;
  v15[27] = *v1;
  v15[87] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v8 = v15[42];
    return MEMORY[0x270FA2498](CellularModel.train(dataFrame:), v8, 0);
  }
  else
  {
    uint64_t v12 = v15[66];
    unint64_t v10 = v15[64];
    uint64_t v11 = v15[63];
    uint64_t v9 = v15[62];
    uint64_t v13 = v15[42];
    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in CellularModel.train(dataFrame:));
    outlined destroy of DataFrame?(v9);
    uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v15[88] = v2;
    v15[89] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v2(v12, v11);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v13 + 152)
                                                            + **(int **)(*(void *)v13 + 152));
    uint64_t v3 = (void *)swift_task_alloc();
    v15[90] = v3;
    v15[91] = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
    *uint64_t v3 = v15[27];
    v3[1] = CellularModel.train(dataFrame:);
    uint64_t v4 = v15[73];
    uint64_t v5 = v15[69];
    uint64_t v6 = v15[67];
    return v14(v4, v5, v6);
  }
}

{
  uint64_t v0;
  Swift::String *v1;
  Swift::String *v2;
  Swift::Int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(void);
  uint64_t (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint32_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *log;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint32_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  NSObject *oslog;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  double v91;
  uint64_t v92;
  uint64_t v93;
  uint8_t *buf;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t);
  uint64_t v102;
  uint64_t countAndFlagsBits;
  uint64_t v104;
  void *object;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t trainingRowCount;
  uint64_t validationRowCount;
  uint64_t carrierCount;
  uint64_t ssidCount;
  uint64_t appNameCount;
  Swift::Double trainingMAPE;
  Swift::Double validationMAPE;
  Swift::Int trainingDate;
  Swift::Int interfaceType;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  NSObject *v158;
  os_log_type_t v159;
  uint8_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t, uint64_t);
  uint64_t v164;
  uint8_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t (*v168)(uint64_t, uint64_t, uint64_t);
  uint64_t v169;
  uint8_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t, uint64_t);
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;

  uint64_t v175 = v0;
  validationMAPE = *(double *)(v0 + 760);
  trainingMAPE = *(double *)(v0 + 736);
  int v99 = *(void *)(v0 + 488);
  uint64_t v102 = *(void *)(v0 + 480);
  unint64_t v98 = *(void *)(v0 + 472);
  uint32_t v100 = *(void *)(v0 + 464);
  uint64_t v106 = *(void *)(v0 + 456);
  int v113 = *(void *)(v0 + 448);
  uint64_t v108 = *(void *)(v0 + 440);
  uint64_t v104 = *(void *)(v0 + 432);
  uint64_t v111 = *(void *)(v0 + 424);
  uint64_t v110 = *(void *)(v0 + 416);
  uint64_t v133 = *(void *)(v0 + 384);
  uint64_t v134 = *(void *)(v0 + 376);
  *(void *)(v0 + 216) = v0;
  *(Swift::Double *)(v0 + 288) = validationMAPE;
  interfaceType = *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor();
  DataFrame.Slice.rows.getter();
  trainingRowCount = DataFrame.Rows.count.getter();
  uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
  v101(v99, v100);
  DataFrame.Slice.rows.getter();
  validationRowCount = DataFrame.Rows.count.getter();
  v101(v102, v100);
  uint64_t v1 = kMediaML_carrier.unsafeMutableAddressor();
  uint64_t countAndFlagsBits = v1->_countAndFlagsBits;
  object = v1->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x25A298040](countAndFlagsBits, object);
  AnyColumnSlice.distinct()();
  uint64_t v112 = *(void (**)(uint64_t, uint64_t))(v104 + 8);
  v112(v113, v111);
  swift_bridgeObjectRelease();
  carrierCount = AnyColumnSlice.count.getter();
  v112(v106, v111);
  uint64_t v2 = kMediaML_appName.unsafeMutableAddressor();
  uint64_t v107 = v2->_countAndFlagsBits;
  uint64_t v109 = v2->_object;
  swift_bridgeObjectRetain();
  MEMORY[0x25A298040](v107, v109);
  AnyColumnSlice.distinct()();
  v112(v108, v111);
  swift_bridgeObjectRelease();
  appNameCount = AnyColumnSlice.count.getter();
  v112(v113, v111);
  trainingDate = getDateInEpoch()();
  ssidCount = default argument 4 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  uint64_t v3 = default argument 6 of ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)();
  ModelStats.init(interfaceType:trainingRowCount:validationRowCount:carrierCount:ssidCount:appNameCount:sessionIDCount:trainingMAPE:validationMAPE:trainingDate:)((MediaML::ModelStats *)(v0 + 16), interfaceType, trainingRowCount, validationRowCount, carrierCount, ssidCount, appNameCount, v3, trainingMAPE, validationMAPE, trainingDate);
  uint64_t v123 = *(void *)(v0 + 16);
  v124 = *(void *)(v0 + 24);
  uint64_t v125 = *(void *)(v0 + 32);
  unint64_t v126 = *(void *)(v0 + 40);
  unint64_t v127 = *(void *)(v0 + 48);
  v128 = *(void *)(v0 + 56);
  uint64_t v129 = *(void *)(v0 + 64);
  uint64_t v130 = *(void *)(v0 + 72);
  uint64_t v131 = *(void *)(v0 + 80);
  uint64_t v132 = *(void *)(v0 + 88);
  *(void *)(v0 + 96) = v123;
  *(void *)(v0 + 104) = v124;
  *(void *)(v0 + 112) = v125;
  *(void *)(v0 + 120) = v126;
  *(void *)(v0 + 128) = v127;
  *(void *)(v0 + 136) = v128;
  *(void *)(v0 + 144) = v129;
  *(void *)(v0 + 152) = v130;
  *(void *)(v0 + 160) = v131;
  *(void *)(v0 + 168) = v132;
  uint64_t v4 = CellularModel.logger.unsafeMutableAddressor();
  uint64_t v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 16);
  v135(v110, v4, v134);
  uint64_t v137 = swift_allocObject();
  memcpy((void *)(v137 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v139 = swift_allocObject();
  memcpy((void *)(v139 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v141 = swift_allocObject();
  memcpy((void *)(v141 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v143 = swift_allocObject();
  memcpy((void *)(v143 + 16), (const void *)(v0 + 16), 0x50uLL);
  uint64_t v158 = Logger.logObject.getter();
  uint64_t v159 = static os_log_type_t.info.getter();
  *(void *)(v0 + 296) = 42;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 780);
  Swift::Int v145 = swift_allocObject();
  *(unsigned char *)(v145 + 16) = 0;
  Swift::Int v146 = swift_allocObject();
  *(unsigned char *)(v146 + 16) = 8;
  uint64_t v138 = swift_allocObject();
  *(void *)(v138 + 16) = partial apply for implicit closure #2 in CellularModel.train(dataFrame:);
  *(void *)(v138 + 24) = v137;
  Swift::Int v147 = swift_allocObject();
  *(void *)(v147 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v147 + 24) = v138;
  Swift::Int v148 = swift_allocObject();
  *(unsigned char *)(v148 + 16) = 0;
  Swift::Int v149 = swift_allocObject();
  *(unsigned char *)(v149 + 16) = 8;
  uint64_t v140 = swift_allocObject();
  *(void *)(v140 + 16) = partial apply for implicit closure #3 in CellularModel.train(dataFrame:);
  *(void *)(v140 + 24) = v139;
  Swift::Int v150 = swift_allocObject();
  *(void *)(v150 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v150 + 24) = v140;
  double v151 = swift_allocObject();
  *(unsigned char *)(v151 + 16) = 0;
  double v152 = swift_allocObject();
  *(unsigned char *)(v152 + 16) = 8;
  int v142 = swift_allocObject();
  *(void *)(v142 + 16) = partial apply for implicit closure #4 in CellularModel.train(dataFrame:);
  *(void *)(v142 + 24) = v141;
  Swift::Int v153 = swift_allocObject();
  *(void *)(v153 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v153 + 24) = v142;
  uint64_t v154 = swift_allocObject();
  *(unsigned char *)(v154 + 16) = 0;
  uint64_t v155 = swift_allocObject();
  *(unsigned char *)(v155 + 16) = 8;
  uint64_t v144 = swift_allocObject();
  *(void *)(v144 + 16) = partial apply for implicit closure #5 in CellularModel.train(dataFrame:);
  *(void *)(v144 + 24) = v143;
  uint64_t v156 = swift_allocObject();
  *(void *)(v156 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v156 + 24) = v144;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v157 = v5;
  swift_retain();
  *uint64_t v157 = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[1] = v145;
  swift_retain();
  v157[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[3] = v146;
  swift_retain();
  v157[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v157[5] = v147;
  swift_retain();
  v157[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[7] = v148;
  swift_retain();
  v157[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[9] = v149;
  swift_retain();
  v157[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v157[11] = v150;
  swift_retain();
  v157[12] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[13] = v151;
  swift_retain();
  v157[14] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[15] = v152;
  swift_retain();
  v157[16] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[17] = v153;
  swift_retain();
  v157[18] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[19] = v154;
  swift_retain();
  v157[20] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[21] = v155;
  swift_retain();
  v157[22] = closure #1 in OSLogArguments.append(_:)partial apply;
  v157[23] = v156;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v158, v159))
  {
    uint64_t v6 = *(void *)(v97 + 768);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v95 = createStorage<A>(capacity:type:)(0);
    uint64_t v96 = createStorage<A>(capacity:type:)(0);
    uint64_t v170 = buf;
    uint64_t v171 = v95;
    uint64_t v172 = v96;
    serialize(_:at:)(0, &v170);
    serialize(_:at:)(4, &v170);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v145;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    if (v6) {
      return result;
    }
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v146;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v174 = v147;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v148;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v149;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v174 = v150;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v151;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v152;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v153;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v154;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v155;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    uint64_t v173 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v174 = v156;
    closure #1 in osLogInternal(_:log:type:)(&v173, (uint64_t)&v170, (uint64_t)&v171, (uint64_t)&v172);
    _os_log_impl(&dword_255CF7000, v158, v159, "Cell model stats: trainingRowCount: %ld, validationRowCount: %ld trainingMAPE:%f, validationMAPE: %f", buf, size);
    destroyStorage<A>(_:count:)(v95, 0, v93);
    destroyStorage<A>(_:count:)(v96, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
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
    uint64_t v92 = 0;
  }
  else
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
    swift_release();
    swift_release();
    swift_release();
    uint64_t v92 = *(void *)(v97 + 768);
  }
  uint64_t v91 = *(double *)(v97 + 760);
  uint64_t v88 = *(void *)(v97 + 416);
  uint64_t v89 = *(void *)(v97 + 376);
  uint64_t v87 = *(void *)(v97 + 384);

  uint64_t v90 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
  v90(v88, v89);
  v8.n128_f64[0] = v91;
  if (v91 >= 0.7)
  {
    uint64_t v49 = *(void *)(v97 + 760);
    uint64_t v12 = *(void *)(v97 + 400);
    uint64_t v48 = *(void *)(v97 + 376);
    uint64_t v13 = CellularModel.logger.unsafeMutableAddressor();
    v135(v12, v13, v48);
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v49;
    log = Logger.logObject.getter();
    uint64_t v62 = static os_log_type_t.info.getter();
    *(void *)(v97 + 304) = 22;
    UnsignedInteger<>.init<A>(_:)();
    unint64_t v50 = *(_DWORD *)(v97 + 784);
    BOOL v54 = swift_allocObject();
    *(unsigned char *)(v54 + 16) = 0;
    uint64_t v55 = swift_allocObject();
    *(unsigned char *)(v55 + 16) = 8;
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = partial apply for implicit closure #7 in CellularModel.train(dataFrame:);
    *(void *)(v52 + 24) = v51;
    uint64_t v56 = swift_allocObject();
    *(void *)(v56 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(void *)(v56 + 24) = v52;
    uint64_t v57 = swift_allocObject();
    *(unsigned char *)(v57 + 16) = 0;
    uint64_t v58 = swift_allocObject();
    *(unsigned char *)(v58 + 16) = 8;
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = implicit closure #8 in CellularModel.train(dataFrame:);
    *(void *)(v53 + 24) = 0;
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
    *(void *)(v59 + 24) = v53;
    _allocateUninitializedArray<A>(_:)();
    uint64_t v60 = v14;
    swift_retain();
    *uint64_t v60 = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[1] = v54;
    swift_retain();
    v60[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[3] = v55;
    swift_retain();
    v60[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[5] = v56;
    swift_retain();
    v60[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[7] = v57;
    swift_retain();
    v60[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[9] = v58;
    swift_retain();
    v60[10] = closure #1 in OSLogArguments.append(_:)partial apply;
    v60[11] = v59;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v62))
    {
      uint64_t v45 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v46 = createStorage<A>(capacity:type:)(0);
      uint64_t v47 = createStorage<A>(capacity:type:)(0);
      uint64_t v160 = v45;
      int v161 = v46;
      Swift::String v162 = v47;
      serialize(_:at:)(0, &v160);
      serialize(_:at:)(2, &v160);
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v54;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      if (v92) {
        return result;
      }
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v55;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v56;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v57;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v58;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      uint64_t v163 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v164 = v59;
      closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v160, (uint64_t)&v161, (uint64_t)&v162);
      _os_log_impl(&dword_255CF7000, log, v62, "Cell model not updated. Validation MAPE %f exceeds modelMAPEThreshold %f. ", v45, v50);
      destroyStorage<A>(_:count:)(v46, 0, v44);
      destroyStorage<A>(_:count:)(v47, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v45, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v42 = *(void *)(v97 + 400);
    uint64_t v43 = *(void *)(v97 + 376);

    v90(v42, v43);
    goto LABEL_18;
  }
  int v86 = *(void *)(v97 + 368);
  v85 = *(void *)(v97 + 352);
  uint64_t v83 = *(void *)(v97 + 336);
  uint64_t v84 = *(void *)(v97 + 360);
  (*(void (**)(void, uint64_t, __n128))(v97 + 656))(*(void *)(v97 + 520), v83 + OBJC_IVAR____TtC7MediaML13CellularModel_estimator, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v86, v83 + OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL, v85);
  default argument 2 of SupervisedTabularEstimator.write(_:to:overwrite:)();
  SupervisedTabularEstimator.write(_:to:overwrite:)();
  if (!v92)
  {
    uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v97 + 704);
    uint64_t v69 = *(void *)(v97 + 520);
    uint64_t v70 = *(void *)(v97 + 504);
    uint64_t v9 = *(void *)(v97 + 408);
    uint64_t v72 = *(void *)(v97 + 376);
    uint32_t v73 = *(void *)(v97 + 336);
    (*(void (**)(void, void))(*(void *)(v97 + 360) + 8))(*(void *)(v97 + 368), *(void *)(v97 + 352));
    v71(v69, v70);
    unint64_t v10 = CellularModel.logger.unsafeMutableAddressor();
    v135(v9, v10, v72);
    swift_retain();
    swift_retain();
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = partial apply for implicit closure #6 in CellularModel.train(dataFrame:);
    *(void *)(v75 + 24) = v73;
    swift_release();
    oslog = Logger.logObject.getter();
    uint64_t v82 = static os_log_type_t.info.getter();
    *(void *)(v97 + 312) = 12;
    UnsignedInteger<>.init<A>(_:)();
    os_log_type_t v74 = *(_DWORD *)(v97 + 788);
    BOOL v77 = swift_allocObject();
    *(unsigned char *)(v77 + 16) = 32;
    uint64_t v78 = swift_allocObject();
    *(unsigned char *)(v78 + 16) = 8;
    uint64_t v76 = swift_allocObject();
    *(void *)(v76 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
    *(void *)(v76 + 24) = v75;
    uint64_t v79 = swift_allocObject();
    *(void *)(v79 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
    *(void *)(v79 + 24) = v76;
    _allocateUninitializedArray<A>(_:)();
    uint64_t v80 = v11;
    swift_retain();
    NSObject *v80 = closure #1 in OSLogArguments.append(_:)partial apply;
    v80[1] = v77;
    swift_retain();
    v80[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v80[3] = v78;
    swift_retain();
    v80[4] = closure #1 in OSLogArguments.append(_:)partial apply;
    v80[5] = v79;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v82))
    {
      uint64_t v66 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v67 = createStorage<A>(capacity:type:)(0);
      uint64_t v68 = createStorage<A>(capacity:type:)(1);
      unint64_t v165 = v66;
      unint64_t v166 = v67;
      v167 = v68;
      serialize(_:at:)(2, &v165);
      serialize(_:at:)(1, &v165);
      uint32_t v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v169 = v77;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      uint32_t v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v169 = v78;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      uint32_t v168 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v169 = v79;
      closure #1 in osLogInternal(_:log:type:)(&v168, (uint64_t)&v165, (uint64_t)&v166, (uint64_t)&v167);
      _os_log_impl(&dword_255CF7000, oslog, v82, "Updated cell model written to: %s", v66, v74);
      destroyStorage<A>(_:count:)(v67, 0, v65);
      destroyStorage<A>(_:count:)(v68, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v66, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    BOOL v63 = *(void *)(v97 + 408);
    uint64_t v64 = *(void *)(v97 + 376);

    v90(v63, v64);
LABEL_18:
    os_log_type_t v40 = *(void (**)(uint64_t, uint64_t))(v97 + 640);
    uint64_t v38 = *(void *)(v97 + 632);
    uint64_t v37 = *(void *)(v97 + 624);
    uint64_t v39 = *(void *)(v97 + 592);
    uint64_t v34 = *(void *)(v97 + 584);
    uint64_t v33 = *(void *)(v97 + 576);
    uint64_t v35 = *(void *)(v97 + 560);
    uint64_t v32 = *(void *)(v97 + 568);
    (*(void (**)(void, void))(*(void *)(v97 + 544) + 8))(*(void *)(v97 + 552), *(void *)(v97 + 536));
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v36(v33, v35);
    v36(v34, v35);
    v40(v37, v39);
    v40(v38, v39);
    uint64_t v41 = *(void *)(v97 + 320);
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
    *(void *)uint64_t v41 = v123;
    *(void *)(v41 + 8) = v124;
    *(void *)(v41 + 16) = v125;
    *(void *)(v41 + 24) = v126;
    *(void *)(v41 + 32) = v127;
    *(void *)(v41 + 40) = v128;
    *(void *)(v41 + 48) = v129;
    *(void *)(v41 + 56) = v130;
    *(void *)(v41 + 64) = v131;
    *(void *)(v41 + 72) = v132;
    *(unsigned char *)(v41 + 80) = 0;
    uint64_t v15 = *(uint64_t (**)(void))(*(void *)(v97 + 216) + 8);
    return v15();
  }
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v97 + 704);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v97 + 640);
  uint64_t v29 = *(void *)(v97 + 632);
  uint64_t v28 = *(void *)(v97 + 624);
  uint64_t v30 = *(void *)(v97 + 592);
  uint64_t v25 = *(void *)(v97 + 584);
  uint64_t v24 = *(void *)(v97 + 576);
  uint64_t v26 = *(void *)(v97 + 560);
  uint64_t v21 = *(void *)(v97 + 552);
  uint64_t v22 = *(void *)(v97 + 536);
  uint64_t v17 = *(void *)(v97 + 520);
  uint64_t v18 = *(void *)(v97 + 504);
  uint64_t v23 = *(void *)(v97 + 568);
  uint64_t v20 = *(void *)(v97 + 544);
  (*(void (**)(void, void))(*(void *)(v97 + 360) + 8))(*(void *)(v97 + 368), *(void *)(v97 + 352));
  v19(v17, v18);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
  os_log_type_t v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v27(v24, v26);
  v27(v25, v26);
  v31(v28, v30);
  v31(v29, v30);
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
  uint64_t v16 = *(uint64_t (**)(void))(*(void *)(v97 + 216) + 8);
  return v16();
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;

  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[80];
  uint64_t v13 = v0[79];
  uint64_t v12 = v0[78];
  uint64_t v14 = v0[74];
  uint64_t v9 = v0[73];
  uint64_t v8 = v0[72];
  uint64_t v7 = v0[71];
  unint64_t v10 = v0[70];
  uint64_t v6 = v0[66];
  uint64_t v4 = v0[64];
  uint64_t v5 = v0[63];
  uint64_t v3 = v0[62];
  v0[27] = v0;
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?((uint64_t)partial apply for closure #1 in CellularModel.train(dataFrame:));
  outlined destroy of DataFrame?(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v11(v8, v10);
  v11(v9, v10);
  v15(v12, v14);
  v15(v13, v14);
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
  uint64_t v1 = *(uint64_t (**)(void))(v0[27] + 8);
  return v1();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;

  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[80];
  uint64_t v12 = v0[79];
  uint64_t v11 = v0[78];
  uint64_t v13 = v0[74];
  uint64_t v8 = v0[73];
  uint64_t v7 = v0[72];
  uint64_t v6 = v0[71];
  uint64_t v9 = v0[70];
  uint64_t v1 = v0[69];
  uint64_t v2 = v0[68];
  uint64_t v3 = v0[67];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
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
  uint64_t v4 = *(uint64_t (**)(void))(v0[27] + 8);
  return v4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;

  uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[80];
  uint64_t v12 = v0[79];
  uint64_t v11 = v0[78];
  uint64_t v13 = v0[74];
  uint64_t v8 = v0[73];
  uint64_t v7 = v0[72];
  uint64_t v6 = v0[71];
  uint64_t v9 = v0[70];
  uint64_t v1 = v0[69];
  uint64_t v2 = v0[68];
  uint64_t v3 = v0[67];
  v0[27] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  unint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v7, v9);
  v10(v8, v9);
  v14(v11, v13);
  v14(v12, v13);
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
  uint64_t v4 = *(uint64_t (**)(void))(v0[27] + 8);
  return v4();
}

uint64_t CellularModel.train(dataFrame:)(double a1)
{
  uint64_t v13 = *v2;
  *(void *)(v13 + 216) = *v2;
  *(double *)(v13 + 736) = a1;
  *(void *)(v13 + 744) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v10 = *(void *)(v13 + 336);
    return MEMORY[0x270FA2498](CellularModel.train(dataFrame:), v10, 0);
  }
  else
  {
    uint64_t v3 = *(void *)(v13 + 336);
    *(double *)(v13 + 280) = a1;
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 152)
                                                                     + **(int **)(*(void *)v3 + 152));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v13 + 752) = v4;
    *uint64_t v4 = *(void *)(v13 + 216);
    v4[1] = CellularModel.train(dataFrame:);
    uint64_t v5 = *(void *)(v13 + 728);
    uint64_t v6 = *(void *)(v13 + 576);
    uint64_t v7 = *(void *)(v13 + 552);
    uint64_t v8 = *(void *)(v13 + 536);
    return v11(v6, v7, v8, v5);
  }
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;

  uint64_t v6 = *v2;
  *(void *)(v6 + 216) = *v2;
  *(double *)(v6 + 760) = a1;
  *(void *)(v6 + 768) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = *(void *)(v6 + 336);
    uint64_t v4 = CellularModel.train(dataFrame:);
  }
  else
  {
    uint64_t v3 = *(void *)(v6 + 336);
    uint64_t v4 = CellularModel.train(dataFrame:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t closure #1 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  uint64_t v61 = 0;
  uint64_t v55 = partial apply for implicit closure #1 in closure #1 in CellularModel.train(dataFrame:);
  uint64_t v56 = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v59 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v84 = 0;
  uint64_t v82 = 0;
  uint64_t v60 = 0;
  uint64_t v62 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = v62 - 8;
  unint64_t v65 = (*(void *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v66 = (char *)v18 - v65;
  uint64_t v70 = type metadata accessor for MetricsKey();
  uint64_t v67 = *(void *)(v70 - 8);
  uint64_t v68 = v70 - 8;
  unint64_t v69 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v70);
  uint64_t v72 = (char *)v18 - v69;
  uint64_t v84 = a1;
  uint64_t v73 = Event.metrics.getter();
  static MetricsKey.validationError.getter();
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Sendable);
  unint64_t v2 = lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey();
  MEMORY[0x25A298290](v83, v72, v73, v70, v71, v2);
  swift_bridgeObjectRelease();
  if (v83[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v50 = v74;
      int v51 = 0;
    }
    else
    {
      uint64_t v50 = 0;
      int v51 = 1;
    }
    int v49 = v51;
    uint64_t v48 = v50;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v72, v70);
    uint64_t v53 = v48;
    int v54 = v49;
  }
  else
  {
    uint64_t v52 = 0;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v72, v70);
    uint64_t result = outlined destroy of Sendable?((uint64_t)v83);
    uint64_t v53 = v52;
    int v54 = 1;
  }
  uint64_t v47 = v53;
  if ((v54 & 1) == 0)
  {
    uint64_t v46 = v47;
    uint64_t v4 = v66;
    uint64_t v28 = v47;
    uint64_t v82 = v47;
    uint64_t v5 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v4, v5, v62);
    uint64_t v35 = 7;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v28;
    uint64_t v44 = Logger.logObject.getter();
    int v45 = static os_log_type_t.info.getter();
    uint64_t v31 = &v80;
    uint64_t v80 = 12;
    unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v30 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v32 = v81;
    uint64_t v33 = 17;
    uint64_t v38 = swift_allocObject();
    *(unsigned char *)(v38 + 16) = 0;
    uint64_t v39 = swift_allocObject();
    *(unsigned char *)(v39 + 16) = 8;
    uint64_t v34 = 32;
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = v36;
    uint64_t v37 = v6;
    *(void *)(v6 + 16) = v55;
    *(void *)(v6 + 24) = v7;
    uint64_t v8 = swift_allocObject();
    uint64_t v9 = v37;
    uint64_t v41 = v8;
    *(void *)(v8 + 16) = v56;
    *(void *)(v8 + 24) = v9;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v40 = _allocateUninitializedArray<A>(_:)();
    uint64_t v42 = v10;
    swift_retain();
    uint64_t v11 = v38;
    uint64_t v12 = v42;
    *uint64_t v42 = v57;
    v12[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
    swift_retain();
    uint64_t v13 = v39;
    uint64_t v14 = v42;
    v42[2] = v58;
    v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
    swift_retain();
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v41;
    uint64_t v16 = v42;
    v42[4] = v59;
    v16[5] = v15;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      uint64_t v17 = v60;
      uint64_t v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v20 = 0;
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      uint64_t v23 = createStorage<A>(capacity:type:)(v20);
      uint64_t v24 = &v79;
      uint64_t v79 = v21;
      uint64_t v25 = &v78;
      uint64_t v78 = v22;
      uint64_t v26 = &v77;
      uint64_t v77 = v23;
      serialize(_:at:)(0, &v79);
      serialize(_:at:)(1, v24);
      uint64_t v75 = v57;
      uint64_t v76 = v38;
      closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)v24, (uint64_t)v25, (uint64_t)v26);
      uint64_t v27 = v17;
      if (v17)
      {
        __break(1u);
      }
      else
      {
        uint64_t v75 = v58;
        uint64_t v76 = v39;
        closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
        v18[1] = 0;
        uint64_t v75 = v59;
        uint64_t v76 = v41;
        closure #1 in osLogInternal(_:log:type:)(&v75, (uint64_t)&v79, (uint64_t)&v78, (uint64_t)&v77);
        _os_log_impl(&dword_255CF7000, v44, (os_log_type_t)v45, "Validation error: %f", v21, v32);
        v18[0] = 0;
        destroyStorage<A>(_:count:)(v22, 0, v19);
        destroyStorage<A>(_:count:)(v23, v18[0], MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v21, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v62);
  }
  return result;
}

uint64_t implicit closure #2 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t implicit closure #3 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

double implicit closure #4 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

double implicit closure #5 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return *(double *)(a1 + 64);
}

uint64_t implicit closure #6 in CellularModel.train(dataFrame:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  uint64_t v2 = type metadata accessor for URL();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1 + v4);
}

double implicit closure #8 in CellularModel.train(dataFrame:)()
{
  return 0.7;
}

Swift::Void __swiftcall CellularModel.readModelFile()()
{
  v3[37] = 0;
  uint64_t v22 = MEMORY[0x263F04418];
  v3[31] = partial apply for implicit closure #1 in CellularModel.readModelFile();
  v3[32] = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  v3[33] = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  v3[34] = closure #1 in OSLogArguments.append(_:)partial apply;
  v3[35] = closure #1 in OSLogArguments.append(_:)partial apply;
  v3[36] = closure #1 in OSLogArguments.append(_:)partial apply;
  uint64_t v36 = 0;
  uint64_t v27 = 0;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v4 - 8;
  unint64_t v7 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v8 = (char *)v3 - v7;
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v9 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v17);
  uint64_t v25 = (char *)v3 - v9;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  uint64_t v12 = *(void *)(v24 - 8);
  uint64_t v10 = v24 - 8;
  unint64_t v11 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24);
  uint64_t v13 = (char *)v3 - v11;
  uint64_t v36 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)v3 - v11, v16 + OBJC_IVAR____TtC7MediaML13CellularModel_estimator);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v25, v16 + OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL, v17);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
  uint64_t v18 = (uint64_t *)v33;
  uint64_t v34 = v0;
  unint64_t v35 = lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
  unint64_t v21 = lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
  unint64_t v1 = lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
  uint64_t v28 = v19;
  uint64_t v29 = v20;
  unint64_t v30 = v21;
  unint64_t v31 = v1;
  uint64_t v32 = MEMORY[0x263F8D568];
  swift_getOpaqueTypeConformance2();
  SupervisedTabularEstimator.read(from:)();
  uint64_t v26 = 0;
  uint64_t v2 = v16;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v25, v17);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v13, v24);
  (*(void (**)(unsigned char *))(*(void *)v2 + 128))(v33);
}

void *implicit closure #1 in CellularModel.readModelFile()(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = v8;
  uint64_t v27 = v12;
  v9[52] = v12;
  v9[51] = v30;
  v9[50] = v29;
  v9[49] = a8;
  v9[48] = a7;
  v9[47] = a6;
  v9[46] = a5;
  v9[45] = a4;
  v9[44] = a3;
  v9[43] = a2;
  v9[42] = a1;
  v9[28] = v9;
  v9[22] = 0;
  v9[23] = 0;
  v9[24] = 0;
  v9[25] = 0;
  v9[29] = 0;
  v9[30] = 0;
  v9[31] = 0;
  v9[32] = 0;
  v9[33] = 0;
  v9[34] = 0;
  v9[35] = 0;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  v9[53] = v14;
  v9[54] = *(void *)(v14 - 8);
  v9[55] = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  v9[56] = v15;
  v9[57] = *(void *)(v15 - 8);
  v9[58] = swift_task_alloc();
  uint64_t v16 = type metadata accessor for DataFrame();
  v9[59] = v16;
  uint64_t v20 = *(void *)(v16 - 8);
  v9[60] = v20;
  v9[61] = *(void *)(v20 + 64);
  v9[62] = swift_task_alloc();
  v9[63] = swift_task_alloc();
  v9[64] = swift_task_alloc();
  uint64_t v17 = type metadata accessor for Logger();
  v9[65] = v17;
  v9[66] = *(void *)(v17 - 8);
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  uint64_t v18 = type metadata accessor for DispatchTime();
  v9[69] = v18;
  uint64_t v21 = *(void *)(v18 - 8);
  v9[70] = v21;
  v9[71] = *(void *)(v21 + 64);
  v9[72] = swift_task_alloc();
  v9[73] = swift_task_alloc();
  v9[74] = swift_task_alloc();
  v9[75] = swift_task_alloc();
  v9[22] = a1;
  v9[23] = a2;
  v9[24] = a3;
  v9[25] = a4;
  v9[29] = a5;
  v9[30] = a6;
  v9[31] = a7;
  v9[32] = a8;
  v9[33] = v29;
  v9[34] = v30;
  v9[35] = v27;
  return MEMORY[0x270FA2498](CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:), v27, 0);
}

uint64_t CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  uint64_t v1 = v0[52];
  v0[28] = v0;
  uint64_t v2 = static DispatchTime.now()();
  (*(void (**)(uint64_t))(*(void *)v1 + 120))(v2);
  BOOL v76 = v0[5] == 0;
  outlined destroy of Transformer?((uint64_t)(v77 + 2));
  if (v76)
  {
    uint64_t v3 = v77[68];
    uint64_t v71 = v77[65];
    uint64_t v70 = v77[66];
    uint64_t v4 = CellularModel.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v3, v4, v71);
    uint64_t v74 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.debug.getter();
    v77[37] = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v72 = *((_DWORD *)v77 + 156);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v75 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v74, v73))
    {
      uint64_t v66 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v67 = createStorage<A>(capacity:type:)(0);
      uint64_t v68 = createStorage<A>(capacity:type:)(0);
      v77[38] = v66;
      v77[39] = v67;
      v77[40] = v68;
      serialize(_:at:)(0, (unsigned char **)v77 + 38);
      serialize(_:at:)(0, (unsigned char **)v77 + 38);
      v77[41] = v75;
      unint64_t v69 = (void *)swift_task_alloc();
      v69[2] = v77 + 38;
      v69[3] = v77 + 39;
      v69[4] = v77 + 40;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v74, v73, "Reading cell model from disk...", v66, v72);
      destroyStorage<A>(_:count:)(v67, 0, v65);
      destroyStorage<A>(_:count:)(v68, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v66, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v63 = v77[68];
    uint64_t v64 = v77[65];
    uint64_t v5 = v77[52];
    uint64_t v62 = v77[66];

    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v63, v64);
    (*(void (**)(uint64_t))(*(void *)v5 + 176))(v6);
  }
  uint64_t v7 = v77[52];
  uint64_t v60 = v77[51];
  uint64_t v58 = v77[50];
  uint64_t v57 = v77[49];
  uint64_t v56 = v77[48];
  uint64_t v55 = v77[47];
  uint64_t v54 = v77[46];
  uint64_t v53 = v77[45];
  uint64_t v51 = v77[44];
  uint64_t v48 = v77[43];
  uint64_t v46 = v77[42];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, [Any?]));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v61 = v8;
  unint64_t v9 = kMediaML_carrier.unsafeMutableAddressor();
  outlined init with copy of String(v9, v61);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v45 = _allocateUninitializedArray<A>(_:)();
  uint64_t v47 = v10;
  swift_bridgeObjectRetain();
  uint64_t v50 = MEMORY[0x263F8D310];
  v47[3] = MEMORY[0x263F8D310];
  *uint64_t v47 = v46;
  v47[1] = v48;
  _finalizeUninitializedArray<A>(_:)();
  v61[2] = v45;
  unint64_t v11 = kMediaML_appName.unsafeMutableAddressor();
  outlined init with copy of String(v11, v61 + 3);
  uint64_t v49 = _allocateUninitializedArray<A>(_:)();
  uint64_t v52 = v12;
  swift_bridgeObjectRetain();
  v52[3] = v50;
  *uint64_t v52 = v51;
  v52[1] = v53;
  _finalizeUninitializedArray<A>(_:)();
  v61[5] = v49;
  uint64_t v13 = kMediaML_binnedRssi.unsafeMutableAddressor();
  outlined init with copy of String(v13, v61 + 6);
  uint64_t v14 = _allocateUninitializedArray<A>(_:)();
  uint64_t v59 = MEMORY[0x263F8D6C8];
  v15[3] = MEMORY[0x263F8D6C8];
  *uint64_t v15 = v54;
  _finalizeUninitializedArray<A>(_:)();
  v61[8] = v14;
  uint64_t v16 = kMediaML_binnedRsrp.unsafeMutableAddressor();
  outlined init with copy of String(v16, v61 + 9);
  uint64_t v17 = _allocateUninitializedArray<A>(_:)();
  uint64_t v18[3] = v59;
  *uint64_t v18 = v55;
  _finalizeUninitializedArray<A>(_:)();
  v61[11] = v17;
  uint64_t v19 = kMediaML_binnedRsrq.unsafeMutableAddressor();
  outlined init with copy of String(v19, v61 + 12);
  uint64_t v20 = _allocateUninitializedArray<A>(_:)();
  v21[3] = v59;
  *uint64_t v21 = v56;
  _finalizeUninitializedArray<A>(_:)();
  v61[14] = v20;
  uint64_t v22 = kMediaML_binnedRscp.unsafeMutableAddressor();
  outlined init with copy of String(v22, v61 + 15);
  uint64_t v23 = _allocateUninitializedArray<A>(_:)();
  v24[3] = v59;
  *uint64_t v24 = v57;
  _finalizeUninitializedArray<A>(_:)();
  v61[17] = v23;
  uint64_t v25 = kMediaML_binnedSnr.unsafeMutableAddressor();
  outlined init with copy of String(v25, v61 + 18);
  uint64_t v26 = _allocateUninitializedArray<A>(_:)();
  v27[3] = v59;
  *uint64_t v27 = v58;
  _finalizeUninitializedArray<A>(_:)();
  v61[20] = v26;
  uint64_t v28 = kMediaML_bars.unsafeMutableAddressor();
  outlined init with copy of String(v28, v61 + 21);
  uint64_t v29 = _allocateUninitializedArray<A>(_:)();
  v30[3] = v59;
  *uint64_t v30 = v60;
  _finalizeUninitializedArray<A>(_:)();
  v61[23] = v29;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v31 = DataFrame.init(dictionaryLiteral:)();
  (*(void (**)(uint64_t))(*(void *)v7 + 120))(v31);
  if (v77[20])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TabularTransformer);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v77[12] = 0;
      v77[13] = 0;
      v77[14] = 0;
      v77[15] = 0;
      v77[16] = 0;
    }
  }
  else
  {
    outlined destroy of Transformer?((uint64_t)(v77 + 17));
    v77[12] = 0;
    v77[13] = 0;
    v77[14] = 0;
    v77[15] = 0;
    v77[16] = 0;
  }
  if (v77[15])
  {
    outlined init with take of TabularTransformer(v77 + 12, v77 + 7);
    uint64_t v43 = v77[10];
    uint64_t v44 = v77[11];
    __swift_project_boxed_opaque_existential_1(v77 + 7, v43);
    uint64_t v32 = (void *)swift_task_alloc();
    v77[76] = v32;
    *uint64_t v32 = v77[28];
    v32[1] = CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
    uint64_t v33 = v77[64];
    uint64_t v34 = v77[63];
    return MEMORY[0x270EEA5C8](v34, v33, 0, 0, v43, v44);
  }
  else
  {
    uint64_t v41 = v77[75];
    uint64_t v42 = v77[69];
    uint64_t v39 = v77[64];
    uint64_t v38 = v77[59];
    uint64_t v40 = v77[70];
    uint64_t v37 = v77[60];
    outlined destroy of TabularTransformer?((uint64_t)(v77 + 12));
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v42);
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
    unint64_t v35 = *(uint64_t (**)(void, void))(v77[28] + 8);
    return v35(0, 0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)();
  void *v5;
  uint64_t v6;

  uint64_t v5 = (void *)*v1;
  v5[28] = *v1;
  v5[77] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = v5[52];
    uint64_t v3 = CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  }
  else
  {
    uint64_t v2 = v5[52];
    uint64_t v3 = CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t (*v7)(uint64_t, void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint8_t *buf;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  uint64_t v74 = v0;
  uint64_t v45 = *(void *)(v0 + 600);
  uint64_t v44 = *(void *)(v0 + 592);
  uint64_t v50 = *(void *)(v0 + 584);
  uint64_t v52 = *(void *)(v0 + 576);
  uint64_t v47 = *(void *)(v0 + 568);
  uint64_t v48 = *(void *)(v0 + 560);
  uint64_t v53 = *(void *)(v0 + 552);
  uint64_t v1 = *(void *)(v0 + 536);
  unint64_t v35 = *(void *)(v0 + 528);
  uint64_t v36 = *(void *)(v0 + 520);
  uint64_t v37 = *(void *)(v0 + 504);
  uint64_t v41 = *(void *)(v0 + 496);
  uint64_t v38 = *(void *)(v0 + 488);
  uint64_t v39 = *(void *)(v0 + 480);
  uint64_t v42 = *(void *)(v0 + 472);
  uint64_t v43 = *(void *)(v0 + 416);
  *(void *)(v0 + 224) = v0;
  static DispatchTime.now()();
  uint64_t v2 = CellularModel.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v1, v2, v36);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v41, v37, v42);
  swift_retain();
  uint64_t v40 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v56 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v39 + 32))(v56 + v40, v41, v42);
  *(void *)(v56 + ((v40 + v38 + 7) & 0xFFFFFFFFFFFFFFF8)) = v43;
  uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
  v46(v50, v44, v53);
  v46(v52, v45, v53);
  uint64_t v3 = *(_DWORD *)(v48 + 80);
  uint64_t v49 = (v3 + 16) & ~v3;
  uint64_t v51 = (v49 + v47 + v3) & ~v3;
  uint64_t v58 = swift_allocObject();
  uint64_t v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
  v54(v58 + v49, v50, v53);
  v54(v58 + v51, v52, v53);
  uint64_t v67 = Logger.logObject.getter();
  uint64_t v68 = static os_log_type_t.default.getter();
  *(void *)(v0 + 288) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 220);
  uint64_t v60 = swift_allocObject();
  *(unsigned char *)(v60 + 16) = 0;
  uint64_t v61 = swift_allocObject();
  *(unsigned char *)(v61 + 16) = 8;
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = partial apply for implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  *(void *)(v57 + 24) = v56;
  uint64_t v62 = swift_allocObject();
  *(void *)(v62 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v62 + 24) = v57;
  uint64_t v63 = swift_allocObject();
  *(unsigned char *)(v63 + 16) = 0;
  uint64_t v64 = swift_allocObject();
  *(unsigned char *)(v64 + 16) = 8;
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = partial apply for implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:);
  *(void *)(v59 + 24) = v58;
  uint64_t v65 = swift_allocObject();
  *(void *)(v65 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)partial apply;
  *(void *)(v65 + 24) = v59;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v66 = v4;
  swift_retain();
  *uint64_t v66 = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[1] = v60;
  swift_retain();
  v66[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[3] = v61;
  swift_retain();
  v66[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[5] = v62;
  swift_retain();
  v66[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[7] = v63;
  swift_retain();
  v66[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[9] = v64;
  swift_retain();
  v66[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v66[11] = v65;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v5 = *(void *)(v34 + 616);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v32 = createStorage<A>(capacity:type:)(0);
    uint64_t v33 = createStorage<A>(capacity:type:)(0);
    unint64_t v69 = buf;
    uint64_t v70 = v32;
    uint64_t v71 = v33;
    serialize(_:at:)(0, &v69);
    serialize(_:at:)(2, &v69);
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v60;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    if (v5) {
      return result;
    }
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v61;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v62;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v63;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v64;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    uint32_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    os_log_type_t v73 = v65;
    closure #1 in osLogInternal(_:log:type:)(&v72, (uint64_t)&v69, (uint64_t)&v70, (uint64_t)&v71);
    _os_log_impl(&dword_255CF7000, v67, v68, "Finished prediction with cell model. Predicted value = %f Time taken = %f [ns]", buf, size);
    destroyStorage<A>(_:count:)(v32, 0, v30);
    destroyStorage<A>(_:count:)(v33, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v19 = *(void *)(v34 + 536);
  uint64_t v20 = *(void *)(v34 + 520);
  uint64_t v24 = *(void *)(v34 + 464);
  uint64_t v23 = *(void *)(v34 + 448);
  uint64_t v26 = *(void *)(v34 + 440);
  uint64_t v27 = *(void *)(v34 + 424);
  uint64_t v21 = *(void *)(v34 + 416);
  uint64_t v18 = *(void *)(v34 + 528);
  uint64_t v22 = *(void *)(v34 + 456);
  uint64_t v25 = *(void *)(v34 + 432);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v24, v21 + OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID, v23);
  DataFrame.subscript.getter();
  Column.subscript.getter();
  uint64_t v28 = *(void *)(v34 + 208);
  uint64_t v29 = *(unsigned char *)(v34 + 216);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  if (v29) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v15 = *(void *)(v34 + 600);
  unint64_t v9 = *(void *)(v34 + 592);
  uint64_t v16 = *(void *)(v34 + 552);
  uint64_t v12 = *(void *)(v34 + 512);
  unint64_t v11 = *(void *)(v34 + 504);
  uint64_t v13 = *(void *)(v34 + 472);
  uint64_t v8 = *(void *)(v34 + 560);
  uint64_t v10 = *(void *)(v34 + 480);
  (*(void (**)(void, void))(*(void *)(v34 + 456) + 8))(*(void *)(v34 + 464), *(void *)(v34 + 448));
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v17(v9, v16);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v14(v11, v13);
  __swift_destroy_boxed_opaque_existential_1(v34 + 56);
  v14(v12, v13);
  v17(v15, v16);
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
  uint64_t v7 = *(uint64_t (**)(uint64_t, void))(*(void *)(v34 + 224) + 8);
  return v7(v28, v29 & 1);
}

{
  void *v0;
  uint64_t (*v1)();
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v7 = v0[75];
  uint64_t v5 = v0[70];
  uint64_t v6 = v0[69];
  uint64_t v8 = v0[64];
  uint64_t v3 = v0[60];
  uint64_t v4 = v0[59];
  v0[28] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v8, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v6);
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
  uint64_t v1 = *(uint64_t (**)())(*(void *)(v9 + 224) + 8);
  return v1();
}

double implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = a2;
  uint64_t v5 = "Fatal error";
  uint64_t v6 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v7 = "MediaML/MLModel.swift";
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Column<Double>);
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v8 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v18);
  uint64_t v17 = (char *)&v3 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t v11 = v10 - 8;
  unint64_t v12 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v3 - v12;
  (*(void (**)(void))(v13 + 16))();
  DataFrame.subscript.getter();
  Column.subscript.getter();
  double v19 = v21;
  int v20 = v22;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v18);
  if (v20)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    double v4 = v19;
  }
  double v3 = v4;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v10);
  return v3;
}

uint64_t implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  unint64_t v2 = DispatchTime.uptimeNanoseconds.getter();
  unint64_t v0 = DispatchTime.uptimeNanoseconds.getter();
  uint64_t result = v2;
  if (v2 < v0)
  {
    __break(1u);
  }
  else
  {
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    return Double.init<A>(_:)();
  }
  return result;
}

uint64_t CellularModel.deinit()
{
  uint64_t v5 = OBJC_IVAR____TtC7MediaML13CellularModel_targetColumnID;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ColumnID<Double>);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v5);
  outlined destroy of Transformer?(v0 + OBJC_IVAR____TtC7MediaML13CellularModel_model);
  uint64_t v6 = OBJC_IVAR____TtC7MediaML13CellularModel_cellParametersURL;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v0 + v6);
  uint64_t v7 = OBJC_IVAR____TtC7MediaML13CellularModel_estimator;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v0 + v7);
  swift_defaultActor_destroy();
  return v8;
}

uint64_t CellularModel.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t CellularModel.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance CellularModel()
{
  return CellularModel.unownedExecutor.getter();
}

uint64_t _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

void *outlined init with take of ModelStats?(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t closure #1 in osLogInternal(_:log:type:)partial apply(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

{
  uint64_t *v1;

  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_255D27E40()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in WifiModel.train(dataFrame:)(uint64_t a1)
{
  return closure #1 in WifiModel.train(dataFrame:)(a1);
}

uint64_t outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed Event) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t outlined destroy of DataFrame?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for DataFrame();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

unint64_t lazy protocol witness table accessor for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>;
  if (!lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>;
  if (!lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type ComposedTabularTransformer<ColumnSelectorTransformer<OneHotEncoder<String>.Transformer, String>, TreeRegressorModel> and conformance ComposedTabularTransformer<A, B>);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_255D27FE4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in WifiModel.train(dataFrame:)()
{
  return implicit closure #2 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D28018()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in WifiModel.train(dataFrame:)()
{
  return implicit closure #3 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D2804C()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #4 in WifiModel.train(dataFrame:)()
{
  return implicit closure #4 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D28080()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #5 in WifiModel.train(dataFrame:)()
{
  return implicit closure #5 in WifiModel.train(dataFrame:)(v0 + 16);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  v7[1] = a4;
  uint64_t v8 = *(void *)(a3 - 8);
  uint64_t v9 = a3 - 8;
  v7[0] = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)v7 - v7[0];
  v4();
  uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
  return v12;
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
      uint64_t v1 = static Array._allocateBufferUninitialized(minimumCapacity:)();
      *(void *)(v1 + 16) = v4;
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      swift_retain();
      uint64_t v3 = v2;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    return v3;
  }
  return result;
}

uint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v31 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
  unint64_t v33 = (*(void *)(*(void *)(v32 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v14 - v33;
  if (specialized Array.count.getter(v1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, CSVType>);
    uint64_t v30 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v29 = MEMORY[0x263F8EE80];
    swift_retain();
    uint64_t v30 = v29;
  }
  uint64_t v27 = v30;
  uint64_t result = specialized Array._getCount()(v31);
  uint64_t v28 = result;
  if (result)
  {
    uint64_t v25 = &v34[*(int *)(v32 + 48)];
    uint64_t v26 = v27 + 64;
    if (v28 <= 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v23 = 0;
      swift_retain();
      for (uint64_t i = v23; ; uint64_t i = v19)
      {
        uint64_t v18 = i;
        char IsNativeType = specialized Array._hoistableIsNativeTypeChecked()();
        specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(v18, IsNativeType & 1, v31, v34);
        uint64_t v19 = v18 + 1;
        uint64_t v20 = *(void *)v34;
        uint64_t v21 = *((void *)v34 + 1);
        uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
        unint64_t v22 = result;
        if (v4) {
          break;
        }
        uint64_t v5 = v27;
        unint64_t v6 = v22;
        uint64_t v7 = v21;
        uint64_t v8 = v20;
        *(void *)(v26 + 8 * (v22 / 0x40)) |= 1 << ((v22 % 0x40) & 0x3F);
        uint64_t v9 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v6);
        *uint64_t v9 = v8;
        v9[1] = v7;
        uint64_t v15 = *(void *)(v5 + 56);
        uint64_t v16 = *(void *)(type metadata accessor for CSVType() - 8);
        uint64_t result = (*(uint64_t (**)(unint64_t, char *))(v16 + 32))(v15 + v22 * *(void *)(v16 + 72), v25);
        uint64_t v10 = *(void *)(v27 + 16);
        uint64_t v17 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_19;
        }
        uint64_t v12 = v19;
        uint64_t v13 = v28;
        *(void *)(v27 + 16) = v17;
        if (v12 == v13)
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
    swift_retain();
    swift_bridgeObjectRelease();
LABEL_16:
    swift_release();
    return v27;
  }
  return result;
}

uint64_t default argument 1 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  uint64_t v6 = specialized static Array._adoptStorage(_:count:)(inited, 10);
  uint64_t v5 = v1;
  *uint64_t v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#N/A", 4uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#N/A N/A", 8uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("#NA", 3uLL, 1);
  v5[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("N/A", 3uLL, 1);
  void v5[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NA", 2uLL, 1);
  v5[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("NULL", 4uLL, 1);
  v5[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("n/a", 3uLL, 1);
  v5[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nil", 3uLL, 1);
  v5[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("null", 4uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6)) {
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE88];
  swift_retain();
  return v3;
}

uint64_t default argument 2 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  uint64_t v6 = specialized static Array._adoptStorage(_:count:)(inited, 4);
  uint64_t v5 = v1;
  *uint64_t v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("1", 1uLL, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("True", 4uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("TRUE", 4uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("true", 4uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6)) {
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE88];
  swift_retain();
  return v3;
}

uint64_t default argument 3 of CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  uint64_t v6 = specialized static Array._adoptStorage(_:count:)(inited, 4);
  uint64_t v5 = v1;
  *uint64_t v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("0", 1uLL, 1);
  v5[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("False", 5uLL, 1);
  v5[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("FALSE", 5uLL, 1);
  v5[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("false", 5uLL, 1);
  specialized _finalizeUninitializedArray<A>(_:)();
  if (specialized Array._getCount()(v6)) {
    return specialized Set.init(_nonEmptyArrayLiteral:)(v6);
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE88];
  swift_retain();
  return v3;
}

uint64_t specialized static Array._adoptStorage(_:count:)(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> specialized _finalizeUninitializedArray<A>(_:)()
{
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  if (specialized Array.count.getter(a1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
    uint64_t v19 = static _SetStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v18 = MEMORY[0x263F8EE88];
    swift_retain();
    uint64_t v19 = v18;
  }
  uint64_t v17 = specialized Array._getCount()(a1);
  if (!v17)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    return v19;
  }
  uint64_t v15 = v19 + 56;
  for (uint64_t i = 0; ; ++i)
  {
    char IsNativeType = specialized Array._hoistableIsNativeTypeChecked()();
    specialized Array._checkSubscript(_:wasNativeTypeChecked:)(i, IsNativeType & 1, a1);
    uint64_t result = specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(i, IsNativeType & 1, a1);
    uint64_t v13 = result;
    uint64_t v14 = v2;
    if (__OFADD__(i, 1)) {
      break;
    }
    Hasher.init(_seed:)();
    memcpy(__dst, v22, sizeof(__dst));
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v10 = (1 << (*(unsigned char *)(v19 + 32) & 0x3F)) - 1;
    uint64_t v11 = result & v10;
    if ((*(void *)(v15 + 8 * ((result & (unint64_t)v10) / 0x40)) & (1 << (((result & (unint64_t)v10)
                                                                                     % 0x40) & 0x3F))) != 0)
    {
      uint64_t result = static String.== infix(_:_:)();
      if (result) {
        goto LABEL_20;
      }
      if ((*(void *)(v15 + 8 * (((v11 + 1) & (unint64_t)v10) / 0x40)) & (1 << ((((v11 + 1) & (unint64_t)v10)
                                                                                          % 0x40) & 0x3F))) != 0)
      {
        for (uint64_t j = (v11 + 1) & v10; ; uint64_t j = (j + 1) & v10)
        {
          uint64_t result = static String.== infix(_:_:)();
          if (result) {
            break;
          }
          if ((*(void *)(v15 + 8 * (((j + 1) & (unint64_t)v10) / 0x40)) & (1 << ((((j + 1) & (unint64_t)v10)
                                                                                            % 0x40) & 0x3F))) == 0)
          {
            unint64_t v8 = (j + 1) & v10;
            goto LABEL_22;
          }
        }
LABEL_20:
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      unint64_t v8 = (v11 + 1) & v10;
    }
    else
    {
      unint64_t v8 = result & v10;
    }
LABEL_22:
    *(void *)(v15 + 8 * (v8 / 0x40)) |= 1 << ((v8 % 0x40) & 0x3F);
    char v4 = (uint64_t *)(*(void *)(v19 + 48) + 16 * v8);
    *char v4 = v13;
    v4[1] = v14;
    uint64_t v5 = *(void *)(v19 + 16);
    uint64_t v7 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_31;
    }
    *(void *)(v19 + 16) = v7;
LABEL_27:
    if (i + 1 == v17) {
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t specialized Array._hoistableIsNativeTypeChecked()()
{
  return 1;
}

{
  return 1;
}

uint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(uint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else if (result < *(void *)(a3 + 16))
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)(uint64_t a1, char a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a3 + 32 + 16 * a1);
    swift_bridgeObjectRetain();
    return v4;
  }
  else
  {
    uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a3);
    __break(1u);
    __break(1u);
  }
  return result;
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (result >= *(void *)(a2 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * result);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    static String._createEmpty(withInitialCapacity:)(82);
    Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Down-casted Array element failed to match the target type\nExpected ", 0x43uLL, 1);
    String.append(_:)(v2);
    swift_bridgeObjectRelease();
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("String", 6uLL, 1);
    String.append(_:)(v3);
    swift_bridgeObjectRelease();
    Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" but found ", 0xBuLL, 1);
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    swift_getObjectType();
    swift_unknownObjectRelease();
    v5._uint64_t countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    String.init(stringInterpolation:)();
    _assertionFailure(_:_:flags:)();
    __break(1u);
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t static String._createEmpty(withInitialCapacity:)(Swift::Int a1)
{
  if (a1 > 15) {
    _StringGuts.grow(_:)(a1);
  }
  return 0;
}

char *specialized Array._getElement(_:wasNativeTypeChecked:matchingSubscriptCheck:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  if (a2)
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    return outlined init with copy of (String, CSVType)((char *)(a3+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80))+ a1 * *(void *)(*(void *)(v5 - 8) + 72)), a4);
  }
  else
  {
    uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a3);
    uint64_t result = (char *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
    if (*(void *)(*((void *)result - 1) + 64) == 8)
    {
      uint64_t v10 = v6;
      outlined init with copy of (String, CSVType)((char *)&v10, a4);
      return (char *)swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  memcpy(__dst, v7, sizeof(__dst));
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v2);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v19 = a2;
  uint64_t v20 = "Fatal error";
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType));
  unint64_t v23 = (*(void *)(*(void *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t result = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (uint64_t)v9 - v23;
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v21 >= *(void *)(v19 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v17 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * v21);
  uint64_t v18 = &v26;
  uint64_t v26 = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v3 = static String._createEmpty(withInitialCapacity:)(82);
    uint64_t v11 = v25;
    v25[0] = v3;
    v25[1] = v4;
    int v10 = 1;
    Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Down-casted Array element failed to match the target type\nExpected ", 0x43uLL, 1);
    v9[0] = v5._object;
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("(String, CSVType)", 0x11uLL, v10 & 1);
    v9[1] = v6._object;
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    uint64_t v16 = 11;
    Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" but found ", 0xBuLL, v10 & 1);
    object = v7._object;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    uint64_t ObjectType = swift_getObjectType();
    swift_unknownObjectRelease();
    int v15 = 0;
    v8._uint64_t countAndFlagsBits = _typeName(_:qualified:)();
    uint64_t v14 = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    String.init(stringInterpolation:)();
    _assertionFailure(_:_:flags:)();
    __break(1u);
  }
  outlined destroy of (String, CSVType)(v24);
  return v17;
}

uint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (1 << (*(unsigned char *)(v3 + 32) & 0x3F)) - 1;
  uint64_t v10 = a3 & v9;
  if ((*(void *)(v3 + 64 + 8 * ((a3 & (unint64_t)v9) / 0x40)) & (1 << (((a3 & (unint64_t)v9) % 0x40) & 0x3F))) == 0) {
    return a3 & v9;
  }
  if (static String.== infix(_:_:)()) {
    return v10;
  }
  if ((*(void *)(v8 + 64 + 8 * (((v10 + 1) & (unint64_t)v9) / 0x40)) & (1 << ((((v10 + 1) & (unint64_t)v9)
                                                                                         % 0x40) & 0x3F))) != 0)
  {
    uint64_t v7 = (v10 + 1) & v9;
    while ((static String.== infix(_:_:)() & 1) == 0)
    {
      if ((*(void *)(v8 + 64 + 8 * (((v7 + 1) & (unint64_t)v9) / 0x40)) & (1 << ((((v7 + 1) & (unint64_t)v9)
                                                                                            % 0x40) & 0x3F))) == 0)
        return (v7 + 1) & v9;
      uint64_t v7 = (v7 + 1) & v9;
    }
    return v7;
  }
  return (v10 + 1) & v9;
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();
  uint64_t v3 = (void *)_swift_stdlib_bridgeErrorToNSError();
  id v1 = v3;
  swift_unknownObjectRelease();
  return v3;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_255D2988C()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255D298C0()
{
  return swift_deallocObject();
}

uint64_t sub_255D298F4()
{
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_1@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255D29940()
{
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255D299F4()
{
  return swift_deallocObject();
}

uint64_t sub_255D29A28()
{
  return swift_deallocObject();
}

uint64_t sub_255D29A5C()
{
  return swift_deallocObject();
}

uint64_t sub_255D29AA8()
{
  return swift_deallocObject();
}

uint64_t sub_255D29B5C()
{
  return swift_deallocObject();
}

uint64_t sub_255D29B90()
{
  return swift_deallocObject();
}

uint64_t sub_255D29BC4()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_6format5align7privacyySdyXA_AA0B15FloatFormattingVAA0B15StringAlignmentVAA0B7PrivacyVtFSdycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D29C10()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySdycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_255D29C5C()
{
  return swift_deallocObject();
}

uint64_t sub_255D29C90()
{
  return swift_deallocObject();
}

uint64_t sub_255D29CC4()
{
  return swift_deallocObject();
}

uint64_t sub_255D29D10()
{
  return swift_deallocObject();
}

uint64_t sub_255D29D5C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in WifiModel.train(dataFrame:)()
{
  return implicit closure #7 in WifiModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_255D29D90()
{
  return swift_deallocObject();
}

uint64_t sub_255D29DC4()
{
  return swift_deallocObject();
}

uint64_t sub_255D29DF8()
{
  return swift_deallocObject();
}

uint64_t sub_255D29E44()
{
  return swift_deallocObject();
}

uint64_t sub_255D29E90()
{
  return swift_deallocObject();
}

uint64_t sub_255D29EC4()
{
  return swift_deallocObject();
}

uint64_t sub_255D29EF8()
{
  return swift_deallocObject();
}

uint64_t sub_255D29F44()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in WifiModel.train(dataFrame:)@<X0>(uint64_t a1@<X8>)
{
  return implicit closure #6 in WifiModel.train(dataFrame:)(v1, a1);
}

uint64_t sub_255D29F98()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = type metadata accessor for URL();
  unint64_t v1 = lazy protocol witness table accessor for type URL and conformance URL();

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  uint64_t v2 = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    type metadata accessor for URL();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_255D2A0B8()
{
  return swift_deallocObject();
}

uint64_t sub_255D2A0EC()
{
  return swift_deallocObject();
}

uint64_t sub_255D2A120()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D2A16C()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_0(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t lazy protocol witness table accessor for type Column<Double> and conformance Column<A>()
{
  uint64_t v2 = lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>;
  if (!lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Column<Double>);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type Column<Double> and conformance Column<A>);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type [Double?] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Double?] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Double?] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Double?]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Double?] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of [Double?]()
{
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    uint64_t result = v2;
    *uint64_t v3 = v1;
  }
  return result;
}

void *__swift_deallocate_boxed_opaque_existential_1(void *result)
{
  uint64_t v1 = result[3];
  int v2 = *(_DWORD *)(*(void *)(v1 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)MEMORY[0x25A298FA0](*result, ((v2 + 16) & ~(unint64_t)v2)+ *(void *)(*(void *)(v1 - 8) + 64), v2 | 7);
  }
  return result;
}

uint64_t sub_255D2A4E0()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in WifiModel.readModelFile()()
{
  return implicit closure #1 in WifiModel.readModelFile()(*(void **)(v0 + 16));
}

uint64_t sub_255D2A528()
{
  return swift_deallocObject();
}

uint64_t sub_255D2A55C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2A590()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_255D2A5DC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v7 = (id)a4();
  uint64_t v8 = *a1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v8 + 8;
  uint64_t v4 = *a2;
  if (*a2)
  {
    *uint64_t v4 = v7;
    *a2 = v4 + 1;
  }
  else
  {
  }
}

uint64_t sub_255D2A76C()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t outlined destroy of TabularTransformer?(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

void *outlined init with take of TabularTransformer(const void *a1, void *__dst)
{
  return __dst;
}

uint64_t sub_255D2A838()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  swift_release();
  return swift_deallocObject();
}

double partial apply for implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  uint64_t v4 = *(void *)(type metadata accessor for DataFrame() - 8);
  unint64_t v1 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v2 = *(void *)(v0 + ((v1 + *(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8));

  return implicit closure #1 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)(v0 + v1, v2);
}

uint64_t sub_255D2A9C4()
{
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v1 = *(_DWORD *)(v4 + 80);
  uint64_t v2 = (v1 + 16) & ~v1;
  uint64_t v5 = (v2 + *(void *)(v4 + 64) + v1) & ~v1;
  id v7 = *(void (**)(uint64_t))(v4 + 8);
  v7(v0 + v2);
  ((void (*)(uint64_t, uint64_t))v7)(v0 + v5, v6);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)()
{
  type metadata accessor for DispatchTime();

  return implicit closure #2 in WifiModel.predict(ssid:appName:hour:dow:rssi:noise:txRate:rxRate:)();
}

uint64_t sub_255D2AB7C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2ABB0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2ABE4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AC30()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AC7C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2ACB0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2ACE4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AD30()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AE3C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in CellularModel.train(dataFrame:)(uint64_t a1)
{
  return closure #1 in CellularModel.train(dataFrame:)(a1);
}

uint64_t sub_255D2AE70()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in CellularModel.train(dataFrame:)()
{
  return implicit closure #2 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D2AEA4()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in CellularModel.train(dataFrame:)()
{
  return implicit closure #3 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D2AED8()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #4 in CellularModel.train(dataFrame:)()
{
  return implicit closure #4 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D2AF0C()
{
  return swift_deallocObject();
}

double partial apply for implicit closure #5 in CellularModel.train(dataFrame:)()
{
  return implicit closure #5 in CellularModel.train(dataFrame:)(v0 + 16);
}

uint64_t sub_255D2AF40()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AF74()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AFA8()
{
  return swift_deallocObject();
}

uint64_t sub_255D2AFF4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B0A8()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B0DC()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B110()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B15C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B210()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B244()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B278()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B2C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B310()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B344()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B378()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B3C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B410()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #7 in CellularModel.train(dataFrame:)()
{
  return implicit closure #7 in CellularModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_255D2B444()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B478()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B4AC()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B4F8()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B544()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B578()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B5AC()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B5F8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in CellularModel.train(dataFrame:)@<X0>(uint64_t a1@<X8>)
{
  return implicit closure #6 in CellularModel.train(dataFrame:)(v1, a1);
}

uint64_t sub_255D2B64C()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = type metadata accessor for URL();
  unint64_t v1 = lazy protocol witness table accessor for type URL and conformance URL();

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars8;

  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_255D2B6E8()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B71C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B750()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B79C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B7E8()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in CellularModel.readModelFile()()
{
  return implicit closure #1 in CellularModel.readModelFile()(*(void **)(v0 + 16));
}

uint64_t sub_255D2B830()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B864()
{
  return swift_deallocObject();
}

uint64_t sub_255D2B898()
{
  return swift_deallocObject();
}

void *implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_255D2B8E4()
{
  return swift_deallocObject();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

{
  uint64_t v0;

  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D2B930()
{
  return swift_deallocObject();
}

void closure #1 in OSLogArguments.append(_:)partial apply(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

{
  uint64_t v3;

  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D2B97C()
{
  uint64_t v2 = *(void *)(type metadata accessor for DataFrame() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  swift_release();
  return swift_deallocObject();
}

double partial apply for implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  uint64_t v4 = *(void *)(type metadata accessor for DataFrame() - 8);
  unint64_t v1 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v2 = *(void *)(v0 + ((v1 + *(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8));

  return implicit closure #1 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)(v0 + v1, v2);
}

uint64_t sub_255D2BB08()
{
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v1 = *(_DWORD *)(v4 + 80);
  uint64_t v2 = (v1 + 16) & ~v1;
  uint64_t v5 = (v2 + *(void *)(v4 + 64) + v1) & ~v1;
  id v7 = *(void (**)(uint64_t))(v4 + 8);
  v7(v0 + v2);
  ((void (*)(uint64_t, uint64_t))v7)(v0 + v5, v6);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)()
{
  type metadata accessor for DispatchTime();

  return implicit closure #2 in CellularModel.predict(carrier:appName:binned_rssi:binned_rsrp:binned_rsrq:binned_rscp:binned_snr:bars:)();
}

uint64_t sub_255D2BCC0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BCF4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BD28()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BD74()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BDC0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BDF4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BE28()
{
  return swift_deallocObject();
}

uint64_t sub_255D2BE74()
{
  return swift_deallocObject();
}

uint64_t initializeBufferWithCopyOfBuffer for ModelStats(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy80_8(void *a1, const void *a2)
{
}

uint64_t getEnumTagSinglePayload for ModelStats(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 80)) {
      int v3 = *(_DWORD *)a1;
    }
    else {
      int v3 = -1;
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelStats(uint64_t result, int a2, int a3)
{
  BOOL v3 = a3 != 0;
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    if (a3)
    {
      if (v3) {
        *(unsigned char *)(result + 80) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else if (a3)
  {
    if (v3) {
      *(unsigned char *)(result + 80) = 0;
    }
    else {
      __break(1u);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelStats()
{
  return &type metadata for ModelStats;
}

ValueMetadata *type metadata accessor for WiFiModelGuts()
{
  return &type metadata for WiFiModelGuts;
}

ValueMetadata *type metadata accessor for CellModelGuts()
{
  return &type metadata for CellModelGuts;
}

uint64_t ObjC metadata update function for WifiModel()
{
  return type metadata accessor for WifiModel();
}

uint64_t type metadata accessor for WifiModel()
{
  uint64_t v1 = type metadata singleton initialization cache for WifiModel;
  if (!type metadata singleton initialization cache for WifiModel) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t type metadata completion function for WifiModel()
{
  uint64_t updated = type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    uint64_t updated = type metadata accessor for ColumnID<Double>();
    if (v1 <= 0x3F)
    {
      uint64_t updated = type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0();
      if (v2 <= 0x3F)
      {
        uint64_t updated = swift_updateClassMetadata2();
        if (!updated) {
          return 0;
        }
      }
    }
  }
  return updated;
}

uint64_t type metadata accessor for ColumnID<Double>()
{
  uint64_t v4 = lazy cache variable for type metadata for ColumnID<Double>;
  if (!lazy cache variable for type metadata for ColumnID<Double>)
  {
    unint64_t v3 = type metadata accessor for ColumnID();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for ColumnID<Double>);
      return v1;
    }
  }
  return v4;
}

uint64_t type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0()
{
  uint64_t v4 = lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0;
  if (!lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ColumnSelector<OneHotEncoder<String>, String>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BoostedTreeRegressor<Double>);
    lazy protocol witness table accessor for type ColumnSelector<OneHotEncoder<String>, String> and conformance <> ColumnSelector<A, B>();
    lazy protocol witness table accessor for type BoostedTreeRegressor<Double> and conformance BoostedTreeRegressor<A>();
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    uint64_t v4 = OpaqueTypeMetadata2;
    if (!v0)
    {
      unint64_t v1 = OpaqueTypeMetadata2;
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&lazy cache variable for type metadata for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0);
      return v1;
    }
  }
  return v4;
}

uint64_t ObjC metadata update function for CellularModel()
{
  return type metadata accessor for CellularModel();
}

uint64_t type metadata accessor for CellularModel()
{
  uint64_t v1 = type metadata singleton initialization cache for CellularModel;
  if (!type metadata singleton initialization cache for CellularModel) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t type metadata completion function for CellularModel()
{
  uint64_t updated = type metadata accessor for ColumnID<Double>();
  if (v0 <= 0x3F)
  {
    uint64_t updated = type metadata accessor for URL();
    if (v1 <= 0x3F)
    {
      uint64_t updated = type metadata accessor for <<opaque return type of UpdatableTabularEstimator.appending<A>(_:)>>.0();
      if (v2 <= 0x3F)
      {
        uint64_t updated = swift_updateClassMetadata2();
        if (!updated) {
          return 0;
        }
      }
    }
  }
  return updated;
}

uint64_t sub_255D2C8D4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

void *outlined init with take of Transformer?(const void *a1, void *a2)
{
  return a2;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
    return WitnessTable;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type MetricsKey and conformance MetricsKey()
{
  uint64_t v2 = lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey;
  if (!lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey)
  {
    type metadata accessor for MetricsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type MetricsKey and conformance MetricsKey);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of Sendable?(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t sub_255D2CB24()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in CellularModel.train(dataFrame:)()
{
  return implicit closure #1 in closure #1 in CellularModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_255D2CB58()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CB8C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CBC0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CC0C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CC58()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in WifiModel.train(dataFrame:)()
{
  return implicit closure #1 in closure #1 in WifiModel.train(dataFrame:)(*(double *)(v0 + 16));
}

uint64_t sub_255D2CC8C()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CCC0()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CCF4()
{
  return swift_deallocObject();
}

uint64_t sub_255D2CD40()
{
  return swift_deallocObject();
}

char *outlined init with copy of (String, CSVType)(char *a1, char *a2)
{
  *(void *)a2 = *(void *)a1;
  uint64_t v4 = *((void *)a1 + 1);
  swift_bridgeObjectRetain();
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType))
              + 48);
  uint64_t v2 = type metadata accessor for CSVType();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(&a2[v5], &a1[v5]);
  return a2;
}

uint64_t outlined destroy of (String, CSVType)(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, CSVType))
              + 48);
  uint64_t v1 = type metadata accessor for CSVType();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t one-time initialization function for dbPath()
{
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v4 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v0 = MEMORY[0x270FA5388](v11);
  uint64_t v1 = (char *)&v4 - v4;
  uint64_t v10 = (char *)&v4 - v4;
  uint64_t v5 = dbPath;
  __swift_allocate_value_buffer(v0, dbPath);
  uint64_t v6 = __swift_project_value_buffer(v11, (uint64_t)v5);
  uint64_t v2 = mediaMLDataDirectory.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v1, v2, v11);
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("rawdata.db", 0xAuLL, 1)._object;
  URL.appendingPathComponent(_:isDirectory:)();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t dbPath.unsafeMutableAddressor()
{
  if (one-time initialization token for dbPath != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for URL();
  return __swift_project_value_buffer(v0, (uint64_t)dbPath);
}

uint64_t WiFiDataPointForWriting.sessionID.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

double WiFiDataPointForWriting.timestamp.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t WiFiDataPointForWriting.appName.getter()
{
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForWriting.bucketedSSID.getter()
{
  uint64_t v2 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForWriting.hour.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t WiFiDataPointForWriting.dow.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t WiFiDataPointForWriting.rssi.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t WiFiDataPointForWriting.cca.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t WiFiDataPointForWriting.snr.getter()
{
  return *(void *)(v0 + 88);
}

uint64_t WiFiDataPointForWriting.noise.getter()
{
  return *(void *)(v0 + 96);
}

double WiFiDataPointForWriting.txRate.getter()
{
  return *(double *)(v0 + 104);
}

double WiFiDataPointForWriting.rxRate.getter()
{
  return *(double *)(v0 + 112);
}

double WiFiDataPointForWriting.throughputTrue.getter()
{
  return *(double *)(v0 + 120);
}

void __swiftcall WiFiDataPointForWriting.init(sessionID:timestamp:appName:bucketedSSID:hour:dow:rssi:cca:snr:noise:txRate:rxRate:throughputTrue:)(MediaML::WiFiDataPointForWriting *__return_ptr retstr, Swift::String sessionID, Swift::Double timestamp, Swift::String appName, Swift::String bucketedSSID, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int cca, Swift::Int snr, Swift::Int noise, Swift::Double txRate, Swift::Double rxRate, Swift::Double throughputTrue)
{
  __src[0] = sessionID;
  *(Swift::Double *)&__src[1]._uint64_t countAndFlagsBits = timestamp;
  *(Swift::String *)&__src[1]._object = appName;
  *(Swift::String *)&__src[2]._object = bucketedSSID;
  __src[3]._object = (void *)hour;
  __src[4]._uint64_t countAndFlagsBits = dow;
  __src[4]._object = (void *)rssi;
  __src[5]._uint64_t countAndFlagsBits = cca;
  __src[5]._object = (void *)snr;
  __src[6]._uint64_t countAndFlagsBits = noise;
  *(Swift::Double *)&__src[6]._object = txRate;
  *(Swift::Double *)&__src[7]._uint64_t countAndFlagsBits = rxRate;
  *(Swift::Double *)&__src[7]._object = throughputTrue;
  memcpy(retstr, __src, sizeof(MediaML::WiFiDataPointForWriting));
}

uint64_t CellDataPointForWriting.sessionID.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

double CellDataPointForWriting.timestamp.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t CellDataPointForWriting.appName.getter()
{
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForWriting.carrier.getter()
{
  uint64_t v2 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForWriting.hour.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t CellDataPointForWriting.dow.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t CellDataPointForWriting.rssi.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t CellDataPointForWriting.rsrp.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t CellDataPointForWriting.rscp.getter()
{
  return *(void *)(v0 + 88);
}

uint64_t CellDataPointForWriting.rsrq.getter()
{
  return *(void *)(v0 + 96);
}

double CellDataPointForWriting.snr.getter()
{
  return *(double *)(v0 + 104);
}

uint64_t CellDataPointForWriting.bars.getter()
{
  return *(void *)(v0 + 112);
}

double CellDataPointForWriting.throughputTrue.getter()
{
  return *(double *)(v0 + 120);
}

void __swiftcall CellDataPointForWriting.init(sessionID:timestamp:appName:carrier:hour:dow:rssi:rsrp:rscp:rsrq:snr:bars:throughputTrue:)(MediaML::CellDataPointForWriting *__return_ptr retstr, Swift::String sessionID, Swift::Double timestamp, Swift::String appName, Swift::String carrier, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int rsrp, Swift::Int rscp, Swift::Int rsrq, Swift::Double snr, Swift::Int bars, Swift::Double throughputTrue)
{
  __src[0] = sessionID;
  *(Swift::Double *)&__src[1]._uint64_t countAndFlagsBits = timestamp;
  *(Swift::String *)&__src[1]._object = appName;
  *(Swift::String *)&__src[2]._object = carrier;
  __src[3]._object = (void *)hour;
  __src[4]._uint64_t countAndFlagsBits = dow;
  __src[4]._object = (void *)rssi;
  __src[5]._uint64_t countAndFlagsBits = rsrp;
  __src[5]._object = (void *)rscp;
  __src[6]._uint64_t countAndFlagsBits = rsrq;
  *(Swift::Double *)&__src[6]._object = snr;
  __src[7]._uint64_t countAndFlagsBits = bars;
  *(Swift::Double *)&__src[7]._object = throughputTrue;
  memcpy(retstr, __src, sizeof(MediaML::CellDataPointForWriting));
}

uint64_t WiFiDataPointForPrediciton.appName.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForPrediciton.bucketedSSID.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WiFiDataPointForPrediciton.hour.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t WiFiDataPointForPrediciton.dow.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t WiFiDataPointForPrediciton.rssi.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t WiFiDataPointForPrediciton.noise.getter()
{
  return *(void *)(v0 + 56);
}

double WiFiDataPointForPrediciton.txRate.getter()
{
  return *(double *)(v0 + 64);
}

double WiFiDataPointForPrediciton.rxRate.getter()
{
  return *(double *)(v0 + 72);
}

void __swiftcall WiFiDataPointForPrediciton.init(appName:bucketedSSID:hour:dow:rssi:noise:txRate:rxRate:)(MediaML::WiFiDataPointForPrediciton *__return_ptr retstr, Swift::String appName, Swift::String bucketedSSID, Swift::Int hour, Swift::Int dow, Swift::Int rssi, Swift::Int noise, Swift::Double txRate, Swift::Double rxRate)
{
  retstr->appName = appName;
  retstr->bucketedSSID = bucketedSSID;
  retstr->hour = hour;
  retstr->dow = dow;
  retstr->rssuint64_t i = rssi;
  retstr->noise = noise;
  retstr->txRate = txRate;
  retstr->rxRate = rxRate;
}

uint64_t CellDataPointForPrediction.appName.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForPrediction.carrier.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CellDataPointForPrediction.binnedRssi.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t CellDataPointForPrediction.binnedRsrp.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t CellDataPointForPrediction.binnedRscp.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t CellDataPointForPrediction.binnedRsrq.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t CellDataPointForPrediction.binnedSnr.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t CellDataPointForPrediction.bars.getter()
{
  return *(void *)(v0 + 72);
}

void __swiftcall CellDataPointForPrediction.init(appName:carrier:binnedRssi:binnedRsrp:binnedRscp:binnedRsrq:binnedSnr:bars:)(MediaML::CellDataPointForPrediction *__return_ptr retstr, Swift::String appName, Swift::String carrier, Swift::Int binnedRssi, Swift::Int binnedRsrp, Swift::Int binnedRscp, Swift::Int binnedRsrq, Swift::Int binnedSnr, Swift::Int bars)
{
  retstr->appName = appName;
  retstr->carrier = carrier;
  retstr->binnedRssuint64_t i = binnedRssi;
  retstr->binnedRsrp = binnedRsrp;
  retstr->binnedRscp = binnedRscp;
  retstr->binnedRsrq = binnedRsrq;
  retstr->binnedSnr = binnedSnr;
  retstr->bars = bars;
}

uint64_t DataWriter.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static DataWriter.logger);
}

uint64_t static DataWriter.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = DataWriter.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of DataWriter.currentVersion()
{
  return 1;
}

uint64_t DataWriter.currentVersion.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t DataWriter.__allocating_init()()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = DataWriter.__allocating_init();
  return DataWriter.init()();
}

uint64_t DataWriter.__allocating_init()(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = *v2;
  uint64_t v8 = v3 + 16;
  uint64_t v4 = swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  else
  {
    uint64_t v4 = a1;
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  return v5(v4);
}

uint64_t DataWriter.init()()
{
  uint64_t v12 = v1;
  *(void *)(v1 + 88) = v0;
  *(void *)(v1 + 96) = *v0;
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  uint64_t v2 = type metadata accessor for Logger();
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = *(void *)(v2 - 8);
  *(void *)(v1 + 120) = swift_task_alloc();
  *(void *)(v1 + 128) = swift_task_alloc();
  type metadata accessor for SQLiteDB.Location();
  uint64_t v10 = (const void *)swift_task_alloc();
  *(void *)(v1 + 136) = v10;
  *(void *)(v1 + 24) = v0;
  swift_defaultActor_initialize();
  *(unsigned char *)(v1 + 160) = 0;
  *(unsigned char *)(v1 + 160) = 2;
  v0[15] = 1;
  type metadata accessor for SQLiteDB();
  uint64_t v7 = dbPath.unsafeMutableAddressor();
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v9 - 8);
  (*(void (**)(const void *, uint64_t))(v8 + 16))(v10, v7);
  (*(void (**)(const void *, void, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v9);
  uint64_t v11 = SQLiteDB.__allocating_init(_:)(v10);
  *(unsigned char *)(v5 + 160) = 3;
  *(void *)(v6 + 112) = v11;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 144) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = DataWriter.init();
  return DataWriter.createTables()();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  NSObject *v24;
  uint32_t size;
  uint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *buf;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *log;
  os_log_type_t v44;
  uint32_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned char *v50;
  uint8_t **v51;
  uint64_t *v52;
  uint64_t *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  void *v59;
  uint64_t v60;

  uint64_t v59 = v1;
  uint64_t v59 = (void *)*v1;
  uint64_t v48 = v59;
  uint64_t v59 = (void *)*v1;
  v48[2] = v59;
  uint64_t v49 = v48 + 2;
  uint64_t v50 = v48 + 20;
  uint64_t v51 = (uint8_t **)(v48 + 7);
  uint64_t v52 = v48 + 8;
  uint64_t v53 = v48 + 9;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v9 = v48[15];
    uint64_t v14 = v48[14];
    int v15 = v48[13];
    uint64_t v10 = v47;
    v48[4] = v47;
    uint64_t v11 = DataWriter.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v9, v11, v15);
    uint64_t v12 = v47;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v47;
    default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
    swift_bridgeObjectRelease();
    uint64_t v24 = Logger.logObject.getter();
    unint64_t v23 = static os_log_type_t.error.getter();
    v48[5] = 12;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *((_DWORD *)v48 + 38);
    uint64_t v32 = swift_allocObject();
    *(unsigned char *)(v32 + 16) = 64;
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 8;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = partial apply for implicit closure #1 in DataWriter.init();
    *(void *)(v17 + 24) = v16;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0;
    *(void *)(v18 + 24) = v17;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0;
    *(void *)(v27 + 24) = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v19 = v13;
    swift_retain();
    Swift::String *v19 = _s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
    v19[1] = v32;
    swift_retain();
    v19[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v19[3] = v26;
    swift_retain();
    v19[4] = _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
    v19[5] = v27;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v24, v23))
    {
      uint64_t v28 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v30 = createStorage<A>(capacity:type:)(1);
      uint64_t v31 = createStorage<A>(capacity:type:)(0);
      uint64_t v54 = v28;
      uint64_t v55 = v30;
      uint64_t v56 = v31;
      serialize(_:at:)(2, &v54);
      serialize(_:at:)(1, &v54);
      uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
      uint64_t v58 = v32;
      closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
      uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v58 = v26;
      closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
      uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0;
      uint64_t v58 = v27;
      closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
      _os_log_impl(&dword_255CF7000, v24, v23, "DataWrite creation failed with error=%@", v28, size);
      destroyStorage<A>(_:count:)(v30, 1, v29);
      destroyStorage<A>(_:count:)(v31, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v28, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v21 = v48[15];
    uint64_t v20 = v48[14];
    uint64_t v22 = v48[13];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    swift_willThrow();

    if (*v50 == 3)
    {
      swift_release();
    }
    else
    {
      if (*v50) {
        swift_release();
      }
      swift_defaultActor_destroy();
      swift_deallocPartialClassInstance();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(*v49 + 8);
    return v8(v7);
  }
  else
  {
    uint64_t v2 = v48[16];
    uint64_t v41 = v48[14];
    uint64_t v42 = v48[13];
    uint64_t v3 = DataWriter.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v2, v3, v42);
    log = Logger.logObject.getter();
    uint64_t v44 = static os_log_type_t.info.getter();
    v48[6] = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v45 = *((_DWORD *)v48 + 39);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v46 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v44))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v38 = createStorage<A>(capacity:type:)(0);
      uint64_t v39 = createStorage<A>(capacity:type:)(0);
      char *v51 = buf;
      *uint64_t v52 = v38;
      *uint64_t v53 = v39;
      serialize(_:at:)(0, v51);
      serialize(_:at:)(0, v51);
      v48[10] = v46;
      uint64_t v40 = (void *)swift_task_alloc();
      v40[2] = v51;
      v40[3] = v52;
      v40[4] = v53;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v47) {
        return (uint64_t)v47;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, log, v44, "DataWriter created successfully!", buf, v45);
      destroyStorage<A>(_:count:)(v38, 0, v37);
      destroyStorage<A>(_:count:)(v39, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    unint64_t v35 = v48[16];
    unint64_t v33 = v48[14];
    uint64_t v34 = v48[13];

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v34);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(uint64_t))(*v49 + 8);
    uint64_t v5 = v48[11];
    return v4(v5);
  }
}

uint64_t DataWriter.createTables()()
{
  v1[84] = v0;
  v1[58] = v1;
  v1[59] = 0;
  v1[56] = 0;
  v1[57] = 0;
  v1[60] = 0;
  v1[62] = 0;
  v1[63] = 0;
  v1[65] = 0;
  v1[66] = 0;
  v1[68] = 0;
  v1[71] = 0;
  type metadata accessor for SQLiteDB.Location();
  v1[85] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for URL();
  v1[86] = v2;
  v1[87] = *(void *)(v2 - 8);
  v1[88] = swift_task_alloc();
  v1[89] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Logger();
  v1[90] = v3;
  v1[91] = *(void *)(v3 - 8);
  v1[92] = swift_task_alloc();
  v1[93] = swift_task_alloc();
  v1[94] = swift_task_alloc();
  v1[95] = swift_task_alloc();
  v1[59] = v0;
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  Swift::String *v0;
  Swift::String v1;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  uint64_t v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CREATE TABLE IF NOT EXISTS \"admin\" (\n\tversion INTEGER NOT NULL\n);\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"processedwifi\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\tnoise INT NOT NULL,\n"
         "\ttx_rate DOUBLE NOT NULL,\n"
         "\trx_rate DOUBLE NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"wifi\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\ttimestamp DOUBLE NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\tcca INT NOT NULL,\n"
         "\tnoise INT NOT NULL,\n"
         "\tsnr INT NOT NULL,\n"
         "\ttx_rate DOUBLE NOT NULL,\n"
         "\trx_rate DOUBLE NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"cell\" (\n"
         "\tsession_id TEXT NOT NULL,\n"
         "\ttimestamp DOUBLE NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\thour INT NOT NULL,\n"
         "\tdow INT NOT NULL,\n"
         "\trssi INT NOT NULL,\n"
         "\trsrp INT NOT NULL,\n"
         "\trscp INT NOT NULL,\n"
         "\trsrq INT NOT NULL,\n"
         "\tsnr INT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"processedcell\" (\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tbinned_rssi INT NOT NULL,\n"
         "\tbinned_rsrp INT NOT NULL,\n"
         "\tbinned_rscp INT NOT NULL,\n"
         "\tbinned_rsrq INT NOT NULL,\n"
         "\tbinned_snr INT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tcount INT NOT NULL,\n"
         "\tthroughput_true DOUBLE NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"modelStats\" (\n"
         "\tinterfaceType Int NOT NULL,\n"
         "\ttrainingRowCount Int NOT NULL,\n"
         "\tvalidationRowCount INT NOT NULL,\n"
         "\tcarrierCount INT NOT NULL,\n"
         "\tssidCount INT NOT NULL,\n"
         "\tappNameCount INT NOT NULL,\n"
         "\tsessionIDCount INT NOT NULL,\n"
         "\ttrainingMAPE DOUBLE NOT NULL,\n"
         "\tvalidationMAPE DOUBLE NOT NULL,\n"
         "\ttrainingDate INT NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"wifiStdDev\" (\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tssid TEXT NOT NULL,\n"
         "\tthroughput_stddev DOUBLE NOT NULL,\n"
         "\ttraining_date INT NOT NULL\n"
         ");\n"
         "\n"
         "CREATE TABLE IF NOT EXISTS \"cellStdDev\" (\n"
         "\tapp_name TEXT NOT NULL,\n"
         "\tcarrier TEXT NOT NULL,\n"
         "\tbars INT NOT NULL,\n"
         "\tthroughput_stddev DOUBLE NOT NULL,\n"
         "\ttraining_date INT NOT NULL\n"
         ");",
         0x7DFuLL,
         1);
  v0[48] = v1;
  v0[28] = v1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(countAndFlagsBits + 112);
  v0[49]._uint64_t countAndFlagsBits = v4;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v4, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 768);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 792) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v0 + 800) = v3;
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 808) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from wifi", 0x19uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v1 = v0[102];
  uint64_t v2 = v0[101];
  uint64_t v3 = v0[99];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.createTables());
  v0[103] = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v8 + 672);
    uint64_t v5 = DataWriter.createTables();
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;

  v0[58] = v0;
  uint64_t v27 = v0[61];
  v0[63] = v27;
  if (v27 < *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor())
  {
    *(void *)(v26 + 936) = *(void *)(v26 + 824);
    uint64_t v7 = *(void *)(v26 + 672);
    swift_beginAccess();
    uint64_t v8 = *(void *)(v7 + 112);
    *(void *)(v26 + 944) = v8;
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v26 + 952) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from cell", 0x19uLL, 1);
    uint64_t v5 = v8;
    uint64_t v6 = DataWriter.createTables();
    return MEMORY[0x270FA2498](v6, v5, 0);
  }
  uint64_t v1 = *(void *)(v26 + 760);
  uint64_t v21 = *(void *)(v26 + 720);
  uint64_t v20 = *(void *)(v26 + 728);
  uint64_t v2 = DataWriter.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v21);
  uint64_t v24 = Logger.logObject.getter();
  unint64_t v23 = static os_log_type_t.info.getter();
  *(void *)(v26 + 632) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v22 = *(_DWORD *)(v26 + 1324);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v25 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v24, v23))
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v26 + 824);
LABEL_7:
    *(void *)(v26 + 832) = v14;
    uint64_t v10 = *(void *)(v26 + 760);
    uint64_t v11 = *(void *)(v26 + 720);
    uint64_t v12 = *(void *)(v26 + 672);
    uint64_t v9 = *(void *)(v26 + 728);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    swift_beginAccess();
    uint64_t v13 = *(void *)(v12 + 112);
    *(void *)(v26 + 840) = v13;
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v26 + 848) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM wifi", 0x10uLL, 1);
    uint64_t v5 = v13;
    uint64_t v6 = DataWriter.createTables();
    return MEMORY[0x270FA2498](v6, v5, 0);
  }
  uint64_t v3 = *(void *)(v26 + 824);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  int v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v17 = createStorage<A>(capacity:type:)(0);
  uint64_t v18 = createStorage<A>(capacity:type:)(0);
  *(void *)(v26 + 640) = buf;
  *(void *)(v26 + 648) = v17;
  *(void *)(v26 + 656) = v18;
  serialize(_:at:)(0, (unsigned char **)(v26 + 640));
  serialize(_:at:)(0, (unsigned char **)(v26 + 640));
  *(void *)(v26 + 664) = v25;
  uint64_t v19 = (void *)swift_task_alloc();
  v19[2] = v26 + 640;
  v19[3] = v26 + 648;
  v19[4] = v26 + 656;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  uint64_t result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, v24, v23, "Wifi raw data too large, deleting...", buf, v22);
    destroyStorage<A>(_:count:)(v17, 0, v15);
    destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 848);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 864) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  void *v3;
  uint64_t v4;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  uint64_t v3 = *(void **)(countAndFlagsBits + 112);
  v0[54]._object = v3;
  swift_retain();
  swift_endAccess();
  v0[55] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 880);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 896) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  void *v3;
  uint64_t v4;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  uint64_t v3 = *(void **)(countAndFlagsBits + 112);
  v0[56]._object = v3;
  swift_retain();
  swift_endAccess();
  v0[57] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 912);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 928) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(void *)(v0 + 464) = v0;
  *(void *)(v0 + 936) = *(void *)(v0 + 928);
  uint64_t v2 = *(void *)(v0 + 672);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v0 + 944) = v3;
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 952) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT COUNT(*) from cell", 0x19uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v1 = v0[120];
  uint64_t v2 = v0[119];
  uint64_t v3 = v0[117];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #2 in DataWriter.createTables());
  v0[121] = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v8 + 672);
    uint64_t v5 = DataWriter.createTables();
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;

  v0[58] = v0;
  uint64_t v27 = v0[64];
  v0[66] = v27;
  if (v27 < *MAX_ALLOWED_RAW_DATASIZE.unsafeMutableAddressor())
  {
    *(void *)(v26 + 1080) = *(void *)(v26 + 968);
    uint64_t v7 = *(void *)(v26 + 672);
    swift_beginAccess();
    uint64_t v8 = *(void *)(v7 + 112);
    *(void *)(v26 + 1088) = v8;
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v26 + 1096) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT version FROM admin", 0x19uLL, 1);
    uint64_t v5 = v8;
    uint64_t v6 = DataWriter.createTables();
    return MEMORY[0x270FA2498](v6, v5, 0);
  }
  uint64_t v1 = *(void *)(v26 + 752);
  uint64_t v21 = *(void *)(v26 + 720);
  uint64_t v20 = *(void *)(v26 + 728);
  uint64_t v2 = DataWriter.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v2, v21);
  uint64_t v24 = Logger.logObject.getter();
  unint64_t v23 = static os_log_type_t.info.getter();
  *(void *)(v26 + 592) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v22 = *(_DWORD *)(v26 + 1320);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v25 = _allocateUninitializedArray<A>(_:)();
  if (!os_log_type_enabled(v24, v23))
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v26 + 968);
LABEL_7:
    *(void *)(v26 + 976) = v14;
    uint64_t v10 = *(void *)(v26 + 752);
    uint64_t v11 = *(void *)(v26 + 720);
    uint64_t v12 = *(void *)(v26 + 672);
    uint64_t v9 = *(void *)(v26 + 728);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    swift_beginAccess();
    uint64_t v13 = *(void *)(v12 + 112);
    *(void *)(v26 + 984) = v13;
    swift_retain();
    swift_endAccess();
    *(Swift::String *)(v26 + 992) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("DELETE FROM cell", 0x10uLL, 1);
    uint64_t v5 = v13;
    uint64_t v6 = DataWriter.createTables();
    return MEMORY[0x270FA2498](v6, v5, 0);
  }
  uint64_t v3 = *(void *)(v26 + 968);
  buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  int v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v17 = createStorage<A>(capacity:type:)(0);
  uint64_t v18 = createStorage<A>(capacity:type:)(0);
  *(void *)(v26 + 600) = buf;
  *(void *)(v26 + 608) = v17;
  *(void *)(v26 + 616) = v18;
  serialize(_:at:)(0, (unsigned char **)(v26 + 600));
  serialize(_:at:)(0, (unsigned char **)(v26 + 600));
  *(void *)(v26 + 624) = v25;
  uint64_t v19 = (void *)swift_task_alloc();
  v19[2] = v26 + 600;
  v19[3] = v26 + 608;
  v19[4] = v26 + 616;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  uint64_t result = Sequence.forEach(_:)();
  if (!v3)
  {
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, v24, v23, "Cell raw data too large, deleting...", buf, v22);
    destroyStorage<A>(_:count:)(v17, 0, v15);
    destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  return result;
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 992);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 1008) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  void *v3;
  uint64_t v4;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  uint64_t v3 = *(void **)(countAndFlagsBits + 112);
  v0[63]._object = v3;
  swift_retain();
  swift_endAccess();
  v0[64] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("VACUUM", 6uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 1024);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 1040) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  Swift::String *v0;
  uint64_t countAndFlagsBits;
  void *v3;
  uint64_t v4;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  uint64_t v3 = *(void **)(countAndFlagsBits + 112);
  v0[65]._object = v3;
  swift_retain();
  swift_endAccess();
  v0[66] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pragma wal_checkpoint(truncate)", 0x1FuLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 1056);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 1072) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(void *)(v0 + 464) = v0;
  *(void *)(v0 + 1080) = *(void *)(v0 + 1072);
  uint64_t v2 = *(void *)(v0 + 672);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v0 + 1088) = v3;
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 1096) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT version FROM admin", 0x19uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.createTables(), v3, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v1 = v0[138];
  uint64_t v2 = v0[137];
  uint64_t v3 = v0[135];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #3 in DataWriter.createTables());
  v0[139] = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v8 + 672);
    uint64_t v5 = DataWriter.createTables();
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 672);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t size;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void v42[2];
  void *v43;
  uint64_t v44;

  uint64_t v43 = v0;
  v42[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[84];
  v0[58] = v0;
  uint64_t v37 = v0[67];
  v0[68] = v37;
  if (v37 == *(void *)(v1 + 120))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)(v36 + 464) + 8);
    return v9();
  }
  else
  {
    uint64_t v2 = *(void *)(v36 + 744);
    uint64_t v21 = *(void *)(v36 + 720);
    uint64_t v25 = *(void *)(v36 + 672);
    uint64_t v20 = *(void *)(v36 + 728);
    uint64_t v3 = DataWriter.logger.unsafeMutableAddressor();
    uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    *(void *)(v36 + 1120) = v4;
    *(void *)(v36 + 1128) = (v20 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v4(v2, v3, v21);
    unint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v37;
    swift_retain();
    uint64_t v34 = Logger.logObject.getter();
    unint64_t v35 = static os_log_type_t.error.getter();
    *(void *)(v36 + 552) = 22;
    *(void *)(v36 + 1136) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(void *)(v36 + 1144) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(void *)(v36 + 1152) = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v36 + 1312);
    uint64_t v27 = swift_allocObject();
    *(unsigned char *)(v27 + 16) = 0;
    uint64_t v28 = swift_allocObject();
    *(unsigned char *)(v28 + 16) = 8;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = partial apply for implicit closure #1 in DataWriter.createTables();
    *(void *)(v24 + 24) = v23;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = _sSiIegd_SiIegr_TRTA_2;
    *(void *)(v29 + 24) = v24;
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = 0;
    uint64_t v31 = swift_allocObject();
    *(unsigned char *)(v31 + 16) = 8;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = partial apply for implicit closure #2 in DataWriter.createTables();
    *(void *)(v26 + 24) = v25;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v32 + 24) = v26;
    *(void *)(v36 + 1160) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    unint64_t v33 = v5;
    swift_retain();
    *unint64_t v33 = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[1] = v27;
    swift_retain();
    v33[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[3] = v28;
    swift_retain();
    v33[4] = _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
    v33[5] = v29;
    swift_retain();
    v33[6] = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[7] = v30;
    swift_retain();
    unsigned char v33[8] = closure #1 in OSLogArguments.append(_:)partial apply;
    v33[9] = v31;
    swift_retain();
    v33[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v33[11] = v32;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v6 = *(void *)(v36 + 1112);
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v18 = createStorage<A>(capacity:type:)(0);
      uint64_t v19 = createStorage<A>(capacity:type:)(0);
      uint64_t v38 = buf;
      uint64_t v41 = v18;
      v42[0] = v19;
      serialize(_:at:)(0, &v38);
      serialize(_:at:)(2, &v38);
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v40 = v27;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      if (v6) {
        return result;
      }
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v40 = v28;
      closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2;
      uint64_t v40 = v29;
      closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v40 = v30;
      closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v40 = v31;
      closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      uint64_t v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v40 = v32;
      closure #1 in osLogInternal(_:log:type:)(&v39, (uint64_t)&v38, (uint64_t)&v41, (uint64_t)v42);
      _os_log_impl(&dword_255CF7000, v34, v35, "DB Version mis-match %ld != %ld, deleting old DB...", buf, size);
      destroyStorage<A>(_:count:)(v18, 0, v16);
      destroyStorage<A>(_:count:)(v19, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      int v15 = 0;
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      int v15 = *(void *)(v36 + 1112);
    }
    *(void *)(v36 + 1168) = v15;
    uint64_t v11 = *(void *)(v36 + 744);
    uint64_t v12 = *(void *)(v36 + 720);
    uint64_t v13 = *(void *)(v36 + 672);
    uint64_t v10 = *(void *)(v36 + 728);

    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    *(void *)(v36 + 1176) = v8;
    *(void *)(v36 + 1184) = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v8(v11, v12);
    swift_beginAccess();
    uint64_t v14 = *(void *)(v13 + 112);
    *(void *)(v36 + 1192) = v14;
    swift_retain();
    swift_endAccess();
    return MEMORY[0x270FA2498](DataWriter.createTables(), v14, 0);
  }
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSURL *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  id v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  unsigned __int8 v32;
  void *v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  unsigned __int8 v42;
  uint64_t v43;

  uint64_t v38 = v0[89];
  uint64_t v1 = v0[88];
  unint64_t v35 = v0[87];
  uint64_t v36 = v0[86];
  v0[58] = v0;
  uint64_t v41 = objc_msgSend(self, sel_defaultManager);
  uint64_t v2 = dbPath.unsafeMutableAddressor();
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
  v34(v1, v2, v36);
  URL.deletingLastPathComponent()();
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v37(v1, v36);
  URL._bridgeToObjectiveC()(v3);
  uint64_t v40 = v4;
  v37(v38, v36);
  v0[70] = 0;
  uint64_t v42 = objc_msgSend(v41, sel_removeItemAtURL_error_, v40, v0 + 70);
  uint64_t v39 = (void *)v0[70];
  uint64_t v5 = v39;

  if (v42)
  {
    uint64_t v6 = v33[89];
    uint64_t v28 = v33[86];
    uint64_t v31 = objc_msgSend(self, sel_defaultManager);
    uint64_t v7 = mediaMLDataDirectory.unsafeMutableAddressor();
    v34(v6, v7, v28);
    URL._bridgeToObjectiveC()(v8);
    uint64_t v30 = v9;
    v37(v6, v28);
    v33[72] = 0;
    uint64_t v32 = objc_msgSend(v31, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v30, 1, 0, v33 + 72);
    uint64_t v29 = (void *)v33[72];
    uint64_t v10 = v29;

    if (v32)
    {
      uint64_t v11 = (void *)v33[146];
      uint64_t v25 = v33[86];
      uint64_t v26 = (const void *)v33[85];
      uint64_t v24 = v33[87];
      type metadata accessor for SQLiteDB();
      uint64_t v12 = dbPath.unsafeMutableAddressor();
      v34((uint64_t)v26, v12, v25);
      (*(void (**)(const void *, void, uint64_t, uint64_t))(v24 + 56))(v26, 0, 1, v25);
      uint64_t v27 = SQLiteDB.__allocating_init(_:)(v26);
      v33[150] = v11;
      if (!v11)
      {
        uint64_t v22 = v33[84];
        swift_beginAccess();
        *(void *)(v22 + 112) = v27;
        swift_release();
        swift_endAccess();
        swift_beginAccess();
        unint64_t v23 = *(void *)(v22 + 112);
        v33[151] = v23;
        swift_retain();
        swift_endAccess();
        uint64_t v13 = v23;
        uint64_t v14 = DataWriter.createTables();
        return MEMORY[0x270FA2498](v14, v13, 0);
      }
      uint64_t v19 = v11;
    }
    else
    {
      uint64_t v17 = _convertNSErrorToError(_:)();

      swift_willThrow();
      uint64_t v19 = (id)v17;
    }
  }
  else
  {
    uint64_t v18 = _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v19 = (id)v18;
  }
  v33[162] = v19;
  uint64_t v20 = v33[84];
  int v15 = v19;
  v33[71] = v19;
  swift_beginAccess();
  uint64_t v21 = *(void *)(v20 + 112);
  v33[163] = v21;
  swift_retain();
  swift_endAccess();
  uint64_t v13 = v21;
  uint64_t v14 = DataWriter.createTables();
  return MEMORY[0x270FA2498](v14, v13, 0);
}

{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v1 = *(Swift::String *)(v0 + 768);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.execute(_:)(v1);
  *(void *)(v0 + 1216) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v7 + 672);
    uint64_t v4 = DataWriter.createTables();
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 672);
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  Swift::String *v0;
  void *v2;
  uint64_t countAndFlagsBits;
  uint64_t v4;

  uint64_t countAndFlagsBits = v0[42]._countAndFlagsBits;
  v0[29]._uint64_t countAndFlagsBits = (uint64_t)v0;
  swift_beginAccess();
  uint64_t v2 = *(void **)(countAndFlagsBits + 112);
  v0[76]._object = v2;
  swift_retain();
  swift_endAccess();
  v0[77] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO admin (version) VALUES (?)", 0x26uLL, 1);
  swift_retain();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v1 = v0[155];
  uint64_t v2 = v0[154];
  uint64_t v3 = v0[152];
  v0[58] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #4 in DataWriter.createTables());
  v0[156] = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v8 + 672);
    uint64_t v5 = DataWriter.createTables();
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 672);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = DataWriter.createTables();
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint32_t size;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void v30[4];
  uint64_t v31;
  uint64_t v32;

  uint64_t v31 = v0;
  v30[3] = *MEMORY[0x263EF8340];
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1120);
  uint64_t v1 = *(void *)(v0 + 736);
  int v15 = *(void *)(v0 + 720);
  uint64_t v18 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  uint64_t v2 = DataWriter.logger.unsafeMutableAddressor();
  v16(v1, v2, v15);
  swift_retain();
  uint64_t v24 = Logger.logObject.getter();
  uint64_t v25 = static os_log_type_t.info.getter();
  *(void *)(v0 + 584) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1316);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 0;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = partial apply for implicit closure #3 in DataWriter.createTables();
  *(void *)(v19 + 24) = v18;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v22 + 24) = v19;
  _allocateUninitializedArray<A>(_:)();
  unint64_t v23 = v3;
  swift_retain();
  *unint64_t v23 = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[1] = v20;
  swift_retain();
  v23[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v23[3] = v21;
  swift_retain();
  v23[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v23[5] = v22;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v4 = v14[156];
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v26 = buf;
    uint64_t v29 = v12;
    v30[0] = v13;
    serialize(_:at:)(0, &v26);
    serialize(_:at:)(1, &v26);
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v28 = v20;
    uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v27, (uint64_t)&v26, (uint64_t)&v29, (uint64_t)v30);
    if (v4) {
      return result;
    }
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v28 = v21;
    closure #1 in osLogInternal(_:log:type:)(&v27, (uint64_t)&v26, (uint64_t)&v29, (uint64_t)v30);
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v28 = v22;
    closure #1 in osLogInternal(_:log:type:)(&v27, (uint64_t)&v26, (uint64_t)&v29, (uint64_t)v30);
    _os_log_impl(&dword_255CF7000, v24, v25, "Created new DB with version=%ld", buf, size);
    destroyStorage<A>(_:count:)(v12, 0, v10);
    destroyStorage<A>(_:count:)(v13, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v14[147];
  uint64_t v7 = v14[92];
  uint64_t v8 = v14[90];

  v9(v7, v8);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v14[58] + 8);
  return v6();
}

{
  void *v0;
  id v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v3 = (id)v0[99];
  uint64_t v4 = v0[84];
  v0[58] = v0;
  swift_release();
  uint64_t v1 = v3;
  v0[60] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[157] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  id v3;
  uint64_t v4;

  uint64_t v3 = *(id *)(v0 + 792);
  *(void *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 464) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  id v3;
  uint64_t v4;

  uint64_t v3 = *(id *)(v0 + 1264);
  *(void *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 464) + 8);
  return v1();
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[103];
  v0[158] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[159] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[108];
  v0[158] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[159] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[112];
  v0[158] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[159] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[116];
  v0[158] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[62] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[159] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  id v3;
  uint64_t v4;

  uint64_t v3 = *(id *)(v0 + 1280);
  *(void *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 464) + 8);
  return v1();
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[121];
  v0[160] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[161] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[126];
  v0[160] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[161] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[130];
  v0[160] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[161] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[134];
  v0[160] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[65] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[161] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  *(void *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 464) + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(v0 + 672);
  *(void *)(v0 + 464) = v0;
  SQLiteDB.close()();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v2, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  id v3;
  uint64_t v4;

  uint64_t v3 = *(id *)(v0 + 1296);
  *(void *)(v0 + 464) = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 464) + 8);
  return v1();
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_release();
  uint64_t v3 = (void *)v0[152];
  v0[162] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[71] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[163] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

{
  void *v0;
  id v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0[58] = v0;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (void *)v0[156];
  v0[162] = v3;
  uint64_t v4 = v0[84];
  uint64_t v1 = v3;
  v0[71] = v3;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 112);
  v0[163] = v5;
  swift_retain();
  swift_endAccess();
  return MEMORY[0x270FA2498](DataWriter.createTables(), v5, 0);
}

void *implicit closure #1 in DataWriter.init()(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t sub_255D34D38()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in DataWriter.init()()
{
  return implicit closure #1 in DataWriter.init()(*(void **)(v0 + 16));
}

uint64_t DataWriter.writeRawDataForWiFi(data:)(void *__src)
{
  v2[40] = v1;
  v2[39] = __src;
  v2[37] = v2;
  v2[38] = 0;
  memcpy(v2 + 18, __src, 0x80uLL);
  memcpy(v2 + 2, v2 + 18, 0x80uLL);
  v2[38] = v4;
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForWiFi(data:), v4, 0);
}

uint64_t DataWriter.writeRawDataForWiFi(data:)()
{
  uint64_t countAndFlagsBits = v0[20]._countAndFlagsBits;
  uint64_t object = (uint64_t)v0[19]._object;
  v0[18]._uint64_t object = v0;
  swift_beginAccess();
  uint64_t v5 = *(void **)(countAndFlagsBits + 112);
  v0[20]._uint64_t object = v5;
  swift_retain();
  swift_endAccess();
  v0[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO wifi (session_id, timestamp, app_name, ssid, hour, dow, rssi, cca, noise, snr, tx_rate, rx_rate, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xACuLL, 1);
  outlined retain of WiFiDataPointForWriting(object);
  uint64_t v1 = swift_task_alloc();
  v0[22]._uint64_t countAndFlagsBits = v1;
  *(void *)(v1 + 16) = object;
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForWiFi(data:), v5, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v1 = v0[43];
  uint64_t v2 = v0[42];
  v0[37] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #1 in DataWriter.writeRawDataForWiFi(data:));
  v0[45] = 0;
  uint64_t v5 = *(void *)(v6 + 320);
  uint64_t v4 = *(void *)(v6 + 312);
  swift_task_dealloc();
  outlined release of WiFiDataPointForWriting(v4);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForWiFi(data:), v5, 0);
}

{
  uint64_t v0;

  *(void *)(v0 + 296) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 296) + 8))();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *(void *)(v0 + 312);
  *(void *)(v0 + 296) = v0;
  swift_task_dealloc();
  outlined release of WiFiDataPointForWriting(v3);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 296) + 8);
  return v1();
}

uint64_t closure #1 in DataWriter.writeRawDataForWiFi(data:)(uint64_t a1, long long *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v10 = v3;
  long long v24 = *a2;
  outlined retain of String();
  uint64_t v7 = MEMORY[0x263F8D310];
  *(void *)(v10 + 24) = MEMORY[0x263F8D310];
  *(void *)(v10 + 32) = &protocol witness table for String;
  *(_OWORD *)uint64_t v10 = v24;
  uint64_t v23 = *((void *)a2 + 2);
  uint64_t v9 = MEMORY[0x263F8D538];
  *(void *)(v10 + 64) = MEMORY[0x263F8D538];
  *(void *)(v10 + 72) = &protocol witness table for Double;
  *(void *)(v10 + 40) = v23;
  long long v22 = *(long long *)((char *)a2 + 24);
  outlined retain of String();
  *(void *)(v10 + 104) = v7;
  *(void *)(v10 + 112) = &protocol witness table for String;
  *(_OWORD *)(v10 + 80) = v22;
  long long v21 = *(long long *)((char *)a2 + 40);
  outlined retain of String();
  *(void *)(v10 + 144) = v7;
  *(void *)(v10 + 152) = &protocol witness table for String;
  *(_OWORD *)(v10 + 120) = v21;
  uint64_t v20 = *((void *)a2 + 7);
  uint64_t v4 = MEMORY[0x263F8D6C8];
  *(void *)(v10 + 184) = MEMORY[0x263F8D6C8];
  *(void *)(v10 + 192) = &protocol witness table for Int;
  *(void *)(v10 + 160) = v20;
  uint64_t v19 = *((void *)a2 + 8);
  *(void *)(v10 + 224) = v4;
  *(void *)(v10 + 232) = &protocol witness table for Int;
  *(void *)(v10 + 200) = v19;
  uint64_t v18 = *((void *)a2 + 9);
  *(void *)(v10 + 264) = v4;
  *(void *)(v10 + 272) = &protocol witness table for Int;
  *(void *)(v10 + 240) = v18;
  uint64_t v17 = *((void *)a2 + 10);
  *(void *)(v10 + 304) = v4;
  *(void *)(v10 + 312) = &protocol witness table for Int;
  *(void *)(v10 + 280) = v17;
  uint64_t v16 = *((void *)a2 + 12);
  *(void *)(v10 + 344) = v4;
  *(void *)(v10 + 352) = &protocol witness table for Int;
  *(void *)(v10 + 320) = v16;
  uint64_t v15 = *((void *)a2 + 11);
  *(void *)(v10 + 384) = v4;
  *(void *)(v10 + 392) = &protocol witness table for Int;
  *(void *)(v10 + 360) = v15;
  uint64_t v14 = *((void *)a2 + 13);
  *(void *)(v10 + 424) = v9;
  *(void *)(v10 + 432) = &protocol witness table for Double;
  *(void *)(v10 + 400) = v14;
  uint64_t v13 = *((void *)a2 + 14);
  *(void *)(v10 + 464) = v9;
  *(void *)(v10 + 472) = &protocol witness table for Double;
  *(void *)(v10 + 440) = v13;
  uint64_t v12 = *((void *)a2 + 15);
  *(void *)(v10 + 504) = v9;
  *(void *)(v10 + 512) = &protocol witness table for Double;
  *(void *)(v10 + 480) = v12;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v11) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t DataWriter.writeRawDataForCell(data:)(void *__src)
{
  v2[40] = v1;
  v2[39] = __src;
  v2[37] = v2;
  v2[38] = 0;
  memcpy(v2 + 18, __src, 0x80uLL);
  memcpy(v2 + 2, v2 + 18, 0x80uLL);
  v2[38] = v4;
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForCell(data:), v4, 0);
}

uint64_t DataWriter.writeRawDataForCell(data:)()
{
  uint64_t countAndFlagsBits = v0[20]._countAndFlagsBits;
  uint64_t object = (uint64_t)v0[19]._object;
  v0[18]._uint64_t object = v0;
  swift_beginAccess();
  uint64_t v5 = *(void **)(countAndFlagsBits + 112);
  v0[20]._uint64_t object = v5;
  swift_retain();
  swift_endAccess();
  v0[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("INSERT INTO cell (session_id, timestamp, app_name, carrier, hour, dow, rssi, rsrp, rscp, rsrq, snr, bars, throughput_true) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 0xA9uLL, 1);
  outlined retain of CellDataPointForWriting(object);
  uint64_t v1 = swift_task_alloc();
  v0[22]._uint64_t countAndFlagsBits = v1;
  *(void *)(v1 + 16) = object;
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForCell(data:), v5, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v1 = v0[43];
  uint64_t v2 = v0[42];
  v0[37] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))partial apply for closure #1 in DataWriter.writeRawDataForCell(data:));
  v0[45] = 0;
  uint64_t v5 = *(void *)(v6 + 320);
  uint64_t v4 = *(void *)(v6 + 312);
  swift_task_dealloc();
  outlined release of CellDataPointForWriting(v4);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.writeRawDataForCell(data:), v5, 0);
}

{
  uint64_t v0;

  *(void *)(v0 + 296) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 296) + 8))();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *(void *)(v0 + 312);
  *(void *)(v0 + 296) = v0;
  swift_task_dealloc();
  outlined release of CellDataPointForWriting(v3);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 296) + 8);
  return v1();
}

uint64_t closure #1 in DataWriter.writeRawDataForCell(data:)(uint64_t a1, long long *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v10 = v3;
  long long v24 = *a2;
  outlined retain of String();
  uint64_t v7 = MEMORY[0x263F8D310];
  *(void *)(v10 + 24) = MEMORY[0x263F8D310];
  *(void *)(v10 + 32) = &protocol witness table for String;
  *(_OWORD *)uint64_t v10 = v24;
  uint64_t v23 = *((void *)a2 + 2);
  uint64_t v9 = MEMORY[0x263F8D538];
  *(void *)(v10 + 64) = MEMORY[0x263F8D538];
  *(void *)(v10 + 72) = &protocol witness table for Double;
  *(void *)(v10 + 40) = v23;
  long long v22 = *(long long *)((char *)a2 + 24);
  outlined retain of String();
  *(void *)(v10 + 104) = v7;
  *(void *)(v10 + 112) = &protocol witness table for String;
  *(_OWORD *)(v10 + 80) = v22;
  long long v21 = *(long long *)((char *)a2 + 40);
  outlined retain of String();
  *(void *)(v10 + 144) = v7;
  *(void *)(v10 + 152) = &protocol witness table for String;
  *(_OWORD *)(v10 + 120) = v21;
  uint64_t v20 = *((void *)a2 + 7);
  uint64_t v4 = MEMORY[0x263F8D6C8];
  *(void *)(v10 + 184) = MEMORY[0x263F8D6C8];
  *(void *)(v10 + 192) = &protocol witness table for Int;
  *(void *)(v10 + 160) = v20;
  uint64_t v19 = *((void *)a2 + 8);
  *(void *)(v10 + 224) = v4;
  *(void *)(v10 + 232) = &protocol witness table for Int;
  *(void *)(v10 + 200) = v19;
  uint64_t v18 = *((void *)a2 + 9);
  *(void *)(v10 + 264) = v4;
  *(void *)(v10 + 272) = &protocol witness table for Int;
  *(void *)(v10 + 240) = v18;
  uint64_t v17 = *((void *)a2 + 10);
  *(void *)(v10 + 304) = v4;
  *(void *)(v10 + 312) = &protocol witness table for Int;
  *(void *)(v10 + 280) = v17;
  uint64_t v16 = *((void *)a2 + 11);
  *(void *)(v10 + 344) = v4;
  *(void *)(v10 + 352) = &protocol witness table for Int;
  *(void *)(v10 + 320) = v16;
  uint64_t v15 = *((void *)a2 + 12);
  *(void *)(v10 + 384) = v4;
  *(void *)(v10 + 392) = &protocol witness table for Int;
  *(void *)(v10 + 360) = v15;
  uint64_t v14 = *((void *)a2 + 13);
  *(void *)(v10 + 424) = v9;
  *(void *)(v10 + 432) = &protocol witness table for Double;
  *(void *)(v10 + 400) = v14;
  uint64_t v13 = *((void *)a2 + 14);
  *(void *)(v10 + 464) = v4;
  *(void *)(v10 + 472) = &protocol witness table for Int;
  *(void *)(v10 + 440) = v13;
  uint64_t v12 = *((void *)a2 + 15);
  *(void *)(v10 + 504) = v9;
  *(void *)(v10 + 512) = &protocol witness table for Double;
  *(void *)(v10 + 480) = v12;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v11) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t DataWriter.readModelStatsFromDB()()
{
  v1[9] = v0;
  v1[5] = v1;
  v1[6] = 0;
  v1[8] = 0;
  v1[6] = v0;
  return MEMORY[0x270FA2498](DataWriter.readModelStatsFromDB(), v0, 0);
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v2 = *(void *)(v0 + 72);
  *(void *)(v0 + 40) = v0;
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v0 + 80) = v3;
  swift_retain();
  swift_endAccess();
  *(Swift::String *)(v0 + 88) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT interfaceType, trainingRowCount, validationRowCount, carrierCount, ssidCount, appNameCount, sessionIDCount, trainingMAPE, validationMAPE, trainingDate FROM modelStats LIMIT 2", 0xB5uLL, 1);
  return MEMORY[0x270FA2498](DataWriter.readModelStatsFromDB(), v3, 0);
}

{
  void *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v4 = v0[12];
  uint64_t v5 = v0[11];
  v0[5] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]?);
  SQLiteDB.withStatement<A>(sql:handler:)(v5, v4, (void (*)(void))closure #1 in DataWriter.readModelStatsFromDB());
  v0[13] = 0;
  uint64_t v2 = *(void *)(v3 + 72);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.readModelStatsFromDB(), v2, 0);
}

{
  uint64_t v0;

  *(void *)(v0 + 40) = v0;
  return (*(uint64_t (**)(void))(*(void *)(v0 + 40) + 8))(*(void *)(v0 + 56));
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t (*v3)();
  uint64_t v5;
  uint64_t v6;

  uint64_t v1 = (void *)v0[13];
  v0[5] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = v1;
  v0[8] = v1;
  swift_willThrow();

  uint64_t v3 = *(uint64_t (**)())(*(void *)(v5 + 40) + 8);
  return v3();
}

void closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1@<X0>, void *a2@<X8>)
{
  v8[0] = 0;
  v8[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  _allocateUninitializedArray<A>(_:)();
  v8[0] = Dictionary.init(dictionaryLiteral:)();
  uint64_t v7 = v8;
  (*(void (**)(uint64_t (*)(uint64_t), unsigned char *))(*(void *)a1 + 144))(partial apply for closure #1 in closure #1 in DataWriter.readModelStatsFromDB(), v6);
  if (!v5)
  {
    uint64_t v3 = v8[0];
    swift_bridgeObjectRetain();
    *a2 = v3;
  }
  outlined destroy of [String : Any]();
}

uint64_t closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1)
{
  SQLiteDB.Row.get<A>(at:)(0, a1, MEMORY[0x263F8D310], (uint64_t)&protocol witness table for String);
  if (v30)
  {
    uint64_t v15 = MEMORY[0x263F8D6C8];
    SQLiteDB.Row.get<A>(at:)(1, a1, MEMORY[0x263F8D6C8], (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(2, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(3, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(4, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(5, a1, v15, (uint64_t)&protocol witness table for Int);
    SQLiteDB.Row.get<A>(at:)(6, a1, v15, (uint64_t)&protocol witness table for Int);
    uint64_t v16 = MEMORY[0x263F8D538];
    SQLiteDB.Row.get<A>(at:)(7, a1, MEMORY[0x263F8D538], (uint64_t)&protocol witness table for Double);
    SQLiteDB.Row.get<A>(at:)(8, a1, v16, (uint64_t)&protocol witness table for Double);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v17 = v5;
    uint64_t v6 = kMediaML_trainingRowCount.unsafeMutableAddressor();
    outlined init with copy of String(v6, v17);
    v17[5] = v15;
    v17[2] = v29;
    uint64_t v7 = kMediaML_validationRowCount.unsafeMutableAddressor();
    outlined init with copy of String(v7, v17 + 6);
    v17[11] = v15;
    v17[8] = v28;
    uint64_t v8 = kMediaML_carrier.unsafeMutableAddressor();
    outlined init with copy of String(v8, v17 + 12);
    v17[17] = v15;
    v17[14] = v27;
    uint64_t v9 = kMediaML_ssid.unsafeMutableAddressor();
    outlined init with copy of String(v9, v17 + 18);
    v17[23] = v15;
    v17[20] = v26;
    uint64_t v10 = kMediaML_appNameCount.unsafeMutableAddressor();
    outlined init with copy of String(v10, v17 + 24);
    v17[29] = v15;
    v17[26] = v25;
    uint64_t v11 = kMediaML_sessionIDCount.unsafeMutableAddressor();
    outlined init with copy of String(v11, v17 + 30);
    v17[35] = v15;
    v17[32] = v24;
    uint64_t v12 = kMediaML_trainingMAPE.unsafeMutableAddressor();
    outlined init with copy of String(v12, v17 + 36);
    v17[41] = v16;
    v17[38] = v23;
    uint64_t v13 = kMediaML_validationMAPE.unsafeMutableAddressor();
    outlined init with copy of String(v13, v17 + 42);
    v17[47] = v16;
    v17[44] = v22;
    _finalizeUninitializedArray<A>(_:)();
    Dictionary.init(dictionaryLiteral:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    Dictionary.subscript.setter();
    return swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("interfaceType is missing", 0x18uLL, 1);
    int v20 = SQLError.init(code:desc:)(0xFFFFFFFFLL, v1._countAndFlagsBits, v1._object);
    uint64_t v18 = v2;
    uint64_t v19 = v3;
    lazy protocol witness table accessor for type SQLError and conformance SQLError();
    swift_allocError();
    *(_DWORD *)uint64_t v4 = v20;
    *(void *)(v4 + 8) = v18;
    *(void *)(v4 + 16) = v19;
    return swift_willThrow();
  }
}

uint64_t DataWriter.readWiFiStdDev(appName:ssid:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[24] = v4;
  v5[23] = a4;
  v5[22] = a3;
  v5[21] = a2;
  v5[20] = a1;
  v5[15] = v5;
  void v5[5] = 0;
  v5[6] = 0;
  v5[7] = 0;
  v5[8] = 0;
  v5[16] = 0;
  v5[18] = 0;
  v5[19] = 0;
  void v5[5] = a1;
  v5[6] = a2;
  v5[7] = a3;
  v5[8] = a4;
  v5[16] = v4;
  return MEMORY[0x270FA2498](DataWriter.readWiFiStdDev(appName:ssid:), v4, 0);
}

uint64_t DataWriter.readWiFiStdDev(appName:ssid:)()
{
  uint64_t v7 = v0[24];
  uint64_t v11 = v0[23];
  uint64_t v10 = v0[22];
  uint64_t v9 = v0[21];
  uint64_t v8 = v0[20];
  v0[15] = v0;
  swift_beginAccess();
  uint64_t v12 = *(void *)(v7 + 112);
  v0[25] = v12;
  swift_retain();
  swift_endAccess();
  v0[9] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v0[10] = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\tSELECT AVG(throughput_stddev) FROM wifiStdDev WHERE app_name LIKE '", 0x44uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease();
  v0[11] = v8;
  unsigned char v0[12] = v9;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND ssid LIKE '", 0x11uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  v0[13] = v10;
  v0[14] = v11;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("'", 1uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  v0[26] = String.init(stringInterpolation:)();
  v0[27] = v5;
  return MEMORY[0x270FA2498](DataWriter.readWiFiStdDev(appName:ssid:), v12, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v1 = v0[27];
  Swift::String v2 = v0[26];
  v0[15] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.readWiFiStdDev(appName:ssid:));
  v0[28] = 0;
  Swift::String v4 = *(void *)(v5 + 192);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.readWiFiStdDev(appName:ssid:), v4, 0);
}

{
  void *v0;

  v0[15] = v0;
  v0[19] = v0[17];
  return (*(uint64_t (**)(void))(v0[15] + 8))();
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t (*v3)(__n128);
  __n128 v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  uint64_t v1 = (void *)v0[28];
  v0[15] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  Swift::String v2 = v1;
  v0[18] = v1;
  swift_willThrow();

  Swift::String v3 = *(uint64_t (**)(__n128))(*(void *)(v6 + 120) + 8);
  v4.n128_u64[0] = v7;
  return v3(v4);
}

uint64_t closure #1 in DataWriter.readWiFiStdDev(appName:ssid:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void, _UNKNOWN **))(*(void *)a1 + 160))(v7, MEMORY[0x263F8D538], &protocol witness table for Double);
  if (v2)
  {

    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t DataWriter.readCellStdDev(appName:carrier:bars:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[27] = v5;
  v6[26] = a5;
  v6[25] = a4;
  v6[24] = a3;
  v6[23] = a2;
  v6[22] = a1;
  v6[15] = v6;
  v6[5] = 0;
  v6[6] = 0;
  v6[7] = 0;
  v6[8] = 0;
  unsigned char v6[16] = 0;
  v6[17] = 0;
  v6[20] = 0;
  v6[21] = 0;
  v6[5] = a1;
  v6[6] = a2;
  v6[7] = a3;
  v6[8] = a4;
  unsigned char v6[16] = a5;
  v6[17] = v5;
  return MEMORY[0x270FA2498](DataWriter.readCellStdDev(appName:carrier:bars:), v5, 0);
}

uint64_t DataWriter.readCellStdDev(appName:carrier:bars:)()
{
  uint64_t v8 = v0[27];
  uint64_t v13 = v0[26];
  uint64_t v12 = v0[25];
  uint64_t v11 = v0[24];
  uint64_t v10 = v0[23];
  uint64_t v9 = v0[22];
  v0[15] = v0;
  swift_beginAccess();
  uint64_t v14 = *(void *)(v8 + 112);
  v0[28] = v14;
  swift_retain();
  swift_endAccess();
  v0[9] = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v0[10] = v1;
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SELECT AVG(throughput_stddev) FROM cellStdDev WHERE app_name LIKE '", 0x43uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v2);
  swift_bridgeObjectRelease();
  v0[11] = v9;
  unsigned char v0[12] = v10;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND carrier LIKE '", 0x14uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v3);
  swift_bridgeObjectRelease();
  v0[13] = v11;
  v0[14] = v12;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("' AND bars LIKE ", 0x10uLL, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v4);
  swift_bridgeObjectRelease();
  v0[19] = v13;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
  DefaultStringInterpolation.appendLiteral(_:)(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  outlined destroy of DefaultStringInterpolation();
  v0[29] = String.init(stringInterpolation:)();
  v0[30] = v6;
  return MEMORY[0x270FA2498](DataWriter.readCellStdDev(appName:carrier:bars:), v14, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v1 = v0[30];
  Swift::String v2 = v0[29];
  v0[15] = v0;
  SQLiteDB.withStatement<A>(sql:handler:)(v2, v1, (void (*)(void))closure #1 in DataWriter.readCellStdDev(appName:carrier:bars:));
  v0[31] = 0;
  Swift::String v4 = *(void *)(v5 + 216);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](DataWriter.readCellStdDev(appName:carrier:bars:), v4, 0);
}

{
  void *v0;

  v0[15] = v0;
  v0[21] = v0[18];
  return (*(uint64_t (**)(void))(v0[15] + 8))();
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t (*v3)(__n128);
  __n128 v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  uint64_t v1 = (void *)v0[31];
  v0[15] = v0;
  swift_bridgeObjectRelease();
  swift_release();
  Swift::String v2 = v1;
  v0[20] = v1;
  swift_willThrow();

  Swift::String v3 = *(uint64_t (**)(__n128))(*(void *)(v6 + 120) + 8);
  v4.n128_u64[0] = v7;
  return v3(v4);
}

uint64_t closure #1 in DataWriter.readCellStdDev(appName:carrier:bars:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void, _UNKNOWN **))(*(void *)a1 + 160))(v7, MEMORY[0x263F8D538], &protocol witness table for Double);
  if (v2)
  {

    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t closure #1 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void, _UNKNOWN **))(*(void *)a1 + 160))(v7, MEMORY[0x263F8D6C8], &protocol witness table for Int);
  if (v2)
  {

    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t closure #2 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void, _UNKNOWN **))(*(void *)a1 + 160))(v7, MEMORY[0x263F8D6C8], &protocol witness table for Int);
  if (v2)
  {

    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t closure #3 in DataWriter.createTables()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v7[1] = a1;
  (*(void (**)(void *__return_ptr, void, _UNKNOWN **))(*(void *)a1 + 160))(v7, MEMORY[0x263F8D6C8], &protocol witness table for Int);
  if (v2)
  {

    uint64_t v4 = 0;
    char v5 = 1;
  }
  else
  {
    uint64_t v4 = v7[0];
    char v5 = 0;
  }
  uint64_t result = 0;
  if (v5) {
    *a2 = 0;
  }
  else {
    *a2 = v4;
  }
  return result;
}

uint64_t implicit closure #2 in DataWriter.createTables()(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t closure #4 in DataWriter.createTables()(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SQLBindable);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = *(void *)(a2 + 120);
  v4[3] = MEMORY[0x263F8D6C8];
  v4[4] = &protocol witness table for Int;
  *uint64_t v4 = v3;
  _finalizeUninitializedArray<A>(_:)();
  (*(void (**)(void))(*(void *)a1 + 192))();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v8) {
    return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176))(result);
  }
  return result;
}

uint64_t implicit closure #3 in DataWriter.createTables()(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t DataWriter.deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t DataWriter.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t DataWriter.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance DataWriter()
{
  return DataWriter.unownedExecutor.getter();
}

uint64_t MediaML.logger.unsafeMutableAddressor()
{
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static MediaML.logger);
}

uint64_t static MediaML.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  uint64_t v1 = type metadata accessor for Logger();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t variable initialization expression of MediaML.dataWriter()
{
  return 0;
}

uint64_t MediaML.dataWriter.getter()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 112);
  swift_retain();
  swift_endAccess();
  return v2;
}

uint64_t MediaML.dataWriter.setter(uint64_t a1)
{
  swift_retain();
  swift_beginAccess();
  *(void *)(v1 + 112) = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*MediaML.dataWriter.modify())()
{
  return MediaML.dataWriter.modify;
}

uint64_t MediaML.dataWriter.modify()
{
  return swift_endAccess();
}

uint64_t MediaML.wifiModel.getter()
{
  uint64_t v2 = *(void *)(v0 + 120);
  swift_retain();
  return v2;
}

uint64_t MediaML.cellModel.getter()
{
  uint64_t v2 = *(void *)(v0 + 128);
  swift_retain();
  return v2;
}

uint64_t MediaML.ensureDataWriter()()
{
  v1[18] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[16] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[9] = v4;
  return MEMORY[0x270FA2498](MediaML.ensureDataWriter(), v4, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *buf;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint32_t v16;
  os_log_type_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  long long v21 = v0[18];
  v0[8] = v0;
  swift_beginAccess();
  uint64_t v22 = *(void *)(v21 + 112);
  swift_retain();
  swift_endAccess();
  v0[10] = v22;
  if (v0[10])
  {
    outlined destroy of DataWriter?();
    uint64_t v1 = *(void *)(v20 + 176);
    uint64_t v15 = *(void *)(v20 + 152);
    uint64_t v14 = *(void *)(v20 + 160);
    uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v1, v2, v15);
    uint64_t v18 = Logger.logObject.getter();
    uint64_t v17 = static os_log_type_t.debug.getter();
    *(void *)(v20 + 88) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v16 = *(_DWORD *)(v20 + 208);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v19 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v18, v17))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v11 = createStorage<A>(capacity:type:)(0);
      uint64_t v12 = createStorage<A>(capacity:type:)(0);
      *(void *)(v20 + 96) = buf;
      *(void *)(v20 + 104) = v11;
      *(void *)(v20 + 112) = v12;
      serialize(_:at:)(0, (unsigned char **)(v20 + 96));
      serialize(_:at:)(0, (unsigned char **)(v20 + 96));
      *(void *)(v20 + 120) = v19;
      uint64_t v13 = (void *)swift_task_alloc();
      void v13[2] = v20 + 96;
      v13[3] = v20 + 104;
      void v13[4] = v20 + 112;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v18, v17, "DataWriter already initialized", buf, v16);
      destroyStorage<A>(_:count:)(v11, 0, v9);
      destroyStorage<A>(_:count:)(v12, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v20 + 176);
    uint64_t v8 = *(void *)(v20 + 152);
    uint64_t v6 = *(void *)(v20 + 160);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v20 + 64) + 8);
    return v5();
  }
  else
  {
    outlined destroy of DataWriter?();
    type metadata accessor for DataWriter();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v20 + 184) = v3;
    *uint64_t v3 = *(void *)(v20 + 64);
    v3[1] = MediaML.ensureDataWriter();
    return DataWriter.__allocating_init()();
  }
}

{
  void *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v4 = v0[24];
  uint64_t v3 = v0[18];
  v0[8] = v0;
  swift_beginAccess();
  *(void *)(v3 + 112) = v4;
  swift_release();
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0[8] + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint32_t size;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  unint64_t v35 = v0;
  uint64_t v19 = *(id *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v17 = *(void *)(v0 + 160);
  uint64_t v18 = *(void *)(v0 + 152);
  *(void *)(v0 + 64) = v0;
  uint64_t v2 = v19;
  *(void *)(v0 + 128) = v19;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v3, v18);
  uint64_t v4 = v19;
  long long v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v28 = Logger.logObject.getter();
  uint64_t v29 = static os_log_type_t.error.getter();
  *(void *)(v0 + 136) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 212);
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 64;
  uint64_t v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = partial apply for implicit closure #1 in MediaML.ensureDataWriter();
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v23 + 24) = v22;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v27 = v5;
  swift_retain();
  *uint64_t v27 = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[1] = v24;
  swift_retain();
  v27[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[3] = v25;
  swift_retain();
  v27[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[5] = v26;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v28, v29))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    uint64_t v15 = createStorage<A>(capacity:type:)(0);
    uint64_t v30 = buf;
    uint64_t v31 = v14;
    uint64_t v32 = v15;
    serialize(_:at:)(2, &v30);
    serialize(_:at:)(1, &v30);
    unint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    unint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    unint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    _os_log_impl(&dword_255CF7000, v28, v29, "Failed to create DataWriter with error %@", buf, size);
    destroyStorage<A>(_:count:)(v14, 1, v12);
    destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v11 = (id)v16[25];
  uint64_t v9 = v16[21];
  uint64_t v10 = v16[19];
  uint64_t v8 = v16[20];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v16[8] + 8);
  return v6();
}

uint64_t MediaML.ensureDataWriter()(uint64_t a1)
{
  uint64_t v6 = (void *)*v2;
  v6[8] = *v2;
  v6[24] = a1;
  v6[25] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = v6[18];
    uint64_t v4 = MediaML.ensureDataWriter();
  }
  else
  {
    uint64_t v3 = v6[18];
    uint64_t v4 = MediaML.ensureDataWriter();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

void *implicit closure #1 in MediaML.ensureDataWriter()(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t MediaML.writeWifiData(data:)(uint64_t a1)
{
  v2[139] = v1;
  v2[138] = a1;
  v2[110] = v2;
  v2[111] = 0;
  v2[112] = 0;
  v2[115] = 0;
  v2[74] = 0;
  v2[75] = 0;
  v2[116] = 0;
  v2[80] = 0;
  v2[81] = 0;
  v2[86] = 0;
  v2[87] = 0;
  v2[117] = 0;
  v2[118] = 0;
  v2[119] = 0;
  v2[120] = 0;
  v2[121] = 0;
  v2[122] = 0;
  v2[123] = 0;
  v2[124] = 0;
  v2[100] = 0;
  v2[101] = 0;
  v2[102] = 0;
  v2[103] = 0;
  v2[125] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[140] = v3;
  v2[141] = *(void *)(v3 - 8);
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Calendar.Component();
  v2[144] = v4;
  v2[145] = *(void *)(v4 - 8);
  v2[146] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Calendar();
  v2[147] = v5;
  v2[148] = *(void *)(v5 - 8);
  v2[149] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[150] = v6;
  v2[151] = *(void *)(v6 - 8);
  v2[152] = swift_task_alloc();
  v2[111] = a1;
  v2[112] = v8;
  return MEMORY[0x270FA2498](MediaML.writeWifiData(data:), v8, 0);
}

uint64_t MediaML.writeWifiData(data:)()
{
  uint64_t v79 = v0[139];
  v0[110] = v0;
  swift_beginAccess();
  uint64_t v80 = *(void *)(v79 + 112);
  swift_retain();
  swift_endAccess();
  v0[113] = v80;
  if (v0[113])
  {
    outlined destroy of DataWriter?();
    Date.init()();
    Swift::String v77 = *kMediaML_throughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 544) = v77;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (!*(void *)(v78 + 200)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    outlined init with take of Any(v78 + 176, v78 + 144);
    swift_dynamicCast();
    Swift::Double throughputTrue = *(double *)(v78 + 912);
    *(Swift::Double *)(v78 + 920) = throughputTrue;
    Swift::String v76 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 560) = v76;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 232))
    {
      if (swift_dynamicCast())
      {
        uint64_t v73 = *(void *)(v78 + 864);
        uint64_t v74 = *(void *)(v78 + 872);
      }
      else
      {
        uint64_t v73 = 0;
        uint64_t v74 = 0;
      }
      uint64_t v71 = v73;
      uint64_t v72 = v74;
    }
    else
    {
      outlined destroy of Any?(v78 + 208);
      uint64_t v71 = 0;
      uint64_t v72 = 0;
    }
    *(void *)(v78 + 576) = v71;
    *(void *)(v78 + 584) = v72;
    if (*(void *)(v78 + 584))
    {
      Swift::String v81 = *(Swift::String *)(v78 + 576);
    }
    else
    {
      Swift::String v81 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    *(void *)(v78 + 1224) = v81._object;
    *(Swift::String *)(v78 + 592) = v81;
    Date.timeIntervalSince1970.getter();
    Swift::Double timestamp = v3;
    *(double *)(v78 + 928) = v3;
    Swift::String v70 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 608) = v70;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 264))
    {
      if (swift_dynamicCast())
      {
        uint64_t v67 = *(void *)(v78 + 848);
        uint64_t v68 = *(void *)(v78 + 856);
      }
      else
      {
        uint64_t v67 = 0;
        uint64_t v68 = 0;
      }
      uint64_t v65 = v67;
      uint64_t v66 = v68;
    }
    else
    {
      outlined destroy of Any?(v78 + 240);
      uint64_t v65 = 0;
      uint64_t v66 = 0;
    }
    *(void *)(v78 + 624) = v65;
    *(void *)(v78 + 632) = v66;
    if (*(void *)(v78 + 632))
    {
      Swift::String v82 = *(Swift::String *)(v78 + 624);
    }
    else
    {
      Swift::String v82 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    *(void *)(v78 + 1232) = v82._object;
    *(Swift::String *)(v78 + 640) = v82;
    Swift::String v64 = *kMediaML_ssid.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 656) = v64;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 296))
    {
      if (swift_dynamicCast())
      {
        uint64_t v62 = *(void *)(v78 + 832);
        uint64_t v63 = *(void *)(v78 + 840);
      }
      else
      {
        uint64_t v62 = 0;
        uint64_t v63 = 0;
      }
      uint64_t v60 = v62;
      uint64_t v61 = v63;
    }
    else
    {
      outlined destroy of Any?(v78 + 272);
      uint64_t v60 = 0;
      uint64_t v61 = 0;
    }
    *(void *)(v78 + 672) = v60;
    *(void *)(v78 + 680) = v61;
    if (*(void *)(v78 + 680))
    {
      Swift::String v83 = *(Swift::String *)(v78 + 672);
    }
    else
    {
      Swift::String v83 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    uint64_t v55 = *(void *)(v78 + 1192);
    uint64_t v56 = *(void *)(v78 + 1176);
    uint64_t v54 = *(void *)(v78 + 1168);
    uint64_t v52 = *(void *)(v78 + 1152);
    uint64_t v49 = *(void *)(v78 + 1184);
    uint64_t v48 = *(void *)(v78 + 1160);
    *(void *)(v78 + 1240) = v83._object;
    *(Swift::String *)(v78 + 688) = v83;
    static Calendar.current.getter();
    uint64_t v51 = *(void (**)(uint64_t, void, uint64_t))(v48 + 104);
    v51(v54, *MEMORY[0x263F07890], v52);
    uint64_t hour = Calendar.component(_:from:)();
    uint64_t v53 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
    v53(v54, v52);
    uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v57(v55, v56);
    *(void *)(v78 + 936) = hour;
    static Calendar.current.getter();
    v51(v54, *MEMORY[0x263F078E8], v52);
    uint64_t dow = Calendar.component(_:from:)();
    v53(v54, v52);
    v57(v55, v56);
    *(void *)(v78 + 944) = dow;
    Swift::String v59 = *kMediaML_rssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 704) = v59;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 328))
    {
      if (swift_dynamicCast())
      {
        uint64_t v46 = *(void *)(v78 + 1096);
        char v47 = 0;
      }
      else
      {
        uint64_t v46 = 0;
        char v47 = 1;
      }
      uint64_t v44 = v46;
      char v45 = v47;
    }
    else
    {
      outlined destroy of Any?(v78 + 304);
      uint64_t v44 = 0;
      char v45 = 1;
    }
    rssuint64_t i = (v45 & 1) != 0 ? 0 : v44;
    *(void *)(v78 + 952) = rssi;
    Swift::String v43 = *kMediaML_cca.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 720) = v43;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 360))
    {
      if (swift_dynamicCast())
      {
        uint64_t v41 = *(void *)(v78 + 1088);
        char v42 = 0;
      }
      else
      {
        uint64_t v41 = 0;
        char v42 = 1;
      }
      uint64_t v39 = v41;
      char v40 = v42;
    }
    else
    {
      outlined destroy of Any?(v78 + 336);
      uint64_t v39 = 0;
      char v40 = 1;
    }
    Swift::Int cca = (v40 & 1) != 0 ? 0 : v39;
    *(void *)(v78 + 960) = cca;
    Swift::String v38 = *kMediaML_snr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 736) = v38;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 392))
    {
      if (swift_dynamicCast())
      {
        uint64_t v36 = *(void *)(v78 + 1080);
        char v37 = 0;
      }
      else
      {
        uint64_t v36 = 0;
        char v37 = 1;
      }
      uint64_t v34 = v36;
      char v35 = v37;
    }
    else
    {
      outlined destroy of Any?(v78 + 368);
      uint64_t v34 = 0;
      char v35 = 1;
    }
    Swift::Int snr = (v35 & 1) != 0 ? 0 : v34;
    *(void *)(v78 + 968) = snr;
    Swift::String v33 = *kMediaML_noise.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 752) = v33;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 424))
    {
      if (swift_dynamicCast())
      {
        uint64_t v31 = *(void *)(v78 + 1072);
        char v32 = 0;
      }
      else
      {
        uint64_t v31 = 0;
        char v32 = 1;
      }
      uint64_t v29 = v31;
      char v30 = v32;
    }
    else
    {
      outlined destroy of Any?(v78 + 400);
      uint64_t v29 = 0;
      char v30 = 1;
    }
    Swift::Int noise = (v30 & 1) != 0 ? 0 : v29;
    *(void *)(v78 + 976) = noise;
    Swift::String v28 = *kMediaML_rxRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 768) = v28;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 456))
    {
      if (swift_dynamicCast())
      {
        double v26 = *(double *)(v78 + 1064);
        char v27 = 0;
      }
      else
      {
        double v26 = 0.0;
        char v27 = 1;
      }
      double v24 = v26;
      char v25 = v27;
    }
    else
    {
      outlined destroy of Any?(v78 + 432);
      double v24 = 0.0;
      char v25 = 1;
    }
    Swift::Double v88 = (v25 & 1) != 0 ? 0.0 : v24;
    *(Swift::Double *)(v78 + 984) = v88;
    Swift::String v23 = *kMediaML_txRate.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v78 + 784) = v23;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v78 + 488))
    {
      if (swift_dynamicCast())
      {
        double v21 = *(double *)(v78 + 1056);
        char v22 = 0;
      }
      else
      {
        double v21 = 0.0;
        char v22 = 1;
      }
      double v19 = v21;
      char v20 = v22;
    }
    else
    {
      outlined destroy of Any?(v78 + 464);
      double v19 = 0.0;
      char v20 = 1;
    }
    Swift::Double v89 = (v20 & 1) != 0 ? 0.0 : v19;
    *(Swift::Double *)(v78 + 992) = v89;
    if (rssi >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor())
    {
      if (rssi >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
        && rssi < *rssiBucket_medium_high_boundary.unsafeMutableAddressor())
      {
        Swift::String v16 = *rssiBucket_medium.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        *(Swift::String *)(v78 + 800) = v16;
      }
      else
      {
        Swift::String v15 = *rssiBucket_high.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        *(Swift::String *)(v78 + 800) = v15;
      }
    }
    else
    {
      Swift::String v18 = *rssiBucket_low.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      *(Swift::String *)(v78 + 800) = v18;
    }
    uint64_t v13 = *(void *)(v78 + 1112);
    uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("_", 1uLL, 1)._countAndFlagsBits;
    uint64_t v8 = MEMORY[0x25A298350](v83._countAndFlagsBits, v83._object, countAndFlagsBits);
    uint64_t v11 = v5;
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)(v78 + 800);
    uint64_t v10 = *(void *)(v78 + 808);
    swift_bridgeObjectRetain();
    bucketedSSID._uint64_t countAndFlagsBits = MEMORY[0x25A298350](v8, v11, v9, v10);
    bucketedSSID._uint64_t object = v6;
    *(void *)(v78 + 1248) = v6;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(Swift::String *)(v78 + 816) = bucketedSSID;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    WiFiDataPointForWriting.init(sessionID:timestamp:appName:bucketedSSID:hour:dow:rssi:cca:snr:noise:txRate:rxRate:throughputTrue:)((MediaML::WiFiDataPointForWriting *)(v78 + 16), v81, timestamp, v82, bucketedSSID, hour, dow, rssi, cca, snr, noise, v89, v88, throughputTrue);
    swift_beginAccess();
    uint64_t v14 = *(void *)(v13 + 112);
    *(void *)(v78 + 1256) = v14;
    swift_retain();
    swift_endAccess();
    if (v14)
    {
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v78 + 1264) = v7;
      *uint64_t v7 = *(void *)(v78 + 880);
      v7[1] = MediaML.writeWifiData(data:);
      return DataWriter.writeRawDataForWiFi(data:)((void *)(v78 + 16));
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v78 + 880) + 8);
    return v1();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v1;
  uint64_t v6 = *v1 + 16;
  *(void *)(v7 + 880) = *v1;
  *(void *)(v7 + 1272) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = *(void *)(v6 + 1096);
    double v3 = MediaML.writeWifiData(data:);
  }
  else
  {
    uint64_t v5 = *(void *)(v6 + 1096);
    swift_release();
    uint64_t v2 = v5;
    double v3 = MediaML.writeWifiData(data:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t size;
  os_log_type_t v21;
  NSObject *oslog;
  uint64_t v23;
  uint64_t v24;

  uint64_t v1 = *(void *)(v0 + 1144);
  Swift::String v18 = *(void *)(v0 + 1128);
  double v19 = *(void *)(v0 + 1120);
  *(void *)(v0 + 880) = v0;
  uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v1, v2, v19);
  oslog = Logger.logObject.getter();
  double v21 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 1016) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(unsigned int *)(v0 + 1284);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  Swift::String v23 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v21))
  {
    double v3 = *(void *)(v17 + 1272);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    Swift::String v15 = createStorage<A>(capacity:type:)(0);
    *(void *)(v17 + 1024) = buf;
    *(void *)(v17 + 1032) = v14;
    *(void *)(v17 + 1040) = v15;
    serialize(_:at:)(0, (unsigned char **)(v17 + 1024));
    serialize(_:at:)(0, (unsigned char **)(v17 + 1024));
    *(void *)(v17 + 1048) = v23;
    Swift::String v16 = (void *)swift_task_alloc();
    v16[2] = v17 + 1024;
    v16[3] = v17 + 1032;
    v16[4] = v17 + 1040;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, oslog, v21, "WiFi Data write to disk finished", buf, size);
    destroyStorage<A>(_:count:)(v14, 0, v12);
    destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = *(void *)(v17 + 1144);
  uint64_t v8 = *(void *)(v17 + 1120);
  uint64_t v6 = *(void *)(v17 + 1128);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  uint64_t v10 = *(void *)(v17 + 1216);
  uint64_t v11 = *(void *)(v17 + 1200);
  uint64_t v9 = *(void *)(v17 + 1208);
  outlined release of WiFiDataPointForWriting(v17 + 16);
  swift_bridgeObjectRelease();
  outlined destroy of String();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v17 + 880) + 8);
  return v5();
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *oslog;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  Swift::String v38 = v0;
  char v22 = *(id *)(v0 + 1272);
  uint64_t v1 = *(void *)(v0 + 1136);
  char v20 = *(void *)(v0 + 1128);
  double v21 = *(void *)(v0 + 1120);
  *(void *)(v0 + 880) = v0;
  swift_release();
  uint64_t v2 = v22;
  *(void *)(v0 + 1000) = v22;
  double v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v3, v21);
  uint64_t v4 = v22;
  double v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  char v32 = static os_log_type_t.error.getter();
  *(void *)(v0 + 1008) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1280);
  char v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 64;
  Swift::String v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 8;
  char v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #11 in MediaML.writeWifiData(data:);
  *(void *)(v25 + 24) = v24;
  double v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v25;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v29 + 24) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  char v30 = v5;
  swift_retain();
  *char v30 = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[1] = v27;
  swift_retain();
  v30[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[3] = v28;
  swift_retain();
  v30[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[5] = v29;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v32))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    Swift::String v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(1);
    Swift::String v18 = createStorage<A>(capacity:type:)(0);
    Swift::String v33 = buf;
    uint64_t v34 = v17;
    char v35 = v18;
    serialize(_:at:)(2, &v33);
    serialize(_:at:)(1, &v33);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    char v37 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    char v37 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    char v37 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    _os_log_impl(&dword_255CF7000, oslog, v32, "Failed to write wifi data with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v17, 1, v15);
    destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v11 = (id)v19[159];
  uint64_t v9 = v19[142];
  uint64_t v10 = v19[140];
  uint64_t v8 = v19[141];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  uint64_t v13 = v19[152];
  uint64_t v14 = v19[150];
  uint64_t v12 = v19[151];
  outlined release of WiFiDataPointForWriting((uint64_t)(v19 + 2));
  swift_bridgeObjectRelease();
  outlined destroy of String();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v19[110] + 8);
  return v6();
}

void *implicit closure #11 in MediaML.writeWifiData(data:)(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t MediaML.writeCellData(data:)(uint64_t a1)
{
  *(void *)(v2 + 1128) = v1;
  *(void *)(v2 + 1120) = a1;
  *(void *)(v2 + 944) = v2;
  *(void *)(v2 + 952) = 0;
  *(void *)(v2 + 960) = 0;
  *(void *)(v2 + 984) = 0;
  *(void *)(v2 + 576) = 0;
  *(void *)(v2 + 584) = 0;
  *(void *)(v2 + 608) = 0;
  *(void *)(v2 + 616) = 0;
  *(void *)(v2 + 992) = 0;
  *(void *)(v2 + 640) = 0;
  *(void *)(v2 + 648) = 0;
  *(void *)(v2 + 1000) = 0;
  *(void *)(v2 + 1008) = 0;
  *(void *)(v2 + 848) = 0;
  *(unsigned char *)(v2 + 856) = 0;
  *(void *)(v2 + 864) = 0;
  *(unsigned char *)(v2 + 872) = 0;
  *(void *)(v2 + 880) = 0;
  *(unsigned char *)(v2 + 888) = 0;
  *(void *)(v2 + 896) = 0;
  *(unsigned char *)(v2 + 904) = 0;
  *(void *)(v2 + 912) = 0;
  *(unsigned char *)(v2 + 920) = 0;
  *(void *)(v2 + 928) = 0;
  *(unsigned char *)(v2 + 936) = 0;
  *(void *)(v2 + 1016) = 0;
  uint64_t v3 = type metadata accessor for Logger();
  *(void *)(v2 + 1136) = v3;
  *(void *)(v2 + 1144) = *(void *)(v3 - 8);
  *(void *)(v2 + 1152) = swift_task_alloc();
  *(void *)(v2 + 1160) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Calendar.Component();
  *(void *)(v2 + 1168) = v4;
  *(void *)(v2 + 1176) = *(void *)(v4 - 8);
  *(void *)(v2 + 1184) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Calendar();
  *(void *)(v2 + 1192) = v5;
  *(void *)(v2 + 1200) = *(void *)(v5 - 8);
  *(void *)(v2 + 1208) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  *(void *)(v2 + 1216) = v6;
  *(void *)(v2 + 1224) = *(void *)(v6 - 8);
  *(void *)(v2 + 1232) = swift_task_alloc();
  *(void *)(v2 + 952) = a1;
  *(void *)(v2 + 960) = v8;
  return MEMORY[0x270FA2498](MediaML.writeCellData(data:), v8, 0);
}

uint64_t MediaML.writeCellData(data:)()
{
  uint64_t v67 = v0[141];
  v0[118] = v0;
  swift_beginAccess();
  uint64_t v68 = *(void *)(v67 + 112);
  swift_retain();
  swift_endAccess();
  v0[121] = v68;
  if (v0[121])
  {
    outlined destroy of DataWriter?();
    Date.init()();
    Swift::String v65 = *kMediaML_throughputTrue.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 544) = v65;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (!*(void *)(v66 + 200)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    outlined init with take of Any(v66 + 176, v66 + 144);
    swift_dynamicCast();
    Swift::Double throughputTrue = *(double *)(v66 + 976);
    *(Swift::Double *)(v66 + 984) = throughputTrue;
    Swift::String v64 = *kMediaML_sessionID.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 560) = v64;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 232))
    {
      if (swift_dynamicCast())
      {
        uint64_t v61 = *(void *)(v66 + 832);
        uint64_t v62 = *(void *)(v66 + 840);
      }
      else
      {
        uint64_t v61 = 0;
        uint64_t v62 = 0;
      }
      uint64_t v59 = v61;
      uint64_t v60 = v62;
    }
    else
    {
      outlined destroy of Any?(v66 + 208);
      uint64_t v59 = 0;
      uint64_t v60 = 0;
    }
    *(void *)(v66 + 1240) = v60;
    *(void *)(v66 + 576) = v59;
    *(void *)(v66 + 584) = v60;
    Swift::String v58 = *kMediaML_carrier.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 592) = v58;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 264))
    {
      if (swift_dynamicCast())
      {
        uint64_t v56 = *(void *)(v66 + 816);
        uint64_t v57 = *(void *)(v66 + 824);
      }
      else
      {
        uint64_t v56 = 0;
        uint64_t v57 = 0;
      }
      uint64_t v54 = v56;
      uint64_t v55 = v57;
    }
    else
    {
      outlined destroy of Any?(v66 + 240);
      uint64_t v54 = 0;
      uint64_t v55 = 0;
    }
    *(void *)(v66 + 1248) = v55;
    *(void *)(v66 + 608) = v54;
    *(void *)(v66 + 616) = v55;
    Date.timeIntervalSince1970.getter();
    Swift::Double timestamp = v3;
    *(double *)(v66 + 992) = v3;
    Swift::String v53 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 624) = v53;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 296))
    {
      if (swift_dynamicCast())
      {
        uint64_t v50 = *(void *)(v66 + 800);
        uint64_t v51 = *(void *)(v66 + 808);
      }
      else
      {
        uint64_t v50 = 0;
        uint64_t v51 = 0;
      }
      uint64_t v48 = v50;
      uint64_t v49 = v51;
    }
    else
    {
      outlined destroy of Any?(v66 + 272);
      uint64_t v48 = 0;
      uint64_t v49 = 0;
    }
    *(void *)(v66 + 1256) = v49;
    uint64_t v43 = *(void *)(v66 + 1208);
    uint64_t v44 = *(void *)(v66 + 1192);
    uint64_t v42 = *(void *)(v66 + 1184);
    uint64_t v40 = *(void *)(v66 + 1168);
    uint64_t v37 = *(void *)(v66 + 1200);
    uint64_t v36 = *(void *)(v66 + 1176);
    *(void *)(v66 + 640) = v48;
    *(void *)(v66 + 648) = v49;
    static Calendar.current.getter();
    uint64_t v39 = *(void (**)(uint64_t, void, uint64_t))(v36 + 104);
    v39(v42, *MEMORY[0x263F07890], v40);
    uint64_t hour = Calendar.component(_:from:)();
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v41(v42, v40);
    char v45 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v45(v43, v44);
    *(void *)(v66 + 1000) = hour;
    static Calendar.current.getter();
    v39(v42, *MEMORY[0x263F078E8], v40);
    uint64_t dow = Calendar.component(_:from:)();
    v41(v42, v40);
    v45(v43, v44);
    *(void *)(v66 + 1008) = dow;
    Swift::String v47 = *kMediaML_rssi.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 656) = v47;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 328))
    {
      if (swift_dynamicCast())
      {
        uint64_t v34 = *(void *)(v66 + 1112);
        char v35 = 0;
      }
      else
      {
        uint64_t v34 = 0;
        char v35 = 1;
      }
      uint64_t v32 = v34;
      char v33 = v35;
    }
    else
    {
      outlined destroy of Any?(v66 + 304);
      uint64_t v32 = 0;
      char v33 = 1;
    }
    *(void *)(v66 + 848) = v32;
    *(unsigned char *)(v66 + 856) = v33 & 1;
    Swift::String v31 = *kMediaML_rsrp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 672) = v31;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 360))
    {
      if (swift_dynamicCast())
      {
        uint64_t v29 = *(void *)(v66 + 1104);
        char v30 = 0;
      }
      else
      {
        uint64_t v29 = 0;
        char v30 = 1;
      }
      uint64_t v27 = v29;
      char v28 = v30;
    }
    else
    {
      outlined destroy of Any?(v66 + 336);
      uint64_t v27 = 0;
      char v28 = 1;
    }
    *(void *)(v66 + 864) = v27;
    *(unsigned char *)(v66 + 872) = v28 & 1;
    Swift::String v26 = *kMediaML_rsrq.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 688) = v26;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 392))
    {
      if (swift_dynamicCast())
      {
        uint64_t v24 = *(void *)(v66 + 1096);
        char v25 = 0;
      }
      else
      {
        uint64_t v24 = 0;
        char v25 = 1;
      }
      uint64_t v22 = v24;
      char v23 = v25;
    }
    else
    {
      outlined destroy of Any?(v66 + 368);
      uint64_t v22 = 0;
      char v23 = 1;
    }
    *(void *)(v66 + 880) = v22;
    *(unsigned char *)(v66 + 888) = v23 & 1;
    Swift::String v21 = *kMediaML_rscp.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 704) = v21;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 424))
    {
      if (swift_dynamicCast())
      {
        uint64_t v19 = *(void *)(v66 + 1088);
        char v20 = 0;
      }
      else
      {
        uint64_t v19 = 0;
        char v20 = 1;
      }
      uint64_t v17 = v19;
      char v18 = v20;
    }
    else
    {
      outlined destroy of Any?(v66 + 400);
      uint64_t v17 = 0;
      char v18 = 1;
    }
    *(void *)(v66 + 896) = v17;
    *(unsigned char *)(v66 + 904) = v18 & 1;
    Swift::String v16 = *kMediaML_snr.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 720) = v16;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 456))
    {
      if (swift_dynamicCast())
      {
        double v14 = *(double *)(v66 + 1080);
        char v15 = 0;
      }
      else
      {
        double v14 = 0.0;
        char v15 = 1;
      }
      double v12 = v14;
      char v13 = v15;
    }
    else
    {
      outlined destroy of Any?(v66 + 432);
      double v12 = 0.0;
      char v13 = 1;
    }
    *(double *)(v66 + 912) = v12;
    *(unsigned char *)(v66 + 920) = v13 & 1;
    Swift::String v11 = *kMediaML_bars.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    *(Swift::String *)(v66 + 736) = v11;
    MEMORY[0x25A298290]();
    outlined destroy of String();
    if (*(void *)(v66 + 488))
    {
      if (swift_dynamicCast())
      {
        uint64_t v9 = *(void *)(v66 + 1072);
        char v10 = 0;
      }
      else
      {
        uint64_t v9 = 0;
        char v10 = 1;
      }
      uint64_t v7 = v9;
      char v8 = v10;
    }
    else
    {
      outlined destroy of Any?(v66 + 464);
      uint64_t v7 = 0;
      char v8 = 1;
    }
    *(void *)(v66 + 928) = v7;
    *(unsigned char *)(v66 + 936) = v8 & 1;
    swift_bridgeObjectRetain();
    *(void *)(v66 + 752) = v59;
    *(void *)(v66 + 760) = v60;
    if (*(void *)(v66 + 760))
    {
      Swift::String v69 = *(Swift::String *)(v66 + 752);
    }
    else
    {
      Swift::String v69 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    swift_bridgeObjectRetain();
    *(void *)(v66 + 768) = v48;
    *(void *)(v66 + 776) = v49;
    if (*(void *)(v66 + 776))
    {
      Swift::String v70 = *(Swift::String *)(v66 + 768);
    }
    else
    {
      Swift::String v70 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    swift_bridgeObjectRetain();
    *(void *)(v66 + 784) = v54;
    *(void *)(v66 + 792) = v55;
    if (*(void *)(v66 + 792))
    {
      Swift::String v71 = *(Swift::String *)(v66 + 784);
    }
    else
    {
      Swift::String v71 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      outlined destroy of String?();
    }
    rssuint64_t i = (v33 & 1) != 0 ? 0 : v32;
    Swift::Int rsrp = (v28 & 1) != 0 ? 0 : v27;
    Swift::Int rscp = (v18 & 1) != 0 ? 0 : v17;
    Swift::Int rsrq = (v23 & 1) != 0 ? 0 : v22;
    Swift::Double v76 = (v13 & 1) != 0 ? 0.0 : v12;
    Swift::Int bars = (v8 & 1) != 0 ? 0 : v7;
    uint64_t v5 = *(void *)(v66 + 1128);
    CellDataPointForWriting.init(sessionID:timestamp:appName:carrier:hour:dow:rssi:rsrp:rscp:rsrq:snr:bars:throughputTrue:)((MediaML::CellDataPointForWriting *)(v66 + 16), v69, timestamp, v70, v71, hour, dow, rssi, rsrp, rscp, rsrq, v76, bars, throughputTrue);
    swift_beginAccess();
    uint64_t v6 = *(void *)(v5 + 112);
    *(void *)(v66 + 1264) = v6;
    swift_retain();
    swift_endAccess();
    if (v6)
    {
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v66 + 1272) = v4;
      *uint64_t v4 = *(void *)(v66 + 944);
      v4[1] = MediaML.writeCellData(data:);
      return DataWriter.writeRawDataForCell(data:)((void *)(v66 + 16));
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v66 + 944) + 8);
    return v1();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v1;
  uint64_t v6 = *v1 + 16;
  *(void *)(v7 + 944) = *v1;
  *(void *)(v7 + 1280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = *(void *)(v6 + 1112);
    double v3 = MediaML.writeCellData(data:);
  }
  else
  {
    uint64_t v5 = *(void *)(v6 + 1112);
    swift_release();
    uint64_t v2 = v5;
    double v3 = MediaML.writeCellData(data:);
  }
  return MEMORY[0x270FA2498](v3, v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t size;
  os_log_type_t v21;
  NSObject *oslog;
  uint64_t v23;
  uint64_t v24;

  uint64_t v1 = *(void *)(v0 + 1160);
  char v18 = *(void *)(v0 + 1144);
  uint64_t v19 = *(void *)(v0 + 1136);
  *(void *)(v0 + 944) = v0;
  uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v1, v2, v19);
  oslog = Logger.logObject.getter();
  Swift::String v21 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 1032) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(unsigned int *)(v0 + 876);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  char v23 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v21))
  {
    double v3 = *(void *)(v17 + 1280);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    double v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    double v14 = createStorage<A>(capacity:type:)(0);
    char v15 = createStorage<A>(capacity:type:)(0);
    *(void *)(v17 + 1040) = buf;
    *(void *)(v17 + 1048) = v14;
    *(void *)(v17 + 1056) = v15;
    serialize(_:at:)(0, (unsigned char **)(v17 + 1040));
    serialize(_:at:)(0, (unsigned char **)(v17 + 1040));
    *(void *)(v17 + 1064) = v23;
    Swift::String v16 = (void *)swift_task_alloc();
    v16[2] = v17 + 1040;
    v16[3] = v17 + 1048;
    v16[4] = v17 + 1056;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_255CF7000, oslog, v21, "Cell Data write to disk finished", buf, size);
    destroyStorage<A>(_:count:)(v14, 0, v12);
    destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = *(void *)(v17 + 1160);
  char v8 = *(void *)(v17 + 1136);
  uint64_t v6 = *(void *)(v17 + 1144);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  char v10 = *(void *)(v17 + 1232);
  Swift::String v11 = *(void *)(v17 + 1216);
  uint64_t v9 = *(void *)(v17 + 1224);
  outlined release of CellDataPointForWriting(v17 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v17 + 944) + 8);
  return v5();
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *oslog;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  Swift::String v38 = v0;
  uint64_t v22 = *(id *)(v0 + 1280);
  uint64_t v1 = *(void *)(v0 + 1152);
  char v20 = *(void *)(v0 + 1144);
  Swift::String v21 = *(void *)(v0 + 1136);
  *(void *)(v0 + 944) = v0;
  swift_release();
  uint64_t v2 = v22;
  *(void *)(v0 + 1016) = v22;
  double v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v1, v3, v21);
  uint64_t v4 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  oslog = Logger.logObject.getter();
  uint64_t v32 = static os_log_type_t.error.getter();
  *(void *)(v0 + 1024) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 860);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 64;
  char v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = 8;
  char v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #10 in MediaML.writeCellData(data:);
  *(void *)(v25 + 24) = v24;
  Swift::String v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v25;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v29 + 24) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  char v30 = v5;
  swift_retain();
  *char v30 = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[1] = v27;
  swift_retain();
  v30[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[3] = v28;
  swift_retain();
  v30[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v30[5] = v29;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v32))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    char v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(1);
    char v18 = createStorage<A>(capacity:type:)(0);
    char v33 = buf;
    uint64_t v34 = v17;
    char v35 = v18;
    serialize(_:at:)(2, &v33);
    serialize(_:at:)(1, &v33);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    uint64_t v36 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v37 = v29;
    closure #1 in osLogInternal(_:log:type:)(&v36, (uint64_t)&v33, (uint64_t)&v34, (uint64_t)&v35);
    _os_log_impl(&dword_255CF7000, oslog, v32, "Failed to write cell data with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v17, 1, v15);
    destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  Swift::String v11 = (id)v19[160];
  uint64_t v9 = v19[144];
  char v10 = v19[142];
  char v8 = v19[143];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  char v13 = v19[154];
  double v14 = v19[152];
  double v12 = v19[153];
  outlined release of CellDataPointForWriting((uint64_t)(v19 + 2));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v19[118] + 8);
  return v6();
}

void *implicit closure #10 in MediaML.writeCellData(data:)(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t MediaML.writeData(data:)(uint64_t a1)
{
  v2[23] = v1;
  v2[22] = a1;
  v2[14] = v2;
  v2[15] = 0;
  v2[16] = 0;
  v2[17] = 0;
  v2[19] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[24] = v3;
  v2[25] = *(void *)(v3 - 8);
  v2[26] = swift_task_alloc();
  v2[15] = a1;
  v2[16] = v5;
  return MEMORY[0x270FA2498](MediaML.writeData(data:), v5, 0);
}

uint64_t MediaML.writeData(data:)()
{
  v0[7]._uint64_t countAndFlagsBits = (uint64_t)v0;
  Swift::String v9 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v0[5] = v9;
  MEMORY[0x25A298290]();
  outlined destroy of String();
  if (v0[2]._object)
  {
    if (swift_dynamicCast())
    {
      uint64_t v6 = v8[21];
      char v7 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      char v7 = 1;
    }
    uint64_t v4 = v6;
    char v5 = v7;
  }
  else
  {
    outlined destroy of Any?((uint64_t)(v8 + 2));
    uint64_t v4 = 0;
    char v5 = 1;
  }
  v8[27] = v4;
  if (v5)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v8[14] + 8);
    return v3();
  }
  else
  {
    v8[17] = v4;
    uint64_t v1 = (void *)swift_task_alloc();
    v8[28] = v1;
    *uint64_t v1 = v8[14];
    v1[1] = MediaML.writeData(data:);
    return MediaML.ensureDataWriter()();
  }
}

{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *(void *)(*(void *)v0 + 184);
  *(void *)(*(void *)v0 + 112) = *(void *)v0;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MediaML.writeData(data:), v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  double v12;
  char v13;
  double v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint8_t *buf;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint32_t size;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v49 = v0;
  uint64_t v29 = *(void *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 208);
  char v25 = *(void *)(v0 + 200);
  Swift::String v26 = *(void *)(v0 + 192);
  uint64_t v27 = *(void *)(v0 + 176);
  *(void *)(v0 + 112) = v0;
  uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v1, v2, v26);
  swift_bridgeObjectRetain();
  char v28 = swift_allocObject();
  *(void *)(v28 + 16) = v27;
  swift_retain();
  Swift::String v31 = swift_allocObject();
  *(void *)(v31 + 16) = partial apply for implicit closure #1 in MediaML.writeData(data:);
  *(void *)(v31 + 24) = v28;
  swift_release();
  char v33 = swift_allocObject();
  *(void *)(v33 + 16) = v29;
  uint64_t v42 = Logger.logObject.getter();
  uint64_t v43 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 144) = 22;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 248);
  char v35 = swift_allocObject();
  *(unsigned char *)(v35 + 16) = 32;
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36 + 16) = 8;
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_0;
  *(void *)(v32 + 24) = v31;
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_1;
  *(void *)(v37 + 24) = v32;
  Swift::String v38 = swift_allocObject();
  *(unsigned char *)(v38 + 16) = 0;
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = 8;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = partial apply for implicit closure #2 in MediaML.writeData(data:);
  *(void *)(v34 + 24) = v33;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v40 + 24) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v41 = v3;
  swift_retain();
  *uint64_t v41 = closure #1 in OSLogArguments.append(_:)partial apply;
  v41[1] = v35;
  swift_retain();
  v41[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v41[3] = v36;
  swift_retain();
  v41[4] = _s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
  v41[5] = v37;
  swift_retain();
  v41[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v41[7] = v38;
  swift_retain();
  v41[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v41[9] = v39;
  swift_retain();
  v41[10] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v41[11] = v40;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v42, v43))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    char v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    char v23 = createStorage<A>(capacity:type:)(1);
    uint64_t v44 = buf;
    char v45 = v22;
    uint64_t v46 = v23;
    serialize(_:at:)(2, &v44);
    serialize(_:at:)(2, &v44);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v48 = v35;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v48 = v36;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1;
    uint64_t v48 = v37;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v48 = v38;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v48 = v39;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    Swift::String v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v48 = v40;
    closure #1 in osLogInternal(_:log:type:)(&v47, (uint64_t)&v44, (uint64_t)&v45, (uint64_t)&v46);
    _os_log_impl(&dword_255CF7000, v42, v43, "Got data to write to SQL %s for interface=%ld", buf, size);
    destroyStorage<A>(_:count:)(v22, 0, v20);
    destroyStorage<A>(_:count:)(v23, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v17 = *(void *)(v24 + 208);
  char v18 = *(void *)(v24 + 192);
  Swift::String v16 = *(void *)(v24 + 200);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  uint64_t v19 = *kMediaML_throughputTrue.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  *(Swift::String *)(v24 + 96) = v19;
  MEMORY[0x25A298290]();
  outlined destroy of String();
  if (*(void *)(v24 + 72))
  {
    if (swift_dynamicCast())
    {
      double v14 = *(double *)(v24 + 160);
      char v15 = 0;
    }
    else
    {
      double v14 = 0.0;
      char v15 = 1;
    }
    double v12 = v14;
    char v13 = v15;
  }
  else
  {
    outlined destroy of Any?(v24 + 48);
    double v12 = 0.0;
    char v13 = 1;
  }
  if (v13) {
    goto LABEL_22;
  }
  *(double *)(v24 + 152) = v12;
  if (v12 <= 0.0) {
    goto LABEL_22;
  }
  Swift::String v11 = *(void *)(v24 + 216);
  if (v11 == *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor())
  {
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v24 + 232) = v4;
    *uint64_t v4 = *(void *)(v24 + 112);
    v4[1] = MediaML.writeData(data:);
    char v5 = *(void *)(v24 + 176);
    return MediaML.writeWifiData(data:)(v5);
  }
  uint64_t v10 = *(void *)(v24 + 216);
  if (v10 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
LABEL_22:
    swift_task_dealloc();
    Swift::String v9 = *(uint64_t (**)(void))(*(void *)(v24 + 112) + 8);
    return v9();
  }
  else
  {
    char v7 = (void *)swift_task_alloc();
    *(void *)(v24 + 240) = v7;
    *char v7 = *(void *)(v24 + 112);
    v7[1] = MediaML.writeData(data:);
    char v8 = *(void *)(v24 + 176);
    return MediaML.writeCellData(data:)(v8);
  }
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  *(void *)(v3 + 112) = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 112) + 8);
  return v1();
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  *(void *)(v3 + 112) = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v3 + 112) + 8);
  return v1();
}

uint64_t implicit closure #1 in MediaML.writeData(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

uint64_t MediaML.validateWifiDataForPrediction(data:)(uint64_t a1)
{
  uint64_t v222 = a1;
  uint64_t v199 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v200 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v201 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v202 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v203 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v204 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v270 = 0;
  uint64_t v269 = 0;
  uint64_t v205 = 0;
  uint64_t v206 = type metadata accessor for Logger();
  uint64_t v207 = *(void *)(v206 - 8);
  uint64_t v208 = v206 - 8;
  unint64_t v209 = (*(void *)(v207 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v222);
  uint64_t v210 = (char *)&v50 - v209;
  unint64_t v211 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v212 = (char *)&v50 - v211;
  unint64_t v213 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v214 = (char *)&v50 - v213;
  unint64_t v215 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v216 = (char *)&v50 - v215;
  unint64_t v217 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v218 = (char *)&v50 - v217;
  unint64_t v219 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v220 = (char *)&v50 - v219;
  uint64_t v270 = v12;
  uint64_t v269 = v1;
  Swift::String v221 = *kMediaML_ssid.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v223 = &v267;
  Swift::String v267 = v221;
  MEMORY[0x25A298290](v268);
  outlined destroy of String();
  if (v268[3])
  {
    if (swift_dynamicCast()) {
      uint64_t v198 = v224;
    }
    else {
      uint64_t v198 = 0;
    }
    uint64_t v197 = v198;
  }
  else
  {
    uint64_t v70 = 0;
    outlined destroy of Any?((uint64_t)v268);
    uint64_t v197 = v70;
  }
  uint64_t v196 = v197;
  if (v197)
  {
    uint64_t v195 = v196;
    swift_bridgeObjectRelease();
    Swift::String v193 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    unint64_t v194 = &v260;
    Swift::String v260 = v193;
    MEMORY[0x25A298290](v261);
    outlined destroy of String();
    if (v261[3])
    {
      if (swift_dynamicCast()) {
        uint64_t v192 = v225;
      }
      else {
        uint64_t v192 = 0;
      }
      uint64_t v191 = v192;
    }
    else
    {
      uint64_t v91 = 0;
      outlined destroy of Any?((uint64_t)v261);
      uint64_t v191 = v91;
    }
    uint64_t v190 = v191;
    if (v191)
    {
      uint64_t v189 = v190;
      swift_bridgeObjectRelease();
      Swift::String v187 = *kMediaML_rssi.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      uint64_t v188 = &v253;
      Swift::String v253 = v187;
      MEMORY[0x25A298290](v254);
      outlined destroy of String();
      if (v254[3])
      {
        BOOL v186 = (swift_dynamicCast() & 1) == 0;
        int v185 = v186;
      }
      else
      {
        outlined destroy of Any?((uint64_t)v254);
        int v185 = 1;
      }
      if (v185)
      {
        Swift::String v31 = v214;
        uint64_t v32 = MediaML.logger.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v31, v32, v206);
        uint64_t v110 = Logger.logObject.getter();
        int v109 = static os_log_type_t.error.getter();
        uint64_t v107 = &v251;
        uint64_t v251 = 2;
        unint64_t v105 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v106 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v108 = v252;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v111 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v110, (os_log_type_t)v109))
        {
          uint64_t v33 = v205;
          uint64_t v95 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v94 = 0;
          uint64_t v96 = createStorage<A>(capacity:type:)(0);
          uint64_t v97 = createStorage<A>(capacity:type:)(v94);
          uint64_t v101 = &v250;
          unint64_t v250 = v95;
          uint64_t v102 = &v249;
          uint64_t v249 = v96;
          int v99 = &v248;
          uint64_t v248 = v97;
          unsigned int v98 = 0;
          serialize(_:at:)(0, &v250);
          serialize(_:at:)(v98, v101);
          void v247[4] = v111;
          uint32_t v100 = &v50;
          MEMORY[0x270FA5388](&v50);
          uint64_t v34 = v102;
          char v35 = &v50 - 6;
          uint64_t v103 = &v50 - 6;
          v35[2] = (uint64_t)v101;
          v35[3] = (uint64_t)v34;
          v35[4] = v36;
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v33)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_255CF7000, v110, (os_log_type_t)v109, "rssi in data dictionary is not of expected type Int", v95, v108);
            uint64_t v92 = 0;
            destroyStorage<A>(_:count:)(v96, 0, v93);
            destroyStorage<A>(_:count:)(v97, v92, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x25A298650](v95, MEMORY[0x263F8E778]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v207 + 8))(v214, v206);
        return 0;
      }
      else
      {
        Swift::String v183 = *kMediaML_noise.unsafeMutableAddressor();
        swift_bridgeObjectRetain();
        uint64_t v184 = &v246;
        Swift::String v246 = v183;
        MEMORY[0x25A298290](v247);
        outlined destroy of String();
        if (v247[3])
        {
          BOOL v182 = (swift_dynamicCast() & 1) == 0;
          int v181 = v182;
        }
        else
        {
          outlined destroy of Any?((uint64_t)v247);
          int v181 = 1;
        }
        if (v181)
        {
          char v25 = v216;
          uint64_t v26 = MediaML.logger.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v25, v26, v206);
          uint64_t v130 = Logger.logObject.getter();
          int v129 = static os_log_type_t.error.getter();
          unint64_t v127 = &v244;
          uint64_t v244 = 2;
          unint64_t v125 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v126 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v128 = v245;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v131 = _allocateUninitializedArray<A>(_:)();
          if (os_log_type_enabled(v130, (os_log_type_t)v129))
          {
            uint64_t v27 = v205;
            uint64_t v115 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v114 = 0;
            uint64_t v116 = createStorage<A>(capacity:type:)(0);
            uint64_t v117 = createStorage<A>(capacity:type:)(v114);
            uint64_t v121 = &v243;
            uint64_t v243 = v115;
            v122 = &v242;
            uint64_t v242 = v116;
            uint64_t v119 = &v241;
            uint64_t v241 = v117;
            unsigned int v118 = 0;
            serialize(_:at:)(0, &v243);
            serialize(_:at:)(v118, v121);
            v240[4] = v131;
            uint64_t v120 = &v50;
            MEMORY[0x270FA5388](&v50);
            char v28 = v122;
            uint64_t v29 = &v50 - 6;
            uint64_t v123 = &v50 - 6;
            v29[2] = (uint64_t)v121;
            v29[3] = (uint64_t)v28;
            v29[4] = v30;
            uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
            lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
            Sequence.forEach(_:)();
            if (v27)
            {
              __break(1u);
            }
            else
            {
              _os_log_impl(&dword_255CF7000, v130, (os_log_type_t)v129, "noise in data dictionary is not of expected type Double", v115, v128);
              uint64_t v112 = 0;
              destroyStorage<A>(_:count:)(v116, 0, v113);
              destroyStorage<A>(_:count:)(v117, v112, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x25A298650](v115, MEMORY[0x263F8E778]);
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          (*(void (**)(char *, uint64_t))(v207 + 8))(v216, v206);
          return 0;
        }
        else
        {
          Swift::String v179 = *kMediaML_rxRate.unsafeMutableAddressor();
          swift_bridgeObjectRetain();
          v180 = &v239;
          Swift::String v239 = v179;
          MEMORY[0x25A298290](v240);
          outlined destroy of String();
          if (v240[3])
          {
            BOOL v178 = (swift_dynamicCast() & 1) == 0;
            int v177 = v178;
          }
          else
          {
            outlined destroy of Any?((uint64_t)v240);
            int v177 = 1;
          }
          if (v177)
          {
            uint64_t v19 = v218;
            uint64_t v20 = MediaML.logger.unsafeMutableAddressor();
            (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v19, v20, v206);
            Swift::Int v150 = Logger.logObject.getter();
            int v149 = static os_log_type_t.error.getter();
            Swift::Int v147 = &v237;
            uint64_t v237 = 2;
            unint64_t v145 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            unint64_t v146 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
            lazy protocol witness table accessor for type Int and conformance Int();
            UnsignedInteger<>.init<A>(_:)();
            uint32_t v148 = v238;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
            uint64_t v151 = _allocateUninitializedArray<A>(_:)();
            if (os_log_type_enabled(v150, (os_log_type_t)v149))
            {
              uint64_t v21 = v205;
              uint64_t v135 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
              uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
              uint64_t v134 = 0;
              uint64_t v136 = createStorage<A>(capacity:type:)(0);
              uint64_t v137 = createStorage<A>(capacity:type:)(v134);
              uint64_t v141 = &v236;
              v236 = v135;
              int v142 = &v235;
              uint64_t v235 = v136;
              uint64_t v139 = &v234;
              uint64_t v234 = v137;
              unsigned int v138 = 0;
              serialize(_:at:)(0, &v236);
              serialize(_:at:)(v138, v141);
              v233[4] = v151;
              uint64_t v140 = &v50;
              MEMORY[0x270FA5388](&v50);
              uint64_t v22 = v142;
              char v23 = &v50 - 6;
              uint64_t v143 = &v50 - 6;
              v23[2] = (uint64_t)v141;
              v23[3] = (uint64_t)v22;
              v23[4] = v24;
              uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
              lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
              Sequence.forEach(_:)();
              if (v21)
              {
                __break(1u);
              }
              else
              {
                _os_log_impl(&dword_255CF7000, v150, (os_log_type_t)v149, "rxRate in data dictionary is not of expected type Double", v135, v148);
                uint64_t v132 = 0;
                destroyStorage<A>(_:count:)(v136, 0, v133);
                destroyStorage<A>(_:count:)(v137, v132, MEMORY[0x263F8EE58] + 8);
                MEMORY[0x25A298650](v135, MEMORY[0x263F8E778]);
                swift_bridgeObjectRelease();
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            (*(void (**)(char *, uint64_t))(v207 + 8))(v218, v206);
            return 0;
          }
          else
          {
            Swift::String v175 = *kMediaML_txRate.unsafeMutableAddressor();
            swift_bridgeObjectRetain();
            uint64_t v176 = &v232;
            Swift::String v232 = v175;
            MEMORY[0x25A298290](v233);
            outlined destroy of String();
            if (v233[3])
            {
              BOOL v174 = (swift_dynamicCast() & 1) == 0;
              int v173 = v174;
            }
            else
            {
              outlined destroy of Any?((uint64_t)v233);
              int v173 = 1;
            }
            if (v173)
            {
              char v13 = v220;
              uint64_t v14 = MediaML.logger.unsafeMutableAddressor();
              (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v13, v14, v206);
              uint64_t v170 = Logger.logObject.getter();
              int v169 = static os_log_type_t.error.getter();
              v167 = &v230;
              uint64_t v230 = 2;
              unint64_t v165 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              unint64_t v166 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
              lazy protocol witness table accessor for type Int and conformance Int();
              UnsignedInteger<>.init<A>(_:)();
              uint32_t v168 = v231;
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
              uint64_t v171 = _allocateUninitializedArray<A>(_:)();
              if (os_log_type_enabled(v170, (os_log_type_t)v169))
              {
                uint64_t v15 = v205;
                uint64_t v155 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
                uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                uint64_t v154 = 0;
                uint64_t v156 = createStorage<A>(capacity:type:)(0);
                uint64_t v157 = createStorage<A>(capacity:type:)(v154);
                int v161 = &v229;
                uint64_t v229 = v155;
                Swift::String v162 = &v228;
                uint64_t v228 = v156;
                uint64_t v159 = &v227;
                uint64_t v227 = v157;
                unsigned int v158 = 0;
                serialize(_:at:)(0, &v229);
                serialize(_:at:)(v158, v161);
                uint64_t v226 = v171;
                uint64_t v160 = &v50;
                MEMORY[0x270FA5388](&v50);
                Swift::String v16 = v162;
                uint64_t v17 = &v50 - 6;
                uint64_t v163 = &v50 - 6;
                v17[2] = (uint64_t)v161;
                v17[3] = (uint64_t)v16;
                v17[4] = v18;
                uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
                lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
                Sequence.forEach(_:)();
                if (v15)
                {
                  __break(1u);
                }
                else
                {
                  _os_log_impl(&dword_255CF7000, v170, (os_log_type_t)v169, "txRate in data dictionary is not of expected type Double", v155, v168);
                  uint64_t v152 = 0;
                  destroyStorage<A>(_:count:)(v156, 0, v153);
                  destroyStorage<A>(_:count:)(v157, v152, MEMORY[0x263F8EE58] + 8);
                  MEMORY[0x25A298650](v155, MEMORY[0x263F8E778]);
                  swift_bridgeObjectRelease();
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }

              (*(void (**)(char *, uint64_t))(v207 + 8))(v220, v206);
              return 0;
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v37 = v212;
      uint64_t v38 = MediaML.logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v37, v38, v206);
      Swift::Double v89 = Logger.logObject.getter();
      int v88 = static os_log_type_t.error.getter();
      int v86 = &v258;
      uint64_t v258 = 2;
      unint64_t v84 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v85 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v87 = v259;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v90 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v89, (os_log_type_t)v88))
      {
        uint64_t v39 = v205;
        uint64_t v74 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v73 = 0;
        uint64_t v75 = createStorage<A>(capacity:type:)(0);
        uint64_t v76 = createStorage<A>(capacity:type:)(v73);
        uint64_t v80 = &v257;
        uint64_t v257 = v74;
        Swift::String v81 = &v256;
        uint64_t v256 = v75;
        uint64_t v78 = &v255;
        uint64_t v255 = v76;
        unsigned int v77 = 0;
        serialize(_:at:)(0, &v257);
        serialize(_:at:)(v77, v80);
        v254[4] = v90;
        uint64_t v79 = &v50;
        MEMORY[0x270FA5388](&v50);
        uint64_t v40 = v81;
        uint64_t v41 = &v50 - 6;
        Swift::String v82 = &v50 - 6;
        v41[2] = (uint64_t)v80;
        v41[3] = (uint64_t)v40;
        v41[4] = v42;
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v39)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_255CF7000, v89, (os_log_type_t)v88, "appName in data dictionary is not of expected type String", v74, v87);
          uint64_t v71 = 0;
          destroyStorage<A>(_:count:)(v75, 0, v72);
          destroyStorage<A>(_:count:)(v76, v71, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A298650](v74, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v207 + 8))(v212, v206);
      return 0;
    }
  }
  else
  {
    uint64_t v43 = v210;
    uint64_t v44 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v207 + 16))(v43, v44, v206);
    uint64_t v68 = Logger.logObject.getter();
    int v67 = static os_log_type_t.error.getter();
    Swift::String v65 = &v265;
    uint64_t v265 = 2;
    unint64_t v63 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v66 = v266;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v69 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v68, (os_log_type_t)v67))
    {
      uint64_t v45 = v205;
      Swift::String v53 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v52 = 0;
      uint64_t v54 = createStorage<A>(capacity:type:)(0);
      uint64_t v55 = createStorage<A>(capacity:type:)(v52);
      uint64_t v59 = &v264;
      v264 = v53;
      uint64_t v60 = &v263;
      uint64_t v263 = v54;
      uint64_t v57 = &v262;
      uint64_t v262 = v55;
      unsigned int v56 = 0;
      serialize(_:at:)(0, &v264);
      serialize(_:at:)(v56, v59);
      v261[4] = v69;
      Swift::String v58 = &v50;
      MEMORY[0x270FA5388](&v50);
      uint64_t v46 = v60;
      Swift::String v47 = &v50 - 6;
      uint64_t v61 = &v50 - 6;
      v47[2] = (uint64_t)v59;
      v47[3] = (uint64_t)v46;
      uint64_t v47[4] = v48;
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v45)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_255CF7000, v68, (os_log_type_t)v67, "ssid in data dictionary is not of expected type String", v53, v66);
        uint64_t v50 = 0;
        destroyStorage<A>(_:count:)(v54, 0, v51);
        destroyStorage<A>(_:count:)(v55, v50, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v53, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v207 + 8))(v210, v206);
    return 0;
  }
}

void *MediaML.prepareWifiDataForPrediction(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v81 = a1;
  uint64_t v52 = "Fatal error";
  Swift::String v53 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v54 = "MediaML/MediaML.swift";
  uint64_t v121 = 0;
  uint64_t v120 = 0;
  uint64_t v119 = 0;
  Swift::Int v118 = 0;
  Swift::Int v117 = 0;
  uint64_t v110 = 0;
  uint64_t v111 = 0;
  Swift::String v105 = (Swift::String)0;
  Swift::Int v100 = 0;
  Swift::Int v95 = 0;
  Swift::Double v90 = 0.0;
  Swift::Double v85 = 0.0;
  Swift::String v84 = (Swift::String)0;
  Swift::String v83 = (Swift::String)0;
  uint64_t v56 = 0;
  uint64_t v71 = type metadata accessor for Calendar.Component();
  unint64_t v63 = *(void **)(v71 - 8);
  uint64_t v64 = v71 - 8;
  unint64_t v55 = (v63[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v74 = (char *)&object - v55;
  uint64_t v76 = type metadata accessor for Calendar();
  uint64_t v65 = *(void *)(v76 - 8);
  uint64_t v66 = v76 - 8;
  unint64_t v57 = (*(void *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v56);
  uint64_t v75 = (char *)&object - v57;
  uint64_t v58 = type metadata accessor for Date();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v81);
  uint64_t v70 = (char *)&object - v61;
  uint64_t v121 = (char *)&object - v61;
  uint64_t v120 = v2;
  uint64_t v119 = v62;
  Date.init()();
  static Calendar.current.getter();
  uint64_t v3 = *MEMORY[0x263F07890];
  uint64_t v69 = (void (*)(char *, uint64_t, uint64_t))v63[13];
  uint64_t v68 = v63 + 13;
  v69(v74, v3, v71);
  uint64_t v4 = Calendar.component(_:from:)();
  uint64_t v5 = v75;
  Swift::Int v67 = v4;
  uint64_t v73 = (void (*)(char *, uint64_t))v63[1];
  uint64_t v72 = v63 + 1;
  v73(v74, v71);
  uint64_t v78 = *(void (**)(char *, uint64_t))(v65 + 8);
  uint64_t v77 = v65 + 8;
  v78(v5, v76);
  Swift::Int v118 = v67;
  static Calendar.current.getter();
  v69(v74, *MEMORY[0x263F078E8], v71);
  Swift::Int v79 = Calendar.component(_:from:)();
  v73(v74, v71);
  v78(v75, v76);
  Swift::Int v117 = v79;
  Swift::String v80 = *kMediaML_ssid.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v82 = &v114;
  Swift::String v114 = v80;
  MEMORY[0x25A298290](v115);
  outlined destroy of String();
  if (!v115[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v44 = v116;
  outlined init with take of Any((uint64_t)v115, (uint64_t)v116);
  uint64_t v49 = MEMORY[0x263F8EE58] + 8;
  uint64_t v48 = MEMORY[0x263F8D310];
  swift_dynamicCast();
  uint64_t v45 = v112;
  uint64_t v46 = v113;
  uint64_t v110 = v112;
  uint64_t v111 = v113;
  Swift::String v47 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v50 = &v107;
  Swift::String v107 = v47;
  MEMORY[0x25A298290](v108);
  outlined destroy of String();
  if (!v108[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v38 = v109;
  outlined init with take of Any((uint64_t)v108, (uint64_t)v109);
  uint64_t v42 = MEMORY[0x263F8EE58] + 8;
  uint64_t v41 = MEMORY[0x263F8D310];
  swift_dynamicCast();
  Swift::String v39 = v106;
  Swift::String v105 = v106;
  Swift::String v40 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v43 = &v102;
  Swift::String v102 = v40;
  MEMORY[0x25A298290](v103);
  outlined destroy of String();
  if (!v103[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v33 = v104;
  outlined init with take of Any((uint64_t)v103, (uint64_t)v104);
  uint64_t v36 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  Swift::Int v34 = v101;
  Swift::Int v100 = v101;
  Swift::String v35 = *kMediaML_noise.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v37 = &v97;
  Swift::String v97 = v35;
  MEMORY[0x25A298290](v98);
  outlined destroy of String();
  if (!v98[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  char v28 = v99;
  outlined init with take of Any((uint64_t)v98, (uint64_t)v99);
  uint64_t v31 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  Swift::Int v29 = v96;
  Swift::Int v95 = v96;
  Swift::String v30 = *kMediaML_rxRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v32 = &v92;
  Swift::String v92 = v30;
  MEMORY[0x25A298290](v93);
  outlined destroy of String();
  if (!v93[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  char v23 = v94;
  outlined init with take of Any((uint64_t)v93, (uint64_t)v94);
  uint64_t v26 = MEMORY[0x263F8EE58] + 8;
  swift_dynamicCast();
  Swift::Double v24 = v91;
  Swift::Double v90 = v91;
  Swift::String v25 = *kMediaML_txRate.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  uint64_t v27 = &v87;
  Swift::String v87 = v25;
  MEMORY[0x25A298290](v88);
  outlined destroy of String();
  if (!v88[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v21 = v89;
  outlined init with take of Any((uint64_t)v88, (uint64_t)v89);
  swift_dynamicCast();
  Swift::Double v22 = v86;
  Swift::Double v85 = v86;
  if (v34 >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor())
  {
    if (v34 >= *rssiBucket_low_medium_boundary.unsafeMutableAddressor()
      && v34 < *rssiBucket_medium_high_boundary.unsafeMutableAddressor())
    {
      Swift::String v18 = *rssiBucket_medium.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      Swift::String v84 = v18;
    }
    else
    {
      Swift::String v17 = *rssiBucket_high.unsafeMutableAddressor();
      swift_bridgeObjectRetain();
      Swift::String v84 = v17;
    }
  }
  else
  {
    Swift::String v20 = *rssiBucket_low.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    Swift::String v84 = v20;
  }
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("_", 1uLL, 1);
  uint64_t object = v6._object;
  uint64_t v11 = MEMORY[0x25A298350](v45, v46, v6._countAndFlagsBits);
  uint64_t v13 = v7;
  swift_bridgeObjectRelease();
  uint64_t v15 = &v84;
  Swift::String v12 = v84;
  swift_bridgeObjectRetain();
  v14._uint64_t countAndFlagsBits = MEMORY[0x25A298350](v11, v13, v12._countAndFlagsBits, v12._object);
  v14._uint64_t object = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::String v83 = v14;
  Swift::String v16 = &v122;
  WiFiDataPointForPrediciton.init(appName:bucketedSSID:hour:dow:rssi:noise:txRate:rxRate:)(&v122, v39, v14, v67, v79, v34, v29, v22, v24);
  outlined destroy of String();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v70, v58);
  return memcpy(v51, v16, 0x50uLL);
}

uint64_t MediaML.validateCellDataForPrediction(data:)(uint64_t a1)
{
  uint64_t v82 = a1;
  uint64_t v71 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v72 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = type metadata accessor for Logger();
  uint64_t v75 = *(void *)(v74 - 8);
  uint64_t v76 = v74 - 8;
  unint64_t v77 = (*(void *)(v75 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v82);
  uint64_t v78 = (char *)&v18 - v77;
  unint64_t v79 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  Swift::String v80 = (char *)&v18 - v79;
  uint64_t v102 = v4;
  uint64_t v101 = v1;
  Swift::String v81 = *kMediaML_carrier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v83 = &v99;
  Swift::String v99 = v81;
  MEMORY[0x25A298290](v100);
  outlined destroy of String();
  if (v100[3])
  {
    if (swift_dynamicCast()) {
      uint64_t v70 = v84;
    }
    else {
      uint64_t v70 = 0;
    }
    uint64_t v69 = v70;
  }
  else
  {
    uint64_t v38 = 0;
    outlined destroy of Any?((uint64_t)v100);
    uint64_t v69 = v38;
  }
  uint64_t v68 = v69;
  if (v69)
  {
    uint64_t v67 = v68;
    swift_bridgeObjectRelease();
    Swift::String v65 = *kMediaML_appName.unsafeMutableAddressor();
    swift_bridgeObjectRetain();
    uint64_t v66 = &v92;
    Swift::String v92 = v65;
    MEMORY[0x25A298290](v93);
    outlined destroy of String();
    if (v93[3])
    {
      if (swift_dynamicCast()) {
        uint64_t v64 = v85;
      }
      else {
        uint64_t v64 = 0;
      }
      uint64_t v63 = v64;
    }
    else
    {
      uint64_t v59 = 0;
      outlined destroy of Any?((uint64_t)v93);
      uint64_t v63 = v59;
    }
    uint64_t v62 = v63;
    if (v63)
    {
      uint64_t v61 = v62;
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      uint64_t v5 = v80;
      uint64_t v6 = MediaML.logger.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v5, v6, v74);
      unint64_t v57 = Logger.logObject.getter();
      int v56 = static os_log_type_t.error.getter();
      uint64_t v54 = &v90;
      uint64_t v90 = 2;
      unint64_t v52 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v55 = v91;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v58 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v57, (os_log_type_t)v56))
      {
        uint64_t v7 = v73;
        uint64_t v42 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v41 = 0;
        uint64_t v43 = createStorage<A>(capacity:type:)(0);
        uint64_t v44 = createStorage<A>(capacity:type:)(v41);
        uint64_t v48 = &v89;
        Swift::Double v89 = v42;
        uint64_t v49 = &v88;
        uint64_t v88 = v43;
        uint64_t v46 = &v87;
        uint64_t v87 = v44;
        unsigned int v45 = 0;
        serialize(_:at:)(0, &v89);
        serialize(_:at:)(v45, v48);
        uint64_t v86 = v58;
        Swift::String v47 = &v18;
        MEMORY[0x270FA5388](&v18);
        uint64_t v8 = v49;
        uint64_t v9 = &v18 - 6;
        uint64_t v50 = &v18 - 6;
        void v9[2] = (uint64_t)v48;
        v9[3] = (uint64_t)v8;
        void v9[4] = v10;
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v7)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_255CF7000, v57, (os_log_type_t)v56, "appName in data dictionary is not of expected type String", v42, v55);
          uint64_t v39 = 0;
          destroyStorage<A>(_:count:)(v43, 0, v40);
          destroyStorage<A>(_:count:)(v44, v39, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x25A298650](v42, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v75 + 8))(v80, v74);
      return 0;
    }
  }
  else
  {
    uint64_t v11 = v78;
    uint64_t v12 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v11, v12, v74);
    uint64_t v36 = Logger.logObject.getter();
    int v35 = static os_log_type_t.error.getter();
    uint64_t v33 = &v97;
    uint64_t v97 = 2;
    unint64_t v31 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v34 = v98;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v37 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v36, (os_log_type_t)v35))
    {
      uint64_t v13 = v73;
      uint64_t v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v20 = 0;
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      uint64_t v23 = createStorage<A>(capacity:type:)(v20);
      uint64_t v27 = &v96;
      Swift::Int v96 = v21;
      char v28 = &v95;
      uint64_t v95 = v22;
      Swift::String v25 = &v94;
      uint64_t v94 = v23;
      unsigned int v24 = 0;
      serialize(_:at:)(0, &v96);
      serialize(_:at:)(v24, v27);
      void v93[4] = v37;
      uint64_t v26 = &v18;
      MEMORY[0x270FA5388](&v18);
      Swift::String v14 = v28;
      uint64_t v15 = &v18 - 6;
      Swift::Int v29 = &v18 - 6;
      v15[2] = (uint64_t)v27;
      v15[3] = (uint64_t)v14;
      v15[4] = v16;
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v13)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_255CF7000, v36, (os_log_type_t)v35, "carrier in data dictionary is not of expected type String", v21, v34);
        uint64_t v18 = 0;
        destroyStorage<A>(_:count:)(v22, 0, v19);
        destroyStorage<A>(_:count:)(v23, v18, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x25A298650](v21, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v74);
    return 0;
  }
}

void *MediaML.prepareCellDataForPrediction(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v96 = 0;
  Swift::String v91 = (Swift::String)0;
  Swift::String v86 = (Swift::String)0;
  uint64_t v80 = 0;
  uint64_t v74 = 0;
  uint64_t v68 = 0;
  uint64_t v62 = 0;
  uint64_t v56 = 0;
  uint64_t v97 = a1;
  Swift::String v47 = *kMediaML_carrier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v93 = v47;
  MEMORY[0x25A298290](v94);
  outlined destroy of String();
  if (!v94[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v94, (uint64_t)v95);
  swift_dynamicCast();
  Swift::String carrier = v92;
  Swift::String v91 = v92;
  Swift::String v45 = *kMediaML_appName.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v88 = v45;
  MEMORY[0x25A298290](v89);
  outlined destroy of String();
  if (!v89[3])
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  outlined init with take of Any((uint64_t)v89, (uint64_t)v90);
  swift_dynamicCast();
  Swift::String appName = v87;
  Swift::String v86 = v87;
  Swift::String v43 = *kMediaML_rssi.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v83 = v43;
  MEMORY[0x25A298290](v84);
  outlined destroy of String();
  if (v84[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v40 = v48;
      char v41 = 0;
    }
    else
    {
      uint64_t v40 = 0;
      char v41 = 1;
    }
    uint64_t v38 = v40;
    char v39 = v41;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v84);
    uint64_t v38 = 0;
    char v39 = 1;
  }
  uint64_t v81 = v38;
  char v82 = v39 & 1;
  if (v39) {
    uint64_t v85 = 0;
  }
  else {
    uint64_t v85 = v81;
  }
  uint64_t v36 = v85;
  uint64_t v80 = v85;
  Swift::String v37 = *kMediaML_rsrp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v77 = v37;
  MEMORY[0x25A298290](v78);
  outlined destroy of String();
  if (v78[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v34 = v49;
      char v35 = 0;
    }
    else
    {
      uint64_t v34 = 0;
      char v35 = 1;
    }
    uint64_t v32 = v34;
    char v33 = v35;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v78);
    uint64_t v32 = 0;
    char v33 = 1;
  }
  uint64_t v75 = v32;
  char v76 = v33 & 1;
  if (v33) {
    uint64_t v79 = 0;
  }
  else {
    uint64_t v79 = v75;
  }
  uint64_t v30 = v79;
  uint64_t v74 = v79;
  Swift::String v31 = *kMediaML_rsrq.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v71 = v31;
  MEMORY[0x25A298290](v72);
  outlined destroy of String();
  if (v72[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v28 = v50;
      char v29 = 0;
    }
    else
    {
      uint64_t v28 = 0;
      char v29 = 1;
    }
    uint64_t v26 = v28;
    char v27 = v29;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v72);
    uint64_t v26 = 0;
    char v27 = 1;
  }
  uint64_t v69 = v26;
  char v70 = v27 & 1;
  if (v27) {
    uint64_t v73 = 0;
  }
  else {
    uint64_t v73 = v69;
  }
  uint64_t v24 = v73;
  uint64_t v68 = v73;
  Swift::String v25 = *kMediaML_rscp.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v65 = v25;
  MEMORY[0x25A298290](v66);
  outlined destroy of String();
  if (v66[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v22 = v51;
      char v23 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      char v23 = 1;
    }
    uint64_t v20 = v22;
    char v21 = v23;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v66);
    uint64_t v20 = 0;
    char v21 = 1;
  }
  uint64_t v63 = v20;
  char v64 = v21 & 1;
  if (v21) {
    uint64_t v67 = 0;
  }
  else {
    uint64_t v67 = v63;
  }
  uint64_t v18 = v67;
  uint64_t v62 = v67;
  Swift::String v19 = *kMediaML_snr.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  Swift::String v59 = v19;
  MEMORY[0x25A298290](v60);
  outlined destroy of String();
  if (v60[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v16 = v52;
      char v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      char v17 = 1;
    }
    uint64_t v14 = v16;
    char v15 = v17;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v60);
    uint64_t v14 = 0;
    char v15 = 1;
  }
  uint64_t v57 = v14;
  char v58 = v15 & 1;
  if (v15) {
    uint64_t v61 = 0;
  }
  else {
    uint64_t v61 = v57;
  }
  uint64_t v13 = v61;
  uint64_t v56 = v61;
  kMediaML_bars.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  MEMORY[0x25A298290](v54);
  outlined destroy of String();
  if (v54[3])
  {
    if (swift_dynamicCast())
    {
      Swift::Int v11 = v53;
      char v12 = 0;
    }
    else
    {
      Swift::Int v11 = 0;
      char v12 = 1;
    }
    Swift::Int v9 = v11;
    char v10 = v12;
  }
  else
  {
    outlined destroy of Any?((uint64_t)v54);
    Swift::Int v9 = 0;
    char v10 = 1;
  }
  if (v10) {
    Swift::Int v55 = 0;
  }
  else {
    Swift::Int v55 = v9;
  }
  Swift::Int bars = v55;
  Swift::Int v8 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v36 == 0x8000000000000000 && v8 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  Swift::Int v6 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v6)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v30 == 0x8000000000000000 && v6 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  Swift::Int v5 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v5)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v24 == 0x8000000000000000 && v5 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  Swift::Int v4 = *cell_signal_binsize.unsafeMutableAddressor();
  if (!v4)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v18 == 0x8000000000000000 && v4 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  Swift::Int v3 = *cell_snr_binsize.unsafeMutableAddressor();
  if (!v3)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (v13 == 0x8000000000000000 && v3 == -1)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  CellDataPointForPrediction.init(appName:carrier:binnedRssi:binnedRsrp:binnedRscp:binnedRsrq:binnedSnr:bars:)(&v98, appName, carrier, v36 / v8, v30 / v6, v18 / v4, v24 / v5, v13 / v3, bars);
  return memcpy(a2, &v98, 0x50uLL);
}

uint64_t MediaML.getPredictionDictionary(data:)(uint64_t a1)
{
  *(void *)(v2 + 600) = v1;
  *(void *)(v2 + 592) = a1;
  *(void *)(v2 + 464) = v2;
  *(void *)(v2 + 472) = 0;
  *(void *)(v2 + 480) = 0;
  *(void *)(v2 + 384) = 0;
  *(unsigned char *)(v2 + 392) = 0;
  *(void *)(v2 + 488) = 0;
  *(void *)(v2 + 400) = 0;
  *(unsigned char *)(v2 + 408) = 0;
  *(void *)(v2 + 544) = 0;
  *(void *)(v2 + 552) = 0;
  *(void *)(v2 + 576) = 0;
  uint64_t v3 = type metadata accessor for Logger();
  *(void *)(v2 + 608) = v3;
  *(void *)(v2 + 616) = *(void *)(v3 - 8);
  *(void *)(v2 + 624) = swift_task_alloc();
  *(void *)(v2 + 632) = swift_task_alloc();
  *(void *)(v2 + 472) = a1;
  *(void *)(v2 + 480) = v1;
  Swift::Int v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 640) = v4;
  *Swift::Int v4 = *(void *)(v6 + 464);
  v4[1] = MediaML.getPredictionDictionary(data:);
  return MediaML.getPrediction(data:)(a1);
}

uint64_t MediaML.getPredictionDictionary(data:)(uint64_t a1, char a2)
{
  uint64_t v10 = *v3;
  uint64_t v8 = *v3 + 16;
  uint64_t v9 = *v3 + 464;
  *(void *)(v10 + 464) = *v3;
  *(void *)(v10 + 648) = v2;
  *(void *)(v10 + 656) = a1;
  *(unsigned char *)(v10 + 233) = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    uint64_t v5 = swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)v9 + 8);
    return v6(v5);
  }
  else
  {
    uint64_t v4 = *(void *)(v8 + 584);
    return MEMORY[0x270FA2498](MediaML.getPredictionDictionary(data:), v4, 0);
  }
}

uint64_t MediaML.getPredictionDictionary(data:)()
{
  char v1 = *(unsigned char *)(v0 + 233);
  uint64_t v2 = *(void *)(v0 + 656);
  *(void *)(v0 + 464) = v0;
  *(void *)(v0 + 384) = v2;
  *(unsigned char *)(v0 + 392) = v1 & 1;
  *(void *)(v0 + 664) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v67 = v3;
  uint64_t v4 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v4, v67);
  v67[2] = 0;
  uint64_t v5 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v5, v67 + 3);
  v67[5] = 0;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v68 = Dictionary.init(dictionaryLiteral:)();
  *(void *)(v0 + 672) = v68;
  *(void *)(v0 + 488) = v68;
  Swift::String v69 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  *(Swift::String *)(v0 + 368) = v69;
  MEMORY[0x25A298290]();
  outlined destroy of String();
  if (*(void *)(v0 + 200))
  {
    if (swift_dynamicCast())
    {
      uint64_t v64 = *(void *)(v66 + 584);
      char v65 = 0;
    }
    else
    {
      uint64_t v64 = 0;
      char v65 = 1;
    }
    uint64_t v62 = v64;
    char v63 = v65;
  }
  else
  {
    outlined destroy of Any?(v66 + 176);
    uint64_t v62 = 0;
    char v63 = 1;
  }
  char v6 = *(unsigned char *)(v66 + 233);
  *(void *)(v66 + 400) = v62;
  *(unsigned char *)(v66 + 408) = v63 & 1;
  *(void *)(v66 + 416) = 0;
  *(unsigned char *)(v66 + 424) = 1;
  if (v6) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  if (*(double *)(v66 + 656) < 0.0)
  {
    uint64_t v16 = *(void *)(v66 + 632);
    uint64_t v30 = *(void *)(v66 + 608);
    uint64_t v29 = *(void *)(v66 + 616);
    uint64_t v17 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v16, v17, v30);
    oslog = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.debug.getter();
    *(void *)(v66 + 496) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v66 + 236);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v34 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v32))
    {
      uint64_t v18 = *(void *)(v66 + 648);
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v26 = createStorage<A>(capacity:type:)(0);
      uint64_t v27 = createStorage<A>(capacity:type:)(0);
      *(void *)(v66 + 504) = buf;
      *(void *)(v66 + 512) = v26;
      *(void *)(v66 + 520) = v27;
      serialize(_:at:)(0, (unsigned char **)(v66 + 504));
      serialize(_:at:)(0, (unsigned char **)(v66 + 504));
      *(void *)(v66 + 528) = v34;
      uint64_t v28 = (void *)swift_task_alloc();
      v28[2] = v66 + 504;
      v28[3] = v66 + 512;
      v28[4] = v66 + 520;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v18) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, oslog, v32, "Failed to get prediction from model", buf, size);
      destroyStorage<A>(_:count:)(v26, 0, v24);
      destroyStorage<A>(_:count:)(v27, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = *(void *)(v66 + 632);
    uint64_t v22 = *(void *)(v66 + 608);
    uint64_t v20 = *(void *)(v66 + 616);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    swift_bridgeObjectRetain();
    uint64_t v23 = _dictionaryUpCast<A, B, C, D>(_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v50 = v23;
    goto LABEL_62;
  }
  *(void *)(v66 + 208) = *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor();
  *(unsigned char *)(v66 + 216) = 0;
  *(void *)(v66 + 224) = v62;
  *(unsigned char *)(v66 + 232) = v63 & 1;
  if (*(unsigned char *)(v66 + 216))
  {
    if ((*(unsigned char *)(v66 + 232) & 1) == 0) {
      goto LABEL_32;
    }
  }
  else
  {
    outlined init with copy of Int?(v66 + 208, v66 + 448);
    if ((*(unsigned char *)(v66 + 232) & 1) != 0 || *(void *)(v66 + 448) != *(void *)(v66 + 224))
    {
LABEL_32:
      *(void *)(v66 + 240) = *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor();
      *(unsigned char *)(v66 + 248) = 0;
      *(void *)(v66 + 256) = v62;
      *(unsigned char *)(v66 + 264) = v63 & 1;
      if (*(unsigned char *)(v66 + 248))
      {
        if ((*(unsigned char *)(v66 + 264) & 1) == 0)
        {
LABEL_54:
          swift_bridgeObjectRetain();
          uint64_t v35 = _dictionaryUpCast<A, B, C, D>(_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v50 = v35;
LABEL_62:
          swift_task_dealloc();
          swift_task_dealloc();
          Swift::String v19 = *(uint64_t (**)(uint64_t))(*(void *)(v66 + 464) + 8);
          return v19(v50);
        }
      }
      else
      {
        outlined init with copy of Int?(v66 + 240, v66 + 432);
        if ((*(unsigned char *)(v66 + 264) & 1) != 0 || *(void *)(v66 + 432) != *(void *)(v66 + 256)) {
          goto LABEL_54;
        }
      }
      uint64_t v47 = *(void *)(v66 + 600);
      MediaML.prepareCellDataForPrediction(data:)(*(void *)(v66 + 592), (void *)(v66 + 16));
      swift_beginAccess();
      uint64_t v48 = *(void *)(v47 + 112);
      swift_retain();
      swift_endAccess();
      *(void *)(v66 + 536) = v48;
      if (!*(void *)(v66 + 536))
      {
        outlined destroy of DataWriter?();
        *(void *)(v66 + 416) = 0x3FF0000000000000;
        *(unsigned char *)(v66 + 424) = 0;
        char v44 = *(unsigned char *)(v66 + 233);
        uint64_t v43 = *(void *)(v66 + 656);
        _allocateUninitializedArray<A>(_:)();
        uint64_t v42 = v12;
        uint64_t v13 = kMediaML_throughputPrediction.unsafeMutableAddressor();
        outlined init with copy of String(v13, v42);
        if (v44) {
          v42[2] = 0;
        }
        else {
          v42[2] = v43;
        }
        char v15 = kMediaML_throughputStdDev.unsafeMutableAddressor();
        outlined init with copy of String(v15, v42 + 3);
        if (*(unsigned char *)(v66 + 424)) {
          v42[5] = 0;
        }
        else {
          v42[5] = *(void *)(v66 + 416);
        }
        _finalizeUninitializedArray<A>(_:)();
        *(void *)(v66 + 544) = Dictionary.init(dictionaryLiteral:)();
        swift_bridgeObjectRetain();
        uint64_t v36 = _dictionaryUpCast<A, B, C, D>(_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined release of CellDataPointForPrediction(v66 + 16);
        swift_bridgeObjectRelease();
        uint64_t v50 = v36;
        goto LABEL_62;
      }
      outlined destroy of DataWriter?();
      uint64_t v45 = *(void *)(v66 + 600);
      swift_beginAccess();
      uint64_t v46 = *(void *)(v45 + 112);
      *(void *)(v66 + 728) = v46;
      swift_retain();
      swift_endAccess();
      if (v46)
      {
        uint64_t v41 = *(void *)(v66 + 16);
        uint64_t v37 = *(void *)(v66 + 24);
        *(void *)(v66 + 736) = v37;
        swift_bridgeObjectRetain();
        uint64_t v38 = *(void *)(v66 + 32);
        uint64_t v39 = *(void *)(v66 + 40);
        *(void *)(v66 + 744) = v39;
        swift_bridgeObjectRetain();
        uint64_t v40 = *(void *)(v66 + 88);
        uint64_t v14 = (void *)swift_task_alloc();
        *(void *)(v66 + 752) = v14;
        *uint64_t v14 = *(void *)(v66 + 464);
        v14[1] = MediaML.getPredictionDictionary(data:);
        return DataWriter.readCellStdDev(appName:carrier:bars:)(v41, v37, v38, v39, v40);
      }
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  uint64_t v60 = *(void *)(v66 + 600);
  MediaML.prepareWifiDataForPrediction(data:)(*(void *)(v66 + 592), (void *)(v66 + 96));
  swift_beginAccess();
  uint64_t v61 = *(void *)(v60 + 112);
  swift_retain();
  swift_endAccess();
  *(void *)(v66 + 568) = v61;
  if (!*(void *)(v66 + 568))
  {
    outlined destroy of DataWriter?();
    *(void *)(v66 + 416) = 0x3FF0000000000000;
    *(unsigned char *)(v66 + 424) = 0;
    char v57 = *(unsigned char *)(v66 + 233);
    uint64_t v56 = *(void *)(v66 + 656);
    _allocateUninitializedArray<A>(_:)();
    Swift::Int v55 = v7;
    uint64_t v8 = kMediaML_throughputPrediction.unsafeMutableAddressor();
    outlined init with copy of String(v8, v55);
    if (v57) {
      v55[2] = 0;
    }
    else {
      v55[2] = v56;
    }
    uint64_t v11 = kMediaML_throughputStdDev.unsafeMutableAddressor();
    outlined init with copy of String(v11, v55 + 3);
    if (*(unsigned char *)(v66 + 424)) {
      v55[5] = 0;
    }
    else {
      v55[5] = *(void *)(v66 + 416);
    }
    _finalizeUninitializedArray<A>(_:)();
    *(void *)(v66 + 576) = Dictionary.init(dictionaryLiteral:)();
    swift_bridgeObjectRetain();
    uint64_t v49 = _dictionaryUpCast<A, B, C, D>(_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined release of WiFiDataPointForPrediciton(v66 + 96);
    swift_bridgeObjectRelease();
    uint64_t v50 = v49;
    goto LABEL_62;
  }
  outlined destroy of DataWriter?();
  uint64_t v58 = *(void *)(v66 + 600);
  swift_beginAccess();
  uint64_t v59 = *(void *)(v58 + 112);
  *(void *)(v66 + 680) = v59;
  swift_retain();
  swift_endAccess();
  if (!v59) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v54 = *(void *)(v66 + 96);
  uint64_t v51 = *(void *)(v66 + 104);
  *(void *)(v66 + 688) = v51;
  swift_bridgeObjectRetain();
  uint64_t v52 = *(void *)(v66 + 112);
  uint64_t v53 = *(void *)(v66 + 120);
  *(void *)(v66 + 696) = v53;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v66 + 704) = v9;
  *uint64_t v9 = *(void *)(v66 + 464);
  v9[1] = MediaML.getPredictionDictionary(data:);
  return DataWriter.readWiFiStdDev(appName:ssid:)(v54, v51, v52, v53);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  char v1 = *(void *)(v0 + 712);
  *(void *)(v0 + 464) = v0;
  *(void *)(v0 + 416) = v1;
  *(unsigned char *)(v0 + 424) = 0;
  uint64_t v11 = *(unsigned char *)(v0 + 233);
  uint64_t v10 = *(void *)(v0 + 656);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v9 = v2;
  uint64_t v3 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v3, v9);
  if (v11) {
    void v9[2] = 0;
  }
  else {
    void v9[2] = v10;
  }
  uint64_t v4 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v4, v9 + 3);
  if (*(unsigned char *)(v8 + 424)) {
    v9[5] = 0;
  }
  else {
    v9[5] = *(void *)(v8 + 416);
  }
  _finalizeUninitializedArray<A>(_:)();
  *(void *)(v8 + 576) = Dictionary.init(dictionaryLiteral:)();
  swift_bridgeObjectRetain();
  uint64_t v7 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined release of WiFiDataPointForPrediciton(v8 + 96);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(v8 + 464) + 8);
  return v5(v7);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String *v3;
  Swift::String *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  char v1 = *(void *)(v0 + 760);
  *(void *)(v0 + 464) = v0;
  *(void *)(v0 + 416) = v1;
  *(unsigned char *)(v0 + 424) = 0;
  uint64_t v11 = *(unsigned char *)(v0 + 233);
  uint64_t v10 = *(void *)(v0 + 656);
  _allocateUninitializedArray<A>(_:)();
  uint64_t v9 = v2;
  uint64_t v3 = kMediaML_throughputPrediction.unsafeMutableAddressor();
  outlined init with copy of String(v3, v9);
  if (v11) {
    void v9[2] = 0;
  }
  else {
    void v9[2] = v10;
  }
  uint64_t v4 = kMediaML_throughputStdDev.unsafeMutableAddressor();
  outlined init with copy of String(v4, v9 + 3);
  if (*(unsigned char *)(v8 + 424)) {
    v9[5] = 0;
  }
  else {
    v9[5] = *(void *)(v8 + 416);
  }
  _finalizeUninitializedArray<A>(_:)();
  *(void *)(v8 + 544) = Dictionary.init(dictionaryLiteral:)();
  swift_bridgeObjectRetain();
  uint64_t v7 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined release of CellDataPointForPrediction(v8 + 16);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)(v8 + 464) + 8);
  return v5(v7);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint32_t size;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  uint64_t v35 = v0;
  *(void *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  Swift::String v19 = *(id *)(v0 + 720);
  char v1 = *(void *)(v0 + 624);
  uint64_t v17 = *(void *)(v0 + 616);
  uint64_t v18 = *(void *)(v0 + 608);
  uint64_t v2 = v19;
  *(void *)(v0 + 552) = v19;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v3, v18);
  uint64_t v4 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v28 = Logger.logObject.getter();
  uint64_t v29 = static os_log_type_t.error.getter();
  *(void *)(v0 + 560) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 268);
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 64;
  Swift::String v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:);
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v23 + 24) = v22;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v27 = v5;
  swift_retain();
  *uint64_t v27 = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[1] = v24;
  swift_retain();
  v27[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[3] = v25;
  swift_retain();
  v27[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[5] = v26;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v28, v29))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    char v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    char v15 = createStorage<A>(capacity:type:)(0);
    uint64_t v30 = buf;
    Swift::String v31 = v14;
    os_log_type_t v32 = v15;
    serialize(_:at:)(2, &v30);
    serialize(_:at:)(1, &v30);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    _os_log_impl(&dword_255CF7000, v28, v29, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v14, 1, v12);
    destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v16[78];
  uint64_t v10 = v16[76];
  uint64_t v8 = v16[77];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v11 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  char v6 = *(uint64_t (**)(uint64_t))(v16[58] + 8);
  return v6(v11);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint32_t size;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  uint64_t v35 = v0;
  *(void *)(v0 + 464) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of CellDataPointForPrediction(v0 + 16);
  Swift::String v19 = *(id *)(v0 + 768);
  char v1 = *(void *)(v0 + 624);
  uint64_t v17 = *(void *)(v0 + 616);
  uint64_t v18 = *(void *)(v0 + 608);
  uint64_t v2 = v19;
  *(void *)(v0 + 552) = v19;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v3, v18);
  uint64_t v4 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v28 = Logger.logObject.getter();
  uint64_t v29 = static os_log_type_t.error.getter();
  *(void *)(v0 + 560) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 268);
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 64;
  Swift::String v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:);
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v23 + 24) = v22;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v26 + 24) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v27 = v5;
  swift_retain();
  *uint64_t v27 = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[1] = v24;
  swift_retain();
  v27[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[3] = v25;
  swift_retain();
  v27[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v27[5] = v26;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v28, v29))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    char v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    char v15 = createStorage<A>(capacity:type:)(0);
    uint64_t v30 = buf;
    Swift::String v31 = v14;
    os_log_type_t v32 = v15;
    serialize(_:at:)(2, &v30);
    serialize(_:at:)(1, &v30);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    char v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v34 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    _os_log_impl(&dword_255CF7000, v28, v29, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v14, 1, v12);
    destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = v16[78];
  uint64_t v10 = v16[76];
  uint64_t v8 = v16[77];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_bridgeObjectRetain();
  uint64_t v11 = _dictionaryUpCast<A, B, C, D>(_:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  char v6 = *(uint64_t (**)(uint64_t))(v16[58] + 8);
  return v6(v11);
}

uint64_t MediaML.getPredictionDictionary(data:)(double a1)
{
  uint64_t v8 = *v2;
  uint64_t v7 = *v2 + 16;
  *(void *)(v8 + 464) = *v2;
  *(double *)(v8 + 712) = a1;
  *(void *)(v8 + 720) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = *(void *)(v7 + 584);
    uint64_t v4 = MediaML.getPredictionDictionary(data:);
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 584);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = MediaML.getPredictionDictionary(data:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v8 = *v2;
  uint64_t v7 = *v2 + 16;
  *(void *)(v8 + 464) = *v2;
  *(double *)(v8 + 760) = a1;
  *(void *)(v8 + 768) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = *(void *)(v7 + 584);
    uint64_t v4 = MediaML.getPredictionDictionary(data:);
  }
  else
  {
    uint64_t v6 = *(void *)(v7 + 584);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = MediaML.getPredictionDictionary(data:);
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t MediaML.getPrediction(data:)(uint64_t a1)
{
  v2[43] = v1;
  v2[42] = a1;
  v2[28] = v2;
  v2[29] = 0;
  v2[30] = 0;
  v2[36] = 0;
  v2[39] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[44] = v3;
  v2[45] = *(void *)(v3 - 8);
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[29] = a1;
  v2[30] = v5;
  return MEMORY[0x270FA2498](MediaML.getPrediction(data:), v5, 0);
}

uint64_t MediaML.getPrediction(data:)()
{
  uint32_t v108 = v0;
  v0[14]._uint64_t countAndFlagsBits = (uint64_t)v0;
  Swift::String v97 = *kMediaML_interfaceType.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  v0[13] = v97;
  MEMORY[0x25A298290]();
  outlined destroy of String();
  if (v0[12]._object)
  {
    if (swift_dynamicCast())
    {
      uint64_t v94 = *(void *)(v96 + 328);
      char v95 = 0;
    }
    else
    {
      uint64_t v94 = 0;
      char v95 = 1;
    }
    uint64_t v92 = v94;
    char v93 = v95;
  }
  else
  {
    outlined destroy of Any?(v96 + 176);
    uint64_t v92 = 0;
    char v93 = 1;
  }
  if (v93)
  {
    uint64_t v16 = *(void *)(v96 + 376);
    uint64_t v28 = *(void *)(v96 + 352);
    uint64_t v27 = *(void *)(v96 + 360);
    uint64_t v17 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v16, v17, v28);
    Swift::String v31 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    *(void *)(v96 + 248) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v29 = *(_DWORD *)(v96 + 560);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v32 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v31, v30))
    {
      uint64_t v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v24 = createStorage<A>(capacity:type:)(0);
      uint64_t v25 = createStorage<A>(capacity:type:)(0);
      *(void *)(v96 + 256) = v23;
      *(void *)(v96 + 264) = v24;
      *(void *)(v96 + 272) = v25;
      serialize(_:at:)(0, (unsigned char **)(v96 + 256));
      serialize(_:at:)(0, (unsigned char **)(v96 + 256));
      *(void *)(v96 + 280) = v32;
      uint64_t v26 = (void *)swift_task_alloc();
      v26[2] = v96 + 256;
      v26[3] = v96 + 264;
      v26[4] = v96 + 272;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_255CF7000, v31, v30, "Wrong / No interface Type provided.", v23, v29);
      destroyStorage<A>(_:count:)(v24, 0, v22);
      destroyStorage<A>(_:count:)(v25, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v23, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void *)(v96 + 376);
    uint64_t v21 = *(void *)(v96 + 352);
    uint64_t v19 = *(void *)(v96 + 360);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    goto LABEL_45;
  }
  *(void *)(v96 + 288) = v92;
  if (v92 != *kMediaML_InterfaceType_WiFi.unsafeMutableAddressor()
    && v92 != *kMediaML_InterfaceType_Cellular.unsafeMutableAddressor())
  {
    uint64_t v13 = *(void *)(v96 + 384);
    uint64_t v41 = *(void *)(v96 + 352);
    uint64_t v40 = *(void *)(v96 + 360);
    uint64_t v14 = MediaML.logger.unsafeMutableAddressor();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v13, v14, v41);
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v92;
    log = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    *(void *)(v96 + 296) = 12;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v42 = *(_DWORD *)(v96 + 564);
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 0;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = partial apply for implicit closure #2 in MediaML.getPrediction(data:);
    *(void *)(v44 + 24) = v43;
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
    *(void *)(v47 + 24) = v44;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    uint64_t v48 = v15;
    swift_retain();
    *uint64_t v48 = closure #1 in OSLogArguments.append(_:)partial apply;
    v48[1] = v45;
    swift_retain();
    v48[2] = closure #1 in OSLogArguments.append(_:)partial apply;
    v48[3] = v46;
    swift_retain();
    v48[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
    v48[5] = v47;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v50))
    {
      uint64_t v37 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v38 = createStorage<A>(capacity:type:)(0);
      uint64_t v39 = createStorage<A>(capacity:type:)(0);
      MediaML::CellDataPointForPrediction v98 = v37;
      uint64_t v99 = v38;
      uint64_t v100 = v39;
      serialize(_:at:)(0, &v98);
      serialize(_:at:)(1, &v98);
      uint64_t v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v102 = v45;
      closure #1 in osLogInternal(_:log:type:)(&v101, (uint64_t)&v98, (uint64_t)&v99, (uint64_t)&v100);
      uint64_t v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
      uint64_t v102 = v46;
      closure #1 in osLogInternal(_:log:type:)(&v101, (uint64_t)&v98, (uint64_t)&v99, (uint64_t)&v100);
      uint64_t v101 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
      uint64_t v102 = v47;
      closure #1 in osLogInternal(_:log:type:)(&v101, (uint64_t)&v98, (uint64_t)&v99, (uint64_t)&v100);
      _os_log_impl(&dword_255CF7000, log, v50, "Expected interfaceType to be in (3,5) but got %ld", v37, v42);
      destroyStorage<A>(_:count:)(v38, 0, v36);
      destroyStorage<A>(_:count:)(v39, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v37, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v34 = *(void *)(v96 + 384);
    uint64_t v35 = *(void *)(v96 + 352);
    uint64_t v33 = *(void *)(v96 + 360);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v35);
    goto LABEL_45;
  }
  uint64_t v1 = *(void *)(v96 + 392);
  uint64_t v75 = *(void *)(v96 + 352);
  uint64_t v76 = *(void *)(v96 + 336);
  uint64_t v74 = *(void *)(v96 + 360);
  uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16);
  *(void *)(v96 + 400) = v3;
  *(void *)(v96 + 408) = (v74 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v1, v2, v75);
  uint64_t v79 = swift_allocObject();
  *(void *)(v79 + 16) = v92;
  swift_bridgeObjectRetain();
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 16) = v76;
  swift_retain();
  uint64_t v81 = swift_allocObject();
  *(void *)(v81 + 16) = partial apply for implicit closure #4 in MediaML.getPrediction(data:);
  *(void *)(v81 + 24) = v77;
  swift_release();
  oslog = Logger.logObject.getter();
  os_log_type_t v91 = static os_log_type_t.debug.getter();
  *(void *)(v96 + 304) = 22;
  *(void *)(v96 + 416) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v96 + 424) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v96 + 432) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v96 + 568);
  uint64_t v83 = swift_allocObject();
  *(unsigned char *)(v83 + 16) = 0;
  uint64_t v84 = swift_allocObject();
  *(unsigned char *)(v84 + 16) = 8;
  uint64_t v80 = swift_allocObject();
  *(void *)(v80 + 16) = partial apply for implicit closure #3 in MediaML.getPrediction(data:);
  *(void *)(v80 + 24) = v79;
  uint64_t v85 = swift_allocObject();
  *(void *)(v85 + 16) = thunk for @escaping @callee_guaranteed () -> (@unowned Int)partial apply;
  *(void *)(v85 + 24) = v80;
  uint64_t v86 = swift_allocObject();
  *(unsigned char *)(v86 + 16) = 32;
  uint64_t v87 = swift_allocObject();
  *(unsigned char *)(v87 + 16) = 8;
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(void *)(v82 + 24) = v81;
  uint64_t v88 = swift_allocObject();
  *(void *)(v88 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v88 + 24) = v82;
  *(void *)(v96 + 440) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  Swift::Double v89 = v4;
  swift_retain();
  void *v89 = closure #1 in OSLogArguments.append(_:)partial apply;
  v89[1] = v83;
  swift_retain();
  v89[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v89[3] = v84;
  swift_retain();
  void v89[4] = closure #1 in OSLogArguments.append<A>(_:)partial apply;
  v89[5] = v85;
  swift_retain();
  v89[6] = closure #1 in OSLogArguments.append(_:)partial apply;
  v89[7] = v86;
  swift_retain();
  v89[8] = closure #1 in OSLogArguments.append(_:)partial apply;
  v89[9] = v87;
  swift_retain();
  v89[10] = closure #1 in OSLogArguments.append(_:)partial apply;
  v89[11] = v88;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(oslog, v91))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v72 = createStorage<A>(capacity:type:)(0);
    uint64_t v73 = createStorage<A>(capacity:type:)(1);
    uint64_t v103 = buf;
    uint64_t v104 = v72;
    uint64_t v105 = v73;
    serialize(_:at:)(2, &v103);
    serialize(_:at:)(2, &v103);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v107 = v83;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v107 = v84;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append<A>(_:)partial apply;
    uint64_t v107 = v85;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v107 = v86;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v107 = v87;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    Swift::String v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v107 = v88;
    closure #1 in osLogInternal(_:log:type:)(&v106, (uint64_t)&v103, (uint64_t)&v104, (uint64_t)&v105);
    _os_log_impl(&dword_255CF7000, oslog, v91, "Got data for prediction interface:%ld data:%s", buf, size);
    destroyStorage<A>(_:count:)(v72, 0, v70);
    destroyStorage<A>(_:count:)(v73, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v68 = *(void *)(v96 + 392);
  uint64_t v69 = *(void *)(v96 + 352);
  uint64_t v67 = *(void *)(v96 + 360);

  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
  *(void *)(v96 + 448) = v5;
  *(void *)(v96 + 456) = (v67 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v68, v69);
  if (*kMediaML_InterfaceType_WiFi.unsafeMutableAddressor() != v92)
  {
    if (*kMediaML_InterfaceType_Cellular.unsafeMutableAddressor() != v92) {
      goto LABEL_45;
    }
    *(unsigned char *)(v96 + 576) = MediaML.validateCellDataForPrediction(data:)(*(void *)(v96 + 336));
    *(unsigned char *)(v96 + 577) = 1;
    if (*(unsigned char *)(v96 + 576) == 2)
    {
      if (*(unsigned char *)(v96 + 577) != 2) {
        goto LABEL_45;
      }
    }
    else
    {
      outlined init with copy of Bool?((unsigned char *)(v96 + 576), (unsigned char *)(v96 + 580));
      if (*(unsigned char *)(v96 + 577) == 2 || (*(unsigned char *)(v96 + 580) & 1) != (*(unsigned char *)(v96 + 577) & 1))
      {
LABEL_45:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v18 = *(uint64_t (**)(void, void))(*(void *)(v96 + 224) + 8);
        return v18(0, 0);
      }
    }
    uint64_t v51 = *(void *)(v96 + 344);
    MediaML.prepareCellDataForPrediction(data:)(*(void *)(v96 + 336), (void *)(v96 + 16));
    uint64_t v11 = *(void *)(v51 + 128);
    *(void *)(v96 + 512) = v11;
    swift_retain();
    *(void *)(v96 + 520) = *(void *)(v96 + 40);
    swift_bridgeObjectRetain();
    *(void *)(v96 + 528) = *(void *)(v96 + 24);
    swift_bridgeObjectRetain();
    uint64_t v52 = *(void *)(v96 + 80);
    uint64_t v53 = *(void *)(v96 + 88);
    uint64_t v54 = *(void *)(*(void *)v11 + 184) + **(int **)(*(void *)v11 + 184);
    char v12 = (void *)swift_task_alloc();
    *(void *)(v96 + 536) = v12;
    *char v12 = *(void *)(v96 + 224);
    v12[1] = MediaML.getPrediction(data:);
    uint64_t v110 = v52;
    uint64_t v111 = v53;
    __asm { BRAA            X8, X16 }
  }
  *(unsigned char *)(v96 + 578) = MediaML.validateWifiDataForPrediction(data:)(*(void *)(v96 + 336));
  *(unsigned char *)(v96 + 579) = 1;
  if (*(unsigned char *)(v96 + 578) == 2)
  {
    if (*(unsigned char *)(v96 + 579) != 2) {
      goto LABEL_45;
    }
  }
  else
  {
    outlined init with copy of Bool?((unsigned char *)(v96 + 578), (unsigned char *)(v96 + 581));
    if (*(unsigned char *)(v96 + 579) == 2 || (*(unsigned char *)(v96 + 581) & 1) != (*(unsigned char *)(v96 + 579) & 1)) {
      goto LABEL_45;
    }
  }
  uint64_t v55 = *(void *)(v96 + 344);
  MediaML.prepareWifiDataForPrediction(data:)(*(void *)(v96 + 336), (void *)(v96 + 96));
  uint64_t v6 = *(void *)(v55 + 120);
  *(void *)(v96 + 464) = v6;
  swift_retain();
  uint64_t v66 = *(void *)(v96 + 112);
  uint64_t v56 = *(void *)(v96 + 120);
  *(void *)(v96 + 472) = v56;
  swift_bridgeObjectRetain();
  uint64_t v57 = *(void *)(v96 + 96);
  uint64_t v58 = *(void *)(v96 + 104);
  *(void *)(v96 + 480) = v58;
  swift_bridgeObjectRetain();
  uint64_t v59 = *(void *)(v96 + 128);
  uint64_t v60 = *(void *)(v96 + 136);
  uint64_t v61 = *(void *)(v96 + 144);
  uint64_t v62 = *(void *)(v96 + 152);
  unint64_t v63 = *(void *)(v96 + 160);
  unint64_t v64 = *(void *)(v96 + 168);
  char v65 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))(*(void *)(*(void *)v6 + 184) + **(int **)(*(void *)v6 + 184));
  uint64_t v7 = (void *)swift_task_alloc();
  v8.n128_u64[0] = v63;
  v9.n128_u64[0] = v64;
  *(void *)(v96 + 488) = v7;
  *uint64_t v7 = *(void *)(v96 + 224);
  v7[1] = MediaML.getPrediction(data:);
  return v65(v66, v56, v57, v58, v59, v60, v61, v62, v8, v9);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, void);
  uint64_t v3;
  char v4;
  uint64_t v5;

  *(void *)(v0 + 224) = v0;
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  uint64_t v4 = *(unsigned char *)(v0 + 582);
  uint64_t v3 = *(void *)(v0 + 504);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(*(void *)(v0 + 224) + 8);
  return v1(v3, v4 & 1);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, void);
  uint64_t v3;
  char v4;
  uint64_t v5;

  *(void *)(v0 + 224) = v0;
  outlined release of CellDataPointForPrediction(v0 + 16);
  uint64_t v4 = *(unsigned char *)(v0 + 583);
  uint64_t v3 = *(void *)(v0 + 552);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t, void))(*(void *)(v0 + 224) + 8);
  return v1(v3, v4 & 1);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void, void);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  id v18;
  uint32_t size;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  uint64_t v34 = v0;
  *(void *)(v0 + 224) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of WiFiDataPointForPrediciton(v0 + 96);
  uint64_t v18 = *(id *)(v0 + 496);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v16 = *(void *)(v0 + 352);
  uint64_t v2 = v18;
  *(void *)(v0 + 312) = v18;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  v17(v1, v3, v16);
  uint64_t v4 = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v27 = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.error.getter();
  *(void *)(v0 + 320) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 572);
  uint64_t v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 64;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = partial apply for implicit closure #5 in MediaML.getPrediction(data:);
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v22;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v5;
  swift_retain();
  *uint64_t v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v13 = createStorage<A>(capacity:type:)(1);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    uint32_t v29 = buf;
    os_log_type_t v30 = v13;
    Swift::String v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_255CF7000, v27, v28, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v13, 1, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v15[56];
  __n128 v8 = v15[46];
  __n128 v9 = v15[44];

  v10(v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void, void))(v15[28] + 8);
  return v6(0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void, void);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  id v18;
  uint32_t size;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  uint64_t v34 = v0;
  *(void *)(v0 + 224) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined release of CellDataPointForPrediction(v0 + 16);
  uint64_t v18 = *(id *)(v0 + 544);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v16 = *(void *)(v0 + 352);
  uint64_t v2 = v18;
  *(void *)(v0 + 312) = v18;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  v17(v1, v3, v16);
  uint64_t v4 = v18;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v27 = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.error.getter();
  *(void *)(v0 + 320) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 572);
  uint64_t v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 64;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = partial apply for implicit closure #5 in MediaML.getPrediction(data:);
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v22 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)partial apply;
  *(void *)(v25 + 24) = v22;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v5;
  swift_retain();
  *uint64_t v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v13 = createStorage<A>(capacity:type:)(1);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    uint32_t v29 = buf;
    os_log_type_t v30 = v13;
    Swift::String v31 = v14;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_255CF7000, v27, v28, "Failed to get prediction from model with error=%@", buf, size);
    destroyStorage<A>(_:count:)(v13, 1, v11);
    destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v10 = (void (*)(uint64_t, uint64_t))v15[56];
  __n128 v8 = v15[46];
  __n128 v9 = v15[44];

  v10(v8, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void, void))(v15[28] + 8);
  return v6(0, 0);
}

uint64_t MediaML.getPrediction(data:)(uint64_t a1, char a2)
{
  uint64_t v8 = *v3;
  *(void *)(v8 + 224) = *v3;
  *(void *)(v8 + 496) = v2;
  *(void *)(v8 + 504) = a1;
  *(unsigned char *)(v8 + 582) = a2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v4 = *(void *)(v8 + 344);
    uint64_t v5 = MediaML.getPrediction(data:);
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 344);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = MediaML.getPrediction(data:);
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v8 = *v3;
  *(void *)(v8 + 224) = *v3;
  *(void *)(v8 + 544) = v2;
  *(void *)(v8 + 552) = a1;
  *(unsigned char *)(v8 + 583) = a2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v4 = *(void *)(v8 + 344);
    uint64_t v5 = MediaML.getPrediction(data:);
  }
  else
  {
    uint64_t v7 = *(void *)(v8 + 344);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = v7;
    uint64_t v5 = MediaML.getPrediction(data:);
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

void *implicit closure #5 in MediaML.getPredictionDictionary(data:)(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t implicit closure #4 in MediaML.getPrediction(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *a2 = a1;
  return result;
}

void *implicit closure #5 in MediaML.getPrediction(data:)(void *a1)
{
  id v1 = a1;
  return a1;
}

uint64_t MediaML.getModelStats()()
{
  v1[14] = v0;
  v1[8] = v1;
  v1[9] = 0;
  v1[11] = 0;
  v1[13] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[15] = v2;
  v1[16] = *(void *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[9] = v4;
  return MEMORY[0x270FA2498](MediaML.getModelStats(), v4, 0);
}

{
  void *v0;
  uint64_t (*v1)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  uint64_t v7 = v0[14];
  v0[8] = v0;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v7 + 112);
  swift_retain();
  swift_endAccess();
  v0[10] = v8;
  if (v0[10])
  {
    outlined destroy of DataWriter?();
    uint64_t v4 = v6[14];
    swift_beginAccess();
    uint64_t v5 = *(void *)(v4 + 112);
    v6[18] = v5;
    swift_retain();
    swift_endAccess();
    if (v5)
    {
      uint64_t v3 = (void *)swift_task_alloc();
      v6[19] = v3;
      *uint64_t v3 = v6[8];
      v3[1] = MediaML.getModelStats();
      return DataWriter.readModelStatsFromDB()();
    }
    else
    {
      return _assertionFailure(_:_:file:line:flags:)();
    }
  }
  else
  {
    outlined destroy of DataWriter?();
    swift_task_dealloc();
    id v1 = *(uint64_t (**)(void))(v6[8] + 8);
    return v1(0);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  id v1 = v0[20];
  v0[8] = v0;
  v0[13] = v1;
  uint64_t v4 = v0[20];
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0[8] + 8);
  return v2(v4);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t (*v6)(void);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint32_t size;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  uint64_t v34 = v0;
  uint64_t v19 = *(id *)(v0 + 168);
  id v1 = *(void *)(v0 + 136);
  uint64_t v17 = *(void *)(v0 + 128);
  uint64_t v18 = *(void *)(v0 + 120);
  *(void *)(v0 + 64) = v0;
  swift_release();
  uint64_t v2 = v19;
  *(void *)(v0 + 88) = v19;
  uint64_t v3 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v1, v3, v18);
  uint64_t v4 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  uint64_t v27 = Logger.logObject.getter();
  uint64_t v28 = static os_log_type_t.error.getter();
  *(void *)(v0 + 96) = 12;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 176);
  uint64_t v23 = swift_allocObject();
  *(unsigned char *)(v23 + 16) = 32;
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = partial apply for implicit closure #1 in MediaML.getModelStats();
  *(void *)(v22 + 24) = v21;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)partial apply;
  *(void *)(v25 + 24) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v26 = v5;
  swift_retain();
  *uint64_t v26 = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[1] = v23;
  swift_retain();
  v26[2] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[3] = v24;
  swift_retain();
  v26[4] = closure #1 in OSLogArguments.append(_:)partial apply;
  v26[5] = v25;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v27, v28))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    char v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v14 = createStorage<A>(capacity:type:)(0);
    char v15 = createStorage<A>(capacity:type:)(1);
    uint32_t v29 = buf;
    os_log_type_t v30 = v14;
    Swift::String v31 = v15;
    serialize(_:at:)(2, &v29);
    serialize(_:at:)(1, &v29);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v23;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v24;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))closure #1 in OSLogArguments.append(_:)partial apply;
    uint64_t v33 = v25;
    closure #1 in osLogInternal(_:log:type:)(&v32, (uint64_t)&v29, (uint64_t)&v30, (uint64_t)&v31);
    _os_log_impl(&dword_255CF7000, v27, v28, "Failed to get model stats with err=%s", buf, size);
    destroyStorage<A>(_:count:)(v14, 0, v12);
    destroyStorage<A>(_:count:)(v15, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x25A298650](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v11 = (id)v16[21];
  uint64_t v9 = v16[17];
  uint64_t v10 = v16[15];
  uint64_t v8 = v16[16];

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v16[8] + 8);
  return v6(0);
}

uint64_t MediaML.getModelStats()(uint64_t a1)
{
  uint64_t v7 = (void *)*v2;
  v7[8] = *v2;
  v7[20] = a1;
  v7[21] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v3 = v7[14];
    uint64_t v4 = MediaML.getModelStats();
  }
  else
  {
    uint64_t v6 = v7[14];
    swift_release();
    uint64_t v3 = v6;
    uint64_t v4 = MediaML.getModelStats();
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t implicit closure #1 in MediaML.getModelStats()()
{
  return Error.localizedDescription.getter();
}

uint64_t MediaML.__allocating_init()()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  *uint64_t v1 = *(void *)(v3 + 16);
  v1[1] = MediaML.__allocating_init();
  return MediaML.init()();
}

uint64_t MediaML.__allocating_init()(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 16) = *v2;
  uint64_t v8 = v3 + 16;
  uint64_t v4 = swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  else
  {
    uint64_t v4 = a1;
    uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v8 + 8);
  }
  return v5(v4);
}

uint64_t MediaML.init()()
{
  *(void *)(v1 + 56) = v0;
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 136) = 0;
  uint64_t v59 = type metadata accessor for URL();
  uint64_t v58 = *(void *)(v59 - 8);
  uint64_t v51 = swift_task_alloc();
  *(void *)(v1 + 64) = v51;
  uint64_t v52 = swift_task_alloc();
  *(void *)(v1 + 72) = v52;
  uint64_t v53 = swift_task_alloc();
  *(void *)(v1 + 80) = v53;
  uint64_t v54 = swift_task_alloc();
  *(void *)(v1 + 88) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URLResourceValues?);
  uint64_t v55 = swift_task_alloc();
  *(void *)(v1 + 96) = v55;
  uint64_t v56 = swift_task_alloc();
  *(void *)(v1 + 104) = v56;
  uint64_t v61 = swift_task_alloc();
  *(void *)(v1 + 112) = v61;
  *(void *)(v1 + 24) = v57;
  swift_defaultActor_initialize();
  *(void *)(v57 + 112) = 0;
  uint64_t v2 = mediaMLBaseDirectory.unsafeMutableAddressor();
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16);
  v60(v54, v2, v59);
  type metadata accessor for NSURLResourceKey();
  _allocateUninitializedArray<A>(_:)();
  outlined init with copy of NSURLResourceKey(MEMORY[0x263EFF6A8], v3);
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
  Set.init(arrayLiteral:)();
  URL.resourceValues(forKeys:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v54, v59);
  uint64_t v4 = type metadata accessor for URLResourceValues();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 56))(v61, 0, 1);
  uint64_t v47 = type metadata accessor for URLResourceValues();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t))(v48 + 48);
  if (v49(v61, 1) == 1)
  {
    outlined destroy of URLResourceValues?(v61);
    char v46 = 2;
  }
  else
  {
    char v45 = URLResourceValues.isDirectory.getter();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v61, v47);
    char v46 = v45;
  }
  *(unsigned char *)(v50 + 137) = v46;
  *(unsigned char *)(v50 + 138) = 1;
  if (*(unsigned char *)(v50 + 137) != 2)
  {
    outlined init with copy of Bool?((unsigned char *)(v50 + 137), (unsigned char *)(v50 + 145));
    if (*(unsigned char *)(v50 + 138) == 2 || (*(unsigned char *)(v50 + 145) & 1) != (*(unsigned char *)(v50 + 138) & 1)) {
      goto LABEL_24;
    }
LABEL_12:
    uint64_t v5 = mediaMLModelDirectory.unsafeMutableAddressor();
    v60(v53, v5, v59);
    _allocateUninitializedArray<A>(_:)();
    outlined init with copy of NSURLResourceKey(MEMORY[0x263EFF6A8], v6);
    _finalizeUninitializedArray<A>(_:)();
    Set.init(arrayLiteral:)();
    URL.resourceValues(forKeys:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v53, v59);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v56, 0, 1, v47);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v49)(v56, 1, v47) == 1)
    {
      outlined destroy of URLResourceValues?(v56);
      char v44 = 2;
    }
    else
    {
      char v43 = URLResourceValues.isDirectory.getter();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v56, v47);
      char v44 = v43;
    }
    *(unsigned char *)(v50 + 141) = v44;
    *(unsigned char *)(v50 + 142) = 1;
    if (*(unsigned char *)(v50 + 141) == 2)
    {
      if (*(unsigned char *)(v50 + 142) == 2)
      {
        BOOL v42 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      outlined init with copy of Bool?((unsigned char *)(v50 + 141), (unsigned char *)(v50 + 144));
      if (*(unsigned char *)(v50 + 142) != 2)
      {
        BOOL v42 = (*(unsigned char *)(v50 + 144) & 1) == (*(unsigned char *)(v50 + 142) & 1);
LABEL_21:
        BOOL v41 = v42;
        goto LABEL_25;
      }
    }
    BOOL v42 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)(v50 + 138) == 2) {
    goto LABEL_12;
  }
LABEL_24:
  BOOL v41 = 0;
LABEL_25:
  if (v41)
  {
    uint64_t v7 = mediaMLDataDirectory.unsafeMutableAddressor();
    v60(v52, v7, v59);
    _allocateUninitializedArray<A>(_:)();
    outlined init with copy of NSURLResourceKey(MEMORY[0x263EFF6A8], v8);
    _finalizeUninitializedArray<A>(_:)();
    Set.init(arrayLiteral:)();
    URL.resourceValues(forKeys:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v52, v59);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v55, 0, 1, v47);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v49)(v55, 1, v47) == 1)
    {
      outlined destroy of URLResourceValues?(v55);
      char v40 = 2;
    }
    else
    {
      char v39 = URLResourceValues.isDirectory.getter();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v55, v47);
      char v40 = v39;
    }
    *(unsigned char *)(v50 + 139) = v40;
    *(unsigned char *)(v50 + 140) = 1;
    if (*(unsigned char *)(v50 + 139) == 2)
    {
      if (*(unsigned char *)(v50 + 140) == 2)
      {
        BOOL v38 = 1;
        goto LABEL_35;
      }
    }
    else
    {
      outlined init with copy of Bool?((unsigned char *)(v50 + 139), (unsigned char *)(v50 + 143));
      if (*(unsigned char *)(v50 + 140) != 2)
      {
        BOOL v38 = (*(unsigned char *)(v50 + 143) & 1) == (*(unsigned char *)(v50 + 140) & 1);
LABEL_35:
        BOOL v37 = v38;
        goto LABEL_39;
      }
    }
    BOOL v38 = 0;
    goto LABEL_35;
  }
  BOOL v37 = 0;
LABEL_39:
  *(unsigned char *)(v50 + 136) = v37;
  if (v37)
  {
LABEL_43:
    type metadata accessor for WifiModel();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v50 + 120) = v23;
    *uint64_t v23 = *(void *)(v50 + 16);
    v23[1] = MediaML.init();
    return WifiModel.__allocating_init()();
  }
  id v35 = objc_msgSend(self, sel_defaultManager);
  uint64_t v9 = mediaMLBaseDirectory.unsafeMutableAddressor();
  v60(v51, v9, v59);
  URL._bridgeToObjectiveC()(v10);
  id v34 = v11;
  uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
  v32(v51, v59);
  *(void *)(v50 + 32) = 0;
  unsigned __int8 v36 = objc_msgSend(v35, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v34, 1, 0, v50 + 32);
  uint64_t v33 = *(void **)(v50 + 32);
  id v12 = v33;

  if (v36)
  {
    id v30 = objc_msgSend(self, sel_defaultManager);
    uint64_t v13 = mediaMLDataDirectory.unsafeMutableAddressor();
    v60(v51, v13, v59);
    URL._bridgeToObjectiveC()(v14);
    id v29 = v15;
    v32(v51, v59);
    *(void *)(v50 + 40) = 0;
    unsigned __int8 v31 = objc_msgSend(v30, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v29, 1, 0, v50 + 40);
    uint64_t v28 = *(void **)(v50 + 40);
    id v16 = v28;

    if (v31)
    {
      id v26 = objc_msgSend(self, sel_defaultManager);
      uint64_t v17 = mediaMLModelDirectory.unsafeMutableAddressor();
      v60(v51, v17, v59);
      URL._bridgeToObjectiveC()(v18);
      id v25 = v19;
      v32(v51, v59);
      *(void *)(v50 + 48) = 0;
      unsigned __int8 v27 = objc_msgSend(v26, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v25, 1, 0, v50 + 48);
      uint64_t v24 = *(void **)(v50 + 48);
      id v20 = v24;

      if (v27) {
        goto LABEL_43;
      }
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
    else
    {
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
  else
  {
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  outlined destroy of DataWriter?();
  swift_defaultActor_destroy();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)())(*(void *)(v50 + 16) + 8);
  return v22();
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  *(void *)(v0 + 16) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 16) + 8);
  uint64_t v2 = *(void *)(v0 + 56);
  return v1(v2);
}

uint64_t MediaML.init()(uint64_t a1)
{
  uint64_t v5 = *v1;
  uint64_t v3 = *(void *)(*v1 + 56);
  *(void *)(v5 + 16) = *v1;
  swift_task_dealloc();
  *(void *)(v3 + 120) = a1;
  type metadata accessor for CellularModel();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v5 + 128) = v6;
  *uint64_t v6 = *(void *)(v5 + 16);
  v6[1] = MediaML.init();
  return CellularModel.__allocating_init()();
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 16) = *(void *)v1;
  swift_task_dealloc();
  *(void *)(v3 + 128) = a1;
  return MEMORY[0x270FA2498](MediaML.init(), v3, 0);
}

uint64_t MediaML.deinit()
{
  uint64_t v33 = 0;
  uint64_t v21 = closure #1 in osLogInternal(_:log:type:)partial apply;
  uint64_t v43 = 0;
  uint64_t v22 = 0;
  uint64_t v28 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v28 - 8);
  uint64_t v27 = v28 - 8;
  unint64_t v24 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  uint64_t v0 = (char *)&v8 - v24;
  id v25 = (char *)&v8 - v24;
  uint64_t v43 = v1;
  uint64_t v2 = MediaML.logger.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v0, v2, v28);
  id v35 = Logger.logObject.getter();
  int v34 = static os_log_type_t.info.getter();
  unsigned __int8 v31 = &v41;
  uint64_t v41 = 2;
  unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v30 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v32 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v36 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v35, (os_log_type_t)v34))
  {
    uint64_t v3 = v22;
    uint64_t v11 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v10 = 0;
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    uint64_t v13 = createStorage<A>(capacity:type:)(v10);
    uint64_t v17 = &v40;
    char v40 = v11;
    uint64_t v18 = &v39;
    uint64_t v39 = v12;
    char v15 = &v38;
    uint64_t v38 = v13;
    unsigned int v14 = 0;
    serialize(_:at:)(0, &v40);
    serialize(_:at:)(v14, v17);
    uint64_t v37 = v36;
    id v16 = &v8;
    MEMORY[0x270FA5388](&v8);
    uint64_t v4 = v18;
    uint64_t v5 = &v8 - 6;
    uint64_t v19 = &v8 - 6;
    v5[2] = (uint64_t)v17;
    v5[3] = (uint64_t)v4;
    v5[4] = v6;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v3)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_255CF7000, v35, (os_log_type_t)v34, "MediaML deinit successful!", v11, v32);
      uint64_t v8 = 0;
      destroyStorage<A>(_:count:)(v12, 0, v9);
      destroyStorage<A>(_:count:)(v13, v8, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x25A298650](v11, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v28);
  outlined destroy of DataWriter?();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v23;
}

uint64_t MediaML.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t MediaML.unownedExecutor.getter()
{
  return UnownedSerialExecutor.init(_:)();
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance MediaML()
{
  return MediaML.unownedExecutor.getter();
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NSURLResourceKey()
{
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey()
{
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NSURLResourceKey()
{
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)() & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NSURLResourceKey()
{
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NSURLResourceKey()
{
  return _SwiftNewtypeWrapper<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NSURLResourceKey()
{
  return _SwiftNewtypeWrapper<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance NSURLResourceKey()
{
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NSURLResourceKey()
{
  return == infix<A>(_:_:)() & 1;
}

NSURLResourceKey protocol witness for RawRepresentable.init(rawValue:) in conformance NSURLResourceKey@<X0>(Swift::String *a1@<X0>, NSURLResourceKey *a2@<X8>)
{
  NSURLResourceKey result = NSURLResourceKey.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

NSURLResourceKey __swiftcall NSURLResourceKey.init(rawValue:)(Swift::String rawValue)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)MEMORY[0x25A298300](rawValue._countAndFlagsBits, rawValue._object);
  id v1 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (NSURLResourceKey)v4;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NSURLResourceKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NSURLResourceKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t NSURLResourceKey.rawValue.getter(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NSURLResourceKey()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_255D4EC98()
{
  return swift_deallocObject();
}

unsigned char **_s2os14OSLogArgumentsV6appendyys5UInt8VFySpyAFGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_255D4ECCC()
{
  return swift_deallocObject();
}

uint64_t sub_255D4ED00()
{
  return swift_deallocObject();
}

void *_s2os18OSLogInterpolationV06appendC0_7privacy10attributesys5Error_pyXA_AA0B7PrivacyVSStFSo8NSObjectCycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(void (**)(void))(v0 + 16));
}

uint64_t sub_255D4ED4C()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_7privacy10attributesySo8NSObjectCyXA_AA0B7PrivacyVSStFAHSgycfu_TA_0()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D4ED98()
{
  return swift_deallocObject();
}

void _s2os14OSLogArgumentsV6appendyySo8NSObjectCSgycFySpys5UInt8VGz_SpyAGGSgzSpyypGSgztcfU_TA_0(uint64_t *a1, void **a2, uint64_t a3)
{
  closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t _s2os0A11LogInternal_3log4typeyAA12OSLogMessageV_So03OS_a1_D0CSo0a1_d1_E2_tatFyySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcXEfU_TA_1(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  return closure #1 in osLogInternal(_:log:type:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_255D4EE14()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in DataWriter.createTables()()
{
  return implicit closure #1 in DataWriter.createTables()(*(void *)(v0 + 16));
}

uint64_t partial apply for implicit closure #2 in DataWriter.createTables()()
{
  return implicit closure #2 in DataWriter.createTables()(v0);
}

uint64_t sub_255D4EE50()
{
  return swift_deallocObject();
}

uint64_t sub_255D4EE84()
{
  return swift_deallocObject();
}

uint64_t sub_255D4EEB8()
{
  return swift_deallocObject();
}

uint64_t _sSiIegd_SiIegr_TRTA_2@<X0>(uint64_t *a1@<X8>)
{
  return thunk for @escaping @callee_guaranteed () -> (@unowned Int)(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_255D4EF04()
{
  return swift_deallocObject();
}

uint64_t _s2os14OSLogArgumentsV6appendyyxycs17FixedWidthIntegerRzlFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_2(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v3 + 24);
  unint64_t v4 = lazy protocol witness table accessor for type Int and conformance Int();
  uint64_t v5 = MEMORY[0x263F8D6C8];

  return closure #1 in OSLogArguments.append<A>(_:)(a1, a2, a3, v9, v10, v5, v4);
}

uint64_t sub_255D4EFB8()
{
  return swift_deallocObject();
}

uint64_t sub_255D4EFEC()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F020()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F06C()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #4 in DataWriter.createTables()(uint64_t a1)
{
  return closure #4 in DataWriter.createTables()(a1, v1);
}

uint64_t partial apply for implicit closure #3 in DataWriter.createTables()()
{
  return implicit closure #3 in DataWriter.createTables()(v0);
}

uint64_t sub_255D4F14C()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F180()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F1B4()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F200()
{
  return swift_deallocObject();
}

uint64_t outlined retain of WiFiDataPointForWriting(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #1 in DataWriter.writeRawDataForWiFi(data:)(uint64_t a1)
{
  return closure #1 in DataWriter.writeRawDataForWiFi(data:)(a1, *(long long **)(v1 + 16));
}

uint64_t outlined release of WiFiDataPointForWriting(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of CellDataPointForWriting(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #1 in DataWriter.writeRawDataForCell(data:)(uint64_t a1)
{
  return closure #1 in DataWriter.writeRawDataForCell(data:)(a1, *(long long **)(v1 + 16));
}

uint64_t outlined release of CellDataPointForWriting(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of DataWriter?()
{
}

uint64_t type metadata accessor for DataWriter()
{
  return self;
}

uint64_t sub_255D4F528()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #1 in MediaML.ensureDataWriter()()
{
  return implicit closure #1 in MediaML.ensureDataWriter()(*(void **)(v0 + 16));
}

uint64_t sub_255D4F570()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F5A4()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F5D8()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F624()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F670()
{
  return swift_deallocObject();
}

__n128 outlined init with take of Any(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_255D4F6D8()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #11 in MediaML.writeWifiData(data:)()
{
  return implicit closure #11 in MediaML.writeWifiData(data:)(*(void **)(v0 + 16));
}

uint64_t sub_255D4F720()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F754()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F788()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F7D4()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F820()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F89C()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #10 in MediaML.writeCellData(data:)()
{
  return implicit closure #10 in MediaML.writeCellData(data:)(*(void **)(v0 + 16));
}

uint64_t sub_255D4F8E4()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F918()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F94C()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F998()
{
  return swift_deallocObject();
}

uint64_t sub_255D4F9E4()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FA60()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaML.writeData(data:)@<X0>(void *a1@<X8>)
{
  return implicit closure #1 in MediaML.writeData(data:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_255D4FAA8()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_0()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  unint64_t v1 = lazy protocol witness table accessor for type [String : Any] and conformance [A : B]();

  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

uint64_t sub_255D4FBCC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in MediaML.writeData(data:)()
{
  return implicit closure #2 in MediaML.writeData(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D4FC00()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FC34()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FC68()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyySSyXA_AA0B15StringAlignmentVAA0B7PrivacyVtFSSycfu_TA_1()
{
  return implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_255D4FCB4()
{
  return swift_deallocObject();
}

void *_s2os14OSLogArgumentsV6appendyySSycFySpys5UInt8VGz_SpySo8NSObjectCSgGSgzSpyypGSgztcfU_TA_1(void *a1, uint64_t a2, uint64_t *a3)
{
  return closure #1 in OSLogArguments.append(_:)(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_255D4FD00()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FD34()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FD68()
{
  return swift_deallocObject();
}

uint64_t sub_255D4FDB4()
{
  return swift_deallocObject();
}

uint64_t outlined release of CellDataPointForPrediction(uint64_t a1)
{
  return a1;
}

uint64_t sub_255D50058()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #5 in MediaML.getPredictionDictionary(data:)()
{
  return implicit closure #5 in MediaML.getPredictionDictionary(data:)(*(void **)(v0 + 16));
}

uint64_t sub_255D500A0()
{
  return swift_deallocObject();
}

uint64_t sub_255D500D4()
{
  return swift_deallocObject();
}

uint64_t sub_255D50108()
{
  return swift_deallocObject();
}

uint64_t sub_255D50154()
{
  return swift_deallocObject();
}

uint64_t sub_255D501A0()
{
  return swift_deallocObject();
}

uint64_t outlined release of WiFiDataPointForPrediciton(uint64_t a1)
{
  return a1;
}

uint64_t sub_255D5025C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in MediaML.getPrediction(data:)()
{
  return implicit closure #2 in MediaML.getPrediction(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D50290()
{
  return swift_deallocObject();
}

uint64_t sub_255D502C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D502F8()
{
  return swift_deallocObject();
}

uint64_t sub_255D50344()
{
  return swift_deallocObject();
}

uint64_t sub_255D503F8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in MediaML.getPrediction(data:)()
{
  return implicit closure #3 in MediaML.getPrediction(data:)(*(void *)(v0 + 16));
}

uint64_t sub_255D5042C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in MediaML.getPrediction(data:)@<X0>(void *a1@<X8>)
{
  return implicit closure #4 in MediaML.getPrediction(data:)(*(void *)(v1 + 16), a1);
}

uint64_t sub_255D50474()
{
  return swift_deallocObject();
}

uint64_t sub_255D50514()
{
  return swift_deallocObject();
}

uint64_t sub_255D50548()
{
  return swift_deallocObject();
}

uint64_t sub_255D5057C()
{
  return swift_deallocObject();
}

uint64_t sub_255D505C8()
{
  return swift_deallocObject();
}

uint64_t sub_255D5067C()
{
  return swift_deallocObject();
}

uint64_t sub_255D506B0()
{
  return swift_deallocObject();
}

uint64_t sub_255D506E4()
{
  return swift_deallocObject();
}

uint64_t sub_255D50730()
{
  return swift_deallocObject();
}

uint64_t sub_255D5077C()
{
  return swift_deallocObject();
}

void *partial apply for implicit closure #5 in MediaML.getPrediction(data:)()
{
  return implicit closure #5 in MediaML.getPrediction(data:)(*(void **)(v0 + 16));
}

uint64_t sub_255D507C4()
{
  return swift_deallocObject();
}

uint64_t sub_255D507F8()
{
  return swift_deallocObject();
}

uint64_t sub_255D5082C()
{
  return swift_deallocObject();
}

uint64_t sub_255D50878()
{
  return swift_deallocObject();
}

uint64_t sub_255D508C4()
{
  return swift_deallocObject();
}

unsigned char *outlined init with copy of Bool?(unsigned char *a1, unsigned char *a2)
{
  __n128 result = a2;
  *a2 = *a1;
  return result;
}

uint64_t sub_255D50924()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in MediaML.getModelStats()()
{
  return implicit closure #1 in MediaML.getModelStats()();
}

uint64_t sub_255D5096C()
{
  return swift_deallocObject();
}

uint64_t sub_255D509A0()
{
  return swift_deallocObject();
}

uint64_t sub_255D509D4()
{
  return swift_deallocObject();
}

uint64_t sub_255D50A20()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for NSURLResourceKey()
{
  uint64_t v4 = lazy cache variable for type metadata for NSURLResourceKey;
  if (!lazy cache variable for type metadata for NSURLResourceKey)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSURLResourceKey);
      return v1;
    }
  }
  return v4;
}

void *outlined init with copy of NSURLResourceKey(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  __n128 result = a2;
  *a2 = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    type metadata accessor for NSURLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    type metadata accessor for NSURLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    type metadata accessor for NSURLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    type metadata accessor for NSURLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey;
  if (!lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey)
  {
    type metadata accessor for NSURLResourceKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSURLResourceKey and conformance NSURLResourceKey);
    return WitnessTable;
  }
  return v2;
}

uint64_t outlined destroy of URLResourceValues?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URLResourceValues();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for WiFiDataPointForWriting(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for WiFiDataPointForWriting()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WiFiDataPointForWriting(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = a2[4];
  swift_bridgeObjectRetain();
  a1[4] = v4;
  a1[5] = a2[5];
  uint64_t v6 = a2[6];
  swift_bridgeObjectRetain();
  __n128 result = a1;
  a1[6] = v6;
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  return result;
}

double assignWithCopy for WiFiDataPointForWriting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  double result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy128_8(void *a1, const void *a2)
{
}

double assignWithTake for WiFiDataPointForWriting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  double result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WiFiDataPointForWriting(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 128))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiDataPointForWriting(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)double result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(void *)(result + 96) = 0;
    *(void *)(result + 104) = 0;
    *(void *)(result + 112) = 0;
    *(void *)(result + 120) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 128) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 128) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiDataPointForWriting()
{
  return &type metadata for WiFiDataPointForWriting;
}

uint64_t initializeBufferWithCopyOfBuffer for CellDataPointForWriting(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for CellDataPointForWriting()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CellDataPointForWriting(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  uint64_t v4 = a2[4];
  swift_bridgeObjectRetain();
  a1[4] = v4;
  a1[5] = a2[5];
  uint64_t v6 = a2[6];
  swift_bridgeObjectRetain();
  double result = a1;
  a1[6] = v6;
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  return result;
}

double assignWithCopy for CellDataPointForWriting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  double result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

double assignWithTake for CellDataPointForWriting(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  double result = *(double *)(a2 + 120);
  *(double *)(a1 + 120) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CellDataPointForWriting(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 128))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)(a1 + 8) < 0x100000000uLL) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CellDataPointForWriting(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)double result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    *(void *)(result + 80) = 0;
    *(void *)(result + 88) = 0;
    *(void *)(result + 96) = 0;
    *(void *)(result + 104) = 0;
    *(void *)(result + 112) = 0;
    *(void *)(result + 120) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 128) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 128) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CellDataPointForWriting()
{
  return &type metadata for CellDataPointForWriting;
}

uint64_t initializeBufferWithCopyOfBuffer for WiFiDataPointForPrediciton(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for WiFiDataPointForPrediciton()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WiFiDataPointForPrediciton(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  double result = a1;
  a1[3] = v5;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

double assignWithCopy for WiFiDataPointForPrediciton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  double result = *(double *)(a2 + 72);
  *(double *)(a1 + 72) = result;
  return result;
}

double assignWithTake for WiFiDataPointForPrediciton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  double result = *(double *)(a2 + 72);
  *(double *)(a1 + 72) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WiFiDataPointForPrediciton(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiDataPointForPrediciton(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)double result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 80) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 80) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiDataPointForPrediciton()
{
  return &type metadata for WiFiDataPointForPrediciton;
}

uint64_t initializeBufferWithCopyOfBuffer for CellDataPointForPrediction(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  swift_retain();
  *a1 = v4;
  return *a1 + 16;
}

uint64_t destroy for CellDataPointForPrediction()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CellDataPointForPrediction(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  double result = a1;
  a1[3] = v5;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

void *assignWithCopy for CellDataPointForPrediction(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  swift_bridgeObjectRelease();
  double result = a1;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

void *assignWithTake for CellDataPointForPrediction(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  double result = a1;
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  return result;
}

uint64_t getEnumTagSinglePayload for CellDataPointForPrediction(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CellDataPointForPrediction(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)double result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = 0;
    *(void *)(result + 72) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 80) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 80) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CellDataPointForPrediction()
{
  return &type metadata for CellDataPointForPrediction;
}

uint64_t type metadata accessor for MediaML()
{
  return self;
}

unint64_t base witness table accessor for RawRepresentable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

unint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

unint64_t base witness table accessor for Equatable in NSURLResourceKey()
{
  return lazy protocol witness table accessor for type NSURLResourceKey and conformance NSURLResourceKey();
}

uint64_t partial apply for closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(uint64_t a1)
{
  return closure #1 in closure #1 in DataWriter.readModelStatsFromDB()(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined retain of String()
{
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x270EEE920]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x270EEE930]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x270EEE950]();
}

uint64_t URLResourceValues.isDirectory.getter()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t static Calendar.current.getter()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return MEMORY[0x270EF1428]();
}

uint64_t Calendar.component(_:from:)()
{
  return MEMORY[0x270EF1430]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x270EF1440]();
}

uint64_t DataFrameProtocol.randomSplit(by:seed:)()
{
  return MEMORY[0x270F05810]();
}

Swift::Bool __swiftcall DataFrame.containsColumn(_:)(Swift::String a1)
{
  return MEMORY[0x270F05868](a1._countAndFlagsBits, a1._object);
}

uint64_t DataFrame.init(contentsOfCSVFile:columns:rows:types:options:)()
{
  return MEMORY[0x270F05870]();
}

uint64_t DataFrame.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F05878]();
}

uint64_t DataFrame.Rows.count.getter()
{
  return MEMORY[0x270F058B8]();
}

uint64_t type metadata accessor for DataFrame.Rows()
{
  return MEMORY[0x270F058C8]();
}

uint64_t DataFrame.Slice.rows.getter()
{
  return MEMORY[0x270F058F0]();
}

uint64_t DataFrame.Slice.shape.getter()
{
  return MEMORY[0x270F058F8]();
}

uint64_t type metadata accessor for DataFrame.Slice()
{
  return MEMORY[0x270F05900]();
}

uint64_t DataFrame.Slice.subscript.getter()
{
  return MEMORY[0x270F05910]();
}

uint64_t type metadata accessor for DataFrame()
{
  return MEMORY[0x270F05988]();
}

uint64_t DataFrame.init(_:)()
{
  return MEMORY[0x270F05990]();
}

uint64_t DataFrame.subscript.getter()
{
  return MEMORY[0x270F05998]();
}

uint64_t AnyColumnSlice.count.getter()
{
  return MEMORY[0x270F059E0]();
}

uint64_t AnyColumnSlice.distinct()()
{
  return MEMORY[0x270F059E8]();
}

uint64_t type metadata accessor for AnyColumnSlice()
{
  return MEMORY[0x270F059F0]();
}

uint64_t CSVReadingOptions.init(hasHeaderRow:nilEncodings:trueEncodings:falseEncodings:floatingPointType:ignoresEmptyLines:usesQuoting:usesEscaping:delimiter:escapeCharacter:)()
{
  return MEMORY[0x270F059F8]();
}

uint64_t type metadata accessor for CSVReadingOptions()
{
  return MEMORY[0x270F05A00]();
}

uint64_t Column.subscript.getter()
{
  return MEMORY[0x270F05AD0]();
}

uint64_t type metadata accessor for CSVType()
{
  return MEMORY[0x270F05AD8]();
}

uint64_t ColumnID.name.getter()
{
  return MEMORY[0x270F05AE0]();
}

uint64_t type metadata accessor for ColumnID()
{
  return MEMORY[0x270F05AE8]();
}

uint64_t ColumnID.init(_:_:)()
{
  return MEMORY[0x270F05AF0]();
}

uint64_t static MetricsKey.validationError.getter()
{
  return MEMORY[0x270EEA3C0]();
}

uint64_t type metadata accessor for MetricsKey()
{
  return MEMORY[0x270EEA3E0]();
}

uint64_t OneHotEncoder.init()()
{
  return MEMORY[0x270EEA498]();
}

uint64_t ColumnSelector.init(columns:estimator:)()
{
  return MEMORY[0x270EEA4B8]();
}

uint64_t BoostedTreeRegressor.init(annotationColumnName:featureColumnNames:configuration:)()
{
  return MEMORY[0x270EEA650]();
}

uint64_t BoostedTreeConfiguration.randomSeed.setter()
{
  return MEMORY[0x270EEA748]();
}

uint64_t BoostedTreeConfiguration.maximumDepth.setter()
{
  return MEMORY[0x270EEA768]();
}

uint64_t BoostedTreeConfiguration.maximumIterations.setter()
{
  return MEMORY[0x270EEA798]();
}

uint64_t BoostedTreeConfiguration.init()()
{
  return MEMORY[0x270EEA7D0]();
}

uint64_t type metadata accessor for BoostedTreeConfiguration()
{
  return MEMORY[0x270EEA7D8]();
}

uint64_t UpdatableTabularEstimator.appending<A>(_:)()
{
  return MEMORY[0x270EEA7F0]();
}

uint64_t SupervisedTabularEstimator.read(from:)()
{
  return MEMORY[0x270EEA818]();
}

uint64_t SupervisedTabularEstimator.write(_:to:overwrite:)()
{
  return MEMORY[0x270EEA820]();
}

uint64_t Event.metrics.getter()
{
  return MEMORY[0x270EEA958]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t DispatchTime.uptimeNanoseconds.getter()
{
  return MEMORY[0x270FA0A98]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9D330](seed);
}

Swift::String __swiftcall Character.init(_builtinExtendedGraphemeClusterLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinExtendedGraphemeClusterLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D3B8](_builtinExtendedGraphemeClusterLiteral, utf8CodeUnitCount, isASCII);
  result._uint64_t object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t MutableCollection.subscript.getter()
{
  return MEMORY[0x270F9D4E8]();
}

uint64_t UnsafeBufferPointer.baseAddress.getter()
{
  return MEMORY[0x270F9D5A0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._uint64_t object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t static String.+ infix(_:_:)()
{
  return MEMORY[0x270F9D6D0]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D6D8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._uint64_t object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

{
  return MEMORY[0x270F9D7C8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x270F9D990]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t Sequence<>.max()()
{
  return MEMORY[0x270F9D9F0]();
}

uint64_t Sequence<>.min()()
{
  return MEMORY[0x270F9D9F8]();
}

uint64_t Sequence<>.sorted()()
{
  return MEMORY[0x270F9DA00]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DB98]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t specialized Array.count.getter()
{
  return MEMORY[0x270FA1430]();
}

{
  return MEMORY[0x270FA1440]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t specialized Array.append(_:)()
{
  return MEMORY[0x270FA1460]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t specialized Array.subscript.getter()
{
  return MEMORY[0x270FA14B0]();
}

{
  return MEMORY[0x270FA14C0]();
}

uint64_t UnownedSerialExecutor.init(_:)()
{
  return MEMORY[0x270FA2018]();
}

Swift::Double __swiftcall Double.init(_:)(Swift::Double a1)
{
  MEMORY[0x270F9DDC8](a1);
  return result;
}

uint64_t Double.init<A>(_:)()
{
  return MEMORY[0x270F9DDE8]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t specialized Collection<>.makeIterator()()
{
  return MEMORY[0x270FA14D0]();
}

{
  return MEMORY[0x270FA14D8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x270F9E398]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x270F9E890]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x270F9E898]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x270F9EBF8]();
}

uint64_t ContiguousArray.count.getter()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t IndexingIterator.next()()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t specialized IndexingIterator.next()()
{
  return MEMORY[0x270FA14E0]();
}

{
  return MEMORY[0x270FA14E8]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t _assertionFailure(_:_:flags:)()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t _dictionaryUpCast<A, B, C, D>(_:)()
{
  return MEMORY[0x270F9F008]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t _SwiftNewtypeWrapper<>.hashValue.getter()
{
  return MEMORY[0x270F9F198]();
}

uint64_t _SwiftNewtypeWrapper<>._rawHashValue(seed:)()
{
  return MEMORY[0x270F9F1A0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t _SwiftNewtypeWrapper<>.hash(into:)()
{
  return MEMORY[0x270F9F1B0]();
}

uint64_t static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270F9F1B8]();
}

uint64_t static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270F9F1C0]();
}

uint64_t static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270F9F1C8]();
}

uint64_t _SwiftNewtypeWrapper<>._bridgeToObjectiveC()()
{
  return MEMORY[0x270F9F1D0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F778]();
}

{
  return MEMORY[0x270F9F780]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F9F790]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t specialized _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270FA14F0]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x270F9F940]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t abs<A>(_:)()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t max<A>(_:_:)()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t min<A>(_:_:)()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t zip<A, B>(_:_:)()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x270F9FC58]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x270FA0100]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x270FA0108]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x270FA0110]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x270FA0118]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

sqlite3_int64 sqlite3_changes64(sqlite3 *a1)
{
  return MEMORY[0x270F9B548](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x270F9B670](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x270FA2418]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}