uint64_t sub_240593E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_240594F4C((uint64_t *)&unk_26AFC6B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240593EA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_240597AE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_240597AD8();
  uint64_t v19 = 0x6D614E7473726966;
  unint64_t v20 = 0xE900000000000065;
  id v8 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v8)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_240593E3C((uint64_t)&v17, (uint64_t)&v19);
  if (v21) {
    swift_dynamicCast();
  }
  else {
    sub_240596AE4((uint64_t)&v19, (uint64_t *)&unk_26AFC6B40);
  }
  sub_240597A88();
  uint64_t v19 = 0x656D614E7473616CLL;
  unint64_t v20 = 0xE800000000000000;
  id v9 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v9)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_240593E3C((uint64_t)&v17, (uint64_t)&v19);
  if (v21) {
    swift_dynamicCast();
  }
  else {
    sub_240596AE4((uint64_t)&v19, (uint64_t *)&unk_26AFC6B40);
  }
  sub_240597AA8();
  sub_240597A78();
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  if (v11 || (sub_240597A98(), uint64_t v13 = v12, swift_bridgeObjectRelease(), v13))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    uint64_t v14 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v14 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v14, 1, v4);
}

uint64_t sub_24059424C()
{
  uint64_t result = sub_240597B58();
  qword_26AFC6C88 = result;
  unk_26AFC6C90 = v1;
  return result;
}

