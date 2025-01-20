uint64_t DeviceActivityReport.Context.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.Context.rawValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DeviceActivityReport.Context.rawValue.modify())()
{
  return nullsub_1;
}

_DeviceActivity_SwiftUI::DeviceActivityReport::Context __swiftcall DeviceActivityReport.Context.init(_:)(_DeviceActivity_SwiftUI::DeviceActivityReport::Context result)
{
  _DeviceActivity_SwiftUI::DeviceActivityReport::Context *v1 = result;
  return result;
}

_DeviceActivity_SwiftUI::DeviceActivityReport::Context __swiftcall DeviceActivityReport.Context.init(rawValue:)(_DeviceActivity_SwiftUI::DeviceActivityReport::Context rawValue)
{
  _DeviceActivity_SwiftUI::DeviceActivityReport::Context *v1 = rawValue;
  return rawValue;
}

void *sub_23774F094@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_23774F0A0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23774F0AC()
{
  return sub_23776DA08();
}

uint64_t sub_23774F108()
{
  swift_bridgeObjectRetain();
  sub_23776D648();

  return swift_bridgeObjectRelease();
}

uint64_t sub_23774F160()
{
  return sub_23776DA08();
}

uint64_t sub_23774F1B8(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_23776D9B8();
  }
}

double DeviceActivityReport.init(_:filter:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = sub_23776D318();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a1[1];
  v13[0] = *a1;
  v13[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  DeviceActivityReport.init(_:filter:extensionIdentifier:)(v13, (uint64_t)v9, 0, 0, (unint64_t *)v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  double result = *(double *)v14;
  long long v12 = v14[1];
  *a3 = v14[0];
  a3[1] = v12;
  return result;
}

uint64_t DeviceActivityReport.init(_:filter:extensionIdentifier:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  uint64_t v197 = a4;
  uint64_t v196 = a3;
  v198 = a5;
  uint64_t v204 = sub_23776D3E8();
  uint64_t v206 = *(void *)(v204 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v204);
  v214 = (char *)&v179 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v212 = (char *)&v179 - v10;
  MEMORY[0x270FA5388](v9);
  v215 = (char *)&v179 - v11;
  uint64_t v213 = sub_23776D3B8();
  int64_t v220 = *(void *)(v213 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v213);
  v208 = (char *)&v179 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v223 = (char *)&v179 - v15;
  MEMORY[0x270FA5388](v14);
  v216 = (char *)&v179 - v16;
  uint64_t v200 = sub_23776D388();
  uint64_t v205 = *(void *)(v200 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v200);
  v199 = (char *)&v179 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v207 = (char *)&v179 - v20;
  MEMORY[0x270FA5388](v19);
  v219 = (char *)&v179 - v21;
  uint64_t v22 = sub_23776D0E8();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v26 = (char *)&v179 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v222 = (char *)&v179 - v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925740);
  MEMORY[0x270FA5388](v28 - 8);
  v221 = (char *)&v179 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925428);
  MEMORY[0x270FA5388](v30 - 8);
  v218 = (char *)&v179 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = sub_23776CFC8();
  uint64_t v192 = *(void *)(v193 - 8);
  MEMORY[0x270FA5388](v193);
  v201 = (char *)&v179 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_23776D208();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  v37 = (char *)&v179 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  v39 = (char *)&v179 - v38;
  uint64_t v194 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  MEMORY[0x270FA5388](v194);
  v195 = (uint64_t *)((char *)&v179 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v191 = *a1;
  uint64_t v190 = a1[1];
  sub_23776D218();
  uint64_t v189 = DeviceActivityFilter.SegmentInterval.rawValue.getter();
  v41 = *(void (**)(char *, uint64_t))(v34 + 8);
  v41(v39, v33);
  sub_23776D218();
  sub_23776D1F8();
  uint64_t v42 = v33;
  uint64_t v43 = (uint64_t)v218;
  v41(v37, v42);
  uint64_t v202 = a2;
  sub_23776D298();
  uint64_t v44 = sub_23776D288();
  uint64_t v45 = *(void *)(v44 - 8);
  int v187 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v43, 1, v44);
  if (v187 == 1)
  {
    sub_237751BE4(v43, &qword_268925428);
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v46 = sub_23776D278();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v43, v44);
  }
  uint64_t v47 = (uint64_t)v221;
  sub_23776D2D8();
  uint64_t v48 = sub_23776D2B8();
  uint64_t v49 = *(void *)(v48 - 8);
  int v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v47, 1, v48);
  uint64_t v51 = MEMORY[0x263F8EE88];
  uint64_t v188 = v46;
  if (v50 == 1)
  {
    sub_237751BE4(v47, &qword_268925740);
    uint64_t v179 = 0;
    goto LABEL_31;
  }
  uint64_t v52 = sub_23776D2A8();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v48);
  uint64_t v224 = v51;
  uint64_t v53 = v52 + 56;
  uint64_t v54 = 1 << *(unsigned char *)(v52 + 32);
  uint64_t v55 = -1;
  if (v54 < 64) {
    uint64_t v55 = ~(-1 << v54);
  }
  unint64_t v56 = v55 & *(void *)(v52 + 56);
  v218 = (char *)((unint64_t)(v54 + 63) >> 6);
  v221 = (char *)(v23 + 16);
  uint64_t v57 = v52;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v59 = 0;
  while (1)
  {
    if (v56)
    {
      unint64_t v60 = __clz(__rbit64(v56));
      v56 &= v56 - 1;
      unint64_t v61 = v60 | (v59 << 6);
      goto LABEL_10;
    }
    uint64_t v64 = v59 + 1;
    if (__OFADD__(v59, 1)) {
      goto LABEL_131;
    }
    uint64_t v51 = MEMORY[0x263F8EE88];
    if (v64 >= (uint64_t)v218) {
      goto LABEL_30;
    }
    unint64_t v65 = *(void *)(v53 + 8 * v64);
    ++v59;
    if (!v65)
    {
      uint64_t v59 = v64 + 1;
      if (v64 + 1 >= (uint64_t)v218) {
        goto LABEL_30;
      }
      unint64_t v65 = *(void *)(v53 + 8 * v59);
      if (!v65)
      {
        uint64_t v59 = v64 + 2;
        if (v64 + 2 >= (uint64_t)v218) {
          goto LABEL_30;
        }
        unint64_t v65 = *(void *)(v53 + 8 * v59);
        if (!v65)
        {
          uint64_t v59 = v64 + 3;
          if (v64 + 3 >= (uint64_t)v218) {
            goto LABEL_30;
          }
          unint64_t v65 = *(void *)(v53 + 8 * v59);
          if (!v65)
          {
            uint64_t v59 = v64 + 4;
            if (v64 + 4 >= (uint64_t)v218) {
              goto LABEL_30;
            }
            unint64_t v65 = *(void *)(v53 + 8 * v59);
            if (!v65) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    unint64_t v56 = (v65 - 1) & v65;
    unint64_t v61 = __clz(__rbit64(v65)) + (v59 << 6);
LABEL_10:
    v62 = v222;
    (*(void (**)(char *, unint64_t, uint64_t))(v23 + 16))(v222, *(void *)(v57 + 48) + *(void *)(v23 + 72) * v61, v22);
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v26, v62, v22);
    uint64_t v63 = sub_23776D0D8();
    sub_237751470(&v225, v63);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v26, v22);
  }
  uint64_t v66 = v64 + 5;
  if (v66 >= (uint64_t)v218) {
    goto LABEL_30;
  }
  unint64_t v65 = *(void *)(v53 + 8 * v66);
  if (v65)
  {
    uint64_t v59 = v66;
    goto LABEL_29;
  }
  while (1)
  {
    uint64_t v59 = v66 + 1;
    if (__OFADD__(v66, 1)) {
      goto LABEL_135;
    }
    if (v59 >= (uint64_t)v218) {
      break;
    }
    unint64_t v65 = *(void *)(v53 + 8 * v59);
    ++v66;
    if (v65) {
      goto LABEL_29;
    }
  }
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v179 = v224;
LABEL_31:
  uint64_t v186 = sub_23776D1E8();
  uint64_t v185 = sub_23776D1B8();
  uint64_t v184 = sub_23776D1C8();
  uint64_t v183 = sub_23776D1D8();
  uint64_t v182 = v67;
  uint64_t v181 = sub_23776D228();
  uint64_t v180 = v68;
  uint64_t v69 = sub_23776D258();
  uint64_t v225 = v51;
  uint64_t v70 = *(void *)(v69 + 56);
  uint64_t v210 = v69 + 56;
  uint64_t v71 = 1 << *(unsigned char *)(v69 + 32);
  uint64_t v72 = -1;
  if (v71 < 64) {
    uint64_t v72 = ~(-1 << v71);
  }
  unint64_t v73 = v72 & v70;
  int64_t v211 = (unint64_t)(v71 + 63) >> 6;
  uint64_t v74 = v205;
  v221 = (char *)v69;
  v222 = (char *)(v205 + 16);
  uint64_t v217 = v205 + 32;
  v218 = (char *)(v205 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v75 = 0;
  *(void *)&long long v76 = 136446210;
  long long v209 = v76;
  uint64_t v203 = MEMORY[0x263F8EE58] + 8;
  uint64_t v77 = v213;
  v78 = v208;
  v79 = v199;
  uint64_t v80 = v200;
  v81 = v207;
  while (2)
  {
    if (v73)
    {
      unint64_t v83 = __clz(__rbit64(v73));
      v73 &= v73 - 1;
      unint64_t v84 = v83 | (v75 << 6);
LABEL_56:
      v88 = *(void (**)(char *, unint64_t, uint64_t))(v74 + 16);
      v89 = v219;
      v88(v219, *((void *)v221 + 6) + *(void *)(v74 + 72) * v84, v80);
      (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v81, v89, v80);
      uint64_t v90 = sub_23776D378();
      if (v91)
      {
        sub_23775156C(&v224, v90, v91);
        swift_bridgeObjectRelease();
        v82 = *(uint64_t (**)(char *, uint64_t))v218;
      }
      else
      {
        if (qword_268925420 != -1) {
          swift_once();
        }
        uint64_t v92 = sub_23776D418();
        __swift_project_value_buffer(v92, (uint64_t)qword_268926650);
        v88(v79, (unint64_t)v81, v80);
        v93 = sub_23776D3F8();
        uint64_t v94 = v80;
        v95 = v79;
        os_log_type_t v96 = sub_23776D788();
        if (os_log_type_enabled(v93, v96))
        {
          uint64_t v97 = swift_slowAlloc();
          uint64_t v98 = swift_slowAlloc();
          uint64_t v224 = v98;
          *(_DWORD *)uint64_t v97 = v209;
          sub_237756840(&qword_268925430, MEMORY[0x263F10770]);
          uint64_t v99 = sub_23776D998();
          *(void *)(v97 + 4) = sub_237750E08(v99, v100, &v224);
          swift_bridgeObjectRelease();
          v82 = *(uint64_t (**)(char *, uint64_t))v218;
          (*(void (**)(char *, uint64_t))v218)(v95, v94);
          _os_log_impl(&dword_23774D000, v93, v96, "Untokenized application has no bundle identifier: %{public}s", (uint8_t *)v97, 0xCu);
          swift_arrayDestroy();
          uint64_t v101 = v98;
          uint64_t v74 = v205;
          MEMORY[0x237E1FC70](v101, -1, -1);
          uint64_t v102 = v97;
          uint64_t v77 = v213;
          MEMORY[0x237E1FC70](v102, -1, -1);
        }
        else
        {
          v82 = *(uint64_t (**)(char *, uint64_t))v218;
          (*(void (**)(char *, uint64_t))v218)(v95, v94);
        }

        v78 = v208;
        v79 = v95;
        uint64_t v80 = v94;
        v81 = v207;
      }
      uint64_t result = v82(v81, v80);
      continue;
    }
    break;
  }
  int64_t v85 = v75 + 1;
  if (__OFADD__(v75, 1))
  {
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
    goto LABEL_132;
  }
  if (v85 >= v211) {
    goto LABEL_63;
  }
  unint64_t v86 = *(void *)(v210 + 8 * v85);
  ++v75;
  if (v86) {
    goto LABEL_55;
  }
  int64_t v75 = v85 + 1;
  if (v85 + 1 >= v211) {
    goto LABEL_63;
  }
  unint64_t v86 = *(void *)(v210 + 8 * v75);
  if (v86) {
    goto LABEL_55;
  }
  int64_t v75 = v85 + 2;
  if (v85 + 2 >= v211) {
    goto LABEL_63;
  }
  unint64_t v86 = *(void *)(v210 + 8 * v75);
  if (v86) {
    goto LABEL_55;
  }
  int64_t v75 = v85 + 3;
  if (v85 + 3 >= v211) {
    goto LABEL_63;
  }
  unint64_t v86 = *(void *)(v210 + 8 * v75);
  if (v86) {
    goto LABEL_55;
  }
  int64_t v75 = v85 + 4;
  if (v85 + 4 >= v211) {
    goto LABEL_63;
  }
  unint64_t v86 = *(void *)(v210 + 8 * v75);
  if (v86)
  {
LABEL_55:
    unint64_t v73 = (v86 - 1) & v86;
    unint64_t v84 = __clz(__rbit64(v86)) + (v75 << 6);
    goto LABEL_56;
  }
  int64_t v87 = v85 + 5;
  if (v87 < v211)
  {
    unint64_t v86 = *(void *)(v210 + 8 * v87);
    if (!v86)
    {
      while (1)
      {
        int64_t v75 = v87 + 1;
        if (__OFADD__(v87, 1)) {
          break;
        }
        if (v75 >= v211) {
          goto LABEL_63;
        }
        unint64_t v86 = *(void *)(v210 + 8 * v75);
        ++v87;
        if (v86) {
          goto LABEL_55;
        }
      }
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }
    int64_t v75 = v87;
    goto LABEL_55;
  }
LABEL_63:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v210 = v225;
  uint64_t v103 = sub_23776D238();
  uint64_t v225 = MEMORY[0x263F8EE88];
  uint64_t v104 = *(void *)(v103 + 56);
  uint64_t v217 = v103 + 56;
  uint64_t v105 = 1 << *(unsigned char *)(v103 + 32);
  uint64_t v106 = -1;
  if (v105 < 64) {
    uint64_t v106 = ~(-1 << v105);
  }
  unint64_t v107 = v106 & v104;
  v221 = (char *)v103;
  v222 = (char *)(v220 + 16);
  v218 = (char *)((unint64_t)(v105 + 63) >> 6);
  v219 = (char *)(v220 + 32);
  v108 = (void (**)(char *, uint64_t))(v220 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v109 = 0;
  int64_t v211 = MEMORY[0x263F8EE58] + 8;
  uint64_t v110 = v204;
  v111 = v214;
  while (2)
  {
    if (v107)
    {
      unint64_t v113 = __clz(__rbit64(v107));
      v107 &= v107 - 1;
      unint64_t v114 = v113 | (v109 << 6);
LABEL_88:
      int64_t v119 = v220;
      v120 = *(void (**)(char *, unint64_t, uint64_t))(v220 + 16);
      v121 = v216;
      v120(v216, *((void *)v221 + 6) + *(void *)(v220 + 72) * v114, v77);
      (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v223, v121, v77);
      uint64_t v122 = sub_23776D3A8();
      if (v123)
      {
        sub_23775156C(&v224, v122, v123);
        swift_bridgeObjectRelease();
        v112 = *v108;
      }
      else
      {
        if (qword_268925420 != -1) {
          swift_once();
        }
        uint64_t v124 = sub_23776D418();
        __swift_project_value_buffer(v124, (uint64_t)qword_268926650);
        v120(v78, (unint64_t)v223, v77);
        v125 = sub_23776D3F8();
        v126 = v78;
        os_log_type_t v127 = sub_23776D788();
        if (os_log_type_enabled(v125, v127))
        {
          uint64_t v128 = swift_slowAlloc();
          uint64_t v129 = swift_slowAlloc();
          uint64_t v224 = v129;
          *(_DWORD *)uint64_t v128 = v209;
          sub_237756840(&qword_268925438, MEMORY[0x263F10790]);
          uint64_t v130 = sub_23776D998();
          *(void *)(v128 + 4) = sub_237750E08(v130, v131, &v224);
          swift_bridgeObjectRelease();
          v112 = *v108;
          (*v108)(v126, v213);
          _os_log_impl(&dword_23774D000, v125, v127, "Untokenized category has no identifier: %{public}s", (uint8_t *)v128, 0xCu);
          swift_arrayDestroy();
          uint64_t v132 = v129;
          uint64_t v110 = v204;
          MEMORY[0x237E1FC70](v132, -1, -1);
          uint64_t v133 = v128;
          uint64_t v77 = v213;
          MEMORY[0x237E1FC70](v133, -1, -1);
        }
        else
        {
          v112 = *v108;
          (*v108)(v126, v77);
        }

        v111 = v214;
        v78 = v126;
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v112)(v223, v77);
      continue;
    }
    break;
  }
  uint64_t v115 = v109 + 1;
  if (__OFADD__(v109, 1)) {
    goto LABEL_129;
  }
  v116 = v212;
  if (v115 < (uint64_t)v218)
  {
    unint64_t v117 = *(void *)(v217 + 8 * v115);
    ++v109;
    if (!v117)
    {
      uint64_t v109 = v115 + 1;
      if (v115 + 1 >= (uint64_t)v218) {
        goto LABEL_95;
      }
      unint64_t v117 = *(void *)(v217 + 8 * v109);
      if (!v117)
      {
        uint64_t v109 = v115 + 2;
        if (v115 + 2 >= (uint64_t)v218) {
          goto LABEL_95;
        }
        unint64_t v117 = *(void *)(v217 + 8 * v109);
        if (!v117)
        {
          uint64_t v109 = v115 + 3;
          if (v115 + 3 >= (uint64_t)v218) {
            goto LABEL_95;
          }
          unint64_t v117 = *(void *)(v217 + 8 * v109);
          if (!v117)
          {
            uint64_t v109 = v115 + 4;
            if (v115 + 4 >= (uint64_t)v218) {
              goto LABEL_95;
            }
            unint64_t v117 = *(void *)(v217 + 8 * v109);
            if (!v117)
            {
              uint64_t v118 = v115 + 5;
              if (v118 >= (uint64_t)v218) {
                goto LABEL_95;
              }
              unint64_t v117 = *(void *)(v217 + 8 * v118);
              if (!v117)
              {
                while (1)
                {
                  uint64_t v109 = v118 + 1;
                  if (__OFADD__(v118, 1)) {
                    break;
                  }
                  if (v109 >= (uint64_t)v218) {
                    goto LABEL_95;
                  }
                  unint64_t v117 = *(void *)(v217 + 8 * v109);
                  ++v118;
                  if (v117) {
                    goto LABEL_87;
                  }
                }
LABEL_133:
                __break(1u);
                goto LABEL_134;
              }
              uint64_t v109 = v118;
            }
          }
        }
      }
    }
LABEL_87:
    unint64_t v107 = (v117 - 1) & v117;
    unint64_t v114 = __clz(__rbit64(v117)) + (v109 << 6);
    goto LABEL_88;
  }
LABEL_95:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v217 = v225;
  uint64_t v134 = sub_23776D248();
  uint64_t v225 = MEMORY[0x263F8EE88];
  uint64_t v135 = *(void *)(v134 + 56);
  v219 = (char *)(v134 + 56);
  uint64_t v136 = 1 << *(unsigned char *)(v134 + 32);
  uint64_t v137 = -1;
  if (v136 < 64) {
    uint64_t v137 = ~(-1 << v136);
  }
  unint64_t v138 = v137 & v135;
  int64_t v220 = (unint64_t)(v136 + 63) >> 6;
  uint64_t v139 = v206;
  v222 = (char *)v134;
  v223 = (char *)(v206 + 16);
  v221 = (char *)(v206 + 32);
  v140 = (void (**)(char *, uint64_t))(v206 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v141 = 0;
  v218 = (char *)(MEMORY[0x263F8EE58] + 8);
  while (2)
  {
    if (v138)
    {
      unint64_t v143 = __clz(__rbit64(v138));
      v138 &= v138 - 1;
      unint64_t v144 = v143 | (v141 << 6);
LABEL_120:
      v148 = *(void (**)(char *, unint64_t, uint64_t))(v139 + 16);
      v149 = v215;
      v148(v215, *((void *)v222 + 6) + *(void *)(v139 + 72) * v144, v110);
      (*(void (**)(char *, char *, uint64_t))(v139 + 32))(v116, v149, v110);
      uint64_t v150 = sub_23776D3D8();
      if (v151)
      {
        sub_23775156C(&v224, v150, v151);
        swift_bridgeObjectRelease();
        v142 = *v140;
      }
      else
      {
        if (qword_268925420 != -1) {
          swift_once();
        }
        uint64_t v152 = sub_23776D418();
        __swift_project_value_buffer(v152, (uint64_t)qword_268926650);
        v148(v111, (unint64_t)v116, v110);
        v153 = sub_23776D3F8();
        uint64_t v154 = v110;
        os_log_type_t v155 = sub_23776D788();
        if (os_log_type_enabled(v153, v155))
        {
          uint64_t v156 = swift_slowAlloc();
          uint64_t v157 = swift_slowAlloc();
          uint64_t v224 = v157;
          *(_DWORD *)uint64_t v156 = v209;
          sub_237756840(&qword_268925440, MEMORY[0x263F107D0]);
          uint64_t v158 = sub_23776D998();
          *(void *)(v156 + 4) = sub_237750E08(v158, v159, &v224);
          swift_bridgeObjectRelease();
          v142 = *v140;
          (*v140)(v214, v154);
          _os_log_impl(&dword_23774D000, v153, v155, "Untokenized web domain has no domain: %{public}s", (uint8_t *)v156, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x237E1FC70](v157, -1, -1);
          uint64_t v160 = v156;
          v111 = v214;
          MEMORY[0x237E1FC70](v160, -1, -1);
        }
        else
        {
          v142 = *v140;
          (*v140)(v111, v154);
        }

        uint64_t v110 = v154;
        uint64_t v139 = v206;
        v116 = v212;
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v142)(v116, v110);
      continue;
    }
    break;
  }
  int64_t v145 = v141 + 1;
  if (__OFADD__(v141, 1)) {
    goto LABEL_130;
  }
  if (v145 >= v220)
  {
LABEL_127:
    BOOL v161 = v187 == 1;
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v162 = v225;
    uint64_t v163 = (uint64_t)v195;
    uint64_t v164 = v190;
    void *v195 = v191;
    *(void *)(v163 + 8) = v164;
    *(void *)(v163 + 16) = v189;
    v165 = (int *)v194;
    (*(void (**)(uint64_t, char *, uint64_t))(v192 + 32))(v163 + *(int *)(v194 + 24), v201, v193);
    uint64_t v166 = v163 + v165[7];
    *(void *)uint64_t v166 = v188;
    *(unsigned char *)(v166 + 8) = v161;
    *(void *)(v163 + v165[8]) = v179;
    *(void *)(v163 + v165[9]) = v186;
    *(void *)(v163 + v165[10]) = v185;
    *(void *)(v163 + v165[11]) = v184;
    v167 = (uint64_t *)(v163 + v165[12]);
    uint64_t v168 = v182;
    uint64_t *v167 = v183;
    v167[1] = v168;
    v169 = (uint64_t *)(v163 + v165[13]);
    uint64_t v170 = v180;
    uint64_t *v169 = v181;
    v169[1] = v170;
    *(void *)(v163 + v165[14]) = v210;
    *(void *)(v163 + v165[15]) = v217;
    *(void *)(v163 + v165[16]) = v162;
    v171 = (void *)(v163 + v165[17]);
    uint64_t v172 = v197;
    void *v171 = v196;
    v171[1] = v172;
    unint64_t v173 = sub_23775171C();
    sub_23776CFA8();
    swift_allocObject();
    sub_23776CF98();
    sub_237756840(&qword_268925450, (void (*)(uint64_t))type metadata accessor for DeviceActivityReport.ClientConfiguration);
    uint64_t v174 = sub_23776CF88();
    unint64_t v176 = v175;
    sub_23775175C(v163);
    swift_release();
    uint64_t v177 = sub_23776D318();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v177 - 8) + 8))(v202, v177);
    v178 = v198;
    unint64_t *v198 = v173;
    v178[1] = (unint64_t)&off_26EA78A98;
    v178[2] = v174;
    v178[3] = v176;
    return result;
  }
  unint64_t v146 = *(void *)&v219[8 * v145];
  ++v141;
  if (v146) {
    goto LABEL_119;
  }
  int64_t v141 = v145 + 1;
  if (v145 + 1 >= v220) {
    goto LABEL_127;
  }
  unint64_t v146 = *(void *)&v219[8 * v141];
  if (v146) {
    goto LABEL_119;
  }
  int64_t v141 = v145 + 2;
  if (v145 + 2 >= v220) {
    goto LABEL_127;
  }
  unint64_t v146 = *(void *)&v219[8 * v141];
  if (v146) {
    goto LABEL_119;
  }
  int64_t v141 = v145 + 3;
  if (v145 + 3 >= v220) {
    goto LABEL_127;
  }
  unint64_t v146 = *(void *)&v219[8 * v141];
  if (v146) {
    goto LABEL_119;
  }
  int64_t v141 = v145 + 4;
  if (v145 + 4 >= v220) {
    goto LABEL_127;
  }
  unint64_t v146 = *(void *)&v219[8 * v141];
  if (v146)
  {
LABEL_119:
    unint64_t v138 = (v146 - 1) & v146;
    unint64_t v144 = __clz(__rbit64(v146)) + (v141 << 6);
    goto LABEL_120;
  }
  int64_t v147 = v145 + 5;
  if (v147 >= v220) {
    goto LABEL_127;
  }
  unint64_t v146 = *(void *)&v219[8 * v147];
  if (v146)
  {
    int64_t v141 = v147;
    goto LABEL_119;
  }
  while (1)
  {
    int64_t v141 = v147 + 1;
    if (__OFADD__(v147, 1)) {
      break;
    }
    if (v141 >= v220) {
      goto LABEL_127;
    }
    unint64_t v146 = *(void *)&v219[8 * v141];
    ++v147;
    if (v146) {
      goto LABEL_119;
    }
  }
LABEL_134:
  __break(1u);
LABEL_135:
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

uint64_t DeviceActivityReport.body.getter@<X0>(uint64_t *a1@<X8>)
{
  if (*v1)
  {
    sub_2377517B8(v1[2], v1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268925458);
    sub_237751824();
  }
  uint64_t result = sub_23776D5B8();
  *a1 = result;
  return result;
}

uint64_t sub_237750C48()
{
  return sub_23776D578();
}

uint64_t sub_237750C64@<X0>(uint64_t *a1@<X8>)
{
  if (*v1)
  {
    sub_2377517B8(v1[2], v1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268925458);
    sub_237751824();
  }
  uint64_t result = sub_23776D5B8();
  *a1 = result;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_237750D1C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_237750D2C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_237750D68(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237750D90(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_237750E08(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_23776D808();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_237750E08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_237750EDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2377568D8((uint64_t)v12, *a3);
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
      sub_2377568D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_237750EDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23776D818();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_237751098(a5, a6);
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
  uint64_t v8 = sub_23776D888();
  if (!v8)
  {
    sub_23776D8A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_23776D8C8();
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

uint64_t sub_237751098(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_237751130(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_237751310(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_237751310(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237751130(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2377512A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_23776D878();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_23776D8A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_23776D668();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_23776D8C8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_23776D8A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2377512A8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_237751310(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E0);
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
  uint64_t result = sub_23776D8C8();
  __break(1u);
  return result;
}

unsigned char **sub_237751460(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_237751470(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_23776D9D8();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_2377540E8(a2, v9, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_23775156C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_23776D9E8();
  swift_bridgeObjectRetain();
  sub_23776D648();
  uint64_t v8 = sub_23776DA08();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23776D9B8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      if (v19 || (sub_23776D9B8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23775420C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_23775171C()
{
  unint64_t result = qword_268925448;
  if (!qword_268925448)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268925448);
  }
  return result;
}

uint64_t sub_23775175C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2377517B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2377517CC(a1, a2);
  }
  return a1;
}

uint64_t sub_2377517CC(uint64_t a1, unint64_t a2)
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

unint64_t sub_237751824()
{
  unint64_t result = qword_268925460;
  if (!qword_268925460)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925460);
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

unint64_t sub_2377518CC()
{
  unint64_t result = qword_268925468;
  if (!qword_268925468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925468);
  }
  return result;
}

uint64_t sub_237751920()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceActivityReport(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *destroy for DeviceActivityReport(void *result)
{
  if (*result)
  {
    unint64_t v1 = result[3];
    if (v1 >> 60 != 15) {
      return (void *)sub_237751994(result[2], v1);
    }
  }
  return result;
}

uint64_t sub_237751994(uint64_t a1, unint64_t a2)
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

uint64_t initializeWithCopy for DeviceActivityReport(uint64_t a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v3;
    unint64_t v4 = a2 + 2;
    unint64_t v5 = a2[3];
    if (v5 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    }
    else
    {
      uint64_t v7 = *v4;
      sub_2377517CC(*v4, a2[3]);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v5;
    }
  }
  else
  {
    long long v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  return a1;
}

void *assignWithCopy for DeviceActivityReport(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      long long v6 = a1 + 2;
      uint64_t v7 = a2 + 2;
      unint64_t v8 = a2[3];
      if (a1[3] >> 60 == 15)
      {
        if (v8 >> 60 != 15)
        {
          uint64_t v9 = *v7;
LABEL_15:
          sub_2377517CC(v9, v8);
          a1[2] = v9;
          a1[3] = v8;
          return a1;
        }
      }
      else
      {
        if (v8 >> 60 != 15)
        {
          uint64_t v14 = *v7;
          sub_2377517CC(*v7, v8);
          uint64_t v15 = a1[2];
          unint64_t v16 = a1[3];
          a1[2] = v14;
          a1[3] = v8;
          sub_237751994(v15, v16);
          return a1;
        }
        sub_237751B90((uint64_t)(a1 + 2));
      }
      *long long v6 = *(_OWORD *)v7;
    }
    else
    {
      sub_237751BE4((uint64_t)a1, &qword_268925458);
      long long v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v12;
    }
  }
  else if (v4)
  {
    uint64_t v10 = a2[1];
    *a1 = v4;
    a1[1] = v10;
    uint64_t v11 = a2 + 2;
    unint64_t v8 = a2[3];
    if (v8 >> 60 != 15)
    {
      uint64_t v9 = *v11;
      goto LABEL_15;
    }
    *((_OWORD *)a1 + 1) = *(_OWORD *)v11;
  }
  else
  {
    long long v13 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v13;
  }
  return a1;
}

uint64_t sub_237751B90(uint64_t a1)
{
  return a1;
}

uint64_t sub_237751BE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for DeviceActivityReport(uint64_t a1, uint64_t a2)
{
  if (!*(void *)a1) {
    goto LABEL_8;
  }
  if (!*(void *)a2)
  {
    sub_237751BE4(a1, &qword_268925458);
LABEL_8:
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a1 + 16);
  long long v6 = (void *)(a2 + 16);
  unint64_t v7 = *(void *)(a1 + 24);
  if (v7 >> 60 != 15)
  {
    unint64_t v8 = *(void *)(a2 + 24);
    if (v8 >> 60 != 15)
    {
      uint64_t v11 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = *v6;
      *(void *)(a1 + 24) = v8;
      sub_237751994(v11, v7);
      return a1;
    }
    sub_237751B90(a1 + 16);
  }
  *uint64_t v5 = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceActivityReport(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceActivityReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReport()
{
  return &type metadata for DeviceActivityReport;
}

void *initializeBufferWithCopyOfBuffer for DeviceActivityReport.Context(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DeviceActivityReport.Context()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DeviceActivityReport.Context(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for DeviceActivityReport.Context(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceActivityReport.Context(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceActivityReport.Context(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReport.Context()
{
  return &type metadata for DeviceActivityReport.Context;
}

uint64_t sub_237751F0C()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_237751F18(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23776D3E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_237756840(&qword_268925488, MEMORY[0x263F107D0]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_23776D5F8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
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
      sub_237756840(&qword_268925490, MEMORY[0x263F107D0]);
      char v21 = sub_23776D608();
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
    *uint64_t v3 = 0x8000000000000000;
    sub_2377543A8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_23775223C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23776D3B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_237756840(&qword_2689254A0, MEMORY[0x263F10790]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_23776D5F8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
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
      sub_237756840(&qword_2689254A8, MEMORY[0x263F10790]);
      char v21 = sub_23776D608();
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
    *uint64_t v3 = 0x8000000000000000;
    sub_237754664((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_237752560(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23776D388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_237756840(&qword_2689254B8, MEMORY[0x263F10770]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_23776D5F8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
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
      sub_237756840(&qword_2689254C0, MEMORY[0x263F10770]);
      char v21 = sub_23776D608();
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
    *uint64_t v3 = 0x8000000000000000;
    sub_237754920((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_237752884(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_23776D0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_237756840(&qword_268925470, MEMORY[0x263F04A78]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_23776D5F8();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
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
      sub_237756840(&qword_268925478, MEMORY[0x263F04A78]);
      char v21 = sub_23776D608();
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
    *uint64_t v3 = 0x8000000000000000;
    sub_237754BDC((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_237752BA8()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D0);
  uint64_t result = sub_23776D858();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    uint64_t v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_31;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_31;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v17 = v15 + 2;
            if (v17 >= v10)
            {
LABEL_31:
              if (v28 >= 64) {
                bzero((void *)(v2 + 56), 8 * v10);
              }
              else {
                *uint64_t v6 = v26;
              }
              unint64_t v1 = v27;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v5 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_37;
                }
                if (v5 >= v10) {
                  goto LABEL_31;
                }
                unint64_t v16 = v6[v5];
                ++v17;
                if (v16) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v5 = v17;
          }
        }
LABEL_21:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_23776D9D8();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_36;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_237752E18()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D8);
  uint64_t v3 = sub_23776D858();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_23776D9E8();
      sub_23776D648();
      uint64_t result = sub_23776DA08();
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2377530F8()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_23776D3E8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925498);
  uint64_t v5 = sub_23776D858();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    v37 = (void *)(v4 + 56);
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
    unint64_t v14 = v41;
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
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
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
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_237756840(&qword_268925488, MEMORY[0x263F107D0]);
      uint64_t result = sub_23776D5F8();
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
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_2377534F4()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_23776D3B8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254B0);
  uint64_t v5 = sub_23776D858();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    v37 = (void *)(v4 + 56);
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
    unint64_t v14 = v41;
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
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
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
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_237756840(&qword_2689254A0, MEMORY[0x263F10790]);
      uint64_t result = sub_23776D5F8();
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
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_2377538F0()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_23776D388();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254C8);
  uint64_t v5 = sub_23776D858();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    v37 = (void *)(v4 + 56);
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
    unint64_t v14 = v41;
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
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
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
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_237756840(&qword_2689254B8, MEMORY[0x263F10770]);
      uint64_t result = sub_23776D5F8();
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
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_237753CEC()
{
  unint64_t v1 = v0;
  uint64_t v42 = sub_23776D0E8();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925480);
  uint64_t v5 = sub_23776D858();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    v37 = (void *)(v4 + 56);
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
    unint64_t v14 = v41;
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
                unint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
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
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_237756840(&qword_268925470, MEMORY[0x263F04A78]);
      uint64_t result = sub_23776D5F8();
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
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_2377540E8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_237752BA8();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_237754E98();
      goto LABEL_14;
    }
    sub_237755480();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_23776D9D8();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_23776D9C8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_23775420C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_237752E18();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_23775501C();
      goto LABEL_22;
    }
    sub_2377556D0();
  }
  uint64_t v11 = *v4;
  sub_23776D9E8();
  sub_23776D648();
  uint64_t result = sub_23776DA08();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_23776D9B8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_23776D9C8();
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
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_23776D9B8();
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
  int64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *int64_t v21 = v8;
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

uint64_t sub_2377543A8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23776D3E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2377530F8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2377551D0(MEMORY[0x263F107D0], &qword_268925498);
      goto LABEL_12;
    }
    sub_237755980();
  }
  uint64_t v12 = *v3;
  sub_237756840(&qword_268925488, MEMORY[0x263F107D0]);
  uint64_t v13 = sub_23776D5F8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_237756840(&qword_268925490, MEMORY[0x263F107D0]);
      char v21 = sub_23776D608();
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
  uint64_t result = sub_23776D9C8();
  __break(1u);
  return result;
}

uint64_t sub_237754664(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23776D3B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2377534F4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2377551D0(MEMORY[0x263F10790], &qword_2689254B0);
      goto LABEL_12;
    }
    sub_237755D30();
  }
  uint64_t v12 = *v3;
  sub_237756840(&qword_2689254A0, MEMORY[0x263F10790]);
  uint64_t v13 = sub_23776D5F8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_237756840(&qword_2689254A8, MEMORY[0x263F10790]);
      char v21 = sub_23776D608();
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
  uint64_t result = sub_23776D9C8();
  __break(1u);
  return result;
}

uint64_t sub_237754920(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23776D388();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2377538F0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2377551D0(MEMORY[0x263F10770], &qword_2689254C8);
      goto LABEL_12;
    }
    sub_2377560E0();
  }
  uint64_t v12 = *v3;
  sub_237756840(&qword_2689254B8, MEMORY[0x263F10770]);
  uint64_t v13 = sub_23776D5F8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_237756840(&qword_2689254C0, MEMORY[0x263F10770]);
      char v21 = sub_23776D608();
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
  uint64_t result = sub_23776D9C8();
  __break(1u);
  return result;
}

uint64_t sub_237754BDC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_23776D0E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_237753CEC();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2377551D0(MEMORY[0x263F04A78], &qword_268925480);
      goto LABEL_12;
    }
    sub_237756490();
  }
  uint64_t v12 = *v3;
  sub_237756840(&qword_268925470, MEMORY[0x263F04A78]);
  uint64_t v13 = sub_23776D5F8();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_237756840(&qword_268925478, MEMORY[0x263F04A78]);
      char v21 = sub_23776D608();
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
  uint64_t result = sub_23776D9C8();
  __break(1u);
  return result;
}

void *sub_237754E98()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23776D848();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
      goto LABEL_28;
    }
    if (v16 >= v13) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17) {
        break;
      }
    }
LABEL_25:
    unint64_t v19 = __clz(__rbit64(v17));
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = v19 + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 2;
  if (v18 >= v13) {
    goto LABEL_26;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23775501C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_23776D848();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
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

void *sub_2377551D0(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = *v2;
  uint64_t v10 = sub_23776D848();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }
  uint64_t result = (void *)(v10 + 56);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  BOOL v26 = v4;
  uint64_t v27 = (const void *)(v9 + 56);
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v13) {
    uint64_t result = memmove(result, v27, 8 * v13);
  }
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 56);
  int64_t v28 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v22);
    ++v15;
    if (!v23)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v23 = *((void *)v27 + v15);
      if (!v23)
      {
        int64_t v15 = v22 + 2;
        if (v22 + 2 >= v28) {
          goto LABEL_28;
        }
        unint64_t v23 = *((void *)v27 + v15);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_12:
    unint64_t v21 = *(void *)(v6 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v21, v5);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(void *)(v11 + 48) + v21, v8, v5);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v28)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v4 = v26;
    goto LABEL_30;
  }
  unint64_t v23 = *((void *)v27 + v24);
  if (v23)
  {
    int64_t v15 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v15);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_237755480()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D0);
  uint64_t result = sub_23776D858();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_33:
    uint64_t *v1 = v4;
    return result;
  }
  BOOL v26 = v1;
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
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_22;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v15 >= v10) {
      goto LABEL_31;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16) {
        break;
      }
    }
