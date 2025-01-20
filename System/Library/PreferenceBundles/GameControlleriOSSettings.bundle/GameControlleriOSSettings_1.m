void *sub_A0F64(uint64_t a1, uint64_t a2)
{
  return sub_A0F88(a1, a2, (SEL *)&selRef_games, (unint64_t *)&qword_122828, (uint64_t)&classRef_GCSGame, (SEL *)&selRef_bundleIdentifier);
}

void *sub_A0F88(uint64_t a1, uint64_t a2, SEL *a3, unint64_t *a4, uint64_t a5, SEL *a6)
{
  id v11 = [v6 *a3];
  sub_B3A64(0, a4);
  unint64_t v12 = sub_E7210();

  swift_bridgeObjectRetain();
  v13 = sub_AF6CC(v12, a1, a2, a6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

id sub_A1068(void *a1, uint64_t a2, uint64_t a3, SEL *a4, unint64_t *a5, uint64_t a6, SEL *a7)
{
  uint64_t v11 = sub_E7110();
  uint64_t v13 = v12;
  id v14 = a1;
  id v15 = [v14 *a4];
  sub_B3A64(0, a5);
  unint64_t v16 = sub_E7210();

  swift_bridgeObjectRetain();
  v17 = sub_AF6CC(v16, v11, v13, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();

  return v17;
}

void *sub_A1158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [v3 games];
  sub_B3A64(0, (unint64_t *)&qword_122828);
  unint64_t v8 = sub_E7210();

  swift_bridgeObjectRetain();
  v9 = sub_AF6CC(v8, a1, a2, (SEL *)&selRef_bundleIdentifier);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9 && ([v9 profileExistsFor:a3 with:v3] & 1) == 0)
  {

    return 0;
  }
  return v9;
}

uint64_t sub_A137C()
{
  return 1;
}

uint64_t sub_A1384(void *a1, void *a2, int a3)
{
  return sub_A3DDC(a1, a2, a3, (uint64_t)&unk_1163E8, (uint64_t)sub_B1DE4, (uint64_t)&unk_116400);
}

uint64_t sub_A1438()
{
  return 1;
}

uint64_t sub_A1440(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116440, (uint64_t)sub_B2024, (uint64_t)&unk_116458);
}

uint64_t sub_A14DC()
{
  return 1;
}

uint64_t sub_A14E4(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116490, (uint64_t)sub_B2180, (uint64_t)&unk_1164A8);
}

uint64_t sub_A150C(void *a1, void *a2, int a3)
{
  int v40 = a3;
  v39[0] = sub_E5FE0();
  uint64_t v5 = *(void *)(v39[0] - 8);
  __chkstk_darwin(v39[0]);
  id v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 games];
  v39[1] = sub_B3A64(0, (unint64_t *)&qword_122828);
  unint64_t v9 = sub_E7210();

  unint64_t v43 = v9;
  uint64_t v10 = sub_E7110();
  uint64_t v12 = v11;
  swift_bridgeObjectRetain();
  id v13 = [a1 tombstones];
  sub_10C7C(&qword_124F88);
  uint64_t v14 = sub_E7050();

  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_21CB8(v10, v12), (v16 & 1) != 0))
  {
    v17 = *(void **)(*(void *)(v14 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
  }
  else
  {
    v17 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v42 = (uint64_t)v17;
  sub_A19A8((uint64_t)a2, v9, (unint64_t *)&qword_122828);
  unint64_t v19 = v18;
  char v21 = v20;
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v36 = swift_bridgeObjectRetain();
    sub_A9114(v36, (uint64_t)j_nullsub_59_0, 0);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }

  id v22 = [a2 bundleIdentifier];
  sub_E7110();

  sub_E5FD0();
  id v23 = objc_allocWithZone((Class)GCSTombstone);
  NSString v24 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class isa = sub_E5FA0().super.isa;
  id v26 = [v23 initWithIdentifier:v24 creationDate:isa recordType:3];

  (*(void (**)(char *, void))(v5 + 8))(v7, v39[0]);
  id v27 = v26;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v42 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  uint64_t v28 = sub_E7110();
  uint64_t v30 = v29;
  uint64_t v31 = v42;
  id v32 = [a1 tombstones];
  uint64_t v33 = sub_E7050();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v41 = v33;
  sub_AE9EC(v31, v28, v30, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class v35 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [a1 setTombstones:v35];

  if (v40) {
    goto LABEL_11;
  }
LABEL_12:
  Class v37 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [a1 setGames:v37];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *a1)))();
}

void sub_A19A8(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  if (v5)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v6 = (id)sub_E74E0();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          return;
        }
        id v6 = *(id *)(a2 + 32);
      }
      id v7 = v6;
      sub_B3A64(0, a3);
      char v8 = sub_E7390();

      if ((v8 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          a3 = (unint64_t *)(i + 1);
          if (__OFADD__(i, 1)) {
            break;
          }
          if (a3 == (unint64_t *)v5) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v10 = (id)sub_E74E0();
          }
          else
          {
            if (((unint64_t)a3 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if ((unint64_t)a3 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
              goto LABEL_19;
            }
            id v10 = *(id *)(a2 + 32 + 8 * (void)a3);
          }
          uint64_t v11 = v10;
          char v12 = sub_E7390();

          if (v12) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v5 = sub_E7570();
        swift_bridgeObjectRelease();
        if (v5) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_A1B44(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = sub_AEFAC(v3);
    unint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      uint64_t v9 = v5 + 8 * a1;
      uint64_t v10 = *(void *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(void *)(v5 + 16) = v7;
      sub_E7230();
      return v10;
    }
  }
  uint64_t result = sub_E75B0();
  __break(1u);
  return result;
}

uint64_t sub_A1C98()
{
  return 1;
}

uint64_t sub_A1CA0(void *a1, void *a2, int a3)
{
  return sub_A3DDC(a1, a2, a3, (uint64_t)&unk_1164E0, (uint64_t)sub_B2190, (uint64_t)&unk_1164F8);
}

uint64_t sub_A1D54()
{
  return 1;
}

uint64_t sub_A1D5C(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116530, (uint64_t)sub_B2370, (uint64_t)&unk_116548);
}

uint64_t sub_A1DF4(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116D28, (uint64_t)sub_B3B48, (uint64_t)&unk_116D40);
}

uint64_t sub_A1E1C(void *a1, void *a2, int a3)
{
  int v40 = a3;
  v39[0] = sub_E5FE0();
  uint64_t v5 = *(void *)(v39[0] - 8);
  __chkstk_darwin(v39[0]);
  unint64_t v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 copilotFusedControllers];
  v39[1] = sub_B3A64(0, (unint64_t *)&unk_124E40);
  unint64_t v9 = sub_E7210();

  unint64_t v43 = v9;
  uint64_t v10 = sub_E7110();
  uint64_t v12 = v11;
  swift_bridgeObjectRetain();
  id v13 = [a1 tombstones];
  sub_10C7C(&qword_124F88);
  uint64_t v14 = sub_E7050();

  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_21CB8(v10, v12), (v16 & 1) != 0))
  {
    v17 = *(void **)(*(void *)(v14 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
  }
  else
  {
    v17 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v42 = (uint64_t)v17;
  sub_A19A8((uint64_t)a2, v9, (unint64_t *)&unk_124E40);
  unint64_t v19 = v18;
  char v21 = v20;
  swift_bridgeObjectRelease();
  if (v21)
  {
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v36 = swift_bridgeObjectRetain();
    sub_A893C(v36, (uint64_t)j_nullsub_59_3, 0);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }

  id v22 = [a2 fusedControllerIdentifier];
  sub_E7110();

  sub_E5FD0();
  id v23 = objc_allocWithZone((Class)GCSTombstone);
  NSString v24 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class isa = sub_E5FA0().super.isa;
  id v26 = [v23 initWithIdentifier:v24 creationDate:isa recordType:4];

  (*(void (**)(char *, void))(v5 + 8))(v7, v39[0]);
  id v27 = v26;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v42 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  uint64_t v28 = sub_E7110();
  uint64_t v30 = v29;
  uint64_t v31 = v42;
  id v32 = [a1 tombstones];
  uint64_t v33 = sub_E7050();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v41 = v33;
  sub_AE9EC(v31, v28, v30, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class v35 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [a1 setTombstones:v35];

  if (v40) {
    goto LABEL_11;
  }
LABEL_12:
  Class v37 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [a1 setCopilotFusedControllers:v37];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *a1)))();
}

uint64_t sub_A22B8()
{
  return 1;
}

uint64_t sub_A22C0(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116580, (uint64_t)sub_B2508, (uint64_t)&unk_116598);
}

uint64_t sub_A2358()
{
  return 1;
}

uint64_t sub_A2360(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_1165D0, (uint64_t)sub_B26A0, (uint64_t)&unk_1165E8);
}

uint64_t sub_A2388(void *a1, void *a2, int a3)
{
  int v84 = a3;
  uint64_t v80 = sub_E5FE0();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  v78 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_E6050();
  uint64_t v75 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  v74 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_E60E0();
  id v8 = *(uint8_t **)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v82 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v90 = (char *)&v73 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v73 - v13;
  id v15 = [a1 profiles];
  uint64_t v89 = sub_B3A64(0, (unint64_t *)&qword_124E50);
  uint64_t v16 = sub_E7210();

  unint64_t v94 = v16;
  uint64_t v17 = sub_E7110();
  uint64_t v19 = v18;
  v85 = a1;
  id v20 = [a1 tombstones];
  uint64_t v77 = sub_10C7C(&qword_124F88);
  uint64_t v21 = sub_E7050();

  if (*(void *)(v21 + 16) && (unint64_t v22 = sub_21CB8(v17, v19), (v23 & 1) != 0))
  {
    NSString v24 = *(void **)(*(void *)(v21 + 56) + 8 * v22);
    swift_bridgeObjectRetain();
  }
  else
  {
    NSString v24 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v93 = (uint64_t)v24;
  uint64_t v25 = sub_33D64();
  id v26 = (void (*)(char *, uint64_t, uint64_t))*((void *)v8 + 2);
  v87 = v8 + 16;
  uint64_t v88 = v25;
  v86 = v26;
  ((void (*)(char *))v26)(v14);
  os_log_type_t v27 = sub_E72E0();
  uint64_t v28 = a2;
  uint64_t v29 = sub_E60C0();
  BOOL v30 = os_log_type_enabled(v29, v27);
  uint64_t v83 = v7;
  v81 = v28;
  if (v30)
  {
    v73 = v8;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    id v32 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138412290;
    v92 = v28;
    uint64_t v33 = v14;
    v34 = v28;
    id v8 = v73;
    sub_E73D0();
    *id v32 = v28;

    uint64_t v14 = v33;
    _os_log_impl(&dword_0, v29, v27, "Remove %@", v31, 0xCu);
    sub_10C7C(&qword_125050);
    swift_arrayDestroy();
    uint64_t v7 = v83;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v29 = v28;
  }

  Class v35 = (void (*)(char *, uint64_t))*((void *)v8 + 1);
  v35(v14, v7);
  v86(v90, v88, v7);
  os_log_type_t v36 = sub_E72E0();
  Class v37 = sub_E60C0();
  if (os_log_type_enabled(v37, v36))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v92 = swift_slowAlloc();
    *(_DWORD *)v38 = 136315138;
    v73 = v38 + 4;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_E7220();
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    unint64_t v91 = sub_23A0C(v39, v41, (uint64_t *)&v92);
    uint64_t v7 = v83;
    sub_E73D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v37, v36, "New profiles = %s", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v35(v90, v7);
  uint64_t v42 = v85;
  unint64_t v43 = v81;
  swift_beginAccess();
  unint64_t v44 = v94;
  swift_bridgeObjectRetain();
  sub_A19A8((uint64_t)v43, v44, (unint64_t *)&qword_124E50);
  unint64_t v46 = v45;
  char v48 = v47;
  swift_bridgeObjectRelease();
  if (v48)
  {
    swift_bridgeObjectRelease();
    if ((v84 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v70 = swift_bridgeObjectRetain();
    sub_A89D4(v70, (uint64_t)j_nullsub_59_5, 0);
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v86(v82, v88, v7);
  os_log_type_t v49 = sub_E72F0();
  v50 = sub_E60C0();
  os_log_type_t v51 = v49;
  if (os_log_type_enabled(v50, v49))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v52 = 134217984;
    unint64_t v91 = v46;
    sub_E73D0();
    _os_log_impl(&dword_0, v50, v51, "Removing at %ld", v52, 0xCu);
    swift_slowDealloc();
  }

  v35(v82, v7);
  swift_beginAccess();
  v53 = (void *)sub_A1B44(v46);
  swift_endAccess();

  id v54 = [v43 uuid];
  v55 = v74;
  sub_E6030();

  sub_E5FF0();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v55, v76);
  v56 = v78;
  sub_E5FD0();
  id v57 = objc_allocWithZone((Class)GCSTombstone);
  NSString v58 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class isa = sub_E5FA0().super.isa;
  id v60 = [v57 initWithIdentifier:v58 creationDate:isa recordType:2];

  (*(void (**)(char *, uint64_t))(v79 + 8))(v56, v80);
  id v61 = v60;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v93 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  uint64_t v62 = sub_E7110();
  uint64_t v64 = v63;
  uint64_t v65 = v93;
  id v66 = [v42 tombstones];
  uint64_t v67 = sub_E7050();

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v91 = v67;
  sub_AE9EC(v65, v62, v64, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Class v69 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [v42 setTombstones:v69];

  if (v84) {
    goto LABEL_18;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  Class v71 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v42 setProfiles:v71];

  (*(void (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v42)))();
  return swift_bridgeObjectRelease();
}

void *sub_A2E60(uint64_t a1, uint64_t a2)
{
  return sub_A0F88(a1, a2, (SEL *)&selRef_mouseProfiles, &qword_124E90, (uint64_t)&classRef_GCSMouseProfile, (SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_A2EA8()
{
  return 1;
}

uint64_t sub_A2EB0(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116620, (uint64_t)sub_B26EC, (uint64_t)&unk_116638);
}

uint64_t sub_A2F48()
{
  return 1;
}

uint64_t sub_A2F50(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116670, (uint64_t)sub_B2830, (uint64_t)&unk_116688);
}

void sub_A2F78(void *a1, void *a2, char a3)
{
  uint64_t v6 = sub_E60E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [a1 mouseProfiles];
  uint64_t v11 = sub_B3A64(0, &qword_124E90);
  uint64_t v12 = sub_E7210();

  uint64_t v36 = v12;
  uint64_t v13 = sub_33D64();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  os_log_type_t v14 = sub_E72E0();
  id v15 = a2;
  v34 = v9;
  uint64_t v16 = sub_E60C0();
  if (os_log_type_enabled(v16, v14))
  {
    uint64_t v31 = v6;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v33 = a1;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v32 = v11;
    BOOL v30 = (void *)v19;
    *(_DWORD *)uint64_t v18 = 138412290;
    Class v35 = v15;
    uint64_t v20 = v7;
    uint64_t v21 = v15;
    uint64_t v6 = v31;
    sub_E73D0();
    *BOOL v30 = v15;

    uint64_t v7 = v20;
    _os_log_impl(&dword_0, v16, v14, "Remove %@", v18, 0xCu);
    sub_10C7C(&qword_125050);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v33;
    swift_slowDealloc();
  }
  else
  {

    uint64_t v16 = v15;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v34, v6);
  id v22 = [a1 mouseProfiles];
  unint64_t v23 = sub_E7210();

  sub_A19A8((uint64_t)v15, v23, &qword_124E90);
  unint64_t v25 = v24;
  LOBYTE(v22) = v26;
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0) {

  }
  if (a3)
  {
    uint64_t v27 = swift_bridgeObjectRetain();
    sub_A89FC(v27);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [a1 setMouseProfiles:isa];
}

uint64_t sub_A3334()
{
  return 1;
}

uint64_t sub_A333C(void *a1, void *a2, int a3)
{
  return sub_A3DDC(a1, a2, a3, (uint64_t)&unk_1166C0, (uint64_t)sub_B2840, (uint64_t)&unk_1166D8);
}

uint64_t sub_A33F0()
{
  return 1;
}

uint64_t sub_A33F8(void *a1, char a2)
{
  return sub_A3420(a1, a2, (uint64_t)&unk_116710, (uint64_t)sub_B29D8, (uint64_t)&unk_116728);
}

uint64_t sub_A3420(void *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v8 = sub_E6FD0();
  uint64_t v23 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_E7000();
  uint64_t v11 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  os_log_type_t v14 = (void *)sub_E7340();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v5;
  *(void *)(v15 + 24) = a1;
  *(unsigned char *)(v15 + 32) = a2;
  aBlock[4] = v20;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2DC60;
  aBlock[3] = v21;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v5;
  id v18 = a1;
  swift_release();
  sub_E6FF0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v22);
}

void sub_A3708(void *a1, void *a2, char a3)
{
  uint64_t v6 = sub_E6050();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v44 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10C7C(&qword_123560);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  os_log_type_t v14 = (char *)&v43 - v13;
  id v15 = [a1 allControllers];
  sub_B3A64(0, (unint64_t *)&qword_124E30);
  uint64_t v16 = sub_E7210();

  uint64_t v48 = v16;
  id v17 = a2;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v48 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v48 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  if (a3)
  {
    uint64_t v18 = swift_bridgeObjectRetain();
    sub_A89AC(v18, (uint64_t)j_nullsub_59_6, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [a1 setAllControllers:isa];

  uint64_t v20 = (void *)(*(uint64_t (**)(void))((char *)&stru_1F8.offset + (swift_isaMask & *a1)))();
  id v21 = [v20 controllerToProfileMappings];
  uint64_t v22 = sub_E7050();

  unint64_t v47 = v22;
  id v23 = [v17 persistentIdentifier];
  uint64_t v24 = sub_E7110();
  uint64_t v26 = v25;

  uint64_t v27 = (void *)(*(uint64_t (**)(void))((char *)&stru_1F8.reloff + (swift_isaMask & *a1)))();
  id v28 = [v27 uuid];

  uint64_t v29 = v6;
  sub_E6030();

  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
  int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6);
  uint64_t v45 = v6;
  if (v30 == 1)
  {
    sub_B3AA0((uint64_t)v14, &qword_123560);
    sub_75C9C(v24, v26, (uint64_t)v12);
    swift_bridgeObjectRelease();
    sub_B3AA0((uint64_t)v12, &qword_123560);
  }
  else
  {
    uint64_t v31 = (uint64_t)v44;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v44, v14, v29);
    unint64_t v32 = v47;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v46 = v32;
    unint64_t v47 = 0x8000000000000000;
    sub_98DF4(v31, v24, v26, isUniquelyReferenced_nonNull_native);
    unint64_t v47 = v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v34 = [v20 bundleIdentifier];
  sub_E7110();

  id v35 = [v20 title];
  sub_E7110();

  sub_456F8((uint64_t)_swiftEmptyArrayStorage);
  id v36 = objc_allocWithZone((Class)GCSGame);
  NSString v37 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v38 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class v39 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for GCSCompatibilityMode();
  Class v40 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  id v41 = [v36 initWithBundleIdentifier:v37 title:v38 controllerToProfileMappings:v39 controllerToCompatibilityModeMappings:v40];

  uint64_t v42 = (*(uint64_t (**)(void *, id, uint64_t))&stru_298.segname[(swift_isaMask & *a1) - 8])(v20, v41, 1);
  (*(void (**)(uint64_t))((char *)&stru_248.flags + (swift_isaMask & *a1)))(v42);
}

uint64_t sub_A3DAC()
{
  return 1;
}

uint64_t sub_A3DB4(void *a1, void *a2, int a3)
{
  return sub_A3DDC(a1, a2, a3, (uint64_t)&unk_116760, (uint64_t)sub_B2A30, (uint64_t)&unk_116778);
}

uint64_t sub_A3DDC(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  int v23 = a3;
  uint64_t v9 = sub_E6FD0();
  uint64_t v27 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v26 = sub_E7000();
  uint64_t v12 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  os_log_type_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  id v15 = (void *)sub_E7340();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v6;
  *(void *)(v16 + 24) = a1;
  *(void *)(v16 + 32) = a2;
  *(unsigned char *)(v16 + 40) = v23;
  aBlock[4] = v24;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2DC60;
  aBlock[3] = v25;
  id v17 = _Block_copy(aBlock);
  id v18 = v6;
  id v19 = a1;
  id v20 = a2;
  swift_release();
  sub_E6FF0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v17);

  (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v11, v9);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v26);
}

uint64_t sub_A4160()
{
  return 1;
}

uint64_t sub_A4168(void *a1, char a2)
{
  unint64_t v3 = v2;
  sub_10C7C(&qword_124D90);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_EF4F0;
  *(void *)(v6 + 32) = a1;
  uint64_t v17 = v6;
  sub_E7230();
  uint64_t v7 = v17;
  uint64_t v8 = (void *)(*(uint64_t (**)(void *))&stru_248.segname[(swift_isaMask & *v2) + 16])(a1);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v8 fusedControllerIdentifier];
    uint64_t v11 = sub_E7110();
    uint64_t v13 = v12;

    os_log_type_t v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))&stru_1F8.sectname[swift_isaMask & *v3])(v11, v13);
    swift_bridgeObjectRelease();
    if (v14)
    {
      id v15 = v14;
      sub_E71F0();
      if (*(void *)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v17 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_E7240();
      sub_E7260();
      sub_E7230();

      uint64_t v7 = v17;
    }
    sub_A1DF4(v9, a2 & 1);
  }
  (*(void (**)(uint64_t, uint64_t))((char *)&stru_2E8.offset + (swift_isaMask & *v3)))(v7, 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_A4390()
{
  return 1;
}

uint64_t sub_A4408(uint64_t a1, char a2)
{
  uint64_t v5 = sub_E6FD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_E7000();
  uint64_t v9 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  uint64_t v12 = (void *)sub_E7340();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v2;
  *(void *)(v13 + 24) = a1;
  *(unsigned char *)(v13 + 32) = a2;
  aBlock[4] = sub_B2C50;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2DC60;
  aBlock[3] = &unk_1167C8;
  os_log_type_t v14 = _Block_copy(aBlock);
  id v15 = v2;
  swift_bridgeObjectRetain();
  swift_release();
  sub_E6FF0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_A46FC(void *a1, unint64_t a2, int a3)
{
  int v127 = a3;
  unint64_t v133 = a2;
  unint64_t v4 = sub_E60E0();
  *(void *)&long long v123 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v126 = (char *)&v113 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10C7C(&qword_123560);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v124 = (uint64_t)&v113 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (uint64_t)&v113 - v10;
  __chkstk_darwin(v9);
  uint64_t v125 = (uint64_t)&v113 - v12;
  unint64_t v131 = sub_E5FE0();
  uint64_t v13 = *(NSObject **)(v131 - 8);
  __chkstk_darwin(v131);
  v130 = (void (**)(unint64_t, uint64_t, NSObject *))((char *)&v113
                                                                     - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v15 = [a1 allControllers];
  id v139 = (id)sub_B3A64(0, (unint64_t *)&qword_124E30);
  uint64_t v16 = sub_E7210();

  unint64_t v143 = v16;
  uint64_t v17 = sub_E7110();
  uint64_t v19 = v18;
  id v114 = a1;
  id v20 = [a1 tombstones];
  v122 = (char *)sub_10C7C(&qword_124F88);
  uint64_t v21 = sub_E7050();

  if (*(void *)(v21 + 16))
  {
    unint64_t v22 = sub_21CB8(v17, v19);
    if (v23)
    {
      uint64_t v24 = *(void **)(*(void *)(v21 + 56) + 8 * v22);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v24 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v24 = _swiftEmptyArrayStorage;
  }
  unint64_t v25 = (unint64_t)v126;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v142 = (uint64_t)v24;
  if (v133 >> 62) {
    goto LABEL_95;
  }
  uint64_t v26 = *(void *)((char *)&dword_10 + (v133 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  while (1)
  {
    v137 = v4;
    uint64_t v121 = v11;
    uint64_t v132 = v26;
    if (v26)
    {
      int v27 = 0;
      unint64_t v28 = 0;
      v135 = (uint64_t *)(v133 & 0xFFFFFFFFFFFFFF8);
      unint64_t v136 = v133 & 0xC000000000000001;
      v134 = (id *)(v133 + 32);
      os_log_t v128 = v13 + 1;
      uint64_t v13 = v4;
      while (1)
      {
        LODWORD(v129) = v27;
        while (1)
        {
          if (v136)
          {
            uint64_t v29 = v13;
            int v30 = sub_E74E0();
          }
          else
          {
            if (v28 >= v135[2]) {
              goto LABEL_93;
            }
            uint64_t v29 = v13;
            int v30 = v134[v28];
          }
          uint64_t v13 = v30;
          BOOL v31 = __OFADD__(v28, 1);
          uint64_t v32 = v28 + 1;
          if (v31) {
            goto LABEL_89;
          }
          uint64_t v138 = v32;
          uint64_t v11 = v143;
          if (v143 >> 62) {
            break;
          }
          unint64_t v25 = *(void *)((char *)&dword_10 + (v143 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
          if (v25) {
            goto LABEL_19;
          }
LABEL_11:

          swift_bridgeObjectRelease();
          uint64_t v26 = v132;
          unint64_t v28 = v138;
          unint64_t v25 = (unint64_t)v126;
          uint64_t v11 = v121;
          uint64_t v13 = v29;
          if (v138 == v132)
          {
            unint64_t v51 = v133;
            swift_bridgeObjectRelease();
            uint64_t v52 = v142;
            if ((v129 & 1) == 0) {
              goto LABEL_50;
            }
            goto LABEL_51;
          }
        }
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_E7570();
        if (!v25) {
          goto LABEL_11;
        }
LABEL_19:
        unint64_t v4 = v11 & 0xC000000000000001;
        if ((v11 & 0xC000000000000001) != 0)
        {
          id v33 = (id)sub_E74E0();
        }
        else
        {
          if (!*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_91;
          }
          id v33 = *(id *)(v11 + 32);
        }
        id v34 = v33;
        char v35 = sub_E7390();

        if (v35)
        {
          unint64_t v43 = 0;
          goto LABEL_43;
        }
        if (v25 == 1) {
          goto LABEL_11;
        }
        if (v4)
        {
          id v36 = (id)sub_E74E0();
        }
        else
        {
          if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)) < 2uLL) {
            goto LABEL_94;
          }
          id v36 = *(id *)(v11 + 40);
        }
        NSString v37 = v36;
        char v38 = sub_E7390();

        if ((v38 & 1) == 0)
        {
          uint64_t v39 = 1;
          while (1)
          {
            unint64_t v43 = v39 + 1;
            if (__OFADD__(v39, 1)) {
              break;
            }
            uint64_t v29 = v137;
            if (v43 == v25) {
              goto LABEL_11;
            }
            if (v4)
            {
              id v40 = (id)sub_E74E0();
            }
            else
            {
              if ((v43 & 0x8000000000000000) != 0) {
                goto LABEL_86;
              }
              if (v43 >= *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8))) {
                goto LABEL_87;
              }
              id v40 = *(id *)(v11 + 32 + 8 * v43);
            }
            id v41 = v40;
            char v42 = sub_E7390();

            ++v39;
            if (v42) {
              goto LABEL_43;
            }
          }
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
        unint64_t v43 = 1;
LABEL_43:
        swift_bridgeObjectRelease();

        id v44 = [v13 persistentIdentifier];
        sub_E7110();

        uint64_t v45 = v130;
        sub_E5FD0();
        id v46 = objc_allocWithZone((Class)GCSTombstone);
        NSString v47 = sub_E70D0();
        swift_bridgeObjectRelease();
        Class isa = sub_E5FA0().super.isa;
        id v49 = [v46 initWithIdentifier:v47 creationDate:isa recordType:1];

        ((void (*)(void (**)(unint64_t, uint64_t, NSObject *), unint64_t))v128->isa)(v45, v131);
        id v50 = v49;
        sub_E71F0();
        unint64_t v25 = *(void *)((char *)&dword_10 + (v142 & 0xFFFFFFFFFFFFFF8));
        if (v25 >= *(void *)((char *)&dword_18 + (v142 & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_E7240();
        }
        sub_E7260();
        sub_E7230();

        int v27 = 1;
        uint64_t v26 = v132;
        uint64_t v13 = v137;
        unint64_t v28 = v138;
        uint64_t v11 = v121;
        if (v138 == v132)
        {
          swift_bridgeObjectRelease();
          uint64_t v52 = v142;
LABEL_51:
          uint64_t v53 = sub_E7110();
          uint64_t v13 = v54;
          id v55 = v114;
          id v56 = [v114 tombstones];
          uint64_t v57 = sub_E7050();

          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v141 = v57;
          sub_AE9EC(v52, v53, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
          unint64_t v51 = v133;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v25 = (unint64_t)v126;
          Class v59 = sub_E7040().super.isa;
          swift_bridgeObjectRelease();
          [v55 setTombstones:v59];

          goto LABEL_52;
        }
      }
    }
    unint64_t v51 = v133;
    swift_bridgeObjectRelease();
LABEL_50:
    swift_bridgeObjectRelease();
LABEL_52:
    uint64_t v60 = v125;
    if (v127)
    {
      uint64_t v61 = swift_bridgeObjectRetain();
      sub_A89AC(v61, (uint64_t)j_nullsub_59_8, 0);
      swift_bridgeObjectRelease();
    }
    Class v62 = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    id v63 = v114;
    [v114 setAllControllers:v62];

    uint64_t v141 = (uint64_t)_swiftEmptyArrayStorage;
    id v64 = [v63 games];
    uint64_t v113 = sub_B3A64(0, (unint64_t *)&qword_122828);
    unint64_t v65 = sub_E7210();

    if (v65 >> 62) {
      break;
    }
    uint64_t v67 = *(void *)((char *)&dword_10 + (v65 & 0xFFFFFFFFFFFFFF8));
    if (!v67) {
      goto LABEL_97;
    }
LABEL_56:
    unint64_t v4 = 0;
    unint64_t v119 = v65 & 0xC000000000000001;
    uint64_t v116 = v65 & 0xFFFFFFFFFFFFFF8;
    unint64_t v115 = v65 + 32;
    unint64_t v131 = v51 & 0xC000000000000001;
    v129 = (void (**)(char *, NSObject *))(v123 + 8);
    v130 = (void (**)(unint64_t, uint64_t, NSObject *))(v123 + 16);
    *(void *)&long long v66 = 136315394;
    long long v123 = v66;
    v122 = (char *)&type metadata for Any + 8;
    unint64_t v118 = v65;
    uint64_t v117 = v67;
    while (1)
    {
      if (v119)
      {
        v68 = (id *)sub_E74E0();
      }
      else
      {
        if (v4 >= *(void *)(v116 + 16)) {
          goto LABEL_92;
        }
        v68 = (id *)*(id *)(v115 + 8 * v4);
      }
      Class v69 = v68;
      BOOL v31 = __OFADD__(v4++, 1);
      if (v31) {
        break;
      }
      id v70 = [v68 controllerToProfileMappings];
      uint64_t v138 = sub_E6050();
      unint64_t v136 = sub_E7050();

      unint64_t v120 = v4;
      v134 = v69;
      if (v26)
      {
        if (v26 < 1) {
          goto LABEL_90;
        }
        v135 = (uint64_t *)(v138 - 8);
        swift_bridgeObjectRetain();
        uint64_t v71 = 0;
        do
        {
          if (v131) {
            id v72 = (id)sub_E74E0();
          }
          else {
            id v72 = *(id *)(v51 + 8 * v71 + 32);
          }
          uint64_t v73 = v136;
          uint64_t v74 = v11;
          id v139 = v72;
          id v75 = [v72 persistentIdentifier];
          uint64_t v76 = sub_E7110();
          uint64_t v78 = v77;

          swift_bridgeObjectRetain();
          unint64_t v79 = sub_21CB8(v76, v78);
          LOBYTE(v75) = v80;
          swift_bridgeObjectRelease();
          unint64_t v81 = v25;
          if (v75)
          {
            char v82 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v140 = v73;
            if ((v82 & 1) == 0)
            {
              sub_76930();
              uint64_t v73 = v140;
            }
            swift_bridgeObjectRelease();
            uint64_t v83 = v138;
            uint64_t v84 = *(void *)(v138 - 8);
            uint64_t v85 = v84;
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v84 + 32))(v60, *(void *)(v73 + 56) + *(void *)(v84 + 72) * v79, v138);
            unint64_t v136 = v73;
            sub_75E44(v79, v73);
            swift_bridgeObjectRelease();
            uint64_t v86 = 0;
          }
          else
          {
            uint64_t v84 = *v135;
            uint64_t v85 = *v135;
            uint64_t v86 = 1;
            uint64_t v83 = v138;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56))(v60, v86, 1, v83);
          swift_bridgeObjectRelease();
          uint64_t v87 = sub_33D64();
          uint64_t v88 = v137;
          (*v130)(v81, v87, v137);
          int v89 = sub_E72F0();
          sub_B40E0(v60, v74, &qword_123560);
          v90 = v134;
          unint64_t v91 = sub_E60C0();
          if (os_log_type_enabled(v91, (os_log_type_t)v89))
          {
            int v127 = v89;
            os_log_t v128 = v91;
            uint64_t v92 = swift_slowAlloc();
            uint64_t v140 = swift_slowAlloc();
            *(_DWORD *)uint64_t v92 = v123;
            uint64_t v93 = v124;
            sub_B40E0(v74, v124, &qword_123560);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v93, 1, v138) == 1)
            {
              sub_B3AA0(v93, &qword_123560);
              unint64_t v94 = 0xE300000000000000;
              uint64_t v95 = 7104878;
              uint64_t v11 = v74;
            }
            else
            {
              uint64_t v96 = v93;
              uint64_t v95 = sub_E6000();
              unint64_t v94 = v97;
              uint64_t v98 = v96;
              uint64_t v11 = v121;
              (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v98, v138);
            }
            *(void *)(v92 + 4) = sub_23A0C(v95, v94, &v140);
            swift_bridgeObjectRelease();
            sub_B3AA0(v11, &qword_123560);
            *(_WORD *)(v92 + 12) = 2080;
            id v99 = [v90 description];
            uint64_t v100 = sub_E7110();
            unint64_t v102 = v101;

            *(void *)(v92 + 14) = sub_23A0C(v100, v102, &v140);
            swift_bridgeObjectRelease();
            os_log_t v103 = v128;
            _os_log_impl(&dword_0, v128, (os_log_type_t)v127, "removing %s from %s", (uint8_t *)v92, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            unint64_t v25 = (unint64_t)v126;
            (*v129)(v126, v137);
            uint64_t v60 = v125;
            sub_B3AA0(v125, &qword_123560);
          }
          else
          {

            sub_B3AA0(v74, &qword_123560);
            (*v129)((char *)v81, v88);
            sub_B3AA0(v60, &qword_123560);
            unint64_t v25 = v81;
            uint64_t v11 = v74;
          }
          uint64_t v26 = v132;
          unint64_t v51 = v133;
          ++v71;
        }
        while (v132 != v71);
        swift_bridgeObjectRelease();
        Class v69 = v134;
      }
      id v104 = [v69 bundleIdentifier];
      sub_E7110();

      id v105 = [v69 title];
      sub_E7110();

      sub_456F8((uint64_t)_swiftEmptyArrayStorage);
      id v106 = objc_allocWithZone((Class)GCSGame);
      NSString v107 = sub_E70D0();
      swift_bridgeObjectRelease();
      NSString v108 = sub_E70D0();
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_E7040().super.isa;
      swift_bridgeObjectRelease();
      type metadata accessor for GCSCompatibilityMode();
      Class v109 = sub_E7040().super.isa;
      swift_bridgeObjectRelease();
      [v106 initWithBundleIdentifier:v107 title:v108 controllerToProfileMappings:v13 controllerToCompatibilityModeMappings:v109];

      sub_E71F0();
      if (*(void *)((char *)&dword_10 + (v141 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (v141 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_E7240();
      sub_E7260();
      sub_E7230();

      unint64_t v4 = v120;
      unint64_t v51 = v133;
      uint64_t v60 = v125;
      unint64_t v25 = (unint64_t)v126;
      if (v120 == v117) {
        goto LABEL_97;
      }
    }
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_E7570();
  }
  swift_bridgeObjectRetain();
  uint64_t v67 = sub_E7570();
  swift_bridgeObjectRelease();
  if (v67) {
    goto LABEL_56;
  }
LABEL_97:
  swift_bridgeObjectRelease();
  Class v110 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  v111 = v114;
  [v114 setGames:v110];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v111)))();
}

id sub_A588C()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

char *sub_A58C0()
{
  uint64_t v1 = sub_10C7C(&qword_124DF8);
  uint64_t v73 = *(void *)(v1 - 8);
  uint64_t v74 = v1;
  __chkstk_darwin(v1);
  id v72 = (char *)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10C7C(&qword_124DE0);
  uint64_t v70 = *(void *)(v3 - 8);
  uint64_t v71 = v3;
  __chkstk_darwin(v3);
  Class v69 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10C7C(&qword_124DC8);
  uint64_t v67 = *(void *)(v5 - 8);
  uint64_t v68 = v5;
  __chkstk_darwin(v5);
  long long v66 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_10C7C(&qword_124DB0);
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  id v63 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10C7C(&qword_124D98);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v60 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v59 = sub_10C7C(&qword_124D78);
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_10C7C(&qword_124D60);
  uint64_t v11 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10C7C(&qword_124D48);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v0[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_preferencesVersion];
  *(void *)uint64_t v18 = 0x31322E312E3031;
  *((void *)v18 + 1) = 0xE700000000000000;
  uint64_t v19 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_cloudSettings;
  id v20 = objc_allocWithZone((Class)CloudSettingsManager);
  uint64_t v21 = v0;
  *(void *)&v0[v19] = [v20 init];
  id v22 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v23 = sub_E70D0();
  id v24 = [v22 initWithSuiteName:v23];

  if (!v24) {
    id v24 = [self standardUserDefaults];
  }
  *(void *)&v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] = v24;
  unint64_t v25 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__connectedControllerIdentifiers];
  aBlock = _swiftEmptyArrayStorage;
  sub_10C7C(&qword_124D40);
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v25, v17, v14);
  uint64_t v26 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__allControllers];
  aBlock = _swiftEmptyArrayStorage;
  sub_10C7C(&qword_124D58);
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v26, v13, v57);
  int v27 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__tombstones];
  aBlock = (void *)sub_9AFF0((uint64_t)_swiftEmptyArrayStorage, &qword_125008);
  sub_10C7C(&qword_124D70);
  sub_E6130();
  (*(void (**)(char *, char *, void))(v58 + 32))(v27, v10, v59);
  unint64_t v28 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__profiles];
  sub_10C7C(&qword_124D90);
  uint64_t v29 = swift_allocObject();
  long long v59 = xmmword_EF4F0;
  *(_OWORD *)(v29 + 16) = xmmword_EF4F0;
  *(void *)(v29 + 32) = [self defaultProfile];
  aBlock = (void *)v29;
  sub_E7230();
  sub_10C7C(&qword_123E28);
  int v30 = v60;
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v28, v30, v62);
  BOOL v31 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__mouseProfiles];
  aBlock = _swiftEmptyArrayStorage;
  sub_10C7C(&qword_124DA8);
  uint64_t v32 = v63;
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v31, v32, v65);
  id v33 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__games];
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = v59;
  *(void *)(v34 + 32) = [self defaultGame];
  aBlock = (void *)v34;
  sub_E7230();
  sub_10C7C(&qword_124DC0);
  char v35 = v66;
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v33, v35, v68);
  id v36 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__copilotFusedControllers];
  aBlock = _swiftEmptyArrayStorage;
  sub_10C7C(&qword_124BD8);
  NSString v37 = v69;
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v36, v37, v71);
  char v38 = &v21[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__profileUsageStats];
  aBlock = (void *)sub_9ADFC((uint64_t)_swiftEmptyArrayStorage);
  sub_10C7C(&qword_124DF0);
  uint64_t v39 = v72;
  sub_E6130();
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v38, v39, v74);
  swift_beginAccess();
  LOBYTE(v82) = 1;
  sub_E6130();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v82) = 1;
  sub_E6130();
  swift_endAccess();
  swift_beginAccess();
  uint64_t v82 = 0x4000000000000000;
  sub_E6130();
  swift_endAccess();

  id v40 = (objc_class *)type metadata accessor for GCSPreferencesStore();
  v81.receiver = v21;
  v81.super_class = v40;
  id v41 = objc_msgSendSuper2(&v81, "init");
  uint64_t v42 = sub_AC738();
  (*(void (**)(uint64_t))((char *)&stru_2E8.reloff + (swift_isaMask & *v41)))(v42);
  unint64_t v43 = self;
  id v44 = [v43 defaultCenter];
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = v41;
  unint64_t v79 = sub_B2CE0;
  uint64_t v80 = v45;
  aBlock = _NSConcreteStackBlock;
  uint64_t v76 = 1107296256;
  uint64_t v77 = sub_A6554;
  uint64_t v78 = &unk_116818;
  id v46 = _Block_copy(&aBlock);
  NSString v47 = v41;
  swift_release();
  id v48 = [v44 addObserverForName:GCControllerDidConnectNotification object:0 queue:0 usingBlock:v46];
  _Block_release(v46);
  swift_unknownObjectRelease();

  id v49 = [v43 defaultCenter];
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v47;
  unint64_t v79 = sub_B2CE4;
  uint64_t v80 = v50;
  aBlock = _NSConcreteStackBlock;
  uint64_t v76 = 1107296256;
  uint64_t v77 = sub_A6554;
  uint64_t v78 = &unk_116868;
  unint64_t v51 = _Block_copy(&aBlock);
  uint64_t v52 = v47;
  swift_release();
  id v53 = [v49 addObserverForName:GCControllerDidDisconnectNotification object:0 queue:0 usingBlock:v51];
  _Block_release(v51);
  swift_unknownObjectRelease();

  uint64_t v54 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults;
  [*(id *)&v52[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] addObserver:v52 forKeyPath:@"bluetoothPrefsMenuLongPressAction" options:1 context:0];
  [*(id *)&v52[v54] addObserver:v52 forKeyPath:@"games" options:1 context:0];
  [*(id *)&v52[v54] addObserver:v52 forKeyPath:@"profiles" options:1 context:0];
  [*(id *)&v52[v54] addObserver:v52 forKeyPath:@"controllers" options:1 context:0];
  [*(id *)&v52[v54] addObserver:v52 forKeyPath:@"copilotFusedControllers" options:1 context:0];
  [*(id *)&v52[v54] addObserver:v52 forKeyPath:@"settingsVersion" options:1 context:0];
  id v55 = *(id *)&v52[v54];
  [v55 addObserver:v52 forKeyPath:@"settingsVersion" options:1 context:0];

  return v52;
}

uint64_t sub_A6554(uint64_t a1)
{
  uint64_t v2 = sub_E5EB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_E5EA0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_A666C()
{
  uint64_t v1 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults;
  [*(id *)&v0[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] removeObserver:v0 forKeyPath:@"bluetoothPrefsMenuLongPressAction" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"games" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"profiles" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"controllers" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"copilotFusedControllers" context:0];
  [*(id *)&v0[v1] removeObserver:v0 forKeyPath:@"settingsVersion" context:0];
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for GCSPreferencesStore();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_A6AF0(uint64_t a1, uint64_t a2, uint64_t a3, Class isa, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v46 = a5;
  uint64_t v11 = sub_E6FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_E7000();
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    NSString v25 = 0;
    goto LABEL_8;
  }
  if (!isa)
  {
    NSString v25 = sub_E70D0();
LABEL_8:
    uint64_t v26 = v46;
    sub_B40E0(a3, (uint64_t)aBlock, &qword_125300);
    int v27 = v48;
    if (v48)
    {
      unint64_t v28 = sub_B2D6C(aBlock, (uint64_t)v48);
      uint64_t v29 = *(v27 - 1);
      __chkstk_darwin(v28);
      BOOL v31 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v29 + 16))(v31);
      uint64_t v32 = sub_E7610();
      (*(void (**)(char *, void *))(v29 + 8))(v31, v27);
      sub_23BE0((uint64_t)aBlock);
      if (!isa)
      {
LABEL_11:
        id v33 = (objc_class *)type metadata accessor for GCSPreferencesStore();
        v53.receiver = v6;
        v53.super_class = v33;
        objc_msgSendSuper2(&v53, "observeValueForKeyPath:ofObject:change:context:", v25, v32, isa, v26);

        swift_unknownObjectRelease();
        return;
      }
    }
    else
    {
      uint64_t v32 = 0;
      if (!isa) {
        goto LABEL_11;
      }
    }
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_B1FDC(&qword_124EB0, type metadata accessor for NSKeyValueChangeKey);
    Class isa = sub_E7040().super.isa;
    goto LABEL_11;
  }
  uint64_t v45 = v16;
  sub_B40E0(a3, (uint64_t)aBlock, &qword_125300);
  if (v48)
  {
    uint64_t v44 = v12;
    sub_B3A64(0, &qword_124EB8);
    swift_bridgeObjectRetain();
    if (swift_dynamicCast())
    {
      uint64_t v19 = v51;
      sub_B3A64(0, (unint64_t *)&qword_124E70);
      uint64_t v46 = sub_E7340();
      id v20 = (void *)swift_allocObject();
      v20[2] = a1;
      v20[3] = a2;
      v20[4] = v6;
      v20[5] = v19;
      id v49 = sub_B2DF8;
      uint64_t v50 = v20;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2DC60;
      id v48 = &unk_1168B8;
      uint64_t v21 = _Block_copy(aBlock);
      id v22 = v6;
      id v23 = v19;
      swift_release();
      sub_E6FF0();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10C7C((uint64_t *)&unk_124E80);
      sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
      sub_E7460();
      id v24 = (void *)v46;
      sub_E7350();
      _Block_release(v21);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v11);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v15);
      return;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_B3AA0((uint64_t)aBlock, &qword_125300);
  }
  NSString v34 = sub_E70D0();
  swift_bridgeObjectRelease();
  sub_B40E0(a3, (uint64_t)aBlock, &qword_125300);
  char v35 = v48;
  if (v48)
  {
    id v36 = sub_B2D6C(aBlock, (uint64_t)v48);
    uint64_t v37 = *(v35 - 1);
    __chkstk_darwin(v36);
    uint64_t v39 = (char *)&v44 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v37 + 16))(v39);
    uint64_t v40 = sub_E7610();
    (*(void (**)(char *, void *))(v37 + 8))(v39, v35);
    sub_23BE0((uint64_t)aBlock);
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v46;
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_B1FDC(&qword_124EB0, type metadata accessor for NSKeyValueChangeKey);
  Class v42 = sub_E7040().super.isa;
  unint64_t v43 = (objc_class *)type metadata accessor for GCSPreferencesStore();
  v52.receiver = v6;
  v52.super_class = v43;
  objc_msgSendSuper2(&v52, "observeValueForKeyPath:ofObject:change:context:", v34, v40, v42, v41);

  swift_unknownObjectRelease();
}

uint64_t sub_A7344()
{
  uint64_t v1 = sub_E6FD0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_E7000();
  uint64_t v5 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  uint64_t v8 = (void *)sub_E7340();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_B3234;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2DC60;
  void aBlock[3] = &unk_116908;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v0;
  swift_release();
  sub_E6FF0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

void sub_A7624(void *a1)
{
  v130 = a1;
  uint64_t v3 = (unint64_t *)sub_E6050();
  uint64_t v126 = *(v3 - 1);
  __chkstk_darwin(v3);
  int v127 = (char *)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10C7C(&qword_123560);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v122 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (uint64_t)&v119 - v8;
  unint64_t v10 = (unint64_t)&classRef_GCController;
  id v135 = self;
  id v11 = [v135 controllers];
  v134 = (unsigned int (**)(uint64_t, uint64_t, unint64_t *))sub_B3A64(0, (unint64_t *)&unk_125030);
  unint64_t v12 = sub_E7210();

  if (v12 >> 62) {
    goto LABEL_99;
  }
  uint64_t v13 = *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v128 = v9;
  unint64_t v136 = v3;
  if (v13)
  {
    uint64_t v14 = self;
    if (v13 < 1) {
      goto LABEL_145;
    }
    uint64_t v15 = (void *)v14;
    uint64_t v16 = 0;
    v137 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v17 = (id)sub_E74E0();
      }
      else {
        id v17 = *(id *)(v12 + 8 * v16 + 32);
      }
      uint64_t v18 = v17;
      id v19 = objc_msgSend(v15, "gcController_persistentIdentifier:", v17);
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = sub_E7110();
        unint64_t v2 = v22;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v137 = sub_3F588(0, *((void *)v137 + 2) + 1, 1, v137);
        }
        unint64_t v10 = *((void *)v137 + 2);
        unint64_t v23 = *((void *)v137 + 3);
        unint64_t v1 = v10 + 1;
        if (v10 >= v23 >> 1) {
          v137 = sub_3F588((char *)(v23 > 1), v10 + 1, 1, v137);
        }
        id v24 = v137;
        *((void *)v137 + 2) = v1;
        NSString v25 = &v24[16 * v10];
        *((void *)v25 + 4) = v21;
        *((void *)v25 + 5) = v2;
      }
      else
      {
      }
      ++v16;
    }
    while (v13 != v16);
  }
  else
  {
    v137 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  id v26 = [v130 allControllers];
  uint64_t v121 = sub_B3A64(0, (unint64_t *)&qword_124E30);
  unint64_t v27 = sub_E7210();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_E7570();
  }
  else
  {
    uint64_t v13 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  if (v13)
  {
    if (v13 < 1) {
      goto LABEL_146;
    }
    uint64_t v28 = 0;
    unint64_t v10 = v27 & 0xC000000000000001;
    uint64_t v138 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if (v10) {
        id v29 = (id)sub_E74E0();
      }
      else {
        id v29 = *(id *)(v27 + 8 * v28 + 32);
      }
      uint64_t v30 = v29;
      id v31 = [v29 persistentIdentifier];
      uint64_t v32 = sub_E7110();
      uint64_t v34 = v33;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v138 = sub_3F588(0, *((void *)v138 + 2) + 1, 1, v138);
      }
      unint64_t v2 = *((void *)v138 + 2);
      unint64_t v35 = *((void *)v138 + 3);
      unint64_t v1 = v2 + 1;
      if (v2 >= v35 >> 1) {
        uint64_t v138 = sub_3F588((char *)(v35 > 1), v2 + 1, 1, v138);
      }
      ++v28;
      id v36 = v138;
      *((void *)v138 + 2) = v1;
      uint64_t v37 = &v36[16 * v2];
      *((void *)v37 + 4) = v32;
      *((void *)v37 + 5) = v34;
    }
    while (v13 != v28);
  }
  else
  {
    uint64_t v138 = (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease_n();
  unint64_t v141 = (unint64_t)_swiftEmptyArrayStorage;
  id v38 = [v130 allControllers];
  uint64_t v39 = sub_E7210();

  unint64_t v140 = v39;
  uint64_t v3 = (unint64_t *)[v135 controllers];
  uint64_t v9 = sub_E7210();

  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v9 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_E7570();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_35;
    }
LABEL_105:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v1 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_106:
    unint64_t v67 = swift_bridgeObjectRetain();
    sub_A8728(v67);
    uint64_t v68 = swift_bridgeObjectRetain();
    id v69 = v130;
    sub_A89AC(v68, (uint64_t)j_nullsub_59_9, 0);
    swift_bridgeObjectRelease();
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v69 setAllControllers:isa];

    Class v71 = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v69 setConnectedControllerIdentifiers:v71];

    uint64_t v13 = v1 >> 62;
    if (v1 >> 62)
    {
LABEL_140:
      swift_bridgeObjectRetain();
      uint64_t v110 = sub_E7570();
      swift_bridgeObjectRelease();
      if (v110 > 0)
      {
LABEL_108:
        unint64_t v2 = (*(uint64_t (**)(void))((char *)&stru_1F8.offset + (swift_isaMask & *v130)))();
        id v72 = [(id)v2 controllerToProfileMappings];
        unint64_t v10 = sub_E7050();

        if (v13) {
          goto LABEL_147;
        }
        uint64_t v73 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
        if (!v73) {
          goto LABEL_148;
        }
        goto LABEL_110;
      }
    }
    else if (*(uint64_t *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)) > 0)
    {
      goto LABEL_108;
    }
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v40 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
  if (!v40) {
    goto LABEL_105;
  }
LABEL_35:
  id v135 = self;
  unint64_t v12 = 0;
  unint64_t v131 = (void (**)(char *, uint64_t, unint64_t *))(v9 & 0xC000000000000001);
  uint64_t v123 = v9 + 32;
  uint64_t v124 = v9 & 0xFFFFFFFFFFFFFF8;
  unint64_t v120 = v138 + 72;
  uint64_t v125 = v9;
  uint64_t v129 = v40;
  while (1)
  {
    if (v131)
    {
      id v41 = (id)sub_E74E0();
    }
    else
    {
      if (v12 >= *(void *)(v124 + 16)) {
        goto LABEL_97;
      }
      id v41 = *(id *)(v123 + 8 * v12);
    }
    unint64_t v10 = (unint64_t)v41;
    BOOL v42 = __OFADD__(v12++, 1);
    if (v42) {
      goto LABEL_96;
    }
    id v43 = objc_msgSend(v135, "gcController_persistentIdentifier:", v41);
    if (!v43)
    {

      goto LABEL_37;
    }
    uint64_t v44 = v43;
    unint64_t v2 = sub_E7110();
    uint64_t v13 = v45;

    uint64_t v3 = (unint64_t *)v10;
    if (!sub_BC400())
    {
      swift_bridgeObjectRelease();

      uint64_t v40 = v129;
      goto LABEL_37;
    }
    uint64_t v46 = *((void *)v138 + 2);
    if (!v46) {
      goto LABEL_67;
    }
    if ((*((void *)v138 + 4) != v2 || *((void *)v138 + 5) != v13) && (sub_E7620() & 1) == 0)
    {
      if (v46 == 1) {
        goto LABEL_67;
      }
      if ((*((void *)v138 + 6) != v2 || *((void *)v138 + 7) != v13) && (sub_E7620() & 1) == 0) {
        break;
      }
    }
LABEL_49:
    swift_bridgeObjectRelease();
    unint64_t v47 = v140;
    if (v140 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = (unint64_t *)sub_E7570();
    }
    else
    {
      uint64_t v3 = *(unint64_t **)((char *)&dword_10 + (v140 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
    }
    uint64_t v9 = v125;
    uint64_t v40 = v129;
    if (v3)
    {
      unint64_t v133 = (uint64_t (*)(void))v47;
      v134 = (unsigned int (**)(uint64_t, uint64_t, unint64_t *))(v47 & 0xC000000000000001);
      uint64_t v9 = 4;
      uint64_t v132 = (uint64_t (**)(void))v3;
      while (1)
      {
        unint64_t v48 = v9 - 4;
        if (v134) {
          id v49 = (id)sub_E74E0();
        }
        else {
          id v49 = *(id *)(v47 + 8 * v9);
        }
        uint64_t v50 = v49;
        id v51 = [v49 persistentIdentifier];
        uint64_t v52 = sub_E7110();
        uint64_t v3 = v53;

        unint64_t v2 = (unint64_t)[(id)v10 persistentIdentifier];
        uint64_t v54 = sub_E7110();
        unint64_t v1 = v55;

        if (v52 == v54 && v3 == (unint64_t *)v1)
        {
          unint64_t v60 = (unint64_t)v133;
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          goto LABEL_72;
        }
        char v57 = sub_E7620();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v57) {
          break;
        }
        uint64_t v58 = v9 - 3;
        if (__OFADD__(v48, 1))
        {
          __break(1u);
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
LABEL_98:
          __break(1u);
LABEL_99:
          swift_bridgeObjectRetain();
          uint64_t v13 = sub_E7570();
          goto LABEL_3;
        }
        ++v9;
        unint64_t v47 = (unint64_t)v133;
        if ((uint64_t (**)(void))v58 == v132)
        {

          swift_bridgeObjectRelease();
          goto LABEL_79;
        }
      }
      unint64_t v60 = (unint64_t)v133;
LABEL_72:
      swift_bridgeObjectRelease();
      uint64_t v3 = (unint64_t *)objc_msgSend(v135, "gcsController_initWithController:", v10);
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v60 & 0x8000000000000000) != 0
        || (v60 & 0x4000000000000000) != 0)
      {
        unint64_t v60 = sub_AEFAC(v60);
        unint64_t v140 = v60;
      }
      uint64_t v61 = v60 & 0xFFFFFFFFFFFFFF8;
      if (v48 >= *(void *)((char *)&dword_10 + (v60 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_98;
      }
      uint64_t v62 = *(void **)(v61 + 8 * v9);
      *(void *)(v61 + 8 * v9) = v3;

      uint64_t v3 = &v140;
      goto LABEL_78;
    }

    swift_bridgeObjectRelease();
LABEL_37:
    if (v12 == v40)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v1 = v141;
      goto LABEL_106;
    }
  }
  if (v46 == 2)
  {
LABEL_67:
    swift_bridgeObjectRelease();
    id v59 = objc_msgSend(v135, "gcsController_initWithController:", v10);
    uint64_t v3 = &v141;
    sub_E71F0();
    if (*(void *)((char *)&dword_10 + (v141 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                    + (v141 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_E7240();
    sub_E7260();
LABEL_78:
    sub_E7230();

LABEL_79:
    uint64_t v9 = v125;
    uint64_t v40 = v129;
    goto LABEL_37;
  }
  id v63 = v120;
  uint64_t v64 = 2;
  while (1)
  {
    uint64_t v65 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      break;
    }
    BOOL v66 = *((void *)v63 - 1) == v2 && *(void *)v63 == v13;
    if (v66 || (sub_E7620() & 1) != 0) {
      goto LABEL_49;
    }
    v63 += 16;
    ++v64;
    if (v65 == v46) {
      goto LABEL_67;
    }
  }
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  swift_bridgeObjectRetain();
  uint64_t v73 = sub_E7570();
  swift_bridgeObjectRelease();
  if (v73)
  {
LABEL_110:
    uint64_t v123 = v2;
    uint64_t v74 = (uint64_t (**)(void))(swift_isaMask & *v130);
    v137 = (char *)(v126 + 56);
    v134 = (unsigned int (**)(uint64_t, uint64_t, unint64_t *))(v126 + 48);
    id v135 = (id)(v1 & 0xC000000000000001);
    v74 += 70;
    id v75 = *v74;
    uint64_t v132 = v74;
    unint64_t v133 = v75;
    unint64_t v131 = (void (**)(char *, uint64_t, unint64_t *))(v126 + 32);
    uint64_t v124 = v126 + 40;
    uint64_t v125 = v73;
    uint64_t v76 = 4;
    while (1)
    {
      uint64_t v80 = v76 - 4;
      if (v135)
      {
        objc_super v81 = (char *)sub_E74E0();
        uint64_t v82 = v76 - 3;
        if (__OFADD__(v80, 1)) {
          goto LABEL_137;
        }
      }
      else
      {
        objc_super v81 = (char *)*(id *)(v1 + 8 * v76);
        uint64_t v82 = v76 - 3;
        if (__OFADD__(v80, 1))
        {
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
      }
      uint64_t v138 = v81;
      id v83 = [v81 persistentIdentifier];
      uint64_t v13 = sub_E7110();
      uint64_t v85 = v84;

      uint64_t v86 = (void *)v133();
      id v87 = [v86 uuid];

      uint64_t v88 = v128;
      sub_E6030();

      int v89 = v136;
      v90 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t *))v137;
      (*(void (**)(uint64_t, void, uint64_t, unint64_t *))v137)(v88, 0, 1, v136);
      if ((*v134)(v88, 1, v89) == 1)
      {
        sub_B3AA0(v88, &qword_123560);
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_21CB8(v13, v85);
        char v92 = v91;
        swift_bridgeObjectRelease();
        uint64_t v93 = v82;
        if (v92)
        {
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          id v139 = (void *)v10;
          if (!isUniquelyReferenced_nonNull_native)
          {
            sub_76930();
            unint64_t v10 = (unint64_t)v139;
          }
          swift_bridgeObjectRelease();
          uint64_t v79 = (uint64_t)v122;
          uint64_t v78 = v136;
          (*(void (**)(char *, uint64_t, unint64_t *))(v126 + 32))(v122, *(void *)(v10 + 56) + *(void *)(v126 + 72) * v13, v136);
          sub_75E44(v13, v10);
          swift_bridgeObjectRelease();
          uint64_t v77 = 0;
        }
        else
        {
          uint64_t v77 = 1;
          uint64_t v78 = v136;
          uint64_t v79 = (uint64_t)v122;
        }
        v90(v79, v77, 1, v78);
        swift_bridgeObjectRelease();
        sub_B3AA0(v79, &qword_123560);

        goto LABEL_113;
      }
      uint64_t v129 = v82;
      unint64_t v95 = v1;
      uint64_t v96 = *v131;
      (*v131)(v127, v88, v89);
      int v97 = swift_isUniquelyReferenced_nonNull_native();
      id v139 = (void *)v10;
      unint64_t v99 = sub_21CB8(v13, v85);
      uint64_t v100 = *(void *)(v10 + 16);
      BOOL v101 = (v98 & 1) == 0;
      uint64_t v102 = v100 + v101;
      if (__OFADD__(v100, v101)) {
        goto LABEL_138;
      }
      unint64_t v1 = v98;
      if (*(void *)(v10 + 24) >= v102)
      {
        id v105 = v136;
        if (v97) {
          goto LABEL_130;
        }
        sub_76930();
      }
      else
      {
        sub_98A0C(v102, v97);
        unint64_t v103 = sub_21CB8(v13, v85);
        if ((v1 & 1) != (v104 & 1))
        {
          sub_E7640();
          __break(1u);
          return;
        }
        unint64_t v99 = v103;
      }
      id v105 = v136;
LABEL_130:
      id v106 = v139;
      if (v1)
      {
        (*(void (**)(unint64_t, char *, unint64_t *))(v126 + 40))(v139[7] + *(void *)(v126 + 72) * v99, v127, v105);
      }
      else
      {
        v139[(v99 >> 6) + 8] |= 1 << v99;
        NSString v107 = (uint64_t *)(v106[6] + 16 * v99);
        *NSString v107 = v13;
        v107[1] = v85;
        v96((char *)(v106[7] + *(void *)(v126 + 72) * v99), (uint64_t)v127, v105);
        uint64_t v108 = v106[2];
        BOOL v42 = __OFADD__(v108, 1);
        uint64_t v109 = v108 + 1;
        if (v42) {
          goto LABEL_139;
        }
        v106[2] = v109;
        swift_bridgeObjectRetain();
      }
      unint64_t v10 = (unint64_t)v139;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v1 = v95;
      uint64_t v73 = v125;
      uint64_t v93 = v129;
LABEL_113:
      ++v76;
      if (v93 == v73)
      {
        swift_bridgeObjectRelease();
        unint64_t v2 = v123;
        goto LABEL_149;
      }
    }
  }
LABEL_148:
  swift_bridgeObjectRelease();
LABEL_149:
  id v111 = [(id)v2 bundleIdentifier];
  sub_E7110();

  id v112 = [(id)v2 title];
  sub_E7110();

  sub_456F8((uint64_t)_swiftEmptyArrayStorage);
  id v113 = objc_allocWithZone((Class)GCSGame);
  NSString v114 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v115 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class v116 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  type metadata accessor for GCSCompatibilityMode();
  Class v117 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  id v118 = [v113 initWithBundleIdentifier:v114 title:v115 controllerToProfileMappings:v116 controllerToCompatibilityModeMappings:v117];

  (*(void (**)(unint64_t, id, uint64_t))&stru_298.segname[(swift_isaMask & *v130) - 8])(v2, v118, 1);
}

uint64_t sub_A8728(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_E7570();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_E74F0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_AF25C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_E7570();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_E7230();
}

uint64_t sub_A893C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A913C(a1, a2, a3, (uint64_t)&unk_116C88, (uint64_t)sub_B3940, (uint64_t)&unk_116CA0);
}

uint64_t sub_A8968(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_A89AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A913C(a1, a2, a3, (uint64_t)&unk_116BE8, (uint64_t)sub_B388C, (uint64_t)&unk_116C00);
}

uint64_t sub_A89D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A913C(a1, a2, a3, (uint64_t)&unk_116B48, (uint64_t)sub_B3820, (uint64_t)&unk_116B60);
}

uint64_t sub_A89FC(uint64_t a1)
{
  uint64_t v2 = sub_E6FD0();
  uint64_t v20 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_E7000();
  uint64_t v5 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_E6FE0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchQoS.QoSClass.background(_:), v8);
  uint64_t v12 = (void *)sub_E7360();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v18;
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = v14;
  aBlock[4] = sub_B3814;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_A8964;
  void aBlock[3] = &unk_116B10;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v16 = v14;
  sub_E6FF0();
  uint64_t v21 = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  return swift_release();
}

uint64_t sub_A8DA8(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E60E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_A8FD0(a1);
  uint64_t v8 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults;
  id v9 = *(id *)(a2 + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults);
  NSString v10 = sub_E70D0();
  [v9 setObject:v10 forKey:@"settingsVersion"];

  id v11 = *(id *)(a2 + v8);
  sub_10C7C(&qword_124FF0);
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v11 setObject:isa forKey:@"mouseProfiles"];

  uint64_t v13 = sub_33D64();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  os_log_type_t v14 = sub_E72E0();
  uint64_t v15 = sub_E60C0();
  if (os_log_type_enabled(v15, v14))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_0, v15, v14, "Saving mouse profiles...", v16, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

void *sub_A8FD0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)sub_E7530();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_E74E0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = [v5 jsonObject];

      sub_E7510();
      sub_E7540();
      sub_E7550();
      sub_E7520();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_A9114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A913C(a1, a2, a3, (uint64_t)&unk_116A58, (uint64_t)sub_B376C, (uint64_t)&unk_116A70);
}

uint64_t sub_A913C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  v25[1] = a4;
  uint64_t v26 = a2;
  id v7 = v6;
  uint64_t v27 = a3;
  uint64_t v9 = sub_E6FD0();
  uint64_t v32 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_E7000();
  uint64_t v30 = *(void *)(v12 - 8);
  uint64_t v31 = v12;
  __chkstk_darwin(v12);
  os_log_type_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_E6FE0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for DispatchQoS.QoSClass.background(_:), v15);
  uint64_t v19 = (void *)sub_E7360();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a1;
  v20[3] = v6;
  uint64_t v21 = v27;
  v20[4] = v26;
  v20[5] = v21;
  aBlock[4] = v28;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_A8964;
  void aBlock[3] = v29;
  unint64_t v22 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v23 = v7;
  swift_retain();
  sub_E6FF0();
  uint64_t v33 = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  sub_E7460();
  sub_E7350();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v31);
  return swift_release();
}

uint64_t sub_A94E8(unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v70 = a8;
  uint64_t v64 = a7;
  uint64_t v67 = a6;
  uint64_t v72 = a4;
  uint64_t v71 = a3;
  uint64_t v12 = sub_E6FD0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v75 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = sub_E7000();
  uint64_t v74 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v73 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_E60E0();
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v78 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = _swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_E7570();
    unint64_t v76 = v15;
    uint64_t v77 = v13;
    if (v18) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    id v23 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v18 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  unint64_t v76 = v15;
  uint64_t v77 = v13;
  if (!v18) {
    goto LABEL_15;
  }
LABEL_3:
  if (v18 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  BOOL v66 = a2;
  for (uint64_t i = 0; i != v18; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v20 = (id)sub_E74E0();
    }
    else {
      id v20 = *(id *)(a1 + 8 * i + 32);
    }
    uint64_t v21 = v20;
    id v22 = objc_msgSend(v20, "jsonObject", v64);

    if (v22)
    {
      sub_E71F0();
      if (*(void *)((char *)&dword_10 + (aBlock[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (aBlock[0] & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_E7240();
      sub_E7260();
      sub_E7230();
    }
  }
  swift_bridgeObjectRelease();
  id v23 = (char *)aBlock[0];
  a2 = v66;
LABEL_16:
  uint64_t v24 = sub_E7110();
  uint64_t v26 = v25;
  id v27 = [a2 tombstones];
  sub_10C7C(&qword_124F88);
  uint64_t v28 = sub_E7050();

  uint64_t v29 = *(void *)(v28 + 16);
  BOOL v66 = v23;
  if (v29)
  {
    unint64_t v30 = sub_21CB8(v24, v26);
    if (v31)
    {
      unint64_t v15 = *(void *)(*(void *)(v28 + 56) + 8 * v30);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      aBlock[0] = _swiftEmptyArrayStorage;
      if (!(v15 >> 62))
      {
        uint64_t v32 = *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8));
        uint64_t result = swift_bridgeObjectRetain();
        if (v32)
        {
LABEL_20:
          uint64_t v65 = v12;
          if (v32 < 1)
          {
            __break(1u);
            return result;
          }
          for (uint64_t j = 0; j != v32; ++j)
          {
            if ((v15 & 0xC000000000000001) != 0) {
              id v35 = (id)sub_E74E0();
            }
            else {
              id v35 = *(id *)(v15 + 8 * j + 32);
            }
            id v36 = v35;
            id v37 = objc_msgSend(v35, "jsonObject", v64);

            if (v37)
            {
              sub_E71F0();
              if (*(void *)((char *)&dword_10 + (aBlock[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (aBlock[0] & 0xFFFFFFFFFFFFFF8)) >> 1) {
                sub_E7240();
              }
              sub_E7260();
              sub_E7230();
            }
          }
          swift_bridgeObjectRelease();
          id v38 = (void *)aBlock[0];
          uint64_t v12 = v65;
          goto LABEL_35;
        }
LABEL_34:
        swift_bridgeObjectRelease();
        id v38 = _swiftEmptyArrayStorage;
LABEL_35:
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
LABEL_33:
      swift_bridgeObjectRetain();
      uint64_t result = sub_E7570();
      uint64_t v32 = result;
      if (result) {
        goto LABEL_20;
      }
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v38 = _swiftEmptyArrayStorage;
LABEL_36:
  uint64_t v39 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults;
  id v40 = objc_msgSend(*(id *)&a2[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults], "stringForKey:", @"settingsVersion", v64);
  if (!v40) {
    goto LABEL_42;
  }
  id v41 = v40;
  uint64_t v42 = sub_E7110();
  uint64_t v44 = v43;

  if (v42 == *(void *)&a2[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_preferencesVersion]
    && v44 == *(void *)&a2[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_preferencesVersion + 8])
  {
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  char v46 = sub_E7620();
  swift_bridgeObjectRelease();
  if ((v46 & 1) == 0)
  {
LABEL_42:
    id v47 = *(id *)&a2[v39];
    NSString v48 = sub_E70D0();
    [v47 setObject:v48 forKey:@"settingsVersion"];
  }
LABEL_44:
  uint64_t v65 = a10;
  sub_10C7C(&qword_125010);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_EB580;
  *(void *)(inited + 32) = 1635017060;
  *(void *)(inited + 40) = 0xE400000000000000;
  *(void *)(inited + 48) = v66;
  *(void *)(inited + 56) = 0x6E6F7473626D6F74;
  *(void *)(inited + 64) = 0xEA00000000007365;
  *(void *)(inited + 72) = v38;
  sub_9AFF0(inited, (uint64_t *)&unk_125020);
  id v50 = *(id *)&a2[v39];
  sub_10C7C(&qword_125018);
  Class isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [v50 setObject:isa forKey:v67];

  uint64_t v52 = sub_33D64();
  uint64_t v53 = v68;
  uint64_t v54 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v78, v52, v69);
  os_log_type_t v55 = sub_E72E0();
  id v56 = sub_E60C0();
  if (os_log_type_enabled(v56, v55))
  {
    char v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v57 = 0;
    _os_log_impl(&dword_0, v56, v55, v64, v57, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v78, v54);
  sub_B3A64(0, (unint64_t *)&qword_124E70);
  uint64_t v58 = (void *)sub_E7340();
  id v59 = (void *)swift_allocObject();
  uint64_t v60 = v72;
  v59[2] = v71;
  v59[3] = v60;
  v59[4] = a1;
  aBlock[4] = a9;
  aBlock[5] = v59;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2DC60;
  void aBlock[3] = v65;
  uint64_t v61 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  uint64_t v62 = v73;
  sub_E6FF0();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_B1FDC((unint64_t *)&qword_125380, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10C7C((uint64_t *)&unk_124E80);
  sub_B409C((unint64_t *)&qword_125390, (uint64_t *)&unk_124E80);
  id v63 = v75;
  sub_E7460();
  sub_E7350();
  _Block_release(v61);

  (*(void (**)(char *, uint64_t))(v77 + 8))(v63, v12);
  return (*(uint64_t (**)(char *, unint64_t))(v74 + 8))(v62, v76);
}

uint64_t sub_A9E3C()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v56 - v7;
  uint64_t v9 = sub_E5F20();
  uint64_t v10 = *(uint8_t **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v56 - v14;
  id v16 = [*(id *)&v1[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"copilotFusedControllers"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v58 = v10;
    uint64_t v59 = v9;
    uint64_t v61 = v3;
    uint64_t v18 = sub_E7050();

    uint64_t v67 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v62 = v8;
    uint64_t v60 = v2;
    if (v19)
    {
      unint64_t v20 = sub_21CB8(1635017060, 0xE400000000000000);
      if (v21)
      {
        sub_23C30(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v65);
        sub_B3A64(0, &qword_124FF8);
        if (swift_dynamicCast())
        {
          id v56 = *(id *)&v64[0];
          char v57 = v1;
          sub_E7370();
          sub_E5F10();
          while (*((void *)&v66 + 1))
          {
            sub_428D8(&v65, v64);
            sub_B3A64(0, &qword_125000);
            if (swift_dynamicCast())
            {
              id v22 = v63;
              id v23 = [objc_allocWithZone((Class)GCSCopilotFusedController) initWithJSONObject:v63];
              if (v23)
              {
                id v24 = v23;
                sub_E71F0();
                if (*(void *)((char *)&dword_10 + (v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_E7240();
                sub_E7260();
                sub_E7230();
              }
            }
            sub_E5F10();
          }
          (*((void (**)(char *, uint64_t))v58 + 1))(v15, v59);

          uint64_t v2 = v60;
          unint64_t v1 = v57;
        }
      }
    }
    if (*(void *)(v18 + 16) && (unint64_t v30 = sub_21CB8(0x6E6F7473626D6F74, 0xEA00000000007365), (v31 & 1) != 0))
    {
      sub_23C30(*(void *)(v18 + 56) + 32 * v30, (uint64_t)&v65);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v66 + 1))
    {
      sub_B3A64(0, &qword_124FF8);
      if (swift_dynamicCast())
      {
        id v56 = *(id *)&v64[0];
        char v57 = v1;
        sub_E7370();
        sub_E5F10();
        while (*((void *)&v66 + 1))
        {
          sub_428D8(&v65, v64);
          sub_B3A64(0, &qword_125000);
          if (swift_dynamicCast())
          {
            uint64_t v32 = v63;
            id v33 = [objc_allocWithZone((Class)GCSTombstone) initWithJSONObject:v63];
            if (v33)
            {
              id v34 = v33;
              sub_E71F0();
              if (*(void *)((char *)&dword_10 + (v67 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v67 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_E7240();
              sub_E7260();
              sub_E7230();
            }
          }
          sub_E5F10();
        }
        (*((void (**)(char *, uint64_t))v58 + 1))(v13, v59);

        uint64_t v2 = v60;
        unint64_t v1 = v57;
      }
    }
    else
    {
      sub_B3AA0((uint64_t)&v65, &qword_125300);
    }
    uint64_t v59 = sub_B3A64(0, (unint64_t *)&unk_124E40);
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v1 setCopilotFusedControllers:isa];

    uint64_t v36 = sub_E7110();
    uint64_t v38 = v37;
    uint64_t v39 = v67;
    id v40 = [v1 tombstones];
    sub_10C7C(&qword_124F88);
    id v41 = v1;
    uint64_t v42 = sub_E7050();

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v65 = v42;
    sub_AE9EC(v39, v36, v38, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class v44 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    [v41 setTombstones:v44];

    uint64_t v45 = sub_33D64();
    uint64_t v47 = v61;
    char v46 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v45, v2);
    os_log_type_t v48 = sub_E72E0();
    id v49 = v41;
    id v50 = sub_E60C0();
    if (os_log_type_enabled(v50, v48))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v65 = swift_slowAlloc();
      *(_DWORD *)id v51 = 136315138;
      uint64_t v58 = v51 + 4;
      id v52 = [v49 copilotFusedControllers];
      sub_E7210();

      uint64_t v53 = sub_E7220();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&v64[0] = sub_23A0C(v53, v55, (uint64_t *)&v65);
      sub_E73D0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v50, v48, "Loaded copilot fused controllers = %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v62, v60);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v2);
    }
  }
  else
  {
    uint64_t v25 = sub_33D64();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v25, v2);
    os_log_type_t v26 = sub_E72E0();
    id v27 = sub_E60C0();
    if (os_log_type_enabled(v27, v26))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_0, v27, v26, "Unable to load copilot fused controllers data", v28, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_AA728()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v56 - v7;
  uint64_t v9 = sub_E5F20();
  uint64_t v10 = *(uint8_t **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v56 - v14;
  id v16 = [*(id *)&v1[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"controllers"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v58 = v10;
    uint64_t v59 = v9;
    uint64_t v61 = v3;
    uint64_t v18 = sub_E7050();

    uint64_t v67 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v62 = v8;
    uint64_t v60 = v2;
    if (v19)
    {
      unint64_t v20 = sub_21CB8(1635017060, 0xE400000000000000);
      if (v21)
      {
        sub_23C30(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v65);
        sub_B3A64(0, &qword_124FF8);
        if (swift_dynamicCast())
        {
          id v56 = *(id *)&v64[0];
          char v57 = v1;
          sub_E7370();
          sub_E5F10();
          while (*((void *)&v66 + 1))
          {
            sub_428D8(&v65, v64);
            sub_B3A64(0, &qword_125000);
            if (swift_dynamicCast())
            {
              id v22 = v63;
              id v23 = [objc_allocWithZone((Class)GCSController) initWithJSONObject:v63];
              if (v23)
              {
                id v24 = v23;
                sub_E71F0();
                if (*(void *)((char *)&dword_10 + (v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_E7240();
                sub_E7260();
                sub_E7230();
              }
            }
            sub_E5F10();
          }
          (*((void (**)(char *, uint64_t))v58 + 1))(v15, v59);

          uint64_t v2 = v60;
          unint64_t v1 = v57;
        }
      }
    }
    if (*(void *)(v18 + 16) && (unint64_t v30 = sub_21CB8(0x6E6F7473626D6F74, 0xEA00000000007365), (v31 & 1) != 0))
    {
      sub_23C30(*(void *)(v18 + 56) + 32 * v30, (uint64_t)&v65);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v66 + 1))
    {
      sub_B3A64(0, &qword_124FF8);
      if (swift_dynamicCast())
      {
        id v56 = *(id *)&v64[0];
        char v57 = v1;
        sub_E7370();
        sub_E5F10();
        while (*((void *)&v66 + 1))
        {
          sub_428D8(&v65, v64);
          sub_B3A64(0, &qword_125000);
          if (swift_dynamicCast())
          {
            uint64_t v32 = v63;
            id v33 = [objc_allocWithZone((Class)GCSTombstone) initWithJSONObject:v63];
            if (v33)
            {
              id v34 = v33;
              sub_E71F0();
              if (*(void *)((char *)&dword_10 + (v67 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v67 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_E7240();
              sub_E7260();
              sub_E7230();
            }
          }
          sub_E5F10();
        }
        (*((void (**)(char *, uint64_t))v58 + 1))(v13, v59);

        uint64_t v2 = v60;
        unint64_t v1 = v57;
      }
    }
    else
    {
      sub_B3AA0((uint64_t)&v65, &qword_125300);
    }
    uint64_t v59 = sub_B3A64(0, (unint64_t *)&qword_124E30);
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v1 setAllControllers:isa];

    uint64_t v36 = sub_E7110();
    uint64_t v38 = v37;
    uint64_t v39 = v67;
    id v40 = [v1 tombstones];
    sub_10C7C(&qword_124F88);
    id v41 = v1;
    uint64_t v42 = sub_E7050();

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v65 = v42;
    sub_AE9EC(v39, v36, v38, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class v44 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    [v41 setTombstones:v44];

    uint64_t v45 = sub_33D64();
    uint64_t v47 = v61;
    char v46 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v45, v2);
    os_log_type_t v48 = sub_E72E0();
    id v49 = v41;
    id v50 = sub_E60C0();
    if (os_log_type_enabled(v50, v48))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v65 = swift_slowAlloc();
      *(_DWORD *)id v51 = 136315138;
      uint64_t v58 = v51 + 4;
      id v52 = [v49 allControllers];
      sub_E7210();

      uint64_t v53 = sub_E7220();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&v64[0] = sub_23A0C(v53, v55, (uint64_t *)&v65);
      sub_E73D0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v50, v48, "Loaded controllers = %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v62, v60);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v2);
    }
  }
  else
  {
    uint64_t v25 = sub_33D64();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v25, v2);
    os_log_type_t v26 = sub_E72E0();
    id v27 = sub_E60C0();
    if (os_log_type_enabled(v27, v26))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_0, v27, v26, "Unable to load controllers data", v28, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_AB014()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v56 - v7;
  uint64_t v9 = sub_E5F20();
  uint64_t v10 = *(uint8_t **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v56 - v14;
  id v16 = [*(id *)&v1[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"games"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v58 = v10;
    uint64_t v59 = v9;
    uint64_t v61 = v3;
    uint64_t v18 = sub_E7050();

    uint64_t v67 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v62 = v8;
    uint64_t v60 = v2;
    if (v19)
    {
      unint64_t v20 = sub_21CB8(1635017060, 0xE400000000000000);
      if (v21)
      {
        sub_23C30(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v65);
        sub_B3A64(0, &qword_124FF8);
        if (swift_dynamicCast())
        {
          id v56 = *(id *)&v64[0];
          char v57 = v1;
          sub_E7370();
          sub_E5F10();
          while (*((void *)&v66 + 1))
          {
            sub_428D8(&v65, v64);
            sub_B3A64(0, &qword_125000);
            if (swift_dynamicCast())
            {
              id v22 = v63;
              id v23 = [objc_allocWithZone((Class)GCSGame) initWithJSONObject:v63];
              if (v23)
              {
                id v24 = v23;
                sub_E71F0();
                if (*(void *)((char *)&dword_10 + (v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_E7240();
                sub_E7260();
                sub_E7230();
              }
            }
            sub_E5F10();
          }
          (*((void (**)(char *, uint64_t))v58 + 1))(v15, v59);

          uint64_t v2 = v60;
          unint64_t v1 = v57;
        }
      }
    }
    if (*(void *)(v18 + 16) && (unint64_t v30 = sub_21CB8(0x6E6F7473626D6F74, 0xEA00000000007365), (v31 & 1) != 0))
    {
      sub_23C30(*(void *)(v18 + 56) + 32 * v30, (uint64_t)&v65);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v66 + 1))
    {
      sub_B3A64(0, &qword_124FF8);
      if (swift_dynamicCast())
      {
        id v56 = *(id *)&v64[0];
        char v57 = v1;
        sub_E7370();
        sub_E5F10();
        while (*((void *)&v66 + 1))
        {
          sub_428D8(&v65, v64);
          sub_B3A64(0, &qword_125000);
          if (swift_dynamicCast())
          {
            uint64_t v32 = v63;
            id v33 = [objc_allocWithZone((Class)GCSTombstone) initWithJSONObject:v63];
            if (v33)
            {
              id v34 = v33;
              sub_E71F0();
              if (*(void *)((char *)&dword_10 + (v67 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v67 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_E7240();
              sub_E7260();
              sub_E7230();
            }
          }
          sub_E5F10();
        }
        (*((void (**)(char *, uint64_t))v58 + 1))(v13, v59);

        uint64_t v2 = v60;
        unint64_t v1 = v57;
      }
    }
    else
    {
      sub_B3AA0((uint64_t)&v65, &qword_125300);
    }
    uint64_t v59 = sub_B3A64(0, (unint64_t *)&qword_122828);
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v1 setGames:isa];

    uint64_t v36 = sub_E7110();
    uint64_t v38 = v37;
    uint64_t v39 = v67;
    id v40 = [v1 tombstones];
    sub_10C7C(&qword_124F88);
    id v41 = v1;
    uint64_t v42 = sub_E7050();

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v65 = v42;
    sub_AE9EC(v39, v36, v38, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class v44 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    [v41 setTombstones:v44];

    uint64_t v45 = sub_33D64();
    uint64_t v47 = v61;
    char v46 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v45, v2);
    os_log_type_t v48 = sub_E72E0();
    id v49 = v41;
    id v50 = sub_E60C0();
    if (os_log_type_enabled(v50, v48))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v65 = swift_slowAlloc();
      *(_DWORD *)id v51 = 136315138;
      uint64_t v58 = v51 + 4;
      id v52 = [v49 games];
      sub_E7210();

      uint64_t v53 = sub_E7220();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&v64[0] = sub_23A0C(v53, v55, (uint64_t *)&v65);
      sub_E73D0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v50, v48, "Loaded games = %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v62, v60);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v2);
    }
  }
  else
  {
    uint64_t v25 = sub_33D64();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v25, v2);
    os_log_type_t v26 = sub_E72E0();
    id v27 = sub_E60C0();
    if (os_log_type_enabled(v27, v26))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_0, v27, v26, "Unable to load games data", v28, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_AB900()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v56 - v7;
  uint64_t v9 = sub_E5F20();
  uint64_t v10 = *(uint8_t **)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v56 - v14;
  id v16 = [*(id *)&v1[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] dictionaryForKey:@"profiles"];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v58 = v10;
    uint64_t v59 = v9;
    uint64_t v61 = v3;
    uint64_t v18 = sub_E7050();

    uint64_t v67 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v68 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v19 = *(void *)(v18 + 16);
    uint64_t v62 = v8;
    uint64_t v60 = v2;
    if (v19)
    {
      unint64_t v20 = sub_21CB8(1635017060, 0xE400000000000000);
      if (v21)
      {
        sub_23C30(*(void *)(v18 + 56) + 32 * v20, (uint64_t)&v65);
        sub_B3A64(0, &qword_124FF8);
        if (swift_dynamicCast())
        {
          id v56 = *(id *)&v64[0];
          char v57 = v1;
          sub_E7370();
          sub_E5F10();
          while (*((void *)&v66 + 1))
          {
            sub_428D8(&v65, v64);
            sub_B3A64(0, &qword_125000);
            if (swift_dynamicCast())
            {
              id v22 = v63;
              id v23 = [objc_allocWithZone((Class)GCSProfile) initWithJSONObject:v63];
              if (v23)
              {
                id v24 = v23;
                sub_E71F0();
                if (*(void *)((char *)&dword_10 + (v68 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                               + (v68 & 0xFFFFFFFFFFFFFF8)) >> 1)
                  sub_E7240();
                sub_E7260();
                sub_E7230();
              }
            }
            sub_E5F10();
          }
          (*((void (**)(char *, uint64_t))v58 + 1))(v15, v59);

          uint64_t v2 = v60;
          unint64_t v1 = v57;
        }
      }
    }
    if (*(void *)(v18 + 16) && (unint64_t v30 = sub_21CB8(0x6E6F7473626D6F74, 0xEA00000000007365), (v31 & 1) != 0))
    {
      sub_23C30(*(void *)(v18 + 56) + 32 * v30, (uint64_t)&v65);
    }
    else
    {
      long long v65 = 0u;
      long long v66 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v66 + 1))
    {
      sub_B3A64(0, &qword_124FF8);
      if (swift_dynamicCast())
      {
        id v56 = *(id *)&v64[0];
        char v57 = v1;
        sub_E7370();
        sub_E5F10();
        while (*((void *)&v66 + 1))
        {
          sub_428D8(&v65, v64);
          sub_B3A64(0, &qword_125000);
          if (swift_dynamicCast())
          {
            uint64_t v32 = v63;
            id v33 = [objc_allocWithZone((Class)GCSTombstone) initWithJSONObject:v63];
            if (v33)
            {
              id v34 = v33;
              sub_E71F0();
              if (*(void *)((char *)&dword_10 + (v67 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v67 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_E7240();
              sub_E7260();
              sub_E7230();
            }
          }
          sub_E5F10();
        }
        (*((void (**)(char *, uint64_t))v58 + 1))(v13, v59);

        uint64_t v2 = v60;
        unint64_t v1 = v57;
      }
    }
    else
    {
      sub_B3AA0((uint64_t)&v65, &qword_125300);
    }
    uint64_t v59 = sub_B3A64(0, (unint64_t *)&qword_124E50);
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v1 setProfiles:isa];

    uint64_t v36 = sub_E7110();
    uint64_t v38 = v37;
    uint64_t v39 = v67;
    id v40 = [v1 tombstones];
    sub_10C7C(&qword_124F88);
    id v41 = v1;
    uint64_t v42 = sub_E7050();

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v65 = v42;
    sub_AE9EC(v39, v36, v38, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class v44 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    [v41 setTombstones:v44];

    uint64_t v45 = sub_33D64();
    uint64_t v47 = v61;
    char v46 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v45, v2);
    os_log_type_t v48 = sub_E72E0();
    id v49 = v41;
    id v50 = sub_E60C0();
    if (os_log_type_enabled(v50, v48))
    {
      id v51 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v65 = swift_slowAlloc();
      *(_DWORD *)id v51 = 136315138;
      uint64_t v58 = v51 + 4;
      id v52 = [v49 profiles];
      sub_E7210();

      uint64_t v53 = sub_E7220();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&v64[0] = sub_23A0C(v53, v55, (uint64_t *)&v65);
      sub_E73D0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v50, v48, "Loaded profiles = %s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v62, v60);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v46, v2);
    }
  }
  else
  {
    uint64_t v25 = sub_33D64();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v25, v2);
    os_log_type_t v26 = sub_E72E0();
    id v27 = sub_E60C0();
    if (os_log_type_enabled(v27, v26))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_0, v27, v26, "Unable to load profiles data", v28, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

void sub_AC1EC()
{
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] arrayForKey:@"mouseProfiles"];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_E7210();

    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v5 = v3 + 32;
      do
      {
        sub_23C30(v5, (uint64_t)v10);
        sub_10C7C(&qword_124FF0);
        if (swift_dynamicCast())
        {
          id v6 = [objc_allocWithZone((Class)GCSMouseProfile) initWithJSONObject:v9];
          if (v6)
          {
            id v7 = v6;
            sub_E71F0();
            if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (v11 & 0xFFFFFFFFFFFFFF8)) >> 1)
              sub_E7240();
            sub_E7260();
            sub_E7230();
          }
          swift_unknownObjectRelease();
        }
        v5 += 32;
        --v4;
      }
      while (v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_B3A64(0, &qword_124E90);
    Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
    [v0 setMouseProfiles:isa];
  }
}

uint64_t sub_AC3D4()
{
  sub_9AFF0((uint64_t)_swiftEmptyArrayStorage, &qword_125008);
  sub_10C7C(&qword_124F88);
  Class isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [v0 setTombstones:isa];

  sub_AA728();
  sub_AB900();
  sub_AC1EC();
  sub_AB014();
  sub_A9E3C();
  uint64_t v2 = OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults;
  if ([*(id *)&v0[OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults] objectForKey:@"bluetoothPrefsMenuLongPressAction"])
  {
    sub_E7440();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_B3704((uint64_t)&v15, (uint64_t)v17, &qword_125300);
  if (v18)
  {
    if (swift_dynamicCast()) {
      [v0 setLongPressMenuOpensLaunchPad:v14];
    }
  }
  else
  {
    sub_B3AA0((uint64_t)v17, &qword_125300);
  }
  uint64_t v3 = *(void **)&v0[v2];
  swift_beginAccess();
  id v4 = v3;
  swift_bridgeObjectRetain();
  NSString v5 = sub_E70D0();
  swift_bridgeObjectRelease();
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    sub_E7440();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_B3704((uint64_t)&v15, (uint64_t)v17, &qword_125300);
  if (v18)
  {
    if (swift_dynamicCast()) {
      [v0 setNaturalThumbstickScrollDirection:(v13 & 1) == 0];
    }
  }
  else
  {
    sub_B3AA0((uint64_t)v17, &qword_125300);
  }
  id v7 = *(void **)&v0[v2];
  swift_beginAccess();
  id v8 = v7;
  swift_bridgeObjectRetain();
  NSString v9 = sub_E70D0();
  swift_bridgeObjectRelease();
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    sub_E7440();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_B3704((uint64_t)&v15, (uint64_t)v17, &qword_125300);
  if (!v18) {
    return sub_B3AA0((uint64_t)v17, &qword_125300);
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return (uint64_t)[v0 setThumbstickScrollingSpeed:v12];
  }
  return result;
}

uint64_t sub_AC738()
{
  id v1 = v0;
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSString v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [*(id *)((char *)v1 + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults) stringForKey:@"settingsVersion"];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_E7110();
    uint64_t v10 = v9;

    if (v8 == 0x302E302E30 && v10 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v12 = sub_E7620();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        uint64_t v13 = sub_AC3D4();
        return (*(uint64_t (**)(uint64_t))((char *)&stru_248.flags + (swift_isaMask & *v1)))(v13);
      }
    }
  }
  uint64_t v14 = sub_33D64();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
  os_log_type_t v15 = sub_E7300();
  long long v16 = sub_E60C0();
  if (os_log_type_enabled(v16, v15))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v16, v15, "Saved data is not compatible. Resetting prefs store.", v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_9AFF0((uint64_t)_swiftEmptyArrayStorage, &qword_125008);
  sub_10C7C(&qword_124F88);
  Class isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  [v1 setTombstones:isa];

  sub_B3A64(0, (unint64_t *)&qword_124E30);
  Class v19 = sub_E7200().super.isa;
  [v1 setAllControllers:v19];

  sub_10C7C(&qword_124D90);
  uint64_t v20 = swift_allocObject();
  long long v26 = xmmword_EF4F0;
  *(_OWORD *)(v20 + 16) = xmmword_EF4F0;
  *(void *)(v20 + 32) = [self defaultProfile];
  uint64_t v27 = v20;
  sub_E7230();
  sub_B3A64(0, (unint64_t *)&qword_124E50);
  Class v21 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setProfiles:v21];

  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(void *)(v22 + 32) = [self defaultGame];
  uint64_t v27 = v22;
  sub_E7230();
  sub_B3A64(0, (unint64_t *)&qword_122828);
  Class v23 = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setGames:v23];

  sub_B3A64(0, (unint64_t *)&unk_124E40);
  Class v24 = sub_E7200().super.isa;
  [v1 setCopilotFusedControllers:v24];

  return (*(uint64_t (**)(uint64_t))((char *)&stru_248.flags + (swift_isaMask & *v1)))(v13);
}

uint64_t sub_ACBA4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GCSPreferencesStore();
  uint64_t result = sub_E6110();
  *a1 = result;
  return result;
}

uint64_t sub_ACBE4(uint64_t a1, uint64_t a2)
{
  return sub_ACE9C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_ACC04(uint64_t a1, uint64_t a2)
{
  return sub_ACE9C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_ACC20(uint64_t a1, id *a2)
{
  uint64_t result = sub_E70F0();
  *a2 = 0;
  return result;
}

uint64_t sub_ACC9C(uint64_t a1, id *a2)
{
  char v3 = sub_E7100();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_ACD20@<X0>(void *a1@<X8>)
{
  sub_E7110();
  NSString v2 = sub_E70D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_ACD6C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_E70D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_ACDB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_E7110();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_ACDE0(uint64_t a1)
{
  uint64_t v2 = sub_B1FDC(&qword_124EB0, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_B1FDC(&qword_124F80, type metadata accessor for NSKeyValueChangeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_ACE9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_E7110();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_ACEE0()
{
  sub_E7110();
  sub_E7170();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_ACF34()
{
  sub_E7110();
  sub_E7670();
  sub_E7170();
  Swift::Int v0 = sub_E76A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_ACFA8()
{
  uint64_t v0 = sub_E7110();
  uint64_t v2 = v1;
  if (v0 == sub_E7110() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_E7620();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_AD034(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10C7C(&qword_124D90);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size_12(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_AF028((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_E7570();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_AD12C(void **__src, void **a2, unint64_t a3, id *__dst, void *a5)
{
  uint64_t v5 = __dst;
  id v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v10 = (char *)a2 - (char *)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 3;
  char v46 = __src;
  uint64_t v45 = __dst;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (__dst != a2 || &a2[v14] <= __dst) {
        memmove(__dst, a2, 8 * v14);
      }
      uint64_t v25 = &v5[v14];
      Class v44 = v25;
      char v46 = v7;
      if (v8 < v7 && v12 >= 8)
      {
        long long v26 = (void **)(a3 - 8);
        uint64_t v27 = v7;
        uint64_t v38 = v5;
        uint64_t v39 = v8;
        while (1)
        {
          unint64_t v28 = (unint64_t)v25;
          uint64_t v29 = v25 - 1;
          uint64_t v43 = *(v25 - 1);
          unint64_t v30 = *--v27;
          id v42 = v30;
          char v31 = v43;
          id v32 = v30;
          char v33 = sub_9E92C(&v43, &v42, a5);
          if (v41) {
            break;
          }
          char v34 = v33;
          id v35 = v26 + 1;

          if (v34)
          {
            if (v35 != v7 || v26 >= v7) {
              *long long v26 = *v27;
            }
            char v46 = v27;
            uint64_t v36 = v38;
            uint64_t v25 = (id *)v28;
            if (v27 <= v39) {
              goto LABEL_48;
            }
          }
          else
          {
            Class v44 = v29;
            if ((unint64_t)v35 < v28 || (unint64_t)v26 >= v28 || v35 != (void **)v28) {
              *long long v26 = *v29;
            }
            uint64_t v27 = v7;
            uint64_t v25 = v29;
            uint64_t v36 = v38;
            if (v7 <= v39) {
              goto LABEL_48;
            }
          }
          --v26;
          id v7 = v27;
          if (v25 <= v36) {
            goto LABEL_48;
          }
        }
      }
      goto LABEL_48;
    }
  }
  else if (v9 >= -7)
  {
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, 8 * v11);
    }
    os_log_type_t v15 = &v5[v11];
    Class v44 = v15;
    if ((unint64_t)v7 < a3 && v9 >= 8)
    {
      while (1)
      {
        long long v16 = v8;
        uint64_t v43 = *v7;
        uint64_t v17 = v5;
        id v42 = *v5;
        id v18 = v42;
        Class v19 = v43;
        id v20 = v18;
        char v21 = sub_9E92C(&v43, &v42, a5);
        if (v41) {
          break;
        }
        char v22 = v21;

        if (v22)
        {
          Class v23 = v7 + 1;
          Class v24 = v16;
          if (v16 < v7 || v16 >= v23 || v16 != v7) {
            *long long v16 = *v7;
          }
          uint64_t v5 = v17;
        }
        else
        {
          Class v24 = v16;
          if (v16 != v17) {
            *long long v16 = *v17;
          }
          uint64_t v5 = v17 + 1;
          uint64_t v45 = v17 + 1;
          Class v23 = v7;
        }
        uint64_t v8 = v24 + 1;
        char v46 = v8;
        if (v5 < v15)
        {
          id v7 = v23;
          if ((unint64_t)v23 < a3) {
            continue;
          }
        }
        goto LABEL_48;
      }
    }
LABEL_48:
    sub_AD46C((void **)&v46, (const void **)&v45, &v44);

    return 1;
  }

  uint64_t result = sub_E75B0();
  __break(1u);
  return result;
}

char *sub_AD46C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_E75B0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

uint64_t sub_AD528(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  Swift::Int v8 = sub_E76A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_E7620() & 1) != 0)
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_E7620() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_AD9B8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_AD6D8()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10C7C((uint64_t *)&unk_125060);
  uint64_t v3 = sub_E7490();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_E7670();
      sub_E7170();
      uint64_t result = sub_E76A0();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_AD9B8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_AD6D8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_ADB54();
      goto LABEL_22;
    }
    sub_ADD08();
  }
  uint64_t v11 = *v4;
  sub_E7670();
  sub_E7170();
  uint64_t result = sub_E76A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_E7620(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_E7630();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_E7620();
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
  *uint64_t v21 = v8;
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

void *sub_ADB54()
{
  unint64_t v1 = v0;
  sub_10C7C((uint64_t *)&unk_125060);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E7480();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
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

uint64_t sub_ADD08()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10C7C((uint64_t *)&unk_125060);
  uint64_t v3 = sub_E7490();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_E7670();
    swift_bridgeObjectRetain();
    sub_E7170();
    uint64_t result = sub_E76A0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
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

uint64_t sub_ADFB8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_E6050();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_10C7C(&qword_125058);
  int v46 = a2;
  uint64_t v10 = sub_E7590();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  id v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  id v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  unint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    char v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      id v30 = *(id *)(*(void *)(v11 + 56) + 8 * v23);
    }
    sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_E7070();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  char v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v12;
  return result;
}

uint64_t sub_AE3DC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10C7C(&qword_125008);
  char v36 = a2;
  uint64_t v6 = sub_E7590();
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
    unint64_t v22 = (void *)(v5 + 64);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_E7670();
    sub_E7170();
    uint64_t result = sub_E76A0();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_AE6F4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_E6050();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_E7470();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      int64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v17 = sub_E7070();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            unint64_t v23 = (void *)(v22 + 8 * a1);
            int64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *unint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    char v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    char v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *char v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_AE9EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21CB8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_AEDF4();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_AE3DC(v15, a4 & 1);
  unint64_t v21 = sub_21CB8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_E7640();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

id sub_AEB5C()
{
  uint64_t v1 = sub_E6050();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10C7C(&qword_125058);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_E7580();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  id result = (id)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v9);
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
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    unint64_t v18 = *(void **)(*(void *)(v5 + 56) + v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    id result = v18;
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

void *sub_AEDF4()
{
  uint64_t v1 = v0;
  sub_10C7C(&qword_125008);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E7580();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_AEFAC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_E7570();
    swift_bridgeObjectRelease();
  }

  return sub_E74F0();
}

uint64_t sub_AF028(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_E7570();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_E7570();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_B409C(&qword_125078, &qword_123E28);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10C7C(&qword_123E28);
          unint64_t v12 = sub_AF4FC(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_B3A64(0, (unint64_t *)&qword_124E50);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_E75B0();
  __break(1u);
  return result;
}

uint64_t sub_AF25C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_E7570();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_E7570();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_B409C(&qword_125048, &qword_124D58);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10C7C(&qword_124D58);
          unint64_t v12 = sub_AF490(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_B3A64(0, (unint64_t *)&qword_124E30);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_E75B0();
  __break(1u);
  return result;
}

uint64_t (*sub_AF490(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_AF5B0(v6, a2, a3);
  return sub_AF4F8;
}

uint64_t (*sub_AF4FC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_AF630(v6, a2, a3);
  return sub_AF564;
}

void sub_AF568(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_AF5B0(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_E74E0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_B4360;
  }
  __break(1u);
  return result;
}

void (*sub_AF630(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_E74E0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_AF6B0;
  }
  __break(1u);
  return result;
}

void sub_AF6B0(id *a1)
{
}

uint64_t sub_AF6B8(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_AF6CC(unint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_E7570())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0 ? (id)sub_E74E0() : *(id *)(a1 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v11 = v6;
      id v12 = [v8 *a4];
      uint64_t v13 = sub_E7110();
      uint64_t v15 = v14;

      if (v13 == a2 && v15 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_16:
        swift_bridgeObjectRelease();
        return v9;
      }
      char v17 = sub_E7620();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_16;
      }

      ++v7;
      uint64_t v6 = v11;
      if (v10 == v11) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_AF864(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v27 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_39;
  }
  for (uint64_t i = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)); i; uint64_t i = sub_E7570())
  {
    unint64_t v5 = 0;
    unint64_t v6 = v3 & 0xC000000000000001;
    uint64_t v25 = v3 + 32;
    uint64_t v26 = v3 & 0xFFFFFFFFFFFFFF8;
    uint64_t v23 = i;
    unint64_t v24 = a2 & 0xC000000000000001;
    unint64_t v22 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v6)
      {
        id v7 = (id)sub_E74E0();
      }
      else
      {
        if (v5 >= *(void *)(v26 + 16)) {
          goto LABEL_36;
        }
        id v7 = *(id *)(v25 + 8 * v5);
      }
      id v8 = v7;
      if (__OFADD__(v5++, 1)) {
        goto LABEL_37;
      }
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_E7570();
        if (!v10) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v10 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (!v10) {
          goto LABEL_16;
        }
      }
      id v11 = v24 ? (id)sub_E74E0() : *(id *)(a2 + 32);
      id v12 = v11;
      uint64_t v3 = sub_B3A64(0, (unint64_t *)&qword_124E30);
      char v13 = sub_E7390();

      if ((v13 & 1) == 0) {
        break;
      }

      swift_bridgeObjectRelease();
LABEL_5:
      if (v5 == i) {
        return v27;
      }
    }
    if (v10 == 1)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      uint64_t v3 = (uint64_t)&v27;
      sub_E7510();
      sub_E7540();
      sub_E7550();
      sub_E7520();
      goto LABEL_5;
    }
    if (v24)
    {
      uint64_t v14 = 1;
      while (1)
      {
        sub_E74E0();
        uint64_t v15 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          break;
        }
        char v16 = sub_E7390();
        swift_unknownObjectRelease();
        if (v16) {
          goto LABEL_29;
        }
        ++v14;
        if (v15 == v10) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v17 = 5;
    while (1)
    {
      uint64_t v18 = v17 - 3;
      if (__OFADD__(v17 - 4, 1)) {
        break;
      }
      id v19 = *(id *)(a2 + 8 * v17);
      char v20 = sub_E7390();

      if (v20)
      {
LABEL_29:

        swift_bridgeObjectRelease();
        unint64_t v6 = v22;
        uint64_t i = v23;
        goto LABEL_5;
      }
      ++v17;
      if (v18 == v10)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        unint64_t v6 = v22;
        uint64_t i = v23;
        goto LABEL_17;
      }
    }
LABEL_38:
    __break(1u);
LABEL_39:
    ;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_AFB20(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_37;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      unint64_t v6 = v3 & 0xC000000000000001;
      uint64_t v7 = v3 & 0xFFFFFFFFFFFFFF8;
      uint64_t v8 = v3 + 32;
      uint64_t v31 = v4;
      uint64_t v32 = (void *)a2;
      uint64_t v29 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v30 = v3 & 0xC000000000000001;
      uint64_t v33 = v3 + 32;
      while (v6)
      {
        id v9 = (id)sub_E74E0();
LABEL_9:
        uint64_t v10 = v9;
        if (__OFADD__(v5++, 1)) {
          goto LABEL_36;
        }
        if ([v9 isHidden])
        {
LABEL_4:
          sub_E7510();
          uint64_t v3 = _swiftEmptyArrayStorage[2];
          sub_E7540();
          sub_E7550();
          sub_E7520();
        }
        else
        {
          id v12 = [(id)a2 copilotFusedControllers];
          sub_B3A64(0, (unint64_t *)&unk_124E40);
          unint64_t v13 = sub_E7210();

          if (v13 >> 62)
          {
            id v27 = v10;
            swift_bridgeObjectRetain();
            uint64_t v3 = sub_E7570();
            if (v3)
            {
LABEL_13:
              unint64_t v34 = v5;
              uint64_t v35 = v3;
              id v36 = v10;
              uint64_t v15 = 4;
              while (1)
              {
                if ((v13 & 0xC000000000000001) != 0) {
                  id v16 = (id)sub_E74E0();
                }
                else {
                  id v16 = *(id *)(v13 + 8 * v15);
                }
                uint64_t v17 = v16;
                uint64_t v3 = v15 - 3;
                if (__OFADD__(v15 - 4, 1))
                {
                  __break(1u);
                  goto LABEL_35;
                }
                id v18 = [v16 fusedControllerIdentifier];
                uint64_t v19 = sub_E7110();
                uint64_t v21 = v20;

                id v22 = [v36 persistentIdentifier];
                uint64_t v23 = sub_E7110();
                uint64_t v25 = v24;

                if (v19 == v23 && v21 == v25)
                {
                  uint64_t v3 = (uint64_t)v36;

                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_27;
                }
                a2 = sub_E7620();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (a2) {
                  break;
                }
                ++v15;
                if (v3 == v35)
                {
                  uint64_t v3 = (uint64_t)v36;

                  swift_bridgeObjectRelease_n();
                  uint64_t v4 = v31;
                  a2 = (uint64_t)v32;
                  unint64_t v5 = v34;
                  uint64_t v7 = v29;
                  unint64_t v6 = v30;
                  goto LABEL_32;
                }
              }
              uint64_t v3 = (uint64_t)v36;

LABEL_27:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              a2 = (uint64_t)v32;
              unint64_t v6 = v30;
              uint64_t v4 = v31;
              uint64_t v8 = v33;
              unint64_t v5 = v34;
              uint64_t v7 = v29;
              if (((*(uint64_t (**)(uint64_t))&stru_248.segname[(swift_isaMask & *v32) - 8])(v3) & 1) == 0) {
                goto LABEL_4;
              }

              goto LABEL_5;
            }
          }
          else
          {
            uint64_t v3 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
            id v14 = v10;
            swift_bridgeObjectRetain();
            if (v3) {
              goto LABEL_13;
            }
          }

          swift_bridgeObjectRelease_n();
LABEL_32:
          uint64_t v8 = v33;
        }
LABEL_5:
        if (v5 == v4) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v5 < *(void *)(v7 + 16)) {
        break;
      }
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      uint64_t v4 = sub_E7570();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v9 = *(id *)(v8 + 8 * v5);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_AFECC(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  uint64_t v24 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v4)
  {
    while (1)
    {
      unint64_t v5 = 0;
      uint64_t v22 = v3 & 0xFFFFFFFFFFFFFF8;
      unint64_t v23 = v3 & 0xC000000000000001;
      uint64_t v20 = v4;
      uint64_t v21 = (void **)(v3 + 32);
      uint64_t v19 = a2 + 7;
      while (1)
      {
        if (v23)
        {
          unint64_t v6 = (void *)sub_E74E0();
        }
        else
        {
          if (v5 >= *(void *)(v22 + 16))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          unint64_t v6 = v21[v5];
        }
        uint64_t v7 = v6;
        if (__OFADD__(v5++, 1)) {
          goto LABEL_31;
        }
        id v9 = [v6 persistentIdentifier];
        uint64_t v10 = sub_E7110();
        unint64_t v3 = (unint64_t)v11;

        id v12 = (void *)a2[2];
        if (v12) {
          break;
        }

        swift_bridgeObjectRelease();
LABEL_5:
        if (v5 == v4) {
          return v24;
        }
      }
      unint64_t v13 = a2;
      BOOL v14 = a2[4] == v10 && a2[5] == v3;
      if (v14 || (sub_E7620() & 1) != 0) {
        break;
      }
      if (v12 == (void *)((char *)&dword_0 + 1))
      {
LABEL_27:

        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      uint64_t v15 = v19;
      uint64_t v16 = 1;
      while (1)
      {
        a2 = (void *)(v16 + 1);
        if (__OFADD__(v16, 1)) {
          break;
        }
        BOOL v17 = *(v15 - 1) == v10 && *v15 == v3;
        if (v17 || (sub_E7620() & 1) != 0) {
          goto LABEL_16;
        }
        v15 += 2;
        ++v16;
        if (a2 == v12) {
          goto LABEL_27;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      uint64_t v4 = sub_E7570();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    sub_E7510();
    sub_E7540();
    sub_E7550();
    unint64_t v3 = (unint64_t)&v24;
    sub_E7520();
LABEL_17:
    uint64_t v4 = v20;
    a2 = v13;
    goto LABEL_5;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_B00F4(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  uint64_t v22 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_31;
  }
  for (uint64_t i = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8)); i; uint64_t i = sub_E7570())
  {
    unint64_t v4 = 0;
    uint64_t v19 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v20 = v2 & 0xC000000000000001;
    id v18 = (void **)(v2 + 32);
    while (1)
    {
      if (v20)
      {
        unint64_t v5 = (void *)sub_E74E0();
      }
      else
      {
        if (v4 >= *(void *)(v19 + 16))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          goto LABEL_30;
        }
        unint64_t v5 = v18[v4];
      }
      unint64_t v6 = v5;
      if (__OFADD__(v4++, 1)) {
        goto LABEL_29;
      }
      id v8 = [v5 persistentIdentifier];
      uint64_t v9 = sub_E7110();
      unint64_t v2 = (unint64_t)v10;

      uint64_t v11 = a2[2];
      if (!v11) {
        goto LABEL_25;
      }
      BOOL v12 = a2[4] == v9 && a2[5] == v2;
      if (!v12 && (sub_E7620() & 1) == 0) {
        break;
      }
LABEL_4:

      swift_bridgeObjectRelease();
LABEL_5:
      if (v4 == i) {
        return v22;
      }
    }
    if (v11 == 1)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      sub_E7510();
      sub_E7540();
      sub_E7550();
      unint64_t v2 = (unint64_t)&v22;
      sub_E7520();
      goto LABEL_5;
    }
    unint64_t v13 = a2 + 7;
    uint64_t v14 = 1;
    while (1)
    {
      uint64_t v15 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        break;
      }
      BOOL v16 = *(v13 - 1) == v9 && *v13 == v2;
      if (v16 || (sub_E7620() & 1) != 0) {
        goto LABEL_4;
      }
      v13 += 2;
      ++v14;
      if (v15 == v11) {
        goto LABEL_25;
      }
    }
LABEL_30:
    __break(1u);
LABEL_31:
    ;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_B0304(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v25 = a2;
  uint64_t v5 = sub_E6050();
  unint64_t v6 = *(uint64_t (***)(char *, uint64_t))(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v9)
  {
    while (1)
    {
      uint64_t v26 = v5;
      unint64_t v10 = 0;
      uint64_t v23 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v24 = a1 & 0xC000000000000001;
      uint64_t v21 = v3;
      uint64_t v22 = v6 + 1;
      while (v24)
      {
        uint64_t v11 = (char *)sub_E74E0();
LABEL_10:
        unint64_t v6 = (uint64_t (**)(char *, uint64_t))v11;
        unint64_t v12 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_19;
        }
        unint64_t v13 = a1;
        id v14 = [v11 uuid];
        sub_E6030();

        id v15 = [v25 profileUsageStats];
        type metadata accessor for GCSProfileUsageStats();
        sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v3 = sub_E7050();

        if (*(void *)(v3 + 16))
        {
          unint64_t v16 = sub_6817C((uint64_t)v8);
          if (v17)
          {
            id v18 = *(id *)(*(void *)(v3 + 56) + 8 * v16);
            swift_bridgeObjectRelease();
            uint64_t v19 = (*v22)(v8, v26);
            uint64_t v3 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v18)))(v19);

            if (v3)
            {
              uint64_t v3 = (uint64_t)&v27;
              sub_E7510();
              sub_E7540();
              sub_E7550();
              sub_E7520();
              goto LABEL_6;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            (*v22)(v8, v26);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          (*v22)(v8, v5);
        }

LABEL_6:
        a1 = v13;
        ++v10;
        if (v12 == v9) {
          return v27;
        }
      }
      if (v10 < *(void *)(v23 + 16)) {
        break;
      }
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      uint64_t v9 = sub_E7570();
      if (!v9) {
        return _swiftEmptyArrayStorage;
      }
    }
    uint64_t v11 = (char *)*(id *)(a1 + 8 * v10 + 32);
    goto LABEL_10;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_B0630(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v25 = a2;
  uint64_t v5 = sub_E6050();
  unint64_t v6 = *(uint64_t (***)(char *, uint64_t))(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v27 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v9)
  {
    while (1)
    {
      uint64_t v26 = v5;
      unint64_t v10 = 0;
      uint64_t v23 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v24 = a1 & 0xC000000000000001;
      uint64_t v21 = v3;
      uint64_t v22 = v6 + 1;
      while (v24)
      {
        uint64_t v11 = (char *)sub_E74E0();
LABEL_10:
        unint64_t v6 = (uint64_t (**)(char *, uint64_t))v11;
        unint64_t v12 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_19;
        }
        unint64_t v13 = a1;
        id v14 = [v11 uuid];
        sub_E6030();

        id v15 = [v25 profileUsageStats];
        type metadata accessor for GCSProfileUsageStats();
        sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v3 = sub_E7050();

        if (*(void *)(v3 + 16))
        {
          unint64_t v16 = sub_6817C((uint64_t)v8);
          if (v17)
          {
            id v18 = *(id *)(*(void *)(v3 + 56) + 8 * v16);
            swift_bridgeObjectRelease();
            uint64_t v19 = (*v22)(v8, v26);
            uint64_t v3 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v18)))(v19);

            if ((v3 & 1) == 0)
            {
              uint64_t v3 = (uint64_t)&v27;
              sub_E7510();
              sub_E7540();
              sub_E7550();
              sub_E7520();
              goto LABEL_6;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            (*v22)(v8, v26);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          (*v22)(v8, v5);
        }

LABEL_6:
        a1 = v13;
        ++v10;
        if (v12 == v9) {
          return v27;
        }
      }
      if (v10 < *(void *)(v23 + 16)) {
        break;
      }
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      uint64_t v9 = sub_E7570();
      if (!v9) {
        return _swiftEmptyArrayStorage;
      }
    }
    uint64_t v11 = (char *)*(id *)(a1 + 8 * v10 + 32);
    goto LABEL_10;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_B095C(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      unint64_t v19 = v2;
      unint64_t v4 = 0;
      uint64_t v20 = v2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v21 = v2 & 0xC000000000000001;
      while (v21)
      {
        id v5 = (id)sub_E74E0();
LABEL_9:
        unint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_23;
        }
        id v8 = objc_msgSend(self, "gcController_persistentIdentifier:", v5);
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = sub_E7110();
          uint64_t v12 = v11;
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v12 = 0;
        }
        id v13 = [a2 persistentIdentifier];
        uint64_t v14 = sub_E7110();
        uint64_t v16 = v15;

        if (v12)
        {
          if (v10 == v14 && v12 == v16)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v17 = sub_E7620();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v17 & 1) == 0)
            {

              goto LABEL_5;
            }
          }
          sub_E7510();
          sub_E7540();
          sub_E7550();
          sub_E7520();
        }
        else
        {

          swift_bridgeObjectRelease();
        }
LABEL_5:
        unint64_t v2 = v19;
        ++v4;
        if (v7 == v3) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)(v20 + 16)) {
        break;
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      uint64_t v3 = sub_E7570();
      if (!v3) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

Swift::Int sub_B0B80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10C7C((uint64_t *)&unk_125060);
    uint64_t v3 = sub_E74A0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_E7670();
      swift_bridgeObjectRetain();
      sub_E7170();
      Swift::Int result = sub_E76A0();
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
        if (v17 || (Swift::Int result = sub_E7620(), (result & 1) != 0))
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
            Swift::Int result = sub_E7620();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
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
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_B0D24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_E75B0();
  __break(1u);
  return result;
}

void sub_B0E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  if (a3 != a2)
  {
    uint64_t v7 = a3;
    uint64_t v8 = a1;
    uint64_t v9 = *a4;
    uint64_t v10 = *a4 + 8 * a3 - 8;
LABEL_4:
    unint64_t v11 = *(void **)(v9 + 8 * v7);
    uint64_t v19 = v10;
    while (1)
    {
      unint64_t v21 = v11;
      id v20 = *(id *)v10;
      id v12 = v20;
      id v13 = v11;
      id v14 = v12;
      char v15 = sub_9E92C(&v21, &v20, a5);

      if (v5) {
        break;
      }
      if (v15)
      {
        if (!v9)
        {
          __break(1u);
          return;
        }
        id v16 = *(id *)v10;
        unint64_t v11 = *(void **)(v10 + 8);
        *(void *)uint64_t v10 = v11;
        *(void *)(v10 + 8) = v16;
        v10 -= 8;
        if (v7 != ++v8) {
          continue;
        }
      }
      ++v7;
      uint64_t v10 = v19 + 8;
      uint64_t v8 = a1;
      if (v7 != a2) {
        goto LABEL_4;
      }
      return;
    }
  }
}

void sub_B0F0C(uint64_t *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_E6050();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v172 = (char *)&v161 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v173 = (char *)&v161 - v10;
  v165 = a1;
  Swift::Int v11 = a1[1];
  id v180 = a2;
  Swift::Int v12 = sub_E75F0(v11);
  if (v12 >= v11)
  {
    if (v11 < 0) {
      goto LABEL_157;
    }
    if (v11)
    {
      id v16 = v180;
      sub_B0E18(0, v11, 1, v165, v16);
    }
    else
    {
      id v16 = v180;
    }

    return;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_165;
  }
  Swift::Int v169 = v11;
  Swift::Int v164 = v12;
  if (v11 < 2)
  {
    BOOL v17 = (char *)_swiftEmptyArrayStorage;
    uint64_t v184 = (uint64_t)_swiftEmptyArrayStorage;
    v171 = (id *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v11 != 1)
    {
      unint64_t v87 = _swiftEmptyArrayStorage[2];
LABEL_122:
      uint64_t v166 = v3;
      if (v87 >= 2)
      {
        unint64_t v143 = (void **)*v165;
        v181 = (void **)*v165;
        do
        {
          unint64_t v144 = v87 - 2;
          if (v87 < 2) {
            goto LABEL_151;
          }
          if (!v143) {
            goto LABEL_164;
          }
          uint64_t v145 = (uint64_t)v17;
          uint64_t v146 = *(void *)&v17[16 * v144 + 32];
          uint64_t v147 = *(void *)&v17[16 * v87 + 24];
          v148 = &v143[v146];
          v149 = &v143[*(void *)&v17[16 * v87 + 16]];
          unint64_t v150 = (unint64_t)&v143[v147];
          id v151 = v180;
          uint64_t v152 = v166;
          sub_AD12C(v148, v149, v150, v171, v151);
          uint64_t v166 = v152;
          if (v152) {
            goto LABEL_117;
          }
          if (v147 < v146) {
            goto LABEL_153;
          }
          BOOL v17 = (char *)v145;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            BOOL v17 = sub_21CA4(v145);
          }
          if (v144 >= *((void *)v17 + 2)) {
            goto LABEL_154;
          }
          v153 = &v17[16 * v144 + 32];
          *(void *)v153 = v146;
          *((void *)v153 + 1) = v147;
          unint64_t v154 = *((void *)v17 + 2);
          if (v87 > v154) {
            goto LABEL_155;
          }
          memmove(&v17[16 * v87 + 16], &v17[16 * v87 + 32], 16 * (v154 - v87));
          *((void *)v17 + 2) = v154 - 1;
          unint64_t v87 = v154 - 1;
          unint64_t v143 = v181;
        }
        while (v154 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)((char *)&dword_10 + (v184 & 0xFFFFFFFFFFFFFF8)) = 0;
      sub_E7230();
      v155 = v180;

      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    sub_B3A64(0, (unint64_t *)&qword_124E50);
    uint64_t v15 = sub_E7250();
    *(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8)) = v14;
    v171 = (id *)((v15 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v184 = v15;
  }
  Swift::Int v18 = 0;
  uint64_t v19 = *v165;
  v179 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  uint64_t v162 = v19 + 16;
  uint64_t v163 = v19 - 8;
  BOOL v17 = (char *)_swiftEmptyArrayStorage;
  uint64_t v175 = v19;
  uint64_t v176 = v6;
  Swift::Int v20 = v169;
LABEL_13:
  Swift::Int v21 = v18;
  Swift::Int v22 = v18 + 1;
  Swift::Int v168 = v18;
  if (v18 + 1 < v20)
  {
    BOOL v23 = *(void **)(v19 + 8 * v22);
    id v182 = *(id *)(v19 + 8 * v18);
    id v24 = v182;
    v183[0] = v23;
    id v25 = v23;
    id v26 = v24;
    int v27 = sub_9E92C(v183, &v182, v180);
    if (v3)
    {
      swift_bridgeObjectRelease();

LABEL_118:
      *(void *)((char *)&dword_10 + (v184 & 0xFFFFFFFFFFFFFF8)) = 0;
      sub_E7230();
      uint64_t v142 = v180;

      swift_bridgeObjectRelease();
      return;
    }
    int v28 = v27;

    Swift::Int v22 = v21 + 2;
    Swift::Int v20 = v169;
    if (v21 + 2 < v169)
    {
      Swift::Int v29 = v21;
      unint64_t v30 = v17;
      uint64_t v31 = (void **)(v162 + 8 * v29);
      while (1)
      {
        Swift::Int v32 = v22;
        uint64_t v33 = *v31;
        id v182 = *(v31 - 1);
        id v34 = v182;
        v183[0] = v33;
        id v35 = v33;
        id v36 = v34;
        int v37 = sub_9E92C(v183, &v182, v180);

        if ((v28 ^ v37)) {
          break;
        }
        Swift::Int v22 = v32 + 1;
        ++v31;
        Swift::Int v20 = v169;
        if (v169 == v32 + 1)
        {
          Swift::Int v22 = v169;
          uint64_t v3 = 0;
          BOOL v17 = v30;
          uint64_t v19 = v175;
          goto LABEL_21;
        }
      }
      uint64_t v3 = 0;
      BOOL v17 = v30;
      Swift::Int v20 = v169;
      uint64_t v19 = v175;
      Swift::Int v22 = v32;
LABEL_21:
      Swift::Int v21 = v168;
    }
    if (v28)
    {
      if (v22 < v21) {
        goto LABEL_160;
      }
      if (v21 < v22)
      {
        uint64_t v38 = (uint64_t *)(v163 + 8 * v22);
        Swift::Int v39 = v22;
        Swift::Int v40 = v21;
        int64_t v41 = (uint64_t *)(v19 + 8 * v21);
        do
        {
          if (v40 != --v39)
          {
            if (!v19) {
              goto LABEL_163;
            }
            uint64_t v42 = *v41;
            *int64_t v41 = *v38;
            uint64_t *v38 = v42;
          }
          ++v40;
          --v38;
          ++v41;
        }
        while (v40 < v39);
      }
    }
  }
  if (v22 >= v20) {
    goto LABEL_66;
  }
  if (__OFSUB__(v22, v21)) {
    goto LABEL_156;
  }
  if (v22 - v21 >= v164) {
    goto LABEL_66;
  }
  if (__OFADD__(v21, v164)) {
    goto LABEL_158;
  }
  if (v21 + v164 >= v20) {
    Swift::Int v43 = v20;
  }
  else {
    Swift::Int v43 = v21 + v164;
  }
  if (v43 >= v21)
  {
    if (v22 == v43) {
      goto LABEL_66;
    }
    v161 = v17;
    uint64_t v166 = v3;
    Swift::Int v167 = v43;
    uint64_t v44 = v163 + 8 * v22;
    uint64_t v45 = (uint64_t)v173;
LABEL_43:
    uint64_t v47 = v44;
    os_log_type_t v48 = *(void **)(v19 + 8 * v22);
    Swift::Int v49 = v21;
    uint64_t v170 = v47;
    uint64_t v50 = v47;
    Swift::Int v174 = v22;
    while (1)
    {
      id v51 = *(void **)v50;
      id v52 = v48;
      v181 = v51;
      id v53 = [v52 uuid];
      sub_E6030();

      id v54 = [v180 profileUsageStats];
      type metadata accessor for GCSProfileUsageStats();
      sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v55 = sub_E7050();

      uint64_t v56 = *(void *)(v55 + 16);
      v178 = (void **)v52;
      if (v56 && (unint64_t v57 = sub_6817C(v45), (v58 & 1) != 0))
      {
        uint64_t v59 = v45;
        uint64_t v60 = v6;
        uint64_t v61 = *(id *)(*(void *)(v55 + 56) + 8 * v57);
        swift_bridgeObjectRelease();
        uint64_t v62 = *v179;
        uint64_t v63 = ((uint64_t (*)(uint64_t, uint64_t))*v179)(v59, v60);
        LODWORD(v177) = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v61)))(v63);
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v62 = *v179;
        (*v179)(v45, v6);
        LODWORD(v177) = 0;
        uint64_t v60 = v6;
      }
      id v64 = objc_msgSend(v181, "uuid", v161);
      uint64_t v65 = (uint64_t)v172;
      sub_E6030();

      id v66 = [v180 profileUsageStats];
      uint64_t v67 = sub_E7050();

      if (*(void *)(v67 + 16))
      {
        unint64_t v68 = sub_6817C(v65);
        if (v69)
        {
          uint64_t v70 = *(id *)(*(void *)(v67 + 56) + 8 * v68);
          swift_bridgeObjectRelease();
          uint64_t v6 = v176;
          uint64_t v71 = ((uint64_t (*)(uint64_t, uint64_t))v62)(v65, v176);
          char v72 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.reloff + (swift_isaMask & *v70)))(v71);

          uint64_t v45 = (uint64_t)v173;
          if (v177)
          {
            uint64_t v73 = v178;
            if ((v72 & 1) == 0) {
              goto LABEL_56;
            }
            goto LABEL_58;
          }
          uint64_t v73 = v178;
          if ((v72 & 1) == 0) {
            goto LABEL_58;
          }

LABEL_41:
          Swift::Int v46 = v174;
          uint64_t v19 = v175;
LABEL_42:
          Swift::Int v22 = v46 + 1;
          uint64_t v44 = v170 + 8;
          Swift::Int v21 = v168;
          if (v22 != v167) {
            goto LABEL_43;
          }
          Swift::Int v22 = v167;
          uint64_t v3 = v166;
          BOOL v17 = v161;
LABEL_66:
          if (v22 < v21) {
            goto LABEL_152;
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          Swift::Int v174 = v22;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            BOOL v17 = sub_21BA8(0, *((void *)v17 + 2) + 1, 1, v17);
          }
          unint64_t v86 = *((void *)v17 + 2);
          unint64_t v85 = *((void *)v17 + 3);
          unint64_t v87 = v86 + 1;
          if (v86 >= v85 >> 1) {
            BOOL v17 = sub_21BA8((char *)(v85 > 1), v86 + 1, 1, v17);
          }
          *((void *)v17 + 2) = v87;
          uint64_t v88 = v17 + 32;
          int v89 = &v17[16 * v86 + 32];
          Swift::Int v90 = v174;
          *(void *)int v89 = v21;
          *((void *)v89 + 1) = v90;
          if (v86)
          {
            v177 = v17 + 32;
            while (1)
            {
              unint64_t v91 = v87 - 1;
              if (v87 >= 4)
              {
                uint64_t v96 = &v88[16 * v87];
                uint64_t v97 = *((void *)v96 - 8);
                uint64_t v98 = *((void *)v96 - 7);
                BOOL v102 = __OFSUB__(v98, v97);
                uint64_t v99 = v98 - v97;
                if (v102) {
                  goto LABEL_140;
                }
                uint64_t v101 = *((void *)v96 - 6);
                uint64_t v100 = *((void *)v96 - 5);
                BOOL v102 = __OFSUB__(v100, v101);
                uint64_t v94 = v100 - v101;
                char v95 = v102;
                if (v102) {
                  goto LABEL_141;
                }
                unint64_t v103 = v87 - 2;
                char v104 = &v88[16 * v87 - 32];
                uint64_t v106 = *(void *)v104;
                uint64_t v105 = *((void *)v104 + 1);
                BOOL v102 = __OFSUB__(v105, v106);
                uint64_t v107 = v105 - v106;
                if (v102) {
                  goto LABEL_143;
                }
                BOOL v102 = __OFADD__(v94, v107);
                uint64_t v108 = v94 + v107;
                if (v102) {
                  goto LABEL_146;
                }
                if (v108 >= v99)
                {
                  uint64_t v126 = &v88[16 * v91];
                  uint64_t v128 = *(void *)v126;
                  uint64_t v127 = *((void *)v126 + 1);
                  BOOL v102 = __OFSUB__(v127, v128);
                  uint64_t v129 = v127 - v128;
                  if (v102) {
                    goto LABEL_150;
                  }
                  BOOL v119 = v94 < v129;
                  goto LABEL_104;
                }
              }
              else
              {
                if (v87 != 3)
                {
                  uint64_t v120 = *((void *)v17 + 4);
                  uint64_t v121 = *((void *)v17 + 5);
                  BOOL v102 = __OFSUB__(v121, v120);
                  uint64_t v113 = v121 - v120;
                  char v114 = v102;
                  goto LABEL_98;
                }
                uint64_t v93 = *((void *)v17 + 4);
                uint64_t v92 = *((void *)v17 + 5);
                BOOL v102 = __OFSUB__(v92, v93);
                uint64_t v94 = v92 - v93;
                char v95 = v102;
              }
              if (v95) {
                goto LABEL_142;
              }
              unint64_t v103 = v87 - 2;
              uint64_t v109 = &v88[16 * v87 - 32];
              uint64_t v111 = *(void *)v109;
              uint64_t v110 = *((void *)v109 + 1);
              BOOL v112 = __OFSUB__(v110, v111);
              uint64_t v113 = v110 - v111;
              char v114 = v112;
              if (v112) {
                goto LABEL_145;
              }
              NSString v115 = &v88[16 * v91];
              uint64_t v117 = *(void *)v115;
              uint64_t v116 = *((void *)v115 + 1);
              BOOL v102 = __OFSUB__(v116, v117);
              uint64_t v118 = v116 - v117;
              if (v102) {
                goto LABEL_148;
              }
              if (__OFADD__(v113, v118)) {
                goto LABEL_149;
              }
              if (v113 + v118 >= v94)
              {
                BOOL v119 = v94 < v118;
LABEL_104:
                if (v119) {
                  unint64_t v91 = v103;
                }
                goto LABEL_106;
              }
LABEL_98:
              if (v114) {
                goto LABEL_144;
              }
              v122 = &v88[16 * v91];
              uint64_t v124 = *(void *)v122;
              uint64_t v123 = *((void *)v122 + 1);
              BOOL v102 = __OFSUB__(v123, v124);
              uint64_t v125 = v123 - v124;
              if (v102) {
                goto LABEL_147;
              }
              if (v125 < v113) {
                goto LABEL_115;
              }
LABEL_106:
              unint64_t v130 = v91 - 1;
              if (v91 - 1 >= v87)
              {
                __break(1u);
LABEL_137:
                __break(1u);
LABEL_138:
                __break(1u);
LABEL_139:
                __break(1u);
LABEL_140:
                __break(1u);
LABEL_141:
                __break(1u);
LABEL_142:
                __break(1u);
LABEL_143:
                __break(1u);
LABEL_144:
                __break(1u);
LABEL_145:
                __break(1u);
LABEL_146:
                __break(1u);
LABEL_147:
                __break(1u);
LABEL_148:
                __break(1u);
LABEL_149:
                __break(1u);
LABEL_150:
                __break(1u);
LABEL_151:
                __break(1u);
LABEL_152:
                __break(1u);
LABEL_153:
                __break(1u);
LABEL_154:
                __break(1u);
LABEL_155:
                __break(1u);
LABEL_156:
                __break(1u);
LABEL_157:
                __break(1u);
LABEL_158:
                __break(1u);
                goto LABEL_159;
              }
              if (!v19) {
                goto LABEL_162;
              }
              unint64_t v131 = v17;
              uint64_t v132 = v88;
              unint64_t v133 = &v88[16 * v130];
              uint64_t v134 = *(void *)v133;
              unint64_t v135 = v91;
              unint64_t v136 = &v132[16 * v91];
              uint64_t v137 = *(void *)v136;
              uint64_t v138 = *((void *)v136 + 1);
              v181 = (void **)(v19 + 8 * *(void *)v133);
              v178 = (void **)(v19 + 8 * v137);
              id v139 = v180;
              sub_AD12C(v181, v178, v19 + 8 * v138, v171, v139);
              if (v3)
              {
LABEL_117:
                swift_bridgeObjectRelease();
                goto LABEL_118;
              }
              if (v138 < v134) {
                goto LABEL_137;
              }
              if (v135 > *((void *)v131 + 2)) {
                goto LABEL_138;
              }
              unint64_t v140 = v135;
              *(void *)unint64_t v133 = v134;
              uint64_t v88 = v177;
              *(void *)&v177[16 * v130 + 8] = v138;
              unint64_t v141 = *((void *)v131 + 2);
              if (v140 >= v141) {
                goto LABEL_139;
              }
              BOOL v17 = v131;
              unint64_t v87 = v141 - 1;
              memmove(v136, v136 + 16, 16 * (v141 - 1 - v140));
              *((void *)v17 + 2) = v141 - 1;
              uint64_t v19 = v175;
              uint64_t v6 = v176;
              if (v141 <= 2) {
                goto LABEL_115;
              }
            }
          }
          unint64_t v87 = 1;
LABEL_115:
          Swift::Int v20 = v169;
          Swift::Int v18 = v174;
          if (v174 >= v169) {
            goto LABEL_122;
          }
          goto LABEL_13;
        }
        swift_bridgeObjectRelease();
        uint64_t v6 = v176;
        v62(v65, v176);
      }
      else
      {
        swift_bridgeObjectRelease();
        v62(v65, v60);
        uint64_t v6 = v60;
      }
      uint64_t v45 = (uint64_t)v173;
      uint64_t v73 = v178;
      if (v177)
      {
LABEL_56:

        goto LABEL_61;
      }
LABEL_58:
      id v74 = [v73 name];
      uint64_t v75 = sub_E7110();
      uint64_t v77 = v76;

      id v78 = [v181 name];
      uint64_t v79 = sub_E7110();
      uint64_t v81 = v80;

      if (v75 == v79 && v77 == v81)
      {

        swift_bridgeObjectRelease_n();
        uint64_t v6 = v176;
        goto LABEL_41;
      }
      char v82 = sub_E7620();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v176;
      if ((v82 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_61:
      uint64_t v19 = v175;
      if (!v175) {
        goto LABEL_161;
      }
      id v83 = *(void **)v50;
      os_log_type_t v48 = *(void **)(v50 + 8);
      *(void *)uint64_t v50 = v48;
      *(void *)(v50 + 8) = v83;
      v50 -= 8;
      ++v49;
      Swift::Int v46 = v174;
      if (v174 == v49) {
        goto LABEL_42;
      }
    }
  }
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  v156 = v180;

  __break(1u);
LABEL_162:
  v157 = v180;

  __break(1u);
LABEL_163:
  v158 = v180;

  __break(1u);
LABEL_164:
  v159 = v180;

  __break(1u);
LABEL_165:
  v160 = v180;

  sub_E7560();
  __break(1u);
}

void sub_B1C20(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_AF6B8(v3);
    *a1 = v3;
  }
  uint64_t v6 = *(void *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  id v7 = v4;
  sub_B0F0C(v8, v7);

  sub_E7520();
}

uint64_t sub_B1CC0(void *a1)
{
  id v2 = [self controllers];
  sub_B3A64(0, (unint64_t *)&unk_125030);
  unint64_t v3 = sub_E7210();

  id v4 = a1;
  unint64_t v5 = (unint64_t)sub_B095C(v3, v4);
  swift_bridgeObjectRelease();

  if (!(v5 >> 62))
  {
    uint64_t result = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t result = sub_E7570();
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v7 = (id)sub_E74E0();
    goto LABEL_6;
  }
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)))
  {
    id v7 = *(id *)(v5 + 32);
LABEL_6:
    id v8 = v7;
    swift_bridgeObjectRelease();
    return (uint64_t)v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_B1DE4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = *(void **)(v0 + 24);
  unint64_t v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 games];
  sub_B3A64(0, (unint64_t *)&qword_122828);
  unint64_t v6 = sub_E7210();

  id v7 = v2;
  unint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = sub_B3B54(v8);
  LOBYTE(v2) = v10;

  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    id v11 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
    if (!result || (v6 & 0x8000000000000000) != 0 || (v6 & 0x4000000000000000) != 0)
    {
      uint64_t result = sub_AEFAC(v6);
      unint64_t v6 = result;
    }
    if ((v9 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v9 < *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v13 = *(void **)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8));
      *(void *)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8)) = v11;

      sub_E7230();
      goto LABEL_9;
    }
    __break(1u);
    return result;
  }
LABEL_9:
  if (v4)
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_A9114(v14, (uint64_t)j_nullsub_59, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setGames:isa];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v1)))();
}

uint64_t sub_B1FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_B1FD4()
{
  return swift_release();
}

uint64_t sub_B1FDC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_B2024()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 games];
  sub_B3A64(0, (unint64_t *)&qword_122828);
  uint64_t v5 = sub_E7210();

  id v6 = v2;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  if (v3)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_A9114(v7, (uint64_t)nullsub_59, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setGames:isa];
}

uint64_t sub_B2180()
{
  return sub_A150C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_B2190()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 profiles];
  sub_B3A64(0, (unint64_t *)&qword_124E50);
  unint64_t v6 = sub_E7210();

  id v7 = v2;
  unint64_t v8 = (id *)swift_bridgeObjectRetain();
  unint64_t v9 = sub_B3CC4(v8, v7);
  LOBYTE(v2) = v10;

  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    id v11 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
    if (!result || (v6 & 0x8000000000000000) != 0 || (v6 & 0x4000000000000000) != 0)
    {
      uint64_t result = sub_AEFAC(v6);
      unint64_t v6 = result;
    }
    if ((v9 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v9 < *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v13 = *(void **)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8));
      *(void *)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8)) = v11;

      sub_E7230();
      goto LABEL_9;
    }
    __break(1u);
    return result;
  }
LABEL_9:
  if (v4)
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_A89D4(v14, (uint64_t)j_nullsub_59_1, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setProfiles:isa];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v1)))();
}

uint64_t sub_B2370()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 copilotFusedControllers];
  sub_B3A64(0, (unint64_t *)&unk_124E40);
  uint64_t v5 = sub_E7210();

  id v6 = v2;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  if (v3)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_A893C(v7, (uint64_t)j_nullsub_59_2, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setCopilotFusedControllers:isa];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v1)))();
}

uint64_t sub_B2508()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 profiles];
  sub_B3A64(0, (unint64_t *)&qword_124E50);
  uint64_t v5 = sub_E7210();

  id v6 = v2;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  if (v3)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_A89D4(v7, (uint64_t)j_nullsub_59_4, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setProfiles:isa];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v1)))();
}

uint64_t sub_B26A0()
{
  return sub_A2388(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_B26AC()
{
  return _swift_deallocObject(v0, 33, 7);
}

void sub_B26EC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(unsigned __int8 *)(v0 + 32);
  id v4 = [v1 mouseProfiles];
  sub_B3A64(0, &qword_124E90);
  uint64_t v5 = sub_E7210();

  id v6 = v2;
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v5 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();
  if (v3)
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_A89FC(v7);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setMouseProfiles:isa];
}

void sub_B2830()
{
  sub_A2F78(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

void sub_B2840()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 mouseProfiles];
  sub_B3A64(0, &qword_124E90);
  unint64_t v6 = sub_E7210();

  swift_bridgeObjectRetain();
  sub_A19A8(v2, v6, &qword_124E90);
  unint64_t v8 = v7;
  LOBYTE(v2) = v9;
  swift_bridgeObjectRelease();
  if (v2) {
    goto LABEL_9;
  }
  id v10 = v3;
  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
    || (v6 & 0x8000000000000000) != 0
    || (v6 & 0x4000000000000000) != 0)
  {
    unint64_t v6 = sub_AEFAC(v6);
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v8 >= *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_15:
    __break(1u);
    return;
  }
  id v11 = *(void **)((char *)&stru_20.cmd + 8 * v8 + (v6 & 0xFFFFFFFFFFFFFF8));
  *(void *)((char *)&stru_20.cmd + 8 * v8 + (v6 & 0xFFFFFFFFFFFFFF8)) = v10;

  sub_E7230();
LABEL_9:
  if (v4)
  {
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_A89FC(v12);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setMouseProfiles:isa];
}

void sub_B29D8()
{
  sub_A3708(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_B29E8()
{
  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_B2A30()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  int v3 = *(void **)(v0 + 32);
  int v4 = *(unsigned __int8 *)(v0 + 40);
  id v5 = [v1 allControllers];
  sub_B3A64(0, (unint64_t *)&qword_124E30);
  unint64_t v6 = sub_E7210();

  id v7 = v2;
  unint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = sub_B3EF4(v8, v7);
  LOBYTE(v2) = v10;

  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    id v11 = v3;
    uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
    if (!result || (v6 & 0x8000000000000000) != 0 || (v6 & 0x4000000000000000) != 0)
    {
      uint64_t result = sub_AEFAC(v6);
      unint64_t v6 = result;
    }
    if ((v9 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v9 < *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)))
    {
      uint64_t v13 = *(void **)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8));
      *(void *)((char *)&stru_20.cmd + 8 * v9 + (v6 & 0xFFFFFFFFFFFFFF8)) = v11;

      sub_E7230();
      goto LABEL_9;
    }
    __break(1u);
    return result;
  }
LABEL_9:
  if (v4)
  {
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_A89AC(v14, (uint64_t)j_nullsub_59_7, 0);
    swift_bridgeObjectRelease();
  }
  Class isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();
  [v1 setAllControllers:isa];

  return (*(uint64_t (**)(void))((char *)&stru_248.flags + (swift_isaMask & *v1)))();
}

uint64_t sub_B2C10()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_B2C50()
{
  return sub_A46FC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t type metadata accessor for GCSPreferencesStore()
{
  uint64_t result = qword_129DD0;
  if (!qword_129DD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_B2CA8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_B2CE8()
{
  return (*(uint64_t (**)(void))((char *)&stru_2E8.reloff + (swift_isaMask & **(void **)(v0 + 16))))();
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

void *sub_B2D6C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_B2DB0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_B2DF8()
{
  uint64_t v1 = v0;
  uint64_t v3 = v0[2];
  uint64_t v2 = (char *)v0[3];
  int v4 = (void *)v0[4];
  id v5 = (void *)v1[5];
  if (sub_E7110() == v3 && v6 == v2)
  {
    swift_bridgeObjectRelease();
    return sub_AB900();
  }
  char v8 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v8) {
    return sub_AB900();
  }
  if (sub_E7110() == v3 && v10 == v2)
  {
    swift_bridgeObjectRelease();
    return sub_AB014();
  }
  char v11 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v11) {
    return sub_AB014();
  }
  if (sub_E7110() == v3 && v12 == v2)
  {
    swift_bridgeObjectRelease();
    return sub_AA728();
  }
  char v13 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v13) {
    return sub_AA728();
  }
  if (sub_E7110() == v3 && v14 == v2)
  {
    swift_bridgeObjectRelease();
    return sub_A9E3C();
  }
  char v15 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v15) {
    return sub_A9E3C();
  }
  if (sub_E7110() == v3 && v16 == v2)
  {
    swift_bridgeObjectRelease();
    return sub_AC738();
  }
  char v17 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v17) {
    return sub_AC738();
  }
  if (sub_E7110() == v3 && v18 == v2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  char v19 = sub_E7620();
  swift_bridgeObjectRelease();
  if (v19)
  {
LABEL_32:
    id v20 = [v5 BOOLForKey:@"bluetoothPrefsMenuLongPressAction"];
    uint64_t result = (uint64_t)[v4 longPressMenuOpensLaunchPad];
    if (v20 != result)
    {
      return (uint64_t)[v4 setLongPressMenuOpensLaunchPad:v20];
    }
    return result;
  }
  swift_beginAccess();
  if (qword_124D10 == v3 && off_124D18 == v2 || (sub_E7620() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    NSString v21 = sub_E70D0();
    swift_bridgeObjectRelease();
    unsigned int v22 = [v5 BOOLForKey:v21];

    uint64_t result = (uint64_t)[v4 naturalThumbstickScrollDirection];
    if (v22 == result) {
      return (uint64_t)[v4 setNaturalThumbstickScrollDirection:v22 ^ 1];
    }
  }
  else
  {
    swift_beginAccess();
    if (qword_124D20 == v3 && off_124D28 == (_UNKNOWN *)v2 || (uint64_t result = sub_E7620(), (result & 1) != 0))
    {
      swift_bridgeObjectRetain();
      NSString v23 = sub_E70D0();
      swift_bridgeObjectRelease();
      [v5 doubleForKey:v23];
      double v25 = v24;

      uint64_t result = (uint64_t)[v4 thumbstickScrollingSpeed];
      if (v25 != v26) {
        return (uint64_t)[v4 setThumbstickScrollingSpeed:v25];
      }
    }
  }
  return result;
}

void sub_B3234()
{
  sub_A7624(*(void **)(v0 + 16));
}

void *sub_B323C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_B3248()
{
  return type metadata accessor for GCSPreferencesStore();
}

void sub_B3250()
{
  sub_B35DC(319, &qword_124F10, &qword_124D40);
  if (v0 <= 0x3F)
  {
    sub_B35DC(319, &qword_124F18, &qword_124D58);
    if (v1 <= 0x3F)
    {
      sub_B35DC(319, &qword_124F20, &qword_124D70);
      if (v2 <= 0x3F)
      {
        sub_B35DC(319, &qword_124F28, &qword_123E28);
        if (v3 <= 0x3F)
        {
          sub_B35DC(319, &qword_124F30, &qword_124DA8);
          if (v4 <= 0x3F)
          {
            sub_B35DC(319, &qword_124F38, &qword_124DC0);
            if (v5 <= 0x3F)
            {
              sub_B35DC(319, &qword_124F40, &qword_124BD8);
              if (v6 <= 0x3F)
              {
                sub_B35DC(319, &qword_124F48, &qword_124DF0);
                if (v7 <= 0x3F)
                {
                  sub_B3AFC(319, &qword_124F50, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
                  if (v8 <= 0x3F)
                  {
                    sub_B3AFC(319, &qword_124F58, (uint64_t)&type metadata for Double, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
                    if (v9 <= 0x3F) {
                      swift_updateClassMetadata2();
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_B35DC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_11B60(a3);
    unint64_t v4 = sub_E6190();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_B362C()
{
  return sub_B1FDC(&qword_124F68, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_B3674()
{
  return sub_B1FDC(&qword_124F70, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_B36BC()
{
  return sub_B1FDC(&qword_124F78, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_B3704(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_B376C()
{
  return sub_A94E8(*(void *)(v0 + 16), *(char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), @"games", @"games", "Saving games...", (uint64_t)&unk_116AA8, (uint64_t)sub_B37D0, (uint64_t)&unk_116AC0);
}

uint64_t sub_B37D4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_B3814()
{
  return sub_A8DA8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_B3820()
{
  return sub_A94E8(*(void *)(v0 + 16), *(char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), @"profiles", @"profiles", "Saving profiles...", (uint64_t)&unk_116B98, (uint64_t)sub_B3884, (uint64_t)&unk_116BB0);
}

uint64_t sub_B388C()
{
  return sub_A94E8(*(void *)(v0 + 16), *(char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), @"controllers", @"controllers", "Saving controllers...", (uint64_t)&unk_116C38, (uint64_t)sub_B38F0, (uint64_t)&unk_116C50);
}

uint64_t sub_B38F8()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_B3940()
{
  return sub_A94E8(*(void *)(v0 + 16), *(char **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), @"copilotFusedControllers", @"copilotFusedControllers", "Saving copilot fused controllers...", (uint64_t)&unk_116CD8, (uint64_t)sub_B39E4, (uint64_t)&unk_116CF0);
}

uint64_t sub_B39A4()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_B39E8()
{
  unint64_t v1 = *(uint64_t (**)(uint64_t, void))(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 32);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  }
  return v1(v3, 0);
}

uint64_t sub_B3A64(uint64_t a1, unint64_t *a2)
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

uint64_t sub_B3AA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_B3AFC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_B3B48()
{
  return sub_A1E1C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_B3B54(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v2)
  {
    for (uint64_t i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v4 = (id)sub_E74E0();
      }
      else {
        id v4 = *(id *)(a1 + 8 * i + 32);
      }
      unint64_t v5 = v4;
      uint64_t v6 = GCSGame.id.getter();
      uint64_t v8 = v7;
      if (v6 == GCSGame.id.getter() && v8 == v9)
      {

        swift_bridgeObjectRelease_n();
        return i;
      }
      char v10 = sub_E7620();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v10) {
        return i;
      }
      uint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        break;
      }
      if (v11 == v2) {
        return 0;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_B3CC4(id *a1, void *a2)
{
  uint64_t v3 = v2;
  id v23 = a2;
  uint64_t v5 = sub_E6050();
  uint64_t v6 = *(void (***)(char *, uint64_t))(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v20 - v10;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + ((unint64_t)a1 & 0xFFFFFFFFFFFFFF8));
    if (v12) {
      goto LABEL_3;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_E7570();
  swift_bridgeObjectRelease();
  if (!v12) {
    return 0;
  }
LABEL_3:
  v20[1] = v3;
  NSString v21 = a1;
  uint64_t v13 = 0;
  unint64_t v22 = (unint64_t)a1 & 0xC000000000000001;
  uint64_t v14 = v6 + 1;
  while (1)
  {
    char v15 = v22
        ? (void (**)(char *, uint64_t))sub_E74E0()
        : (void (**)(char *, uint64_t))a1[v13 + 4];
    uint64_t v6 = v15;
    id v16 = [v15 uuid];
    sub_E6030();

    id v17 = [v23 uuid];
    sub_E6030();

    uint64_t v3 = sub_E6020();
    a1 = (id *)*v14;
    (*v14)(v9, v5);
    ((void (*)(char *, uint64_t))a1)(v11, v5);

    if (v3) {
      return v13;
    }
    uint64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    ++v13;
    a1 = v21;
    if (v18 == v12) {
      return 0;
    }
  }
}

uint64_t sub_B3EF4(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (v5)
  {
    uint64_t v6 = 0;
    uint64_t v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)sub_E74E0();
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, "persistentIdentifier", v20);
      uint64_t v10 = sub_E7110();
      uint64_t v12 = v11;

      id v13 = [a2 persistentIdentifier];
      uint64_t v3 = sub_E7110();
      uint64_t v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      char v17 = sub_E7620();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        return v6;
      }
      uint64_t v18 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      ++v6;
      if (v18 == v5) {
        return 0;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_B409C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_B40E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_B4144()
{
  return sub_B1FDC(&qword_123568, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

uint64_t sub_B418C()
{
  return sub_B1FDC((unint64_t *)&unk_1250A0, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

uint64_t sub_B41D4()
{
  return sub_B1FDC(&qword_123570, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

void sub_B421C()
{
}

char *sub_B437C()
{
  uint64_t v1 = sub_10C7C(&qword_125120);
  __chkstk_darwin(v1 - 8);
  Swift::Int v29 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = [v0 persistentIdentifier];
  sub_E7110();

  uint64_t v4 = sub_E7140();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v33 = sub_E6080();
  uint64_t v7 = *(void *)(v33 - 8);
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  unint64_t v32 = 0x80000000000F32A0;
  id v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v30 = v7 + 56;
  uint64_t v31 = v9;
  while (1)
  {
    uint64_t v38 = v4;
    unint64_t v39 = v6;
    uint64_t v36 = 0xD000000000000027;
    unint64_t v37 = v32;
    uint64_t v10 = (uint64_t)v29;
    v31(v29, 1, 1, v33);
    sub_187B0();
    swift_bridgeObjectRetain();
    sub_E7410();
    char v12 = v11;
    sub_B4704(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      break;
    }
    sub_E71E0();
    uint64_t v13 = sub_E7150();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v38 = v4;
    unint64_t v39 = v6;
    uint64_t v36 = v13;
    unint64_t v37 = v15;
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    uint64_t v4 = sub_E73F0();
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v38 = v13;
    unint64_t v39 = v15;
    uint64_t v36 = 45;
    unint64_t v37 = 0xE100000000000000;
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    uint64_t v18 = sub_E73F0();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v38 = v18;
    unint64_t v39 = v20;
    uint64_t v36 = 58;
    unint64_t v37 = 0xE100000000000000;
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    uint64_t v21 = sub_E73F0();
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_3F588(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v25 = *((void *)v8 + 2);
    unint64_t v24 = *((void *)v8 + 3);
    if (v25 >= v24 >> 1) {
      uint64_t v8 = sub_3F588((char *)(v24 > 1), v25 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v25 + 1;
    double v26 = &v8[16 * v25];
    *((void *)v26 + 4) = v21;
    *((void *)v26 + 5) = v23;
    unint64_t v6 = v17;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)v8 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_B4704(uint64_t a1)
{
  uint64_t v2 = sub_10C7C(&qword_125120);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Class sub_B477C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();

  if (v5)
  {
    v6.super.Class isa = sub_E7200().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }

  return v6.super.isa;
}

char *sub_B47F0()
{
  uint64_t v1 = sub_10C7C(&qword_125120);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [v0 persistentIdentifier];
  sub_E7110();

  uint64_t v5 = sub_E7140();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_E6080();
  uint64_t v8 = *(void *)(v24 - 8);
  id v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v22[1] = v8 + 56;
  uint64_t v23 = v9;
  uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  v22[0] = 0x80000000000F32D0;
  while (1)
  {
    uint64_t v29 = v5;
    uint64_t v30 = v7;
    unint64_t v27 = 0xD00000000000003ELL;
    uint64_t v28 = v22[0];
    v23(v3, 1, 1, v24);
    sub_187B0();
    swift_bridgeObjectRetain();
    sub_E7410();
    char v12 = v11;
    sub_B4704((uint64_t)v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      break;
    }
    sub_E71E0();
    uint64_t v13 = sub_E7150();
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_3F588(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v17 = *((void *)v10 + 2);
    unint64_t v16 = *((void *)v10 + 3);
    if (v17 >= v16 >> 1) {
      uint64_t v10 = sub_3F588((char *)(v16 > 1), v17 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v17 + 1;
    uint64_t v18 = &v10[16 * v17];
    *((void *)v18 + 4) = v13;
    *((void *)v18 + 5) = v15;
    uint64_t v29 = v5;
    uint64_t v30 = v7;
    unint64_t v27 = v13;
    uint64_t v28 = v15;
    uint64_t v25 = 0;
    unint64_t v26 = 0xE000000000000000;
    uint64_t v5 = sub_E73F0();
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = v20;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)v10 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

id sub_B4B20()
{
  return sub_B4B98(1952867692, 0xE400000000000000);
}

id sub_B4B84()
{
  return sub_B4B98(0x7468676972, 0xE500000000000000);
}

id sub_B4B98(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  id v6 = [v2 miscellaneous];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  sub_10C7C(&qword_125188);
  uint64_t v8 = sub_E7050();

  id v9 = [v5 productCategoryKey];
  uint64_t v10 = sub_E7110();
  uint64_t v12 = v11;

  if (v10 == 0xD000000000000021 && v12 == 0x80000000000F3310)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v13 = sub_E7620();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  if (!*(void *)(v8 + 16)) {
    goto LABEL_10;
  }
  sub_21CB8(a1, a2);
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain();
  sub_10C7C(&qword_125190);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  id v15 = sub_B4F30(v17);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return v15;
}

uint64_t sub_B4E34()
{
  id v1 = [v0 productCategoryKey];
  uint64_t v2 = sub_E7110();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000021 && v4 == 0x80000000000F3310)
  {
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else
  {
    char v6 = sub_E7620();
    swift_bridgeObjectRelease();
    char v5 = v6 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_B4EEC@<X0>(uint64_t *a1@<X8>)
{
  sub_3CBE0();
  uint64_t result = sub_E74D0();
  *a1 = result;
  return result;
}

id sub_B4F30(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v2 = sub_21CB8(0x726F6C6F63, 0xE500000000000000);
  if ((v3 & 1) == 0) {
    return 0;
  }
  sub_23C30(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v20);
  sub_428D8(v20, v21);
  sub_23C30((uint64_t)v21, (uint64_t)v20);
  sub_10C7C(&qword_125198);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_13;
  }
  if (!*(void *)(v19 + 16)
    || (unint64_t v4 = sub_21CB8(6579570, 0xE300000000000000), (v5 & 1) == 0)
    || !*(void *)(v19 + 16)
    || (uint64_t v6 = *(void *)(*(void *)(v19 + 56) + 8 * v4),
        unint64_t v7 = sub_21CB8(0x6E65657267, 0xE500000000000000),
        (v8 & 1) == 0))
  {
    sub_23BE0((uint64_t)v21);
    swift_bridgeObjectRelease();
    return 0;
  }
  if (!*(void *)(v19 + 16)
    || (uint64_t v9 = *(void *)(*(void *)(v19 + 56) + 8 * v7),
        unint64_t v10 = sub_21CB8(1702194274, 0xE400000000000000),
        (v11 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_13:
    sub_23BE0((uint64_t)v21);
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(v19 + 56) + 8 * v10);
  swift_bridgeObjectRelease();
  id v13 = objc_allocWithZone((Class)GCColor);
  *(float *)&double v14 = (float)v6 / 255.0;
  *(float *)&double v15 = (float)v9 / 255.0;
  *(float *)&double v16 = (float)v12 / 255.0;
  id v17 = [v13 initWithRed:v14 green:v15 blue:v16];
  sub_23BE0((uint64_t)v21);
  return v17;
}

void *sub_B50E4()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_B50F4()
{
  sub_E6D10();
  return v1;
}

double sub_B5130()
{
  return 1.0;
}

uint64_t sub_B513C()
{
  return 0;
}

uint64_t sub_B5148()
{
  sub_E6D10();
  return v1;
}

uint64_t sub_B5184()
{
  return 0;
}

uint64_t sub_B518C()
{
  sub_E6F50();
  uint64_t v0 = sub_E6F40();
  swift_release();
  return v0;
}

uint64_t sub_B51D0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_E65D0();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_10C7C(&qword_1251A0);
  return sub_B521C(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t sub_B521C@<X0>(long long *a1@<X0>, char *a2@<X8>)
{
  uint64_t v71 = sub_E66A0();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  char v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10C7C(&qword_1251B8);
  uint64_t v68 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  unint64_t v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10C7C(&qword_1251C0);
  uint64_t v72 = *(void *)(v8 - 8);
  uint64_t v73 = v8;
  __chkstk_darwin(v8);
  uint64_t v76 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10C7C(&qword_1251C8);
  uint64_t v74 = *(void *)(v10 - 8);
  uint64_t v75 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  id v78 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v77 = (char *)&v62 - v13;
  uint64_t v14 = sub_10C7C(&qword_1251D0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  id v17 = (uint64_t *)((char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v15);
  uint64_t v82 = (uint64_t)&v62 - v18;
  uint64_t v81 = sub_E6560();
  uint64_t v80 = sub_E65D0();
  sub_B5C28(a1, (uint64_t)v106);
  char v109 = 0;
  *(_OWORD *)((char *)&v108[8] + 7) = v106[8];
  *(_OWORD *)((char *)&v108[9] + 7) = v106[9];
  *(_OWORD *)((char *)&v108[10] + 7) = v106[10];
  *(void *)((char *)&v108[11] + 7) = v107;
  *(_OWORD *)((char *)&v108[4] + 7) = v106[4];
  *(_OWORD *)((char *)&v108[5] + 7) = v106[5];
  *(_OWORD *)((char *)&v108[6] + 7) = v106[6];
  *(_OWORD *)((char *)&v108[7] + 7) = v106[7];
  *(_OWORD *)((char *)v108 + 7) = v106[0];
  *(_OWORD *)((char *)&v108[1] + 7) = v106[1];
  *(_OWORD *)((char *)&v108[2] + 7) = v106[2];
  *(_OWORD *)((char *)&v108[3] + 7) = v106[3];
  int v79 = 0;
  long long v119 = v108[8];
  long long v120 = v108[9];
  v121[0] = v108[10];
  *(_OWORD *)((char *)v121 + 15) = *(_OWORD *)((char *)&v108[10] + 15);
  long long v115 = v108[4];
  long long v116 = v108[5];
  long long v117 = v108[6];
  long long v118 = v108[7];
  long long v111 = v108[0];
  long long v112 = v108[1];
  long long v113 = v108[2];
  long long v114 = v108[3];
  char v110 = 1;
  int v89 = &type metadata for GameController;
  unint64_t v90 = sub_B69F4();
  char v19 = sub_E60A0();
  sub_7E3E4((uint64_t)&v86);
  if (v19)
  {
    sub_E6590();
    uint64_t v65 = sub_E6910();
    uint64_t v66 = v20;
    uint64_t v63 = v21;
    int v64 = v22 & 1;
    long long v23 = a1[1];
    long long v105 = *a1;
    uint64_t v67 = v17;
    long long v104 = v23;
    long long v103 = a1[2];
    uint64_t v24 = (_OWORD *)swift_allocObject();
    long long v25 = a1[1];
    v24[1] = *a1;
    v24[2] = v25;
    v24[3] = a1[2];
    sub_B6C8C((uint64_t)&v105);
    sub_B6C8C((uint64_t)&v104);
    sub_B6C8C((uint64_t)&v103);
    sub_10C7C(&qword_1251F0);
    sub_B6CB8(&qword_1251F8, &qword_1251F0);
    sub_E6D80();
    sub_E6690();
    uint64_t v26 = sub_B6CB8(&qword_125200, &qword_1251B8);
    uint64_t v27 = sub_B6CFC((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
    uint64_t v28 = v70;
    uint64_t v29 = v71;
    sub_E6990();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v5, v29);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v7, v28);
    long long v83 = v103;
    sub_10C7C(&qword_122A50);
    sub_E6D40();
    LODWORD(v69) = v88;
    type metadata accessor for GCSControllerPairingHelpView();
    uint64_t v86 = v28;
    uint64_t v87 = v29;
    uint64_t v88 = v26;
    int v89 = (ValueMetadata *)v27;
    swift_getOpaqueTypeConformance2();
    sub_B6CFC(&qword_125208, (void (*)(uint64_t))type metadata accessor for GCSControllerPairingHelpView);
    uint64_t v30 = v78;
    uint64_t v31 = v73;
    unint64_t v32 = v76;
    sub_E6A60();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v32, v31);
    uint64_t v34 = v74;
    uint64_t v33 = v75;
    unint64_t v35 = v77;
    (*(void (**)(char *, char *, uint64_t))(v74 + 32))(v77, v30, v75);
    uint64_t v36 = *(void (**)(void, void, void))(v34 + 16);
    v36(v30, v35, v33);
    uint64_t v37 = v66;
    uint64_t v38 = v67;
    uint64_t v76 = a2;
    uint64_t v39 = v65;
    uint64_t v40 = v63;
    *uint64_t v67 = v65;
    v38[1] = v40;
    char v41 = v64;
    *((unsigned char *)v38 + 16) = v64;
    v38[3] = v37;
    uint64_t v42 = (char *)v38 + *(int *)(sub_10C7C(&qword_125210) + 48);
    Swift::Int v43 = v78;
    v36(v42, v78, v33);
    sub_18804(v39, v40, v41);
    uint64_t v44 = *(void (**)(void, void))(v34 + 8);
    swift_bridgeObjectRetain();
    v44(v77, v33);
    v44(v43, v33);
    uint64_t v45 = v39;
    a2 = v76;
    sub_18814(v45, v40, v41);
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_10C7C(&qword_1251E0);
    uint64_t v47 = (uint64_t)v67;
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v67, 0, 1, v46);
    sub_B6DF8(v47, v82, &qword_1251D0);
  }
  else
  {
    uint64_t v48 = sub_10C7C(&qword_1251E0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v82, 1, 1, v48);
    uint64_t v47 = (uint64_t)v17;
  }
  uint64_t v49 = v82;
  sub_B6A48(v82, v47);
  id v51 = (ValueMetadata *)v80;
  uint64_t v50 = v81;
  long long v83 = (unint64_t)v81;
  LOBYTE(v84) = 1;
  *(_DWORD *)((char *)&v84 + 1) = v122[0];
  DWORD1(v84) = *(_DWORD *)((char *)v122 + 3);
  *((void *)&v84 + 1) = v80;
  *(void *)unint64_t v85 = 0x4024000000000000;
  char v52 = v79;
  v85[8] = v79;
  *(_OWORD *)&v85[137] = v119;
  *(_OWORD *)&v85[153] = v120;
  *(_OWORD *)&v85[169] = v121[0];
  *(_OWORD *)&v85[184] = *(_OWORD *)((char *)v121 + 15);
  *(_OWORD *)&v85[73] = v115;
  *(_OWORD *)&v85[89] = v116;
  *(_OWORD *)&v85[105] = v117;
  *(_OWORD *)&v85[121] = v118;
  *(_OWORD *)&v85[9] = v111;
  *(_OWORD *)&v85[25] = v112;
  *(_OWORD *)&v85[41] = v113;
  *(_OWORD *)&v85[57] = v114;
  long long v53 = *(_OWORD *)&v85[176];
  *((_OWORD *)a2 + 12) = *(_OWORD *)&v85[160];
  *((_OWORD *)a2 + 13) = v53;
  *((void *)a2 + 28) = *(void *)&v85[192];
  long long v54 = *(_OWORD *)&v85[112];
  *((_OWORD *)a2 + 8) = *(_OWORD *)&v85[96];
  *((_OWORD *)a2 + 9) = v54;
  long long v55 = *(_OWORD *)&v85[144];
  *((_OWORD *)a2 + 10) = *(_OWORD *)&v85[128];
  *((_OWORD *)a2 + 11) = v55;
  long long v56 = *(_OWORD *)&v85[48];
  *((_OWORD *)a2 + 4) = *(_OWORD *)&v85[32];
  *((_OWORD *)a2 + 5) = v56;
  long long v57 = *(_OWORD *)&v85[80];
  *((_OWORD *)a2 + 6) = *(_OWORD *)&v85[64];
  *((_OWORD *)a2 + 7) = v57;
  long long v58 = v84;
  *(_OWORD *)a2 = v83;
  *((_OWORD *)a2 + 1) = v58;
  long long v59 = *(_OWORD *)&v85[16];
  *((_OWORD *)a2 + 2) = *(_OWORD *)v85;
  *((_OWORD *)a2 + 3) = v59;
  uint64_t v60 = sub_10C7C(&qword_1251E8);
  sub_B6A48(v47, (uint64_t)&a2[*(int *)(v60 + 48)]);
  sub_B6AB0((uint64_t)&v83);
  sub_B6D44(v49, &qword_1251D0);
  sub_B6D44(v47, &qword_1251D0);
  long long v100 = v119;
  long long v101 = v120;
  *(_OWORD *)BOOL v102 = v121[0];
  *(_OWORD *)&v102[15] = *(_OWORD *)((char *)v121 + 15);
  long long v96 = v115;
  long long v97 = v116;
  long long v98 = v117;
  long long v99 = v118;
  long long v92 = v111;
  long long v93 = v112;
  long long v94 = v113;
  uint64_t v86 = v50;
  uint64_t v87 = 0;
  LOBYTE(v88) = 1;
  *(_DWORD *)((char *)&v88 + 1) = v122[0];
  HIDWORD(v88) = *(_DWORD *)((char *)v122 + 3);
  int v89 = v51;
  unint64_t v90 = 0x4024000000000000;
  char v91 = v52;
  long long v95 = v114;
  return sub_B6B4C((uint64_t)&v86);
}

uint64_t sub_B5C28@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = sub_E6C40();
  uint64_t v4 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v6 = &v39[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_E6C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v39[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_E6C30();
  (*(void (**)(unsigned char *, void, uint64_t))(v8 + 104))(v10, enum case for Image.Interpolation.high(_:), v7);
  sub_E6C60();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v11 = v48;
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v48);
  uint64_t v44 = sub_E6C90();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v11);
  sub_E6F30();
  sub_E62A0();
  LOBYTE(v7) = v54;
  LOBYTE(v6) = v56;
  uint64_t v45 = v53;
  uint64_t v46 = v57;
  uint64_t v47 = v55;
  uint64_t v48 = v58;
  long long v61 = *a1;
  long long v81 = *a1;
  sub_10C7C(&qword_125228);
  sub_E6D20();
  uint64_t v12 = v69[0];
  sub_E6FB0();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  sub_E6F50();
  uint64_t v17 = sub_E6F40();
  uint64_t v43 = v17;
  swift_release();
  long long v81 = v61;
  sub_E6D20();
  uint64_t v18 = v69[0];
  long long v19 = a1[1];
  long long v59 = a1[2];
  long long v60 = v19;
  uint64_t v20 = (_OWORD *)swift_allocObject();
  long long v21 = a1[1];
  v20[1] = *a1;
  _OWORD v20[2] = v21;
  v20[3] = a1[2];
  unsigned __int8 v68 = 1;
  unsigned __int8 v65 = v7;
  unsigned __int8 v63 = v6;
  sub_B6C8C((uint64_t)&v61);
  sub_B6C8C((uint64_t)&v60);
  sub_B6C8C((uint64_t)&v59);
  *(void *)&long long v81 = sub_B7108(0xD000000000000017, (void *)0x80000000000F33C0);
  *((void *)&v81 + 1) = v22;
  sub_187B0();
  uint64_t v23 = sub_E6920();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  int v51 = v66;
  __int16 v52 = v67;
  int v40 = v68;
  int v41 = v65;
  v50[0] = *(_DWORD *)v64;
  *(_DWORD *)((char *)v50 + 3) = *(_DWORD *)&v64[3];
  int v42 = v63;
  v49[0] = *(_DWORD *)v62;
  *(_DWORD *)((char *)v49 + 3) = *(_DWORD *)&v62[3];
  uint64_t v28 = v44;
  v69[0] = v44;
  v69[1] = 0;
  LOWORD(v70) = v68;
  WORD3(v70) = v67;
  *(_DWORD *)((char *)&v70 + 2) = v66;
  *((void *)&v70 + 1) = v45;
  LOBYTE(v71) = v65;
  DWORD1(v71) = *(_DWORD *)&v64[3];
  *(_DWORD *)((char *)&v71 + 1) = *(_DWORD *)v64;
  *((void *)&v71 + 1) = v47;
  LOBYTE(v72) = v63;
  DWORD1(v72) = *(_DWORD *)&v62[3];
  *(_DWORD *)((char *)&v72 + 1) = *(_DWORD *)v62;
  *((void *)&v72 + 1) = v46;
  *(void *)&long long v73 = v48;
  *((void *)&v73 + 1) = v12;
  *(void *)&long long v74 = v12;
  *((void *)&v74 + 1) = v14;
  *(void *)&long long v75 = v16;
  *((void *)&v75 + 1) = v17;
  *(void *)&long long v76 = v18;
  *((void *)&v76 + 1) = sub_B6F00;
  long long v77 = (unint64_t)v20;
  uint64_t v78 = 0;
  long long v29 = v70;
  *(_OWORD *)a2 = (unint64_t)v44;
  *(_OWORD *)(a2 + 16) = v29;
  long long v30 = v71;
  long long v31 = v72;
  long long v32 = v74;
  *(_OWORD *)(a2 + 64) = v73;
  *(_OWORD *)(a2 + 80) = v32;
  *(_OWORD *)(a2 + 32) = v30;
  *(_OWORD *)(a2 + 48) = v31;
  long long v33 = v75;
  long long v34 = v76;
  long long v35 = v77;
  *(_DWORD *)(a2 + 169) = *(_DWORD *)v79;
  *(_DWORD *)(a2 + 172) = *(_DWORD *)&v79[3];
  uint64_t v36 = v78;
  *(_OWORD *)(a2 + 112) = v34;
  *(_OWORD *)(a2 + 128) = v35;
  *(_OWORD *)(a2 + 96) = v33;
  char v80 = v26 & 1;
  *(void *)(a2 + 144) = v36;
  *(void *)(a2 + 152) = v23;
  *(void *)(a2 + 160) = v24;
  *(unsigned char *)(a2 + 168) = v26 & 1;
  *(void *)(a2 + 176) = v37;
  sub_B6F08((uint64_t)v69);
  sub_18804(v23, v25, v27);
  swift_bridgeObjectRetain();
  sub_18814(v23, v25, v27);
  swift_bridgeObjectRelease();
  long long v81 = (unint64_t)v28;
  char v82 = v40;
  char v83 = 0;
  int v84 = v51;
  __int16 v85 = v52;
  uint64_t v86 = v45;
  char v87 = v41;
  *(_DWORD *)uint64_t v88 = v50[0];
  *(_DWORD *)&v88[3] = *(_DWORD *)((char *)v50 + 3);
  uint64_t v89 = v47;
  char v90 = v42;
  *(_DWORD *)char v91 = v49[0];
  *(_DWORD *)&v91[3] = *(_DWORD *)((char *)v49 + 3);
  uint64_t v92 = v46;
  uint64_t v93 = v48;
  uint64_t v94 = v12;
  uint64_t v95 = v12;
  uint64_t v96 = v14;
  uint64_t v97 = v16;
  uint64_t v98 = v43;
  uint64_t v99 = v18;
  long long v100 = sub_B6F00;
  long long v101 = v20;
  uint64_t v103 = 0;
  uint64_t v102 = 0;
  return sub_B6F70((uint64_t)&v81);
}

uint64_t sub_B61F0()
{
  sub_10C7C(&qword_122A50);
  uint64_t result = sub_E6D20();
  if (v2 == 1)
  {
    sub_E6F50();
    sub_E6F40();
    uint64_t v1 = swift_release();
    __chkstk_darwin(v1);
    sub_E62D0();
    return swift_release();
  }
  return result;
}

__n128 sub_B62D0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_E6560();
  sub_B6334((uint64_t)&v8);
  char v3 = v9;
  uint64_t v4 = v11;
  uint64_t v5 = v12;
  __n128 result = v10;
  long long v7 = v8;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 40) = v3;
  *(__n128 *)(a1 + 48) = result;
  *(void *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v5;
  return result;
}

uint64_t sub_B6334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10C7C(&qword_125218);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_E6870();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_B7108(0x505F4F545F574F48, (void *)0xEB00000000524941);
  uint64_t v25 = v9;
  sub_187B0();
  uint64_t v10 = sub_E6920();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v23 = sub_E6C30();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Font.TextStyle.footnote(_:), v5);
  uint64_t v17 = sub_E67D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 1, 1, v17);
  sub_E6820();
  sub_B6D44((uint64_t)v4, &qword_125218);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_E6800();
  uint64_t v18 = sub_E6840();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v16;
  uint64_t v20 = v23;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v20;
  *(void *)(a1 + 40) = KeyPath;
  *(void *)(a1 + 48) = v18;
  sub_18804(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_18814(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_B65C4@<X0>(uint64_t a1@<X8>)
{
  sub_E6D10();
  sub_E6D10();
  uint64_t result = sub_E6D10();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = v4;
  return result;
}

uint64_t sub_B6680()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B66A4()
{
  return sub_E69D0();
}

uint64_t sub_B66C0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_E65D0();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_10C7C(&qword_1251A0);
  return sub_B521C(v1, (char *)(a1 + *(int *)(v3 + 44)));
}

uint64_t initializeBufferWithCopyOfBuffer for GCSControllerEmptyView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GCSControllerEmptyView()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for GCSControllerEmptyView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GCSControllerEmptyView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GCSControllerEmptyView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSControllerEmptyView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSControllerEmptyView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for GCSControllerEmptyView()
{
  return &type metadata for GCSControllerEmptyView;
}

uint64_t sub_B69B8()
{
  return sub_B6CB8(&qword_1251A8, &qword_1251B0);
}

unint64_t sub_B69F4()
{
  unint64_t result = qword_1251D8;
  if (!qword_1251D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1251D8);
  }
  return result;
}

uint64_t sub_B6A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10C7C(&qword_1251D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_B6AB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 184);
  uint64_t v4 = *(void *)(a1 + 200);
  uint64_t v5 = *(void *)(a1 + 208);
  char v6 = *(unsigned char *)(a1 + 216);
  swift_retain();
  swift_retain();
  sub_4F628(v2);
  sub_4F628(v3);
  sub_18804(v4, v5, v6);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_B6B4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 184);
  uint64_t v4 = *(void *)(a1 + 200);
  uint64_t v5 = *(void *)(a1 + 208);
  char v6 = *(unsigned char *)(a1 + 216);
  swift_release();
  swift_release();
  sub_4F680(v2);
  sub_4F680(v3);
  sub_18814(v4, v5, v6);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_B6BEC()
{
  long long v2 = *(_OWORD *)(v0 + 48);
  sub_B6DF8((uint64_t)&v2 + 8, (uint64_t)v3, &qword_125220);
  sub_B6E5C((uint64_t)v3);
  sub_10C7C(&qword_122A50);
  sub_E6D20();
  sub_E6D30();
  return sub_B6E88((uint64_t)&v2);
}

uint64_t sub_B6C8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_B6CB8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_B6CFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_B6D44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_B6DA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_E64B0();
  *a1 = result;
  return result;
}

uint64_t sub_B6DCC()
{
  return sub_E64C0();
}

uint64_t sub_B6DF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_B6E5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_B6E88(uint64_t a1)
{
  return a1;
}

uint64_t sub_B6EB8()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_B6F00()
{
  return sub_B61F0();
}

uint64_t sub_B6F08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 136);
  swift_retain();
  swift_retain();
  sub_4F628(v2);
  sub_4F628(v3);
  return a1;
}

uint64_t sub_B6F70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 136);
  swift_release();
  swift_release();
  sub_4F680(v2);
  sub_4F680(v3);
  return a1;
}

uint64_t sub_B6FD8()
{
  return sub_E6D30();
}

id sub_B703C()
{
  NSString v0 = sub_E70D0();
  uint64_t v1 = self;
  id v2 = [v1 bundleWithIdentifier:v0];

  if (v2) {
    return v2;
  }
  id v4 = [v1 mainBundle];

  return v4;
}

unint64_t sub_B70EC()
{
  return 0xD000000000000023;
}

uint64_t sub_B7108(uint64_t a1, void *a2)
{
  NSString v4 = sub_E70D0();
  uint64_t v5 = self;
  char v6 = (objc_class *)[v5 bundleWithIdentifier:v4];

  if (!v6) {
    char v6 = (objc_class *)[v5 mainBundle];
  }
  v10._countAndFlagsBits = (uint64_t)a2;
  v11._countAndFlagsBits = a1;
  v11._object = a2;
  v12.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v12.value._object = (void *)0xEB00000000656C62;
  v7.super.Class isa = v6;
  v13._countAndFlagsBits = a1;
  v13._object = a2;
  uint64_t v8 = sub_E5EF0(v11, v12, v7, v13, v10);

  return v8;
}

Swift::String __swiftcall String.localized(with:)(Swift::OpaquePointer with)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  NSString v5 = sub_E70D0();
  char v6 = self;
  NSBundle v7 = (objc_class *)[v6 bundleWithIdentifier:v5];

  if (!v7) {
    NSBundle v7 = (objc_class *)[v6 mainBundle];
  }
  v15._countAndFlagsBits = (uint64_t)v3;
  v16._countAndFlagsBits = v4;
  v16._object = v3;
  v17.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v17.value._object = (void *)0xEB00000000656C62;
  v8.super.Class isa = v7;
  v18._countAndFlagsBits = v4;
  v18._object = v3;
  sub_E5EF0(v16, v17, v8, v18, v15);

  uint64_t v9 = sub_E70E0();
  Swift::String v11 = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = v9;
  Swift::String v13 = v11;
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

uint64_t sub_B7324()
{
  type metadata accessor for GCSPreferencesStore();
  sub_BA9C4((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);

  return sub_E63F0();
}

uint64_t (*sub_B73A0())()
{
  return sub_B73BC;
}

uint64_t sub_B73BC()
{
  return sub_4DE60();
}

id sub_B73E8()
{
  return *(id *)(v0 + 40);
}

uint64_t sub_B73F0()
{
  sub_10C7C(&qword_122890);
  sub_E6DE0();
  return v1;
}

uint64_t sub_B7440()
{
  return sub_E6DF0();
}

void (*sub_B7494(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 64);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_18AF0((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_10C7C(&qword_122890);
  sub_E6DE0();
  return sub_B7538;
}

void sub_B7538(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  char v3 = *(unsigned char *)(*(void *)a1 + 18);
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(*(void *)a1 + 19);
  void *v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v4;
  *((unsigned char *)v1 + 16) = v5;
  *((unsigned char *)v1 + 17) = v3;
  sub_E6DF0();
  sub_18B48(v2);
  swift_release();

  free(v1);
}

uint64_t sub_B75AC()
{
  sub_10C7C(&qword_122890);
  sub_E6E10();
  return v1;
}

uint64_t sub_B7600()
{
  sub_10C7C(&qword_1237E0);
  sub_E6D10();
  return v1;
}

void *sub_B7640()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_B764C()
{
  sub_E6D10();
  return v1;
}

uint64_t sub_B7688()
{
  return 0;
}

uint64_t sub_B7694@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v25 = sub_E6640();
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_E6650();
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  __chkstk_darwin(v5);
  NSBundle v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10C7C(&qword_125230);
  uint64_t v26 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v1;
  v23[1] = sub_10C7C(&qword_125238);
  uint64_t v10 = sub_11B60(&qword_125240);
  uint64_t v11 = sub_11B60(&qword_125248);
  uint64_t v12 = sub_11B60(&qword_125250);
  uint64_t v13 = sub_11B60(&qword_125258);
  unint64_t v14 = sub_B8368();
  unint64_t v15 = sub_187B0();
  uint64_t v33 = v13;
  long long v34 = &type metadata for String;
  unint64_t v35 = v14;
  unint64_t v36 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v12;
  long long v34 = (void *)OpaqueTypeConformance2;
  uint64_t v17 = swift_getOpaqueTypeConformance2();
  uint64_t v18 = sub_11B60(&qword_122CA8);
  uint64_t v19 = sub_BA668(&qword_125298, &qword_122CA8);
  uint64_t v33 = v18;
  long long v34 = (void *)v19;
  uint64_t v20 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v10;
  long long v34 = (void *)v11;
  unint64_t v35 = v17;
  unint64_t v36 = v20;
  swift_getOpaqueTypeConformance2();
  sub_E6310();
  long long v31 = *(_OWORD *)(v1 + 88);
  uint64_t v32 = *(void *)(v1 + 104);
  sub_10C7C(&qword_122CB8);
  sub_E6D40();
  sub_E6630();
  sub_E6620();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
  sub_BA668(&qword_1252A0, &qword_125230);
  uint64_t v21 = v24;
  sub_E6980();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v9, v21);
}

uint64_t sub_B7AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = sub_E6540();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  __chkstk_darwin(v3);
  int v66 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_E66C0();
  uint64_t v57 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10C7C(&qword_125278);
  uint64_t v54 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_10C7C(&qword_1252A8);
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10C7C(&qword_125270);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_10C7C(&qword_125258);
  __chkstk_darwin(v59);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10C7C(&qword_125250);
  uint64_t v63 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  long long v60 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10C7C(&qword_125240);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v64 = v19;
  uint64_t v65 = v20;
  __chkstk_darwin(v19);
  long long v61 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = a1;
  sub_10C7C(&qword_1252B0);
  sub_B9CAC();
  sub_E6890();
  sub_E66B0();
  sub_BA668(&qword_125280, &qword_125278);
  sub_BA9C4(&qword_122D10, (void (*)(uint64_t))&type metadata accessor for InsetGroupedFormStyle);
  uint64_t v22 = v7;
  uint64_t v23 = v55;
  sub_E6A90();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v6, v23);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v9, v22);
  long long v72 = *(_OWORD *)(a1 + 88);
  unint64_t v73 = *(void *)(a1 + 104);
  sub_10C7C(&qword_122CB8);
  sub_E6D20();
  uint64_t v24 = v75;
  uint64_t v25 = v76;
  uint64_t v26 = (_OWORD *)swift_allocObject();
  long long v27 = *(_OWORD *)(a1 + 80);
  v26[5] = *(_OWORD *)(a1 + 64);
  v26[6] = v27;
  v26[7] = *(_OWORD *)(a1 + 96);
  long long v28 = *(_OWORD *)(a1 + 16);
  v26[1] = *(_OWORD *)a1;
  v26[2] = v28;
  long long v29 = *(_OWORD *)(a1 + 48);
  v26[3] = *(_OWORD *)(a1 + 32);
  v26[4] = v29;
  uint64_t v30 = v56;
  uint64_t v31 = v58;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v15, v11, v58);
  uint64_t v32 = &v15[*(int *)(v13 + 44)];
  *(void *)uint64_t v32 = v24;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = sub_B9D48;
  *((void *)v32 + 3) = v26;
  sub_B9F68(a1);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v31);
  uint64_t v33 = (uint64_t (*)())swift_allocObject();
  long long v34 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v33 + 5) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v33 + 6) = v34;
  *((_OWORD *)v33 + 7) = *(_OWORD *)(a1 + 96);
  long long v35 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v33 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v33 + 2) = v35;
  long long v36 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v33 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v33 + 4) = v36;
  sub_BA888((uint64_t)v15, (uint64_t)v17, &qword_125270);
  uint64_t v37 = v59;
  uint64_t v38 = (uint64_t (**)())&v17[*(int *)(v59 + 36)];
  uint64_t *v38 = sub_BA020;
  v38[1] = v33;
  v38[2] = 0;
  v38[3] = 0;
  sub_B9F68(a1);
  sub_BA82C((uint64_t)v15, &qword_125270);
  *(void *)&long long v72 = sub_B7108(0x5F5050415F444441, (void *)0xED0000454C544954);
  *((void *)&v72 + 1) = v39;
  unint64_t v40 = sub_B8368();
  unint64_t v41 = sub_187B0();
  int v42 = v60;
  uint64_t v43 = v37;
  sub_E69E0();
  swift_bridgeObjectRelease();
  sub_BA82C((uint64_t)v17, &qword_125258);
  uint64_t v44 = v66;
  uint64_t v45 = v67;
  uint64_t v46 = v68;
  (*(void (**)(char *, void, uint64_t))(v67 + 104))(v66, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v68);
  *(void *)&long long v72 = v43;
  *((void *)&v72 + 1) = &type metadata for String;
  unint64_t v73 = v40;
  unint64_t v74 = v41;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v48 = v61;
  uint64_t v49 = v62;
  sub_E6A40();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v42, v49);
  uint64_t v70 = a1;
  sub_10C7C(&qword_125248);
  *(void *)&long long v72 = v49;
  *((void *)&v72 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v50 = sub_11B60(&qword_122CA8);
  uint64_t v51 = sub_BA668(&qword_125298, &qword_122CA8);
  *(void *)&long long v72 = v50;
  *((void *)&v72 + 1) = v51;
  swift_getOpaqueTypeConformance2();
  uint64_t v52 = v64;
  sub_E6A70();
  return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v48, v52);
}

uint64_t sub_B8360@<X0>(uint64_t a1@<X8>)
{
  return sub_B7AB8(*(void *)(v1 + 16), a1);
}

unint64_t sub_B8368()
{
  unint64_t result = qword_125260;
  if (!qword_125260)
  {
    sub_11B60(&qword_125258);
    sub_B83E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125260);
  }
  return result;
}

unint64_t sub_B83E4()
{
  unint64_t result = qword_125268;
  if (!qword_125268)
  {
    sub_11B60(&qword_125270);
    sub_11B60(&qword_125278);
    sub_E66C0();
    sub_BA668(&qword_125280, &qword_125278);
    sub_BA9C4(&qword_122D10, (void (*)(uint64_t))&type metadata accessor for InsetGroupedFormStyle);
    swift_getOpaqueTypeConformance2();
    sub_BA668(&qword_125288, &qword_125290);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125268);
  }
  return result;
}

void sub_B852C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 bundleIdentifier];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_E7110();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_B8594(void *a1, id *a2)
{
  uint64_t v4 = sub_10C7C(&qword_123560);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v117 = (uint64_t)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v121 = (char *)&v113 - v7;
  uint64_t v8 = sub_E60E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v113 - v13;
  uint64_t v15 = sub_E6050();
  uint64_t v125 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v113 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = [a1 bundleIdentifier];
  if (v18)
  {
    uint64_t v19 = v18;
    long long v116 = v17;
    uint64_t v120 = v15;
    uint64_t v127 = sub_E7110();
    uint64_t v21 = v20;

    id v22 = [a1 localizedName];
    uint64_t v118 = sub_E7110();
    uint64_t v24 = v23;

    id v25 = *a2;
    if (!*a2)
    {
      type metadata accessor for GCSPreferencesStore();
      sub_BA9C4((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
      sub_E63E0();
      __break(1u);
      return;
    }
    v122 = *a2;
    id v26 = [v25 games];
    sub_18824();
    unint64_t v27 = sub_E7210();

    uint64_t v123 = v9;
    uint64_t v124 = v8;
    uint64_t v126 = a2;
    long long v114 = v12;
    long long v115 = v14;
    uint64_t v119 = v24;
    if (v27 >> 62)
    {
LABEL_31:
      swift_bridgeObjectRetain();
      uint64_t v28 = sub_E7570();
      swift_bridgeObjectRelease();
      if (v28)
      {
LABEL_5:
        uint64_t v29 = 4;
        while (1)
        {
          if ((v27 & 0xC000000000000001) != 0) {
            id v30 = (id)sub_E74E0();
          }
          else {
            id v30 = *(id *)(v27 + 8 * v29);
          }
          uint64_t v31 = v30;
          uint64_t v32 = v29 - 3;
          if (__OFADD__(v29 - 4, 1))
          {
            __break(1u);
            goto LABEL_31;
          }
          id v33 = [v30 bundleIdentifier];
          long long v34 = sub_E7110();
          uint64_t v36 = v35;

          if (v34 == v127 && v36 == v21) {
            break;
          }
          char v38 = sub_E7620();
          swift_bridgeObjectRelease();
          if (v38) {
            goto LABEL_21;
          }

          ++v29;
          if (v32 == v28) {
            goto LABEL_16;
          }
        }
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        unint64_t v74 = v31;
        id v75 = [v74 controllerToProfileMappings];
        uint64_t v76 = v120;
        uint64_t v77 = sub_E7050();

        *(void *)&long long v129 = v77;
        id v78 = [v126[5] persistentIdentifier];
        uint64_t v79 = sub_E7110();
        uint64_t v81 = v80;

        char v82 = *(uint64_t (**)(void))((char *)&stru_1F8.reloff + (swift_isaMask & *v122));
        char v83 = v122;
        int v84 = (void *)v82();
        long long v115 = v83;

        id v85 = [v84 uuid];
        uint64_t v86 = (uint64_t)v121;
        sub_E6030();

        uint64_t v87 = v125;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v125 + 56))(v86, 0, 1, v76);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v87 + 48))(v86, 1, v76) == 1)
        {
          sub_BA82C(v86, &qword_123560);
          uint64_t v88 = v117;
          sub_75C9C(v79, v81, v117);
          swift_bridgeObjectRelease();
          sub_BA82C(v88, &qword_123560);
        }
        else
        {
          uint64_t v89 = (uint64_t)v116;
          (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(v116, v86, v76);
          char v90 = v129;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v128 = v90;
          *(void *)&long long v129 = 0x8000000000000000;
          sub_98DF4(v89, v79, v81, isUniquelyReferenced_nonNull_native);
          *(void *)&long long v129 = v128;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        id v92 = [v74 controllerToCompatibilityModeMappings];
        type metadata accessor for GCSCompatibilityMode();
        sub_E7050();

        uint64_t v93 = v74;
        id v94 = objc_allocWithZone((Class)GCSGame);
        NSString v95 = sub_E70D0();
        swift_bridgeObjectRelease();
        NSString v96 = sub_E70D0();
        swift_bridgeObjectRelease();
        Class isa = sub_E7040().super.isa;
        swift_bridgeObjectRelease();
        Class v98 = sub_E7040().super.isa;
        swift_bridgeObjectRelease();
        id v99 = [v94 initWithBundleIdentifier:v95 title:v96 controllerToProfileMappings:isa controllerToCompatibilityModeMappings:v98];

        long long v100 = *(void (**)(NSObject *, id, uint64_t))&stru_298.segname[(swift_isaMask & *v115) - 8];
        long long v101 = v115;
        uint64_t v127 = v93;
        v100(v93, v99, 1);

        uint64_t v102 = sub_33D64();
        uint64_t v103 = v123;
        uint64_t v104 = v124;
        long long v105 = v114;
        (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v114, v102, v124);
        uint64_t v106 = v99;
        uint64_t v107 = sub_E60C0();
        os_log_type_t v108 = sub_E7320();
        if (os_log_type_enabled(v107, v108))
        {
          char v109 = (uint8_t *)swift_slowAlloc();
          char v110 = (void *)swift_slowAlloc();
          *(_DWORD *)char v109 = 138412290;
          uint64_t v128 = v106;
          long long v111 = v106;
          uint64_t v104 = v124;
          sub_E73D0();
          *char v110 = v106;

          uint64_t v103 = v123;
          _os_log_impl(&dword_0, v107, v108, "Updating %@", v109, 0xCu);
          sub_10C7C(&qword_125050);
          swift_arrayDestroy();
          unint64_t v73 = v126;
          swift_slowDealloc();
          swift_slowDealloc();
          long long v72 = v127;
          long long v112 = v127;
        }
        else
        {

          long long v72 = v127;
          uint64_t v107 = v106;
          long long v112 = v106;
          unint64_t v73 = v126;
        }

        (*(void (**)(char *, uint64_t))(v103 + 8))(v105, v104);
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v28 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
      if (v28) {
        goto LABEL_5;
      }
    }
LABEL_16:
    swift_bridgeObjectRelease();
    sub_10C7C(&qword_1252F8);
    uint64_t v39 = (int *)(sub_10C7C(&qword_123580) - 8);
    unint64_t v40 = (*(unsigned __int8 *)(*(void *)v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v39 + 80);
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_EBBE0;
    int v42 = (uint64_t *)(v41 + v40);
    unint64_t v43 = v41 + v40 + v39[14];
    id v44 = [v126[5] persistentIdentifier];
    uint64_t v45 = sub_E7110();
    uint64_t v47 = v46;

    *int v42 = v45;
    v42[1] = v47;
    uint64_t v48 = *(uint64_t (**)(void))((char *)&stru_1F8.reloff + (swift_isaMask & *v122));
    uint64_t v49 = v122;
    uint64_t v50 = (void *)v48();

    id v51 = [v50 uuid];
    uint64_t v52 = v116;
    sub_E6030();

    (*(void (**)(unint64_t, char *, uint64_t))(v125 + 32))(v43, v52, v120);
    sub_45500(v41);
    sub_456F8((uint64_t)_swiftEmptyArrayStorage);
    id v53 = objc_allocWithZone((Class)GCSGame);
    NSString v54 = sub_E70D0();
    swift_bridgeObjectRelease();
    NSString v55 = sub_E70D0();
    swift_bridgeObjectRelease();
    Class v56 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    type metadata accessor for GCSCompatibilityMode();
    Class v57 = sub_E7040().super.isa;
    swift_bridgeObjectRelease();
    id v58 = [v53 initWithBundleIdentifier:v54 title:v55 controllerToProfileMappings:v56 controllerToCompatibilityModeMappings:v57];

    uint64_t v59 = *(void (**)(id, uint64_t))&stru_298.segname[swift_isaMask & *v49];
    long long v60 = v49;
    v59(v58, 1);

    uint64_t v61 = sub_33D64();
    uint64_t v62 = v123;
    uint64_t v63 = v124;
    uint64_t v64 = v115;
    (*(void (**)(void *, uint64_t, uint64_t))(v123 + 16))(v115, v61, v124);
    uint64_t v65 = v58;
    int v66 = sub_E60C0();
    os_log_type_t v67 = sub_E7320();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      uint64_t v69 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v68 = 138412290;
      *(void *)&long long v129 = v65;
      uint64_t v70 = v64;
      uint64_t v71 = v65;
      uint64_t v63 = v124;
      sub_E73D0();
      *uint64_t v69 = v65;

      uint64_t v64 = v70;
      uint64_t v62 = v123;
      _os_log_impl(&dword_0, v66, v67, "Adding %@", v68, 0xCu);
      sub_10C7C(&qword_125050);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      int v66 = v65;
    }

    (*(void (**)(void *, uint64_t))(v62 + 8))(v64, v63);
    long long v72 = 0;
    unint64_t v73 = v126;
LABEL_28:
    long long v129 = *((_OWORD *)v73 + 3);
    char v130 = *((unsigned char *)v73 + 64);
    LOBYTE(v128) = 0;
    sub_10C7C(&qword_122890);
    sub_E6DF0();
  }
}

uint64_t sub_B92E0(uint64_t a1)
{
  uint64_t v2 = sub_E6680();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_10C7C(&qword_122CA8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_E6660();
  uint64_t v9 = a1;
  sub_10C7C(&qword_122B88);
  sub_BA668(&qword_122BA0, &qword_122B88);
  sub_E6290();
  sub_BA668(&qword_125298, &qword_122CA8);
  sub_E6700();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

__n128 sub_B94A8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  type metadata accessor for GCSPreferencesStore();
  sub_BA9C4((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
  uint64_t v10 = sub_E63F0();
  uint64_t v12 = v11;
  sub_10C7C(&qword_1237E0);
  sub_E6D10();
  sub_E6D10();
  __n128 result = v14;
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v12;
  *(void *)(a5 + 16) = sub_B73BC;
  *(void *)(a5 + 24) = 0;
  *(unsigned char *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = a1;
  *(void *)(a5 + 48) = a2;
  *(void *)(a5 + 56) = a3;
  *(unsigned char *)(a5 + 64) = a4;
  *(__n128 *)(a5 + 72) = v14;
  *(__n128 *)(a5 + 88) = v14;
  *(void *)(a5 + 104) = v15;
  return result;
}

uint64_t sub_B95D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B95FC()
{
  return sub_E69D0();
}

uint64_t sub_B9618@<X0>(uint64_t a1@<X8>)
{
  return sub_B7694(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for GCSAppPickerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_B9698()
{
  return swift_retain();
}

uint64_t destroy for GCSAppPickerView(id *a1)
{
  sub_B9718();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_B9718()
{
  return swift_release();
}

uint64_t initializeWithCopy for GCSAppPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  id v9 = v4;
  sub_B9698();
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v12;
  uint64_t v13 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v13;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  id v14 = v10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GCSAppPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  char v9 = *(unsigned char *)(a2 + 32);
  sub_B9698();
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  sub_B9718();
  uint64_t v10 = *(void **)(a2 + 40);
  uint64_t v11 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  id v12 = v10;

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for GCSAppPickerView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for GCSAppPickerView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_B9718();

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSAppPickerView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSAppPickerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSAppPickerView()
{
  return &type metadata for GCSAppPickerView;
}

uint64_t sub_B9AC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B9B40()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  sub_10C7C(&qword_1252D8);
  sub_E6D20();
  swift_getKeyPath();
  unint64_t v2 = (_OWORD *)swift_allocObject();
  long long v4 = v1[1];
  long long v3 = v1[2];
  v2[1] = *v1;
  v2[2] = v4;
  v2[3] = v3;
  long long v5 = v1[6];
  long long v7 = v1[3];
  long long v6 = v1[4];
  v2[6] = v1[5];
  v2[7] = v5;
  v2[4] = v7;
  v2[5] = v6;
  sub_B9F68((uint64_t)v1);
  sub_10C7C(&qword_1237E0);
  sub_10C7C(&qword_1252C8);
  sub_BA668(&qword_1252E0, &qword_1237E0);
  sub_BA6AC();
  sub_BA668(&qword_1252C0, &qword_1252C8);
  return sub_E6EB0();
}

unint64_t sub_B9CAC()
{
  unint64_t result = qword_1252B8;
  if (!qword_1252B8)
  {
    sub_11B60(&qword_1252B0);
    sub_BA668(&qword_1252C0, &qword_1252C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1252B8);
  }
  return result;
}

uint64_t sub_B9D48(void *a1)
{
  unint64_t v2 = a1[1];
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(v2) & 0xF;
  }
  else {
    uint64_t v3 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  type metadata accessor for GCSAppStore();
  sub_BA9C4(&qword_1252D0, (void (*)(uint64_t))type metadata accessor for GCSAppStore);
  uint64_t v4 = sub_E6270();
  long long v5 = *(void **)(v1 + 16);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(v1 + 56);
      long long v7 = *(uint64_t (**)(uint64_t, id))(*(void *)v4 + 144);
      id v8 = v5;
      unint64_t v9 = v7(v6, v8);

      swift_release();
      swift_bridgeObjectRetain();
      sub_BA2F8(v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      sub_10C7C(&qword_1252D8);
      return sub_E6D30();
    }
  }
  else if (v5)
  {
    uint64_t v10 = *(void *)(v1 + 56);
    uint64_t v11 = *(void (**)(uint64_t, id))(*(void *)v4 + 144);
    id v12 = v5;
    v11(v10, v12);

    swift_release();
    goto LABEL_9;
  }
  type metadata accessor for GCSPreferencesStore();
  sub_BA9C4((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
  uint64_t result = sub_E63E0();
  __break(1u);
  return result;
}

uint64_t sub_B9F68(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(id *)a1;
  sub_B9698();
  swift_retain();
  id v4 = v2;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_BA020()
{
  type metadata accessor for GCSAppStore();
  sub_BA9C4(&qword_1252D0, (void (*)(uint64_t))type metadata accessor for GCSAppStore);
  uint64_t v1 = sub_E6270();
  unint64_t v2 = *(void **)(v0 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 56);
    id v4 = *(void (**)(uint64_t, id))(*(void *)v1 + 144);
    id v5 = v2;
    v4(v3, v5);

    swift_release();
    sub_10C7C(&qword_1252D8);
    return sub_E6D30();
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_BA9C4((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    uint64_t result = sub_E63E0();
    __break(1u);
  }
  return result;
}

uint64_t sub_BA194()
{
  return sub_B92E0(*(void *)(v0 + 16));
}

uint64_t sub_BA19C()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  sub_B7108(0x4C45434E4143, (void *)0xE600000000000000);
  unint64_t v2 = (_OWORD *)swift_allocObject();
  long long v4 = v1[1];
  long long v3 = v1[2];
  v2[1] = *v1;
  v2[2] = v4;
  v2[3] = v3;
  long long v5 = v1[6];
  long long v7 = v1[3];
  long long v6 = v1[4];
  v2[6] = v1[5];
  v2[7] = v5;
  v2[4] = v7;
  v2[5] = v6;
  sub_B9F68((uint64_t)v1);
  sub_187B0();
  return sub_E6DA0();
}

uint64_t sub_BA260()
{
  return sub_E6DF0();
}

uint64_t sub_BA2B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_E7110();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

void *sub_BA2F8(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v2)
  {
    while (1)
    {
      unint64_t v10 = v1;
      unint64_t v3 = 0;
      uint64_t v11 = v1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v12 = v1 & 0xC000000000000001;
      while (v12)
      {
        id v4 = (id)sub_E74E0();
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        sub_E6060();
        Class isa = sub_E7200().super.isa;
        swift_bridgeObjectRelease();
        id v8 = [v5 localizedNameWithPreferredLocalizations:isa];

        sub_E7110();
        sub_E7140();
        swift_bridgeObjectRelease();
        sub_E7140();
        sub_187B0();
        LOBYTE(v8) = sub_E7430();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v8)
        {
          sub_E7510();
          sub_E7540();
          sub_E7550();
          sub_E7520();
        }
        else
        {
        }
        unint64_t v1 = v10;
        ++v3;
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v3 < *(void *)(v11 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_E7570();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v4 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

const char *sub_BA4FC()
{
  return "bundleIdentifier";
}

uint64_t sub_BA50C()
{
  sub_B9718();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_BA588(void **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = swift_allocObject();
  long long v4 = v1[3];
  *(_OWORD *)(v3 + 72) = v1[4];
  long long v5 = v1[6];
  *(_OWORD *)(v3 + 88) = v1[5];
  *(_OWORD *)(v3 + 104) = v5;
  *(_OWORD *)(v3 + 120) = v1[7];
  long long v6 = v1[2];
  *(_OWORD *)(v3 + 24) = v1[1];
  *(_OWORD *)(v3 + 40) = v6;
  *(void *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 56) = v4;
  id v7 = v2;
  sub_B9F68((uint64_t)(v1 + 1));
  sub_BA7D8();
  return sub_E6D80();
}

uint64_t sub_BA668(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_BA6AC()
{
  unint64_t result = qword_1252E8;
  if (!qword_1252E8)
  {
    sub_11B60(&qword_123F18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1252E8);
  }
  return result;
}

uint64_t sub_BA718()
{
  sub_B9718();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 136, 7);
}

void sub_BA79C()
{
  sub_B8594(*(void **)(v0 + 16), (id *)(v0 + 24));
}

uint64_t sub_BA7A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_17(*(id *)(v1 + 16));
  *a1 = result;
  return result;
}

unint64_t sub_BA7D8()
{
  unint64_t result = qword_1252F0;
  if (!qword_1252F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1252F0);
  }
  return result;
}

uint64_t sub_BA82C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_BA888(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_BA8EC()
{
  return sub_BA9C4(&qword_123568, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

uint64_t sub_BA934()
{
  return sub_BA9C4((unint64_t *)&unk_1250A0, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

uint64_t sub_BA97C()
{
  return sub_BA9C4(&qword_123570, (void (*)(uint64_t))type metadata accessor for GCSCompatibilityMode);
}

uint64_t sub_BA9C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_BAA0C()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_12A880);
  swift_endAccess();
  if (v1)
  {
    sub_E7440();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_46150((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_BC6D4((uint64_t)v5, &qword_125300);
  }
  return 0;
}

void sub_BAAE8()
{
  Class isa = sub_E7270().super.super.isa;
  swift_beginAccess();
  objc_setAssociatedObject(v0, &unk_12A880, isa, 0);
  swift_endAccess();
}

void sub_BAB58(void (*a1)(uint64_t), uint64_t a2)
{
  unsigned __int8 v3 = v2;
  uint64_t v81 = a2;
  char v82 = a1;
  uint64_t v4 = sub_E60E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v75 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v75 - v12;
  uint64_t v14 = sub_10C7C(&qword_125368);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_E5F60();
  uint64_t v80 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  id v78 = v3;
  uint64_t v79 = (char *)&v75 - v21;
  id v22 = [v3 haptics];
  if (!v22
    || (uint64_t v23 = v22,
        id v24 = [v22 createEngineWithLocality:GCHapticsLocalityDefault],
        v23,
        !v24))
  {
    uint64_t v58 = sub_33D64();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v58, v4);
    uint64_t v59 = sub_E60C0();
    os_log_type_t v60 = sub_E7320();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v61 = 0;
      _os_log_impl(&dword_0, v59, v60, "Failed to create engine.", v61, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    v82(1);
    return;
  }
  uint64_t v76 = v8;
  uint64_t v77 = v4;
  uint64_t v88 = sub_BB6C0;
  uint64_t v89 = 0;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v85 = 1107296256;
  uint64_t v86 = sub_BB848;
  uint64_t v87 = &unk_1172A0;
  id v25 = _Block_copy(&aBlock);
  [v24 setStoppedHandler:v25];
  _Block_release(v25);
  id v26 = (void *)swift_allocObject();
  uint64_t v28 = v81;
  unint64_t v27 = v82;
  v26[2] = v24;
  v26[3] = v27;
  v26[4] = v28;
  uint64_t v88 = sub_BC6C8;
  uint64_t v89 = v26;
  id aBlock = _NSConcreteStackBlock;
  uint64_t v85 = 1107296256;
  uint64_t v86 = sub_2DC60;
  uint64_t v87 = &unk_1172F0;
  uint64_t v29 = _Block_copy(&aBlock);
  swift_retain();
  id v30 = v24;
  swift_release();
  [v30 setResetHandler:v29];
  _Block_release(v29);
  NSString v31 = sub_E70D0();
  uint64_t v32 = self;
  id v33 = [v32 bundleWithIdentifier:v31];

  if (!v33) {
    id v33 = [v32 mainBundle];
  }
  NSString v34 = sub_E70D0();
  NSString v35 = sub_E70D0();
  id v36 = [v33 URLForResource:v34 withExtension:v35];

  if (!v36)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v16, 1, 1, v17);
    goto LABEL_14;
  }
  sub_E5F50();

  uint64_t v37 = v80;
  char v38 = *(void (**)(char *, char *, uint64_t))(v80 + 32);
  uint64_t v39 = (void (*)(uint64_t))v17;
  v38(v16, v20, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v16, 0, 1, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v16, 1, v17) == 1)
  {
LABEL_14:
    sub_BC6D4((uint64_t)v16, &qword_125368);
    uint64_t v62 = sub_33D64();
    uint64_t v63 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v62, v77);
    uint64_t v64 = sub_E60C0();
    os_log_type_t v65 = sub_E7320();
    if (os_log_type_enabled(v64, v65))
    {
      int v66 = (uint8_t *)swift_slowAlloc();
      id aBlock = (id)swift_slowAlloc();
      *(_DWORD *)int v66 = 136315138;
      unint64_t v83 = sub_23A0C(0x6564492F50414841, 0xED0000796669746ELL, (uint64_t *)&aBlock);
      sub_E73D0();
      _os_log_impl(&dword_0, v64, v65, "Unable to find haptics file named '%s'.", v66, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v63);
    v82(1);

    return;
  }
  unint64_t v40 = v79;
  v38(v79, v16, v17);
  id aBlock = 0;
  unsigned int v41 = [v30 startAndReturnError:&aBlock];
  id v42 = aBlock;
  if (v41)
  {
    id v43 = aBlock;
    Class isa = sub_E7270().super.super.isa;
    swift_beginAccess();
    id v45 = v78;
    objc_setAssociatedObject(v78, &unk_12A880, isa, 0);
    swift_endAccess();

    uint64_t v46 = (void *)swift_allocObject();
    uint64_t v48 = v81;
    uint64_t v47 = v82;
    v46[2] = v45;
    v46[3] = v47;
    v46[4] = v48;
    uint64_t v88 = sub_BC774;
    uint64_t v89 = v46;
    id aBlock = _NSConcreteStackBlock;
    uint64_t v85 = 1107296256;
    uint64_t v86 = sub_BBE90;
    uint64_t v87 = &unk_117340;
    uint64_t v49 = _Block_copy(&aBlock);
    swift_retain();
    id v50 = v45;
    swift_release();
    [v30 notifyWhenPlayersFinished:v49];
    _Block_release(v49);
    sub_E5F40(v51);
    id v53 = v52;
    id aBlock = 0;
    unsigned int v54 = [v30 playPatternFromURL:v52 error:&aBlock];

    id v42 = aBlock;
    NSString v55 = v30;
    Class v56 = v76;
    if (v54)
    {
      id v57 = aBlock;

      (*(void (**)(char *, void (*)(uint64_t)))(v80 + 8))(v40, v39);
      return;
    }
    id v78 = v55;
  }
  else
  {
    id v78 = v30;
    Class v56 = v76;
  }
  id v67 = v42;
  sub_E5F00();

  swift_willThrow();
  v82(1);
  uint64_t v68 = sub_33D64();
  uint64_t v69 = v77;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v56, v68, v77);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v70 = sub_E60C0();
  os_log_type_t v71 = sub_E7320();
  if (os_log_type_enabled(v70, v71))
  {
    uint64_t v72 = swift_slowAlloc();
    id aBlock = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v72 = 136315394;
    unint64_t v83 = sub_23A0C(0x6564492F50414841, 0xED0000796669746ELL, (uint64_t *)&aBlock);
    sub_E73D0();
    *(_WORD *)(v72 + 12) = 2080;
    char v82 = v39;
    swift_getErrorValue();
    uint64_t v73 = sub_E7650();
    unint64_t v83 = sub_23A0C(v73, v74, (uint64_t *)&aBlock);
    sub_E73D0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v70, v71, "An error occured playing %s: %s.", (uint8_t *)v72, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v56, v77);
    (*(void (**)(char *, void (*)(uint64_t)))(v80 + 8))(v79, v82);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v56, v69);
    (*(void (**)(char *, void (*)(uint64_t)))(v80 + 8))(v79, v39);
  }
}

uint64_t sub_BB6C0(uint64_t a1)
{
  uint64_t v2 = sub_E60E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_33D64();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_E60C0();
  os_log_type_t v8 = sub_E7320();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    v11[1] = a1;
    sub_E73D0();
    _os_log_impl(&dword_0, v7, v8, "The engine stopped because %ld", v9, 0xCu);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_BB848(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_BB89C(void *a1, void (*a2)(uint64_t), uint8_t *a3)
{
  uint64_t v29 = a3;
  id v30 = a2;
  uint64_t v4 = sub_E60E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  os_log_type_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = sub_33D64();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  uint64_t v13 = sub_E60C0();
  os_log_type_t v14 = sub_E7320();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v11;
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "The engine reset --> Restarting now!", v15, 2u);
    uint64_t v11 = v28;
    swift_slowDealloc();
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v10, v4);
  id v32 = 0;
  unsigned int v17 = [a1 startAndReturnError:&v32];
  id v18 = v32;
  if (v17)
  {
    return v18;
  }
  else
  {
    uint64_t v28 = (uint64_t)v32;
    id v20 = v32;
    sub_E5F00();

    swift_willThrow();
    v30(1);
    v12(v8, v11, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v21 = sub_E60C0();
    os_log_type_t v22 = sub_E7320();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      id v30 = (void (*)(uint64_t))v8;
      id v24 = (uint8_t *)v23;
      id v32 = (id)swift_slowAlloc();
      *(_DWORD *)id v24 = 136315138;
      uint64_t v29 = v24 + 4;
      swift_getErrorValue();
      uint64_t v25 = sub_E7650();
      unint64_t v31 = sub_23A0C(v25, v26, (uint64_t *)&v32);
      sub_E73D0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v21, v22, "Failed to restart the engine: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return (id)((uint64_t (*)(void (*)(uint64_t), uint64_t))v16)(v30, v4);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      return (id)((uint64_t (*)(char *, uint64_t))v16)(v8, v4);
    }
  }
}

uint64_t sub_BBCC8(void *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = sub_E60E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_33D64();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = sub_E60C0();
  os_log_type_t v10 = sub_E7320();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Done!", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  Class isa = sub_E7270().super.super.isa;
  swift_beginAccess();
  objc_setAssociatedObject(a1, &unk_12A880, isa, 0);
  swift_endAccess();

  return a2(1);
}

uint64_t sub_BBE90(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3(a2);
  swift_release();

  return v5;
}

char *sub_BBEEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v48 = a1;
  uint64_t v7 = sub_E6FD0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v46 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_E7000();
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_E6FC0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_E7030();
  uint64_t v43 = *(void *)(v16 - 8);
  uint64_t v44 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t result = (char *)[v5 playerIndex];
  uint64_t v23 = (uint64_t)(result + 1);
  if (__OFADD__(result, 1))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v41 = v8;
  uint64_t v42 = v7;
  BOOL v24 = -v23 < 0;
  uint64_t v25 = -v23 & 3;
  uint64_t v26 = v23 & 3;
  if (v24) {
    uint64_t v27 = v26;
  }
  else {
    uint64_t v27 = -v25;
  }
  uint64_t result = (char *)[v5 setPlayerIndex:v27];
  if (__OFSUB__(a2, 1)) {
    goto LABEL_11;
  }
  if (a2 == 1)
  {
    [v5 setPlayerIndex:v48];
    Class isa = sub_E7270().super.super.isa;
    swift_beginAccess();
    objc_setAssociatedObject(v5, &unk_12A880, isa, 0);
    swift_endAccess();

    return (char *)v49(1);
  }
  else
  {
    sub_2E1F8();
    uint64_t v40 = sub_E7340();
    sub_E7010();
    *uint64_t v15 = 200;
    (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchTimeInterval.milliseconds(_:), v12);
    sub_E7020();
    (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v28 = v44;
    uint64_t v43 = *(void *)(v43 + 8);
    ((void (*)(char *, uint64_t))v43)(v19, v44);
    uint64_t v29 = (void *)swift_allocObject();
    uint64_t v30 = v48;
    v29[2] = v5;
    v29[3] = v30;
    unint64_t v31 = v49;
    uint64_t v32 = v50;
    v29[4] = a2 - 1;
    v29[5] = v31;
    v29[6] = v32;
    aBlock[4] = sub_BC7DC;
    aBlock[5] = v29;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2DC60;
    void aBlock[3] = &unk_1173A0;
    id v33 = _Block_copy(aBlock);
    id v34 = v5;
    swift_retain();
    swift_release();
    sub_E6FF0();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_BC80C();
    sub_10C7C((uint64_t *)&unk_124E80);
    sub_BC864();
    NSString v35 = v46;
    uint64_t v36 = v42;
    sub_E7460();
    uint64_t v37 = (void *)v40;
    sub_E7330();
    _Block_release(v33);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v36);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v47);
    return (char *)((uint64_t (*)(char *, uint64_t))v43)(v21, v28);
  }
}

BOOL sub_BC400()
{
  id v1 = [v0 _componentWithProtocol:&OBJC_PROTOCOL___GCControllerSettingsComponent];
  swift_unknownObjectRelease();
  return v1 != 0;
}

id sub_BC44C()
{
  id result = [v0 _componentWithProtocol:&OBJC_PROTOCOL___GCControllerProductInfo];
  if (result)
  {
    id result = (id)swift_dynamicCastObjCProtocolConditional();
    if (!result)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return result;
}

void sub_BC4BC(void (*a1)(uint64_t), uint64_t a2)
{
  if ((sub_BAA0C() & 1) == 0)
  {
    id v5 = [v2 haptics];
    if (v5)
    {

      sub_BAB58(a1, a2);
    }
    else
    {
      Class isa = sub_E7270().super.super.isa;
      swift_beginAccess();
      objc_setAssociatedObject(v2, &unk_12A880, isa, 0);
      swift_endAccess();

      sub_BBEEC((uint64_t)[v2 playerIndex], 9, (uint64_t (*)(uint64_t))a1, a2);
    }
  }
}

uint64_t sub_BC5B8()
{
  id v1 = [v0 haptics];

  if (v1) {
    return 1;
  }
  id v3 = [v0 productCategory];
  uint64_t v4 = sub_E7110();
  uint64_t v6 = v5;

  if (v4 == sub_E7110() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    return [v0 isAttachedToDevice] ^ 1;
  }
  char v9 = sub_E7620();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if (v9) {
    return [v0 isAttachedToDevice] ^ 1;
  }
  return result;
}

uint64_t sub_BC6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_BC6BC()
{
  return swift_release();
}

id sub_BC6C8()
{
  return sub_BB89C(*(void **)(v0 + 16), *(void (**)(uint64_t))(v0 + 24), *(uint8_t **)(v0 + 32));
}

uint64_t sub_BC6D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_BC734()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_BC774()
{
  sub_BBCC8(*(void **)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
  return 1;
}

uint64_t sub_BC79C()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_BC7DC()
{
  return sub_BBEEC(v0[3], v0[4], v0[5], v0[6]);
}

unint64_t sub_BC80C()
{
  unint64_t result = qword_125380;
  if (!qword_125380)
  {
    sub_E6FD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125380);
  }
  return result;
}

unint64_t sub_BC864()
{
  unint64_t result = qword_125390;
  if (!qword_125390)
  {
    sub_11B60((uint64_t *)&unk_124E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125390);
  }
  return result;
}

void type metadata accessor for GCControllerPlayerIndex()
{
  if (!qword_125398)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_125398);
    }
  }
}

uint64_t sub_BC934@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_E6530();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10C7C(&qword_125460);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C0970(v2, (uint64_t)v10, &qword_125460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_E62C0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_E7310();
    uint64_t v14 = sub_E6740();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_23A0C(0x417373696D736944, 0xED00006E6F697463, &v17);
      _os_log_impl(&dword_0, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_E6520();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_BCBCC()
{
  return sub_E64D0();
}

uint64_t sub_BCBF0()
{
  return 0;
}

uint64_t sub_BCBFC()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GCSControllerPairingHelpView() + 20));
  sub_4F628(v1);
  return v1;
}

uint64_t type metadata accessor for GCSControllerPairingHelpView()
{
  uint64_t result = qword_12A920;
  if (!qword_12A920) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_BCC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for GCSControllerPairingHelpView() + 20));
  uint64_t result = sub_4F680(*v5);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_BCCD4())()
{
  return nullsub_60;
}

uint64_t sub_BCD20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10C7C(&qword_125468);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_E65D0();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v7 = sub_10C7C(&qword_125470);
  sub_BCE38(v2, (uint64_t *)&v6[*(int *)(v7 + 44)]);
  sub_E6F30();
  sub_E62A0();
  sub_C0970((uint64_t)v6, a1, &qword_125468);
  uint64_t v8 = (_OWORD *)(a1 + *(int *)(sub_10C7C(&qword_125478) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  uint64_t v8[2] = v11[2];
  return sub_C024C((uint64_t)v6, &qword_125468);
}

uint64_t sub_BCE38@<X0>(void (*a1)(char *, char *, uint64_t)@<X0>, uint64_t *a2@<X8>)
{
  id v92 = a1;
  uint64_t v85 = a2;
  uint64_t v2 = sub_10C7C(&qword_125520);
  __chkstk_darwin(v2 - 8);
  uint64_t v89 = (uint64_t *)((char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v90 = sub_10C7C(&qword_125528) - 8;
  uint64_t v4 = __chkstk_darwin(v90);
  uint64_t v97 = (uint64_t)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v99 = (uint64_t)&v80 - v6;
  uint64_t v91 = sub_E6EA0();
  uint64_t v100 = *(void *)(v91 - 8);
  uint64_t v7 = __chkstk_darwin(v91);
  Class v98 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v95 = (char *)&v80 - v9;
  uint64_t v10 = sub_10C7C(&qword_125530);
  uint64_t v82 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_10C7C(&qword_125538);
  uint64_t v81 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v14 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10C7C(&qword_125540);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v93 = (uint64_t)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v94 = (uint64_t)&v80 - v19;
  uint64_t v102 = sub_B7108(0xD000000000000011, (void *)0x80000000000F3450);
  uint64_t v103 = v20;
  sub_187B0();
  uint64_t v21 = sub_E6920();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_E67C0();
  uint64_t v87 = sub_E6900();
  uint64_t v86 = v26;
  char v28 = v27;
  uint64_t v88 = v29;
  swift_release();
  int v96 = v28 & 1;
  sub_18814(v21, v23, v25);
  swift_bridgeObjectRelease();
  int v84 = sub_E6770();
  sub_E6210();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_E6750();
  sub_10C7C(&qword_125548);
  sub_C0414(&qword_125550, &qword_125548);
  sub_E6230();
  sub_E67F0();
  sub_C0414(&qword_125558, &qword_125530);
  sub_E6960();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v12, v10);
  char v38 = sub_E6770();
  sub_E6210();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v47 = v81;
  uint64_t v48 = v93;
  uint64_t v49 = v83;
  (*(void (**)(uint64_t, char *, uint64_t))(v81 + 16))(v93, v14, v83);
  uint64_t v50 = v48 + *(int *)(v16 + 44);
  *(unsigned char *)uint64_t v50 = v38;
  *(void *)(v50 + 8) = v40;
  *(void *)(v50 + 16) = v42;
  *(void *)(v50 + 24) = v44;
  *(void *)(v50 + 32) = v46;
  *(unsigned char *)(v50 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v14, v49);
  uint64_t v51 = v48;
  uint64_t v52 = v94;
  sub_C01E8(v48, v94, &qword_125540);
  id v53 = v95;
  sub_E6E90();
  uint64_t v54 = sub_E6560();
  NSString v55 = v89;
  *uint64_t v89 = v54;
  v55[1] = 0;
  *((unsigned char *)v55 + 16) = 1;
  uint64_t v56 = (uint64_t)v55;
  uint64_t v57 = sub_10C7C(&qword_125560);
  sub_BECE8((uint64_t)v92, (void *)(v56 + *(int *)(v57 + 44)));
  char v58 = sub_E6770();
  sub_E6210();
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v67 = v97;
  sub_C0970(v56, v97, &qword_125520);
  uint64_t v68 = v67 + *(int *)(v90 + 44);
  *(unsigned char *)uint64_t v68 = v58;
  *(void *)(v68 + 8) = v60;
  *(void *)(v68 + 16) = v62;
  *(void *)(v68 + 24) = v64;
  *(void *)(v68 + 32) = v66;
  *(unsigned char *)(v68 + 40) = 0;
  sub_C024C(v56, &qword_125520);
  uint64_t v69 = v99;
  sub_C01E8(v67, v99, &qword_125528);
  LOBYTE(v102) = v96;
  char v101 = 0;
  sub_C0970(v52, v51, &qword_125540);
  id v92 = *(void (**)(char *, char *, uint64_t))(v100 + 16);
  uint64_t v70 = v98;
  uint64_t v71 = v91;
  v92(v98, v53, v91);
  sub_C0970(v69, v67, &qword_125528);
  LOBYTE(v69) = v102;
  char v72 = v101;
  uint64_t v73 = v87;
  unint64_t v74 = v85;
  uint64_t v75 = v86;
  uint64_t *v85 = v87;
  v74[1] = v75;
  *((unsigned char *)v74 + 16) = v69;
  v74[3] = v88;
  *((unsigned char *)v74 + 32) = v84;
  v74[5] = v31;
  v74[6] = v33;
  v74[7] = v35;
  v74[8] = v37;
  *((unsigned char *)v74 + 72) = v72;
  uint64_t v76 = (int *)sub_10C7C(&qword_125568);
  sub_C0970(v51, (uint64_t)v74 + v76[12], &qword_125540);
  v92((char *)v74 + v76[16], v70, v71);
  uint64_t v77 = v97;
  sub_C0970(v97, (uint64_t)v74 + v76[20], &qword_125528);
  sub_18804(v73, v75, v69);
  swift_bridgeObjectRetain();
  LOBYTE(v49) = v96;
  sub_18804(v73, v75, v96);
  swift_bridgeObjectRetain();
  sub_C024C(v99, &qword_125528);
  id v78 = *(void (**)(char *, uint64_t))(v100 + 8);
  v78(v95, v71);
  sub_C024C(v94, &qword_125540);
  sub_18814(v73, v75, v49);
  swift_bridgeObjectRelease();
  sub_C024C(v77, &qword_125528);
  v78(v98, v71);
  sub_C024C(v93, &qword_125540);
  sub_18814(v73, v75, v102);
  return swift_bridgeObjectRelease();
}

uint64_t sub_BD684(uint64_t a1)
{
  __chkstk_darwin(a1);
  uint64_t v85 = v1;
  uint64_t v2 = sub_E6EA0();
  uint64_t v102 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  char v101 = &v81[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v106 = &v81[-v6];
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v91 = &v81[-v8];
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v90 = &v81[-v10];
  uint64_t v11 = __chkstk_darwin(v9);
  id v92 = &v81[-v12];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v86 = &v81[-v14];
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v87 = &v81[-v16];
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v89 = &v81[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = &v81[-v20];
  __chkstk_darwin(v19);
  uint64_t v100 = &v81[-v22];
  uint64_t v93 = 0xD00000000000001BLL;
  uint64_t v270 = sub_B7108(0xD00000000000001BLL, (void *)0x80000000000F3490);
  uint64_t v271 = v23;
  sub_187B0();
  uint64_t v24 = sub_E6920();
  uint64_t v94 = v25;
  uint64_t v95 = v24;
  uint64_t v96 = v26;
  int v98 = v27 & 1;
  sub_E6E90();
  uint64_t v105 = sub_E6560();
  sub_BE6E0(0xD000000000000015, (void *)0x80000000000F3590, 0xD000000000000016, (void *)0x80000000000F3570, (uint64_t)v156);
  *(_OWORD *)((char *)&v158[9] + 7) = v156[9];
  *(_OWORD *)((char *)&v158[10] + 7) = v156[10];
  *(_OWORD *)((char *)&v158[11] + 7) = v156[11];
  *(_OWORD *)((char *)&v158[5] + 7) = v156[5];
  *(_OWORD *)((char *)&v158[6] + 7) = v156[6];
  *(_OWORD *)((char *)&v158[7] + 7) = v156[7];
  *(_OWORD *)((char *)&v158[8] + 7) = v156[8];
  *(_OWORD *)((char *)&v158[1] + 7) = v156[1];
  *(_OWORD *)((char *)&v158[2] + 7) = v156[2];
  *(_OWORD *)((char *)&v158[3] + 7) = v156[3];
  char v159 = 1;
  *(void *)((char *)&v158[12] + 7) = v157;
  *(_OWORD *)((char *)&v158[4] + 7) = v156[4];
  *(_OWORD *)((char *)v158 + 7) = v156[0];
  int v104 = 1;
  long long v170 = v158[10];
  v171[0] = v158[11];
  *(_OWORD *)((char *)v171 + 15) = *(_OWORD *)((char *)&v158[11] + 15);
  long long v166 = v158[6];
  long long v167 = v158[7];
  long long v169 = v158[9];
  long long v168 = v158[8];
  long long v162 = v158[2];
  long long v163 = v158[3];
  long long v165 = v158[5];
  long long v164 = v158[4];
  long long v161 = v158[1];
  long long v160 = v158[0];
  uint64_t v83 = v21;
  sub_E6E90();
  uint64_t v103 = sub_E6560();
  sub_BE6E0(0xD000000000000017, (void *)0x80000000000F3550, 0xD000000000000018, (void *)0x80000000000F3530, (uint64_t)v172);
  *(_OWORD *)((char *)&v174[9] + 7) = v172[9];
  *(_OWORD *)((char *)&v174[10] + 7) = v172[10];
  *(_OWORD *)((char *)&v174[11] + 7) = v172[11];
  *(_OWORD *)((char *)&v174[5] + 7) = v172[5];
  *(_OWORD *)((char *)&v174[6] + 7) = v172[6];
  *(_OWORD *)((char *)&v174[7] + 7) = v172[7];
  *(_OWORD *)((char *)&v174[8] + 7) = v172[8];
  *(_OWORD *)((char *)&v174[1] + 7) = v172[1];
  *(_OWORD *)((char *)&v174[2] + 7) = v172[2];
  *(_OWORD *)((char *)&v174[3] + 7) = v172[3];
  char v175 = 1;
  *(void *)((char *)&v174[12] + 7) = v173;
  *(_OWORD *)((char *)&v174[4] + 7) = v172[4];
  *(_OWORD *)((char *)v174 + 7) = v172[0];
  int v99 = 1;
  long long v186 = v174[10];
  v187[0] = v174[11];
  *(_OWORD *)((char *)v187 + 15) = *(_OWORD *)((char *)&v174[11] + 15);
  long long v182 = v174[6];
  long long v183 = v174[7];
  long long v185 = v174[9];
  long long v184 = v174[8];
  long long v178 = v174[2];
  long long v179 = v174[3];
  long long v181 = v174[5];
  long long v180 = v174[4];
  long long v177 = v174[1];
  long long v176 = v174[0];
  char v28 = v89;
  sub_E6E90();
  uint64_t v97 = sub_E6560();
  sub_BE6E0(v93, (void *)0x80000000000F3510, 0xD00000000000001CLL, (void *)0x80000000000F34F0, (uint64_t)v188);
  *(_OWORD *)((char *)&v190[9] + 7) = v188[9];
  *(_OWORD *)((char *)&v190[10] + 7) = v188[10];
  *(_OWORD *)((char *)&v190[11] + 7) = v188[11];
  *(_OWORD *)((char *)&v190[5] + 7) = v188[5];
  *(_OWORD *)((char *)&v190[6] + 7) = v188[6];
  *(_OWORD *)((char *)&v190[7] + 7) = v188[7];
  *(_OWORD *)((char *)&v190[8] + 7) = v188[8];
  *(_OWORD *)((char *)&v190[1] + 7) = v188[1];
  *(_OWORD *)((char *)&v190[2] + 7) = v188[2];
  *(_OWORD *)((char *)&v190[3] + 7) = v188[3];
  char v191 = 1;
  *(void *)((char *)&v190[12] + 7) = v189;
  *(_OWORD *)((char *)&v190[4] + 7) = v188[4];
  *(_OWORD *)((char *)v190 + 7) = v188[0];
  LODWORD(v93) = 1;
  long long v202 = v190[10];
  v203[0] = v190[11];
  *(_OWORD *)((char *)v203 + 15) = *(_OWORD *)((char *)&v190[11] + 15);
  long long v198 = v190[6];
  long long v199 = v190[7];
  long long v201 = v190[9];
  long long v200 = v190[8];
  long long v194 = v190[2];
  long long v195 = v190[3];
  long long v197 = v190[5];
  long long v196 = v190[4];
  long long v193 = v190[1];
  long long v192 = v190[0];
  uint64_t v29 = v87;
  sub_E6E90();
  uint64_t v84 = sub_E6560();
  sub_BE6E0(0xD000000000000016, (void *)0x80000000000F34D0, 0xD000000000000017, (void *)0x80000000000F34B0, (uint64_t)v204);
  *(_OWORD *)((char *)&v206[9] + 7) = v204[9];
  *(_OWORD *)((char *)&v206[10] + 7) = v204[10];
  *(_OWORD *)((char *)&v206[11] + 7) = v204[11];
  *(_OWORD *)((char *)&v206[5] + 7) = v204[5];
  *(_OWORD *)((char *)&v206[6] + 7) = v204[6];
  *(_OWORD *)((char *)&v206[7] + 7) = v204[7];
  *(_OWORD *)((char *)&v206[8] + 7) = v204[8];
  *(_OWORD *)((char *)&v206[1] + 7) = v204[1];
  *(_OWORD *)((char *)&v206[2] + 7) = v204[2];
  *(_OWORD *)((char *)&v206[3] + 7) = v204[3];
  char v207 = 1;
  *(void *)((char *)&v206[12] + 7) = v205;
  *(_OWORD *)((char *)&v206[4] + 7) = v204[4];
  *(_OWORD *)((char *)v206 + 7) = v204[0];
  int v88 = 1;
  long long v218 = v206[10];
  v219[0] = v206[11];
  *(_OWORD *)((char *)v219 + 15) = *(_OWORD *)((char *)&v206[11] + 15);
  long long v214 = v206[6];
  long long v215 = v206[7];
  long long v217 = v206[9];
  long long v216 = v206[8];
  long long v210 = v206[2];
  long long v211 = v206[3];
  long long v213 = v206[5];
  long long v212 = v206[4];
  long long v209 = v206[1];
  long long v208 = v206[0];
  uint64_t v30 = v86;
  sub_E6E90();
  unsigned __int8 v155 = v98;
  uint64_t v31 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v102 + 16);
  uint64_t v32 = v92;
  v31(v92, v100, v2);
  long long v153 = v170;
  v154[0] = v171[0];
  *(_OWORD *)((char *)v154 + 15) = *(_OWORD *)((char *)v171 + 15);
  long long v149 = v166;
  long long v150 = v167;
  long long v151 = v168;
  long long v152 = v169;
  long long v145 = v162;
  long long v146 = v163;
  long long v147 = v164;
  long long v148 = v165;
  long long v143 = v160;
  long long v144 = v161;
  uint64_t v33 = v90;
  v31(v90, v21, v2);
  long long v141 = v186;
  v142[0] = v187[0];
  *(_OWORD *)((char *)v142 + 15) = *(_OWORD *)((char *)v187 + 15);
  long long v137 = v182;
  long long v138 = v183;
  long long v139 = v184;
  long long v140 = v185;
  long long v133 = v178;
  long long v134 = v179;
  long long v135 = v180;
  long long v136 = v181;
  long long v131 = v176;
  long long v132 = v177;
  uint64_t v34 = v91;
  v31(v91, v28, v2);
  long long v129 = v202;
  v130[0] = v203[0];
  *(_OWORD *)((char *)v130 + 15) = *(_OWORD *)((char *)v203 + 15);
  long long v125 = v198;
  long long v126 = v199;
  long long v127 = v200;
  long long v128 = v201;
  long long v121 = v194;
  long long v122 = v195;
  long long v123 = v196;
  long long v124 = v197;
  long long v119 = v192;
  long long v120 = v193;
  v31(v106, v29, v2);
  long long v117 = v218;
  v118[0] = v219[0];
  *(_OWORD *)((char *)v118 + 15) = *(_OWORD *)((char *)v219 + 15);
  long long v113 = v214;
  long long v114 = v215;
  long long v115 = v216;
  long long v116 = v217;
  long long v109 = v210;
  long long v110 = v211;
  long long v111 = v212;
  long long v112 = v213;
  long long v107 = v208;
  long long v108 = v209;
  v31(v101, v30, v2);
  unsigned __int8 v35 = v155;
  int v82 = v155;
  uint64_t v36 = v85;
  uint64_t v37 = v94;
  void *v85 = v95;
  v36[1] = v37;
  *((unsigned char *)v36 + 16) = v35;
  v36[3] = v96;
  char v38 = (int *)sub_10C7C(&qword_125590);
  v31((unsigned char *)v36 + v38[12], v32, v2);
  uint64_t v39 = v38[16];
  *(_OWORD *)((char *)&v221[9] + 1) = v152;
  *(_OWORD *)((char *)&v221[10] + 1) = v153;
  *(_OWORD *)((char *)&v221[11] + 1) = v154[0];
  v221[12] = *(_OWORD *)((char *)v154 + 15);
  *(_OWORD *)((char *)&v221[5] + 1) = v148;
  *(_OWORD *)((char *)&v221[6] + 1) = v149;
  *(_OWORD *)((char *)&v221[7] + 1) = v150;
  *(_OWORD *)((char *)&v221[8] + 1) = v151;
  *(_OWORD *)((char *)&v221[2] + 1) = v145;
  uint64_t v40 = (_OWORD *)((char *)v36 + v39);
  long long v220 = (unint64_t)v105;
  LOBYTE(v221[0]) = v104;
  *(_OWORD *)((char *)&v221[3] + 1) = v146;
  *(_OWORD *)((char *)&v221[4] + 1) = v147;
  *(_OWORD *)((char *)&v221[1] + 1) = v144;
  *(_OWORD *)((char *)v221 + 1) = v143;
  long long v41 = v221[10];
  v40[10] = v221[9];
  v40[11] = v41;
  long long v42 = v221[12];
  v40[12] = v221[11];
  v40[13] = v42;
  long long v43 = v221[6];
  v40[6] = v221[5];
  v40[7] = v43;
  long long v44 = v221[8];
  v40[8] = v221[7];
  v40[9] = v44;
  long long v45 = v221[2];
  v40[2] = v221[1];
  v40[3] = v45;
  long long v46 = v221[4];
  v40[4] = v221[3];
  v40[5] = v46;
  long long v47 = v221[0];
  *uint64_t v40 = v220;
  v40[1] = v47;
  v31((unsigned char *)v36 + v38[20], v33, v2);
  uint64_t v48 = v38[24];
  *(_OWORD *)((char *)&v223[9] + 1) = v140;
  *(_OWORD *)((char *)&v223[10] + 1) = v141;
  *(_OWORD *)((char *)&v223[11] + 1) = v142[0];
  v223[12] = *(_OWORD *)((char *)v142 + 15);
  *(_OWORD *)((char *)&v223[5] + 1) = v136;
  *(_OWORD *)((char *)&v223[6] + 1) = v137;
  *(_OWORD *)((char *)&v223[7] + 1) = v138;
  *(_OWORD *)((char *)&v223[8] + 1) = v139;
  *(_OWORD *)((char *)&v223[4] + 1) = v135;
  *(_OWORD *)((char *)&v223[1] + 1) = v132;
  *(_OWORD *)((char *)&v223[2] + 1) = v133;
  uint64_t v49 = (_OWORD *)((char *)v36 + v48);
  long long v222 = (unint64_t)v103;
  LOBYTE(v223[0]) = v99;
  *(_OWORD *)((char *)&v223[3] + 1) = v134;
  *(_OWORD *)((char *)v223 + 1) = v131;
  long long v50 = v223[10];
  v49[10] = v223[9];
  v49[11] = v50;
  long long v51 = v223[12];
  v49[12] = v223[11];
  v49[13] = v51;
  long long v52 = v223[6];
  v49[6] = v223[5];
  v49[7] = v52;
  long long v53 = v223[8];
  v49[8] = v223[7];
  v49[9] = v53;
  long long v54 = v223[2];
  _DWORD v49[2] = v223[1];
  v49[3] = v54;
  long long v55 = v223[4];
  v49[4] = v223[3];
  v49[5] = v55;
  long long v56 = v223[0];
  *uint64_t v49 = v222;
  v49[1] = v56;
  v31((unsigned char *)v36 + v38[28], v34, v2);
  uint64_t v57 = v38[32];
  *(_OWORD *)((char *)&v225[9] + 1) = v128;
  *(_OWORD *)((char *)&v225[10] + 1) = v129;
  *(_OWORD *)((char *)&v225[11] + 1) = v130[0];
  v225[12] = *(_OWORD *)((char *)v130 + 15);
  *(_OWORD *)((char *)&v225[6] + 1) = v125;
  *(_OWORD *)((char *)&v225[7] + 1) = v126;
  *(_OWORD *)((char *)&v225[8] + 1) = v127;
  *(_OWORD *)((char *)&v225[5] + 1) = v124;
  *(_OWORD *)((char *)&v225[1] + 1) = v120;
  *(_OWORD *)((char *)&v225[2] + 1) = v121;
  *(_OWORD *)((char *)&v225[3] + 1) = v122;
  char v58 = (_OWORD *)((char *)v36 + v57);
  long long v224 = (unint64_t)v97;
  LOBYTE(v225[0]) = v93;
  *(_OWORD *)((char *)&v225[4] + 1) = v123;
  *(_OWORD *)((char *)v225 + 1) = v119;
  long long v59 = v225[10];
  v58[10] = v225[9];
  v58[11] = v59;
  long long v60 = v225[12];
  v58[12] = v225[11];
  v58[13] = v60;
  long long v61 = v225[6];
  v58[6] = v225[5];
  v58[7] = v61;
  long long v62 = v225[8];
  v58[8] = v225[7];
  v58[9] = v62;
  long long v63 = v225[2];
  v58[2] = v225[1];
  v58[3] = v63;
  long long v64 = v225[4];
  v58[4] = v225[3];
  v58[5] = v64;
  long long v65 = v225[0];
  *char v58 = v224;
  v58[1] = v65;
  v31((unsigned char *)v36 + v38[36], v106, v2);
  uint64_t v66 = v38[40];
  *(_OWORD *)((char *)&v227[9] + 1) = v116;
  *(_OWORD *)((char *)&v227[10] + 1) = v117;
  *(_OWORD *)((char *)&v227[11] + 1) = v118[0];
  v227[12] = *(_OWORD *)((char *)v118 + 15);
  *(_OWORD *)((char *)&v227[8] + 1) = v115;
  *(_OWORD *)((char *)&v227[5] + 1) = v112;
  *(_OWORD *)((char *)&v227[6] + 1) = v113;
  *(_OWORD *)((char *)&v227[7] + 1) = v114;
  *(_OWORD *)((char *)&v227[1] + 1) = v108;
  *(_OWORD *)((char *)&v227[2] + 1) = v109;
  *(_OWORD *)((char *)&v227[3] + 1) = v110;
  uint64_t v67 = (_OWORD *)((char *)v36 + v66);
  uint64_t v68 = v84;
  long long v226 = (unint64_t)v84;
  LOBYTE(v227[0]) = v88;
  *(_OWORD *)((char *)&v227[4] + 1) = v111;
  *(_OWORD *)((char *)v227 + 1) = v107;
  long long v69 = v227[10];
  v67[10] = v227[9];
  v67[11] = v69;
  long long v70 = v227[12];
  v67[12] = v227[11];
  v67[13] = v70;
  long long v71 = v227[6];
  v67[6] = v227[5];
  v67[7] = v71;
  long long v72 = v227[8];
  v67[8] = v227[7];
  v67[9] = v72;
  long long v73 = v227[2];
  v67[2] = v227[1];
  v67[3] = v73;
  long long v74 = v227[4];
  v67[4] = v227[3];
  v67[5] = v74;
  long long v75 = v227[0];
  *uint64_t v67 = v226;
  v67[1] = v75;
  uint64_t v76 = v101;
  v31((unsigned char *)v36 + v38[44], v101, v2);
  uint64_t v78 = v94;
  uint64_t v77 = v95;
  sub_18804(v95, v94, v82);
  swift_bridgeObjectRetain();
  sub_C0638((uint64_t)&v220);
  sub_C0638((uint64_t)&v222);
  sub_C0638((uint64_t)&v224);
  sub_C0638((uint64_t)&v226);
  LOBYTE(v31) = v98;
  sub_18804(v77, v78, v98);
  swift_bridgeObjectRetain();
  sub_C06CC((uint64_t)v156);
  sub_C06CC((uint64_t)v172);
  sub_C06CC((uint64_t)v188);
  uint64_t v79 = *(void (**)(unsigned char *, uint64_t))(v102 + 8);
  v79(v86, v2);
  v79(v87, v2);
  sub_C0760((uint64_t)v188);
  v79(v89, v2);
  sub_C0760((uint64_t)v172);
  v79(v83, v2);
  sub_C0760((uint64_t)v156);
  v79(v100, v2);
  sub_18814(v77, v78, (char)v31);
  swift_bridgeObjectRelease();
  v79(v76, v2);
  long long v239 = v116;
  long long v240 = v117;
  *(_OWORD *)v241 = v118[0];
  *(_OWORD *)&v241[15] = *(_OWORD *)((char *)v118 + 15);
  long long v235 = v112;
  long long v236 = v113;
  long long v237 = v114;
  long long v238 = v115;
  long long v231 = v108;
  long long v232 = v109;
  long long v233 = v110;
  long long v234 = v111;
  v228[0] = v68;
  v228[1] = 0;
  char v229 = v88;
  long long v230 = v107;
  sub_C07F4((uint64_t)v228);
  v79(v106, v2);
  long long v253 = v128;
  long long v254 = v129;
  *(_OWORD *)v255 = v130[0];
  *(_OWORD *)&v255[15] = *(_OWORD *)((char *)v130 + 15);
  long long v249 = v124;
  long long v250 = v125;
  long long v251 = v126;
  long long v252 = v127;
  long long v245 = v120;
  long long v246 = v121;
  long long v247 = v122;
  long long v248 = v123;
  v242[0] = v97;
  v242[1] = 0;
  char v243 = v93;
  long long v244 = v119;
  sub_C07F4((uint64_t)v242);
  v79(v91, v2);
  long long v267 = v140;
  long long v268 = v141;
  *(_OWORD *)v269 = v142[0];
  *(_OWORD *)&v269[15] = *(_OWORD *)((char *)v142 + 15);
  long long v263 = v136;
  long long v264 = v137;
  long long v265 = v138;
  long long v266 = v139;
  long long v259 = v132;
  long long v260 = v133;
  long long v261 = v134;
  long long v262 = v135;
  v256[0] = v103;
  v256[1] = 0;
  char v257 = v99;
  long long v258 = v131;
  sub_C07F4((uint64_t)v256);
  v79(v90, v2);
  long long v282 = v152;
  long long v283 = v153;
  v284[0] = v154[0];
  *(_OWORD *)((char *)v284 + 15) = *(_OWORD *)((char *)v154 + 15);
  long long v278 = v148;
  long long v279 = v149;
  long long v280 = v150;
  long long v281 = v151;
  long long v274 = v144;
  long long v275 = v145;
  long long v276 = v146;
  long long v277 = v147;
  uint64_t v270 = v105;
  uint64_t v271 = 0;
  char v272 = v104;
  long long v273 = v143;
  sub_C07F4((uint64_t)&v270);
  v79(v92, v2);
  sub_18814(v77, v78, v155);
  return swift_bridgeObjectRelease();
}

uint64_t sub_BE6E0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v55 = a3;
  long long v56 = a4;
  uint64_t v51 = a1;
  long long v52 = a2;
  uint64_t v6 = sub_E6C40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_E6C50();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E6C30();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Image.Interpolation.high(_:), v10);
  sub_E6C60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v63 = sub_E6C90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_E6F30();
  sub_E62A0();
  uint64_t v61 = v66;
  uint64_t v62 = v64;
  int v57 = v67;
  int v58 = v65;
  uint64_t v59 = v69;
  uint64_t v60 = v68;
  uint64_t v54 = sub_E65D0();
  uint64_t v53 = sub_E6560();
  uint64_t v95 = sub_B7108(v51, v52);
  uint64_t v96 = v14;
  long long v52 = (void *)sub_187B0();
  uint64_t v15 = sub_E6920();
  uint64_t v17 = v16;
  LOBYTE(v13) = v18 & 1;
  sub_E6800();
  uint64_t v19 = sub_E68D0();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  LOBYTE(v11) = v24 & 1;
  sub_18814(v15, v17, (char)v13);
  swift_bridgeObjectRelease();
  LOBYTE(v95) = v11;
  LOBYTE(v80[0]) = 1;
  sub_18804(v19, v21, v11);
  uint64_t v51 = v23;
  swift_bridgeObjectRetain();
  sub_18814(v19, v21, v11);
  swift_bridgeObjectRelease();
  LOBYTE(v10) = v95;
  LOBYTE(v23) = v80[0];
  uint64_t v95 = sub_B7108(v55, v56);
  uint64_t v96 = v25;
  uint64_t v26 = sub_E6920();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  LOBYTE(v95) = v10;
  LOBYTE(v80[0]) = 1;
  LOBYTE(v17) = v31 & 1;
  LOBYTE(v90[0]) = v10;
  LOBYTE(v88[0]) = v23;
  LOBYTE(v78[0]) = v31 & 1;
  sub_18804(v19, v21, v10);
  uint64_t v32 = v51;
  swift_bridgeObjectRetain();
  sub_18804(v26, v28, v17);
  swift_bridgeObjectRetain();
  sub_18814(v26, v28, v17);
  swift_bridgeObjectRelease();
  sub_18814(v19, v21, v95);
  swift_bridgeObjectRelease();
  char v33 = v80[0];
  char v73 = v88[0];
  char v71 = v78[0];
  *(_DWORD *)int v98 = v78[0];
  *(_DWORD *)&v98[3] = *(_DWORD *)((char *)v78 + 3);
  *(_DWORD *)&v102[3] = *(_DWORD *)&v76[3];
  *(_DWORD *)uint64_t v102 = *(_DWORD *)v76;
  *(_DWORD *)&v106[3] = *(_DWORD *)&v74[3];
  *(_DWORD *)&v110[3] = *(_DWORD *)&v72[3];
  *(_DWORD *)long long v110 = *(_DWORD *)v72;
  *(_DWORD *)&v114[3] = *(_DWORD *)&v70[3];
  *(_DWORD *)long long v114 = *(_DWORD *)v70;
  *(_DWORD *)uint64_t v106 = *(_DWORD *)v74;
  DWORD1(v81) = *(_DWORD *)((char *)v78 + 3);
  char v34 = v90[0];
  char v79 = 1;
  char v77 = v80[0];
  char v75 = v90[0];
  *(_DWORD *)((char *)&v81 + 1) = v78[0];
  HIDWORD(v82) = *(_DWORD *)&v76[3];
  char v35 = v88[0];
  *(_DWORD *)((char *)&v82 + 9) = *(_DWORD *)v76;
  DWORD1(v84) = *(_DWORD *)&v74[3];
  char v36 = v78[0];
  uint64_t v37 = v53;
  uint64_t v38 = v54;
  v80[0] = v54;
  v80[1] = 0;
  LOBYTE(v81) = 1;
  *((void *)&v81 + 1) = v53;
  *(void *)&long long v82 = 0;
  BYTE8(v82) = v77;
  *(void *)&long long v83 = v19;
  *((void *)&v83 + 1) = v21;
  LOBYTE(v84) = v90[0];
  *(_DWORD *)((char *)&v84 + 1) = *(_DWORD *)v74;
  *((void *)&v84 + 1) = v32;
  *(void *)&long long v85 = 0;
  BYTE8(v85) = v88[0];
  HIDWORD(v85) = *(_DWORD *)&v72[3];
  *(_DWORD *)((char *)&v85 + 9) = *(_DWORD *)v72;
  *(void *)&long long v86 = v26;
  *((void *)&v86 + 1) = v28;
  LOBYTE(v87) = v78[0];
  DWORD1(v87) = *(_DWORD *)&v70[3];
  *(_DWORD *)((char *)&v87 + 1) = *(_DWORD *)v70;
  *((void *)&v87 + 1) = v30;
  char v94 = 1;
  char v91 = v58;
  char v89 = v57;
  long long v39 = (unint64_t)v54;
  long long v40 = v81;
  long long v41 = v82;
  *(_OWORD *)(a5 + 120) = v83;
  *(_OWORD *)(a5 + 104) = v41;
  *(_OWORD *)(a5 + 88) = v40;
  *(_OWORD *)(a5 + 72) = v39;
  long long v42 = v84;
  long long v43 = v85;
  long long v44 = v86;
  *(_OWORD *)(a5 + 184) = v87;
  *(_OWORD *)(a5 + 168) = v44;
  *(_OWORD *)(a5 + 152) = v43;
  *(_OWORD *)(a5 + 136) = v42;
  char v45 = v94;
  int v46 = v92;
  *(_WORD *)(a5 + 22) = v93;
  *(_DWORD *)(a5 + 18) = v46;
  LOBYTE(v46) = v91;
  int v47 = v90[0];
  *(_DWORD *)(a5 + 36) = *(_DWORD *)((char *)v90 + 3);
  *(_DWORD *)(a5 + 33) = v47;
  LOBYTE(v47) = v89;
  int v48 = v88[0];
  *(_DWORD *)(a5 + 52) = *(_DWORD *)((char *)v88 + 3);
  *(_DWORD *)(a5 + 49) = v48;
  *(void *)a5 = v63;
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = v45;
  *(unsigned char *)(a5 + 17) = 0;
  *(void *)(a5 + 24) = v62;
  *(unsigned char *)(a5 + 32) = v46;
  *(void *)(a5 + 40) = v61;
  *(unsigned char *)(a5 + 48) = v47;
  uint64_t v49 = v59;
  *(void *)(a5 + 56) = v60;
  *(void *)(a5 + 64) = v49;
  uint64_t v95 = v38;
  uint64_t v96 = 0;
  char v97 = 1;
  uint64_t v99 = v37;
  uint64_t v100 = 0;
  char v101 = v33;
  uint64_t v103 = v19;
  uint64_t v104 = v21;
  char v105 = v34;
  uint64_t v107 = v32;
  uint64_t v108 = 0;
  char v109 = v35;
  uint64_t v111 = v26;
  uint64_t v112 = v28;
  char v113 = v36;
  uint64_t v115 = v30;
  swift_retain();
  sub_C0888((uint64_t)v80);
  sub_C08FC((uint64_t)&v95);
  return swift_release();
}

uint64_t sub_BECE8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v64 = a1;
  long long v74 = a2;
  uint64_t v71 = sub_E6360();
  uint64_t v73 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v69 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_10C7C(&qword_125570);
  uint64_t v79 = *(void *)(v72 - 8);
  uint64_t v4 = __chkstk_darwin(v72);
  long long v70 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v78 = (char *)&v57 - v6;
  uint64_t v7 = sub_E66A0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v14 = sub_10C7C(&qword_122B88);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10C7C(&qword_125578);
  uint64_t v66 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_10C7C(&qword_125580);
  uint64_t v77 = *(void *)(v65 - 8);
  uint64_t v21 = __chkstk_darwin(v65);
  char v75 = (char *)&v57 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v76 = (char *)&v57 - v23;
  uint64_t v80 = sub_B7108(0xD000000000000015, (void *)0x80000000000F3470);
  uint64_t v81 = v24;
  uint64_t v59 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C02A8(a1, v59);
  uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v62 = v25 | 7;
  uint64_t v63 = v26 + v13;
  uint64_t v27 = swift_allocObject();
  sub_C0310((uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  sub_187B0();
  sub_E6DA0();
  sub_E67F0();
  uint64_t v28 = sub_C0414(&qword_122BA0, &qword_122B88);
  sub_E6960();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v60 = v15 + 8;
  uint64_t v61 = v29;
  uint64_t v58 = v14;
  v29(v17, v14);
  sub_E6690();
  uint64_t v80 = v14;
  uint64_t v81 = v28;
  swift_getOpaqueTypeConformance2();
  sub_C0458();
  uint64_t v30 = v75;
  uint64_t v31 = v67;
  sub_E6990();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v10, v31);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v20, v18);
  uint64_t v32 = v76;
  uint64_t v33 = v77;
  uint64_t v34 = v65;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v30, v65);
  uint64_t v35 = v59;
  sub_C02A8(v64, v59);
  uint64_t v36 = swift_allocObject();
  sub_C0310(v35, v36 + v26);
  sub_E6D80();
  uint64_t v37 = v69;
  sub_E6350();
  uint64_t v38 = v70;
  uint64_t v39 = v58;
  sub_E69F0();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v37, v71);
  v61(v17, v39);
  long long v40 = v78;
  uint64_t v41 = v79;
  long long v42 = v38;
  long long v43 = v38;
  uint64_t v44 = v72;
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v78, v42, v72);
  char v45 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  int v46 = v75;
  v45(v75, v32, v34);
  int v47 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  int v48 = v40;
  uint64_t v49 = v44;
  v47(v43, v48, v44);
  long long v50 = v74;
  void *v74 = 0;
  *((unsigned char *)v50 + 8) = 1;
  uint64_t v51 = (char *)v50;
  long long v52 = (int *)sub_10C7C(&qword_125588);
  v45(&v51[v52[12]], v46, v34);
  uint64_t v53 = &v51[v52[16]];
  *(void *)uint64_t v53 = 0;
  v53[8] = 1;
  v47(&v51[v52[20]], v43, v49);
  uint64_t v54 = *(void (**)(char *, uint64_t))(v79 + 8);
  v54(v78, v49);
  uint64_t v55 = *(void (**)(char *, uint64_t))(v77 + 8);
  v55(v76, v34);
  v54(v43, v49);
  return ((uint64_t (*)(char *, uint64_t))v55)(v46, v34);
}

uint64_t sub_BF4D4()
{
  uint64_t v0 = sub_E62C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_BC934((uint64_t)v3);
  sub_E62B0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_BF5A0@<X0>(uint64_t a1@<X8>)
{
  sub_B7108(1162760004, (void *)0xE400000000000000);
  sub_187B0();
  uint64_t result = sub_E6920();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_BF604@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10C7C(&qword_125460);
  swift_storeEnumTagMultiPayload();
  uint64_t result = type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v3 = (uint64_t *)((char *)a1 + *(int *)(result + 20));
  void *v3 = 0;
  v3[1] = 0;
  return result;
}

uint64_t sub_BF668@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_10C7C(&qword_125460);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_BF6C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_C01E8(a1, a4, &qword_125480);
  uint64_t result = type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v8 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_BF714()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_BF738()
{
  return sub_E69D0();
}

uint64_t sub_BF754@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10C7C(&qword_125468);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_E65D0();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v7 = sub_10C7C(&qword_125470);
  sub_BCE38(v2, (uint64_t *)&v6[*(int *)(v7 + 44)]);
  sub_E6F30();
  sub_E62A0();
  sub_C0970((uint64_t)v6, a1, &qword_125468);
  uint64_t v8 = (_OWORD *)(a1 + *(int *)(sub_10C7C(&qword_125478) + 36));
  long long v9 = v11[1];
  *uint64_t v8 = v11[0];
  v8[1] = v9;
  uint64_t v8[2] = v11[2];
  return sub_C024C((uint64_t)v6, &qword_125468);
}

uint64_t *sub_BF86C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10C7C(&qword_125460);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E62C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    if (*v11)
    {
      uint64_t v12 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v12;
      swift_retain();
    }
    else
    {
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    }
  }
  return a1;
}

uint64_t sub_BF9A8(uint64_t a1, uint64_t a2)
{
  sub_10C7C(&qword_125460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_E62C0();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + *(int *)(a2 + 20)))
  {
    return swift_release();
  }
  return result;
}

void *sub_BFA60(void *a1, void *a2, uint64_t a3)
{
  sub_10C7C(&qword_125460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E62C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  if (*v9)
  {
    uint64_t v10 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  }
  return a1;
}

void *sub_BFB4C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_C024C((uint64_t)a1, &qword_125460);
    sub_10C7C(&qword_125460);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_E62C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = *(void *)((char *)a1 + v7);
  uint64_t v11 = *v9;
  if (!v10)
  {
    if (v11)
    {
      uint64_t v13 = v9[1];
      *uint64_t v8 = v11;
      v8[1] = v13;
      swift_retain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
    return a1;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_12;
  }
  uint64_t v12 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v12;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_BFC80(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10C7C(&qword_125460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_E62C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  if (*(void *)v10)
  {
    uint64_t v12 = *((void *)v10 + 1);
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
  }
  else
  {
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  }
  return a1;
}

char *sub_BFD70(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_C024C((uint64_t)a1, &qword_125460);
    uint64_t v6 = sub_10C7C(&qword_125460);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E62C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)&a1[v8];
  uint64_t v12 = *(void *)v10;
  if (!v11)
  {
    if (v12)
    {
      uint64_t v14 = *((void *)v10 + 1);
      *(void *)uint64_t v9 = v12;
      *((void *)v9 + 1) = v14;
      return a1;
    }
LABEL_11:
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    return a1;
  }
  if (!v12)
  {
    swift_release();
    goto LABEL_11;
  }
  uint64_t v13 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v13;
  swift_release();
  return a1;
}

uint64_t sub_BFEA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_BFEB4);
}

uint64_t sub_BFEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10C7C(&qword_125480);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_BFF84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_BFF98);
}

uint64_t sub_BFF98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10C7C(&qword_125480);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

void sub_C0058()
{
  sub_C00EC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_C00EC()
{
  if (!qword_1254E0)
  {
    sub_E62C0();
    unint64_t v0 = sub_E6260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1254E0);
    }
  }
}

unint64_t sub_C0148()
{
  unint64_t result = qword_125510;
  if (!qword_125510)
  {
    sub_11B60(&qword_125478);
    sub_C0414(&qword_125518, &qword_125468);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125510);
  }
  return result;
}

uint64_t sub_C01E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_C024C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_C02A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GCSControllerPairingHelpView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_C0310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GCSControllerPairingHelpView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C0374()
{
  uint64_t v1 = type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(void (**)(uint64_t))(v0
                                      + *(int *)(result + 28)
                                      + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  if (v4)
  {
    uint64_t v5 = swift_retain();
    v4(v5);
    return sub_4F680((uint64_t)v4);
  }
  return result;
}

uint64_t sub_C0414(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_C0458()
{
  unint64_t result = qword_1228C8;
  if (!qword_1228C8)
  {
    sub_E66A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1228C8);
  }
  return result;
}

uint64_t sub_C04B4()
{
  uint64_t v1 = type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_10C7C(&qword_125460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E62C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  if (*(void *)(v0 + v3 + *(int *)(v1 + 20))) {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_C05D8()
{
  type metadata accessor for GCSControllerPairingHelpView();

  return sub_BF4D4();
}

uint64_t sub_C0638(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  char v4 = *(unsigned char *)(a1 + 160);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  char v7 = *(unsigned char *)(a1 + 208);
  swift_retain();
  sub_18804(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_18804(v5, v6, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_C06CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 168);
  uint64_t v6 = *(void *)(a1 + 176);
  char v7 = *(unsigned char *)(a1 + 184);
  swift_retain();
  sub_18804(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_18804(v5, v6, v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_C0760(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 168);
  uint64_t v6 = *(void *)(a1 + 176);
  char v7 = *(unsigned char *)(a1 + 184);
  swift_release();
  sub_18814(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_18814(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_C07F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  char v4 = *(unsigned char *)(a1 + 160);
  uint64_t v5 = *(void *)(a1 + 192);
  uint64_t v6 = *(void *)(a1 + 200);
  char v7 = *(unsigned char *)(a1 + 208);
  swift_release();
  sub_18814(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_18814(v5, v6, v7);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_C0888(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_18804(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRetain();
  sub_18804(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_C08FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_18814(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_18814(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_C0970(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

BOOL sub_C09D8(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_C1C08(a1, v3);

  swift_release();
  return v4 != 0;
}

uint64_t sub_C0A38(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_C1C08(a1, v3);

  return v4;
}

uint64_t sub_C0A8C(void *a1)
{
  unint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 536))();
  id v4 = a1;
  uint64_t v5 = sub_C1C08(v3, v4);
  swift_bridgeObjectRelease();

  if (!v5)
  {
    unint64_t v6 = (*(uint64_t (**)(void))(*(void *)v1 + 728))();
    id v7 = v4;
    uint64_t v5 = sub_C1C08(v6, v7);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_C0B78(void *a1)
{
  unint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 536))();
  id v4 = a1;
  uint64_t v5 = sub_C1C08(v3, v4);
  swift_bridgeObjectRelease();

  if (v5) {
    return v5;
  }
  unint64_t v6 = (*(uint64_t (**)(void))(*(void *)v1 + 728))();
  id v7 = v4;
  uint64_t v5 = sub_C1C08(v6, v7);
  swift_bridgeObjectRelease();

  if (v5) {
    return v5;
  }
  type metadata accessor for Device();
  return sub_8E5D0(v7);
}

uint64_t sub_C0C80(uint64_t a1, unint64_t a2)
{
  swift_retain();
  uint64_t v4 = sub_C1E60(a2, a1);
  swift_release();
  return v4;
}

unint64_t sub_C0CE0()
{
  uint64_t v1 = v0;
  unint64_t result = (*(uint64_t (**)(void))(*(void *)v0 + 536))();
  unint64_t v3 = result;
  if (result >> 62)
  {
    unint64_t result = sub_E7570();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      goto LABEL_14;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_38;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = sub_E74E0();
    }
    else
    {
      uint64_t v6 = *(void *)(v3 + 8 * i + 32);
      swift_retain();
    }
    id v7 = (void *)(*(uint64_t (**)(void))(*(void *)v6 + 416))();

    if (v7)
    {
      sub_E7510();
      sub_E7540();
      sub_E7550();
      sub_E7520();
    }
    else
    {
      swift_release();
    }
  }
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_C10C8((unint64_t)_swiftEmptyArrayStorage);
  unint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 728))(v8);
  unint64_t v9 = result;
  if (result >> 62)
  {
    unint64_t result = sub_E7570();
    uint64_t v10 = result;
    if (!result) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (!v10) {
      goto LABEL_27;
    }
  }
  if (v10 < 1)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  for (uint64_t j = 0; j != v10; ++j)
  {
    if ((v9 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = sub_E74E0();
    }
    else
    {
      uint64_t v12 = *(void *)(v9 + 8 * j + 32);
      swift_retain();
    }
    uint64_t v13 = (void *)(*(uint64_t (**)(void))(*(void *)v12 + 416))();

    if (v13)
    {
      sub_E7510();
      sub_E7540();
      sub_E7550();
      sub_E7520();
    }
    else
    {
      swift_release();
    }
  }
LABEL_27:
  swift_bridgeObjectRelease();
  unint64_t result = sub_C10C8((unint64_t)_swiftEmptyArrayStorage);
  if ((unint64_t)_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_E7570();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v14) {
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v14 = *(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
    if (!v14) {
      goto LABEL_32;
    }
  }
  if (v14 < 1)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  uint64_t v15 = 0;
  do
  {
    uint64_t v16 = _swiftEmptyArrayStorage[v15++ + 4];
    uint64_t v17 = *(void (**)(void))(*(void *)v16 + 424);
    swift_retain();
    v17(0);
    swift_release();
  }
  while (v14 != v15);
LABEL_32:
  swift_bridgeObjectRelease();
  uint64_t v18 = *(uint64_t (**)(void))(*(void *)v1 + 496);

  return v18(0);
}

uint64_t sub_C10C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_E7570();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_E7570();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_E74F0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_C1508(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_E7570();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_E7230();
}

uint64_t sub_C1294@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  id v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_8ACB8(a2, a3);
      uint64_t v10 = (char *)sub_E5EC0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_E5EE0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_E5ED0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0xC14F8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_8AD64(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_E5EC0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_E5EE0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_E5ED0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_C1508(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_E7570();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_E7570();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_C2010();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_10C7C(&qword_122250);
            uint64_t v10 = sub_C16A8(v13, i, a3);
            uint64_t v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        type metadata accessor for Device();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_C16A8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_C1758(v6, a2, a3);
  return sub_C1710;
}

void sub_C1710(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_C1758(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_E74E0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_C17D8;
  }
  __break(1u);
  return result;
}

uint64_t sub_C17D8()
{
  return swift_release();
}

uint64_t sub_C17E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_C1294((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_C18B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_E5EC0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_E5EE0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_E5ED0();
  sub_C1294(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_C1970(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0xC1BD8);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_8ACB8(a3, a4);
                  sub_8ACB8(a1, a2);
                  char v17 = sub_C18B8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_8AD64(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_8ACB8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_C18B8(v21, v22, v20, a3, a4);
                  sub_8AD64(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_8ACB8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_8ACB8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_C17E0(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_8AD64(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_C1C08(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_E7570();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      uint64_t v4 = 4;
      p_base_props = (__objc2_prop_list **)(&ResourceBundleClass + 64);
      while (1)
      {
        uint64_t v6 = v4 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = sub_E74E0();
          uint64_t v8 = v4 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v7 = *(void *)(a1 + 8 * v4);
          swift_retain();
          uint64_t v8 = v4 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_24:
            __break(1u);
            goto LABEL_25;
          }
        }
        uint64_t v9 = (void *)(*(uint64_t (**)(void))(*(void *)v7 + 264))();
        id v10 = objc_msgSend(v9, (SEL)p_base_props[60]);

        if (v10)
        {
          uint64_t v11 = sub_E5F80();
          unint64_t v13 = v12;
        }
        else
        {
          uint64_t v11 = 0;
          unint64_t v13 = 0xF000000000000000;
        }
        id v14 = objc_msgSend(a2, (SEL)p_base_props[60]);
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = sub_E5F80();
          unint64_t v18 = v17;

          if (v13 >> 60 == 15)
          {
            if (v18 >> 60 == 15) {
              goto LABEL_27;
            }
          }
          else if (v18 >> 60 != 15)
          {
            sub_8ACB8(v11, v13);
            char v19 = sub_C1970(v11, v13, v16, v18);
            sub_C20AC(v16, v18);
            sub_C20AC(v11, v13);
            sub_C20AC(v11, v13);
            if (v19) {
              goto LABEL_27;
            }
            goto LABEL_6;
          }
        }
        else
        {
          if (v13 >> 60 == 15) {
            goto LABEL_27;
          }
          uint64_t v16 = 0;
          unint64_t v18 = 0xF000000000000000;
        }
        sub_C20AC(v11, v13);
        sub_C20AC(v16, v18);
LABEL_6:
        swift_release();
        ++v4;
        p_base_props = &ResourceBundleClass.base_props;
        if (v8 == v3)
        {
          uint64_t v7 = 0;
          goto LABEL_27;
        }
      }
    }
  }
  uint64_t v7 = 0;
LABEL_27:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_C1E60(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (v3) {
      goto LABEL_3;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_E7570();
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
LABEL_3:
  unint64_t v12 = v2 & 0xC000000000000001;
  sub_C206C();
  uint64_t v4 = 0;
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)a2 + 264);
  uint64_t v6 = v2;
  while (1)
  {
    if (v12)
    {
      uint64_t v2 = sub_E74E0();
    }
    else
    {
      uint64_t v2 = *(void *)(v2 + 8 * v4 + 32);
      swift_retain();
    }
    uint64_t v7 = (void *)(*(uint64_t (**)(void))(*(void *)v2 + 264))();
    uint64_t v8 = (void *)v5();
    char v9 = sub_E7390();
    swift_release();

    if (v9) {
      return v4;
    }
    uint64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    ++v4;
    uint64_t v2 = v6;
    if (v10 == v3) {
      return 0;
    }
  }
}

unint64_t sub_C2010()
{
  unint64_t result = qword_125598;
  if (!qword_125598)
  {
    sub_11B60(&qword_122250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125598);
  }
  return result;
}

unint64_t sub_C206C()
{
  unint64_t result = qword_1255A0;
  if (!qword_1255A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1255A0);
  }
  return result;
}

uint64_t sub_C20AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_8AD64(a1, a2);
  }
  return a1;
}

uint64_t sub_C20C0()
{
  sub_E6D10();
  return v1;
}

uint64_t sub_C20FC()
{
  return 0;
}

id sub_C2104()
{
  unsigned __int8 v1 = *(void **)(v0 + 16);
  if (v1)
  {
    return v1;
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    id result = (id)sub_E63E0();
    __break(1u);
  }
  return result;
}

uint64_t sub_C2194()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = type metadata accessor for GCSPreferencesStore();
  uint64_t v4 = sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);

  return EnvironmentObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_C221C()
{
  sub_10C7C(&qword_122890);
  sub_E6DE0();
  return v1;
}

uint64_t sub_C226C()
{
  return sub_E6DF0();
}

void (*sub_C22C0(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 48);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_B6E5C((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_10C7C(&qword_122890);
  sub_E6DE0();
  return sub_C2364;
}

void sub_C2364(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  char v3 = *(unsigned char *)(*(void *)a1 + 18);
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(*(void *)a1 + 19);
  void *v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v4;
  *((unsigned char *)v1 + 16) = v5;
  *((unsigned char *)v1 + 17) = v3;
  sub_E6DF0();
  sub_18B48(v2);
  swift_release();

  free(v1);
}

uint64_t sub_C23D8()
{
  sub_10C7C(&qword_122890);
  sub_E6E10();
  return v1;
}

uint64_t sub_C242C()
{
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  return v1;
}

uint64_t sub_C247C()
{
  return sub_E6DF0();
}

void (*sub_C24D0(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  v3[6] = v4;
  v3[7] = v5;
  char v6 = (void *)v1[9];
  unsigned char v3[8] = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  sub_B6E5C((uint64_t)(v3 + 3));
  swift_retain();
  id v7 = v6;
  v3[9] = sub_10C7C(&qword_123590);
  sub_E6DE0();
  return sub_C2578;
}

void sub_C2578(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)a1 + 24;
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  *(void *)(*(void *)a1 + 32) = v4;
  uint64_t v5 = (void *)*((void *)v2 + 8);
  uint64_t v6 = *((void *)v2 + 7);
  *(void *)uint64_t v2 = *((void *)v2 + 6);
  *((void *)v2 + 1) = v6;
  *((void *)v2 + 2) = v5;
  if (a2)
  {
    id v7 = v4;
    sub_E6DF0();
    sub_18B48(v3);
    swift_release();
  }
  else
  {
    sub_E6DF0();
    sub_18B48(v3);
    swift_release();
  }

  free(v2);
}

uint64_t sub_C2634()
{
  sub_10C7C(&qword_123590);
  sub_E6E10();
  return v1;
}

__n128 sub_C2688@<Q0>(uint64_t a1@<X8>)
{
  sub_10C7C(&qword_122BB8);
  sub_E6DE0();
  *(_OWORD *)(a1 + 96) = v9;
  *(_OWORD *)(a1 + 112) = v10;
  *(void *)(a1 + 128) = v11;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  __n128 result = v4;
  *(_OWORD *)a1 = v3;
  *(__n128 *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_C272C()
{
  return sub_E6DF0();
}

void (*sub_C27C4(void *a1))(void **a1, char a2)
{
  long long v3 = malloc(0x358uLL);
  long long v5 = *(_OWORD *)(v1 + 176);
  long long v4 = *(_OWORD *)(v1 + 192);
  long long v6 = *(_OWORD *)(v1 + 160);
  v3[6] = v5;
  v3[7] = v4;
  long long v7 = *(_OWORD *)(v1 + 192);
  unsigned char v3[8] = *(_OWORD *)(v1 + 208);
  long long v9 = *(_OWORD *)(v1 + 112);
  long long v8 = *(_OWORD *)(v1 + 128);
  long long v10 = *(_OWORD *)(v1 + 96);
  v3[2] = v9;
  v3[3] = v8;
  long long v11 = *(_OWORD *)(v1 + 128);
  long long v13 = *(_OWORD *)(v1 + 144);
  long long v12 = *(_OWORD *)(v1 + 160);
  v3[4] = v13;
  v3[5] = v12;
  long long v14 = *(_OWORD *)(v1 + 96);
  long long v15 = *(_OWORD *)(v1 + 80);
  _OWORD *v3 = v15;
  v3[1] = v14;
  *(_OWORD *)((char *)v3 + 248) = v5;
  long long v16 = *(_OWORD *)(v1 + 208);
  *(_OWORD *)((char *)v3 + 264) = v7;
  *(_OWORD *)((char *)v3 + 280) = v16;
  *(_OWORD *)((char *)v3 + 184) = v9;
  *(_OWORD *)((char *)v3 + 200) = v11;
  *(_OWORD *)((char *)v3 + 216) = v13;
  *(_OWORD *)((char *)v3 + 232) = v6;
  *(_OWORD *)((char *)v3 + 152) = v15;
  *a1 = v3;
  *((void *)v3 + 18) = *(void *)(v1 + 224);
  *((void *)v3 + 37) = *(void *)(v1 + 224);
  *(_OWORD *)((char *)v3 + 168) = v10;
  sub_27E80((uint64_t)v3);
  *((void *)v3 + 106) = sub_10C7C(&qword_122BB8);
  sub_E6DE0();
  return sub_C28B4;
}

void sub_C28B4(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t)*a1 + 152;
  uint64_t v4 = (uint64_t)*a1 + 304;
  long long v5 = (_OWORD *)((char *)v2 + 712);
  if (a2)
  {
    long long v6 = *(_OWORD *)((char *)v2 + 792);
    long long v8 = *(_OWORD *)((char *)v2 + 808);
    long long v7 = *(_OWORD *)((char *)v2 + 824);
    *(_OWORD *)(v4 + 96) = v8;
    *(_OWORD *)(v4 + 112) = v7;
    long long v9 = *(_OWORD *)((char *)v2 + 728);
    long long v11 = *(_OWORD *)((char *)v2 + 744);
    long long v10 = *(_OWORD *)((char *)v2 + 760);
    *(_OWORD *)(v4 + 32) = v11;
    *(_OWORD *)(v4 + 48) = v10;
    long long v12 = *(_OWORD *)((char *)v2 + 760);
    long long v14 = *(_OWORD *)((char *)v2 + 776);
    long long v13 = *(_OWORD *)((char *)v2 + 792);
    *(_OWORD *)(v4 + 64) = v14;
    *(_OWORD *)(v4 + 80) = v13;
    long long v15 = *(_OWORD *)((char *)v2 + 728);
    long long v16 = *v5;
    *(_OWORD *)uint64_t v4 = *v5;
    *(_OWORD *)(v4 + 16) = v15;
    long long v17 = v2[7];
    *(_OWORD *)(v3 + 96) = v2[6];
    *(_OWORD *)(v3 + 112) = v17;
    *(_OWORD *)(v3 + 128) = v2[8];
    long long v18 = v2[3];
    *(_OWORD *)(v3 + 32) = v2[2];
    *(_OWORD *)(v3 + 48) = v18;
    long long v19 = v2[5];
    *(_OWORD *)(v3 + 64) = v2[4];
    *(_OWORD *)(v3 + 80) = v19;
    long long v20 = v2[1];
    *(_OWORD *)uint64_t v3 = *v2;
    *(_OWORD *)(v3 + 16) = v20;
    long long v21 = *(_OWORD *)((char *)v2 + 824);
    v2[42] = v8;
    v2[43] = v21;
    v2[38] = v11;
    v2[39] = v12;
    v2[40] = v14;
    v2[41] = v6;
    *(void *)(v4 + 128) = *((void *)v2 + 105);
    *(void *)(v3 + 144) = *((void *)v2 + 18);
    *((void *)v2 + 88) = *((void *)v2 + 105);
    v2[36] = v16;
    v2[37] = v9;
    sub_27F58((void **)v4);
    sub_E6DF0();
    sub_28014((uint64_t)v2);
    long long v22 = *(_OWORD *)((char *)v2 + 824);
    *(_OWORD *)((char *)v2 + 536) = *(_OWORD *)((char *)v2 + 808);
    *(_OWORD *)((char *)v2 + 552) = v22;
    *((void *)v2 + 71) = *((void *)v2 + 105);
    long long v23 = *(_OWORD *)((char *)v2 + 760);
    *(_OWORD *)((char *)v2 + 472) = *(_OWORD *)((char *)v2 + 744);
    *(_OWORD *)((char *)v2 + 488) = v23;
    long long v24 = *(_OWORD *)((char *)v2 + 792);
    *(_OWORD *)((char *)v2 + 504) = *(_OWORD *)((char *)v2 + 776);
    *(_OWORD *)((char *)v2 + 520) = v24;
    long long v25 = *(_OWORD *)((char *)v2 + 728);
    *(_OWORD *)((char *)v2 + 440) = *v5;
    *(_OWORD *)((char *)v2 + 456) = v25;
    sub_280EC((uint64_t)v2 + 440);
  }
  else
  {
    long long v26 = *(_OWORD *)((char *)v2 + 824);
    *(_OWORD *)(v4 + 96) = *(_OWORD *)((char *)v2 + 808);
    *(_OWORD *)(v4 + 112) = v26;
    *(void *)(v4 + 128) = *((void *)v2 + 105);
    long long v27 = *(_OWORD *)((char *)v2 + 760);
    *(_OWORD *)(v4 + 32) = *(_OWORD *)((char *)v2 + 744);
    *(_OWORD *)(v4 + 48) = v27;
    long long v28 = *(_OWORD *)((char *)v2 + 792);
    *(_OWORD *)(v4 + 64) = *(_OWORD *)((char *)v2 + 776);
    *(_OWORD *)(v4 + 80) = v28;
    long long v29 = *(_OWORD *)((char *)v2 + 728);
    *(_OWORD *)uint64_t v4 = *v5;
    *(_OWORD *)(v4 + 16) = v29;
    long long v30 = v2[7];
    *(_OWORD *)(v3 + 96) = v2[6];
    *(_OWORD *)(v3 + 112) = v30;
    *(_OWORD *)(v3 + 128) = v2[8];
    *(void *)(v3 + 144) = *((void *)v2 + 18);
    long long v31 = v2[3];
    *(_OWORD *)(v3 + 32) = v2[2];
    *(_OWORD *)(v3 + 48) = v31;
    long long v32 = v2[5];
    *(_OWORD *)(v3 + 64) = v2[4];
    *(_OWORD *)(v3 + 80) = v32;
    long long v33 = v2[1];
    *(_OWORD *)uint64_t v3 = *v2;
    *(_OWORD *)(v3 + 16) = v33;
    sub_E6DF0();
    sub_28014((uint64_t)v2);
  }

  free(v2);
}

double sub_C2A4C@<D0>(uint64_t a1@<X8>)
{
  sub_10C7C(&qword_122BB8);
  sub_E6E10();
  *(_OWORD *)(a1 + 96) = v9;
  *(_OWORD *)(a1 + 112) = v10;
  *(_OWORD *)(a1 + 128) = v11;
  *(void *)(a1 + 144) = v12;
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_C2AF8()
{
  return 0;
}

uint64_t sub_C2B04()
{
  uint64_t v1 = *(void *)(v0 + 232);
  sub_4F628(v1);
  return v1;
}

uint64_t sub_C2B38(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_4F680(*(void *)(v2 + 232));
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  return result;
}

uint64_t (*sub_C2B70())()
{
  return nullsub_61;
}

uint64_t sub_C2B94()
{
  uint64_t v1 = (void *)v0[2];
  if (v1)
  {
    id v2 = [v1 controllers];
    sub_3CBE0();
    uint64_t v3 = sub_E7210();

    if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
    {
      sub_C2CE4((uint64_t)v0);
      unint64_t v6 = swift_bridgeObjectRetain();
      uint64_t v4 = (uint64_t)sub_C3E1C(v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = v3 & 0xFFFFFFFFFFFFFF8;
      sub_C2CE4((uint64_t)v0);
      swift_bridgeObjectRetain();
    }
    uint64_t v8 = v4;
    sub_C2CE4((uint64_t)v0);
    sub_C58D4(&v8, v0);
    sub_C5988(v0);
    swift_bridgeObjectRelease();
    sub_C5988(v0);
    return v8;
  }
  else
  {
    long long v7 = (void *)type metadata accessor for GCSPreferencesStore();
    sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    sub_E63E0();
    __break(1u);
    sub_C5988(v7);
    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

uint64_t sub_C2CE4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 72);
  long long v9 = *(void **)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 232);
  id v4 = *(id *)(a1 + 216);
  swift_bridgeObjectRetain();
  swift_retain();
  id v5 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v6 = v3;
  swift_retain();
  swift_retain();
  id v7 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_4F628(v10);
  return a1;
}

uint64_t sub_C2E28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10C7C(&qword_1255A8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = sub_10C7C(&qword_1255B0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  long long v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  long long v16 = (char *)&v40 - v15;
  v42[3] = (uint64_t)&type metadata for GameController;
  v42[4] = sub_B69F4();
  char v17 = sub_E60A0();
  sub_7E3E4((uint64_t)v42);
  if (v17)
  {
    *(void *)long long v16 = sub_E65D0();
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v18 = sub_10C7C(&qword_1255E0);
    sub_C338C(v2, (uint64_t)&v16[*(int *)(v18 + 44)]);
    uint64_t v19 = sub_10C7C(&qword_1255B8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_10C7C(&qword_1255B8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v16, 1, 1, v20);
  }
  long long v21 = *(void **)(v2 + 16);
  if (v21)
  {
    id v22 = [v21 controllers];
    sub_3CBE0();
    uint64_t v23 = sub_E7210();

    if (v23 < 0 || (v23 & 0x4000000000000000) != 0)
    {
      sub_C2CE4(v2);
      unint64_t v39 = swift_bridgeObjectRetain();
      uint64_t v24 = (uint64_t)sub_C3E1C(v39);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = v23 & 0xFFFFFFFFFFFFFF8;
      sub_C2CE4(v2);
      swift_bridgeObjectRetain();
    }
    uint64_t v40 = a1;
    uint64_t v41 = v8;
    v42[0] = v24;
    sub_C2CE4(v2);
    sub_C58D4(v42, (void *)v2);
    sub_C5988((void *)v2);
    swift_bridgeObjectRelease();
    sub_C5988((void *)v2);
    uint64_t v25 = swift_allocObject();
    long long v26 = *(_OWORD *)(v2 + 208);
    *(_OWORD *)(v25 + 208) = *(_OWORD *)(v2 + 192);
    *(_OWORD *)(v25 + 224) = v26;
    *(_OWORD *)(v25 + 240) = *(_OWORD *)(v2 + 224);
    *(void *)(v25 + 256) = *(void *)(v2 + 240);
    long long v27 = *(_OWORD *)(v2 + 144);
    *(_OWORD *)(v25 + 144) = *(_OWORD *)(v2 + 128);
    *(_OWORD *)(v25 + 160) = v27;
    long long v28 = *(_OWORD *)(v2 + 176);
    *(_OWORD *)(v25 + 176) = *(_OWORD *)(v2 + 160);
    *(_OWORD *)(v25 + 192) = v28;
    long long v29 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v25 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v25 + 96) = v29;
    long long v30 = *(_OWORD *)(v2 + 112);
    *(_OWORD *)(v25 + 112) = *(_OWORD *)(v2 + 96);
    *(_OWORD *)(v25 + 128) = v30;
    long long v31 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v25 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v25 + 32) = v31;
    long long v32 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v25 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v25 + 64) = v32;
    sub_C2CE4(v2);
    sub_10C7C(&qword_124D58);
    type metadata accessor for GCSControllerView();
    sub_C6790(&qword_1255C0, &qword_124D58);
    sub_C66DC(&qword_1255C8, (void (*)(uint64_t))type metadata accessor for GCSControllerView);
    sub_C66DC(&qword_1255D0, (void (*)(uint64_t))sub_3CBE0);
    sub_E6EC0();
    sub_C5C2C((uint64_t)v16, (uint64_t)v14);
    long long v33 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    uint64_t v34 = v41;
    v33(v41, v10, v4);
    uint64_t v35 = v40;
    sub_C5C2C((uint64_t)v14, v40);
    uint64_t v36 = sub_10C7C(&qword_1255D8);
    v33((char *)(v35 + *(int *)(v36 + 48)), v34, v4);
    uint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
    v37(v10, v4);
    sub_C67D4((uint64_t)v16, &qword_1255B0);
    v37(v34, v4);
    return sub_C67D4((uint64_t)v14, &qword_1255B0);
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    sub_E63E0();
    __break(1u);
    sub_C5988((void *)v2);
    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

uint64_t sub_C338C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v37 = sub_E66A0();
  uint64_t v3 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10C7C(&qword_1255F8);
  uint64_t v6 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10C7C(&qword_125600);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  uint64_t v39 = v10;
  __chkstk_darwin(v9);
  uint64_t v35 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_allocObject();
  long long v13 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(v12 + 208) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(v12 + 224) = v13;
  *(_OWORD *)(v12 + 240) = *(_OWORD *)(a1 + 224);
  *(void *)(v12 + 256) = *(void *)(a1 + 240);
  long long v14 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v12 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v12 + 160) = v14;
  long long v15 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v12 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v12 + 192) = v15;
  long long v16 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v12 + 96) = v16;
  long long v17 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v12 + 128) = v17;
  long long v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v12 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v12 + 32) = v18;
  long long v19 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v12 + 64) = v19;
  sub_C2CE4(a1);
  sub_10C7C(&qword_125608);
  sub_C6790(&qword_125610, &qword_125608);
  sub_E6D80();
  sub_E6690();
  uint64_t v20 = sub_C6790(&qword_125618, &qword_1255F8);
  uint64_t v21 = sub_C66DC((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v23 = v36;
  uint64_t v22 = v37;
  sub_E6990();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v23);
  long long v45 = *(_OWORD *)a1;
  sub_10C7C(&qword_122A50);
  sub_E6D40();
  uint64_t v24 = swift_allocObject();
  long long v25 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(v24 + 208) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(v24 + 224) = v25;
  *(_OWORD *)(v24 + 240) = *(_OWORD *)(a1 + 224);
  *(void *)(v24 + 256) = *(void *)(a1 + 240);
  long long v26 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v24 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v24 + 160) = v26;
  long long v27 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v24 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v24 + 192) = v27;
  long long v28 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v24 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v24 + 96) = v28;
  long long v29 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v24 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v24 + 128) = v29;
  long long v30 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 32) = v30;
  long long v31 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v24 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v24 + 64) = v31;
  sub_C2CE4(a1);
  type metadata accessor for GCSControllerPairingHelpView();
  uint64_t v41 = v23;
  uint64_t v42 = v22;
  uint64_t v43 = v20;
  uint64_t v44 = v21;
  swift_getOpaqueTypeConformance2();
  sub_C66DC(&qword_125208, (void (*)(uint64_t))type metadata accessor for GCSControllerPairingHelpView);
  uint64_t v32 = v38;
  long long v33 = v35;
  sub_E6A60();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v33, v32);
}

__n128 sub_C3868@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_E6560();
  sub_C38DC((uint64_t)&v10);
  char v3 = v11;
  uint64_t v4 = v12;
  uint64_t v5 = v13;
  char v6 = v14;
  uint64_t v7 = v16;
  __n128 result = v15;
  long long v9 = v10;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  *(__n128 *)(a1 + 72) = result;
  *(void *)(a1 + 88) = v7;
  return result;
}

uint64_t sub_C38DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10C7C(&qword_125218);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_E6870();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_B7108(0x505F4F545F574F48, (void *)0xEB00000000524941);
  uint64_t v24 = v9;
  sub_187B0();
  uint64_t v10 = sub_E6920();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t v22 = sub_E6C30();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Font.TextStyle.footnote(_:), v5);
  uint64_t v17 = sub_E67D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 1, 1, v17);
  sub_E6820();
  sub_C67D4((uint64_t)v4, &qword_125218);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_E6800();
  uint64_t v18 = sub_E6840();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v22;
  *(void *)(a1 + 56) = KeyPath;
  *(void *)(a1 + 64) = v18;
  sub_18804(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_18814(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_C3B74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10C7C(&qword_125480);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 232);
  uint64_t v7 = *(void *)(a1 + 240);
  uint64_t v9 = sub_4F628(v8);
  sub_BF664(v9);
  return sub_BF6C0((uint64_t)v6, v8, v7, a2);
}

uint64_t sub_C3C1C()
{
  type metadata accessor for GCSPreferencesStore();
  sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);

  return sub_E63F0();
}

__n128 sub_C3C90@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  sub_E6D10();
  *(unsigned char *)a9 = v27;
  *(void *)(a9 + 8) = v28;
  *(void *)(a9 + 16) = a1;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(unsigned char *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(void *)(a9 + 72) = a8;
  long long v21 = *(_OWORD *)(a10 + 112);
  *(_OWORD *)(a9 + 176) = *(_OWORD *)(a10 + 96);
  *(_OWORD *)(a9 + 192) = v21;
  *(_OWORD *)(a9 + 208) = *(_OWORD *)(a10 + 128);
  uint64_t v22 = *(void *)(a10 + 144);
  long long v23 = *(_OWORD *)(a10 + 48);
  *(_OWORD *)(a9 + 112) = *(_OWORD *)(a10 + 32);
  *(_OWORD *)(a9 + 128) = v23;
  long long v24 = *(_OWORD *)(a10 + 80);
  *(_OWORD *)(a9 + 144) = *(_OWORD *)(a10 + 64);
  *(_OWORD *)(a9 + 160) = v24;
  __n128 result = *(__n128 *)a10;
  long long v26 = *(_OWORD *)(a10 + 16);
  *(_OWORD *)(a9 + 80) = *(_OWORD *)a10;
  *(_OWORD *)(a9 + 96) = v26;
  *(void *)(a9 + 224) = v22;
  *(void *)(a9 + 232) = a11;
  *(void *)(a9 + 240) = a12;
  return result;
}

uint64_t sub_C3D8C()
{
  return sub_E69D0();
}

uint64_t sub_C3DA8@<X0>(uint64_t a1@<X8>)
{
  return sub_C2E28(a1);
}

void *sub_C3E1C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10C7C(&qword_124D90);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size_16(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_AF25C((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_E7570();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void sub_C3F14(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void sub_C3F5C(id *a1)
{
}

uint64_t sub_C3F64(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_C3F78(void **a1, void **a2, unint64_t a3, void **a4, uint64_t a5)
{
  uint64_t v10 = sub_10C7C(&qword_125120);
  __chkstk_darwin(v10 - 8);
  long long v84 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v12 = (char *)a2 - (char *)a1;
  }
  uint64_t v13 = v12 >> 3;
  unint64_t v87 = a3;
  uint64_t v14 = a3 - (void)a2;
  uint64_t v15 = v14 / 8;
  if (v12 >> 3 < v14 / 8)
  {
    if (a4 != a1 || &a1[v13] <= a4) {
      memmove(a4, a1, 8 * v13);
    }
    char v16 = &a4[v13];
    if ((char *)a2 - (char *)a1 >= 8 && (unint64_t)a2 < v87)
    {
      uint64_t v17 = *(void **)(a5 + 16);
      long long v85 = *(void ***)(a5 + 24);
      long long v86 = v17;
      int v88 = &a4[v13];
      do
      {
        char v89 = a1;
        char v94 = a2;
        uint64_t v18 = *a2;
        long long v19 = *a4;
        if (!v17)
        {
          type metadata accessor for GCSPreferencesStore();
          sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
          id v77 = v18;
          id v78 = v19;
          goto LABEL_60;
        }
        uint64_t v20 = a4;
        long long v21 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v17) - 8];
        id v22 = v18;
        id v23 = v19;
        long long v24 = v17;
        char v25 = v21(v22);

        long long v26 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v24) - 8];
        char v27 = v24;
        char v28 = v26(v23);

        if (v25)
        {
          if ((v28 & 1) == 0)
          {

            a4 = v20;
            long long v29 = v89;
            uint64_t v17 = v86;
            goto LABEL_22;
          }
        }
        else if (v28)
        {

          a4 = v20;
          long long v29 = v89;
          uint64_t v17 = v86;
LABEL_17:
          uint64_t v42 = a4;
          BOOL v41 = v29 == a4++;
          a2 = v94;
          char v16 = v88;
          if (v41) {
            goto LABEL_19;
          }
LABEL_18:
          *long long v29 = *v42;
          goto LABEL_19;
        }
        id v30 = [v22 name];
        uint64_t v31 = sub_E7110();
        uint64_t v33 = v32;

        uint64_t v92 = v31;
        uint64_t v93 = v33;
        id v34 = [v23 name];
        uint64_t v35 = sub_E7110();
        uint64_t v37 = v36;

        uint64_t v90 = v35;
        uint64_t v91 = v37;
        uint64_t v38 = sub_E6080();
        uint64_t v39 = (uint64_t)v84;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v84, 1, 1, v38);
        sub_187B0();
        uint64_t v40 = sub_E7420();
        sub_C67D4(v39, &qword_125120);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        BOOL v41 = v40 == -1;
        a4 = v20;
        long long v29 = v89;
        uint64_t v17 = v86;
        if (!v41) {
          goto LABEL_17;
        }
LABEL_22:
        uint64_t v42 = v94;
        a2 = v94 + 1;
        char v16 = v88;
        if (v29 != v94) {
          goto LABEL_18;
        }
LABEL_19:
        a1 = v29 + 1;
      }
      while (a4 < v16 && (unint64_t)a2 < v87);
    }
    a2 = a1;
LABEL_52:
    uint64_t v74 = (char *)v16 - (char *)a4;
    uint64_t v75 = (char *)v16 - (char *)a4 + 7;
    if (v74 < 0) {
      uint64_t v74 = v75;
    }
    if (a2 != a4 || a2 >= (void **)((char *)a4 + (v74 & 0xFFFFFFFFFFFFFFF8))) {
      memmove(a2, a4, 8 * (v74 >> 3));
    }
    return 1;
  }
  if (a4 != a2 || &a2[v15] <= a4) {
    memmove(a4, a2, 8 * v15);
  }
  char v16 = &a4[v15];
  if (v14 < 8 || a1 >= a2) {
    goto LABEL_52;
  }
  uint64_t v43 = *(void **)(a5 + 16);
  uint64_t v81 = *(void *)(a5 + 24);
  uint64_t v44 = (void **)(v87 - 8);
  long long v82 = v43;
  long long v83 = a4;
  char v89 = a1;
  while (1)
  {
    int v88 = v16;
    long long v45 = v16 - 1;
    int v46 = *(v16 - 1);
    char v94 = a2;
    int v47 = a2 - 1;
    int v48 = *(a2 - 1);
    if (!v43) {
      break;
    }
    long long v85 = v44;
    unint64_t v87 = (unint64_t)(v44 + 1);
    uint64_t v49 = *(uint64_t (**)(void *))&stru_248.segname[(swift_isaMask & *v43) - 8];
    long long v50 = v46;
    id v51 = v48;
    long long v52 = v43;
    long long v86 = v50;
    char v53 = v49(v50);

    uint64_t v54 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v52) - 8];
    uint64_t v55 = v52;
    long long v56 = v51;
    char v57 = v54(v51);

    if (v53)
    {
      if ((v57 & 1) == 0)
      {

        uint64_t v43 = v82;
        a4 = v83;
        a2 = v94;
        uint64_t v58 = (void **)v87;
        char v16 = v88;
        uint64_t v59 = v85;
LABEL_41:
        unint64_t v72 = (unint64_t)v89;
        if (v58 != a2)
        {
          a2 = v47;
          goto LABEL_47;
        }
        BOOL v73 = v59 >= a2;
        a2 = v47;
        if (v73) {
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
    else if (v57)
    {

      uint64_t v43 = v82;
      a4 = v83;
      a2 = v94;
      uint64_t v58 = (void **)v87;
      char v16 = v88;
      uint64_t v59 = v85;
      goto LABEL_37;
    }
    id v60 = v86;
    id v61 = objc_msgSend(v86, "name", v81);
    uint64_t v62 = sub_E7110();
    uint64_t v64 = v63;

    uint64_t v92 = v62;
    uint64_t v93 = v64;
    id v65 = [v56 name];
    uint64_t v66 = sub_E7110();
    uint64_t v68 = v67;

    uint64_t v90 = v66;
    uint64_t v91 = v68;
    uint64_t v69 = sub_E6080();
    uint64_t v70 = (uint64_t)v84;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v84, 1, 1, v69);
    sub_187B0();
    uint64_t v71 = sub_E7420();
    sub_C67D4(v70, &qword_125120);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    BOOL v41 = v71 == -1;
    uint64_t v43 = v82;
    a4 = v83;
    a2 = v94;
    uint64_t v58 = (void **)v87;
    char v16 = v88;
    uint64_t v59 = v85;
    if (v41) {
      goto LABEL_41;
    }
LABEL_37:
    unint64_t v72 = (unint64_t)v89;
    int v47 = v45;
    if (v58 != v16)
    {
      char v16 = v45;
LABEL_47:
      *uint64_t v59 = *v47;
      goto LABEL_48;
    }
    BOOL v73 = v59 >= v16;
    char v16 = v45;
    if (v73) {
      goto LABEL_47;
    }
LABEL_48:
    if (v16 > a4)
    {
      uint64_t v44 = v59 - 1;
      if ((unint64_t)a2 > v72) {
        continue;
      }
    }
    goto LABEL_52;
  }
  type metadata accessor for GCSPreferencesStore();
  sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
  id v79 = v46;
  id v80 = v48;
LABEL_60:
  uint64_t result = sub_E63E0();
  __break(1u);
  return result;
}

void *sub_C473C(uint64_t a1, void *a2)
{
  uint64_t v6 = sub_10C7C(&qword_125120);
  __chkstk_darwin(v6 - 8);
  long long v202 = (char *)&v187 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::Int v8 = *(void *)(a1 + 8);
  sub_C2CE4((uint64_t)a2);
  sub_C2CE4((uint64_t)a2);
  sub_C2CE4((uint64_t)a2);
  Swift::Int v9 = sub_E75F0(v8);
  long long v196 = a2;
  long long v198 = (char *)v8;
  if (v9 >= v8)
  {
    if (v8 < 0) {
      goto LABEL_176;
    }
    if ((unint64_t)v8 < 2)
    {
LABEL_151:
      sub_C5988(a2);
      sub_C5988(a2);
      char v175 = a2;
      return sub_C5988(v175);
    }
    uint64_t v13 = *(void ***)a1;
    sub_C2CE4((uint64_t)a2);
    Swift::Int v8 = -1;
    uint64_t v14 = 1;
    uint64_t v15 = a2;
    a2 = (void *)a2[2];
    long long v194 = (uint64_t (*)(id))v15[3];
    long long v201 = v13;
    while (2)
    {
      long long v197 = (char *)v14;
      uint64_t v2 = (uint64_t)v201[v14];
      long long v199 = (void **)v8;
      long long v195 = v13;
      while (1)
      {
        Swift::Int v203 = v8;
        uint64_t v3 = (uint64_t)*v13;
        if (!a2) {
          goto LABEL_185;
        }
        char v16 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *a2) - 8];
        id v17 = (id)v2;
        uint64_t v3 = (uint64_t)(id)v3;
        uint64_t v18 = a2;
        long long v19 = v17;
        uint64_t v2 = v16(v17);

        uint64_t v20 = *(uint64_t (**)(uint64_t))&stru_248.segname[(swift_isaMask & *v18) - 8];
        long long v21 = v18;
        char v22 = v20(v3);

        if ((v2 & 1) == 0) {
          break;
        }
        if (v22) {
          goto LABEL_19;
        }

        Swift::Int v8 = v203;
LABEL_20:
        if (!v201) {
          goto LABEL_180;
        }
        uint64_t v33 = *v13;
        uint64_t v2 = (uint64_t)v13[1];
        void *v13 = (void *)v2;
        v13[1] = v33;
        --v13;
        if (__CFADD__(v8++, 1)) {
          goto LABEL_12;
        }
      }
      if (v22)
      {

LABEL_12:
        uint64_t v14 = (uint64_t)(v197 + 1);
        uint64_t v13 = v195 + 1;
        Swift::Int v8 = (Swift::Int)v199 - 1;
        if (v197 + 1 == v198)
        {
          a2 = v196;
          sub_C5988(v196);
          goto LABEL_151;
        }
        continue;
      }
      break;
    }
LABEL_19:
    id v23 = [v19 name];
    uint64_t v24 = sub_E7110();
    uint64_t v26 = v25;

    uint64_t v206 = v24;
    uint64_t v207 = v26;
    id v27 = [(id)v3 name];
    uint64_t v28 = sub_E7110();
    uint64_t v30 = v29;

    uint64_t v204 = v28;
    uint64_t v205 = v30;
    uint64_t v31 = sub_E6080();
    uint64_t v2 = (uint64_t)v202;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v202, 1, 1, v31);
    sub_187B0();
    uint64_t v32 = sub_E7420();
    sub_C67D4(v2, &qword_125120);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    Swift::Int v8 = v203;
    if (v32 != -1) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
  if (v8 >= 0) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v8 + 1;
  }
  if (v8 < -1) {
    goto LABEL_175;
  }
  Swift::Int v190 = v9;
  v188 = (Swift::Int *)a1;
  if (v8 <= 1)
  {
    uint64_t v3 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v208 = (uint64_t)_swiftEmptyArrayStorage;
    long long v195 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v8 == 1) {
      goto LABEL_25;
    }
    unint64_t v37 = _swiftEmptyArrayStorage[2];
LABEL_138:
    if (v37 >= 2)
    {
      Swift::Int v165 = *v188;
      Swift::Int v203 = *v188;
      a2 = v196;
      do
      {
        unint64_t v166 = v37 - 2;
        if (v37 < 2) {
          goto LABEL_170;
        }
        if (!v165) {
          goto LABEL_184;
        }
        long long v197 = (char *)v3;
        long long v167 = (char *)(v3 + 32);
        uint64_t v3 = *(void *)(v3 + 32 + 16 * v166);
        uint64_t v168 = *(void *)&v167[16 * v37 - 8];
        long long v169 = (void **)(v165 + 8 * v3);
        Swift::Int v8 = v165 + 8 * *(void *)&v167[16 * v37 - 16];
        uint64_t v2 = v165 + 8 * v168;
        sub_C2CE4((uint64_t)a2);
        uint64_t v170 = v200;
        sub_C3F78(v169, (void **)v8, v2, v195, (uint64_t)a2);
        uint64_t v200 = v170;
        if (v170) {
          goto LABEL_150;
        }
        sub_C5988(a2);
        if (v168 < v3) {
          goto LABEL_171;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          long long v197 = sub_21CA4((uint64_t)v197);
        }
        v171 = v197;
        if (v166 >= *((void *)v197 + 2)) {
          goto LABEL_172;
        }
        v172 = v197 + 32;
        uint64_t v173 = &v197[16 * v166 + 32];
        *(void *)uint64_t v173 = v3;
        *((void *)v173 + 1) = v168;
        unint64_t v174 = *((void *)v171 + 2);
        if (v37 > v174) {
          goto LABEL_173;
        }
        uint64_t v3 = (uint64_t)v171;
        Swift::Int v8 = v174 - 1;
        memmove(&v172[16 * v37 - 16], &v172[16 * v37], 16 * (v174 - v37));
        *(void *)(v3 + 16) = v174 - 1;
        unint64_t v37 = v174 - 1;
        Swift::Int v165 = v203;
      }
      while (v174 > 2);
    }
    swift_bridgeObjectRelease();
    *(void *)((char *)&dword_10 + (v208 & 0xFFFFFFFFFFFFFF8)) = 0;
    sub_E7230();
    swift_bridgeObjectRelease();
    long long v177 = v196;
    sub_C5988(v196);
    sub_C5988(v177);
    char v175 = v177;
    return sub_C5988(v175);
  }
  uint64_t v11 = v10 >> 1;
  sub_3CBE0();
  uint64_t v12 = sub_E7250();
  *(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8)) = v11;
  long long v195 = (void **)((v12 & 0xFFFFFFFFFFFFFF8) + 32);
  uint64_t v208 = v12;
LABEL_25:
  Swift::Int v35 = 0;
  uint64_t v36 = *(void ***)a1;
  uint64_t v3 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v189 = *(void *)a1 - 8;
  Swift::Int v203 = (Swift::Int)v36;
  while (2)
  {
    Swift::Int v38 = v35 + 1;
    uint64_t v193 = v35;
    if (v35 + 1 >= v8) {
      goto LABEL_60;
    }
    long long v201 = (void **)(v35 + 1);
    uint64_t v2 = (uint64_t)v36[v38];
    Swift::Int v8 = (Swift::Int)v36[v35];
    uint64_t v39 = (void *)a2[2];
    if (!v39) {
      goto LABEL_188;
    }
    uint64_t v40 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v39) - 8];
    id v41 = (id)v2;
    uint64_t v2 = (uint64_t)(id)v8;
    uint64_t v42 = v39;
    id v191 = v41;
    int v43 = v40(v41);

    uint64_t v44 = (char *)((swift_isaMask & *v42) + 592);
    long long v45 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v42) - 8];
    int v46 = v42;
    long long v197 = v44;
    long long v194 = v45;
    char v47 = v45((id)v2);
    id v192 = v46;

    LODWORD(v199) = v43;
    if ((v43 & 1) == 0)
    {
      Swift::Int v8 = (Swift::Int)v198;
      if (v47) {
        goto LABEL_32;
      }
LABEL_34:
      id v48 = v191;
      id v49 = [v191 name];
      uint64_t v50 = sub_E7110();
      id v51 = (void *)v2;
      uint64_t v53 = v52;

      uint64_t v206 = v50;
      uint64_t v207 = v53;
      id v54 = [v51 name];
      uint64_t v55 = sub_E7110();
      uint64_t v2 = v56;

      uint64_t v204 = v55;
      uint64_t v205 = v2;
      uint64_t v57 = sub_E6080();
      uint64_t v58 = (uint64_t)v202;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v202, 1, 1, v57);
      sub_187B0();
      uint64_t v59 = sub_E7420();
      sub_C67D4(v58, &qword_125120);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      LODWORD(v199) = v59 == -1;
      goto LABEL_35;
    }
    Swift::Int v8 = (Swift::Int)v198;
    if (v47) {
      goto LABEL_34;
    }
LABEL_32:

LABEL_35:
    Swift::Int v35 = v193;
    Swift::Int v60 = v193 + 2;
    if (v193 + 2 >= v8)
    {
      uint64_t v36 = (void **)v203;
      goto LABEL_50;
    }
    Swift::Int v61 = v193 + 2;
    uint64_t v36 = (void **)v203;
    uint64_t v62 = v201;
    while (1)
    {
      Swift::Int v60 = v61;
      uint64_t v74 = v36[v61];
      uint64_t v75 = v36[(void)v62];
      id v76 = v192;
      id v77 = v74;
      id v78 = v75;
      id v79 = v194;
      uint64_t v2 = v194(v77);

      id v80 = v76;
      char v81 = v79(v78);

      if (v2)
      {
        if ((v81 & 1) == 0)
        {

          if ((v199 & 1) == 0)
          {
            Swift::Int v38 = v60;
            a2 = v196;
            uint64_t v36 = (void **)v203;
            goto LABEL_134;
          }
          goto LABEL_38;
        }
      }
      else if (v81)
      {

        if (v199)
        {
          a2 = v196;
          uint64_t v36 = (void **)v203;
          Swift::Int v35 = v193;
          goto LABEL_51;
        }
        goto LABEL_38;
      }
      id v63 = [v77 name];
      uint64_t v64 = sub_E7110();
      uint64_t v66 = v65;

      uint64_t v206 = v64;
      uint64_t v207 = v66;
      id v67 = [v78 name];
      uint64_t v68 = sub_E7110();
      uint64_t v70 = v69;

      uint64_t v204 = v68;
      uint64_t v205 = v70;
      uint64_t v71 = sub_E6080();
      uint64_t v72 = (uint64_t)v202;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v202, 1, 1, v71);
      sub_187B0();
      uint64_t v73 = sub_E7420();
      sub_C67D4(v72, &qword_125120);
      swift_bridgeObjectRelease();
      uint64_t v2 = v207;

      swift_bridgeObjectRelease();
      if (((v199 ^ (v73 != -1)) & 1) == 0) {
        break;
      }
LABEL_38:
      Swift::Int v61 = v60 + 1;
      uint64_t v62 = (void **)v60;
      uint64_t v36 = (void **)v203;
      if (v60 + 1 >= v8)
      {
        ++v60;
        a2 = v196;
        goto LABEL_49;
      }
    }
    a2 = v196;
    uint64_t v36 = (void **)v203;
LABEL_49:
    Swift::Int v35 = v193;
LABEL_50:
    Swift::Int v38 = v60;
    if ((v199 & 1) == 0) {
      goto LABEL_60;
    }
LABEL_51:
    if (v60 < v35) {
      goto LABEL_177;
    }
    if (v35 < v60)
    {
      long long v82 = (void **)(v189 + 8 * v60);
      Swift::Int v83 = v60;
      Swift::Int v84 = v35;
      long long v85 = &v36[v35];
      do
      {
        if (v84 != --v83)
        {
          if (!v36) {
            goto LABEL_183;
          }
          long long v86 = *v85;
          void *v85 = *v82;
          void *v82 = v86;
        }
        ++v84;
        --v82;
        ++v85;
      }
      while (v84 < v83);
      Swift::Int v38 = v60;
LABEL_134:
      Swift::Int v35 = v193;
      if (v38 < v8) {
        goto LABEL_61;
      }
LABEL_86:
      if (v38 < v35) {
        goto LABEL_169;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      long long v201 = (void **)v38;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v3 = (uint64_t)sub_21BA8(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
      }
      unint64_t v111 = *(void *)(v3 + 16);
      unint64_t v110 = *(void *)(v3 + 24);
      unint64_t v37 = v111 + 1;
      uint64_t v36 = (void **)v203;
      if (v111 >= v110 >> 1)
      {
        long long v164 = sub_21BA8((char *)(v110 > 1), v111 + 1, 1, (char *)v3);
        uint64_t v36 = (void **)v203;
        uint64_t v3 = (uint64_t)v164;
      }
      *(void *)(v3 + 16) = v37;
      uint64_t v2 = v3 + 32;
      uint64_t v112 = (char *)(v3 + 32 + 16 * v111);
      char v113 = v201;
      *(void *)uint64_t v112 = v193;
      *((void *)v112 + 1) = v113;
      if (!v111)
      {
        unint64_t v37 = 1;
LABEL_27:
        Swift::Int v35 = (Swift::Int)v201;
        if ((uint64_t)v201 >= v8) {
          goto LABEL_138;
        }
        continue;
      }
      long long v197 = (char *)v3;
      long long v194 = (uint64_t (*)(id))(v3 + 32);
      while (2)
      {
        unint64_t v114 = v37 - 1;
        if (v37 >= 4)
        {
          unint64_t v119 = v2 + 16 * v37;
          uint64_t v120 = *(void *)(v119 - 64);
          uint64_t v121 = *(void *)(v119 - 56);
          BOOL v125 = __OFSUB__(v121, v120);
          uint64_t v122 = v121 - v120;
          if (v125) {
            goto LABEL_158;
          }
          uint64_t v124 = *(void *)(v119 - 48);
          uint64_t v123 = *(void *)(v119 - 40);
          BOOL v125 = __OFSUB__(v123, v124);
          uint64_t v117 = v123 - v124;
          char v118 = v125;
          if (v125) {
            goto LABEL_159;
          }
          unint64_t v126 = v37 - 2;
          long long v127 = (uint64_t *)(v2 + 16 * (v37 - 2));
          uint64_t v129 = *v127;
          uint64_t v128 = v127[1];
          BOOL v125 = __OFSUB__(v128, v129);
          uint64_t v130 = v128 - v129;
          if (v125) {
            goto LABEL_161;
          }
          BOOL v125 = __OFADD__(v117, v130);
          uint64_t v131 = v117 + v130;
          if (v125) {
            goto LABEL_164;
          }
          if (v131 >= v122)
          {
            long long v149 = (uint64_t *)(v2 + 16 * v114);
            uint64_t v151 = *v149;
            uint64_t v150 = v149[1];
            BOOL v125 = __OFSUB__(v150, v151);
            uint64_t v152 = v150 - v151;
            if (v125) {
              goto LABEL_168;
            }
            BOOL v142 = v117 < v152;
          }
          else
          {
LABEL_106:
            if (v118) {
              goto LABEL_160;
            }
            unint64_t v126 = v37 - 2;
            long long v132 = (uint64_t *)(v2 + 16 * (v37 - 2));
            uint64_t v134 = *v132;
            uint64_t v133 = v132[1];
            BOOL v135 = __OFSUB__(v133, v134);
            uint64_t v136 = v133 - v134;
            char v137 = v135;
            if (v135) {
              goto LABEL_163;
            }
            long long v138 = (uint64_t *)(v2 + 16 * v114);
            uint64_t v140 = *v138;
            uint64_t v139 = v138[1];
            BOOL v125 = __OFSUB__(v139, v140);
            uint64_t v141 = v139 - v140;
            if (v125) {
              goto LABEL_166;
            }
            if (__OFADD__(v136, v141)) {
              goto LABEL_167;
            }
            if (v136 + v141 < v117) {
              goto LABEL_118;
            }
            BOOL v142 = v117 < v141;
          }
          if (v142) {
            unint64_t v114 = v126;
          }
        }
        else
        {
          if (v37 == 3)
          {
            uint64_t v116 = *(void *)(v3 + 32);
            uint64_t v115 = *(void *)(v3 + 40);
            BOOL v125 = __OFSUB__(v115, v116);
            uint64_t v117 = v115 - v116;
            char v118 = v125;
            goto LABEL_106;
          }
          uint64_t v143 = *(void *)(v3 + 32);
          uint64_t v144 = *(void *)(v3 + 40);
          BOOL v125 = __OFSUB__(v144, v143);
          uint64_t v136 = v144 - v143;
          char v137 = v125;
LABEL_118:
          if (v137) {
            goto LABEL_162;
          }
          long long v145 = (uint64_t *)(v2 + 16 * v114);
          uint64_t v147 = *v145;
          uint64_t v146 = v145[1];
          BOOL v125 = __OFSUB__(v146, v147);
          uint64_t v148 = v146 - v147;
          if (v125) {
            goto LABEL_165;
          }
          if (v148 < v136) {
            goto LABEL_27;
          }
        }
        unint64_t v153 = v114 - 1;
        if (v114 - 1 >= v37)
        {
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
          goto LABEL_179;
        }
        if (!v36) {
          goto LABEL_182;
        }
        uint64_t v3 = v2 + 16 * v153;
        unint64_t v154 = *(void **)v3;
        unint64_t v155 = v114;
        v156 = (uint64_t *)(v2 + 16 * v114);
        uint64_t v157 = *v156;
        uint64_t v158 = v156[1];
        long long v199 = &v36[*(void *)v3];
        uint64_t v2 = (uint64_t)&v36[v157];
        unint64_t v159 = (unint64_t)&v36[v158];
        a2 = v196;
        sub_C2CE4((uint64_t)v196);
        uint64_t v160 = v200;
        sub_C3F78(v199, (void **)v2, v159, v195, (uint64_t)a2);
        uint64_t v200 = v160;
        if (v160)
        {
LABEL_150:
          sub_C5988(a2);
          swift_bridgeObjectRelease();
          *(void *)((char *)&dword_10 + (v208 & 0xFFFFFFFFFFFFFF8)) = 0;
          sub_E7230();
          swift_bridgeObjectRelease();
          goto LABEL_151;
        }
        sub_C5988(a2);
        Swift::Int v8 = (Swift::Int)v198;
        if (v158 < (uint64_t)v154) {
          goto LABEL_155;
        }
        long long v161 = v197;
        if (v155 > *((void *)v197 + 2)) {
          goto LABEL_156;
        }
        unint64_t v162 = v155;
        *(void *)uint64_t v3 = v154;
        uint64_t v2 = (uint64_t)v194;
        *((void *)v194 + 2 * v153 + 1) = v158;
        unint64_t v163 = *((void *)v161 + 2);
        if (v155 >= v163) {
          goto LABEL_157;
        }
        uint64_t v3 = (uint64_t)v161;
        unint64_t v37 = v163 - 1;
        memmove(v156, v156 + 2, 16 * (v163 - 1 - v162));
        *(void *)(v3 + 16) = v163 - 1;
        uint64_t v36 = (void **)v203;
        if (v163 <= 2) {
          goto LABEL_27;
        }
        continue;
      }
    }
    break;
  }
  Swift::Int v38 = v60;
LABEL_60:
  if (v38 >= v8) {
    goto LABEL_86;
  }
LABEL_61:
  if (__OFSUB__(v38, v35)) {
    goto LABEL_174;
  }
  if (v38 - v35 >= v190)
  {
LABEL_85:
    Swift::Int v35 = v193;
    goto LABEL_86;
  }
  Swift::Int v35 = v193;
  if (__OFADD__(v193, v190)) {
    goto LABEL_178;
  }
  if (v193 + v190 >= v8) {
    unint64_t v87 = (uint64_t (*)(id))v8;
  }
  else {
    unint64_t v87 = (uint64_t (*)(id))(v193 + v190);
  }
  if ((uint64_t)v87 < v193)
  {
LABEL_179:
    __break(1u);
LABEL_180:
    __break(1u);
LABEL_181:
    long long v178 = v196;
    sub_C5988(v196);
    sub_C5988(v178);
    sub_C5988(v178);
    __break(1u);
LABEL_182:
    long long v179 = v196;
    sub_C5988(v196);
    sub_C5988(v179);
    sub_C5988(v179);
    __break(1u);
LABEL_183:
    sub_C5988(a2);
    sub_C5988(a2);
    sub_C5988(a2);
    __break(1u);
LABEL_184:
    long long v180 = v196;
    sub_C5988(v196);
    sub_C5988(v180);
    sub_C5988(v180);
    __break(1u);
LABEL_185:
    type metadata accessor for GCSPreferencesStore();
    sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    id v181 = (id)v2;
    long long v182 = (char *)(id)v3;
    goto LABEL_187;
  }
  if ((uint64_t (*)(id))v38 == v87) {
    goto LABEL_86;
  }
  long long v197 = (char *)v3;
  int v88 = (void *)a2[2];
  id v192 = (id)a2[3];
  uint64_t v3 = v189 + 8 * v38;
  long long v194 = v87;
  while (2)
  {
    Swift::Int v8 = (Swift::Int)v36[v38];
    uint64_t v90 = v193;
    long long v199 = (void **)v3;
    long long v201 = (void **)v38;
LABEL_74:
    uint64_t v91 = *(void **)v3;
    if (v88)
    {
      uint64_t v92 = *(uint64_t (**)(id))&stru_248.segname[(swift_isaMask & *v88) - 8];
      id v93 = (id)v8;
      a2 = v91;
      char v94 = v88;
      uint64_t v2 = (uint64_t)v93;
      char v95 = v92(v93);

      Swift::Int v8 = *(void *)&stru_248.segname[(swift_isaMask & *v94) - 8];
      uint64_t v96 = v94;
      char v97 = ((uint64_t (*)(void *))v8)(a2);

      if (v95)
      {
        if ((v97 & 1) == 0)
        {

          goto LABEL_80;
        }
      }
      else if (v97)
      {

LABEL_71:
        uint64_t v36 = (void **)v203;
        char v89 = v201;
LABEL_72:
        Swift::Int v38 = (Swift::Int)v89 + 1;
        uint64_t v3 = (uint64_t)(v199 + 1);
        if ((uint64_t (*)(id))v38 == v194)
        {
          Swift::Int v38 = (Swift::Int)v194;
          a2 = v196;
          uint64_t v3 = (uint64_t)v197;
          Swift::Int v8 = (Swift::Int)v198;
          goto LABEL_85;
        }
        continue;
      }
      id v98 = [(id)v2 name];
      uint64_t v99 = sub_E7110();
      uint64_t v101 = v100;

      uint64_t v206 = v99;
      uint64_t v207 = v101;
      id v102 = [a2 name];
      uint64_t v103 = sub_E7110();
      uint64_t v105 = v104;

      uint64_t v204 = v103;
      uint64_t v205 = v105;
      uint64_t v106 = sub_E6080();
      Swift::Int v8 = (Swift::Int)v202;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v202, 1, 1, v106);
      sub_187B0();
      uint64_t v107 = sub_E7420();
      sub_C67D4(v8, &qword_125120);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v107 != -1) {
        goto LABEL_71;
      }
LABEL_80:
      uint64_t v36 = (void **)v203;
      char v89 = v201;
      if (!v203) {
        goto LABEL_181;
      }
      uint64_t v108 = *(void **)v3;
      Swift::Int v8 = *(void *)(v3 + 8);
      *(void *)uint64_t v3 = v8;
      *(void *)(v3 + 8) = v108;
      v3 -= 8;
      if (v89 == (void **)++v90) {
        goto LABEL_72;
      }
      goto LABEL_74;
    }
    break;
  }
  type metadata accessor for GCSPreferencesStore();
  sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
  id v183 = (id)v8;
  id v184 = v91;
LABEL_187:
  sub_E63E0();
  __break(1u);
LABEL_188:
  type metadata accessor for GCSPreferencesStore();
  sub_C66DC((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
  id v185 = (id)v2;
  id v186 = (id)v8;
  uint64_t result = (void *)sub_E63E0();
  __break(1u);
  return result;
}

void *sub_C58D4(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  sub_C2CE4((uint64_t)a2);
  sub_C2CE4((uint64_t)a2);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = sub_C3F64(v4);
    *a1 = v4;
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  sub_C2CE4((uint64_t)a2);
  sub_C473C((uint64_t)v8, a2);
  sub_C5988(a2);
  sub_E7520();
  sub_C5988(a2);
  return sub_C5988(a2);
}

void *sub_C5988(void *a1)
{
  uint64_t v4 = (void *)a1[2];
  uint64_t v3 = (void *)a1[9];
  uint64_t v7 = (void *)a1[12];
  uint64_t v6 = a1[29];
  uint64_t v5 = (void *)a1[27];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  sub_4F680(v6);
  return a1;
}

uint64_t sub_C5AE0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  sub_10C7C(&qword_122890);
  sub_E6E10();
  sub_10C7C(&qword_123590);
  sub_E6E10();
  sub_10C7C(&qword_122BB8);
  sub_E6E10();
  uint64_t v4 = sub_4A664();
  uint64_t v6 = v5;
  uint64_t v7 = sub_4A6AC();
  return sub_4A6F4((uint64_t)v3, v4, v6, v7, v8, v10, *((uint64_t *)&v10 + 1), v11, a2, v10, v11, (uint64_t)&v10);
}

uint64_t sub_C5C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10C7C(&qword_1255B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_C5C94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for GCSControllerListView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GCSControllerListView(uint64_t a1)
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 232))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for GCSControllerListView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v8 = *(void **)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v7;
  long long v21 = *(void **)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v21;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  uint64_t v10 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v10;
  uint64_t v11 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v11;
  uint64_t v12 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v12;
  uint64_t v13 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v13;
  *(_WORD *)(a1 + 208) = *(_WORD *)(a2 + 208);
  char v22 = *(void **)(a2 + 216);
  uint64_t v23 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = v22;
  *(void *)(a1 + 224) = v23;
  uint64_t v24 = *(void *)(a2 + 232);
  uint64_t v20 = (_OWORD *)(a2 + 232);
  swift_retain();
  id v14 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v15 = v8;
  swift_retain();
  swift_retain();
  id v16 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = v22;
  swift_bridgeObjectRetain();
  if (v24)
  {
    uint64_t v18 = *(void *)(a2 + 240);
    *(void *)(a1 + 232) = v24;
    *(void *)(a1 + 240) = v18;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 232) = *v20;
  }
  return a1;
}

uint64_t assignWithCopy for GCSControllerListView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void **)(a2 + 72);
  uint64_t v8 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v7;
  id v9 = v7;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void **)(a1 + 96);
  uint64_t v11 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v11;
  id v12 = v11;

  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(unsigned char *)(a1 + 209) = *(unsigned char *)(a2 + 209);
  uint64_t v13 = *(void **)(a1 + 216);
  id v14 = *(void **)(a2 + 216);
  *(void *)(a1 + 216) = v14;
  id v15 = v14;

  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 232);
  if (!*(void *)(a1 + 232))
  {
    if (v16)
    {
      uint64_t v18 = *(void *)(a2 + 240);
      *(void *)(a1 + 232) = v16;
      *(void *)(a1 + 240) = v18;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
    return a1;
  }
  if (!v16)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v17 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = v16;
  *(void *)(a1 + 240) = v17;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for GCSControllerListView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  long long v8 = a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  __n128 result = (__n128)a2[12];
  long long v12 = a2[13];
  long long v13 = a2[14];
  *(void *)(a1 + 240) = *((void *)a2 + 30);
  *(_OWORD *)(a1 + 208) = v12;
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 192) = result;
  return result;
}

uint64_t assignWithTake for GCSControllerListView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_release();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();

  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  swift_release();
  long long v5 = *(void **)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);

  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(unsigned char *)(a1 + 209) = *(unsigned char *)(a2 + 209);

  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 232);
  if (!*(void *)(a1 + 232))
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 240);
      *(void *)(a1 + 232) = v8;
      *(void *)(a1 + 240) = v10;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = v8;
  *(void *)(a1 + 240) = v9;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSControllerListView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 248)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSControllerListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 248) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 248) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSControllerListView()
{
  return &type metadata for GCSControllerListView;
}

uint64_t sub_C6518()
{
  return sub_C6790(&qword_1255E8, &qword_1255F0);
}

uint64_t sub_C6558()
{
  long long v2 = *(_OWORD *)(v0 + 16);
  sub_C6724((uint64_t)&v2 + 8, (uint64_t)v3);
  sub_B6E5C((uint64_t)v3);
  sub_10C7C(&qword_122A50);
  sub_E6D20();
  sub_E6D30();
  return sub_B6E88((uint64_t)&v2);
}

uint64_t sub_C65F4()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 248)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 264, 7);
}

uint64_t sub_C66D4@<X0>(uint64_t a1@<X8>)
{
  return sub_C3B74(v1 + 16, a1);
}

uint64_t sub_C66DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_C6724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10C7C(&qword_125220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_C6790(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_C67D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_C6830(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = [objc_allocWithZone((Class)CBConnection) init];
  long long v5 = *(void (**)(id))(*(void *)a1 + 424);
  id v6 = v4;
  v5(v4);
  uint64_t v16 = sub_C6ABC;
  uint64_t v17 = a1;
  long long v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  id v14 = sub_C6C64;
  id v15 = &unk_117790;
  uint64_t v7 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  [v6 setPairingPromptHandler:v7];
  _Block_release(v7);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  *(void *)(v8 + 24) = a1;
  uint64_t v16 = sub_C6CE8;
  uint64_t v17 = v8;
  long long v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  id v14 = sub_C7150;
  id v15 = &unk_1177F0;
  uint64_t v9 = _Block_copy(&v12);
  swift_retain();
  swift_retain();
  swift_release();
  [v6 setPairingCompletedHandler:v9];
  _Block_release(v9);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v2;
  *(void *)(v10 + 24) = a1;
  uint64_t v16 = sub_C71E0;
  uint64_t v17 = v10;
  long long v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  id v14 = sub_419EC;
  id v15 = &unk_117840;
  uint64_t v11 = _Block_copy(&v12);
  swift_retain();
  swift_retain();
  swift_release();
  [v6 activateWithCompletion:v11];
  _Block_release(v11);
}

uint64_t sub_C6ABC(void *a1)
{
  sub_10C7C(&qword_122298);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_EB580;
  id v4 = [a1 device];
  long long v5 = v4;
  if (v4)
  {
    id v6 = [v4 name];

    if (v6)
    {
      long long v5 = (void *)sub_E7110();
      unint64_t v8 = v7;

      goto LABEL_6;
    }
    long long v5 = 0;
  }
  unint64_t v8 = 0;
LABEL_6:
  *(void *)(v3 + 56) = &type metadata for String;
  unint64_t v9 = sub_17068();
  *(void *)(v3 + 64) = v9;
  uint64_t v10 = 0x454D414E204F4ELL;
  if (v8) {
    uint64_t v10 = (uint64_t)v5;
  }
  unint64_t v11 = 0xE700000000000000;
  if (v8) {
    unint64_t v11 = v8;
  }
  *(void *)(v3 + 32) = v10;
  *(void *)(v3 + 40) = v11;
  uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v1 + 976))();
  *(void *)(v3 + 96) = &type metadata for String;
  *(void *)(v3 + 104) = v9;
  uint64_t v14 = 0x4552444441204F4ELL;
  if (v13) {
    uint64_t v14 = v12;
  }
  unint64_t v15 = 0xEA00000000005353;
  if (v13) {
    unint64_t v15 = v13;
  }
  *(void *)(v3 + 72) = v14;
  *(void *)(v3 + 80) = v15;
  sub_170BC();
  uint64_t v16 = (void *)sub_E73C0();
  sub_E7320();
  sub_E60B0();

  return swift_bridgeObjectRelease();
}

void sub_C6C64(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_C6CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_C6CDC()
{
  return swift_release();
}

uint64_t sub_C6CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  if ((*(uint64_t (**)(unint64_t, unint64_t, uint64_t))(*(void *)v3 + 1176))(0xD000000000000022, 0x80000000000F37D0, a2))
  {
    long long v5 = (void *)(*(uint64_t (**)(void))(*(void *)v4 + 384))();
    if (v5)
    {
      id v6 = v5;
      unint64_t v7 = (char *)[v5 pairingType];

      if (v7 == (unsigned char *)&dword_0 + 2 && ((*(uint64_t (**)(void))(*(void *)v4 + 856))() & 1) != 0)
      {
        unint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 416);
        uint64_t v9 = swift_retain();
        return v8(v9);
      }
    }
  }
  sub_10C7C(&qword_122298);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_EFFA0;
  uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v4 + 360))();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = &type metadata for String;
  unint64_t v15 = sub_17068();
  *(void *)(v11 + 64) = v15;
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v4 + 976))();
  *(void *)(v11 + 96) = &type metadata for String;
  *(void *)(v11 + 104) = v15;
  uint64_t v18 = 0x4552444441204F4ELL;
  if (v17) {
    uint64_t v18 = v16;
  }
  unint64_t v19 = 0xEA00000000005353;
  if (v17) {
    unint64_t v19 = v17;
  }
  *(void *)(v11 + 72) = v18;
  *(void *)(v11 + 80) = v19;
  uint64_t v20 = *(uint64_t (**)(void))(*(void *)v4 + 384);
  long long v21 = (void *)v20();
  if (!v21)
  {
    uint64_t v25 = (uint64_t *)(v11 + 112);
    *(void *)(v11 + 136) = &type metadata for String;
    *(void *)(v11 + 144) = v15;
    goto LABEL_14;
  }
  char v22 = v21;
  [v21 pairingType];

  uint64_t v23 = sub_CBD18();
  uint64_t v25 = (uint64_t *)(v11 + 112);
  *(void *)(v11 + 136) = &type metadata for String;
  *(void *)(v11 + 144) = v15;
  if (!v24)
  {
LABEL_14:
    *uint64_t v25 = 0x4952494150204F4ELL;
    unint64_t v24 = 0xEF4550595420474ELL;
    goto LABEL_15;
  }
  *uint64_t v25 = v23;
LABEL_15:
  *(void *)(v11 + 120) = v24;
  uint64_t v26 = (void *)v20();
  if (!v26 || (id v27 = v26, v28 = [v26 pin], v27, !v28))
  {
    uint64_t v32 = (uint64_t *)(v11 + 152);
    *(void *)(v11 + 176) = &type metadata for String;
    *(void *)(v11 + 184) = v15;
    goto LABEL_20;
  }
  uint64_t v29 = sub_E7110();
  unint64_t v31 = v30;

  uint64_t v32 = (uint64_t *)(v11 + 152);
  *(void *)(v11 + 176) = &type metadata for String;
  *(void *)(v11 + 184) = v15;
  if (!v31)
  {
LABEL_20:
    *uint64_t v32 = 0x4E4950204F4ELL;
    unint64_t v31 = 0xE600000000000000;
    goto LABEL_21;
  }
  *uint64_t v32 = v29;
LABEL_21:
  *(void *)(v11 + 160) = v31;
  sub_170BC();
  uint64_t v33 = (void *)sub_E73C0();
  sub_E7320();
  sub_E60B0();

  swift_bridgeObjectRelease();
  (*(void (**)(void))(*(void *)v3 + 368))(0);
  (*(void (**)(void))(*(void *)v3 + 392))(0);
  return (*(uint64_t (**)(void))(*(void *)v3 + 416))(0);
}

void sub_C7150(uint64_t a1, void *a2, void *a3)
{
  long long v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_C71E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  if ((*(uint64_t (**)(unint64_t, unint64_t, uint64_t))(*(void *)v2 + 1176))(0xD000000000000014, 0x80000000000F37B0, a1))
  {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(*(void *)v3 + 384))();
    if (!v4
      || (long long v5 = v4, v6 = (char *)[v4 pairingType], v5, v6 != (unsigned char *)&dword_0 + 2)
      || ((*(uint64_t (**)(void))(*(void *)v3 + 856))() & 1) == 0)
    {
      (*(void (**)(void))(*(void *)v2 + 368))(0);
      (*(void (**)(void))(*(void *)v2 + 392))(0);
    }
    return (*(uint64_t (**)(void))(*(void *)v3 + 424))(0);
  }
  else
  {
    sub_DA570(v3);
    unint64_t v8 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 552))(v10);
    sub_DA47C(v9);
    return v8(v10, 0);
  }
}

void sub_C73E4(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_10C7C(&qword_122298);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_EB580;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a1 + 360))();
  uint64_t v7 = v6;
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v8 = sub_17068();
  *(void *)(v4 + 64) = v8;
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v7;
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)a1 + 976))();
  *(void *)(v4 + 96) = &type metadata for String;
  *(void *)(v4 + 104) = v8;
  uint64_t v11 = 0x4552444441204F4ELL;
  if (v10) {
    uint64_t v11 = v9;
  }
  unint64_t v12 = 0xEA00000000005353;
  if (v10) {
    unint64_t v12 = v10;
  }
  *(void *)(v4 + 72) = v11;
  *(void *)(v4 + 80) = v12;
  sub_170BC();
  uint64_t v13 = (void *)sub_E73C0();
  sub_E7320();
  sub_E60B0();
  swift_bridgeObjectRelease();

  id v14 = [objc_allocWithZone((Class)CBConnection) init];
  unint64_t v15 = (void *)(*(uint64_t (**)(void))(*(void *)a1 + 264))();
  [v14 setPeerDevice:v15];

  [v14 setServiceFlags:0xFFFFFFFFLL];
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v2;
  *(void *)(v16 + 24) = a1;
  v18[4] = sub_C76A8;
  v18[5] = v16;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_419EC;
  v18[3] = &unk_1178A0;
  unint64_t v17 = _Block_copy(v18);
  swift_retain();
  swift_retain();
  swift_release();
  [v14 disconnectWithCompletion:v17];
  _Block_release(v17);
}

uint64_t sub_C76A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t result = (*(uint64_t (**)(unint64_t, unint64_t, uint64_t))(*(void *)v2 + 1176))(0xD000000000000011, 0x80000000000F3750, a1);
  if ((result & 1) == 0)
  {
    sub_10C7C(&qword_122298);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_EB580;
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v3 + 360))();
    uint64_t v8 = v7;
    *(void *)(v5 + 56) = &type metadata for String;
    unint64_t v9 = sub_17068();
    *(void *)(v5 + 64) = v9;
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v8;
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)v3 + 976))();
    *(void *)(v5 + 96) = &type metadata for String;
    *(void *)(v5 + 104) = v9;
    uint64_t v12 = 0x4552444441204F4ELL;
    if (v11) {
      uint64_t v12 = v10;
    }
    unint64_t v13 = 0xEA00000000005353;
    if (v11) {
      unint64_t v13 = v11;
    }
    *(void *)(v5 + 72) = v12;
    *(void *)(v5 + 80) = v13;
    sub_170BC();
    id v14 = (void *)sub_E73C0();
    sub_E7320();
    sub_E60B0();

    uint64_t v15 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t))(*(void *)v3 + 1016))(v15);
    sub_DA570(v3);
    uint64_t v16 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 552))(v18);
    sub_DA47C(v17);
    return v16(v18, 0);
  }
  return result;
}

void sub_C7920(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_10C7C(&qword_122298);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_EB580;
  if (a1)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)a1 + 360))();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
  }
  *(void *)(v4 + 56) = &type metadata for String;
  unint64_t v8 = sub_17068();
  unint64_t v9 = v8;
  *(void *)(v4 + 64) = v8;
  uint64_t v10 = 0x454D414E204F4ELL;
  if (v7) {
    uint64_t v10 = v5;
  }
  unint64_t v11 = 0xE700000000000000;
  if (v7) {
    unint64_t v11 = v7;
  }
  *(void *)(v4 + 32) = v10;
  *(void *)(v4 + 40) = v11;
  if (a1)
  {
    uint64_t v12 = (*(uint64_t (**)(void))(*(void *)a1 + 976))();
    id v14 = (uint64_t *)(v4 + 72);
    *(void *)(v4 + 96) = &type metadata for String;
    *(void *)(v4 + 104) = v9;
    if (v13)
    {
      *id v14 = v12;
      goto LABEL_13;
    }
  }
  else
  {
    id v14 = (uint64_t *)(v4 + 72);
    *(void *)(v4 + 96) = &type metadata for String;
    *(void *)(v4 + 104) = v8;
  }
  *id v14 = 0x4552444441204F4ELL;
  unint64_t v13 = 0xEA00000000005353;
LABEL_13:
  *(void *)(v4 + 80) = v13;
  sub_170BC();
  uint64_t v15 = (void *)sub_E73C0();
  sub_E7320();
  sub_E60B0();
  swift_bridgeObjectRelease();

  if (a1)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 416);
    uint64_t v17 = swift_retain();
    uint64_t v18 = v16(v17);
    if (v18)
    {
      unint64_t v19 = (void *)v18;
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_EB580;
      uint64_t v21 = (*(uint64_t (**)(void))(*(void *)a1 + 360))();
      *(void *)(v20 + 56) = &type metadata for String;
      *(void *)(v20 + 64) = v9;
      *(void *)(v20 + 32) = v21;
      *(void *)(v20 + 40) = v22;
      uint64_t v23 = (*(uint64_t (**)(void))(*(void *)a1 + 976))();
      *(void *)(v20 + 96) = &type metadata for String;
      *(void *)(v20 + 104) = v9;
      uint64_t v25 = 0x4552444441204F4ELL;
      if (v24) {
        uint64_t v25 = v23;
      }
      unint64_t v26 = 0xEA00000000005353;
      if (v24) {
        unint64_t v26 = v24;
      }
      *(void *)(v20 + 72) = v25;
      *(void *)(v20 + 80) = v26;
      id v27 = (void *)sub_E73C0();
      sub_E7320();
      sub_E60B0();
      swift_bridgeObjectRelease();

      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v2;
      *(void *)(v28 + 24) = a1;
      aBlock[4] = sub_C7D68;
      aBlock[5] = v28;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_419EC;
      void aBlock[3] = &unk_1178F0;
      uint64_t v29 = _Block_copy(aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      [v19 pairingPerformAction:3 completionHandler:v29];
      _Block_release(v29);
      swift_release();
    }
    else
    {
      swift_release();
    }
  }
}

uint64_t sub_C7D28()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_C7D68(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  if (((*(uint64_t (**)(unint64_t, unint64_t, uint64_t))(**(void **)(v1 + 16) + 1176))(0xD000000000000022, 0x80000000000F36C0, a1) & 1) == 0)
  {
    sub_10C7C(&qword_122298);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_EB580;
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)v2 + 360))();
    uint64_t v6 = v5;
    *(void *)(v3 + 56) = &type metadata for String;
    unint64_t v7 = sub_17068();
    *(void *)(v3 + 64) = v7;
    *(void *)(v3 + 32) = v4;
    *(void *)(v3 + 40) = v6;
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v2 + 976))();
    *(void *)(v3 + 96) = &type metadata for String;
    *(void *)(v3 + 104) = v7;
    uint64_t v10 = 0x4552444441204F4ELL;
    if (v9) {
      uint64_t v10 = v8;
    }
    unint64_t v11 = 0xEA00000000005353;
    if (v9) {
      unint64_t v11 = v9;
    }
    *(void *)(v3 + 72) = v10;
    *(void *)(v3 + 80) = v11;
    sub_170BC();
    uint64_t v12 = (void *)sub_E73C0();
    sub_E7320();
    sub_E60B0();

    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(void))(*(void *)v2 + 424))(0);
}

uint64_t sub_C7F8C()
{
  return 0x2080000A00000;
}

uint64_t sub_C7F9C()
{
  return 0x2080000A00000;
}

uint64_t sub_C7FAC(uint64_t a1)
{
  uint64_t v2 = (char *)_swiftEmptyArrayStorage;
  long long v217 = (char *)_swiftEmptyArrayStorage;
  if (a1)
  {
    uint64_t v2 = sub_3F588(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    unint64_t v4 = *((void *)v2 + 2);
    unint64_t v3 = *((void *)v2 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v3 > 1), v4 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v4 + 1;
    uint64_t v5 = &v2[16 * v4];
    *((void *)v5 + 4) = 0x615020656C707041;
    *((void *)v5 + 5) = 0xE900000000000079;
    long long v217 = v2;
  }
  if ((a1 & 2) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    strcpy(v8 + 32, "Apple TV Setup");
    v8[47] = -18;
    long long v217 = v2;
    if ((a1 & 4) == 0)
    {
LABEL_7:
      if ((a1 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_7;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v10 = *((void *)v2 + 2);
  unint64_t v9 = *((void *)v2 + 3);
  if (v10 >= v9 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v9 > 1), v10 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v10 + 1;
  unint64_t v11 = &v2[16 * v10];
  *((void *)v11 + 4) = 0x6E67695320707041;
  *((void *)v11 + 5) = 0xEB000000006E4920;
  long long v217 = v2;
  if ((a1 & 8) == 0)
  {
LABEL_8:
    if ((a1 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_21:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v13 = *((void *)v2 + 2);
  unint64_t v12 = *((void *)v2 + 3);
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v12 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 1;
  id v14 = &v2[16 * v13];
  strcpy(v14 + 32, "Companion Link");
  v14[47] = -18;
  long long v217 = v2;
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_31;
  }
LABEL_26:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v16 = *((void *)v2 + 2);
  unint64_t v15 = *((void *)v2 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v15 > 1), v16 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v16 + 1;
  uint64_t v17 = &v2[16 * v16];
  strcpy(v17 + 32, "Home Pod Setup");
  v17[47] = -18;
  long long v217 = v2;
  if ((a1 & 0x20) != 0)
  {
LABEL_31:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v19 = *((void *)v2 + 2);
    unint64_t v18 = *((void *)v2 + 3);
    if (v19 >= v18 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v18 > 1), v19 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v19 + 1;
    uint64_t v20 = &v2[16 * v19];
    *((void *)v20 + 4) = 0x7574655320534F69;
    *((void *)v20 + 5) = 0xE900000000000070;
    long long v217 = v2;
  }
LABEL_36:
  if ((a1 & 0x40) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v22 = *((void *)v2 + 2);
    unint64_t v21 = *((void *)v2 + 3);
    if (v22 >= v21 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v21 > 1), v22 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v22 + 1;
    uint64_t v23 = &v2[16 * v22];
    *((void *)v23 + 4) = 0x492079627261654ELL;
    *((void *)v23 + 5) = 0xEB000000006F666ELL;
    long long v217 = v2;
  }
  if ((a1 & 0x80) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v25 = *((void *)v2 + 2);
    unint64_t v24 = *((void *)v2 + 3);
    if (v25 >= v24 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v24 > 1), v25 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v25 + 1;
    unint64_t v26 = &v2[16 * v25];
    *((void *)v26 + 4) = 0xD000000000000010;
    *((void *)v26 + 5) = 0x80000000000F3A50;
    long long v217 = v2;
    if ((a1 & 0x100) == 0)
    {
LABEL_44:
      if ((a1 & 0x200) == 0) {
        goto LABEL_45;
      }
      goto LABEL_68;
    }
  }
  else if ((a1 & 0x100) == 0)
  {
    goto LABEL_44;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v28 = *((void *)v2 + 2);
  unint64_t v27 = *((void *)v2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v27 > 1), v28 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v28 + 1;
  uint64_t v29 = &v2[16 * v28];
  strcpy(v29 + 32, "Remote Display");
  v29[47] = -18;
  long long v217 = v2;
  if ((a1 & 0x200) == 0)
  {
LABEL_45:
    if ((a1 & 0x400) == 0) {
      goto LABEL_46;
    }
    goto LABEL_73;
  }
LABEL_68:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v31 = *((void *)v2 + 2);
  unint64_t v30 = *((void *)v2 + 3);
  if (v31 >= v30 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v30 > 1), v31 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v31 + 1;
  uint64_t v32 = &v2[16 * v31];
  *((void *)v32 + 4) = 0x70655220786F7250;
  *((void *)v32 + 5) = 0xEB00000000726961;
  long long v217 = v2;
  if ((a1 & 0x400) == 0)
  {
LABEL_46:
    if ((a1 & 0x800) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_73:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v34 = *((void *)v2 + 2);
  unint64_t v33 = *((void *)v2 + 3);
  if (v34 >= v33 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v33 > 1), v34 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v34 + 1;
  Swift::Int v35 = &v2[16 * v34];
  *((void *)v35 + 4) = 0x7541206572616853;
  *((void *)v35 + 5) = 0xEB000000006F6964;
  long long v217 = v2;
  if ((a1 & 0x800) == 0)
  {
LABEL_47:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_83;
  }
LABEL_78:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v37 = *((void *)v2 + 2);
  unint64_t v36 = *((void *)v2 + 3);
  if (v37 >= v36 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v36 > 1), v37 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v37 + 1;
  Swift::Int v38 = &v2[16 * v37];
  *((void *)v38 + 4) = 0xD000000000000010;
  *((void *)v38 + 5) = 0x80000000000F3A30;
  long long v217 = v2;
  if ((a1 & 0x1000) == 0)
  {
LABEL_48:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_88;
  }
LABEL_83:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v40 = *((void *)v2 + 2);
  unint64_t v39 = *((void *)v2 + 3);
  if (v40 >= v39 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v39 > 1), v40 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v40 + 1;
  id v41 = &v2[16 * v40];
  *((void *)v41 + 4) = 0x7574655320414857;
  *((void *)v41 + 5) = 0xE900000000000070;
  long long v217 = v2;
  if ((a1 & 0x2000) == 0)
  {
LABEL_49:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_93;
  }
LABEL_88:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v43 = *((void *)v2 + 2);
  unint64_t v42 = *((void *)v2 + 3);
  if (v43 >= v42 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v42 > 1), v43 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v43 + 1;
  uint64_t v44 = &v2[16 * v43];
  strcpy(v44 + 32, "WiFi Password");
  *((_WORD *)v44 + 23) = -4864;
  long long v217 = v2;
  if ((a1 & 0x4000) == 0)
  {
LABEL_50:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_98;
  }
LABEL_93:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v46 = *((void *)v2 + 2);
  unint64_t v45 = *((void *)v2 + 3);
  if (v46 >= v45 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v45 > 1), v46 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v46 + 1;
  char v47 = &v2[16 * v46];
  *((void *)v47 + 4) = 0x7075746553205857;
  *((void *)v47 + 5) = 0xE800000000000000;
  long long v217 = v2;
  if ((a1 & 0x8000) == 0)
  {
LABEL_51:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_103;
  }
LABEL_98:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v49 = *((void *)v2 + 2);
  unint64_t v48 = *((void *)v2 + 3);
  if (v49 >= v48 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v48 > 1), v49 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v49 + 1;
  uint64_t v50 = &v2[16 * v49];
  *((void *)v50 + 4) = 0x7574617453205857;
  *((void *)v50 + 5) = 0xE900000000000073;
  long long v217 = v2;
  if ((a1 & 0x10000) == 0)
  {
LABEL_52:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_108;
  }
LABEL_103:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v52 = *((void *)v2 + 2);
  unint64_t v51 = *((void *)v2 + 3);
  if (v52 >= v51 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v51 > 1), v52 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v52 + 1;
  uint64_t v53 = &v2[16 * v52];
  strcpy(v53 + 32, "Object Setup");
  v53[45] = 0;
  *((_WORD *)v53 + 23) = -5120;
  long long v217 = v2;
  if ((a1 & 0x20000) == 0)
  {
LABEL_53:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_113;
  }
LABEL_108:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v55 = *((void *)v2 + 2);
  unint64_t v54 = *((void *)v2 + 3);
  if (v55 >= v54 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v54 > 1), v55 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v55 + 1;
  uint64_t v56 = &v2[16 * v55];
  strcpy(v56 + 32, "Remote Pairing");
  v56[47] = -18;
  long long v217 = v2;
  if ((a1 & 0x40000) == 0)
  {
LABEL_54:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_118;
  }
LABEL_113:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v58 = *((void *)v2 + 2);
  unint64_t v57 = *((void *)v2 + 3);
  if (v58 >= v57 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v57 > 1), v58 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v58 + 1;
  uint64_t v59 = &v2[16 * v58];
  *((void *)v59 + 4) = 0xD000000000000013;
  *((void *)v59 + 5) = 0x80000000000F3A10;
  long long v217 = v2;
  if ((a1 & 0x80000) == 0)
  {
LABEL_55:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_123;
  }
LABEL_118:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v61 = *((void *)v2 + 2);
  unint64_t v60 = *((void *)v2 + 3);
  if (v61 >= v60 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v60 > 1), v61 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v61 + 1;
  uint64_t v62 = &v2[16 * v61];
  strcpy(v62 + 32, "Nearby Action");
  *((_WORD *)v62 + 23) = -4864;
  long long v217 = v2;
  if ((a1 & 0x100000) == 0)
  {
LABEL_56:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_133;
    }
    goto LABEL_128;
  }
LABEL_123:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v64 = *((void *)v2 + 2);
  unint64_t v63 = *((void *)v2 + 3);
  if (v64 >= v63 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v63 > 1), v64 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v64 + 1;
  uint64_t v65 = &v2[16 * v64];
  strcpy(v65 + 32, "Passive RSSI");
  v65[45] = 0;
  *((_WORD *)v65 + 23) = -5120;
  long long v217 = v2;
  if ((a1 & 0x200000) != 0)
  {
LABEL_128:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v67 = *((void *)v2 + 2);
    unint64_t v66 = *((void *)v2 + 3);
    if (v67 >= v66 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v66 > 1), v67 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v67 + 1;
    uint64_t v68 = &v2[16 * v67];
    *((void *)v68 + 4) = 0x697463656E6E6F43;
    *((void *)v68 + 5) = 0xEB00000000736E6FLL;
    long long v217 = v2;
  }
LABEL_133:
  if ((a1 & 0x400000) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v70 = *((void *)v2 + 2);
    unint64_t v69 = *((void *)v2 + 3);
    if (v70 >= v69 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v69 > 1), v70 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v70 + 1;
    uint64_t v71 = &v2[16 * v70];
    *((void *)v71 + 4) = 0x2074694B656D6F48;
    *((void *)v71 + 5) = 0xEA00000000003156;
    long long v217 = v2;
    if ((a1 & 0x800000) == 0)
    {
LABEL_135:
      if ((a1 & 0x1000000) == 0) {
        goto LABEL_152;
      }
      goto LABEL_147;
    }
  }
  else if ((a1 & 0x800000) == 0)
  {
    goto LABEL_135;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v73 = *((void *)v2 + 2);
  unint64_t v72 = *((void *)v2 + 3);
  if (v73 >= v72 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v72 > 1), v73 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v73 + 1;
  uint64_t v74 = &v2[16 * v73];
  *((void *)v74 + 4) = 0x676E6972696150;
  *((void *)v74 + 5) = 0xE700000000000000;
  long long v217 = v2;
  if ((a1 & 0x1000000) != 0)
  {
LABEL_147:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v76 = *((void *)v2 + 2);
    unint64_t v75 = *((void *)v2 + 3);
    if (v76 >= v75 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v75 > 1), v76 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v76 + 1;
    id v77 = &v2[16 * v76];
    *((void *)v77 + 4) = 0x2074694B656D6F48;
    *((void *)v77 + 5) = 0xEA00000000003256;
    long long v217 = v2;
  }
LABEL_152:
  if ((a1 & 0x2000000) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v79 = *((void *)v2 + 2);
    unint64_t v78 = *((void *)v2 + 3);
    if (v79 >= v78 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v78 > 1), v79 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v79 + 1;
    id v80 = &v2[16 * v79];
    *((void *)v80 + 4) = 0x4F206E6565726353;
    *((void *)v80 + 5) = 0xEA00000000006666;
    long long v217 = v2;
    if ((a1 & 0x4000000) == 0)
    {
LABEL_154:
      if ((a1 & 0x8000000) == 0) {
        goto LABEL_155;
      }
      goto LABEL_176;
    }
  }
  else if ((a1 & 0x4000000) == 0)
  {
    goto LABEL_154;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v82 = *((void *)v2 + 2);
  unint64_t v81 = *((void *)v2 + 3);
  if (v82 >= v81 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v81 > 1), v82 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v82 + 1;
  Swift::Int v83 = &v2[16 * v82];
  *((void *)v83 + 4) = 7824718;
  *((void *)v83 + 5) = 0xE300000000000000;
  long long v217 = v2;
  if ((a1 & 0x8000000) == 0)
  {
LABEL_155:
    if ((a1 & 0x10000000) == 0) {
      goto LABEL_156;
    }
    goto LABEL_181;
  }
LABEL_176:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v85 = *((void *)v2 + 2);
  unint64_t v84 = *((void *)v2 + 3);
  if (v85 >= v84 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v84 > 1), v85 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v85 + 1;
  long long v86 = &v2[16 * v85];
  *((void *)v86 + 4) = 0x6465766F6D6552;
  *((void *)v86 + 5) = 0xE700000000000000;
  long long v217 = v2;
  if ((a1 & 0x10000000) == 0)
  {
LABEL_156:
    if ((a1 & 0x20000000) == 0) {
      goto LABEL_157;
    }
    goto LABEL_186;
  }
LABEL_181:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v88 = *((void *)v2 + 2);
  unint64_t v87 = *((void *)v2 + 3);
  if (v88 >= v87 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v87 > 1), v88 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v88 + 1;
  char v89 = &v2[16 * v88];
  *((void *)v89 + 4) = 0xD000000000000018;
  *((void *)v89 + 5) = 0x80000000000F39F0;
  long long v217 = v2;
  if ((a1 & 0x20000000) == 0)
  {
LABEL_157:
    if ((a1 & 0x40000000) == 0) {
      goto LABEL_158;
    }
    goto LABEL_191;
  }
LABEL_186:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v91 = *((void *)v2 + 2);
  unint64_t v90 = *((void *)v2 + 3);
  if (v91 >= v90 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v90 > 1), v91 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v91 + 1;
  uint64_t v92 = &v2[16 * v91];
  *((void *)v92 + 4) = 0x7365725020454C42;
  *((void *)v92 + 5) = 0xEB00000000746E65;
  long long v217 = v2;
  if ((a1 & 0x40000000) == 0)
  {
LABEL_158:
    if ((a1 & 0x80000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_196;
  }
LABEL_191:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v94 = *((void *)v2 + 2);
  unint64_t v93 = *((void *)v2 + 3);
  if (v94 >= v93 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v93 > 1), v94 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v94 + 1;
  char v95 = &v2[16 * v94];
  *((void *)v95 + 4) = 0xD000000000000016;
  *((void *)v95 + 5) = 0x80000000000F39D0;
  long long v217 = v2;
  if ((a1 & 0x80000000) == 0)
  {
LABEL_159:
    if ((a1 & 0x100000000) == 0) {
      goto LABEL_160;
    }
    goto LABEL_201;
  }
LABEL_196:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v97 = *((void *)v2 + 2);
  unint64_t v96 = *((void *)v2 + 3);
  if (v97 >= v96 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v96 > 1), v97 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v97 + 1;
  id v98 = &v2[16 * v97];
  *((void *)v98 + 4) = 0xD000000000000011;
  *((void *)v98 + 5) = 0x80000000000F39B0;
  long long v217 = v2;
  if ((a1 & 0x100000000) == 0)
  {
LABEL_160:
    if ((a1 & 0x200000000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_206;
  }
LABEL_201:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v100 = *((void *)v2 + 2);
  unint64_t v99 = *((void *)v2 + 3);
  if (v100 >= v99 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v99 > 1), v100 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v100 + 1;
  uint64_t v101 = &v2[16 * v100];
  strcpy(v101 + 32, "HomeKit Setup");
  *((_WORD *)v101 + 23) = -4864;
  long long v217 = v2;
  if ((a1 & 0x200000000) == 0)
  {
LABEL_161:
    if ((a1 & 0x400000000) == 0) {
      goto LABEL_162;
    }
    goto LABEL_211;
  }
LABEL_206:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v103 = *((void *)v2 + 2);
  unint64_t v102 = *((void *)v2 + 3);
  if (v103 >= v102 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v102 > 1), v103 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v103 + 1;
  uint64_t v104 = &v2[16 * v103];
  *((void *)v104 + 4) = 1230197586;
  *((void *)v104 + 5) = 0xE400000000000000;
  long long v217 = v2;
  if ((a1 & 0x400000000) == 0)
  {
LABEL_162:
    if ((a1 & 0x800000000) == 0) {
      goto LABEL_163;
    }
    goto LABEL_216;
  }
LABEL_211:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v106 = *((void *)v2 + 2);
  unint64_t v105 = *((void *)v2 + 3);
  if (v106 >= v105 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v105 > 1), v106 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v106 + 1;
  uint64_t v107 = &v2[16 * v106];
  *((void *)v107 + 4) = 0x656C626D65736E45;
  *((void *)v107 + 5) = 0xE800000000000000;
  long long v217 = v2;
  if ((a1 & 0x800000000) == 0)
  {
LABEL_163:
    if ((a1 & 0x1000000000) == 0) {
      goto LABEL_164;
    }
    goto LABEL_221;
  }
LABEL_216:
  long long v217 = v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    long long v217 = v2;
  }
  unint64_t v109 = *((void *)v2 + 2);
  unint64_t v108 = *((void *)v2 + 3);
  if (v109 >= v108 >> 1)
  {
    uint64_t v2 = sub_3F588((char *)(v108 > 1), v109 + 1, 1, v2);
    long long v217 = v2;
  }
  *((void *)v2 + 2) = v109 + 1;
  unint64_t v110 = &v2[16 * v109];
  *((void *)v110 + 4) = 0x7265766F63736944;
  *((void *)v110 + 5) = 0xEF7367616C462079;
  if ((a1 & 0x1000000000) == 0)
  {
LABEL_164:
    if ((a1 & 0x2000000000) == 0) {
      goto LABEL_229;
    }
    goto LABEL_226;
  }
LABEL_221:
  unint64_t v111 = v217;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    unint64_t v111 = sub_3F588(0, *((void *)v217 + 2) + 1, 1, v217);
    long long v217 = v111;
  }
  unint64_t v113 = *((void *)v111 + 2);
  unint64_t v112 = *((void *)v111 + 3);
  if (v113 >= v112 >> 1)
  {
    unint64_t v111 = sub_3F588((char *)(v112 > 1), v113 + 1, 1, v111);
    long long v217 = v111;
  }
  *((void *)v111 + 2) = v113 + 1;
  unint64_t v114 = &v111[16 * v113];
  *((void *)v114 + 4) = 0x796669746E656449;
  *((void *)v114 + 5) = 0xE800000000000000;
  if ((a1 & 0x2000000000) != 0)
  {
LABEL_226:
    sub_CBE20();
    uint64_t v115 = v217;
    unint64_t v117 = *((void *)v217 + 2);
    unint64_t v116 = *((void *)v217 + 3);
    if (v117 >= v116 >> 1)
    {
      uint64_t v115 = sub_3F588((char *)(v116 > 1), v117 + 1, 1, v217);
      long long v217 = v115;
    }
    *((void *)v115 + 2) = v117 + 1;
    char v118 = &v115[16 * v117];
    *((void *)v118 + 4) = 0x5320657669746341;
    *((void *)v118 + 5) = 0xEB000000006E6163;
  }
LABEL_229:
  if ((a1 & 0x4000000000) != 0)
  {
    sub_CBE20();
    unint64_t v119 = v217;
    unint64_t v121 = *((void *)v217 + 2);
    unint64_t v120 = *((void *)v217 + 3);
    if (v121 >= v120 >> 1)
    {
      unint64_t v119 = sub_3F588((char *)(v120 > 1), v121 + 1, 1, v217);
      long long v217 = v119;
    }
    *((void *)v119 + 2) = v121 + 1;
    uint64_t v122 = &v119[16 * v121];
    strcpy(v122 + 32, "AirPlay Source");
    v122[47] = -18;
    if ((a1 & 0x8000000000) == 0)
    {
LABEL_231:
      if ((a1 & 0x10000000000) == 0) {
        goto LABEL_232;
      }
      goto LABEL_260;
    }
  }
  else if ((a1 & 0x8000000000) == 0)
  {
    goto LABEL_231;
  }
  sub_CBE20();
  uint64_t v123 = v217;
  unint64_t v125 = *((void *)v217 + 2);
  unint64_t v124 = *((void *)v217 + 3);
  if (v125 >= v124 >> 1)
  {
    uint64_t v123 = sub_3F588((char *)(v124 > 1), v125 + 1, 1, v217);
    long long v217 = v123;
  }
  *((void *)v123 + 2) = v125 + 1;
  unint64_t v126 = &v123[16 * v125];
  strcpy(v126 + 32, "AirPlay Target");
  v126[47] = -18;
  if ((a1 & 0x10000000000) == 0)
  {
LABEL_232:
    if ((a1 & 0x20000000000) == 0) {
      goto LABEL_233;
    }
    goto LABEL_263;
  }
LABEL_260:
  sub_CBE20();
  long long v127 = v217;
  unint64_t v129 = *((void *)v217 + 2);
  unint64_t v128 = *((void *)v217 + 3);
  if (v129 >= v128 >> 1)
  {
    long long v127 = sub_3F588((char *)(v128 > 1), v129 + 1, 1, v217);
    long long v217 = v127;
  }
  *((void *)v127 + 2) = v129 + 1;
  uint64_t v130 = &v127[16 * v129];
  *((void *)v130 + 4) = 0x63532065676E6152;
  *((void *)v130 + 5) = 0xEA00000000006E61;
  if ((a1 & 0x20000000000) == 0)
  {
LABEL_233:
    if ((a1 & 0x40000000000) == 0) {
      goto LABEL_234;
    }
    goto LABEL_266;
  }
LABEL_263:
  sub_CBE20();
  uint64_t v131 = v217;
  unint64_t v133 = *((void *)v217 + 2);
  unint64_t v132 = *((void *)v217 + 3);
  if (v133 >= v132 >> 1)
  {
    uint64_t v131 = sub_3F588((char *)(v132 > 1), v133 + 1, 1, v217);
    long long v217 = v131;
  }
  *((void *)v131 + 2) = v133 + 1;
  uint64_t v134 = &v131[16 * v133];
  *((void *)v134 + 4) = 0xD00000000000001BLL;
  *((void *)v134 + 5) = 0x80000000000F3990;
  if ((a1 & 0x40000000000) == 0)
  {
LABEL_234:
    if ((a1 & 0x80000000000) == 0) {
      goto LABEL_235;
    }
    goto LABEL_269;
  }
LABEL_266:
  sub_CBE20();
  BOOL v135 = v217;
  unint64_t v137 = *((void *)v217 + 2);
  unint64_t v136 = *((void *)v217 + 3);
  if (v137 >= v136 >> 1)
  {
    BOOL v135 = sub_3F588((char *)(v136 > 1), v137 + 1, 1, v217);
    long long v217 = v135;
  }
  *((void *)v135 + 2) = v137 + 1;
  long long v138 = &v135[16 * v137];
  *((void *)v138 + 4) = 0xD000000000000015;
  *((void *)v138 + 5) = 0x80000000000F3970;
  if ((a1 & 0x80000000000) == 0)
  {
LABEL_235:
    if ((a1 & 0x100000000000) == 0) {
      goto LABEL_236;
    }
    goto LABEL_272;
  }
LABEL_269:
  sub_CBE20();
  uint64_t v139 = v217;
  unint64_t v141 = *((void *)v217 + 2);
  unint64_t v140 = *((void *)v217 + 3);
  if (v141 >= v140 >> 1)
  {
    uint64_t v139 = sub_3F588((char *)(v140 > 1), v141 + 1, 1, v217);
    long long v217 = v139;
  }
  *((void *)v139 + 2) = v141 + 1;
  BOOL v142 = &v139[16 * v141];
  *((void *)v142 + 4) = 0x7475626972747441;
  *((void *)v142 + 5) = 0xEA00000000007365;
  if ((a1 & 0x100000000000) == 0)
  {
LABEL_236:
    if ((a1 & 0x200000000000) == 0) {
      goto LABEL_237;
    }
    goto LABEL_275;
  }
LABEL_272:
  sub_CBE20();
  uint64_t v143 = v217;
  unint64_t v145 = *((void *)v217 + 2);
  unint64_t v144 = *((void *)v217 + 3);
  if (v145 >= v144 >> 1)
  {
    uint64_t v143 = sub_3F588((char *)(v144 > 1), v145 + 1, 1, v217);
    long long v217 = v143;
  }
  *((void *)v143 + 2) = v145 + 1;
  uint64_t v146 = &v143[16 * v145];
  *((void *)v146 + 4) = 0x686365654CLL;
  *((void *)v146 + 5) = 0xE500000000000000;
  if ((a1 & 0x200000000000) == 0)
  {
LABEL_237:
    if ((a1 & 0x400000000000) == 0) {
      goto LABEL_238;
    }
    goto LABEL_278;
  }
LABEL_275:
  sub_CBE20();
  uint64_t v147 = v217;
  unint64_t v149 = *((void *)v217 + 2);
  unint64_t v148 = *((void *)v217 + 3);
  if (v149 >= v148 >> 1)
  {
    uint64_t v147 = sub_3F588((char *)(v148 > 1), v149 + 1, 1, v217);
    long long v217 = v147;
  }
  *((void *)v147 + 2) = v149 + 1;
  uint64_t v150 = &v147[16 * v149];
  strcpy(v150 + 32, "Prox Control");
  v150[45] = 0;
  *((_WORD *)v150 + 23) = -5120;
  if ((a1 & 0x400000000000) == 0)
  {
LABEL_238:
    if ((a1 & 0x1000000000000) == 0) {
      goto LABEL_239;
    }
    goto LABEL_281;
  }
LABEL_278:
  sub_CBE20();
  uint64_t v151 = v217;
  unint64_t v153 = *((void *)v217 + 2);
  unint64_t v152 = *((void *)v217 + 3);
  if (v153 >= v152 >> 1)
  {
    uint64_t v151 = sub_3F588((char *)(v152 > 1), v153 + 1, 1, v217);
    long long v217 = v151;
  }
  *((void *)v151 + 2) = v153 + 1;
  unint64_t v154 = &v151[16 * v153];
  *((void *)v154 + 4) = 0x6F4820656C6F6857;
  *((void *)v154 + 5) = 0xEA0000000000656DLL;
  if ((a1 & 0x1000000000000) == 0)
  {
LABEL_239:
    if ((a1 & 0x800000000000) == 0) {
      goto LABEL_240;
    }
    goto LABEL_284;
  }
LABEL_281:
  sub_CBE20();
  unint64_t v155 = v217;
  unint64_t v157 = *((void *)v217 + 2);
  unint64_t v156 = *((void *)v217 + 3);
  if (v157 >= v156 >> 1)
  {
    unint64_t v155 = sub_3F588((char *)(v156 > 1), v157 + 1, 1, v217);
    long long v217 = v155;
  }
  *((void *)v155 + 2) = v157 + 1;
  uint64_t v158 = &v155[16 * v157];
  *((void *)v158 + 4) = 0xD000000000000015;
  *((void *)v158 + 5) = 0x80000000000F3950;
  if ((a1 & 0x800000000000) == 0)
  {
LABEL_240:
    if ((a1 & 0x2000000000000) == 0) {
      goto LABEL_241;
    }
    goto LABEL_287;
  }
LABEL_284:
  sub_CBE20();
  unint64_t v159 = v217;
  unint64_t v161 = *((void *)v217 + 2);
  unint64_t v160 = *((void *)v217 + 3);
  if (v161 >= v160 >> 1)
  {
    unint64_t v159 = sub_3F588((char *)(v160 > 1), v161 + 1, 1, v217);
    long long v217 = v159;
  }
  *((void *)v159 + 2) = v161 + 1;
  unint64_t v162 = &v159[16 * v161];
  *((void *)v162 + 4) = 0x766F63655220534FLL;
  *((void *)v162 + 5) = 0xEB00000000797265;
  if ((a1 & 0x2000000000000) == 0)
  {
LABEL_241:
    if ((a1 & 0x4000000000000) == 0) {
      goto LABEL_242;
    }
    goto LABEL_290;
  }
LABEL_287:
  sub_CBE20();
  unint64_t v163 = v217;
  unint64_t v165 = *((void *)v217 + 2);
  unint64_t v164 = *((void *)v217 + 3);
  if (v165 >= v164 >> 1)
  {
    unint64_t v163 = sub_3F588((char *)(v164 > 1), v165 + 1, 1, v217);
    long long v217 = v163;
  }
  *((void *)v163 + 2) = v165 + 1;
  unint64_t v166 = &v163[16 * v165];
  *((void *)v166 + 4) = 0x44494820454C42;
  *((void *)v166 + 5) = 0xE700000000000000;
  if ((a1 & 0x4000000000000) == 0)
  {
LABEL_242:
    if ((a1 & 0x8000000000000) == 0) {
      goto LABEL_243;
    }
    goto LABEL_293;
  }
LABEL_290:
  sub_CBE20();
  long long v167 = v217;
  unint64_t v169 = *((void *)v217 + 2);
  unint64_t v168 = *((void *)v217 + 3);
  if (v169 >= v168 >> 1)
  {
    long long v167 = sub_3F588((char *)(v168 > 1), v169 + 1, 1, v217);
    long long v217 = v167;
  }
  *((void *)v167 + 2) = v169 + 1;
  uint64_t v170 = &v167[16 * v169];
  *((void *)v170 + 4) = 0x63697373616C43;
  *((void *)v170 + 5) = 0xE700000000000000;
  if ((a1 & 0x8000000000000) == 0)
  {
LABEL_243:
    if ((a1 & 0x10000000000000) == 0) {
      goto LABEL_244;
    }
    goto LABEL_296;
  }
LABEL_293:
  sub_CBE20();
  v171 = v217;
  unint64_t v173 = *((void *)v217 + 2);
  unint64_t v172 = *((void *)v217 + 3);
  if (v173 >= v172 >> 1)
  {
    v171 = sub_3F588((char *)(v172 > 1), v173 + 1, 1, v217);
    long long v217 = v171;
  }
  *((void *)v171 + 2) = v173 + 1;
  unint64_t v174 = &v171[16 * v173];
  *((void *)v174 + 4) = 1329875270;
  *((void *)v174 + 5) = 0xE400000000000000;
  if ((a1 & 0x10000000000000) == 0)
  {
LABEL_244:
    if ((a1 & 0x20000000000000) == 0) {
      goto LABEL_245;
    }
    goto LABEL_299;
  }
LABEL_296:
  sub_CBE20();
  char v175 = v217;
  unint64_t v177 = *((void *)v217 + 2);
  unint64_t v176 = *((void *)v217 + 3);
  if (v177 >= v176 >> 1)
  {
    char v175 = sub_3F588((char *)(v176 > 1), v177 + 1, 1, v217);
    long long v217 = v175;
  }
  *((void *)v175 + 2) = v177 + 1;
  long long v178 = &v175[16 * v177];
  *((void *)v178 + 4) = 0xD000000000000014;
  *((void *)v178 + 5) = 0x80000000000F3930;
  if ((a1 & 0x20000000000000) == 0)
  {
LABEL_245:
    if ((a1 & 0x40000000000000) == 0) {
      goto LABEL_246;
    }
    goto LABEL_302;
  }
LABEL_299:
  sub_CBE20();
  long long v179 = v217;
  unint64_t v181 = *((void *)v217 + 2);
  unint64_t v180 = *((void *)v217 + 3);
  if (v181 >= v180 >> 1)
  {
    long long v179 = sub_3F588((char *)(v180 > 1), v181 + 1, 1, v217);
    long long v217 = v179;
  }
  *((void *)v179 + 2) = v181 + 1;
  long long v182 = &v179[16 * v181];
  *((void *)v182 + 4) = 0x6553206863746157;
  *((void *)v182 + 5) = 0xEB00000000707574;
  if ((a1 & 0x40000000000000) == 0)
  {
LABEL_246:
    if ((a1 & 0x80000000000000) == 0) {
      goto LABEL_247;
    }
    goto LABEL_305;
  }
LABEL_302:
  sub_CBE20();
  id v183 = v217;
  unint64_t v185 = *((void *)v217 + 2);
  unint64_t v184 = *((void *)v217 + 3);
  if (v185 >= v184 >> 1)
  {
    id v183 = sub_3F588((char *)(v184 > 1), v185 + 1, 1, v217);
    long long v217 = v183;
  }
  *((void *)v183 + 2) = v185 + 1;
  id v186 = &v183[16 * v185];
  *((void *)v186 + 4) = 0xD000000000000010;
  *((void *)v186 + 5) = 0x80000000000F3910;
  if ((a1 & 0x80000000000000) == 0)
  {
LABEL_247:
    if ((a1 & 0x100000000000000) == 0) {
      goto LABEL_248;
    }
    goto LABEL_308;
  }
LABEL_305:
  sub_CBE20();
  uint64_t v187 = v217;
  unint64_t v189 = *((void *)v217 + 2);
  unint64_t v188 = *((void *)v217 + 3);
  if (v189 >= v188 >> 1)
  {
    uint64_t v187 = sub_3F588((char *)(v188 > 1), v189 + 1, 1, v217);
    long long v217 = v187;
  }
  *((void *)v187 + 2) = v189 + 1;
  Swift::Int v190 = &v187[16 * v189];
  *((void *)v190 + 4) = 0xD000000000000014;
  *((void *)v190 + 5) = 0x80000000000F38F0;
  if ((a1 & 0x100000000000000) == 0)
  {
LABEL_248:
    if ((a1 & 0x200000000000000) == 0) {
      goto LABEL_249;
    }
    goto LABEL_311;
  }
LABEL_308:
  sub_CBE20();
  id v191 = v217;
  unint64_t v193 = *((void *)v217 + 2);
  unint64_t v192 = *((void *)v217 + 3);
  if (v193 >= v192 >> 1)
  {
    id v191 = sub_3F588((char *)(v192 > 1), v193 + 1, 1, v217);
    long long v217 = v191;
  }
  *((void *)v191 + 2) = v193 + 1;
  long long v194 = &v191[16 * v193];
  *((void *)v194 + 4) = 0xD000000000000022;
  *((void *)v194 + 5) = 0x80000000000F38C0;
  if ((a1 & 0x200000000000000) == 0)
  {
LABEL_249:
    if ((a1 & 0x400000000000000) == 0) {
      goto LABEL_250;
    }
    goto LABEL_314;
  }
LABEL_311:
  sub_CBE20();
  long long v195 = v217;
  unint64_t v197 = *((void *)v217 + 2);
  unint64_t v196 = *((void *)v217 + 3);
  if (v197 >= v196 >> 1)
  {
    long long v195 = sub_3F588((char *)(v196 > 1), v197 + 1, 1, v217);
    long long v217 = v195;
  }
  *((void *)v195 + 2) = v197 + 1;
  long long v198 = &v195[16 * v197];
  *((void *)v198 + 4) = 0xD00000000000001CLL;
  *((void *)v198 + 5) = 0x80000000000F38A0;
  if ((a1 & 0x400000000000000) == 0)
  {
LABEL_250:
    if ((a1 & 0x800000000000000) == 0) {
      goto LABEL_251;
    }
    goto LABEL_317;
  }
LABEL_314:
  sub_CBE20();
  long long v199 = v217;
  unint64_t v201 = *((void *)v217 + 2);
  unint64_t v200 = *((void *)v217 + 3);
  if (v201 >= v200 >> 1)
  {
    long long v199 = sub_3F588((char *)(v200 > 1), v201 + 1, 1, v217);
    long long v217 = v199;
  }
  *((void *)v199 + 2) = v201 + 1;
  long long v202 = &v199[16 * v201];
  *((void *)v202 + 4) = 0x6972695320796548;
  *((void *)v202 + 5) = 0xE800000000000000;
  if ((a1 & 0x800000000000000) == 0)
  {
LABEL_251:
    if ((a1 & 0x1000000000000000) == 0) {
      goto LABEL_252;
    }
    goto LABEL_320;
  }
LABEL_317:
  sub_CBE20();
  Swift::Int v203 = v217;
  unint64_t v205 = *((void *)v217 + 2);
  unint64_t v204 = *((void *)v217 + 3);
  if (v205 >= v204 >> 1)
  {
    Swift::Int v203 = sub_3F588((char *)(v204 > 1), v205 + 1, 1, v217);
    long long v217 = v203;
  }
  *((void *)v203 + 2) = v205 + 1;
  uint64_t v206 = &v203[16 * v205];
  *((void *)v206 + 4) = 0x6F666E49205344;
  *((void *)v206 + 5) = 0xE700000000000000;
  if ((a1 & 0x1000000000000000) == 0)
  {
LABEL_252:
    if ((a1 & 0x2000000000000000) == 0) {
      goto LABEL_326;
    }
    goto LABEL_323;
  }
LABEL_320:
  sub_CBE20();
  uint64_t v207 = v217;
  unint64_t v209 = *((void *)v217 + 2);
  unint64_t v208 = *((void *)v217 + 3);
  if (v209 >= v208 >> 1)
  {
    uint64_t v207 = sub_3F588((char *)(v208 > 1), v209 + 1, 1, v217);
    long long v217 = v207;
  }
  *((void *)v207 + 2) = v209 + 1;
  long long v210 = &v207[16 * v209];
  *((void *)v210 + 4) = 0x6F69746341205344;
  *((void *)v210 + 5) = 0xE90000000000006ELL;
  if ((a1 & 0x2000000000000000) != 0)
  {
LABEL_323:
    sub_CBE20();
    long long v211 = v217;
    unint64_t v213 = *((void *)v217 + 2);
    unint64_t v212 = *((void *)v217 + 3);
    if (v213 >= v212 >> 1) {
      long long v211 = sub_3F588((char *)(v212 > 1), v213 + 1, 1, v217);
    }
    *((void *)v211 + 2) = v213 + 1;
    long long v214 = &v211[16 * v213];
    *((void *)v214 + 4) = 0x7461626D6F57;
    *((void *)v214 + 5) = 0xE600000000000000;
  }
LABEL_326:
  sub_10C7C(&qword_124D40);
  sub_CBE6C();
  uint64_t v215 = sub_E7090();
  swift_bridgeObjectRelease();
  return v215;
}

uint64_t sub_C9E2C(int a1)
{
  if (a1)
  {
    uint64_t v2 = sub_3F588(0, 1, 1, (char *)_swiftEmptyArrayStorage);
    unint64_t v4 = *((void *)v2 + 2);
    unint64_t v3 = *((void *)v2 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v3 > 1), v4 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v4 + 1;
    uint64_t v5 = &v2[16 * v4];
    *((void *)v5 + 4) = 1346584897;
    *((void *)v5 + 5) = 0xE400000000000000;
  }
  else
  {
    uint64_t v2 = (char *)_swiftEmptyArrayStorage;
  }
  if ((a1 & 2) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    strcpy(v8 + 32, "Magic Paired");
    v8[45] = 0;
    *((_WORD *)v8 + 23) = -5120;
    if ((a1 & 4) == 0)
    {
LABEL_8:
      if ((a1 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_32;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_8;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v10 = *((void *)v2 + 2);
  unint64_t v9 = *((void *)v2 + 3);
  if (v10 >= v9 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v9 > 1), v10 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v10 + 1;
  unint64_t v11 = &v2[16 * v10];
  *((void *)v11 + 4) = 0x7541206572616853;
  *((void *)v11 + 5) = 0xEB000000006F6964;
  if ((a1 & 8) == 0)
  {
LABEL_9:
    if ((a1 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_32:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v13 = *((void *)v2 + 2);
  unint64_t v12 = *((void *)v2 + 3);
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v12 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 1;
  id v14 = &v2[16 * v13];
  *((void *)v14 + 4) = 0x6572617774666F53;
  *((void *)v14 + 5) = 0xEF656D756C6F5620;
  if ((a1 & 0x10) == 0)
  {
LABEL_10:
    if ((a1 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_37:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v16 = *((void *)v2 + 2);
  unint64_t v15 = *((void *)v2 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v15 > 1), v16 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v16 + 1;
  uint64_t v17 = &v2[16 * v16];
  *((void *)v17 + 4) = 1229998420;
  *((void *)v17 + 5) = 0xE400000000000000;
  if ((a1 & 0x20) == 0)
  {
LABEL_11:
    if ((a1 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_42:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v19 = *((void *)v2 + 2);
  unint64_t v18 = *((void *)v2 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v18 > 1), v19 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v19 + 1;
  uint64_t v20 = &v2[16 * v19];
  *((void *)v20 + 4) = 4543312;
  *((void *)v20 + 5) = 0xE300000000000000;
  if ((a1 & 0x40) == 0)
  {
LABEL_12:
    if ((a1 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_52;
  }
LABEL_47:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v22 = *((void *)v2 + 2);
  unint64_t v21 = *((void *)v2 + 3);
  if (v22 >= v21 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v21 > 1), v22 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v22 + 1;
  uint64_t v23 = &v2[16 * v22];
  *((void *)v23 + 4) = 0x774F206F69647541;
  *((void *)v23 + 5) = 0xEB0000000072656ELL;
  if ((a1 & 0x80) == 0)
  {
LABEL_13:
    if ((a1 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_52:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v25 = *((void *)v2 + 2);
  unint64_t v24 = *((void *)v2 + 3);
  if (v25 >= v24 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v24 > 1), v25 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v25 + 1;
  unint64_t v26 = &v2[16 * v25];
  strcpy(v26 + 32, "Same Account");
  v26[45] = 0;
  *((_WORD *)v26 + 23) = -5120;
  if ((a1 & 0x100) == 0)
  {
LABEL_14:
    if ((a1 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_57:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v28 = *((void *)v2 + 2);
  unint64_t v27 = *((void *)v2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v27 > 1), v28 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v28 + 1;
  uint64_t v29 = &v2[16 * v28];
  *((void *)v29 + 4) = 0x796C696D6146;
  *((void *)v29 + 5) = 0xE600000000000000;
  if ((a1 & 0x200) == 0)
  {
LABEL_15:
    if ((a1 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_67;
  }
LABEL_62:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v31 = *((void *)v2 + 2);
  unint64_t v30 = *((void *)v2 + 3);
  if (v31 >= v30 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v30 > 1), v31 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v31 + 1;
  uint64_t v32 = &v2[16 * v31];
  *((void *)v32 + 4) = 0x4820646572616853;
  *((void *)v32 + 5) = 0xEB00000000656D6FLL;
  if ((a1 & 0x400) == 0)
  {
LABEL_16:
    if ((a1 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_72;
  }
LABEL_67:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v34 = *((void *)v2 + 2);
  unint64_t v33 = *((void *)v2 + 3);
  if (v34 >= v33 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v33 > 1), v34 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v34 + 1;
  Swift::Int v35 = &v2[16 * v34];
  *((void *)v35 + 4) = 0x646E65697246;
  *((void *)v35 + 5) = 0xE600000000000000;
  if ((a1 & 0x800) == 0)
  {
LABEL_17:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_77;
  }
LABEL_72:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v37 = *((void *)v2 + 2);
  unint64_t v36 = *((void *)v2 + 3);
  if (v37 >= v36 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v36 > 1), v37 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v37 + 1;
  Swift::Int v38 = &v2[16 * v37];
  strcpy(v38 + 32, "System Paired");
  *((_WORD *)v38 + 23) = -4864;
  if ((a1 & 0x1000) == 0)
  {
LABEL_18:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_82;
  }
LABEL_77:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v40 = *((void *)v2 + 2);
  unint64_t v39 = *((void *)v2 + 3);
  if (v40 >= v39 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v39 > 1), v40 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v40 + 1;
  id v41 = &v2[16 * v40];
  *((void *)v41 + 4) = 0x6E6564646948;
  *((void *)v41 + 5) = 0xE600000000000000;
  if ((a1 & 0x2000) == 0)
  {
LABEL_19:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_87;
  }
LABEL_82:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v43 = *((void *)v2 + 2);
  unint64_t v42 = *((void *)v2 + 3);
  if (v43 >= v42 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v42 > 1), v43 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v43 + 1;
  uint64_t v44 = &v2[16 * v43];
  *((void *)v44 + 4) = 0x7269615020454C42;
  *((void *)v44 + 5) = 0xEA00000000006465;
  if ((a1 & 0x4000) == 0)
  {
LABEL_20:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_92;
  }
LABEL_87:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v46 = *((void *)v2 + 2);
  unint64_t v45 = *((void *)v2 + 3);
  if (v46 >= v45 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v45 > 1), v46 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v46 + 1;
  char v47 = &v2[16 * v46];
  strcpy(v47 + 32, "Classic Paired");
  v47[47] = -18;
  if ((a1 & 0x8000) != 0)
  {
LABEL_92:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v49 = *((void *)v2 + 2);
    unint64_t v48 = *((void *)v2 + 3);
    if (v49 >= v48 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v48 > 1), v49 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v49 + 1;
    uint64_t v50 = &v2[16 * v49];
    strcpy(v50 + 32, "Cloud Paired");
    v50[45] = 0;
    *((_WORD *)v50 + 23) = -5120;
  }
LABEL_97:
  if ((a1 & 0x10000) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v52 = *((void *)v2 + 2);
    unint64_t v51 = *((void *)v2 + 3);
    if (v52 >= v51 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v51 > 1), v52 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v52 + 1;
    uint64_t v53 = &v2[16 * v52];
    *((void *)v53 + 4) = 0xD000000000000011;
    *((void *)v53 + 5) = 0x80000000000F3B50;
    if ((a1 & 0x20000) == 0)
    {
LABEL_99:
      if ((a1 & 0x40000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_124;
    }
  }
  else if ((a1 & 0x20000) == 0)
  {
    goto LABEL_99;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v55 = *((void *)v2 + 2);
  unint64_t v54 = *((void *)v2 + 3);
  if (v55 >= v54 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v54 > 1), v55 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v55 + 1;
  uint64_t v56 = &v2[16 * v55];
  *((void *)v56 + 4) = 0xD000000000000010;
  *((void *)v56 + 5) = 0x80000000000F3B30;
  if ((a1 & 0x40000) == 0)
  {
LABEL_100:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_129;
  }
LABEL_124:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v58 = *((void *)v2 + 2);
  unint64_t v57 = *((void *)v2 + 3);
  if (v58 >= v57 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v57 > 1), v58 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v58 + 1;
  uint64_t v59 = &v2[16 * v58];
  strcpy(v59 + 32, "User Connected");
  v59[47] = -18;
  if ((a1 & 0x80000) == 0)
  {
LABEL_101:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_134;
  }
LABEL_129:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v61 = *((void *)v2 + 2);
  unint64_t v60 = *((void *)v2 + 3);
  if (v61 >= v60 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v60 > 1), v61 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v61 + 1;
  uint64_t v62 = &v2[16 * v61];
  *((void *)v62 + 4) = 0x6573754620766544;
  *((void *)v62 + 5) = 0xE900000000000064;
  if ((a1 & 0x100000) == 0)
  {
LABEL_102:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_139;
  }
LABEL_134:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v64 = *((void *)v2 + 2);
  unint64_t v63 = *((void *)v2 + 3);
  if (v64 >= v63 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v63 > 1), v64 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v64 + 1;
  uint64_t v65 = &v2[16 * v64];
  *((void *)v65 + 4) = 0xD000000000000012;
  *((void *)v65 + 5) = 0x80000000000F3B10;
  if ((a1 & 0x200000) == 0)
  {
LABEL_103:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_144;
  }
LABEL_139:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v67 = *((void *)v2 + 2);
  unint64_t v66 = *((void *)v2 + 3);
  if (v67 >= v66 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v66 > 1), v67 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v67 + 1;
  uint64_t v68 = &v2[16 * v67];
  *((void *)v68 + 4) = 0x6C6172746E6543;
  *((void *)v68 + 5) = 0xE700000000000000;
  if ((a1 & 0x400000) == 0)
  {
LABEL_104:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_149;
  }
LABEL_144:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v70 = *((void *)v2 + 2);
  unint64_t v69 = *((void *)v2 + 3);
  if (v70 >= v69 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v69 > 1), v70 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v70 + 1;
  uint64_t v71 = &v2[16 * v70];
  *((void *)v71 + 4) = 0x756F522072657355;
  *((void *)v71 + 5) = 0xEB00000000646574;
  if ((a1 & 0x800000) == 0)
  {
LABEL_105:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_154;
  }
LABEL_149:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v73 = *((void *)v2 + 2);
  unint64_t v72 = *((void *)v2 + 3);
  if (v73 >= v72 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v72 > 1), v73 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v73 + 1;
  uint64_t v74 = &v2[16 * v73];
  strcpy(v74 + 32, "Spatial Audio");
  *((_WORD *)v74 + 23) = -4864;
  if ((a1 & 0x1000000) == 0)
  {
LABEL_106:
    if ((a1 & 0x2000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_159;
  }
LABEL_154:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v76 = *((void *)v2 + 2);
  unint64_t v75 = *((void *)v2 + 3);
  if (v76 >= v75 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v75 > 1), v76 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v76 + 1;
  id v77 = &v2[16 * v76];
  *((void *)v77 + 4) = 0xD000000000000014;
  *((void *)v77 + 5) = 0x80000000000F3AF0;
  if ((a1 & 0x2000000) == 0)
  {
LABEL_107:
    if ((a1 & 0x4000000) == 0) {
      goto LABEL_108;
    }
    goto LABEL_164;
  }
LABEL_159:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v79 = *((void *)v2 + 2);
  unint64_t v78 = *((void *)v2 + 3);
  if (v79 >= v78 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v78 > 1), v79 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v79 + 1;
  id v80 = &v2[16 * v79];
  strcpy(v80 + 32, "Guest Paired");
  v80[45] = 0;
  *((_WORD *)v80 + 23) = -5120;
  if ((a1 & 0x4000000) == 0)
  {
LABEL_108:
    if ((a1 & 0x8000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_169;
  }
LABEL_164:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v82 = *((void *)v2 + 2);
  unint64_t v81 = *((void *)v2 + 3);
  if (v82 >= v81 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v81 > 1), v82 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v82 + 1;
  Swift::Int v83 = &v2[16 * v82];
  *((void *)v83 + 4) = 4410945;
  *((void *)v83 + 5) = 0xE300000000000000;
  if ((a1 & 0x8000000) == 0)
  {
LABEL_109:
    if ((a1 & 0x10000000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_174;
  }
LABEL_169:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v85 = *((void *)v2 + 2);
  unint64_t v84 = *((void *)v2 + 3);
  if (v85 >= v84 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v84 > 1), v85 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v85 + 1;
  long long v86 = &v2[16 * v85];
  strcpy(v86 + 32, "Transparency");
  v86[45] = 0;
  *((_WORD *)v86 + 23) = -5120;
  if ((a1 & 0x10000000) == 0)
  {
LABEL_110:
    if ((a1 & 0x20000000) == 0) {
      goto LABEL_111;
    }
    goto LABEL_179;
  }
LABEL_174:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v88 = *((void *)v2 + 2);
  unint64_t v87 = *((void *)v2 + 3);
  if (v88 >= v87 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v87 > 1), v88 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v88 + 1;
  char v89 = &v2[16 * v88];
  *((void *)v89 + 4) = 0xD000000000000015;
  *((void *)v89 + 5) = 0x80000000000F3AD0;
  if ((a1 & 0x20000000) == 0)
  {
LABEL_111:
    if ((a1 & 0x40000000) == 0) {
      goto LABEL_112;
    }
    goto LABEL_184;
  }
LABEL_179:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v91 = *((void *)v2 + 2);
  unint64_t v90 = *((void *)v2 + 3);
  if (v91 >= v90 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v90 > 1), v91 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v91 + 1;
  uint64_t v92 = &v2[16 * v91];
  *((void *)v92 + 4) = 0xD00000000000001CLL;
  *((void *)v92 + 5) = 0x80000000000F3AB0;
  if ((a1 & 0x40000000) == 0)
  {
LABEL_112:
    if ((a1 & 0x80000000) == 0) {
      goto LABEL_194;
    }
    goto LABEL_189;
  }
LABEL_184:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v94 = *((void *)v2 + 2);
  unint64_t v93 = *((void *)v2 + 3);
  if (v94 >= v93 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v93 > 1), v94 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v94 + 1;
  char v95 = &v2[16 * v94];
  *((void *)v95 + 4) = 0xD000000000000014;
  *((void *)v95 + 5) = 0x80000000000F3A90;
  if (a1 < 0)
  {
LABEL_189:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v97 = *((void *)v2 + 2);
    unint64_t v96 = *((void *)v2 + 3);
    if (v97 >= v96 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v96 > 1), v97 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v97 + 1;
    id v98 = &v2[16 * v97];
    *((void *)v98 + 4) = 0xD000000000000011;
    *((void *)v98 + 5) = 0x80000000000F3A70;
  }
LABEL_194:
  sub_10C7C(&qword_124D40);
  sub_CBE6C();
  uint64_t v99 = sub_E7090();
  swift_bridgeObjectRelease();
  return v99;
}

uint64_t sub_CAF6C(int a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = (char *)_swiftEmptyArrayStorage;
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_3F588(0, 1, 1, (char *)_swiftEmptyArrayStorage);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 5260872;
  *((void *)v5 + 5) = 0xE300000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x6F4220656E6F6850;
    *((void *)v8 + 5) = 0xEA00000000006B6FLL;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    unint64_t v11 = &v2[16 * v10];
    *((void *)v11 + 4) = 5460039;
    *((void *)v11 + 5) = 0xE300000000000000;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_33;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v13 = *((void *)v2 + 2);
  unint64_t v12 = *((void *)v2 + 3);
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v12 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 1;
  id v14 = &v2[16 * v13];
  *((void *)v14 + 4) = 0x5043525641;
  *((void *)v14 + 5) = 0xE500000000000000;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_33:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v16 = *((void *)v2 + 2);
  unint64_t v15 = *((void *)v2 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v15 > 1), v16 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v16 + 1;
  uint64_t v17 = &v2[16 * v16];
  *((void *)v17 + 4) = 1346646593;
  *((void *)v17 + 5) = 0xE400000000000000;
  if ((a1 & 0x20) == 0)
  {
LABEL_16:
    if ((a1 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_38:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v19 = *((void *)v2 + 2);
  unint64_t v18 = *((void *)v2 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v18 > 1), v19 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v19 + 1;
  uint64_t v20 = &v2[16 * v19];
  *((void *)v20 + 4) = 4475208;
  *((void *)v20 + 5) = 0xE300000000000000;
  if ((a1 & 0x40) == 0)
  {
LABEL_17:
    if ((a1 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_43:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v22 = *((void *)v2 + 2);
  unint64_t v21 = *((void *)v2 + 3);
  if (v22 >= v21 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v21 > 1), v22 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v22 + 1;
  uint64_t v23 = &v2[16 * v22];
  *((void *)v23 + 4) = 0x726F736E6553;
  *((void *)v23 + 5) = 0xE600000000000000;
  if ((a1 & 0x80) == 0)
  {
LABEL_18:
    if ((a1 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_48:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v25 = *((void *)v2 + 2);
  unint64_t v24 = *((void *)v2 + 3);
  if (v25 >= v24 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v24 > 1), v25 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v25 + 1;
  unint64_t v26 = &v2[16 * v25];
  strcpy(v26 + 32, "Wireless iAP");
  v26[45] = 0;
  *((_WORD *)v26 + 23) = -5120;
  if ((a1 & 0x100) == 0)
  {
LABEL_19:
    if ((a1 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_53:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v28 = *((void *)v2 + 2);
  unint64_t v27 = *((void *)v2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v27 > 1), v28 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v28 + 1;
  uint64_t v29 = &v2[16 * v28];
  *((void *)v29 + 4) = 0x726168532074654ELL;
  *((void *)v29 + 5) = 0xEB00000000676E69;
  if ((a1 & 0x200) == 0)
  {
LABEL_20:
    if ((a1 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }
LABEL_58:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v31 = *((void *)v2 + 2);
  unint64_t v30 = *((void *)v2 + 3);
  if (v31 >= v30 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v30 > 1), v31 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v31 + 1;
  uint64_t v32 = &v2[16 * v31];
  *((void *)v32 + 4) = 7364941;
  *((void *)v32 + 5) = 0xE300000000000000;
  if ((a1 & 0x400) == 0)
  {
LABEL_21:
    if ((a1 & 0x800) == 0) {
      goto LABEL_73;
    }
    goto LABEL_68;
  }
LABEL_63:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v34 = *((void *)v2 + 2);
  unint64_t v33 = *((void *)v2 + 3);
  if (v34 >= v33 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v33 > 1), v34 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v34 + 1;
  Swift::Int v35 = &v2[16 * v34];
  *((void *)v35 + 4) = 0x6F72687473736150;
  *((void *)v35 + 5) = 0xEB00000000686775;
  if ((a1 & 0x800) != 0)
  {
LABEL_68:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v37 = *((void *)v2 + 2);
    unint64_t v36 = *((void *)v2 + 3);
    if (v37 >= v36 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v36 > 1), v37 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v37 + 1;
    Swift::Int v38 = &v2[16 * v37];
    *((void *)v38 + 4) = 0x676E696D6147;
    *((void *)v38 + 5) = 0xE600000000000000;
  }
LABEL_73:
  if ((a1 & 0x1000) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v40 = *((void *)v2 + 2);
    unint64_t v39 = *((void *)v2 + 3);
    if (v40 >= v39 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v39 > 1), v40 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v40 + 1;
    id v41 = &v2[16 * v40];
    *((void *)v41 + 4) = 0xD000000000000010;
    *((void *)v41 + 5) = 0x80000000000F3BD0;
    if ((a1 & 0x2000) == 0)
    {
LABEL_75:
      if ((a1 & 0x4000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_97;
    }
  }
  else if ((a1 & 0x2000) == 0)
  {
    goto LABEL_75;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v43 = *((void *)v2 + 2);
  unint64_t v42 = *((void *)v2 + 3);
  if (v43 >= v42 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v42 > 1), v43 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v43 + 1;
  uint64_t v44 = &v2[16 * v43];
  *((void *)v44 + 4) = 0x656C6C69617242;
  *((void *)v44 + 5) = 0xE700000000000000;
  if ((a1 & 0x4000) == 0)
  {
LABEL_76:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_102;
  }
LABEL_97:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v46 = *((void *)v2 + 2);
  unint64_t v45 = *((void *)v2 + 3);
  if (v46 >= v45 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v45 > 1), v46 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v46 + 1;
  char v47 = &v2[16 * v46];
  *((void *)v47 + 4) = 0xD000000000000014;
  *((void *)v47 + 5) = 0x80000000000F3BB0;
  if ((a1 & 0x8000) == 0)
  {
LABEL_77:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_107;
  }
LABEL_102:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v49 = *((void *)v2 + 2);
  unint64_t v48 = *((void *)v2 + 3);
  if (v49 >= v48 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v48 > 1), v49 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v49 + 1;
  uint64_t v50 = &v2[16 * v49];
  strcpy(v50 + 32, "LE GATT Client");
  v50[47] = -18;
  if ((a1 & 0x10000) == 0)
  {
LABEL_78:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_112;
  }
LABEL_107:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v52 = *((void *)v2 + 2);
  unint64_t v51 = *((void *)v2 + 3);
  if (v52 >= v51 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v51 > 1), v52 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v52 + 1;
  uint64_t v53 = &v2[16 * v52];
  *((void *)v53 + 4) = 4277580;
  *((void *)v53 + 5) = 0xE300000000000000;
  if ((a1 & 0x20000) == 0)
  {
LABEL_79:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_117;
  }
LABEL_112:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v55 = *((void *)v2 + 2);
  unint64_t v54 = *((void *)v2 + 3);
  if (v55 >= v54 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v54 > 1), v55 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v55 + 1;
  uint64_t v56 = &v2[16 * v55];
  *((void *)v56 + 4) = 0xD000000000000011;
  *((void *)v56 + 5) = 0x80000000000F3B90;
  if ((a1 & 0x40000) == 0)
  {
LABEL_80:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_122;
  }
LABEL_117:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v58 = *((void *)v2 + 2);
  unint64_t v57 = *((void *)v2 + 3);
  if (v58 >= v57 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v57 > 1), v58 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v58 + 1;
  uint64_t v59 = &v2[16 * v58];
  *((void *)v59 + 4) = 0xD000000000000010;
  *((void *)v59 + 5) = 0x80000000000F3B70;
  if ((a1 & 0x80000) == 0)
  {
LABEL_81:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_127;
  }
LABEL_122:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v61 = *((void *)v2 + 2);
  unint64_t v60 = *((void *)v2 + 3);
  if (v61 >= v60 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v60 > 1), v61 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v61 + 1;
  uint64_t v62 = &v2[16 * v61];
  *((void *)v62 + 4) = 1346584897;
  *((void *)v62 + 5) = 0xE400000000000000;
  if ((a1 & 0x100000) == 0)
  {
LABEL_82:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_132;
  }
LABEL_127:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v64 = *((void *)v2 + 2);
  unint64_t v63 = *((void *)v2 + 3);
  if (v64 >= v63 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v63 > 1), v64 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v64 + 1;
  uint64_t v65 = &v2[16 * v64];
  *((void *)v65 + 4) = 1414807879;
  *((void *)v65 + 5) = 0xE400000000000000;
  if ((a1 & 0x200000) == 0)
  {
LABEL_83:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_137;
  }
LABEL_132:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v67 = *((void *)v2 + 2);
  unint64_t v66 = *((void *)v2 + 3);
  if (v67 >= v66 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v66 > 1), v67 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v67 + 1;
  uint64_t v68 = &v2[16 * v67];
  *((void *)v68 + 4) = 0x50206C6169726553;
  *((void *)v68 + 5) = 0xEB0000000074726FLL;
  if ((a1 & 0x400000) == 0)
  {
LABEL_84:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_142;
  }
LABEL_137:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v70 = *((void *)v2 + 2);
  unint64_t v69 = *((void *)v2 + 3);
  if (v70 >= v69 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v69 > 1), v70 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v70 + 1;
  uint64_t v71 = &v2[16 * v70];
  *((void *)v71 + 4) = 4541506;
  *((void *)v71 + 5) = 0xE300000000000000;
  if ((a1 & 0x800000) == 0)
  {
LABEL_85:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_157;
    }
    goto LABEL_147;
  }
LABEL_142:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v73 = *((void *)v2 + 2);
  unint64_t v72 = *((void *)v2 + 3);
  if (v73 >= v72 >> 1) {
    uint64_t v2 = sub_3F588((char *)(v72 > 1), v73 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v73 + 1;
  uint64_t v74 = &v2[16 * v73];
  *((void *)v74 + 4) = 4997953;
  *((void *)v74 + 5) = 0xE300000000000000;
  if ((a1 & 0x1000000) != 0)
  {
LABEL_147:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v76 = *((void *)v2 + 2);
    unint64_t v75 = *((void *)v2 + 3);
    if (v76 >= v75 >> 1) {
      uint64_t v2 = sub_3F588((char *)(v75 > 1), v76 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v76 + 1;
    id v77 = &v2[16 * v76];
    *((void *)v77 + 4) = 5194579;
    *((void *)v77 + 5) = 0xE300000000000000;
    if (a1 == -1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_3F588(0, *((void *)v2 + 2) + 1, 1, v2);
      }
      unint64_t v79 = *((void *)v2 + 2);
      unint64_t v78 = *((void *)v2 + 3);
      if (v79 >= v78 >> 1) {
        uint64_t v2 = sub_3F588((char *)(v78 > 1), v79 + 1, 1, v2);
      }
      *((void *)v2 + 2) = v79 + 1;
      id v80 = &v2[16 * v79];
      *((void *)v80 + 4) = 7105601;
      *((void *)v80 + 5) = 0xE300000000000000;
    }
  }
LABEL_157:
  sub_10C7C(&qword_124D40);
  sub_CBE6C();
  uint64_t v81 = sub_E7090();
  swift_bridgeObjectRelease();
  return v81;
}

uint64_t sub_CBD10()
{
  return 4294956991;
}

uint64_t sub_CBD18()
{
  return 0x6E776F6E6B6E75;
}

char *sub_CBE20()
{
  uint64_t v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  void *v0 = v1;
  if (!result)
  {
    uint64_t result = sub_3F588(result, *((void *)v1 + 2) + 1, 1, v1);
    void *v0 = result;
  }
  return result;
}

unint64_t sub_CBE6C()
{
  unint64_t result = qword_125620;
  if (!qword_125620)
  {
    sub_11B60(&qword_124D40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125620);
  }
  return result;
}

uint64_t sub_CBECC()
{
  return swift_getKeyPath();
}

uint64_t sub_CBEF0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_E6450();
  *a1 = v3;
  return result;
}

uint64_t sub_CBF1C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v59 = a2;
  uint64_t v58 = a1;
  uint64_t v60 = a3;
  uint64_t v3 = sub_10C7C(&qword_125218);
  __chkstk_darwin(v3 - 8);
  unint64_t v57 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_E6870();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  __chkstk_darwin(v5);
  unint64_t v54 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10C7C(&qword_123BE8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  unint64_t v10 = (uint64_t *)((char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_E6C80();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10C7C(&qword_125628);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  unint64_t v49 = (uint64_t *)((char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = sub_10C7C(&qword_125630) - 8;
  __chkstk_darwin(v53);
  unint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10C7C(&qword_125638) - 8;
  __chkstk_darwin(v52);
  unint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10C7C(&qword_125640) - 8;
  __chkstk_darwin(v51);
  uint64_t v50 = (uint64_t)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_E6C30();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Image.Scale.small(_:), v11);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)v10 + *(int *)(v8 + 36), v14, v11);
  *unint64_t v10 = KeyPath;
  unint64_t v25 = v49;
  sub_CC768((uint64_t)v10, (uint64_t)v49 + *(int *)(v16 + 44), &qword_123BE8);
  *unint64_t v25 = v23;
  swift_retain();
  sub_CC7CC((uint64_t)v10, &qword_123BE8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();
  unint64_t v27 = v54;
  uint64_t v26 = v55;
  uint64_t v28 = v56;
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v54, enum case for Font.TextStyle.body(_:), v56);
  uint64_t v29 = sub_E67D0();
  unint64_t v30 = v57;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v57, 1, 1, v29);
  sub_E6800();
  uint64_t v31 = (uint64_t)v30;
  uint64_t v32 = sub_E6820();
  sub_CC7CC(v31, &qword_125218);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  uint64_t v33 = swift_getKeyPath();
  sub_CC768((uint64_t)v25, (uint64_t)v19, &qword_125628);
  unint64_t v34 = (uint64_t *)&v19[*(int *)(v53 + 44)];
  uint64_t *v34 = v33;
  v34[1] = v32;
  sub_CC7CC((uint64_t)v25, &qword_125628);
  LODWORD(v32) = sub_E6710();
  sub_CC768((uint64_t)v19, (uint64_t)v21, &qword_125630);
  *(_DWORD *)&v21[*(int *)(v52 + 44)] = v32;
  sub_CC7CC((uint64_t)v19, &qword_125630);
  uint64_t v35 = v50;
  sub_CC768((uint64_t)v21, v50, &qword_125638);
  *(unsigned char *)(v35 + *(int *)(v51 + 44)) = 1;
  uint64_t v36 = v35;
  sub_CC7CC((uint64_t)v21, &qword_125638);
  LOBYTE(v35) = sub_E6780();
  LOBYTE(v32) = v59 & 1;
  uint64_t v37 = v58;
  sub_7737C(v58, v59 & 1);
  sub_CC588(v37, v32);
  sub_773E4(v37, v32);
  sub_E6210();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v46 = v60;
  sub_CC768(v36, v60, &qword_125640);
  uint64_t v47 = v46 + *(int *)(sub_10C7C(&qword_125648) + 36);
  *(unsigned char *)uint64_t v47 = v35;
  *(void *)(v47 + 8) = v39;
  *(void *)(v47 + 16) = v41;
  *(void *)(v47 + 24) = v43;
  *(void *)(v47 + 32) = v45;
  *(unsigned char *)(v47 + 40) = 0;
  return sub_CC7CC(v36, &qword_125640);
}

uint64_t sub_CC534()
{
  return swift_getKeyPath();
}

uint64_t sub_CC560()
{
  return sub_E69D0();
}

uint64_t sub_CC57C@<X0>(uint64_t a1@<X8>)
{
  return sub_CBF1C(*(void *)v1, *(unsigned __int8 *)(v1 + 8), a1);
}

double sub_CC588(uint64_t a1, char a2)
{
  uint64_t v4 = sub_E6530();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_E7310();
  uint64_t v9 = sub_E6740();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_23A0C(0x74616F6C464743, 0xE700000000000000, &v13);
    _os_log_impl(&dword_0, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_E6520();
  swift_getAtKeyPath();
  sub_773E4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return *(double *)&v13;
}

uint64_t sub_CC768(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_CC7CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_CC828()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for Chevron(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_7737C(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for Chevron(uint64_t a1)
{
  return sub_773E4(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for Chevron(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_7737C(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_773E4(v5, v6);
  return a1;
}

uint64_t initializeWithTake for Chevron(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for Chevron(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_773E4(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Chevron(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Chevron(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Chevron()
{
  return &type metadata for Chevron;
}

unint64_t sub_CC9E4()
{
  unint64_t result = qword_125650;
  if (!qword_125650)
  {
    sub_11B60(&qword_125648);
    sub_CCA60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125650);
  }
  return result;
}

unint64_t sub_CCA60()
{
  unint64_t result = qword_125658;
  if (!qword_125658)
  {
    sub_11B60(&qword_125640);
    sub_CCADC();
    sub_CCD00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125658);
  }
  return result;
}

unint64_t sub_CCADC()
{
  unint64_t result = qword_125660;
  if (!qword_125660)
  {
    sub_11B60(&qword_125638);
    sub_CCB7C();
    sub_CCCBC(&qword_123478, &qword_123480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125660);
  }
  return result;
}

unint64_t sub_CCB7C()
{
  unint64_t result = qword_125668;
  if (!qword_125668)
  {
    sub_11B60(&qword_125630);
    sub_CCC1C();
    sub_CCCBC(&qword_125678, &qword_125680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125668);
  }
  return result;
}

unint64_t sub_CCC1C()
{
  unint64_t result = qword_125670;
  if (!qword_125670)
  {
    sub_11B60(&qword_125628);
    sub_CCCBC(&qword_123BE0, &qword_123BE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125670);
  }
  return result;
}

uint64_t sub_CCCBC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_CCD00()
{
  unint64_t result = qword_125688;
  if (!qword_125688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125688);
  }
  return result;
}

void sub_CCD5C()
{
  qword_12AA68 = 0x404C000000000000;
}

void sub_CCD6C()
{
  qword_12AA78 = 0x4057000000000000;
}

void sub_CCD7C()
{
  qword_12AA88 = 0x404C000000000000;
}

void sub_CCD8C()
{
  qword_12AA98 = 0x4034000000000000;
}

void sub_CCD9C()
{
  qword_12AAA8 = 0x4045000000000000;
}

void sub_CCDAC()
{
  static ActivitySource.allSymbolImagenames = (uint64_t)&off_117A68;
}

uint64_t *ActivitySource.allSymbolImagenames.unsafeMutableAddressor()
{
  if (qword_12AAB0 != -1) {
    swift_once();
  }
  return &static ActivitySource.allSymbolImagenames;
}

uint64_t static ActivitySource.allSymbolImagenames.getter()
{
  if (qword_12AAB0 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_CCE6C()
{
  return 0;
}

uint64_t sub_CCE78(uint64_t a1)
{
  return a1;
}

uint64_t sub_CCEAC(char a1)
{
  return a1 & 1;
}

uint64_t sub_CCEB4(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*sub_CCEBC())()
{
  return nullsub_63;
}

uint64_t sub_CCEE0(char a1)
{
  return a1 & 1;
}

uint64_t static MacParity.Pantheon.getter()
{
  return 1;
}

uint64_t variable initialization expression of ActivityEditView._colorScheme@<X0>(uint64_t *a1@<X8>)
{
  return sub_D4324(&qword_1230B8, a1);
}

BOOL static ActivityEditView.Use.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void ActivityEditView.Use.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int ActivityEditView.Use.hashValue.getter(char a1)
{
  return sub_E76A0();
}

BOOL sub_CCF88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_CCFA0()
{
  Swift::UInt v1 = *v0;
  sub_E7670();
  sub_E7680(v1);
  return sub_E76A0();
}

void sub_CCFE8()
{
  sub_E7680(*v0);
}

Swift::Int sub_CD014()
{
  Swift::UInt v1 = *v0;
  sub_E7670();
  sub_E7680(v1);
  return sub_E76A0();
}

uint64_t sub_CD058()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 20));
}

uint64_t type metadata accessor for ActivityEditView(uint64_t a1)
{
  return sub_D520C(a1, (uint64_t *)&unk_12AD70);
}

uint64_t sub_CD09C(char a1)
{
  char v2 = a1 & 1;
  uint64_t result = type metadata accessor for ActivityEditView(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t (*sub_CD0CC())()
{
  return nullsub_65;
}

uint64_t sub_CD118()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return v1;
}

uint64_t sub_CD178()
{
  return sub_E6DF0();
}

uint64_t (*sub_CD1EC(void *a1))()
{
  unsigned int v3 = malloc(0x68uLL);
  *a1 = v3;
  int v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityEditView(0) + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  unsigned char v3[8] = *v4;
  v3[9] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[10] = v7;
  v3[11] = v8;
  void *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[12] = sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return sub_CD2A4;
}

uint64_t sub_CD2A8()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6E10();
  return v1;
}

uint64_t sub_CD30C()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return v1;
}

uint64_t sub_CD36C()
{
  return sub_E6DF0();
}

uint64_t (*sub_CD3E0(void *a1))()
{
  unsigned int v3 = malloc(0x68uLL);
  *a1 = v3;
  int v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityEditView(0) + 28));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  unsigned char v3[8] = *v4;
  v3[9] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[10] = v7;
  v3[11] = v8;
  void *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[12] = sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return sub_CD498;
}

uint64_t sub_CD49C()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6E10();
  return v1;
}

uint64_t sub_CD500()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return v1;
}

uint64_t sub_CD560()
{
  return sub_E6DF0();
}

uint64_t (*sub_CD5D4(void *a1))()
{
  unsigned int v3 = malloc(0x68uLL);
  *a1 = v3;
  int v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ActivityEditView(0) + 32));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  unsigned char v3[8] = *v4;
  v3[9] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[10] = v7;
  v3[11] = v8;
  void *v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[12] = sub_10C7C(&qword_122A98);
  sub_E6DE0();
  return sub_CD68C;
}

void sub_CD690(uint64_t a1, char a2)
{
  char v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 48) = *(void *)(*(void *)a1 + 32);
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[11];
  uint64_t v6 = v2[9];
  uint64_t v5 = v2[10];
  void *v2 = v2[8];
  v2[1] = v6;
  v2[2] = v5;
  v2[3] = v4;
  v2[7] = v3;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_E6DF0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_E6DF0();
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();

  free(v2);
}

uint64_t sub_CD758()
{
  type metadata accessor for ActivityEditView(0);
  sub_10C7C(&qword_122A98);
  sub_E6E10();
  return v1;
}

uint64_t property wrapper backing initializer of ActivityEditView.internalTextName()
{
  sub_10C7C(&qword_123F18);
  sub_E6D10();
  return v1;
}

uint64_t variable initialization expression of ActivityEditView._internalTextName()
{
  return 0;
}

uint64_t sub_CD80C()
{
  type metadata accessor for ActivityEditView(0);

  return swift_bridgeObjectRetain();
}

uint64_t sub_CD840(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ActivityEditView(0) + 40);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_CD880())()
{
  return nullsub_66;
}

uint64_t sub_CD8CC()
{
  type metadata accessor for ActivityEditView(0);

  return swift_bridgeObjectRetain();
}

uint64_t sub_CD900(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for ActivityEditView(0) + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_CD940())()
{
  return nullsub_67;
}

uint64_t sub_CD98C()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 48));
  swift_retain();
  return v1;
}

uint64_t sub_CD9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityEditView(0) + 48));
  uint64_t result = swift_release();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_CDA14())()
{
  return nullsub_68;
}

uint64_t sub_CDA60()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 52));
  swift_retain();
  return v1;
}

uint64_t sub_CDAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActivityEditView(0) + 52));
  uint64_t result = swift_release();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_CDAE8())()
{
  return nullsub_69;
}

uint64_t variable initialization expression of ActivityEditView._presentationMode@<X0>(uint64_t *a1@<X8>)
{
  return sub_D4324(&qword_123F10, a1);
}

double ActivityEditView.init(use:textName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:onCommit:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, unint64_t a11, unint64_t a12, unint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(void *)&double result = ActivityEditView.init(use:textName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(a1 & 1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (__n128)__PAIR128__(a12, a11), a13, a14, a15, a16, (uint64_t)sub_CDBA0, 0, a17, a18).n128_u64[0];
  return result;
}

uint64_t sub_CDBA0()
{
  return 0;
}

__n128 ActivityEditView.init(use:textName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, __n128 a11, unint64_t a12, unint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  char v20 = a1 & 1;
  *a9 = swift_getKeyPath();
  sub_10C7C(&qword_1230B8);
  swift_storeEnumTagMultiPayload();
  unint64_t v21 = (int *)type metadata accessor for ActivityEditView(0);
  uint64_t v22 = (char *)a9 + v21[9];
  sub_10C7C(&qword_123F18);
  sub_E6D10();
  *(_OWORD *)uint64_t v22 = v37;
  *((void *)v22 + 2) = v38;
  uint64_t v23 = (uint64_t *)((char *)a9 + v21[14]);
  *uint64_t v23 = swift_getKeyPath();
  sub_10C7C(&qword_123F10);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a9 + v21[5]) = v20;
  *(uint64_t *)((char *)a9 + v21[10]) = a14;
  *(uint64_t *)((char *)a9 + v21[11]) = a15;
  unint64_t v24 = (uint64_t *)((char *)a9 + v21[12]);
  *unint64_t v24 = a18;
  v24[1] = a19;
  unint64_t v25 = (uint64_t *)((char *)a9 + v21[13]);
  *unint64_t v25 = a16;
  v25[1] = a17;
  uint64_t v26 = (uint64_t *)((char *)a9 + v21[6]);
  *uint64_t v26 = a2;
  v26[1] = a3;
  v26[2] = a4;
  v26[3] = a5;
  unint64_t v27 = (uint64_t *)((char *)a9 + v21[7]);
  *unint64_t v27 = a6;
  v27[1] = a7;
  v27[2] = a8;
  v27[3] = a10;
  uint64_t v28 = (__n128 *)((char *)a9 + v21[8]);
  __n128 result = a11;
  *uint64_t v28 = a11;
  v28[1].n128_u64[0] = a12;
  v28[1].n128_u64[1] = a13;
  *((unsigned char *)a9 + v21[15]) = 0;
  return result;
}

uint64_t ActivityEditView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_CDD70(v1, a1);
}

uint64_t sub_CDD70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10C7C(&qword_125850);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10C7C(&qword_125858);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10C7C(&qword_125860);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ActivityEditView(0);
  if (*(unsigned char *)(a1 + *(int *)(v14 + 20)))
  {
    sub_CE0BC((uint64_t)v6);
    sub_DA29C((uint64_t)v6, (uint64_t)v9, &qword_125850);
    swift_storeEnumTagMultiPayload();
    sub_D9E28(&qword_125868, &qword_125860);
    sub_D9E28(&qword_125870, &qword_125850);
    sub_E6610();
    return sub_DA1DC((uint64_t)v6, &qword_125850);
  }
  else
  {
    v16[1] = a2;
    __chkstk_darwin(v14);
    v16[-2] = a1;
    sub_E6750();
    sub_D9E28(&qword_125870, &qword_125850);
    sub_E6230();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_D9E28(&qword_125868, &qword_125860);
    sub_E6610();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_CE0BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v152 = a1;
  uint64_t v158 = sub_10C7C(&qword_125878);
  __chkstk_darwin(v158);
  uint64_t v159 = (uint64_t)&v122 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_E63B0();
  __chkstk_darwin(v143);
  unint64_t v144 = (char *)&v122 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10C7C(&qword_125880);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  unint64_t v128 = (uint64_t *)((char *)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v127 = (uint64_t)&v122 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v131 = (unint64_t)&v122 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v126 = (uint64_t *)((char *)&v122 - v13);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v125 = (uint64_t)&v122 - v15;
  __chkstk_darwin(v14);
  uint64_t v129 = (uint64_t)&v122 - v16;
  uint64_t v160 = sub_10C7C(&qword_125888);
  uint64_t v17 = __chkstk_darwin(v160);
  uint64_t v124 = (uint64_t)&v122 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v130 = (uint64_t *)((char *)&v122 - v20);
  __chkstk_darwin(v19);
  uint64_t v123 = (uint64_t)&v122 - v21;
  uint64_t v22 = sub_10C7C(&qword_125890);
  uint64_t v135 = *(void *)(v22 - 8);
  uint64_t v136 = v22;
  __chkstk_darwin(v22);
  unint64_t v133 = (char *)&v122 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_10C7C(&qword_125898);
  __chkstk_darwin(v132);
  long long v138 = (char *)&v122 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_10C7C(&qword_1258A0);
  __chkstk_darwin(v134);
  unint64_t v140 = (char *)&v122 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_10C7C(&qword_1258A8);
  __chkstk_darwin(v137);
  uint64_t v141 = (uint64_t)&v122 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_10C7C(&qword_1258B0);
  uint64_t v27 = __chkstk_darwin(v145);
  uint64_t v139 = (uint64_t)&v122 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v142 = (uint64_t)&v122 - v29;
  uint64_t v30 = sub_10C7C(&qword_1258B8);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v157 = (uint64_t)&v122 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  unint64_t v156 = (char *)&v122 - v33;
  uint64_t v34 = sub_10C7C(&qword_125838);
  __chkstk_darwin(v34 - 8);
  uint64_t v36 = (char *)&v122 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10C7C(&qword_1258C0);
  uint64_t v38 = v37 - 8;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v41 = (char *)&v122 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v122 - v42;
  uint64_t v161 = sub_E6F30();
  uint64_t v155 = v44;
  sub_CFE60(v2, (uint64_t)v201);
  long long v213 = v201[8];
  long long v214 = v201[9];
  uint64_t v215 = v202;
  long long v209 = v201[4];
  long long v210 = v201[5];
  long long v212 = v201[7];
  long long v211 = v201[6];
  long long v205 = v201[0];
  long long v206 = v201[1];
  long long v208 = v201[3];
  long long v207 = v201[2];
  int v153 = sub_E6770();
  char v203 = 1;
  *(void *)uint64_t v36 = sub_E65D0();
  *((void *)v36 + 1) = 0;
  v36[16] = 1;
  uint64_t v45 = sub_10C7C(&qword_1258C8);
  sub_D0334((uint64_t)&v36[*(int *)(v45 + 44)]);
  char v46 = sub_E6760();
  sub_DA29C((uint64_t)v36, (uint64_t)v41, &qword_125838);
  uint64_t v47 = &v41[*(int *)(v38 + 44)];
  *uint64_t v47 = v46;
  *(_OWORD *)(v47 + 8) = 0u;
  *(_OWORD *)(v47 + 24) = 0u;
  v47[40] = 1;
  sub_DA1DC((uint64_t)v36, &qword_125838);
  unint64_t v154 = v43;
  sub_DA238((uint64_t)v41, (uint64_t)v43, &qword_1258C0);
  sub_E6F30();
  uint64_t v48 = 0x4024000000000000;
  sub_E62A0();
  uint64_t v151 = v195;
  int v150 = v196;
  uint64_t v149 = v197;
  int v148 = v198;
  uint64_t v146 = v200;
  uint64_t v147 = v199;
  uint64_t v49 = type metadata accessor for ActivityEditView(0);
  char v50 = *(unsigned char *)(v2 + *(int *)(v49 + 20));
  if (!*(unsigned char *)(v2 + *(int *)(v49 + 60))) {
    uint64_t v48 = 0;
  }
  uint64_t v51 = sub_E65D0();
  if (v50)
  {
    uint64_t v52 = v128;
    *unint64_t v128 = v51;
    v52[1] = v48;
    *((unsigned char *)v52 + 16) = 0;
    uint64_t v53 = sub_10C7C(&qword_1258D0);
    sub_D1938(v2, (uint64_t)v52 + *(int *)(v53 + 44));
    uint64_t v54 = (uint64_t)v52;
    uint64_t v55 = v127;
    sub_DA238(v54, v127, &qword_125880);
    uint64_t v56 = v55;
    uint64_t v57 = v131;
    sub_DA238(v56, v131, &qword_125880);
    char v58 = sub_E6760();
    uint64_t v59 = v124;
    sub_DA29C(v57, v124, &qword_125880);
    uint64_t v60 = v59 + *(int *)(v160 + 36);
    *(unsigned char *)uint64_t v60 = v58;
    *(_OWORD *)(v60 + 8) = 0u;
    *(_OWORD *)(v60 + 24) = 0u;
    *(unsigned char *)(v60 + 40) = 1;
    sub_DA1DC(v57, &qword_125880);
    unint64_t v61 = &qword_125888;
    uint64_t v62 = (uint64_t)v130;
    sub_DA238(v59, (uint64_t)v130, &qword_125888);
    sub_DA29C(v62, v159, &qword_125888);
    swift_storeEnumTagMultiPayload();
    sub_D8628(&qword_1258D8, &qword_1258B0, (void (*)(void))sub_D8600);
    sub_D88A0();
    uint64_t v63 = (uint64_t)v156;
    sub_E6610();
    uint64_t v64 = v62;
  }
  else
  {
    uint64_t v65 = (uint64_t)v126;
    uint64_t *v126 = v51;
    *(void *)(v65 + 8) = v48;
    *(unsigned char *)(v65 + 16) = 0;
    uint64_t v66 = sub_10C7C(&qword_1258D0);
    sub_D1938(v2, v65 + *(int *)(v66 + 44));
    uint64_t v67 = v125;
    sub_DA238(v65, v125, &qword_125880);
    uint64_t v68 = v129;
    sub_DA238(v67, v129, &qword_125880);
    LOBYTE(v65) = sub_E6770();
    uint64_t v69 = v123;
    sub_DA29C(v68, v123, &qword_125880);
    uint64_t v70 = v69 + *(int *)(v160 + 36);
    *(unsigned char *)uint64_t v70 = v65;
    *(_OWORD *)(v70 + 8) = 0u;
    *(_OWORD *)(v70 + 24) = 0u;
    *(unsigned char *)(v70 + 40) = 1;
    uint64_t v71 = sub_DA1DC(v68, &qword_125880);
    uint64_t v130 = &v122;
    __chkstk_darwin(v71);
    *(&v122 - 2) = v2;
    sub_10C7C(&qword_1258F8);
    unint64_t v131 = sub_D88A0();
    uint64_t v72 = sub_11B60(&qword_125910);
    uint64_t v73 = sub_D9E28(&qword_125918, &qword_125910);
    uint64_t v177 = v72;
    uint64_t v178 = v73;
    swift_getOpaqueTypeConformance2();
    uint64_t v74 = v133;
    sub_E6A70();
    sub_DA1DC(v69, &qword_125888);
    uint64_t v75 = sub_CFC4C();
    char v76 = sub_E6770();
    uint64_t v78 = v135;
    uint64_t v77 = v136;
    uint64_t v79 = (uint64_t)v138;
    (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v138, v74, v136);
    uint64_t v80 = v79 + *(int *)(v132 + 36);
    *(void *)uint64_t v80 = v75;
    *(unsigned char *)(v80 + 8) = v76;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v74, v77);
    uint64_t v81 = v144;
    unint64_t v82 = &v144[*(int *)(v143 + 20)];
    uint64_t v83 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v84 = sub_E65A0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v84 - 8) + 104))(v82, v83, v84);
    __asm { FMOV            V0.2D, #12.0 }
    _OWORD *v81 = _Q0;
    uint64_t v90 = (uint64_t)v140;
    uint64_t v91 = (uint64_t)&v140[*(int *)(v134 + 36)];
    sub_D8AA0((uint64_t)v81, v91, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v91 + *(int *)(sub_10C7C(&qword_125938) + 36)) = 256;
    sub_DA29C(v79, v90, &qword_125898);
    sub_D8B08((uint64_t)v81, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    sub_DA1DC(v79, &qword_125898);
    LOBYTE(v91) = sub_E6760();
    uint64_t v92 = v141;
    sub_DA29C(v90, v141, &qword_1258A0);
    uint64_t v93 = v92 + *(int *)(v137 + 36);
    *(unsigned char *)uint64_t v93 = v91;
    *(_OWORD *)(v93 + 8) = 0u;
    *(_OWORD *)(v93 + 24) = 0u;
    *(unsigned char *)(v93 + 40) = 1;
    sub_DA1DC(v90, &qword_1258A0);
    LOBYTE(v91) = sub_E6790();
    sub_E6210();
    uint64_t v95 = v94;
    uint64_t v97 = v96;
    uint64_t v99 = v98;
    uint64_t v101 = v100;
    uint64_t v102 = v139;
    sub_DA29C(v92, v139, &qword_1258A8);
    uint64_t v103 = v102 + *(int *)(v145 + 36);
    *(unsigned char *)uint64_t v103 = v91;
    *(void *)(v103 + 8) = v95;
    *(void *)(v103 + 16) = v97;
    *(void *)(v103 + 24) = v99;
    *(void *)(v103 + 32) = v101;
    *(unsigned char *)(v103 + 40) = 0;
    sub_DA1DC(v92, &qword_1258A8);
    unint64_t v61 = &qword_1258B0;
    uint64_t v104 = v142;
    sub_DA238(v102, v142, &qword_1258B0);
    sub_DA29C(v104, v159, &qword_1258B0);
    swift_storeEnumTagMultiPayload();
    sub_D8628(&qword_1258D8, &qword_1258B0, (void (*)(void))sub_D8600);
    uint64_t v63 = (uint64_t)v156;
    sub_E6610();
    uint64_t v64 = v104;
  }
  sub_DA1DC(v64, v61);
  char v105 = v203;
  uint64_t v106 = (uint64_t)v154;
  sub_DA29C((uint64_t)v154, (uint64_t)v41, &qword_1258C0);
  uint64_t v107 = v157;
  sub_DA29C(v63, v157, &qword_1258B8);
  uint64_t v108 = v155;
  *(void *)&long long v162 = v161;
  *((void *)&v162 + 1) = v155;
  long long v171 = v213;
  long long v172 = v214;
  *(void *)&long long v173 = v215;
  long long v167 = v209;
  long long v168 = v210;
  long long v169 = v211;
  long long v170 = v212;
  long long v163 = v205;
  long long v164 = v206;
  long long v165 = v207;
  long long v166 = v208;
  char v109 = v153;
  BYTE8(v173) = v153;
  *(_DWORD *)((char *)&v173 + 9) = *(_DWORD *)v204;
  HIDWORD(v173) = *(_DWORD *)&v204[3];
  long long v174 = 0u;
  long long v175 = 0u;
  char v176 = v105;
  unint64_t v110 = (_OWORD *)v152;
  *(unsigned char *)(v152 + 224) = v105;
  long long v111 = v171;
  v110[8] = v170;
  v110[9] = v111;
  long long v112 = v167;
  v110[4] = v166;
  v110[5] = v112;
  long long v113 = v169;
  v110[6] = v168;
  unsigned char v110[7] = v113;
  long long v114 = v163;
  *unint64_t v110 = v162;
  v110[1] = v114;
  long long v115 = v165;
  v110[2] = v164;
  v110[3] = v115;
  long long v116 = v175;
  v110[12] = v174;
  v110[13] = v116;
  long long v117 = v173;
  v110[10] = v172;
  v110[11] = v117;
  char v118 = (int *)sub_10C7C(&qword_125940);
  sub_DA29C((uint64_t)v41, (uint64_t)v110 + v118[12], &qword_1258C0);
  unint64_t v119 = (char *)v110 + v118[16];
  *(void *)unint64_t v119 = 0;
  v119[8] = 1;
  *((void *)v119 + 2) = v151;
  v119[24] = v150;
  *((void *)v119 + 4) = v149;
  v119[40] = v148;
  uint64_t v120 = v146;
  *((void *)v119 + 6) = v147;
  *((void *)v119 + 7) = v120;
  sub_DA29C(v107, (uint64_t)v110 + v118[20], &qword_1258B8);
  sub_D8940((uint64_t)&v162);
  sub_D8994((uint64_t)v201);
  sub_DA1DC(v63, &qword_1258B8);
  sub_DA1DC(v106, &qword_1258C0);
  sub_D89E8((uint64_t)v201);
  sub_DA1DC(v107, &qword_1258B8);
  sub_DA1DC((uint64_t)v41, &qword_1258C0);
  uint64_t v177 = v161;
  uint64_t v178 = v108;
  long long v187 = v213;
  long long v188 = v214;
  uint64_t v189 = v215;
  long long v183 = v209;
  long long v184 = v210;
  long long v185 = v211;
  long long v186 = v212;
  long long v179 = v205;
  long long v180 = v206;
  long long v181 = v207;
  long long v182 = v208;
  char v190 = v109;
  *(_DWORD *)id v191 = *(_DWORD *)v204;
  *(_DWORD *)&v191[3] = *(_DWORD *)&v204[3];
  long long v192 = 0u;
  long long v193 = 0u;
  char v194 = v105;
  return sub_D8A40((uint64_t)&v177);
}

uint64_t sub_CEF78(uint64_t a1)
{
  uint64_t v2 = sub_E6680();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_10C7C(&qword_125910);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_E6670();
  uint64_t v9 = a1;
  sub_10C7C(&qword_122D28);
  sub_2E128();
  sub_E6290();
  sub_D9E28(&qword_125918, &qword_125910);
  sub_E6700();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_CF11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_E5E90();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v33 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for ActivityEditView(0);
  uint64_t v5 = *(void *)(v36 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v36);
  uint64_t v8 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v38 = sub_10C7C(&qword_122B88);
  uint64_t v11 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10C7C(&qword_122D28);
  __chkstk_darwin(v37);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v40 = 1162760004;
  *((void *)&v40 + 1) = 0xE400000000000000;
  sub_D8AA0(a1, (uint64_t)v10, type metadata accessor for ActivityEditView);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  sub_D8B74((uint64_t)v10, v17 + v16);
  sub_187B0();
  sub_E6DA0();
  LOBYTE(v5) = sub_D3CD4();
  sub_D8AA0(a1, (uint64_t)v8, type metadata accessor for ActivityEditView);
  if (v5)
  {
    char v18 = 1;
  }
  else
  {
    uint64_t v19 = v36;
    uint64_t v20 = &v8[*(int *)(v36 + 36)];
    uint64_t v21 = *((void *)v20 + 2);
    long long v40 = *(_OWORD *)v20;
    uint64_t v41 = v21;
    sub_10C7C(&qword_124118);
    sub_E6D20();
    if (*((void *)&v42 + 1))
    {
      uint64_t v22 = *(void *)&v8[*(int *)(v19 + 44)];
      long long v40 = v42;
      uint64_t v23 = v33;
      sub_E5E80();
      uint64_t v24 = sub_E73E0();
      uint64_t v26 = v25;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v23, v35);
      swift_bridgeObjectRelease();
      char v18 = sub_D3A24(v24, v26, v22);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v18 = 0;
    }
  }
  sub_D8B08((uint64_t)v8, type metadata accessor for ActivityEditView);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = v18 & 1;
  uint64_t v29 = v38;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v38);
  uint64_t v30 = (uint64_t *)&v15[*(int *)(v37 + 36)];
  *uint64_t v30 = KeyPath;
  v30[1] = (uint64_t)sub_D8C44;
  v30[2] = v28;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v29);
  return sub_DA238((uint64_t)v15, v39, &qword_122D28);
}

uint64_t sub_CF57C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E63A0();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10C7C(&qword_123F58);
  __chkstk_darwin(v48);
  uint64_t v47 = (uint64_t)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ActivityEditView(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_E5E90();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = v6;
  uint64_t v13 = v0 + *(int *)(v6 + 36);
  uint64_t v14 = *(void *)(v13 + 16);
  long long v50 = *(_OWORD *)v13;
  uint64_t v51 = v14;
  sub_10C7C(&qword_124118);
  uint64_t result = sub_E6D20();
  if (*((void *)&v53 + 1))
  {
    v46[2] = v4;
    long long v50 = v53;
    sub_E5E80();
    v46[1] = sub_187B0();
    uint64_t v16 = sub_E73E0();
    uint64_t v18 = v17;
    v46[0] = *(void *)(v10 + 8);
    ((void (*)(char *, uint64_t))v46[0])(v12, v9);
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void *)(v13 + 16);
    long long v50 = *(_OWORD *)v13;
    uint64_t v51 = v19;
    *(void *)&long long v53 = v16;
    *((void *)&v53 + 1) = v18;
    sub_E6D30();
    BOOL v20 = sub_D3CD4();
    sub_D8AA0(v1, (uint64_t)v8, type metadata accessor for ActivityEditView);
    if (v20)
    {
      sub_D8B08((uint64_t)v8, type metadata accessor for ActivityEditView);
    }
    else
    {
      uint64_t v21 = (int *)v49;
      uint64_t v22 = &v8[*(int *)(v49 + 36)];
      uint64_t v23 = *((void *)v22 + 2);
      long long v50 = *(_OWORD *)v22;
      uint64_t v51 = v23;
      sub_E6D20();
      if (*((void *)&v53 + 1))
      {
        uint64_t v24 = *(void *)&v8[v21[11]];
        long long v50 = v53;
        sub_E5E80();
        uint64_t v25 = sub_E73E0();
        uint64_t v27 = v26;
        ((void (*)(char *, uint64_t))v46[0])(v12, v9);
        swift_bridgeObjectRelease();
        char v28 = sub_D3A24(v25, v27, v24);
        swift_bridgeObjectRelease();
        sub_D8B08((uint64_t)v8, type metadata accessor for ActivityEditView);
        uint64_t v29 = v21;
        if (v28) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_D8B08((uint64_t)v8, type metadata accessor for ActivityEditView);
        uint64_t v29 = v21;
      }
      uint64_t v30 = *(void (**)(void, void, void, void, void, void))(v1 + v29[12]);
      uint64_t v31 = v1 + v29[6];
      long long v32 = *(_OWORD *)v31;
      uint64_t v34 = *(void *)(v31 + 16);
      uint64_t v33 = *(void *)(v31 + 24);
      long long v50 = v32;
      uint64_t v51 = v34;
      uint64_t v52 = v33;
      sub_10C7C(&qword_122A98);
      sub_E6DE0();
      long long v35 = v53;
      uint64_t v36 = v1 + v29[7];
      long long v37 = *(_OWORD *)v36;
      uint64_t v39 = *(void *)(v36 + 16);
      uint64_t v38 = *(void *)(v36 + 24);
      long long v50 = v37;
      uint64_t v51 = v39;
      uint64_t v52 = v38;
      sub_E6DE0();
      long long v40 = v53;
      uint64_t v41 = v1 + v29[8];
      long long v42 = *(_OWORD *)v41;
      uint64_t v44 = *(void *)(v41 + 16);
      uint64_t v43 = *(void *)(v41 + 24);
      long long v50 = v42;
      uint64_t v51 = v44;
      uint64_t v52 = v43;
      sub_E6DE0();
      v30(v35, *((void *)&v35 + 1), v40, *((void *)&v40 + 1), v53, *((void *)&v53 + 1));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
LABEL_9:
    uint64_t v45 = v47;
    sub_6E574(v47);
    sub_E6DE0();
    sub_E6390();
    sub_E6DF0();
    return sub_DA1DC(v45, &qword_123F58);
  }
  return result;
}

uint64_t sub_CFA40()
{
  uint64_t v1 = sub_E5E90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ActivityEditView(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v8 = sub_D3CD4();
  sub_D8AA0(v0, (uint64_t)v7, type metadata accessor for ActivityEditView);
  if (v8)
  {
    char v9 = 0;
  }
  else
  {
    uint64_t v10 = &v7[*(int *)(v5 + 36)];
    uint64_t v11 = *((void *)v10 + 2);
    long long v17 = *(_OWORD *)v10;
    uint64_t v18 = v11;
    sub_10C7C(&qword_124118);
    sub_E6D20();
    if (*((void *)&v19 + 1))
    {
      uint64_t v12 = *(void *)&v7[*(int *)(v5 + 44)];
      long long v17 = v19;
      sub_E5E80();
      sub_187B0();
      uint64_t v13 = sub_E73E0();
      uint64_t v15 = v14;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      swift_bridgeObjectRelease();
      LOBYTE(v13) = sub_D3A24(v13, v15, v12);
      swift_bridgeObjectRelease();
      char v9 = v13 ^ 1;
    }
    else
    {
      char v9 = 1;
    }
  }
  sub_D8B08((uint64_t)v7, type metadata accessor for ActivityEditView);
  return v9 & 1;
}

uint64_t sub_CFC4C()
{
  uint64_t v1 = sub_E6250();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v15 - v6;
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 20)))
  {
    sub_3487C((uint64_t)v7);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.dark(_:), v1);
    char v8 = sub_E6240();
    char v9 = *(void (**)(char *, uint64_t))(v2 + 8);
    v9(v5, v1);
    v9(v7, v1);
    uint64_t v10 = self;
    if (v8) {
      id v11 = [v10 secondarySystemGroupedBackgroundColor];
    }
    else {
      id v11 = [v10 systemGroupedBackgroundColor];
    }
    id v14 = v11;
    return sub_E6AC0();
  }
  else
  {
    id v12 = [self secondarySystemGroupedBackgroundColor];
    return sub_E6AC0();
  }
}

uint64_t sub_CFE18()
{
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 20))) {
    return 4473921;
  }
  else {
    return 1162760004;
  }
}

uint64_t sub_CFE60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_E6C40();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_CFC4C();
  if (qword_12AA70 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v45 = v52;
  int v44 = v53;
  uint64_t v43 = v54;
  int v42 = v55;
  uint64_t v41 = v56;
  uint64_t v40 = v57;
  uint64_t v8 = type metadata accessor for ActivityEditView(0);
  char v9 = (long long *)(a1 + *(int *)(v8 + 28));
  long long v10 = *v9;
  uint64_t v12 = *((void *)v9 + 2);
  uint64_t v11 = *((void *)v9 + 3);
  long long v58 = v10;
  uint64_t v59 = v12;
  uint64_t v60 = v11;
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  sub_E6C70();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
  uint64_t v39 = sub_E6C90();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (qword_12AA60 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v13 = v58;
  char v14 = BYTE8(v58);
  uint64_t v15 = v59;
  char v16 = v60;
  uint64_t v38 = v61;
  uint64_t v37 = v62;
  long long v17 = (long long *)(a1 + *(int *)(v8 + 32));
  long long v18 = *v17;
  uint64_t v20 = *((void *)v17 + 2);
  uint64_t v19 = *((void *)v17 + 3);
  long long v47 = v18;
  uint64_t v48 = v20;
  uint64_t v49 = v19;
  sub_E6DE0();
  uint64_t v22 = v50;
  uint64_t v21 = v51;
  uint64_t v23 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_12AAD8;
  if (*(void *)(qword_12AAD8 + 16) && (unint64_t v25 = sub_21CB8(v22, v21), (v26 & 1) != 0))
  {
    uint64_t v27 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
    swift_retain();
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v36;
  swift_bridgeObjectRelease_n();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = sub_E6F30();
  char v31 = v44;
  char v32 = v42;
  char v46 = v16;
  *(void *)a2 = v28;
  *(_WORD *)(a2 + 8) = 256;
  *(void *)(a2 + 16) = v45;
  *(unsigned char *)(a2 + 24) = v31;
  *(void *)(a2 + 32) = v43;
  *(unsigned char *)(a2 + 40) = v32;
  uint64_t v33 = v40;
  *(void *)(a2 + 48) = v41;
  *(void *)(a2 + 56) = v33;
  *(void *)(a2 + 64) = v39;
  *(void *)(a2 + 72) = 0;
  *(_WORD *)(a2 + 80) = 1;
  *(void *)(a2 + 88) = v13;
  *(unsigned char *)(a2 + 96) = v14;
  *(void *)(a2 + 104) = v15;
  *(unsigned char *)(a2 + 112) = v46;
  uint64_t v34 = v37;
  *(void *)(a2 + 120) = v38;
  *(void *)(a2 + 128) = v34;
  *(void *)(a2 + 136) = KeyPath;
  *(void *)(a2 + 144) = v27;
  *(void *)(a2 + 152) = result;
  *(void *)(a2 + 160) = v35;
  return result;
}

uint64_t static Color.activityColor(_:)(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_12AAD8;
  if (*(void *)(qword_12AAD8 + 16) && (unint64_t v6 = sub_21CB8(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
    swift_retain();
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_D0334@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_10C7C(&qword_125A38);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v36 = (uint64_t)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v37 = (uint64_t)&v30 - v4;
  sub_D05E0((uint64_t)&v30 - v4);
  if (sub_D1348())
  {
    sub_E6850();
    uint64_t v5 = sub_E6900();
    uint64_t v7 = v6;
    char v9 = v8;
    swift_release();
    sub_E6B00();
    uint64_t v10 = sub_E68E0();
    uint64_t v33 = v11;
    uint64_t v34 = v10;
    char v13 = v12;
    uint64_t v32 = v14;
    swift_release();
    uint64_t v15 = v13 & 1;
    sub_18814(v5, v7, v9 & 1);
    swift_bridgeObjectRelease();
    unsigned __int8 v16 = sub_E6760();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v18 = v16;
    uint64_t v30 = 2;
    uint64_t v31 = KeyPath;
    uint64_t v19 = 1;
    uint64_t v20 = 256;
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v15 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v20 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v21 = v36;
  sub_DA29C(v37, v36, &qword_125A38);
  uint64_t v22 = v35;
  sub_DA29C(v21, v35, &qword_125A38);
  uint64_t v23 = v22 + *(int *)(sub_10C7C(&qword_125A40) + 48);
  uint64_t v25 = v33;
  uint64_t v24 = v34;
  *(void *)uint64_t v23 = v34;
  *(void *)(v23 + 8) = v25;
  *(void *)(v23 + 16) = v15;
  char v26 = v15;
  uint64_t v28 = v31;
  uint64_t v27 = v32;
  *(void *)(v23 + 24) = v32;
  *(void *)(v23 + 32) = v20;
  *(void *)(v23 + 40) = v18;
  *(_OWORD *)(v23 + 48) = 0u;
  *(_OWORD *)(v23 + 64) = 0u;
  *(void *)(v23 + 80) = v19;
  *(void *)(v23 + 88) = v28;
  *(void *)(v23 + 96) = v30;
  *(unsigned char *)(v23 + 104) = 0;
  sub_D9A4C(v24, v25, v26, v27);
  sub_DA1DC(v37, &qword_125A38);
  sub_D9A9C(v24, v25, v26, v27);
  return sub_DA1DC(v21, &qword_125A38);
}

uint64_t sub_D05E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v106 = a1;
  uint64_t v3 = sub_10C7C(&qword_125A48);
  uint64_t v139 = *(void *)(v3 - 8);
  uint64_t v140 = v3;
  __chkstk_darwin(v3);
  long long v138 = (char *)&v105 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_E63B0();
  __chkstk_darwin(v136);
  uint64_t v137 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_10C7C(&qword_125A50);
  uint64_t v115 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  char v109 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = sub_10C7C(&qword_125A58);
  uint64_t v116 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  unint64_t v110 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_10C7C(&qword_125A60) - 8;
  __chkstk_darwin(v112);
  long long v111 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_10C7C(&qword_125A68) - 8;
  __chkstk_darwin(v114);
  uint64_t v107 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_10C7C(&qword_125A70);
  __chkstk_darwin(v121);
  uint64_t v124 = (uint64_t)&v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_10C7C(&qword_125A78);
  __chkstk_darwin(v122);
  uint64_t v126 = (uint64_t)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_10C7C(&qword_125A80);
  __chkstk_darwin(v123);
  uint64_t v128 = (uint64_t)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_10C7C(&qword_125A88);
  __chkstk_darwin(v125);
  uint64_t v131 = (uint64_t)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_10C7C(&qword_125A90);
  __chkstk_darwin(v127);
  uint64_t v135 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = sub_10C7C(&qword_125A38);
  __chkstk_darwin(v133);
  uint64_t v134 = (uint64_t)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = type metadata accessor for ActivityEditView(0);
  uint64_t v16 = *(void *)(v141 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  __chkstk_darwin(v141);
  uint64_t v18 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_D8AA0(v1, (uint64_t)v18, type metadata accessor for ActivityEditView);
  sub_E7290();
  uint64_t v19 = sub_E7280();
  uint64_t v20 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v132 = v17;
  uint64_t v108 = v20;
  uint64_t v22 = v20 | 7;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v19;
  *(void *)(v23 + 24) = &protocol witness table for MainActor;
  sub_D8B74((uint64_t)v18, v23 + v21);
  sub_D8AA0(v1, (uint64_t)v18, type metadata accessor for ActivityEditView);
  uint64_t v24 = sub_E7280();
  uint64_t v130 = v22;
  uint64_t v25 = (uint64_t)v107;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v24;
  *(void *)(v26 + 24) = &protocol witness table for MainActor;
  uint64_t v129 = v18;
  sub_D8B74((uint64_t)v18, v26 + v21);
  uint64_t v27 = v2;
  sub_E6E30();
  long long v28 = v143;
  uint64_t v29 = v145;
  *(void *)&long long v143 = 0xD000000000000014;
  *((void *)&v143 + 1) = 0x80000000000F3DF0;
  sub_187B0();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_E6920();
  uint64_t v30 = v109;
  uint64_t v119 = *((void *)&v28 + 1);
  uint64_t v120 = v28;
  uint64_t v118 = v29;
  sub_E6F70();
  sub_D9E28(&qword_125A98, &qword_125A50);
  uint64_t v31 = v110;
  uint64_t v32 = v113;
  sub_E6A30();
  (*(void (**)(char *, uint64_t))(v115 + 8))(v30, v32);
  sub_E6830();
  sub_E67E0();
  uint64_t v33 = sub_E6840();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v116;
  uint64_t v36 = (uint64_t)v111;
  uint64_t v37 = v117;
  (*(void (**)(char *, char *, uint64_t))(v116 + 16))(v111, v31, v117);
  uint64_t v38 = (uint64_t *)(v36 + *(int *)(v112 + 44));
  uint64_t *v38 = KeyPath;
  v38[1] = v33;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v31, v37);
  uint64_t v39 = swift_getKeyPath();
  sub_DA29C(v36, v25, &qword_125A60);
  uint64_t v40 = v25 + *(int *)(v114 + 44);
  *(void *)uint64_t v40 = v39;
  *(unsigned char *)(v40 + 8) = 1;
  sub_DA1DC(v36, &qword_125A60);
  uint64_t v41 = v2 + *(int *)(v141 + 32);
  long long v42 = *(_OWORD *)v41;
  uint64_t v44 = *(void *)(v41 + 16);
  uint64_t v43 = *(void *)(v41 + 24);
  long long v143 = v42;
  uint64_t v144 = v44;
  uint64_t v145 = v43;
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  long long v45 = v142;
  uint64_t v46 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v46 != -1) {
    swift_once();
  }
  uint64_t v47 = v108;
  uint64_t v48 = qword_12AAD8;
  if (*(void *)(qword_12AAD8 + 16) && (unint64_t v49 = sub_21CB8(v45, *((uint64_t *)&v45 + 1)), (v50 & 1) != 0))
  {
    uint64_t v51 = *(void *)(*(void *)(v48 + 56) + 8 * v49);
    swift_retain();
  }
  else
  {
    uint64_t v51 = 0;
  }
  uint64_t v52 = v106;
  swift_bridgeObjectRelease_n();
  uint64_t v53 = swift_getKeyPath();
  uint64_t v54 = v124;
  sub_DA29C(v25, v124, &qword_125A68);
  unsigned __int8 v55 = (uint64_t *)(v54 + *(int *)(v121 + 36));
  uint64_t *v55 = v53;
  v55[1] = v51;
  sub_DA1DC(v25, &qword_125A68);
  char v56 = sub_E6760();
  sub_E6210();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v65 = v126;
  sub_DA29C(v54, v126, &qword_125A70);
  uint64_t v66 = v65 + *(int *)(v122 + 36);
  *(unsigned char *)uint64_t v66 = v56;
  *(void *)(v66 + 8) = v58;
  *(void *)(v66 + 16) = v60;
  *(void *)(v66 + 24) = v62;
  *(void *)(v66 + 32) = v64;
  *(unsigned char *)(v66 + 40) = 0;
  sub_DA1DC(v54, &qword_125A70);
  char v67 = sub_E67A0();
  sub_E6210();
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v76 = v128;
  sub_DA29C(v65, v128, &qword_125A78);
  uint64_t v77 = v76 + *(int *)(v123 + 36);
  *(unsigned char *)uint64_t v77 = v67;
  *(void *)(v77 + 8) = v69;
  *(void *)(v77 + 16) = v71;
  *(void *)(v77 + 24) = v73;
  *(void *)(v77 + 32) = v75;
  *(unsigned char *)(v77 + 40) = 0;
  sub_DA1DC(v65, &qword_125A78);
  uint64_t v78 = sub_CFC4C();
  LOBYTE(v53) = sub_E6770();
  uint64_t v79 = v131;
  sub_DA29C(v76, v131, &qword_125A80);
  uint64_t v80 = v79 + *(int *)(v125 + 36);
  *(void *)uint64_t v80 = v78;
  *(unsigned char *)(v80 + 8) = v53;
  sub_DA1DC(v76, &qword_125A80);
  uint64_t v81 = v137;
  unint64_t v82 = &v137[*(int *)(v136 + 20)];
  uint64_t v83 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v84 = sub_E65A0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v84 - 8) + 104))(v82, v83, v84);
  __asm { FMOV            V0.2D, #12.0 }
  _OWORD *v81 = _Q0;
  uint64_t v90 = (uint64_t)v135;
  uint64_t v91 = (uint64_t)&v135[*(int *)(v127 + 36)];
  sub_D8AA0((uint64_t)v81, v91, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v91 + *(int *)(sub_10C7C(&qword_125938) + 36)) = 256;
  sub_DA29C(v79, v90, &qword_125A88);
  sub_D8B08((uint64_t)v81, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_DA1DC(v79, &qword_125A88);
  uint64_t v92 = v27 + *(int *)(v141 + 24);
  long long v93 = *(_OWORD *)v92;
  uint64_t v95 = *(void *)(v92 + 16);
  uint64_t v94 = *(void *)(v92 + 24);
  long long v143 = v93;
  uint64_t v144 = v95;
  uint64_t v145 = v94;
  sub_E6DE0();
  long long v143 = v142;
  uint64_t v96 = v138;
  sub_E6120();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v97 = (uint64_t)v129;
  sub_D8AA0(v27, (uint64_t)v129, type metadata accessor for ActivityEditView);
  uint64_t v98 = swift_allocObject();
  *(void *)(v98 + 16) = 40;
  sub_D8B74(v97, v98 + ((v47 + 24) & ~v47));
  uint64_t v99 = v134;
  sub_DA29C(v90, v134, &qword_125A90);
  uint64_t v100 = v133;
  uint64_t v102 = v139;
  uint64_t v101 = v140;
  (*(void (**)(uint64_t, char *, uint64_t))(v139 + 16))(v99 + *(int *)(v133 + 52), v96, v140);
  uint64_t v103 = (uint64_t (**)())(v99 + *(int *)(v100 + 56));
  *uint64_t v103 = sub_DA0B8;
  v103[1] = (uint64_t (*)())v98;
  (*(void (**)(char *, uint64_t))(v102 + 8))(v96, v101);
  sub_DA1DC(v90, &qword_125A90);
  return sub_DA238(v99, v52, &qword_125A38);
}

uint64_t sub_D1348()
{
  uint64_t v1 = sub_E5E90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ActivityEditView(0);
  uint64_t v6 = (long long *)(v0 + *(int *)(v5 + 36));
  uint64_t v7 = *((void *)v6 + 2);
  long long v14 = *v6;
  uint64_t v15 = v7;
  sub_10C7C(&qword_124118);
  sub_E6D20();
  if (*((void *)&v16 + 1))
  {
    uint64_t v8 = *(void *)(v0 + *(int *)(v5 + 44));
    long long v14 = v16;
    sub_E5E80();
    sub_187B0();
    uint64_t v9 = sub_E73E0();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    swift_bridgeObjectRelease();
    char v12 = sub_D3A24(v9, v11, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_D14C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActivityEditView(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1 + *(int *)(v5 + 36);
  uint64_t v9 = *(void *)(v8 + 16);
  long long v17 = *(_OWORD *)v8;
  uint64_t v18 = v9;
  sub_10C7C(&qword_124118);
  sub_E6D20();
  uint64_t v10 = v20;
  uint64_t v11 = v21;
  sub_D8AA0(a1, (uint64_t)v7, type metadata accessor for ActivityEditView);
  if (!v11)
  {
    char v12 = &v7[*(int *)(v4 + 24)];
    long long v13 = *(_OWORD *)v12;
    uint64_t v15 = *((void *)v12 + 2);
    uint64_t v14 = *((void *)v12 + 3);
    long long v17 = v13;
    uint64_t v18 = v15;
    uint64_t v19 = v14;
    sub_10C7C(&qword_122A98);
    sub_E6DE0();
    uint64_t v10 = v20;
    uint64_t v11 = v21;
  }
  uint64_t result = sub_D8B08((uint64_t)v7, type metadata accessor for ActivityEditView);
  *a2 = v10;
  a2[1] = v11;
  return result;
}

uint64_t sub_D15F8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_E5E90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for ActivityEditView(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v14 = a2 + *(int *)(v9 + 36);
  uint64_t v15 = *(void *)(v14 + 16);
  long long v29 = *(_OWORD *)v14;
  uint64_t v30 = v15;
  *(void *)&long long v32 = v13;
  *((void *)&v32 + 1) = v12;
  swift_bridgeObjectRetain();
  sub_10C7C(&qword_124118);
  sub_E6D30();
  LOBYTE(a1) = sub_D3CD4();
  sub_D8AA0(a2, (uint64_t)v11, type metadata accessor for ActivityEditView);
  if (a1) {
    return sub_D8B08((uint64_t)v11, type metadata accessor for ActivityEditView);
  }
  long long v17 = &v11[v8[9]];
  uint64_t v18 = *((void *)v17 + 2);
  long long v29 = *(_OWORD *)v17;
  uint64_t v30 = v18;
  sub_E6D20();
  if (!*((void *)&v32 + 1))
  {
    sub_D8B08((uint64_t)v11, type metadata accessor for ActivityEditView);
    goto LABEL_7;
  }
  uint64_t v28 = *(void *)&v11[v8[11]];
  long long v29 = v32;
  sub_E5E80();
  sub_187B0();
  uint64_t v19 = sub_E73E0();
  uint64_t v20 = v5;
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  LOBYTE(v19) = sub_D3A24(v19, v22, v28);
  swift_bridgeObjectRelease();
  uint64_t result = sub_D8B08((uint64_t)v11, type metadata accessor for ActivityEditView);
  if ((v19 & 1) == 0)
  {
LABEL_7:
    uint64_t v23 = a2 + v8[6];
    long long v24 = *(_OWORD *)v23;
    uint64_t v26 = *(void *)(v23 + 16);
    uint64_t v25 = *(void *)(v23 + 24);
    long long v29 = v24;
    uint64_t v30 = v26;
    uint64_t v31 = v25;
    *(void *)&long long v32 = v13;
    *((void *)&v32 + 1) = v12;
    swift_bridgeObjectRetain();
    sub_10C7C(&qword_122A98);
    return sub_E6DF0();
  }
  return result;
}

uint64_t sub_D18D0(uint64_t a1)
{
  uint64_t v2 = v1[1];
  if ((v2 & 0x2000000000000000) == 0)
  {
    if ((*v1 & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if ((v2 & 0xF00000000000000) == 0)
  {
    __break(1u);
    return String.remove(at:)(a1);
  }
LABEL_5:
  a1 = sub_E7190();

  return String.remove(at:)(a1);
}

uint64_t sub_D1938@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_10C7C(&qword_125948);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10C7C(&qword_125950);
  uint64_t v7 = v6 - 8;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = sub_10C7C(&qword_125958);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  long long v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v33 - v17;
  *(void *)uint64_t v18 = sub_E65E0();
  *((void *)v18 + 1) = 0x4024000000000000;
  unsigned char v18[16] = 0;
  uint64_t v19 = sub_10C7C(&qword_125960);
  sub_D1BFC(a1, (uint64_t *)&v18[*(int *)(v19 + 44)]);
  *(void *)uint64_t v5 = sub_E65E0();
  *((void *)v5 + 1) = 0x4024000000000000;
  v5[16] = 0;
  uint64_t v20 = sub_10C7C(&qword_125968);
  sub_D2DF8(a1, (uint64_t *)&v5[*(int *)(v20 + 44)]);
  LOBYTE(a1) = sub_E6780();
  sub_E6210();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_DA29C((uint64_t)v5, (uint64_t)v10, &qword_125948);
  long long v29 = &v10[*(int *)(v7 + 44)];
  *long long v29 = a1;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_DA1DC((uint64_t)v5, &qword_125948);
  sub_DA238((uint64_t)v10, (uint64_t)v12, &qword_125950);
  sub_DA29C((uint64_t)v18, (uint64_t)v16, &qword_125958);
  sub_DA29C((uint64_t)v12, (uint64_t)v10, &qword_125950);
  uint64_t v30 = v34;
  sub_DA29C((uint64_t)v16, v34, &qword_125958);
  uint64_t v31 = sub_10C7C(&qword_125970);
  sub_DA29C((uint64_t)v10, v30 + *(int *)(v31 + 48), &qword_125950);
  sub_DA1DC((uint64_t)v12, &qword_125950);
  sub_DA1DC((uint64_t)v18, &qword_125958);
  sub_DA1DC((uint64_t)v10, &qword_125950);
  return sub_DA1DC((uint64_t)v16, &qword_125958);
}

uint64_t sub_D1BFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = sub_E66F0();
  __chkstk_darwin(v3);
  uint64_t v39 = sub_E6F00();
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v6 = (_OWORD *)((char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10C7C(&qword_1259D0);
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v43 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v40 = (char *)&v34 - v10;
  uint64_t v11 = type metadata accessor for ActivityEditView(0);
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  if (*(unsigned char *)(a1 + *(int *)(v11 + 60)) == 1)
  {
    sub_E6860();
    uint64_t v12 = sub_E6900();
    uint64_t v13 = v16;
    char v18 = v17;
    uint64_t v15 = v19;
    swift_release();
    uint64_t v14 = v18 & 1;
  }
  uint64_t v36 = v13;
  uint64_t v37 = v15;
  uint64_t v38 = v14;
  sub_10C7C(&qword_125980);
  sub_E6F10();
  uint64_t v35 = v12;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_EBBE0;
  _OWORD *v6 = xmmword_F00D0;
  (*(void (**)(_OWORD *, void, uint64_t))(v4 + 104))(v6, enum case for GridItem.Size.adaptive(_:), v39);
  uint64_t v20 = sub_E6F20();
  __chkstk_darwin(v20);
  sub_E65D0();
  int v45 = 0;
  sub_D8D80(&qword_125988, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_E76B0();
  sub_10C7C(&qword_1259D8);
  sub_D9304(&qword_1259E0, &qword_1259D8, (void (*)(void))sub_D9370);
  uint64_t v21 = v40;
  sub_E6F60();
  uint64_t v23 = v41;
  uint64_t v22 = v42;
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  uint64_t v25 = v43;
  v24(v43, v21, v42);
  uint64_t v26 = v44;
  *uint64_t v44 = v12;
  uint64_t v28 = v36;
  uint64_t v27 = v37;
  uint64_t v29 = v38;
  v26[1] = v36;
  v26[2] = v29;
  v26[3] = v27;
  uint64_t v30 = sub_10C7C(&qword_125A08);
  v24((char *)v26 + *(int *)(v30 + 48), v25, v22);
  uint64_t v31 = v35;
  sub_54888(v35, v28, v29, v27);
  long long v32 = *(void (**)(char *, uint64_t))(v23 + 8);
  v32(v21, v22);
  v32(v25, v22);
  return sub_548CC(v31, v28, v29, v27);
}

uint64_t sub_D20E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActivityEditView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  uint64_t v7 = sub_10C7C(&qword_1259D8);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_12AAD0 != -1) {
    swift_once();
  }
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = (char *)sub_D50A8(v11);
  swift_bridgeObjectRelease();
  char v17 = v12;
  swift_retain();
  sub_D503C(&v17);
  swift_release();
  swift_getKeyPath();
  sub_D8AA0(a1, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  unint64_t v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = swift_allocObject();
  sub_D8B74((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v14 + v13);
  sub_10C7C(&qword_124D40);
  sub_10C7C(&qword_1259F0);
  sub_D9E28(&qword_1259C0, &qword_124D40);
  sub_D9370();
  sub_E6EB0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
}

char *static Color.allSystemColors.getter()
{
  if (qword_12AAD0 != -1) {
    swift_once();
  }
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = (char *)sub_D50A8(v0);
  swift_bridgeObjectRelease();
  uint64_t v3 = v1;
  swift_retain();
  sub_D503C(&v3);
  swift_release();
  return v3;
}

uint64_t sub_D2460@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v67 = a3;
  uint64_t v5 = sub_E65C0();
  uint64_t v65 = *(void *)(v5 - 8);
  uint64_t v66 = v5;
  __chkstk_darwin(v5);
  uint64_t v64 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_E66A0();
  uint64_t v55 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v52 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for ActivityEditView(0);
  uint64_t v8 = *(void *)(v60 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v60);
  uint64_t v10 = sub_10C7C(&qword_1259F8);
  uint64_t v53 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10C7C(&qword_125A10);
  uint64_t v58 = *(void *)(v13 - 8);
  uint64_t v59 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10C7C(&qword_1259F0);
  uint64_t v16 = __chkstk_darwin(v62);
  uint64_t v63 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v61 = (char *)&v52 - v18;
  uint64_t v20 = *a1;
  uint64_t v19 = a1[1];
  sub_D8AA0(a2, (uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  unint64_t v21 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v22 = swift_allocObject();
  sub_D8B74((uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
  uint64_t v23 = (uint64_t *)(v22 + ((v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v23 = v20;
  v23[1] = v19;
  uint64_t v68 = v20;
  uint64_t v69 = v19;
  uint64_t v56 = a2;
  uint64_t v70 = a2;
  sub_D99F8();
  swift_bridgeObjectRetain();
  sub_E6D80();
  uint64_t v24 = v52;
  sub_E6690();
  uint64_t v25 = sub_D9E28(&qword_125A00, &qword_1259F8);
  uint64_t v26 = sub_D8D80((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v57 = v15;
  uint64_t v27 = v54;
  sub_E6990();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v24, v27);
  uint64_t v28 = v10;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v10);
  uint64_t v29 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v30 = qword_12AAD8;
  uint64_t v31 = v20;
  uint64_t v32 = v19;
  if (*(void *)(qword_12AAD8 + 16))
  {
    unint64_t v33 = sub_21CB8(v20, v19);
    uint64_t v31 = v20;
    uint64_t v32 = v19;
    if (v34)
    {
      uint64_t v55 = *(void *)(*(void *)(v30 + 56) + 8 * v33);
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_D5190();
      uint64_t v35 = (void *)sub_E7380();
      uint64_t v36 = (CGColor *)[v35 CGColor];

      uint64_t v37 = v27;
      uint64_t v38 = AXNameFromColor(v36);

      uint64_t v31 = sub_E7110();
      uint64_t v32 = v39;
      swift_release_n();

      uint64_t v27 = v37;
    }
  }
  uint64_t v74 = v31;
  uint64_t v75 = v32;
  *(void *)&long long v71 = v28;
  *((void *)&v71 + 1) = v27;
  uint64_t v72 = v25;
  uint64_t v73 = v26;
  swift_getOpaqueTypeConformance2();
  sub_187B0();
  uint64_t v40 = (uint64_t)v63;
  uint64_t v41 = v59;
  uint64_t v42 = v57;
  sub_E6A00();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v41);
  uint64_t v43 = v56 + *(int *)(v60 + 32);
  long long v44 = *(_OWORD *)v43;
  uint64_t v46 = *(void *)(v43 + 16);
  uint64_t v45 = *(void *)(v43 + 24);
  long long v71 = v44;
  uint64_t v72 = v46;
  uint64_t v73 = v45;
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  if (v20 == v74 && v19 == v75)
  {
    swift_bridgeObjectRelease();
    uint64_t v47 = v64;
  }
  else
  {
    char v48 = sub_E7620();
    swift_bridgeObjectRelease();
    uint64_t v47 = v64;
    if ((v48 & 1) == 0)
    {
      *(void *)&long long v71 = _swiftEmptyArrayStorage;
      sub_D8D80(&qword_125A20, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
      sub_10C7C(&qword_125A28);
      sub_D9E28(&qword_125A30, &qword_125A28);
      uint64_t v49 = v66;
      sub_E7460();
      goto LABEL_12;
    }
  }
  sub_E65B0();
  uint64_t v49 = v66;
LABEL_12:
  uint64_t v50 = (uint64_t)v61;
  sub_E6340();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v47, v49);
  sub_DA1DC(v40, &qword_1259F0);
  return sub_DA238(v50, v67, &qword_1259F0);
}

void sub_D2C60()
{
  id v0 = [self sharedApplication];
  [v0 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];
}

uint64_t static Color.accessibilityColorNameForSystemColorName(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  if (*(void *)(qword_12AAD8 + 16))
  {
    sub_21CB8(a1, a2);
    if (v5)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_D5190();
      uint64_t v6 = (void *)sub_E7380();
      uint64_t v7 = (CGColor *)[v6 CGColor];

      uint64_t v8 = AXNameFromColor(v7);
      a1 = sub_E7110();
      swift_release_n();
    }
  }
  return a1;
}

uint64_t sub_D2DF8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v40 = sub_E66F0();
  __chkstk_darwin(v40);
  uint64_t v38 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_E6F00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (_OWORD *)((char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = sub_10C7C(&qword_125978);
  uint64_t v8 = *(void *)(v39 - 8);
  uint64_t v9 = __chkstk_darwin(v39);
  uint64_t v41 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v37 = (char *)&v34 - v11;
  uint64_t v12 = type metadata accessor for ActivityEditView(0);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (*(unsigned char *)(a1 + *(int *)(v12 + 60)) == 1)
  {
    sub_E6860();
    uint64_t v13 = sub_E6900();
    uint64_t v14 = v17;
    char v19 = v18;
    uint64_t v16 = v20;
    swift_release();
    uint64_t v15 = v19 & 1;
  }
  uint64_t v35 = v16;
  uint64_t v36 = v15;
  sub_10C7C(&qword_125980);
  sub_E6F10();
  uint64_t v21 = v13;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_EBBE0;
  *uint64_t v7 = xmmword_F00D0;
  (*(void (**)(_OWORD *, void, uint64_t))(v5 + 104))(v7, enum case for GridItem.Size.adaptive(_:), v4);
  uint64_t v22 = sub_E6F20();
  uint64_t v34 = v14;
  __chkstk_darwin(v22);
  sub_E65D0();
  int v43 = 0;
  sub_D8D80(&qword_125988, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_E76B0();
  sub_10C7C(&qword_125990);
  sub_D8C64();
  uint64_t v23 = v37;
  sub_E6F60();
  uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v25 = v41;
  uint64_t v26 = v39;
  v24(v41, v23, v39);
  uint64_t v27 = v42;
  uint64_t v28 = v21;
  *uint64_t v42 = v21;
  v27[1] = v14;
  uint64_t v29 = v35;
  LOBYTE(v21) = v36;
  v27[2] = v36;
  v27[3] = v29;
  uint64_t v30 = sub_10C7C(&qword_1259B0);
  v24((char *)v27 + *(int *)(v30 + 48), v25, v26);
  uint64_t v31 = v34;
  sub_54888(v28, v34, v21, v29);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
  v32(v23, v26);
  v32(v25, v26);
  return sub_548CC(v28, v31, v21, v29);
}

uint64_t sub_D32AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityEditView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = __chkstk_darwin(v2 - 8);
  if (qword_12AAB0 != -1) {
    uint64_t v5 = swift_once();
  }
  uint64_t v6 = static ActivitySource.allSymbolImagenames;
  __chkstk_darwin(v5);
  uint64_t OpaqueTypeConformance2 = a1;
  swift_bridgeObjectRetain();
  v15[4] = sub_D3B5C((uint64_t)sub_D8DC8, (uint64_t)&v15[-4], v6);
  swift_getKeyPath();
  sub_D8AA0(a1, (uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_D8B74((uint64_t)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  sub_10C7C(&qword_124D40);
  sub_10C7C(&qword_1259B8);
  sub_D9E28(&qword_1259C0, &qword_124D40);
  uint64_t v9 = sub_11B60(&qword_1259A0);
  uint64_t v10 = sub_E66A0();
  uint64_t v11 = sub_D9E28(&qword_1259A8, &qword_1259A0);
  uint64_t v12 = sub_D8D80((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v12;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  return sub_E6EB0();
}

uint64_t sub_D3590(uint64_t a1)
{
  if (qword_12AAB0 != -1) {
    a1 = swift_once();
  }
  uint64_t v2 = static ActivitySource.allSymbolImagenames;
  __chkstk_darwin(a1);
  _OWORD v4[2] = v1;
  swift_bridgeObjectRetain();
  return sub_D3B5C((uint64_t)sub_D51D0, (uint64_t)v4, v2);
}

uint64_t sub_D3644@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v5 = sub_E66A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v24 = v5;
  uint64_t v25 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ActivityEditView(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v23 = sub_10C7C(&qword_1259A0);
  uint64_t v12 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a1;
  uint64_t v16 = a1[1];
  sub_D8AA0(a2, (uint64_t)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  sub_D8B74((uint64_t)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  char v19 = (void *)(v18 + ((v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *char v19 = v15;
  v19[1] = v16;
  uint64_t v27 = v15;
  uint64_t v28 = v16;
  uint64_t v29 = a2;
  type metadata accessor for SystemImageView(0);
  sub_D8D80(&qword_1259C8, (void (*)(uint64_t))type metadata accessor for SystemImageView);
  swift_bridgeObjectRetain();
  sub_E6D80();
  sub_E6690();
  sub_D9E28(&qword_1259A8, &qword_1259A0);
  sub_D8D80((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v20 = v23;
  uint64_t v21 = v24;
  sub_E6990();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v20);
}

uint64_t sub_D39B0@<X0>(uint64_t *a1@<X8>)
{
  return sub_D4324(&qword_1230B8, a1);
}

uint64_t sub_D39C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  sub_DA238(a1, a5, &qword_123130);
  uint64_t result = type metadata accessor for SystemImageView(0);
  uint64_t v10 = (void *)(a5 + *(int *)(result + 20));
  *uint64_t v10 = a2;
  v10[1] = a3;
  *(unsigned char *)(a5 + *(int *)(result + 24)) = a4;
  return result;
}

uint64_t sub_D3A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_E7670();
    sub_E7170();
    Swift::Int v6 = sub_E76A0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_E7620() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_E7620() & 1) != 0) {
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

uint64_t sub_D3B5C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  uint64_t v17 = *(void *)(a3 + 16);
  if (v17)
  {
    uint64_t v5 = (uint64_t (*)(void *))result;
    unint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)(a3 + 40);
    unint64_t v8 = _swiftEmptyArrayStorage;
    unint64_t v15 = (uint64_t (*)(void *))result;
    while (v6 < *(void *)(v4 + 16))
    {
      uint64_t v10 = *(v7 - 1);
      uint64_t v9 = *v7;
      v18[0] = v10;
      v18[1] = v9;
      swift_bridgeObjectRetain();
      char v11 = v5(v18);
      if (v3)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
      if (v11)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        char v19 = v8;
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_D8024(0, v8[2] + 1, 1);
          unint64_t v8 = v19;
        }
        unint64_t v13 = v8[2];
        unint64_t v12 = v8[3];
        if (v13 >= v12 >> 1)
        {
          uint64_t result = (uint64_t)sub_D8024((char *)(v12 > 1), v13 + 1, 1);
          unint64_t v8 = v19;
        }
        void v8[2] = v13 + 1;
        uint64_t v14 = &v8[2 * v13];
        v14[4] = v10;
        v14[5] = v9;
        uint64_t v4 = a3;
        uint64_t v5 = v15;
      }
      else
      {
        uint64_t result = swift_bridgeObjectRelease();
      }
      ++v6;
      v7 += 2;
      if (v17 == v6) {
        goto LABEL_16;
      }
    }
    __break(1u);
  }
  else
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
LABEL_16:
    swift_bridgeObjectRelease();
    return (uint64_t)v8;
  }
  return result;
}

BOOL sub_D3CD4()
{
  uint64_t v1 = sub_E5E90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (long long *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 36));
  uint64_t v6 = *((void *)v5 + 2);
  long long v12 = *v5;
  uint64_t v13 = v6;
  sub_10C7C(&qword_124118);
  sub_E6D20();
  if (!*((void *)&v14 + 1)) {
    return 1;
  }
  long long v12 = v14;
  sub_E5E80();
  sub_187B0();
  uint64_t v7 = sub_E73E0();
  unint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  return v10 == 0;
}

uint64_t sub_D3E40()
{
  return sub_E69D0();
}

uint64_t sub_D3E5C@<X0>(uint64_t a1@<X8>)
{
  return sub_CDD70(v1, a1);
}

uint64_t sub_D3E64(uint64_t a1)
{
  return a1;
}

uint64_t sub_D3E98(uint64_t a1, uint64_t a2, char a3)
{
  return a3 & 1;
}

double sub_D3EA0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_E6F30();
  uint64_t v10 = v9;
  sub_D3F40(a1, a2, a3, (uint64_t)v18);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v10;
  long long v11 = v26;
  *(_OWORD *)(a4 + 144) = v25;
  *(_OWORD *)(a4 + 160) = v11;
  long long v12 = v28;
  *(_OWORD *)(a4 + 176) = v27;
  *(_OWORD *)(a4 + 192) = v12;
  long long v13 = v22;
  *(_OWORD *)(a4 + 80) = v21;
  *(_OWORD *)(a4 + 96) = v13;
  long long v14 = v24;
  *(_OWORD *)(a4 + 112) = v23;
  *(_OWORD *)(a4 + 128) = v14;
  long long v15 = v18[1];
  *(_OWORD *)(a4 + 16) = v18[0];
  *(_OWORD *)(a4 + 32) = v15;
  double result = *(double *)&v19;
  long long v17 = v20;
  *(_OWORD *)(a4 + 48) = v19;
  *(_OWORD *)(a4 + 64) = v17;
  return result;
}

uint64_t sub_D3F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a3) {
    uint64_t v7 = sub_E6B10();
  }
  else {
    uint64_t v7 = sub_E6B80();
  }
  uint64_t v8 = v7;
  sub_E6280();
  double v9 = v65;
  int v10 = v66;
  int v11 = DWORD1(v66);
  uint64_t v12 = *((void *)&v66 + 1);
  long long v13 = v67;
  uint64_t v14 = sub_E6F30();
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  if (qword_12AA80 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v36 = v70;
  uint64_t v37 = v68;
  uint64_t v34 = *((void *)&v72 + 1);
  uint64_t v35 = v72;
  char v64 = v69;
  char v63 = v71;
  uint64_t v16 = qword_12AAD0;
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_12AAD8;
  if (*(void *)(qword_12AAD8 + 16) && (unint64_t v18 = sub_21CB8(a1, a2), (v19 & 1) != 0))
  {
    uint64_t v33 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
    swift_retain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_E6B20();
  }
  if (qword_12AAA0 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v20 = v73;
  char v21 = v74;
  uint64_t v22 = v75;
  char v23 = v76;
  char v24 = v64;
  char v25 = v63;
  *(double *)uint64_t v40 = v65 * 0.5;
  *((double *)v40 + 1) = v65;
  v40[1] = v66;
  v40[2] = v67;
  *(void *)&long long v41 = v8;
  WORD4(v41) = 256;
  *(void *)&long long v42 = v39;
  *((void *)&v42 + 1) = v38;
  *(void *)&long long v43 = v68;
  BYTE8(v43) = v64;
  *(void *)&long long v44 = v70;
  BYTE8(v44) = v63;
  long long v45 = v72;
  long long v26 = v40[0];
  long long v27 = v66;
  long long v28 = v41;
  *(_OWORD *)(a4 + 32) = v67;
  *(_OWORD *)(a4 + 48) = v28;
  *(_OWORD *)a4 = v26;
  *(_OWORD *)(a4 + 16) = v27;
  long long v29 = v42;
  long long v30 = v43;
  long long v31 = v45;
  *(_OWORD *)(a4 + 96) = v44;
  *(_OWORD *)(a4 + 112) = v31;
  *(_OWORD *)(a4 + 64) = v29;
  *(_OWORD *)(a4 + 80) = v30;
  char v47 = v21;
  char v46 = v23;
  *(void *)(a4 + 128) = v33;
  *(_WORD *)(a4 + 136) = 256;
  *(void *)(a4 + 144) = v20;
  *(unsigned char *)(a4 + 152) = v21;
  *(void *)(a4 + 160) = v22;
  *(unsigned char *)(a4 + 168) = v23;
  *(_OWORD *)(a4 + 176) = v77;
  sub_D8560((uint64_t)v40);
  v48[0] = v9 * 0.5;
  v48[1] = v9;
  int v49 = v10;
  int v50 = v11;
  uint64_t v51 = v12;
  long long v52 = v13;
  uint64_t v53 = v8;
  __int16 v54 = 256;
  uint64_t v55 = v39;
  uint64_t v56 = v38;
  uint64_t v57 = v37;
  char v58 = v24;
  uint64_t v59 = v36;
  char v60 = v25;
  uint64_t v61 = v35;
  uint64_t v62 = v34;
  return sub_D8598((uint64_t)v48);
}

double sub_D4270@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = sub_E6F30();
  uint64_t v8 = v7;
  sub_D3F40(v3, v4, v5, (uint64_t)v16);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  long long v9 = v24;
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = v9;
  long long v10 = v26;
  *(_OWORD *)(a1 + 176) = v25;
  *(_OWORD *)(a1 + 192) = v10;
  long long v11 = v20;
  *(_OWORD *)(a1 + 80) = v19;
  *(_OWORD *)(a1 + 96) = v11;
  long long v12 = v22;
  *(_OWORD *)(a1 + 112) = v21;
  *(_OWORD *)(a1 + 128) = v12;
  long long v13 = v16[1];
  *(_OWORD *)(a1 + 16) = v16[0];
  *(_OWORD *)(a1 + 32) = v13;
  double result = *(double *)&v17;
  long long v15 = v18;
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_D4310@<X0>(uint64_t *a1@<X8>)
{
  return sub_D4324(&qword_1230B8, a1);
}

uint64_t sub_D4324@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  sub_10C7C(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_D4374()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SystemImageView(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_D43B4()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for SystemImageView(0) + 24));
}

__n128 sub_D43D8@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_E6F30();
  uint64_t v5 = v4;
  sub_D4464(v1, (uint64_t)v13);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  long long v6 = v13[13];
  *(_OWORD *)(a1 + 208) = v13[12];
  *(_OWORD *)(a1 + 224) = v6;
  *(void *)(a1 + 240) = v14;
  long long v7 = v13[9];
  *(_OWORD *)(a1 + 144) = v13[8];
  *(_OWORD *)(a1 + 160) = v7;
  long long v8 = v13[11];
  *(_OWORD *)(a1 + 176) = v13[10];
  *(_OWORD *)(a1 + 192) = v8;
  long long v9 = v13[5];
  *(_OWORD *)(a1 + 80) = v13[4];
  *(_OWORD *)(a1 + 96) = v9;
  long long v10 = v13[7];
  *(_OWORD *)(a1 + 112) = v13[6];
  *(_OWORD *)(a1 + 128) = v10;
  long long v11 = v13[1];
  *(_OWORD *)(a1 + 16) = v13[0];
  *(_OWORD *)(a1 + 32) = v11;
  __n128 result = (__n128)v13[3];
  *(_OWORD *)(a1 + 48) = v13[2];
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t sub_D4464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10C7C(&qword_125218);
  __chkstk_darwin(v4 - 8);
  long long v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = *(int *)(type metadata accessor for SystemImageView(0) + 24);
  if (*(unsigned char *)(a1 + v53) == 1) {
    uint64_t v7 = sub_E6B10();
  }
  else {
    uint64_t v7 = sub_E6B80();
  }
  uint64_t v60 = v7;
  sub_E6280();
  double v8 = v98;
  unsigned int v9 = v99;
  unsigned int v57 = v100;
  uint64_t v10 = v101;
  uint64_t v61 = v102;
  uint64_t v11 = v103;
  uint64_t v12 = sub_E6F30();
  uint64_t v58 = v13;
  uint64_t v59 = v12;
  if (qword_12AA80 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v14 = v106;
  uint64_t v56 = v108;
  uint64_t v54 = v104;
  uint64_t v55 = v109;
  unsigned __int8 v95 = v105;
  unsigned __int8 v93 = v107;
  uint64_t v15 = sub_D835C();
  uint64_t v16 = qword_12AAA0;
  uint64_t v52 = v15;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  sub_E6F30();
  sub_E62A0();
  uint64_t v51 = v110;
  int v50 = v111;
  uint64_t v49 = v112;
  int v48 = v113;
  uint64_t v46 = v115;
  uint64_t v47 = v114;
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_E6C70();
  if (qword_12AA90 != -1) {
    swift_once();
  }
  sub_E6800();
  uint64_t v17 = sub_E67D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  uint64_t v44 = sub_E6810();
  sub_DA1DC((uint64_t)v6, &qword_125218);
  uint64_t KeyPath = swift_getKeyPath();
  if (*(unsigned char *)(a1 + v53) == 1) {
    uint64_t v18 = sub_E6B10();
  }
  else {
    uint64_t v18 = sub_E6C00();
  }
  uint64_t v53 = v18;
  uint64_t v19 = swift_getKeyPath();
  int v41 = v95;
  int v42 = v93;
  *(double *)&long long v62 = v8 * 0.5;
  *((double *)&v62 + 1) = v8;
  unsigned int v20 = v57;
  *(void *)&long long v63 = __PAIR64__(v57, v9);
  *((void *)&v63 + 1) = v10;
  *(void *)&long long v64 = v61;
  *((void *)&v64 + 1) = v11;
  unsigned int v40 = v9;
  uint64_t v22 = v59;
  uint64_t v21 = v60;
  *(void *)&long long v65 = v60;
  WORD4(v65) = 256;
  *(_DWORD *)((char *)&v65 + 10) = v96;
  HIWORD(v65) = v97;
  uint64_t v23 = v58;
  *(void *)&long long v66 = v59;
  *((void *)&v66 + 1) = v58;
  uint64_t v24 = v54;
  *(void *)&long long v67 = v54;
  BYTE8(v67) = v95;
  *(_DWORD *)((char *)&v67 + 9) = *(_DWORD *)v94;
  HIDWORD(v67) = *(_DWORD *)&v94[3];
  *(void *)&long long v68 = v14;
  BYTE8(v68) = v93;
  *(_DWORD *)((char *)&v68 + 9) = *(_DWORD *)v92;
  HIDWORD(v68) = *(_DWORD *)&v92[3];
  uint64_t v25 = v56;
  uint64_t v39 = v14;
  uint64_t v26 = v55;
  *(void *)&long long v69 = v56;
  *((void *)&v69 + 1) = v55;
  long long v27 = v62;
  long long v28 = v63;
  long long v29 = v65;
  *(_OWORD *)(a2 + 32) = v64;
  *(_OWORD *)(a2 + 48) = v29;
  *(_OWORD *)a2 = v27;
  *(_OWORD *)(a2 + 16) = v28;
  long long v30 = v66;
  long long v31 = v67;
  long long v32 = v69;
  *(_OWORD *)(a2 + 96) = v68;
  *(_OWORD *)(a2 + 112) = v32;
  *(_OWORD *)(a2 + 64) = v30;
  *(_OWORD *)(a2 + 80) = v31;
  char v33 = v50;
  char v71 = v50;
  char v34 = v48;
  char v70 = v48;
  *(void *)(a2 + 128) = v52;
  *(_WORD *)(a2 + 136) = 256;
  *(void *)(a2 + 144) = v51;
  *(unsigned char *)(a2 + 152) = v33;
  *(void *)(a2 + 160) = v49;
  *(unsigned char *)(a2 + 168) = v34;
  uint64_t v35 = v46;
  *(void *)(a2 + 176) = v47;
  *(void *)(a2 + 184) = v35;
  uint64_t v36 = KeyPath;
  *(void *)(a2 + 192) = v45;
  *(void *)(a2 + 200) = v36;
  *(void *)(a2 + 208) = v44;
  *(void *)(a2 + 216) = v19;
  *(void *)(a2 + 224) = v53;
  sub_D8560((uint64_t)&v62);
  v72[0] = v8 * 0.5;
  v72[1] = v8;
  unsigned int v73 = v40;
  unsigned int v74 = v20;
  uint64_t v75 = v10;
  uint64_t v76 = v61;
  uint64_t v77 = v11;
  uint64_t v78 = v21;
  __int16 v79 = 256;
  int v80 = v96;
  __int16 v81 = v97;
  uint64_t v82 = v22;
  uint64_t v83 = v23;
  uint64_t v84 = v24;
  char v85 = v41;
  *(_DWORD *)&v86[3] = *(_DWORD *)&v94[3];
  *(_DWORD *)long long v86 = *(_DWORD *)v94;
  uint64_t v87 = v39;
  char v88 = v42;
  *(_DWORD *)char v89 = *(_DWORD *)v92;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v92[3];
  uint64_t v90 = v25;
  uint64_t v91 = v26;
  return sub_D8598((uint64_t)v72);
}

uint64_t *sub_D497C()
{
  if (qword_12AAC0 != -1) {
    swift_once();
  }
  return &qword_12B720;
}

uint64_t *sub_D49C8()
{
  if (qword_12AAB8 != -1) {
    swift_once();
  }
  return &qword_12B718;
}

uint64_t *sub_D4A14()
{
  if (qword_12AAC8 != -1) {
    swift_once();
  }
  return &qword_12B728;
}

__n128 sub_D4A68@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_E6F30();
  uint64_t v5 = v4;
  sub_D4464(v1, (uint64_t)v13);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  long long v6 = v13[13];
  *(_OWORD *)(a1 + 208) = v13[12];
  *(_OWORD *)(a1 + 224) = v6;
  *(void *)(a1 + 240) = v14;
  long long v7 = v13[9];
  *(_OWORD *)(a1 + 144) = v13[8];
  *(_OWORD *)(a1 + 160) = v7;
  long long v8 = v13[11];
  *(_OWORD *)(a1 + 176) = v13[10];
  *(_OWORD *)(a1 + 192) = v8;
  long long v9 = v13[5];
  *(_OWORD *)(a1 + 80) = v13[4];
  *(_OWORD *)(a1 + 96) = v9;
  long long v10 = v13[7];
  *(_OWORD *)(a1 + 112) = v13[6];
  *(_OWORD *)(a1 + 128) = v10;
  long long v11 = v13[1];
  *(_OWORD *)(a1 + 16) = v13[0];
  *(_OWORD *)(a1 + 32) = v11;
  __n128 result = (__n128)v13[3];
  *(_OWORD *)(a1 + 48) = v13[2];
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t sub_D4AF4()
{
  uint64_t result = sub_E6AF0();
  qword_12B718 = result;
  return result;
}

uint64_t sub_D4B28()
{
  return sub_D4CBC(&qword_12AAB8);
}

uint64_t sub_D4B4C()
{
  uint64_t v0 = sub_E6AD0();
  __chkstk_darwin(v0);
  (*(void (**)(char *, void))(v2 + 104))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t result = sub_E6C10();
  qword_12B720 = result;
  return result;
}

uint64_t sub_D4C34()
{
  return sub_D4CBC(&qword_12AAC0);
}

uint64_t sub_D4C58()
{
  id v0 = [self systemGray5Color];
  uint64_t result = sub_E6AC0();
  qword_12B728 = result;
  return result;
}

uint64_t sub_D4C98()
{
  return sub_D4CBC(&qword_12AAC8);
}

uint64_t sub_D4CBC(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

unint64_t sub_D4D08()
{
  sub_10C7C(&qword_125840);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_F00E0;
  *(void *)(inited + 32) = 0x65546D6574737973;
  *(void *)(inited + 40) = 0xEF726F6C6F436C61;
  *(void *)(inited + 48) = sub_E6B50();
  *(void *)(inited + 56) = 0x6C426D6574737973;
  *(void *)(inited + 64) = 0xEF726F6C6F436575;
  *(void *)(inited + 72) = sub_E6B10();
  *(void *)(inited + 80) = 0x72476D6574737973;
  *(void *)(inited + 88) = 0xEF726F6C6F437961;
  *(void *)(inited + 96) = sub_E6B20();
  *(void *)(inited + 104) = 0xD000000000000010;
  *(void *)(inited + 112) = 0x80000000000F3D30;
  *(void *)(inited + 120) = sub_E6B90();
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x80000000000F3D50;
  *(void *)(inited + 144) = sub_E6BC0();
  *(void *)(inited + 152) = 0xD000000000000011;
  *(void *)(inited + 160) = 0x80000000000F3D70;
  *(void *)(inited + 168) = sub_E6BB0();
  strcpy((char *)(inited + 176), "systemRedColor");
  *(unsigned char *)(inited + 191) = -18;
  *(void *)(inited + 192) = sub_E6B00();
  *(void *)(inited + 200) = 0x69506D6574737973;
  *(void *)(inited + 208) = 0xEF726F6C6F436B6ELL;
  *(void *)(inited + 216) = sub_E6B40();
  *(void *)(inited + 224) = 0xD000000000000011;
  *(void *)(inited + 232) = 0x80000000000F3D90;
  *(void *)(inited + 240) = sub_E6BD0();
  *(void *)(inited + 248) = 0xD000000000000010;
  *(void *)(inited + 256) = 0x80000000000F3DB0;
  *(void *)(inited + 264) = sub_E6B70();
  unint64_t result = sub_D4ECC(inited);
  qword_12AAD8 = result;
  return result;
}

unint64_t sub_D4ECC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10C7C(&qword_125848);
  uint64_t v2 = (void *)sub_E75A0();
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
    swift_retain();
    unint64_t result = sub_21CB8(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
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

uint64_t sub_D4FE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_E6490();
  *a1 = result;
  return result;
}

uint64_t sub_D5014()
{
  return sub_E64A0();
}

uint64_t sub_D503C(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_D8148((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_D767C(v5);
  *a1 = v2;
  return result;
}

void *sub_D50A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10C7C(&qword_123488);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size_19(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_D815C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_D85D4();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

unint64_t sub_D5190()
{
  unint64_t result = qword_125690;
  if (!qword_125690)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_125690);
  }
  return result;
}

BOOL sub_D51D0(uint64_t *a1)
{
  return sub_D8DE4(a1);
}

uint64_t type metadata accessor for SystemImageView(uint64_t a1)
{
  return sub_D520C(a1, qword_12AD80);
}

uint64_t sub_D520C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_D5248()
{
  unint64_t result = qword_125698;
  if (!qword_125698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125698);
  }
  return result;
}

uint64_t sub_D529C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D52B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_D52D4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for ActivitySource()
{
  return &type metadata for ActivitySource;
}

uint64_t getEnumTagSinglePayload for PantheonStruct(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PantheonStruct(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xD546CLL);
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

ValueMetadata *type metadata accessor for PantheonStruct()
{
  return &type metadata for PantheonStruct;
}

ValueMetadata *type metadata accessor for MacParity()
{
  return &type metadata for MacParity;
}

void *initializeBufferWithCopyOfBuffer for ActivityEditView(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E6250();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    long long v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *long long v10 = *v11;
    v10[1] = v12;
    uint64_t v42 = v11[3];
    v10[2] = v11[2];
    v10[3] = v42;
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (void *)((char *)a1 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = v16[3];
    v15[2] = v16[2];
    v15[3] = v18;
    uint64_t v19 = (void *)((char *)a1 + v14);
    unsigned int v20 = (void *)((char *)a2 + v14);
    uint64_t v44 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v44;
    uint64_t v45 = v20[3];
    v19[2] = v20[2];
    v19[3] = v45;
    uint64_t v21 = a3[9];
    uint64_t v22 = a3[10];
    uint64_t v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    void v23[2] = v24[2];
    *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
    uint64_t v26 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    long long v27 = (void *)((char *)a1 + v26);
    long long v28 = (void *)((char *)a2 + v26);
    uint64_t v43 = v28[1];
    *long long v27 = *v28;
    v27[1] = v43;
    uint64_t v29 = a3[13];
    uint64_t v30 = a3[14];
    long long v31 = (void *)((char *)a1 + v29);
    long long v32 = (void *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    *long long v31 = *v32;
    v31[1] = v33;
    char v34 = (void *)((char *)a1 + v30);
    int v41 = (void *)((char *)a2 + v30);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_10C7C(&qword_123F10);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    void *v34 = *v41;
    if (EnumCaseMultiPayload == 1)
    {
      v34[1] = v41[1];
      swift_retain();
      swift_retain();
      uint64_t v36 = *(int *)(sub_10C7C(&qword_123F58) + 32);
      uint64_t v37 = (char *)v34 + v36;
      uint64_t v38 = (char *)v41 + v36;
      uint64_t v39 = sub_E63A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  }
  return a1;
}

uint64_t destroy for ActivityEditView(uint64_t a1, uint64_t a2)
{
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 56);
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v5 + *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v9 = sub_E63A0();
    long long v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  return result;
}

void *initializeWithCopy for ActivityEditView(void *a1, void *a2, int *a3)
{
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E6250();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v40 = v9[3];
  void v8[2] = v9[2];
  v8[3] = v40;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)((char *)a1 + v11);
  uint64_t v14 = (void *)((char *)a2 + v11);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = v14[3];
  v13[2] = v14[2];
  v13[3] = v16;
  uint64_t v17 = (void *)((char *)a1 + v12);
  uint64_t v18 = (void *)((char *)a2 + v12);
  uint64_t v42 = v18[1];
  void *v17 = *v18;
  v17[1] = v42;
  uint64_t v43 = v18[3];
  v17[2] = v18[2];
  v17[3] = v43;
  uint64_t v19 = a3[9];
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)((char *)a1 + v19);
  uint64_t v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  _OWORD v21[2] = v22[2];
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  uint64_t v24 = a3[12];
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  uint64_t v41 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v41;
  uint64_t v27 = a3[13];
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)((char *)a1 + v27);
  uint64_t v30 = (void *)((char *)a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  uint64_t v39 = (void *)((char *)a1 + v28);
  long long v32 = (void *)((char *)a2 + v28);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *uint64_t v39 = *v32;
  if (EnumCaseMultiPayload == 1)
  {
    v39[1] = v32[1];
    swift_retain();
    swift_retain();
    uint64_t v34 = *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v35 = (char *)v39 + v34;
    uint64_t v36 = (char *)v32 + v34;
    uint64_t v37 = sub_E63A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  return a1;
}

void *assignWithCopy for ActivityEditView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_DA1DC((uint64_t)a1, &qword_1230B8);
    sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_E6250();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  void v8[2] = v9[2];
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  v11[1] = v12[1];
  swift_retain();
  swift_release();
  void v11[2] = v12[2];
  _OWORD v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  v14[2] = v15[2];
  v14[3] = v15[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (char *)a2 + v16;
  void *v17 = *(void *)((char *)a2 + v16);
  v17[1] = *(void *)((char *)a2 + v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17[2] = *((void *)v18 + 2);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v27 = a3[14];
    uint64_t v28 = (void *)((char *)a1 + v27);
    uint64_t v29 = (void *)((char *)a2 + v27);
    sub_DA1DC((uint64_t)a1 + v27, &qword_123F10);
    sub_10C7C(&qword_123F10);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v28 = *v29;
    if (EnumCaseMultiPayload == 1)
    {
      v28[1] = v29[1];
      swift_retain();
      swift_retain();
      uint64_t v31 = *(int *)(sub_10C7C(&qword_123F58) + 32);
      long long v32 = (char *)v28 + v31;
      uint64_t v33 = (char *)v29 + v31;
      uint64_t v34 = sub_E63A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  return a1;
}

char *initializeWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_E6250();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  uint64_t v17 = &a1[v13];
  uint64_t v18 = &a2[v13];
  long long v19 = *((_OWORD *)v18 + 1);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v19;
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = &a1[v20];
  uint64_t v23 = &a2[v20];
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *((void *)v22 + 2) = *((void *)v23 + 2);
  *(void *)&a1[v21] = *(void *)&a2[v21];
  uint64_t v24 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  *(_OWORD *)&a1[v24] = *(_OWORD *)&a2[v24];
  uint64_t v25 = a3[14];
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  uint64_t v28 = sub_10C7C(&qword_123F10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = *((void *)v27 + 1);
    *(void *)uint64_t v26 = *(void *)v27;
    *((void *)v26 + 1) = v29;
    uint64_t v30 = *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v31 = &v26[v30];
    long long v32 = &v27[v30];
    uint64_t v33 = sub_E63A0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  a1[a3[15]] = a2[a3[15]];
  return a1;
}

char *assignWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_DA1DC((uint64_t)a1, &qword_1230B8);
    uint64_t v6 = sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E6250();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  swift_release();
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release();
  uint64_t v15 = *((void *)v14 + 3);
  *((void *)v13 + 2) = *((void *)v14 + 2);
  *((void *)v13 + 3) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = *((void *)v18 + 3);
  *((void *)v17 + 2) = *((void *)v18 + 2);
  *((void *)v17 + 3) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = *(void *)&a2[v20 + 8];
  *(void *)uint64_t v21 = *(void *)&a2[v20];
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  *((void *)v21 + 2) = *((void *)v22 + 2);
  swift_release();
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  swift_release();
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v24 = a3[14];
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    sub_DA1DC((uint64_t)&a1[v24], &qword_123F10);
    uint64_t v27 = sub_10C7C(&qword_123F10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v28;
      uint64_t v29 = *(int *)(sub_10C7C(&qword_123F58) + 32);
      uint64_t v30 = &v25[v29];
      uint64_t v31 = &v26[v29];
      uint64_t v32 = sub_E63A0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
    }
  }
  a1[a3[15]] = a2[a3[15]];
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityEditView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D65C4);
}

uint64_t sub_D65C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10C7C(&qword_123130);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_10C7C(&qword_123700);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 56);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityEditView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D6710);
}

uint64_t sub_D6710(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10C7C(&qword_123130);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_10C7C(&qword_123700);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 56);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_D6848()
{
  sub_394EC();
  if (v0 <= 0x3F)
  {
    sub_75B54();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for ActivityEditView.Use(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ActivityEditView.Use(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xD6AACLL);
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

uint64_t sub_D6AD4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_D6AE0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityEditView.Use()
{
  return &type metadata for ActivityEditView.Use;
}

uint64_t destroy for SystemColorView()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25GameControlleriOSSettings15SystemColorViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SystemColorView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for SystemColorView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SystemColorView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemColorView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemColorView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemColorView()
{
  return &type metadata for SystemColorView;
}

void *sub_D6C88(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E6250();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_D6DB8(uint64_t a1)
{
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

void *sub_D6E5C(void *a1, void *a2, uint64_t a3)
{
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_E6250();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_D6F3C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_DA1DC((uint64_t)a1, &qword_1230B8);
    sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_E6250();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

char *sub_D704C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_E6250();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  a1[v8] = a2[v8];
  return a1;
}

char *sub_D7128(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_DA1DC((uint64_t)a1, &qword_1230B8);
    uint64_t v6 = sub_10C7C(&qword_1230B8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_E6250();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_D7230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_D7244);
}

uint64_t sub_D7244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10C7C(&qword_123130);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_D730C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_D7320);
}

uint64_t sub_D7320(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10C7C(&qword_123130);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_D73E4()
{
  sub_394EC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_D7484()
{
  return sub_D9304(&qword_1257D0, &qword_1257D8, (void (*)(void))sub_D74D4);
}

unint64_t sub_D74D4()
{
  unint64_t result = qword_1257E0;
  if (!qword_1257E0)
  {
    sub_11B60(&qword_1257E8);
    sub_D9E28(&qword_1257F0, &qword_1257F8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1257E0);
  }
  return result;
}

uint64_t sub_D758C()
{
  return sub_D9E28(&qword_125800, &qword_125808);
}

uint64_t sub_D75C8()
{
  return sub_D9E28(&qword_125810, &qword_125818);
}

uint64_t sub_D7604()
{
  return sub_D9E28(&qword_125820, &qword_125828);
}

uint64_t sub_D7640()
{
  return sub_D9E28(&qword_125830, &qword_125838);
}

uint64_t sub_D767C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = sub_E75F0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_D7D24(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_151;
  }
  uint64_t v101 = result;
  double v98 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = _swiftEmptyArrayStorage;
    uint64_t v104 = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = (char *)_swiftEmptyArrayStorage;
LABEL_117:
      uint64_t result = (uint64_t)v10;
      unsigned int v100 = v7;
      if (v11 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v91) {
            goto LABEL_159;
          }
          uint64_t v93 = result;
          uint64_t v94 = *(void *)(result + 32 + 16 * v92);
          uint64_t v95 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_D7DF4((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_21CA4(v93);
            uint64_t v93 = result;
          }
          if (v92 >= *(void *)(v93 + 16)) {
            goto LABEL_148;
          }
          int v96 = (void *)(v93 + 32 + 16 * v92);
          *int v96 = v94;
          v96[1] = v95;
          unint64_t v97 = *(void *)(v93 + 16);
          if (v11 > v97) {
            goto LABEL_149;
          }
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          uint64_t result = v93;
          *(void *)(v93 + 16) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      v100[2] = 0;
      return swift_bridgeObjectRelease();
    }
    unsigned int v100 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_E7250();
    *(void *)(result + 16) = v6;
    unsigned int v100 = (void *)result;
    uint64_t v104 = (char *)(result + 32);
  }
  Swift::Int v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v99 = v9 + 8;
  unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v102 = v3;
  while (1)
  {
    Swift::Int v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    uint64_t v13 = (uint64_t *)(v9 + 16 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    uint64_t v15 = (void *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      Swift::Int v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_E7620();
      int v17 = result;
      Swift::Int v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v99 + 16 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_E7620();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 2;
      Swift::Int v20 = v18 + 1;
      Swift::Int v8 = v18;
      Swift::Int v18 = v20;
    }
    while (v20 < v3);
    Swift::Int v18 = v20;
LABEL_36:
    Swift::Int v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 16 * v18;
        uint64_t v24 = 16 * v12;
        Swift::Int v25 = v18;
        Swift::Int v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = v9 + v23;
            uint64_t v28 = *(void *)(v9 + v24);
            uint64_t v29 = *(void *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(void *)(v27 - 16) = v28;
            *(void *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      Swift::Int v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v101) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_21BA8(0, *((void *)v10 + 2) + 1, 1, v10);
      unint64_t v10 = (char *)result;
    }
    unint64_t v38 = *((void *)v10 + 2);
    unint64_t v37 = *((void *)v10 + 3);
    unint64_t v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      uint64_t result = (uint64_t)sub_21BA8((char *)(v37 > 1), v38 + 1, 1, v10);
      unint64_t v10 = (char *)result;
    }
    *((void *)v10 + 2) = v11;
    uint64_t v39 = v10 + 32;
    uint64_t v40 = &v10[16 * v38 + 32];
    *(void *)uint64_t v40 = v12;
    *((void *)v40 + 1) = v8;
    if (v38)
    {
      Swift::Int v103 = v8;
      while (1)
      {
        unint64_t v41 = v11 - 1;
        if (v11 >= 4)
        {
          uint64_t v46 = &v39[2 * v11];
          uint64_t v47 = *(v46 - 8);
          uint64_t v48 = *(v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_134;
          }
          uint64_t v51 = *(v46 - 6);
          uint64_t v50 = *(v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_135;
          }
          unint64_t v53 = v11 - 2;
          uint64_t v54 = &v39[2 * v11 - 4];
          uint64_t v56 = *v54;
          uint64_t v55 = v54[1];
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_136;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_138;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = &v39[2 * v41];
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_144;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v70 = *((void *)v10 + 4);
            uint64_t v71 = *((void *)v10 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_98;
          }
          uint64_t v43 = *((void *)v10 + 4);
          uint64_t v42 = *((void *)v10 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_137;
        }
        unint64_t v53 = v11 - 2;
        uint64_t v59 = &v39[2 * v11 - 4];
        uint64_t v61 = *v59;
        uint64_t v60 = v59[1];
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_139;
        }
        long long v65 = &v39[2 * v41];
        uint64_t v67 = *v65;
        uint64_t v66 = v65[1];
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_141;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_143;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_104:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v64) {
          goto LABEL_140;
        }
        long long v72 = &v39[2 * v41];
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_142;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v81 = v9;
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v82 = v10;
        uint64_t v83 = &v39[2 * v80];
        uint64_t v84 = *v83;
        char v85 = v39;
        unint64_t v86 = v41;
        uint64_t v87 = &v39[2 * v41];
        uint64_t v88 = v87[1];
        uint64_t v89 = v81;
        uint64_t result = sub_D7DF4((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1) {
          goto LABEL_114;
        }
        if (v88 < v84) {
          goto LABEL_131;
        }
        if (v86 > *((void *)v82 + 2)) {
          goto LABEL_132;
        }
        *uint64_t v83 = v84;
        v85[2 * v80 + 1] = v88;
        unint64_t v90 = *((void *)v82 + 2);
        if (v86 >= v90) {
          goto LABEL_133;
        }
        unint64_t v10 = v82;
        unint64_t v11 = v90 - 1;
        uint64_t result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        uint64_t v39 = v85;
        *((void *)v82 + 2) = v90 - 1;
        uint64_t v9 = v89;
        Swift::Int v8 = v103;
        if (v90 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    Swift::Int v3 = v102;
    if (v8 >= v102)
    {
      uint64_t v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101)) {
    goto LABEL_153;
  }
  if (v12 + v101 >= v3) {
    Swift::Int v30 = v3;
  }
  else {
    Swift::Int v30 = v12 + v101;
  }
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      uint64_t v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        uint64_t v32 = (uint64_t *)(v9 + 16 * v8);
        uint64_t result = *v32;
        uint64_t v33 = v32[1];
        Swift::Int v34 = v12;
        uint64_t v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1)) {
            break;
          }
          uint64_t result = sub_E7620();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *v35;
          uint64_t v33 = v35[1];
          *(_OWORD *)uint64_t v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      Swift::Int v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_D7D24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    Swift::Int v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_E7620(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)Swift::Int v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_D7DF4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 15;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    uint64_t v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_48;
    }
    int v17 = (char *)(a3 - 16);
    while (1)
    {
      Swift::Int v18 = v17 + 16;
      uint64_t v19 = v6 - 16;
      BOOL v20 = *((void *)v14 - 2) == *((void *)v6 - 2) && *((void *)v14 - 1) == *((void *)v6 - 1);
      if (v20 || (sub_E7620() & 1) == 0)
      {
        uint64_t v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)int v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        BOOL v21 = v17 >= v14;
        v14 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        BOOL v21 = v17 >= v6;
        v6 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  uint64_t v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_E7620() & 1) == 0) {
        break;
      }
      uint64_t v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 16;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    uint64_t v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 16;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0]) {
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  }
  return 1;
}

char *sub_D8024(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_D8044(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_D8044(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10C7C(&qword_123488);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size_19(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_D8148(uint64_t a1)
{
  return sub_D8044(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_D815C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    BOOL v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_D835C()
{
  uint64_t v1 = sub_E6250();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v12 - v6;
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for SystemImageView(0) + 24)) == 1)
  {
    sub_3487C((uint64_t)v7);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for ColorScheme.dark(_:), v1);
    char v8 = sub_E6240();
    unint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
    v9(v5, v1);
    v9(v7, v1);
    if (v8)
    {
      if (qword_12AAC0 != -1) {
        swift_once();
      }
      uint64_t v10 = &qword_12B720;
    }
    else
    {
      if (qword_12AAB8 != -1) {
        swift_once();
      }
      uint64_t v10 = &qword_12B718;
    }
  }
  else
  {
    if (qword_12AAC8 != -1) {
      swift_once();
    }
    uint64_t v10 = &qword_12B728;
  }
  return *v10;
}

uint64_t sub_D8560(uint64_t a1)
{
  return a1;
}

uint64_t sub_D8598(uint64_t a1)
{
  return a1;
}

uint64_t sub_D85D4()
{
  return swift_release();
}

uint64_t sub_D85DC@<X0>(uint64_t a1@<X8>)
{
  return sub_CE0BC(a1);
}

uint64_t sub_D8600()
{
  return sub_D8628(&qword_1258E0, &qword_1258A8, (void (*)(void))sub_D86A8);
}

uint64_t sub_D8628(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_D86A8()
{
  unint64_t result = qword_1258E8;
  if (!qword_1258E8)
  {
    sub_11B60(&qword_1258A0);
    sub_D8748();
    sub_D9E28(&qword_125930, &qword_125938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1258E8);
  }
  return result;
}

unint64_t sub_D8748()
{
  unint64_t result = qword_1258F0;
  if (!qword_1258F0)
  {
    sub_11B60(&qword_125898);
    sub_11B60(&qword_125888);
    sub_11B60(&qword_1258F8);
    sub_D88A0();
    sub_11B60(&qword_125910);
    sub_D9E28(&qword_125918, &qword_125910);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_D9E28(&qword_125920, &qword_125928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1258F0);
  }
  return result;
}

unint64_t sub_D88A0()
{
  unint64_t result = qword_125900;
  if (!qword_125900)
  {
    sub_11B60(&qword_125888);
    sub_D9E28(&qword_125908, &qword_125880);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125900);
  }
  return result;
}

uint64_t sub_D8940(uint64_t a1)
{
  return a1;
}

uint64_t sub_D8994(uint64_t a1)
{
  return a1;
}

uint64_t sub_D89E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_D8A40(uint64_t a1)
{
  return a1;
}

uint64_t sub_D8A98()
{
  return sub_CEF78(*(void *)(v0 + 16));
}

uint64_t sub_D8AA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_D8B08(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_D8B68@<X0>(uint64_t a1@<X8>)
{
  return sub_CF11C(*(void *)(v1 + 16), a1);
}

uint64_t sub_D8B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActivityEditView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_D8BD8()
{
  return sub_CF57C();
}

uint64_t sub_D8C34()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_D8C44(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_D8C5C()
{
  return sub_D32AC(*(void *)(v0 + 16));
}

unint64_t sub_D8C64()
{
  unint64_t result = qword_125998;
  if (!qword_125998)
  {
    sub_11B60(&qword_125990);
    sub_11B60(&qword_1259A0);
    sub_E66A0();
    sub_D9E28(&qword_1259A8, &qword_1259A0);
    sub_D8D80((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125998);
  }
  return result;
}

uint64_t sub_D8D80(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL sub_D8DC8(uint64_t *a1)
{
  return sub_D8DE4(a1);
}

BOOL sub_D8DE4(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = type metadata accessor for ActivityEditView(0);
  return (sub_D3A24(v3, v4, *(void *)(v2 + *(int *)(v5 + 40))) & 1) == 0;
}

uint64_t sub_D8E40()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 56);
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v9 = sub_E63A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_D908C(uint64_t a1)
{
  return sub_D94E0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_D3644);
}

void sub_D90A8()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(v0
                             + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
                             + *(int *)(v1 + 52)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_10C7C(&qword_122A98);
    sub_E6DF0();
  }
  id v2 = [self sharedApplication];
  [v2 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];
}

uint64_t sub_D91F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  type metadata accessor for ActivityEditView(0);
  swift_bridgeObjectRetain();
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  if (v8 == v3 && v9 == v4) {
    char v5 = 1;
  }
  else {
    char v5 = sub_E7620();
  }
  swift_bridgeObjectRelease();
  *a1 = swift_getKeyPath();
  sub_10C7C(&qword_1230B8);
  swift_storeEnumTagMultiPayload();
  uint64_t result = type metadata accessor for SystemImageView(0);
  uint64_t v7 = (uint64_t *)((char *)a1 + *(int *)(result + 20));
  *uint64_t v7 = v3;
  v7[1] = v4;
  *((unsigned char *)a1 + *(int *)(result + 24)) = v5 & 1;
  return result;
}

uint64_t sub_D92FC@<X0>(uint64_t a1@<X8>)
{
  return sub_D20E0(*(void *)(v1 + 16), a1);
}

uint64_t sub_D9304(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_D9370()
{
  unint64_t result = qword_1259E8;
  if (!qword_1259E8)
  {
    sub_11B60(&qword_1259F0);
    sub_11B60(&qword_1259F8);
    sub_E66A0();
    sub_D9E28(&qword_125A00, &qword_1259F8);
    sub_D8D80((unint64_t *)&qword_1228C8, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_D8D80(&qword_123128, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1259E8);
  }
  return result;
}

uint64_t sub_D94C8(uint64_t a1)
{
  return sub_D94E0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_D2460);
}

uint64_t sub_D94E0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

uint64_t sub_D9578()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 56);
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v9 = sub_E63A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

void sub_D97E4()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(v0
                             + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))
                             + *(int *)(v1 + 52)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_10C7C(&qword_122A98);
    sub_E6DF0();
  }
  id v2 = [self sharedApplication];
  [v2 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];
}

uint64_t sub_D992C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  type metadata accessor for ActivityEditView(0);
  swift_bridgeObjectRetain();
  sub_10C7C(&qword_122A98);
  sub_E6DE0();
  if (v7 == v3 && v8 == v4) {
    char v5 = 1;
  }
  else {
    char v5 = sub_E7620();
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  return result;
}

unint64_t sub_D99F8()
{
  unint64_t result = qword_125A18;
  if (!qword_125A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125A18);
  }
  return result;
}

uint64_t sub_D9A4C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_18804(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_D9A9C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_18814(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_D9AF0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_D14C4(v4, a1);
}

uint64_t sub_D9B64()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 56);
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v9 = sub_E63A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_D9DB8(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_D15F8(a1, v4);
}

uint64_t sub_D9E28(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_D9E6C()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_10C7C(&qword_1230B8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_E6250();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 56);
  sub_10C7C(&qword_123F10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(sub_10C7C(&qword_123F58) + 32);
    uint64_t v9 = sub_E63A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_DA0B8()
{
  type metadata accessor for ActivityEditView(0);
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t result = sub_E7180();
  if (result > v1)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_10C7C(&qword_122A98);
    uint64_t v3 = sub_E6DE0();
    sub_D18D0(v3);
    swift_bridgeObjectRelease();
    sub_E6DF0();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_DA1DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_DA238(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_DA29C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_DA30C()
{
  uint64_t v1 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v0 + 552))(v6);
  void *v2 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  v1(v6, 0);
  uint64_t v3 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v0 + 744))(v6);
  *uint64_t v4 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  return v3(v6, 0);
}

uint64_t sub_DA3F8(uint64_t a1, unint64_t *a2)
{
  swift_retain();
  sub_E71F0();
  if (*(void *)((char *)&dword_10 + (*a2 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (*a2 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_E7240();
  sub_E7260();
  sub_E7230();

  return sub_DC1A4(a2);
}

unint64_t sub_DA480(uint64_t a1, unint64_t *a2)
{
  unint64_t result = sub_C0C80(a1, *a2);
  if ((v4 & 1) == 0)
  {
    sub_DA4D8(result);
    swift_release();
    return sub_DC1A4(a2);
  }
  return result;
}

uint64_t sub_DA4D8(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_DC0C4(v3);
    unint64_t v3 = result;
    unint64_t *v1 = result;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v5 + 8 * a1;
    uint64_t v9 = *(void *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(void *)(v5 + 16) = v7;
    sub_E7230();
    return v9;
  }
  return result;
}

void sub_DA570(uint64_t a1)
{
  uint64_t v2 = v1;
  if (((*(uint64_t (**)(void))(*(void *)a1 + 480))() & 1) != 0
    && ((*(uint64_t (**)(void))(*(void *)a1 + 472))() & 1) != 0)
  {
    uint64_t v4 = (*(uint64_t (**)(unsigned char *))(*v1 + 552))(v49);
LABEL_22:
    uint64_t v40 = (void (*)(unsigned char *, void))v4;
    unint64_t v41 = v5;
    unint64_t v42 = sub_C0C80(a1, *v5);
    if ((v43 & 1) == 0)
    {
      sub_DA4D8(v42);
      swift_release();
      sub_DC1A4(v41);
    }
    v40(v49, 0);
    uint64_t v44 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*v1 + 744))(v49);
    uint64_t v46 = v45;
    unint64_t v47 = sub_C0C80(a1, *v45);
    if ((v48 & 1) == 0)
    {
      sub_DA4D8(v47);
      swift_release();
      sub_DC1A4(v46);
    }
    v44(v49, 0);
    return;
  }
  if ((*(uint64_t (**)(void))(*(void *)a1 + 544))())
  {
    unint64_t v6 = (*(uint64_t (**)(void))(*v1 + 728))();
    unint64_t v7 = (uint64_t (**)(void))(*(void *)a1 + 264);
    uint64_t v8 = *v7;
    uint64_t v9 = (void *)(*v7)();
    BOOL v10 = sub_C09D8(v6, v9);
    swift_bridgeObjectRelease();

    if (v10)
    {
      uint64_t v12 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*v2 + 744))(v49);
      int64_t v14 = v13;
      unint64_t v15 = sub_C0C80(a1, *v13);
      if ((v16 & 1) == 0)
      {
        sub_DA4D8(v15);
        swift_release();
        sub_DC1A4(v14);
      }
      uint64_t v11 = v12(v49, 0);
    }
    unint64_t v17 = (*(uint64_t (**)(uint64_t))(*v2 + 536))(v11);
    unint64_t v18 = (void *)v8();
    BOOL v19 = sub_C09D8(v17, v18);
    swift_bridgeObjectRelease();

    if (!v19)
    {
      uint64_t v20 = (*(uint64_t (**)(unsigned char *))(*v2 + 552))(v49);
LABEL_18:
      unint64_t v38 = (void (*)(unsigned char *, void))v20;
      uint64_t v39 = v21;
      swift_retain();
      sub_E71F0();
      if (*(void *)((char *)&dword_10 + (*v39 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (*v39 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_E7240();
      sub_E7260();
      sub_E7230();
      sub_DC1A4(v39);
      v38(v49, 0);
    }
  }
  else
  {
    char v22 = (*(uint64_t (**)(void))(*(void *)a1 + 552))();
    uint64_t v23 = *v1;
    if ((v22 & 1) == 0)
    {
      uint64_t v4 = (*(uint64_t (**)(unsigned char *))(v23 + 552))(v49);
      goto LABEL_22;
    }
    unint64_t v24 = (*(uint64_t (**)(void))(v23 + 536))();
    Swift::Int v25 = (uint64_t (**)(void))(*(void *)a1 + 264);
    Swift::Int v26 = *v25;
    uint64_t v27 = (void *)(*v25)();
    BOOL v28 = sub_C09D8(v24, v27);
    swift_bridgeObjectRelease();

    if (v28)
    {
      Swift::Int v30 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*v2 + 552))(v49);
      uint64_t v32 = v31;
      unint64_t v33 = sub_C0C80(a1, *v31);
      if ((v34 & 1) == 0)
      {
        sub_DA4D8(v33);
        swift_release();
        sub_DC1A4(v32);
      }
      uint64_t v29 = v30(v49, 0);
    }
    unint64_t v35 = (*(uint64_t (**)(uint64_t))(*v2 + 728))(v29);
    uint64_t v36 = (void *)v26();
    BOOL v37 = sub_C09D8(v35, v36);
    swift_bridgeObjectRelease();

    if (!v37)
    {
      uint64_t v20 = (*(uint64_t (**)(unsigned char *))(*v2 + 744))(v49);
      goto LABEL_18;
    }
  }
}

uint64_t sub_DAB68(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_DC190(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_DACDC(v6);
  return sub_E7520();
}

void *sub_DABE4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10C7C(&qword_124D90);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size_20(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_C1508((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_E7570();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

uint64_t sub_DACDC(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  uint64_t result = sub_E75F0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_168;
    }
    if (v3) {
      return sub_DB85C(0, v3, 1, v2);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_167;
  }
  uint64_t v123 = result;
  uint64_t v118 = v2;
  if (v3 > 1)
  {
    unint64_t v6 = v2;
    uint64_t v7 = v5 >> 1;
    type metadata accessor for Device();
    uint64_t result = sub_E7250();
    *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8)) = v7;
    uint64_t v2 = v6;
    uint64_t v128 = (char *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v135 = result;
LABEL_12:
    Swift::Int v9 = 0;
    uint64_t v10 = *v2;
    uint64_t v119 = *v2 + 16;
    uint64_t v120 = *v2 - 8;
    uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
    Swift::Int v125 = v3;
    uint64_t v129 = *v2;
    while (1)
    {
      Swift::Int v12 = v9;
      Swift::Int v13 = v9 + 1;
      Swift::Int v126 = v9;
      if (v9 + 1 < v3)
      {
        uint64_t v14 = *(void *)(v10 + 8 * v13);
        uint64_t v15 = *(void *)(v10 + 8 * v9);
        char v16 = *(uint64_t (**)(void))(*(void *)v14 + 760);
        swift_retain();
        uint64_t v17 = swift_retain();
        int v18 = ((uint64_t (*)(uint64_t))v16)(v17);
        BOOL v19 = *(uint64_t (**)(void))(*(void *)v15 + 760);
        if ((v18 ^ v19()))
        {
          if (v16())
          {
            int v20 = v19();
            swift_release();
            uint64_t result = swift_release();
            int v133 = v20 ^ 1;
          }
          else
          {
            swift_release();
            uint64_t result = swift_release();
            int v133 = 0;
          }
          Swift::Int v3 = v125;
        }
        else
        {
          uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v14 + 360))();
          uint64_t v23 = v22;
          if (v21 == (*(uint64_t (**)(void))(*(void *)v15 + 360))() && v23 == v24) {
            int v133 = 0;
          }
          else {
            int v133 = sub_E7620();
          }
          Swift::Int v3 = v125;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t result = swift_release();
        }
        Swift::Int v12 = v126;
        Swift::Int v13 = v126 + 2;
        uint64_t v10 = v129;
        if (v126 + 2 < v3)
        {
          uint64_t v121 = v8;
          uint64_t v26 = v119 + 8 * v126;
          while (1)
          {
            Swift::Int v130 = v13;
            uint64_t v28 = *(void *)(v26 - 8);
            uint64_t v27 = *(void *)v26;
            uint64_t v29 = *(uint64_t (**)(void))(**(void **)v26 + 760);
            swift_retain();
            uint64_t v30 = swift_retain();
            int v31 = ((uint64_t (*)(uint64_t))v29)(v30);
            uint64_t v32 = *(unsigned int (**)(void))(*(void *)v28 + 760);
            if (((v31 ^ v32()) & 1) == 0) {
              break;
            }
            if (v29())
            {
              unsigned int v33 = v32();
              swift_release();
              uint64_t result = swift_release();
              int v34 = v33 ^ 1;
              Swift::Int v3 = v125;
              goto LABEL_42;
            }
            swift_release();
            uint64_t result = swift_release();
            Swift::Int v3 = v125;
            uint64_t v10 = v129;
            if (v133)
            {
              uint64_t v8 = v121;
              Swift::Int v12 = v126;
              if (v13 < v126) {
                goto LABEL_169;
              }
              goto LABEL_48;
            }
LABEL_31:
            ++v13;
            v26 += 8;
            if (v3 == v13)
            {
              Swift::Int v13 = v3;
LABEL_45:
              uint64_t v8 = v121;
              Swift::Int v12 = v126;
              goto LABEL_46;
            }
          }
          uint64_t v35 = (*(uint64_t (**)(void))(*(void *)v27 + 360))();
          uint64_t v37 = v36;
          if (v35 == (*(uint64_t (**)(void))(*(void *)v28 + 360))() && v37 == v38) {
            int v34 = 0;
          }
          else {
            int v34 = sub_E7620();
          }
          Swift::Int v13 = v130;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t result = swift_release();
          Swift::Int v3 = v125;
LABEL_42:
          uint64_t v10 = v129;
          if ((v133 ^ v34)) {
            goto LABEL_45;
          }
          goto LABEL_31;
        }
LABEL_46:
        if (v133)
        {
          if (v13 < v12) {
            goto LABEL_169;
          }
LABEL_48:
          if (v12 < v13)
          {
            uint64_t v40 = (uint64_t *)(v120 + 8 * v13);
            Swift::Int v41 = v13;
            Swift::Int v42 = v12;
            char v43 = (uint64_t *)(v10 + 8 * v12);
            do
            {
              if (v42 != --v41)
              {
                if (!v10) {
                  goto LABEL_174;
                }
                uint64_t v44 = *v43;
                *char v43 = *v40;
                *uint64_t v40 = v44;
              }
              ++v42;
              --v40;
              ++v43;
            }
            while (v42 < v41);
          }
        }
      }
      if (v13 >= v3) {
        goto LABEL_82;
      }
      if (__OFSUB__(v13, v12)) {
        goto LABEL_166;
      }
      if (v13 - v12 >= v123) {
        goto LABEL_82;
      }
      if (__OFADD__(v12, v123)) {
        goto LABEL_170;
      }
      if (v12 + v123 >= v3) {
        Swift::Int v45 = v3;
      }
      else {
        Swift::Int v45 = v12 + v123;
      }
      if (v45 < v12)
      {
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
LABEL_175:
        __break(1u);
        return result;
      }
      if (v13 == v45) {
        goto LABEL_82;
      }
      uint64_t v122 = v8;
      uint64_t v46 = (void *)(v120 + 8 * v13);
      Swift::Int v124 = v45;
LABEL_67:
      uint64_t v48 = *(void *)(v10 + 8 * v13);
      uint64_t v127 = v46;
      Swift::Int v131 = v13;
      while (1)
      {
        Swift::Int v134 = v12;
        uint64_t v49 = *v46;
        uint64_t v50 = *(uint64_t (**)(void))(*(void *)v48 + 760);
        swift_retain();
        uint64_t v51 = swift_retain();
        int v52 = ((uint64_t (*)(uint64_t))v50)(v51);
        unint64_t v53 = *(unsigned int (**)(void))(*(void *)v49 + 760);
        if (((v52 ^ v53()) & 1) == 0) {
          break;
        }
        if ((v50() & 1) == 0)
        {
          swift_release();
          uint64_t result = swift_release();
          goto LABEL_65;
        }
        char v54 = v53();
        swift_release();
        uint64_t result = swift_release();
        uint64_t v10 = v129;
        Swift::Int v47 = v131;
        if (v54) {
          goto LABEL_66;
        }
LABEL_77:
        if (!v10) {
          goto LABEL_172;
        }
        uint64_t v61 = *v46;
        uint64_t v48 = v46[1];
        *uint64_t v46 = v48;
        v46[1] = v61;
        --v46;
        Swift::Int v12 = v134 + 1;
        if (v47 == v134 + 1) {
          goto LABEL_66;
        }
      }
      uint64_t v55 = (*(uint64_t (**)(void))(*(void *)v48 + 360))();
      uint64_t v57 = v56;
      if (v55 != (*(uint64_t (**)(void))(*(void *)v49 + 360))() || v57 != v58) {
        break;
      }
      swift_release();
      swift_release();
      uint64_t result = swift_bridgeObjectRelease_n();
LABEL_65:
      uint64_t v10 = v129;
      Swift::Int v47 = v131;
LABEL_66:
      Swift::Int v13 = v47 + 1;
      Swift::Int v12 = v126;
      uint64_t v46 = v127 + 1;
      if (v13 != v124) {
        goto LABEL_67;
      }
      Swift::Int v13 = v124;
      uint64_t v8 = v122;
LABEL_82:
      if (v13 < v12) {
        goto LABEL_161;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_21BA8(0, *((void *)v8 + 2) + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }
      unint64_t v63 = *((void *)v8 + 2);
      unint64_t v62 = *((void *)v8 + 3);
      unint64_t v11 = v63 + 1;
      if (v63 >= v62 >> 1)
      {
        uint64_t result = (uint64_t)sub_21BA8((char *)(v62 > 1), v63 + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }
      *((void *)v8 + 2) = v11;
      char v64 = v8 + 32;
      long long v65 = (Swift::Int *)&v8[16 * v63 + 32];
      *long long v65 = v126;
      v65[1] = v13;
      Swift::Int v132 = v13;
      if (v63)
      {
        while (2)
        {
          unint64_t v66 = v11 - 1;
          if (v11 >= 4)
          {
            uint64_t v71 = &v64[16 * v11];
            uint64_t v72 = *((void *)v71 - 8);
            uint64_t v73 = *((void *)v71 - 7);
            BOOL v77 = __OFSUB__(v73, v72);
            uint64_t v74 = v73 - v72;
            if (v77) {
              goto LABEL_150;
            }
            uint64_t v76 = *((void *)v71 - 6);
            uint64_t v75 = *((void *)v71 - 5);
            BOOL v77 = __OFSUB__(v75, v76);
            uint64_t v69 = v75 - v76;
            char v70 = v77;
            if (v77) {
              goto LABEL_151;
            }
            unint64_t v78 = v11 - 2;
            uint64_t v79 = &v64[16 * v11 - 32];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v77 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v77) {
              goto LABEL_152;
            }
            BOOL v77 = __OFADD__(v69, v82);
            uint64_t v83 = v69 + v82;
            if (v77) {
              goto LABEL_154;
            }
            if (v83 >= v74)
            {
              uint64_t v101 = &v64[16 * v66];
              uint64_t v103 = *(void *)v101;
              uint64_t v102 = *((void *)v101 + 1);
              BOOL v77 = __OFSUB__(v102, v103);
              uint64_t v104 = v102 - v103;
              if (v77) {
                goto LABEL_160;
              }
              BOOL v94 = v69 < v104;
            }
            else
            {
LABEL_101:
              if (v70) {
                goto LABEL_153;
              }
              unint64_t v78 = v11 - 2;
              uint64_t v84 = &v64[16 * v11 - 32];
              uint64_t v86 = *(void *)v84;
              uint64_t v85 = *((void *)v84 + 1);
              BOOL v87 = __OFSUB__(v85, v86);
              uint64_t v88 = v85 - v86;
              char v89 = v87;
              if (v87) {
                goto LABEL_155;
              }
              unint64_t v90 = &v64[16 * v66];
              uint64_t v92 = *(void *)v90;
              uint64_t v91 = *((void *)v90 + 1);
              BOOL v77 = __OFSUB__(v91, v92);
              uint64_t v93 = v91 - v92;
              if (v77) {
                goto LABEL_157;
              }
              if (__OFADD__(v88, v93)) {
                goto LABEL_159;
              }
              if (v88 + v93 < v69) {
                goto LABEL_113;
              }
              BOOL v94 = v69 < v93;
            }
            if (v94) {
              unint64_t v66 = v78;
            }
          }
          else
          {
            if (v11 == 3)
            {
              uint64_t v68 = *((void *)v8 + 4);
              uint64_t v67 = *((void *)v8 + 5);
              BOOL v77 = __OFSUB__(v67, v68);
              uint64_t v69 = v67 - v68;
              char v70 = v77;
              goto LABEL_101;
            }
            uint64_t v95 = *((void *)v8 + 4);
            uint64_t v96 = *((void *)v8 + 5);
            BOOL v77 = __OFSUB__(v96, v95);
            uint64_t v88 = v96 - v95;
            char v89 = v77;
LABEL_113:
            if (v89) {
              goto LABEL_156;
            }
            unint64_t v97 = &v64[16 * v66];
            uint64_t v99 = *(void *)v97;
            uint64_t v98 = *((void *)v97 + 1);
            BOOL v77 = __OFSUB__(v98, v99);
            uint64_t v100 = v98 - v99;
            if (v77) {
              goto LABEL_158;
            }
            if (v100 < v88) {
              goto LABEL_14;
            }
          }
          unint64_t v105 = v66 - 1;
          if (v66 - 1 >= v11)
          {
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
            goto LABEL_171;
          }
          if (!v10) {
            goto LABEL_173;
          }
          uint64_t v106 = (unint64_t *)v8;
          unsigned __int8 v107 = &v64[16 * v105];
          uint64_t v108 = *(void *)v107;
          uint64_t v109 = &v64[16 * v66];
          uint64_t v110 = *((void *)v109 + 1);
          uint64_t result = sub_DBAE4((char *)(v10 + 8 * *(void *)v107), (char *)(v10 + 8 * *(void *)v109), v10 + 8 * v110, v128);
          if (v1) {
            goto LABEL_144;
          }
          if (v110 < v108) {
            goto LABEL_147;
          }
          if (v66 > v106[2]) {
            goto LABEL_148;
          }
          *(void *)unsigned __int8 v107 = v108;
          *(void *)&v64[16 * v105 + 8] = v110;
          unint64_t v111 = v106[2];
          if (v66 >= v111) {
            goto LABEL_149;
          }
          uint64_t v8 = (char *)v106;
          unint64_t v11 = v111 - 1;
          uint64_t result = (uint64_t)memmove(&v64[16 * v66], v109 + 16, 16 * (v111 - 1 - v66));
          v106[2] = v111 - 1;
          if (v111 <= 2) {
            goto LABEL_14;
          }
          continue;
        }
      }
      unint64_t v11 = 1;
LABEL_14:
      Swift::Int v3 = v125;
      Swift::Int v9 = v132;
      if (v132 >= v125) {
        goto LABEL_133;
      }
    }
    char v60 = sub_E7620();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v10 = v129;
    Swift::Int v47 = v131;
    if ((v60 & 1) == 0) {
      goto LABEL_66;
    }
    goto LABEL_77;
  }
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v135 = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v128 = (char *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
  if (v3 == 1) {
    goto LABEL_12;
  }
  unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_133:
  if (v11 >= 2)
  {
    uint64_t v112 = *v118;
    do
    {
      unint64_t v113 = v11 - 2;
      if (v11 < 2) {
        goto LABEL_162;
      }
      if (!v112) {
        goto LABEL_175;
      }
      uint64_t v114 = *(void *)&v8[16 * v113 + 32];
      uint64_t v115 = *(void *)&v8[16 * v11 + 24];
      uint64_t result = sub_DBAE4((char *)(v112 + 8 * v114), (char *)(v112 + 8 * *(void *)&v8[16 * v11 + 16]), v112 + 8 * v115, v128);
      if (v1) {
        break;
      }
      if (v115 < v114) {
        goto LABEL_163;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_21CA4((uint64_t)v8);
        uint64_t v8 = (char *)result;
      }
      if (v113 >= *((void *)v8 + 2)) {
        goto LABEL_164;
      }
      uint64_t v116 = &v8[16 * v113 + 32];
      *(void *)uint64_t v116 = v114;
      *((void *)v116 + 1) = v115;
      unint64_t v117 = *((void *)v8 + 2);
      if (v11 > v117) {
        goto LABEL_165;
      }
      uint64_t result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v117 - v11));
      *((void *)v8 + 2) = v117 - 1;
      unint64_t v11 = v117 - 1;
    }
    while (v117 > 2);
  }
LABEL_144:
  swift_bridgeObjectRelease();
  *(void *)((char *)&dword_10 + (v135 & 0xFFFFFFFFFFFFFF8)) = 0;
  sub_E7230();
  return swift_bridgeObjectRelease();
}

uint64_t sub_DB85C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v21 = result;
  if (a3 != a2)
  {
    uint64_t v23 = *a4;
    int64_t v4 = (void *)(*a4 + 8 * a3 - 8);
LABEL_7:
    uint64_t v6 = *(void *)(v23 + 8 * a3);
    uint64_t v25 = v21;
    uint64_t v22 = v4;
    uint64_t v24 = a3;
    while (1)
    {
      uint64_t v7 = *v4;
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)v6 + 760);
      swift_retain();
      uint64_t v9 = swift_retain();
      int v10 = ((uint64_t (*)(uint64_t))v8)(v9);
      unint64_t v11 = *(uint64_t (**)(void))(*(void *)v7 + 760);
      if ((v10 ^ v11()))
      {
        if ((v8() & 1) == 0)
        {
          swift_release();
          uint64_t result = swift_release();
          goto LABEL_5;
        }
        char v12 = v11();
        swift_release();
        uint64_t result = swift_release();
        uint64_t v5 = v24;
        if (v12) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v13 = (*(uint64_t (**)(void))(*(void *)v6 + 360))();
        uint64_t v15 = v14;
        if (v13 == (*(uint64_t (**)(void))(*(void *)v7 + 360))() && v15 == v16)
        {
          swift_release();
          swift_release();
          uint64_t result = swift_bridgeObjectRelease_n();
LABEL_5:
          uint64_t v5 = v24;
LABEL_6:
          a3 = v5 + 1;
          int64_t v4 = v22 + 1;
          if (a3 == a2) {
            return result;
          }
          goto LABEL_7;
        }
        char v18 = sub_E7620();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = v24;
        if ((v18 & 1) == 0) {
          goto LABEL_6;
        }
      }
      if (!v23) {
        break;
      }
      uint64_t v19 = *v4;
      uint64_t v6 = v4[1];
      *int64_t v4 = v6;
      v4[1] = v19;
      --v4;
      if (v5 == ++v25) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_DBAE4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  int64_t v4 = a4;
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v8 = __src - __dst;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    if (a4 != __src || &__src[8 * v12] <= a4) {
      memmove(a4, __src, 8 * v12);
    }
    uint64_t v13 = &v4[8 * v12];
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_59;
    }
    uint64_t v29 = (char *)(a3 - 8);
    uint64_t v49 = v4;
    uint64_t v57 = v6;
    while (1)
    {
      unint64_t v53 = v29 + 8;
      unint64_t v55 = (unint64_t)v13;
      uint64_t v30 = *((void *)v13 - 1);
      uint64_t v59 = v5;
      int v31 = v5 - 8;
      uint64_t v32 = *((void *)v5 - 1);
      uint64_t v50 = v31;
      uint64_t v51 = v13 - 8;
      unsigned int v33 = *(uint64_t (**)(void))(*(void *)v30 + 760);
      swift_retain();
      uint64_t v34 = swift_retain();
      int v35 = ((uint64_t (*)(uint64_t))v33)(v34);
      uint64_t v36 = *(uint64_t (**)(void))(*(void *)v32 + 760);
      if ((v35 ^ v36()))
      {
        if ((v33() & 1) == 0)
        {
          swift_release();
          swift_release();
LABEL_50:
          int64_t v4 = v49;
          goto LABEL_51;
        }
        char v37 = v36();
        swift_release();
        swift_release();
        int64_t v4 = v49;
        if ((v37 & 1) == 0) {
          goto LABEL_45;
        }
      }
      else
      {
        uint64_t v38 = (*(uint64_t (**)(void))(*(void *)v30 + 360))();
        uint64_t v40 = v39;
        if (v38 == (*(uint64_t (**)(void))(*(void *)v32 + 360))() && v40 == v41)
        {
          swift_release();
          swift_release();
          swift_bridgeObjectRelease_n();
          goto LABEL_50;
        }
        char v43 = sub_E7620();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        int64_t v4 = v49;
        if (v43)
        {
LABEL_45:
          uint64_t v13 = (char *)v55;
          unint64_t v44 = (unint64_t)v57;
          if (v53 == v59)
          {
            Swift::Int v45 = v50;
            uint64_t v5 = v50;
            if (v29 < v59) {
              goto LABEL_57;
            }
          }
          else
          {
            Swift::Int v45 = v50;
            uint64_t v5 = v50;
          }
          goto LABEL_56;
        }
      }
LABEL_51:
      uint64_t v5 = v59;
      unint64_t v44 = (unint64_t)v57;
      if (v53 == (char *)v55)
      {
        uint64_t v13 = v51;
        Swift::Int v45 = v51;
        if ((unint64_t)v29 < v55) {
          goto LABEL_57;
        }
      }
      else
      {
        uint64_t v13 = v51;
        Swift::Int v45 = v51;
      }
LABEL_56:
      *(void *)uint64_t v29 = *(void *)v45;
LABEL_57:
      if ((unint64_t)v5 > v44)
      {
        v29 -= 8;
        if (v13 > v4) {
          continue;
        }
      }
      goto LABEL_59;
    }
  }
  if (a4 != __dst || &__dst[8 * v9] <= a4) {
    memmove(a4, __dst, 8 * v9);
  }
  uint64_t v13 = &v4[8 * v9];
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    char v54 = &v4[8 * v9];
    do
    {
      uint64_t v56 = v6;
      uint64_t v58 = v5;
      uint64_t v14 = *(void *)v5;
      uint64_t v15 = *(void *)v4;
      uint64_t v16 = *(uint64_t (**)(void))(**(void **)v5 + 760);
      swift_retain();
      uint64_t v17 = swift_retain();
      int v18 = ((uint64_t (*)(uint64_t))v16)(v17);
      uint64_t v19 = *(uint64_t (**)(void))(*(void *)v15 + 760);
      if ((v18 ^ v19()))
      {
        if ((v16() & 1) == 0)
        {
          swift_release();
          swift_release();
          goto LABEL_25;
        }
        char v20 = v19();
        swift_release();
        swift_release();
        if (v20) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v21 = (*(uint64_t (**)(void))(*(void *)v14 + 360))();
        uint64_t v23 = v22;
        BOOL v25 = v21 == (*(uint64_t (**)(void))(*(void *)v15 + 360))() && v23 == v24;
        if (v25)
        {
          swift_release();
          swift_release();
          swift_bridgeObjectRelease_n();
LABEL_25:
          uint64_t v27 = v4;
          uint64_t v28 = v56;
          BOOL v25 = v56 == v4;
          v4 += 8;
          if (v25) {
            goto LABEL_27;
          }
LABEL_26:
          *(void *)uint64_t v28 = *(void *)v27;
          goto LABEL_27;
        }
        char v26 = sub_E7620();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0) {
          goto LABEL_25;
        }
      }
      uint64_t v27 = v5;
      v5 += 8;
      uint64_t v28 = v56;
      if (v56 != v58) {
        goto LABEL_26;
      }
LABEL_27:
      uint64_t v6 = v28 + 8;
      uint64_t v13 = v54;
    }
    while (v4 < v54 && (unint64_t)v5 < a3);
  }
  uint64_t v5 = v6;
LABEL_59:
  uint64_t v46 = v13 - v4;
  uint64_t v47 = v13 - v4 + 7;
  if (v46 < 0) {
    uint64_t v46 = v47;
  }
  if (v5 != v4 || v5 >= &v4[v46 & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v5, v4, 8 * (v46 >> 3));
  }
  return 1;
}

uint64_t sub_DC0C4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_E7570();
    swift_bridgeObjectRelease();
  }

  return sub_E74F0();
}

void sub_DC140(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_DC188()
{
  return swift_release();
}

uint64_t sub_DC190(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_DC1A4(unint64_t *a1)
{
  unint64_t v2 = *a1;
  if ((*a1 & 0x8000000000000000) != 0 || (v2 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v3 = (uint64_t)sub_DABE4(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  unint64_t v5 = v3;
  sub_DAB68((uint64_t *)&v5);
  uint64_t result = swift_bridgeObjectRelease_n();
  *a1 = v5;
  return result;
}

uint64_t sub_DC24C(uint64_t a1)
{
  unint64_t v2 = (void *)sub_DC85C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (uint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_DC978(v4, (uint64_t)v69);
    sub_DC978((uint64_t)v69, (uint64_t)v68);
    sub_10C7C(&qword_122CB0);
    if (swift_dynamicCast()) {
      break;
    }
    uint64_t v33 = v70;
    uint64_t v34 = v71;
    sub_DC9DC(v69, v70);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
    uint64_t v35 = v70;
    uint64_t v36 = v71;
    sub_DC9DC(v69, v70);
    (*(void (**)(uint64_t, uint64_t))(v36 + 32))(v35, v36);
    uint64_t v37 = v70;
    uint64_t v38 = v71;
    sub_DC9DC(v69, v70);
    uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 56))(v37, v38);
    if (v39 < (uint64_t)0xFFFFFFFF80000000) {
      goto LABEL_36;
    }
    uint64_t v40 = v39;
    if (v39 > 0x7FFFFFFF) {
      goto LABEL_38;
    }
    id v41 = objc_allocWithZone((Class)GCSElementMapping);
    NSString v42 = sub_E70D0();
    swift_bridgeObjectRelease();
    NSString v43 = sub_E70D0();
    swift_bridgeObjectRelease();
    id v44 = [v41 initWithElementKey:v42 mappingKey:v43 remappingOrder:v40];

    uint64_t v45 = v70;
    uint64_t v46 = v71;
    sub_DC9DC(v69, v70);
    uint64_t v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 8))(v45, v46);
    uint64_t v49 = v48;
    id v23 = v44;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = sub_21CB8(v47, v49);
    uint64_t v52 = v2[2];
    BOOL v53 = (v51 & 1) == 0;
    uint64_t v54 = v52 + v53;
    if (__OFADD__(v52, v53)) {
      goto LABEL_40;
    }
    char v55 = v51;
    if (v2[3] >= v54)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if ((v51 & 1) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        sub_DE104();
        if ((v55 & 1) == 0) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      sub_DDDF4(v54, isUniquelyReferenced_nonNull_native);
      unint64_t v56 = sub_21CB8(v47, v49);
      if ((v55 & 1) != (v57 & 1)) {
        goto LABEL_43;
      }
      unint64_t v26 = v56;
      if ((v55 & 1) == 0)
      {
LABEL_27:
        v2[(v26 >> 6) + 8] |= 1 << v26;
        unint64_t v62 = (uint64_t *)(v2[6] + 16 * v26);
        *unint64_t v62 = v47;
        v62[1] = v49;
        *(void *)(v2[7] + 8 * v26) = v23;
        uint64_t v63 = v2[2];
        BOOL v60 = __OFADD__(v63, 1);
        uint64_t v61 = v63 + 1;
        if (v60) {
          goto LABEL_42;
        }
LABEL_28:
        v2[2] = v61;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
LABEL_3:
    uint64_t v5 = v2[7];

    *(void *)(v5 + 8 * v26) = v23;
LABEL_4:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_7E3E4((uint64_t)v69);
    v4 += 40;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v2;
    }
  }
  uint64_t v6 = v70;
  uint64_t v7 = v71;
  sub_DC9DC(v69, v70);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  uint64_t v8 = v70;
  uint64_t v9 = v71;
  sub_DC9DC(v69, v70);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  uint64_t v11 = v70;
  uint64_t v10 = v71;
  sub_DC9DC(v69, v70);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 56))(v11, v10);
  if (v12 >= (uint64_t)0xFFFFFFFF80000000)
  {
    uint64_t v13 = v12;
    if (v12 > 0x7FFFFFFF) {
      goto LABEL_37;
    }
    id v14 = objc_allocWithZone((Class)GCSDirectionPadMapping);
    NSString v15 = sub_E70D0();
    swift_bridgeObjectRelease();
    NSString v16 = sub_E70D0();
    swift_bridgeObjectRelease();
    id v17 = [v14 initWithElementKey:v15 mappingKey:v16 remappingOrder:v13 invertHorizontally:v65 invertVertically:v66 swapAxes:v67];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v18 = v70;
    uint64_t v19 = v71;
    sub_DC9DC(v69, v70);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
    uint64_t v22 = v21;
    id v23 = v17;
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = sub_21CB8(v20, v22);
    uint64_t v27 = v2[2];
    BOOL v28 = (v25 & 1) == 0;
    uint64_t v29 = v27 + v28;
    if (__OFADD__(v27, v28)) {
      goto LABEL_39;
    }
    char v30 = v25;
    if (v2[3] >= v29)
    {
      if (v24)
      {
        if ((v25 & 1) == 0) {
          goto LABEL_22;
        }
      }
      else
      {
        sub_DE104();
        if ((v30 & 1) == 0) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      sub_DDDF4(v29, v24);
      unint64_t v31 = sub_21CB8(v20, v22);
      if ((v30 & 1) != (v32 & 1)) {
        goto LABEL_43;
      }
      unint64_t v26 = v31;
      if ((v30 & 1) == 0)
      {
LABEL_22:
        v2[(v26 >> 6) + 8] |= 1 << v26;
        uint64_t v58 = (uint64_t *)(v2[6] + 16 * v26);
        *uint64_t v58 = v20;
        v58[1] = v22;
        *(void *)(v2[7] + 8 * v26) = v23;
        uint64_t v59 = v2[2];
        BOOL v60 = __OFADD__(v59, 1);
        uint64_t v61 = v59 + 1;
        if (v60) {
          goto LABEL_41;
        }
        goto LABEL_28;
      }
    }
    goto LABEL_3;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_E7640();
  __break(1u);
  return result;
}

unint64_t sub_DC85C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10C7C(&qword_125AA8);
  unint64_t v2 = (void *)sub_E75A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_21CB8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

uint64_t sub_DC978(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_DC9DC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_DCA20()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DCA50(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_DCA88())()
{
  return nullsub_72;
}

uint64_t sub_DCAAC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DCADC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_DCB14())()
{
  return nullsub_73;
}

uint64_t sub_DCB38()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_DCB40(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_DCB48())()
{
  return nullsub_74;
}

uint64_t sub_DCB6C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DCB9C()
{
  sub_E74B0(53);
  v6._object = (void *)0x80000000000F3E10;
  v6._countAndFlagsBits = 0xD000000000000023;
  sub_E71A0(v6);
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v1;
  v7._object = v2;
  sub_E71A0(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x6E697070616D202CLL;
  v8._object = (void *)0xED00003D79654B67;
  sub_E71A0(v8);
  uint64_t v4 = v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v4;
  v9._object = v3;
  sub_E71A0(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 62;
  v10._object = (void *)0xE100000000000000;
  sub_E71A0(v10);
  return 0;
}

void sub_DCC8C()
{
  uint64_t v0 = self;
  sub_DE2B8(0, &qword_125AA0);
  Class isa = sub_E7040().super.isa;
  sub_DE2B8(0, (unint64_t *)&qword_123B68);
  Class v2 = sub_E7200().super.isa;
  id v3 = [v0 elementMappingsFrom:isa for:v2];

  unint64_t v4 = sub_E7210();
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
    if (v5) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_E7570();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_15;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v22 = v4 & 0xC000000000000001;
    Swift::String v7 = (char *)_swiftEmptyArrayStorage;
    uint64_t v23 = v5;
    unint64_t v24 = v4;
    do
    {
      if (v22) {
        id v8 = (id)sub_E74E0();
      }
      else {
        id v8 = *(id *)(v4 + 8 * v6 + 32);
      }
      Swift::String v9 = v8;
      id v10 = [v8 elementKey];
      uint64_t v11 = sub_E7110();
      uint64_t v13 = v12;

      id v14 = [v9 mappingKey];
      uint64_t v15 = sub_E7110();
      uint64_t v17 = v16;

      signed int v18 = [v9 remappingOrder];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        Swift::String v7 = sub_5ACDC(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v20 = *((void *)v7 + 2);
      unint64_t v19 = *((void *)v7 + 3);
      if (v20 >= v19 >> 1) {
        Swift::String v7 = sub_5ACDC((char *)(v19 > 1), v20 + 1, 1, v7);
      }
      ++v6;
      *((void *)v7 + 2) = v20 + 1;
      uint64_t v21 = &v7[40 * v20];
      *((void *)v21 + 4) = v11;
      *((void *)v21 + 5) = v13;
      *((void *)v21 + 6) = v15;
      *((void *)v21 + 7) = v17;
      *((void *)v21 + 8) = v18;

      unint64_t v4 = v24;
    }
    while (v23 != v6);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_DCF24@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void sub_DCF38()
{
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(*(void *)(v0 + 32));
}

Swift::Int sub_DCFB4()
{
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(*(void *)(v0 + 32));
  return sub_E76A0();
}

uint64_t sub_DD048()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DD078(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_DD0B0())()
{
  return nullsub_75;
}

uint64_t sub_DD0D4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DD104(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_DD13C())()
{
  return nullsub_76;
}

uint64_t sub_DD160()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_DD168(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_DD170())()
{
  return nullsub_77;
}

uint64_t sub_DD194@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

BOOL sub_DD1A0(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_DE2F4(v5, v7);
}

Swift::Int sub_DD1EC()
{
  Swift::UInt v1 = *(void *)(v0 + 32);
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(v1);
  return sub_E76A0();
}

void sub_DD28C()
{
  Swift::UInt v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(v1);
}

Swift::Int sub_DD314()
{
  Swift::UInt v1 = *(void *)(v0 + 32);
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(v1);
  return sub_E76A0();
}

uint64_t sub_DD3B4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DD3E4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_DD41C())()
{
  return nullsub_78;
}

uint64_t sub_DD440()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DD470(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_DD4A8())()
{
  return nullsub_79;
}

uint64_t sub_DD4CC()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_DD4D4(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_DD4DC())()
{
  return nullsub_80;
}

uint64_t sub_DD500()
{
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_DD508(uint64_t result)
{
  *(unsigned char *)(v1 + 40) = result;
  return result;
}

uint64_t (*sub_DD510())()
{
  return nullsub_81;
}

uint64_t sub_DD534()
{
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t sub_DD53C(uint64_t result)
{
  *(unsigned char *)(v1 + 41) = result;
  return result;
}

uint64_t (*sub_DD544())()
{
  return nullsub_82;
}

uint64_t sub_DD568()
{
  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t sub_DD570(uint64_t result)
{
  *(unsigned char *)(v1 + 42) = result;
  return result;
}

uint64_t (*sub_DD578())()
{
  return nullsub_83;
}

uint64_t sub_DD59C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DD5CC()
{
  sub_E74B0(65);
  v6._object = (void *)0x80000000000F3E40;
  v6._countAndFlagsBits = 0xD00000000000002FLL;
  sub_E71A0(v6);
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v1;
  v7._object = v2;
  sub_E71A0(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x6E697070616D202CLL;
  v8._object = (void *)0xED00003D79654B67;
  sub_E71A0(v8);
  uint64_t v4 = v0[2];
  long long v3 = (void *)v0[3];
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v4;
  v9._object = v3;
  sub_E71A0(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 62;
  v10._object = (void *)0xE100000000000000;
  sub_E71A0(v10);
  return 0;
}

void sub_DD6BC()
{
  uint64_t v0 = self;
  sub_DE2B8(0, &qword_125AA0);
  Class isa = sub_E7040().super.isa;
  sub_DE2B8(0, (unint64_t *)&qword_123B68);
  Class v2 = sub_E7200().super.isa;
  id v3 = [v0 elementMappingsFrom:isa for:v2];

  unint64_t v4 = sub_E7210();
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
    if (v5) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_E7570();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_16;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v28 = v4 & 0xC000000000000001;
    Swift::String v7 = (char *)_swiftEmptyArrayStorage;
    uint64_t v26 = v5;
    unint64_t v27 = v4;
    do
    {
      if (v28) {
        id v9 = (id)sub_E74E0();
      }
      else {
        id v9 = *(id *)(v4 + 8 * v6 + 32);
      }
      Swift::String v10 = v9;
      self;
      uint64_t v11 = swift_dynamicCastObjCClass();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        id v13 = v10;
        id v14 = [v12 elementKey];
        uint64_t v15 = sub_E7110();
        uint64_t v32 = v16;

        id v17 = [v12 mappingKey];
        uint64_t v18 = sub_E7110();
        uint64_t v30 = v19;
        uint64_t v31 = v18;

        signed int v20 = [v12 remappingOrder];
        unsigned __int8 v29 = [v12 invertHorizontally];
        unsigned __int8 v21 = [v12 invertVertically];
        unsigned __int8 v22 = [v12 swapAxes];
        uint64_t v23 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          Swift::String v7 = sub_5ABC4(0, *((void *)v7 + 2) + 1, 1, v7);
        }
        unint64_t v25 = *((void *)v7 + 2);
        unint64_t v24 = *((void *)v7 + 3);
        if (v25 >= v24 >> 1) {
          Swift::String v7 = sub_5ABC4((char *)(v24 > 1), v25 + 1, 1, v7);
        }
        *((void *)v7 + 2) = v25 + 1;
        Swift::String v8 = &v7[48 * v25];
        *((void *)v8 + 4) = v23;
        *((void *)v8 + 5) = v32;
        *((void *)v8 + 6) = v31;
        *((void *)v8 + 7) = v30;
        *((void *)v8 + 8) = v20;
        v8[72] = v29;
        v8[73] = v21;
        v8[74] = v22;

        uint64_t v5 = v26;
        unint64_t v4 = v27;
      }
      ++v6;
    }
    while (v5 != v6);
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t sub_DD9DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 40) = a6;
  *(unsigned char *)(a9 + 41) = a7;
  *(unsigned char *)(a9 + 42) = a8;
  return result;
}

void sub_DD9FC()
{
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(*(void *)(v0 + 32));
  sub_E7690(*(unsigned char *)(v0 + 40) & 1);
  sub_E7690(*(unsigned char *)(v0 + 41) & 1);
  sub_E7690(*(unsigned char *)(v0 + 42) & 1);
}

Swift::Int sub_DDA9C()
{
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(*(void *)(v0 + 32));
  sub_E7690(*(unsigned char *)(v0 + 40) & 1);
  sub_E7690(*(unsigned char *)(v0 + 41) & 1);
  sub_E7690(*(unsigned char *)(v0 + 42) & 1);
  return sub_E76A0();
}

uint64_t sub_DDB68()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DDB98(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_DDBD0())()
{
  return nullsub_84;
}

uint64_t sub_DDBF4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DDC24(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_DDC5C())()
{
  return nullsub_85;
}

uint64_t sub_DDC80()
{
  return *(void *)(v0 + 32);
}

uint64_t sub_DDC88(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_DDC90())()
{
  return nullsub_86;
}

uint64_t sub_DDCB4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_DDCC0(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 11) = *(long long *)((char *)a1 + 27);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 11) = *(long long *)((char *)a2 + 27);
  return sub_DE37C((uint64_t)&v5, (uint64_t)&v7) & 1;
}

Swift::Int sub_DDD14()
{
  Swift::UInt v1 = *(void *)(v0 + 32);
  Swift::UInt8 v2 = *(unsigned char *)(v0 + 40);
  Swift::UInt8 v3 = *(unsigned char *)(v0 + 41);
  Swift::UInt8 v4 = *(unsigned char *)(v0 + 42);
  sub_E7670();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_E7170();
  swift_bridgeObjectRelease();
  sub_E7680(v1);
  sub_E7690(v2);
  sub_E7690(v3);
  sub_E7690(v4);
  return sub_E76A0();
}

uint64_t sub_DDDF4(uint64_t a1, char a2)
{
  Swift::UInt8 v3 = v2;
  uint64_t v5 = *v2;
  sub_10C7C(&qword_125AA8);
  char v38 = a2;
  uint64_t v6 = sub_E7590();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    unsigned __int8 v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          Swift::UInt8 v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    unsigned __int8 v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_E7670();
    sub_E7170();
    uint64_t result = sub_E76A0();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::UInt8 v3 = v35;
  unsigned __int8 v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unsigned __int8 v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

id sub_DE104()
{
  Swift::UInt v1 = v0;
  sub_10C7C(&qword_125AA8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E7580();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

uint64_t sub_DE2B8(uint64_t a1, unint64_t *a2)
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

BOOL sub_DE2F4(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (char v5 = sub_E7620(), result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3]) {
      return a1[4] == a2[4];
    }
    char v8 = sub_E7620();
    BOOL result = 0;
    if (v8) {
      return a1[4] == a2[4];
    }
  }
  return result;
}

uint64_t sub_DE37C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_E7620(), v6 = 0, (v5 & 1) != 0))
  {
    BOOL v7 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
    if (v7 || (char v8 = sub_E7620(), v6 = 0, (v8 & 1) != 0))
    {
      if (*(void *)(a1 + 32) != *(void *)(a2 + 32)
        || ((*(unsigned __int8 *)(a1 + 40) ^ *(unsigned __int8 *)(a2 + 40)) & 1) != 0
        || ((*(unsigned __int8 *)(a1 + 41) ^ *(unsigned __int8 *)(a2 + 41)) & 1) != 0)
      {
        char v6 = 0;
      }
      else
      {
        char v6 = ((*(unsigned char *)(a1 + 42) & 1) == 0) ^ *(unsigned char *)(a2 + 42);
      }
    }
  }
  return v6 & 1;
}

void *sub_DE43C()
{
  return &protocol witness table for String;
}

void *sub_DE44C()
{
  return &protocol witness table for String;
}

uint64_t initializeBufferWithCopyOfBuffer for GCSElementMappingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *initializeWithCopy for GCSElementMappingView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GCSElementMappingView(void *a1, void *a2)
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
  return a1;
}

__n128 initializeWithTake for GCSElementMappingView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for GCSElementMappingView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSElementMappingView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSElementMappingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSElementMappingView()
{
  return &type metadata for GCSElementMappingView;
}

uint64_t _s25GameControlleriOSSettings21GCSElementMappingViewVwxx_0()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GCSDirectionPadElementMappingView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_WORD *)(a1 + 41) = *(_WORD *)(a2 + 41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GCSDirectionPadElementMappingView(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

__n128 initializeWithTake for GCSDirectionPadElementMappingView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for GCSDirectionPadElementMappingView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSDirectionPadElementMappingView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 43)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSDirectionPadElementMappingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 42) = 0;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 43) = 1;
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
    *(unsigned char *)(result + 43) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSDirectionPadElementMappingView()
{
  return &type metadata for GCSDirectionPadElementMappingView;
}

const char *sub_DE8AC()
{
  return "GameController";
}

const char *sub_DE8C0()
{
  return "pairing_onboarding_support";
}

uint64_t sub_DE8D4()
{
  return 1;
}

void sub_DE8DC()
{
}

Swift::Int sub_DE904()
{
  return sub_E76A0();
}

uint64_t sub_DE948()
{
  return 1;
}

Swift::Int sub_DE950()
{
  return sub_E76A0();
}

void sub_DE994()
{
}

Swift::Int sub_DE9BC()
{
  return sub_E76A0();
}

unint64_t sub_DEA00()
{
  unint64_t result = qword_125AB0;
  if (!qword_125AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125AB0);
  }
  return result;
}

const char *sub_DEA54()
{
  return "GameController";
}

const char *sub_DEA68()
{
  return "pairing_onboarding_support";
}

uint64_t getEnumTagSinglePayload for GameController(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for GameController(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0xDEB68);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_DEB90()
{
  return 0;
}

ValueMetadata *type metadata accessor for GameController()
{
  return &type metadata for GameController;
}

uint64_t sub_DEBB0()
{
  uint64_t v0 = self;
  Class isa = sub_E72A0().super.super.isa;
  id v2 = [v0 localizedStringFromNumber:isa numberStyle:3];

  uint64_t v3 = sub_E7110();
  return v3;
}

uint64_t sub_DEC44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_E6050();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_DECAC(uint64_t a1)
{
  uint64_t v3 = sub_E6050();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*sub_DED14())()
{
  return nullsub_89;
}

uint64_t sub_DED38()
{
  return sub_B7108(0xD000000000000020, (void *)0x80000000000F3E90);
}

uint64_t sub_DED54()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for GCSProfileParams()
{
  uint64_t result = qword_12B4C0;
  if (!qword_12B4C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_DEDE0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_DEE28())()
{
  return nullsub_90;
}

uint64_t sub_DEE74()
{
  return 0;
}

uint64_t sub_DEE80()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DEEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_DEF08())()
{
  return nullsub_91;
}

uint64_t sub_DEF54()
{
  return 0;
}

uint64_t sub_DEF60()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DEFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_DEFE8())()
{
  return nullsub_92;
}

uint64_t sub_DF034()
{
  return 0;
}

uint64_t sub_DF03C()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 32));
}

uint64_t sub_DF060(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*sub_DF090())()
{
  return nullsub_93;
}

uint64_t sub_DF0DC()
{
  return 1;
}

uint64_t sub_DF0E4()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 36));
}

uint64_t sub_DF108(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(unsigned char *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*sub_DF138())()
{
  return nullsub_94;
}

unint64_t sub_DF184()
{
  return 0xD000000000000013;
}

uint64_t sub_DF1A0()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_DF1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GCSProfileParams() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_DF228())()
{
  return nullsub_95;
}

unint64_t sub_DF274()
{
  return sub_DC85C((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_DF280()
{
  type metadata accessor for GCSProfileParams();

  return swift_bridgeObjectRetain();
}

uint64_t sub_DF2B4(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GCSProfileParams() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*sub_DF2F4())()
{
  return nullsub_96;
}

uint64_t sub_DF340()
{
  return 0;
}

uint64_t sub_DF348()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 48));
}

uint64_t sub_DF36C(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(unsigned char *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*sub_DF39C())()
{
  return nullsub_97;
}

double sub_DF3E8()
{
  return 1.0;
}

double sub_DF3F0()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 52));
}

uint64_t sub_DF414(double a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(double *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*sub_DF444())()
{
  return nullsub_98;
}

uint64_t sub_DF490()
{
  return 1;
}

uint64_t sub_DF498()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 56));
}

uint64_t sub_DF4BC(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(void *)(v1 + *(int *)(result + 56)) = a1;
  return result;
}

uint64_t (*sub_DF4EC())()
{
  return nullsub_99;
}

uint64_t sub_DF538()
{
  return 2;
}

uint64_t sub_DF540()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 60));
}

uint64_t sub_DF564(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(void *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*sub_DF594())()
{
  return nullsub_100;
}

uint64_t sub_DF5E0()
{
  return 0;
}

uint64_t sub_DF5E8()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 64));
}

uint64_t sub_DF60C(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(unsigned char *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

uint64_t (*sub_DF63C())()
{
  return nullsub_101;
}

uint64_t sub_DF688()
{
  return 0;
}

uint64_t sub_DF690()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 68));
}

uint64_t sub_DF6B4(char a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(unsigned char *)(v1 + *(int *)(result + 68)) = a1;
  return result;
}

uint64_t (*sub_DF6E4())()
{
  return nullsub_102;
}

uint64_t sub_DF730()
{
  return 0;
}

uint64_t sub_DF738()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for GCSProfileParams() + 72));
}

uint64_t sub_DF75C(uint64_t a1)
{
  uint64_t result = type metadata accessor for GCSProfileParams();
  *(void *)(v1 + *(int *)(result + 72)) = a1;
  return result;
}

uint64_t (*sub_DF78C())()
{
  return nullsub_103;
}

uint64_t sub_DF7D8(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + *(int *)(type metadata accessor for GCSProfileParams() + 44));
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  int64_t v41 = v8;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_21:
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v19 = v18;
    if ([v19 isCustomized])
    {
      id v24 = v19;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v27 = sub_21CB8(v17, v16);
      uint64_t v28 = v3[2];
      BOOL v29 = (v26 & 1) == 0;
      uint64_t v30 = v28 + v29;
      if (__OFADD__(v28, v29)) {
        goto LABEL_41;
      }
      char v31 = v26;
      if (v3[3] >= v30)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          int64_t v8 = v41;
          if (v26) {
            goto LABEL_33;
          }
        }
        else
        {
          sub_DE104();
          int64_t v8 = v41;
          if (v31) {
            goto LABEL_33;
          }
        }
      }
      else
      {
        sub_DDDF4(v30, isUniquelyReferenced_nonNull_native);
        unint64_t v32 = sub_21CB8(v17, v16);
        if ((v31 & 1) != (v33 & 1)) {
          goto LABEL_43;
        }
        unint64_t v27 = v32;
        int64_t v8 = v41;
        if (v31)
        {
LABEL_33:
          uint64_t v34 = v3[7];
          uint64_t v35 = 8 * v27;

          *(void *)(v34 + v35) = v24;
          goto LABEL_37;
        }
      }
      v3[(v27 >> 6) + 8] |= 1 << v27;
      int64_t v36 = (uint64_t *)(v3[6] + 16 * v27);
      *int64_t v36 = v17;
      v36[1] = v16;
      *(void *)(v3[7] + 8 * v27) = v24;
      uint64_t v37 = v3[2];
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_42;
      }
      v3[2] = v39;
      swift_bridgeObjectRetain();
LABEL_37:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = a1 + 64;
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_21CB8(v17, v16);
      char v22 = v21;
      swift_bridgeObjectRelease();
      if (v22)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_DE104();
        }
        swift_bridgeObjectRelease();
        unint64_t v23 = *(void **)(v3[7] + 8 * v20);
        sub_E0EC0(v20, (uint64_t)v3);
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_40;
  }
  if (v12 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v8) {
    goto LABEL_38;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13)
  {
LABEL_20:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_38:
    swift_release();
    return (uint64_t)v3;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_38;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t result = sub_E7640();
  __break(1u);
  return result;
}

void sub_DFB3C(uint64_t a1, uint64_t a2)
{
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_24;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_24:
    unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_21CB8(v16, v17);
    char v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {

      return;
    }
    sub_E1DF0(0, &qword_125AA0);
    id v23 = *(id *)(*(void *)(a2 + 56) + 8 * v20);
    char v24 = sub_E7390();

    if ((v24 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
}

unint64_t sub_DFD34@<X0>(uint64_t a1@<X8>)
{
  sub_E6040();
  uint64_t v2 = (int *)type metadata accessor for GCSProfileParams();
  uint64_t v3 = (uint64_t *)(a1 + v2[5]);
  uint64_t *v3 = sub_B7108(0xD000000000000020, (void *)0x80000000000F3E90);
  v3[1] = v4;
  uint64_t v5 = (void *)(a1 + v2[6]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)(a1 + v2[7]);
  void *v6 = 0;
  v6[1] = 0;
  *(unsigned char *)(a1 + v2[8]) = 0;
  *(unsigned char *)(a1 + v2[9]) = 1;
  uint64_t v7 = (void *)(a1 + v2[10]);
  *uint64_t v7 = 0xD000000000000013;
  v7[1] = 0x80000000000F1B30;
  uint64_t v8 = v2[11];
  unint64_t result = sub_DC85C((uint64_t)_swiftEmptyArrayStorage);
  *(void *)(a1 + v8) = result;
  *(unsigned char *)(a1 + v2[12]) = 0;
  *(void *)(a1 + v2[13]) = 0x3FF0000000000000;
  *(void *)(a1 + v2[14]) = 1;
  *(void *)(a1 + v2[15]) = 2;
  *(unsigned char *)(a1 + v2[16]) = 0;
  *(unsigned char *)(a1 + v2[17]) = 0;
  *(void *)(a1 + v2[18]) = 0;
  return result;
}

uint64_t sub_DFE38()
{
  return sub_B7108(0xD000000000000020, (void *)0x80000000000F3E90);
}

uint64_t sub_DFE54()
{
  return 0;
}

uint64_t sub_DFE60()
{
  return 0;
}

uint64_t sub_DFE6C()
{
  return 0;
}

uint64_t sub_DFE74()
{
  return 1;
}

unint64_t sub_DFE7C()
{
  return 0xD000000000000013;
}

unint64_t sub_DFE98()
{
  return sub_DC85C((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_DFEA4()
{
  return 0;
}

double sub_DFEAC()
{
  return 1.0;
}

uint64_t sub_DFEB4()
{
  return 1;
}

uint64_t sub_DFEBC()
{
  return 2;
}

uint64_t sub_DFEC4()
{
  return 0;
}

uint64_t sub_DFECC()
{
  return 0;
}

uint64_t sub_DFED4()
{
  return 0;
}

int *sub_DFEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, char a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, char a19, uint64_t a20)
{
  uint64_t v27 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(a9, a1, v27);
  unint64_t result = (int *)type metadata accessor for GCSProfileParams();
  BOOL v29 = (void *)(a9 + result[5]);
  *BOOL v29 = a2;
  v29[1] = a3;
  uint64_t v30 = (void *)(a9 + result[6]);
  *uint64_t v30 = a4;
  v30[1] = a5;
  char v31 = (void *)(a9 + result[7]);
  *char v31 = a6;
  v31[1] = a7;
  *(unsigned char *)(a9 + result[8]) = a8;
  *(unsigned char *)(a9 + result[9]) = a11;
  unint64_t v32 = (void *)(a9 + result[10]);
  *unint64_t v32 = a12;
  v32[1] = a13;
  *(void *)(a9 + result[11]) = a14;
  *(unsigned char *)(a9 + result[12]) = a15;
  *(double *)(a9 + result[13]) = a10;
  *(void *)(a9 + result[14]) = a16;
  *(void *)(a9 + result[15]) = a17;
  *(unsigned char *)(a9 + result[16]) = a18;
  *(unsigned char *)(a9 + result[17]) = a19;
  *(void *)(a9 + result[18]) = a20;
  return result;
}

uint64_t sub_E0074(void *a1, void *a2)
{
  uint64_t v29 = sub_E5FE0();
  uint64_t v27 = *(void *)(v29 - 8);
  uint64_t v4 = __chkstk_darwin(v29);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_E6050();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v26 - v14;
  id v16 = [a1 uuid];
  sub_E6030();

  id v28 = a2;
  id v17 = [a2 uuid];
  sub_E6030();

  LOBYTE(v17) = sub_E6020();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v18(v15, v9);
  if (v17)
  {
    id v19 = [a1 modifiedDate];
    sub_E5FC0();

    id v20 = [v28 modifiedDate];
    sub_E5FC0();

    char v21 = sub_E5FB0();
    char v22 = *(void (**)(char *, uint64_t))(v27 + 8);
    id v23 = v6;
    uint64_t v24 = v29;
    v22(v23, v29);
    v22(v8, v24);
  }
  else
  {
    char v21 = 0;
  }
  return v21 & 1;
}

id sub_E031C(uint64_t a1)
{
  v15.super.Class isa = sub_E6010().super.isa;
  uint64_t v2 = (int *)type metadata accessor for GCSProfileParams();
  NSString v3 = sub_E70D0();
  if (*(void *)(a1 + v2[6] + 8))
  {
    swift_bridgeObjectRetain();
    NSString v4 = sub_E70D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  if (*(void *)(a1 + v2[7] + 8))
  {
    swift_bridgeObjectRetain();
    NSString v5 = sub_E70D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = *(unsigned __int8 *)(a1 + v2[8]);
  uint64_t v8 = *(unsigned __int8 *)(a1 + v2[9]);
  NSString v9 = sub_E70D0();
  sub_E1DF0(0, &qword_125AA0);
  Class isa = sub_E7040().super.isa;
  BYTE1(v14) = *(unsigned char *)(a1 + v2[17]);
  LOBYTE(v14) = *(unsigned char *)(a1 + v2[16]);
  LOBYTE(v13) = *(unsigned char *)(a1 + v2[12]);
  id v11 = objc_msgSend(v6, "initWithUUID:name:persistentControllerIdentifier:gameBundleIdentifier:baseProfile:customizable:sfSymbolsName:elementMappings:hapticFeedbackOverride:hapticStrength:doublePressShareGesture:longPressShareGesture:lightbarOverride:lightbarCustomColorEnabled:lightbarColor:", v15.super.isa, v3, v4, v5, v7, v8, *(double *)(a1 + v2[13]), v9, isa, v13, *(void *)(a1 + v2[14]), *(void *)(a1 + v2[15]), v14, *(void *)(a1 + v2[18]));

  sub_2E52C(a1);
  return v11;
}

int *sub_E0510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v51 = sub_E6050();
  uint64_t v4 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  id v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [v1 uuid];
  sub_E6030();

  id v8 = [v2 name];
  uint64_t v9 = sub_E7110();
  uint64_t v49 = v10;
  uint64_t v50 = v9;

  id v11 = [v2 persistentControllerIdentifier];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_E7110();
    uint64_t v47 = v14;
    uint64_t v48 = v13;
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
  }
  id v15 = [v2 gameBundleIdentifier];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = sub_E7110();
    uint64_t v45 = v18;
    uint64_t v46 = v17;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }
  unsigned int v44 = [v2 isBaseProfile];
  unsigned int v43 = [v2 customizable];
  id v19 = [v2 sfSymbolsName];
  uint64_t v20 = sub_E7110();
  uint64_t v41 = v21;
  uint64_t v42 = v20;

  id v22 = [v2 elementMappings];
  sub_E1DF0(0, &qword_125AA0);
  uint64_t v23 = sub_E7050();

  unsigned __int8 v24 = [v2 hapticFeedbackOverride];
  [v2 hapticStrength];
  uint64_t v26 = v25;
  id v27 = [v2 doublePressShareGesture];
  id v28 = [v2 longPressShareGesture];
  unsigned __int8 v29 = [v2 lightbarOverride];
  unsigned __int8 v30 = [v2 lightbarCustomColorEnabled];
  id v31 = [v2 lightbarColor];
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v51);
  unint64_t result = (int *)type metadata accessor for GCSProfileParams();
  char v33 = (uint64_t *)(a1 + result[5]);
  uint64_t v34 = v49;
  *char v33 = v50;
  v33[1] = v34;
  uint64_t v35 = (uint64_t *)(a1 + result[6]);
  uint64_t v36 = v47;
  *uint64_t v35 = v48;
  v35[1] = v36;
  uint64_t v37 = (uint64_t *)(a1 + result[7]);
  uint64_t v38 = v45;
  *uint64_t v37 = v46;
  v37[1] = v38;
  *(unsigned char *)(a1 + result[8]) = v44;
  *(unsigned char *)(a1 + result[9]) = v43;
  uint64_t v39 = (uint64_t *)(a1 + result[10]);
  uint64_t v40 = v41;
  *uint64_t v39 = v42;
  v39[1] = v40;
  *(void *)(a1 + result[11]) = v23;
  *(unsigned char *)(a1 + result[12]) = v24;
  *(void *)(a1 + result[13]) = v26;
  *(void *)(a1 + result[14]) = v27;
  *(void *)(a1 + result[15]) = v28;
  *(unsigned char *)(a1 + result[16]) = v29;
  *(unsigned char *)(a1 + result[17]) = v30;
  *(void *)(a1 + result[18]) = v31;
  return result;
}

unint64_t sub_E0894()
{
  return 0xD000000000000013;
}

uint64_t sub_E08B0()
{
  return 1;
}

id sub_E08B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  NSString v8 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v9 = sub_E70D0();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_E6050();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a6, 1, v10) != 1)
  {
    Class isa = sub_E6010().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a6, v10);
  }
  id v13 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithName:v8 sfSymbolsName:v9 customizable:a5 & 1 uuid:isa];

  return v13;
}

id sub_E09EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v28 = a5;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v27 = a2;
  uint64_t v8 = sub_10C7C(&qword_123560);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_E6050();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = (int *)type metadata accessor for GCSProfileParams();
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  sub_E12AC(a6, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_E6040();
    sub_E1314((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  }
  unint64_t v18 = sub_DC85C((uint64_t)_swiftEmptyArrayStorage);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v14, v11);
  id v19 = &v17[v15[5]];
  uint64_t v20 = v27;
  *(void *)id v19 = a1;
  *((void *)v19 + 1) = v20;
  uint64_t v21 = &v17[v15[6]];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  id v22 = &v17[v15[7]];
  *(void *)id v22 = 0;
  *((void *)v22 + 1) = 0;
  v17[v15[8]] = 0;
  v17[v15[9]] = v28 & 1;
  uint64_t v23 = &v17[v15[10]];
  uint64_t v24 = v30;
  *(void *)uint64_t v23 = v29;
  *((void *)v23 + 1) = v24;
  *(void *)&v17[v15[11]] = v18;
  v17[v15[12]] = 0;
  *(void *)&v17[v15[13]] = 0x3FF0000000000000;
  *(void *)&v17[v15[14]] = 1;
  *(void *)&v17[v15[15]] = 2;
  v17[v15[16]] = 0;
  v17[v15[17]] = 0;
  *(void *)&v17[v15[18]] = 0;
  id v25 = sub_E031C((uint64_t)v17);
  sub_E1314(a6);
  swift_deallocPartialClassInstance();
  return v25;
}

uint64_t sub_E0E18@<X0>(uint64_t *a1@<X8>)
{
  sub_E1DF0(0, (unint64_t *)&qword_124E50);
  uint64_t result = sub_E6110();
  *a1 = result;
  return result;
}

void sub_E0E68(uint64_t *a1@<X8>)
{
  id v3 = [*v1 id];
  uint64_t v4 = sub_E7110();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

unint64_t sub_E0EC0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_E7470();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_E7670();
        swift_bridgeObjectRetain();
        sub_E7170();
        Swift::Int v9 = sub_E76A0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          id v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *id v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

BOOL sub_E1098(uint64_t a1, uint64_t a2)
{
  if ((sub_E6020() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for GCSProfileParams();
  uint64_t v5 = v4[5];
  uint64_t v6 = *(void *)(a1 + v5);
  uint64_t v7 = *(void *)(a1 + v5 + 8);
  unint64_t v8 = (void *)(a2 + v5);
  if (v6 != *v8 || v7 != v8[1])
  {
    char v10 = sub_E7620();
    BOOL result = 0;
    if ((v10 & 1) == 0) {
      return result;
    }
  }
  uint64_t v12 = v4[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  id v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (v14)
  {
    if (!v16) {
      return 0;
    }
    if (*v13 != *v15 || v14 != v16)
    {
      char v18 = sub_E7620();
      BOOL result = 0;
      if ((v18 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v16)
  {
    return 0;
  }
  uint64_t v19 = v4[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = *(void *)(a1 + v19 + 8);
  uint64_t v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  if (!v21)
  {
    if (!v23) {
      goto LABEL_25;
    }
    return 0;
  }
  if (!v23) {
    return 0;
  }
  if (*v20 != *v22 || v21 != v23)
  {
    char v25 = sub_E7620();
    BOOL result = 0;
    if ((v25 & 1) == 0) {
      return result;
    }
  }
LABEL_25:
  if (*(unsigned __int8 *)(a1 + v4[8]) != *(unsigned __int8 *)(a2 + v4[8])
    || *(unsigned __int8 *)(a1 + v4[9]) != *(unsigned __int8 *)(a2 + v4[9]))
  {
    return 0;
  }
  uint64_t v26 = v4[10];
  uint64_t v27 = *(void *)(a1 + v26);
  uint64_t v28 = *(void *)(a1 + v26 + 8);
  uint64_t v29 = (void *)(a2 + v26);
  if (v27 == *v29 && v28 == v29[1] || (char v30 = sub_E7620(), result = 0, (v30 & 1) != 0))
  {
    sub_DFB3C(*(void *)(a1 + v4[11]), *(void *)(a2 + v4[11]));
    if ((v31 & 1) != 0
      && *(unsigned __int8 *)(a1 + v4[12]) == *(unsigned __int8 *)(a2 + v4[12])
      && *(double *)(a1 + v4[13]) == *(double *)(a2 + v4[13])
      && *(void *)(a1 + v4[14]) == *(void *)(a2 + v4[14])
      && *(void *)(a1 + v4[15]) == *(void *)(a2 + v4[15])
      && *(unsigned __int8 *)(a1 + v4[16]) == *(unsigned __int8 *)(a2 + v4[16])
      && *(unsigned __int8 *)(a1 + v4[17]) == *(unsigned __int8 *)(a2 + v4[17]))
    {
      return *(void *)(a1 + v4[18]) == *(void *)(a2 + v4[18]);
    }
    return 0;
  }
  return result;
}

uint64_t sub_E12AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10C7C(&qword_123560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_E1314(uint64_t a1)
{
  uint64_t v2 = sub_10C7C(&qword_123560);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_E1374()
{
  return &protocol witness table for ObservableObjectPublisher;
}

void *sub_E1380()
{
  return &protocol witness table for String;
}

void *sub_E138C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (void *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_E6050();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    char v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *char v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)((char *)a1 + v9);
    uint64_t v14 = (void *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    char v18 = (void *)((char *)a1 + v16);
    uint64_t v19 = (void *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *char v18 = *v19;
    v18[1] = v20;
    *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v21 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    uint64_t v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *((unsigned char *)a1 + v25) = *((unsigned char *)a2 + v25);
    uint64_t v26 = a3[14];
    *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
    *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
    uint64_t v27 = a3[16];
    *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
    *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
    uint64_t v28 = a3[18];
    *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_E152C(uint64_t a1)
{
  uint64_t v2 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_E15E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  char v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  char v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v20 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  uint64_t v25 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v25) = *(void *)(a2 + v25);
  uint64_t v26 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v26) = *(unsigned char *)(a2 + v26);
  uint64_t v27 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_E1730(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  char v18 = (void *)(a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_E18D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t sub_E19D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_E6050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  char v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *char v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + v22) = *(unsigned char *)(a2 + v22);
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(void *)(a1 + v28) = *(void *)(a2 + v28);
  uint64_t v29 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v29) = *(void *)(a2 + v29);
  uint64_t v30 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  return a1;
}

uint64_t sub_E1B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_E1B38);
}

uint64_t sub_E1B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E6050();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_E1BFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_E1C10);
}

uint64_t sub_E1C10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_E6050();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_E1CD0()
{
  uint64_t result = sub_E6050();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_E1DA8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_E1DF0(uint64_t a1, unint64_t *a2)
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

id sub_E1E2C()
{
  unint64_t v1 = *v0;
  if (*v0)
  {
    return v1;
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_E3E2C((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    id result = (id)sub_E63E0();
    __break(1u);
  }
  return result;
}

uint64_t sub_E1EBC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for GCSPreferencesStore();
  uint64_t v4 = sub_E3E2C((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);

  return EnvironmentObject.projectedValue.getter(v1, v2, v3, v4);
}

uint64_t sub_E1F44()
{
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  return v1;
}

uint64_t sub_E1F94()
{
  return sub_E6DF0();
}

uint64_t (*sub_E1FE8(void *a1))()
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  v3[6] = v4;
  v3[7] = v5;
  uint64_t v6 = (void *)v1[4];
  unsigned char v3[8] = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  sub_18AF0((uint64_t)(v3 + 3));
  swift_retain();
  id v7 = v6;
  v3[9] = sub_10C7C(&qword_123590);
  sub_E6DE0();
  return sub_E2090;
}

uint64_t sub_E2094()
{
  sub_10C7C(&qword_123590);
  sub_E6E10();
  return v1;
}

uint64_t sub_E20E8()
{
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  return v1;
}

uint64_t sub_E2138()
{
  return sub_E6DF0();
}

uint64_t (*sub_E218C(void *a1))()
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  v3[6] = v4;
  v3[7] = v5;
  uint64_t v6 = (void *)v1[7];
  unsigned char v3[8] = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  sub_18AF0((uint64_t)(v3 + 3));
  swift_retain();
  id v7 = v6;
  v3[9] = sub_10C7C(&qword_123590);
  sub_E6DE0();
  return sub_E2234;
}

void sub_E2238(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)a1 + 24;
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  *(void *)(*(void *)a1 + 32) = v4;
  uint64_t v5 = (void *)*((void *)v2 + 8);
  uint64_t v6 = *((void *)v2 + 7);
  *(void *)uint64_t v2 = *((void *)v2 + 6);
  *((void *)v2 + 1) = v6;
  *((void *)v2 + 2) = v5;
  if (a2)
  {
    id v7 = v4;
    sub_E6DF0();
    sub_18B48(v3);
    swift_release();
  }
  else
  {
    sub_E6DF0();
    sub_18B48(v3);
    swift_release();
  }

  free(v2);
}

uint64_t sub_E22F4()
{
  sub_10C7C(&qword_123590);
  sub_E6E10();
  return v1;
}

uint64_t sub_E2348()
{
  sub_10C7C(&qword_122890);
  sub_E6DE0();
  return v1;
}

uint64_t sub_E2398()
{
  return sub_E6DF0();
}

void (*sub_E23EC(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(v1 + 72);
  v3[4] = v4;
  v3[5] = v5;
  char v6 = *(unsigned char *)(v1 + 80);
  *((unsigned char *)v3 + 19) = v6;
  v3[3] = v4;
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  sub_18AF0((uint64_t)(v3 + 3));
  swift_retain();
  v3[6] = sub_10C7C(&qword_122890);
  sub_E6DE0();
  return sub_E2490;
}

void sub_E2490(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)a1 + 24;
  char v3 = *(unsigned char *)(*(void *)a1 + 18);
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(*(void *)a1 + 19);
  void *v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v4;
  *((unsigned char *)v1 + 16) = v5;
  *((unsigned char *)v1 + 17) = v3;
  sub_E6DF0();
  sub_18B48(v2);
  swift_release();

  free(v1);
}

uint64_t sub_E2504()
{
  sub_10C7C(&qword_122890);
  sub_E6E10();
  return v1;
}

uint64_t sub_E2558()
{
  sub_E6D10();
  return v1;
}

uint64_t sub_E2594()
{
  return 0;
}

uint64_t sub_E25A0()
{
  sub_10C7C(&qword_122298);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_EBBE0;
  long long v8 = *(_OWORD *)(v0 + 16);
  uint64_t v9 = *(void *)(v0 + 32);
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  id v2 = objc_msgSend(v10, "localizedName", v8, v9);

  uint64_t v3 = sub_E7110();
  uint64_t v5 = v4;

  *(void *)(v1 + 56) = &type metadata for String;
  *(void *)(v1 + 64) = sub_17068();
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = v5;
  uint64_t countAndFlagsBits = String.localized(with:)((Swift::OpaquePointer)v1)._countAndFlagsBits;
  swift_bridgeObjectRelease();
  return countAndFlagsBits;
}

uint64_t sub_E26A4@<X0>(uint64_t a1@<X8>)
{
  id v2 = v1;
  uint64_t v45 = a1;
  uint64_t v3 = sub_E66C0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  uint64_t v44 = v4;
  __chkstk_darwin(v3);
  uint64_t v40 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10C7C(&qword_125B70);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10C7C(&qword_125B78);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10C7C(&qword_125B80);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10C7C(&qword_125B88);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  uint64_t v42 = v18;
  __chkstk_darwin(v17);
  uint64_t v39 = (char *)&v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = v2;
  sub_10C7C(&qword_125B90);
  sub_E5830(&qword_125B98, &qword_125B90);
  sub_E6890();
  uint64_t v20 = (uint64_t (*)())swift_allocObject();
  long long v21 = v2[5];
  *((_OWORD *)v20 + 5) = v2[4];
  *((_OWORD *)v20 + 6) = v21;
  *((_OWORD *)v20 + 7) = v2[6];
  long long v22 = v2[1];
  *((_OWORD *)v20 + 1) = *v2;
  *((_OWORD *)v20 + 2) = v22;
  long long v23 = v2[3];
  *((_OWORD *)v20 + 3) = v2[2];
  *((_OWORD *)v20 + 4) = v23;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  uint64_t v24 = (uint64_t (**)())&v13[*(int *)(v11 + 44)];
  *uint64_t v24 = sub_E3B78;
  v24[1] = v20;
  v24[2] = 0;
  v24[3] = 0;
  sub_E3BD8((uint64_t)v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  long long v48 = v2[1];
  unint64_t v49 = *((void *)v2 + 4);
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  uint64_t v25 = v51;
  uint64_t v26 = (_OWORD *)swift_allocObject();
  long long v27 = v2[5];
  v26[5] = v2[4];
  v26[6] = v27;
  v26[7] = v2[6];
  long long v28 = v2[1];
  v26[1] = *v2;
  v26[2] = v28;
  long long v29 = v2[3];
  v26[3] = v2[2];
  v26[4] = v29;
  sub_E54B8((uint64_t)v13, (uint64_t)v16, &qword_125B78);
  uint64_t v30 = &v16[*(int *)(v14 + 36)];
  *(void *)uint64_t v30 = v25;
  *((void *)v30 + 1) = sub_E3C8C;
  *((void *)v30 + 2) = v26;
  sub_E3BD8((uint64_t)v2);
  sub_E551C((uint64_t)v13, &qword_125B78);
  char v31 = v40;
  sub_E66B0();
  unint64_t v32 = sub_E3CEC();
  uint64_t v33 = sub_E3E2C(&qword_122D10, (void (*)(uint64_t))&type metadata accessor for InsetGroupedFormStyle);
  uint64_t v34 = v39;
  uint64_t v35 = v43;
  sub_E6A90();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v31, v35);
  sub_E551C((uint64_t)v16, &qword_125B80);
  uint64_t v46 = v2;
  sub_10C7C(&qword_125BC8);
  *(void *)&long long v48 = v14;
  *((void *)&v48 + 1) = v35;
  unint64_t v49 = v32;
  uint64_t v50 = v33;
  swift_getOpaqueTypeConformance2();
  sub_E5830(&qword_125BD0, &qword_125BC8);
  uint64_t v36 = v41;
  sub_E6A70();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v34, v36);
}

uint64_t sub_E2C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = sub_10C7C(&qword_125BE0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v35 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = sub_10C7C(&qword_125BE8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v35 - v13;
  sub_E55A8(0, (unint64_t *)&qword_1255A0);
  long long v41 = *(_OWORD *)(a1 + 16);
  uint64_t v42 = *(void *)(a1 + 32);
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  uint64_t v15 = (void *)v37;
  long long v41 = *(_OWORD *)(a1 + 40);
  uint64_t v42 = *(void *)(a1 + 56);
  sub_E6DE0();
  uint64_t v16 = (void *)v37;
  char v17 = sub_E7390();

  if (v17)
  {
    sub_10C7C(&qword_125C10);
    sub_E5830(&qword_125C18, &qword_125C10);
    sub_E6EE0();
    uint64_t v18 = sub_10C7C(&qword_125BF0);
    uint64_t v19 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 0, 1, v18);
  }
  else
  {
    uint64_t v20 = sub_10C7C(&qword_125BF0);
    uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 1, 1, v20);
  }
  __chkstk_darwin(v19);
  *(void *)&long long v41 = sub_B7108(0xD00000000000001ELL, (void *)0x80000000000F3F00);
  *((void *)&v41 + 1) = v21;
  sub_187B0();
  *(void *)&long long v41 = sub_E6920();
  *((void *)&v41 + 1) = v22;
  LOBYTE(v42) = v23 & 1;
  uint64_t v43 = v24;
  uint64_t v37 = sub_B7108(0xD000000000000013, (void *)0x80000000000F3F20);
  uint64_t v38 = v25;
  uint64_t v37 = sub_E6920();
  uint64_t v38 = v26;
  char v39 = v27 & 1;
  uint64_t v40 = v28;
  sub_10C7C(&qword_125BF8);
  sub_E5830(&qword_125C00, &qword_125BF8);
  sub_E6ED0();
  sub_E54B8((uint64_t)v14, (uint64_t)v12, &qword_125BE8);
  long long v29 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v30 = v35;
  v29(v35, v8, v3);
  uint64_t v31 = v36;
  sub_E54B8((uint64_t)v12, v36, &qword_125BE8);
  uint64_t v32 = sub_10C7C(&qword_125C08);
  v29((char *)(v31 + *(int *)(v32 + 48)), v30, v3);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v8, v3);
  sub_E551C((uint64_t)v14, &qword_125BE8);
  v33(v30, v3);
  return sub_E551C((uint64_t)v12, &qword_125BE8);
}

uint64_t sub_E30BC@<X0>(uint64_t a1@<X8>)
{
  return sub_E2C04(*(void *)(v1 + 16), a1);
}

uint64_t sub_E30C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_E6560();
  uint64_t v3 = sub_E6C30();
  sub_B7108(0xD000000000000016, (void *)0x80000000000F3F60);
  sub_187B0();
  uint64_t v4 = sub_E6920();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  char v12 = v9 & 1;
  swift_retain();
  sub_18804(v4, v6, v10);
  swift_bridgeObjectRetain();
  sub_18814(v4, v6, v10);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = v12;
  *(void *)(a1 + 56) = v8;
  return result;
}

uint64_t sub_E31DC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v60 = sub_10C7C(&qword_125C20);
  uint64_t v59 = *(void *)(v60 - 8);
  uint64_t v3 = __chkstk_darwin(v60);
  char v57 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v62 = (char *)&v47 - v5;
  uint64_t v56 = sub_10C7C(&qword_125C28);
  uint64_t v55 = *(void *)(v56 - 8);
  uint64_t v6 = __chkstk_darwin(v56);
  uint64_t v54 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v9 = (char *)&v47 - v8;
  long long v72 = *(_OWORD *)(a1 + 16);
  uint64_t v73 = *(void **)(a1 + 32);
  sub_10C7C(&qword_123590);
  sub_E6E10();
  char v10 = v66;
  uint64_t v64 = a1;
  long long v72 = v65;
  uint64_t v73 = v66;
  swift_retain();
  swift_retain();
  id v11 = v10;
  *(void *)&long long v65 = sub_B7108(0xD000000000000013, (void *)0x80000000000F3F80);
  *((void *)&v65 + 1) = v12;
  sub_187B0();
  *(void *)&long long v65 = sub_E6920();
  *((void *)&v65 + 1) = v13;
  LOBYTE(v66) = v14 & 1;
  uint64_t v67 = v15;
  uint64_t v16 = sub_E55A8(0, (unint64_t *)&qword_124E30);
  uint64_t v17 = sub_10C7C(&qword_125C30);
  unint64_t v18 = sub_E55E4();
  unint64_t v50 = sub_E564C();
  unint64_t v51 = v18;
  uint64_t v61 = v9;
  BOOL v53 = (void (*)(char *, char *, uint64_t))v16;
  uint64_t v52 = v17;
  sub_E6DB0();

  swift_release();
  swift_release();
  long long v72 = *(_OWORD *)(a1 + 40);
  uint64_t v73 = *(void **)(a1 + 56);
  sub_E6E10();
  uint64_t v19 = v66;
  uint64_t v63 = a1;
  long long v72 = v65;
  uint64_t v73 = v66;
  uint64_t v49 = v65;
  swift_retain();
  swift_retain();
  id v48 = v19;
  uint64_t v47 = sub_E6560();
  *(void *)&long long v65 = sub_B7108(0xD000000000000015, (void *)0x80000000000F3FA0);
  *((void *)&v65 + 1) = v20;
  uint64_t v21 = sub_E6920();
  uint64_t v23 = v22;
  char v25 = v24;
  uint64_t v27 = v26;
  sub_E55A8(0, (unint64_t *)&qword_1255A0);
  long long v65 = *(_OWORD *)(a1 + 16);
  unsigned __int8 v66 = *(void **)(a1 + 32);
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  uint64_t v28 = v74;
  long long v65 = *(_OWORD *)(a1 + 40);
  unsigned __int8 v66 = *(void **)(a1 + 56);
  sub_E6DE0();
  long long v29 = v74;
  LOBYTE(v9) = sub_E7390();

  uint64_t v30 = 0;
  if (v9) {
    uint64_t v30 = sub_E6C30();
  }
  char v31 = v25 & 1;
  LOBYTE(v65) = v31;
  sub_18804(v21, v23, v31);
  swift_bridgeObjectRetain();
  sub_18814(v21, v23, v31);
  swift_bridgeObjectRelease();
  char v32 = v65;
  long long v65 = (unint64_t)v47;
  LOBYTE(v66) = 1;
  uint64_t v67 = v21;
  uint64_t v68 = v23;
  char v69 = v32;
  uint64_t v70 = v27;
  uint64_t v71 = v30;
  sub_10C7C(&qword_125C88);
  sub_E5830(&qword_125C90, &qword_125C88);
  uint64_t v33 = v62;
  sub_E6DB0();

  swift_release();
  swift_release();
  uint64_t v34 = v55;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v36 = v54;
  uint64_t v37 = v56;
  v35(v54, v61, v56);
  uint64_t v38 = v59;
  BOOL v53 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  char v39 = v57;
  uint64_t v40 = v33;
  uint64_t v41 = v60;
  v53(v57, v40, v60);
  uint64_t v42 = v58;
  v35(v58, v36, v37);
  uint64_t v43 = sub_10C7C(&qword_125C98);
  v53(&v42[*(int *)(v43 + 48)], v39, v41);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v38 + 8);
  v44(v62, v41);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v34 + 8);
  v45(v61, v37);
  v44(v39, v41);
  return ((uint64_t (*)(char *, uint64_t))v45)(v36, v37);
}

uint64_t sub_E389C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10C7C(&qword_125C30);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1)
  {
    id v8 = [*a1 unfusedFusableControllers];
    sub_E55A8(0, (unint64_t *)&qword_124E30);
    uint64_t v9 = sub_E7210();

    v11[1] = v9;
    swift_getKeyPath();
    sub_10C7C(&qword_124D58);
    sub_10C7C(&qword_125C50);
    sub_E5830(&qword_1255C0, &qword_124D58);
    sub_E55E4();
    sub_E56C0();
    sub_E6EB0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_E3E2C((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    uint64_t result = sub_E63E0();
    __break(1u);
  }
  return result;
}

id sub_E3AC8@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  id v4 = [*a1 localizedName];
  sub_E7110();

  sub_187B0();
  *(void *)a2 = sub_E6920();
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  *(void *)(a2 + 32) = v3;
  *(void *)(a2 + 40) = v3;
  id v8 = v3;

  return v8;
}

uint64_t sub_E3B78()
{
  return sub_E6D30();
}

uint64_t sub_E3BD8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 56);
  swift_retain();
  id v5 = v2;
  swift_retain();
  swift_retain();
  id v6 = v3;
  swift_retain();
  swift_retain();
  id v7 = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_E3C8C()
{
  return sub_E6D30();
}

unint64_t sub_E3CEC()
{
  unint64_t result = qword_125BA0;
  if (!qword_125BA0)
  {
    sub_11B60(&qword_125B80);
    sub_E3D8C();
    sub_E5830(&qword_125BB8, &qword_125BC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125BA0);
  }
  return result;
}

unint64_t sub_E3D8C()
{
  unint64_t result = qword_125BA8;
  if (!qword_125BA8)
  {
    sub_11B60(&qword_125B78);
    sub_E5830(&qword_125BB0, &qword_125B70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125BA8);
  }
  return result;
}

uint64_t sub_E3E2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_E3E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v19 = sub_10C7C(&qword_125BD8);
  __chkstk_darwin(v19);
  id v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10C7C(&qword_125910);
  uint64_t v5 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_E6680();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_10C7C(&qword_122CA8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E6660();
  uint64_t v22 = a1;
  sub_10C7C(&qword_122B88);
  sub_E5830(&qword_122BA0, &qword_122B88);
  sub_E6290();
  sub_E6670();
  uint64_t v21 = a1;
  sub_10C7C(&qword_122D28);
  sub_2E128();
  sub_E6290();
  uint64_t v13 = &v4[*(int *)(v19 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  char v14 = v13;
  uint64_t v15 = v18;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v14, v7, v18);
  sub_E65F0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_E4198@<X0>(uint64_t a1@<X8>)
{
  return sub_E3E74(*(void *)(v1 + 16), a1);
}

uint64_t sub_E41A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10C7C(&qword_122B88);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v20 = sub_B7108(1162760004, (void *)0xE400000000000000);
  *((void *)&v20 + 1) = v8;
  uint64_t v9 = (_OWORD *)swift_allocObject();
  long long v10 = *(_OWORD *)(a1 + 80);
  v9[5] = *(_OWORD *)(a1 + 64);
  v9[6] = v10;
  v9[7] = *(_OWORD *)(a1 + 96);
  long long v11 = *(_OWORD *)(a1 + 16);
  v9[1] = *(_OWORD *)a1;
  v9[2] = v11;
  long long v12 = *(_OWORD *)(a1 + 48);
  v9[3] = *(_OWORD *)(a1 + 32);
  v9[4] = v12;
  sub_E3BD8(a1);
  sub_187B0();
  sub_E6DA0();
  sub_E55A8(0, (unint64_t *)&qword_1255A0);
  long long v20 = *(_OWORD *)(a1 + 16);
  uint64_t v21 = *(void *)(a1 + 32);
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  uint64_t v13 = v22;
  long long v20 = *(_OWORD *)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 56);
  sub_E6DE0();
  char v14 = v22;
  char v15 = sub_E7390();

  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(unsigned char *)(v17 + 16) = v15 & 1;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(a2, v7, v4);
  uint64_t v18 = (uint64_t *)(a2 + *(int *)(sub_10C7C(&qword_122D28) + 36));
  *uint64_t v18 = KeyPath;
  v18[1] = (uint64_t)sub_E53B8;
  _OWORD v18[2] = v17;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_E440C(uint64_t a1)
{
  uint64_t v2 = sub_E6050();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v63 = *(_OWORD *)(a1 + 64);
  LOBYTE(v64) = *(unsigned char *)(a1 + 80);
  LOBYTE(v60) = 0;
  sub_10C7C(&qword_122890);
  sub_E6DF0();
  sub_E6040();
  uint64_t v59 = sub_E5FF0();
  uint64_t v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  long long v63 = *(_OWORD *)(a1 + 88);
  uint64_t v64 = *(void *)(a1 + 104);
  sub_10C7C(&qword_122CB8);
  sub_E6D20();
  uint64_t v55 = v60;
  long long v63 = *(_OWORD *)(a1 + 16);
  uint64_t v64 = *(void *)(a1 + 32);
  long long v60 = *(_OWORD *)(a1 + 16);
  uint64_t v61 = *(void *)(a1 + 32);
  swift_bridgeObjectRetain();
  sub_10C7C(&qword_123590);
  sub_E6DE0();
  id v8 = v62;
  id v9 = [v62 productCategoryKey];

  uint64_t v10 = sub_E7110();
  uint64_t v56 = v11;
  id v57 = (id)v10;

  long long v60 = *(_OWORD *)(a1 + 16);
  uint64_t v61 = *(void *)(a1 + 32);
  sub_E6DE0();
  id v12 = v62;
  id v58 = [v62 shareButton];

  long long v60 = *(_OWORD *)(a1 + 16);
  uint64_t v61 = *(void *)(a1 + 32);
  sub_E6DE0();
  id v13 = v62;
  id v14 = [v62 buttons];

  sub_E55A8(0, (unint64_t *)&qword_123B68);
  sub_E7050();

  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v15 = v62;
  id v16 = [v62 dpads];

  uint64_t v53 = sub_E7050();
  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v17 = v62;
  id v18 = [v62 logoSfSymbolsName];

  uint64_t v19 = sub_E7110();
  uint64_t v51 = v20;
  uint64_t v52 = v19;

  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v21 = v62;
  unsigned int v50 = [v62 supportsHaptics];

  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v22 = v62;
  unsigned int v49 = [v62 supportsLight];

  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v23 = v62;
  id v48 = [v62 baseProfile];

  id v47 = objc_allocWithZone((Class)GCSController);
  NSString v24 = sub_E70D0();
  swift_bridgeObjectRelease();
  uint64_t v54 = v7;
  NSString v25 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v26 = sub_E70D0();
  swift_bridgeObjectRelease();
  Class isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  Class v28 = sub_E7040().super.isa;
  swift_bridgeObjectRelease();
  NSString v29 = sub_E70D0();
  swift_bridgeObjectRelease();
  uint64_t v30 = v48;
  BYTE1(v46) = v49;
  LOBYTE(v46) = v50;
  char v31 = v58;
  id v57 = objc_msgSend(v47, "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:", v24, v25, v26, 0, v58, isa, v28, v29, v46, v48, 0);

  long long v60 = v63;
  uint64_t v61 = v64;
  sub_E6DE0();
  id v32 = v62;
  id v33 = [v62 persistentIdentifier];

  sub_E7110();
  long long v60 = *(_OWORD *)(a1 + 40);
  uint64_t v61 = *(void *)(a1 + 56);
  sub_E6DE0();
  id v34 = v62;
  id v35 = [v62 persistentIdentifier];

  sub_E7110();
  id v36 = objc_allocWithZone((Class)GCSCopilotFusedController);
  NSString v37 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v38 = sub_E70D0();
  swift_bridgeObjectRelease();
  NSString v39 = sub_E70D0();
  swift_bridgeObjectRelease();
  id v40 = [v36 initWithFusedControllerIdentifier:v37 pilotIdentifier:v38 copilotIdentifier:v39];

  if (*(void *)a1)
  {
    uint64_t v41 = *(id *)a1;
    char v42 = sub_A1D54();
    (*(void (**)(id, void))((char *)&stru_298.size + (swift_isaMask & *v41)))(v40, v42 & 1);

    uint64_t v43 = v41;
    char v44 = sub_A33F0();
    uint64_t v45 = v57;
    (*(void (**)(id, void))&stru_2E8.segname[(swift_isaMask & *v43) + 8])(v57, v44 & 1);
  }
  else
  {
    type metadata accessor for GCSPreferencesStore();
    sub_E3E2C((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);
    sub_E63E0();
    __break(1u);
  }
}

uint64_t sub_E4BA0()
{
  type metadata accessor for GCSPreferencesStore();
  sub_E3E2C((unint64_t *)&qword_1227D8, (void (*)(uint64_t))type metadata accessor for GCSPreferencesStore);

  return sub_E63F0();
}

__n128 sub_E4C14@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  sub_E6D10();
  __n128 result = v22;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(void *)(a9 + 72) = a11;
  *(unsigned char *)(a9 + 80) = a12;
  *(__n128 *)(a9 + 88) = v22;
  *(void *)(a9 + 104) = v23;
  return result;
}

uint64_t sub_E4CCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E4CF0()
{
  return sub_E69D0();
}

uint64_t sub_E4D0C@<X0>(uint64_t a1@<X8>)
{
  return sub_E26A4(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for GCSCopilotSheetView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GCSCopilotSheetView(id *a1)
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for GCSCopilotSheetView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v7 = *(void **)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v6;
  id v8 = *(void **)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v10 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  id v11 = v3;
  swift_retain();
  swift_retain();
  id v12 = v7;
  swift_retain();
  swift_retain();
  id v13 = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GCSCopilotSheetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void **)(a2 + 32);
  id v8 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v7;
  id v9 = v7;

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  uint64_t v10 = *(void **)(a2 + 56);
  id v11 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  id v12 = v10;

  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GCSCopilotSheetView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  swift_release();
  uint64_t v5 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GCSCopilotSheetView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GCSCopilotSheetView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GCSCopilotSheetView()
{
  return &type metadata for GCSCopilotSheetView;
}

uint64_t sub_E51AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_E52D4()
{
  uint64_t v1 = *(_OWORD **)(v0 + 16);
  sub_B7108(0x4C45434E4143, (void *)0xE600000000000000);
  unint64_t v2 = (_OWORD *)swift_allocObject();
  long long v4 = v1[1];
  long long v3 = v1[2];
  v2[1] = *v1;
  v2[2] = v4;
  v2[3] = v3;
  long long v5 = v1[6];
  long long v7 = v1[3];
  long long v6 = v1[4];
  v2[6] = v1[5];
  v2[7] = v5;
  v2[4] = v7;
  v2[5] = v6;
  sub_E3BD8((uint64_t)v1);
  sub_187B0();
  return sub_E6DA0();
}

uint64_t sub_E5394@<X0>(uint64_t a1@<X8>)
{
  return sub_E41A0(*(void *)(v1 + 16), a1);
}

void sub_E53A0()
{
  sub_E440C(v0 + 16);
}

uint64_t sub_E53A8()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_E53B8(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_E53D4()
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_E545C()
{
  return sub_E6DF0();
}

uint64_t sub_E54B0@<X0>(char *a1@<X8>)
{
  return sub_E31DC(*(void *)(v1 + 16), a1);
}

uint64_t sub_E54B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10C7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_E551C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10C7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_E5578@<X0>(uint64_t a1@<X8>)
{
  return sub_E389C(*(id **)(v1 + 16), a1);
}

uint64_t sub_E55A8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_E55E4()
{
  unint64_t result = qword_125C38;
  if (!qword_125C38)
  {
    sub_E55A8(255, (unint64_t *)&qword_124E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125C38);
  }
  return result;
}

unint64_t sub_E564C()
{
  unint64_t result = qword_125C40;
  if (!qword_125C40)
  {
    sub_11B60(&qword_125C30);
    sub_E56C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125C40);
  }
  return result;
}

unint64_t sub_E56C0()
{
  unint64_t result = qword_125C48;
  if (!qword_125C48)
  {
    sub_11B60(&qword_125C50);
    sub_E5760();
    sub_E5830(&qword_125C78, &qword_125C80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125C48);
  }
  return result;
}

unint64_t sub_E5760()
{
  unint64_t result = qword_125C58;
  if (!qword_125C58)
  {
    sub_11B60(&qword_125C60);
    sub_E5830(&qword_125C68, &qword_125C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_125C58);
  }
  return result;
}

uint64_t sub_E5800@<X0>(uint64_t a1@<X8>)
{
  return sub_E389C(*(id **)(v1 + 16), a1);
}

uint64_t sub_E5830(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_11B60(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_E5874()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

BOOL sub_E58A8(int a1, int a2, int a3)
{
  if (qword_12B670 == -1)
  {
    BOOL v6 = dword_12B660 < a1;
    if (dword_12B660 > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_12B670, 0, (dispatch_function_t)sub_E599C);
    BOOL v6 = dword_12B660 < a1;
    if (dword_12B660 > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_12B664 > a2) {
    return 1;
  }
  return dword_12B664 >= a2 && dword_12B668 >= a3;
}

uint64_t sub_E599C()
{
  return sub_E5B48(1);
}

uint64_t sub_E59A4(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_12B678 == -1)
  {
    if (qword_12B680) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_12B678, 0, (dispatch_function_t)sub_E5B40);
    if (qword_12B680) {
      return _availability_version_check();
    }
  }
  if (qword_12B670 == -1)
  {
    BOOL v8 = dword_12B660 < a2;
    if (dword_12B660 > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_12B670, 0, (dispatch_function_t)sub_E599C);
    BOOL v8 = dword_12B660 < a2;
    if (dword_12B660 > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_12B664 > a3) {
    return 1;
  }
  return dword_12B664 >= a3 && dword_12B668 >= a4;
}

uint64_t sub_E5B40()
{
  return sub_E5B48(0);
}

uint64_t sub_E5B48(uint64_t result)
{
  uint64_t v1 = (uint64_t (**)(void))qword_12B680;
  if (qword_12B680) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (&__availability_version_check)
    {
      uint64_t v1 = &__availability_version_check;
      qword_12B680 = (uint64_t)&__availability_version_check;
    }
    if (!v1 || result != 0)
    {
      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        long long v4 = *(unsigned __int8 **)result;
        uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            long long v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                id v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  uint64_t v10 = (uint64_t (*)(uint64_t))result;
                  uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    id v11 = (uint64_t (*)(void))result;
                    uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    Class v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      uint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        id v12 = (FILE *)result;
                        uint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          id v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            id v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            id v16 = malloc(v15);
                            if (v16)
                            {
                              NSString v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &dword_12B660, &dword_12B664, &dword_12B668);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                id v16 = v26;
                              }
                              else
                              {
                                id v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_E5E80()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_E5E90()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_E5EA0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5EB0()
{
  return type metadata accessor for Notification();
}

uint64_t sub_E5EC0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_E5ED0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_E5EE0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_E5EF0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_E5F00()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_E5F10()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_E5F20()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_E5F30()
{
  return _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
}

void sub_E5F40(NSURL *retstr@<X8>)
{
}

uint64_t sub_E5F50()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5F60()
{
  return type metadata accessor for URL();
}

NSData sub_E5F70()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_E5F80()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5F90()
{
  return Data.subscript.getter();
}

NSDate sub_E5FA0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_E5FB0()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_E5FC0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E5FD0()
{
  return Date.init()();
}

uint64_t sub_E5FE0()
{
  return type metadata accessor for Date();
}

uint64_t sub_E5FF0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_E6000()
{
  return UUID.description.getter();
}

NSUUID sub_E6010()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_E6020()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_E6030()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E6040()
{
  return UUID.init()();
}

uint64_t sub_E6050()
{
  return type metadata accessor for UUID();
}

uint64_t sub_E6060()
{
  return static Locale.preferredLanguages.getter();
}

uint64_t sub_E6070()
{
  return static Locale.current.getter();
}

uint64_t sub_E6080()
{
  return type metadata accessor for Locale();
}

uint64_t sub_E6090()
{
  return IndexSet.first.getter();
}

uint64_t sub_E60A0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_E60B0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_E60C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_E60D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_E60E0()
{
  return type metadata accessor for Logger();
}

void sub_E60F0()
{
}

uint64_t sub_E6100()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_E6110()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_E6120()
{
  return Just.init(_:)();
}

uint64_t sub_E6130()
{
  return Published.init(initialValue:)();
}

uint64_t sub_E6140()
{
  return Published.projectedValue.getter();
}

uint64_t sub_E6150()
{
  return Published.projectedValue.setter();
}

uint64_t sub_E6160()
{
  return static Published.subscript.modify();
}

uint64_t sub_E6170()
{
  return static Published.subscript.getter();
}

uint64_t sub_E6180()
{
  return static Published.subscript.setter();
}

uint64_t sub_E6190()
{
  return type metadata accessor for Published();
}

uint64_t sub_E61A0()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_E61B0()
{
  return Publisher<>.assign<A>(to:on:)();
}

uint64_t sub_E61C0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_E61D0()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_E61E0()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_E61F0()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_E6200()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_E6210()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_E6230()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_E6240()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_E6250()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_E6260()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_E6270()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_E6280()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_E6290()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_E62A0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

void sub_E62B0()
{
}

uint64_t sub_E62C0()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_E62D0()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_E62E0()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_E62F0()
{
  return NavigationLink.init<A>(destination:tag:selection:label:)();
}

uint64_t sub_E6300()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_E6310()
{
  return NavigationView.init(content:)();
}

uint64_t sub_E6320()
{
  return static SubmitTriggers.text.getter();
}

uint64_t sub_E6330()
{
  return type metadata accessor for SubmitTriggers();
}

uint64_t sub_E6340()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_E6350()
{
  return static KeyboardShortcut.defaultAction.getter();
}

uint64_t sub_E6360()
{
  return type metadata accessor for KeyboardShortcut();
}

uint64_t sub_E6370()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_E6380()
{
  return type metadata accessor for PlainButtonStyle();
}

void sub_E6390()
{
}

uint64_t sub_E63A0()
{
  return type metadata accessor for PresentationMode();
}

uint64_t sub_E63B0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_E63C0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_E63E0()
{
  return EnvironmentObject.error()();
}

uint64_t sub_E63F0()
{
  return EnvironmentObject.init()();
}

uint64_t sub_E6400()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_E6410()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_E6420()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_E6430()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_E6440()
{
  return EnvironmentValues.isPresented.getter();
}

uint64_t sub_E6450()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_E6460()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_E6470()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_E6480()
{
  return EnvironmentValues.presentationMode.getter();
}

uint64_t sub_E6490()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_E64A0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_E64B0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_E64C0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_E64D0()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_E64E0()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_E64F0()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_E6500()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_E6510()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_E6520()
{
  return EnvironmentValues.init()();
}

uint64_t sub_E6530()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_E6540()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_E6550()
{
  return static VerticalAlignment.firstTextLineCenter.getter();
}

uint64_t sub_E6560()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_E6570()
{
  return IconOnlyLabelStyle.init()();
}

uint64_t sub_E6580()
{
  return type metadata accessor for IconOnlyLabelStyle();
}

uint64_t sub_E6590()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_E65A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_E65B0()
{
  return static AccessibilityTraits.isSelected.getter();
}

uint64_t sub_E65C0()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_E65D0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_E65E0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_E65F0()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_E6600()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_E6610()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_E6620()
{
  return static SearchFieldPlacement.navigationBarDrawer(displayMode:)();
}

uint64_t sub_E6630()
{
  return static SearchFieldPlacement.NavigationBarDrawerDisplayMode.always.getter();
}

uint64_t sub_E6640()
{
  return type metadata accessor for SearchFieldPlacement.NavigationBarDrawerDisplayMode();
}

uint64_t sub_E6650()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_E6660()
{
  return static ToolbarItemPlacement.cancellationAction.getter();
}

uint64_t sub_E6670()
{
  return static ToolbarItemPlacement.confirmationAction.getter();
}

uint64_t sub_E6680()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_E6690()
{
  return BorderlessButtonStyle.init()();
}

uint64_t sub_E66A0()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t sub_E66B0()
{
  return InsetGroupedFormStyle.init()();
}

uint64_t sub_E66C0()
{
  return type metadata accessor for InsetGroupedFormStyle();
}

uint64_t sub_E66D0()
{
  return InsetGroupedListStyle.init()();
}

uint64_t sub_E66E0()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t sub_E66F0()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_E6700()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_E6710()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_E6720()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_E6730()
{
  return type metadata accessor for PopoverAttachmentAnchor();
}

uint64_t sub_E6740()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_E6750()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_E6760()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_E6770()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_E6780()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_E6790()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_E67A0()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_E67B0()
{
  return Edge.Set.init(_:)();
}

uint64_t sub_E67C0()
{
  return static Font.title.getter();
}

uint64_t sub_E67D0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_E67E0()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_E67F0()
{
  return static Font.Weight.regular.getter();
}

uint64_t sub_E6800()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_E6810()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_E6820()
{
  return static Font.system(_:design:weight:)();
}

uint64_t sub_E6830()
{
  return static Font.title3.getter();
}

uint64_t sub_E6840()
{
  return Font.weight(_:)();
}

uint64_t sub_E6850()
{
  return static Font.footnote.getter();
}

uint64_t sub_E6860()
{
  return static Font.headline.getter();
}

uint64_t sub_E6870()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t sub_E6880()
{
  return Form.init<A, B>(content:footer:)();
}

uint64_t sub_E6890()
{
  return Form.init(content:)();
}

uint64_t sub_E68A0()
{
  return List.init(selection:content:)();
}

uint64_t sub_E68B0()
{
  return List<>.init(content:)();
}

uint64_t sub_E68C0()
{
  return Path.init(_:)();
}

uint64_t sub_E68D0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_E68E0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_E68F0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_E6900()
{
  return Text.font(_:)();
}

uint64_t sub_E6910()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_E6920()
{
  return Text.init<A>(_:)();
}

uint64_t sub_E6930()
{
  return View.settingsListAppearance()();
}

uint64_t sub_E6940()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_E6950()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_E6960()
{
  return View.fontWeight(_:)();
}

uint64_t sub_E6970()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_E6980()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_E6990()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_E69A0()
{
  return View.popoverCore<A>(isPresented:attachmentAnchor:arrowEdges:isDetachable:content:)();
}

uint64_t sub_E69B0()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_E69C0()
{
  return View.accessibility(label:)();
}

uint64_t sub_E69D0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_E69E0()
{
  return View.navigationTitle<A>(_:)();
}

uint64_t sub_E69F0()
{
  return View.keyboardShortcut(_:)();
}

uint64_t sub_E6A00()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_E6A10()
{
  return View.confirmationDialog<A, B>(_:isPresented:titleVisibility:actions:)();
}

uint64_t sub_E6A20()
{
  return View.navigationBarTitle<A>(_:displayMode:)();
}

uint64_t sub_E6A30()
{
  return View.disableAutocorrection(_:)();
}

uint64_t sub_E6A40()
{
  return View.navigationBarTitleDisplayMode(_:)();
}

uint64_t sub_E6A50()
{
  return View.help<A>(_:)();
}

uint64_t sub_E6A60()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_E6A70()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_E6A80()
{
  return View.onSubmit(of:_:)();
}

uint64_t sub_E6A90()
{
  return View.formStyle<A>(_:)();
}

uint64_t sub_E6AA0()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_E6AB0()
{
  return Color.init(cgColor:)();
}

uint64_t sub_E6AC0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_E6AD0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_E6AF0()
{
  return Color.init(hue:saturation:brightness:opacity:)();
}

uint64_t sub_E6B00()
{
  return static Color.red.getter();
}

uint64_t sub_E6B10()
{
  return static Color.blue.getter();
}

uint64_t sub_E6B20()
{
  return static Color.gray.getter();
}

uint64_t sub_E6B30()
{
  return Color.hash(into:)();
}

uint64_t sub_E6B40()
{
  return static Color.pink.getter();
}

uint64_t sub_E6B50()
{
  return static Color.teal.getter();
}

uint64_t sub_E6B60()
{
  return static Color.black.getter();
}

uint64_t sub_E6B70()
{
  return static Color.brown.getter();
}

uint64_t sub_E6B80()
{
  return static Color.clear.getter();
}

uint64_t sub_E6B90()
{
  return static Color.green.getter();
}

uint64_t sub_E6BA0()
{
  return static Color.white.getter();
}

uint64_t sub_E6BB0()
{
  return static Color.indigo.getter();
}

uint64_t sub_E6BC0()
{
  return static Color.orange.getter();
}

uint64_t sub_E6BD0()
{
  return static Color.purple.getter();
}

uint64_t sub_E6BE0()
{
  return Color.opacity(_:)();
}

uint64_t sub_E6BF0()
{
  return static Color.primary.getter();
}

uint64_t sub_E6C00()
{
  return static Color.secondary.getter();
}

uint64_t sub_E6C10()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_E6C20()
{
  return Image.init(uiImage:)();
}

uint64_t sub_E6C30()
{
  return Image.init(systemName:)();
}

uint64_t sub_E6C40()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_E6C50()
{
  return type metadata accessor for Image.Interpolation();
}

uint64_t sub_E6C60()
{
  return Image.interpolation(_:)();
}

uint64_t sub_E6C70()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_E6C80()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_E6C90()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_E6CA0()
{
  return Label<>.init<A>(_:systemImage:)();
}

uint64_t sub_E6CD0()
{
  return Shape.layoutDirectionBehavior.getter();
}

uint64_t sub_E6CF0()
{
  return static Shape.role.getter();
}

uint64_t sub_E6D10()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_E6D20()
{
  return State.wrappedValue.getter();
}

uint64_t sub_E6D30()
{
  return State.wrappedValue.setter();
}

uint64_t sub_E6D40()
{
  return State.projectedValue.getter();
}

uint64_t sub_E6D50()
{
  return type metadata accessor for State();
}

uint64_t sub_E6D60()
{
  return static Anchor.Source<A>.bounds.getter();
}

uint64_t sub_E6D70()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_E6D80()
{
  return Button.init(action:label:)();
}

uint64_t sub_E6D90()
{
  return Button<>.init(_:action:)();
}

uint64_t sub_E6DA0()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_E6DB0()
{
  return Picker.init(selection:label:content:)();
}

uint64_t sub_E6DC0()
{
  return Picker<>.init<A>(_:selection:content:)();
}

uint64_t sub_E6DD0()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_E6DE0()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_E6DF0()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_E6E00()
{
  return Binding.subscript.getter();
}

uint64_t sub_E6E10()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_E6E20()
{
  return Binding.init(get:set:)();
}

uint64_t sub_E6E30()
{
  return Binding.init(get:set:)();
}

uint64_t sub_E6E40()
{
  return Binding<A>.startIndex.getter();
}

uint64_t sub_E6E50()
{
  return Binding<A>.endIndex.getter();
}

uint64_t sub_E6E60()
{
  return Binding<A>.formIndex(after:)();
}

uint64_t sub_E6E70()
{
  return Binding<A>.subscript.getter();
}

uint64_t sub_E6E80()
{
  return type metadata accessor for Binding();
}

uint64_t sub_E6E90()
{
  return Divider.init()();
}

uint64_t sub_E6EA0()
{
  return type metadata accessor for Divider();
}

uint64_t sub_E6EB0()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_E6EC0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_E6ED0()
{
  return Section<>.init(header:footer:content:)();
}

uint64_t sub_E6EE0()
{
  return Section<>.init(content:)();
}

uint64_t sub_E6EF0()
{
  return Gradient.init(colors:)();
}

uint64_t sub_E6F00()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t sub_E6F10()
{
  return type metadata accessor for GridItem();
}

uint64_t sub_E6F20()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t sub_E6F30()
{
  return static Alignment.center.getter();
}

uint64_t sub_E6F40()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t sub_E6F50()
{
  return static Animation.easeInOut(duration:)();
}

uint64_t sub_E6F60()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_E6F70()
{
  return TextField.init(text:prompt:label:)();
}

uint64_t sub_E6F80()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_E6F90()
{
  return static UnitPoint.bottomTrailing.getter();
}

uint64_t sub_E6FA0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_E6FB0()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_E6FC0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_E6FD0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_E6FE0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_E6FF0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_E7000()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_E7010()
{
  return static DispatchTime.now()();
}

uint64_t sub_E7020()
{
  return DispatchTime.advanced(by:)();
}

uint64_t sub_E7030()
{
  return type metadata accessor for DispatchTime();
}

NSDictionary sub_E7040()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_E7050()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E7060()
{
  return Dictionary.description.getter();
}

uint64_t sub_E7070()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_E7080()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_E7090()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_E70A0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_E70B0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_E70C0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_E70D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_E70E0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_E70F0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E7100()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_E7110()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E7120()
{
  return String.init(format:_:)();
}

uint64_t sub_E7130()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_E7140()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_E7150()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_E7160()
{
  return String.debugDescription.getter();
}

uint64_t sub_E7170()
{
  return String.hash(into:)();
}

uint64_t sub_E7180()
{
  return String.count.getter();
}

uint64_t sub_E7190()
{
  return String.index(before:)();
}

void sub_E71A0(Swift::String a1)
{
}

uint64_t sub_E71C0()
{
  return String.init(cString:)();
}

Swift::Int sub_E71D0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_E71E0()
{
  return String.subscript.getter();
}

uint64_t sub_E71F0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_E7200()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_E7210()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E7220()
{
  return Array.description.getter();
}

uint64_t sub_E7230()
{
  return specialized Array._endMutation()();
}

uint64_t sub_E7240()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_E7250()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_E7260()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_E7270()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_E7280()
{
  return static MainActor.shared.getter();
}

uint64_t sub_E7290()
{
  return type metadata accessor for MainActor();
}

NSNumber sub_E72A0()
{
  return Float._bridgeToObjectiveC()();
}

NSSet sub_E72B0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_E72C0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E72D0()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_E72E0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_E72F0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_E7300()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_E7310()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_E7320()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_E7330()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_E7340()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_E7350()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_E7360()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_E7370()
{
  return NSArray.makeIterator()();
}

uint64_t sub_E7380()
{
  return UIColor.init(_:)();
}

uint64_t sub_E7390()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_E73A0()
{
  return NSObject.hash(into:)();
}

uint64_t sub_E73B0()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_E73C0()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_E73D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_E73E0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_E73F0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_E7400()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_E7410()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_E7420()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t sub_E7430()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_E7440()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_E7460()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_E7470()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_E7480()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_E7490()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_E74A0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_E74B0(Swift::Int a1)
{
}

uint64_t sub_E74C0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_E74D0()
{
  return Identifiable<>.id.getter();
}

uint64_t sub_E74E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_E74F0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_E7500()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_E7510()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_E7520()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_E7530()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_E7540()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_E7550()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_E7560()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E7570()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_E7580()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_E7590()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_E75A0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_E75B0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_E75D0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_E75F0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_E7600()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_E7610()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_E7620()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_E7630()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E7640()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E7650()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_E7660()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_E7670()
{
  return Hasher.init(_seed:)();
}

void sub_E7680(Swift::UInt a1)
{
}

void sub_E7690(Swift::UInt8 a1)
{
}

Swift::Int sub_E76A0()
{
  return Hasher._finalize()();
}

uint64_t sub_E76B0()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return _AXNameFromColor(color);
}

uint64_t CBDeviceTypeToString()
{
  return _CBDeviceTypeToString();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateGenericRGB(red, green, blue, alpha);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

uint64_t CUPrintNSDataAddress()
{
  return _CUPrintNSDataAddress();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return _SBSCopyDisplayIdentifiers();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _availability_version_check()
{
  return __availability_version_check();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_UIImage(void *a1, const char *a2, ...)
{
  return _[a1 UIImage];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allButtons(void *a1, const char *a2, ...)
{
  return _[a1 allButtons];
}

id objc_msgSend_allDpads(void *a1, const char *a2, ...)
{
  return _[a1 allDpads];
}

id objc_msgSend_appIconImageForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appIconImageForBundleIdentifier:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return _[a1 apps];
}

id objc_msgSend_appsWithSettings(void *a1, const char *a2, ...)
{
  return _[a1 appsWithSettings];
}

id objc_msgSend_appsWithoutSettings(void *a1, const char *a2, ...)
{
  return _[a1 appsWithoutSettings];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _[a1 blueColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttons(void *a1, const char *a2, ...)
{
  return _[a1 buttons];
}

id objc_msgSend_buttonsSectionsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 buttonsSectionsSpecifiers];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return _[a1 clearCache];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_configurationWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEngineWithLocality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEngineWithLocality:");
}

id objc_msgSend_createPlayerWithPattern_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPlayerWithPattern:error:");
}

id objc_msgSend_customizableControllers(void *a1, const char *a2, ...)
{
  return _[a1 customizableControllers];
}

id objc_msgSend_customizationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 customizationsEnabled];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_deleteButtonSpecifierWithName_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButtonSpecifierWithName:target:action:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailedProductCategory(void *a1, const char *a2, ...)
{
  return _[a1 detailedProductCategory];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceListSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 deviceListSpecifiers];
}

id objc_msgSend_deviceSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 deviceSpecifiers];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didSelectItemInRemapController_item_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelectItemInRemapController:item:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayContentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayContentController:");
}

id objc_msgSend_dstAuxiliaryButtons(void *a1, const char *a2, ...)
{
  return _[a1 dstAuxiliaryButtons];
}

id objc_msgSend_dstDpads(void *a1, const char *a2, ...)
{
  return _[a1 dstDpads];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_elementMappings(void *a1, const char *a2, ...)
{
  return _[a1 elementMappings];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_eraseAllSettings(void *a1, const char *a2, ...)
{
  return _[a1 eraseAllSettings];
}

id objc_msgSend_extendedGamepad(void *a1, const char *a2, ...)
{
  return _[a1 extendedGamepad];
}

id objc_msgSend_filterSupportedApps(void *a1, const char *a2, ...)
{
  return _[a1 filterSupportedApps];
}

id objc_msgSend_filteredApps(void *a1, const char *a2, ...)
{
  return _[a1 filteredApps];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_generateElementDictionaryFromElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateElementDictionaryFromElements:");
}

id objc_msgSend_gestureCustomizationSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 gestureCustomizationSpecifiers];
}

id objc_msgSend_gestureModeForGestureType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gestureModeForGestureType:");
}

id objc_msgSend_getMappableElementsToSystemGesturesElements(void *a1, const char *a2, ...)
{
  return _[a1 getMappableElementsToSystemGesturesElements];
}

id objc_msgSend_getRemappableElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRemappableElements:");
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _[a1 greenColor];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_haptics(void *a1, const char *a2, ...)
{
  return _[a1 haptics];
}

id objc_msgSend_hapticsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hapticsEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_iconImageView(void *a1, const char *a2, ...)
{
  return _[a1 iconImageView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageDescriptorNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageDescriptorNamed:");
}

id objc_msgSend_imageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForDescriptor:");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForController:");
}

id objc_msgSend_initSettings(void *a1, const char *a2, ...)
{
  return _[a1 initSettings];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_forController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:forController:");
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:scale:orientation:");
}

id objc_msgSend_initWithController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithController:");
}

id objc_msgSend_initWithData_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:ofType:");
}

id objc_msgSend_initWithElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElement:");
}

id objc_msgSend_initWithEventType_parameters_relativeTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventType:parameters:relativeTime:");
}

id objc_msgSend_initWithEvents_parameters_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEvents:parameters:error:");
}

id objc_msgSend_initWithISImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithISImage:");
}

id objc_msgSend_initWithName_nameLocalizationKey_sfSymbolsName_remappingKey_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:");
}

id objc_msgSend_initWithName_persistentIdentifier_productCategoryKey_hidden_shareButton_buttons_dpads_logoSfSymbolsName_supportsHaptics_supportsLight_baseProfile_miscellaneous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:persistentIdentifier:productCategoryKey:hidden:shareButton:buttons:dpads:logoSfSymbolsName:supportsHaptics:supportsLight:baseProfile:miscellaneous:");
}

id objc_msgSend_initWithParameterID_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParameterID:value:");
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchResultsController:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTextAlignment_location_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTextAlignment:location:options:");
}

id objc_msgSend_insertContiguousSpecifiers_afterSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifier:animated:");
}

id objc_msgSend_instance(void *a1, const char *a2, ...)
{
  return _[a1 instance];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invertHorizontally(void *a1, const char *a2, ...)
{
  return _[a1 invertHorizontally];
}

id objc_msgSend_invertVertically(void *a1, const char *a2, ...)
{
  return _[a1 invertVertically];
}

id objc_msgSend_isComponentBased(void *a1, const char *a2, ...)
{
  return _[a1 isComponentBased];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_light(void *a1, const char *a2, ...)
{
  return _[a1 light];
}

id objc_msgSend_loadCustomizableApps(void *a1, const char *a2, ...)
{
  return _[a1 loadCustomizableApps];
}

id objc_msgSend_loadDevice(void *a1, const char *a2, ...)
{
  return _[a1 loadDevice];
}

id objc_msgSend_loadDevices(void *a1, const char *a2, ...)
{
  return _[a1 loadDevices];
}

id objc_msgSend_loadLightData(void *a1, const char *a2, ...)
{
  return _[a1 loadLightData];
}

id objc_msgSend_loadRemappableButtons(void *a1, const char *a2, ...)
{
  return _[a1 loadRemappableButtons];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logicalElementForPhysicalPressOf_onPhysicalInputProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logicalElementForPhysicalPressOf:onPhysicalInputProfile:");
}

id objc_msgSend_makeSwiftUIView(void *a1, const char *a2, ...)
{
  return _[a1 makeSwiftUIView];
}

id objc_msgSend_mappableToSystemGestures(void *a1, const char *a2, ...)
{
  return _[a1 mappableToSystemGestures];
}

id objc_msgSend_mappingForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappingForElement:");
}

id objc_msgSend_mappingKey(void *a1, const char *a2, ...)
{
  return _[a1 mappingKey];
}

id objc_msgSend_miscellaneous(void *a1, const char *a2, ...)
{
  return _[a1 miscellaneous];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigateBackToPreviousViewController(void *a1, const char *a2, ...)
{
  return _[a1 navigateBackToPreviousViewController];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newBaseProfile(void *a1, const char *a2, ...)
{
  return _[a1 newBaseProfile];
}

id objc_msgSend_newSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 newSpecifiers];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onLoadItemInRemapController_item_cell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onLoadItemInRemapController:item:cell:");
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return _[a1 orangeColor];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return _[a1 parentController];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_physicalInputProfile(void *a1, const char *a2, ...)
{
  return _[a1 physicalInputProfile];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithFormat_argumentArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:argumentArray:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_prepareImageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageForDescriptor:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_primaryAlias(void *a1, const char *a2, ...)
{
  return _[a1 primaryAlias];
}

id objc_msgSend_productCategory(void *a1, const char *a2, ...)
{
  return _[a1 productCategory];
}

id objc_msgSend_productCategoryLocalizationKeyForProductCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productCategoryLocalizationKeyForProductCategory:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_purpleColor(void *a1, const char *a2, ...)
{
  return _[a1 purpleColor];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerSettingsCustomizedHandler_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSettingsCustomizedHandler:forKey:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_remappable(void *a1, const char *a2, ...)
{
  return _[a1 remappable];
}

id objc_msgSend_remappedElementView(void *a1, const char *a2, ...)
{
  return _[a1 remappedElementView];
}

id objc_msgSend_remappingKey(void *a1, const char *a2, ...)
{
  return _[a1 remappingKey];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeHapticEngines(void *a1, const char *a2, ...)
{
  return _[a1 removeHapticEngines];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_replayKitGestureSettings(void *a1, const char *a2, ...)
{
  return _[a1 replayKitGestureSettings];
}

id objc_msgSend_restoreElementMappingToDefault(void *a1, const char *a2, ...)
{
  return _[a1 restoreElementMappingToDefault];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveLight(void *a1, const char *a2, ...)
{
  return _[a1 saveLight];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_screenShotEnabled(void *a1, const char *a2, ...)
{
  return _[a1 screenShotEnabled];
}

id objc_msgSend_screenShotGesture(void *a1, const char *a2, ...)
{
  return _[a1 screenShotGesture];
}

id objc_msgSend_screenShotKey(void *a1, const char *a2, ...)
{
  return _[a1 screenShotKey];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return _[a1 searchController];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sendSettingsEnteredEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendSettingsEnteredEvent];
}

id objc_msgSend_sendSettingsIdentifyControllerEventForProductCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSettingsIdentifyControllerEventForProductCategory:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApps:");
}

id objc_msgSend_setAppsWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsWithSettings:");
}

id objc_msgSend_setAppsWithoutSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsWithoutSettings:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setChecked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChecked:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCustomization_toValue_forDpad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomization:toValue:forDpad:");
}

id objc_msgSend_setCustomizationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomizationsEnabled:");
}

id objc_msgSend_setDefinesPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefinesPresentationContext:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFilteredApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteredApps:");
}

id objc_msgSend_setFindingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFindingController:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setGestureMode_forGestureType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGestureMode:forGestureType:");
}

id objc_msgSend_setHapticsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHapticsEnabled:");
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSearchBarWhenScrolling:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInvertHorizontally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvertHorizontally:");
}

id objc_msgSend_setInvertVertically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvertVertically:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setMappingForElement_toElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappingForElement:toElement:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentController:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setReplayKitGestureSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReplayKitGestureSettings:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setScreenShotEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShotEnabled:");
}

id objc_msgSend_setScreenShotGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShotGesture:");
}

id objc_msgSend_setScreenShotKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenShotKey:");
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchController:");
}

id objc_msgSend_setSearchResultsUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResultsUpdater:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSwapAxes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwapAxes:");
}

id objc_msgSend_setTabStops_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabStops:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setVideoRecordingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoRecordingEnabled:");
}

id objc_msgSend_setVideoRecordingGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoRecordingGesture:");
}

id objc_msgSend_setVideoRecordingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoRecordingKey:");
}

id objc_msgSend_setVideoRecordingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoRecordingMode:");
}

id objc_msgSend_settingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingEnabled:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_settingsCustomizedForController_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsCustomizedForController:forBundleIdentifier:");
}

id objc_msgSend_settingsForElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForElement:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _[a1 setup];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiersForIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForIDs:");
}

id objc_msgSend_startAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAndReturnError:");
}

id objc_msgSend_startAtTime_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAtTime:error:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportedGameControllers(void *a1, const char *a2, ...)
{
  return _[a1 supportedGameControllers];
}

id objc_msgSend_swapAxes(void *a1, const char *a2, ...)
{
  return _[a1 swapAxes];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_unmappedLocalizedName(void *a1, const char *a2, ...)
{
  return _[a1 unmappedLocalizedName];
}

id objc_msgSend_unmappedNameLocalizationKey(void *a1, const char *a2, ...)
{
  return _[a1 unmappedNameLocalizationKey];
}

id objc_msgSend_unmappedSfSymbolsName(void *a1, const char *a2, ...)
{
  return _[a1 unmappedSfSymbolsName];
}

id objc_msgSend_unregisterSettingsCustomizedHandlerForController_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterSettingsCustomizedHandlerForController:forKey:");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_valueForColorKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForColorKey:");
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return _[a1 vendorName];
}

id objc_msgSend_videoRecordingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 videoRecordingEnabled];
}

id objc_msgSend_videoRecordingGesture(void *a1, const char *a2, ...)
{
  return _[a1 videoRecordingGesture];
}

id objc_msgSend_videoRecordingKey(void *a1, const char *a2, ...)
{
  return _[a1 videoRecordingKey];
}

id objc_msgSend_videoRecordingMode(void *a1, const char *a2, ...)
{
  return _[a1 videoRecordingMode];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return _[a1 yellowColor];
}