void sub_24059427C(void *a1)
{
  void (*v61)(uint64_t *__return_ptr, id *);
  uint64_t v62;
  void (*v63)(uint64_t *);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  void (*v70)(uint64_t *__return_ptr, id *);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  void (*v79)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  char *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;

  sub_240594F4C((uint64_t *)&unk_26AFC6AC8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v95 = (char *)&v87 - v6;
  uint64_t v7 = sub_240594F4C(qword_26AFC6AB0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v90 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v89 = (char *)&v87 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v87 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v87 - v15;
  uint64_t v17 = sub_240597AE8();
  v99 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  unint64_t v20 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v96 = (char *)&v87 - v21;
  v105 = MEMORY[0x263F8EE78];
  id v22 = objc_msgSend(a1, sel_identifier);
  if (!v22)
  {
    __break(1u);
    goto LABEL_43;
  }
  v23 = v22;
  v88 = v20;
  uint64_t v24 = sub_240597B58();
  uint64_t v26 = v25;

  if (qword_26AFC6C18 != -1) {
    swift_once();
  }
  uint64_t v27 = qword_26AFC6C98;
  unint64_t v28 = *(void *)(qword_26AFC6C98 + 16);
  v93 = v5;
  v97 = a1;
  v98 = v24;
  if (v28)
  {
    v91 = v16;
    v92 = v26;
    uint64_t v29 = v17;
    v30 = (uint64_t (**)(char *, uint64_t, uint64_t))(v99 + 48);
    id v1 = a1;
    swift_bridgeObjectRetain();
    unint64_t v31 = 0;
    uint64_t v32 = v27 + 40;
    v87 = (unint64_t)v30 & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
    while (1)
    {
      v33 = *(void (**)(uint64_t *))(v32 - 8);
      v101 = (uint64_t)v1;
      swift_bridgeObjectRetain();
      swift_retain();
      v33(&v101);
      swift_bridgeObjectRelease();
      swift_release();
      v34 = *v30;
      int v35 = (*v30)(v14, 1, v29);
      sub_240594F90((uint64_t)v14);
      if (v35 != 1) {
        break;
      }
      ++v31;
      v32 += 16;
      if (v28 == v31) {
        goto LABEL_11;
      }
    }
    if (v28 == v31)
    {
LABEL_11:

      a1 = v97;
      uint64_t v17 = v29;
      uint64_t v16 = v91;
      uint64_t v26 = v92;
      goto LABEL_12;
    }
    if (v31 >= v28)
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    v63 = *(void (**)(uint64_t *))(v32 - 8);
    v101 = (uint64_t)v1;
    swift_retain();
    v64 = (uint64_t)v89;
    v63(&v101);
    swift_release();

    v65 = (uint64_t)v90;
    sub_240594FF0(v64, (uint64_t)v90);
    if (v34((char *)v65, 1, v29) != 1)
    {
      v66 = v99;
      v67 = *(void (**)(char *, uint64_t, uint64_t))(v99 + 32);
      v68 = v88;
      v67(v88, v65, v29);
      sub_240594F90(v64);
      v69 = (uint64_t)v91;
      v67(v91, (uint64_t)v68, v29);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v69, 0, 1, v29);

      swift_bridgeObjectRelease();
      uint64_t v26 = v92;
      a1 = v97;
      uint64_t v17 = v29;
      uint64_t v16 = (char *)v69;
      goto LABEL_13;
    }
LABEL_43:

    __break(1u);
    goto LABEL_44;
  }
  id v36 = a1;
  swift_bridgeObjectRetain();
LABEL_12:
  uint64_t v37 = v99;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v99 + 56))(v16, 1, 1, v17);

  swift_bridgeObjectRelease();
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48);
LABEL_13:
  if (v34(v16, 1, v17) == 1)
  {
    sub_240594F90((uint64_t)v16);
  }
  else
  {
    v38 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
    v92 = v17;
    v38(v96, v16, v17);
    v101 = 0x3A656D616ELL;
    v102 = (char *)0xE500000000000000;
    sub_240597B78();
    v90 = (char *)v101;
    v91 = v102;
    if (qword_26AFC6C00 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_26AFC6C88;
    uint64_t v40 = unk_26AFC6C90;
    uint64_t v41 = v94;
    uint64_t v42 = v94 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
    uint64_t v43 = sub_240597B38();
    uint64_t v44 = *(void *)(v43 - 8);
    v45 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 16);
    uint64_t v46 = (uint64_t)v95;
    v45(v95, v42, v43);
    v47 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56);
    v47(v46, 0, 1, v43);
    uint64_t v48 = v41 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate;
    uint64_t v49 = (uint64_t)v93;
    v45(v93, v48, v43);
    v47(v49, 0, 1, v43);
    id v50 = objc_allocWithZone(MEMORY[0x263F33460]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v51 = sub_24059509C(v39, v40, (uint64_t)v90, (uint64_t)v91, v98, v26, v46, v49);
    v52 = v96;
    v53 = (void *)sub_240597AB8();
    id v54 = objc_msgSend(self, sel_donationValueWithNameComponents_origin_, v53, v51);

    id v55 = v54;
    MEMORY[0x2455ED2E0](v55);
    if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_240597BB8();
    }
    sub_240597BC8();
    sub_240597BA8();

    (*(void (**)(char *, uint64_t))(v99 + 8))(v52, v92);
    a1 = v97;
  }
  if (qword_26AFC6C70 != -1) {
    swift_once();
  }
  uint64_t v56 = qword_26AFC6CE8;
  unint64_t v57 = *(void *)(qword_26AFC6CE8 + 16);
  if (!v57)
  {
    swift_bridgeObjectRelease();
    return;
  }
  id v58 = a1;
  swift_bridgeObjectRetain();
  unint64_t v59 = 0;
  uint64_t v60 = v56 + 40;
  while (1)
  {
    v61 = *(void (**)(uint64_t *__return_ptr, id *))(v60 - 8);
    v100 = v58;
    swift_bridgeObjectRetain();
    swift_retain();
    v61(&v101, &v100);
    swift_bridgeObjectRelease();
    swift_release();
    v62 = (uint64_t)v102;
    sub_240595058(v101, (uint64_t)v102);
    if (v62) {
      break;
    }
    ++v59;
    v60 += 16;
    if (v57 == v59) {
      goto LABEL_29;
    }
  }
  if (v57 == v59)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  if (v59 >= v57) {
    goto LABEL_40;
  }
  v70 = *(void (**)(uint64_t *__return_ptr, id *))(v60 - 8);
  v100 = v58;
  swift_retain();
  v70(&v101, &v100);
  swift_release();

  if (!v102)
  {
LABEL_44:
    __break(1u);
    return;
  }
  v96 = (char *)v101;
  v97 = v103;
  v99 = v104;

  swift_bridgeObjectRelease();
  v101 = 0x3A6C69616D65;
  v102 = (char *)0xE600000000000000;
  sub_240597B78();
  v90 = v102;
  v91 = (char *)v101;
  v92 = v26;
  if (qword_26AFC6C00 != -1) {
LABEL_41:
  }
    swift_once();
  v71 = qword_26AFC6C88;
  v72 = unk_26AFC6C90;
  v73 = v94;
  v74 = v94 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate;
  v75 = sub_240597B38();
  v76 = *(void *)(v75 - 8);
  v77 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
  v78 = (uint64_t)v95;
  v77(v95, v74, v75);
  v79 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56);
  v79(v78, 0, 1, v75);
  v80 = v73 + OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate;
  v81 = (uint64_t)v93;
  v77(v93, v80, v75);
  v79(v81, 0, 1, v75);
  objc_allocWithZone(MEMORY[0x263F33460]);
  swift_bridgeObjectRetain();
  v82 = sub_24059509C(v71, v72, (uint64_t)v91, (uint64_t)v90, v98, v92, v78, v81);
  v83 = (void *)sub_240597B48();
  swift_bridgeObjectRelease();
  v84 = (void *)sub_240597B48();
  swift_bridgeObjectRelease();
  v85 = objc_msgSend(self, sel_donationValueWithEmailAddress_label_origin_, v83, v84, v82);

  v86 = v85;
  MEMORY[0x2455ED2E0](v86);
  if (*(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_240597BB8();
  }
  sub_240597BC8();
  sub_240597BA8();
}