LABEL_21:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_22:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_23776D9D8();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 2;
  if (v17 >= v10)
  {
LABEL_31:
    uint64_t result = swift_release();
    unint64_t v1 = v26;
    goto LABEL_33;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_31;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_21;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_2377556D0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254D8);
  uint64_t v3 = sub_23776D858();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_23776D9E8();
    swift_bridgeObjectRetain();
    sub_23776D648();
    uint64_t result = sub_23776DA08();
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
    unint64_t v1 = v0;
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

uint64_t sub_237755980()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_23776D3E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925498);
  uint64_t v7 = sub_23776D858();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
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
    sub_237756840(&qword_268925488, MEMORY[0x263F107D0]);
    uint64_t result = sub_23776D5F8();
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
    unint64_t v1 = v34;
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

uint64_t sub_237755D30()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_23776D3B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254B0);
  uint64_t v7 = sub_23776D858();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
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
    sub_237756840(&qword_2689254A0, MEMORY[0x263F10790]);
    uint64_t result = sub_23776D5F8();
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
    unint64_t v1 = v34;
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

uint64_t sub_2377560E0()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_23776D388();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254C8);
  uint64_t v7 = sub_23776D858();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
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
    sub_237756840(&qword_2689254B8, MEMORY[0x263F10770]);
    uint64_t result = sub_23776D5F8();
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
    unint64_t v1 = v34;
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

uint64_t sub_237756490()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_23776D0E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925480);
  uint64_t v7 = sub_23776D858();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
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
    sub_237756840(&qword_268925470, MEMORY[0x263F04A78]);
    uint64_t result = sub_23776D5F8();
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
    unint64_t v1 = v34;
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

uint64_t sub_237756840(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2377568D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (**a3)()@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  return sub_23775CA38((uint64_t)v6, a2, a3);
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (**a7)()@<X8>)
{
  uint64_t result = sub_237756A60(a1, a2, a3, a4, *(void *)(a5 + 8), *(void *)(a6 + 8), &v10);
  uint64_t v9 = v10;
  *a7 = sub_23775D70C;
  a7[1] = 0;
  a7[2] = (void (*)())v9;
  return result;
}

uint64_t sub_237756A60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  int64_t v22 = a7;
  uint64_t v23 = a6;
  uint64_t v20 = a5;
  uint64_t v21 = a2;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23776E280;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a3);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v21, a4);
  uint64_t result = sub_23776D048();
  *int64_t v22 = v18;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C>(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10)
{
  uint64_t result = sub_237756CE4(a1, a2, a3, a4, a5, a6, *(void *)(a7 + 8), *(void *)(a8 + 8), &v13, *(void *)(a10 + 8));
  uint64_t v12 = v13;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v12;
  return result;
}

uint64_t sub_237756CE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10)
{
  uint64_t v32 = a8;
  uint64_t v33 = a3;
  uint64_t v27 = a7;
  uint64_t v28 = a2;
  uint64_t v25 = a5;
  uint64_t v26 = a1;
  uint64_t v34 = a9;
  uint64_t v29 = *(void *)(a6 - 8);
  uint64_t v30 = a6;
  uint64_t v31 = a10;
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v11);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v16);
  int64_t v22 = (char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_23776E290;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v26, a4);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v28, v25);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v13, v33, v30);
  uint64_t result = sub_23776D048();
  *uint64_t v34 = v23;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D>(_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t result = sub_23775702C(a1, a2, a3, a4, a5, a6, a7, a8, &v16, *(void *)(a10 + 8), *(void *)(a11 + 8), *(void *)(a12 + 8), *(void *)(a13 + 8));
  uint64_t v15 = v16;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v15;
  return result;
}

uint64_t sub_23775702C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v42 = a8;
  uint64_t v43 = a4;
  uint64_t v34 = a1;
  uint64_t v35 = a7;
  v33[0] = a6;
  uint64_t v37 = a2;
  uint64_t v45 = a9;
  uint64_t v44 = a13;
  uint64_t v41 = a12;
  uint64_t v14 = *(void *)(a8 - 8);
  uint64_t v39 = a3;
  uint64_t v40 = v14;
  uint64_t v36 = a11;
  v33[1] = a10;
  uint64_t v15 = MEMORY[0x270FA5388](a1);
  uint64_t v38 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v15);
  uint64_t v21 = (char *)v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v19);
  uint64_t v26 = (char *)v33 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v30 = (char *)v33 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_23776E2A0;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v30, v34, a5);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, void))(v23 + 16))(v26, v37, v33[0]);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v39, v35);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v38, v43, v42);
  uint64_t result = sub_23776D048();
  *uint64_t v45 = v31;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E>(_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result = sub_237757450(a1, a2, a3, a4, a5, a6, a7, a8, &v19, a10, a11, *(void *)(a12 + 8), *(void *)(a13 + 8), *(void *)(a14 + 8), *(void *)(a15 + 8), *(void *)(a16 + 8));
  uint64_t v18 = v19;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v18;
  return result;
}

uint64_t sub_237757450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v40 = a8;
  uint64_t v38 = a7;
  uint64_t v45 = a2;
  uint64_t v42 = a1;
  uint64_t v57 = a9;
  uint64_t v55 = a5;
  uint64_t v56 = a16;
  uint64_t v52 = a4;
  uint64_t v53 = a15;
  uint64_t v48 = a3;
  uint64_t v49 = a14;
  uint64_t v47 = a10;
  uint64_t v54 = a11;
  uint64_t v51 = *(void *)(a11 - 8);
  uint64_t v43 = a13;
  uint64_t v41 = a12;
  uint64_t v17 = MEMORY[0x270FA5388](a1);
  int v50 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v44 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v37 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v23);
  uint64_t v30 = (char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v34 = (char *)&v37 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_23776E2B0;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v34, v42, a6);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v30, v45, v38);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v25, v48, v40);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v44, v52, v47);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v55, v54);
  uint64_t result = sub_23776D048();
  *uint64_t v57 = v35;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F>(_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t result = sub_237757B28(a1, a2, a3, a4, a5, a6, a7, a8, &v22, a10, a11, a12, a13, *(void *)(a14 + 8), *(void *)(a15 + 8), *(void *)(a16 + 8), *(void *)(a17 + 8), *(void *)(a18 + 8), *(void *)(a19 + 8));
  uint64_t v21 = v22;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v21;
  return result;
}

uint64_t sub_237757940()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23776E2C0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  sub_23775C868();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  return v0;
}

uint64_t sub_237757B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v45 = a8;
  uint64_t v63 = a5;
  uint64_t v68 = a9;
  uint64_t v66 = a6;
  uint64_t v67 = a19;
  uint64_t v59 = a4;
  uint64_t v60 = a17;
  uint64_t v56 = a3;
  uint64_t v57 = a16;
  uint64_t v52 = a2;
  uint64_t v53 = a15;
  uint64_t v49 = a1;
  uint64_t v50 = a14;
  uint64_t v58 = a12;
  uint64_t v64 = a13;
  uint64_t v65 = a18;
  uint64_t v62 = *(void *)(a13 - 8);
  uint64_t v46 = a10;
  uint64_t v51 = a11;
  uint64_t v20 = MEMORY[0x270FA5388](a1);
  unint64_t v61 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = *(void *)(v22 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v54 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = *(void *)(v25 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v47 = (char *)&v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v26);
  uint64_t v32 = (char *)&v44 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v30);
  uint64_t v37 = (char *)&v44 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v41 = (char *)&v44 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_23776E2C0;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v41, v49, a7);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v37, v52, v45);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v56, v46);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v47, v59, v51);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v63, v58);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v66, v64);
  uint64_t result = sub_23776D048();
  *uint64_t v68 = v42;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t result = sub_237758310(a1, a2, a3, a4, a5, a6, a7, a8, &v25, a10, a11, a12, a13, a14, a15, *(void *)(a16 + 8), *(void *)(a17 + 8), *(void *)(a18 + 8), *(void *)(a19 + 8),
             *(void *)(a20 + 8),
             *(void *)(a21 + 8),
             *(void *)(a22 + 8));
  uint64_t v24 = v25;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v24;
  return result;
}

uint64_t sub_237758100()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23776E2D0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  sub_23775C868();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  return v0;
}

uint64_t sub_237758310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v49 = a8;
  uint64_t v77 = a7;
  uint64_t v75 = a6;
  uint64_t v71 = a5;
  uint64_t v68 = a4;
  uint64_t v63 = a3;
  uint64_t v60 = a2;
  uint64_t v56 = a1;
  v78 = a9;
  uint64_t v76 = a22;
  uint64_t v74 = a21;
  uint64_t v70 = a20;
  uint64_t v67 = a19;
  uint64_t v62 = a18;
  uint64_t v59 = a17;
  uint64_t v55 = a16;
  uint64_t v50 = a10;
  uint64_t v51 = a11;
  uint64_t v66 = a14;
  uint64_t v73 = a15;
  uint64_t v72 = *(void *)(a15 - 8);
  uint64_t v54 = a12;
  uint64_t v61 = a13;
  uint64_t v22 = MEMORY[0x270FA5388](a10);
  uint64_t v69 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = *(void *)(v24 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v64 = (char *)&v48 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = *(void *)(v27 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v57 = (char *)&v48 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v52 = (char *)&v48 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v31);
  uint64_t v37 = (char *)&v48 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = *(void *)(v35 - 8);
  uint64_t v39 = MEMORY[0x270FA5388](v35);
  uint64_t v41 = (char *)&v48 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v45 = (char *)&v48 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_23776E2D0;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v45, v56, v49);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v41, v60, v50);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v37, v63, v51);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v52, v68, v54);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v57, v71, v61);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v64, v75, v66);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 16))(v69, v77, v73);
  uint64_t result = sub_23776D048();
  uint64_t *v78 = v46;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t result = sub_237758C50(a1, a2, a3, a4, a5, a6, a7, a8, &v28, a10, a11, a12, a13, a14, a15, a16, a17, *(void *)(a18 + 8), *(void *)(a19 + 8),
             *(void *)(a20 + 8),
             *(void *)(a21 + 8),
             *(void *)(a22 + 8),
             *(void *)(a23 + 8),
             *(void *)(a24 + 8),
             *(void *)(a25 + 8));
  uint64_t v27 = v28;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v27;
  return result;
}

uint64_t sub_237758A0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23776E2E0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  sub_23775C868();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  return v0;
}

uint64_t sub_237758C50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v86 = a8;
  uint64_t v84 = a7;
  uint64_t v80 = a6;
  uint64_t v77 = a5;
  uint64_t v73 = a4;
  uint64_t v70 = a3;
  uint64_t v65 = a2;
  uint64_t v62 = a1;
  int64_t v87 = a9;
  uint64_t v85 = a25;
  uint64_t v83 = a24;
  uint64_t v79 = a23;
  uint64_t v76 = a22;
  uint64_t v72 = a21;
  uint64_t v69 = a20;
  uint64_t v64 = a19;
  uint64_t v61 = a18;
  uint64_t v53 = a11;
  uint64_t v54 = a12;
  uint64_t v58 = a13;
  uint64_t v75 = a16;
  uint64_t v82 = a17;
  uint64_t v81 = *(void *)(a17 - 8);
  uint64_t v63 = a14;
  uint64_t v68 = a15;
  uint64_t v25 = MEMORY[0x270FA5388](a12);
  v78 = (char *)&v53 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = *(void *)(v27 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v71 = (char *)&v53 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v66 = (char *)&v53 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = *(void *)(v33 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v59 = (char *)&v53 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = *(void *)(v36 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v56 = (char *)&v53 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = *(void *)(v37 - 8);
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v42 = (char *)&v53 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = MEMORY[0x270FA5388](v40);
  uint64_t v47 = (char *)&v53 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = *(void *)(a10 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v50 = (char *)&v53 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  uint64_t v55 = 8 * *(void *)(*(void *)(sub_23776D058() - 8) + 72);
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = xmmword_23776E2E0;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v50, v62, a10);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v47, v65, v53);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v42, v70, v54);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v56, v73, v58);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v59, v77, v63);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v80, v68);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v71, v84, v75);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v78, v86, v82);
  uint64_t result = sub_23776D048();
  *int64_t v87 = v51;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t result = sub_2377596B4(a1, a2, a3, a4, a5, a6, a7, a8, &v31, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             *(void *)(a20 + 8),
             *(void *)(a21 + 8),
             *(void *)(a22 + 8),
             *(void *)(a23 + 8),
             *(void *)(a24 + 8),
             *(void *)(a25 + 8),
             *(void *)(a26 + 8),
             *(void *)(a27 + 8),
             *(void *)(a28 + 8));
  uint64_t v30 = v31;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v30;
  return result;
}

uint64_t sub_23775944C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23776E2F0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  sub_23775C868();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  return v0;
}

uint64_t sub_2377596B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v96 = a8;
  uint64_t v92 = a7;
  uint64_t v88 = a6;
  uint64_t v84 = a5;
  uint64_t v81 = a4;
  uint64_t v77 = a3;
  uint64_t v74 = a2;
  uint64_t v70 = a1;
  uint64_t v98 = a9;
  uint64_t v97 = a28;
  uint64_t v94 = a27;
  uint64_t v90 = a26;
  uint64_t v87 = a25;
  uint64_t v83 = a24;
  uint64_t v80 = a23;
  uint64_t v75 = a22;
  uint64_t v72 = a21;
  uint64_t v68 = a20;
  uint64_t v95 = a10;
  uint64_t v58 = a12;
  uint64_t v59 = a13;
  uint64_t v64 = a14;
  uint64_t v67 = a15;
  uint64_t v86 = a18;
  uint64_t v93 = a19;
  uint64_t v91 = *(void *)(a19 - 8);
  uint64_t v73 = a16;
  uint64_t v79 = a17;
  uint64_t v28 = MEMORY[0x270FA5388](a14);
  v89 = (char *)&v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = *(void *)(v30 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v82 = (char *)&v58 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = *(void *)(v33 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v76 = (char *)&v58 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = *(void *)(v36 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v69 = (char *)&v58 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = *(void *)(v39 - 8);
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v65 = (char *)&v58 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = *(void *)(v40 - 8);
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v61 = (char *)&v58 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = *(void *)(v44 - 8);
  uint64_t v46 = MEMORY[0x270FA5388](v42);
  uint64_t v48 = (char *)&v58 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = MEMORY[0x270FA5388](v46);
  uint64_t v53 = (char *)&v58 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = *(void *)(a11 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v56 = (char *)&v58 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  uint64_t v60 = 8 * *(void *)(*(void *)(sub_23776D058() - 8) + 72);
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_23776E2F0;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v56, v70, a11);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v53, v74, v58);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v48, v77, v59);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v61, v81, v64);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v84, v67);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v69, v88, v73);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v76, v92, v79);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v82, v96, v86);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v89, v95, v93);
  uint64_t result = sub_23776D048();
  *uint64_t v98 = v63;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t result = sub_23775A25C(a1, a2, a3, a4, a5, a6, a7, a8, &v34, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             *(void *)(a22 + 8),
             *(void *)(a23 + 8),
             *(void *)(a24 + 8),
             *(void *)(a25 + 8),
             *(void *)(a26 + 8),
             *(void *)(a27 + 8),
             *(void *)(a28 + 8),
             *(void *)(a29 + 8),
             *(void *)(a30 + 8),
             *(void *)(a31 + 8));
  uint64_t v33 = v34;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v33;
  return result;
}

uint64_t sub_237759FC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23776E300;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  sub_23775C868();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  swift_bridgeObjectRetain();
  sub_23776D048();
  return v0;
}

uint64_t sub_23775A25C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  uint64_t v102 = a8;
  uint64_t v98 = a7;
  uint64_t v95 = a6;
  uint64_t v91 = a5;
  uint64_t v87 = a4;
  uint64_t v84 = a3;
  uint64_t v80 = a2;
  uint64_t v77 = a1;
  v108 = a9;
  uint64_t v106 = a11;
  uint64_t v107 = a31;
  uint64_t v104 = a10;
  uint64_t v105 = a30;
  uint64_t v101 = a29;
  uint64_t v97 = a28;
  uint64_t v93 = a27;
  uint64_t v90 = a26;
  uint64_t v86 = a25;
  uint64_t v83 = a24;
  uint64_t v78 = a23;
  uint64_t v75 = a22;
  uint64_t v64 = a13;
  uint64_t v65 = a14;
  uint64_t v68 = a15;
  uint64_t v96 = a20;
  uint64_t v103 = a21;
  uint64_t v100 = *(void *)(a21 - 8);
  uint64_t v72 = a16;
  uint64_t v76 = a17;
  uint64_t v82 = a18;
  uint64_t v89 = a19;
  uint64_t v31 = MEMORY[0x270FA5388](a16);
  uint64_t v99 = (char *)&v64 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = *(void *)(v33 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v92 = (char *)&v64 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = *(void *)(v36 - 8);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v85 = (char *)&v64 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = *(void *)(v39 - 8);
  uint64_t v40 = MEMORY[0x270FA5388](v37);
  uint64_t v79 = (char *)&v64 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = *(void *)(v42 - 8);
  uint64_t v43 = MEMORY[0x270FA5388](v40);
  uint64_t v73 = (char *)&v64 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = *(void *)(v43 - 8);
  uint64_t v45 = MEMORY[0x270FA5388](v43);
  uint64_t v70 = (char *)&v64 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = *(void *)(v47 - 8);
  uint64_t v48 = MEMORY[0x270FA5388](v45);
  uint64_t v66 = (char *)&v64 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = MEMORY[0x270FA5388](v48);
  uint64_t v54 = (char *)&v64 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v57 = MEMORY[0x270FA5388](v52);
  uint64_t v59 = (char *)&v64 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = *(void *)(a12 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v62 = (char *)&v64 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925510);
  sub_23776D058();
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_23776E300;
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v62, v77, a12);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v59, v80, v64);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v54, v84, v65);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v87, v68);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v70, v91, v72);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v73, v95, v76);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v79, v98, v82);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v85, v102, v89);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v92, v104, v96);
  sub_23776D048();
  (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v99, v106, v103);
  uint64_t result = sub_23776D048();
  uint64_t *v108 = v69;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  sub_237756A60(a1, a2, a13, a14, *(void *)(a24 + 8), *(void *)(a25 + 8), &v54);
  uint64_t v53 = v54;
  sub_237756A60(a3, a4, a15, a16, *(void *)(a26 + 8), *(void *)(a27 + 8), &v52);
  uint64_t v51 = v52;
  sub_237756A60(a5, a6, a17, a18, *(void *)(a28 + 8), *(void *)(a29 + 8), &v50);
  uint64_t v49 = v50;
  sub_237756A60(a7, a8, a19, a20, *(void *)(a30 + 8), *(void *)(a31 + 8), &v48);
  uint64_t v47 = v48;
  sub_237756A60(a10, a11, a21, a22, *(void *)(a32 + 8), *(void *)(a33 + 8), &v46);
  uint64_t v45 = v46;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  unint64_t v37 = sub_23775C868();
  sub_237757B28((uint64_t)&v53, (uint64_t)&v51, (uint64_t)&v49, (uint64_t)&v47, (uint64_t)&v45, a12, v36, v36, &v55, v36, v36, v36, a23, v37, v37, v37, v37, v37, *(void *)(a34 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v39 = v55;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v39;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  sub_237756A60(a1, a2, a14, a15, *(void *)(a26 + 8), *(void *)(a27 + 8), &v51);
  sub_237756A60(a3, a4, a16, a17, *(void *)(a28 + 8), *(void *)(a29 + 8), &v50);
  sub_237756A60(a5, a6, a18, a19, *(void *)(a30 + 8), *(void *)(a31 + 8), &v49);
  sub_237756A60(a7, a8, a20, a21, *(void *)(a32 + 8), *(void *)(a33 + 8), &v48);
  sub_237756A60(a10, a11, a22, a23, *(void *)(a34 + 8), *(void *)(a35 + 8), &v47);
  sub_237756A60(a12, a13, a24, a25, *(void *)(a36 + 8), *(void *)(a37 + 8), &v46);
  uint64_t v38 = sub_237757940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v38;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  sub_237756A60(a1, a2, a15, a16, *(void *)(a28 + 8), *(void *)(a29 + 8), &v62);
  uint64_t v61 = v62;
  sub_237756A60(a3, a4, a17, a18, *(void *)(a30 + 8), *(void *)(a31 + 8), &v60);
  uint64_t v59 = v60;
  sub_237756A60(a5, a6, a19, a20, *(void *)(a32 + 8), *(void *)(a33 + 8), &v58);
  uint64_t v57 = v58;
  sub_237756A60(a7, a8, a21, a22, *(void *)(a34 + 8), *(void *)(a35 + 8), &v56);
  uint64_t v55 = v56;
  sub_237756A60(a10, a11, a23, a24, *(void *)(a36 + 8), *(void *)(a37 + 8), &v54);
  uint64_t v53 = v54;
  sub_237756A60(a12, a13, a25, a26, *(void *)(a38 + 8), *(void *)(a39 + 8), &v52);
  uint64_t v51 = v52;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  unint64_t v43 = sub_23775C868();
  sub_237758310((uint64_t)&v61, (uint64_t)&v59, (uint64_t)&v57, (uint64_t)&v55, (uint64_t)&v53, (uint64_t)&v51, a14, v42, &v63, v42, v42, v42, v42, v42, a27, v43, v43, v43, v43,
    v43,
    v43,
    *(void *)(a40 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v45 = v63;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v45;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  sub_237756A60(a1, a2, a16, a17, *(void *)(a30 + 8), *(void *)(a31 + 8), &v58);
  sub_237756A60(a3, a4, a18, a19, *(void *)(a32 + 8), *(void *)(a33 + 8), &v57);
  sub_237756A60(a5, a6, a20, a21, *(void *)(a34 + 8), *(void *)(a35 + 8), &v56);
  sub_237756A60(a7, a8, a22, a23, *(void *)(a36 + 8), *(void *)(a37 + 8), &v55);
  sub_237756A60(a10, a11, a24, a25, *(void *)(a38 + 8), *(void *)(a39 + 8), &v54);
  sub_237756A60(a12, a13, a26, a27, *(void *)(a40 + 8), *(void *)(a41 + 8), &v53);
  sub_237756A60(a14, a15, a28, a29, *(void *)(a42 + 8), *(void *)(a43 + 8), &v52);
  uint64_t v43 = sub_237758100();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v43;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  sub_237756A60(a1, a2, a17, a18, *(void *)(a32 + 8), *(void *)(a33 + 8), &v70);
  uint64_t v69 = v70;
  sub_237756A60(a3, a4, a19, a20, *(void *)(a34 + 8), *(void *)(a35 + 8), &v68);
  uint64_t v67 = v68;
  sub_237756A60(a5, a6, a21, a22, *(void *)(a36 + 8), *(void *)(a37 + 8), &v66);
  uint64_t v65 = v66;
  sub_237756A60(a7, a8, a23, a24, *(void *)(a38 + 8), *(void *)(a39 + 8), &v64);
  uint64_t v63 = v64;
  sub_237756A60(a10, a11, a25, a26, *(void *)(a40 + 8), *(void *)(a41 + 8), &v62);
  uint64_t v61 = v62;
  sub_237756A60(a12, a13, a27, a28, *(void *)(a42 + 8), *(void *)(a43 + 8), &v60);
  uint64_t v59 = v60;
  sub_237756A60(a14, a15, a29, a30, *(void *)(a44 + 8), *(void *)(a45 + 8), &v58);
  uint64_t v57 = v58;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  unint64_t v47 = sub_23775C868();
  sub_237758C50((uint64_t)&v69, (uint64_t)&v67, (uint64_t)&v65, (uint64_t)&v63, (uint64_t)&v61, (uint64_t)&v59, (uint64_t)&v57, a16, &v71, v46, v46, v46, v46, v46, v46, v46, a31, v47, v47,
    v47,
    v47,
    v47,
    v47,
    v47,
    *(void *)(a46 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v49 = v71;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v49;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  sub_237756A60(a1, a2, a18, a19, *(void *)(a34 + 8), *(void *)(a35 + 8), &v65);
  sub_237756A60(a3, a4, a20, a21, *(void *)(a36 + 8), *(void *)(a37 + 8), &v64);
  sub_237756A60(a5, a6, a22, a23, *(void *)(a38 + 8), *(void *)(a39 + 8), &v63);
  sub_237756A60(a7, a8, a24, a25, *(void *)(a40 + 8), *(void *)(a41 + 8), &v62);
  sub_237756A60(a10, a11, a26, a27, *(void *)(a42 + 8), *(void *)(a43 + 8), &v61);
  sub_237756A60(a12, a13, a28, a29, *(void *)(a44 + 8), *(void *)(a45 + 8), &v60);
  sub_237756A60(a14, a15, a30, a31, *(void *)(a46 + 8), *(void *)(a47 + 8), &v59);
  sub_237756A60(a16, a17, a32, a33, *(void *)(a48 + 8), *(void *)(a49 + 8), &v58);
  uint64_t v49 = sub_237758A0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v49;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  sub_237756A60(a1, a2, a19, a20, *(void *)(a36 + 8), *(void *)(a37 + 8), &v78);
  uint64_t v77 = v78;
  sub_237756A60(a3, a4, a21, a22, *(void *)(a38 + 8), *(void *)(a39 + 8), &v76);
  uint64_t v75 = v76;
  sub_237756A60(a5, a6, a23, a24, *(void *)(a40 + 8), *(void *)(a41 + 8), &v74);
  uint64_t v73 = v74;
  sub_237756A60(a7, a8, a25, a26, *(void *)(a42 + 8), *(void *)(a43 + 8), &v72);
  uint64_t v71 = v72;
  sub_237756A60(a10, a11, a27, a28, *(void *)(a44 + 8), *(void *)(a45 + 8), &v70);
  uint64_t v69 = v70;
  sub_237756A60(a12, a13, a29, a30, *(void *)(a46 + 8), *(void *)(a47 + 8), &v68);
  uint64_t v67 = v68;
  sub_237756A60(a14, a15, a31, a32, *(void *)(a48 + 8), *(void *)(a49 + 8), &v66);
  uint64_t v65 = v66;
  sub_237756A60(a16, a17, a33, a34, *(void *)(a50 + 8), *(void *)(a51 + 8), &v64);
  uint64_t v63 = v64;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  unint64_t v53 = sub_23775C868();
  sub_2377596B4((uint64_t)&v77, (uint64_t)&v75, (uint64_t)&v73, (uint64_t)&v71, (uint64_t)&v69, (uint64_t)&v67, (uint64_t)&v65, (uint64_t)&v63, &v79, a18, v52, v52, v52, v52, v52, v52, v52, v52, a35,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    v53,
    *(void *)(a52 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v55 = v79;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v55;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  sub_237756A60(a1, a2, a20, a21, *(void *)(a38 + 8), *(void *)(a39 + 8), &v72);
  sub_237756A60(a3, a4, a22, a23, *(void *)(a40 + 8), *(void *)(a41 + 8), &v71);
  sub_237756A60(a5, a6, a24, a25, *(void *)(a42 + 8), *(void *)(a43 + 8), &v70);
  sub_237756A60(a7, a8, a26, a27, *(void *)(a44 + 8), *(void *)(a45 + 8), &v69);
  sub_237756A60(a10, a11, a28, a29, *(void *)(a46 + 8), *(void *)(a47 + 8), &v68);
  sub_237756A60(a12, a13, a30, a31, *(void *)(a48 + 8), *(void *)(a49 + 8), &v67);
  sub_237756A60(a14, a15, a32, a33, *(void *)(a50 + 8), *(void *)(a51 + 8), &v66);
  sub_237756A60(a16, a17, a34, a35, *(void *)(a52 + 8), *(void *)(a53 + 8), &v65);
  sub_237756A60(a18, a19, a36, a37, *(void *)(a54 + 8), *(void *)(a55 + 8), &v64);
  uint64_t v55 = sub_23775944C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v55;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  sub_237756A60(a1, a2, a21, a22, *(void *)(a40 + 8), *(void *)(a41 + 8), &v86);
  uint64_t v85 = v86;
  sub_237756A60(a3, a4, a23, a24, *(void *)(a42 + 8), *(void *)(a43 + 8), &v84);
  uint64_t v83 = v84;
  sub_237756A60(a5, a6, a25, a26, *(void *)(a44 + 8), *(void *)(a45 + 8), &v82);
  uint64_t v81 = v82;
  sub_237756A60(a7, a8, a27, a28, *(void *)(a46 + 8), *(void *)(a47 + 8), &v80);
  uint64_t v79 = v80;
  sub_237756A60(a10, a11, a29, a30, *(void *)(a48 + 8), *(void *)(a49 + 8), &v78);
  uint64_t v77 = v78;
  sub_237756A60(a12, a13, a31, a32, *(void *)(a50 + 8), *(void *)(a51 + 8), &v76);
  uint64_t v75 = v76;
  sub_237756A60(a14, a15, a33, a34, *(void *)(a52 + 8), *(void *)(a53 + 8), &v74);
  uint64_t v73 = v74;
  sub_237756A60(a16, a17, a35, a36, *(void *)(a54 + 8), *(void *)(a55 + 8), &v72);
  uint64_t v71 = v72;
  sub_237756A60(a18, a19, a37, a38, *(void *)(a56 + 8), *(void *)(a57 + 8), &v70);
  uint64_t v69 = v70;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689254E8);
  unint64_t v59 = sub_23775C868();
  sub_23775A25C((uint64_t)&v85, (uint64_t)&v83, (uint64_t)&v81, (uint64_t)&v79, (uint64_t)&v77, (uint64_t)&v75, (uint64_t)&v73, (uint64_t)&v71, &v87, (uint64_t)&v69, a20, v58, v58, v58, v58, v58, v58, v58, v58,
    v58,
    a39,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    v59,
    *(void *)(a58 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v61 = v87;
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v61;
  return result;
}

uint64_t static DeviceActivityReportBuilder.buildBlock<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void (**a9)()@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  sub_237756A60(a1, a2, a22, a23, *(void *)(a42 + 8), *(void *)(a43 + 8), &v79);
  sub_237756A60(a3, a4, a24, a25, *(void *)(a44 + 8), *(void *)(a45 + 8), &v78);
  sub_237756A60(a5, a6, a26, a27, *(void *)(a46 + 8), *(void *)(a47 + 8), &v77);
  sub_237756A60(a7, a8, a28, a29, *(void *)(a48 + 8), *(void *)(a49 + 8), &v76);
  sub_237756A60(a10, a11, a30, a31, *(void *)(a50 + 8), *(void *)(a51 + 8), &v75);
  sub_237756A60(a12, a13, a32, a33, *(void *)(a52 + 8), *(void *)(a53 + 8), &v74);
  sub_237756A60(a14, a15, a34, a35, *(void *)(a54 + 8), *(void *)(a55 + 8), &v73);
  sub_237756A60(a16, a17, a36, a37, *(void *)(a56 + 8), *(void *)(a57 + 8), &v72);
  sub_237756A60(a18, a19, a38, a39, *(void *)(a58 + 8), *(void *)(a59 + 8), &v71);
  sub_237756A60(a20, a21, a40, a41, *(void *)(a60 + 8), *(void *)(a61 + 8), &v70);
  uint64_t v68 = sub_237759FC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = sub_23775D70C;
  a9[1] = 0;
  a9[2] = (void (*)())v68;
  return result;
}

unint64_t sub_23775C868()
{
  unint64_t result = qword_2689254F0;
  if (!qword_2689254F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689254E8);
    sub_23775C8DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689254F0);
  }
  return result;
}

unint64_t sub_23775C8DC()
{
  unint64_t result = qword_2689254F8;
  if (!qword_2689254F8)
  {
    sub_23776D058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689254F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceActivityReportBuilder()
{
  return &type metadata for DeviceActivityReportBuilder;
}

uint64_t sub_23775C944()
{
  _s5SceneVMa();

  return swift_getWitnessTable();
}

unint64_t sub_23775C994()
{
  unint64_t result = qword_268925500;
  if (!qword_268925500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925500);
  }
  return result;
}

uint64_t sub_23775CA38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (**a3)()@<X8>)
{
  *a3 = sub_23775D70C;
  a3[1] = 0;
  uint64_t v5 = (char *)a3 + *(int *)(_s5SceneVMa() + 36);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v6(v5, a1, a2);
}

uint64_t DeviceActivityReportExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_23776D028();
}

uint64_t sub_23775CC44()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23775CCCC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t DeviceActivityReportScene.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v13[1] = a3;
  uint64_t v6 = *(void *)(a1 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](a1);
  id v8 = objc_msgSend(objc_allocWithZone((Class)_s18SceneConfigurationCMa()), sel_init);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 40))(&v14, a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *(void *)(v10 + ((v7 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v8;
  *(void *)(swift_allocObject() + 16) = v8;
  _s9SceneViewVMa();
  id v11 = v8;
  swift_getWitnessTable();
  return sub_23776D018();
}

uint64_t _s18SceneConfigurationCMa()
{
  uint64_t result = qword_268925548;
  if (!qword_268925548) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23775CF8C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v22 = a4;
  uint64_t v7 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _s9SceneViewVMa();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v21 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  id v17 = a2;
  sub_23775D2AC((uint64_t)v9, a3, (uint64_t)v14);
  swift_getWitnessTable();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v18(v16, v14, v10);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  v19(v14, v10);
  v18(v22, v16, v10);
  return ((uint64_t (*)(char *, uint64_t))v19)(v16, v10);
}

uint64_t sub_23775D1A8()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t sub_23775D244@<X0>(char *a1@<X8>)
{
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 16) - 8) + 80);
  return sub_23775CF8C(v1 + v2, *(void **)(v1+ ((*(void *)(*(void *)(*(void *)(v1 + 16) - 8) + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + 16), a1);
}

uint64_t sub_23775D2AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = _s9SceneViewVMa();
  uint64_t v7 = (void *)(a3 + *(int *)(v6 + 40));
  sub_23776D5B8();
  sub_23776D588();
  *uint64_t v7 = v14;
  v7[1] = v15;
  uint64_t v8 = *(void *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a3, a1, a2);
  unint64_t v9 = (uint64_t *)(a3 + *(int *)(v6 + 36));
  _s18SceneConfigurationCMa();
  sub_237763C70(&qword_268925728, (void (*)(uint64_t))_s18SceneConfigurationCMa);
  uint64_t v10 = sub_23776D488();
  uint64_t v12 = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, a2);
  uint64_t *v9 = v10;
  v9[1] = v12;
  return result;
}

uint64_t sub_23775D408()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23775D440(void *a1)
{
  return 1;
}

uint64_t _s9SceneViewVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t dispatch thunk of DeviceActivityReportExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DeviceActivityReportScene.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DeviceActivityReportScene.makeConfiguration(representing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 48) + **(int **)(a4 + 48));
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_23775D5B8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23775D5B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of DeviceActivityReportScene.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

void sub_23775D6C0()
{
}

void sub_23775D70C()
{
}

uint64_t sub_23775D758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 36));
}