id sub_240594D84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_240594E68()
{
  return type metadata accessor for AccountPropertyParser();
}

uint64_t type metadata accessor for AccountPropertyParser()
{
  uint64_t result = qword_26AFC6AD8;
  if (!qword_26AFC6AD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_240594EBC()
{
  uint64_t result = sub_240597B38();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_240594F4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_240594F90(uint64_t a1)
{
  uint64_t v2 = sub_240594F4C(qword_26AFC6AB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240594FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_240594F4C(qword_26AFC6AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_240595058(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_24059509C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = (void *)sub_240597B48();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_240597B48();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_240597B48();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_240597B38();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  uint64_t v16 = 0;
  if (v15(a7, 1, v13) != 1)
  {
    uint64_t v16 = (void *)sub_240597B08();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a7, v13);
  }
  if (v15(a8, 1, v13) == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = (void *)sub_240597B08();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a8, v13);
  }
  id v18 = objc_msgSend(v20, sel_initWithBundleIdentifier_donationIdentifier_clusterIdentifier_donationDate_expirationDate_, v10, v11, v12, v16, v17);

  return v18;
}

id sub_240595254(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_240597C08();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_240597C08();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x2455ED340](0, v3))
  {
    uint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x2455ED340](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_240595C38();
    char v14 = sub_240597BD8();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x2455ED340](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x2455ED340](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_240597BD8();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      uint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        uint64_t v26 = v27;
        unint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_240597BD8();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

id sub_2405955C8()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_pluginUnloaded);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2405956C0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t type metadata accessor for Plugin()
{
  return self;
}

id sub_24059574C(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger;
  id v4 = self;
  unint64_t v5 = v1;
  id v6 = objc_msgSend(objc_msgSend(v4, sel_defaultProvider), sel_accountLogger);
  swift_unknownObjectRelease();
  *(void *)&v1[v3] = v6;
  *(void *)&v5[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_store] = a1;
  id v7 = a1;
  objc_msgSend((id)swift_unknownObjectRetain(), sel_pluginLoaded);
  swift_unknownObjectRelease();

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_24059582C(id a1, id a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_240597B38();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  id v12 = (char *)&v26 - v11;
  if (a1)
  {
    uint64_t v13 = *(void **)&v2[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger];
    if (a2)
    {
      objc_msgSend(v13, sel_accountChanged_, a1);
      a2 = a2;
      a1 = a1;
      sub_240597B28();
      sub_240597B18();
      uint64_t v14 = type metadata accessor for AccountPropertyParser();
      unint64_t v15 = (char *)objc_allocWithZone((Class)v14);
      uint64_t v27 = v2;
      uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      v16(&v15[OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_donationDate], v12, v6);
      v16(&v15[OBJC_IVAR____TtC22DonationAccountWatcher21AccountPropertyParser_expirationDate], v10, v6);
      v28.receiver = v15;
      v28.super_class = (Class)v14;
      id v17 = objc_msgSendSuper2(&v28, sel_init);
      id v18 = *(void (**)(char *, uint64_t))(v7 + 8);
      v18(v10, v6);
      v18(v12, v6);
      uint64_t v3 = v27;
      sub_24059427C(a2);
      unint64_t v20 = v19;
      sub_24059427C(a1);
      LOBYTE(v14) = sub_240595254(v20, v21);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0) {
        goto LABEL_9;
      }
LABEL_7:
      objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_accountsDidNotChange);
      return;
    }
    objc_msgSend(v13, sel_accountAdded_, a1);
  }
  else
  {
    if (!a2) {
      goto LABEL_7;
    }
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger], sel_accountRemoved_, a2);
  }
LABEL_9:
  id v22 = objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_store], sel_changeFromAccount_toAccount_, a2, a1);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v3;
  aBlock[4] = sub_240595BBC;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2405956C0;
  aBlock[3] = &unk_26F4AAD90;
  unint64_t v24 = _Block_copy(aBlock);
  uint64_t v25 = v3;
  swift_release();
  objc_msgSend(v22, sel_addFailureBlock_, v24);
  _Block_release(v24);
}