void sub_23775D790()
{
}

uint64_t sub_23775D7A0()
{
  sub_23776D6F8();
  sub_23776D6E8();
  uint64_t v1 = sub_23776D6B8();
  return MEMORY[0x270FA2498](sub_23775D830, v1, v0);
}

uint64_t sub_23775D830()
{
  return sub_23776D8B8();
}

void (*sub_23775D8A0())()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  return sub_237762F98;
}

uint64_t sub_23775D910()
{
  _s18SceneConfigurationCMa();
  sub_237763C70(&qword_268925728, (void (*)(uint64_t))_s18SceneConfigurationCMa);

  return sub_23776D488();
}

uint64_t sub_23775D98C()
{
  sub_23776D588();
  return v1;
}

uint64_t sub_23775D9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925678);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t *)(v2 + *(int *)(a1 + 40));
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  uint64_t v22 = v13;
  uint64_t v23 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925680);
  sub_23776D598();
  uint64_t v21 = v24;
  uint64_t KeyPath = swift_getKeyPath();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925688);
  sub_23776D448();
  swift_endAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a1 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, (char *)&KeyPath - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925690);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2 + *(int *)(v16 + 52), v10, v7);
  uint64_t v17 = KeyPath;
  *(void *)a2 = v21;
  *(void *)(a2 + 8) = v17;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v18 = (uint64_t (**)(uint64_t *))(a2 + *(int *)(v16 + 56));
  *uint64_t v18 = sub_237762848;
  v18[1] = (uint64_t (*)(uint64_t *))v15;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23775DC64(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = _s9SceneViewVMa();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v36 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925698);
  uint64_t result = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  if (*a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689256A0);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = 0;
    *(void *)(v18 + 24) = v17;
    *(_OWORD *)(v18 + 32) = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
    uint64_t v37 = a3;
    uint64_t v19 = v18 + qword_268925AB0;
    uint64_t v20 = sub_23776D358();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    *(void *)(v18 + qword_268925AB8) = 0;
    uint64_t v21 = v18 + qword_268925AC0;
    *(void *)(v21 + 32) = 0;
    *(_OWORD *)uint64_t v21 = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    uint64_t v36 = *(char **)(a2 + *(int *)(v8 + 36) + 8);
    swift_bridgeObjectRetain();
    sub_23776D708();
    uint64_t v22 = sub_23776D728();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 0, 1, v22);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
    sub_23776D6F8();
    swift_retain();
    uint64_t v23 = sub_23776D6E8();
    unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v25 = a4;
    unint64_t v26 = (v10 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v27 = (char *)swift_allocObject();
    uint64_t v28 = MEMORY[0x263F8F500];
    *((void *)v27 + 2) = v23;
    *((void *)v27 + 3) = v28;
    *((void *)v27 + 4) = v37;
    *((void *)v27 + 5) = v25;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v27[v24], v12, v8);
    *(void *)&v27[v26] = v18;
    uint64_t v29 = sub_23775E764((uint64_t)v16, (uint64_t)&unk_2689256B0, (uint64_t)v27);
    uint64_t v30 = v36;
    uint64_t v31 = *(NSObject **)&v36[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue];
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v30;
    *(void *)(v32 + 24) = v29;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = sub_237762B84;
    *(void *)(v33 + 24) = v32;
    aBlock[4] = sub_237762B9C;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23775F504;
    aBlock[3] = &block_descriptor;
    uint64_t v34 = _Block_copy(aBlock);
    id v35 = v30;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v31, v34);
    _Block_release(v34);
    LOBYTE(v31) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    if (v31) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23775E08C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[6] = AssociatedTypeWitness;
  v7[7] = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = swift_task_alloc();
  v7[8] = v12;
  v7[9] = sub_23776D6F8();
  v7[10] = sub_23776D6E8();
  v7[2] = a5;
  uint64_t v15 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))(*(void *)(a7 + 48) + **(int **)(a7 + 48));
  uint64_t v13 = (void *)swift_task_alloc();
  v7[11] = v13;
  *uint64_t v13 = v7;
  v13[1] = sub_23775E248;
  return v15(v12, v7 + 2, a6, a7);
}

uint64_t sub_23775E248()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = sub_23776D6B8();
  *(void *)(v1 + 96) = v3;
  *(void *)(v1 + 104) = v2;
  return MEMORY[0x270FA2498](sub_23775E38C, v3, v2);
}

uint64_t sub_23775E38C()
{
  if (sub_23776D748())
  {
    swift_release();
    (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_23775E450, 0, 0);
  }
}

uint64_t sub_23775E450()
{
  *(void *)(v0 + 112) = sub_23776D6E8();
  uint64_t v2 = sub_23776D6B8();
  return MEMORY[0x270FA2498](sub_23775E4DC, v2, v1);
}

uint64_t sub_23775E4DC()
{
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[3];
  swift_release();
  sub_23775E5F8(v4, v1, v3, v2);
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[13];
  return MEMORY[0x270FA2498](sub_23775E574, v5, v6);
}

uint64_t sub_23775E574()
{
  swift_release();
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_23775E5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (void (*)(uint64_t))(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v8(a2);
  swift_release();
  swift_getAssociatedConformanceWitness();
  sub_23776D5B8();
  _s9SceneViewVMa();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925680);
  return sub_23776D5A8();
}

uint64_t sub_23775E764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23776D728();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23776D718();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_237751BE4(a1, &qword_268925698);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23776D6B8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23775E910()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23776D458();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23775E988@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(result
                + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  if (!v3) {
    goto LABEL_3;
  }
  v7[4] = sub_23775EAB4;
  v7[5] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_23775ECAC;
  v7[3] = &block_descriptor_57;
  uint64_t v4 = _Block_copy(v7);
  id v5 = v3;
  id v6 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_23776D828();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268925A30);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_3:
  }
    *a2 = 0;
  return result;
}

void sub_23775EAB4(void *a1)
{
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23776D418();
  __swift_project_value_buffer(v2, (uint64_t)qword_268926650);
  MEMORY[0x237E1FAE0](a1);
  MEMORY[0x237E1FAE0](a1);
  oslog = sub_23776D3F8();
  os_log_type_t v3 = sub_23776D768();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136446210;
    MEMORY[0x237E1FAE0](a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689256E0);
    uint64_t v6 = sub_23776D638();
    sub_237750E08(v6, v7, &v9);
    sub_23776D808();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23774D000, oslog, v3, "Failed to create service proxy for scene configuration: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E1FC70](v5, -1, -1);
    MEMORY[0x237E1FC70](v4, -1, -1);
  }
  else
  {
  }
}

void sub_23775ECAC(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_23775ED14(void *a1)
{
  uint64_t v2 = a1;
  objc_msgSend(a1, sel_setExportedObject_, v1);
  os_log_type_t v3 = self;
  id v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_26EA7A698);
  objc_msgSend(v2, sel_setExportedInterface_, v4);

  id v5 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_26EA7A9E0);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v5);

  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = sub_2377634EC;
  uint64_t v22 = v6;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_237764020;
  uint64_t v20 = &block_descriptor_63;
  unint64_t v7 = _Block_copy(&v17);
  swift_release();
  objc_msgSend(v2, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = sub_2377634F4;
  uint64_t v22 = v8;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_237764020;
  uint64_t v20 = &block_descriptor_67;
  uint64_t v9 = _Block_copy(&v17);
  swift_release();
  objc_msgSend(v2, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  objc_msgSend(v2, sel_activate);
  uint64_t v10 = *(NSObject **)&v1[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = v2;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_23776353C;
  *(void *)(v12 + 24) = v11;
  uint64_t v21 = sub_237763D70;
  uint64_t v22 = v12;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 1107296256;
  uint64_t v19 = sub_23775F504;
  uint64_t v20 = &block_descriptor_77;
  uint64_t v13 = _Block_copy(&v17);
  unint64_t v14 = v1;
  id v15 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v2 & 1) == 0) {
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_23775F060(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23776D418();
  __swift_project_value_buffer(v2, (uint64_t)qword_268926650);
  os_log_type_t v3 = sub_23776D3F8();
  os_log_type_t v4 = sub_23776D788();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23774D000, v3, v4, "The extension's connection to our view service was interrupted.", v5, 2u);
    MEMORY[0x237E1FC70](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x237E1FD10](v1);
  if (result)
  {
    unint64_t v7 = (void *)result;
    uint64_t v8 = *(NSObject **)(result
                      + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue);
    uint64_t v9 = swift_allocObject();
    *(unsigned char *)(v9 + 16) = 1;
    *(void *)(v9 + 24) = v7;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_2377635D0;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_237763D70;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23775F504;
    aBlock[3] = &block_descriptor_98;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = v7;
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);
    _Block_release(v11);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v8) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23775F2A0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23776D418();
  __swift_project_value_buffer(v2, (uint64_t)qword_268926650);
  os_log_type_t v3 = sub_23776D3F8();
  os_log_type_t v4 = sub_23776D788();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23774D000, v3, v4, "The extension's connection to our view service was invalidated.", v5, 2u);
    MEMORY[0x237E1FC70](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = MEMORY[0x237E1FD10](v1);
  if (result)
  {
    unint64_t v7 = (void *)result;
    uint64_t v8 = *(NSObject **)(result
                      + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue);
    uint64_t v9 = swift_allocObject();
    *(unsigned char *)(v9 + 16) = 0;
    *(void *)(v9 + 24) = v7;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = sub_2377635D0;
    *(void *)(v10 + 24) = v9;
    aBlock[4] = sub_237763D70;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23775F504;
    aBlock[3] = &block_descriptor_87;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = v7;
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);
    _Block_release(v11);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v8) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_23775F4DC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23775F504(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_23775F52C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask;
  if (*(void *)(a1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask))
  {
    swift_retain();
    sub_23776D738();
    swift_release();
  }
  *(void *)(a1 + v4) = a2;
  swift_retain();

  return swift_release();
}

uint64_t sub_23775F5BC@<X0>(uint64_t a1@<X2>, void *a2@<X3>, uint64_t a3@<X8>)
{
  id v43 = a2;
  uint64_t v44 = a3;
  uint64_t v38 = a1;
  uint64_t v3 = sub_23776CFC8();
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  MEMORY[0x270FA5388](v3);
  id v35 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23776D208();
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v42 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v40 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v39 = (uint64_t)&v30 - v8;
  uint64_t v9 = sub_23776D358();
  uint64_t v31 = *(void *)(v9 - 8);
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_23776D088();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_23776D0A8();
  uint64_t v34 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v33 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v30 - v19;
  sub_237763C70(&qword_268925718, MEMORY[0x263F049F0]);
  uint64_t v21 = v48;
  uint64_t result = sub_23776CF58();
  if (!v21)
  {
    sub_23776D098();
    sub_23776D078();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v23 = sub_23776D348();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    uint64_t v24 = (uint64_t)v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v38, v37);
    uint64_t v25 = v39;
    DeviceActivityFilter.SegmentInterval.init(_:_:)(v23, v24, v39);
    uint64_t v26 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v33, v20, v16);
    uint64_t v27 = v41;
    uint64_t v28 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v40, v25, v42);
    uint64_t v46 = _s18SceneConfigurationCMa();
    uint64_t v47 = sub_237763C70(&qword_268925720, (void (*)(uint64_t))_s18SceneConfigurationCMa);
    id v45 = v43;
    id v29 = v43;
    sub_23776D1A8();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v28);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v20, v16);
  }
  return result;
}

unint64_t sub_23775FA78(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v32 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925708);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23776D198();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v31 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v28 = (char *)&v25 - v13;
  uint64_t v14 = *(void *)(a3 + 16);
  if (!v14) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v26 = v12;
  id v29 = (void (**)(char *))(v12 + 32);
  uint64_t v30 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  uint64_t v25 = a3;
  id v15 = (unint64_t *)(a3 + 40);
  unint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t v27 = a1;
  do
  {
    uint64_t v16 = v9;
    uint64_t v17 = *(v15 - 1);
    unint64_t v18 = *v15;
    v33[0] = v17;
    v33[1] = v18;
    sub_2377517CC(v17, v18);
    a1(v33);
    if (v3)
    {
      sub_237751994(v17, v18);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v34;
    }
    sub_237751994(v17, v18);
    uint64_t v9 = v16;
    if ((*v30)(v8, 1, v16) == 1)
    {
      sub_237751BE4((uint64_t)v8, &qword_268925708);
    }
    else
    {
      uint64_t v19 = v28;
      uint64_t v20 = *v29;
      (*v29)(v28);
      ((void (*)(char *, char *, uint64_t))v20)(v31, v19, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v34 = sub_2377631E4(0, *(void *)(v34 + 16) + 1, 1, v34);
      }
      unint64_t v22 = *(void *)(v34 + 16);
      unint64_t v21 = *(void *)(v34 + 24);
      if (v22 >= v21 >> 1) {
        unint64_t v34 = sub_2377631E4(v21 > 1, v22 + 1, 1, v34);
      }
      unint64_t v23 = v34;
      *(void *)(v34 + 16) = v22 + 1;
      uint64_t v9 = v16;
      ((void (*)(unint64_t, char *, uint64_t))v20)(v23+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v22, v31, v16);
      a1 = v27;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_23775FD9C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v5 = a1;
  sub_23776D468();
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_23776D468();
  return a3(0);
}

void sub_23775FFBC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_23776CFD8();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_237760020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v30 = a6;
  uint64_t v31 = a7;
  v29[0] = a3;
  v29[1] = a5;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256D0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689256D8);
  sub_23776D7C8();
  uint64_t v20 = (void *)aBlock[0];
  if (aBlock[0])
  {
    if (a4) {
      v29[0] = sub_23776D618();
    }
    else {
      v29[0] = 0;
    }
    uint64_t v30 = sub_23776D618();
    uint64_t v31 = sub_23776D348();
    unint64_t v22 = (void *)sub_23776D618();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v13);
    uint64_t v23 = a8;
    unint64_t v24 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v23;
    *(void *)(v25 + 24) = a9;
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v25 + v24, v16, v13);
    aBlock[4] = sub_2377630D8;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237760B24;
    aBlock[3] = &block_descriptor_54;
    uint64_t v26 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v27 = (void *)v29[0];
    uint64_t v28 = (void *)v30;
    objc_msgSend(v20, sel_fetchActivitySegmentWithUserAltDSID_deviceIdentifier_segmentInterval_recordName::, v29[0], v30, v31, v22, v26);
    _Block_release(v26);
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v21 = sub_23776D108();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
    sub_23776D6C8();
  }
}

uint64_t sub_23776034C(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v40 = (char *)a4;
  uint64_t v41 = a6;
  uint64_t v10 = sub_23776D068();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  unint64_t v22 = (char *)&v39 - v21;
  uint64_t v23 = sub_23776D108();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      uint64_t v40 = v20;
      MEMORY[0x237E1FAE0](a3);
      if (qword_268925420 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_23776D418();
      __swift_project_value_buffer(v24, (uint64_t)qword_268926650);
      MEMORY[0x237E1FAE0](a3);
      MEMORY[0x237E1FAE0](a3);
      uint64_t v25 = sub_23776D3F8();
      os_log_type_t v26 = sub_23776D768();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        uint64_t v42 = (uint64_t)a3;
        uint64_t v43 = v28;
        *(_DWORD *)uint64_t v27 = 136446210;
        MEMORY[0x237E1FAE0](a3);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2689256E0);
        uint64_t v29 = sub_23776D638();
        uint64_t v42 = sub_237750E08(v29, v30, &v43);
        sub_23776D808();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_23774D000, v25, v26, "Failed to fetch activity segment: %{public}s", v27, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237E1FC70](v28, -1, -1);
        MEMORY[0x237E1FC70](v27, -1, -1);
      }
      else
      {
      }
      uint64_t v31 = (uint64_t)v40;
    }
    else
    {
      uint64_t v32 = v20;
      if (qword_268925420 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_23776D418();
      __swift_project_value_buffer(v33, (uint64_t)qword_268926650);
      swift_bridgeObjectRetain_n();
      unint64_t v34 = sub_23776D3F8();
      os_log_type_t v35 = sub_23776D778();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        uint64_t v43 = v37;
        *(_DWORD *)uint64_t v36 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v42 = sub_237750E08((uint64_t)v40, a5, &v43);
        sub_23776D808();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23774D000, v34, v35, "Failed to fetch activity segment: %{public}s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237E1FC70](v37, -1, -1);
        MEMORY[0x237E1FC70](v36, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v31 = (uint64_t)v32;
    }
  }
  else
  {
    uint64_t v40 = v20;
    sub_23776CF78();
    swift_allocObject();
    sub_2377517CC(a1, a2);
    sub_23776CF68();
    sub_237763C70(&qword_2689256E8, MEMORY[0x263F049D8]);
    sub_23776CF58();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    uint64_t v31 = (uint64_t)v40;
    sub_23776D118();
    swift_release();
    sub_237763168(a1, a2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    sub_237751BE4((uint64_t)v22, &qword_2689256C8);
    sub_23776344C(v31, (uint64_t)v22);
  }
  sub_23776317C((uint64_t)v22, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689256D0);
  sub_23776D6C8();
  return sub_237751BE4((uint64_t)v22, &qword_2689256C8);
}

uint64_t sub_237760B24(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    id v4 = (void *)sub_23776D008();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_237763168((uint64_t)v4, v8);

  return swift_release();
}

id sub_237760BD0()
{
  uint64_t v1 = sub_23776D7A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v1);
  uint64_t v23 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23776D798();
  MEMORY[0x270FA5388](v4);
  unint64_t v22 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23776D5E8();
  MEMORY[0x270FA5388](v6 - 8);
  v20[2] = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925688);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v0[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration__deviceActivityData];
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v28 = MEMORY[0x263F8EE78];
  uint64_t v14 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_268925560);
  sub_23776D438();
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  *(void *)&v14[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection] = 0;
  uint64_t v21 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connectionQueue;
  unint64_t v24 = sub_23776365C();
  sub_23776D5D8();
  uint64_t v28 = v13;
  v20[1] = sub_237763C70((unint64_t *)&unk_2689259F0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689256F8);
  sub_237763D24((unint64_t *)&unk_268925A00, &qword_2689256F8);
  sub_23776D838();
  uint64_t v15 = *MEMORY[0x263F8F130];
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 104);
  v26 += 104;
  uint64_t v17 = v23;
  v16(v23, v15, v25);
  *(void *)&v14[v21] = sub_23776D7E8();
  *(void *)&v14[OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTask] = 0;
  uint64_t v21 = OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_updateTaskQueue;
  sub_23776D5D8();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_23776D838();
  v16(v17, v15, v25);
  *(void *)&v14[v21] = sub_23776D7E8();

  uint64_t v18 = (objc_class *)_s18SceneConfigurationCMa();
  v27.receiver = v14;
  v27.super_class = v18;
  return objc_msgSendSuper2(&v27, sel_init);
}