uint64_t sub_240595B84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_240595BBC()
{
  unint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger);
  id v2 = (id)sub_240597AF8();
  objc_msgSend(v1, sel_donationFailedWithError_, v2);
}

uint64_t sub_240595C20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_240595C30()
{
  return swift_release();
}

unint64_t sub_240595C38()
{
  unint64_t result = qword_26AFC6B28;
  if (!qword_26AFC6B28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AFC6B28);
  }
  return result;
}

uint64_t sub_240595C78()
{
  sub_240594F4C(&qword_26AFC6B30);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240598050;
  *(void *)(v0 + 32) = sub_240595EAC;
  *(void *)(v0 + 40) = 0;
  if (qword_26AFC6C10 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26AFC6AF8;
  uint64_t v1 = unk_26AFC6B00;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(void *)(v0 + 48) = sub_240596A38;
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = qword_26AFC6C08;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26AFC6AE8;
  uint64_t v5 = unk_26AFC6AF0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  *(void *)(v0 + 64) = sub_240596D18;
  *(void *)(v0 + 72) = v7;
  uint64_t v8 = qword_26AFC6C30;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26AFC6B18;
  uint64_t v9 = unk_26AFC6B20;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  *(void *)(v0 + 80) = sub_240596D18;
  *(void *)(v0 + 88) = v11;
  uint64_t v12 = qword_26AFC6C28;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_26AFC6B08;
  uint64_t v13 = unk_26AFC6B10;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  *(void *)(v0 + 96) = sub_240596D18;
  *(void *)(v0 + 104) = v15;
  qword_26AFC6C98 = v0;
  return swift_retain();
}

uint64_t sub_240595EAC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_240593EA4(*a1, a2);
}

void *sub_240595EB4()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  unint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000012;
  result[4] = 0x8000000240598260;
  qword_26AFC6AF8 = (uint64_t)sub_240596D2C;
  unk_26AFC6B00 = result;
  return result;
}

uint64_t sub_240595F28()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  strcpy((char *)(result + 24), "FullUserName");
  *(unsigned char *)(result + 37) = 0;
  *(_WORD *)(result + 38) = -5120;
  qword_26AFC6AE8 = (uint64_t)sub_240596D0C;
  unk_26AFC6AF0 = result;
  return result;
}

uint64_t sub_240595FA0@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v11[0] = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  id v6 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v6)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_240593E3C((uint64_t)v10, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    sub_240596AE4((uint64_t)v11, (uint64_t *)&unk_26AFC6B40);
    uint64_t v7 = 0;
  }
  sub_2405960BC(v7, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2405960BC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_240597AE8();
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v18 = v5;
    uint64_t v8 = self;
    uint64_t v9 = (void *)sub_240597B48();
    id v10 = objc_msgSend(v8, sel_componentsFromString_, v9);

    sub_240597AC8();
    sub_240597A78();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v12 || (sub_240597A98(), uint64_t v14 = v13, swift_bridgeObjectRelease(), v14))
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(a2, v7, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a2, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v4);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a2, 1, 1, v4);
    }
  }
  else
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v16(a2, 1, 1, v4);
  }
}