id sub_237761014()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s18SceneConfigurationCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_237761100()
{
  return _s18SceneConfigurationCMa();
}

void sub_237761108()
{
  sub_2377611B4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2377611B4()
{
  if (!qword_268925558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_268925560);
    unint64_t v0 = sub_23776D478();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268925558);
    }
  }
}

uint64_t sub_237761210()
{
  return MEMORY[0x263F04E30];
}

uint64_t sub_23776121C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_237761224()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_2377612C4(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *a2;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    *a1 = v7;
    a1 = (void *)(v7 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = v7;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_2377613D0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_237761444(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_retain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_2377614D4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

_OWORD *sub_237761564(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_OWORD *sub_2377615D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_23776165C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      uint64_t v15 = *(void *)a1;
      if (*(void *)a1 >= 0xFFFFFFFFuLL) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_2377617FC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_42;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x237761A5CLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v19 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v20 = *(void (**)(unint64_t))(v6 + 56);
          v20(v19);
        }
        else
        {
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v18 = a2 ^ 0x80000000;
            *((void *)a1 + 1) = 0;
          }
          else
          {
            uint64_t v18 = a2 - 1;
          }
          *(void *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t _s5SceneVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_237761A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_237761AA4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_237761B40(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    size_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    BOOL v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *size_t v10 = *v11;
    unsigned int v12 = (void *)v11[1];
    v10[1] = v12;
    int v13 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    *int v13 = *v14;
    v13[1] = v14[1];
    id v15 = v12;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_237761C78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();

  swift_release();

  return swift_release();
}

uint64_t sub_237761D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)v8[1];
  v7[1] = v9;
  size_t v10 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  BOOL v11 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *size_t v10 = *v11;
  v10[1] = v11[1];
  id v12 = v9;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_237761DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)v8[1];
  size_t v10 = (void *)v7[1];
  v7[1] = v9;
  id v11 = v9;

  id v12 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v13 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *id v12 = *v13;
  swift_retain();
  swift_release();
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_237761E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_237761F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  uint64_t v9 = (void *)v7[1];
  v7[1] = v8[1];

  size_t v10 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  id v11 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  *size_t v10 = *v11;
  swift_release();
  v10[1] = v11[1];
  swift_release();
  return a1;
}

uint64_t sub_237761FD0(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x237762124);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_237762138(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v19 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                *unint64_t v19 = a2 ^ 0x80000000;
                v19[1] = 0;
              }
              else
              {
                v19[1] = a2 - 1;
              }
            }
            else
            {
              uint64_t v18 = *(void (**)(void))(v6 + 56);
              v18();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((((v9 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, ((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x23776232CLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t sub_237762354()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_237762398@<X0>(uint64_t *a1@<X8>)
{
  _s18SceneConfigurationCMa();
  uint64_t result = sub_23776D428();
  *a1 = result;
  return result;
}

uint64_t sub_2377623D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[8] = a7;
  v9[9] = a8;
  v9[6] = a5;
  v9[7] = a6;
  v9[4] = a3;
  v9[5] = a4;
  v9[2] = a1;
  v9[3] = a2;
  v9[10] = *v8;
  return MEMORY[0x270FA2498](sub_237762410, 0, 0);
}

uint64_t sub_237762410()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 88) = v7;
  long long v8 = *(_OWORD *)(v0 + 48);
  *(void *)(v7 + 16) = v1;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = v5;
  *(void *)(v7 + 40) = v4;
  *(_OWORD *)(v7 + 48) = v8;
  *(void *)(v7 + 64) = v3;
  *(void *)(v7 + 72) = v2;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  void *v9 = v0;
  v9[1] = sub_23776253C;
  uint64_t v11 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2318](v11, 0, 0, 0xD00000000000004ELL, 0x800000023776F110, sub_237762FB8, v7, v10);
}

uint64_t sub_23776253C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23776264C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_237762658()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_237762664(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2377626A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2377626E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23776D498();
  *a1 = result & 1;
  return result;
}

uint64_t sub_237762714()
{
  return sub_23776D4A8();
}

uint64_t sub_23776273C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(_s9SceneViewVMa() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4, v1);

  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_237762848(uint64_t *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(_s9SceneViewVMa() - 8);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_23775DC64(a1, v6, v3, v4);
}

uint64_t sub_2377628D4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(_s9SceneViewVMa() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  uint64_t v7 = v0 + v4;
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7, v1);

  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_237762A04(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(_s9SceneViewVMa() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + v7;
  uint64_t v11 = *(void *)((char *)v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  unsigned int v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *unsigned int v12 = v2;
  v12[1] = sub_237763DBC;
  return sub_23775E08C(a1, v8, v9, v10, v11, v4, v5);
}

uint64_t sub_237762B44()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237762B84()
{
  return sub_23775F52C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_237762B8C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237762B9C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_237762BDC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23776D458();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_237762C5C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_23776D468();
}

uint64_t sub_237762CD4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_237762DB0;
  return v6(a1);
}

uint64_t sub_237762DB0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_237762EA8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237762EE0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23775D5B8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2689256B8 + dword_2689256B8);
  return v6(a1, v4);
}

void sub_237762F98()
{
  (*(void (**)(void))(v0 + 16))();
  __break(1u);
}

void sub_237762FB8(uint64_t a1)
{
  sub_237760020(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_237762FEC@<X0>(void *a1@<X8>)
{
  return sub_23775E988(*(void *)(v1 + 16), a1);
}

uint64_t sub_237763008()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256D0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2377630D8(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689256D0) - 8);
  uint64_t v8 = *(void *)(v3 + 16);
  unint64_t v9 = *(void *)(v3 + 24);
  uint64_t v10 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_23776034C(a1, a2, a3, v8, v9, v10);
}

uint64_t sub_237763168(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_237751994(a1, a2);
  }
  return a1;
}

uint64_t sub_23776317C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2377631E4(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925710);
  uint64_t v10 = *(void *)(sub_23776D198() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_23776D8A8();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_23776D198() - 8);
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
    sub_23776369C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_23776344C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2377634B4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2377634EC()
{
  return sub_23775F060(v0);
}

uint64_t sub_2377634F4()
{
  return sub_23775F2A0(v0);
}

uint64_t sub_2377634FC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23776353C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  id v4 = *(id *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  *(void *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection) = v2;
  id v3 = v2;
}

uint64_t sub_237763588()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_237763598()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2377635D4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2377635E4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (*(unsigned char *)(v0 + 16) == 1) {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection), sel_invalidate);
  }
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection);
  *(void *)(v1 + OBJC_IVAR____TtCV23_DeviceActivity_SwiftUI20DeviceActivityReport18SceneConfiguration_connection) = 0;
}

uint64_t sub_237763644()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_23776365C()
{
  unint64_t result = qword_2689256F0;
  if (!qword_2689256F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689256F0);
  }
  return result;
}

uint64_t sub_23776369C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_23776D198() - 8);
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
  uint64_t result = sub_23776D8C8();
  __break(1u);
  return result;
}

uint64_t sub_2377637F4(uint64_t a1, uint64_t a2, void *a3, const void *a4)
{
  uint64_t v8 = sub_23776D5C8();
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23776D5E8();
  uint64_t v21 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a4;
  sub_23776CF78();
  swift_allocObject();
  _Block_copy(a4);
  uint64_t v24 = sub_23776CF68();
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  unint64_t v15 = sub_23775FA78((void (*)(void))sub_237763BFC, (uint64_t)v23, a1);
  swift_release();
  sub_23776365C();
  uint64_t v16 = (void *)sub_23776D7B8();
  unint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = v15;
  v17[4] = sub_237763BF4;
  v17[5] = v14;
  aBlock[4] = sub_237763C64;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237764020;
  aBlock[3] = &block_descriptor_113;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = a3;
  swift_retain();
  swift_release();
  sub_23776D5D8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_237763C70((unint64_t *)&unk_268925A10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925700);
  sub_237763D24((unint64_t *)&unk_268925A20, &qword_268925700);
  sub_23776D838();
  MEMORY[0x237E1F4A0](0, v13, v10, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v11);
  return swift_release();
}

uint64_t sub_237763BBC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_237763BF4(uint64_t a1)
{
  sub_23775FFBC(a1, *(void *)(v1 + 16));
}

uint64_t sub_237763BFC@<X0>(uint64_t a1@<X8>)
{
  return sub_23775F5BC(*(void *)(v1 + 24), *(void **)(v1 + 32), a1);
}

uint64_t sub_237763C1C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_237763C64()
{
  return sub_23775FD9C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_237763C70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_237763CE8()
{
  return sub_237763D24((unint64_t *)&unk_268925730, &qword_268925690);
}

uint64_t sub_237763D24(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_237763D68(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t DeviceActivityFilter.SegmentInterval.rawValue.getter()
{
  uint64_t v1 = sub_23776D208();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v13 - v6;
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v8((char *)v13 - v6, v0, v1);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v7, v1);
  uint64_t v10 = 0;
  if (v9 == *MEMORY[0x263F04AA8]) {
    goto LABEL_6;
  }
  if (v9 == *MEMORY[0x263F04AA0])
  {
    uint64_t v10 = 1;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v2 + 96))(v7, v1);
    uint64_t v11 = sub_23776CFC8();
    (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v7, v11);
    return v10;
  }
  if (v9 == *MEMORY[0x263F04AB0])
  {
    uint64_t v10 = 2;
    goto LABEL_6;
  }
  v8(v5, v0, v1);
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  sub_23776D868();
  sub_23776D658();
  sub_23776D898();
  uint64_t result = sub_23776D8B8();
  __break(1u);
  return result;
}

uint64_t sub_237764020(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t DeviceActivityFilter.SegmentInterval.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a1 == 2)
  {
    uint64_t v7 = sub_23776CFC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a3, a2, v7);
    uint64_t v6 = (unsigned int *)MEMORY[0x263F04AB0];
  }
  else if (a1 == 1)
  {
    uint64_t v5 = sub_23776CFC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a3, a2, v5);
    uint64_t v6 = (unsigned int *)MEMORY[0x263F04AA0];
  }
  else
  {
    if (a1)
    {
      sub_23776D868();
      swift_bridgeObjectRelease();
      sub_23776D998();
      sub_23776D658();
      swift_bridgeObjectRelease();
      uint64_t result = sub_23776D8B8();
      __break(1u);
      return result;
    }
    uint64_t v8 = sub_23776CFC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a3, a2, v8);
    uint64_t v6 = (unsigned int *)MEMORY[0x263F04AA8];
  }
  uint64_t v9 = *v6;
  uint64_t v10 = sub_23776D208();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104);

  return v11(a3, v9, v10);
}

uint64_t DeviceActivityReport.ClientConfiguration.context.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.segment.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t DeviceActivityReport.ClientConfiguration.interval.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 24);
  uint64_t v4 = sub_23776CFC8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for DeviceActivityReport.ClientConfiguration()
{
  uint64_t result = qword_268925840;
  if (!qword_268925840) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DeviceActivityReport.ClientConfiguration.users.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 28));
}

uint64_t DeviceActivityReport.ClientConfiguration.models.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.applications.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.categories.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.webDomains.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.userAltDSID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.deviceIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 52));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DeviceActivityReport.ClientConfiguration.bundleIdentifiers.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.categoryIdentifiers.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.domains.getter()
{
  type metadata accessor for DeviceActivityReport.ClientConfiguration();

  return swift_bridgeObjectRetain();
}

uint64_t DeviceActivityReport.ClientConfiguration.extensionIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for DeviceActivityReport.ClientConfiguration() + 68));
  swift_bridgeObjectRetain();
  return v1;
}

void DeviceActivityReport.ClientConfiguration.filter.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v187 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925740);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v173 = (char *)&v169 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v177 = (char *)&v169 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925748);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v186 = (char *)&v169 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v183 = (char *)&v169 - v10;
  uint64_t v184 = sub_23776D0E8();
  uint64_t v172 = *(void *)(v184 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v184);
  uint64_t v179 = (char *)&v169 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v181 = (char *)&v169 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v182 = (uint64_t)&v169 - v16;
  MEMORY[0x270FA5388](v15);
  v178 = (char *)&v169 - v17;
  uint64_t v175 = sub_23776D2B8();
  uint64_t v174 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  unint64_t v176 = (char *)&v169 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_23776D288();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v180 = (char *)&v169 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v201 = (void (**)(char *, uint64_t, uint64_t))sub_23776D3E8();
  uint64_t v188 = (uint64_t)*(v201 - 1);
  uint64_t v21 = MEMORY[0x270FA5388](v201);
  uint64_t v200 = (char *)&v169 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  *(void *)&long long v199 = (char *)&v169 - v23;
  uint64_t v24 = sub_23776D3B8();
  uint64_t v189 = *(void *)(v24 - 8);
  uint64_t v190 = v24;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v203 = (char *)&v169 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v202 = (char *)&v169 - v27;
  uint64_t v204 = sub_23776D388();
  uint64_t v192 = *(void *)(v204 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v204);
  unint64_t v30 = (char *)&v169 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)&v169 - v31;
  uint64_t v33 = sub_23776CFC8();
  uint64_t v193 = *(void *)(v33 - 8);
  uint64_t v194 = v33;
  MEMORY[0x270FA5388](v33);
  v195 = (char *)&v169 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_23776D208();
  uint64_t v36 = MEMORY[0x270FA5388](v35 - 8);
  uint64_t v185 = (char *)&v169 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  uint64_t v40 = (char *)&v169 - v39;
  uint64_t v41 = MEMORY[0x270FA5388](v38);
  uint64_t v43 = (char *)&v169 - v42;
  MEMORY[0x270FA5388](v41);
  *(void *)&long long v197 = (char *)&v169 - v44;
  int64_t v45 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  uint64_t v46 = MEMORY[0x270FA5388](v45);
  uint64_t v196 = (char *)&v169 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  uint64_t v50 = (char *)&v169 - v49;
  uint64_t v51 = MEMORY[0x270FA5388](v48);
  unint64_t v53 = (char *)&v169 - v52;
  uint64_t v54 = MEMORY[0x270FA5388](v51);
  uint64_t v56 = (char *)&v169 - v55;
  uint64_t v57 = *(int *)(v54 + 48);
  uint64_t v58 = v2;
  uint64_t v191 = (char **)(v2 + v57);
  uint64_t v59 = *(void *)(v2 + v57 + 8);
  int64_t v60 = v58;
  sub_237765CE0(v58, (uint64_t)&v169 - v55);
  int64_t v198 = v45;
  if (v59)
  {
    sub_23775175C((uint64_t)v56);
    sub_237765CE0(v60, (uint64_t)v53);
LABEL_4:
    sub_23775175C((uint64_t)v53);
    uint64_t v64 = (uint64_t)v50;
    sub_237765CE0(v60, (uint64_t)v50);
    uint64_t v65 = (uint64_t)v196;
LABEL_5:
    sub_23775175C(v64);
    sub_237765CE0(v60, v65);
LABEL_6:
    sub_23775175C(v65);
    goto LABEL_7;
  }
  uint64_t v61 = (uint64_t)v185;
  v171 = v43;
  uint64_t v170 = v40;
  uint64_t v62 = v186;
  uint64_t v63 = *(void *)&v56[*(int *)(v45 + 52) + 8];
  swift_bridgeObjectRetain();
  sub_23775175C((uint64_t)v56);
  swift_bridgeObjectRelease();
  sub_237765CE0(v60, (uint64_t)v53);
  if (v63) {
    goto LABEL_4;
  }
  uint64_t v103 = *(void *)(*(void *)&v53[*(int *)(v45 + 56)] + 16);
  sub_23775175C((uint64_t)v53);
  uint64_t v64 = (uint64_t)v50;
  sub_237765CE0(v60, (uint64_t)v50);
  uint64_t v65 = (uint64_t)v196;
  if (v103) {
    goto LABEL_5;
  }
  uint64_t v104 = *(void *)(*(void *)&v50[*(int *)(v45 + 60)] + 16);
  sub_23775175C(v64);
  sub_237765CE0(v60, v65);
  if (v104) {
    goto LABEL_6;
  }
  uint64_t v105 = *(void *)(*(void *)(v65 + *(int *)(v45 + 64)) + 16);
  sub_23775175C(v65);
  if (!v105)
  {
    char v106 = *(unsigned char *)(v60 + *(int *)(v45 + 28) + 8);
    int64_t v70 = *(void *)(v60 + *(int *)(v45 + 32));
    uint64_t v204 = v70;
    if ((v106 & 1) == 0) {
      goto LABEL_120;
    }
    uint64_t v107 = v175;
    uint64_t v108 = v174;
    uint64_t v109 = v172;
    uint64_t v110 = v173;
    if (v70)
    {
      uint64_t v111 = *(void *)(v60 + 16);
      uint64_t v112 = (uint64_t)v195;
      (*(void (**)(char *, int64_t, uint64_t))(v193 + 16))(v195, v60 + *(int *)(v45 + 24), v194);
      DeviceActivityFilter.SegmentInterval.init(_:_:)(v111, v112, (uint64_t)v170);
      uint64_t v113 = *(void *)(v70 + 56);
      uint64_t v202 = (char *)(v70 + 56);
      uint64_t v114 = 1 << *(unsigned char *)(v70 + 32);
      uint64_t v205 = MEMORY[0x263F8EE88];
      if (v114 < 64) {
        uint64_t v115 = ~(-1 << v114);
      }
      else {
        uint64_t v115 = -1;
      }
      unint64_t v116 = v115 & v113;
      uint64_t v203 = (char *)((unint64_t)(v114 + 63) >> 6);
      unint64_t v117 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 48);
      uint64_t v200 = (char *)(v109 + 16);
      v201 = (void (**)(char *, uint64_t, uint64_t))(v109 + 32);
      *(void *)&long long v199 = v109 + 8;
      swift_bridgeObjectRetain();
      uint64_t v118 = 0;
      *(void *)&long long v119 = 134349056;
      long long v197 = v119;
      while (1)
      {
        if (v116)
        {
          int64_t v120 = v60;
          unint64_t v121 = __clz(__rbit64(v116));
          v116 &= v116 - 1;
          unint64_t v122 = v121 | (v118 << 6);
          uint64_t v123 = (uint64_t)v62;
        }
        else
        {
          uint64_t v124 = v118 + 1;
          if (__OFADD__(v118, 1)) {
            goto LABEL_160;
          }
          v125 = v177;
          if (v124 >= (uint64_t)v203) {
            goto LABEL_154;
          }
          uint64_t v123 = (uint64_t)v62;
          unint64_t v126 = *(void *)&v202[8 * v124];
          ++v118;
          if (!v126)
          {
            uint64_t v118 = v124 + 1;
            if (v124 + 1 >= (uint64_t)v203) {
              goto LABEL_154;
            }
            unint64_t v126 = *(void *)&v202[8 * v118];
            if (!v126)
            {
              uint64_t v118 = v124 + 2;
              if (v124 + 2 >= (uint64_t)v203) {
                goto LABEL_154;
              }
              unint64_t v126 = *(void *)&v202[8 * v118];
              if (!v126)
              {
                uint64_t v118 = v124 + 3;
                if (v124 + 3 >= (uint64_t)v203) {
                  goto LABEL_154;
                }
                unint64_t v126 = *(void *)&v202[8 * v118];
                if (!v126)
                {
                  uint64_t v118 = v124 + 4;
                  if (v124 + 4 >= (uint64_t)v203) {
                    goto LABEL_154;
                  }
                  unint64_t v126 = *(void *)&v202[8 * v118];
                  if (!v126)
                  {
                    uint64_t v127 = v124 + 5;
                    if (v127 >= (uint64_t)v203) {
                      goto LABEL_154;
                    }
                    unint64_t v126 = *(void *)&v202[8 * v127];
                    if (!v126)
                    {
                      while (1)
                      {
                        uint64_t v118 = v127 + 1;
                        if (__OFADD__(v127, 1)) {
                          goto LABEL_162;
                        }
                        if (v118 >= (uint64_t)v203) {
                          break;
                        }
                        unint64_t v126 = *(void *)&v202[8 * v118];
                        ++v127;
                        if (v126) {
                          goto LABEL_110;
                        }
                      }
LABEL_154:
                      swift_release();
                      sub_23776D2C8();
                      (*(void (**)(char *, void, uint64_t, uint64_t))(v174 + 56))(v125, 0, 1, v175);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRetain();
LABEL_155:
                      sub_23776D308();
                      return;
                    }
                    uint64_t v118 = v127;
                  }
                }
              }
            }
          }
LABEL_110:
          int64_t v120 = v60;
          unint64_t v116 = (v126 - 1) & v126;
          unint64_t v122 = __clz(__rbit64(v126)) + (v118 << 6);
        }
        uint64_t v128 = *(void *)(*(void *)(v70 + 48) + 8 * v122);
        sub_23776D0C8();
        uint64_t v129 = v184;
        if ((*v117)(v123, 1, v184) == 1)
        {
          sub_237768F08(v123);
          if (qword_268925420 != -1) {
            swift_once();
          }
          uint64_t v130 = sub_23776D418();
          __swift_project_value_buffer(v130, (uint64_t)qword_268926650);
          unint64_t v131 = sub_23776D3F8();
          os_log_type_t v132 = sub_23776D768();
          if (os_log_type_enabled(v131, v132))
          {
            uint64_t v133 = swift_slowAlloc();
            *(_DWORD *)uint64_t v133 = v197;
            *(void *)(v133 + 4) = v128;
            _os_log_impl(&dword_23774D000, v131, v132, "Invalid device model: %{public}ld", (uint8_t *)v133, 0xCu);
            MEMORY[0x237E1FC70](v133, -1, -1);
          }
        }
        else
        {
          uint64_t v134 = v179;
          (*v201)(v179, v123, v129);
          uint64_t v135 = v181;
          (*(void (**)(char *, char *, uint64_t))v200)(v181, v134, v129);
          uint64_t v136 = v182;
          sub_237752884(v182, v135);
          uint64_t v137 = *(void (**)(char *, uint64_t))v199;
          (*(void (**)(uint64_t, uint64_t))v199)(v136, v129);
          v137(v134, v129);
        }
        int64_t v60 = v120;
        int64_t v70 = v204;
      }
    }
    goto LABEL_153;
  }
LABEL_7:
  uint64_t v66 = *(void *)(v60 + 16);
  uint64_t v67 = (uint64_t)v195;
  (*(void (**)(char *, int64_t, uint64_t))(v193 + 16))(v195, v60 + *(int *)(v45 + 24), v194);
  DeviceActivityFilter.SegmentInterval.init(_:_:)(v66, v67, v197);
  uint64_t v68 = (uint64_t)v191[1];
  v195 = *v191;
  uint64_t v196 = (char *)v60;
  int64_t v69 = v60 + *(int *)(v45 + 52);
  int64_t v70 = *(void *)(v60 + *(int *)(v45 + 56));
  uint64_t v71 = *(void *)(v69 + 8);
  uint64_t v191 = *(char ***)v69;
  int64_t v73 = v70 + 56;
  uint64_t v72 = *(void *)(v70 + 56);
  uint64_t v205 = MEMORY[0x263F8EE88];
  uint64_t v74 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v75 = -1;
  if (v74 < 64) {
    uint64_t v75 = ~(-1 << v74);
  }
  uint64_t v61 = v75 & v72;
  int64_t v45 = (unint64_t)(v74 + 63) >> 6;
  uint64_t v76 = (void (**)(char *, uint64_t))(v192 + 8);
  swift_bridgeObjectRetain_n();
  uint64_t v194 = v68;
  swift_bridgeObjectRetain();
  uint64_t v193 = v71;
  swift_bridgeObjectRetain();
  int64_t v60 = 0;
  while (1)
  {
    if (v61)
    {
      v61 &= v61 - 1;
      goto LABEL_11;
    }
    int64_t v77 = v60 + 1;
    if (__OFADD__(v60, 1)) {
      break;
    }
    if (v77 >= v45) {
      goto LABEL_31;
    }
    uint64_t v78 = *(void *)(v73 + 8 * v77);
    ++v60;
    if (!v78)
    {
      int64_t v60 = v77 + 1;
      if (v77 + 1 >= v45) {
        goto LABEL_31;
      }
      uint64_t v78 = *(void *)(v73 + 8 * v60);
      if (!v78)
      {
        int64_t v60 = v77 + 2;
        if (v77 + 2 >= v45) {
          goto LABEL_31;
        }
        uint64_t v78 = *(void *)(v73 + 8 * v60);
        if (!v78)
        {
          int64_t v60 = v77 + 3;
          if (v77 + 3 >= v45) {
            goto LABEL_31;
          }
          uint64_t v78 = *(void *)(v73 + 8 * v60);
          if (!v78)
          {
            int64_t v60 = v77 + 4;
            if (v77 + 4 >= v45) {
              goto LABEL_31;
            }
            uint64_t v78 = *(void *)(v73 + 8 * v60);
            if (!v78)
            {
              int64_t v79 = v77 + 5;
              if (v79 >= v45) {
                goto LABEL_31;
              }
              uint64_t v78 = *(void *)(v73 + 8 * v79);
              if (!v78)
              {
                while (1)
                {
                  int64_t v60 = v79 + 1;
                  if (__OFADD__(v79, 1))
                  {
                    __break(1u);
                    goto LABEL_158;
                  }
                  if (v60 >= v45) {
                    break;
                  }
                  uint64_t v78 = *(void *)(v73 + 8 * v60);
                  ++v79;
                  if (v78) {
                    goto LABEL_30;
                  }
                }
LABEL_31:
                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v192 = v205;
                uint64_t v80 = *(void *)&v196[*(int *)(v198 + 60)];
                uint64_t v81 = *(void *)(v80 + 56);
                uint64_t v204 = v80 + 56;
                uint64_t v205 = MEMORY[0x263F8EE88];
                uint64_t v82 = 1 << *(unsigned char *)(v80 + 32);
                uint64_t v83 = -1;
                if (v82 < 64) {
                  uint64_t v83 = ~(-1 << v82);
                }
                uint64_t v61 = v83 & v81;
                int64_t v70 = (unint64_t)(v82 + 63) >> 6;
                int64_t v45 = v189 + 8;
                swift_bridgeObjectRetain_n();
                int64_t v84 = 0;
                uint64_t v85 = v190;
                uint64_t v86 = (uint64_t)v202;
                int64_t v60 = (int64_t)v203;
                while (1)
                {
                  if (v61)
                  {
                    v61 &= v61 - 1;
                  }
                  else
                  {
                    int64_t v87 = v84 + 1;
                    if (__OFADD__(v84, 1)) {
                      goto LABEL_118;
                    }
                    if (v87 >= v70)
                    {
LABEL_55:
                      swift_release();
                      swift_bridgeObjectRelease();
                      uint64_t v204 = v205;
                      uint64_t v90 = *(void *)&v196[*(int *)(v198 + 64)];
                      uint64_t v92 = v90 + 56;
                      uint64_t v91 = *(void *)(v90 + 56);
                      uint64_t v205 = MEMORY[0x263F8EE88];
                      uint64_t v93 = 1 << *(unsigned char *)(v90 + 32);
                      uint64_t v94 = -1;
                      if (v93 < 64) {
                        uint64_t v94 = ~(-1 << v93);
                      }
                      unint64_t v95 = v94 & v91;
                      int64_t v60 = (unint64_t)(v93 + 63) >> 6;
                      int64_t v70 = v188 + 8;
                      swift_bridgeObjectRetain_n();
                      int64_t v45 = 0;
                      uint64_t v96 = v200;
                      uint64_t v97 = v199;
                      while (1)
                      {
                        if (v95)
                        {
                          unint64_t v98 = __clz(__rbit64(v95));
                          v95 &= v95 - 1;
                          unint64_t v99 = v98 | (v45 << 6);
                        }
                        else
                        {
                          int64_t v100 = v45 + 1;
                          if (__OFADD__(v45, 1)) {
                            goto LABEL_119;
                          }
                          if (v100 >= v60)
                          {
LABEL_79:
                            swift_release();
                            swift_bridgeObjectRelease();
                            sub_23776D2E8();
                            return;
                          }
                          unint64_t v101 = *(void *)(v92 + 8 * v100);
                          ++v45;
                          if (!v101)
                          {
                            int64_t v45 = v100 + 1;
                            if (v100 + 1 >= v60) {
                              goto LABEL_79;
                            }
                            unint64_t v101 = *(void *)(v92 + 8 * v45);
                            if (!v101)
                            {
                              int64_t v45 = v100 + 2;
                              if (v100 + 2 >= v60) {
                                goto LABEL_79;
                              }
                              unint64_t v101 = *(void *)(v92 + 8 * v45);
                              if (!v101)
                              {
                                int64_t v45 = v100 + 3;
                                if (v100 + 3 >= v60) {
                                  goto LABEL_79;
                                }
                                unint64_t v101 = *(void *)(v92 + 8 * v45);
                                if (!v101)
                                {
                                  int64_t v45 = v100 + 4;
                                  if (v100 + 4 >= v60) {
                                    goto LABEL_79;
                                  }
                                  unint64_t v101 = *(void *)(v92 + 8 * v45);
                                  if (!v101)
                                  {
                                    int64_t v102 = v100 + 5;
                                    if (v102 >= v60) {
                                      goto LABEL_79;
                                    }
                                    unint64_t v101 = *(void *)(v92 + 8 * v102);
                                    if (!v101)
                                    {
                                      while (1)
                                      {
                                        int64_t v45 = v102 + 1;
                                        if (__OFADD__(v102, 1)) {
                                          break;
                                        }
                                        if (v45 >= v60) {
                                          goto LABEL_79;
                                        }
                                        unint64_t v101 = *(void *)(v92 + 8 * v45);
                                        ++v102;
                                        if (v101) {
                                          goto LABEL_78;
                                        }
                                      }
LABEL_159:
                                      __break(1u);
LABEL_160:
                                      __break(1u);
LABEL_161:
                                      __break(1u);
LABEL_162:
                                      __break(1u);
                                      goto LABEL_163;
                                    }
                                    int64_t v45 = v102;
                                  }
                                }
                              }
                            }
                          }
LABEL_78:
                          unint64_t v95 = (v101 - 1) & v101;
                          unint64_t v99 = __clz(__rbit64(v101)) + (v45 << 6);
                        }
                        uint64_t v61 = *(void *)(*(void *)(v90 + 48) + 16 * v99 + 8);
                        swift_bridgeObjectRetain_n();
                        sub_23776D3C8();
                        sub_237751F18(v97, v96);
                        (*(void (**)(uint64_t, void (**)(char *, uint64_t, uint64_t)))v70)(v97, v201);
                        swift_bridgeObjectRelease();
                      }
                    }
                    uint64_t v88 = *(void *)(v204 + 8 * v87);
                    ++v84;
                    if (!v88)
                    {
                      int64_t v84 = v87 + 1;
                      if (v87 + 1 >= v70) {
                        goto LABEL_55;
                      }
                      uint64_t v88 = *(void *)(v204 + 8 * v84);
                      if (!v88)
                      {
                        int64_t v84 = v87 + 2;
                        if (v87 + 2 >= v70) {
                          goto LABEL_55;
                        }
                        uint64_t v88 = *(void *)(v204 + 8 * v84);
                        if (!v88)
                        {
                          int64_t v84 = v87 + 3;
                          if (v87 + 3 >= v70) {
                            goto LABEL_55;
                          }
                          uint64_t v88 = *(void *)(v204 + 8 * v84);
                          if (!v88)
                          {
                            int64_t v84 = v87 + 4;
                            if (v87 + 4 >= v70) {
                              goto LABEL_55;
                            }
                            uint64_t v88 = *(void *)(v204 + 8 * v84);
                            if (!v88)
                            {
                              int64_t v89 = v87 + 5;
                              if (v89 >= v70) {
                                goto LABEL_55;
                              }
                              uint64_t v88 = *(void *)(v204 + 8 * v89);
                              if (!v88)
                              {
                                while (1)
                                {
                                  int64_t v84 = v89 + 1;
                                  if (__OFADD__(v89, 1)) {
                                    break;
                                  }
                                  if (v84 >= v70) {
                                    goto LABEL_55;
                                  }
                                  uint64_t v88 = *(void *)(v204 + 8 * v84);
                                  ++v89;
                                  if (v88) {
                                    goto LABEL_54;
                                  }
                                }
LABEL_158:
                                __break(1u);
                                goto LABEL_159;
                              }
                              int64_t v84 = v89;
                            }
                          }
                        }
                      }
                    }
LABEL_54:
                    uint64_t v61 = (v88 - 1) & v88;
                  }
                  swift_bridgeObjectRetain_n();
                  sub_23776D398();
                  sub_23775223C(v86, (char *)v60);
                  (*(void (**)(uint64_t, uint64_t))v45)(v86, v85);
                  swift_bridgeObjectRelease();
                }
              }
              int64_t v60 = v79;
            }
          }
        }
      }
    }
LABEL_30:
    uint64_t v61 = (v78 - 1) & v78;
LABEL_11:
    swift_bridgeObjectRetain_n();
    sub_23776D368();
    sub_237752560((uint64_t)v32, v30);
    (*v76)(v32, v204);
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_118:
  __break(1u);
LABEL_119:
  __break(1u);
LABEL_120:
  uint64_t v107 = v175;
  uint64_t v108 = v174;
  uint64_t v138 = v172;
  uint64_t v110 = v173;
  if (!v70)
  {
LABEL_153:
    uint64_t v167 = *(void *)(v60 + 16);
    uint64_t v168 = (uint64_t)v195;
    (*(void (**)(char *, int64_t, uint64_t))(v193 + 16))(v195, v60 + *(int *)(v45 + 24), v194);
    DeviceActivityFilter.SegmentInterval.init(_:_:)(v167, v168, v61);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v108 + 56))(v110, 1, 1, v107);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_155;
  }
  uint64_t v139 = *(void *)(v60 + 16);
  uint64_t v140 = (uint64_t)v195;
  (*(void (**)(char *, int64_t, uint64_t))(v193 + 16))(v195, v60 + *(int *)(v45 + 24), v194);
  DeviceActivityFilter.SegmentInterval.init(_:_:)(v139, v140, (uint64_t)v171);
  sub_23776D268();
  uint64_t v141 = *(void *)(v70 + 56);
  uint64_t v202 = (char *)(v70 + 56);
  uint64_t v142 = 1 << *(unsigned char *)(v70 + 32);
  uint64_t v205 = MEMORY[0x263F8EE88];
  if (v142 < 64) {
    uint64_t v143 = ~(-1 << v142);
  }
  else {
    uint64_t v143 = -1;
  }
  unint64_t v144 = v143 & v141;
  uint64_t v203 = (char *)((unint64_t)(v142 + 63) >> 6);
  int64_t v145 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v138 + 48);
  uint64_t v200 = (char *)(v138 + 16);
  v201 = (void (**)(char *, uint64_t, uint64_t))(v138 + 32);
  unint64_t v146 = (void (**)(uint64_t, uint64_t))(v138 + 8);
  swift_bridgeObjectRetain();
  uint64_t v147 = 0;
  *(void *)&long long v148 = 134349056;
  long long v199 = v148;
  v149 = v181;
  while (1)
  {
    if (v144)
    {
      int64_t v150 = v60;
      unint64_t v151 = __clz(__rbit64(v144));
      v144 &= v144 - 1;
      unint64_t v152 = v151 | (v147 << 6);
      uint64_t v153 = (uint64_t)v183;
      goto LABEL_147;
    }
    uint64_t v154 = v147 + 1;
    uint64_t v153 = (uint64_t)v183;
    if (__OFADD__(v147, 1)) {
      goto LABEL_161;
    }
    if (v154 >= (uint64_t)v203)
    {
LABEL_156:
      swift_release();
      sub_23776D2C8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23776D2F8();
      return;
    }
    unint64_t v155 = *(void *)&v202[8 * v154];
    ++v147;
    if (!v155)
    {
      uint64_t v147 = v154 + 1;
      if (v154 + 1 >= (uint64_t)v203) {
        goto LABEL_156;
      }
      unint64_t v155 = *(void *)&v202[8 * v147];
      if (!v155)
      {
        uint64_t v147 = v154 + 2;
        if (v154 + 2 >= (uint64_t)v203) {
          goto LABEL_156;
        }
        unint64_t v155 = *(void *)&v202[8 * v147];
        if (!v155)
        {
          uint64_t v147 = v154 + 3;
          if (v154 + 3 >= (uint64_t)v203) {
            goto LABEL_156;
          }
          unint64_t v155 = *(void *)&v202[8 * v147];
          if (!v155)
          {
            uint64_t v147 = v154 + 4;
            if (v154 + 4 >= (uint64_t)v203) {
              goto LABEL_156;
            }
            unint64_t v155 = *(void *)&v202[8 * v147];
            if (!v155) {
              break;
            }
          }
        }
      }
    }
LABEL_146:
    int64_t v150 = v60;
    unint64_t v144 = (v155 - 1) & v155;
    unint64_t v152 = __clz(__rbit64(v155)) + (v147 << 6);
LABEL_147:
    uint64_t v157 = *(void *)(*(void *)(v70 + 48) + 8 * v152);
    sub_23776D0C8();
    uint64_t v158 = v184;
    if ((*v145)(v153, 1, v184) == 1)
    {
      sub_237768F08(v153);
      if (qword_268925420 != -1) {
        swift_once();
      }
      uint64_t v159 = sub_23776D418();
      __swift_project_value_buffer(v159, (uint64_t)qword_268926650);
      uint64_t v160 = sub_23776D3F8();
      os_log_type_t v161 = sub_23776D768();
      if (os_log_type_enabled(v160, v161))
      {
        uint64_t v162 = swift_slowAlloc();
        *(_DWORD *)uint64_t v162 = v199;
        *(void *)(v162 + 4) = v157;
        _os_log_impl(&dword_23774D000, v160, v161, "Invalid device model: %{public}ld", (uint8_t *)v162, 0xCu);
        uint64_t v163 = v162;
        v149 = v181;
        MEMORY[0x237E1FC70](v163, -1, -1);
      }
    }
    else
    {
      uint64_t v164 = v178;
      (*v201)(v178, v153, v158);
      (*(void (**)(char *, char *, uint64_t))v200)(v149, v164, v158);
      uint64_t v165 = v182;
      sub_237752884(v182, v149);
      uint64_t v166 = *v146;
      (*v146)(v165, v158);
      v166((uint64_t)v164, v158);
    }
    int64_t v60 = v150;
    int64_t v70 = v204;
  }
  uint64_t v156 = v154 + 5;
  if (v156 >= (uint64_t)v203) {
    goto LABEL_156;
  }
  unint64_t v155 = *(void *)&v202[8 * v156];
  if (v155)
  {
    uint64_t v147 = v156;
    goto LABEL_146;
  }
  while (1)
  {
    uint64_t v147 = v156 + 1;
    if (__OFADD__(v156, 1)) {
      break;
    }
    if (v147 >= (uint64_t)v203) {
      goto LABEL_156;
    }
    unint64_t v155 = *(void *)&v202[8 * v147];
    ++v156;
    if (v155) {
      goto LABEL_146;
    }
  }
LABEL_163:
  __break(1u);
}

uint64_t sub_237765CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DeviceActivityReport.ClientConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_237765D44(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x746E656D676573;
      break;
    case 2:
      unint64_t result = 0x6C61767265746E69;
      break;
    case 3:
      unint64_t result = 0x7372657375;
      break;
    case 4:
      unint64_t result = 0x736C65646F6DLL;
      break;
    case 5:
      unint64_t result = 0x746163696C707061;
      break;
    case 6:
      unint64_t result = 0x69726F6765746163;
      break;
    case 7:
      unint64_t result = 0x69616D6F44626577;
      break;
    case 8:
      unint64_t result = 0x44746C4172657375;
      break;
    case 9:
      return result;
    case 10:
      unint64_t result = 0xD000000000000011;
      break;
    case 11:
    case 13:
      unint64_t result = 0xD000000000000013;
      break;
    case 12:
      unint64_t result = 0x736E69616D6F64;
      break;
    default:
      unint64_t result = 0x747865746E6F63;
      break;
  }
  return result;
}

BOOL sub_237765F04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237765F18()
{
  return sub_23776DA08();
}

uint64_t sub_237765F60()
{
  return sub_23776D9F8();
}

uint64_t sub_237765F8C()
{
  return sub_23776DA08();
}

unint64_t sub_237765FD0()
{
  return sub_237765D44(*v0);
}

uint64_t sub_237765FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_23776A54C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237766000()
{
  return 0;
}

void sub_23776600C(unsigned char *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_237766018(uint64_t a1)
{
  unint64_t v2 = sub_237768FAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_237766054(uint64_t a1)
{
  unint64_t v2 = sub_237768FAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeviceActivityReport.ClientConfiguration.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925750);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237768FAC();
  sub_23776DA28();
  LOBYTE(v14) = 0;
  sub_23776D968();
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  LOBYTE(v14) = 1;
  sub_23776D978();
  uint64_t v9 = (int *)type metadata accessor for DeviceActivityReport.ClientConfiguration();
  LOBYTE(v14) = 2;
  sub_23776CFC8();
  sub_23776AFB8(&qword_268925760, MEMORY[0x263F062D0]);
  sub_23776D988();
  LOBYTE(v14) = 3;
  sub_23776D948();
  uint64_t v14 = *(void *)(v3 + v9[8]);
  char v13 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925768);
  sub_237769390(&qword_268925770, &qword_268925768);
  sub_23776D958();
  uint64_t v14 = *(void *)(v3 + v9[9]);
  char v13 = 5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925778);
  sub_237769000();
  sub_23776D988();
  uint64_t v14 = *(void *)(v3 + v9[10]);
  char v13 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925798);
  sub_237769098();
  sub_23776D988();
  uint64_t v14 = *(void *)(v3 + v9[11]);
  char v13 = 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689257B8);
  sub_237769130();
  sub_23776D988();
  LOBYTE(v14) = 8;
  sub_23776D938();
  LOBYTE(v14) = 9;
  sub_23776D938();
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(v3 + v9[14]);
  char v13 = 10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689257D8);
  sub_237769390(&qword_2689257E0, &qword_2689257D8);
  sub_23776D988();
  uint64_t v14 = *(void *)(v3 + v9[15]);
  char v13 = 11;
  sub_23776D988();
  uint64_t v14 = *(void *)(v3 + v9[16]);
  char v13 = 12;
  sub_23776D988();
  LOBYTE(v14) = 13;
  sub_23776D938();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v8, v5);
}