void *sub_2405962B0()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0xD000000000000014;
  result[3] = 0x8000000240598240;
  result[4] = v0;
  result[5] = 0xD000000000000012;
  result[6] = 0x8000000240598260;
  qword_26AFC6B18 = (uint64_t)sub_240596A68;
  unk_26AFC6B20 = result;
  return result;
}

void *sub_24059633C()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0xD000000000000010;
  result[3] = 0x8000000240598220;
  result[4] = v0;
  result[5] = 0x656D614E6C6C7546;
  result[6] = 0xE800000000000000;
  qword_26AFC6B08 = (uint64_t)sub_240596A68;
  unk_26AFC6B10 = result;
  return result;
}

uint64_t sub_2405963C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  uint64_t v52 = a4;
  uint64_t v11 = sub_240597AE8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v51 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_240594F4C(qword_26AFC6AB0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v56[0] = a2;
  *((void *)&v56[0] + 1) = a3;
  swift_bridgeObjectRetain();
  id v17 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v17)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v56, 0, sizeof(v56));
  }
  sub_240593E3C((uint64_t)v56, (uint64_t)&v57);
  if (!*((void *)&v58 + 1))
  {
    sub_240596AE4((uint64_t)&v57, (uint64_t *)&unk_26AFC6B40);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a6, 1, 1, v11);
  }
  sub_240594F4C(&qword_268C88EB8);
  uint64_t v53 = MEMORY[0x263F8EE58] + 8;
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a6, 1, 1, v11);
  }
  int64_t v19 = 0;
  uint64_t v20 = v55;
  uint64_t v21 = 1 << *(unsigned char *)(v55 + 32);
  uint64_t v22 = -1;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  unint64_t v23 = v22 & *(void *)(v55 + 64);
  int64_t v54 = (unint64_t)(v21 + 63) >> 6;
  v47 = a6;
  uint64_t v48 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  unint64_t v24 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v46 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v49 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v50 = v55 + 64;
  uint64_t v25 = v55 + 64;
  uint64_t v26 = v52;
  while (1)
  {
    if (v23)
    {
      unint64_t v27 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      unint64_t v28 = v27 | (v19 << 6);
      goto LABEL_29;
    }
    int64_t v29 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v29 >= v54) {
      goto LABEL_43;
    }
    unint64_t v30 = *(void *)(v25 + 8 * v29);
    ++v19;
    if (!v30)
    {
      int64_t v19 = v29 + 1;
      if (v29 + 1 >= v54) {
        goto LABEL_43;
      }
      unint64_t v30 = *(void *)(v25 + 8 * v19);
      if (!v30)
      {
        int64_t v19 = v29 + 2;
        if (v29 + 2 >= v54) {
          goto LABEL_43;
        }
        unint64_t v30 = *(void *)(v25 + 8 * v19);
        if (!v30) {
          break;
        }
      }
    }
LABEL_28:
    unint64_t v23 = (v30 - 1) & v30;
    unint64_t v28 = __clz(__rbit64(v30)) + (v19 << 6);
LABEL_29:
    uint64_t v32 = *(void *)(*(void *)(v20 + 56) + 8 * v28);
    if (!*(void *)(v32 + 16))
    {
      long long v57 = 0u;
      long long v58 = 0u;
LABEL_10:
      sub_240596AE4((uint64_t)&v57, (uint64_t *)&unk_26AFC6B40);
LABEL_11:
      (*v24)(v16, 1, 1, v11);
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v33 = sub_240596A6C(v26, a5);
    if (v34)
    {
      sub_240596B40(*(void *)(v32 + 56) + 32 * v33, (uint64_t)&v57);
    }
    else
    {
      long long v57 = 0u;
      long long v58 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*((void *)&v58 + 1)) {
      goto LABEL_10;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_11;
    }
    int v35 = self;
    id v36 = (void *)sub_240597B48();
    id v37 = objc_msgSend(v35, sel_componentsFromString_, v36);

    v38 = v51;
    sub_240597AC8();

    sub_240597A78();
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    if (v40 || (sub_240597A98(), uint64_t v42 = v41, swift_bridgeObjectRelease(), v42))
    {
      (*v48)(v16, v38, v11);
      uint64_t v43 = *v24;
      (*v24)(v16, 0, 1, v11);
    }
    else
    {
      (*v46)(v38, v11);
      uint64_t v43 = *v24;
      (*v24)(v16, 1, 1, v11);
    }
    swift_bridgeObjectRelease();
    int v44 = (*v49)(v16, 1, v11);
    uint64_t v26 = v52;
    uint64_t v25 = v50;
    if (v44 != 1)
    {
      swift_release();
      v45 = v47;
      (*v48)(v47, v16, v11);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v43)(v45, 0, 1, v11);
    }
LABEL_12:
    uint64_t result = sub_240596AE4((uint64_t)v16, qword_26AFC6AB0);
  }
  int64_t v31 = v29 + 3;
  if (v31 >= v54)
  {
LABEL_43:
    swift_release();
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))*v24)(v47, 1, 1, v11);
  }
  unint64_t v30 = *(void *)(v25 + 8 * v31);
  if (v30)
  {
    int64_t v19 = v31;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v19 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v19 >= v54) {
      goto LABEL_43;
    }
    unint64_t v30 = *(void *)(v25 + 8 * v19);
    ++v31;
    if (v30) {
      goto LABEL_28;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_2405969A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyNameParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AccountPropertyNameParser()
{
  return self;
}

uint64_t sub_240596A00()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240596A38(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_240596A6C(uint64_t a1, uint64_t a2)
{
  sub_240597C38();
  sub_240597B68();
  uint64_t v4 = sub_240597C48();
  return sub_240596B9C(a1, a2, v4);
}

uint64_t sub_240596AE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_240594F4C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240596B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_240596B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_240597C18() & 1) == 0)
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
      while (!v14 && (sub_240597C18() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_240596C84()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_240596CC4@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_2405963C8(a1, v2[2], v2[3], v2[5], v2[6], a2);
}

uint64_t sub_240596CD4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_240596D0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_240595FA0(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_240596D30()
{
  sub_240594F4C(&qword_26AFC6B38);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_240598080;
  *(void *)(v0 + 32) = sub_240596F78;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = sub_240596F90;
  *(void *)(v0 + 56) = 0;
  if (qword_26AFC6C60 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_26AFC6CD8;
  uint64_t v1 = unk_26AFC6CE0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(void *)(v0 + 64) = sub_24059797C;
  *(void *)(v0 + 72) = v3;
  uint64_t v4 = qword_26AFC6C48;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26AFC6CB8;
  uint64_t v5 = unk_26AFC6CC0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  *(void *)(v0 + 80) = sub_24059797C;
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = qword_26AFC6C40;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_26AFC6CA8;
  uint64_t v9 = unk_26AFC6CB0;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  *(void *)(v0 + 96) = sub_24059797C;
  *(void *)(v0 + 104) = v11;
  uint64_t v12 = qword_26AFC6C58;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_26AFC6CC8;
  uint64_t v13 = unk_26AFC6CD0;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  *(void *)(v0 + 112) = sub_24059797C;
  *(void *)(v0 + 120) = v15;
  qword_26AFC6CE8 = v0;
  return swift_retain();
}

uint64_t sub_240596F78@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_240596FA8(a1, (uint64_t (*)(void))sub_2405970B8, a2);
}

uint64_t sub_240596F90@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_240596FA8(a1, (uint64_t (*)(void))sub_240597270, a2);
}

uint64_t sub_240596FA8@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*a1);
  *a3 = result;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

void sub_240596FDC()
{
  qword_26AFC6CA0 = (uint64_t)&unk_26F4AAD38;
}

uint64_t sub_240596FF0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_240597C18();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_240597C18() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2405970B8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_accountType);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(v2, sel_identifier);

    if (v4)
    {
      uint64_t v5 = sub_240597B58();
      uint64_t v7 = v6;

      if (qword_26AFC6C38 != -1) {
        swift_once();
      }
      char v8 = sub_240596FF0(v5, v7, (void *)qword_26AFC6CA0);
      swift_bridgeObjectRelease();
      if (v8) {
        return 0;
      }
    }
  }
  id v9 = objc_msgSend(a1, sel_username);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  sub_240597B58();

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F335B8]), sel_init);
  BOOL v12 = (void *)sub_240597B48();
  id v13 = objc_msgSend(v11, sel_firstEmailAddressInString_, v12);

  if (!v13)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v14 = sub_240597B58();
  swift_bridgeObjectRelease();

  sub_240597B58();
  return v14;
}