uint64_t DeviceActivityReport.ClientConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_23776CFC8();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689257E8);
  uint64_t v8 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = (int *)type metadata accessor for DeviceActivityReport.ClientConfiguration();
  MEMORY[0x270FA5388](v42);
  uint64_t v12 = (uint64_t *)((char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = a1[3];
  uint64_t v40 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_237768FAC();
  sub_23776DA18();
  if (v2)
  {
    uint64_t v41 = v2;
    LODWORD(v37) = 0;
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
    int v15 = 0;
    BOOL v39 = 0;
    LODWORD(v38) = 0;
    if (v37) {
      goto LABEL_9;
    }
LABEL_5:
    if (!v15) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  uint64_t v34 = a2;
  uint64_t v37 = v8;
  LOBYTE(v44) = 0;
  *uint64_t v12 = sub_23776D908();
  v12[1] = v16;
  LOBYTE(v44) = 1;
  v12[2] = sub_23776D918();
  LOBYTE(v44) = 2;
  sub_23776AFB8(&qword_2689257F0, MEMORY[0x263F062D0]);
  uint64_t v17 = v36;
  sub_23776D928();
  uint64_t v18 = v42;
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))((char *)v12 + v42[6], v7, v17);
  LOBYTE(v44) = 3;
  uint64_t v19 = sub_23776D8E8();
  uint64_t v20 = (char *)v12 + v18[7];
  *(void *)uint64_t v20 = v19;
  v20[8] = v21 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925768);
  char v43 = 4;
  sub_237769390(&qword_2689257F8, &qword_268925768);
  sub_23776D8F8();
  *(uint64_t *)((char *)v12 + v18[8]) = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925778);
  char v43 = 5;
  sub_2377691C8();
  sub_23776D928();
  *(uint64_t *)((char *)v12 + v18[9]) = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925798);
  char v43 = 6;
  sub_237769260();
  sub_23776D928();
  *(uint64_t *)((char *)v12 + v18[10]) = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689257B8);
  char v43 = 7;
  sub_2377692F8();
  sub_23776D928();
  *(uint64_t *)((char *)v12 + v18[11]) = v44;
  LOBYTE(v44) = 8;
  uint64_t v22 = sub_23776D8D8();
  uint64_t v23 = (uint64_t *)((char *)v12 + v42[12]);
  *uint64_t v23 = v22;
  v23[1] = v24;
  LOBYTE(v44) = 9;
  uint64_t v25 = sub_23776D8D8();
  uint64_t v41 = 0;
  uint64_t v27 = (uint64_t *)((char *)v12 + v42[13]);
  *uint64_t v27 = v25;
  v27[1] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689257D8);
  char v43 = 10;
  sub_237769390((unint64_t *)&unk_268925830, &qword_2689257D8);
  uint64_t v28 = v41;
  sub_23776D928();
  BOOL v39 = v28 == 0;
  uint64_t v41 = v28;
  if (!v28)
  {
    *(uint64_t *)((char *)v12 + v42[14]) = v44;
    char v43 = 11;
    sub_23776D928();
    uint64_t v41 = 0;
    *(uint64_t *)((char *)v12 + v42[15]) = v44;
    char v43 = 12;
    sub_23776D928();
    uint64_t v41 = 0;
    *(uint64_t *)((char *)v12 + v42[16]) = v44;
    LOBYTE(v44) = 13;
    uint64_t v29 = sub_23776D8D8();
    uint64_t v41 = 0;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
    uint64_t v33 = (uint64_t *)((char *)v12 + v42[17]);
    *uint64_t v33 = v30;
    v33[1] = v32;
    sub_237765CE0((uint64_t)v12, v34);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
    return sub_23775175C((uint64_t)v12);
  }
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v38);
  LODWORD(v38) = 0;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
  swift_bridgeObjectRelease();
  int v15 = 1;
  LODWORD(v37) = 1;
  (*(void (**)(char *, uint64_t))(v35 + 8))((char *)v12 + v42[6], v36);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v37 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_9:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
  {
LABEL_10:
    if (v39) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  if (v39) {
LABEL_11:
  }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_12:
  if (v38) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_237766F3C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DeviceActivityReport.ClientConfiguration.init(from:)(a1, a2);
}

uint64_t sub_237766F54(void *a1)
{
  return DeviceActivityReport.ClientConfiguration.encode(to:)(a1);
}

void sub_237766F6C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    _s15ServiceHostViewV11CoordinatorCMa();
    sub_2377517B8(a3, a4);
    sub_23776AD8C(a3, a4);
    sub_237763168(a3, a4);
  }
}

id sub_237766FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  _s15ServiceHostViewVMa();
  swift_getWitnessTable();
  sub_23776D548();
  sub_23776D538();
  id v8 = sub_2377670CC(a6, a2, a3);

  self;
  id result = (id)swift_dynamicCastObjCClass();
  if (!result)
  {

    return objc_msgSend(objc_allocWithZone(MEMORY[0x263F04E60]), sel_init);
  }
  return result;
}

id sub_2377670CC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)(*MEMORY[0x263F8EED0] & *a1);
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 24);
  uint64_t v8 = swift_unknownObjectRetain();
  v7(v8, a2, a3);
  id v9 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  uint64_t v10 = (void *)sub_23776D618();
  id v11 = objc_msgSend(v9, sel_initWithExtensionPointIdentifier_, v10);

  uint64_t v12 = v5[11];
  uint64_t v13 = (void *)swift_allocObject();
  void v13[2] = v5[10];
  v13[3] = v12;
  v13[4] = v5[12];
  uint64_t v14 = v5[13];
  v13[5] = v14;
  v13[6] = v6;
  v13[7] = a3;
  int v15 = *(void (**)(id, void (*)(uint64_t), void *, uint64_t, uint64_t))(v14 + 24);
  id v16 = v6;
  v15(v11, sub_23776AF54, v13, v12, v14);

  swift_release();
  return v16;
}

void sub_237767284(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v43 = a3;
  uint64_t v44 = a7;
  uint64_t v42 = a5;
  int64_t v45 = a2;
  uint64_t v10 = sub_23776D5C8();
  uint64_t v50 = *(void *)(v10 - 8);
  uint64_t v51 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v48 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_23776D5E8();
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v46 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = sub_23776D7F8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v16);
  uint64_t v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v52 = (char *)&v41 - v23;
  aBlock[0] = a1;
  sub_23776D698();
  swift_getWitnessTable();
  sub_23776D758();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (qword_268925420 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_23776D418();
    __swift_project_value_buffer(v24, (uint64_t)qword_268926650);
    uint64_t v25 = sub_23776D3F8();
    os_log_type_t v26 = sub_23776D778();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_23774D000, v25, v26, "Failed to find the report service extension.", v27, 2u);
      MEMORY[0x237E1FC70](v27, -1, -1);
    }
  }
  else
  {
    uint64_t v28 = v52;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v52, v18, AssociatedTypeWitness);
    uint64_t v29 = swift_allocBox();
    (*(void (**)(uint64_t, uint64_t))(a6 + 24))(a4, a6);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v28, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t, uint64_t))(a6 + 40))(v22, a4, a6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 64))(1, a4, a6);
    sub_23776365C();
    uint64_t v30 = (void *)sub_23776D7B8();
    uint64_t v31 = (void *)swift_allocObject();
    uint64_t v32 = v42;
    v31[2] = a4;
    v31[3] = v32;
    uint64_t v33 = v44;
    uint64_t v34 = v45;
    v31[4] = a6;
    v31[5] = v33;
    uint64_t v35 = v43;
    v31[6] = v34;
    v31[7] = v35;
    uint64_t v41 = v29;
    v31[8] = v29;
    aBlock[4] = sub_23776AFA4;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237764020;
    aBlock[3] = &block_descriptor_12;
    uint64_t v36 = _Block_copy(aBlock);
    id v37 = v34;
    swift_retain();
    swift_release();
    uint64_t v38 = v46;
    sub_23776D5D8();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_23776AFB8((unint64_t *)&unk_268925A10, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268925700);
    sub_237763D24((unint64_t *)&unk_268925A20, &qword_268925700);
    BOOL v39 = v48;
    uint64_t v40 = v51;
    sub_23776D838();
    MEMORY[0x237E1F4A0](0, v38, v39, v36);
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v39, v40);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v49);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v52, AssociatedTypeWitness);
    swift_release();
  }
}

uint64_t sub_2377678E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = swift_projectBox();
  uint64_t ObjectType = swift_getObjectType();
  swift_beginAccess();
  v13[3] = a4;
  v13[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, v9, a4);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a2 + 48))(v13, ObjectType, a2);
}

id sub_2377679B8(uint64_t a1, uint64_t a2)
{
  return sub_237766FF4(a1, *v2, v2[1], v2[2], v2[3], *(void **)(a2 + 16));
}

void sub_2377679F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23776AE40(a2, *(void *)v3, *(void *)(v3 + 8), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void **)(a3 + 16));
}

void sub_237767A34(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  sub_237766F6C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24));
  *a3 = v5;
}

uint64_t sub_237767A68()
{
  return sub_23776D4D8();
}

uint64_t sub_237767AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F02710](a1, a2, a3, WitnessTable);
}

uint64_t sub_237767B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F026D8](a1, a2, a3, WitnessTable);
}

void sub_237767B9C()
{
}

void sub_237767BDC()
{
  uint64_t v1 = sub_237767D68();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    uint64_t v3 = v0 + qword_268925858;
    uint64_t v4 = *(void *)(v0 + qword_268925858);
    unint64_t v5 = *(void *)(v3 + 8);
    sub_2377517CC(v4, v5);
    id v6 = (void *)sub_23776CFF8();
    sub_237751994(v4, v5);
    v8[4] = sub_237767CDC;
    v8[5] = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_237767CE8;
    v8[3] = &block_descriptor_0;
    uint64_t v7 = _Block_copy(v8);
    objc_msgSend(v2, sel_updateClientConfiguration::, v6, v7);
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
}

void sub_237767CDC(void *a1)
{
}

void sub_237767CE8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_237767D54(uint64_t a1)
{
  *(void *)(v1 + qword_268925860) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_237767D68()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689256D8);
  sub_23776D7C8();
  return v1;
}

uint64_t sub_237767DE0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(result + qword_268925860);
  if (!v3) {
    goto LABEL_3;
  }
  v7[4] = sub_237767F0C;
  v7[5] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_23775ECAC;
  v7[3] = &block_descriptor_53;
  id v4 = _Block_copy(v7);
  id v5 = v3;
  id v6 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v4);
  _Block_release(v4);

  sub_23776D828();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268925A30);
  id result = swift_dynamicCast();
  if ((result & 1) == 0) {
LABEL_3:
  }
    *a2 = 0;
  return result;
}

void sub_237767F0C(void *a1)
{
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_23776D418();
  __swift_project_value_buffer(v2, (uint64_t)qword_268926650);
  MEMORY[0x237E1FAE0](a1);
  MEMORY[0x237E1FAE0](a1);
  oslog = sub_23776D3F8();
  os_log_type_t v3 = sub_23776D768();
  if (os_log_type_enabled(oslog, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)id v4 = 136446210;
    MEMORY[0x237E1FAE0](a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689256E0);
    uint64_t v6 = sub_23776D638();
    sub_237750E08(v6, v7, &v9);
    sub_23776D808();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23774D000, oslog, v3, "Failed to create service proxy for service host coordinator: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E1FC70](v5, -1, -1);
    MEMORY[0x237E1FC70](v4, -1, -1);
  }
  else
  {
  }
}

void sub_237768104(uint64_t a1)
{
}

void sub_237768110(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_237768104((uint64_t)v4);
}

void sub_237768178(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a1;
  id v8 = a4;
  sub_23776B288();
}

void sub_2377681E4(uint64_t a1, uint64_t a2)
{
  os_log_type_t v3 = v2;
  id v5 = (void *)(*MEMORY[0x263F8EED0] & *(void *)v2);
  uint64_t ObjectType = swift_getObjectType();
  id v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  id v8 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26EA7A9E0);
  objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = v5[10];
  v10[2] = v11;
  uint64_t v12 = v5[11];
  v10[3] = v12;
  uint64_t v13 = v5[12];
  v10[4] = v13;
  uint64_t v14 = v5[13];
  v10[5] = v14;
  v10[6] = v9;
  BOOL v39 = sub_23776B184;
  uint64_t v40 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  id v37 = sub_237764020;
  uint64_t v38 = &block_descriptor_30;
  uint64_t v15 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v7, sel_setInterruptionHandler_, v15);
  _Block_release(v15);
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v11;
  v17[3] = v12;
  v17[4] = v13;
  v17[5] = v14;
  v17[6] = v16;
  BOOL v39 = sub_23776B194;
  uint64_t v40 = v17;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  id v37 = sub_237764020;
  uint64_t v38 = &block_descriptor_37;
  uint64_t v18 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v7, sel_setInvalidationHandler_, v18);
  _Block_release(v18);
  objc_msgSend(v7, sel_activate);
  uint64_t v19 = *(NSObject **)&v3[qword_268925868];
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v3;
  *(void *)(v20 + 24) = v7;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_23776B210;
  *(void *)(v21 + 24) = v20;
  BOOL v39 = sub_23776B2C0;
  uint64_t v40 = (void *)v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  id v37 = sub_23775F504;
  uint64_t v38 = &block_descriptor_47;
  uint64_t v22 = _Block_copy(&aBlock);
  uint64_t v23 = v3;
  id v24 = v7;
  swift_retain();
  swift_release();
  dispatch_sync(v19, v22);

  _Block_release(v22);
  LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v24)
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_5;
  }
  uint64_t v25 = sub_237767D68();
  if (v25)
  {
    os_log_type_t v26 = (void *)v25;
    uint64_t v27 = *(void *)&v23[qword_268925858];
    unint64_t v28 = *(void *)&v23[qword_268925858 + 8];
    sub_2377517CC(v27, v28);
    uint64_t v29 = (void *)sub_23776CFF8();
    sub_237751994(v27, v28);
    BOOL v39 = sub_237768A40;
    uint64_t v40 = 0;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    id v37 = sub_237767CE8;
    uint64_t v38 = &block_descriptor_50;
    uint64_t v30 = _Block_copy(&aBlock);
    objc_msgSend(v26, sel_discoverClientExtensionWithConfiguration::, v29, v30);
    _Block_release(v30);
    swift_release();
    swift_unknownObjectRelease();

    return;
  }
  if (qword_268925420 != -1) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v31 = sub_23776D418();
  __swift_project_value_buffer(v31, (uint64_t)qword_268926650);
  uint64_t v32 = sub_23776D3F8();
  os_log_type_t v33 = sub_23776D788();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_23774D000, v32, v33, "Can't discover the client's extension without a valid XPC proxy", v34, 2u);
    MEMORY[0x237E1FC70](v34, -1, -1);
  }
  swift_release();
}

void sub_237768920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6, char a7)
{
  uint64_t v9 = a1 + 16;
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_23776D418();
  __swift_project_value_buffer(v10, (uint64_t)qword_268926650);
  uint64_t v11 = sub_23776D3F8();
  os_log_type_t v12 = sub_23776D788();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_23774D000, v11, v12, a6, v13, 2u);
    MEMORY[0x237E1FC70](v13, -1, -1);
  }

  swift_beginAccess();
  uint64_t v14 = MEMORY[0x237E1FD10](v9);
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    sub_237768C68(a7 & 1);
  }
}

void sub_237768A40(void *a1)
{
}

void sub_237768A4C(void *a1, const char *a2)
{
  if (a1)
  {
    MEMORY[0x237E1FAE0]();
    if (qword_268925420 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_23776D418();
    __swift_project_value_buffer(v4, (uint64_t)qword_268926650);
    MEMORY[0x237E1FAE0](a1);
    MEMORY[0x237E1FAE0](a1);
    oslog = sub_23776D3F8();
    os_log_type_t v5 = sub_23776D768();
    if (os_log_type_enabled(oslog, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v11 = v7;
      *(_DWORD *)id v6 = 136446210;
      MEMORY[0x237E1FAE0](a1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689256E0);
      uint64_t v8 = sub_23776D638();
      sub_237750E08(v8, v9, &v11);
      sub_23776D808();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_23774D000, oslog, v5, a2, v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237E1FC70](v7, -1, -1);
      MEMORY[0x237E1FC70](v6, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_237768C68(char a1)
{
  os_log_type_t v3 = *(NSObject **)&v1[qword_268925868];
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_23776B09C;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_23776B10C;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_23775F504;
  v10[3] = &block_descriptor_21;
  id v6 = _Block_copy(v10);
  uint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_237768DC4()
{
}

id sub_237768E30()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)_s15ServiceHostViewV11CoordinatorCMa();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

void sub_237768EA8(uint64_t a1)
{
  sub_237751994(*(void *)(a1 + qword_268925858), *(void *)(a1 + qword_268925858 + 8));

  long long v2 = *(void **)(a1 + qword_268925868);
}

uint64_t sub_237768F08(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925748);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_237768FAC()
{
  unint64_t result = qword_268925758;
  if (!qword_268925758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925758);
  }
  return result;
}

unint64_t sub_237769000()
{
  unint64_t result = qword_268925780;
  if (!qword_268925780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925778);
    sub_237763D24(&qword_268925788, &qword_268925790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925780);
  }
  return result;
}

unint64_t sub_237769098()
{
  unint64_t result = qword_2689257A0;
  if (!qword_2689257A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925798);
    sub_237763D24(&qword_2689257A8, &qword_2689257B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689257A0);
  }
  return result;
}

unint64_t sub_237769130()
{
  unint64_t result = qword_2689257C0;
  if (!qword_2689257C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689257B8);
    sub_237763D24(&qword_2689257C8, &qword_2689257D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689257C0);
  }
  return result;
}

unint64_t sub_2377691C8()
{
  unint64_t result = qword_268925800;
  if (!qword_268925800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925778);
    sub_237763D24(&qword_268925808, &qword_268925790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925800);
  }
  return result;
}

unint64_t sub_237769260()
{
  unint64_t result = qword_268925810;
  if (!qword_268925810)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268925798);
    sub_237763D24(&qword_268925818, &qword_2689257B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925810);
  }
  return result;
}

unint64_t sub_2377692F8()
{
  unint64_t result = qword_268925820;
  if (!qword_268925820)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689257B8);
    sub_237763D24(&qword_268925828, &qword_2689257D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268925820);
  }
  return result;
}

uint64_t sub_237769390(unint64_t *a1, uint64_t *a2)
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

uint64_t *_s19ClientConfigurationVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  objc_super v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v32 = *a2;
    *objc_super v4 = *a2;
    objc_super v4 = (uint64_t *)(v32 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    uint64_t v8 = a3[6];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_23776CFC8();
    os_log_type_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (char *)v4 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    *(uint64_t *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v17 = a3[10];
    *(uint64_t *)((char *)v4 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v17) = *(uint64_t *)((char *)a2 + v17);
    uint64_t v18 = a3[12];
    *(uint64_t *)((char *)v4 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    uint64_t v19 = (uint64_t *)((char *)v4 + v18);
    uint64_t v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[13];
    uint64_t v23 = a3[14];
    id v24 = (uint64_t *)((char *)v4 + v22);
    uint64_t v25 = (uint64_t *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *id v24 = *v25;
    v24[1] = v26;
    *(uint64_t *)((char *)v4 + v23) = *(uint64_t *)((char *)a2 + v23);
    uint64_t v27 = a3[16];
    *(uint64_t *)((char *)v4 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    *(uint64_t *)((char *)v4 + v27) = *(uint64_t *)((char *)a2 + v27);
    uint64_t v28 = a3[17];
    uint64_t v29 = (uint64_t *)((char *)v4 + v28);
    uint64_t v30 = (uint64_t *)((char *)a2 + v28);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t _s19ClientConfigurationVwxx(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_23776CFC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s19ClientConfigurationVwcp(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23776CFC8();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (char *)a1 + v12;
  uint64_t v15 = (char *)a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v16 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  uint64_t v17 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a3[13];
  uint64_t v22 = a3[14];
  uint64_t v23 = (void *)((char *)a1 + v21);
  id v24 = (void *)((char *)a2 + v21);
  uint64_t v25 = v24[1];
  *uint64_t v23 = *v24;
  v23[1] = v25;
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  uint64_t v26 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
  uint64_t v27 = a3[17];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s19ClientConfigurationVwca(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_23776CFC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[12];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[13];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[17];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19ClientConfigurationVwtk(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23776CFC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v14 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  uint64_t v16 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  return a1;
}

void *_s19ClientConfigurationVwta(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_23776CFC8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[12];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[13];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[17];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19ClientConfigurationVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_237769D50);
}

uint64_t sub_237769D50(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_23776CFC8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t _s19ClientConfigurationVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237769E14);
}

uint64_t sub_237769E14(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_23776CFC8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_237769EBC()
{
  uint64_t result = sub_23776CFC8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_237769F9C()
{
  return swift_initClassMetadata2();
}

uint64_t _s15ServiceHostViewV11CoordinatorCMa()
{
  return swift_getGenericMetadata();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t _s19ClientConfigurationV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s19ClientConfigurationV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x23776A17CLL);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_23776A1A4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23776A1AC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *_s19ClientConfigurationV10CodingKeysOMa()
{
  return &_s19ClientConfigurationV10CodingKeysON;
}

uint64_t sub_23776A1C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_23776A1CC(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 24);
  if (v1 >> 60 != 15) {
    return sub_237751994(*(void *)(result + 16), v1);
  }
  return result;
}

uint64_t sub_23776A1E8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  int v3 = (uint64_t *)(a2 + 16);
  unint64_t v4 = *(void *)(a2 + 24);
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v3;
  }
  else
  {
    uint64_t v5 = *v3;
    sub_2377517CC(*v3, *(void *)(a2 + 24));
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v4;
  }
  return a1;
}

uint64_t sub_23776A254(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  int v3 = (_OWORD *)(a1 + 16);
  unint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_2377517CC(*v4, *(void *)(a2 + 24));
      uint64_t v8 = *(void *)(a1 + 16);
      unint64_t v9 = *(void *)(a1 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v5;
      sub_237751994(v8, v9);
      return a1;
    }
    sub_237751B90(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *int v3 = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_2377517CC(*v4, *(void *)(a2 + 24));
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  return a1;
}

uint64_t sub_23776A304(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unint64_t v4 = (_OWORD *)(a1 + 16);
  unint64_t v5 = (void *)(a2 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = *(void *)(a1 + 16);
      *(void *)(a1 + 16) = *v5;
      *(void *)(a1 + 24) = v7;
      sub_237751994(v8, v6);
      return a1;
    }
    sub_237751B90(a1 + 16);
  }
  *unint64_t v4 = *(_OWORD *)v5;
  return a1;
}

uint64_t sub_23776A388(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23776A3D0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t _s15ServiceHostViewVMa()
{
  return swift_getGenericMetadata();
}

uint64_t sub_23776A428()
{
  return swift_getWitnessTable();
}

unint64_t sub_23776A448()
{
  unint64_t result = qword_2689259D0;
  if (!qword_2689259D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689259D0);
  }
  return result;
}

unint64_t sub_23776A4A0()
{
  unint64_t result = qword_2689259D8;
  if (!qword_2689259D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689259D8);
  }
  return result;
}

unint64_t sub_23776A4F8()
{
  unint64_t result = qword_2689259E0;
  if (!qword_2689259E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689259E0);
  }
  return result;
}

uint64_t sub_23776A54C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x747865746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656D676573 && a2 == 0xE700000000000000 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7372657375 && a2 == 0xE500000000000000 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x736C65646F6DLL && a2 == 0xE600000000000000 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x746163696C707061 && a2 == 0xEC000000736E6F69 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x69726F6765746163 && a2 == 0xEA00000000007365 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x69616D6F44626577 && a2 == 0xEA0000000000736ELL || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x44746C4172657375 && a2 == 0xEB00000000444953 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000023776F410 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000023776F430 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023776F450 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x736E69616D6F64 && a2 == 0xE700000000000000 || (sub_23776D9B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000023776F470)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    char v6 = sub_23776D9B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 13;
    }
    else {
      return 14;
    }
  }
}

id sub_23776AA90(uint64_t a1, unint64_t a2)
{
  uint64_t v18 = a1;
  unint64_t v19 = a2;
  uint64_t v20 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v17 = sub_23776D7A8();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23776D798();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_23776D5E8();
  MEMORY[0x270FA5388](v7 - 8);
  *(void *)((char *)v2 + qword_268925860) = 0;
  uint64_t v16 = qword_268925868;
  unint64_t v15 = sub_23776365C();
  uint64_t v8 = v2;
  sub_23776D5D8();
  *(void *)&long long v21 = MEMORY[0x263F8EE78];
  sub_23776AFB8((unint64_t *)&unk_2689259F0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689256F8);
  sub_237763D24((unint64_t *)&unk_268925A00, &qword_2689256F8);
  sub_23776D838();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v17);
  *(void *)((char *)v2 + v16) = sub_23776D7E8();
  unint64_t v9 = (void *)((char *)v8 + qword_268925858);
  uint64_t v10 = v18;
  unint64_t v11 = v19;
  uint64_t *v9 = v18;
  v9[1] = v11;
  sub_2377517CC(v10, v11);

  long long v12 = *(_OWORD *)(v20 + 96);
  long long v21 = *(_OWORD *)(v20 + 80);
  long long v22 = v12;
  uint64_t v13 = (objc_class *)_s15ServiceHostViewV11CoordinatorCMa();
  v23.receiver = v8;
  v23.super_class = v13;
  return objc_msgSendSuper2(&v23, sel_init);
}

id sub_23776AD8C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)_s15ServiceHostViewV11CoordinatorCMa());
  return sub_23776AA90(a1, a2);
}

void sub_23776ADE8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = (uint64_t *)(v2 + qword_268925858);
  uint64_t v4 = *(void *)(v2 + qword_268925858);
  unint64_t v5 = *(void *)(v2 + qword_268925858 + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  sub_2377517CC(a1, a2);
  sub_237751994(v4, v5);

  sub_237767BDC();
}

void sub_23776AE40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6)
{
  if (a5 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    sub_2377517B8(a4, a5);
    sub_23776ADE8(a4, a5);
    sub_237763168(a4, a5);
  }
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23776AF1C()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_23776AF54(uint64_t a1)
{
  sub_237767284(a1, *(void **)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_23776AF64()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_23776AFA4()
{
  return sub_2377678E8(v0[6], v0[7], v0[8], v0[2], v0[3], v0[4]);
}

uint64_t sub_23776AFB8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23776B064()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23776B09C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (*(unsigned char *)(v0 + 16) == 1) {
    objc_msgSend(*(id *)(v1 + qword_268925860), sel_invalidate);
  }
  uint64_t v2 = *(void **)(v1 + qword_268925860);
  *(void *)(v1 + qword_268925860) = 0;
}

uint64_t sub_23776B0FC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23776B10C()
{
  return sub_23775F4DC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_23776B114()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23776B14C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_23776B184()
{
}

void sub_23776B194()
{
}

void sub_23776B1A4(const char *a1, char a2)
{
  sub_237768920(v2[6], v2[2], v2[3], v2[4], v2[5], a1, a2);
}

uint64_t sub_23776B1D0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23776B210()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  id v4 = *(id *)(v1 + qword_268925860);
  *(void *)(v1 + qword_26892586sub_23776B1A4("The app's connection to our view service was invalidated.", 0) = v2;
  id v3 = v2;
}

uint64_t sub_23776B25C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23776B26C@<X0>(void *a1@<X8>)
{
  return sub_237767DE0(*(void *)(v1 + 16), a1);
}

uint64_t sub_23776B288()
{
  return sub_237768C68(1);
}

void sub_23776B290()
{
}

void *DeviceActivityData.activitySegments.getter@<X0>(void *a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v25 = sub_23776D208();
  uint64_t v1 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  id v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23776D358();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v24 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23776D0F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23776D168();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23776D178();
  uint64_t v14 = sub_23776D158();
  uint64_t v22 = v15;
  uint64_t v23 = v14;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_23776D188();
  uint64_t v16 = sub_23776D0B8();
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23776D138();
  uint64_t v19 = (uint64_t)v24;
  sub_23776D338();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v25);
  uint64_t v20 = sub_23776D148();
  sub_23776D128();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925AA0);
  swift_allocObject();
  uint64_t result = sub_23776B748(v23, v22, v16, v18, v19, v20, &v27);
  void *v26 = result;
  return result;
}

double DeviceActivityData.ActivitySegment.categories.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_23776B640(MEMORY[0x263F04A90], &qword_268925AA8, a1);
}

double DeviceActivityData.CategoryActivity.applications.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_23776B640(MEMORY[0x263F04A40], &qword_268925AC8, a1);
}

double DeviceActivityData.CategoryActivity.webDomains.getter@<D0>(uint64_t *a1@<X8>)
{
  return sub_23776B640(MEMORY[0x263F04A38], &qword_268925AD0, a1);
}

double sub_23776B640@<D0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  *(void *)(v6 + 24) = v5;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  uint64_t v7 = v6 + qword_268925AB0;
  uint64_t v8 = sub_23776D358();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)(v6 + qword_268925AB8) = 0;
  uint64_t v9 = v6 + qword_268925AC0;
  *(void *)(v9 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *a3 = v6;
  return result;
}

uint64_t DeviceActivityResults.makeAsyncIterator()()
{
  sub_23776C2EC();

  return swift_retain();
}

uint64_t sub_23776B738()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_23776B740(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void *sub_23776B748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, long long *a7)
{
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  void v7[6] = a3;
  v7[7] = a4;
  uint64_t v11 = (char *)v7 + qword_268925AB0;
  uint64_t v12 = sub_23776D358();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v11, a5, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  *(void *)((char *)v7 + qword_268925AB8) = a6;
  sub_23776C35C(a7, (uint64_t)v7 + qword_268925AC0);
  return v7;
}

uint64_t sub_23776B83C(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  v2[14] = *v1;
  v2[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689256C8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268925AE0);
  v2[17] = swift_task_alloc();
  uint64_t v3 = sub_23776D358();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23776B988, 0, 0);
}

uint64_t sub_23776B988()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = v1[3];
  if (v2)
  {
    uint64_t v4 = v1[2];
    uint64_t v3 = v1 + 2;
    uint64_t v5 = *(void *)(*(void *)(v0 + 112) + 88);
    if (v4 < MEMORY[0x237E1F350](v2, v5))
    {
      uint64_t v6 = *(void *)(v0 + 96);
      sub_23776D6A8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v6, 0, 1, v5);
      uint64_t v7 = *v3 + 1;
      if (!__OFADD__(*v3, 1)) {
        goto LABEL_21;
      }
      __break(1u);
    }
    uint64_t v1 = *(void **)(v0 + 104);
  }
  uint64_t v8 = v1[7];
  if (v8)
  {
    uint64_t v9 = v1[6];
    uint64_t v10 = *(void *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 136);
    sub_23776C2F8((uint64_t)v1 + qword_268925AB0, v12, &qword_268925AE0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10) == 1)
    {
      sub_237751BE4(*(void *)(v0 + 136), &qword_268925AE0);
    }
    else
    {
      uint64_t v13 = *(void *)(v0 + 104);
      (*(void (**)(void, void, void))(*(void *)(v0 + 152) + 32))(*(void *)(v0 + 160), *(void *)(v0 + 136), *(void *)(v0 + 144));
      uint64_t v14 = *(void *)(v13 + qword_268925AB8);
      if (v14)
      {
        sub_23776C2F8(*(void *)(v0 + 104) + qword_268925AC0, v0 + 56, qword_268925AE8);
        if (*(void *)(v0 + 80))
        {
          uint64_t v15 = *(void *)(v0 + 104);
          uint64_t v16 = sub_23776C35C((long long *)(v0 + 56), v0 + 16);
          unint64_t v24 = *(void *)(v15 + 16);
          unint64_t v25 = *(void *)(v14 + 16);
          if ((uint64_t)v24 < (uint64_t)v25)
          {
            if (v24 < v25)
            {
              uint64_t v26 = *(void *)(v0 + 104);
              uint64_t v27 = v14 + 16 * v24;
              uint64_t v28 = *(void *)(v27 + 40);
              uint64_t v36 = *(void *)(v27 + 32);
              *(void *)(v0 + 168) = v28;
              __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
              uint64_t v29 = *(void *)(v26 + 32);
              uint64_t v30 = *(void *)(v26 + 40);
              swift_bridgeObjectRetain();
              uint64_t v31 = (void *)swift_task_alloc();
              *(void *)(v0 + 176) = v31;
              *uint64_t v31 = v0;
              v31[1] = sub_23776BD30;
              uint64_t v21 = *(void *)(v0 + 160);
              uint64_t v16 = *(void *)(v0 + 128);
              uint64_t v17 = v29;
              uint64_t v18 = v30;
              uint64_t v19 = v9;
              uint64_t v20 = v8;
              uint64_t v22 = v36;
              uint64_t v23 = v28;
              return MEMORY[0x270EEB630](v16, v17, v18, v19, v20, v21, v22, v23);
            }
LABEL_25:
            __break(1u);
            return MEMORY[0x270EEB630](v16, v17, v18, v19, v20, v21, v22, v23);
          }
          (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
          __swift_destroy_boxed_opaque_existential_0(v0 + 16);
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
          sub_237751BE4(v0 + 56, qword_268925AE8);
        }
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 160), *(void *)(v0 + 144));
      }
    }
  }
  uint64_t v32 = *(void *)(v0 + 104);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)(v0 + 112) + 88) - 8)
                                                            + 56))(*(void *)(v0 + 96), 1, 1);
  uint64_t v33 = *(void *)(v32 + 16);
  uint64_t v3 = (uint64_t *)(v32 + 16);
  uint64_t v7 = v33 + 1;
  if (__OFADD__(v33, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
LABEL_21:
  *uint64_t v3 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
  return v34();
}

uint64_t sub_23776BD30()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_23776BE48, 0, 0);
}

uint64_t sub_23776BE48()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  uint64_t v4 = *(void *)(v1 + 88);
  int v5 = swift_dynamicCast();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, v5 ^ 1u, 1, v4);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  uint64_t v7 = *(void *)(v2 + 16);
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0[13] + 16) = v9;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  return result;
}

uint64_t DeviceActivityResults.Iterator.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237751BE4(v0 + qword_268925AB0, &qword_268925AE0);
  swift_bridgeObjectRelease();
  sub_237751BE4(v0 + qword_268925AC0, qword_268925AE8);
  return v0;
}

uint64_t DeviceActivityResults.Iterator.__deallocating_deinit()
{
  DeviceActivityResults.Iterator.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_23776C030(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_237762DB0;
  return sub_23776B83C(a1);
}

uint64_t sub_23776C0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v11;
  uint64_t v12 = type metadata accessor for DeviceActivityResults.Iterator();
  *uint64_t v11 = v6;
  v11[1] = sub_23776C1AC;
  return MEMORY[0x270FA1E90](a1, a2, a3, v12, a6);
}

uint64_t sub_23776C1AC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23776C2A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23776C2EC();
  swift_retain();
  uint64_t result = swift_release();
  *a1 = v2;
  return result;
}

uint64_t sub_23776C2EC()
{
  uint64_t result = *v0;
  *(void *)(*v0 + 16) = 0;
  return result;
}

uint64_t sub_23776C2F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23776C35C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23776C374()
{
  return MEMORY[0x263F8E658];
}

uint64_t sub_23776C380()
{
  return swift_getWitnessTable();
}

uint64_t sub_23776C39C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for DeviceActivityResults()
{
  return __swift_instantiateGenericMetadata();
}

void sub_23776C3BC()
{
  sub_23776C5B4();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for DeviceActivityResults.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for DeviceActivityResults.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceActivityResults.Iterator);
}

uint64_t dispatch thunk of DeviceActivityResults.Iterator.next()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 192) + **(int **)(*(void *)v1 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_23775D5B8;
  return v6(a1);
}

void sub_23776C5B4()
{
  if (!qword_268925C08)
  {
    sub_23776D358();
    unint64_t v0 = sub_23776D7F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268925C08);
    }
  }
}

_UNKNOWN **sub_23776C60C()
{
  return &protocol witness table for _EXExtensionIdentity;
}

uint64_t sub_23776C618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a2;
  v7[5] = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_23776C6F0;
  v7[3] = &block_descriptor_1;
  uint64_t v4 = _Block_copy(v7);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  objc_msgSend(ObjCClassFromMetadata, sel_executeQuery_completionHandler_, a1, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_23776C6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t sub_23776C6F0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_23776C77C();
  uint64_t v2 = sub_23776D678();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_23776B1A4("The app's connection to our view service was invalidated.", 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_23776C77C()
{
  unint64_t result = qword_268925C10;
  if (!qword_268925C10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268925C10);
  }
  return result;
}

uint64_t sub_23776C7BC()
{
  id v1 = objc_msgSend(*v0, sel_bundleIdentifier);
  uint64_t v2 = sub_23776D628();

  return v2;
}

uint64_t dispatch thunk of ExtensionRepresenting.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23776C828()
{
  uint64_t v0 = sub_23776D418();
  __swift_allocate_value_buffer(v0, qword_268926650);
  __swift_project_value_buffer(v0, (uint64_t)qword_268926650);
  return sub_23776D408();
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

uint64_t sub_23776C900(uint64_t a1)
{
  if (!*(void *)(a1 + 24))
  {
    objc_msgSend(v1, sel_setConfiguration_, 0);
    return sub_23776CE50(a1);
  }
  sub_23776CEB0(a1, (uint64_t)v13);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268925C20);
    sub_23776CF18();
    if (swift_dynamicCast())
    {
      objc_msgSend(v1, sel_setConfiguration_, v11[0]);

      return sub_23776CE50(a1);
    }
  }
  else
  {
    sub_23776CE50((uint64_t)v13);
  }
  if (qword_268925420 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_23776D418();
  __swift_project_value_buffer(v3, (uint64_t)qword_268926650);
  sub_23776CEB0(a1, (uint64_t)v13);
  uint64_t v4 = sub_23776D3F8();
  os_log_type_t v5 = sub_23776D778();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    sub_23776CEB0((uint64_t)v13, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268925C18);
    uint64_t v8 = sub_23776D638();
    v11[0] = (id)sub_237750E08(v8, v9, &v12);
    sub_23776D808();
    swift_bridgeObjectRelease();
    sub_23776CE50((uint64_t)v13);
    _os_log_impl(&dword_23774D000, v4, v5, "Unexpected hostConfiguration value: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237E1FC70](v7, -1, -1);
    MEMORY[0x237E1FC70](v6, -1, -1);
  }
  else
  {
    sub_23776CE50((uint64_t)v13);
  }

  return sub_23776CE50(a1);
}

uint64_t sub_23776CB58(uint64_t a1)
{
  objc_msgSend(v1, sel_setDelegate_, a1);

  return swift_unknownObjectRelease();
}

id sub_23776CBA4()
{
  return sub_23776CBBC();
}

id sub_23776CBBC()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  v5[0] = 0;
  id v1 = objc_msgSend(v0, sel_makeXPCConnectionWithError_, v5);
  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_23776CFE8();

    swift_willThrow();
  }
  return v1;
}

id sub_23776CC74@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  *a1 = result;
  return result;
}

void sub_23776CCB0(id *a1)
{
  id v2 = *a1;
  objc_msgSend(*v1, sel_setExtensionIdentity_);
}

id sub_23776CCF8(char a1)
{
  return objc_msgSend(*v1, sel_setBeginHostingImmediately_, a1 & 1);
}

uint64_t sub_23776CD10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_23776CD24(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_23776CD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_23776CD4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_23776CD60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_23776CD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_23776CD88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_23776CD9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_23776CDC4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_23776CDD8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_23776CDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t sub_23776CE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_23776CE14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_23776CE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t sub_23776CE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_23776CE50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925C18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23776CEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268925C18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23776CF18()
{
  unint64_t result = qword_268925C28;
  if (!qword_268925C28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268925C28);
  }
  return result;
}

uint64_t sub_23776CF58()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23776CF68()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23776CF78()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23776CF88()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_23776CF98()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_23776CFA8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_23776CFB8()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t sub_23776CFC8()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_23776CFD8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23776CFE8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23776CFF8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23776D008()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23776D018()
{
  return MEMORY[0x270EEB958]();
}

uint64_t sub_23776D028()
{
  return MEMORY[0x270EEB970]();
}

uint64_t sub_23776D038()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_23776D048()
{
  return MEMORY[0x270EEB980]();
}

uint64_t sub_23776D058()
{
  return MEMORY[0x270EEB988]();
}

uint64_t sub_23776D068()
{
  return MEMORY[0x270EEB448]();
}

uint64_t sub_23776D078()
{
  return MEMORY[0x270EEB460]();
}

uint64_t sub_23776D088()
{
  return MEMORY[0x270EEB470]();
}

uint64_t sub_23776D098()
{
  return MEMORY[0x270EEB478]();
}

uint64_t sub_23776D0A8()
{
  return MEMORY[0x270EEB480]();
}

uint64_t sub_23776D0B8()
{
  return MEMORY[0x270EEB4D0]();
}

uint64_t sub_23776D0C8()
{
  return MEMORY[0x270EEB4D8]();
}

uint64_t sub_23776D0D8()
{
  return MEMORY[0x270EEB4E0]();
}

uint64_t sub_23776D0E8()
{
  return MEMORY[0x270EEB4E8]();
}

uint64_t sub_23776D0F8()
{
  return MEMORY[0x270EEB4F0]();
}

uint64_t sub_23776D108()
{
  return MEMORY[0x270EEB4F8]();
}

uint64_t sub_23776D118()
{
  return MEMORY[0x270EEB500]();
}

uint64_t sub_23776D128()
{
  return MEMORY[0x270EEB508]();
}

uint64_t sub_23776D138()
{
  return MEMORY[0x270EEB510]();
}

uint64_t sub_23776D148()
{
  return MEMORY[0x270EEB518]();
}

uint64_t sub_23776D158()
{
  return MEMORY[0x270EEB520]();
}

uint64_t sub_23776D168()
{
  return MEMORY[0x270EEB528]();
}

uint64_t sub_23776D178()
{
  return MEMORY[0x270EEB530]();
}

uint64_t sub_23776D188()
{
  return MEMORY[0x270EEB538]();
}

uint64_t sub_23776D198()
{
  return MEMORY[0x270EEB540]();
}

uint64_t sub_23776D1A8()
{
  return MEMORY[0x270EEB548]();
}

uint64_t sub_23776D1B8()
{
  return MEMORY[0x270EEB560]();
}

uint64_t sub_23776D1C8()
{
  return MEMORY[0x270EEB568]();
}

uint64_t sub_23776D1D8()
{
  return MEMORY[0x270EEB570]();
}

uint64_t sub_23776D1E8()
{
  return MEMORY[0x270EEB578]();
}

uint64_t sub_23776D1F8()
{
  return MEMORY[0x270EEB580]();
}

uint64_t sub_23776D208()
{
  return MEMORY[0x270EEB588]();
}

uint64_t sub_23776D218()
{
  return MEMORY[0x270EEB590]();
}

uint64_t sub_23776D228()
{
  return MEMORY[0x270EEB598]();
}

uint64_t sub_23776D238()
{
  return MEMORY[0x270EEB5A0]();
}

uint64_t sub_23776D248()
{
  return MEMORY[0x270EEB5A8]();
}

uint64_t sub_23776D258()
{
  return MEMORY[0x270EEB5B0]();
}

uint64_t sub_23776D268()
{
  return MEMORY[0x270EEB5B8]();
}

uint64_t sub_23776D278()
{
  return MEMORY[0x270EEB5C0]();
}

uint64_t sub_23776D288()
{
  return MEMORY[0x270EEB5C8]();
}

uint64_t sub_23776D298()
{
  return MEMORY[0x270EEB5D0]();
}

uint64_t sub_23776D2A8()
{
  return MEMORY[0x270EEB5D8]();
}

uint64_t sub_23776D2B8()
{
  return MEMORY[0x270EEB5E0]();
}

uint64_t sub_23776D2C8()
{
  return MEMORY[0x270EEB5E8]();
}

uint64_t sub_23776D2D8()
{
  return MEMORY[0x270EEB5F0]();
}

uint64_t sub_23776D2E8()
{
  return MEMORY[0x270EEB5F8]();
}

uint64_t sub_23776D2F8()
{
  return MEMORY[0x270EEB600]();
}

uint64_t sub_23776D308()
{
  return MEMORY[0x270EEB608]();
}

uint64_t sub_23776D318()
{
  return MEMORY[0x270EEB610]();
}

uint64_t sub_23776D338()
{
  return MEMORY[0x270EEB638]();
}

uint64_t sub_23776D348()
{
  return MEMORY[0x270EEB648]();
}

uint64_t sub_23776D358()
{
  return MEMORY[0x270EEB650]();
}

uint64_t sub_23776D368()
{
  return MEMORY[0x270EF5818]();
}

uint64_t sub_23776D378()
{
  return MEMORY[0x270EF5820]();
}

uint64_t sub_23776D388()
{
  return MEMORY[0x270EF5830]();
}

uint64_t sub_23776D398()
{
  return MEMORY[0x270EF5838]();
}

uint64_t sub_23776D3A8()
{
  return MEMORY[0x270EF5848]();
}

uint64_t sub_23776D3B8()
{
  return MEMORY[0x270EF5858]();
}

uint64_t sub_23776D3C8()
{
  return MEMORY[0x270EF5888]();
}

uint64_t sub_23776D3D8()
{
  return MEMORY[0x270EF5890]();
}

uint64_t sub_23776D3E8()
{
  return MEMORY[0x270EF5898]();
}

uint64_t sub_23776D3F8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23776D408()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23776D418()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23776D428()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_23776D438()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_23776D448()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_23776D458()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_23776D468()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_23776D478()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_23776D488()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_23776D498()
{
  return MEMORY[0x270EE3060]();
}

uint64_t sub_23776D4A8()
{
  return MEMORY[0x270EE3068]();
}

uint64_t sub_23776D4B8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_23776D4C8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_23776D4D8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_23776D4F8()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_23776D508()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_23776D518()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_23776D538()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_23776D548()
{
  return MEMORY[0x270F029A0]();
}

uint64_t sub_23776D558()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23776D568()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23776D578()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23776D588()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23776D598()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23776D5A8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23776D5B8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_23776D5C8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23776D5D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23776D5E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23776D5F8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23776D608()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23776D618()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23776D628()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23776D638()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23776D648()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23776D658()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23776D668()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23776D678()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23776D688()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_23776D698()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_23776D6A8()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_23776D6B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23776D6C8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23776D6E8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23776D6F8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23776D708()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_23776D718()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23776D728()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23776D738()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_23776D748()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_23776D758()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_23776D768()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23776D778()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23776D788()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23776D798()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_23776D7A8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_23776D7B8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23776D7C8()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_23776D7D8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23776D7E8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_23776D7F8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23776D808()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23776D818()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23776D828()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23776D838()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23776D848()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23776D858()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23776D868()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23776D878()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23776D888()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23776D898()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23776D8A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23776D8B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23776D8C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23776D8D8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23776D8E8()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_23776D8F8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23776D908()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23776D918()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_23776D928()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23776D938()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_23776D948()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_23776D958()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_23776D968()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23776D978()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_23776D988()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23776D998()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23776D9B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23776D9C8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23776D9D8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_23776D9E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23776D9F8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23776DA08()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23776DA18()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23776DA28()
{
  return MEMORY[0x270F9FD98]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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