uint64_t sub_240597270(void *a1)
{
  strcpy((char *)&v7, "primaryEmail");
  BYTE13(v7) = 0;
  HIWORD(v7) = -5120;
  id v2 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  sub_240593E3C((uint64_t)&v7, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast())
    {
      uint64_t v3 = v6;
      *(void *)&long long v7 = 0x6449656C707061;
      *((void *)&v7 + 1) = 0xE700000000000000;
      id v4 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
      swift_unknownObjectRelease();
      if (v4)
      {
        sub_240597BE8();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v7 = 0u;
        long long v8 = 0u;
      }
      sub_240593E3C((uint64_t)&v7, (uint64_t)v9);
      if (v10)
      {
        if (swift_dynamicCast())
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        sub_2405979FC((uint64_t)v9);
      }
      if ((sub_240597B88() & 1) == 0)
      {
        sub_240597B58();
        return v3;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_2405979FC((uint64_t)v9);
  }
  return 0;
}

void *sub_24059748C()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000014;
  result[4] = 0x8000000240598300;
  qword_26AFC6CD8 = (uint64_t)sub_240597A5C;
  unk_26AFC6CE0 = result;
  return result;
}

void *sub_240597500()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0x656D614E72657375;
  result[4] = 0xE800000000000000;
  qword_26AFC6CB8 = (uint64_t)sub_240597A5C;
  unk_26AFC6CC0 = result;
  return result;
}

void *sub_240597570()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000011;
  result[4] = 0x80000002405982E0;
  qword_26AFC6CA8 = (uint64_t)sub_240597A5C;
  unk_26AFC6CB0 = result;
  return result;
}

void *sub_2405975E4()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000015;
  result[4] = 0x80000002405982C0;
  qword_26AFC6CC8 = (uint64_t)sub_2405979F0;
  unk_26AFC6CD0 = result;
  return result;
}

uint64_t sub_240597658(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_msgSend(a1, sel_accountType);
  if (v7)
  {
    long long v8 = v7;
    id v9 = objc_msgSend(v7, sel_identifier);

    if (v9)
    {
      uint64_t v10 = sub_240597B58();
      uint64_t v12 = v11;

      if (qword_26AFC6C38 != -1) {
        swift_once();
      }
      char v13 = sub_240596FF0(v10, v12, (void *)qword_26AFC6CA0);
      swift_bridgeObjectRelease();
      if (v13) {
        return 0;
      }
    }
  }
  *(void *)&v20[0] = a3;
  *((void *)&v20[0] + 1) = a4;
  swift_bridgeObjectRetain();
  id v14 = objc_msgSend(a1, sel_objectForKeyedSubscript_, sub_240597C28());
  swift_unknownObjectRelease();
  if (v14)
  {
    sub_240597BE8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_240593E3C((uint64_t)v20, (uint64_t)v21);
  if (!v22)
  {
    sub_2405979FC((uint64_t)v21);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F335B8]), sel_init);
  uint64_t v16 = (void *)sub_240597B48();
  id v17 = objc_msgSend(v15, sel_firstEmailAddressInString_, v16);

  if (!v17)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v18 = sub_240597B58();
  swift_bridgeObjectRelease();

  sub_240597B58();
  return v18;
}

id sub_2405978E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyEmailParser();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AccountPropertyEmailParser()
{
  return self;
}

uint64_t sub_240597944()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_240597980@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

uint64_t sub_2405979B8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2405979F0(void *a1)
{
  return sub_240597658(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2405979FC(uint64_t a1)
{
  uint64_t v2 = sub_240594F4C((uint64_t *)&unk_26AFC6B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240597A78()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_240597A88()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_240597A98()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_240597AA8()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_240597AB8()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_240597AC8()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_240597AD8()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_240597AE8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_240597AF8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_240597B08()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_240597B18()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_240597B28()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_240597B38()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_240597B48()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_240597B58()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240597B68()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_240597B78()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_240597B88()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_240597B98()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_240597BA8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_240597BB8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_240597BC8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_240597BD8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_240597BE8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_240597BF8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_240597C08()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_240597C18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_240597C28()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_240597C38()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_240597C48()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}