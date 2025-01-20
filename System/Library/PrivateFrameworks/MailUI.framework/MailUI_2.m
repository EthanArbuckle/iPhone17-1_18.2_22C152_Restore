id sub_1DDEB6A3C()
{
  uint64_t v0;
  id v1;
  id *v3;
  id v4;

  v3 = (id *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_dataSource);
  swift_beginAccess();
  v4 = *v3;
  v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_1DDEB6AA4(void *a1)
{
  id v2 = a1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_dataSource);
  swift_beginAccess();
  v3 = *v4;
  *v4 = a1;

  swift_endAccess();
}

uint64_t (*sub_1DDEB6B24())()
{
  return sub_1DDD62D58;
}

id sub_1DDEB6B90()
{
  uint64_t v18 = 0;
  uint64_t v1 = sub_1DDEECE78();
  unint64_t v11 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v1);
  v12 = (char *)v6 - v11;
  uint64_t v18 = v0;
  v13 = (id *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier);
  v14 = &v17;
  swift_beginAccess();
  id v15 = *v13;
  id v2 = v15;
  swift_endAccess();
  if (v15)
  {
    id v9 = v15;
    return v15;
  }
  else
  {
    type metadata accessor for PriorityMessageListHeaderFooterIdentifier();
    sub_1DDEECE68();
    id v7 = sub_1DDEB5010(v12);
    id v3 = v7;
    v6[0] = v10 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier;
    v6[1] = &v16;
    swift_beginAccess();
    v4 = *(void **)v6[0];
    *(void *)v6[0] = v7;

    swift_endAccess();
    return v7;
  }
}

void sub_1DDEB6CFC(void *a1)
{
  id v2 = a1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier);
  swift_beginAccess();
  id v3 = *v4;
  void *v4 = a1;

  swift_endAccess();
}

void (*sub_1DDEB6D7C(id *a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_1DDEB6B90();
  return sub_1DDEB6DD8;
}

void sub_1DDEB6DD8(id *a1, char a2)
{
  if (a2)
  {
    id v3 = *a1;
    id v2 = *a1;
    sub_1DDEB6CFC(v3);
  }
  else
  {
    sub_1DDEB6CFC(*a1);
  }
}

id sub_1DDEB6E48()
{
  uint64_t v18 = 0;
  uint64_t v1 = sub_1DDEECE78();
  unint64_t v11 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v1);
  v12 = (char *)v6 - v11;
  uint64_t v18 = v0;
  v13 = (id *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier);
  v14 = &v17;
  swift_beginAccess();
  id v15 = *v13;
  id v2 = v15;
  swift_endAccess();
  if (v15)
  {
    id v9 = v15;
    return v15;
  }
  else
  {
    type metadata accessor for PriorityMessageListHeaderFooterIdentifier();
    sub_1DDEECE68();
    id v7 = sub_1DDEB5010(v12);
    id v3 = v7;
    v6[0] = v10 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier;
    v6[1] = &v16;
    swift_beginAccess();
    v4 = *(void **)v6[0];
    *(void *)v6[0] = v7;

    swift_endAccess();
    return v7;
  }
}

void sub_1DDEB6FB4(void *a1)
{
  id v2 = a1;
  v4 = (void **)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier);
  swift_beginAccess();
  id v3 = *v4;
  void *v4 = a1;

  swift_endAccess();
}

void (*sub_1DDEB7034(id *a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_1DDEB6E48();
  return sub_1DDEB7090;
}

void sub_1DDEB7090(id *a1, char a2)
{
  if (a2)
  {
    id v3 = *a1;
    id v2 = *a1;
    sub_1DDEB6FB4(v3);
  }
  else
  {
    sub_1DDEB6FB4(*a1);
  }
}

uint64_t sub_1DDEB7100()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_backgroundView;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x1E01CABB0](v2);
  swift_endAccess();
  return v3;
}

void sub_1DDEB7168(void *a1)
{
  id v1 = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  swift_endAccess();
}

void (*sub_1DDEB71E8(void *a1))(id **a1, char a2)
{
  v5 = malloc(0x30uLL);
  *a1 = v5;
  v5[4] = v1;
  uint64_t v2 = OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_backgroundView;
  v5[5] = OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_backgroundView;
  uint64_t v4 = v1 + v2;
  swift_beginAccess();
  v5[3] = MEMORY[0x1E01CABB0](v4);
  return sub_1DDD7B7EC;
}

uint64_t sub_1DDEB728C()
{
  uint64_t v2 = (char *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hasPendingHighlightsShimmer);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_1DDEB72F4(char a1)
{
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hasPendingHighlightsShimmer);
  swift_beginAccess();
  unsigned char *v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_1DDEB7378())()
{
  return sub_1DDD62D58;
}

void sub_1DDEB73E4()
{
  char v3 = (char *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewIsVisible);
  swift_beginAccess();
  char v5 = *v3;
  swift_endAccess();
  id v1 = v4;
  if (v5) {
    char v2 = sub_1DDEB728C();
  }
  else {
    char v2 = 0;
  }

  if (v2) {
    sub_1DDEB74AC();
  }
}

uint64_t sub_1DDEB74AC()
{
  uint64_t v103 = 0;
  v93 = sub_1DDD4F200;
  v94 = sub_1DDEC0624;
  v95 = sub_1DDD4F200;
  v96 = sub_1DDD4F200;
  uint64_t v148 = 0;
  uint64_t v97 = 0;
  uint64_t v141 = 0;
  id v134 = 0;
  uint64_t v98 = sub_1DDEEE868();
  uint64_t v99 = *(void *)(v98 - 8);
  uint64_t v100 = v98 - 8;
  unint64_t v101 = (*(void *)(v99 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  v102 = (char *)v20 - v101;
  uint64_t v104 = sub_1DDEEE898();
  uint64_t v105 = *(void *)(v104 - 8);
  uint64_t v106 = v104 - 8;
  unint64_t v107 = (*(void *)(v105 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v103);
  v108 = (char *)v20 - v107;
  uint64_t v109 = sub_1DDEED388();
  uint64_t v110 = *(void *)(v109 - 8);
  uint64_t v111 = v109 - 8;
  unint64_t v112 = (*(void *)(v110 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v109);
  v113 = (char *)v20 - v112;
  unint64_t v114 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)v20 - v112);
  v115 = (char *)v20 - v114;
  unint64_t v116 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)v20 - v114);
  v117 = (char *)v20 - v116;
  uint64_t v148 = v0;
  uint64_t v118 = sub_1DDEB8FB4();
  if (!v118)
  {
LABEL_24:
    (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v113, &v92[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger], v109);
    v37 = sub_1DDEED368();
    int v36 = sub_1DDEEF1A8();
    v34 = &v146;
    uint64_t v146 = 2;
    unint64_t v32 = sub_1DDD3C7B0();
    unint64_t v33 = sub_1DDD42470();
    sub_1DDD424EC();
    sub_1DDEEED58();
    uint32_t v35 = v147;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3A10);
    uint64_t v38 = sub_1DDEEF9A8();
    if (os_log_type_enabled(v37, (os_log_type_t)v36))
    {
      uint64_t v16 = v97;
      v22 = (uint8_t *)sub_1DDEEF4E8();
      v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA39D0);
      uint64_t v21 = 0;
      uint64_t v23 = sub_1DDD4258C(0);
      uint64_t v24 = sub_1DDD4258C(v21);
      v28 = &v145;
      v145 = v22;
      v29 = &v144;
      uint64_t v144 = v23;
      v26 = &v143;
      uint64_t v143 = v24;
      unsigned int v25 = 0;
      sub_1DDD425E8(0, &v145);
      sub_1DDD425E8(v25, v28);
      uint64_t v142 = v38;
      v27 = v20;
      MEMORY[0x1F4188790](v20);
      char v17 = v29;
      uint64_t v18 = &v20[-6];
      v30 = &v20[-6];
      v18[2] = v28;
      v18[3] = v17;
      v18[4] = v19;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA39B0);
      sub_1DDD4F230();
      sub_1DDEEED18();
      if (v16)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1DDCDB000, v37, (os_log_type_t)v36, "Did not add any new priority emails. Skipping shimmer.", v22, v35);
        v20[0] = 0;
        sub_1DDD42648(v23);
        sub_1DDD42648(v24);
        sub_1DDEEF4C8();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v113, v109);
  }
  uint64_t v91 = v118;
  uint64_t v90 = v118;
  uint64_t v141 = v118;
  char v3 = sub_1DDE6B9D4();
  if ((v3 & 1) == 0)
  {
    swift_release();
    goto LABEL_24;
  }
  id v89 = sub_1DDEB8944();
  if (v89)
  {
    id v88 = v89;
    id v84 = v89;
    id v134 = v89;
    id v4 = objc_msgSend(v89, sel_activationState);
    v87 = &v133;
    id v133 = v4;
    v85 = &v132;
    uint64_t v132 = 0;
    uint64_t v86 = type metadata accessor for ActivationState();
    sub_1DDEC0560();
    char v5 = sub_1DDEEF9C8();
    if (v5 & 1) != 0 && (sub_1DDEB8654())
    {
      sub_1DDEB72F4(0);
      (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v117, &v92[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger], v109);
      v82 = sub_1DDEED368();
      int v81 = sub_1DDEEF1A8();
      v79 = &v130;
      uint64_t v130 = 2;
      unint64_t v77 = sub_1DDD3C7B0();
      unint64_t v78 = sub_1DDD42470();
      sub_1DDD424EC();
      sub_1DDEEED58();
      uint32_t v80 = v131;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3A10);
      uint64_t v83 = sub_1DDEEF9A8();
      if (os_log_type_enabled(v82, (os_log_type_t)v81))
      {
        uint64_t v6 = v97;
        v67 = (uint8_t *)sub_1DDEEF4E8();
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA39D0);
        uint64_t v66 = 0;
        uint64_t v68 = sub_1DDD4258C(0);
        uint64_t v69 = sub_1DDD4258C(v66);
        v73 = &v122;
        v122 = v67;
        v74 = &v121;
        uint64_t v121 = v68;
        v71 = &v120;
        uint64_t v120 = v69;
        unsigned int v70 = 0;
        sub_1DDD425E8(0, &v122);
        sub_1DDD425E8(v70, v73);
        uint64_t v119 = v83;
        v72 = v20;
        MEMORY[0x1F4188790](v20);
        id v7 = v74;
        v8 = &v20[-6];
        v75 = &v20[-6];
        v8[2] = v73;
        v8[3] = v7;
        v8[4] = v9;
        uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA39B0);
        sub_1DDD4F230();
        sub_1DDEEED18();
        if (v6)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_1DDCDB000, v82, (os_log_type_t)v81, "Did add new items to Priority, playing shimmer.", v67, v80);
          uint64_t v64 = 0;
          sub_1DDD42648(v68);
          sub_1DDD42648(v69);
          sub_1DDEEF4C8();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v110 + 8))(v117, v109);
      uint64_t v61 = 0;
      sub_1DDD7B204();
      id v63 = (id)sub_1DDEEF238();
      uint64_t v60 = swift_allocObject();
      uint64_t v59 = v60 + 16;
      uint64_t v10 = v92;
      swift_unknownObjectWeakInit();

      swift_retain();
      v128 = v94;
      uint64_t v129 = v60;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      int v124 = 1107296256;
      int v125 = 0;
      v126 = sub_1DDDAD198;
      v127 = &block_descriptor_17;
      v62 = _Block_copy(&aBlock);
      swift_release();
      swift_release();
      sub_1DDE7ABC8();
      sub_1DDE7ABE0();
      MEMORY[0x1E01C91C0](v61, v108, v102, v62);
      (*(void (**)(char *, uint64_t))(v99 + 8))(v102, v98);
      (*(void (**)(char *, uint64_t))(v105 + 8))(v108, v104);
      _Block_release(v62);

      sub_1DDE6C520();
      return swift_release();
    }
  }
  sub_1DDEB72F4(1);
  (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v115, &v92[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger], v109);
  v57 = sub_1DDEED368();
  int v56 = sub_1DDEEF1A8();
  v54 = &v139;
  uint64_t v139 = 2;
  unint64_t v52 = sub_1DDD3C7B0();
  unint64_t v53 = sub_1DDD42470();
  sub_1DDD424EC();
  sub_1DDEEED58();
  uint32_t v55 = v140;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3A10);
  uint64_t v58 = sub_1DDEEF9A8();
  if (os_log_type_enabled(v57, (os_log_type_t)v56))
  {
    uint64_t v12 = v97;
    v42 = (uint8_t *)sub_1DDEEF4E8();
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA39D0);
    uint64_t v41 = 0;
    uint64_t v43 = sub_1DDD4258C(0);
    uint64_t v44 = sub_1DDD4258C(v41);
    v48 = &v138;
    v138 = v42;
    v49 = &v137;
    uint64_t v137 = v43;
    v46 = &v136;
    uint64_t v136 = v44;
    unsigned int v45 = 0;
    sub_1DDD425E8(0, &v138);
    sub_1DDD425E8(v45, v48);
    uint64_t v135 = v58;
    v47 = v20;
    MEMORY[0x1F4188790](v20);
    v13 = v49;
    v14 = &v20[-6];
    v50 = &v20[-6];
    v14[2] = v48;
    v14[3] = v13;
    v14[4] = v15;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA39B0);
    sub_1DDD4F230();
    sub_1DDEEED18();
    if (v12)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_1DDCDB000, v57, (os_log_type_t)v56, "Need to play Priority shimmer but the scene is not active, will wait until the scene becomes active.", v42, v55);
      uint64_t v39 = 0;
      sub_1DDD42648(v43);
      sub_1DDD42648(v44);
      sub_1DDEEF4C8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v110 + 8))(v115, v109);
  return swift_release();
}

uint64_t sub_1DDEB8654()
{
  uint64_t v2 = (char *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewIsVisible);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

void sub_1DDEB86BC(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewIsVisible);
  swift_beginAccess();
  unsigned char *v3 = a1 & 1;
  swift_endAccess();
  sub_1DDEB73E4();
}

void (*sub_1DDEB8744(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEB87B4;
}

void sub_1DDEB87B4(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1DDEB73E4();
  }
}

void sub_1DDEB8804()
{
  v8 = (id *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene);
  swift_beginAccess();
  id v9 = *v8;
  id v1 = *v8;
  swift_endAccess();
  if (v9)
  {
    id v6 = objc_msgSend(self, sel_defaultCenter);
    id v2 = v7;
    id v5 = (id)*MEMORY[0x1E4FB2E80];
    id v3 = (id)*MEMORY[0x1E4FB2E80];
    id v4 = v9;
    objc_msgSend(v6, sel_addObserver_selector_name_object_, v7, sel_hostingSceneDidBecomeActive_, v5, v9);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

id sub_1DDEB8944()
{
  id v3 = (id *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_1DDEB89AC(void *a1)
{
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene);
  swift_beginAccess();
  id v3 = *v4;
  unsigned char *v4 = a1;

  swift_endAccess();
  sub_1DDEB8804();
}

uint64_t sub_1DDEB8A30()
{
  return swift_deallocObject();
}

id sub_1DDEB8A70()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_highlightedMessagesViewHostingScene);
  return v1;
}

uint64_t type metadata accessor for PriorityMessageListHeaderFooterIdentifier()
{
  uint64_t v1 = qword_1EAB97A30;
  if (!qword_1EAB97A30) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void (*sub_1DDEB8B20(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEB8B90;
}

void sub_1DDEB8B90(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1DDEB8804();
  }
}

void sub_1DDEB8BE0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = sub_1DDEB8FB4();
}

void sub_1DDEB8C3C(uint64_t *a1, id *a2)
{
  sub_1DDD62B50(a1, &v6);
  uint64_t v5 = v6;
  id v4 = *a2;
  id v2 = *a2;
  sub_1DDEB901C(v5);
}

uint64_t sub_1DDEB8CA4()
{
  id v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel);
  swift_beginAccess();
  uint64_t v6 = *v4;
  swift_retain();
  swift_endAccess();
  sub_1DDEB8E3C(v6);
  swift_release();
  id v7 = (void *)(v5 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel);
  swift_beginAccess();
  if (*v7)
  {
    swift_retain();
    swift_endAccess();
    uint64_t v2 = sub_1DDE683B4();
    swift_release();
    uint64_t v3 = v2;
  }
  else
  {
    swift_endAccess();
    uint64_t v3 = 0;
  }
  if (v3)
  {
    uint64_t v8 = v3;
  }
  else
  {
    type metadata accessor for MUIHighlightedMessage();
    uint64_t v8 = sub_1DDEEF9A8();
    sub_1DDD31430();
  }
  sub_1DDEB8F74(v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDEB8E3C(uint64_t a1)
{
  swift_retain();
  uint64_t result = a1;
  if (a1)
  {
    uint64_t v4 = swift_allocObject();
    id v2 = v5;
    swift_unknownObjectWeakInit();

    swift_retain();
    swift_retain();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v4;
    *(void *)(v3 + 24) = a1;
    sub_1DDEBE134();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DDEB8F74(uint64_t a1)
{
  return sub_1DDEBB8C4(a1, 1);
}

uint64_t sub_1DDEB8FB4()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1DDEB901C(uint64_t a1)
{
  swift_retain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel);
  swift_beginAccess();
  void *v3 = a1;
  swift_release();
  swift_endAccess();
  sub_1DDEB8CA4();
  return swift_release();
}

uint64_t (*sub_1DDEB90A0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEB9110;
}

uint64_t sub_1DDEB9110(uint64_t a1, char a2)
{
  if (a2) {
    return swift_endAccess();
  }
  swift_endAccess();
  return sub_1DDEB8CA4();
}

uint64_t sub_1DDEB9160()
{
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_messageByIdentifier);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1DDEB91C8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_messageByIdentifier);
  swift_beginAccess();
  void *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DDEB924C())()
{
  return sub_1DDD62D58;
}

uint64_t sub_1DDEB92B8()
{
  sub_1DDEB9160();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB97968);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB96770);
  sub_1DDEC0680();
  uint64_t v1 = sub_1DDEEECA8();
  sub_1DDD31430();
  return v1;
}

void sub_1DDEB9380(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v8 = *(id *)a1;
  id v4 = *(id *)(a1 + 8);
  id v2 = *(id *)a1;
  id v3 = v4;
  id v5 = objc_msgSend(v4, sel_messageListItem);

  swift_getObjectType();
  id v7 = objc_msgSend(v5, sel_itemID);
  swift_unknownObjectRelease();
  *a2 = v7;
}

uint64_t sub_1DDEB9444()
{
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v11 = v0;
  id v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for PriorityMessageListViewController();
  objc_msgSendSuper2(&v10, sel_viewDidLoad);

  sub_1DDEB9600();
  sub_1DDEB9CA8();
  sub_1DDEBA758();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97980);
  sub_1DDEEF9A8();
  uint64_t v6 = v2;
  *id v2 = sub_1DDEED5B8();
  v6[1] = MEMORY[0x1E4FB0F40];
  sub_1DDD4242C();
  uint64_t v7 = swift_allocObject();
  id v3 = v5;
  swift_unknownObjectWeakInit();

  swift_retain();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  *(void *)(v9 + 24) = ObjectType;
  swift_release();
  sub_1DDEEF1F8();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void sub_1DDEB9600()
{
  sub_1DDD74DE8();
  id v0 = v49;
  id v50 = objc_msgSend(v49, sel_view);

  if (v50)
  {
    v48 = v50;
  }
  else
  {
    LOBYTE(v10) = 2;
    uint64_t v16 = 223;
    LODWORD(v22) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v48, sel_bounds, v10, v16, v22);
  double v43 = v1;
  double v44 = v2;
  double v45 = v3;
  double v46 = v4;

  id v5 = sub_1DDEBD090();
  id v6 = sub_1DDD73020(v5, v43, v44, v45, v46);
  sub_1DDEB6950(v6);
  id v47 = sub_1DDEB67E8();
  if (v47)
  {
    v42 = v47;
  }
  else
  {
    LOBYTE(v11) = 2;
    uint64_t v17 = 224;
    LODWORD(v23) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  type metadata accessor for AutoresizingMask();
  sub_1DDEEF9A8();
  *uint64_t v7 = 2;
  v7[1] = 16;
  sub_1DDD4242C();
  sub_1DDD39700();
  sub_1DDEEF638();
  objc_msgSend(v42, sel_setAutoresizingMask_, v51);

  id v41 = sub_1DDEB67E8();
  if (v41)
  {
    id v40 = v41;
  }
  else
  {
    LOBYTE(v11) = 2;
    uint64_t v17 = 225;
    LODWORD(v23) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v40, sel_setScrollEnabled_, 0, v11, v17, v23);

  id v39 = sub_1DDEB67E8();
  if (v39)
  {
    id v38 = v39;
  }
  else
  {
    LOBYTE(v12) = 2;
    uint64_t v18 = 226;
    LODWORD(v24) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v38, sel__setShouldDeriveVisibleBoundsFromContainingScrollView_, 1, v12, v18, v24);

  id v37 = sub_1DDEB67E8();
  if (v37)
  {
    int v36 = v37;
  }
  else
  {
    LOBYTE(v13) = 2;
    uint64_t v19 = 227;
    LODWORD(v25) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v8 = v49;
  objc_msgSend(v36, sel_setDelegate_, v49);
  swift_unknownObjectRelease();

  id v35 = sub_1DDEB67E8();
  if (v35)
  {
    id v34 = v35;
  }
  else
  {
    LOBYTE(v13) = 2;
    uint64_t v19 = 228;
    LODWORD(v25) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v34, sel_setSelectionFollowsFocus_, 1, v13, v19, v25);

  id v33 = sub_1DDEB67E8();
  if (v33)
  {
    id v32 = v33;
  }
  else
  {
    LOBYTE(v14) = 2;
    uint64_t v20 = 229;
    LODWORD(v26) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v32, sel_setClipsToBounds_, 0, v14, v20, v26);

  id v9 = v49;
  id v31 = objc_msgSend(v49, sel_view);

  if (v31)
  {
    v30 = v31;
  }
  else
  {
    LOBYTE(v15) = 2;
    uint64_t v21 = 230;
    LODWORD(v27) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v29 = sub_1DDEB67E8();
  if (v29)
  {
    v28 = v29;
  }
  else
  {
    LOBYTE(v15) = 2;
    uint64_t v21 = 230;
    LODWORD(v27) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  objc_msgSend(v30, sel_addSubview_, v15, v21, v27);
}

uint64_t sub_1DDEB9CA8()
{
  uint64_t v68 = 0;
  unsigned int v70 = sub_1DDEBC964;
  v30 = sub_1DDEC0A7C;
  id v31 = sub_1DDEC0CF0;
  id v32 = "Fatal error";
  id v33 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  id v34 = "MailUI/PriorityMessageListViewController.swift";
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v83 = 0;
  v82 = 0;
  int v81 = 0;
  uint32_t v80 = 0;
  uint64_t v79 = 0;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97988);
  uint64_t v38 = *(void *)(v36 - 8);
  uint64_t v37 = v36 - 8;
  uint64_t v39 = v38;
  uint64_t v40 = *(void *)(v38 + 64);
  unint64_t v41 = (v40 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v36);
  v42 = (char *)&v14 - v41;
  unint64_t v43 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v14 - v41);
  v75 = (char *)&v14 - v43;
  uint64_t v83 = (char *)&v14 - v43;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97990);
  uint64_t v46 = *(void *)(v44 - 8);
  uint64_t v45 = v44 - 8;
  uint64_t v47 = v46;
  uint64_t v48 = *(void *)(v46 + 64);
  unint64_t v49 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v44);
  id v50 = (char *)&v14 - v49;
  unint64_t v51 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v14 - v49);
  v74 = (char *)&v14 - v51;
  v82 = (char *)&v14 - v51;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97998);
  uint64_t v54 = *(void *)(v52 - 8);
  uint64_t v53 = v52 - 8;
  uint64_t v55 = v54;
  uint64_t v56 = *(void *)(v54 + 64);
  unint64_t v57 = (v56 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v52);
  uint64_t v58 = (char *)&v14 - v57;
  unint64_t v59 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v14 - v57);
  v73 = (char *)&v14 - v59;
  int v81 = (char *)&v14 - v59;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979A0);
  uint64_t v62 = *(void *)(v60 - 8);
  uint64_t v61 = v60 - 8;
  uint64_t v63 = v62;
  uint64_t v64 = *(void *)(v62 + 64);
  unint64_t v65 = (v64 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v60);
  uint64_t v66 = (char *)&v14 - v65;
  unint64_t v67 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790]((char *)&v14 - v65);
  uint64_t v69 = (char *)&v14 - v67;
  uint32_t v80 = (char *)&v14 - v67;
  uint64_t v79 = v0;
  id v5 = sub_1DDEB61DC();
  uint64_t v72 = *v5;
  uint64_t v71 = v5[1];
  swift_bridgeObjectRetain();
  sub_1DDEC07C8();
  sub_1DDEEF1C8();
  sub_1DDEBC990();
  sub_1DDEBCA58();
  sub_1DDEBCB20();
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979B0);
  id v78 = sub_1DDEB67E8();
  if (v78)
  {
    id v29 = v78;
  }
  else
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v27 = v29;
  uint64_t v20 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v58, v73, v52);
  uint64_t v21 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v50, v74, v44);
  uint64_t v22 = v39;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v42, v75, v36);
  unint64_t v23 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v24 = (v23 + v56 + *(unsigned __int8 *)(v21 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v25 = (v24 + v48 + *(unsigned __int8 *)(v22 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v54 + 32))(v26 + v23, v58, v52);
  (*(void (**)(unint64_t, char *, uint64_t))(v46 + 32))(v26 + v24, v50, v44);
  (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v26 + v25, v42, v36);
  id v6 = (void *)sub_1DDEED778();
  sub_1DDEB6AA4(v6);
  id v28 = sub_1DDEB6A3C();
  if (v28)
  {
    uint64_t v19 = v28;
  }
  else
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v18 = v19;
  id v7 = v76;
  uint64_t v14 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v66, v69, v60);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v16 = (v15 + v64 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = swift_allocObject();
  unint64_t v9 = v15;
  uint64_t v10 = v66;
  uint64_t v11 = v62;
  uint64_t v12 = v60;
  uint64_t v17 = v8;
  *(void *)(v8 + 16) = v76;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v8 + v9, v10, v12);
  *(void *)(v17 + v16) = ObjectType;
  sub_1DDEED788();

  (*(void (**)(char *, uint64_t))(v38 + 8))(v75, v36);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v74, v44);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v73, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v69, v60);
}

uint64_t sub_1DDEBA758()
{
  id v5 = "Fatal error";
  id v6 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  id v7 = "MailUI/PriorityMessageListViewController.swift";
  uint64_t v21 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979B8);
  uint64_t v8 = *(void *)(v17 - 8);
  uint64_t v9 = v17 - 8;
  uint64_t v11 = *(void *)(v8 + 64);
  unint64_t v10 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v17);
  uint64_t v12 = (char *)v2 - v10;
  unint64_t v13 = v10;
  MEMORY[0x1F4188790]((char *)v2 - v10);
  uint64_t v14 = (char *)v2 - v13;
  uint64_t v21 = (char *)v2 - v13;
  uint64_t v20 = v0;
  uint64_t v16 = sub_1DDEB5820();
  uint64_t v19 = v16;
  unint64_t v15 = sub_1DDEC0DB8();
  sub_1DDEB68D0();
  sub_1DDEED718();
  sub_1DDEED6C8();
  id v18 = sub_1DDEB6A3C();
  if (v18)
  {
    uint64_t v4 = v18;
  }
  else
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  v2[0] = v4;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v12, v14, v17);
  sub_1DDEED7A8();
  uint64_t v3 = *(void (**)(char *, uint64_t))(v8 + 8);
  v2[1] = (id)(v8 + 8);
  v3(v12, v17);

  v3(v14, v17);
  return swift_bridgeObjectRelease();
}

void sub_1DDEBA9E0(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v13 = 0;
  uint64_t v16 = a1;
  unint64_t v15 = a2;
  uint64_t v10 = a3 + 16;
  uint64_t v14 = a3 + 16;
  swift_beginAccess();
  uint64_t v11 = (void *)MEMORY[0x1E01CABB0](v10);
  swift_endAccess();
  if (v11)
  {
    unint64_t v13 = v11;
    id v3 = v11;
    id v7 = objc_msgSend(v11, sel_traitCollection);

    id v4 = a2;
    unsigned __int8 v8 = objc_msgSend(v7, sel_hasDifferentColorAppearanceComparedToTraitCollection_, a2);

    if (v8)
    {
      id v12 = (id)sub_1DDEB7100();
      if (v12)
      {
        id v6 = v12;
        id v5 = v12;
        sub_1DDD31B20(&v12);
        PriorityMessageListBackgroundDecorationView.updateBorderColor()();
      }
      else
      {
        sub_1DDD31B20(&v12);
      }
    }
    else
    {
    }
  }
}

void sub_1DDEBABB4(char a1)
{
  char v6 = a1 & 1;
  id v5 = v1;
  id v2 = v1;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for PriorityMessageListViewController();
  objc_msgSendSuper2(&v4, sel_viewDidAppear_, a1 & 1);

  sub_1DDEB86BC(1);
  sub_1DDEBAC58();
}

void sub_1DDEBAC58()
{
  v4[2] = 0;
  if (objc_msgSend(self, sel_shimmerWhenAppearing))
  {
    id v2 = (void *)sub_1DDEB92B8();
    swift_bridgeObjectRetain();
    v4[1] = v2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB96ED0);
    sub_1DDE4EC34();
    char v3 = sub_1DDEEF098();
    sub_1DDD31430();
    swift_bridgeObjectRelease();
    if ((v3 & 1) == 0)
    {
      v4[0] = (id)sub_1DDEB7100();
      if (v4[0])
      {
        id v1 = v4[0];
        id v0 = v4[0];
        sub_1DDD31B20(v4);
        PriorityMessageListBackgroundDecorationView.shimmer()();
      }
      else
      {
        sub_1DDD31B20(v4);
      }
    }
  }
}

void sub_1DDEBADCC(char a1)
{
  char v6 = a1 & 1;
  id v5 = v1;
  id v2 = v1;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for PriorityMessageListViewController();
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);

  sub_1DDEB86BC(0);
}

id PriorityMessageListViewController.__deallocating_deinit()
{
  id v5 = v0;
  id v3 = objc_msgSend(self, sel_defaultCenter);
  id v1 = v0;
  objc_msgSend(v3, sel_removeObserver_, v0);
  swift_unknownObjectRelease();

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for PriorityMessageListViewController();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id PriorityMessageListViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v10, sel_initWithNibName_bundle_);

  return v5;
}

id PriorityMessageListViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  id v28 = a3;
  objc_super v4 = v3;
  id v5 = v3;
  uint64_t v6 = v3;
  id v7 = v3;
  unsigned __int8 v8 = v3;
  uint64_t v9 = v3;
  id v10 = v3;
  uint64_t v11 = v3;
  id v12 = v3;
  unint64_t v13 = v3;
  uint64_t v14 = v3;
  unint64_t v15 = v3;
  id v31 = v3;
  swift_unknownObjectWeakInit();

  *(void *)&v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_collectionView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_dataSource] = 0;

  *(void *)&v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier] = 0;
  *(void *)&v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier] = 0;

  swift_unknownObjectWeakInit();
  v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hasPendingHighlightsShimmer] = 0;

  v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewIsVisible] = 0;
  *(void *)&v3[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene] = 0;

  unint64_t v23 = (objc_class *)type metadata accessor for PriorityMessageListViewController();
  static Logger.mailUILogger<A>(for:)();

  *(void *)&v25[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel] = 0;
  uint64_t v24 = OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_messageByIdentifier;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979C8);
  sub_1DDEEF9A8();
  sub_1DDDB5240();
  type metadata accessor for MUIHighlightedMessage();
  sub_1DDE65130();
  *(void *)&v25[v24] = sub_1DDEEE998();

  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v20 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = 0;
  }
  v27.receiver = v31;
  v27.super_class = v23;
  id v19 = objc_msgSendSuper2(&v27, sel_initWithNibName_bundle_, v21);

  id v16 = v19;
  id v31 = v19;

  swift_bridgeObjectRelease();
  return v19;
}

id PriorityMessageListViewController.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id PriorityMessageListViewController.init(coder:)(void *a1)
{
  unint64_t v23 = a1;
  id v2 = v1;
  id v3 = v1;
  id v4 = v1;
  id v5 = v1;
  uint64_t v6 = v1;
  id v7 = v1;
  unsigned __int8 v8 = v1;
  uint64_t v9 = v1;
  id v10 = v1;
  uint64_t v11 = v1;
  id v12 = v1;
  unint64_t v13 = v1;
  id v24 = v1;
  swift_unknownObjectWeakInit();

  *(void *)&v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_collectionView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_dataSource] = 0;

  *(void *)&v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___headerIdentifier] = 0;
  *(void *)&v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController____lazy_storage___footerIdentifier] = 0;

  swift_unknownObjectWeakInit();
  v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hasPendingHighlightsShimmer] = 0;

  v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewIsVisible] = 0;
  *(void *)&v1[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_hostingScene] = 0;

  id v19 = (objc_class *)type metadata accessor for PriorityMessageListViewController();
  static Logger.mailUILogger<A>(for:)();

  *(void *)&v18[OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_viewModel] = 0;
  uint64_t v17 = OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_messageByIdentifier;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979C8);
  sub_1DDEEF9A8();
  sub_1DDDB5240();
  type metadata accessor for MUIHighlightedMessage();
  sub_1DDE65130();
  *(void *)&v18[v17] = sub_1DDEEE998();

  v22.receiver = v24;
  v22.super_class = v19;
  id v21 = objc_msgSendSuper2(&v22, sel_initWithCoder_, a1);
  if (v21)
  {
    id v14 = v21;
    id v24 = v21;

    return v21;
  }
  else
  {

    return 0;
  }
}

uint64_t sub_1DDEBB8C4(uint64_t a1, int a2)
{
  uint64_t v76 = a1;
  int v75 = a2;
  uint64_t v84 = 0;
  unint64_t v67 = (void (*)(char *, char *))sub_1DDEBC438;
  uint64_t v68 = sub_1DDEBC4A0;
  uint64_t v69 = sub_1DDEC0EBC;
  unsigned int v70 = sub_1DDEC1038;
  uint64_t v71 = "Fatal error";
  uint64_t v72 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  v73 = "MailUI/PriorityMessageListViewController.swift";
  uint64_t v118 = 0;
  uint64_t v117 = 0;
  char v116 = 0;
  uint64_t v115 = 0;
  uint64_t v110 = 0;
  uint64_t v74 = 0;
  uint64_t v108 = 0;
  uint64_t v105 = 0;
  BOOL v95 = 0;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB979D0);
  uint64_t v78 = *(void *)(v77 - 8);
  uint64_t v79 = v77 - 8;
  unint64_t v80 = (*(void *)(v78 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v76);
  int v81 = (char *)&v24 - v80;
  unint64_t v82 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v4);
  uint64_t v83 = (char *)&v24 - v82;
  uint64_t v118 = (char *)&v24 - v82;
  uint64_t v117 = v5;
  char v116 = v6 & 1;
  uint64_t v115 = v2;
  uint64_t v91 = &v114;
  v92 = sub_1DDEB924C();
  unint64_t v86 = sub_1DDDB5240();
  unint64_t v85 = type metadata accessor for MUIHighlightedMessage();
  unint64_t v87 = sub_1DDE65130();
  int v88 = sub_1DDD55248();
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB97968);
  sub_1DDEEE9E8();
  v92();
  uint64_t v112 = sub_1DDEB8FB4();
  if (v112)
  {
    uint64_t v63 = &v112;
    uint64_t v64 = v112;
    swift_retain();
    sub_1DDD31CE0();
    uint64_t v65 = sub_1DDE717F0();
    swift_release();
    uint64_t v66 = v65;
  }
  else
  {
    uint64_t v25 = 0;
    sub_1DDD31CE0();
    uint64_t v66 = v25;
  }
  uint64_t v111 = v66;
  if (v66)
  {
    uint64_t v113 = v111;
  }
  else
  {
    uint64_t v113 = sub_1DDEEF9A8();
    sub_1DDD31430();
  }
  uint64_t v7 = v74;
  uint64_t v57 = v113;
  uint64_t v110 = v113;
  uint64_t v109 = v113;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3930);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB979E0);
  unint64_t v8 = sub_1DDE74FF8();
  uint64_t result = sub_1DDD3F59C(v67, 0, v58, v59, MEMORY[0x1E4FBC248], v8, MEMORY[0x1E4FBC278], v60);
  uint64_t v61 = v7;
  uint64_t v62 = result;
  if (v7)
  {
    __break(1u);
    __break(1u);
    __break(1u);
  }
  else
  {
    uint64_t v53 = v62;
    uint64_t v108 = v62;
    v107[1] = v62;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979C8);
    sub_1DDEEF9A8();
    uint64_t v10 = sub_1DDEEE998();
    uint64_t v55 = v107;
    v107[0] = v10;
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979F0);
    sub_1DDEC0E38();
    sub_1DDEEECE8();
    uint64_t v56 = 0;
    sub_1DDEB91C8(v107[2]);
    uint64_t v106 = v53;
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    unint64_t v11 = sub_1DDEC0EF0();
    uint64_t v52 = sub_1DDD3F59C((void (*)(char *, char *))v69, KeyPath, v54, (uint64_t)&unk_1F39C9F98, MEMORY[0x1E4FBC248], v11, MEMORY[0x1E4FBC278], v60);
    uint64_t v47 = v52;
    swift_release();
    swift_release();
    uint64_t v105 = v47;
    sub_1DDEB68D0();
    sub_1DDEED7F8();
    swift_bridgeObjectRetain();
    unint64_t v49 = &v104;
    uint64_t v104 = v47;
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97A08);
    sub_1DDEC0F74();
    int v50 = sub_1DDEEF098();
    sub_1DDD31430();
    if ((v50 & 1) == 0)
    {
      unint64_t v43 = &unk_1F39C9F98;
      uint64_t v44 = sub_1DDEEF9A8();
      v42 = v12;
      id v13 = sub_1DDEB6B90();
      id v14 = v42;
      id v15 = v13;
      uint64_t v16 = v44;
      void *v42 = v15;
      *((unsigned char *)v14 + 8) = 0;
      sub_1DDD4242C();
      uint64_t v45 = v16;
      uint64_t v102 = 0;
      int v46 = 255;
      char v103 = -1;
      sub_1DDEED7E8();
      swift_bridgeObjectRelease();
      uint64_t v100 = 0;
      char v101 = v46;
      sub_1DDEED7E8();
      uint64_t v98 = sub_1DDEB8FB4();
      if (v98)
      {
        uint64_t v37 = &v98;
        uint64_t v38 = v98;
        swift_retain();
        sub_1DDD31CE0();
        uint64_t v39 = sub_1DDE71854();
        swift_release();
        uint64_t v40 = v39;
        int v41 = 0;
      }
      else
      {
        uint64_t v32 = 0;
        sub_1DDD31CE0();
        uint64_t v40 = v32;
        int v41 = 1;
      }
      uint64_t v96 = v40;
      char v97 = v41 & 1;
      uint64_t v99 = (v41 & 1) != 0 ? 0 : v96;
      BOOL v95 = v99 > 0;
      if (v99 > 0)
      {
        id v34 = &unk_1F39C9F98;
        uint64_t v35 = sub_1DDEEF9A8();
        id v33 = v17;
        id v18 = sub_1DDEB6E48();
        id v19 = v33;
        id v20 = v18;
        uint64_t v21 = v35;
        *id v33 = v20;
        *((unsigned char *)v19 + 8) = 2;
        sub_1DDD4242C();
        uint64_t v36 = v21;
        uint64_t v93 = 0;
        char v94 = -1;
        sub_1DDEED7E8();
        swift_bridgeObjectRelease();
      }
    }
    id v31 = sub_1DDEB6A3C();
    if (v31)
    {
      uint64_t v30 = v31;
    }
    else
    {
      sub_1DDEEF7D8();
      __break(1u);
    }
    id v27 = v30;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v81, v83, v77);
    id v22 = v90;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v90;
    uint64_t v26 = v23;
    sub_1DDEED7B8();
    sub_1DDD78F10((uint64_t)v70);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v78 + 8);
    uint64_t v28 = v78 + 8;
    v29(v81, v77);

    v29(v83, v77);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1DDEBC438@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v6 = *a1;
  id v2 = *a1;
  *(void *)a2 = sub_1DDEB5AF0(v6);
  *(unsigned char *)(a2 + 8) = v3;
  id result = v6;
  *(void *)(a2 + 16) = v6;
  return result;
}

void sub_1DDEBC4A0(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v6 = *(void **)(a2 + 16);
  id v2 = *(id *)a2;
  id v3 = v6;
  sub_1DDEB5A18(v5);
  id v4 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EAB97968);
  sub_1DDEEEA38();
}

uint64_t sub_1DDEBC59C(uint64_t a1)
{
  id v4 = *(id *)a1;
  char v5 = *(unsigned char *)(a1 + 8);
  id v6 = *(id *)(a1 + 16);
  id v1 = *(id *)a1;
  id v2 = v6;
  swift_retain();
  id v7 = v4;
  char v8 = v5;
  id v9 = v6;
  swift_getAtKeyPath();
  sub_1DDEC22D0(&v7);
  return swift_release();
}

void sub_1DDEBC634(void *a1)
{
  id v6 = a1;
  uint64_t v9 = 0;
  id v7 = sub_1DDEC2264;
  uint64_t v27 = 0;
  uint64_t v13 = sub_1DDEEE868();
  uint64_t v10 = *(void *)(v13 - 8);
  uint64_t v11 = v13 - 8;
  unint64_t v4 = (*(void *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  id v12 = (char *)&v3 - v4;
  uint64_t v17 = sub_1DDEEE898();
  uint64_t v14 = *(void *)(v17 - 8);
  uint64_t v15 = v17 - 8;
  unint64_t v5 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v9);
  uint64_t v16 = (char *)&v3 - v5;
  uint64_t v27 = v1;
  sub_1DDD7B204();
  id v19 = (id)sub_1DDEEF238();
  uint64_t v8 = swift_allocObject();
  id v2 = v6;
  swift_unknownObjectWeakInit();

  swift_retain();
  uint64_t v25 = v7;
  uint64_t v26 = v8;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  int v21 = 1107296256;
  int v22 = 0;
  uint64_t v23 = sub_1DDDAD198;
  uint64_t v24 = &block_descriptor_77;
  id v18 = _Block_copy(&aBlock);
  swift_release();
  swift_release();
  sub_1DDE7ABC8();
  sub_1DDE7ABE0();
  MEMORY[0x1E01C91C0](v9, v16, v12, v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v13);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  _Block_release(v18);
}

void sub_1DDEBC8B8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  id v2 = (void *)MEMORY[0x1E01CABB0](v1);
  swift_endAccess();
  if (v2)
  {
    sub_1DDEB74AC();
  }
}

uint64_t sub_1DDEBC990()
{
  swift_allocObject();
  id v0 = v2;
  swift_unknownObjectWeakInit();

  swift_retain();
  swift_release();
  type metadata accessor for PriorityMessageListHeaderCell();
  return sub_1DDEEF1B8();
}

uint64_t sub_1DDEBCA58()
{
  swift_allocObject();
  id v0 = v2;
  swift_unknownObjectWeakInit();

  swift_retain();
  swift_release();
  type metadata accessor for PriorityMessageListCell();
  return sub_1DDEEF1B8();
}

uint64_t sub_1DDEBCB20()
{
  swift_allocObject();
  id v0 = v2;
  swift_unknownObjectWeakInit();

  swift_retain();
  swift_release();
  type metadata accessor for PriorityMessageListFooterCell();
  return sub_1DDEEF1B8();
}

uint64_t sub_1DDEBCBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v25 = 0;
  char v26 = 0;
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v28 = a1;
  uint64_t v27 = a2;
  id v14 = *(id *)a3;
  int v15 = *(unsigned __int8 *)(a3 + 8);
  id v25 = *(id *)a3;
  char v26 = v15;
  uint64_t v24 = a4;
  uint64_t v23 = a5;
  uint64_t v22 = a6;
  uint64_t v6 = sub_1DDEECF28();
  if (sub_1DDEB57D8(v6))
  {
    sub_1DDEEEC08();
    sub_1DDEEF7E8();
    __break(1u);
  }
  else if (v15)
  {
    id v8 = v14;
    if (v15 == 1)
    {
      id v18 = v14;
      char v19 = 1;
      type metadata accessor for PriorityMessageListCell();
      uint64_t v11 = sub_1DDEEF1D8();
      sub_1DDEC2308((uint64_t)&v18);
      return v11;
    }
    else
    {
      id v20 = v14;
      char v21 = v15;
      type metadata accessor for PriorityMessageListFooterCell();
      uint64_t v10 = sub_1DDEEF1D8();
      sub_1DDEC2308((uint64_t)&v20);
      return v10;
    }
  }
  else
  {
    id v7 = v14;
    id v16 = v14;
    char v17 = 0;
    type metadata accessor for PriorityMessageListHeaderCell();
    uint64_t v12 = sub_1DDEEF1D8();
    sub_1DDEC2308((uint64_t)&v16);
    return v12;
  }
  return v13;
}

uint64_t sub_1DDEBCE74()
{
  swift_bridgeObjectRetain();
  sub_1DDEB61DC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_1DDEEEC18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    id v3 = sub_1DDEB67E8();
    if (v3)
    {
      id v2 = v3;
    }
    else
    {
      sub_1DDEEF7D8();
      __break(1u);
    }
    sub_1DDEC07C8();
    uint64_t v1 = sub_1DDEEF1E8();

    return v1;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1DDEEEC08();
    uint64_t result = sub_1DDEEF7E8();
    __break(1u);
  }
  return result;
}

id sub_1DDEBD090()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = swift_allocObject();
  id v0 = v2;
  swift_unknownObjectWeakInit();

  swift_retain();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = ObjectType;
  swift_release();
  sub_1DDEC10A4();
  swift_retain();
  id v8 = sub_1DDEBE014((uint64_t)sub_1DDEC1098, v7);
  type metadata accessor for PriorityMessageListBackgroundDecorationView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_1DDEAD6FC();
  swift_bridgeObjectRetain();
  id v6 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_registerClass_forDecorationViewOfKind_, ObjCClassFromMetadata, v6);

  swift_release();
  return v8;
}

void sub_1DDEBD228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  id v6 = (void *)MEMORY[0x1E01CABB0](v5);
  swift_endAccess();
  if (v6)
  {
    uint64_t v4 = sub_1DDEB8FB4();
    PriorityMessageListHeaderCell.updateViewModel(_:)(v4);
    swift_release();
  }
}

void sub_1DDEBD314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v19 = 0;
  char v20 = 0;
  uint64_t v18 = 0;
  char v17 = 0;
  uint64_t v22 = a1;
  uint64_t v21 = a2;
  uint64_t v12 = *(void **)a3;
  char v4 = *(unsigned char *)(a3 + 8);
  char v19 = *(void **)a3;
  char v20 = v4;
  uint64_t v13 = a4 + 16;
  uint64_t v18 = a4 + 16;
  swift_beginAccess();
  id v14 = (void *)MEMORY[0x1E01CABB0](v13);
  swift_endAccess();
  if (v14)
  {
    char v17 = v14;
    id v6 = sub_1DDEB5A18(v12);
    uint64_t v9 = sub_1DDEB9160();
    id v15 = v6;
    unint64_t v7 = sub_1DDDB5240();
    unint64_t v8 = type metadata accessor for MUIHighlightedMessage();
    unint64_t v5 = sub_1DDE65130();
    MEMORY[0x1E01C89A0](&v16, &v15, v9, v7, v8, v5);

    id v11 = v16;
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_1DDEB8FB4();
    PriorityMessageListCell.updateMessage(_:andViewModel:)(v11, v10);
    swift_release();
  }
}

void sub_1DDEBD4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 16;
  swift_beginAccess();
  id v6 = (void *)MEMORY[0x1E01CABB0](v5);
  swift_endAccess();
  if (v6)
  {
    uint64_t v4 = sub_1DDEB8FB4();
    PriorityMessageListFooterCell.updateViewModel(_:)(v4);
    swift_release();
  }
}

id sub_1DDEBD594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v105 = a1;
  uint64_t v104 = a2;
  uint64_t v103 = a3;
  char v94 = "Fatal error";
  BOOL v95 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  uint64_t v96 = "MailUI/PriorityMessageListViewController.swift";
  v154 = 0;
  uint64_t v153 = 0;
  uint64_t v152 = 0;
  uint64_t v151 = 0;
  v149 = 0;
  id v148 = 0;
  uint64_t v147 = 0;
  double v146 = 0.0;
  double v137 = 0.0;
  double v128 = 0.0;
  long long v126 = 0u;
  long long v127 = 0u;
  id v121 = 0;
  id v120 = 0;
  uint64_t v97 = 0;
  uint64_t v98 = sub_1DDEED818();
  uint64_t v99 = *(void *)(v98 - 8);
  uint64_t v100 = v98 - 8;
  unint64_t v101 = (*(void *)(v99 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v102 = (char *)v39 - v101;
  uint64_t v106 = sub_1DDEED878();
  uint64_t v107 = *(void *)(v106 - 8);
  uint64_t v108 = v106 - 8;
  unint64_t v109 = (*(void *)(v107 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v105);
  uint64_t v110 = (char *)v39 - v109;
  unint64_t v111 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v4);
  uint64_t v112 = (char *)v39 - v111;
  v154 = (char *)v39 - v111;
  uint64_t v153 = v5;
  uint64_t v152 = v6;
  uint64_t v113 = v7 + 16;
  uint64_t v151 = v7 + 16;
  char v114 = &v150;
  swift_beginAccess();
  uint64_t v115 = (void *)MEMORY[0x1E01CABB0](v113);
  swift_endAccess();
  if (!v115) {
    return 0;
  }
  uint64_t v93 = v115;
  id v92 = v115;
  v149 = v115;
  if (sub_1DDEB57D8(v105))
  {

    return 0;
  }
  objc_msgSend(self, sel_preferredMessageListBackgroundCornerRadius);
  uint64_t v90 = v8;
  uint64_t v147 = v8;
  (*(void (**)(char *, void, uint64_t))(v99 + 104))(v102, *MEMORY[0x1E4FB10C0], v98);
  sub_1DDEED828();
  sub_1DDEED838();
  id v9 = objc_msgSend(self, sel_clearColor);
  sub_1DDEED848();
  double v91 = *(double *)sub_1DDEAD770();
  double v146 = v91;
  uint64_t v144 = sub_1DDEB8FB4();
  if (v144)
  {
    uint64_t v84 = &v144;
    uint64_t v85 = v144;
    swift_retain();
    sub_1DDD31CE0();
    sub_1DDE6EDBC();
    double v86 = v10;
    swift_release();
    double v88 = v86;
    int v89 = 0;
  }
  else
  {
    double v87 = 0.0;
    sub_1DDD31CE0();
    double v88 = v87;
    int v89 = 1;
  }
  double v142 = v88;
  char v143 = v89 & 1;
  id v11 = v92;
  if (v143)
  {
    id v12 = v92;
    id v83 = objc_msgSend(v92, sel_view);

    if (v83)
    {
      id v82 = v83;
      id v80 = v83;
      objc_msgSend(v83, sel_safeAreaInsets);
      uint64_t v138 = v13;
      double v139 = v14;
      uint64_t v140 = v15;
      uint64_t v141 = v16;
      double v81 = v14;

      double v145 = v91 + v81;
    }
    else
    {
      sub_1DDEEF7D8();
      __break(1u);
    }
  }
  else
  {
    double v145 = v142;
  }

  double v79 = v145;
  double v137 = v145;
  uint64_t v135 = sub_1DDEB8FB4();
  if (v135)
  {
    v73 = &v135;
    uint64_t v74 = v135;
    swift_retain();
    sub_1DDD31CE0();
    sub_1DDE6EDBC();
    double v75 = v17;
    swift_release();
    double v77 = v75;
    int v78 = 0;
  }
  else
  {
    double v76 = 0.0;
    sub_1DDD31CE0();
    double v77 = v76;
    int v78 = 1;
  }
  double v133 = v77;
  char v134 = v78 & 1;
  id v18 = v92;
  if (v134)
  {
    id v19 = v92;
    id v72 = objc_msgSend(v92, sel_view);

    if (v72)
    {
      id v71 = v72;
      id v69 = v72;
      objc_msgSend(v72, sel_safeAreaInsets);
      uint64_t v129 = v20;
      uint64_t v130 = v21;
      uint64_t v131 = v22;
      double v132 = v23;
      double v70 = v23;

      double v136 = v91 + v70;
    }
    else
    {
      sub_1DDEEF7D8();
      __break(1u);
    }
  }
  else
  {
    double v136 = v133;
  }

  double v55 = v136;
  double v128 = v136;
  double v54 = 0.0;
  *(void *)&long long v126 = 0;
  *((double *)&v126 + 1) = v79;
  *(double *)&long long v127 = v91;
  *((double *)&v127 + 1) = v136;
  uint64_t v56 = 0;
  sub_1DDD6130C();
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v110, v112, v106);
  id v67 = (id)sub_1DDEEF308();
  uint64_t v66 = *(void (**)(char *, uint64_t))(v107 + 8);
  uint64_t v65 = v107 + 8;
  v66(v110, v106);
  id v24 = v67;
  id v25 = v67;
  id v26 = v67;
  id v27 = v67;
  id v148 = v67;
  unint64_t v53 = 0x1F639E000uLL;
  double v122 = v54;
  double v123 = v79;
  double v124 = v91;
  double v125 = v55;
  objc_msgSend(v67, (SEL)0x1F639EC18, v54, v79, v91, v55);

  unint64_t v46 = sub_1DDEC2194();
  sub_1DDD611DC();
  v39[1] = 0x1E4FB1000uLL;
  id v40 = objc_msgSend(self, sel_fractionalWidthDimension_, 1.0);
  id v28 = objc_msgSend(self, sel_absoluteDimension_, v54);
  id v41 = sub_1DDD612A8(v40, v28);
  uint64_t v29 = sub_1DDEB61DC();
  uint64_t v42 = *v29;
  uint64_t v43 = v29[1];
  swift_bridgeObjectRetain();
  uint64_t v57 = 1;
  id v64 = sub_1DDEC3030(v41, v42, v43, 1);
  id v121 = v64;
  uint64_t v45 = sub_1DDEEF9A8();
  uint64_t v44 = v30;
  id v31 = v64;
  uint64_t v32 = v45;
  *uint64_t v44 = v64;
  sub_1DDD4242C();
  uint64_t v47 = v32;
  id v48 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v67, sel_setBoundarySupplementaryItems_, v48);

  id v51 = self;
  id v33 = sub_1DDEAD6FC();
  uint64_t v49 = *v33;
  uint64_t v50 = v33[1];
  swift_bridgeObjectRetain();
  id v52 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  id v63 = objc_msgSend(v51, sel_backgroundDecorationItemWithElementKind_, v52);

  id v120 = v63;
  id v34 = v63;
  double v116 = v54;
  double v117 = v79;
  double v118 = v91;
  double v119 = v55;
  objc_msgSend(v63, (SEL)(v53 + 3096), v54, v79, v91, v55);

  unint64_t v60 = sub_1DDEC21FC();
  uint64_t v59 = sub_1DDEEF9A8();
  uint64_t v58 = v35;
  id v36 = v63;
  uint64_t v37 = v59;
  *uint64_t v58 = v63;
  sub_1DDD4242C();
  uint64_t v61 = v37;
  id v62 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v67, sel_setDecorationItems_, v62);

  v66(v112, v106);
  return v67;
}

id sub_1DDEBE014(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1DDEC04B0(a1, a2);
}

void sub_1DDEBE05C(uint64_t a1, void *a2)
{
  uint64_t v5 = a1 + 16;
  v6[5] = (id)(a1 + 16);
  v6[4] = a2;
  swift_beginAccess();
  v6[0] = (id)MEMORY[0x1E01CABB0](v5);
  if (v6[0])
  {
    id v4 = v6[0];
    id v2 = v6[0];
    sub_1DDD31B20(v6);
    swift_endAccess();
    uint64_t v3 = sub_1DDE683B4();
    sub_1DDEB8F74(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DDD31B20(v6);
    swift_endAccess();
  }
}

uint64_t sub_1DDEBE134()
{
  return sub_1DDEC001C();
}

uint64_t sub_1DDEBE16C()
{
  id v4 = sub_1DDEB6A3C();
  if (v4)
  {
    uint64_t v3 = v4;
  }
  else
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  sub_1DDEED798();

  if (v6 == 255) {
    goto LABEL_10;
  }
  id v0 = v5;
  if (v6)
  {

LABEL_10:
    char v2 = 0;
    return v2 & 1;
  }

  char v2 = 1;
  return v2 & 1;
}

void sub_1DDEBE318(uint64_t a1)
{
  uint64_t v5 = a1 + 16;
  v7[4] = (id)(a1 + 16);
  swift_beginAccess();
  v7[0] = (id)MEMORY[0x1E01CABB0](v5);
  if (v7[0])
  {
    id v4 = v7[0];
    id v1 = v7[0];
    sub_1DDD31B20(v7);
    swift_endAccess();
    id v6 = (id)sub_1DDEB7100();
    if (v6)
    {
      id v3 = v6;
      id v2 = v6;
      sub_1DDD31B20(&v6);

      PriorityMessageListBackgroundDecorationView.shimmer()();
    }
    else
    {
      sub_1DDD31B20(&v6);
    }
  }
  else
  {
    sub_1DDD31B20(v7);
    swift_endAccess();
  }
}

uint64_t sub_1DDEBE42C(uint64_t a1)
{
  uint64_t v30 = a1;
  id v28 = sub_1DDD4F200;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v29 = 0;
  uint64_t v31 = sub_1DDEED388();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = v31 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v30);
  uint64_t v35 = (char *)v8 - v34;
  uint64_t v43 = v2;
  uint64_t v42 = v1;
  uint64_t result = sub_1DDEB728C();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v35, v27 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger, v31);
    id v25 = sub_1DDEED368();
    int v24 = sub_1DDEEF1A8();
    uint64_t v22 = &v40;
    uint64_t v40 = 2;
    unint64_t v20 = sub_1DDD3C7B0();
    unint64_t v21 = sub_1DDD42470();
    sub_1DDD424EC();
    sub_1DDEEED58();
    uint32_t v23 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3A10);
    uint64_t v26 = sub_1DDEEF9A8();
    if (os_log_type_enabled(v25, (os_log_type_t)v24))
    {
      uint64_t v4 = v29;
      double v10 = (uint8_t *)sub_1DDEEF4E8();
      v8[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA39D0);
      uint64_t v9 = 0;
      uint64_t v11 = sub_1DDD4258C(0);
      uint64_t v12 = sub_1DDD4258C(v9);
      uint64_t v16 = &v39;
      uint64_t v39 = v10;
      double v17 = &v38;
      uint64_t v38 = v11;
      double v14 = &v37;
      uint64_t v37 = v12;
      unsigned int v13 = 0;
      sub_1DDD425E8(0, &v39);
      sub_1DDD425E8(v13, v16);
      uint64_t v36 = v26;
      uint64_t v15 = v8;
      MEMORY[0x1F4188790](v8);
      uint64_t v5 = v17;
      id v6 = &v8[-6];
      id v18 = &v8[-6];
      void v6[2] = v16;
      v6[3] = v5;
      v6[4] = v7;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA39B0);
      sub_1DDD4F230();
      sub_1DDEEED18();
      if (v4)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_1DDCDB000, v25, (os_log_type_t)v24, "Hosting scene became active and there is a pending shimmer.", v10, v23);
        v8[0] = 0;
        sub_1DDD42648(v11);
        sub_1DDD42648(v12);
        sub_1DDEEF4C8();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v31);
    return sub_1DDEB74AC();
  }
  return result;
}

uint64_t PriorityMessageListViewController.collectionView(_:selectionFollowsFocusForItemAt:)()
{
  return 1;
}

uint64_t PriorityMessageListViewController.collectionView(_:canFocusItemAt:)()
{
  return (sub_1DDEBE16C() ^ 1) & 1;
}

uint64_t PriorityMessageListViewController.collectionView(_:shouldHighlightItemAt:)()
{
  return (sub_1DDEBE16C() ^ 1) & 1;
}

uint64_t PriorityMessageListViewController.collectionView(_:shouldSelectItemAt:)()
{
  return (sub_1DDEBE16C() ^ 1) & 1;
}

void PriorityMessageListViewController.collectionView(_:didSelectItemAt:)(uint64_t a1, uint64_t a2)
{
  uint64_t v92 = a1;
  uint64_t v91 = a2;
  uint64_t v83 = 0;
  v73 = sub_1DDEC11D8;
  uint64_t v74 = sub_1DDEC1290;
  double v75 = sub_1DDD43144;
  double v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DDD42810;
  double v77 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DDD42810;
  int v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DDD43214;
  double v79 = "Fatal error";
  id v80 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  double v81 = "MailUI/PriorityMessageListViewController.swift";
  uint64_t v118 = 0;
  uint64_t v117 = 0;
  uint64_t v116 = 0;
  uint64_t v82 = 0;
  uint64_t v105 = 0;
  char v106 = 0;
  id v103 = 0;
  uint64_t v100 = 0;
  uint64_t v84 = sub_1DDEECF38();
  uint64_t v86 = *(void *)(v84 - 8);
  uint64_t v85 = v84 - 8;
  uint64_t v87 = v86;
  uint64_t v88 = *(void *)(v86 + 64);
  unint64_t v89 = (v88 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v90 = (char *)v22 - v89;
  uint64_t v93 = sub_1DDEED388();
  uint64_t v94 = *(void *)(v93 - 8);
  uint64_t v95 = v93 - 8;
  unint64_t v96 = (*(void *)(v94 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v92);
  uint64_t v97 = (char *)v22 - v96;
  uint64_t v118 = v3;
  uint64_t v117 = v4;
  uint64_t v116 = v2;
  id v98 = sub_1DDEB6A3C();
  if (v98)
  {
    id v71 = v98;
  }
  else
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v68 = v71;
  sub_1DDEED798();

  id v69 = v114;
  int v70 = v115;
  if (v115 == 255)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v97, v72 + OBJC_IVAR____TtC6MailUI33PriorityMessageListViewController_logger, v93);
    uint64_t v30 = v87;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v90, v91, v84);
    unint64_t v31 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    uint64_t v39 = 7;
    uint64_t v32 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v86 + 32))(v32 + v31, v90, v84);
    swift_retain();
    uint64_t v38 = 32;
    uint64_t v8 = swift_allocObject();
    uint64_t v9 = v32;
    uint64_t v40 = v8;
    *(void *)(v8 + 16) = v73;
    *(void *)(v8 + 24) = v9;
    swift_release();
    id v48 = sub_1DDEED368();
    int v49 = sub_1DDEEF198();
    uint64_t v35 = &v112;
    uint64_t v112 = 12;
    unint64_t v33 = sub_1DDD3C7B0();
    unint64_t v34 = sub_1DDD42470();
    sub_1DDD424EC();
    sub_1DDEEED58();
    uint32_t v36 = v113;
    uint64_t v37 = 17;
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 34;
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 8;
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = v40;
    uint64_t v41 = v10;
    *(void *)(v10 + 16) = v74;
    *(void *)(v10 + 24) = v11;
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v41;
    uint64_t v45 = v12;
    *(void *)(v12 + 16) = v75;
    *(void *)(v12 + 24) = v13;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3A10);
    uint64_t v44 = sub_1DDEEF9A8();
    unint64_t v46 = v14;
    swift_retain();
    uint64_t v15 = v42;
    uint64_t v16 = v46;
    uint64_t *v46 = v76;
    v16[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
    swift_retain();
    uint64_t v17 = v43;
    id v18 = v46;
    v46[2] = v77;
    v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
    swift_retain();
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v45;
    unint64_t v20 = v46;
    v46[4] = v78;
    v20[5] = v19;
    sub_1DDD4242C();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v48, (os_log_type_t)v49))
    {
      uint64_t v21 = v82;
      uint32_t v23 = (uint8_t *)sub_1DDEEF4E8();
      v22[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA39D0);
      uint64_t v24 = sub_1DDD4258C(0);
      uint64_t v25 = sub_1DDD4258C(1);
      uint64_t v26 = &v111;
      unint64_t v111 = v23;
      uint64_t v27 = &v110;
      uint64_t v110 = v24;
      id v28 = &v109;
      uint64_t v109 = v25;
      sub_1DDD425E8(2, &v111);
      sub_1DDD425E8(1, v26);
      uint64_t v107 = v76;
      uint64_t v108 = v42;
      sub_1DDD425FC(&v107, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28);
      uint64_t v29 = v21;
      if (v21)
      {
        __break(1u);
      }
      else
      {
        uint64_t v107 = v77;
        uint64_t v108 = v43;
        sub_1DDD425FC(&v107, (uint64_t)&v111, (uint64_t)&v110, (uint64_t)&v109);
        v22[1] = 0;
        uint64_t v107 = v78;
        uint64_t v108 = v45;
        sub_1DDD425FC(&v107, (uint64_t)&v111, (uint64_t)&v110, (uint64_t)&v109);
        _os_log_impl(&dword_1DDCDB000, v48, (os_log_type_t)v49, "Unable to select item at index path: %{public}s", v23, v36);
        sub_1DDD42648(v24);
        sub_1DDD42648(v25);
        sub_1DDEEF4C8();
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

    (*(void (**)(char *, uint64_t))(v94 + 8))(v97, v93);
  }
  else
  {
    uint64_t v66 = v69;
    int v67 = v70;
    int v64 = v70;
    id v65 = v69;
    uint64_t v105 = v69;
    char v106 = v70;
    if ((_BYTE)v70)
    {
      if (v64 == 1)
      {
        id v63 = v65;
        id v56 = v65;
        id v5 = v65;
        id v103 = v56;
        id v6 = v56;
        uint64_t v58 = sub_1DDEB9160();
        uint64_t v61 = &v101;
        id v101 = v56;
        uint64_t v57 = 0;
        unint64_t v59 = sub_1DDDB5240();
        unint64_t v60 = type metadata accessor for MUIHighlightedMessage();
        unint64_t v7 = sub_1DDE65130();
        MEMORY[0x1E01C89A0](&v102, v61, v58, v59, v60, v7);

        id v62 = v102;
        if (v102)
        {
          double v55 = v62;
          id v54 = v62;
          uint64_t v100 = v62;
          swift_bridgeObjectRelease();
          uint64_t v99 = (void *)sub_1DDEB64D4();
          if (v99)
          {
            id v52 = &v99;
            id v53 = v99;
            swift_unknownObjectRetain();
            sub_1DDD5C558();
            swift_getObjectType();
            objc_msgSend(v53, sel_highlightedMessagesViewDidSelectMessage_, v54);
            swift_unknownObjectRelease();
          }
          else
          {
            sub_1DDD5C558();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        uint64_t v104 = sub_1DDEB8FB4();
        if (v104)
        {
          uint64_t v50 = &v104;
          uint64_t v51 = v104;
          swift_retain();
          sub_1DDD31CE0();
          sub_1DDE6DB14();
          swift_release();
        }
        else
        {
          sub_1DDD31CE0();
        }
      }
    }
  }
}

uint64_t sub_1DDEBFBF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = sub_1DDEECF38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
}

void PriorityMessageListViewController.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  sub_1DDEAD6FC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v6 = sub_1DDEEEC18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    id v2 = a2;
    type metadata accessor for PriorityMessageListBackgroundDecorationView();
    uint64_t v4 = swift_dynamicCastClass();
    if (v4)
    {
      uint64_t v3 = (void *)v4;
    }
    else
    {

      uint64_t v3 = 0;
    }
    sub_1DDEB7168(v3);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DDEC001C()
{
  return swift_release();
}

uint64_t sub_1DDEC00EC(void (*a1)(void))
{
  return swift_release();
}

uint64_t (*sub_1DDEC014C(uint64_t a1, uint64_t a2))()
{
  swift_retain();
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_1DDEC1FF8;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t sub_1DDEC01C4(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v15 = MEMORY[0x1E4FBCFD8];
  v13[1] = 0;
  id v18 = &unk_1EAB97A80;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v13[0] = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA33C0) - 8) + 64)
          + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v19 = (char *)v13 - v13[0];
  uint64_t v20 = v2;
  uint64_t v21 = v3;
  uint64_t v4 = sub_1DDEEEF98();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 56))(v19, 1);
  swift_retain();
  sub_1DDEEEF68();
  uint64_t v14 = sub_1DDEEEF58();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = v15;
  uint64_t v7 = v16;
  uint64_t v8 = v17;
  uint64_t v9 = (uint64_t)v18;
  uint64_t v10 = (void *)v5;
  uint64_t v11 = (uint64_t)v19;
  v10[2] = v14;
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = v8;
  sub_1DDDB4CD0(v11, v9, (uint64_t)v10, MEMORY[0x1E4FBC848] + 8);
  return swift_release();
}

uint64_t sub_1DDEC0348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a5;
  v5[5] = a4;
  v5[4] = v5;
  v5[2] = 0;
  v5[3] = 0;
  v5[2] = a4;
  v5[3] = a5;
  sub_1DDEEEF68();
  v5[7] = sub_1DDEEEF58();
  uint64_t v6 = sub_1DDEEEF28();
  return MEMORY[0x1F4188298](sub_1DDEC040C, v6);
}

uint64_t sub_1DDEC040C()
{
  *(void *)(v0 + 32) = v0;
  sub_1DDEC001C();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v1();
}

id sub_1DDEC04B0(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  int v7 = 1107296256;
  int v8 = 0;
  uint64_t v9 = sub_1DDD5E50C;
  uint64_t v10 = &block_descriptor_73;
  uint64_t v4 = _Block_copy(&aBlock);
  id v5 = objc_msgSend(v3, sel_initWithSectionProvider_);
  _Block_release(v4);
  swift_release();
  return v5;
}

unint64_t sub_1DDEC0560()
{
  uint64_t v2 = qword_1EAB97948;
  if (!qword_1EAB97948)
  {
    type metadata accessor for ActivationState();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97948);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEC05E4()
{
  return swift_deallocObject();
}

void sub_1DDEC0624()
{
  sub_1DDEBE318(v0);
}

uint64_t sub_1DDEC062C()
{
  return swift_deallocObject();
}

void sub_1DDEC0674()
{
  sub_1DDEBE05C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_1DDEC0680()
{
  uint64_t v2 = qword_1EAB97978;
  if (!qword_1EAB97978)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EAB97968);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97978);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for PriorityMessageListViewController()
{
  uint64_t v1 = qword_1EAB97A48;
  if (!qword_1EAB97A48) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_1DDEC077C()
{
  return swift_deallocObject();
}

void sub_1DDEC07BC(uint64_t a1, void *a2)
{
  sub_1DDEBA9E0(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_1DDEC07C8()
{
  uint64_t v2 = qword_1EAB979A8;
  if (!qword_1EAB979A8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EAB979A8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DDEC0830()
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97998);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v2 = v4 + *(void *)(v6 + 64);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97990);
  uint64_t v7 = *(void *)(v9 - 8);
  unint64_t v8 = (v2 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v3 = v8 + *(void *)(v7 + 64);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97988);
  uint64_t v10 = *(void *)(v12 - 8);
  unint64_t v11 = (v3 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v4, v5);
  (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v11, v12);
  return swift_deallocObject();
}

uint64_t sub_1DDEC0A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97998) - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v9 = v13 + *(void *)(v8 + 64);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97990);
  unint64_t v14 = (v9 + *(unsigned __int8 *)(*(void *)(v4 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v10 = v14 + *(void *)(*(void *)(v4 - 8) + 64);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB97988);
  uint64_t v6 = v3
     + ((v10 + *(unsigned __int8 *)(*(void *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  return sub_1DDEBCBE8(a1, a2, a3, v3 + v13, v3 + v14, v6);
}

uint64_t sub_1DDEC0BF4()
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979A0);
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t sub_1DDEC0CF0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB979A0);
  return sub_1DDEBCE74();
}

unint64_t sub_1DDEC0DB8()
{
  uint64_t v2 = qword_1EAB979C0;
  if (!qword_1EAB979C0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB979C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEC0E38()
{
  uint64_t v2 = qword_1EAB979F8;
  if (!qword_1EAB979F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAB979F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB979F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEC0EBC(uint64_t a1)
{
  return sub_1DDEBC59C(a1);
}

unint64_t sub_1DDEC0EF0()
{
  uint64_t v2 = qword_1EAB97A00;
  if (!qword_1EAB97A00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAB979F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEC0F74()
{
  uint64_t v2 = qword_1EAB97A10;
  if (!qword_1EAB97A10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAB97A08);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A10);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEC0FF8()
{
  return swift_deallocObject();
}

void sub_1DDEC1038()
{
  sub_1DDEBC634(*(void **)(v0 + 16));
}

void sub_1DDEC1040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DDEBD228(a1, a2, a3, v3);
}

void sub_1DDEC1048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DDEBD314(a1, a2, a3, v3);
}

void sub_1DDEC1050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1DDEBD4A8(a1, a2, a3, v3);
}

uint64_t sub_1DDEC1058()
{
  return swift_deallocObject();
}

id sub_1DDEC1098(uint64_t a1, uint64_t a2)
{
  return sub_1DDEBD594(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_1DDEC10A4()
{
  uint64_t v2 = qword_1EAB97A18;
  if (!qword_1EAB97A18)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EAB97A18);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DDEC110C()
{
  uint64_t v2 = *(void *)(sub_1DDEECF38() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_1DDEC11D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1DDEECF38();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return sub_1DDEBFBF4(v3, a1);
}

uint64_t sub_1DDEC1250()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC1290()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = sub_1DDEECF38();
  unint64_t v1 = sub_1DDEC12EC();
  return sub_1DDD426B8(v5, v3, v4, v1);
}

unint64_t sub_1DDEC12EC()
{
  uint64_t v2 = qword_1EAB97A20;
  if (!qword_1EAB97A20)
  {
    sub_1DDEECF38();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEC1370()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC139C()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC13C8()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC1408()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC1448()
{
  return sub_1DDEC00EC(*(void (**)(void))(v0 + 16));
}

uint64_t (*sub_1DDEC1454())()
{
  return sub_1DDEC014C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_1DDEC1460(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DDEC1478(uint64_t *a1, id *a2)
{
}

void sub_1DDEC1490(id *a1@<X0>, id *a2@<X8>)
{
}

void sub_1DDEC14A8(id *a1, id *a2)
{
}

void sub_1DDEC14C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1DDEC14D8(uint64_t *a1, id *a2)
{
}

uint64_t sub_1DDEC14F0()
{
  return type metadata accessor for PriorityMessageListHeaderFooterIdentifier();
}

uint64_t sub_1DDEC150C()
{
  uint64_t updated = sub_1DDEECE78();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_1DDEC15EC()
{
  return type metadata accessor for PriorityMessageListViewController();
}

uint64_t sub_1DDEC1608()
{
  uint64_t updated = sub_1DDEED388();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for PriorityMessageListViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PriorityMessageListViewController.delegate.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xB0))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.delegate.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xB8))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.delegate.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xC0))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.collectionView.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0xC8))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.viewModel.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x188))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.viewModel.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x190))();
}

uint64_t dispatch thunk of PriorityMessageListViewController.viewModel.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E4FBC8C8]) + 0x198))();
}

void *type metadata accessor for PriorityMessageListViewController.Section()
{
  return &unk_1F39C9F08;
}

uint64_t sub_1DDEC19C4(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  id v2 = *(id *)a2;
  uint64_t result = a1;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  return result;
}

uint64_t sub_1DDEC1A0C(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  char v6 = *(unsigned char *)(a2 + 8);
  id v2 = *(id *)a2;
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v6;

  return a1;
}

uint64_t sub_1DDEC1A60(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t sub_1DDEC1AA0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v4 = *(void *)a1 + 253;
    }
    else
    {
      unsigned int v2 = 255 - *(unsigned __int8 *)(a1 + 8);
      if (v2 >= 0xFD) {
        unsigned int v2 = -1;
      }
      int v4 = v2;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_1DDEC1BE8(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = result;
  int v4 = (unsigned char *)(result + 9);
  if (a2 > 0xFD)
  {
    uint64_t result = 0;
    *(unsigned char *)(v3 + 8) = 0;
    *(void *)uint64_t v3 = a2 - 254;
    if (a3 >= 0xFE) {
      unsigned char *v4 = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      unsigned char *v4 = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1DDEC1D9C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1DDEC1DA4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

void *type metadata accessor for PriorityMessageListViewController.Item()
{
  return &unk_1F39C9F98;
}

void *type metadata accessor for Observation()
{
  return &unk_1F39C9FB8;
}

unint64_t sub_1DDEC1DD4()
{
  return sub_1DDE65130();
}

unint64_t sub_1DDEC1DEC()
{
  return sub_1DDEC1E04();
}

unint64_t sub_1DDEC1E04()
{
  uint64_t v2 = qword_1EAB97A58;
  if (!qword_1EAB97A58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAB97A60);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEC1E88()
{
  return sub_1DDEC1EA0();
}

unint64_t sub_1DDEC1EA0()
{
  uint64_t v2 = qword_1EAB97A68;
  if (!qword_1EAB97A68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEC1F20()
{
  return sub_1DDEC1F38();
}

unint64_t sub_1DDEC1F38()
{
  uint64_t v2 = qword_1EAB97A70;
  if (!qword_1EAB97A70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97A70);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEC1FB8()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC1FF8()
{
  return sub_1DDEC01C4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1DDEC2004()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC204C(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  void *v3 = *(void *)(v5 + 16);
  v3[1] = sub_1DDD41A00;
  return sub_1DDEC0348(a1, v6, v7, v8, v9);
}

uint64_t block_copy_helper_71(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_72()
{
  return swift_release();
}

unint64_t sub_1DDEC2194()
{
  uint64_t v2 = qword_1EBEA2210;
  if (!qword_1EBEA2210)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EBEA2210);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1DDEC21FC()
{
  uint64_t v2 = qword_1EAB97A90;
  if (!qword_1EAB97A90)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EAB97A90);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_1DDEC2264()
{
  sub_1DDEBC8B8(v0);
}

uint64_t block_copy_helper_75(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_76()
{
  return swift_release();
}

id *sub_1DDEC22D0(id *a1)
{
  return a1;
}

uint64_t sub_1DDEC2308(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) != 255) {

  }
  return a1;
}

id QLThumbnailRepresentation.platformImage.getter()
{
  id v1 = objc_msgSend(v0, sel_UIImage);
  return v1;
}

double static QuickReply.additionalWebViewPadding.getter()
{
  return 2.0;
}

ValueMetadata *type metadata accessor for QuickReply()
{
  return &type metadata for QuickReply;
}

id sub_1DDEC23C0(uint64_t a1, uint64_t a2)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1DDEC2FA4(a1, a2);
}

uint64_t RichLinkMetadataGenerator.__allocating_init(messageRepository:)(void *a1)
{
  return RichLinkMetadataGenerator.init(messageRepository:)(a1);
}

uint64_t RichLinkMetadataGenerator.init(messageRepository:)(void *a1)
{
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = sub_1DDEC24F0();
  id v2 = a1;
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = a1;

  swift_endAccess();
  return v6;
}

id sub_1DDEC24F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2218);
  unint64_t v2 = sub_1DDDF76D0();
  unint64_t v0 = sub_1DDEC2F3C();
  id v3 = sub_1DDEC23C0(v2, v0);
  objc_msgSend(v3, sel_setCountLimit_, 6);
  return v3;
}

void RichLinkMetadataGenerator.retreiveMetadata(for:messageID:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  unint64_t v31 = 0;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  unint64_t v33 = a5;
  uint64_t v34 = a6;
  uint64_t v32 = v6;
  swift_beginAccess();
  id v22 = *(id *)(v6 + 24);
  id v7 = v22;
  swift_endAccess();
  swift_bridgeObjectRetain();
  id v20 = (id)sub_1DDEEEB58();
  id v23 = objc_msgSend(v22, sel_objectForKey_);

  swift_bridgeObjectRelease();
  if (v23)
  {
    swift_retain();
    id v8 = v23;
    a5(v23);

    swift_release();
  }
  else
  {
    swift_beginAccess();
    uint64_t v15 = *(void **)(v18 + 16);
    id v9 = v15;
    swift_endAccess();
    if (v15)
    {
      unint64_t v31 = v15;
      swift_bridgeObjectRetain();
      id v14 = (id)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      id v13 = (id)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      uint64_t v11 = swift_allocObject();
      swift_retain();
      swift_weakInit();
      swift_release();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      unint64_t v10 = (void *)swift_allocObject();
      v10[2] = a5;
      v10[3] = a6;
      v10[4] = v11;
      v10[5] = a1;
      v10[6] = a2;
      uint64_t v29 = sub_1DDEC2C3C;
      uint64_t v30 = v10;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      int v25 = 1107296256;
      int v26 = 0;
      uint64_t v27 = sub_1DDEC2CC8;
      id v28 = &block_descriptor_18;
      uint64_t v12 = _Block_copy(&aBlock);
      swift_release();
      swift_release();
      objc_msgSend(v15, sel_requestRichLinkMetadataForRichLinkID_messageID_completionHandler_, v14, v13, v12);
      _Block_release(v12);
    }
    else
    {
      swift_retain();
      a5(0);
      swift_release();
    }
  }
}

uint64_t sub_1DDEC2934()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC2974(uint64_t a1, unint64_t a2, void (*a3)(id))
{
  sub_1DDEC2EF0(a1, a2);
  if ((a2 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    a3(0);
    return swift_release();
  }
  else
  {
    sub_1DDEC2F3C();
    sub_1DDEA84A0(a1, a2);
    id v8 = sub_1DDEC2C54(a1, a2);
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      swift_retain();
      sub_1DDD31CE0();
      swift_endAccess();
      swift_beginAccess();
      id v7 = *(id *)(Strong + 24);
      id v4 = v7;
      swift_endAccess();
      swift_release();
      swift_bridgeObjectRetain();
      id v6 = (id)sub_1DDEEEB58();
      objc_msgSend(v7, sel_setObject_forKey_, v8);

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1DDD31CE0();
      swift_endAccess();
    }
    swift_retain();
    id v5 = v8;
    a3(v8);

    swift_release();
    return sub_1DDE740F0(a1, a2);
  }
}

uint64_t sub_1DDEC2BEC()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEC2C3C(uint64_t a1, unint64_t a2)
{
  return sub_1DDEC2974(a1, a2, *(void (**)(id))(v2 + 16));
}

id sub_1DDEC2C54(uint64_t a1, unint64_t a2)
{
  id v3 = (id)sub_1DDEECD48();
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_metadataWithDataRepresentation_, v3);

  sub_1DDE740F0(a1, a2);
  return v6;
}

uint64_t sub_1DDEC2CC8(uint64_t a1, void *a2)
{
  id v9 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v2 = a2;
  if (a2)
  {
    uint64_t v5 = sub_1DDEECD58();
    unint64_t v6 = v3;

    uint64_t v7 = v5;
    unint64_t v8 = v6;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0xF000000000000000;
  }
  v9();
  sub_1DDEC2EA4(v7, v8);
  return swift_release();
}

uint64_t RichLinkMetadataGenerator.deinit()
{
  sub_1DDD31B20((id *)(v0 + 16));

  return v2;
}

uint64_t RichLinkMetadataGenerator.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RichLinkMetadataGenerator()
{
  return self;
}

uint64_t method lookup function for RichLinkMetadataGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RichLinkMetadataGenerator.__allocating_init(messageRepository:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1DDEC2EA4(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_1DDE740F0(result, a2);
  }
  return result;
}

uint64_t sub_1DDEC2EF0(uint64_t result, unint64_t a2)
{
  if ((a2 & 0xF000000000000000) != 0xF000000000000000) {
    return sub_1DDEA84A0(result, a2);
  }
  return result;
}

unint64_t sub_1DDEC2F3C()
{
  uint64_t v2 = qword_1EBEA1FE8;
  if (!qword_1EBEA1FE8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EBEA1FE8);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1DDEC2FA4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(v2, sel_init, a2, a1);
}

id sub_1DDEC2FDC(void *a1)
{
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_itemWithLayoutSize_, a1);

  return v3;
}

id sub_1DDEC3030(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (id)sub_1DDEEEB58();
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_boundarySupplementaryItemWithLayoutSize_elementKind_alignment_, a1, v6, a4);

  swift_bridgeObjectRelease();
  return v8;
}

double sub_1DDEC30BC()
{
  double result = 16.0;
  qword_1EBEA1E28 = 16.0;
  return result;
}

uint64_t *sub_1DDEC30CC()
{
  if (qword_1EBEA1E38 != -1) {
    swift_once();
  }
  return &qword_1EBEA1E28;
}

double static SearchCollectionViewLayoutFactory_iOS.horizontalPadding.getter()
{
  return *(double *)sub_1DDEC30CC();
}

double sub_1DDEC314C()
{
  double result = 800.0;
  qword_1EBEA3038 = 0x4089000000000000;
  return result;
}

uint64_t *sub_1DDEC3160()
{
  if (qword_1EBEA3040 != -1) {
    swift_once();
  }
  return &qword_1EBEA3038;
}

double static SearchCollectionViewLayoutFactory_iOS.screenSizeLarge.getter()
{
  return *(double *)sub_1DDEC3160();
}

double sub_1DDEC31E0()
{
  double result = 44.0;
  qword_1EBEA1E40 = 0x4046000000000000;
  return result;
}

uint64_t *sub_1DDEC31F4()
{
  if (qword_1EBEA1E48 != -1) {
    swift_once();
  }
  return &qword_1EBEA1E40;
}

double static SearchCollectionViewLayoutFactory_iOS.estimatedHeaderHeight.getter()
{
  return *(double *)sub_1DDEC31F4();
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.columnCount(forSection:usingLayoutEnvironment:)(char *a1, void *a2)
{
  char v13 = *a1;
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v11 = objc_msgSend(a2, sel_container);
  swift_unknownObjectRelease();
  swift_getObjectType();
  objc_msgSend(v11, sel_effectiveContentSize);
  double v12 = v2;
  swift_unknownObjectRelease();
  switch(v13)
  {
    case 3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      id v8 = objc_msgSend(a2, sel_traitCollection);
      swift_unknownObjectRelease();
      id v9 = objc_msgSend(v8, sel_preferredContentSizeCategory);

      if (sub_1DDEEF2E8())
      {
        if (*(double *)sub_1DDEC3160() >= v12) {
          uint64_t v5 = 2;
        }
        else {
          uint64_t v5 = 4;
        }

        uint64_t v6 = v5;
      }
      else
      {
        if (*(double *)sub_1DDEC3160() >= v12) {
          uint64_t v7 = 4;
        }
        else {
          uint64_t v7 = 6;
        }

        uint64_t v6 = v7;
      }
      break;
    case 4:
    case 8:
      uint64_t v6 = 3;
      break;
    case 5:
    case 9:
      if (*(double *)sub_1DDEC3160() >= v12) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 3;
      }
      uint64_t v6 = v4;
      break;
    default:
      uint64_t v6 = 1;
      break;
  }
  return v6;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.layout(forSection:layoutEnvironment:)(char *a1, void *a2)
{
  char v9 = 0;
  id v8 = 0;
  char v5 = *a1;
  char v9 = v5;
  id v8 = a2;
  char v7 = v5;
  uint64_t v6 = static SearchCollectionViewLayoutFactory_iOS.columnCount(forSection:usingLayoutEnvironment:)(&v7, a2);
  switch(v5)
  {
    case 1:
    case 7:
    case 10:
    case 11:
    case 12:
    case 13:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.listSectionWithHeaderLayout(_:)(a2);
      break;
    case 2:
      uint64_t v3 = static SearchCollectionViewLayoutFactory_iOS.listSectionLayout(_:showsSeparators:)(a2, 0);
      break;
    case 3:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.contactsSectionLayout(columns:)(v6);
      break;
    case 4:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.photosSectionLayout(columns:)(v6);
      break;
    case 5:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.locationsSectionLayout(columns:)(v6);
      break;
    case 6:
      uint64_t v3 = static SearchCollectionViewLayoutFactory_iOS.recentSearchesSectionLayout(_:deletion:)((uint64_t)a2, (uint64_t)sub_1DDEC4F74, 0);
      break;
    case 8:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.documentsSectionLayout(columns:)(v6);
      break;
    case 9:
      uint64_t v3 = (uint64_t)static SearchCollectionViewLayoutFactory_iOS.linksSectionLayout(columns:)(v6);
      break;
    default:
      uint64_t v3 = static SearchCollectionViewLayoutFactory_iOS.indexStatusSectionLayout(_:)((uint64_t)a2);
      break;
  }
  return v3;
}

id static SearchCollectionViewLayoutFactory_iOS.contactsSectionLayout(columns:)(uint64_t a1)
{
  sub_1DDD611DC();
  id v22 = [self (SEL)0x1F6E7B579];
  id v1 = [self (SEL)0x1F67D5498];
  id v38 = sub_1DDD612A8(v22, v1);
  sub_1DDD606BC();
  id v2 = v38;
  id v37 = sub_1DDEC2FDC(v38);
  id v23 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v3 = objc_msgSend(self, (SEL)0x1F67D5498, 76.0);
  id v36 = sub_1DDD612A8(v23, v3);
  id v35 = objc_msgSend(self, sel_horizontalGroupWithLayoutSize_subitem_count_, v36, v37, a1);
  sub_1DDD6130C();
  id v4 = v35;
  id v32 = sub_1DDD613F8(v35);
  id v5 = v32;
  id v6 = v32;
  id v7 = v32;
  id v8 = v32;
  id v9 = v32;
  objc_msgSend(v32, sel_setInterGroupSpacing_);

  uint64_t v25 = *sub_1DDEC30CC();
  [v32 (SEL)0x1F6321A18];
  objc_msgSend(v32, (SEL)0x1F639EC18, *(double *)&v25, v10, v11, v12);

  uint64_t v26 = *sub_1DDEC30CC();
  [v32 (SEL)0x1F6321A18];
  objc_msgSend(v32, (SEL)0x1F639EC18, v13, v14, *(double *)&v26, v15);

  objc_msgSend(v37, (SEL)0x1F639EC18, 8.0, 8.0, 8.0, 8.0);
  id v27 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v16 = objc_msgSend(self, (SEL)0x1F67D5498, 1.0);
  id v34 = sub_1DDD612A8(v27, v16);
  sub_1DDEC2194();
  id v17 = v34;
  uint64_t v18 = sub_1DDED6050();
  uint64_t v28 = *v18;
  uint64_t v29 = v18[1];
  swift_bridgeObjectRetain();
  id v33 = sub_1DDEC3030(v34, v28, v29, 5);
  sub_1DDEEF9A8();
  uint64_t v30 = v19;
  id v20 = v33;
  void *v30 = v33;
  sub_1DDD4242C();
  id v31 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setBoundarySupplementaryItems_, v31);

  return v32;
}

id static SearchCollectionViewLayoutFactory_iOS.documentsSectionLayout(columns:)(uint64_t a1)
{
  sub_1DDD611DC();
  id v18 = [self (SEL)0x1F6E7B579];
  id v1 = [self (SEL)0x1F67D5498];
  id v39 = sub_1DDD612A8(v18, v1);
  sub_1DDD606BC();
  id v2 = v39;
  id v38 = sub_1DDEC2FDC(v39);
  objc_msgSend(v38, (SEL)0x1F639EC18, 8.0, 8.0, 8.0, 8.0);
  id v19 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v3 = objc_msgSend(self, (SEL)0x1F67D5498, 150.0);
  id v37 = sub_1DDD612A8(v19, v3);
  id v36 = objc_msgSend(self, sel_horizontalGroupWithLayoutSize_subitem_count_, v37, v38, a1);
  sub_1DDD6130C();
  id v4 = v36;
  id v30 = sub_1DDD613F8(v36);
  id v5 = v30;
  id v6 = v30;
  id v7 = v30;
  uint64_t v35 = *sub_1DDEC30CC();
  objc_msgSend(v30, (SEL)0x1F639EC18, 8.0, *(double *)&v35, 8.0, *(double *)sub_1DDEC30CC());

  id v22 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v21 = self;
  id v8 = objc_msgSend(v21, (SEL)0x1F67D5498, *(double *)sub_1DDEC31F4());
  id v34 = sub_1DDD612A8(v22, v8);
  sub_1DDEC2194();
  id v9 = v34;
  double v10 = sub_1DDEDF5B8();
  uint64_t v23 = *v10;
  uint64_t v24 = v10[1];
  swift_bridgeObjectRetain();
  id v33 = sub_1DDEC3030(v34, v23, v24, 1);
  id v25 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v11 = objc_msgSend(self, (SEL)0x1F67D5498, 1.0);
  id v32 = sub_1DDD612A8(v25, v11);
  id v12 = v32;
  double v13 = sub_1DDED6050();
  uint64_t v26 = *v13;
  uint64_t v27 = v13[1];
  swift_bridgeObjectRetain();
  id v31 = sub_1DDEC3030(v32, v26, v27, 5);
  sub_1DDEEF9A8();
  uint64_t v28 = v14;
  id v15 = v33;
  void *v28 = v33;
  id v16 = v31;
  v28[1] = v31;
  sub_1DDD4242C();
  id v29 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setBoundarySupplementaryItems_, v29);

  return v30;
}

id static SearchCollectionViewLayoutFactory_iOS.linksSectionLayout(columns:)(uint64_t a1)
{
  v34[1] = a1;
  sub_1DDD611DC();
  id v11 = self;
  v34[0] = a1;
  unint64_t v14 = sub_1DDD424EC();
  uint64_t v13 = MEMORY[0x1E4FBB550];
  id v12 = objc_msgSend(v11, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v34, MEMORY[0x1E4FBB550], v14));
  id v1 = objc_msgSend(self, sel_fractionalHeightDimension_, 1.0);
  id v26 = sub_1DDD612A8(v12, v1);
  v33[6] = v26;
  sub_1DDD606BC();
  id v2 = v26;
  id v25 = sub_1DDEC2FDC(v26);
  v33[5] = v25;
  v33[1] = 2.0;
  v33[2] = 2.0;
  v33[3] = 2.0;
  v33[4] = 2.0;
  objc_msgSend(v25, (SEL)0x1F639EC18, 2.0, 2.0, 2.0, 2.0);
  id v16 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v15 = self;
  v33[0] = a1;
  id v3 = objc_msgSend(v15, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v33, v13, v14));
  id v32 = sub_1DDD612A8(v16, v3);
  id v31 = objc_msgSend(self, sel_horizontalGroupWithLayoutSize_subitem_count_, v32, v25, a1);
  id v18 = objc_msgSend(self, sel_fixedSpacing_, 2.0);
  objc_msgSend(v31, sel_setInterItemSpacing_);

  sub_1DDD6130C();
  id v4 = v31;
  id v30 = sub_1DDD613F8(v31);
  uint64_t v29 = *sub_1DDEC30CC();
  objc_msgSend(v30, (SEL)0x1F639EC18, 2.0, *(double *)&v29, 2.0, *(double *)sub_1DDEC30CC());
  objc_msgSend(v30, sel_setInterGroupSpacing_, 2.0);
  id v20 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v19 = self;
  id v5 = objc_msgSend(v19, sel_estimatedDimension_, *(double *)sub_1DDEC31F4());
  id v28 = sub_1DDD612A8(v20, v5);
  sub_1DDEC2194();
  id v6 = v28;
  id v7 = sub_1DDEDF5B8();
  uint64_t v21 = *v7;
  uint64_t v22 = v7[1];
  swift_bridgeObjectRetain();
  id v27 = sub_1DDEC3030(v28, v21, v22, 1);
  sub_1DDEEF9A8();
  uint64_t v23 = v8;
  id v9 = v27;
  *uint64_t v23 = v27;
  sub_1DDD4242C();
  id v24 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setBoundarySupplementaryItems_, v24);

  return v30;
}

id static SearchCollectionViewLayoutFactory_iOS.locationsSectionLayout(columns:)(uint64_t a1)
{
  v43[1] = a1;
  sub_1DDD611DC();
  id v15 = self;
  v43[0] = a1;
  unint64_t v18 = sub_1DDD424EC();
  uint64_t v17 = MEMORY[0x1E4FBB550];
  id v16 = objc_msgSend(v15, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v43, MEMORY[0x1E4FBB550], v18));
  id v1 = objc_msgSend(self, sel_fractionalHeightDimension_, 1.0);
  id v33 = sub_1DDD612A8(v16, v1);
  v42[6] = v33;
  sub_1DDD606BC();
  id v2 = v33;
  id v32 = sub_1DDEC2FDC(v33);
  v42[5] = v32;
  v42[1] = 2.0;
  v42[2] = 2.0;
  v42[3] = 2.0;
  v42[4] = 2.0;
  objc_msgSend(v32, (SEL)0x1F639EC18, 2.0, 2.0, 2.0, 2.0);
  id v20 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v19 = self;
  v42[0] = a1;
  id v3 = objc_msgSend(v19, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v42, v17, v18));
  id v41 = sub_1DDD612A8(v20, v3);
  id v40 = objc_msgSend(self, sel_horizontalGroupWithLayoutSize_subitem_count_, v41, v32, a1);
  id v22 = objc_msgSend(self, sel_fixedSpacing_, 2.0);
  objc_msgSend(v40, sel_setInterItemSpacing_);

  sub_1DDD6130C();
  id v4 = v40;
  id v39 = sub_1DDD613F8(v40);
  uint64_t v38 = *sub_1DDEC30CC();
  objc_msgSend(v39, (SEL)0x1F639EC18, 2.0, *(double *)&v38, 2.0, *(double *)sub_1DDEC30CC());
  objc_msgSend(v39, sel_setInterGroupSpacing_, 2.0);
  id v24 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v23 = self;
  id v5 = objc_msgSend(v23, (SEL)0x1F67D5498, *(double *)sub_1DDEC31F4());
  id v37 = sub_1DDD612A8(v24, v5);
  sub_1DDEC2194();
  id v6 = v37;
  id v7 = sub_1DDEDF5B8();
  uint64_t v25 = *v7;
  uint64_t v26 = v7[1];
  swift_bridgeObjectRetain();
  id v36 = sub_1DDEC3030(v37, v25, v26, 1);
  id v27 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v8 = objc_msgSend(self, (SEL)0x1F67D5498, 1.0);
  id v35 = sub_1DDD612A8(v27, v8);
  id v9 = v35;
  double v10 = sub_1DDED6050();
  uint64_t v28 = *v10;
  uint64_t v29 = v10[1];
  swift_bridgeObjectRetain();
  id v34 = sub_1DDEC3030(v35, v28, v29, 5);
  sub_1DDEEF9A8();
  id v30 = v11;
  id v12 = v36;
  void *v30 = v36;
  id v13 = v34;
  v30[1] = v34;
  sub_1DDD4242C();
  id v31 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_setBoundarySupplementaryItems_, v31);

  return v39;
}

id static SearchCollectionViewLayoutFactory_iOS.photosSectionLayout(columns:)(uint64_t a1)
{
  v48[1] = a1;
  sub_1DDD611DC();
  id v19 = self;
  v48[0] = a1;
  unint64_t v22 = sub_1DDD424EC();
  uint64_t v21 = MEMORY[0x1E4FBB550];
  id v20 = objc_msgSend(v19, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v48, MEMORY[0x1E4FBB550], v22));
  id v1 = objc_msgSend(self, sel_fractionalHeightDimension_, 1.0);
  id v38 = sub_1DDD612A8(v20, v1);
  v47[2] = v38;
  sub_1DDD606BC();
  id v2 = v38;
  id v37 = sub_1DDEC2FDC(v38);
  v47[1] = v37;
  id v24 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v23 = self;
  v47[0] = a1;
  id v3 = objc_msgSend(v23, (SEL)0x1F6E7B579, 1.0 / sub_1DDD49AA0((uint64_t)v47, v21, v22));
  id v46 = sub_1DDD612A8(v24, v3);
  id v45 = objc_msgSend(self, sel_horizontalGroupWithLayoutSize_subitem_count_, v46, v37, a1);
  id v26 = objc_msgSend(self, sel_fixedSpacing_);
  objc_msgSend(v45, sel_setInterItemSpacing_);

  sub_1DDD6130C();
  id v4 = v45;
  id v39 = sub_1DDD613F8(v45);
  id v5 = v39;
  id v6 = v39;
  id v7 = v39;
  id v8 = v39;
  uint64_t v44 = *sub_1DDEC30CC();
  objc_msgSend(v39, sel_setContentInsets_, 2.0, *(double *)&v44, 2.0, *(double *)sub_1DDEC30CC());

  objc_msgSend(v39, sel_setInterGroupSpacing_, 2.0);
  id v28 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v27 = self;
  id v9 = objc_msgSend(v27, (SEL)0x1F67D5498, *(double *)sub_1DDEC31F4());
  id v43 = sub_1DDD612A8(v28, v9);
  sub_1DDEC2194();
  id v10 = v43;
  id v11 = sub_1DDEDF5B8();
  uint64_t v29 = *v11;
  uint64_t v30 = v11[1];
  swift_bridgeObjectRetain();
  id v42 = sub_1DDEC3030(v43, v29, v30, 1);
  id v32 = objc_msgSend(self, (SEL)0x1F6E7B579, 1.0);
  id v31 = self;
  id v12 = objc_msgSend(v31, (SEL)0x1F67D5498, *(double *)sub_1DDEC31F4());
  id v41 = sub_1DDD612A8(v32, v12);
  id v13 = v41;
  unint64_t v14 = sub_1DDED6050();
  uint64_t v33 = *v14;
  uint64_t v34 = v14[1];
  swift_bridgeObjectRetain();
  id v40 = sub_1DDEC3030(v41, v33, v34, 5);
  sub_1DDEEF9A8();
  id v35 = v15;
  id v16 = v42;
  *id v35 = v42;
  id v17 = v40;
  v35[1] = v40;
  sub_1DDD4242C();
  id v36 = (void *)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_setBoundarySupplementaryItems_, v36);

  return v39;
}

uint64_t sub_1DDEC4F74()
{
  return 0;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.recentSearchesSectionLayout(_:deletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v20 = 0;
  unint64_t v18 = sub_1DDEC5D00;
  id v19 = sub_1DDEC60A4;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v30 = 0;
  uint64_t v11 = sub_1DDEED818();
  uint64_t v14 = *(void *)(v11 - 8);
  v10[1] = v11 - 8;
  v10[0] = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  id v15 = (char *)v10 - v10[0];
  uint64_t v26 = sub_1DDEED878();
  uint64_t v22 = *(void *)(v26 - 8);
  uint64_t v23 = v26 - 8;
  uint64_t v13 = *(void *)(v22 + 64);
  unint64_t v12 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v15);
  id v24 = (char *)v10 - v12;
  double v4 = MEMORY[0x1F4188790](v3);
  uint64_t v25 = (char *)v10 - v5;
  uint64_t v34 = (char *)v10 - v5;
  uint64_t v33 = v21;
  uint64_t v31 = v6;
  uint64_t v32 = v17;
  (*(void (**)(double))(v14 + 104))(v4);
  sub_1DDEED828();
  swift_retain();
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v17;
  *(void *)(v7 + 16) = v16;
  *(void *)(v7 + 24) = v8;
  sub_1DDEED808();
  sub_1DDEED868();
  sub_1DDD6130C();
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v24, v25, v26);
  uint64_t v29 = sub_1DDEEF308();
  id v28 = *(void (**)(char *, uint64_t))(v22 + 8);
  uint64_t v27 = v22 + 8;
  v28(v24, v26);
  uint64_t v30 = v29;
  v28(v25, v26);
  return v29;
}

void *static SearchCollectionViewLayoutFactory_iOS.listSectionWithHeaderLayout(_:)(void *a1)
{
  char has_malloc_size = _swift_stdlib_has_malloc_size();
  uint64_t v17 = (void *)static SearchCollectionViewLayoutFactory_iOS.listSectionLayout(_:showsSeparators:)(a1, has_malloc_size & 1);
  sub_1DDD611DC();
  id v10 = objc_msgSend(self, sel_fractionalWidthDimension_, 1.0);
  id v9 = self;
  id v2 = objc_msgSend(v9, sel_estimatedDimension_, *(double *)sub_1DDEC31F4());
  id v16 = sub_1DDD612A8(v10, v2);
  sub_1DDEC2194();
  id v3 = v16;
  double v4 = sub_1DDEE24A0();
  uint64_t v11 = *v4;
  uint64_t v12 = v4[1];
  swift_bridgeObjectRetain();
  id v15 = sub_1DDEC3030(v16, v11, v12, 1);
  sub_1DDEEF9A8();
  uint64_t v13 = v5;
  id v6 = v15;
  void *v13 = v15;
  sub_1DDD4242C();
  uint64_t v14 = (void *)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setBoundarySupplementaryItems_, v14);

  return v17;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.listSectionLayout(_:showsSeparators:)(void *a1, int a2)
{
  id v24 = a1;
  int v16 = a2;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  char v28 = 0;
  uint64_t v27 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = sub_1DDEED818();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v11 - 8;
  unint64_t v14 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  id v15 = (char *)&v7 - v14;
  uint64_t v17 = sub_1DDEED878();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = v17 - 8;
  unint64_t v20 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v24);
  uint64_t v21 = (char *)&v7 - v20;
  unint64_t v22 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3);
  uint64_t v23 = (char *)&v7 - v22;
  uint64_t v30 = (char *)&v7 - v22;
  uint64_t v29 = v4;
  char v28 = v5 & 1;
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v25 = objc_msgSend(v24, sel_traitCollection);
  swift_unknownObjectRelease();
  unsigned int v26 = objc_msgSend(v25, sel_mf_useSplitViewStyling);

  if (v26) {
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, *MEMORY[0x1E4FB10C8], v11);
  }
  else {
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, *MEMORY[0x1E4FB10D0], v11);
  }
  sub_1DDEED828();
  sub_1DDEED858();
  sub_1DDD6130C();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v17);
  uint64_t v9 = sub_1DDEEF308();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v7 = v18 + 8;
  v8(v21, v17);
  uint64_t v27 = v9;
  v8(v23, v17);
  return v9;
}

uint64_t static SearchCollectionViewLayoutFactory_iOS.indexStatusSectionLayout(_:)(uint64_t a1)
{
  uint64_t v14 = a1;
  id v25 = 0;
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  uint64_t v13 = 0;
  uint64_t v7 = sub_1DDEED818();
  uint64_t v11 = *(void *)(v7 - 8);
  uint64_t v6 = v7 - 8;
  unint64_t v5 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v12 = (char *)&v4 - v5;
  uint64_t v19 = sub_1DDEED878();
  uint64_t v15 = *(void *)(v19 - 8);
  uint64_t v16 = v19 - 8;
  uint64_t v9 = *(void *)(v15 + 64);
  unint64_t v8 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v4 - v8;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x1F4188790](v1);
  uint64_t v18 = (char *)&v4 - v10;
  id v25 = (char *)&v4 - v10;
  uint64_t v24 = v14;
  (*(void (**)(double))(v11 + 104))(v2);
  sub_1DDEED828();
  sub_1DDEED858();
  sub_1DDD6130C();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v17, v18, v19);
  uint64_t v22 = sub_1DDEEF308();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v20 = v15 + 8;
  v21(v17, v19);
  uint64_t v23 = v22;
  v21(v18, v19);
  return v22;
}

id sub_1DDEC598C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a1;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v42 = 0;
  id v40 = sub_1DDEC63E8;
  uint64_t v52 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  id v49 = 0;
  uint64_t v37 = sub_1DDEECF38();
  uint64_t v33 = *(void *)(v37 - 8);
  uint64_t v34 = v37 - 8;
  uint64_t v29 = v33;
  uint64_t v30 = *(void *)(v33 + 64);
  unint64_t v20 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  id v36 = (char *)&v19 - v20;
  uint64_t v52 = v3;
  uint64_t v50 = v4;
  uint64_t v51 = v5;
  unint64_t v45 = sub_1DDEC6298();
  int v21 = 1;
  uint64_t v23 = sub_1DDEEEC08();
  uint64_t v27 = v6;
  uint64_t v22 = sub_1DDEEEC08();
  uint64_t v26 = v7;
  id v25 = sub_1DDED3B94();
  sub_1DDD3D11C();
  uint64_t v24 = v8;
  uint64_t v38 = sub_1DDEECB98();
  uint64_t v39 = v9;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_retain();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v36, v28, v37);
  unint64_t v35 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v32;
  uint64_t v12 = v33;
  unint64_t v13 = v35;
  uint64_t v14 = v36;
  uint64_t v15 = v37;
  uint64_t v41 = v10;
  *(void *)(v10 + 16) = v31;
  *(void *)(v10 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v10 + v13, v14, v15);
  uint64_t v43 = 1;
  id v47 = sub_1DDEC5DD0(1, v38, v39, (uint64_t)v40, v41);
  id v49 = v47;
  sub_1DDEC6484();
  uint64_t v46 = sub_1DDEEF9A8();
  uint64_t v44 = v16;
  id v17 = v47;
  *uint64_t v44 = v47;
  sub_1DDD4242C();
  id v48 = sub_1DDEC6028();

  return v48;
}

uint64_t sub_1DDEC5CC0()
{
  return swift_deallocObject();
}

id sub_1DDEC5D00(uint64_t a1)
{
  return sub_1DDEC598C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1DDEC5D0C(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7)
{
  swift_retain();
  swift_retain();
  char v7 = a5(a7);
  a3(v7 & 1);
  swift_release();
  return swift_release();
}

id sub_1DDEC5DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v8 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  int v14 = 1107296256;
  int v15 = 0;
  uint64_t v16 = sub_1DDEC5F1C;
  id v17 = &block_descriptor_19;
  uint64_t v6 = _Block_copy(&aBlock);
  id v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_contextualActionWithStyle_title_handler_, a1, v9, v6);
  _Block_release(v6);
  swift_release();

  return v7;
}

uint64_t sub_1DDEC5F1C(uint64_t a1, void *a2, void *a3, const void *a4)
{
  uint64_t v9 = *(void (**)(void *, void *, uint64_t (*)(char)))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = a3;
  uint64_t v8 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v8;
  v9(a2, a3, sub_1DDEC652C);
  swift_release();

  return swift_release();
}

uint64_t sub_1DDEC5FFC(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, a1 & 1);
}

id sub_1DDEC6028()
{
  sub_1DDEC6298();
  id v1 = (id)sub_1DDEEED98();
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_configurationWithActions_, v1);

  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1DDEC60A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v7[0] = a3;
  uint64_t v13 = a2;
  int v21 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
  v7[1] = 0;
  uint64_t v8 = sub_1DDEED738();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v8 - 8;
  unint64_t v11 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v12 = (char *)v7 - v11;
  uint64_t v14 = sub_1DDEED748();
  uint64_t v17 = *(void *)(v14 - 8);
  uint64_t v15 = v14 - 8;
  unint64_t v16 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v4 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)v7 - v16;
  int v21 = (char *)v7 - v16;
  uint64_t v20 = a1;
  uint64_t v19 = v5;
  (*(void (**)(double))(v17 + 16))(v4);
  if (!sub_1DDEECEF8())
  {
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x1E4FB1000], v8);
    sub_1DDEED728();
  }
  return (*(uint64_t (**)(void, char *, uint64_t))(v17 + 32))(v7[0], v18, v14);
}

ValueMetadata *type metadata accessor for SearchCollectionViewLayoutFactory_iOS()
{
  return &type metadata for SearchCollectionViewLayoutFactory_iOS;
}

unint64_t sub_1DDEC6298()
{
  uint64_t v2 = qword_1EAB97AA0;
  if (!qword_1EAB97AA0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EAB97AA0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DDEC6300()
{
  uint64_t v4 = sub_1DDEECF38();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t sub_1DDEC63E8(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v5 = sub_1DDEECF38();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v4 + 16);
  uint64_t v7 = *(void *)(v4 + 24);
  uint64_t v8 = v4
     + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80));
  return sub_1DDEC5D0C(a1, a2, a3, a4, v6, v7, v8);
}

unint64_t sub_1DDEC6484()
{
  uint64_t v2 = qword_1EAB97AA8;
  if (!qword_1EAB97AA8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EAB97AA8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DDEC64EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DDEC652C(char a1)
{
  return sub_1DDEC5FFC(a1 & 1, *(void *)(v1 + 16));
}

uint64_t SearchItem.section.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = type metadata accessor for SearchItem.LegacySuggested();
  unint64_t v20 = (*(void *)(*(void *)(v19 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  int v21 = &v15[-v20];
  uint64_t v28 = &v15[-v20];
  uint64_t v24 = type metadata accessor for SearchItem();
  unint64_t v23 = (*(void *)(*(void *)(v24 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (void *)MEMORY[0x1F4188790](v22);
  id v25 = &v15[-v23];
  uint64_t v27 = v1;
  sub_1DDDC9C48(v1, &v15[-v23]);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 1:
      uint64_t v4 = v25;
      *uint64_t v17 = 3;
      uint64_t result = sub_1DDD86844((uint64_t)v4);
      break;
    case 2:
      uint64_t v7 = v25;
      *uint64_t v17 = 4;
      uint64_t result = sub_1DDEAA270((uint64_t)v7);
      break;
    case 3:
      uint64_t v6 = v25;
      *uint64_t v17 = 5;
      uint64_t result = sub_1DDDF2824((uint64_t)v6);
      break;
    case 4:
      uint64_t v5 = v25;
      *uint64_t v17 = 8;
      uint64_t result = sub_1DDD8DEB0((uint64_t)v5);
      break;
    case 5:
      sub_1DDEC68A8((uint64_t)v25, (uint64_t)v21);
      uint64_t v28 = v21;
      int v16 = v21[*(int *)(v19 + 36)];
      if (v16)
      {
        uint64_t v14 = v21;
        if (v16 == 1) {
          *uint64_t v17 = 12;
        }
        else {
          *uint64_t v17 = 13;
        }
        uint64_t result = sub_1DDDED178((uint64_t)v14);
      }
      else
      {
        uint64_t v13 = v21;
        *uint64_t v17 = 11;
        uint64_t result = sub_1DDDED178((uint64_t)v13);
      }
      break;
    case 6:
      uint64_t v8 = v25;
      *uint64_t v17 = 7;
      uint64_t result = sub_1DDDC1AB4((uint64_t)v8);
      break;
    case 7:
      uint64_t v9 = v25;
      *uint64_t v17 = 6;
      uint64_t result = sub_1DDDC1AB4((uint64_t)v9);
      break;
    case 8:
      uint64_t v10 = v25;
      *uint64_t v17 = 1;
      uint64_t result = sub_1DDEC697C((uint64_t)v10);
      break;
    case 9:
      unint64_t v11 = v25;
      *uint64_t v17 = 2;
      uint64_t result = sub_1DDDE3A34((uint64_t)v11);
      break;
    case 10:
      uint64_t v12 = v25;
      *uint64_t v17 = 9;
      uint64_t result = sub_1DDDEFB94((uint64_t)v12);
      break;
    default:
      uint64_t v2 = v25;
      *uint64_t v17 = 10;
      uint64_t result = sub_1DDDC1AB4((uint64_t)v2);
      break;
  }
  return result;
}

uint64_t type metadata accessor for SearchItem()
{
  uint64_t v1 = qword_1EBEA1AB8;
  if (!qword_1EBEA1AB8) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

__n128 sub_1DDEC68A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  unint64_t v3 = (int *)type metadata accessor for SearchItem.LegacySuggested();
  *(void *)(a2 + v3[5]) = *(void *)(a1 + v3[5]);
  *(_OWORD *)(a2 + v3[6]) = *(_OWORD *)(a1 + v3[6]);
  __n128 result = *(__n128 *)(a1 + v3[7]);
  *(__n128 *)(a2 + v3[7]) = result;
  *(void *)(a2 + v3[8]) = *(void *)(a1 + v3[8]);
  *(unsigned char *)(a2 + v3[9]) = *(unsigned char *)(a1 + v3[9]);
  return result;
}

uint64_t sub_1DDEC697C(uint64_t a1)
{
  uint64_t v1 = sub_1DDEECE78();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t SearchItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v50 = 0;
  unint64_t v59 = 0;
  uint64_t v58 = 0;
  uint64_t v57 = 0;
  uint64_t v49 = 0;
  uint64_t v48 = 0;
  id v56 = 0;
  double v55 = 0;
  id v54 = 0;
  id v53 = 0;
  uint64_t v52 = 0;
  uint64_t v51 = 0;
  uint64_t v39 = 0;
  uint64_t v21 = type metadata accessor for SearchItem.Link();
  unint64_t v22 = (*(void *)(*(void *)(v21 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  unint64_t v23 = (char *)&v14 - v22;
  unint64_t v59 = (char *)&v14 - v22;
  unint64_t v24 = (*(void *)(*(void *)(type metadata accessor for SearchItem.InstantAnswer() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  id v25 = (char *)&v14 - v24;
  uint64_t v58 = (char *)&v14 - v24;
  unint64_t v26 = (*(void *)(*(void *)(type metadata accessor for SearchItem.TopHit() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v27 = (char *)&v14 - v26;
  uint64_t v57 = (char *)&v14 - v26;
  unint64_t v28 = (*(void *)(*(void *)(type metadata accessor for SearchItem.LegacySuggested() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v29 = (char *)&v14 - v28;
  id v56 = (char *)&v14 - v28;
  unint64_t v30 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Document() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v31 = (char *)&v14 - v30;
  double v55 = (char *)&v14 - v30;
  unint64_t v32 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v33 = (char *)&v14 - v32;
  id v54 = (char *)&v14 - v32;
  unint64_t v34 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Photo() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  unint64_t v35 = (char *)&v14 - v34;
  id v53 = (char *)&v14 - v34;
  uint64_t v36 = type metadata accessor for SearchItem.Contact();
  unint64_t v37 = (*(void *)(*(void *)(v36 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v38 = (char *)&v14 - v37;
  uint64_t v52 = (char *)&v14 - v37;
  uint64_t v40 = type metadata accessor for SearchItem.Generic();
  unint64_t v41 = (*(void *)(*(void *)(v40 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v39);
  uint64_t v42 = (char *)&v14 - v41;
  uint64_t v51 = (char *)&v14 - v41;
  uint64_t v45 = type metadata accessor for SearchItem();
  unint64_t v44 = (*(void *)(*(void *)(v45 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (void *)MEMORY[0x1F4188790](v43);
  uint64_t v46 = (char *)&v14 - v44;
  uint64_t v50 = v1;
  sub_1DDDC9C48(v1, (uint64_t *)((char *)&v14 - v44));
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_1DDD86BAC((uint64_t)v46, (uint64_t)v38);
      uint64_t v52 = v38;
      uint64_t v18 = &v38[*(int *)(v36 + 24)];
      uint64_t v4 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v4 - 8) + 16))(v20, v18);
      uint64_t result = sub_1DDD86844((uint64_t)v38);
      break;
    case 2:
      sub_1DDEC7D08((uint64_t)v46, (uint64_t)v35);
      id v53 = v35;
      uint64_t v5 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v5 - 8) + 16))(v20, v35);
      uint64_t result = sub_1DDEAA270((uint64_t)v35);
      break;
    case 3:
      sub_1DDDF2DD0((uint64_t)v46, (uint64_t)v33);
      id v54 = v33;
      uint64_t v6 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v6 - 8) + 16))(v20, v33);
      uint64_t result = sub_1DDDF2824((uint64_t)v33);
      break;
    case 4:
      sub_1DDD8E5D4((uint64_t)v46, (uint64_t)v31);
      double v55 = v31;
      uint64_t v7 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v7 - 8) + 16))(v20, v31);
      uint64_t result = sub_1DDD8DEB0((uint64_t)v31);
      break;
    case 5:
      sub_1DDEC68A8((uint64_t)v46, (uint64_t)v29);
      id v56 = v29;
      uint64_t v8 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v8 - 8) + 16))(v20, v29);
      uint64_t result = sub_1DDDED178((uint64_t)v29);
      break;
    case 6:
      uint64_t v48 = (uint64_t)v42;
      sub_1DDDC1E38((uint64_t)v46, (uint64_t)v42);
      uint64_t v48 = (uint64_t)v42;
      uint64_t v17 = &v42[*(int *)(v40 + 24)];
      uint64_t v9 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v9 - 8) + 16))(v20, v17);
      uint64_t result = sub_1DDDC1AB4((uint64_t)v42);
      break;
    case 7:
      uint64_t v49 = (uint64_t)v42;
      sub_1DDDC1E38((uint64_t)v46, (uint64_t)v42);
      uint64_t v49 = (uint64_t)v42;
      int v16 = &v42[*(int *)(v40 + 24)];
      uint64_t v10 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v10 - 8) + 16))(v20, v16);
      uint64_t result = sub_1DDDC1AB4((uint64_t)v42);
      break;
    case 8:
      sub_1DDEC7C70((uint64_t)v46, (uint64_t)v27);
      uint64_t v57 = v27;
      uint64_t v11 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v11 - 8) + 16))(v20, v27);
      uint64_t result = sub_1DDEC697C((uint64_t)v27);
      break;
    case 9:
      sub_1DDEC73E0((uint64_t)v46, (uint64_t)v25);
      uint64_t v58 = v25;
      uint64_t v12 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v12 - 8) + 16))(v20, v25);
      uint64_t result = sub_1DDDE3A34((uint64_t)v25);
      break;
    case 10:
      sub_1DDDF0130(v46, v23);
      unint64_t v59 = v23;
      uint64_t v15 = &v23[*(int *)(v21 + 20)];
      uint64_t v13 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v13 - 8) + 16))(v20, v15);
      uint64_t result = sub_1DDDEFB94((uint64_t)v23);
      break;
    default:
      sub_1DDDC1E38((uint64_t)v46, (uint64_t)v42);
      uint64_t v51 = v42;
      uint64_t v19 = &v42[*(int *)(v40 + 24)];
      uint64_t v2 = sub_1DDEECE78();
      (*(void (**)(uint64_t, char *))(*(void *)(v2 - 8) + 16))(v20, v19);
      uint64_t result = sub_1DDDC1AB4((uint64_t)v42);
      break;
  }
  return result;
}

__n128 sub_1DDEC73E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  unint64_t v28 = (int *)type metadata accessor for SearchItem.InstantAnswer();
  *(void *)(a2 + v28[5]) = *(void *)(a1 + v28[5]);
  *(_OWORD *)(a2 + v28[6]) = *(_OWORD *)(a1 + v28[6]);
  *(_OWORD *)(a2 + v28[7]) = *(_OWORD *)(a1 + v28[7]);
  *(_OWORD *)(a2 + v28[8]) = *(_OWORD *)(a1 + v28[8]);
  uint64_t v23 = v28[9];
  uint64_t v25 = sub_1DDEECB08();
  uint64_t v24 = *(void *)(v25 - 8);
  unint64_t v26 = *(void (**)(uint64_t, uint64_t))(v24 + 32);
  v26(a2 + v23, a1 + v23);
  ((void (*)(uint64_t, uint64_t, uint64_t))v26)(a2 + v28[10], a1 + v28[10], v25);
  *(_OWORD *)(a2 + v28[11]) = *(_OWORD *)(a1 + v28[11]);
  uint64_t v29 = v28[12];
  uint64_t v31 = sub_1DDEECD28();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(unsigned int (**)(void))(v32 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v33)(a1 + v29, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
    memcpy((void *)(a2 + v29), (const void *)(a1 + v29), *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v32 + 32))();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(a2 + v29, 0, 1, v31);
  }
  __dst = (void *)(a2 + v28[13]);
  __src = (void *)(a1 + v28[13]);
  uint64_t v20 = sub_1DDEECEB8();
  uint64_t v21 = *(void *)(v20 - 8);
  unint64_t v22 = *(unsigned int (**)(void))(v21 + 48);
  if (((unsigned int (*)(void *, uint64_t))v22)(__src, 1))
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
    memcpy(__dst, __src, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(__dst, __src, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  int v16 = (void *)(a2 + v28[14]);
  uint64_t v17 = (void *)(a1 + v28[14]);
  if (v22())
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
    memcpy(v16, v17, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v16, v17, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v16, 0, 1, v20);
  }
  uint64_t v14 = (void *)(a2 + v28[15]);
  uint64_t v15 = (void *)(a1 + v28[15]);
  if (v33())
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
    memcpy(v14, v15, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v32 + 32))(v14, v15, v31);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v14, 0, 1, v31);
  }
  *(_OWORD *)(a2 + v28[16]) = *(_OWORD *)(a1 + v28[16]);
  *(_OWORD *)(a2 + v28[17]) = *(_OWORD *)(a1 + v28[17]);
  *(_OWORD *)(a2 + v28[18]) = *(_OWORD *)(a1 + v28[18]);
  *(_OWORD *)(a2 + v28[19]) = *(_OWORD *)(a1 + v28[19]);
  ((void (*)(uint64_t, uint64_t, uint64_t))v26)(a2 + v28[20], a1 + v28[20], v25);
  uint64_t v12 = (void *)(a2 + v28[21]);
  uint64_t v13 = (void *)(a1 + v28[21]);
  if ((*(unsigned int (**)(void))(v24 + 48))())
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
    memcpy(v12, v13, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    ((void (*)(void *, void *, uint64_t))v26)(v12, v13, v25);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v12, 0, 1, v25);
  }
  uint64_t v10 = (void *)(a2 + v28[22]);
  uint64_t v11 = (void *)(a1 + v28[22]);
  if (v22())
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
    memcpy(v10, v11, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v10, v11, v20);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v10, 0, 1, v20);
  }
  *(_OWORD *)(a2 + v28[23]) = *(_OWORD *)(a1 + v28[23]);
  *(_OWORD *)(a2 + v28[24]) = *(_OWORD *)(a1 + v28[24]);
  *(_OWORD *)(a2 + v28[25]) = *(_OWORD *)(a1 + v28[25]);
  __n128 result = *(__n128 *)(a1 + v28[26]);
  *(__n128 *)(a2 + v28[26]) = result;
  return result;
}

uint64_t sub_1DDEC7C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = type metadata accessor for SearchItem.TopHit();
  uint64_t result = a2;
  *(void *)(a2 + *(int *)(v3 + 20)) = *(void *)(a1 + *(int *)(v3 + 20));
  *(void *)(a2 + *(int *)(v3 + 24)) = *(void *)(a1 + *(int *)(v3 + 24));
  return result;
}

__n128 sub_1DDEC7D08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = (int *)type metadata accessor for SearchItem.Photo();
  *(_OWORD *)(a2 + v3[5]) = *(_OWORD *)(a1 + v3[5]);
  __n128 result = *(__n128 *)(a1 + v3[6]);
  *(__n128 *)(a2 + v3[6]) = result;
  *(void *)(a2 + v3[7]) = *(void *)(a1 + v3[7]);
  *(void *)(a2 + v3[8]) = *(void *)(a1 + v3[8]);
  return result;
}

uint64_t SearchItem.hash(into:)(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v9 = sub_1DDEECE78();
  uint64_t v6 = *(void *)(v9 - 8);
  uint64_t v7 = v9 - 8;
  unint64_t v4 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v4 - v4;
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  SearchItem.id.getter((uint64_t)&v4 - v4);
  sub_1DDEECE58();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v9);
}

uint64_t static SearchItem.== infix(_:_:)(uint64_t a1, void *a2)
{
  uint64_t v87 = a1;
  uint32_t v113 = a2;
  double v123 = 0;
  uint64_t v122 = 0;
  uint64_t v85 = 0;
  unint64_t v41 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Link() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v42 = &v39[-v41];
  unint64_t v43 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3);
  unint64_t v44 = &v39[-v43];
  unint64_t v45 = (*(void *)(*(void *)(type metadata accessor for SearchItem.InstantAnswer() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  uint64_t v46 = &v39[-v45];
  unint64_t v47 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v48 = &v39[-v47];
  unint64_t v49 = (*(void *)(*(void *)(type metadata accessor for SearchItem.TopHit() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  uint64_t v50 = &v39[-v49];
  unint64_t v51 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v7);
  uint64_t v52 = &v39[-v51];
  unint64_t v53 = (*(void *)(*(void *)(type metadata accessor for SearchItem.LegacySuggested() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  id v54 = &v39[-v53];
  unint64_t v55 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v9);
  id v56 = &v39[-v55];
  unint64_t v57 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Document() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  uint64_t v58 = &v39[-v57];
  unint64_t v59 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v11);
  unint64_t v60 = &v39[-v59];
  unint64_t v61 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Location() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  id v62 = &v39[-v61];
  unint64_t v63 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v13);
  int v64 = &v39[-v63];
  unint64_t v65 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Photo() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  uint64_t v66 = &v39[-v65];
  unint64_t v67 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v15);
  id v68 = &v39[-v67];
  unint64_t v69 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Contact() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  int v70 = (uint64_t *)&v39[-v69];
  unint64_t v71 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v17);
  uint64_t v72 = &v39[-v71];
  uint64_t v18 = type metadata accessor for SearchItem.Generic();
  unint64_t v73 = (*(void *)(*(void *)(v18 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v18);
  uint64_t v74 = &v39[-v73];
  unint64_t v75 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](&v39[-v73]);
  double v76 = &v39[-v75];
  unint64_t v77 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](&v39[-v75]);
  int v78 = &v39[-v77];
  unint64_t v79 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](&v39[-v77]);
  id v80 = &v39[-v79];
  unint64_t v81 = (v22 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](&v39[-v79]);
  uint64_t v82 = &v39[-v81];
  unint64_t v83 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](&v39[-v81]);
  uint64_t v84 = &v39[-v83];
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1B68);
  unint64_t v86 = (*(void *)(*(void *)(v117 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v85);
  double v119 = &v39[-v86];
  uint64_t v118 = type metadata accessor for SearchItem();
  uint64_t v111 = *(void *)(*(void *)(v118 - 8) + 64);
  unint64_t v88 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v87);
  unint64_t v89 = &v39[-v88];
  unint64_t v90 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v24);
  uint64_t v91 = &v39[-v90];
  unint64_t v92 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v25);
  uint64_t v93 = &v39[-v92];
  unint64_t v94 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v26);
  uint64_t v95 = &v39[-v94];
  unint64_t v96 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v27);
  uint64_t v97 = &v39[-v96];
  unint64_t v98 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v28);
  uint64_t v99 = &v39[-v98];
  unint64_t v100 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v29);
  id v101 = &v39[-v100];
  unint64_t v102 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v30);
  id v103 = &v39[-v102];
  unint64_t v104 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v31);
  uint64_t v105 = &v39[-v104];
  unint64_t v106 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v32);
  uint64_t v107 = &v39[-v106];
  unint64_t v108 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v33);
  uint64_t v109 = &v39[-v108];
  unint64_t v110 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v34);
  uint64_t v116 = &v39[-v110];
  unint64_t v112 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v35);
  char v114 = &v39[-v112];
  double v123 = v36;
  uint64_t v122 = v37;
  sub_1DDDC9C48(v36, &v39[-v112]);
  sub_1DDDC9C48(v113, v116);
  uint64_t v115 = *(int *)(v117 + 48);
  sub_1DDDDA3DC((uint64_t)v114, (uint64_t)v119);
  sub_1DDDDA3DC((uint64_t)v116, (uint64_t)&v119[v115]);
  uint64_t v120 = *(int *)(v117 + 48);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 1:
      sub_1DDDC9C48(v119, v107);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        sub_1DDD86844((uint64_t)v107);
        goto LABEL_57;
      }
      sub_1DDD86BAC((uint64_t)v107, (uint64_t)v72);
      sub_1DDD86BAC((uint64_t)&v119[v120], (uint64_t)v70);
      if (static SearchItem.Contact.== infix(_:_:)((uint64_t)v72, v70))
      {
        sub_1DDD86844((uint64_t)v70);
        sub_1DDD86844((uint64_t)v72);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDD86844((uint64_t)v70);
        sub_1DDD86844((uint64_t)v72);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 2:
      sub_1DDDC9C48(v119, v105);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        sub_1DDEAA270((uint64_t)v105);
        goto LABEL_57;
      }
      sub_1DDEC7D08((uint64_t)v105, (uint64_t)v68);
      sub_1DDEC7D08((uint64_t)&v119[v120], (uint64_t)v66);
      if (static SearchItem.Photo.== infix(_:_:)((uint64_t)v68, (uint64_t)v66))
      {
        sub_1DDEAA270((uint64_t)v66);
        sub_1DDEAA270((uint64_t)v68);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDEAA270((uint64_t)v66);
        sub_1DDEAA270((uint64_t)v68);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 3:
      sub_1DDDC9C48(v119, v103);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        sub_1DDDF2824((uint64_t)v103);
        goto LABEL_57;
      }
      sub_1DDDF2DD0((uint64_t)v103, (uint64_t)v64);
      sub_1DDDF2DD0((uint64_t)&v119[v120], (uint64_t)v62);
      if (static SearchItem.Location.== infix(_:_:)((uint64_t)v64, (uint64_t)v62))
      {
        sub_1DDDF2824((uint64_t)v62);
        sub_1DDDF2824((uint64_t)v64);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDF2824((uint64_t)v62);
        sub_1DDDF2824((uint64_t)v64);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 4:
      sub_1DDDC9C48(v119, v101);
      if (swift_getEnumCaseMultiPayload() != 4)
      {
        sub_1DDD8DEB0((uint64_t)v101);
        goto LABEL_57;
      }
      sub_1DDD8E5D4((uint64_t)v101, (uint64_t)v60);
      sub_1DDD8E5D4((uint64_t)&v119[v120], (uint64_t)v58);
      if (static SearchItem.Document.== infix(_:_:)((uint64_t)v60, (uint64_t)v58))
      {
        sub_1DDD8DEB0((uint64_t)v58);
        sub_1DDD8DEB0((uint64_t)v60);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDD8DEB0((uint64_t)v58);
        sub_1DDD8DEB0((uint64_t)v60);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 5:
      sub_1DDDC9C48(v119, v99);
      if (swift_getEnumCaseMultiPayload() != 5)
      {
        sub_1DDDED178((uint64_t)v99);
        goto LABEL_57;
      }
      sub_1DDEC68A8((uint64_t)v99, (uint64_t)v56);
      sub_1DDEC68A8((uint64_t)&v119[v120], (uint64_t)v54);
      if (static SearchItem.LegacySuggested.== infix(_:_:)((uint64_t)v56, (uint64_t)v54))
      {
        sub_1DDDED178((uint64_t)v54);
        sub_1DDDED178((uint64_t)v56);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDED178((uint64_t)v54);
        sub_1DDDED178((uint64_t)v56);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 6:
      sub_1DDDC9C48(v119, v97);
      if (swift_getEnumCaseMultiPayload() != 6)
      {
        sub_1DDDC1AB4((uint64_t)v97);
        goto LABEL_57;
      }
      sub_1DDDC1E38((uint64_t)v97, (uint64_t)v80);
      sub_1DDDC1E38((uint64_t)&v119[v120], (uint64_t)v78);
      if (static SearchItem.Generic.== infix(_:_:)((uint64_t)v80, v78))
      {
        sub_1DDDC1AB4((uint64_t)v78);
        sub_1DDDC1AB4((uint64_t)v80);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDC1AB4((uint64_t)v78);
        sub_1DDDC1AB4((uint64_t)v80);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 7:
      sub_1DDDC9C48(v119, v95);
      if (swift_getEnumCaseMultiPayload() != 7)
      {
        sub_1DDDC1AB4((uint64_t)v95);
        goto LABEL_57;
      }
      sub_1DDDC1E38((uint64_t)v95, (uint64_t)v76);
      sub_1DDDC1E38((uint64_t)&v119[v120], (uint64_t)v74);
      if (static SearchItem.Generic.== infix(_:_:)((uint64_t)v76, v74))
      {
        sub_1DDDC1AB4((uint64_t)v74);
        sub_1DDDC1AB4((uint64_t)v76);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDC1AB4((uint64_t)v74);
        sub_1DDDC1AB4((uint64_t)v76);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 8:
      sub_1DDDC9C48(v119, v93);
      if (swift_getEnumCaseMultiPayload() != 8)
      {
        sub_1DDEC697C((uint64_t)v93);
        goto LABEL_57;
      }
      sub_1DDEC7C70((uint64_t)v93, (uint64_t)v52);
      sub_1DDEC7C70((uint64_t)&v119[v120], (uint64_t)v50);
      if (static SearchItem.TopHit.== infix(_:_:)((uint64_t)v52, (uint64_t)v50))
      {
        sub_1DDEC697C((uint64_t)v50);
        sub_1DDEC697C((uint64_t)v52);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDEC697C((uint64_t)v50);
        sub_1DDEC697C((uint64_t)v52);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 9:
      sub_1DDDC9C48(v119, v91);
      if (swift_getEnumCaseMultiPayload() != 9)
      {
        sub_1DDDE3A34((uint64_t)v91);
        goto LABEL_57;
      }
      sub_1DDEC73E0((uint64_t)v91, (uint64_t)v48);
      sub_1DDEC73E0((uint64_t)&v119[v120], (uint64_t)v46);
      if (static SearchItem.InstantAnswer.== infix(_:_:)((uint64_t)v48, (uint64_t)v46))
      {
        sub_1DDDE3A34((uint64_t)v46);
        sub_1DDDE3A34((uint64_t)v48);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDE3A34((uint64_t)v46);
        sub_1DDDE3A34((uint64_t)v48);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    case 10:
      sub_1DDDC9C48(v119, v89);
      if (swift_getEnumCaseMultiPayload() != 10)
      {
        sub_1DDDEFB94((uint64_t)v89);
        goto LABEL_57;
      }
      sub_1DDDF0130(v89, v44);
      sub_1DDDF0130(&v119[v120], v42);
      if (static SearchItem.Link.== infix(_:_:)((uint64_t)v44, (uint64_t *)v42))
      {
        sub_1DDDEFB94((uint64_t)v42);
        sub_1DDDEFB94((uint64_t)v44);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 1;
      }
      else
      {
        sub_1DDDEFB94((uint64_t)v42);
        sub_1DDDEFB94((uint64_t)v44);
        sub_1DDDCB5D8((uint64_t)v119);
        int v40 = 0;
      }
      break;
    default:
      sub_1DDDC9C48(v119, v109);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_1DDDC1AB4((uint64_t)v109);
LABEL_57:
        sub_1DDEC9404((uint64_t)v119);
        int v40 = 0;
      }
      else
      {
        sub_1DDDC1E38((uint64_t)v109, (uint64_t)v84);
        sub_1DDDC1E38((uint64_t)&v119[v120], (uint64_t)v82);
        if (static SearchItem.Generic.== infix(_:_:)((uint64_t)v84, v82))
        {
          sub_1DDDC1AB4((uint64_t)v82);
          sub_1DDDC1AB4((uint64_t)v84);
          sub_1DDDCB5D8((uint64_t)v119);
          int v40 = 1;
        }
        else
        {
          sub_1DDDC1AB4((uint64_t)v82);
          sub_1DDDC1AB4((uint64_t)v84);
          sub_1DDDCB5D8((uint64_t)v119);
          int v40 = 0;
        }
      }
      break;
  }
  return v40 & 1;
}

uint64_t sub_1DDEC9404(uint64_t a1)
{
  type metadata accessor for SearchItem();
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v3 = EnumCaseMultiPayload;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        swift_bridgeObjectRelease();
        unint64_t v96 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v95 = a1 + v96[6];
        uint64_t v4 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 8))(v95);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 1:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v94 = a1 + *(int *)(type metadata accessor for SearchItem.Contact() + 24);
        uint64_t v5 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(v94);
        swift_bridgeObjectRelease();
        break;
      case 2:
        uint64_t v6 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v6 - 8) + 8))(a1);
        uint64_t v93 = type metadata accessor for SearchItem.Photo();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        break;
      case 3:
        uint64_t v7 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v7 - 8) + 8))(a1);
        type metadata accessor for SearchItem.Location();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 4:
        uint64_t v8 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v8 - 8) + 8))(a1);
        uint64_t v92 = type metadata accessor for SearchItem.Document();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v91 = a1 + *(int *)(v92 + 32);
        uint64_t v9 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v9 - 8) + 8))(v91);
        swift_bridgeObjectRelease();
        break;
      case 5:
        uint64_t v10 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v10 - 8) + 8))(a1);
        uint64_t v90 = type metadata accessor for SearchItem.LegacySuggested();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        break;
      case 6:
        swift_bridgeObjectRelease();
        unint64_t v89 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v88 = a1 + v89[6];
        uint64_t v11 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v11 - 8) + 8))(v88);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 7:
        swift_bridgeObjectRelease();
        uint64_t v87 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v86 = a1 + v87[6];
        uint64_t v12 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v12 - 8) + 8))(v86);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 8:
        uint64_t v13 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v13 - 8) + 8))(a1);

        swift_bridgeObjectRelease();
        break;
      case 9:
        uint64_t v14 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v14 - 8) + 8))(a1);
        unint64_t v81 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v77 = a1 + v81[9];
        uint64_t v79 = sub_1DDEECB08();
        uint64_t v78 = *(void *)(v79 - 8);
        id v80 = *(void (**)(uint64_t))(v78 + 8);
        v80(v77);
        ((void (*)(uint64_t, uint64_t))v80)(a1 + v81[10], v79);
        swift_bridgeObjectRelease();
        uint64_t v82 = a1 + v81[12];
        uint64_t v83 = sub_1DDEECD28();
        uint64_t v84 = *(void *)(v83 - 8);
        uint64_t v85 = *(unsigned int (**)(void))(v84 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v85)(v82, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v82, v83);
        }
        uint64_t v73 = a1 + v81[13];
        uint64_t v74 = sub_1DDEECEB8();
        uint64_t v75 = *(void *)(v74 - 8);
        double v76 = *(unsigned int (**)(void))(v75 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v76)(v73, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v73, v74);
        }
        uint64_t v72 = a1 + v81[14];
        if (!v76()) {
          (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v72, v74);
        }
        uint64_t v71 = a1 + v81[15];
        if (!v85()) {
          (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v71, v83);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ((void (*)(uint64_t, uint64_t))v80)(a1 + v81[20], v79);
        uint64_t v70 = a1 + v81[21];
        if (!(*(unsigned int (**)(void))(v78 + 48))()) {
          ((void (*)(uint64_t, uint64_t))v80)(v70, v79);
        }
        uint64_t v69 = a1 + v81[22];
        if (!v76()) {
          (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v69, v74);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 10:
        swift_bridgeObjectRelease();
        uint64_t v68 = type metadata accessor for SearchItem.Link();
        uint64_t v66 = a1 + *(int *)(v68 + 20);
        uint64_t v15 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v15 - 8) + 8))(v66);
        uint64_t v67 = a1 + *(int *)(v68 + 24);
        uint64_t v16 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v16 - 8) + 8))(v67);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      default:
LABEL_58:
        JUMPOUT(0);
    }
  }
  uint64_t v65 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1B68) + 48);
  unsigned int v17 = swift_getEnumCaseMultiPayload();
  if (v17)
  {
    uint64_t v19 = v17;
    char v18 = 1;
  }
  else
  {
    uint64_t v19 = 0;
    char v18 = 0;
  }
  if ((v18 & 1) == 0)
  {
    switch(v19)
    {
      case 0:
        swift_bridgeObjectRelease();
        int v64 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v63 = v65 + v64[6];
        uint64_t v20 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v20 - 8) + 8))(v63);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      case 1:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v62 = v65 + *(int *)(type metadata accessor for SearchItem.Contact() + 24);
        uint64_t v21 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v21 - 8) + 8))(v62);
        swift_bridgeObjectRelease();
        return a1;
      case 2:
        uint64_t v22 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v22 - 8) + 8))(v65);
        uint64_t v61 = type metadata accessor for SearchItem.Photo();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return a1;
      case 3:
        uint64_t v23 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v23 - 8) + 8))(v65);
        type metadata accessor for SearchItem.Location();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      case 4:
        uint64_t v24 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v24 - 8) + 8))(v65);
        uint64_t v60 = type metadata accessor for SearchItem.Document();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v59 = v65 + *(int *)(v60 + 32);
        uint64_t v25 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v25 - 8) + 8))(v59);
        swift_bridgeObjectRelease();
        return a1;
      case 5:
        uint64_t v26 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v26 - 8) + 8))(v65);
        uint64_t v58 = type metadata accessor for SearchItem.LegacySuggested();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return a1;
      case 6:
        swift_bridgeObjectRelease();
        unint64_t v57 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v56 = v65 + v57[6];
        uint64_t v27 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v27 - 8) + 8))(v56);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      case 7:
        swift_bridgeObjectRelease();
        unint64_t v55 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v54 = v65 + v55[6];
        uint64_t v28 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v28 - 8) + 8))(v54);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      case 8:
        uint64_t v29 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v29 - 8) + 8))(v65);

        swift_bridgeObjectRelease();
        return a1;
      case 9:
        uint64_t v30 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v30 - 8) + 8))(v65);
        unint64_t v49 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = v65 + v49[9];
        uint64_t v47 = sub_1DDEECB08();
        uint64_t v46 = *(void *)(v47 - 8);
        uint64_t v48 = *(void (**)(uint64_t))(v46 + 8);
        v48(v45);
        ((void (*)(uint64_t, uint64_t))v48)(v65 + v49[10], v47);
        swift_bridgeObjectRelease();
        uint64_t v50 = v65 + v49[12];
        uint64_t v51 = sub_1DDEECD28();
        uint64_t v52 = *(void *)(v51 - 8);
        unint64_t v53 = *(unsigned int (**)(void))(v52 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v53)(v50, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v51);
        }
        uint64_t v41 = v65 + v49[13];
        uint64_t v42 = sub_1DDEECEB8();
        uint64_t v43 = *(void *)(v42 - 8);
        unint64_t v44 = *(unsigned int (**)(void))(v43 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v44)(v41, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
        }
        uint64_t v40 = v65 + v49[14];
        if (!v44()) {
          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v40, v42);
        }
        uint64_t v39 = v65 + v49[15];
        if (!v53()) {
          (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v39, v51);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ((void (*)(uint64_t, uint64_t))v48)(v65 + v49[20], v47);
        uint64_t v38 = v65 + v49[21];
        if (!(*(unsigned int (**)(void))(v46 + 48))()) {
          ((void (*)(uint64_t, uint64_t))v48)(v38, v47);
        }
        uint64_t v37 = v65 + v49[22];
        if (!v44()) {
          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v37, v42);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      case 10:
        swift_bridgeObjectRelease();
        uint64_t v36 = type metadata accessor for SearchItem.Link();
        uint64_t v34 = v65 + *(int *)(v36 + 20);
        uint64_t v31 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v31 - 8) + 8))(v34);
        uint64_t v35 = v65 + *(int *)(v36 + 24);
        uint64_t v32 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v32 - 8) + 8))(v35);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return a1;
      default:
        goto LABEL_58;
    }
  }
  return a1;
}

uint64_t SearchItem.hashValue.getter()
{
  return sub_1DDEEF6D8();
}

unint64_t sub_1DDECAE7C()
{
  uint64_t v2 = qword_1EBEA1AA8;
  if (!qword_1EBEA1AA8)
  {
    type metadata accessor for SearchItem();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1AA8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDECAF00()
{
  return SearchItem.hashValue.getter();
}

uint64_t sub_1DDECAF18(uint64_t a1)
{
  return SearchItem.hash(into:)(a1);
}

uint64_t sub_1DDECAF30(uint64_t a1, void *a2)
{
  return static SearchItem.== infix(_:_:)(a1, a2) & 1;
}

uint64_t SearchItem.accessibilityDescription.getter()
{
  uint64_t v90 = 0;
  unint64_t v89 = 0;
  uint64_t v92 = 0;
  uint64_t v91 = 0;
  uint64_t v74 = 0;
  unint64_t v72 = (*(void *)(*(void *)(type metadata accessor for SearchItem.Generic() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v73 = (char *)&v23 - v72;
  uint64_t v92 = (char *)&v23 - v72;
  uint64_t v75 = type metadata accessor for SearchItem.LegacySuggested();
  unint64_t v76 = (*(void *)(*(void *)(v75 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v74);
  uint64_t v77 = (char *)&v23 - v76;
  uint64_t v91 = (char *)&v23 - v76;
  uint64_t v80 = type metadata accessor for SearchItem();
  unint64_t v79 = (*(void *)(*(void *)(v80 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v78);
  uint64_t v81 = (uint64_t)&v23 - v79;
  uint64_t v90 = v0;
  sub_1DDDC9C48(v0, (uint64_t *)((char *)&v23 - v79));
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 1:
      uint64_t v69 = sub_1DDEEEC08();
      uint64_t v68 = v1;
      sub_1DDD86844(v81);
      uint64_t v70 = v69;
      uint64_t v71 = v68;
      break;
    case 2:
      uint64_t v67 = sub_1DDEEEC08();
      uint64_t v66 = v2;
      sub_1DDEAA270(v81);
      uint64_t v70 = v67;
      uint64_t v71 = v66;
      break;
    case 3:
      uint64_t v65 = sub_1DDEEEC08();
      uint64_t v64 = v3;
      sub_1DDDF2824(v81);
      uint64_t v70 = v65;
      uint64_t v71 = v64;
      break;
    case 4:
      uint64_t v63 = sub_1DDEEEC08();
      uint64_t v62 = v4;
      sub_1DDD8DEB0(v81);
      uint64_t v70 = v63;
      uint64_t v71 = v62;
      break;
    case 5:
      sub_1DDEC68A8(v81, (uint64_t)v77);
      uint64_t v91 = v77;
      int v61 = v77[*(int *)(v75 + 36)];
      if (v61)
      {
        if (v61 == 1)
        {
          uint64_t v58 = sub_1DDEEEC08();
          uint64_t v57 = v6;
          sub_1DDDED178((uint64_t)v77);
          uint64_t v70 = v58;
          uint64_t v71 = v57;
        }
        else
        {
          uint64_t v56 = sub_1DDEEEC08();
          uint64_t v55 = v7;
          sub_1DDDED178((uint64_t)v77);
          uint64_t v70 = v56;
          uint64_t v71 = v55;
        }
      }
      else
      {
        uint64_t v60 = sub_1DDEEEC08();
        uint64_t v59 = v5;
        sub_1DDDED178((uint64_t)v77);
        uint64_t v70 = v60;
        uint64_t v71 = v59;
      }
      break;
    case 6:
      sub_1DDDC1E38(v81, (uint64_t)v73);
      uint64_t v92 = v73;
      uint64_t v43 = 11;
      uint64_t v8 = sub_1DDEEF998();
      uint64_t v50 = &v84;
      uint64_t v84 = v8;
      uint64_t v85 = v9;
      int v48 = 1;
      sub_1DDEEEC08();
      uint64_t v44 = v10;
      sub_1DDEEF988();
      swift_bridgeObjectRelease();
      uint64_t v45 = *(void *)v73;
      uint64_t v46 = *((void *)v73 + 1);
      swift_bridgeObjectRetain();
      uint64_t v47 = v83;
      v83[0] = v45;
      v83[1] = v46;
      sub_1DDEEF978();
      sub_1DDD31BC0();
      sub_1DDEEEC08();
      uint64_t v49 = v11;
      sub_1DDEEF988();
      swift_bridgeObjectRelease();
      uint64_t v52 = v84;
      uint64_t v51 = v85;
      swift_bridgeObjectRetain();
      sub_1DDD31BC0();
      uint64_t v54 = sub_1DDEEEBE8();
      uint64_t v53 = v12;
      sub_1DDDC1AB4((uint64_t)v73);
      uint64_t v70 = v54;
      uint64_t v71 = v53;
      break;
    case 7:
      unint64_t v89 = v73;
      sub_1DDDC1E38(v81, (uint64_t)v73);
      unint64_t v89 = v73;
      uint64_t v31 = 7;
      uint64_t v13 = sub_1DDEEF998();
      uint64_t v38 = &v87;
      uint64_t v87 = v13;
      uint64_t v88 = v14;
      int v36 = 1;
      sub_1DDEEEC08();
      uint64_t v32 = v15;
      sub_1DDEEF988();
      swift_bridgeObjectRelease();
      uint64_t v33 = *(void *)v73;
      uint64_t v34 = *((void *)v73 + 1);
      swift_bridgeObjectRetain();
      uint64_t v35 = v86;
      v86[0] = v33;
      v86[1] = v34;
      sub_1DDEEF978();
      sub_1DDD31BC0();
      sub_1DDEEEC08();
      uint64_t v37 = v16;
      sub_1DDEEF988();
      swift_bridgeObjectRelease();
      uint64_t v40 = v87;
      uint64_t v39 = v88;
      swift_bridgeObjectRetain();
      sub_1DDD31BC0();
      uint64_t v42 = sub_1DDEEEBE8();
      uint64_t v41 = v17;
      sub_1DDDC1AB4((uint64_t)v73);
      uint64_t v70 = v42;
      uint64_t v71 = v41;
      break;
    case 8:
      uint64_t v28 = sub_1DDEEEC08();
      uint64_t v27 = v19;
      sub_1DDEC697C(v81);
      uint64_t v70 = v28;
      uint64_t v71 = v27;
      break;
    case 9:
      uint64_t v26 = sub_1DDEEEC08();
      uint64_t v25 = v20;
      sub_1DDDE3A34(v81);
      uint64_t v70 = v26;
      uint64_t v71 = v25;
      break;
    case 10:
      uint64_t v24 = sub_1DDEEEC08();
      uint64_t v23 = v21;
      sub_1DDDEFB94(v81);
      uint64_t v70 = v24;
      uint64_t v71 = v23;
      break;
    default:
      uint64_t v30 = sub_1DDEEEC08();
      uint64_t v29 = v18;
      sub_1DDDC1AB4(v81);
      uint64_t v70 = v30;
      uint64_t v71 = v29;
      break;
  }
  return v70;
}

uint64_t sub_1DDECB854@<X0>(uint64_t a1@<X8>)
{
  return SearchItem.id.getter(a1);
}

unint64_t sub_1DDECB86C()
{
  return sub_1DDECB884();
}

unint64_t sub_1DDECB884()
{
  uint64_t v2 = qword_1EBEA1AB0;
  if (!qword_1EBEA1AB0)
  {
    type metadata accessor for SearchItem();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1AB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t dispatch thunk of ListSearchItem.count.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ListSearchItem.count.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ListSearchItem.count.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ListSearchItem.image.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ListSearchItem.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ListSearchItem.title.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ListSearchItem.title.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

unint64_t initializeBufferWithCopyOfBuffer for SearchItem(void *a1, void *a2, uint64_t a3)
{
  int v221 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v221 & 0x20000) != 0)
  {
    uint64_t v217 = *a2;
    swift_retain();
    *a1 = v217;
    return *a1 + ((v221 + 16) & ~(unint64_t)v221);
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        uint64_t v196 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v196;
        uint64_t v197 = a2[2];
        swift_bridgeObjectRetain();
        a1[2] = v197;
        uint64_t v200 = type metadata accessor for SearchItem.Contact();
        v199 = (char *)a1 + *(int *)(v200 + 24);
        v198 = (char *)a2 + *(int *)(v200 + 24);
        uint64_t v9 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v9 - 8) + 16))(v199, v198);
        v201 = (void *)((char *)a1 + *(int *)(v200 + 28));
        uint64_t v10 = (void *)((char *)a2 + *(int *)(v200 + 28));
        void *v201 = *v10;
        uint64_t v202 = v10[1];
        swift_bridgeObjectRetain();
        v201[1] = v202;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v11 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v11 - 8) + 16))(a1, a2);
        v193 = (int *)type metadata accessor for SearchItem.Photo();
        v187 = (void *)((char *)a1 + v193[5]);
        uint64_t v12 = (void *)((char *)a2 + v193[5]);
        void *v187 = *v12;
        uint64_t v188 = v12[1];
        swift_bridgeObjectRetain();
        v187[1] = v188;
        v189 = (void *)((char *)a1 + v193[6]);
        uint64_t v13 = (void *)((char *)a2 + v193[6]);
        void *v189 = *v13;
        uint64_t v190 = v13[1];
        swift_bridgeObjectRetain();
        v189[1] = v190;
        uint64_t v191 = v193[7];
        v192 = *(void **)((char *)a2 + v191);
        id v14 = v192;
        *(void *)((char *)a1 + v191) = v192;
        uint64_t v194 = v193[8];
        uint64_t v195 = *(void *)((char *)a2 + v194);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v194) = v195;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v15 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v15 - 8) + 16))(a1, a2);
        v182 = (int *)type metadata accessor for SearchItem.Location();
        v180 = (void *)((char *)a1 + v182[5]);
        uint64_t v16 = (void *)((char *)a2 + v182[5]);
        void *v180 = *v16;
        uint64_t v181 = v16[1];
        swift_bridgeObjectRetain();
        v180[1] = v181;
        v183 = (void *)((char *)a1 + v182[6]);
        uint64_t v17 = (void *)((char *)a2 + v182[6]);
        void *v183 = *v17;
        uint64_t v184 = v17[1];
        swift_bridgeObjectRetain();
        v183[1] = v184;
        uint64_t v185 = v182[7];
        uint64_t v186 = *(void *)((char *)a2 + v185);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v185) = v186;
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v18 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v18 - 8) + 16))(a1, a2);
        v177 = (int *)type metadata accessor for SearchItem.Document();
        uint64_t v169 = v177[5];
        uint64_t v170 = *(void *)((char *)a2 + v169);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v169) = v170;
        v171 = (void *)((char *)a1 + v177[6]);
        uint64_t v19 = (void *)((char *)a2 + v177[6]);
        void *v171 = *v19;
        uint64_t v172 = v19[1];
        swift_bridgeObjectRetain();
        v171[1] = v172;
        v173 = (void *)((char *)a1 + v177[7]);
        uint64_t v20 = (void *)((char *)a2 + v177[7]);
        void *v173 = *v20;
        uint64_t v174 = v20[1];
        swift_bridgeObjectRetain();
        v173[1] = v174;
        v176 = (char *)a1 + v177[8];
        v175 = (char *)a2 + v177[8];
        uint64_t v21 = sub_1DDEECD28();
        (*(void (**)(char *, char *))(*(void *)(v21 - 8) + 16))(v176, v175);
        v178 = (void *)((char *)a1 + v177[9]);
        uint64_t v22 = (void *)((char *)a2 + v177[9]);
        void *v178 = *v22;
        uint64_t v179 = v22[1];
        swift_bridgeObjectRetain();
        v178[1] = v179;
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v23 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v23 - 8) + 16))(a1, a2);
        v168 = (int *)type metadata accessor for SearchItem.LegacySuggested();
        uint64_t v160 = v168[5];
        v161 = *(void **)((char *)a2 + v160);
        id v24 = v161;
        *(void *)((char *)a1 + v160) = v161;
        v162 = (void *)((char *)a1 + v168[6]);
        uint64_t v25 = (void *)((char *)a2 + v168[6]);
        void *v162 = *v25;
        uint64_t v163 = v25[1];
        swift_bridgeObjectRetain();
        v162[1] = v163;
        v164 = (void *)((char *)a1 + v168[7]);
        uint64_t v26 = (void *)((char *)a2 + v168[7]);
        void *v164 = *v26;
        uint64_t v165 = v26[1];
        swift_bridgeObjectRetain();
        v164[1] = v165;
        uint64_t v166 = v168[8];
        v167 = *(void **)((char *)a2 + v166);
        id v27 = v167;
        *(void *)((char *)a1 + v166) = v167;
        *((unsigned char *)a1 + v168[9]) = *((unsigned char *)a2 + v168[9]);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *a1 = *a2;
        uint64_t v146 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v146;
        a1[2] = a2[2];
        v155 = (int *)type metadata accessor for SearchItem.Generic();
        id v148 = (char *)a1 + v155[6];
        uint64_t v147 = (char *)a2 + v155[6];
        uint64_t v28 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v28 - 8) + 16))(v148, v147);
        uint64_t v149 = v155[7];
        char v150 = *(void **)((char *)a2 + v149);
        id v29 = v150;
        *(void *)((char *)a1 + v149) = v150;
        uint64_t v151 = v155[8];
        uint64_t v152 = *(void **)((char *)a2 + v151);
        id v30 = v152;
        *(void *)((char *)a1 + v151) = v152;
        uint64_t v153 = v155[9];
        v154 = *(void **)((char *)a2 + v153);
        id v31 = v154;
        *(void *)((char *)a1 + v153) = v154;
        v156 = (void *)((char *)a1 + v155[10]);
        uint64_t v32 = (void *)((char *)a2 + v155[10]);
        void *v156 = *v32;
        uint64_t v157 = v32[1];
        swift_bridgeObjectRetain();
        v156[1] = v157;
        *((unsigned char *)a1 + v155[11]) = *((unsigned char *)a2 + v155[11]);
        v158 = (void *)((char *)a1 + v155[12]);
        uint64_t v33 = (void *)((char *)a2 + v155[12]);
        void *v158 = *v33;
        uint64_t v159 = v33[1];
        swift_bridgeObjectRetain();
        v158[1] = v159;
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *a1 = *a2;
        uint64_t v132 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v132;
        a1[2] = a2[2];
        uint64_t v141 = (int *)type metadata accessor for SearchItem.Generic();
        char v134 = (char *)a1 + v141[6];
        double v133 = (char *)a2 + v141[6];
        uint64_t v34 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v34 - 8) + 16))(v134, v133);
        uint64_t v135 = v141[7];
        double v136 = *(void **)((char *)a2 + v135);
        id v35 = v136;
        *(void *)((char *)a1 + v135) = v136;
        uint64_t v137 = v141[8];
        uint64_t v138 = *(void **)((char *)a2 + v137);
        id v36 = v138;
        *(void *)((char *)a1 + v137) = v138;
        uint64_t v139 = v141[9];
        uint64_t v140 = *(void **)((char *)a2 + v139);
        id v37 = v140;
        *(void *)((char *)a1 + v139) = v140;
        double v142 = (void *)((char *)a1 + v141[10]);
        uint64_t v38 = (void *)((char *)a2 + v141[10]);
        *double v142 = *v38;
        uint64_t v143 = v38[1];
        swift_bridgeObjectRetain();
        v142[1] = v143;
        *((unsigned char *)a1 + v141[11]) = *((unsigned char *)a2 + v141[11]);
        uint64_t v144 = (void *)((char *)a1 + v141[12]);
        uint64_t v39 = (void *)((char *)a2 + v141[12]);
        *uint64_t v144 = *v39;
        uint64_t v145 = v39[1];
        swift_bridgeObjectRetain();
        v144[1] = v145;
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        uint64_t v40 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v40 - 8) + 16))(a1, a2);
        uint64_t v129 = type metadata accessor for SearchItem.TopHit();
        uint64_t v127 = *(int *)(v129 + 20);
        double v128 = *(void **)((char *)a2 + v127);
        id v41 = v128;
        *(void *)((char *)a1 + v127) = v128;
        uint64_t v130 = *(int *)(v129 + 24);
        uint64_t v131 = *(void *)((char *)a2 + v130);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v130) = v131;
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v42 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v42 - 8) + 16))(a1, a2);
        id v121 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        *(void *)((char *)a1 + v121[5]) = *(void *)((char *)a2 + v121[5]);
        unint64_t v108 = (void *)((char *)a1 + v121[6]);
        uint64_t v43 = (void *)((char *)a2 + v121[6]);
        void *v108 = *v43;
        uint64_t v109 = v43[1];
        swift_bridgeObjectRetain();
        v108[1] = v109;
        unint64_t v110 = (void *)((char *)a1 + v121[7]);
        uint64_t v44 = (void *)((char *)a2 + v121[7]);
        *unint64_t v110 = *v44;
        uint64_t v111 = v44[1];
        swift_bridgeObjectRetain();
        v110[1] = v111;
        unint64_t v112 = (void *)((char *)a1 + v121[8]);
        uint64_t v45 = (void *)((char *)a2 + v121[8]);
        *unint64_t v112 = *v45;
        uint64_t v113 = v45[1];
        swift_bridgeObjectRetain();
        v112[1] = v113;
        uint64_t v115 = (char *)a1 + v121[9];
        char v114 = (char *)a2 + v121[9];
        uint64_t v117 = sub_1DDEECB08();
        uint64_t v116 = *(void *)(v117 - 8);
        uint64_t v118 = *(void (**)(char *, char *))(v116 + 16);
        v118(v115, v114);
        ((void (*)(char *, char *, uint64_t))v118)((char *)a1 + v121[10], (char *)a2 + v121[10], v117);
        double v119 = (void *)((char *)a1 + v121[11]);
        uint64_t v46 = (void *)((char *)a2 + v121[11]);
        *double v119 = *v46;
        uint64_t v120 = v46[1];
        swift_bridgeObjectRetain();
        v119[1] = v120;
        __dst = (char *)a1 + v121[12];
        __src = (char *)a2 + v121[12];
        uint64_t v124 = sub_1DDEECD28();
        uint64_t v125 = *(void *)(v124 - 8);
        long long v126 = *(unsigned int (**)(void))(v125 + 48);
        if (((unsigned int (*)(char *, uint64_t))v126)(__src, 1))
        {
          uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(__dst, __src, *(void *)(*(void *)(v47 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v125 + 16))(__dst, __src, v124);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(__dst, 0, 1, v124);
        }
        id v103 = (char *)a1 + v121[13];
        unint64_t v104 = (char *)a2 + v121[13];
        uint64_t v105 = sub_1DDEECEB8();
        uint64_t v106 = *(void *)(v105 - 8);
        uint64_t v107 = *(unsigned int (**)(void))(v106 + 48);
        if (((unsigned int (*)(char *, uint64_t))v107)(v104, 1))
        {
          uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v103, v104, *(void *)(*(void *)(v48 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v103, v104, v105);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v103, 0, 1, v105);
        }
        id v101 = (char *)a1 + v121[14];
        unint64_t v102 = (char *)a2 + v121[14];
        if (v107())
        {
          uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v101, v102, *(void *)(*(void *)(v49 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v101, v102, v105);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v101, 0, 1, v105);
        }
        uint64_t v99 = (char *)a1 + v121[15];
        unint64_t v100 = (char *)a2 + v121[15];
        if (v126())
        {
          uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(v99, v100, *(void *)(*(void *)(v50 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v125 + 16))(v99, v100, v124);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v125 + 56))(v99, 0, 1, v124);
        }
        unint64_t v89 = (void *)((char *)a1 + v121[16]);
        uint64_t v51 = (void *)((char *)a2 + v121[16]);
        *unint64_t v89 = *v51;
        uint64_t v90 = v51[1];
        swift_bridgeObjectRetain();
        v89[1] = v90;
        uint64_t v91 = (void *)((char *)a1 + v121[17]);
        uint64_t v52 = (void *)((char *)a2 + v121[17]);
        *uint64_t v91 = *v52;
        uint64_t v92 = v52[1];
        swift_bridgeObjectRetain();
        v91[1] = v92;
        uint64_t v93 = (void *)((char *)a1 + v121[18]);
        uint64_t v53 = (void *)((char *)a2 + v121[18]);
        *uint64_t v93 = *v53;
        uint64_t v94 = v53[1];
        swift_bridgeObjectRetain();
        v93[1] = v94;
        uint64_t v95 = (void *)((char *)a1 + v121[19]);
        uint64_t v54 = (void *)((char *)a2 + v121[19]);
        *uint64_t v95 = *v54;
        uint64_t v96 = v54[1];
        swift_bridgeObjectRetain();
        v95[1] = v96;
        ((void (*)(char *, char *, uint64_t))v118)((char *)a1 + v121[20], (char *)a2 + v121[20], v117);
        uint64_t v97 = (char *)a1 + v121[21];
        unint64_t v98 = (char *)a2 + v121[21];
        if ((*(unsigned int (**)(void))(v116 + 48))())
        {
          uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
          memcpy(v97, v98, *(void *)(*(void *)(v55 - 8) + 64));
        }
        else
        {
          ((void (*)(char *, char *, uint64_t))v118)(v97, v98, v117);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v116 + 56))(v97, 0, 1, v117);
        }
        uint64_t v87 = (char *)a1 + v121[22];
        uint64_t v88 = (char *)a2 + v121[22];
        if (v107())
        {
          uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v87, v88, *(void *)(*(void *)(v56 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v87, v88, v105);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v106 + 56))(v87, 0, 1, v105);
        }
        unint64_t v79 = (void *)((char *)a1 + v121[23]);
        uint64_t v57 = (void *)((char *)a2 + v121[23]);
        void *v79 = *v57;
        uint64_t v80 = v57[1];
        swift_bridgeObjectRetain();
        v79[1] = v80;
        uint64_t v81 = (void *)((char *)a1 + v121[24]);
        uint64_t v58 = (void *)((char *)a2 + v121[24]);
        *uint64_t v81 = *v58;
        uint64_t v82 = v58[1];
        swift_bridgeObjectRetain();
        v81[1] = v82;
        uint64_t v83 = (void *)((char *)a1 + v121[25]);
        uint64_t v59 = (void *)((char *)a2 + v121[25]);
        *uint64_t v83 = *v59;
        uint64_t v84 = v59[1];
        swift_bridgeObjectRetain();
        v83[1] = v84;
        uint64_t v85 = (void *)((char *)a1 + v121[26]);
        uint64_t v60 = (void *)((char *)a2 + v121[26]);
        void *v85 = *v60;
        uint64_t v86 = v60[1];
        swift_bridgeObjectRetain();
        v85[1] = v86;
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v67 = *a2;
        swift_bridgeObjectRetain();
        *a1 = v67;
        uint64_t v74 = (int *)type metadata accessor for SearchItem.Link();
        uint64_t v69 = (char *)a1 + v74[5];
        uint64_t v68 = (char *)a2 + v74[5];
        uint64_t v61 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v61 - 8) + 16))(v69, v68);
        uint64_t v71 = (char *)a1 + v74[6];
        uint64_t v70 = (char *)a2 + v74[6];
        uint64_t v62 = sub_1DDEECD28();
        (*(void (**)(char *, char *))(*(void *)(v62 - 8) + 16))(v71, v70);
        unint64_t v72 = (void *)((char *)a1 + v74[7]);
        uint64_t v63 = (void *)((char *)a2 + v74[7]);
        void *v72 = *v63;
        uint64_t v73 = v63[1];
        swift_bridgeObjectRetain();
        v72[1] = v73;
        uint64_t v75 = (void *)((char *)a1 + v74[8]);
        uint64_t v64 = (void *)((char *)a2 + v74[8]);
        void *v75 = *v64;
        uint64_t v76 = v64[1];
        swift_bridgeObjectRetain();
        v75[1] = v76;
        uint64_t v77 = (void *)((char *)a1 + v74[9]);
        uint64_t v65 = (void *)((char *)a2 + v74[9]);
        *uint64_t v77 = *v65;
        uint64_t v78 = v65[1];
        swift_bridgeObjectRetain();
        v77[1] = v78;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        *a1 = *a2;
        uint64_t v203 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v203;
        a1[2] = a2[2];
        v212 = (int *)type metadata accessor for SearchItem.Generic();
        v205 = (char *)a1 + v212[6];
        v204 = (char *)a2 + v212[6];
        uint64_t v3 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(v205, v204);
        uint64_t v206 = v212[7];
        v207 = *(void **)((char *)a2 + v206);
        id v4 = v207;
        *(void *)((char *)a1 + v206) = v207;
        uint64_t v208 = v212[8];
        v209 = *(void **)((char *)a2 + v208);
        id v5 = v209;
        *(void *)((char *)a1 + v208) = v209;
        uint64_t v210 = v212[9];
        v211 = *(void **)((char *)a2 + v210);
        id v6 = v211;
        *(void *)((char *)a1 + v210) = v211;
        v213 = (void *)((char *)a1 + v212[10]);
        uint64_t v7 = (void *)((char *)a2 + v212[10]);
        void *v213 = *v7;
        uint64_t v214 = v7[1];
        swift_bridgeObjectRetain();
        v213[1] = v214;
        *((unsigned char *)a1 + v212[11]) = *((unsigned char *)a2 + v212[11]);
        v215 = (void *)((char *)a1 + v212[12]);
        uint64_t v8 = (void *)((char *)a2 + v212[12]);
        void *v215 = *v8;
        uint64_t v216 = v8[1];
        swift_bridgeObjectRetain();
        v215[1] = v216;
        swift_storeEnumTagMultiPayload();
        break;
    }
    return (unint64_t)a1;
  }
}

void destroy for SearchItem(uint64_t a1)
{
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v3 = EnumCaseMultiPayload;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
        swift_bridgeObjectRelease();
        uint64_t v47 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v46 = a1 + v47[6];
        uint64_t v4 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v4 - 8) + 8))(v46);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 1:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v45 = a1 + *(int *)(type metadata accessor for SearchItem.Contact() + 24);
        uint64_t v5 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v5 - 8) + 8))(v45);
        swift_bridgeObjectRelease();
        break;
      case 2:
        uint64_t v6 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v6 - 8) + 8))(a1);
        uint64_t v44 = type metadata accessor for SearchItem.Photo();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        break;
      case 3:
        uint64_t v7 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v7 - 8) + 8))(a1);
        type metadata accessor for SearchItem.Location();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 4:
        uint64_t v8 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v8 - 8) + 8))(a1);
        uint64_t v43 = type metadata accessor for SearchItem.Document();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v42 = a1 + *(int *)(v43 + 32);
        uint64_t v9 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v9 - 8) + 8))(v42);
        swift_bridgeObjectRelease();
        break;
      case 5:
        uint64_t v10 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v10 - 8) + 8))(a1);
        uint64_t v41 = type metadata accessor for SearchItem.LegacySuggested();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        break;
      case 6:
        swift_bridgeObjectRelease();
        uint64_t v40 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v39 = a1 + v40[6];
        uint64_t v11 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v11 - 8) + 8))(v39);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 7:
        swift_bridgeObjectRelease();
        uint64_t v38 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v37 = a1 + v38[6];
        uint64_t v12 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v12 - 8) + 8))(v37);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 8:
        uint64_t v13 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v13 - 8) + 8))(a1);

        swift_bridgeObjectRelease();
        break;
      case 9:
        uint64_t v14 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v14 - 8) + 8))(a1);
        uint64_t v32 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v28 = a1 + v32[9];
        uint64_t v30 = sub_1DDEECB08();
        uint64_t v29 = *(void *)(v30 - 8);
        id v31 = *(void (**)(uint64_t))(v29 + 8);
        v31(v28);
        ((void (*)(uint64_t, uint64_t))v31)(a1 + v32[10], v30);
        swift_bridgeObjectRelease();
        uint64_t v33 = a1 + v32[12];
        uint64_t v34 = sub_1DDEECD28();
        uint64_t v35 = *(void *)(v34 - 8);
        id v36 = *(unsigned int (**)(void))(v35 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v36)(v33, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
        }
        uint64_t v24 = a1 + v32[13];
        uint64_t v25 = sub_1DDEECEB8();
        uint64_t v26 = *(void *)(v25 - 8);
        id v27 = *(unsigned int (**)(void))(v26 + 48);
        if (!((unsigned int (*)(uint64_t, uint64_t))v27)(v24, 1)) {
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
        }
        uint64_t v23 = a1 + v32[14];
        if (!v27()) {
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v23, v25);
        }
        uint64_t v22 = a1 + v32[15];
        if (!v36()) {
          (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v22, v34);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        ((void (*)(uint64_t, uint64_t))v31)(a1 + v32[20], v30);
        uint64_t v21 = a1 + v32[21];
        if (!(*(unsigned int (**)(void))(v29 + 48))()) {
          ((void (*)(uint64_t, uint64_t))v31)(v21, v30);
        }
        uint64_t v20 = a1 + v32[22];
        if (!v27()) {
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v20, v25);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      case 10:
        swift_bridgeObjectRelease();
        uint64_t v19 = type metadata accessor for SearchItem.Link();
        uint64_t v17 = a1 + *(int *)(v19 + 20);
        uint64_t v15 = sub_1DDEECE78();
        (*(void (**)(uint64_t))(*(void *)(v15 - 8) + 8))(v17);
        uint64_t v18 = a1 + *(int *)(v19 + 24);
        uint64_t v16 = sub_1DDEECD28();
        (*(void (**)(uint64_t))(*(void *)(v16 - 8) + 8))(v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      default:
        JUMPOUT(0);
    }
  }
}

void *initializeWithCopy for SearchItem(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *a1 = *a2;
      uint64_t v195 = a2[1];
      swift_bridgeObjectRetain();
      a1[1] = v195;
      uint64_t v196 = a2[2];
      swift_bridgeObjectRetain();
      a1[2] = v196;
      uint64_t v199 = type metadata accessor for SearchItem.Contact();
      v198 = (char *)a1 + *(int *)(v199 + 24);
      uint64_t v197 = (char *)a2 + *(int *)(v199 + 24);
      uint64_t v8 = sub_1DDEECE78();
      (*(void (**)(char *, char *))(*(void *)(v8 - 8) + 16))(v198, v197);
      uint64_t v200 = (void *)((char *)a1 + *(int *)(v199 + 28));
      uint64_t v9 = (void *)((char *)a2 + *(int *)(v199 + 28));
      *uint64_t v200 = *v9;
      uint64_t v201 = v9[1];
      swift_bridgeObjectRetain();
      v200[1] = v201;
      swift_storeEnumTagMultiPayload();
      break;
    case 2u:
      uint64_t v10 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v10 - 8) + 16))(a1, a2);
      v192 = (int *)type metadata accessor for SearchItem.Photo();
      uint64_t v186 = (void *)((char *)a1 + v192[5]);
      uint64_t v11 = (void *)((char *)a2 + v192[5]);
      *uint64_t v186 = *v11;
      uint64_t v187 = v11[1];
      swift_bridgeObjectRetain();
      v186[1] = v187;
      uint64_t v188 = (void *)((char *)a1 + v192[6]);
      uint64_t v12 = (void *)((char *)a2 + v192[6]);
      *uint64_t v188 = *v12;
      uint64_t v189 = v12[1];
      swift_bridgeObjectRetain();
      v188[1] = v189;
      uint64_t v190 = v192[7];
      uint64_t v191 = *(void **)((char *)a2 + v190);
      id v13 = v191;
      *(void *)((char *)a1 + v190) = v191;
      uint64_t v193 = v192[8];
      uint64_t v194 = *(void *)((char *)a2 + v193);
      swift_bridgeObjectRetain();
      *(void *)((char *)a1 + v193) = v194;
      swift_storeEnumTagMultiPayload();
      break;
    case 3u:
      uint64_t v14 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v14 - 8) + 16))(a1, a2);
      uint64_t v181 = (int *)type metadata accessor for SearchItem.Location();
      uint64_t v179 = (void *)((char *)a1 + v181[5]);
      uint64_t v15 = (void *)((char *)a2 + v181[5]);
      *uint64_t v179 = *v15;
      uint64_t v180 = v15[1];
      swift_bridgeObjectRetain();
      v179[1] = v180;
      v182 = (void *)((char *)a1 + v181[6]);
      uint64_t v16 = (void *)((char *)a2 + v181[6]);
      void *v182 = *v16;
      uint64_t v183 = v16[1];
      swift_bridgeObjectRetain();
      v182[1] = v183;
      uint64_t v184 = v181[7];
      uint64_t v185 = *(void *)((char *)a2 + v184);
      swift_bridgeObjectRetain();
      *(void *)((char *)a1 + v184) = v185;
      swift_storeEnumTagMultiPayload();
      break;
    case 4u:
      uint64_t v17 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v17 - 8) + 16))(a1, a2);
      v176 = (int *)type metadata accessor for SearchItem.Document();
      uint64_t v168 = v176[5];
      uint64_t v169 = *(void *)((char *)a2 + v168);
      swift_bridgeObjectRetain();
      *(void *)((char *)a1 + v168) = v169;
      uint64_t v170 = (void *)((char *)a1 + v176[6]);
      uint64_t v18 = (void *)((char *)a2 + v176[6]);
      *uint64_t v170 = *v18;
      uint64_t v171 = v18[1];
      swift_bridgeObjectRetain();
      v170[1] = v171;
      uint64_t v172 = (void *)((char *)a1 + v176[7]);
      uint64_t v19 = (void *)((char *)a2 + v176[7]);
      *uint64_t v172 = *v19;
      uint64_t v173 = v19[1];
      swift_bridgeObjectRetain();
      v172[1] = v173;
      v175 = (char *)a1 + v176[8];
      uint64_t v174 = (char *)a2 + v176[8];
      uint64_t v20 = sub_1DDEECD28();
      (*(void (**)(char *, char *))(*(void *)(v20 - 8) + 16))(v175, v174);
      v177 = (void *)((char *)a1 + v176[9]);
      uint64_t v21 = (void *)((char *)a2 + v176[9]);
      void *v177 = *v21;
      uint64_t v178 = v21[1];
      swift_bridgeObjectRetain();
      v177[1] = v178;
      swift_storeEnumTagMultiPayload();
      break;
    case 5u:
      uint64_t v22 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v22 - 8) + 16))(a1, a2);
      v167 = (int *)type metadata accessor for SearchItem.LegacySuggested();
      uint64_t v159 = v167[5];
      uint64_t v160 = *(void **)((char *)a2 + v159);
      id v23 = v160;
      *(void *)((char *)a1 + v159) = v160;
      v161 = (void *)((char *)a1 + v167[6]);
      uint64_t v24 = (void *)((char *)a2 + v167[6]);
      void *v161 = *v24;
      uint64_t v162 = v24[1];
      swift_bridgeObjectRetain();
      v161[1] = v162;
      uint64_t v163 = (void *)((char *)a1 + v167[7]);
      uint64_t v25 = (void *)((char *)a2 + v167[7]);
      *uint64_t v163 = *v25;
      uint64_t v164 = v25[1];
      swift_bridgeObjectRetain();
      v163[1] = v164;
      uint64_t v165 = v167[8];
      uint64_t v166 = *(void **)((char *)a2 + v165);
      id v26 = v166;
      *(void *)((char *)a1 + v165) = v166;
      *((unsigned char *)a1 + v167[9]) = *((unsigned char *)a2 + v167[9]);
      swift_storeEnumTagMultiPayload();
      break;
    case 6u:
      *a1 = *a2;
      uint64_t v145 = a2[1];
      swift_bridgeObjectRetain();
      a1[1] = v145;
      a1[2] = a2[2];
      v154 = (int *)type metadata accessor for SearchItem.Generic();
      uint64_t v147 = (char *)a1 + v154[6];
      uint64_t v146 = (char *)a2 + v154[6];
      uint64_t v27 = sub_1DDEECE78();
      (*(void (**)(char *, char *))(*(void *)(v27 - 8) + 16))(v147, v146);
      uint64_t v148 = v154[7];
      uint64_t v149 = *(void **)((char *)a2 + v148);
      id v28 = v149;
      *(void *)((char *)a1 + v148) = v149;
      uint64_t v150 = v154[8];
      uint64_t v151 = *(void **)((char *)a2 + v150);
      id v29 = v151;
      *(void *)((char *)a1 + v150) = v151;
      uint64_t v152 = v154[9];
      uint64_t v153 = *(void **)((char *)a2 + v152);
      id v30 = v153;
      *(void *)((char *)a1 + v152) = v153;
      v155 = (void *)((char *)a1 + v154[10]);
      id v31 = (void *)((char *)a2 + v154[10]);
      void *v155 = *v31;
      uint64_t v156 = v31[1];
      swift_bridgeObjectRetain();
      v155[1] = v156;
      *((unsigned char *)a1 + v154[11]) = *((unsigned char *)a2 + v154[11]);
      uint64_t v157 = (void *)((char *)a1 + v154[12]);
      uint64_t v32 = (void *)((char *)a2 + v154[12]);
      *uint64_t v157 = *v32;
      uint64_t v158 = v32[1];
      swift_bridgeObjectRetain();
      v157[1] = v158;
      swift_storeEnumTagMultiPayload();
      break;
    case 7u:
      *a1 = *a2;
      uint64_t v131 = a2[1];
      swift_bridgeObjectRetain();
      a1[1] = v131;
      a1[2] = a2[2];
      uint64_t v140 = (int *)type metadata accessor for SearchItem.Generic();
      double v133 = (char *)a1 + v140[6];
      uint64_t v132 = (char *)a2 + v140[6];
      uint64_t v33 = sub_1DDEECE78();
      (*(void (**)(char *, char *))(*(void *)(v33 - 8) + 16))(v133, v132);
      uint64_t v134 = v140[7];
      uint64_t v135 = *(void **)((char *)a2 + v134);
      id v34 = v135;
      *(void *)((char *)a1 + v134) = v135;
      uint64_t v136 = v140[8];
      uint64_t v137 = *(void **)((char *)a2 + v136);
      id v35 = v137;
      *(void *)((char *)a1 + v136) = v137;
      uint64_t v138 = v140[9];
      uint64_t v139 = *(void **)((char *)a2 + v138);
      id v36 = v139;
      *(void *)((char *)a1 + v138) = v139;
      uint64_t v141 = (void *)((char *)a1 + v140[10]);
      uint64_t v37 = (void *)((char *)a2 + v140[10]);
      *uint64_t v141 = *v37;
      uint64_t v142 = v37[1];
      swift_bridgeObjectRetain();
      v141[1] = v142;
      *((unsigned char *)a1 + v140[11]) = *((unsigned char *)a2 + v140[11]);
      uint64_t v143 = (void *)((char *)a1 + v140[12]);
      uint64_t v38 = (void *)((char *)a2 + v140[12]);
      *uint64_t v143 = *v38;
      uint64_t v144 = v38[1];
      swift_bridgeObjectRetain();
      v143[1] = v144;
      swift_storeEnumTagMultiPayload();
      break;
    case 8u:
      uint64_t v39 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v39 - 8) + 16))(a1, a2);
      uint64_t v128 = type metadata accessor for SearchItem.TopHit();
      uint64_t v126 = *(int *)(v128 + 20);
      uint64_t v127 = *(void **)((char *)a2 + v126);
      id v40 = v127;
      *(void *)((char *)a1 + v126) = v127;
      uint64_t v129 = *(int *)(v128 + 24);
      uint64_t v130 = *(void *)((char *)a2 + v129);
      swift_bridgeObjectRetain();
      *(void *)((char *)a1 + v129) = v130;
      swift_storeEnumTagMultiPayload();
      break;
    case 9u:
      uint64_t v41 = sub_1DDEECE78();
      (*(void (**)(void *, void *))(*(void *)(v41 - 8) + 16))(a1, a2);
      uint64_t v120 = (int *)type metadata accessor for SearchItem.InstantAnswer();
      *(void *)((char *)a1 + v120[5]) = *(void *)((char *)a2 + v120[5]);
      uint64_t v107 = (void *)((char *)a1 + v120[6]);
      uint64_t v42 = (void *)((char *)a2 + v120[6]);
      *uint64_t v107 = *v42;
      uint64_t v108 = v42[1];
      swift_bridgeObjectRetain();
      v107[1] = v108;
      uint64_t v109 = (void *)((char *)a1 + v120[7]);
      uint64_t v43 = (void *)((char *)a2 + v120[7]);
      *uint64_t v109 = *v43;
      uint64_t v110 = v43[1];
      swift_bridgeObjectRetain();
      v109[1] = v110;
      uint64_t v111 = (void *)((char *)a1 + v120[8]);
      uint64_t v44 = (void *)((char *)a2 + v120[8]);
      *uint64_t v111 = *v44;
      uint64_t v112 = v44[1];
      swift_bridgeObjectRetain();
      v111[1] = v112;
      char v114 = (char *)a1 + v120[9];
      uint64_t v113 = (char *)a2 + v120[9];
      uint64_t v116 = sub_1DDEECB08();
      uint64_t v115 = *(void *)(v116 - 8);
      uint64_t v117 = *(void (**)(char *, char *))(v115 + 16);
      v117(v114, v113);
      ((void (*)(char *, char *, uint64_t))v117)((char *)a1 + v120[10], (char *)a2 + v120[10], v116);
      uint64_t v118 = (void *)((char *)a1 + v120[11]);
      uint64_t v45 = (void *)((char *)a2 + v120[11]);
      *uint64_t v118 = *v45;
      uint64_t v119 = v45[1];
      swift_bridgeObjectRetain();
      v118[1] = v119;
      __dst = (char *)a1 + v120[12];
      __src = (char *)a2 + v120[12];
      uint64_t v123 = sub_1DDEECD28();
      uint64_t v124 = *(void *)(v123 - 8);
      uint64_t v125 = *(unsigned int (**)(void))(v124 + 48);
      if (((unsigned int (*)(char *, uint64_t))v125)(__src, 1))
      {
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
        memcpy(__dst, __src, *(void *)(*(void *)(v46 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v124 + 16))(__dst, __src, v123);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v124 + 56))(__dst, 0, 1, v123);
      }
      unint64_t v102 = (char *)a1 + v120[13];
      id v103 = (char *)a2 + v120[13];
      uint64_t v104 = sub_1DDEECEB8();
      uint64_t v105 = *(void *)(v104 - 8);
      uint64_t v106 = *(unsigned int (**)(void))(v105 + 48);
      if (((unsigned int (*)(char *, uint64_t))v106)(v103, 1))
      {
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v102, v103, *(void *)(*(void *)(v47 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v102, v103, v104);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v102, 0, 1, v104);
      }
      unint64_t v100 = (char *)a1 + v120[14];
      id v101 = (char *)a2 + v120[14];
      if (v106())
      {
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v100, v101, *(void *)(*(void *)(v48 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v100, v101, v104);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v100, 0, 1, v104);
      }
      unint64_t v98 = (char *)a1 + v120[15];
      uint64_t v99 = (char *)a2 + v120[15];
      if (v125())
      {
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
        memcpy(v98, v99, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v98, v99, v123);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v124 + 56))(v98, 0, 1, v123);
      }
      uint64_t v88 = (void *)((char *)a1 + v120[16]);
      uint64_t v50 = (void *)((char *)a2 + v120[16]);
      *uint64_t v88 = *v50;
      uint64_t v89 = v50[1];
      swift_bridgeObjectRetain();
      v88[1] = v89;
      uint64_t v90 = (void *)((char *)a1 + v120[17]);
      uint64_t v51 = (void *)((char *)a2 + v120[17]);
      *uint64_t v90 = *v51;
      uint64_t v91 = v51[1];
      swift_bridgeObjectRetain();
      v90[1] = v91;
      uint64_t v92 = (void *)((char *)a1 + v120[18]);
      uint64_t v52 = (void *)((char *)a2 + v120[18]);
      void *v92 = *v52;
      uint64_t v93 = v52[1];
      swift_bridgeObjectRetain();
      v92[1] = v93;
      uint64_t v94 = (void *)((char *)a1 + v120[19]);
      uint64_t v53 = (void *)((char *)a2 + v120[19]);
      *uint64_t v94 = *v53;
      uint64_t v95 = v53[1];
      swift_bridgeObjectRetain();
      v94[1] = v95;
      ((void (*)(char *, char *, uint64_t))v117)((char *)a1 + v120[20], (char *)a2 + v120[20], v116);
      uint64_t v96 = (char *)a1 + v120[21];
      uint64_t v97 = (char *)a2 + v120[21];
      if ((*(unsigned int (**)(void))(v115 + 48))())
      {
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
        memcpy(v96, v97, *(void *)(*(void *)(v54 - 8) + 64));
      }
      else
      {
        ((void (*)(char *, char *, uint64_t))v117)(v96, v97, v116);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v115 + 56))(v96, 0, 1, v116);
      }
      uint64_t v86 = (char *)a1 + v120[22];
      uint64_t v87 = (char *)a2 + v120[22];
      if (v106())
      {
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v86, v87, *(void *)(*(void *)(v55 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v86, v87, v104);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v86, 0, 1, v104);
      }
      uint64_t v78 = (void *)((char *)a1 + v120[23]);
      uint64_t v56 = (void *)((char *)a2 + v120[23]);
      *uint64_t v78 = *v56;
      uint64_t v79 = v56[1];
      swift_bridgeObjectRetain();
      v78[1] = v79;
      uint64_t v80 = (void *)((char *)a1 + v120[24]);
      uint64_t v57 = (void *)((char *)a2 + v120[24]);
      *uint64_t v80 = *v57;
      uint64_t v81 = v57[1];
      swift_bridgeObjectRetain();
      v80[1] = v81;
      uint64_t v82 = (void *)((char *)a1 + v120[25]);
      uint64_t v58 = (void *)((char *)a2 + v120[25]);
      void *v82 = *v58;
      uint64_t v83 = v58[1];
      swift_bridgeObjectRetain();
      v82[1] = v83;
      uint64_t v84 = (void *)((char *)a1 + v120[26]);
      uint64_t v59 = (void *)((char *)a2 + v120[26]);
      *uint64_t v84 = *v59;
      uint64_t v85 = v59[1];
      swift_bridgeObjectRetain();
      v84[1] = v85;
      swift_storeEnumTagMultiPayload();
      break;
    case 0xAu:
      uint64_t v66 = *a2;
      swift_bridgeObjectRetain();
      *a1 = v66;
      uint64_t v73 = (int *)type metadata accessor for SearchItem.Link();
      uint64_t v68 = (char *)a1 + v73[5];
      uint64_t v67 = (char *)a2 + v73[5];
      uint64_t v60 = sub_1DDEECE78();
      (*(void (**)(char *, char *))(*(void *)(v60 - 8) + 16))(v68, v67);
      uint64_t v70 = (char *)a1 + v73[6];
      uint64_t v69 = (char *)a2 + v73[6];
      uint64_t v61 = sub_1DDEECD28();
      (*(void (**)(char *, char *))(*(void *)(v61 - 8) + 16))(v70, v69);
      uint64_t v71 = (void *)((char *)a1 + v73[7]);
      uint64_t v62 = (void *)((char *)a2 + v73[7]);
      void *v71 = *v62;
      uint64_t v72 = v62[1];
      swift_bridgeObjectRetain();
      v71[1] = v72;
      uint64_t v74 = (void *)((char *)a1 + v73[8]);
      uint64_t v63 = (void *)((char *)a2 + v73[8]);
      void *v74 = *v63;
      uint64_t v75 = v63[1];
      swift_bridgeObjectRetain();
      v74[1] = v75;
      uint64_t v76 = (void *)((char *)a1 + v73[9]);
      uint64_t v64 = (void *)((char *)a2 + v73[9]);
      *uint64_t v76 = *v64;
      uint64_t v77 = v64[1];
      swift_bridgeObjectRetain();
      v76[1] = v77;
      swift_storeEnumTagMultiPayload();
      break;
    default:
      *a1 = *a2;
      uint64_t v202 = a2[1];
      swift_bridgeObjectRetain();
      a1[1] = v202;
      a1[2] = a2[2];
      v211 = (int *)type metadata accessor for SearchItem.Generic();
      v204 = (char *)a1 + v211[6];
      uint64_t v203 = (char *)a2 + v211[6];
      uint64_t v2 = sub_1DDEECE78();
      (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(v204, v203);
      uint64_t v205 = v211[7];
      uint64_t v206 = *(void **)((char *)a2 + v205);
      id v3 = v206;
      *(void *)((char *)a1 + v205) = v206;
      uint64_t v207 = v211[8];
      uint64_t v208 = *(void **)((char *)a2 + v207);
      id v4 = v208;
      *(void *)((char *)a1 + v207) = v208;
      uint64_t v209 = v211[9];
      uint64_t v210 = *(void **)((char *)a2 + v209);
      id v5 = v210;
      *(void *)((char *)a1 + v209) = v210;
      v212 = (void *)((char *)a1 + v211[10]);
      uint64_t v6 = (void *)((char *)a2 + v211[10]);
      void *v212 = *v6;
      uint64_t v213 = v6[1];
      swift_bridgeObjectRetain();
      v212[1] = v213;
      *((unsigned char *)a1 + v211[11]) = *((unsigned char *)a2 + v211[11]);
      uint64_t v214 = (void *)((char *)a1 + v211[12]);
      uint64_t v7 = (void *)((char *)a2 + v211[12]);
      *uint64_t v214 = *v7;
      uint64_t v215 = v7[1];
      swift_bridgeObjectRetain();
      v214[1] = v215;
      swift_storeEnumTagMultiPayload();
      break;
  }
  return a1;
}

void *assignWithCopy for SearchItem(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1DDDCB5D8((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        uint64_t v195 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v195;
        uint64_t v196 = a2[2];
        swift_bridgeObjectRetain();
        a1[2] = v196;
        uint64_t v199 = type metadata accessor for SearchItem.Contact();
        v198 = (char *)a1 + *(int *)(v199 + 24);
        uint64_t v197 = (char *)a2 + *(int *)(v199 + 24);
        uint64_t v8 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v8 - 8) + 16))(v198, v197);
        uint64_t v200 = (void *)((char *)a1 + *(int *)(v199 + 28));
        uint64_t v9 = (void *)((char *)a2 + *(int *)(v199 + 28));
        *uint64_t v200 = *v9;
        uint64_t v201 = v9[1];
        swift_bridgeObjectRetain();
        v200[1] = v201;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v10 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v10 - 8) + 16))(a1, a2);
        v192 = (int *)type metadata accessor for SearchItem.Photo();
        uint64_t v186 = (void *)((char *)a1 + v192[5]);
        uint64_t v11 = (void *)((char *)a2 + v192[5]);
        *uint64_t v186 = *v11;
        uint64_t v187 = v11[1];
        swift_bridgeObjectRetain();
        v186[1] = v187;
        uint64_t v188 = (void *)((char *)a1 + v192[6]);
        uint64_t v12 = (void *)((char *)a2 + v192[6]);
        *uint64_t v188 = *v12;
        uint64_t v189 = v12[1];
        swift_bridgeObjectRetain();
        v188[1] = v189;
        uint64_t v190 = v192[7];
        uint64_t v191 = *(void **)((char *)a2 + v190);
        id v13 = v191;
        *(void *)((char *)a1 + v190) = v191;
        uint64_t v193 = v192[8];
        uint64_t v194 = *(void *)((char *)a2 + v193);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v193) = v194;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v14 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v14 - 8) + 16))(a1, a2);
        uint64_t v181 = (int *)type metadata accessor for SearchItem.Location();
        uint64_t v179 = (void *)((char *)a1 + v181[5]);
        uint64_t v15 = (void *)((char *)a2 + v181[5]);
        *uint64_t v179 = *v15;
        uint64_t v180 = v15[1];
        swift_bridgeObjectRetain();
        v179[1] = v180;
        v182 = (void *)((char *)a1 + v181[6]);
        uint64_t v16 = (void *)((char *)a2 + v181[6]);
        void *v182 = *v16;
        uint64_t v183 = v16[1];
        swift_bridgeObjectRetain();
        v182[1] = v183;
        uint64_t v184 = v181[7];
        uint64_t v185 = *(void *)((char *)a2 + v184);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v184) = v185;
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v17 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v17 - 8) + 16))(a1, a2);
        v176 = (int *)type metadata accessor for SearchItem.Document();
        uint64_t v168 = v176[5];
        uint64_t v169 = *(void *)((char *)a2 + v168);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v168) = v169;
        uint64_t v170 = (void *)((char *)a1 + v176[6]);
        uint64_t v18 = (void *)((char *)a2 + v176[6]);
        *uint64_t v170 = *v18;
        uint64_t v171 = v18[1];
        swift_bridgeObjectRetain();
        v170[1] = v171;
        uint64_t v172 = (void *)((char *)a1 + v176[7]);
        uint64_t v19 = (void *)((char *)a2 + v176[7]);
        *uint64_t v172 = *v19;
        uint64_t v173 = v19[1];
        swift_bridgeObjectRetain();
        v172[1] = v173;
        v175 = (char *)a1 + v176[8];
        uint64_t v174 = (char *)a2 + v176[8];
        uint64_t v20 = sub_1DDEECD28();
        (*(void (**)(char *, char *))(*(void *)(v20 - 8) + 16))(v175, v174);
        v177 = (void *)((char *)a1 + v176[9]);
        uint64_t v21 = (void *)((char *)a2 + v176[9]);
        void *v177 = *v21;
        uint64_t v178 = v21[1];
        swift_bridgeObjectRetain();
        v177[1] = v178;
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v22 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v22 - 8) + 16))(a1, a2);
        v167 = (int *)type metadata accessor for SearchItem.LegacySuggested();
        uint64_t v159 = v167[5];
        uint64_t v160 = *(void **)((char *)a2 + v159);
        id v23 = v160;
        *(void *)((char *)a1 + v159) = v160;
        v161 = (void *)((char *)a1 + v167[6]);
        uint64_t v24 = (void *)((char *)a2 + v167[6]);
        void *v161 = *v24;
        uint64_t v162 = v24[1];
        swift_bridgeObjectRetain();
        v161[1] = v162;
        uint64_t v163 = (void *)((char *)a1 + v167[7]);
        uint64_t v25 = (void *)((char *)a2 + v167[7]);
        *uint64_t v163 = *v25;
        uint64_t v164 = v25[1];
        swift_bridgeObjectRetain();
        v163[1] = v164;
        uint64_t v165 = v167[8];
        uint64_t v166 = *(void **)((char *)a2 + v165);
        id v26 = v166;
        *(void *)((char *)a1 + v165) = v166;
        *((unsigned char *)a1 + v167[9]) = *((unsigned char *)a2 + v167[9]);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *a1 = *a2;
        uint64_t v145 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v145;
        a1[2] = a2[2];
        v154 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v147 = (char *)a1 + v154[6];
        uint64_t v146 = (char *)a2 + v154[6];
        uint64_t v27 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v27 - 8) + 16))(v147, v146);
        uint64_t v148 = v154[7];
        uint64_t v149 = *(void **)((char *)a2 + v148);
        id v28 = v149;
        *(void *)((char *)a1 + v148) = v149;
        uint64_t v150 = v154[8];
        uint64_t v151 = *(void **)((char *)a2 + v150);
        id v29 = v151;
        *(void *)((char *)a1 + v150) = v151;
        uint64_t v152 = v154[9];
        uint64_t v153 = *(void **)((char *)a2 + v152);
        id v30 = v153;
        *(void *)((char *)a1 + v152) = v153;
        v155 = (void *)((char *)a1 + v154[10]);
        id v31 = (void *)((char *)a2 + v154[10]);
        void *v155 = *v31;
        uint64_t v156 = v31[1];
        swift_bridgeObjectRetain();
        v155[1] = v156;
        *((unsigned char *)a1 + v154[11]) = *((unsigned char *)a2 + v154[11]);
        uint64_t v157 = (void *)((char *)a1 + v154[12]);
        uint64_t v32 = (void *)((char *)a2 + v154[12]);
        *uint64_t v157 = *v32;
        uint64_t v158 = v32[1];
        swift_bridgeObjectRetain();
        v157[1] = v158;
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *a1 = *a2;
        uint64_t v131 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v131;
        a1[2] = a2[2];
        uint64_t v140 = (int *)type metadata accessor for SearchItem.Generic();
        double v133 = (char *)a1 + v140[6];
        uint64_t v132 = (char *)a2 + v140[6];
        uint64_t v33 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v33 - 8) + 16))(v133, v132);
        uint64_t v134 = v140[7];
        uint64_t v135 = *(void **)((char *)a2 + v134);
        id v34 = v135;
        *(void *)((char *)a1 + v134) = v135;
        uint64_t v136 = v140[8];
        uint64_t v137 = *(void **)((char *)a2 + v136);
        id v35 = v137;
        *(void *)((char *)a1 + v136) = v137;
        uint64_t v138 = v140[9];
        uint64_t v139 = *(void **)((char *)a2 + v138);
        id v36 = v139;
        *(void *)((char *)a1 + v138) = v139;
        uint64_t v141 = (void *)((char *)a1 + v140[10]);
        uint64_t v37 = (void *)((char *)a2 + v140[10]);
        *uint64_t v141 = *v37;
        uint64_t v142 = v37[1];
        swift_bridgeObjectRetain();
        v141[1] = v142;
        *((unsigned char *)a1 + v140[11]) = *((unsigned char *)a2 + v140[11]);
        uint64_t v143 = (void *)((char *)a1 + v140[12]);
        uint64_t v38 = (void *)((char *)a2 + v140[12]);
        *uint64_t v143 = *v38;
        uint64_t v144 = v38[1];
        swift_bridgeObjectRetain();
        v143[1] = v144;
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        uint64_t v39 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v39 - 8) + 16))(a1, a2);
        uint64_t v128 = type metadata accessor for SearchItem.TopHit();
        uint64_t v126 = *(int *)(v128 + 20);
        uint64_t v127 = *(void **)((char *)a2 + v126);
        id v40 = v127;
        *(void *)((char *)a1 + v126) = v127;
        uint64_t v129 = *(int *)(v128 + 24);
        uint64_t v130 = *(void *)((char *)a2 + v129);
        swift_bridgeObjectRetain();
        *(void *)((char *)a1 + v129) = v130;
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v41 = sub_1DDEECE78();
        (*(void (**)(void *, void *))(*(void *)(v41 - 8) + 16))(a1, a2);
        uint64_t v120 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        *(void *)((char *)a1 + v120[5]) = *(void *)((char *)a2 + v120[5]);
        uint64_t v107 = (void *)((char *)a1 + v120[6]);
        uint64_t v42 = (void *)((char *)a2 + v120[6]);
        *uint64_t v107 = *v42;
        uint64_t v108 = v42[1];
        swift_bridgeObjectRetain();
        v107[1] = v108;
        uint64_t v109 = (void *)((char *)a1 + v120[7]);
        uint64_t v43 = (void *)((char *)a2 + v120[7]);
        *uint64_t v109 = *v43;
        uint64_t v110 = v43[1];
        swift_bridgeObjectRetain();
        v109[1] = v110;
        uint64_t v111 = (void *)((char *)a1 + v120[8]);
        uint64_t v44 = (void *)((char *)a2 + v120[8]);
        *uint64_t v111 = *v44;
        uint64_t v112 = v44[1];
        swift_bridgeObjectRetain();
        v111[1] = v112;
        char v114 = (char *)a1 + v120[9];
        uint64_t v113 = (char *)a2 + v120[9];
        uint64_t v116 = sub_1DDEECB08();
        uint64_t v115 = *(void *)(v116 - 8);
        uint64_t v117 = *(void (**)(char *, char *))(v115 + 16);
        v117(v114, v113);
        ((void (*)(char *, char *, uint64_t))v117)((char *)a1 + v120[10], (char *)a2 + v120[10], v116);
        uint64_t v118 = (void *)((char *)a1 + v120[11]);
        uint64_t v45 = (void *)((char *)a2 + v120[11]);
        *uint64_t v118 = *v45;
        uint64_t v119 = v45[1];
        swift_bridgeObjectRetain();
        v118[1] = v119;
        __dst = (char *)a1 + v120[12];
        __src = (char *)a2 + v120[12];
        uint64_t v123 = sub_1DDEECD28();
        uint64_t v124 = *(void *)(v123 - 8);
        uint64_t v125 = *(unsigned int (**)(void))(v124 + 48);
        if (((unsigned int (*)(char *, uint64_t))v125)(__src, 1))
        {
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(__dst, __src, *(void *)(*(void *)(v46 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v124 + 16))(__dst, __src, v123);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v124 + 56))(__dst, 0, 1, v123);
        }
        unint64_t v102 = (char *)a1 + v120[13];
        id v103 = (char *)a2 + v120[13];
        uint64_t v104 = sub_1DDEECEB8();
        uint64_t v105 = *(void *)(v104 - 8);
        uint64_t v106 = *(unsigned int (**)(void))(v105 + 48);
        if (((unsigned int (*)(char *, uint64_t))v106)(v103, 1))
        {
          uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v102, v103, *(void *)(*(void *)(v47 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v102, v103, v104);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v102, 0, 1, v104);
        }
        unint64_t v100 = (char *)a1 + v120[14];
        id v101 = (char *)a2 + v120[14];
        if (v106())
        {
          uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v100, v101, *(void *)(*(void *)(v48 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v100, v101, v104);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v100, 0, 1, v104);
        }
        unint64_t v98 = (char *)a1 + v120[15];
        uint64_t v99 = (char *)a2 + v120[15];
        if (v125())
        {
          uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(v98, v99, *(void *)(*(void *)(v49 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v124 + 16))(v98, v99, v123);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v124 + 56))(v98, 0, 1, v123);
        }
        uint64_t v88 = (void *)((char *)a1 + v120[16]);
        uint64_t v50 = (void *)((char *)a2 + v120[16]);
        *uint64_t v88 = *v50;
        uint64_t v89 = v50[1];
        swift_bridgeObjectRetain();
        v88[1] = v89;
        uint64_t v90 = (void *)((char *)a1 + v120[17]);
        uint64_t v51 = (void *)((char *)a2 + v120[17]);
        *uint64_t v90 = *v51;
        uint64_t v91 = v51[1];
        swift_bridgeObjectRetain();
        v90[1] = v91;
        uint64_t v92 = (void *)((char *)a1 + v120[18]);
        uint64_t v52 = (void *)((char *)a2 + v120[18]);
        void *v92 = *v52;
        uint64_t v93 = v52[1];
        swift_bridgeObjectRetain();
        v92[1] = v93;
        uint64_t v94 = (void *)((char *)a1 + v120[19]);
        uint64_t v53 = (void *)((char *)a2 + v120[19]);
        *uint64_t v94 = *v53;
        uint64_t v95 = v53[1];
        swift_bridgeObjectRetain();
        v94[1] = v95;
        ((void (*)(char *, char *, uint64_t))v117)((char *)a1 + v120[20], (char *)a2 + v120[20], v116);
        uint64_t v96 = (char *)a1 + v120[21];
        uint64_t v97 = (char *)a2 + v120[21];
        if ((*(unsigned int (**)(void))(v115 + 48))())
        {
          uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
          memcpy(v96, v97, *(void *)(*(void *)(v54 - 8) + 64));
        }
        else
        {
          ((void (*)(char *, char *, uint64_t))v117)(v96, v97, v116);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v115 + 56))(v96, 0, 1, v116);
        }
        uint64_t v86 = (char *)a1 + v120[22];
        uint64_t v87 = (char *)a2 + v120[22];
        if (v106())
        {
          uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v86, v87, *(void *)(*(void *)(v55 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v86, v87, v104);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v105 + 56))(v86, 0, 1, v104);
        }
        uint64_t v78 = (void *)((char *)a1 + v120[23]);
        uint64_t v56 = (void *)((char *)a2 + v120[23]);
        *uint64_t v78 = *v56;
        uint64_t v79 = v56[1];
        swift_bridgeObjectRetain();
        v78[1] = v79;
        uint64_t v80 = (void *)((char *)a1 + v120[24]);
        uint64_t v57 = (void *)((char *)a2 + v120[24]);
        *uint64_t v80 = *v57;
        uint64_t v81 = v57[1];
        swift_bridgeObjectRetain();
        v80[1] = v81;
        uint64_t v82 = (void *)((char *)a1 + v120[25]);
        uint64_t v58 = (void *)((char *)a2 + v120[25]);
        void *v82 = *v58;
        uint64_t v83 = v58[1];
        swift_bridgeObjectRetain();
        v82[1] = v83;
        uint64_t v84 = (void *)((char *)a1 + v120[26]);
        uint64_t v59 = (void *)((char *)a2 + v120[26]);
        *uint64_t v84 = *v59;
        uint64_t v85 = v59[1];
        swift_bridgeObjectRetain();
        v84[1] = v85;
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v66 = *a2;
        swift_bridgeObjectRetain();
        *a1 = v66;
        uint64_t v73 = (int *)type metadata accessor for SearchItem.Link();
        uint64_t v68 = (char *)a1 + v73[5];
        uint64_t v67 = (char *)a2 + v73[5];
        uint64_t v60 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v60 - 8) + 16))(v68, v67);
        uint64_t v70 = (char *)a1 + v73[6];
        uint64_t v69 = (char *)a2 + v73[6];
        uint64_t v61 = sub_1DDEECD28();
        (*(void (**)(char *, char *))(*(void *)(v61 - 8) + 16))(v70, v69);
        uint64_t v71 = (void *)((char *)a1 + v73[7]);
        uint64_t v62 = (void *)((char *)a2 + v73[7]);
        void *v71 = *v62;
        uint64_t v72 = v62[1];
        swift_bridgeObjectRetain();
        v71[1] = v72;
        uint64_t v74 = (void *)((char *)a1 + v73[8]);
        uint64_t v63 = (void *)((char *)a2 + v73[8]);
        void *v74 = *v63;
        uint64_t v75 = v63[1];
        swift_bridgeObjectRetain();
        v74[1] = v75;
        uint64_t v76 = (void *)((char *)a1 + v73[9]);
        uint64_t v64 = (void *)((char *)a2 + v73[9]);
        *uint64_t v76 = *v64;
        uint64_t v77 = v64[1];
        swift_bridgeObjectRetain();
        v76[1] = v77;
        swift_storeEnumTagMultiPayload();
        break;
      default:
        *a1 = *a2;
        uint64_t v202 = a2[1];
        swift_bridgeObjectRetain();
        a1[1] = v202;
        a1[2] = a2[2];
        v211 = (int *)type metadata accessor for SearchItem.Generic();
        v204 = (char *)a1 + v211[6];
        uint64_t v203 = (char *)a2 + v211[6];
        uint64_t v2 = sub_1DDEECE78();
        (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(v204, v203);
        uint64_t v205 = v211[7];
        uint64_t v206 = *(void **)((char *)a2 + v205);
        id v3 = v206;
        *(void *)((char *)a1 + v205) = v206;
        uint64_t v207 = v211[8];
        uint64_t v208 = *(void **)((char *)a2 + v207);
        id v4 = v208;
        *(void *)((char *)a1 + v207) = v208;
        uint64_t v209 = v211[9];
        uint64_t v210 = *(void **)((char *)a2 + v209);
        id v5 = v210;
        *(void *)((char *)a1 + v209) = v210;
        v212 = (void *)((char *)a1 + v211[10]);
        uint64_t v6 = (void *)((char *)a2 + v211[10]);
        void *v212 = *v6;
        uint64_t v213 = v6[1];
        swift_bridgeObjectRetain();
        v212[1] = v213;
        *((unsigned char *)a1 + v211[11]) = *((unsigned char *)a2 + v211[11]);
        uint64_t v214 = (void *)((char *)a1 + v211[12]);
        uint64_t v7 = (void *)((char *)a2 + v211[12]);
        *uint64_t v214 = *v7;
        uint64_t v215 = v7[1];
        swift_bridgeObjectRetain();
        v214[1] = v215;
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t initializeWithTake for SearchItem(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v66 = type metadata accessor for SearchItem.Contact();
      uint64_t v65 = a1 + *(int *)(v66 + 24);
      uint64_t v64 = a2 + *(int *)(v66 + 24);
      uint64_t v3 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(v65, v64);
      *(_OWORD *)(a1 + *(int *)(v66 + 28)) = *(_OWORD *)(a2 + *(int *)(v66 + 28));
      swift_storeEnumTagMultiPayload();
      break;
    case 2u:
      uint64_t v4 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
      uint64_t v63 = (int *)type metadata accessor for SearchItem.Photo();
      *(_OWORD *)(a1 + v63[5]) = *(_OWORD *)(a2 + v63[5]);
      *(_OWORD *)(a1 + v63[6]) = *(_OWORD *)(a2 + v63[6]);
      *(void *)(a1 + v63[7]) = *(void *)(a2 + v63[7]);
      *(void *)(a1 + v63[8]) = *(void *)(a2 + v63[8]);
      swift_storeEnumTagMultiPayload();
      break;
    case 3u:
      uint64_t v5 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2);
      uint64_t v6 = (int *)type metadata accessor for SearchItem.Location();
      *(_OWORD *)(a1 + v6[5]) = *(_OWORD *)(a2 + v6[5]);
      *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
      *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
      swift_storeEnumTagMultiPayload();
      break;
    case 4u:
      uint64_t v7 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2);
      uint64_t v62 = (int *)type metadata accessor for SearchItem.Document();
      *(void *)(a1 + v62[5]) = *(void *)(a2 + v62[5]);
      *(_OWORD *)(a1 + v62[6]) = *(_OWORD *)(a2 + v62[6]);
      *(_OWORD *)(a1 + v62[7]) = *(_OWORD *)(a2 + v62[7]);
      uint64_t v61 = a1 + v62[8];
      uint64_t v60 = a2 + v62[8];
      uint64_t v8 = sub_1DDEECD28();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v61, v60);
      *(_OWORD *)(a1 + v62[9]) = *(_OWORD *)(a2 + v62[9]);
      swift_storeEnumTagMultiPayload();
      break;
    case 5u:
      uint64_t v9 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2);
      uint64_t v59 = (int *)type metadata accessor for SearchItem.LegacySuggested();
      *(void *)(a1 + v59[5]) = *(void *)(a2 + v59[5]);
      *(_OWORD *)(a1 + v59[6]) = *(_OWORD *)(a2 + v59[6]);
      *(_OWORD *)(a1 + v59[7]) = *(_OWORD *)(a2 + v59[7]);
      *(void *)(a1 + v59[8]) = *(void *)(a2 + v59[8]);
      *(unsigned char *)(a1 + v59[9]) = *(unsigned char *)(a2 + v59[9]);
      swift_storeEnumTagMultiPayload();
      break;
    case 6u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v58 = (int *)type metadata accessor for SearchItem.Generic();
      uint64_t v57 = a1 + v58[6];
      uint64_t v56 = a2 + v58[6];
      uint64_t v10 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v57, v56);
      *(void *)(a1 + v58[7]) = *(void *)(a2 + v58[7]);
      *(void *)(a1 + v58[8]) = *(void *)(a2 + v58[8]);
      *(void *)(a1 + v58[9]) = *(void *)(a2 + v58[9]);
      *(_OWORD *)(a1 + v58[10]) = *(_OWORD *)(a2 + v58[10]);
      *(unsigned char *)(a1 + v58[11]) = *(unsigned char *)(a2 + v58[11]);
      *(_OWORD *)(a1 + v58[12]) = *(_OWORD *)(a2 + v58[12]);
      swift_storeEnumTagMultiPayload();
      break;
    case 7u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v55 = (int *)type metadata accessor for SearchItem.Generic();
      uint64_t v54 = a1 + v55[6];
      uint64_t v53 = a2 + v55[6];
      uint64_t v11 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v54, v53);
      *(void *)(a1 + v55[7]) = *(void *)(a2 + v55[7]);
      *(void *)(a1 + v55[8]) = *(void *)(a2 + v55[8]);
      *(void *)(a1 + v55[9]) = *(void *)(a2 + v55[9]);
      *(_OWORD *)(a1 + v55[10]) = *(_OWORD *)(a2 + v55[10]);
      *(unsigned char *)(a1 + v55[11]) = *(unsigned char *)(a2 + v55[11]);
      *(_OWORD *)(a1 + v55[12]) = *(_OWORD *)(a2 + v55[12]);
      swift_storeEnumTagMultiPayload();
      break;
    case 8u:
      uint64_t v12 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2);
      uint64_t v13 = type metadata accessor for SearchItem.TopHit();
      *(void *)(a1 + *(int *)(v13 + 20)) = *(void *)(a2 + *(int *)(v13 + 20));
      *(void *)(a1 + *(int *)(v13 + 24)) = *(void *)(a2 + *(int *)(v13 + 24));
      swift_storeEnumTagMultiPayload();
      break;
    case 9u:
      uint64_t v14 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2);
      uint64_t v47 = (int *)type metadata accessor for SearchItem.InstantAnswer();
      *(void *)(a1 + v47[5]) = *(void *)(a2 + v47[5]);
      *(_OWORD *)(a1 + v47[6]) = *(_OWORD *)(a2 + v47[6]);
      *(_OWORD *)(a1 + v47[7]) = *(_OWORD *)(a2 + v47[7]);
      *(_OWORD *)(a1 + v47[8]) = *(_OWORD *)(a2 + v47[8]);
      uint64_t v43 = a1 + v47[9];
      uint64_t v42 = a2 + v47[9];
      uint64_t v45 = sub_1DDEECB08();
      uint64_t v44 = *(void *)(v45 - 8);
      uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v44 + 32);
      v46(v43, v42);
      ((void (*)(uint64_t, uint64_t, uint64_t))v46)(a1 + v47[10], a2 + v47[10], v45);
      *(_OWORD *)(a1 + v47[11]) = *(_OWORD *)(a2 + v47[11]);
      __dst = (void *)(a1 + v47[12]);
      __src = (void *)(a2 + v47[12]);
      uint64_t v50 = sub_1DDEECD28();
      uint64_t v51 = *(void *)(v50 - 8);
      uint64_t v52 = *(unsigned int (**)(void))(v51 + 48);
      if (((unsigned int (*)(void *, uint64_t))v52)(__src, 1))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
        memcpy(__dst, __src, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v51 + 32))(__dst, __src, v50);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(__dst, 0, 1, v50);
      }
      uint64_t v37 = (void *)(a1 + v47[13]);
      uint64_t v38 = (void *)(a2 + v47[13]);
      uint64_t v39 = sub_1DDEECEB8();
      uint64_t v40 = *(void *)(v39 - 8);
      uint64_t v41 = *(unsigned int (**)(void))(v40 + 48);
      if (((unsigned int (*)(void *, uint64_t))v41)(v38, 1))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v37, v38, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v37, v38, v39);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
      }
      id v35 = (void *)(a1 + v47[14]);
      id v36 = (void *)(a2 + v47[14]);
      if (v41())
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v35, v36, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v35, v36, v39);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v35, 0, 1, v39);
      }
      uint64_t v33 = (void *)(a1 + v47[15]);
      id v34 = (void *)(a2 + v47[15]);
      if (v52())
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
        memcpy(v33, v34, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v51 + 32))(v33, v34, v50);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(v33, 0, 1, v50);
      }
      *(_OWORD *)(a1 + v47[16]) = *(_OWORD *)(a2 + v47[16]);
      *(_OWORD *)(a1 + v47[17]) = *(_OWORD *)(a2 + v47[17]);
      *(_OWORD *)(a1 + v47[18]) = *(_OWORD *)(a2 + v47[18]);
      *(_OWORD *)(a1 + v47[19]) = *(_OWORD *)(a2 + v47[19]);
      ((void (*)(uint64_t, uint64_t, uint64_t))v46)(a1 + v47[20], a2 + v47[20], v45);
      id v31 = (void *)(a1 + v47[21]);
      uint64_t v32 = (void *)(a2 + v47[21]);
      if ((*(unsigned int (**)(void))(v44 + 48))())
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
        memcpy(v31, v32, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        ((void (*)(void *, void *, uint64_t))v46)(v31, v32, v45);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(v31, 0, 1, v45);
      }
      id v29 = (void *)(a1 + v47[22]);
      id v30 = (void *)(a2 + v47[22]);
      if (v41())
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
        memcpy(v29, v30, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v29, v30, v39);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v29, 0, 1, v39);
      }
      *(_OWORD *)(a1 + v47[23]) = *(_OWORD *)(a2 + v47[23]);
      *(_OWORD *)(a1 + v47[24]) = *(_OWORD *)(a2 + v47[24]);
      *(_OWORD *)(a1 + v47[25]) = *(_OWORD *)(a2 + v47[25]);
      *(_OWORD *)(a1 + v47[26]) = *(_OWORD *)(a2 + v47[26]);
      swift_storeEnumTagMultiPayload();
      break;
    case 0xAu:
      *(void *)a1 = *(void *)a2;
      id v28 = (int *)type metadata accessor for SearchItem.Link();
      uint64_t v25 = a1 + v28[5];
      uint64_t v24 = a2 + v28[5];
      uint64_t v21 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v25, v24);
      uint64_t v27 = a1 + v28[6];
      uint64_t v26 = a2 + v28[6];
      uint64_t v22 = sub_1DDEECD28();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v27, v26);
      *(_OWORD *)(a1 + v28[7]) = *(_OWORD *)(a2 + v28[7]);
      *(_OWORD *)(a1 + v28[8]) = *(_OWORD *)(a2 + v28[8]);
      *(_OWORD *)(a1 + v28[9]) = *(_OWORD *)(a2 + v28[9]);
      swift_storeEnumTagMultiPayload();
      break;
    default:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v69 = (int *)type metadata accessor for SearchItem.Generic();
      uint64_t v68 = a1 + v69[6];
      uint64_t v67 = a2 + v69[6];
      uint64_t v2 = sub_1DDEECE78();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(v68, v67);
      *(void *)(a1 + v69[7]) = *(void *)(a2 + v69[7]);
      *(void *)(a1 + v69[8]) = *(void *)(a2 + v69[8]);
      *(void *)(a1 + v69[9]) = *(void *)(a2 + v69[9]);
      *(_OWORD *)(a1 + v69[10]) = *(_OWORD *)(a2 + v69[10]);
      *(unsigned char *)(a1 + v69[11]) = *(unsigned char *)(a2 + v69[11]);
      *(_OWORD *)(a1 + v69[12]) = *(_OWORD *)(a2 + v69[12]);
      swift_storeEnumTagMultiPayload();
      break;
  }
  return a1;
}

uint64_t assignWithTake for SearchItem(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_1DDDCB5D8(a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v66 = type metadata accessor for SearchItem.Contact();
        uint64_t v65 = a1 + *(int *)(v66 + 24);
        uint64_t v64 = a2 + *(int *)(v66 + 24);
        uint64_t v3 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(v65, v64);
        *(_OWORD *)(a1 + *(int *)(v66 + 28)) = *(_OWORD *)(a2 + *(int *)(v66 + 28));
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        uint64_t v4 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2);
        uint64_t v63 = (int *)type metadata accessor for SearchItem.Photo();
        *(_OWORD *)(a1 + v63[5]) = *(_OWORD *)(a2 + v63[5]);
        *(_OWORD *)(a1 + v63[6]) = *(_OWORD *)(a2 + v63[6]);
        *(void *)(a1 + v63[7]) = *(void *)(a2 + v63[7]);
        *(void *)(a1 + v63[8]) = *(void *)(a2 + v63[8]);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v5 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2);
        uint64_t v6 = (int *)type metadata accessor for SearchItem.Location();
        *(_OWORD *)(a1 + v6[5]) = *(_OWORD *)(a2 + v6[5]);
        *(_OWORD *)(a1 + v6[6]) = *(_OWORD *)(a2 + v6[6]);
        *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        uint64_t v7 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2);
        uint64_t v62 = (int *)type metadata accessor for SearchItem.Document();
        *(void *)(a1 + v62[5]) = *(void *)(a2 + v62[5]);
        *(_OWORD *)(a1 + v62[6]) = *(_OWORD *)(a2 + v62[6]);
        *(_OWORD *)(a1 + v62[7]) = *(_OWORD *)(a2 + v62[7]);
        uint64_t v61 = a1 + v62[8];
        uint64_t v60 = a2 + v62[8];
        uint64_t v8 = sub_1DDEECD28();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v61, v60);
        *(_OWORD *)(a1 + v62[9]) = *(_OWORD *)(a2 + v62[9]);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v9 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2);
        uint64_t v59 = (int *)type metadata accessor for SearchItem.LegacySuggested();
        *(void *)(a1 + v59[5]) = *(void *)(a2 + v59[5]);
        *(_OWORD *)(a1 + v59[6]) = *(_OWORD *)(a2 + v59[6]);
        *(_OWORD *)(a1 + v59[7]) = *(_OWORD *)(a2 + v59[7]);
        *(void *)(a1 + v59[8]) = *(void *)(a2 + v59[8]);
        *(unsigned char *)(a1 + v59[9]) = *(unsigned char *)(a2 + v59[9]);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v58 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v57 = a1 + v58[6];
        uint64_t v56 = a2 + v58[6];
        uint64_t v10 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v57, v56);
        *(void *)(a1 + v58[7]) = *(void *)(a2 + v58[7]);
        *(void *)(a1 + v58[8]) = *(void *)(a2 + v58[8]);
        *(void *)(a1 + v58[9]) = *(void *)(a2 + v58[9]);
        *(_OWORD *)(a1 + v58[10]) = *(_OWORD *)(a2 + v58[10]);
        *(unsigned char *)(a1 + v58[11]) = *(unsigned char *)(a2 + v58[11]);
        *(_OWORD *)(a1 + v58[12]) = *(_OWORD *)(a2 + v58[12]);
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v55 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v54 = a1 + v55[6];
        uint64_t v53 = a2 + v55[6];
        uint64_t v11 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v54, v53);
        *(void *)(a1 + v55[7]) = *(void *)(a2 + v55[7]);
        *(void *)(a1 + v55[8]) = *(void *)(a2 + v55[8]);
        *(void *)(a1 + v55[9]) = *(void *)(a2 + v55[9]);
        *(_OWORD *)(a1 + v55[10]) = *(_OWORD *)(a2 + v55[10]);
        *(unsigned char *)(a1 + v55[11]) = *(unsigned char *)(a2 + v55[11]);
        *(_OWORD *)(a1 + v55[12]) = *(_OWORD *)(a2 + v55[12]);
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        uint64_t v12 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2);
        uint64_t v13 = type metadata accessor for SearchItem.TopHit();
        *(void *)(a1 + *(int *)(v13 + 20)) = *(void *)(a2 + *(int *)(v13 + 20));
        *(void *)(a1 + *(int *)(v13 + 24)) = *(void *)(a2 + *(int *)(v13 + 24));
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        uint64_t v14 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(a1, a2);
        uint64_t v47 = (int *)type metadata accessor for SearchItem.InstantAnswer();
        *(void *)(a1 + v47[5]) = *(void *)(a2 + v47[5]);
        *(_OWORD *)(a1 + v47[6]) = *(_OWORD *)(a2 + v47[6]);
        *(_OWORD *)(a1 + v47[7]) = *(_OWORD *)(a2 + v47[7]);
        *(_OWORD *)(a1 + v47[8]) = *(_OWORD *)(a2 + v47[8]);
        uint64_t v43 = a1 + v47[9];
        uint64_t v42 = a2 + v47[9];
        uint64_t v45 = sub_1DDEECB08();
        uint64_t v44 = *(void *)(v45 - 8);
        uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v44 + 32);
        v46(v43, v42);
        ((void (*)(uint64_t, uint64_t, uint64_t))v46)(a1 + v47[10], a2 + v47[10], v45);
        *(_OWORD *)(a1 + v47[11]) = *(_OWORD *)(a2 + v47[11]);
        __dst = (void *)(a1 + v47[12]);
        __src = (void *)(a2 + v47[12]);
        uint64_t v50 = sub_1DDEECD28();
        uint64_t v51 = *(void *)(v50 - 8);
        uint64_t v52 = *(unsigned int (**)(void))(v51 + 48);
        if (((unsigned int (*)(void *, uint64_t))v52)(__src, 1))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(__dst, __src, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v51 + 32))(__dst, __src, v50);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(__dst, 0, 1, v50);
        }
        uint64_t v37 = (void *)(a1 + v47[13]);
        uint64_t v38 = (void *)(a2 + v47[13]);
        uint64_t v39 = sub_1DDEECEB8();
        uint64_t v40 = *(void *)(v39 - 8);
        uint64_t v41 = *(unsigned int (**)(void))(v40 + 48);
        if (((unsigned int (*)(void *, uint64_t))v41)(v38, 1))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v37, v38, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v37, v38, v39);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
        }
        id v35 = (void *)(a1 + v47[14]);
        id v36 = (void *)(a2 + v47[14]);
        if (v41())
        {
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v35, v36, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v35, v36, v39);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v35, 0, 1, v39);
        }
        uint64_t v33 = (void *)(a1 + v47[15]);
        id v34 = (void *)(a2 + v47[15]);
        if (v52())
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2380);
          memcpy(v33, v34, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v51 + 32))(v33, v34, v50);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v51 + 56))(v33, 0, 1, v50);
        }
        *(_OWORD *)(a1 + v47[16]) = *(_OWORD *)(a2 + v47[16]);
        *(_OWORD *)(a1 + v47[17]) = *(_OWORD *)(a2 + v47[17]);
        *(_OWORD *)(a1 + v47[18]) = *(_OWORD *)(a2 + v47[18]);
        *(_OWORD *)(a1 + v47[19]) = *(_OWORD *)(a2 + v47[19]);
        ((void (*)(uint64_t, uint64_t, uint64_t))v46)(a1 + v47[20], a2 + v47[20], v45);
        id v31 = (void *)(a1 + v47[21]);
        uint64_t v32 = (void *)(a2 + v47[21]);
        if ((*(unsigned int (**)(void))(v44 + 48))())
        {
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C78);
          memcpy(v31, v32, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          ((void (*)(void *, void *, uint64_t))v46)(v31, v32, v45);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(v31, 0, 1, v45);
        }
        id v29 = (void *)(a1 + v47[22]);
        id v30 = (void *)(a2 + v47[22]);
        if (v41())
        {
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB95C70);
          memcpy(v29, v30, *(void *)(*(void *)(v20 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v29, v30, v39);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v29, 0, 1, v39);
        }
        *(_OWORD *)(a1 + v47[23]) = *(_OWORD *)(a2 + v47[23]);
        *(_OWORD *)(a1 + v47[24]) = *(_OWORD *)(a2 + v47[24]);
        *(_OWORD *)(a1 + v47[25]) = *(_OWORD *)(a2 + v47[25]);
        *(_OWORD *)(a1 + v47[26]) = *(_OWORD *)(a2 + v47[26]);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        *(void *)a1 = *(void *)a2;
        id v28 = (int *)type metadata accessor for SearchItem.Link();
        uint64_t v25 = a1 + v28[5];
        uint64_t v24 = a2 + v28[5];
        uint64_t v21 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v25, v24);
        uint64_t v27 = a1 + v28[6];
        uint64_t v26 = a2 + v28[6];
        uint64_t v22 = sub_1DDEECD28();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 32))(v27, v26);
        *(_OWORD *)(a1 + v28[7]) = *(_OWORD *)(a2 + v28[7]);
        *(_OWORD *)(a1 + v28[8]) = *(_OWORD *)(a2 + v28[8]);
        *(_OWORD *)(a1 + v28[9]) = *(_OWORD *)(a2 + v28[9]);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v69 = (int *)type metadata accessor for SearchItem.Generic();
        uint64_t v68 = a1 + v69[6];
        uint64_t v67 = a2 + v69[6];
        uint64_t v2 = sub_1DDEECE78();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(v68, v67);
        *(void *)(a1 + v69[7]) = *(void *)(a2 + v69[7]);
        *(void *)(a1 + v69[8]) = *(void *)(a2 + v69[8]);
        *(void *)(a1 + v69[9]) = *(void *)(a2 + v69[9]);
        *(_OWORD *)(a1 + v69[10]) = *(_OWORD *)(a2 + v69[10]);
        *(unsigned char *)(a1 + v69[11]) = *(unsigned char *)(a2 + v69[11]);
        *(_OWORD *)(a1 + v69[12]) = *(_OWORD *)(a2 + v69[12]);
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t sub_1DDED37A8()
{
  uint64_t v10 = type metadata accessor for SearchItem.Generic();
  if (v0 <= 0x3F)
  {
    uint64_t v10 = type metadata accessor for SearchItem.Contact();
    if (v1 <= 0x3F)
    {
      uint64_t v10 = type metadata accessor for SearchItem.Photo();
      if (v2 <= 0x3F)
      {
        uint64_t v10 = type metadata accessor for SearchItem.Location();
        if (v3 <= 0x3F)
        {
          uint64_t v10 = type metadata accessor for SearchItem.Document();
          if (v4 <= 0x3F)
          {
            uint64_t v10 = type metadata accessor for SearchItem.LegacySuggested();
            if (v5 <= 0x3F)
            {
              uint64_t v10 = type metadata accessor for SearchItem.TopHit();
              if (v6 <= 0x3F)
              {
                uint64_t v10 = type metadata accessor for SearchItem.InstantAnswer();
                if (v7 <= 0x3F)
                {
                  uint64_t v10 = type metadata accessor for SearchItem.Link();
                  if (v8 <= 0x3F)
                  {
                    swift_initEnumMetadataMultiPayload();
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

id sub_1DDED3B94()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  return v0;
}

double sub_1DDED3BD4()
{
  qword_1EBEA2D38 = 12.0;
  double result = 16.0;
  qword_1EBEA2D40 = 16.0;
  qword_1EBEA2D48 = 6.0;
  qword_1EBEA2D50 = 16.0;
  return result;
}

uint64_t *sub_1DDED3C00()
{
  if (qword_1EBEA2D60 != -1) {
    swift_once();
  }
  return &qword_1EBEA2D38;
}

void *sub_1DDED3C64()
{
  return &unk_1DDF0BE50;
}

void *sub_1DDED3C70()
{
  return &unk_1DDF0BE58;
}

void *sub_1DDED3C7C()
{
  return &unk_1DDF0BE60;
}

uint64_t sub_1DDED3C88(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
  }
  return 4;
}

uint64_t sub_1DDED3D44(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = 1;
      break;
    case 2:
      uint64_t v2 = 2;
      break;
    case 3:
      uint64_t v2 = 3;
      break;
    default:
      uint64_t v2 = 0;
      break;
  }
  return v2;
}

uint64_t sub_1DDED3DD0()
{
  return sub_1DDEEF9C8() & 1;
}

unint64_t sub_1DDED3E1C()
{
  uint64_t v2 = qword_1EAB97AB0;
  if (!qword_1EAB97AB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97AB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDED3E9C()
{
  return sub_1DDEEED68();
}

uint64_t sub_1DDED3EDC()
{
  return sub_1DDEEED88();
}

uint64_t sub_1DDED3F24()
{
  return sub_1DDEEED78();
}

uint64_t sub_1DDED3F6C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1DDED3C88(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1DDED3F9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DDED3D44(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1DDED3FCC()
{
  uint64_t v10 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus;
  uint64_t v11 = (void *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  if (*v11)
  {
    id v5 = *(id *)(v9 + v10);
    id v1 = v5;
    swift_endAccess();
    objc_msgSend(v5, sel_progress);
    float v6 = v2;

    float v7 = v6;
    char v8 = 0;
  }
  else
  {
    swift_endAccess();
    float v7 = 0.0;
    char v8 = 1;
  }
  if (v8) {
    float v12 = 0.0;
  }
  else {
    float v12 = v7;
  }
  float v4 = v12 * 100.0;
  if ((COERCE_UNSIGNED_INT(v12 * 100.0) >> 23) == 255)
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  if (v4 <= -9.2234e18)
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  if (v4 >= 9.2234e18)
  {
    sub_1DDEEF7D8();
    __break(1u);
  }
  return sub_1DDEEEC98();
}

uint64_t sub_1DDED4298()
{
  uint64_t v9 = (id *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  id v10 = *v9;
  id v1 = *v9;
  swift_endAccess();
  if (!v10) {
    return 3;
  }
  unsigned __int8 v2 = objc_msgSend(v10, sel_isVisible);
  if ((v2 & 1) == 0)
  {

    return 3;
  }
  id v8 = objc_msgSend(v10, sel_messagesInLargestRemoteAccount);
  if ((uint64_t)v8 < 0 || (unint64_t)v8 < 0x186A0)
  {

    return 0;
  }
  else
  {
    id v5 = objc_msgSend(v10, sel_messagesInLargestRemoteAccount);
    BOOL v4 = (uint64_t)v5 < 0 || (unint64_t)v5 < 0x7A120;

    if (v4) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void sub_1DDED444C()
{
  id v4 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel);
  id v1 = v4;
  sub_1DDEEEC08();
  id v3 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, (SEL)0x1F6A7A518, v3);

  float v6 = *(void **)(v0 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel);
  id v2 = v6;
  sub_1DDEEEC08();
  id v5 = (void *)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, (SEL)0x1F6A7A518, v5);
}

uint64_t sub_1DDED4550()
{
  sub_1DDEEEC08();
  uint64_t v55 = v0;
  sub_1DDEEEC08();
  uint64_t v56 = v1;
  sub_1DDEEEC08();
  uint64_t v57 = v2;
  switch(sub_1DDED4298())
  {
    case 1u:
    case 2u:
      id v31 = *(id *)(v54 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel);
      id v7 = v31;
      sub_1DDEEEC08();
      id v29 = sub_1DDED3B94();
      sub_1DDD3D11C();
      sub_1DDEECB98();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      id v30 = (id)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_setText_, v30, v55);

      id v32 = *(id *)(v54 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel);
      id v8 = v32;
      id v33 = (id)MobileGestalt_get_current_device();
      if (v33)
      {
        id v28 = v33;
      }
      else
      {
        sub_1DDEEF7D8();
        __break(1u);
      }
      char wapiCapability = MobileGestalt_get_wapiCapability();

      if (wapiCapability)
      {
        id v24 = self;
        sub_1DDEEEC08();
        id v25 = (id)sub_1DDEEEB58();
        swift_bridgeObjectRelease();
        id v26 = objc_msgSend(v24, sel_modelSpecificLocalizedStringKeyForKey_, v25);

        if (v26)
        {
          sub_1DDEEEB78();
          uint64_t v22 = v9;

          uint64_t v23 = v22;
        }
        else
        {
          uint64_t v23 = 0;
        }
        if (!v23)
        {
          sub_1DDEEF7D8();
          __break(1u);
        }
        id v21 = sub_1DDED3B94();
        sub_1DDD3D11C();
        uint64_t v13 = v56;
        sub_1DDEECB98();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
      else
      {
        id v18 = self;
        sub_1DDEEEC08();
        id v19 = (id)sub_1DDEEEB58();
        swift_bridgeObjectRelease();
        id v20 = objc_msgSend(v18, sel_modelSpecificLocalizedStringKeyForKey_, v19);

        if (v20)
        {
          sub_1DDEEEB78();
          uint64_t v16 = v10;

          uint64_t v17 = v16;
        }
        else
        {
          uint64_t v17 = 0;
        }
        if (!v17)
        {
          sub_1DDEEF7D8();
          __break(1u);
        }
        id v15 = sub_1DDED3B94();
        sub_1DDD3D11C();
        uint64_t v13 = v57;
        sub_1DDEECB98();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
      id v14 = (id)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      objc_msgSend(v32, sel_setText_, v14, v13);

      break;
    case 3u:
      sub_1DDED444C();
      break;
    default:
      uint64_t v51 = *(void **)(v54 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel);
      id v3 = v51;
      sub_1DDEEEC08();
      id v49 = sub_1DDED3B94();
      sub_1DDD3D11C();
      sub_1DDEECB98();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v50 = (void *)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      objc_msgSend(v51, sel_setText_, v50, v55);

      uint64_t v52 = *(void **)(v54 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel);
      id v4 = v52;
      id v53 = (id)MobileGestalt_get_current_device();
      if (v53)
      {
        uint64_t v48 = v53;
      }
      else
      {
        sub_1DDEEF7D8();
        __break(1u);
      }
      char v47 = MobileGestalt_get_wapiCapability();

      if (v47)
      {
        id v44 = self;
        sub_1DDEEEC08();
        id v45 = (id)sub_1DDEEEB58();
        swift_bridgeObjectRelease();
        id v46 = objc_msgSend(v44, sel_modelSpecificLocalizedStringKeyForKey_, v45);

        if (v46)
        {
          sub_1DDEEEB78();
          uint64_t v42 = v5;

          uint64_t v43 = v42;
        }
        else
        {
          uint64_t v43 = 0;
        }
        if (!v43)
        {
          sub_1DDEEF7D8();
          __break(1u);
        }
        id v41 = sub_1DDED3B94();
        sub_1DDD3D11C();
        uint64_t v12 = v56;
        sub_1DDEECB98();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
      else
      {
        id v38 = self;
        sub_1DDEEEC08();
        id v39 = (id)sub_1DDEEEB58();
        swift_bridgeObjectRelease();
        id v40 = objc_msgSend(v38, sel_modelSpecificLocalizedStringKeyForKey_, v39);

        if (v40)
        {
          sub_1DDEEEB78();
          uint64_t v36 = v6;

          uint64_t v37 = v36;
        }
        else
        {
          uint64_t v37 = 0;
        }
        if (!v37)
        {
          sub_1DDEEF7D8();
          __break(1u);
        }
        id v35 = sub_1DDED3B94();
        sub_1DDD3D11C();
        uint64_t v12 = v57;
        sub_1DDEECB98();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
      }
      id v34 = (id)sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      objc_msgSend(v52, sel_setText_, v34, v12);

      break;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDED51FC(void *a1)
{
  id v2 = a1;
  uint64_t v5 = (void **)(v1 + OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus);
  swift_beginAccess();
  id v3 = *v5;
  void *v5 = a1;

  swift_endAccess();
  return sub_1DDED4550();
}

id sub_1DDED52D0(double a1, double a2, double a3, double a4)
{
  *(double *)&long long v17 = a1;
  *((double *)&v17 + 1) = a2;
  *(double *)&long long v18 = a3;
  *((double *)&v18 + 1) = a4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  long long v21 = v17;
  long long v22 = v18;
  id v5 = v4;
  id v6 = v4;
  id v7 = v4;
  id v8 = v4;
  id v23 = v4;
  uint64_t v12 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView;
  sub_1DDD573B8();
  *(void *)&v15[v12] = sub_1DDD3CB38();

  uint64_t v13 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel;
  sub_1DDD57350();
  *(void *)&v15[v13] = sub_1DDD3CB38();

  uint64_t v14 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel;
  *(void *)&v15[v14] = sub_1DDD3CB38();

  *(void *)&v15[OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus] = 0;
  v20.receiver = v23;
  v20.super_class = ObjectType;
  id v19 = objc_msgSendSuper2(&v20, sel_initWithFrame_, v17, v18);
  id v9 = v19;
  id v10 = v19;
  id v23 = v19;
  sub_1DDED5498();

  return v19;
}

void sub_1DDED5498()
{
  id v30 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  id v1 = v30;
  id v29 = [self (SEL)0x1F752E82BLL];
  [v30 (SEL)0x1F63B1318];

  id v34 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  id v2 = v34;
  id v31 = self;
  id v32 = (id)*MEMORY[0x1E4FB2950];
  id v3 = (id)*MEMORY[0x1E4FB2950];
  id v33 = objc_msgSend(v31, (SEL)0x1F7473070, v32, *MEMORY[0x1E4FB09D0]);

  objc_msgSend(v34, (SEL)0x1F6912F18, v33);
  id v35 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  id v4 = v35;
  objc_msgSend(v35, (SEL)0x1F68F0A98, 1);

  id v36 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  id v5 = v36;
  [v36 (SEL)0x1F63DF198];

  id v38 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v6 = v38;
  id v37 = [self (SEL)0x1F752E82BLL];
  [v38 (SEL)0x1F63B1318];

  id v42 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v7 = v42;
  id v39 = self;
  id v40 = (id)*MEMORY[0x1E4FB28F0];
  id v8 = (id)*MEMORY[0x1E4FB28F0];
  id v41 = objc_msgSend(v39, (SEL)0x1F7473070, v40, *MEMORY[0x1E4FB09D8]);

  objc_msgSend(v42, (SEL)0x1F6912F18, v41);
  id v43 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v9 = v43;
  objc_msgSend(v43, (SEL)0x1F68F0A98, 1);

  id v44 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v10 = v44;
  objc_msgSend(v44, (SEL)0x1F63DF198, 1);

  id v45 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v11 = v45;
  objc_msgSend(v45, sel_setNumberOfLines_);

  id v47 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v12 = v47;
  id v46 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel];
  id v13 = v46;
  objc_msgSend(v47, (SEL)0x1F74CBF75, v46);

  id v49 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v14 = v49;
  id v48 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel];
  id v15 = v48;
  objc_msgSend(v49, (SEL)0x1F74CBF75, v48);

  id v50 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v16 = v50;
  objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v51 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v17 = v51;
  objc_msgSend(v51, sel_setAxis_, 1);

  id v52 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v18 = v52;
  sub_1DDEEEFF8();
  objc_msgSend(v52, sel_setSpacing_);

  id v53 = *(id *)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v19 = v53;
  objc_msgSend(v0, sel_addSubview_, v53);

  uint64_t v72 = self;
  sub_1DDD5784C();
  sub_1DDEEF9A8();
  uint64_t v71 = v20;
  uint64_t v54 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v21 = v54;
  id v56 = [v54 (SEL)0x1F7564533];

  long long v22 = v0;
  id v55 = [v0 (SEL)0x1F7564533];

  id v57 = objc_msgSend(v56, (SEL)0x1F74DE307, v55, *(double *)sub_1DDED3C00());
  void *v71 = v57;
  uint64_t v58 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v23 = v58;
  id v60 = [v58 (SEL)0x1F74D6625];

  id v24 = v0;
  id v59 = [v0 (SEL)0x1F74D6625];

  id v61 = objc_msgSend(v60, (SEL)0x1F74DE307, v59, *((double *)sub_1DDED3C00() + 2));
  v71[1] = v61;
  uint64_t v62 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v25 = v62;
  id v64 = [v62 (SEL)0x1F751023ALL];

  id v26 = v0;
  id v63 = [v0 (SEL)0x1F751023ALL];

  id v65 = objc_msgSend(v64, (SEL)0x1F74DE307, v63, *((double *)sub_1DDED3C00() + 1));
  v71[2] = v65;
  uint64_t v66 = *(void **)&v0[OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView];
  id v27 = v66;
  id v69 = [v66 (SEL)0x1F7565494];

  id v28 = v67;
  id v68 = [v67 (SEL)0x1F7565494];

  id v70 = objc_retainAutoreleasedReturnValue(objc_msgSend(v69, (SEL)0x1F74DE307, v68, -0.0 - *((double *)sub_1DDED3C00()
                                                                                             + 3)));

  v71[3] = v70;
  sub_1DDD4242C();
  uint64_t v73 = (void *)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v72, sel_activateConstraints_, v73);
}

void sub_1DDED5D00()
{
  id v1 = v0;
  id v2 = v0;
  id v3 = v0;
  id v4 = v0;
  uint64_t v5 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_stackView;
  sub_1DDD573B8();
  *(void *)&v8[v5] = sub_1DDD3CB38();

  uint64_t v6 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_titleLabel;
  sub_1DDD57350();
  *(void *)&v8[v6] = sub_1DDD3CB38();

  uint64_t v7 = OBJC_IVAR____TtC6MailUI19SearchPreparingView_explanationLabel;
  *(void *)&v8[v7] = sub_1DDD3CB38();

  *(void *)&v8[OBJC_IVAR____TtC6MailUI19SearchPreparingView_indexStatus] = 0;
  sub_1DDEEEC08();
  sub_1DDEEF7E8();
  __break(1u);
}

id SearchPreparingView.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchPreparingView()
{
  return self;
}

void *type metadata accessor for SearchPreparingView.Constants()
{
  return &unk_1F39CA1D0;
}

void *type metadata accessor for SearchPreparingView.OptimizationScenario()
{
  return &unk_1F39CA260;
}

unint64_t sub_1DDED5FB8()
{
  return sub_1DDED5FD0();
}

unint64_t sub_1DDED5FD0()
{
  uint64_t v2 = qword_1EAB97AD8;
  if (!qword_1EAB97AD8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97AD8);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_1DDED6050()
{
  if (qword_1EBEA1D30 != -1) {
    swift_once();
  }
  return &qword_1EBEA1D18;
}

double SeparatorSupplementaryView.separatorLeadingInset.getter()
{
  uint64_t v2 = (double *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
  swift_beginAccess();
  double v3 = *v2;
  swift_endAccess();
  return v3;
}

void sub_1DDED6118(id *a1@<X0>, void *a2@<X8>)
{
  double v3 = (char *)*a1;
  id v2 = *a1;
  id v4 = &v3[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset];
  swift_beginAccess();
  uint64_t v6 = *(void *)v4;
  swift_endAccess();
  *a2 = v6;
}

void sub_1DDED61A4(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  SeparatorSupplementaryView.separatorLeadingInset.setter(v4);
}

void SeparatorSupplementaryView.separatorLeadingInset.setter(double a1)
{
  id v2 = (double *)(v1 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
  swift_beginAccess();
  *id v2 = a1;
  swift_endAccess();
  sub_1DDED626C();
}

void sub_1DDED626C()
{
  uint64_t v6 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint;
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint);
  swift_beginAccess();
  if (*v7)
  {
    id v4 = *(id *)(v5 + v6);
    id v1 = v4;
    swift_endAccess();
    id v2 = (double *)(v5 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset);
    swift_beginAccess();
    double v3 = *v2;
    swift_endAccess();
    objc_msgSend(v4, sel_setConstant_, v3);
  }
  else
  {
    swift_endAccess();
  }
}

void (*SeparatorSupplementaryView.separatorLeadingInset.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDED63D0;
}

void sub_1DDED63D0(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1DDED626C();
  }
}

uint64_t sub_1DDED6420()
{
  type metadata accessor for SeparatorSupplementaryView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1D38);
  uint64_t result = sub_1DDEEEBC8();
  qword_1EBEA1D18 = result;
  qword_1EBEA1D20 = v1;
  return result;
}

uint64_t type metadata accessor for SeparatorSupplementaryView()
{
  return self;
}

uint64_t static SeparatorSupplementaryView.reuseIdentifier.getter()
{
  uint64_t v1 = *sub_1DDED6050();
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1DDED64E8()
{
  id v1 = v0;
  id v10 = objc_msgSend(v0, sel_traitCollection);

  id v11 = objc_msgSend(v10, sel_preferredContentSizeCategory);
  char v12 = sub_1DDEEF2E8();

  if (v12) {
    return 1.0;
  }
  id v8 = self;
  id v2 = v0;
  id v6 = objc_msgSend(v0, sel_traitCollection);

  objc_msgSend(v6, sel_displayScale);
  double v7 = v3;

  objc_msgSend(v8, sel_uiRoundValue_toViewScale_, v0, 1.0 / v7);
  return v4;
}

id SeparatorSupplementaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id SeparatorSupplementaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(double *)&long long v15 = a1;
  *((double *)&v15 + 1) = a2;
  *(double *)&long long v16 = a3;
  *((double *)&v16 + 1) = a4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  long long v19 = v15;
  long long v20 = v16;
  uint64_t v5 = v4;
  id v6 = v4;
  double v7 = v4;
  id v8 = v4;
  id v21 = v4;
  *(void *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset] = 0;

  *(void *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint] = 0;

  uint64_t v13 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator;
  sub_1DDD5BDA0();
  *(void *)&v4[v13] = sub_1DDD3CB38();

  v18.receiver = v21;
  v18.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v18, sel_initWithFrame_, v15, v16);
  id v9 = v17;
  id v10 = v17;
  id v11 = v17;
  id v21 = v17;
  SeparatorSupplementaryView.setupLayout()();

  SeparatorSupplementaryView.configureBackground()();
  return v17;
}

Swift::Void __swiftcall SeparatorSupplementaryView.setupLayout()()
{
  id v16 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v1 = v16;
  objc_msgSend(v0, sel_addSubview_, v16);

  id v17 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v2 = v17;
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v18 = *(id *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v3 = v18;
  id v20 = objc_msgSend(v18, sel_heightAnchor);

  id v22 = objc_msgSend(v20, sel_constraintEqualToConstant_, sub_1DDED64E8());
  id v21 = (void **)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
  swift_beginAccess();
  double v4 = *v21;
  *id v21 = v22;

  swift_endAccess();
  id v23 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v5 = v23;
  id v27 = [v23 (SEL)0x1F751023ALL];

  id v6 = v19;
  id v26 = [v19 (SEL)0x1F751023ALL];

  id v24 = (double *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset];
  swift_beginAccess();
  double v25 = *v24;
  swift_endAccess();
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v26, v25);

  id v28 = (void **)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint];
  swift_beginAccess();
  double v7 = *v28;
  void *v28 = v29;

  swift_endAccess();
  id v30 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3118);
  sub_1DDEEF9A8();
  id v45 = v8;
  id v31 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v9 = v31;
  id v33 = [v31 (SEL)0x1F7564533];

  id v10 = v19;
  id v32 = [v19 (SEL)0x1F7564533];

  id v34 = objc_msgSend(v33, (SEL)0x1F74DE2EELL, v32);
  *id v45 = v34;
  id v35 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v11 = v35;
  id v37 = [v35 (SEL)0x1F74D6625];

  char v12 = v19;
  id v36 = [v19 (SEL)0x1F74D6625];

  id v38 = objc_msgSend(v37, (SEL)0x1F74DE2EELL, v36);
  v45[1] = v38;
  id v39 = *(id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator];
  id v13 = v39;
  id v41 = [v39 (SEL)0x1F7565494];

  id v14 = v19;
  id v40 = [v19 (SEL)0x1F7565494];

  id v42 = objc_msgSend(v41, (SEL)0x1F74DE2EELL, v40);
  v45[2] = v42;
  id v43 = (id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
  swift_beginAccess();
  sub_1DDD53BB4(v43, v45 + 3);
  swift_endAccess();
  id v44 = (id *)&v19[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint];
  swift_beginAccess();
  sub_1DDD53BB4(v44, v45 + 4);
  swift_endAccess();
  sub_1DDD4242C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3098);
  sub_1DDD5784C();
  sub_1DDE0C564();
  sub_1DDEEECA8();
  sub_1DDD31430();
  id v15 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v15);
}

Swift::Void __swiftcall SeparatorSupplementaryView.configureBackground()()
{
  id v3 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator);
  id v1 = v3;
  id v2 = objc_msgSend(self, sel_separatorColor);
  objc_msgSend(v3, sel_setBackgroundColor_);
}

void sub_1DDED6F4C()
{
  id v1 = v0;
  id v2 = v0;
  id v3 = v0;
  double v4 = v0;
  *(void *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separatorLeadingInset] = 0;

  *(void *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_leadingConstraint] = 0;

  uint64_t v5 = OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_separator;
  sub_1DDD5BDA0();
  *(void *)&v0[v5] = sub_1DDD3CB38();

  sub_1DDEEEC08();
  sub_1DDEEF7E8();
  __break(1u);
}

Swift::Void __swiftcall SeparatorSupplementaryView.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  Class isa = a1.value.super.isa;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  Class v17 = isa;
  id v16 = v1;
  id v2 = v1;
  v15.receiver = v1;
  v15.super_class = ObjectType;
  objc_msgSendSuper2(&v15, sel_traitCollectionDidChange_, isa);

  id v3 = isa;
  if (isa)
  {
    double v4 = v12;
    id v8 = objc_msgSend(v12, sel_traitCollection);

    unsigned __int8 v9 = [(objc_class *)isa mf_traitDifferenceAffectsTextLayout:v8];
    char v10 = v9 & 1;
  }
  else
  {
    char v10 = 2;
  }
  if (v10 == 2) {
    char v14 = 1;
  }
  else {
    char v14 = v10 & 1;
  }
  if (v14)
  {
    double v7 = (id *)&v12[OBJC_IVAR____TtC6MailUI26SeparatorSupplementaryView_heightConstraint];
    swift_beginAccess();
    if (*v7)
    {
      id v6 = *v7;
      id v5 = *v7;
      swift_endAccess();
      objc_msgSend(v6, sel_setConstant_, sub_1DDED64E8());
    }
    else
    {
      swift_endAccess();
    }
  }
}

id SeparatorSupplementaryView.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DDED73D0(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_1DDED73E8(double *a1, id *a2)
{
}

uint64_t Sequence<>.joined(by:matchingAttributes:)(void *a1)
{
  sub_1DDDBF9C8();
  id v4 = sub_1DDD3CB38();
  id v1 = a1;
  sub_1DDEEECF8();

  return v5;
}

id sub_1DDED7518@<X0>(id *a1@<X0>, id *a2@<X1>, char a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  id v16 = *a1;
  id v15 = *a2;
  id v5 = *a1;
  id v17 = objc_msgSend(v16, sel_length);

  if ((uint64_t)v17 > 0)
  {
    if (a3)
    {
      [v15 (SEL)0x1F6C20198];
      id v9 = objc_msgSend(v15, sel_attributesAtIndex_longestEffectiveRange_inRange_);
      type metadata accessor for Key();
      sub_1DDD3C6A8();
      sub_1DDEEE968();

      sub_1DDDBF9C8();
      id v6 = a4;
      id v18 = sub_1DDED7870(a4);
      id v7 = v18;
      id v10 = [v18 (SEL)0x1F6C20198];

      swift_bridgeObjectRetain();
      id v11 = (id)sub_1DDEEE958();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_addAttributes_range_, v11, 0, v10);

      objc_msgSend(v16, sel_appendAttributedString_, v18);
      swift_bridgeObjectRelease();
    }
    else
    {
      objc_msgSend(v16, sel_appendAttributedString_, a4);
    }
  }
  objc_msgSend(v16, sel_appendAttributedString_, v15);
  id result = v16;
  *a5 = v16;
  return result;
}

id sub_1DDED77B0@<X0>(id *a1@<X0>, id *a2@<X1>, void *a3@<X8>)
{
  return sub_1DDED7518(a1, a2, *(unsigned char *)(v3 + 16) & 1, *(void **)(v3 + 24), a3);
}

uint64_t sub_1DDED77E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a2, a1);
}

id sub_1DDED7838()
{
  return sub_1DDD3CB38();
}

id sub_1DDED7870(void *a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1DDEDE8E0(a1);
}

uint64_t sub_1DDED78B0()
{
  type metadata accessor for Options();
  sub_1DDEEF9A8();
  *uint64_t v0 = 1;
  sub_1DDD4242C();
  sub_1DDD39838();
  sub_1DDEEF638();
  return v2;
}

uint64_t sub_1DDED792C()
{
  type metadata accessor for MatchingOptions();
  sub_1DDEEF9A8();
  sub_1DDD39970();
  sub_1DDEEF638();
  return v1;
}

uint64_t static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(objc_class *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v40 = a1;
  id v41 = a2;
  uint64_t v42 = a3;
  uint64_t v43 = a4;
  id v45 = sub_1DDED86A0;
  id v46 = sub_1DDED87D8;
  id v60 = 0;
  id v59 = 0;
  var18.super.Class isa = a1;
  id v70 = a2;
  uint64_t v68 = a3;
  uint64_t v69 = a4;
  uint64_t v67 = v4;
  sub_1DDED7F5C(a2, (uint64_t)a1, &v62);
  uint64_t v47 = v62;
  uint64_t v48 = v63;
  uint64_t v49 = v64;
  uint64_t v50 = v65;
  v51._rawValue = v66;
  v61[4] = v62;
  v61[5] = v63;
  v61[2] = v64;
  v61[3] = v65;
  v61[1] = v66;
  swift_bridgeObjectRetain();
  id v53 = v61;
  v61[0] = v51._rawValue;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA3990);
  sub_1DDDB9938();
  int v54 = sub_1DDEEF098();
  sub_1DDD31430();
  if (v54 & 1) != 0 || (sub_1DDEEEC58())
  {
    id v14 = v41;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v17 = v41;
    uint64_t v18 = v44;
    return (uint64_t)v17;
  }
  uint64_t v34 = 0;
  sub_1DDDBF9C8();
  id v5 = v41;
  id v35 = sub_1DDED7870(v41);
  id v60 = v35;
  unint64_t v36 = sub_1DDED84D4();
  swift_bridgeObjectRetain();
  NSRegularExpressionOptions v6 = sub_1DDED78B0();
  NSRegularExpression.init(tokens:options:)(&var18, v51, v6);
  uint64_t v37 = v7;
  id v38 = v8;
  uint64_t v39 = v7;
  if (v7)
  {
    uint64_t v16 = v39;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v31;
  }
  else
  {
    id v24 = v38;
    id v59 = v38;
    swift_bridgeObjectRetain();
    id v25 = (id)sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    uint64_t v57 = v49;
    uint64_t v58 = v50;
    id v26 = objc_msgSend(v38, sel_matchesInString_options_range_, v25, sub_1DDED792C(), v49, v50);

    uint64_t v27 = 0;
    sub_1DDED853C();
    uint64_t v56 = sub_1DDEEEDA8();
    uint64_t KeyPath = swift_getKeyPath();
    swift_retain();
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F88);
    uint64_t v30 = type metadata accessor for _NSRange();
    unint64_t v9 = sub_1DDED86D4();
    uint64_t v32 = 0;
    uint64_t v33 = sub_1DDD3F59C((void (*)(char *, char *))v45, KeyPath, v29, v30, MEMORY[0x1E4FBC248], v9, MEMORY[0x1E4FBC278], v31);
    uint64_t v19 = v33;
    swift_release();
    swift_release();
    sub_1DDD31430();

    uint64_t v55 = v33;
    id v10 = v35;
    id v20 = &v16;
    MEMORY[0x1F4188790](&v16);
    id v21 = v15;
    v15[2] = v42;
    v15[3] = v43;
    v15[4] = v11;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F98);
    sub_1DDED8808();
    uint64_t v12 = v32;
    uint64_t result = sub_1DDEEED18();
    uint64_t v23 = v12;
    if (!v12)
    {

      sub_1DDD31430();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v17 = v35;
      uint64_t v18 = v23;
      return (uint64_t)v17;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1DDED7F5C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v42 = a3;
  uint64_t v43 = a2;
  uint64_t v44 = "Fatal error";
  id v45 = "Range cannot have an unordered lower bound.";
  id v46 = "Swift/Range.swift";
  uint64_t v47 = sub_1DDEDE0BC;
  v61[3] = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v48 = 0;
  uint64_t v53 = 0;
  v61[5] = a1;
  v61[4] = a2;
  id v49 = objc_msgSend(a1, sel_string);
  uint64_t v50 = sub_1DDEEEB78();
  uint64_t v51 = v3;
  v61[1] = v50;
  v61[2] = v3;

  uint64_t v52 = sub_1DDEEEBD8();
  id v35 = v61;
  v61[0] = v52;
  swift_bridgeObjectRetain();
  uint64_t v32 = v60;
  v60[0] = v50;
  v60[1] = v51;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2268);
  unint64_t v34 = sub_1DDED888C();
  unint64_t v36 = sub_1DDD44304();
  uint64_t v37 = sub_1DDEEF4B8();
  uint64_t v38 = v4;
  v59[3] = v37;
  v59[4] = v4;
  uint64_t v39 = sub_1DDED9418();
  uint64_t v40 = v5;
  v59[1] = v39;
  v59[2] = v5;
  uint64_t v41 = sub_1DDEEEBD8();
  uint64_t v23 = v59;
  v59[0] = v41;
  swift_bridgeObjectRetain();
  uint64_t v57 = v39;
  uint64_t v58 = v40;
  uint64_t v29 = MEMORY[0x1E4FBB1A0];
  uint64_t v24 = sub_1DDEEF4B8();
  uint64_t v25 = v6;
  uint64_t v55 = v24;
  uint64_t v56 = v6;
  uint64_t v54 = v43;
  id v26 = &v17;
  MEMORY[0x1F4188790](&v17);
  uint64_t v27 = &v15;
  uint64_t v16 = v7;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA3990);
  unint64_t v8 = sub_1DDDB9938();
  uint64_t v31 = sub_1DDD3F59C((void (*)(char *, char *))v47, (uint64_t)v27, v28, v29, MEMORY[0x1E4FBC248], v8, MEMORY[0x1E4FBC278], v30);
  uint64_t v22 = v31;
  uint64_t v53 = v31;
  if (sub_1DDEEF4A8())
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v39;
    uint64_t v18 = v40;
    uint64_t v19 = v24;
    uint64_t v20 = v25;
    uint64_t v21 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v50;
    uint64_t v18 = v51;
    uint64_t v19 = v37;
    uint64_t v20 = v38;
    uint64_t v21 = v43;
  }
  id v10 = v42;
  uint64_t v11 = v18;
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = v21;
  uint64_t *v42 = v17;
  v10[1] = v11;
  void v10[2] = v12;
  v10[3] = v13;
  v10[4] = v14;
  return result;
}

unint64_t sub_1DDED84D4()
{
  uint64_t v2 = qword_1EBEA2058;
  if (!qword_1EBEA2058)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EBEA2058);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_1DDED853C()
{
  uint64_t v2 = qword_1EBEA2070;
  if (!qword_1EBEA2070)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EBEA2070);
    return ObjCClassMetadata;
  }
  return v2;
}

char *keypath_get_selector_range()
{
  return sel_range;
}

void sub_1DDED85B0(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = objc_msgSend(v4, sel_range);
  a2[1] = v3;
}

void sub_1DDED8620(id *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1DDED8638(id *a1)
{
  id v3 = *a1;
  id v1 = *a1;
  swift_retain();
  swift_getAtKeyPath();

  return swift_release();
}

uint64_t sub_1DDED86A0(id *a1)
{
  return sub_1DDED8638(a1);
}

unint64_t sub_1DDED86D4()
{
  uint64_t v2 = qword_1EBEA1F90;
  if (!qword_1EBEA1F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F88);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1F90);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDED8758(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1DDED87D8(uint64_t a1)
{
  return sub_1DDED8758(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_1DDED8808()
{
  uint64_t v2 = qword_1EBEA1FB0;
  if (!qword_1EBEA1FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1FB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDED888C()
{
  uint64_t v2 = qword_1EBEA2260;
  if (!qword_1EBEA2260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA2268);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA2260);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDED8AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2, a3);
}

uint64_t static SnippetGenerator.highlightingTokens(authorTokens:authorEmailTokens:inEmailAttributedString:highlighting:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v76 = 0;
  uint64_t v74 = 0;
  uint64_t v72 = 0;
  uint64_t v71 = 0;
  id v60 = 0;
  id v59 = 0;
  uint64_t v81 = a1;
  uint64_t v80 = a2;
  uint64_t v79 = a3;
  uint64_t v77 = a4;
  uint64_t v78 = a5;
  uint64_t v42 = MEMORY[0x1E4FBB1A0];
  uint64_t v75 = sub_1DDEEEDC8();
  uint64_t v48 = v40;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA3990);
  unint64_t v45 = sub_1DDDB9938();
  id v46 = (objc_class *)sub_1DDD3F59C((void (*)(char *, char *))sub_1DDEDE0BC, (uint64_t)v47, v41, v42, MEMORY[0x1E4FBC248], v45, MEMORY[0x1E4FBC278], v44);
  if (v43)
  {
    __break(1u);
    swift_bridgeObjectRelease();
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  sub_1DDD31430();
  uint64_t v74 = v46;
  swift_bridgeObjectRetain();
  uint64_t v73 = v46;
  char v35 = sub_1DDEEF098();
  sub_1DDD31430();
  if ((v35 & 1) != 0 || !objc_msgSend(a3, sel_length))
  {
    id v15 = a3;
    swift_bridgeObjectRelease();
    id v17 = a3;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_10;
  }
  unint64_t v34 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(v46, a3, a4, a5);
  uint64_t v72 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1EE8);
  sub_1DDEEF9A8();
  uint64_t v71 = sub_1DDEEE998();
  id v31 = (id)*MEMORY[0x1E4F60610];
  id v5 = (id)*MEMORY[0x1E4F60610];
  id v30 = objc_msgSend(v34, sel_length);
  type metadata accessor for EnumerationOptions();
  sub_1DDEEF9A8();
  sub_1DDD39AA8();
  sub_1DDEEF638();
  uint64_t v32 = v70;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = &v71;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_1DDEDE11C;
  *(void *)(v29 + 24) = v28;
  swift_retain();
  uint64_t v68 = sub_1DDEDE150;
  uint64_t v69 = v29;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  int v64 = 1107296256;
  int v65 = 0;
  uint64_t v66 = sub_1DDED9A80;
  uint64_t v67 = &block_descriptor_20;
  uint64_t v33 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v61 = 0;
  id v62 = v30;
  objc_msgSend(v34, sel_enumerateAttribute_inRange_options_usingBlock_, v31, 0, v30, v32, v33);
  _Block_release(v33);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    sub_1DDD78F10((uint64_t)sub_1DDEDE150);

    sub_1DDDBF9C8();
    id v7 = v34;
    id v26 = sub_1DDED7870(v34);
    id v60 = v26;
    sub_1DDED84D4();
    swift_bridgeObjectRetain();
    NSRegularExpressionOptions v8 = sub_1DDED78B0();
    NSRegularExpression.init(tokens:options:)(v9, (Swift::OpaquePointer)v46, v8);
    uint64_t v27 = v10;
    if (!v11)
    {
      id v59 = v10;
      id v23 = (id)*MEMORY[0x1E4F60610];
      id v12 = (id)*MEMORY[0x1E4F60610];
      id v22 = objc_msgSend(v34, sel_length);
      sub_1DDEEF9A8();
      sub_1DDEEF638();
      uint64_t v24 = v58;
      swift_bridgeObjectRetain();
      id v13 = v27;
      id v14 = v26;
      uint64_t v20 = (void *)swift_allocObject();
      void v20[2] = &v71;
      v20[3] = a1;
      v20[4] = v27;
      v20[5] = a4;
      v20[6] = a5;
      v20[7] = v26;
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = sub_1DDEDE1AC;
      *(void *)(v21 + 24) = v20;
      swift_retain();
      uint64_t v56 = sub_1DDEDE150;
      uint64_t v57 = v21;
      uint64_t v51 = MEMORY[0x1E4F143A8];
      int v52 = 1107296256;
      int v53 = 0;
      uint64_t v54 = sub_1DDED9A80;
      uint64_t v55 = &block_descriptor_13_0;
      uint64_t v25 = _Block_copy(&v51);
      swift_release();
      uint64_t v49 = 0;
      id v50 = v22;
      objc_msgSend(v34, sel_enumerateAttribute_inRange_options_usingBlock_, v23, 0, v22, v24, v25);
      _Block_release(v25);
      uint64_t result = swift_isEscapingClosureAtFileLocation();
      if ((result & 1) == 0)
      {
        sub_1DDD78F10((uint64_t)sub_1DDEDE150);

        sub_1DDD31430();
        swift_bridgeObjectRelease();
        id v17 = v26;
        uint64_t v18 = sub_1DDEDE11C;
        uint64_t v19 = sub_1DDEDE1AC;
LABEL_10:
        sub_1DDD78F10((uint64_t)v18);
        sub_1DDD78F10(0);
        sub_1DDD78F10((uint64_t)v19);
        sub_1DDD78F10(0);
        return (uint64_t)v17;
      }
      goto LABEL_16;
    }

    sub_1DDD31430();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_1DDEDE11C;
LABEL_14:
    sub_1DDD78F10((uint64_t)v16);
    sub_1DDD78F10(0);
    return v44;
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_1DDED93AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DDED9418();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_1DDED9418()
{
  sub_1DDEEEC08();
  sub_1DDEEEC08();
  sub_1DDD44304();
  sub_1DDD8BD74();
  uint64_t v3 = sub_1DDEEF588();
  id v4 = (id)*MEMORY[0x1E4F1C4D8];
  id v0 = (id)*MEMORY[0x1E4F1C4D8];
  uint64_t v5 = sub_1DDEEF568();
  uint64_t v6 = v1;

  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = v5;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v3;
    sub_1DDD31BC0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void (*sub_1DDED9684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(void)
{
  uint64_t v24 = a1;
  uint64_t v22 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = a4;
  uint64_t v20 = a5;
  sub_1DDEDEBB8(a1, (uint64_t)v18);
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2100);
    if (swift_dynamicCast()) {
      id v15 = v17;
    }
    else {
      id v15 = 0;
    }
    uint64_t v16 = v15;
  }
  else
  {
    sub_1DDD5C84C((uint64_t)v18);
    uint64_t v16 = 0;
  }
  if (!v16) {
    return (void (*)(void))sub_1DDD78F10(0);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v14 = objc_msgSend(v16, sel_emailAddressValue);
  swift_unknownObjectRelease();
  if (v14)
  {
    id v12 = objc_msgSend(v14, sel_simpleAddress);
    if (v12)
    {
      sub_1DDEEEB78();
      uint64_t v10 = v5;

      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }

    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (!v13)
  {
    swift_unknownObjectRelease();
    return (void (*)(void))sub_1DDD78F10(0);
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_1DDD53D50;
  *(void *)(v9 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA1ED8);
  uint64_t result = (void (*)(void))sub_1DDEEE9F8();
  if (__OFADD__(*v7, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v7;
    result();
    sub_1DDD31BC0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    return (void (*)(void))sub_1DDD78F10((uint64_t)sub_1DDD503A8);
  }
  return result;
}

uint64_t sub_1DDED9A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_1DDED9A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[4] = a3;
  v9[5] = a4;
  uint64_t v6 = *(void (**)(__n128))(a1 + 32);
  swift_unknownObjectRetain();
  if (a2)
  {
    v8[3] = swift_getObjectType();
    v8[0] = a2;
    __n128 v4 = sub_1DDD52B30((uint64_t)v8, (uint64_t)v9);
  }
  else
  {
    memset(v9, 0, 32);
  }
  v6(v4);
  return sub_1DDD5C84C((uint64_t)v9);
}

uint64_t sub_1DDED9B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void (*a8)(void, void, void), uint64_t a9, uint64_t a10)
{
  uint64_t v75 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  char v70 = 0;
  char v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  id v61 = 0;
  BOOL v59 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v87 = a1;
  uint64_t v85 = a2;
  uint64_t v86 = a3;
  uint64_t v84 = a4;
  uint64_t v83 = a5;
  uint64_t v82 = a6;
  uint64_t v81 = a7;
  uint64_t v79 = a8;
  uint64_t v80 = a9;
  uint64_t v78 = a10;
  sub_1DDEDEBB8(a1, (uint64_t)v76);
  if (v77)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2100);
    uint64_t result = swift_dynamicCast();
    if (result) {
      uint64_t v42 = v49;
    }
    else {
      uint64_t v42 = 0;
    }
    uint64_t v43 = v42;
  }
  else
  {
    uint64_t result = sub_1DDD5C84C((uint64_t)v76);
    uint64_t v43 = 0;
  }
  if (v43)
  {
    uint64_t v75 = v43;
    swift_getObjectType();
    swift_unknownObjectRetain();
    id v41 = objc_msgSend(v43, sel_emailAddressValue);
    swift_unknownObjectRelease();
    if (v41)
    {
      id v38 = objc_msgSend(v41, sel_simpleAddress);
      if (v38)
      {
        uint64_t v34 = sub_1DDEEEB78();
        uint64_t v35 = v11;

        uint64_t v36 = v34;
        uint64_t v37 = v35;
      }
      else
      {
        uint64_t v36 = 0;
        uint64_t v37 = 0;
      }

      uint64_t v39 = v36;
      uint64_t v40 = v37;
    }
    else
    {
      uint64_t v39 = 0;
      uint64_t v40 = 0;
    }
    uint64_t v73 = v39;
    uint64_t v74 = v40;
    swift_getObjectType();
    swift_unknownObjectRetain();
    id v33 = objc_msgSend(v43, sel_emailAddressValue);
    swift_unknownObjectRelease();
    if (v33)
    {
      id v30 = objc_msgSend(v33, sel_displayName);
      if (v30)
      {
        uint64_t v26 = sub_1DDEEEB78();
        uint64_t v27 = v12;

        uint64_t v28 = v26;
        uint64_t v29 = v27;
      }
      else
      {
        uint64_t v28 = 0;
        uint64_t v29 = 0;
      }

      uint64_t v31 = v28;
      uint64_t v32 = v29;
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
    }
    uint64_t v71 = v31;
    uint64_t v72 = v32;
    swift_bridgeObjectRetain();
    if (v40)
    {
      uint64_t v52 = v39;
      uint64_t v53 = v40;
      swift_bridgeObjectRetain();
      MEMORY[0x1E01C89A0](&v50);
      sub_1DDD31BC0();
      if ((v51 & 1) == 0 && v50 > 1)
      {
        char v70 = 1;
        swift_bridgeObjectRelease();
LABEL_32:
        char v25 = v70;
        swift_bridgeObjectRetain();
        if (v25)
        {
          swift_bridgeObjectRetain();
          uint64_t v54 = a6;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA3990);
          sub_1DDDB9938();
          char v23 = sub_1DDEEF098();
          sub_1DDD31430();
          char v24 = v23 ^ 1;
        }
        else
        {
          char v24 = 0;
        }
        swift_bridgeObjectRelease();
        char v69 = v24 & 1;
        if (v24)
        {
          swift_bridgeObjectRetain();
          uint64_t v55 = v31;
          uint64_t v56 = v32;
          if (v32)
          {
            uint64_t v57 = v55;
            uint64_t v58 = v56;
          }
          else
          {
            uint64_t v57 = sub_1DDEEEC08();
            uint64_t v58 = v13;
            sub_1DDD31BC0();
          }
          uint64_t v21 = v57;
          uint64_t v22 = v58;
        }
        else
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          id v18 = objc_msgSend(v43, sel_stringValue);
          uint64_t v19 = sub_1DDEEEB78();
          uint64_t v20 = v14;
          swift_unknownObjectRelease();

          uint64_t v21 = v19;
          uint64_t v22 = v20;
        }
        uint64_t v67 = v21;
        uint64_t v68 = v22;
        uint64_t v15 = sub_1DDEEEC38();
        uint64_t v65 = 0;
        uint64_t v66 = v15;
        swift_bridgeObjectRetain();
        id v16 = (id)sub_1DDEEEB58();
        swift_bridgeObjectRelease();
        type metadata accessor for MatchingOptions();
        sub_1DDEEF9A8();
        sub_1DDD39970();
        sub_1DDEEF638();
        uint64_t v62 = 0;
        uint64_t v63 = v15;
        id v17 = objc_msgSend(a7, sel_firstMatchInString_options_range_, v16, v64, 0, v15);

        id v61 = v17;
        id v60 = v17;
        BOOL v59 = v17 != 0;
        if (v17) {
          a8(a10, a2, a3);
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    char v70 = 0;
    goto LABEL_32;
  }
  return result;
}

uint64_t static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:maxNumberOfWordsBeforeOrAfterToken:maxNumberOfRanges:highlighting:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v158 = a1;
  uint64_t v157 = a2;
  uint64_t v146 = a3;
  uint64_t v147 = a5;
  uint64_t v148 = a6;
  uint64_t v160 = 0;
  uint64_t v149 = sub_1DDED86A0;
  uint64_t v150 = (void (*)(char *, char *))sub_1DDEDE280;
  uint64_t v151 = sub_1DDEDB48C;
  uint64_t v152 = sub_1DDEDB4BC;
  uint64_t v153 = sub_1DDEDE4D8;
  v154 = (void (*)(char *, char *))sub_1DDEDE50C;
  v155 = sub_1DDEDE6E0;
  uint64_t v156 = sub_1DDD924F4;
  id v219 = 0;
  long long v217 = 0u;
  long long v218 = 0u;
  id v197 = 0;
  id v193 = 0;
  v177 = 0;
  id v176 = 0;
  uint64_t v173 = 0;
  id v172 = 0;
  uint64_t v240 = a1;
  v239 = a2;
  uint64_t v238 = a3;
  uint64_t v237 = a4;
  uint64_t v235 = a5;
  uint64_t v236 = a6;
  uint64_t v234 = v6;
  uint64_t v232 = a4;
  uint64_t v231 = 1;
  sub_1DDEEFA18();
  uint64_t v159 = v233;
  uint64_t v230 = v233;
  sub_1DDED7F5C(v157, v158, &v225);
  uint64_t v161 = v225;
  uint64_t v162 = v226;
  uint64_t v163 = v227;
  uint64_t v164 = v228;
  tokens._rawValue = v229;
  uint64_t v223 = v225;
  uint64_t v224 = v226;
  uint64_t v221 = v227;
  uint64_t v222 = v228;
  v220 = v229;
  unint64_t v165 = sub_1DDED84D4();
  swift_bridgeObjectRetain();
  NSRegularExpressionOptions v7 = sub_1DDED78B0();
  NSRegularExpression.init(tokens:options:)(v8, tokens, v7);
  uint64_t v167 = v9;
  id v168 = v10;
  uint64_t v169 = v9;
  if (v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v55 = v169;
    return v143;
  }
  id v136 = v168;
  id v219 = v168;
  swift_bridgeObjectRetain();
  id v137 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  uint64_t v214 = v163;
  uint64_t v215 = v164;
  id v138 = objc_msgSend(v168, sel_matchesInString_options_range_, v137, sub_1DDED792C(), v163, v164);

  uint64_t v139 = 0;
  sub_1DDED853C();
  uint64_t v213 = sub_1DDEEEDA8();
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F88);
  uint64_t v142 = type metadata accessor for _NSRange();
  unint64_t v11 = sub_1DDED86D4();
  uint64_t v144 = 0;
  uint64_t v145 = sub_1DDD3F59C((void (*)(char *, char *))v149, KeyPath, v141, v142, MEMORY[0x1E4FBC248], v11, MEMORY[0x1E4FBC278], v143);
  uint64_t v129 = v145;
  swift_release();
  swift_release();
  sub_1DDD31430();

  uint64_t v212 = v145;
  swift_bridgeObjectRetain();
  uint64_t v130 = &v53;
  MEMORY[0x1F4188790](&v53);
  uint64_t v131 = v52;
  v52[2] = v161;
  v52[3] = v162;
  v52[4] = v12;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F98);
  unint64_t v13 = sub_1DDEDE2B4();
  uint64_t v14 = v144;
  unint64_t v133 = v13;
  uint64_t v15 = sub_1DDD3F59C(v150, (uint64_t)v131, v132, v142, MEMORY[0x1E4FBC248], v13, MEMORY[0x1E4FBC278], v143);
  uint64_t v134 = v14;
  uint64_t v135 = v15;
  if (v14)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v125 = v135;
  swift_bridgeObjectRelease();
  sub_1DDD31430();
  uint64_t v211 = v125;
  unint64_t v16 = sub_1DDED8808();
  uint64_t v17 = v134;
  unint64_t v126 = v16;
  uint64_t v18 = sub_1DDEEED08();
  uint64_t v127 = v17;
  uint64_t v128 = v18;
  if (v17)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v123 = v128;
  sub_1DDD31430();
  uint64_t v210 = v123;
  uint64_t v19 = sub_1DDEEE918();
  uint64_t v20 = v127;
  uint64_t v209 = v19;
  sub_1DDEEECE8();
  uint64_t v124 = v20;
  if (v20)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1DDD31430();
  *(void *)&v208[1] = v216;
  uint64_t v119 = &v217;
  sub_1DDEEF088();
  uint64_t v109 = *((void *)&v217 + 1);
  uint64_t v114 = v217;
  long long v110 = v218;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v113 = v204;
  v204[0] = v114;
  v204[1] = v109;
  long long v205 = v110;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2250);
  unint64_t v112 = sub_1DDEDE338();
  sub_1DDEEF028();
  sub_1DDD5C558();
  uint64_t v115 = v206;
  uint64_t v116 = v207;
  swift_unknownObjectRelease();
  uint64_t v200 = v115;
  uint64_t v201 = v116;
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1FD0);
  sub_1DDEDE3BC();
  sub_1DDEEEA68();
  uint64_t v198 = v202;
  char v199 = v203 & 1;
  uint64_t v118 = v52;
  MEMORY[0x1F4188790](v52);
  uint64_t v21 = v163;
  uint64_t v22 = &v52[-6];
  uint64_t v120 = &v52[-6];
  v22[2] = v119;
  v22[3] = v21;
  void v22[4] = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1FC8);
  uint64_t v25 = v124;
  uint64_t v121 = v24;
  sub_1DDEDB920((void (*)(char *, char *))v153, (uint64_t)v120, v24, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC848] + 8, v143, (uint64_t)v208);
  uint64_t v122 = v25;
  if (v25)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v106 = sub_1DDDC2370();
  sub_1DDEEEC08();
  id v100 = sub_1DDE23714();
  id v197 = v100;
  long long v101 = v217;
  long long v102 = v218;
  swift_unknownObjectRetain();
  long long v195 = v101;
  long long v196 = v102;
  id v26 = v157;
  id v103 = v52;
  unint64_t v104 = 32;
  MEMORY[0x1F4188790](v52);
  uint64_t v105 = &v52[v104 / 0xFFFFFFFFFFFFFFF8];
  v105[2] = v27;
  unint64_t v28 = sub_1DDEDE538();
  uint64_t v29 = v122;
  uint64_t v30 = sub_1DDD3F59C(v154, (uint64_t)v105, v111, v106, MEMORY[0x1E4FBC248], v28, MEMORY[0x1E4FBC278], v143);
  uint64_t v107 = v29;
  uint64_t v108 = v30;
  if (v29)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v85 = v108;

  sub_1DDD5C558();
  uint64_t v88 = &v194;
  uint64_t v194 = v85;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F50);
  unint64_t v87 = sub_1DDEDE5BC();
  id v89 = (id)Sequence<>.joined(by:matchingAttributes:)(v100);
  sub_1DDD31430();
  id v193 = v89;
  uint64_t v96 = &v217;
  uint64_t v90 = *((void *)&v217 + 1);
  uint64_t v93 = v217;
  long long v91 = v218;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v92 = v186;
  v186[0] = v93;
  v186[1] = v90;
  long long v187 = v91;
  sub_1DDEEF028();
  sub_1DDD5C558();
  uint64_t v94 = v188;
  uint64_t v95 = v189;
  swift_unknownObjectRelease();
  uint64_t v182 = v94;
  uint64_t v183 = v95;
  sub_1DDEDE640();
  sub_1DDEEF078();
  uint64_t v31 = v107;
  uint64_t v180 = v184;
  char v181 = v185 & 1;
  uint64_t v97 = v52;
  unint64_t v98 = 32;
  MEMORY[0x1F4188790](v155);
  uint64_t v32 = &v52[v98 / 0xFFFFFFFFFFFFFFF8];
  v32[2] = v33;
  sub_1DDEDB920(v34, (uint64_t)v32, v35, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB390], v36, (uint64_t)&v190);
  uint64_t v99 = v31;
  if (v31)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char v179 = v190;
  if (v190 == 2) {
    char v191 = 0;
  }
  else {
    char v191 = v179 & 1;
  }
  if (v191)
  {
    unint64_t v80 = 0x1F6C20000uLL;
    id v37 = [v89 (SEL)0x1F6C20198];
    uint64_t v76 = 0;
    uint64_t v174 = 0;
    id v175 = v37;
    id v75 = objc_msgSend(v89, sel_attributesAtIndex_longestEffectiveRange_inRange_);
    uint64_t v77 = type metadata accessor for Key();
    unint64_t v79 = sub_1DDD3C6A8();
    uint64_t v78 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v84 = sub_1DDEEE968();
    uint64_t v173 = v84;

    sub_1DDDBF9C8();
    id v38 = v100;
    id v83 = sub_1DDED7870(v100);
    id v172 = v83;
    swift_bridgeObjectRetain();
    id v82 = (id)sub_1DDEEE958();
    swift_bridgeObjectRelease();
    id v39 = v83;
    id v81 = [v83 (SEL)(v80 + 408)];

    uint64_t v170 = 0;
    id v171 = v81;
    objc_msgSend(v83, sel_addAttributes_range_, v82, 0, v81);

    id v40 = v83;
    id v192 = v83;

    swift_bridgeObjectRelease();
  }
  else
  {
    id v192 = 0;
  }
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA2048);
  uint64_t v71 = sub_1DDEEF9A8();
  char v69 = v41;
  sub_1DDD53BB4(&v192, v41);
  id v42 = v89;
  uint64_t v43 = v71;
  v69[1] = v89;
  sub_1DDD4242C();
  v178[1] = v43;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F60);
  sub_1DDEDE70C();
  uint64_t v44 = v99;
  uint64_t v45 = sub_1DDEEECA8();
  uint64_t v73 = v44;
  uint64_t v74 = v45;
  if (v44) {
    goto LABEL_27;
  }
  uint64_t v62 = v74;
  sub_1DDD31430();
  uint64_t v64 = v178;
  v178[0] = v62;
  id v63 = sub_1DDED7838();
  sub_1DDE90168();
  uint64_t v65 = (void *)Sequence<>.joined(by:matchingAttributes:)(v63);

  sub_1DDD31430();
  uint64_t v46 = v73;
  v177 = v65;
  uint64_t v47 = (void *)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)((objc_class *)tokens._rawValue, v65, v147, v148);
  uint64_t v66 = v46;
  id v67 = v47;
  uint64_t v68 = v46;
  if (v46)
  {
LABEL_28:
    uint64_t v54 = v68;

    sub_1DDD31B20(&v192);
    sub_1DDD5C558();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v55 = v54;
    return v143;
  }
  id v58 = v67;
  id v176 = v67;
  id v60 = objc_msgSend(v67, sel_string);
  sub_1DDEEEB78();
  uint64_t v59 = v48;
  int v61 = sub_1DDEEEC58();
  swift_bridgeObjectRelease();

  if (v61)
  {
    id v49 = v157;
    id v57 = v157;
  }
  else
  {
    id v50 = v58;
    id v57 = v58;
  }
  id v56 = v57;

  sub_1DDD31B20(&v192);
  sub_1DDD5C558();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (uint64_t)v56;
}

Swift::Int sub_1DDEDB3B0@<X0>(__C::_NSRange *a1@<X0>, Swift::Int a2@<X3>, __C::_NSRange *a3@<X8>)
{
  __C::_NSRange range = *a1;
  swift_bridgeObjectRetain();
  id v7 = (id)sub_1DDEEEB58();
  __C::_NSRange v3 = NSString.rangeByAdding(maxNumberOfWordsBefore:maxNumberOfWordsAfter:range:)(a2, a2, range);

  swift_bridgeObjectRelease();
  Swift::Int result = v3.location;
  *a3 = v3;
  return result;
}

BOOL sub_1DDEDB48C(void *a1, void *a2)
{
  return *a1 < *a2;
}

uint64_t sub_1DDEDB4BC(uint64_t *a1, NSRange *a2)
{
  uint64_t v22 = a1;
  uint64_t v24 = sub_1DDEDEB84;
  v52.NSUInteger location = 0;
  v52.NSUInteger length = 0;
  v47.NSUInteger location = 0;
  v47.NSUInteger length = 0;
  v43.NSUInteger location = 0;
  v43.NSUInteger length = 0;
  v38.NSUInteger location = 0;
  v38.NSUInteger length = 0;
  uint64_t v53 = a1;
  NSRange v25 = *a2;
  NSRange v52 = v25;
  uint64_t v26 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v28 = &v49;
  uint64_t v49 = v26;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F98);
  sub_1DDEDEA7C();
  sub_1DDEEEA68();
  sub_1DDD31430();
  NSRange v29 = v50;
  if (v51)
  {
    swift_bridgeObjectRelease();
    NSRange v48 = v25;
    uint64_t result = sub_1DDEEEE68();
    uint64_t v20 = v23;
  }
  else
  {
    NSRange v21 = v29;
    NSRange v19 = v29;
    NSRange v47 = v29;
    swift_bridgeObjectRelease();
    NSRange v46 = v29;
    NSRange v45 = v25;
    NSRange v3 = NSIntersectionRange(v29, v25);
    NSRange v44 = v3;
    NSRange v43 = v3;
    if (v3.length)
    {
      NSRange v41 = v19;
      NSRange v40 = v25;
      NSRange v39 = NSUnionRange(v19, v25);
      NSUInteger length = v39.length;
      NSUInteger location = v39.location;
      NSRange v38 = v39;
      uint64_t v9 = *v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8[1] = v36;
      v36[0] = v9;
      sub_1DDEDEB00();
      sub_1DDEEF028();
      sub_1DDD31430();
      uint64_t v10 = v36[1];
      uint64_t v11 = v36[2];
      swift_bridgeObjectRelease();
      uint64_t v32 = v10;
      uint64_t v33 = v11;
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1FD0);
      sub_1DDEDE3BC();
      sub_1DDEEEA68();
      uint64_t v30 = v34;
      char v31 = v35 & 1;
      uint64_t v14 = v8;
      MEMORY[0x1F4188790](v8);
      unint64_t v16 = v7;
      void v7[2] = v22;
      v7[3] = location;
      v7[4] = v4;
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1FC8);
      uint64_t v6 = v23;
      uint64_t result = sub_1DDEDB920((void (*)(char *, char *))v24, (uint64_t)v16, v5, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC848] + 8, v17, (uint64_t)&v37);
      uint64_t v18 = v6;
      if (v6)
      {
        __break(1u);
      }
      else
      {
        uint64_t result = 0;
        uint64_t v20 = 0;
      }
    }
    else
    {
      NSRange v42 = v25;
      sub_1DDEEEE68();
      uint64_t result = v23;
      uint64_t v20 = v23;
    }
  }
  return result;
}

uint64_t sub_1DDEDB86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F98);
  uint64_t v4 = (uint64_t (*)(void))sub_1DDEEEEF8();
  void *v5 = a3;
  v5[1] = a4;
  return v4();
}

uint64_t sub_1DDEDB920@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v18 = a7;
  NSRange v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v25 = a6;
  uint64_t v39 = a4;
  uint64_t v38 = a5;
  uint64_t v26 = *(void *)(a4 - 8);
  uint64_t v27 = a4 - 8;
  unint64_t v28 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v7);
  NSRange v29 = (char *)v17 - v28;
  uint64_t v35 = *(void *)(v8 + 16);
  uint64_t v37 = v35;
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v34 = v35 - 8;
  unint64_t v30 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v9);
  char v31 = (char *)v17 - v30;
  unint64_t v32 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v11);
  uint64_t v36 = (char *)v17 - v32;
  sub_1DDE9BE88(v12, (char *)v17 - v32, v13, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v36, 1, v35) == 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v18, 1);
    v17[1] = v24;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v31, v36, v35);
    uint64_t v16 = v24;
    v19(v31, v29);
    v17[0] = v16;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v35);
    if (v16)
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v25, v29, v22);
    }
    else
    {
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 56))(v18, 0, 1);
      return v17[0];
    }
  }
  return result;
}

uint64_t sub_1DDEDBC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _NSRange();
  uint64_t result = sub_1DDEEF628();
  if (__OFSUB__(a4, v10.location + v10.length))
  {
    __break(1u);
  }
  else
  {
    v11.NSUInteger location = v10.location + v10.length;
    v11.NSUInteger length = a4 - (v10.location + v10.length);
    NSRange v6 = NSUnionRange(v10, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2250);
    uint64_t v7 = (uint64_t (*)(void))sub_1DDEEF618();
    NSRange *v8 = v6;
    return v7();
  }
  return result;
}

id sub_1DDEDBE48@<X0>(id a1@<X1>, void *a2@<X0>, void *a3@<X8>)
{
  id result = objc_msgSend(a1, sel_attributedSubstringFromRange_, *a2, a2[1]);
  *a3 = result;
  return result;
}

uint64_t sub_1DDEDBEC8@<X0>(BOOL *a1@<X8>)
{
  type metadata accessor for _NSRange();
  uint64_t result = sub_1DDEEF628();
  *a1 = v3 != 0;
  return result;
}

void *static SnippetGenerator.highlightedSnippetUsingTokens(tokens:in:inside:highlighting:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  id v112 = 0;
  uint64_t v111 = 0;
  uint64_t v105 = 0;
  uint64_t v106 = 0;
  uint64_t v101 = 0;
  uint64_t v102 = 0;
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  uint64_t v92 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  id v77 = 0;
  BOOL v76 = 0;
  uint64_t v131 = a1;
  uint64_t v130 = a2;
  double v126 = a5;
  double v127 = a6;
  double v128 = a7;
  double v129 = a8;
  uint64_t v124 = a3;
  uint64_t v125 = a4;
  uint64_t v123 = v8;
  sub_1DDED7F5C(a2, a1, v119);
  uint64_t v70 = v120;
  uint64_t v71 = v121;
  Swift::OpaquePointer tokens = v122;
  uint64_t v117 = v119[0];
  uint64_t v118 = v119[1];
  uint64_t v115 = v120;
  uint64_t v116 = v121;
  uint64_t v114 = v122;
  swift_bridgeObjectRetain();
  uint64_t v113 = tokens;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA3990);
  sub_1DDDB9938();
  char v73 = sub_1DDEEF098();
  sub_1DDD31430();
  if (v73 & 1) != 0 || (sub_1DDEEEC58())
  {
    id v29 = a2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  sub_1DDDC2370();
  sub_1DDEEEC08();
  id v60 = sub_1DDE23714();
  id v112 = v60;
  sub_1DDED84D4();
  swift_bridgeObjectRetain();
  NSRegularExpressionOptions v9 = sub_1DDED78B0();
  NSRegularExpression.init(tokens:options:)(v10, (Swift::OpaquePointer)tokens, v9);
  int v61 = v11;
  if (v12)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)v58;
  }
  uint64_t v111 = v11;
  swift_bridgeObjectRetain();
  id v53 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  v107[2] = v70;
  void v107[3] = v71;
  id v54 = objc_msgSend(v61, sel_matchesInString_options_range_, v53, sub_1DDED792C(), v70, v71);

  sub_1DDED853C();
  v107[1] = sub_1DDEEEDA8();
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F88);
  uint64_t v57 = type metadata accessor for _NSRange();
  unint64_t v13 = sub_1DDED86D4();
  uint64_t v59 = sub_1DDD3F59C((void (*)(char *, char *))sub_1DDED86A0, KeyPath, v56, v57, MEMORY[0x1E4FBC248], v13, MEMORY[0x1E4FBC278], v58);
  swift_release();
  swift_release();
  sub_1DDD31430();

  v107[0] = v59;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F98);
  sub_1DDED8808();
  sub_1DDEEECC8();
  uint64_t result = v107;
  sub_1DDD31430();
  uint64_t v51 = v108;
  uint64_t v52 = v109;
  if (v110)
  {
    id v28 = a2;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a2;
  }
  uint64_t v105 = v108;
  uint64_t v106 = v109;
  uint64_t v103 = v108;
  uint64_t v104 = v109;
  uint64_t v136 = v108;
  uint64_t v137 = v109;
  uint64_t v50 = v108 + v109;
  uint64_t v101 = 0;
  uint64_t v102 = v108 + v109;
  if (__OFSUB__(v71, v108))
  {
    __break(1u);
  }
  else
  {
    uint64_t v99 = v108;
    uint64_t v100 = v71 - v108;
    uint64_t v97 = v108;
    uint64_t v98 = v109;
    uint64_t v134 = v108;
    uint64_t v135 = v109;
    uint64_t v95 = v108;
    uint64_t v96 = v109;
    uint64_t v132 = v108;
    uint64_t v133 = v109;
    if (!__OFSUB__(v71, v108 + v109))
    {
      uint64_t v93 = v108 + v109;
      uint64_t v94 = v71 - (v108 + v109);
      uint64_t v48 = swift_allocObject();
      uint64_t v92 = v48 + 16;
      *(void *)(v48 + 16) = v51;
      id v49 = objc_msgSend(a2, sel_string);
      if (v49)
      {
        NSRange v47 = v49;
      }
      else
      {
        sub_1DDEEF7D8();
        __break(1u);
      }
      _s3__C18EnumerationOptionsVMa_0();
      sub_1DDEEF9A8();
      *uint64_t v17 = 3;
      v17[1] = 256;
      sub_1DDD4242C();
      sub_1DDD39358();
      sub_1DDEEF638();
      uint64_t v43 = v91;
      id v18 = a2;
      id v19 = v60;
      swift_retain();
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = v51;
      *(void *)(v42 + 24) = v52;
      *(void *)(v42 + 32) = v51 + v52;
      *(void *)(v42 + 40) = v71 - (v51 + v52);
      *(void *)(v42 + 48) = a2;
      *(void *)(v42 + 56) = v69;
      *(void *)(v42 + 64) = v60;
      *(double *)(v42 + 72) = a5;
      *(double *)(v42 + 80) = a6;
      *(double *)(v42 + 88) = a7;
      *(double *)(v42 + 96) = a8;
      *(void *)(v42 + 104) = v48;
      id v89 = sub_1DDEDE80C;
      uint64_t v90 = v42;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      int v85 = 1107296256;
      int v86 = 0;
      unint64_t v87 = sub_1DDEA1F90;
      uint64_t v88 = &block_descriptor_24;
      NSRange v44 = _Block_copy(&aBlock);
      swift_release();
      uint64_t v82 = 0;
      uint64_t v83 = v50;
      objc_msgSend(v47, sel_enumerateSubstringsInRange_options_usingBlock_, 0, v50, v43, v44);
      _Block_release(v44);

      swift_beginAccess();
      uint64_t v45 = *(void *)(v48 + 16);
      swift_endAccess();
      swift_beginAccess();
      uint64_t v46 = *(void *)(v48 + 16);
      uint64_t result = (void *)swift_endAccess();
      if (!__OFSUB__(v71, v46))
      {
        uint64_t v80 = v45;
        uint64_t v81 = v71 - v46;
        uint64_t v78 = v45;
        uint64_t v79 = v71 - v46;
        id v41 = objc_msgSend(a2, sel_attributedSubstringFromRange_, v45, v71 - v46);
        id v77 = v41;
        BOOL v76 = v45 != 0;
        if (v45)
        {
          [v41 (SEL)0x1F6C20198];
          id v38 = objc_msgSend(v41, sel_attributesAtIndex_longestEffectiveRange_inRange_);
          type metadata accessor for Key();
          sub_1DDD3C6A8();
          sub_1DDEEE968();

          sub_1DDDBF9C8();
          id v21 = v60;
          id v74 = sub_1DDED7870(v60);
          swift_bridgeObjectRetain();
          id v40 = (id)sub_1DDEEE958();
          swift_bridgeObjectRelease();
          id v22 = v74;
          id v39 = [v74 (SEL)0x1F6C20198];

          objc_msgSend(v74, sel_addAttributes_range_, v40, 0, v39);
          id v23 = v74;
          id v75 = v74;

          swift_bridgeObjectRelease();
        }
        else
        {
          id v75 = 0;
        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA2048);
        sub_1DDEEF9A8();
        uint64_t v37 = v24;
        sub_1DDD53BB4(&v75, v24);
        id v25 = v41;
        v37[1] = v41;
        sub_1DDD4242C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F60);
        sub_1DDEDE70C();
        sub_1DDEEECA8();
        sub_1DDD31430();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1F50);
        sub_1DDEDE5BC();
        id v34 = sub_1DDED7838();
        sub_1DDE90168();
        id v35 = (id)Sequence<>.joined(by:matchingAttributes:)(v34);

        sub_1DDD31430();
        id v36 = (id)static SnippetGenerator.highlightingTokens(tokens:in:highlighting:)(tokens, v35, a3, a4);
        id v32 = objc_msgSend(v36, sel_string);
        sub_1DDEEEB78();
        char v33 = sub_1DDEEEC58();
        swift_bridgeObjectRelease();

        if (v33)
        {
          id v26 = a2;
          id v31 = a2;
        }
        else
        {
          id v27 = v36;
          id v31 = v36;
        }

        sub_1DDD31B20(&v75);
        swift_release();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

void sub_1DDEDCEB4(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7, NSUInteger a8, double a9, double a10, double a11, long double a12, NSUInteger a13, NSUInteger a14, NSUInteger a15, void *a16, uint64_t a17, void *a18, uint64_t a19)
{
  uint64_t v64 = a1;
  uint64_t v65 = a2;
  NSUInteger v62 = a3;
  NSUInteger v63 = a4;
  uint64_t v60 = a5;
  uint64_t v61 = a6;
  uint64_t v59 = a7;
  NSUInteger v57 = a8;
  NSUInteger v58 = a13;
  NSUInteger v55 = a14;
  NSUInteger v56 = a15;
  id v54 = a16;
  uint64_t v53 = a17;
  uint64_t v52 = a18;
  double v48 = a9;
  double v49 = a10;
  double v50 = a11;
  long double v51 = a12;
  uint64_t v47 = a19 + 16;
  NSUInteger v45 = a3;
  NSUInteger v46 = a4;
  v66.NSUInteger location = a3;
  v66.NSUInteger length = a4;
  NSUInteger v43 = a8;
  NSUInteger v44 = a13;
  v67.NSUInteger location = a8;
  v67.NSUInteger length = a13;
  NSRange v42 = NSUnionRange(v66, v67);
  NSRange v41 = v42;
  NSRange v40 = v42;
  NSUInteger v38 = a14;
  NSUInteger v39 = a15;
  v68.NSUInteger location = a14;
  v68.NSUInteger length = a15;
  NSRange v37 = NSUnionRange(v42, v68);
  NSRange v36 = v37;
  BOOL v35 = a3 != 0;
  NSRange v34 = v42;
  id v22 = objc_msgSend(a16, (SEL)0x1F6C6086ELL, v42);
  id v33 = v22;
  NSRange v32 = v37;
  id v27 = objc_msgSend(a16, (SEL)0x1F6C6086ELL, v37.location, v37.length);
  id v31 = v27;
  char v30 = sub_1DDEDD24C(v22, a18, a3 != 0, 0, a9, a10, a11, a12) & 1;
  char v28 = sub_1DDEDD24C(v27, a18, a3 != 0, 1, a9, a10, a11, a12);
  v29[25] = v28 & 1;
  if (v30) {
    char v19 = 0;
  }
  else {
    char v19 = v28 ^ 1;
  }
  if (v19)
  {
    v29[0] = 1;
    sub_1DDED77E0((uint64_t)v29, a7, MEMORY[0x1E4FBCD18]);
  }
  else
  {
    swift_beginAccess();
    *(void *)(a19 + 16) = v42.location;
    swift_endAccess();
  }
}

uint64_t sub_1DDEDD24C(void *a1, void *a2, int a3, int a4, double a5, double a6, double a7, long double a8)
{
  uint64_t v64 = a1;
  NSUInteger v55 = a2;
  int v63 = a3;
  double v50 = a5;
  double v51 = a6;
  double v52 = a7;
  long double v53 = a8;
  int v54 = a4;
  uint64_t v84 = 0;
  uint64_t v83 = 0;
  char v82 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  char v79 = 0;
  uint64_t v78 = 0;
  id v77 = 0;
  long long v73 = 0u;
  long long v74 = 0u;
  double v72 = 0.0;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  BOOL v66 = 0;
  id v65 = 0;
  uint64_t v56 = sub_1DDEEF948();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v58 = v56 - 8;
  unint64_t v59 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v64);
  uint64_t v60 = (char *)&v36 - v59;
  unint64_t v61 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v11 = MEMORY[0x1F4188790](v10);
  NSUInteger v62 = (char *)&v36 - v61;
  uint64_t v84 = v12;
  uint64_t v83 = v13;
  char v82 = v14 & 1;
  *(double *)&long long v80 = v11;
  *((void *)&v80 + 1) = v15;
  *(void *)&long long v81 = v16;
  *((void *)&v81 + 1) = v17;
  char v79 = v18 & 1;
  uint64_t v78 = v8;
  id v19 = v12;
  id v77 = v64;
  if (v63)
  {
    uint64_t v48 = 0;
    sub_1DDDBF9C8();
    id v20 = v64;
    id v49 = sub_1DDED7870(v64);
    id v65 = v49;
    objc_msgSend(v49, sel_insertAttributedString_atIndex_, v55, v48);
    id v21 = v49;
    id v22 = v77;
    id v77 = v49;
  }
  objc_msgSend(v55, sel_size);
  uint64_t v75 = v23;
  double v76 = v24;
  sub_1DDEDDEF0(v55, v52, v24);
  double v46 = v25;
  *(void *)&long long v73 = v26;
  *((void *)&v73 + 1) = v27;
  *(void *)&long long v74 = v28;
  *((double *)&v74 + 1) = v25;
  double v72 = sub_1DDEDDD20(v54 & 1);
  double v45 = v52 * v72;
  (*(void (**)(char *, void, uint64_t))(v57 + 104))(v62, *MEMORY[0x1E4FBBEA8], v56);
  double v71 = v46;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v60, v62, v56);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 88))(v60, v56);
  int v47 = result;
  if (result == *MEMORY[0x1E4FBBEA0])
  {
    double v71 = round(v46);
    goto LABEL_17;
  }
  if (v47 == *MEMORY[0x1E4FBBE98])
  {
    double v71 = rint(v46);
    goto LABEL_17;
  }
  if (v47 == *MEMORY[0x1E4FBBEA8]) {
    goto LABEL_15;
  }
  if (v47 == *MEMORY[0x1E4FBBEB0])
  {
LABEL_16:
    double v71 = floor(v46);
    goto LABEL_17;
  }
  if (v47 == *MEMORY[0x1E4FBBE88])
  {
    double v71 = trunc(v46);
    goto LABEL_17;
  }
  if (v47 != *MEMORY[0x1E4FBBE90])
  {
    sub_1DDEEEFC8();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v56);
LABEL_17:
    double v37 = v71;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v62, v56);
    fmax(v53, v37);
    sub_1DDEEEFF8();
    double v42 = v30;
    CGFloat v41 = 0.0;
    long long v69 = 0uLL;
    *(double *)&long long v70 = v45;
    *((double *)&v70 + 1) = v30;
    NSUInteger v38 = v77;
    id v31 = v77;
    sub_1DDEDDEF0(v38, v45, v42);
    *(void *)&long long v39 = v32;
    *((void *)&v39 + 1) = v33;
    *(void *)&long long v40 = v34;
    *((void *)&v40 + 1) = v35;

    long long v67 = v39;
    long long v68 = v40;
    BOOL v43 = sub_1DDEDE028(*(CGFloat *)&v39, *((CGFloat *)&v39 + 1), *(CGFloat *)&v40, *((CGFloat *)&v40 + 1), v41, v41, v45, v42);
    BOOL v66 = v43;

    return v43;
  }
  uint64_t v44 = *(void *)&v46 >> 63;
  if (v46 >= 0.0)
  {
LABEL_15:
    double v71 = ceil(v46);
    goto LABEL_17;
  }
  if (v44 == 1) {
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id SnippetGenerator.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SnippetGenerator.init()()
{
  id v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v4, sel_init);
  id v1 = v3;
  id v5 = v3;

  return v3;
}

id SnippetGenerator.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DDEDDCA4(double a1)
{
  if (0.5 == a1)
  {
    char v3 = 0;
    return v3 & 1;
  }
  if (1.0 == a1)
  {
    char v3 = 1;
    return v3 & 1;
  }
  return 2;
}

double sub_1DDEDDD20(char a1)
{
  if (a1) {
    return 1.0;
  }
  else {
    return 0.5;
  }
}

uint64_t sub_1DDEDDD60()
{
  return sub_1DDEEF9C8() & 1;
}

uint64_t sub_1DDEDDDB0()
{
  return sub_1DDEEED68();
}

uint64_t sub_1DDEDDDF4()
{
  return sub_1DDEEED88();
}

uint64_t sub_1DDEDDE40()
{
  return sub_1DDEEED78();
}

uint64_t sub_1DDEDDE8C@<X0>(double *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1DDEDDCA4(*a1);
  *a2 = result;
  return result;
}

void sub_1DDEDDEBC(double *a1@<X8>)
{
  *a1 = sub_1DDEDDD20(*v1 & 1);
}

id sub_1DDEDDEF0(void *a1, double a2, double a3)
{
  double v6 = a2 * 2.0;
  double v7 = a3 * 2.0;
  type metadata accessor for NSStringDrawingOptions();
  sub_1DDEEF9A8();
  void *v3 = 1;
  v3[1] = 2;
  sub_1DDD4242C();
  sub_1DDD39BE0();
  sub_1DDEEF638();
  return objc_msgSend(a1, sel_boundingRectWithSize_options_context_, v9, 0, v6, v7, *(void *)&a2);
}

BOOL sub_1DDEDE028(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v13.origin.x = a5;
  v13.origin.y = a6;
  v13.size.width = a7;
  v13.size.height = a8;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  return CGRectContainsRect(v13, v14);
}

uint64_t sub_1DDEDE0BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DDED93AC(a1);
}

uint64_t sub_1DDEDE0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DDED8AB8(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1DDEDE0F0()
{
  return swift_deallocObject();
}

void (*sub_1DDEDE11C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(void)
{
  return sub_1DDED9684(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_1DDEDE124()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEDE150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DDED9A58(a1, a2, a3, a4, *(uint64_t (**)(void))(v4 + 16));
}

uint64_t sub_1DDEDE15C()
{
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1DDEDE1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DDED9B6C(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void **)(v4 + 32), *(void (**)(void, void, void))(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 56));
}

uint64_t sub_1DDEDE1F0()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_11_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_12_0()
{
  return swift_release();
}

Swift::Int sub_1DDEDE280@<X0>(__C::_NSRange *a1@<X0>, __C::_NSRange *a2@<X8>)
{
  return sub_1DDEDB3B0(a1, *(void *)(v2 + 32), a2);
}

unint64_t sub_1DDEDE2B4()
{
  uint64_t v2 = qword_1EBEA1FB8;
  if (!qword_1EBEA1FB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1FB8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDE338()
{
  uint64_t v2 = qword_1EBEA2238;
  if (!qword_1EBEA2238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA2250);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA2238);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDE3BC()
{
  uint64_t v2 = qword_1EBEA1FD8;
  if (!qword_1EBEA1FD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1FD0);
    sub_1DDEDE45C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1FD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDE45C()
{
  uint64_t v2 = qword_1EBEA1E90;
  if (!qword_1EBEA1E90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1E90);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEDE4D8(uint64_t a1)
{
  return sub_1DDEDBC68(a1, v1[2], v1[3], v1[4]);
}

id sub_1DDEDE50C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1DDEDBE48(*(id *)(v2 + 16), a1, a2);
}

unint64_t sub_1DDEDE538()
{
  uint64_t v2 = qword_1EBEA2248;
  if (!qword_1EBEA2248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA2250);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA2248);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDE5BC()
{
  uint64_t v2 = qword_1EBEA1F58;
  if (!qword_1EBEA1F58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F50);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1F58);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDE640()
{
  uint64_t v2 = qword_1EBEA1FE0;
  if (!qword_1EBEA1FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1FD0);
    sub_1DDEDE45C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1FE0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEDE6E0@<X0>(BOOL *a1@<X8>)
{
  return sub_1DDEDBEC8(a1);
}

unint64_t sub_1DDEDE70C()
{
  uint64_t v2 = qword_1EBEA1F68;
  if (!qword_1EBEA1F68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F60);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1F68);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEDE790()
{
  return swift_deallocObject();
}

uint64_t sub_1DDEDE7BC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DDEDE80C(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_1DDEDCEB4(a1, a2, a3, a4, a5, a6, a7, *(void *)(v7 + 16), *(double *)(v7 + 72), *(double *)(v7 + 80), *(double *)(v7 + 88), *(long double *)(v7 + 96), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(void **)(v7 + 48), *(void *)(v7 + 56), *(void **)(v7 + 64), *(void *)(v7 + 104));
}

uint64_t block_copy_helper_22(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_23()
{
  return swift_release();
}

id sub_1DDEDE8E0(void *a1)
{
  id v4 = objc_msgSend(v1, sel_initWithAttributedString_);

  return v4;
}

unint64_t sub_1DDEDE928()
{
  uint64_t v2 = qword_1EAB97B10;
  if (!qword_1EAB97B10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B10);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for SnippetGenerator()
{
  return self;
}

void *type metadata accessor for SnippetGenerator.SnippetPosition()
{
  return &unk_1F39CA458;
}

unint64_t sub_1DDEDE9E4()
{
  return sub_1DDEDE9FC();
}

unint64_t sub_1DDEDE9FC()
{
  uint64_t v2 = qword_1EAB97B28;
  if (!qword_1EAB97B28)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDEA7C()
{
  uint64_t v2 = qword_1EBEA1FA0;
  if (!qword_1EBEA1FA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA1FA0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1DDEDEB00()
{
  uint64_t v2 = qword_1EAB97B38;
  if (!qword_1EAB97B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEA1F98);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B38);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEDEB84(uint64_t a1)
{
  return sub_1DDEDB86C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1DDEDEBB8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = *(void *)(a1 + 24);
    *(void *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

uint64_t sub_1DDEDEC50()
{
  return swift_deallocObject();
}

uint64_t String.height(width:font:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  double v38 = a4;
  id v28 = a1;
  uint64_t v27 = a2;
  uint64_t v43 = a3;
  double v67 = 0.0;
  uint64_t v66 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  double v62 = 0.0;
  double v63 = 0.0;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v32 = 0;
  uint64_t v50 = sub_1DDEEF948();
  uint64_t v48 = *(void *)(v50 - 8);
  uint64_t v49 = v50 - 8;
  unint64_t v25 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v28);
  double v51 = (char *)v23 - v25;
  unint64_t v26 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v6 = MEMORY[0x1F4188790](v5);
  int v47 = (char *)v23 - v26;
  double v67 = v6;
  uint64_t v66 = v7;
  uint64_t v64 = v8;
  uint64_t v65 = v9;
  sub_1DDEEEFD8();
  sub_1DDEEEFF8();
  double v39 = v10;
  double v62 = v38;
  double v63 = v10;
  swift_bridgeObjectRetain();
  id v42 = (id)sub_1DDEEEB58();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1238);
  uint64_t v40 = 1;
  uint64_t v31 = sub_1DDEEF9A8();
  id v29 = v11;
  sub_1DDD53BB4(MEMORY[0x1E4FB06F8], v11);
  id v12 = v28;
  unint64_t v13 = sub_1DDDBF960();
  id v14 = v28;
  uint64_t v15 = v29;
  unint64_t v16 = v13;
  uint64_t v17 = v31;
  v29[4] = v16;
  v15[1] = v14;
  sub_1DDD4242C();
  uint64_t v33 = v17;
  uint64_t v34 = type metadata accessor for Key();
  unint64_t v36 = sub_1DDD3C6A8();
  uint64_t v35 = MEMORY[0x1E4FBC840] + 8;
  uint64_t v37 = sub_1DDEEE998();
  id v41 = (id)sub_1DDEEE958();
  swift_bridgeObjectRelease();
  double v60 = v38;
  double v61 = v39;
  objc_msgSend(v42, sel_boundingRectWithSize_options_attributes_context_, v40, v41, 0, v38, v39);
  uint64_t v56 = v18;
  uint64_t v57 = v19;
  uint64_t v58 = v20;
  uint64_t v59 = v21;
  *(void *)&long long v44 = v18;
  *((void *)&v44 + 1) = v19;
  *(void *)&long long v45 = v20;
  *((void *)&v45 + 1) = v21;

  swift_bridgeObjectRelease();
  long long v54 = v44;
  long long v55 = v45;
  double v46 = sub_1DDD85308(*(double *)&v44, *((double *)&v44 + 1), *(double *)&v45, *((double *)&v45 + 1));
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, *MEMORY[0x1E4FBBEA8], v50);
  double v53 = v46;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v51, v47, v50);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v48 + 88))(v51, v50);
  int v52 = result;
  if (result == *MEMORY[0x1E4FBBEA0])
  {
    double v53 = round(v46);
    goto LABEL_15;
  }
  if (v52 == *MEMORY[0x1E4FBBE98])
  {
    double v53 = rint(v46);
    goto LABEL_15;
  }
  if (v52 == *MEMORY[0x1E4FBBEA8]) {
    goto LABEL_13;
  }
  if (v52 == *MEMORY[0x1E4FBBEB0])
  {
LABEL_14:
    double v53 = floor(v46);
    goto LABEL_15;
  }
  if (v52 == *MEMORY[0x1E4FBBE88])
  {
    double v53 = trunc(v46);
    goto LABEL_15;
  }
  if (v52 != *MEMORY[0x1E4FBBE90])
  {
    sub_1DDEEEFC8();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v50);
LABEL_15:
    *(double *)&v23[1] = v53;
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v50);
  }
  uint64_t v24 = *(void *)&v46 >> 63;
  if (v46 >= 0.0)
  {
LABEL_13:
    double v53 = ceil(v46);
    goto LABEL_15;
  }
  if (v24 == 1) {
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t String.partiallyRedactedSubjectOrSummary.getter()
{
  id v1 = self;
  swift_bridgeObjectRetain();
  id v2 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_ec_partiallyRedactedStringForSubjectOrSummary_, v2);

  uint64_t v4 = sub_1DDEEEB78();
  return v4;
}

uint64_t String.redactedQueryString.getter()
{
  id v1 = self;
  swift_bridgeObjectRetain();
  id v2 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_redactedQueryStringForQueryString_, v2);

  uint64_t v4 = sub_1DDEEEB78();
  return v4;
}

uint64_t String.partiallyRedactedString.getter()
{
  id v1 = self;
  swift_bridgeObjectRetain();
  id v2 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_partiallyRedactedStringForString_, v2);

  uint64_t v4 = sub_1DDEEEB78();
  return v4;
}

uint64_t String.partiallyRedactedAddress.getter()
{
  id v3 = self;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1DDEEEB58();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_ec_partiallyRedactedStringForAddress_localPart_domain_, v4, 0);

  if (!v5) {
    return 0;
  }
  uint64_t v1 = sub_1DDEEEB78();

  return v1;
}

uint64_t *sub_1DDEDF5B8()
{
  if (qword_1EBEA1D58 != -1) {
    swift_once();
  }
  return &qword_1EBEA1D48;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.title.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.buttonConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(int *)(type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model() + 20);
  uint64_t v2 = sub_1DDEEF468();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

void *TitleAndButtonSupplementaryView_iOS.Model.buttonAction.getter()
{
  id v3 = *(void **)(v0 + *(int *)(type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model() + 24));
  id v1 = v3;
  return v3;
}

uint64_t TitleAndButtonSupplementaryView_iOS.Model.init(title:buttonConfiguration:buttonAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, char *a5@<X8>)
{
  unint64_t v25 = a5;
  uint64_t v22 = a1;
  uint64_t v31 = a2;
  uint64_t v29 = a3;
  id v26 = a4;
  uint64_t v37 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  v19[1] = 0;
  uint64_t v30 = sub_1DDEEF468();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v20 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v23 = (char *)v19 - v20;
  uint64_t v24 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  unint64_t v21 = (*(void *)(*(void *)(v24 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v31);
  uint64_t v32 = (void *)((char *)v19 - v21);
  uint64_t v37 = (char *)v19 - v21;
  uint64_t v35 = v5;
  uint64_t v36 = v6;
  uint64_t v34 = v7;
  uint64_t v33 = v8;
  swift_bridgeObjectRetain();
  uint64_t v9 = v23;
  uint64_t v10 = v27;
  uint64_t v11 = v29;
  uint64_t v12 = v30;
  uint64_t v13 = v31;
  id v14 = v32;
  *uint64_t v32 = v22;
  v14[1] = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))((uint64_t)v32 + *(int *)(v24 + 20), v23, v30);
  id v15 = v26;
  unint64_t v16 = v25;
  uint64_t v17 = (char *)v32;
  *(void *)((char *)v32 + *(int *)(v24 + 24)) = v26;
  sub_1DDEE02D8(v17, v16);

  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v30);
  swift_bridgeObjectRelease();
  return sub_1DDEE03BC((uint64_t)v32);
}

uint64_t TitleAndButtonSupplementaryView_iOS.model.getter@<X0>(void *a1@<X8>)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  swift_beginAccess();
  sub_1DDEE0458(v3, a1);
  return swift_endAccess();
}

void sub_1DDEDF9AC(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v10 = a2;
  uint64_t v4 = a1;
  unint64_t v5 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v4);
  uint64_t v9 = (uint64_t *)((char *)&v4 - v5);
  uint64_t v6 = *v2;
  id v3 = v6;
  uint64_t v13 = v6;
  id v11 = v6;
  uint64_t v7 = &v6[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model];
  uint64_t v8 = &v12;
  swift_beginAccess();
  sub_1DDEE0458(v7, v9);
  swift_endAccess();
  sub_1DDEE2330(v9, v10);
}

void sub_1DDEDFA9C(uint64_t a1, id *a2)
{
  uint64_t v5 = a1;
  uint64_t v7 = a2;
  unint64_t v6 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (uint64_t)&v4 - v6;
  sub_1DDEE0458(v2, (uint64_t *)((char *)&v4 - v6));
  id v8 = *v7;
  id v3 = v8;
  id v11 = v8;
  id v10 = v8;
  TitleAndButtonSupplementaryView_iOS.model.setter(v9);
}

uint64_t TitleAndButtonSupplementaryView_iOS.model.setter(uint64_t a1)
{
  uint64_t v8 = a1;
  id v11 = 0;
  uint64_t v10 = 0;
  unint64_t v4 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v8);
  uint64_t v5 = (unint64_t *)((char *)&v4 - v4);
  id v11 = v2;
  uint64_t v10 = v1;
  sub_1DDEE0458(v2, (unint64_t *)((char *)&v4 - v4));
  unint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  uint64_t v7 = &v9;
  swift_beginAccess();
  sub_1DDEE05FC(v5, v6);
  swift_endAccess();
  sub_1DDEDFC3C();
  return sub_1DDEE08C0(v8);
}

void sub_1DDEDFC3C()
{
}

Swift::Void __swiftcall TitleAndButtonSupplementaryView_iOS.configure()()
{
  int v47 = 0;
  uint64_t v46 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2E60);
  unint64_t v34 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v1);
  uint64_t v35 = (char *)&v8 - v34;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030);
  unint64_t v36 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v2);
  uint64_t v43 = (char *)&v8 - v36;
  uint64_t v44 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v41 = *(void *)(v44 - 8);
  uint64_t v42 = v44 - 8;
  unint64_t v37 = (*(void *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v44);
  double v38 = (char *)&v8 - v37;
  int v47 = (char *)&v8 - v37;
  uint64_t v46 = v0;
  double v39 = (void *)(v0 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model);
  uint64_t v40 = &v45;
  swift_beginAccess();
  sub_1DDEE0458(v39, v43);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v43, 1, v44) == 1)
  {
    sub_1DDEE08C0((uint64_t)v43);
  }
  else
  {
    sub_1DDEE09A4(v43, v38);
    id v30 = *(id *)&v33[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
    id v3 = v30;
    uint64_t v31 = *(void *)v38;
    uint64_t v32 = *((void *)v38 + 1);
    swift_bridgeObjectRetain();
    if (v32)
    {
      uint64_t v28 = v31;
      uint64_t v29 = v32;
      uint64_t v25 = v32;
      uint64_t v26 = sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      uint64_t v27 = (void *)v26;
    }
    else
    {
      uint64_t v27 = 0;
    }
    id v22 = v27;
    objc_msgSend(v30, sel_setText_);

    unint64_t v4 = v33;
    uint64_t v23 = *(void *)v38;
    uint64_t v24 = *((void *)v38 + 1);
    swift_bridgeObjectRetain();
    if (v24)
    {
      uint64_t v20 = v23;
      uint64_t v21 = v24;
      uint64_t v17 = v24;
      uint64_t v18 = sub_1DDEEEB58();
      swift_bridgeObjectRelease();
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v19 = 0;
    }
    objc_msgSend(v33, sel_setAccessibilityLabel_, v19);

    id v14 = &unk_1EBEA1000;
    id v13 = *(id *)&v33[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button];
    id v5 = v13;
    char v9 = &v38[*(int *)(v44 + 20)];
    uint64_t v12 = sub_1DDEEF468();
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = v12 - 8;
    (*(void (**)(char *, char *))(v10 + 16))(v35, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v35, 0, 1, v12);
    sub_1DDEEF498();

    id v16 = *(id *)&v33[v14[449]];
    id v6 = v16;
    id v15 = *(id *)&v38[*(int *)(v44 + 24)];
    id v7 = v15;
    objc_msgSend(v16, sel_addAction_forControlEvents_, v15, 64);

    sub_1DDEE03BC((uint64_t)v38);
  }
}

void (*TitleAndButtonSupplementaryView_iOS.model.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEE01B4;
}

void sub_1DDEE01B4(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1DDEDFC3C();
  }
}

uint64_t sub_1DDEE0204()
{
  type metadata accessor for TitleAndButtonSupplementaryView_iOS();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1E20);
  uint64_t result = sub_1DDEEEBC8();
  qword_1EBEA1D48 = result;
  qword_1EBEA1D50 = v1;
  return result;
}

uint64_t type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model()
{
  uint64_t v1 = qword_1EBEA1D60;
  if (!qword_1EBEA1D60) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

char *sub_1DDEE02D8(char *a1, char *a2)
{
  *(void *)a2 = *(void *)a1;
  uint64_t v5 = *((void *)a1 + 1);
  swift_bridgeObjectRetain();
  *((void *)a2 + 1) = v5;
  uint64_t v7 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v6 = *(int *)(v7 + 20);
  uint64_t v2 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(&a2[v6], &a1[v6]);
  uint64_t v9 = *(int *)(v7 + 24);
  uint64_t v10 = *(void **)&a1[v9];
  id v3 = v10;
  uint64_t result = a2;
  *(void *)&a2[v9] = v10;
  return result;
}

uint64_t sub_1DDEE03BC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v3 = *(int *)(v4 + 20);
  uint64_t v1 = sub_1DDEEF468();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);

  return a1;
}

void *sub_1DDEE0458(void *a1, void *a2)
{
  uint64_t v13 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v14 + 48))(a1, 1))
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030);
    memcpy(a2, a1, *(void *)(*(void *)(v4 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    uint64_t v6 = a1[1];
    swift_bridgeObjectRetain();
    a2[1] = v6;
    id v8 = (char *)a2 + *(int *)(v13 + 20);
    uint64_t v7 = (char *)a1 + *(int *)(v13 + 20);
    uint64_t v2 = sub_1DDEEF468();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(v8, v7);
    uint64_t v9 = *(int *)(v13 + 24);
    uint64_t v10 = *(void **)((char *)a1 + v9);
    id v3 = v10;
    *(void *)((char *)a2 + v9) = v10;
    (*(void (**)(void))(v14 + 56))();
  }
  return a2;
}

void *sub_1DDEE05FC(void *a1, void *a2)
{
  uint64_t v15 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48);
  if (((unsigned int (*)(void *, uint64_t))v17)(a2, 1))
  {
    if (v17(a1, 1, v15))
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030);
      memcpy(a2, a1, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      *(_OWORD *)a2 = *(_OWORD *)a1;
      uint64_t v10 = (char *)a2 + *(int *)(v15 + 20);
      uint64_t v9 = (char *)a1 + *(int *)(v15 + 20);
      uint64_t v6 = sub_1DDEEF468();
      (*(void (**)(char *, char *))(*(void *)(v6 - 8) + 32))(v10, v9);
      *(void *)((char *)a2 + *(int *)(v15 + 24)) = *(void *)((char *)a1 + *(int *)(v15 + 24));
      (*(void (**)(void))(v16 + 56))();
    }
  }
  else if (v17(a1, 1, v15))
  {
    sub_1DDEE03BC((uint64_t)a2);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030);
    memcpy(a2, a1, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    a2[1] = a1[1];
    swift_bridgeObjectRelease();
    uint64_t v12 = (char *)a2 + *(int *)(v15 + 20);
    uint64_t v11 = (char *)a1 + *(int *)(v15 + 20);
    uint64_t v2 = sub_1DDEEF468();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 40))(v12, v11);
    id v3 = (void **)((char *)a2 + *(int *)(v15 + 24));
    uint64_t v4 = *v3;
    char *v3 = *(void **)((char *)a1 + *(int *)(v15 + 24));
  }
  return a2;
}

uint64_t sub_1DDEE08C0(uint64_t a1)
{
  uint64_t v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(a1, 1))
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1 + *(int *)(v5 + 20);
    uint64_t v1 = sub_1DDEEF468();
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v3);
  }
  return a1;
}

char *sub_1DDEE09A4(char *a1, char *a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  uint64_t v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v4 = *(int *)(v5 + 20);
  uint64_t v2 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(&a2[v4], &a1[v4]);
  uint64_t result = a2;
  *(void *)&a2[*(int *)(v5 + 24)] = *(void *)&a1[*(int *)(v5 + 24)];
  return result;
}

uint64_t type metadata accessor for TitleAndButtonSupplementaryView_iOS()
{
  uint64_t v1 = qword_1EBEA1E10;
  if (!qword_1EBEA1E10) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t static TitleAndButtonSupplementaryView_iOS.reuseIdentifier.getter()
{
  uint64_t v1 = *sub_1DDEDF5B8();
  swift_bridgeObjectRetain();
  return v1;
}

id TitleAndButtonSupplementaryView_iOS.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TitleAndButtonSupplementaryView_iOS.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(double *)&long long v24 = a1;
  *((double *)&v24 + 1) = a2;
  *(double *)&long long v25 = a3;
  *((double *)&v25 + 1) = a4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  long long v31 = v24;
  long long v32 = v25;
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = v4;
  id v8 = v4;
  id v33 = v4;
  uint64_t v18 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model;
  uint64_t v9 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 56))(&v4[v18], 1);

  uint64_t v19 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label;
  sub_1DDD57350();
  *(void *)&v22[v19] = sub_1DDD3CB38();

  uint64_t v20 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button;
  sub_1DDE101FC();
  *(void *)&v22[v20] = sub_1DDD3CB38();

  uint64_t v21 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView;
  sub_1DDD573B8();
  *(void *)&v22[v21] = sub_1DDD3CB38();

  v30.receiver = v33;
  v30.super_class = ObjectType;
  id v28 = objc_msgSendSuper2(&v30, sel_initWithFrame_, v24, v25);
  id v10 = v28;
  id v11 = v28;
  id v12 = v28;
  id v13 = v28;
  id v14 = v28;
  id v33 = v28;
  TitleAndButtonSupplementaryView_iOS.setupLayout()();

  id v26 = (id)*MEMORY[0x1E4F73C58];
  id v15 = (id)*MEMORY[0x1E4F73C58];
  sub_1DDEEEB78();
  id v27 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();

  objc_msgSend(v28, sel_setAccessibilityIdentifier_, v27);
  type metadata accessor for UIAccessibilityTraits();
  sub_1DDEEF9A8();
  *uint64_t v16 = *MEMORY[0x1E4FB2550];
  sub_1DDD4242C();
  sub_1DDEE1514();
  sub_1DDEEF638();
  objc_msgSend(v28, sel_setAccessibilityTraits_, v29);

  objc_msgSend(v28, sel_setIsAccessibilityElement_, 1);
  return v28;
}

Swift::Void __swiftcall TitleAndButtonSupplementaryView_iOS.setupLayout()()
{
  id v21 = *(id *)(v0 + OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView);
  id v1 = v21;
  objc_msgSend(v50, sel_addSubview_, v21);

  sub_1DDD5BDA0();
  id v58 = sub_1DDD3CB38();
  id v23 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v2 = v23;
  id v22 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
  id v3 = v22;
  objc_msgSend(v23, (SEL)0x1F74CBF75, v22);

  id v24 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v4 = v24;
  objc_msgSend(v24, (SEL)0x1F74CBF75, v58);

  id v25 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v5 = v25;
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v26 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v6 = v26;
  objc_msgSend(v26, sel_setAxis_, 0);

  id v27 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v7 = v27;
  objc_msgSend(v27, sel_setDistribution_, 0);

  id v28 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v8 = v28;
  objc_msgSend(v28, sel_setAlignment_, 2);

  id v29 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v9 = v29;
  objc_msgSend(v29, sel_setSpacing_, 1.17549435e-38);

  id v33 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label];
  id v10 = v33;
  id v30 = self;
  id v31 = (id)*MEMORY[0x1E4FB2908];
  id v11 = (id)*MEMORY[0x1E4FB2908];
  id v32 = objc_msgSend(v30, sel_preferredFontForTextStyle_, v31);

  UILabel.contentSizeAdjustingFont(_:)((UIFont)v32);
  uint64_t v56 = self;
  sub_1DDD5784C();
  sub_1DDEEF9A8();
  long long v55 = v12;
  id v34 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v13 = v34;
  id v37 = [v34 (SEL)0x1F7564533];

  id v14 = v50;
  id v35 = [v50 (SEL)0x1F750FFD9];

  id v36 = [v35 (SEL)0x1F7564533];
  id v38 = objc_msgSend(v37, (SEL)0x1F74DE2EELL, v36);

  *long long v55 = v38;
  id v39 = *(id *)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v15 = v39;
  id v42 = [v39 (SEL)0x1F74D6625];

  uint64_t v16 = v50;
  id v40 = [v50 (SEL)0x1F750FFD9];

  id v41 = [v40 (SEL)0x1F74D6625];
  id v43 = objc_msgSend(v42, (SEL)0x1F74DE2EELL, v41);

  v55[1] = v43;
  uint64_t v44 = *(void **)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v17 = v44;
  id v47 = [v44 (SEL)0x1F751023ALL];

  uint64_t v18 = v50;
  id v45 = [v50 (SEL)0x1F752C863];

  id v46 = [v45 (SEL)0x1F751023ALL];
  id v48 = objc_msgSend(v47, (SEL)0x1F74DE2EELL, v46);

  v55[2] = v48;
  uint64_t v49 = *(void **)&v50[OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView];
  id v19 = v49;
  id v53 = [v49 (SEL)0x1F7565494];

  uint64_t v20 = v50;
  id v51 = [v50 (SEL)0x1F752C863];

  id v52 = [v51 (SEL)0x1F7565494];
  id v54 = objc_msgSend(v53, (SEL)0x1F74DE2EELL, v52);

  v55[3] = v54;
  sub_1DDD4242C();
  uint64_t v57 = (void *)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v56, sel_activateConstraints_, v57);
}

unint64_t sub_1DDEE1514()
{
  uint64_t v2 = qword_1EBEA3128;
  if (!qword_1EBEA3128)
  {
    type metadata accessor for UIAccessibilityTraits();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EBEA3128);
    return WitnessTable;
  }
  return v2;
}

void sub_1DDEE15E4()
{
  id v1 = v0;
  uint64_t v2 = v0;
  id v3 = v0;
  id v4 = v0;
  uint64_t v6 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_model;
  uint64_t v5 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 56))(&v0[v6], 1);

  uint64_t v7 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_label;
  sub_1DDD57350();
  *(void *)&v10[v7] = sub_1DDD3CB38();

  uint64_t v8 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_button;
  sub_1DDE101FC();
  *(void *)&v10[v8] = sub_1DDD3CB38();

  uint64_t v9 = OBJC_IVAR____TtC6MailUI35TitleAndButtonSupplementaryView_iOS_stackView;
  sub_1DDD573B8();
  *(void *)&v10[v9] = sub_1DDD3CB38();

  sub_1DDEEEC08();
  sub_1DDEEF7E8();
  __break(1u);
}

id TitleAndButtonSupplementaryView_iOS.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DDEE1898(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
}

void sub_1DDEE18B0(uint64_t a1, id *a2)
{
}

uint64_t sub_1DDEE18C8()
{
  return type metadata accessor for TitleAndButtonSupplementaryView_iOS();
}

uint64_t sub_1DDEE18E4()
{
  uint64_t updated = sub_1DDEE19E4();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_1DDEE19E4()
{
  uint64_t v4 = qword_1EBEA1DA0;
  if (!qword_1EBEA1DA0)
  {
    type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
    unint64_t v3 = sub_1DDEEF4F8();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_1EBEA1DA0);
      return v1;
    }
  }
  return v4;
}

unint64_t initializeBufferWithCopyOfBuffer for TitleAndButtonSupplementaryView_iOS.Model(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v16 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v16 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    swift_retain();
    *a1 = v11;
    return *a1 + ((v16 + 16) & ~(unint64_t)v16);
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = a2[1];
    swift_bridgeObjectRetain();
    a1[1] = v6;
    uint64_t v8 = (char *)a1 + *(int *)(a3 + 20);
    uint64_t v7 = (char *)a2 + *(int *)(a3 + 20);
    uint64_t v3 = sub_1DDEEF468();
    (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(v8, v7);
    uint64_t v9 = *(int *)(a3 + 24);
    id v10 = *(void **)((char *)a2 + v9);
    id v4 = v10;
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
    return (unint64_t)a1;
  }
}

void destroy for TitleAndButtonSupplementaryView_iOS.Model(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(int *)(a2 + 20);
  uint64_t v2 = sub_1DDEEF468();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v3);
}

char *initializeWithCopy for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v3 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 16))(&a1[v7], &a2[v7]);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)&a2[v10];
  id v4 = v11;
  uint64_t result = a1;
  *(void *)&a1[v10] = v11;
  return result;
}

char *assignWithCopy for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v7 = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  *((void *)a1 + 1) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v3 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 24))(&a1[v8], &a2[v8]);
  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = *(void **)&a2[v11];
  id v4 = v12;
  uint64_t v5 = *(void **)&a1[v11];
  *(void *)&a1[v11] = v12;

  return a1;
}

char *initializeWithTake for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v3 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 32))(&a1[v5], &a2[v5]);
  uint64_t result = a1;
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return result;
}

char *assignWithTake for TitleAndButtonSupplementaryView_iOS.Model(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v3 = sub_1DDEEF468();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 40))(&a1[v7], &a2[v7]);
  id v4 = (void **)&a1[*(int *)(a3 + 24)];
  uint64_t v5 = *v4;
  char *v4 = *(void **)&a2[*(int *)(a3 + 24)];

  return a1;
}

uint64_t getEnumTagSinglePayload for TitleAndButtonSupplementaryView_iOS.Model()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDEE1FE4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_1DDEEF468();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 24)) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 24));
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t storeEnumTagSinglePayload for TitleAndButtonSupplementaryView_iOS.Model()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDEE213C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1DDEEF468();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DDEE2240()
{
  uint64_t v2 = sub_1DDEEF468();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

_OWORD *sub_1DDEE2330(_OWORD *a1, _OWORD *a2)
{
  uint64_t v9 = type metadata accessor for TitleAndButtonSupplementaryView_iOS.Model();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t))(v10 + 48))(a1, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3030);
    memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    *a2 = *a1;
    uint64_t v6 = (char *)a2 + *(int *)(v9 + 20);
    unsigned int v5 = (char *)a1 + *(int *)(v9 + 20);
    uint64_t v2 = sub_1DDEEF468();
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(v6, v5);
    *(void *)((char *)a2 + *(int *)(v9 + 24)) = *(void *)((char *)a1 + *(int *)(v9 + 24));
    (*(void (**)(void))(v10 + 56))();
  }
  return a2;
}

uint64_t *sub_1DDEE24A0()
{
  if (qword_1EBEA1C60 != -1) {
    swift_once();
  }
  return &qword_1EBEA1C48;
}

uint64_t TitleSupplementaryView.title.getter()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

void sub_1DDEE2578(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (char *)*a1;
  id v2 = *a1;
  int v4 = &v3[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  swift_beginAccess();
  uint64_t v5 = *(void *)v4;
  uint64_t v7 = *((void *)v4 + 1);
  swift_bridgeObjectRetain();
  swift_endAccess();
  *a2 = v5;
  a2[1] = v7;
}

void sub_1DDEE2618(void *a1, id *a2)
{
  sub_1DDD53C00(a1, v7);
  uint64_t v6 = v7[0];
  uint64_t v5 = v7[1];
  id v4 = *a2;
  id v2 = *a2;
  TitleSupplementaryView.title.setter(v6, v5);
}

uint64_t TitleSupplementaryView.title.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1DDEE272C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DDEE272C()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  swift_bridgeObjectRetain();
  swift_endAccess();
  sub_1DDEE27AC(v3, v4);
  return swift_bridgeObjectRelease();
}

void sub_1DDEE27AC(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label);
  id v3 = v10;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v7 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    uint64_t v8 = (void *)v7;
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_msgSend(v10, sel_setText_);

  id v4 = v9;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v5 = sub_1DDEEEB58();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v9, sel_setAccessibilityLabel_);
}

uint64_t (*TitleSupplementaryView.title.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEE299C;
}

uint64_t sub_1DDEE299C(uint64_t a1, char a2)
{
  if (a2) {
    return swift_endAccess();
  }
  swift_endAccess();
  return sub_1DDEE272C();
}

double TitleSupplementaryView.horizontalPadding.getter()
{
  uint64_t v2 = (double *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
  swift_beginAccess();
  double v3 = *v2;
  swift_endAccess();
  return v3;
}

void sub_1DDEE2A50(id *a1@<X0>, void *a2@<X8>)
{
  double v3 = (char *)*a1;
  id v2 = *a1;
  id v4 = &v3[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  uint64_t v6 = *(void *)v4;
  swift_endAccess();
  *a2 = v6;
}

void sub_1DDEE2ADC(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  TitleSupplementaryView.horizontalPadding.setter(v4);
}

void TitleSupplementaryView.horizontalPadding.setter(double a1)
{
  id v2 = (double *)(v1 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
  swift_beginAccess();
  *id v2 = a1;
  swift_endAccess();
  sub_1DDEE2BA4();
}

void sub_1DDEE2BA4()
{
}

void sub_1DDEE2BD0()
{
  uint64_t v11 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint;
  id v12 = (void *)(v0 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint);
  swift_beginAccess();
  if (*v12)
  {
    id v9 = *(id *)(v10 + v11);
    id v1 = v9;
    swift_endAccess();
    uint64_t v7 = (double *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
    swift_beginAccess();
    double v8 = *v7;
    swift_endAccess();
    objc_msgSend(v9, sel_setConstant_, v8);
  }
  else
  {
    swift_endAccess();
  }
  uint64_t v6 = (id *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint);
  swift_beginAccess();
  if (*v6)
  {
    id v5 = *v6;
    id v2 = *v6;
    swift_endAccess();
    id v3 = (double *)(v10 + OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding);
    swift_beginAccess();
    double v4 = *v3;
    swift_endAccess();
    objc_msgSend(v5, sel_setConstant_, v4);
  }
  else
  {
    swift_endAccess();
  }
}

void (*TitleSupplementaryView.horizontalPadding.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DDEE2DF8;
}

void sub_1DDEE2DF8(uint64_t a1, char a2)
{
  if (a2)
  {
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_1DDEE2BA4();
  }
}

uint64_t sub_1DDEE2E48()
{
  type metadata accessor for TitleSupplementaryView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA1C68);
  uint64_t result = sub_1DDEEEBC8();
  qword_1EBEA1C48 = result;
  qword_1EBEA1C50 = v1;
  return result;
}

uint64_t type metadata accessor for TitleSupplementaryView()
{
  return self;
}

uint64_t static TitleSupplementaryView.reuseIdentifier.getter()
{
  uint64_t v1 = *sub_1DDEE24A0();
  swift_bridgeObjectRetain();
  return v1;
}

id TitleSupplementaryView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TitleSupplementaryView.init(frame:)(double a1, double a2, double a3, double a4)
{
  *(double *)&long long v21 = a1;
  *((double *)&v21 + 1) = a2;
  *(double *)&long long v22 = a3;
  *((double *)&v22 + 1) = a4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  long long v28 = v21;
  long long v29 = v22;
  id v5 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = v4;
  double v8 = v4;
  id v9 = v4;
  id v30 = v4;
  uint64_t v10 = &v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;

  *(void *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding] = 0;
  uint64_t v19 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label;
  sub_1DDD57350();
  *(void *)&v4[v19] = sub_1DDD3CB38();

  *(void *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint] = 0;
  *(void *)&v4[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint] = 0;

  v27.receiver = v30;
  v27.super_class = ObjectType;
  id v25 = objc_msgSendSuper2(&v27, sel_initWithFrame_, v21, v22);
  id v11 = v25;
  id v12 = v25;
  id v13 = v25;
  id v14 = v25;
  id v15 = v25;
  id v30 = v25;
  sub_1DDEE3254();

  id v23 = (id)*MEMORY[0x1E4F73C58];
  id v16 = (id)*MEMORY[0x1E4F73C58];
  sub_1DDEEEB78();
  id v24 = (id)sub_1DDEEEB58();
  swift_bridgeObjectRelease();

  objc_msgSend(v25, sel_setAccessibilityIdentifier_, v24);
  type metadata accessor for UIAccessibilityTraits();
  sub_1DDEEF9A8();
  *id v17 = *MEMORY[0x1E4FB2550];
  sub_1DDD4242C();
  sub_1DDEE1514();
  sub_1DDEEF638();
  objc_msgSend(v25, sel_setAccessibilityTraits_, v26);

  objc_msgSend(v25, sel_setIsAccessibilityElement_, 1);
  return v25;
}

void sub_1DDEE3254()
{
  id v17 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v1 = v17;
  objc_msgSend(v0, sel_addSubview_, v17);

  id v18 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v2 = v18;
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v23 = *(id *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v3 = v23;
  id v19 = self;
  id v20 = (id)*MEMORY[0x1E4FB2908];
  id v4 = (id)*MEMORY[0x1E4FB2908];
  id v22 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

  UILabel.contentSizeAdjustingFont(_:)((UIFont)v22);
  id v24 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v5 = v24;
  id v29 = [v24 (SEL)0x1F751023ALL];

  uint64_t v6 = v21;
  id v25 = [v21 (SEL)0x1F752C863];

  id v28 = [v25 (SEL)0x1F751023ALL];
  uint64_t v26 = (double *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  double v27 = *v26;
  swift_endAccess();
  id v31 = objc_msgSend(v29, (SEL)0x1F74DE307, v28, v27);

  id v30 = (void **)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint];
  swift_beginAccess();
  uint64_t v7 = *v30;
  void *v30 = v31;

  swift_endAccess();
  id v32 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v8 = v32;
  id v37 = [v32 (SEL)0x1F7565494];

  id v9 = v21;
  id v33 = [v21 (SEL)0x1F752C863];

  id v36 = [v33 (SEL)0x1F7565494];
  id v34 = (double *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding];
  swift_beginAccess();
  double v35 = *v34;
  swift_endAccess();
  id v39 = objc_msgSend(v37, (SEL)0x1F74DE307, v36, v35);

  id v38 = (void **)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint];
  swift_beginAccess();
  uint64_t v10 = *v38;
  *id v38 = v39;

  swift_endAccess();
  id v40 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3118);
  sub_1DDEEF9A8();
  id v53 = v11;
  id v41 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v12 = v41;
  id v44 = [v41 (SEL)0x1F7564533];

  id v13 = v21;
  id v42 = [v21 (SEL)0x1F750FFD9];

  id v43 = [v42 (SEL)0x1F7564533];
  id v45 = objc_msgSend(v44, (SEL)0x1F74DE307, v43, 16.0);

  *id v53 = v45;
  id v46 = *(id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label];
  id v14 = v46;
  id v49 = [v46 (SEL)0x1F74D6625];

  id v15 = v21;
  id v47 = [v21 (SEL)0x1F750FFD9];

  id v48 = [v47 (SEL)0x1F74D6625];
  id v50 = objc_msgSend(v49, (SEL)0x1F74DE307, v48, -8.0);

  v53[1] = v50;
  id v51 = (id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint];
  swift_beginAccess();
  sub_1DDD53BB4(v51, v53 + 2);
  swift_endAccess();
  id v52 = (id *)&v21[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint];
  swift_beginAccess();
  sub_1DDD53BB4(v52, v53 + 3);
  swift_endAccess();
  sub_1DDD4242C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA3098);
  sub_1DDD5784C();
  sub_1DDE0C564();
  sub_1DDEEECA8();
  sub_1DDD31430();
  id v16 = (id)sub_1DDEEED98();
  swift_bridgeObjectRelease();
  objc_msgSend(v40, sel_activateConstraints_, v16);
}

void sub_1DDEE39C0()
{
  id v1 = v0;
  id v2 = v0;
  id v3 = v0;
  id v4 = v0;
  id v5 = v0;
  uint64_t v6 = &v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_title];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;

  *(void *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_horizontalPadding] = 0;
  uint64_t v7 = OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_label;
  sub_1DDD57350();
  *(void *)&v0[v7] = sub_1DDD3CB38();

  *(void *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_leadingConstraint] = 0;
  *(void *)&v0[OBJC_IVAR____TtC6MailUI22TitleSupplementaryView_trailingConstraint] = 0;

  sub_1DDEEEC08();
  sub_1DDEEF7E8();
  __break(1u);
}

id TitleSupplementaryView.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1DDEE3C30(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_1DDEE3C48(void *a1, id *a2)
{
}

void sub_1DDEE3C60(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_1DDEE3C78(double *a1, id *a2)
{
}

uint64_t ToolboxErrors.localizedStringResource.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  id v30 = "Dialog to show and say when the user has asked to unsubscribe to a non-mailing list email, which we won't be able to do.";
  id v31 = "Cannot_Unsubscribe_Dialog";
  id v32 = "Dialog to show and say when the user has asked to do something with Mail, but they haven't set up an account yet.";
  id v33 = "No_Active_Accounts_Dialog";
  id v34 = "Dialog to show and say when the user has asked to do something with emails, but we did not find any matching results.";
  double v35 = "No_Messages_Found_Dialog";
  id v36 = "Dialog to show and say when the user has asked to undo the email they just sent, but we cannot.";
  id v37 = "Undo_Send_Failed_Dialog";
  id v38 = "Dialog to show and say when the user has asked to save an email message as a draft, but attachments are not done"
        " loading onto the message.";
  id v39 = "Incomplete_Attachments_Dialog";
  id v40 = "Dialog to show and say when the user has asked to make edits to an email message draft, but is not actively comp"
        "osing an email message draft.";
  id v41 = "Active_Draft_Not_Found_Dialog";
  unsigned __int8 v69 = 0;
  uint64_t v44 = 0;
  unint64_t v42 = (*(void *)(*(void *)(sub_1DDEECC68() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v43 = (uint64_t)v10 - v42;
  unint64_t v45 = (*(void *)(*(void *)(sub_1DDEECE98() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v44);
  id v46 = (char *)v10 - v45;
  uint64_t v2 = sub_1DDEEEB48();
  unint64_t v47 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v2);
  id v48 = (char *)v10 - v47;
  unsigned __int8 v69 = *v1;
  uint64_t v49 = v69;
  switch(v69)
  {
    case 1u:
      int v23 = 1;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v24 = sub_1DDEEEC08();
      uint64_t v25 = v5;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      id v53 = v38;
      uint64_t v54 = 138;
      __int16 v55 = 2;
      uint64_t result = sub_1DDEECC88();
      break;
    case 2u:
      int v20 = 1;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v21 = sub_1DDEEEC08();
      uint64_t v22 = v6;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      uint64_t v56 = v36;
      uint64_t v57 = 95;
      __int16 v58 = 2;
      uint64_t result = sub_1DDEECC88();
      break;
    case 3u:
      int v17 = 1;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v18 = sub_1DDEEEC08();
      uint64_t v19 = v7;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      uint64_t v59 = v34;
      uint64_t v60 = 117;
      __int16 v61 = 2;
      uint64_t result = sub_1DDEECC88();
      break;
    case 4u:
      int v13 = 1;
      int v14 = 0;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v15 = sub_1DDEEEC08();
      uint64_t v16 = v8;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      double v62 = v32;
      uint64_t v63 = 113;
      char v64 = 2;
      char v65 = v14 & 1;
      uint64_t result = sub_1DDEECC88();
      break;
    case 5u:
      v10[1] = 1;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v11 = sub_1DDEEEC08();
      uint64_t v12 = v9;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      uint64_t v66 = v30;
      uint64_t v67 = 120;
      __int16 v68 = 2;
      uint64_t result = sub_1DDEECC88();
      break;
    default:
      int v26 = 1;
      sub_1DDEEEC08();
      sub_1DDEEEAD8();
      uint64_t v27 = sub_1DDEEEC08();
      uint64_t v28 = v3;
      sub_1DDD95DD8();
      sub_1DDDBC024(v43);
      id v50 = v40;
      uint64_t v51 = 141;
      __int16 v52 = 2;
      uint64_t result = sub_1DDEECC88();
      break;
  }
  return result;
}

BOOL static ToolboxErrors.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  switch(*a1)
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
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(*a2)
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
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t ToolboxErrors.hash(into:)()
{
  return sub_1DDEEFAF8();
}

uint64_t ToolboxErrors.hashValue.getter()
{
  return sub_1DDEEF6D8();
}

unint64_t sub_1DDEE478C()
{
  uint64_t v2 = qword_1EAB97B68;
  if (!qword_1EAB97B68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B68);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_1DDEE480C(unsigned char *a1, unsigned char *a2)
{
  return static ToolboxErrors.== infix(_:_:)(a1, a2);
}

uint64_t sub_1DDEE4828()
{
  return ToolboxErrors.hashValue.getter();
}

uint64_t sub_1DDEE4840()
{
  return ToolboxErrors.hash(into:)();
}

uint64_t sub_1DDEE4858@<X0>(uint64_t a1@<X8>)
{
  return ToolboxErrors.localizedStringResource.getter(a1);
}

unint64_t sub_1DDEE4870()
{
  return sub_1DDEE4888();
}

unint64_t sub_1DDEE4888()
{
  uint64_t v2 = qword_1EAB97B70;
  if (!qword_1EAB97B70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B70);
    return WitnessTable;
  }
  return v2;
}

ValueMetadata *type metadata accessor for ToolboxErrors()
{
  return &type metadata for ToolboxErrors;
}

uint64_t static SearchItem.TopHit.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  v5[1] = a1;
  uint64_t v9 = a2;
  uint64_t v21 = 0;
  uint64_t v20 = 0;
  uint64_t v16 = sub_1DDEECE78();
  uint64_t v12 = *(void **)(v16 - 8);
  uint64_t v13 = v16 - 8;
  uint64_t v7 = v12[8];
  unint64_t v6 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v16);
  int v14 = (char *)v5 - v6;
  unint64_t v8 = v6;
  double v2 = MEMORY[0x1F4188790]((char *)v5 - v6);
  uint64_t v15 = (char *)v5 - v8;
  uint64_t v21 = v3;
  uint64_t v20 = v9;
  uint64_t v11 = (void (*)(double))v12[2];
  uint64_t v10 = v12 + 2;
  v11(v2);
  ((void (*)(char *, uint64_t, uint64_t))v11)(v14, v9, v16);
  int v19 = sub_1DDEECE48();
  uint64_t v18 = (void (*)(char *, uint64_t))v12[1];
  int v17 = v12 + 1;
  v18(v14, v16);
  v18(v15, v16);
  return v19 & 1;
}

uint64_t SearchItem.TopHit.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_1DDEECE78();
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 - 8) + 16))(a1);
}

uint64_t SearchItem.TopHit.id.setter(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = sub_1DDEECE78();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v6 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x1F4188790](v11);
  uint64_t v7 = (char *)&v5 - v6;
  uint64_t v14 = v3;
  uint64_t v13 = v1;
  (*(void (**)(double))(v9 + 16))(v2);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v8, v7, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);
}

void (*SearchItem.TopHit.id.modify())()
{
  return sub_1DDD52CCC;
}

void *SearchItem.TopHit.message.getter()
{
  uint64_t v3 = *(void **)(v0 + *(int *)(type metadata accessor for SearchItem.TopHit() + 20));
  id v1 = v3;
  return v3;
}

uint64_t type metadata accessor for SearchItem.TopHit()
{
  uint64_t v1 = qword_1EBEA1790;
  if (!qword_1EBEA1790) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void SearchItem.TopHit.message.setter(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void **)(v1 + *(int *)(type metadata accessor for SearchItem.TopHit() + 20));
  uint64_t v4 = *v3;
  void *v3 = a1;
}

void (*SearchItem.TopHit.message.modify())()
{
  return sub_1DDD52CCC;
}

uint64_t SearchItem.TopHit.matchingHintsByGlobalMessageID.getter()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for SearchItem.TopHit() + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t SearchItem.TopHit.matchingHintsByGlobalMessageID.setter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  *(void *)(v1 + *(int *)(type metadata accessor for SearchItem.TopHit() + 24)) = a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*SearchItem.TopHit.matchingHintsByGlobalMessageID.modify())()
{
  return sub_1DDD52CCC;
}

uint64_t SearchItem.TopHit.init(id:message:matchingHintsByGlobalMessageID:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v16 = a4;
  uint64_t v21 = a1;
  id v18 = a2;
  uint64_t v17 = a3;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v13 = 0;
  uint64_t v22 = sub_1DDEECE78();
  uint64_t v19 = *(void *)(v22 - 8);
  uint64_t v20 = v22 - 8;
  unint64_t v12 = (*(void *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0);
  uint64_t v14 = (char *)&v12 - v12;
  uint64_t v15 = type metadata accessor for SearchItem.TopHit();
  double v4 = MEMORY[0x1F4188790](v14);
  uint64_t v5 = v19;
  uint64_t v23 = (uint64_t)&v12 - v6;
  uint64_t v27 = (char *)&v12 - v6;
  uint64_t v26 = v7;
  uint64_t v25 = v8;
  uint64_t v24 = v9;
  *(unint64_t *)((char *)&v12 + *(int *)(v15 + 24) - v6) = v13;
  (*(void (**)(double))(v5 + 16))(v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v23, v14, v22);
  id v10 = v18;
  *(void *)(v23 + *(int *)(v15 + 20)) = v18;
  swift_bridgeObjectRetain();
  *(void *)(v23 + *(int *)(v15 + 24)) = v17;
  swift_bridgeObjectRelease();
  sub_1DDEE511C(v23, v16);
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v22);
  return sub_1DDEC697C(v23);
}

uint64_t sub_1DDEE511C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v7 = type metadata accessor for SearchItem.TopHit();
  uint64_t v5 = *(int *)(v7 + 20);
  uint64_t v6 = *(void **)(a1 + v5);
  id v3 = v6;
  *(void *)(a2 + v5) = v6;
  uint64_t v10 = *(int *)(v7 + 24);
  uint64_t v11 = *(void *)(a1 + v10);
  swift_bridgeObjectRetain();
  uint64_t result = a2;
  *(void *)(a2 + v10) = v11;
  return result;
}

uint64_t sub_1DDEE51EC@<X0>(uint64_t a1@<X8>)
{
  return SearchItem.TopHit.id.getter(a1);
}

uint64_t SearchItem.TopHit.hash(into:)(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v7 = v1;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v12 = sub_1DDEECE78();
  uint64_t v9 = *(void *)(v12 - 8);
  uint64_t v10 = v12 - 8;
  unint64_t v8 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v2 = MEMORY[0x1F4188790](v12);
  uint64_t v11 = (char *)&v5 - v8;
  uint64_t v14 = v6;
  uint64_t v13 = v3;
  (*(void (**)(double))(v9 + 16))(v2);
  sub_1DDD86F48();
  sub_1DDEEFAF8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v12);
}

uint64_t SearchItem.TopHit.hashValue.getter()
{
  return sub_1DDEEF6D8();
}

unint64_t sub_1DDEE5368()
{
  uint64_t v2 = qword_1EAB97B78;
  if (!qword_1EAB97B78)
  {
    type metadata accessor for SearchItem.TopHit();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B78);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEE53EC()
{
  return SearchItem.TopHit.hashValue.getter();
}

uint64_t sub_1DDEE5404(uint64_t a1)
{
  return SearchItem.TopHit.hash(into:)(a1);
}

uint64_t sub_1DDEE541C(uint64_t a1, uint64_t a2)
{
  return static SearchItem.TopHit.== infix(_:_:)(a1, a2) & 1;
}

unint64_t sub_1DDEE5438()
{
  return sub_1DDEE5450();
}

unint64_t sub_1DDEE5450()
{
  uint64_t v2 = qword_1EAB97B80;
  if (!qword_1EAB97B80)
  {
    type metadata accessor for SearchItem.TopHit();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B80);
    return WitnessTable;
  }
  return v2;
}

unint64_t _s6TopHitVwCP(void *a1, uint64_t *a2, uint64_t a3)
{
  int v15 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v15 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    swift_retain();
    *a1 = v10;
    return *a1 + ((v15 + 16) & ~(unint64_t)v15);
  }
  else
  {
    uint64_t v3 = sub_1DDEECE78();
    (*(void (**)(void *, uint64_t *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = *(void **)((char *)a2 + v6);
    id v4 = v7;
    *(void *)((char *)a1 + v6) = v7;
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    swift_bridgeObjectRetain();
    *(void *)((char *)a1 + v8) = v9;
    return (unint64_t)a1;
  }
}

uint64_t _s6TopHitVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1DDEECE78();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);

  return swift_bridgeObjectRelease();
}

uint64_t _s6TopHitVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void **)(a2 + v6);
  id v4 = v7;
  *(void *)(a1 + v6) = v7;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void *)(a2 + v11);
  swift_bridgeObjectRetain();
  uint64_t result = a1;
  *(void *)(a1 + v11) = v12;
  return result;
}

uint64_t _s6TopHitVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v4 = v8;
  uint64_t v5 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;

  uint64_t v11 = (void *)(a1 + *(int *)(a3 + 24));
  uint64_t v12 = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  *uint64_t v11 = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6TopHitVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  uint64_t result = a1;
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return result;
}

uint64_t _s6TopHitVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1DDEECE78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  id v4 = (void **)(a1 + *(int *)(a3 + 20));
  uint64_t v5 = *v4;
  void *v4 = *(void **)(a2 + *(int *)(a3 + 20));

  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6TopHitVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDEE59C0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_1DDEECE78();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20)) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20));
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t _s6TopHitVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDEE5B0C(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1DDEECE78();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DDEE5C04()
{
  uint64_t v2 = sub_1DDEECE78();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

BOOL static MUIBackgroundConfigurationStyle.== infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  switch(*a1)
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
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    case 6:
      uint64_t v4 = 6;
      break;
    case 7:
      uint64_t v4 = 7;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(*a2)
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
    case 4:
      uint64_t v3 = 4;
      break;
    case 5:
      uint64_t v3 = 5;
      break;
    case 6:
      uint64_t v3 = 6;
      break;
    case 7:
      uint64_t v3 = 7;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t MUIBackgroundConfigurationStyle.hash(into:)()
{
  return sub_1DDEEFAF8();
}

uint64_t MUIBackgroundConfigurationStyle.hashValue.getter()
{
  return sub_1DDEEF6D8();
}

unint64_t sub_1DDEE5FF4()
{
  uint64_t v2 = qword_1EAB97B88;
  if (!qword_1EAB97B88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B88);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_1DDEE6074(unsigned char *a1, unsigned char *a2)
{
  return static MUIBackgroundConfigurationStyle.== infix(_:_:)(a1, a2);
}

uint64_t sub_1DDEE6090()
{
  return MUIBackgroundConfigurationStyle.hashValue.getter();
}

uint64_t sub_1DDEE60A8()
{
  return MUIBackgroundConfigurationStyle.hash(into:)();
}

uint64_t static UIBackgroundConfiguration.withStyle(_:configuration:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v11 = a4;
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  uint64_t v12 = a3;
  uint64_t v26 = 0;
  unsigned __int8 v25 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v15 = sub_1DDEED5A8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = v15 - 8;
  unint64_t v18 = (*(void *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v14);
  uint64_t v19 = (char *)v10 - v18;
  unint64_t v20 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v21 = (char *)v10 - v20;
  uint64_t v26 = (char *)v10 - v20;
  unsigned __int8 v25 = *v6;
  uint64_t v23 = v7;
  uint64_t v24 = v8;
  uint64_t v22 = v25;
  switch(v25)
  {
    case 1u:
      sub_1DDEED4E8();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 2u:
      sub_1DDEED538();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 3u:
      sub_1DDEED508();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 4u:
      sub_1DDEED548();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 5u:
      sub_1DDEED528();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 6u:
      sub_1DDEED518();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    case 7u:
      sub_1DDEED568();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
    default:
      sub_1DDEED578();
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v19, v15);
      break;
  }
  sub_1DDD7AF80((uint64_t)v13);
  if (v13)
  {
    _DWORD v10[2] = v13;
    v10[3] = v12;
    v10[1] = v12;
    v13(v21);
    swift_release();
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v11, v21, v15);
}

unint64_t sub_1DDEE64A0()
{
  return sub_1DDEE64B8();
}

unint64_t sub_1DDEE64B8()
{
  uint64_t v2 = qword_1EAB97B90;
  if (!qword_1EAB97B90)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B90);
    return WitnessTable;
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for MUIBackgroundConfigurationStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xF8) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 7) >> 8) + 1;
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
      int v5 = (*a1 | ((v6 - 1) << 8)) + 248;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 8;
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

unsigned char *storeEnumTagSinglePayload for MUIBackgroundConfigurationStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xF8)
  {
    unsigned int v5 = ((a3 + 7) >> 8) + 1;
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
  if (a2 > 0xF8)
  {
    unsigned int v4 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
      *uint64_t result = a2 + 7;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MUIBackgroundConfigurationStyle()
{
  return &type metadata for MUIBackgroundConfigurationStyle;
}

uint64_t static UIButton.Configuration.bucketButton(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = a3;
  uint64_t v27 = a1;
  uint64_t v38 = a2;
  unint64_t v47 = 0;
  id v46 = 0;
  unint64_t v45 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAB953C0);
  unint64_t v12 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3);
  uint64_t v13 = (char *)v10 - v12;
  uint64_t v19 = 0;
  uint64_t v14 = sub_1DDEECB68();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = v14 - 8;
  unint64_t v17 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v19);
  unint64_t v18 = (char *)v10 - v17;
  unint64_t v47 = (char *)v10 - v17;
  uint64_t v20 = sub_1DDEECBE8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = v20 - 8;
  unint64_t v23 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v19);
  uint64_t v24 = (char *)v10 - v23;
  unint64_t v25 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v5);
  uint64_t v26 = (char *)v10 - v25;
  id v46 = (char *)v10 - v25;
  uint64_t v28 = sub_1DDEEF468();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = v28 - 8;
  unint64_t v31 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v27);
  id v32 = (char *)v10 - v31;
  unint64_t v45 = (char *)v10 - v31;
  uint64_t v43 = v6;
  uint64_t v44 = v7;
  sub_1DDEEF448();
  sub_1DDEECBD8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v36 = swift_getKeyPath();
  id v33 = self;
  id v34 = (id)*MEMORY[0x1E4FB28F0];
  id v8 = v34;
  id v35 = objc_msgSend(v33, sel_preferredFontForTextStyle_, v34);

  id v37 = &v42;
  id v42 = v35;
  sub_1DDE0F5C4();
  sub_1DDEECBA8();
  swift_bridgeObjectRetain();
  if (v38)
  {
    v10[3] = v27;
    void v10[4] = v38;
    v10[1] = v38;
    _DWORD v10[2] = v27;
    uint64_t v40 = v27;
    uint64_t v41 = v38;
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
    sub_1DDEECB78();
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v13, v18, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    sub_1DDEEF3B8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v11, v32, v28);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v32, v28);
}

void sub_1DDEE6E7C(uint64_t a1)
{
}

void sub_1DDEE6E94()
{
}

uint64_t sub_1DDEE6EAC()
{
  return 8;
}

uint64_t sub_1DDEE6EC0()
{
  return swift_release();
}

uint64_t sub_1DDEE6EDC(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t result = swift_retain();
  *a2 = v4;
  return result;
}

BOOL sub_1DDEE6F14()
{
  return sub_1DDE0C7B4();
}

uint64_t sub_1DDEE6F30()
{
  return sub_1DDE0C880();
}

void *sub_1DDEE6F48(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

double UIFontTextStyle.pointSize(maxCategory:)(void *a1, void *a2)
{
  v18[6] = a1;
  v18[5] = a2;
  uint64_t v16 = (id *)MEMORY[0x1E4FB2608];
  swift_beginAccess();
  id v17 = *v16;
  id v2 = *v16;
  swift_endAccess();
  if (v17)
  {
    id v14 = v17;
  }
  else
  {
    LOBYTE(v7) = 2;
    uint64_t v8 = 14;
    LODWORD(v9) = 0;
    sub_1DDEEF7D8();
    __break(1u);
  }
  id v10 = objc_msgSend(v14, sel_preferredContentSizeCategory, v7, v8, v9);

  v18[0] = v10;
  type metadata accessor for UIContentSizeCategory();
  sub_1DDEE71A8();
  sub_1DDEEFA38();
  sub_1DDD31B20(v18);
  id v12 = v18[4];
  id v3 = a2;
  type metadata accessor for TextStyle();
  sub_1DDD3C498();
  sub_1DDD3C10C();
  id v11 = (id)sub_1DDEEF918();
  id v4 = v12;
  sub_1DDD3C5A0();
  sub_1DDEEF918();
  CTFontDescriptorGetTextStyleSize();
  double v13 = v5;
  swift_unknownObjectRelease();

  return v13;
}

unint64_t sub_1DDEE71A8()
{
  uint64_t v2 = qword_1EAB97B98;
  if (!qword_1EAB97B98)
  {
    type metadata accessor for UIContentSizeCategory();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97B98);
    return WitnessTable;
  }
  return v2;
}

Swift::Void __swiftcall UILabel.contentSizeAdjustingFont(_:)(UIFont a1)
{
  uint64_t v1 = a1.super.isa;
  objc_msgSend(v3, sel_setFont_, a1.super.isa);

  objc_msgSend(v3, sel_setAdjustsFontForContentSizeCategory_, 1);
}

uint64_t ZeroKeywordResultModel.title.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ZeroKeywordResultModel.title.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *uint64_t v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*ZeroKeywordResultModel.title.modify())()
{
  return sub_1DDD52CCC;
}

uint64_t ZeroKeywordResultModel.subtitle.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ZeroKeywordResultModel.subtitle.setter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*ZeroKeywordResultModel.subtitle.modify())()
{
  return sub_1DDD52CCC;
}

void *ZeroKeywordResultModel.image.getter()
{
  id v3 = *(void **)(v0 + 32);
  id v1 = v3;
  return v3;
}

void ZeroKeywordResultModel.image.setter(void *a1)
{
  id v2 = a1;
  id v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

void (*ZeroKeywordResultModel.image.modify())()
{
  return sub_1DDD52CCC;
}

uint64_t ZeroKeywordResultModel.init(title:subtitle:image:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, void *a6@<X8>)
{
  uint64_t __b = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t __b = a1;
  uint64_t v18 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  swift_bridgeObjectRelease();
  id v6 = a5;
  id v7 = a5;
  uint64_t v8 = v21;
  uint64_t v21 = a5;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v9 = a5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1DDEE7690((uint64_t)&__b);
}

uint64_t sub_1DDEE7690(uint64_t a1)
{
  return a1;
}

uint64_t ZeroKeywordResultModel.init(title:subtitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t __b = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t __b = a1;
  uint64_t v13 = a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  a5[4] = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1DDEE7690((uint64_t)&__b);
}

id *ZeroKeywordResultModel.hash(into:)(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = a1;
  id v4 = *(void **)v1;
  id v5 = *(void **)(v1 + 8);
  id v6 = *(void **)(v1 + 16);
  id v7 = *(void **)(v1 + 24);
  id v8 = *(id *)(v1 + 32);
  uint64_t v10 = v1;
  swift_bridgeObjectRetain();
  v9[3] = v4;
  v9[4] = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEA2D70);
  sub_1DDD533EC();
  sub_1DDEEFAF8();
  sub_1DDD31BC0();
  swift_bridgeObjectRetain();
  v9[1] = v6;
  v9[2] = v7;
  sub_1DDEEFAF8();
  sub_1DDD31BC0();
  id v2 = v8;
  v9[0] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEA2E38);
  sub_1DDD5326C();
  sub_1DDEEFAF8();
  uint64_t result = v9;
  sub_1DDD31B20(v9);
  return result;
}

BOOL static ZeroKeywordResultModel.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v36 = 0;
  id v35 = 0;
  uint64_t v20 = *a1;
  uint64_t v21 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  id v16 = (id)a1[4];
  uint64_t v36 = a1;
  uint64_t v22 = *a2;
  uint64_t v23 = a2[1];
  uint64_t v17 = a2[2];
  uint64_t v18 = a2[3];
  id v19 = (id)a2[4];
  id v35 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v33[0] = v20;
  v33[1] = v21;
  v33[2] = v22;
  uint64_t v34 = v23;
  if (v21)
  {
    sub_1DDD53C00(v33, &v24);
    if (v34)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v12 = sub_1DDEEEC18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1DDD31BC0();
      char v13 = v12;
      goto LABEL_7;
    }
    sub_1DDD31BC0();
    goto LABEL_9;
  }
  if (v34)
  {
LABEL_9:
    sub_1DDD53B7C();
    char v13 = 0;
    goto LABEL_7;
  }
  sub_1DDD31BC0();
  char v13 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31[0] = v14;
    v31[1] = v15;
    v31[2] = v17;
    uint64_t v32 = v18;
    if (v15)
    {
      sub_1DDD53C00(v31, &v25);
      if (v32)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        char v10 = sub_1DDEEEC18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DDD31BC0();
        char v11 = v10;
        goto LABEL_17;
      }
      sub_1DDD31BC0();
    }
    else if (!v32)
    {
      sub_1DDD31BC0();
      char v11 = 1;
LABEL_17:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0) {
        return 0;
      }
      id v2 = v16;
      id v3 = v16;
      id v4 = v19;
      id v5 = v19;
      id v29 = v16;
      uint64_t v30 = v19;
      if (v16)
      {
        sub_1DDD53BB4(&v29, &v28);
        if (v30)
        {
          id v27 = v28;
          id v26 = v30;
          sub_1DDD53384();
          char v8 = sub_1DDEEF338();

          sub_1DDD31B20(&v29);
          char v9 = v8;
LABEL_27:

          return (v9 & 1) != 0;
        }
      }
      else if (!v30)
      {
        sub_1DDD31B20(&v29);
        char v9 = 1;
        goto LABEL_27;
      }
      sub_1DDD53B44(&v29);
      char v9 = 0;
      goto LABEL_27;
    }
    sub_1DDD53B7C();
    char v11 = 0;
    goto LABEL_17;
  }
  return 0;
}

uint64_t ZeroKeywordResultModel.hashValue.getter()
{
  memset(__b, 0, sizeof(__b));
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  __b[0] = *v0;
  __b[1] = v1;
  __b[2] = v2;
  __b[3] = v3;
  __b[4] = v4;
  sub_1DDEE7E80();
  return sub_1DDEEF6D8();
}

unint64_t sub_1DDEE7E80()
{
  uint64_t v2 = qword_1EAB97BA0;
  if (!qword_1EAB97BA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97BA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_1DDEE7F00()
{
  return ZeroKeywordResultModel.hashValue.getter();
}

id *sub_1DDEE7F18(uint64_t a1)
{
  return ZeroKeywordResultModel.hash(into:)(a1);
}

unint64_t sub_1DDEE7F30()
{
  return sub_1DDEE7F48();
}

unint64_t sub_1DDEE7F48()
{
  uint64_t v2 = qword_1EAB97BA8;
  if (!qword_1EAB97BA8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_1EAB97BA8);
    return WitnessTable;
  }
  return v2;
}

BOOL sub_1DDEE7FC8(void *a1, void *a2)
{
  return static ZeroKeywordResultModel.== infix(_:_:)(a1, a2);
}

void destroy for ZeroKeywordResultModel(uint64_t a1)
{
}

void *initializeWithCopy for ZeroKeywordResultModel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  id v7 = (void *)a2[4];
  id v2 = v7;
  uint64_t result = a1;
  a1[4] = v7;
  return result;
}

void *assignWithCopy for ZeroKeywordResultModel(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v5;
  swift_bridgeObjectRelease();
  char v8 = (void *)a1[4];
  id v7 = (void *)a2[4];
  id v2 = v7;
  a1[4] = v7;

  return a1;
}

void *assignWithTake for ZeroKeywordResultModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  id v2 = (void *)a1[4];
  a1[4] = a2[4];

  return a1;
}

uint64_t getEnumTagSinglePayload for ZeroKeywordResultModel(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40))
    {
      int v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      int v4 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v4 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for ZeroKeywordResultModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3) {
        *(unsigned char *)(result + 40) = 1;
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
        *(unsigned char *)(result + 40) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ZeroKeywordResultModel()
{
  return &type metadata for ZeroKeywordResultModel;
}

uint64_t sub_1DDEE8528()
{
  if (qword_1EAB942E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E1F8);
}

uint64_t sub_1DDEE8598()
{
  return swift_deallocClassInstance();
}

id sub_1DDEE85D8()
{
  sub_1DDE385EC();
  type metadata accessor for ResourceBundleClass();
  id result = sub_1DDEE8620();
  qword_1EAB97BB0 = (uint64_t)result;
  return result;
}

id sub_1DDEE8620()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleForClass_, ObjCClassFromMetadata);
  return v0;
}

uint64_t *sub_1DDEE8678()
{
  if (qword_1EAB942C8 != -1) {
    swift_once();
  }
  return &qword_1EAB97BB0;
}

uint64_t sub_1DDEE86DC()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E1B0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E1B0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE876C()
{
  if (qword_1EAB942D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E1B0);
}

uint64_t sub_1DDEE87DC()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E1C8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E1C8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE886C()
{
  if (qword_1EAB942D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E1C8);
}

uint64_t sub_1DDEE88DC()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E1E0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E1E0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE896C()
{
  if (qword_1EAB942E0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E1E0);
}

uint64_t sub_1DDEE89DC()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E1F8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E1F8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8A6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E210);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E210);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8AFC()
{
  if (qword_1EAB942F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E210);
}

uint64_t sub_1DDEE8B6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E228);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E228);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8BFC()
{
  if (qword_1EAB942F8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E228);
}

uint64_t sub_1DDEE8C6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E240);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E240);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8CFC()
{
  if (qword_1EAB94300 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E240);
}

uint64_t sub_1DDEE8D6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E258);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E258);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8DFC()
{
  if (qword_1EAB94308 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E258);
}

uint64_t sub_1DDEE8E6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E270);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E270);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8EFC()
{
  if (qword_1EAB94310 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E270);
}

uint64_t sub_1DDEE8F6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E288);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E288);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE8FFC()
{
  if (qword_1EAB94318 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E288);
}

uint64_t sub_1DDEE906C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E2A0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E2A0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE90FC()
{
  if (qword_1EAB94320 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E2A0);
}

uint64_t sub_1DDEE916C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E2B8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E2B8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE91FC()
{
  if (qword_1EAB94328 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E2B8);
}

uint64_t sub_1DDEE926C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E2D0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E2D0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE92FC()
{
  if (qword_1EAB94330 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E2D0);
}

uint64_t sub_1DDEE936C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E2E8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E2E8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE93FC()
{
  if (qword_1EAB94338 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E2E8);
}

uint64_t sub_1DDEE946C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E300);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E300);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE94FC()
{
  if (qword_1EAB94340 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E300);
}

uint64_t sub_1DDEE956C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E318);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E318);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE95FC()
{
  if (qword_1EAB94348 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E318);
}

uint64_t sub_1DDEE966C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E330);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E330);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE96FC()
{
  if (qword_1EAB94350 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E330);
}

uint64_t sub_1DDEE976C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E348);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E348);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE97FC()
{
  if (qword_1EAB94358 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E348);
}

uint64_t sub_1DDEE986C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E360);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E360);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE98FC()
{
  if (qword_1EAB94360 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E360);
}

uint64_t sub_1DDEE996C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E378);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E378);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE99FC()
{
  if (qword_1EAB94368 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E378);
}

uint64_t sub_1DDEE9A6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E390);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E390);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9AFC()
{
  if (qword_1EAB94370 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E390);
}

uint64_t sub_1DDEE9B6C()
{
  uint64_t v2 = sub_1DDEED108();
  __swift_allocate_value_buffer(v2, qword_1EAB9E3A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E3A8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9BFC()
{
  if (qword_1EAB94378 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED108();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E3A8);
}

uint64_t sub_1DDEE9C6C()
{
  uint64_t v2 = sub_1DDEED128();
  __swift_allocate_value_buffer(v2, qword_1EAB9E3C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E3C0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9CFC()
{
  if (qword_1EAB94380 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED128();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E3C0);
}

uint64_t sub_1DDEE9D6C()
{
  uint64_t v2 = sub_1DDEED128();
  __swift_allocate_value_buffer(v2, qword_1EAB9E3D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E3D8);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9DFC()
{
  if (qword_1EAB94388 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED128();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E3D8);
}

uint64_t sub_1DDEE9E6C()
{
  uint64_t v2 = sub_1DDEED128();
  __swift_allocate_value_buffer(v2, qword_1EAB9E3F0);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E3F0);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9EFC()
{
  if (qword_1EAB94390 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED128();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E3F0);
}

uint64_t sub_1DDEE9F6C()
{
  uint64_t v2 = sub_1DDEED128();
  __swift_allocate_value_buffer(v2, qword_1EAB9E408);
  __swift_project_value_buffer(v2, (uint64_t)qword_1EAB9E408);
  sub_1DDEEEC08();
  id v0 = (id)*sub_1DDEE8678();
  return sub_1DDEED0F8();
}

uint64_t sub_1DDEE9FFC()
{
  if (qword_1EAB94398 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DDEED128();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EAB9E408);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_1EAB9E088 == -1)
  {
    if (qword_1EAB9E090) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_1EAB9E088, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_1EAB9E090) {
      return _availability_version_check();
    }
  }
  if (qword_1EAB9E080 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_1EAB9E080, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_1EAB9E074 > a3) {
    return 1;
  }
  return dword_1EAB9E074 >= a3 && dword_1EAB9E078 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = qword_1EAB9E090;
  if (qword_1EAB9E090) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x1E4F143E8])
    {
      uint64_t v1 = MEMORY[0x1F4188798];
      qword_1EAB9E090 = MEMORY[0x1F4188798];
    }
    if (!v1 || result != 0)
    {
      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        int v4 = *(unsigned __int8 **)result;
        id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          int v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            id v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                char v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  char v10 = (uint64_t (*)(uint64_t))result;
                  id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    char v11 = (uint64_t (*)(void))result;
                    id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    id v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      id result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        char v12 = (FILE *)result;
                        id result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          char v13 = (FILE *)result;
                          id v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x1E01CA210](v13);
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
                              id v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  id v19 = v13;
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
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_1EAB9E074, &dword_1EAB9E078);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    id v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  id v19 = v13;
                                }
                                id v16 = v26;
                              }
                              else
                              {
                                id v16 = v26;
                                id v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          id v19 = v13;
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

void MUICGRectFromNSDictionary_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 objectForKeyedSubscript:a2];
  int v5 = [v4 description];
  int v6 = 138412290;
  id v7 = v5;
  _os_log_error_impl(&dword_1DDCDB000, a3, OS_LOG_TYPE_ERROR, "ERROR converting dictionary keys/values to CGRect, %@", (uint8_t *)&v6, 0xCu);
}

uint64_t sub_1DDEEC7E8()
{
  return MEMORY[0x1F40D3A28]();
}

uint64_t sub_1DDEEC7F8()
{
  return MEMORY[0x1F40D3BC8]();
}

uint64_t sub_1DDEEC808()
{
  return MEMORY[0x1F40D3C18]();
}

uint64_t sub_1DDEEC818()
{
  return MEMORY[0x1F40D3C40]();
}

uint64_t sub_1DDEEC828()
{
  return MEMORY[0x1F40D3C48]();
}

uint64_t sub_1DDEEC838()
{
  return MEMORY[0x1F40D3C60]();
}

uint64_t sub_1DDEEC848()
{
  return MEMORY[0x1F40D3C88]();
}

uint64_t sub_1DDEEC858()
{
  return MEMORY[0x1F40D3C90]();
}

uint64_t sub_1DDEEC868()
{
  return MEMORY[0x1F40D3D20]();
}

uint64_t sub_1DDEEC878()
{
  return MEMORY[0x1F40D3D30]();
}

uint64_t sub_1DDEEC898()
{
  return MEMORY[0x1F40D3DA0]();
}

uint64_t sub_1DDEEC8A8()
{
  return MEMORY[0x1F40D3DD0]();
}

uint64_t sub_1DDEEC8B8()
{
  return MEMORY[0x1F40D3DE8]();
}

uint64_t sub_1DDEEC8C8()
{
  return MEMORY[0x1F40D3DF0]();
}

uint64_t sub_1DDEEC8D8()
{
  return MEMORY[0x1F40D3E10]();
}

uint64_t sub_1DDEEC8E8()
{
  return MEMORY[0x1F40D3E18]();
}

uint64_t sub_1DDEEC8F8()
{
  return MEMORY[0x1F40D3E20]();
}

uint64_t sub_1DDEEC908()
{
  return MEMORY[0x1F40D3E28]();
}

uint64_t sub_1DDEEC918()
{
  return MEMORY[0x1F40D3E30]();
}

uint64_t sub_1DDEEC928()
{
  return MEMORY[0x1F40D3E38]();
}

uint64_t sub_1DDEEC938()
{
  return MEMORY[0x1F40D3E40]();
}

uint64_t sub_1DDEEC948()
{
  return MEMORY[0x1F40D3E48]();
}

uint64_t sub_1DDEEC958()
{
  return MEMORY[0x1F40D3E58]();
}

uint64_t sub_1DDEEC968()
{
  return MEMORY[0x1F40D3E98]();
}

uint64_t sub_1DDEEC978()
{
  return MEMORY[0x1F40D4090]();
}

uint64_t sub_1DDEEC988()
{
  return MEMORY[0x1F40D4108]();
}

uint64_t sub_1DDEEC998()
{
  return MEMORY[0x1F40D43C8]();
}

uint64_t sub_1DDEEC9A8()
{
  return MEMORY[0x1F40D43D8]();
}

uint64_t sub_1DDEEC9C8()
{
  return MEMORY[0x1F40D45E0]();
}

uint64_t sub_1DDEEC9D8()
{
  return MEMORY[0x1F40D4608]();
}

uint64_t sub_1DDEEC9F8()
{
  return MEMORY[0x1F40D46B0]();
}

uint64_t sub_1DDEECA08()
{
  return MEMORY[0x1F40D4798]();
}

uint64_t sub_1DDEECA18()
{
  return MEMORY[0x1F40D4820]();
}

uint64_t sub_1DDEECA28()
{
  return MEMORY[0x1F40D48A8]();
}

uint64_t sub_1DDEECA38()
{
  return MEMORY[0x1F40D48B8]();
}

uint64_t sub_1DDEECA48()
{
  return MEMORY[0x1F40D4970]();
}

uint64_t sub_1DDEECA58()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1DDEECA68()
{
  return MEMORY[0x1F40E2E28]();
}

uint64_t sub_1DDEECA78()
{
  return MEMORY[0x1F40E2E50]();
}

uint64_t sub_1DDEECA88()
{
  return MEMORY[0x1F40E3298]();
}

uint64_t sub_1DDEECA98()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1DDEECAA8()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1DDEECAB8()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1DDEECAC8()
{
  return MEMORY[0x1F40E3578]();
}

uint64_t sub_1DDEECAD8()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1DDEECAE8()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_1DDEECAF8()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1DDEECB08()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1DDEECB18()
{
  return MEMORY[0x1F41656C0]();
}

uint64_t sub_1DDEECB28()
{
  return MEMORY[0x1F41656D8]();
}

uint64_t sub_1DDEECB38()
{
  return MEMORY[0x1F40E3BC0]();
}

uint64_t sub_1DDEECB48()
{
  return MEMORY[0x1F40E3BF0]();
}

uint64_t sub_1DDEECB58()
{
  return MEMORY[0x1F40E3C38]();
}

uint64_t sub_1DDEECB68()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1DDEECB78()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1DDEECB88()
{
  return MEMORY[0x1F40E3F10]();
}

uint64_t sub_1DDEECB98()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1DDEECBA8()
{
  return MEMORY[0x1F40E4028]();
}

uint64_t sub_1DDEECBB8()
{
  return MEMORY[0x1F40E4050]();
}

uint64_t sub_1DDEECBC8()
{
  return MEMORY[0x1F40E4070]();
}

uint64_t sub_1DDEECBD8()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1DDEECBE8()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1DDEECBF8()
{
  return MEMORY[0x1F40E43A8]();
}

uint64_t sub_1DDEECC08()
{
  return MEMORY[0x1F40E43D0]();
}

uint64_t sub_1DDEECC18()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1DDEECC28()
{
  return MEMORY[0x1F41656F0]();
}

uint64_t sub_1DDEECC38()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DDEECC48()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1DDEECC58()
{
  return MEMORY[0x1F40E4570]();
}

uint64_t sub_1DDEECC68()
{
  return MEMORY[0x1F40E4588]();
}

uint64_t sub_1DDEECC78()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_1DDEECC88()
{
  return MEMORY[0x1F40E45C0]();
}

uint64_t sub_1DDEECC98()
{
  return MEMORY[0x1F40E45C8]();
}

uint64_t sub_1DDEECCA8()
{
  return MEMORY[0x1F40E4680]();
}

uint64_t sub_1DDEECCB8()
{
  return MEMORY[0x1F40E4688]();
}

uint64_t sub_1DDEECCC8()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1DDEECCD8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1DDEECCE8()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1DDEECCF8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1DDEECD08()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1DDEECD18()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1DDEECD28()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DDEECD38()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1DDEECD48()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DDEECD58()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DDEECD68()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1DDEECD78()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1DDEECD88()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1DDEECD98()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DDEECDA8()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1DDEECDB8()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1DDEECDC8()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1DDEECDD8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1DDEECDE8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1DDEECDF8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1DDEECE08()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1DDEECE18()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DDEECE28()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1DDEECE38()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1DDEECE48()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1DDEECE58()
{
  return MEMORY[0x1F40E5410]();
}

uint64_t sub_1DDEECE68()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1DDEECE78()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DDEECE88()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1DDEECE98()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DDEECEA8()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1DDEECEB8()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1DDEECEC8()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1DDEECED8()
{
  return MEMORY[0x1F40E5E90]();
}

uint64_t sub_1DDEECEE8()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1DDEECEF8()
{
  return MEMORY[0x1F4165718]();
}

uint64_t sub_1DDEECF08()
{
  return MEMORY[0x1F4165730]();
}

uint64_t sub_1DDEECF18()
{
  return MEMORY[0x1F4165748]();
}

uint64_t sub_1DDEECF28()
{
  return MEMORY[0x1F4165760]();
}

uint64_t sub_1DDEECF38()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1DDEECF48()
{
  return MEMORY[0x1F4187458]();
}

uint64_t sub_1DDEECF58()
{
  return MEMORY[0x1F4187460]();
}

uint64_t sub_1DDEECF68()
{
  return MEMORY[0x1F4187498]();
}

uint64_t sub_1DDEECF78()
{
  return MEMORY[0x1F41874F0]();
}

uint64_t sub_1DDEECF88()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1DDEECF98()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1DDEECFA8()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1DDEECFB8()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1DDEECFC8()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1DDEECFD8()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1DDEECFE8()
{
  return MEMORY[0x1F41179C0]();
}

uint64_t sub_1DDEECFF8()
{
  return MEMORY[0x1F41179C8]();
}

uint64_t sub_1DDEED008()
{
  return MEMORY[0x1F41179D8]();
}

uint64_t sub_1DDEED018()
{
  return MEMORY[0x1F41179E8]();
}

uint64_t sub_1DDEED028()
{
  return MEMORY[0x1F41179F0]();
}

uint64_t sub_1DDEED038()
{
  return MEMORY[0x1F41179F8]();
}

uint64_t sub_1DDEED048()
{
  return MEMORY[0x1F4117A00]();
}

uint64_t sub_1DDEED058()
{
  return MEMORY[0x1F41191E8]();
}

uint64_t sub_1DDEED068()
{
  return MEMORY[0x1F41191F8]();
}

uint64_t sub_1DDEED078()
{
  return MEMORY[0x1F4119200]();
}

uint64_t sub_1DDEED088()
{
  return MEMORY[0x1F4119208]();
}

uint64_t sub_1DDEED098()
{
  return MEMORY[0x1F4119218]();
}

uint64_t sub_1DDEED0A8()
{
  return MEMORY[0x1F4119220]();
}

uint64_t sub_1DDEED0B8()
{
  return MEMORY[0x1F4112830]();
}

uint64_t sub_1DDEED0C8()
{
  return MEMORY[0x1F4112840]();
}

uint64_t sub_1DDEED0D8()
{
  return MEMORY[0x1F4112850]();
}

uint64_t sub_1DDEED0E8()
{
  return MEMORY[0x1F4112858]();
}

uint64_t sub_1DDEED0F8()
{
  return MEMORY[0x1F40E05D0]();
}

uint64_t sub_1DDEED108()
{
  return MEMORY[0x1F40E05D8]();
}

uint64_t sub_1DDEED118()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1DDEED128()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1DDEED138()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1DDEED148()
{
  return MEMORY[0x1F4146080]();
}

uint64_t sub_1DDEED158()
{
  return MEMORY[0x1F4146090]();
}

uint64_t sub_1DDEED168()
{
  return MEMORY[0x1F4146098]();
}

uint64_t sub_1DDEED178()
{
  return MEMORY[0x1F41460A0]();
}

uint64_t sub_1DDEED188()
{
  return MEMORY[0x1F41460A8]();
}

uint64_t sub_1DDEED198()
{
  return MEMORY[0x1F41460B0]();
}

uint64_t sub_1DDEED1A8()
{
  return MEMORY[0x1F41460B8]();
}

uint64_t sub_1DDEED1B8()
{
  return MEMORY[0x1F41460E8]();
}

uint64_t sub_1DDEED1C8()
{
  return MEMORY[0x1F41460F0]();
}

uint64_t sub_1DDEED1D8()
{
  return MEMORY[0x1F41460F8]();
}

uint64_t sub_1DDEED1E8()
{
  return MEMORY[0x1F4146100]();
}

uint64_t sub_1DDEED1F8()
{
  return MEMORY[0x1F4146108]();
}

uint64_t sub_1DDEED208()
{
  return MEMORY[0x1F4146110]();
}

uint64_t sub_1DDEED228()
{
  return MEMORY[0x1F4146138]();
}

uint64_t sub_1DDEED238()
{
  return MEMORY[0x1F4146140]();
}

uint64_t sub_1DDEED248()
{
  return MEMORY[0x1F4146148]();
}

uint64_t sub_1DDEED258()
{
  return MEMORY[0x1F4146150]();
}

uint64_t sub_1DDEED268()
{
  return MEMORY[0x1F4146158]();
}

uint64_t sub_1DDEED278()
{
  return MEMORY[0x1F4146160]();
}

uint64_t sub_1DDEED288()
{
  return MEMORY[0x1F4146168]();
}

uint64_t sub_1DDEED298()
{
  return MEMORY[0x1F4146170]();
}

uint64_t sub_1DDEED2A8()
{
  return MEMORY[0x1F4146178]();
}

uint64_t sub_1DDEED2B8()
{
  return MEMORY[0x1F4146180]();
}

uint64_t sub_1DDEED2C8()
{
  return MEMORY[0x1F4146188]();
}

uint64_t sub_1DDEED2D8()
{
  return MEMORY[0x1F4146190]();
}

uint64_t sub_1DDEED2E8()
{
  return MEMORY[0x1F4146198]();
}

uint64_t sub_1DDEED2F8()
{
  return MEMORY[0x1F41461A0]();
}

uint64_t sub_1DDEED308()
{
  return MEMORY[0x1F41461A8]();
}

uint64_t sub_1DDEED318()
{
  return MEMORY[0x1F41461B0]();
}

uint64_t sub_1DDEED328()
{
  return MEMORY[0x1F41461B8]();
}

uint64_t sub_1DDEED338()
{
  return MEMORY[0x1F41461C0]();
}

uint64_t sub_1DDEED348()
{
  return MEMORY[0x1F41461E0]();
}

uint64_t sub_1DDEED358()
{
  return MEMORY[0x1F41461E8]();
}

uint64_t sub_1DDEED368()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DDEED378()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DDEED388()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DDEED398()
{
  return MEMORY[0x1F41177A8]();
}

uint64_t sub_1DDEED3A8()
{
  return MEMORY[0x1F41177B0]();
}

uint64_t sub_1DDEED3B8()
{
  return MEMORY[0x1F4165788]();
}

uint64_t sub_1DDEED3C8()
{
  return MEMORY[0x1F41658D0]();
}

uint64_t sub_1DDEED3D8()
{
  return MEMORY[0x1F4165900]();
}

uint64_t sub_1DDEED3E8()
{
  return MEMORY[0x1F4165918]();
}

uint64_t sub_1DDEED3F8()
{
  return MEMORY[0x1F4165948]();
}

uint64_t sub_1DDEED408()
{
  return MEMORY[0x1F4165950]();
}

uint64_t sub_1DDEED418()
{
  return MEMORY[0x1F41659C8]();
}

uint64_t sub_1DDEED428()
{
  return MEMORY[0x1F4165BC8]();
}

uint64_t sub_1DDEED438()
{
  return MEMORY[0x1F4165BD8]();
}

uint64_t sub_1DDEED448()
{
  return MEMORY[0x1F4165BF0]();
}

uint64_t sub_1DDEED458()
{
  return MEMORY[0x1F4165BF8]();
}

uint64_t sub_1DDEED468()
{
  return MEMORY[0x1F4165C00]();
}

uint64_t sub_1DDEED478()
{
  return MEMORY[0x1F4165C20]();
}

uint64_t sub_1DDEED488()
{
  return MEMORY[0x1F4165C28]();
}

uint64_t sub_1DDEED498()
{
  return MEMORY[0x1F4165C68]();
}

uint64_t sub_1DDEED4A8()
{
  return MEMORY[0x1F4165C80]();
}

uint64_t sub_1DDEED4B8()
{
  return MEMORY[0x1F4165C88]();
}

uint64_t sub_1DDEED4C8()
{
  return MEMORY[0x1F4165CA0]();
}

uint64_t sub_1DDEED4D8()
{
  return MEMORY[0x1F4165CA8]();
}

uint64_t sub_1DDEED4E8()
{
  return MEMORY[0x1F4165CB8]();
}

uint64_t sub_1DDEED4F8()
{
  return MEMORY[0x1F4165CC8]();
}

uint64_t sub_1DDEED508()
{
  return MEMORY[0x1F4165CD0]();
}

uint64_t sub_1DDEED518()
{
  return MEMORY[0x1F4165CD8]();
}

uint64_t sub_1DDEED528()
{
  return MEMORY[0x1F4165CE8]();
}

uint64_t sub_1DDEED538()
{
  return MEMORY[0x1F4165CF0]();
}

uint64_t sub_1DDEED548()
{
  return MEMORY[0x1F4165D00]();
}

uint64_t sub_1DDEED558()
{
  return MEMORY[0x1F4165D08]();
}

uint64_t sub_1DDEED568()
{
  return MEMORY[0x1F4165D10]();
}

uint64_t sub_1DDEED578()
{
  return MEMORY[0x1F4165D18]();
}

uint64_t sub_1DDEED588()
{
  return MEMORY[0x1F4165D20]();
}

uint64_t sub_1DDEED598()
{
  return MEMORY[0x1F4165D28]();
}

uint64_t sub_1DDEED5A8()
{
  return MEMORY[0x1F4165D30]();
}

uint64_t sub_1DDEED5B8()
{
  return MEMORY[0x1F4165D48]();
}

uint64_t sub_1DDEED5C8()
{
  return MEMORY[0x1F4165DC0]();
}

uint64_t sub_1DDEED5D8()
{
  return MEMORY[0x1F4165DC8]();
}

uint64_t sub_1DDEED5E8()
{
  return MEMORY[0x1F4165E08]();
}

uint64_t sub_1DDEED5F8()
{
  return MEMORY[0x1F4165E30]();
}

uint64_t sub_1DDEED608()
{
  return MEMORY[0x1F4165E70]();
}

uint64_t sub_1DDEED618()
{
  return MEMORY[0x1F4165E80]();
}

uint64_t sub_1DDEED628()
{
  return MEMORY[0x1F4165E90]();
}

uint64_t sub_1DDEED638()
{
  return MEMORY[0x1F4165EB0]();
}

uint64_t sub_1DDEED648()
{
  return MEMORY[0x1F4165EB8]();
}

uint64_t sub_1DDEED658()
{
  return MEMORY[0x1F4165F20]();
}

uint64_t sub_1DDEED668()
{
  return MEMORY[0x1F4165F58]();
}

uint64_t sub_1DDEED678()
{
  return MEMORY[0x1F4165F68]();
}

uint64_t sub_1DDEED688()
{
  return MEMORY[0x1F4165F80]();
}

uint64_t sub_1DDEED698()
{
  return MEMORY[0x1F4165F88]();
}

uint64_t sub_1DDEED6A8()
{
  return MEMORY[0x1F4165FA8]();
}

uint64_t sub_1DDEED6B8()
{
  return MEMORY[0x1F4165FB0]();
}

uint64_t sub_1DDEED6C8()
{
  return MEMORY[0x1F4165FD0]();
}

uint64_t sub_1DDEED6D8()
{
  return MEMORY[0x1F4165FE8]();
}

uint64_t sub_1DDEED6E8()
{
  return MEMORY[0x1F4166008]();
}

uint64_t sub_1DDEED6F8()
{
  return MEMORY[0x1F4166018]();
}

uint64_t sub_1DDEED708()
{
  return MEMORY[0x1F4166028]();
}

uint64_t sub_1DDEED718()
{
  return MEMORY[0x1F4166068]();
}

uint64_t sub_1DDEED728()
{
  return MEMORY[0x1F4166078]();
}

uint64_t sub_1DDEED738()
{
  return MEMORY[0x1F41660A8]();
}

uint64_t sub_1DDEED748()
{
  return MEMORY[0x1F41660C0]();
}

uint64_t sub_1DDEED758()
{
  return MEMORY[0x1F4166158]();
}

uint64_t sub_1DDEED768()
{
  return MEMORY[0x1F4166160]();
}

uint64_t sub_1DDEED778()
{
  return MEMORY[0x1F4166218]();
}

uint64_t sub_1DDEED788()
{
  return MEMORY[0x1F4166230]();
}

uint64_t sub_1DDEED798()
{
  return MEMORY[0x1F4166240]();
}

uint64_t sub_1DDEED7A8()
{
  return MEMORY[0x1F4166288]();
}

uint64_t sub_1DDEED7B8()
{
  return MEMORY[0x1F4166290]();
}

uint64_t sub_1DDEED7C8()
{
  return MEMORY[0x1F41662A8]();
}

uint64_t sub_1DDEED7D8()
{
  return MEMORY[0x1F41662B0]();
}

uint64_t sub_1DDEED7E8()
{
  return MEMORY[0x1F41662F0]();
}

uint64_t sub_1DDEED7F8()
{
  return MEMORY[0x1F4166310]();
}

uint64_t sub_1DDEED808()
{
  return MEMORY[0x1F4166328]();
}

uint64_t sub_1DDEED818()
{
  return MEMORY[0x1F4166340]();
}

uint64_t sub_1DDEED828()
{
  return MEMORY[0x1F4166368]();
}

uint64_t sub_1DDEED838()
{
  return MEMORY[0x1F4166390]();
}

uint64_t sub_1DDEED848()
{
  return MEMORY[0x1F4166398]();
}

uint64_t sub_1DDEED858()
{
  return MEMORY[0x1F41663A0]();
}

uint64_t sub_1DDEED868()
{
  return MEMORY[0x1F41663B0]();
}

uint64_t sub_1DDEED878()
{
  return MEMORY[0x1F41663E8]();
}

uint64_t sub_1DDEED888()
{
  return MEMORY[0x1F4166428]();
}

uint64_t sub_1DDEED898()
{
  return MEMORY[0x1F4166430]();
}

uint64_t sub_1DDEED8A8()
{
  return MEMORY[0x1F40F7E88]();
}

uint64_t sub_1DDEED8B8()
{
  return MEMORY[0x1F40F7EC0]();
}

uint64_t sub_1DDEED8C8()
{
  return MEMORY[0x1F40F7EC8]();
}

uint64_t sub_1DDEED8D8()
{
  return MEMORY[0x1F40F7EE0]();
}

uint64_t sub_1DDEED8E8()
{
  return MEMORY[0x1F40F7F20]();
}

uint64_t sub_1DDEED8F8()
{
  return MEMORY[0x1F40F7F50]();
}

uint64_t sub_1DDEED908()
{
  return MEMORY[0x1F40F7F60]();
}

uint64_t sub_1DDEED918()
{
  return MEMORY[0x1F40F7F70]();
}

uint64_t sub_1DDEED928()
{
  return MEMORY[0x1F40F7F78]();
}

uint64_t sub_1DDEED938()
{
  return MEMORY[0x1F40F7F80]();
}

uint64_t sub_1DDEED948()
{
  return MEMORY[0x1F40F7F88]();
}

uint64_t sub_1DDEED958()
{
  return MEMORY[0x1F40F7FF8]();
}

uint64_t sub_1DDEED968()
{
  return MEMORY[0x1F40F8098]();
}

uint64_t sub_1DDEED978()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1DDEED988()
{
  return MEMORY[0x1F40F80C0]();
}

uint64_t sub_1DDEED998()
{
  return MEMORY[0x1F40F80D0]();
}

uint64_t sub_1DDEED9A8()
{
  return MEMORY[0x1F40F8288]();
}

uint64_t sub_1DDEED9B8()
{
  return MEMORY[0x1F40F8318]();
}

uint64_t sub_1DDEED9C8()
{
  return MEMORY[0x1F40F8330]();
}

uint64_t sub_1DDEED9D8()
{
  return MEMORY[0x1F40F8388]();
}

uint64_t sub_1DDEED9E8()
{
  return MEMORY[0x1F40F8390]();
}

uint64_t sub_1DDEED9F8()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_1DDEEDA08()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1DDEEDA18()
{
  return MEMORY[0x1F40F8520]();
}

uint64_t sub_1DDEEDA28()
{
  return MEMORY[0x1F40F8528]();
}

uint64_t sub_1DDEEDA38()
{
  return MEMORY[0x1F40F8530]();
}

uint64_t sub_1DDEEDA48()
{
  return MEMORY[0x1F40F8618]();
}

uint64_t sub_1DDEEDA58()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_1DDEEDA68()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1DDEEDA78()
{
  return MEMORY[0x1F40F86E0]();
}

uint64_t sub_1DDEEDA88()
{
  return MEMORY[0x1F40F8838]();
}

uint64_t sub_1DDEEDA98()
{
  return MEMORY[0x1F40F8840]();
}

uint64_t sub_1DDEEDAA8()
{
  return MEMORY[0x1F40F88A0]();
}

uint64_t sub_1DDEEDAB8()
{
  return MEMORY[0x1F40F88C0]();
}

uint64_t sub_1DDEEDAC8()
{
  return MEMORY[0x1F40F8BB8]();
}

uint64_t sub_1DDEEDAD8()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1DDEEDAE8()
{
  return MEMORY[0x1F40F8C28]();
}

uint64_t sub_1DDEEDAF8()
{
  return MEMORY[0x1F40F8C78]();
}

uint64_t sub_1DDEEDB08()
{
  return MEMORY[0x1F40F8C80]();
}

uint64_t sub_1DDEEDB18()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1DDEEDB28()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1DDEEDB38()
{
  return MEMORY[0x1F40F8E78]();
}

uint64_t sub_1DDEEDB48()
{
  return MEMORY[0x1F40F8E80]();
}

uint64_t sub_1DDEEDB58()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1DDEEDB68()
{
  return MEMORY[0x1F40F8EB8]();
}

uint64_t sub_1DDEEDB78()
{
  return MEMORY[0x1F40F8EC0]();
}

uint64_t sub_1DDEEDB88()
{
  return MEMORY[0x1F40F8EE0]();
}

uint64_t sub_1DDEEDB98()
{
  return MEMORY[0x1F40F8EE8]();
}

uint64_t sub_1DDEEDBA8()
{
  return MEMORY[0x1F40F8EF0]();
}

uint64_t sub_1DDEEDBB8()
{
  return MEMORY[0x1F40F8F10]();
}

uint64_t sub_1DDEEDBC8()
{
  return MEMORY[0x1F40F91A8]();
}

uint64_t sub_1DDEEDBD8()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1DDEEDBE8()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_1DDEEDBF8()
{
  return MEMORY[0x1F40F9430]();
}

uint64_t sub_1DDEEDC08()
{
  return MEMORY[0x1F40F9438]();
}

uint64_t sub_1DDEEDC18()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1DDEEDC28()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1DDEEDC38()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1DDEEDC48()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1DDEEDC58()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1DDEEDC68()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1DDEEDC78()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1DDEEDC88()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1DDEEDC98()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1DDEEDCA8()
{
  return MEMORY[0x1F40F9C30]();
}

uint64_t sub_1DDEEDCB8()
{
  return MEMORY[0x1F40F9C38]();
}

uint64_t sub_1DDEEDCC8()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1DDEEDCD8()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1DDEEDCE8()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1DDEEDCF8()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1DDEEDD08()
{
  return MEMORY[0x1F40F9D28]();
}

uint64_t sub_1DDEEDD18()
{
  return MEMORY[0x1F40F9D30]();
}

uint64_t sub_1DDEEDD28()
{
  return MEMORY[0x1F40F9D70]();
}

uint64_t sub_1DDEEDD38()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1DDEEDD48()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_1DDEEDD58()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_1DDEEDD68()
{
  return MEMORY[0x1F40F9E08]();
}

uint64_t sub_1DDEEDD78()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1DDEEDD88()
{
  return MEMORY[0x1F40F9E28]();
}

uint64_t sub_1DDEEDD98()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1DDEEDDA8()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1DDEEDDB8()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1DDEEDDC8()
{
  return MEMORY[0x1F40F9E78]();
}

uint64_t sub_1DDEEDDD8()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1DDEEDDE8()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1DDEEDDF8()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1DDEEDE08()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1DDEEDE18()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1DDEEDE28()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1DDEEDE38()
{
  return MEMORY[0x1F40F9EF0]();
}

uint64_t sub_1DDEEDE48()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1DDEEDE58()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1DDEEDE68()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1DDEEDE78()
{
  return MEMORY[0x1F40FA000]();
}

uint64_t sub_1DDEEDE88()
{
  return MEMORY[0x1F40FA008]();
}

uint64_t sub_1DDEEDE98()
{
  return MEMORY[0x1F40FA010]();
}

uint64_t sub_1DDEEDEA8()
{
  return MEMORY[0x1F40FA018]();
}

uint64_t sub_1DDEEDEB8()
{
  return MEMORY[0x1F40FA098]();
}

uint64_t sub_1DDEEDEC8()
{
  return MEMORY[0x1F40FA190]();
}

uint64_t sub_1DDEEDED8()
{
  return MEMORY[0x1F40FA1A8]();
}

uint64_t sub_1DDEEDEE8()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_1DDEEDEF8()
{
  return MEMORY[0x1F40FA2E0]();
}

uint64_t sub_1DDEEDF08()
{
  return MEMORY[0x1F40FA348]();
}

uint64_t sub_1DDEEDF18()
{
  return MEMORY[0x1F40FA3A8]();
}

uint64_t sub_1DDEEDF28()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1DDEEDF38()
{
  return MEMORY[0x1F40FA448]();
}

uint64_t sub_1DDEEDF48()
{
  return MEMORY[0x1F40FA450]();
}

uint64_t sub_1DDEEDF58()
{
  return MEMORY[0x1F40FA460]();
}

uint64_t sub_1DDEEDF68()
{
  return MEMORY[0x1F40FA690]();
}

uint64_t sub_1DDEEDF78()
{
  return MEMORY[0x1F40FA6A0]();
}

uint64_t sub_1DDEEDF88()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1DDEEDF98()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1DDEEDFA8()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1DDEEDFB8()
{
  return MEMORY[0x1F40FAC40]();
}

uint64_t sub_1DDEEDFC8()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_1DDEEDFD8()
{
  return MEMORY[0x1F40FAD98]();
}

uint64_t sub_1DDEEDFE8()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1DDEEDFF8()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1DDEEE008()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1DDEEE018()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1DDEEE028()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1DDEEE038()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1DDEEE048()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1DDEEE058()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1DDEEE068()
{
  return MEMORY[0x1F40FAF48]();
}

uint64_t sub_1DDEEE078()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1DDEEE088()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_1DDEEE098()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1DDEEE0A8()
{
  return MEMORY[0x1F40FB078]();
}

uint64_t sub_1DDEEE0B8()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1DDEEE0C8()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1DDEEE0D8()
{
  return MEMORY[0x1F40FB1D8]();
}

uint64_t sub_1DDEEE0E8()
{
  return MEMORY[0x1F40FB1F8]();
}

uint64_t sub_1DDEEE0F8()
{
  return MEMORY[0x1F40FB310]();
}

uint64_t sub_1DDEEE108()
{
  return MEMORY[0x1F40FB3A0]();
}

uint64_t sub_1DDEEE118()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1DDEEE128()
{
  return MEMORY[0x1F40FB3E8]();
}

uint64_t sub_1DDEEE138()
{
  return MEMORY[0x1F40FB408]();
}

uint64_t sub_1DDEEE148()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1DDEEE158()
{
  return MEMORY[0x1F40FB4D0]();
}

uint64_t sub_1DDEEE168()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1DDEEE178()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1DDEEE188()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1DDEEE198()
{
  return MEMORY[0x1F40FB598]();
}

uint64_t sub_1DDEEE1A8()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1DDEEE1B8()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1DDEEE1C8()
{
  return MEMORY[0x1F40FB608]();
}

uint64_t sub_1DDEEE1D8()
{
  return MEMORY[0x1F40FB610]();
}

uint64_t sub_1DDEEE1E8()
{
  return MEMORY[0x1F40FB628]();
}

uint64_t sub_1DDEEE1F8()
{
  return MEMORY[0x1F40FB658]();
}

uint64_t sub_1DDEEE208()
{
  return MEMORY[0x1F40FB670]();
}

uint64_t sub_1DDEEE218()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1DDEEE228()
{
  return MEMORY[0x1F40FB6E0]();
}

uint64_t sub_1DDEEE238()
{
  return MEMORY[0x1F40FB6F0]();
}

uint64_t sub_1DDEEE248()
{
  return MEMORY[0x1F40FB710]();
}

uint64_t sub_1DDEEE258()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_1DDEEE268()
{
  return MEMORY[0x1F40FB808]();
}

uint64_t sub_1DDEEE278()
{
  return MEMORY[0x1F40FB818]();
}

uint64_t sub_1DDEEE288()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1DDEEE298()
{
  return MEMORY[0x1F40FB8F0]();
}

uint64_t sub_1DDEEE2A8()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1DDEEE2B8()
{
  return MEMORY[0x1F40FB990]();
}

uint64_t sub_1DDEEE2C8()
{
  return MEMORY[0x1F40FB998]();
}

uint64_t sub_1DDEEE2D8()
{
  return MEMORY[0x1F40FB9E8]();
}

uint64_t sub_1DDEEE2E8()
{
  return MEMORY[0x1F40FB9F8]();
}

uint64_t sub_1DDEEE2F8()
{
  return MEMORY[0x1F40FBAA8]();
}

uint64_t sub_1DDEEE308()
{
  return MEMORY[0x1F40FBB38]();
}

uint64_t sub_1DDEEE318()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1DDEEE328()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1DDEEE338()
{
  return MEMORY[0x1F40FBD78]();
}

uint64_t sub_1DDEEE348()
{
  return MEMORY[0x1F40FBDA8]();
}

uint64_t sub_1DDEEE358()
{
  return MEMORY[0x1F40FBDF8]();
}

uint64_t sub_1DDEEE368()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1DDEEE378()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_1DDEEE388()
{
  return MEMORY[0x1F40FBF30]();
}

uint64_t sub_1DDEEE398()
{
  return MEMORY[0x1F40FBF78]();
}

uint64_t sub_1DDEEE3A8()
{
  return MEMORY[0x1F40FBFA0]();
}

uint64_t sub_1DDEEE3B8()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1DDEEE3C8()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_1DDEEE3D8()
{
  return MEMORY[0x1F40FC038]();
}

uint64_t sub_1DDEEE3E8()
{
  return MEMORY[0x1F40FC070]();
}

uint64_t sub_1DDEEE3F8()
{
  return MEMORY[0x1F40FC090]();
}

uint64_t sub_1DDEEE408()
{
  return MEMORY[0x1F40FC0B0]();
}

uint64_t sub_1DDEEE418()
{
  return MEMORY[0x1F40FC0F0]();
}

uint64_t sub_1DDEEE428()
{
  return MEMORY[0x1F40FC108]();
}

uint64_t sub_1DDEEE438()
{
  return MEMORY[0x1F40FC130]();
}

uint64_t sub_1DDEEE448()
{
  return MEMORY[0x1F40FC150]();
}

uint64_t sub_1DDEEE458()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1DDEEE468()
{
  return MEMORY[0x1F40FC168]();
}

uint64_t sub_1DDEEE478()
{
  return MEMORY[0x1F40FC170]();
}

uint64_t sub_1DDEEE488()
{
  return MEMORY[0x1F40FC1B8]();
}

uint64_t sub_1DDEEE498()
{
  return MEMORY[0x1F40FC1C0]();
}

uint64_t sub_1DDEEE4A8()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_1DDEEE4B8()
{
  return MEMORY[0x1F40FC1E0]();
}

uint64_t sub_1DDEEE4C8()
{
  return MEMORY[0x1F40FC230]();
}

uint64_t sub_1DDEEE4D8()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1DDEEE4E8()
{
  return MEMORY[0x1F40FC260]();
}

uint64_t sub_1DDEEE4F8()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1DDEEE508()
{
  return MEMORY[0x1F40FC2F0]();
}

uint64_t sub_1DDEEE518()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1DDEEE528()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1DDEEE538()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1DDEEE548()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1DDEEE558()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1DDEEE568()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1DDEEE578()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_1DDEEE588()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1DDEEE598()
{
  return MEMORY[0x1F40FC518]();
}

uint64_t sub_1DDEEE5A8()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t sub_1DDEEE5B8()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1DDEEE5C8()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_1DDEEE5D8()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1DDEEE5E8()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_1DDEEE5F8()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_1DDEEE608()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1DDEEE618()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_1DDEEE628()
{
  return MEMORY[0x1F40FC638]();
}

uint64_t sub_1DDEEE638()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1DDEEE648()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1DDEEE658()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1DDEEE668()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1DDEEE678()
{
  return MEMORY[0x1F40FC728]();
}

uint64_t sub_1DDEEE688()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1DDEEE698()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1DDEEE6A8()
{
  return MEMORY[0x1F40FC7E0]();
}

uint64_t sub_1DDEEE6B8()
{
  return MEMORY[0x1F40FC840]();
}

uint64_t sub_1DDEEE6C8()
{
  return MEMORY[0x1F40FC870]();
}

uint64_t sub_1DDEEE6D8()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1DDEEE6E8()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1DDEEE6F8()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1DDEEE708()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1DDEEE718()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1DDEEE728()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1DDEEE738()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1DDEEE748()
{
  return MEMORY[0x1F40FC9E0]();
}

uint64_t sub_1DDEEE758()
{
  return MEMORY[0x1F40FCA00]();
}

uint64_t sub_1DDEEE768()
{
  return MEMORY[0x1F40FCA98]();
}

uint64_t sub_1DDEEE778()
{
  return MEMORY[0x1F40FCAB0]();
}

uint64_t sub_1DDEEE788()
{
  return MEMORY[0x1F40FCAB8]();
}

uint64_t sub_1DDEEE798()
{
  return MEMORY[0x1F40FCAD0]();
}

uint64_t sub_1DDEEE7A8()
{
  return MEMORY[0x1F40FCB80]();
}

uint64_t sub_1DDEEE7B8()
{
  return MEMORY[0x1F40FCBC8]();
}

uint64_t sub_1DDEEE7C8()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1DDEEE7D8()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1DDEEE7E8()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1DDEEE7F8()
{
  return MEMORY[0x1F40FCCF0]();
}

uint64_t sub_1DDEEE808()
{
  return MEMORY[0x1F40FCD18]();
}

uint64_t sub_1DDEEE818()
{
  return MEMORY[0x1F40FCDD8]();
}

uint64_t sub_1DDEEE828()
{
  return MEMORY[0x1F40FCE18]();
}

uint64_t sub_1DDEEE838()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1DDEEE848()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1DDEEE858()
{
  return MEMORY[0x1F40FCEC0]();
}

uint64_t sub_1DDEEE868()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DDEEE878()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DDEEE888()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1DDEEE898()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DDEEE8A8()
{
  return MEMORY[0x1F4119180]();
}

uint64_t sub_1DDEEE8B8()
{
  return MEMORY[0x1F41191A8]();
}

uint64_t sub_1DDEEE8C8()
{
  return MEMORY[0x1F41191B0]();
}

uint64_t sub_1DDEEE8D8()
{
  return MEMORY[0x1F41191C0]();
}

uint64_t sub_1DDEEE8E8()
{
  return MEMORY[0x1F41191C8]();
}

uint64_t sub_1DDEEE8F8()
{
  return MEMORY[0x1F41191D0]();
}

uint64_t sub_1DDEEE908()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1DDEEE918()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1DDEEE928()
{
  return MEMORY[0x1F41876D0]();
}

uint64_t sub_1DDEEE938()
{
  return MEMORY[0x1F4183290]();
}

uint64_t sub_1DDEEE948()
{
  return MEMORY[0x1F41832F0]();
}

uint64_t sub_1DDEEE958()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DDEEE968()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DDEEE978()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1DDEEE988()
{
  return MEMORY[0x1F4183330]();
}

uint64_t sub_1DDEEE998()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1DDEEE9A8()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1DDEEE9B8()
{
  return MEMORY[0x1F4183438]();
}

uint64_t sub_1DDEEE9C8()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1DDEEE9D8()
{
  return MEMORY[0x1F4183450]();
}

uint64_t sub_1DDEEE9E8()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1DDEEE9F8()
{
  return MEMORY[0x1F41834B8]();
}

uint64_t sub_1DDEEEA08()
{
  return MEMORY[0x1F41834C0]();
}

uint64_t sub_1DDEEEA18()
{
  return MEMORY[0x1F41834F0]();
}

uint64_t sub_1DDEEEA28()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1DDEEEA38()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1DDEEEA48()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t sub_1DDEEEA58()
{
  return MEMORY[0x1F41835D8]();
}

uint64_t sub_1DDEEEA68()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1DDEEEA78()
{
  return MEMORY[0x1F41836F8]();
}

uint64_t sub_1DDEEEA88()
{
  return MEMORY[0x1F4183710]();
}

uint64_t sub_1DDEEEA98()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DDEEEAA8()
{
  return MEMORY[0x1F41837C8]();
}

uint64_t sub_1DDEEEAB8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DDEEEAC8()
{
  return MEMORY[0x1F40E6058]();
}

uint64_t sub_1DDEEEAD8()
{
  return MEMORY[0x1F40E60A8]();
}

uint64_t sub_1DDEEEAE8()
{
  return MEMORY[0x1F40E60D8]();
}

uint64_t sub_1DDEEEAF8()
{
  return MEMORY[0x1F40E60F0]();
}

uint64_t sub_1DDEEEB08()
{
  return MEMORY[0x1F40E6110]();
}

uint64_t sub_1DDEEEB18()
{
  return MEMORY[0x1F40E6128]();
}

uint64_t sub_1DDEEEB28()
{
  return MEMORY[0x1F40E6130]();
}

uint64_t sub_1DDEEEB38()
{
  return MEMORY[0x1F40E6148]();
}

uint64_t sub_1DDEEEB48()
{
  return MEMORY[0x1F40E6158]();
}

uint64_t sub_1DDEEEB58()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DDEEEB68()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1DDEEEB78()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DDEEEB88()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1DDEEEB98()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1DDEEEBA8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1DDEEEBB8()
{
  return MEMORY[0x1F40E62C8]();
}

uint64_t sub_1DDEEEBC8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DDEEEBD8()
{
  return MEMORY[0x1F41838A8]();
}

uint64_t sub_1DDEEEBE8()
{
  return MEMORY[0x1F4183968]();
}

uint64_t sub_1DDEEEBF8()
{
  return MEMORY[0x1F4183970]();
}

uint64_t sub_1DDEEEC08()
{
  return MEMORY[0x1F4183978]();
}

uint64_t sub_1DDEEEC18()
{
  return MEMORY[0x1F4183990]();
}

uint64_t sub_1DDEEEC28()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DDEEEC38()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DDEEEC48()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DDEEEC58()
{
  return MEMORY[0x1F4183A70]();
}

uint64_t sub_1DDEEEC68()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DDEEEC78()
{
  return MEMORY[0x1F4183AC0]();
}

uint64_t sub_1DDEEEC88()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1DDEEEC98()
{
  return MEMORY[0x1F4183B98]();
}

uint64_t sub_1DDEEECA8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1DDEEECB8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1DDEEECC8()
{
  return MEMORY[0x1F4183C28]();
}

uint64_t sub_1DDEEECD8()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1DDEEECE8()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1DDEEECF8()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1DDEEED08()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1DDEEED18()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1DDEEED28()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1DDEEED38()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1DDEEED48()
{
  return MEMORY[0x1F4183CE8]();
}

uint64_t sub_1DDEEED58()
{
  return MEMORY[0x1F4183D00]();
}

uint64_t sub_1DDEEED68()
{
  return MEMORY[0x1F4183DE0]();
}

uint64_t sub_1DDEEED78()
{
  return MEMORY[0x1F4183DE8]();
}

uint64_t sub_1DDEEED88()
{
  return MEMORY[0x1F4183DF0]();
}

uint64_t sub_1DDEEED98()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DDEEEDA8()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DDEEEDB8()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1DDEEEDC8()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1DDEEEDD8()
{
  return MEMORY[0x1F4183EE0]();
}

uint64_t sub_1DDEEEDE8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1DDEEEDF8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DDEEEE08()
{
  return MEMORY[0x1F4183F20]();
}

uint64_t sub_1DDEEEE18()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1DDEEEE28()
{
  return MEMORY[0x1F41876E8]();
}

uint64_t sub_1DDEEEE38()
{
  return MEMORY[0x1F41876F0]();
}

uint64_t sub_1DDEEEE48()
{
  return MEMORY[0x1F4183F48]();
}

uint64_t sub_1DDEEEE58()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1DDEEEE68()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1DDEEEE78()
{
  return MEMORY[0x1F4187700]();
}

uint64_t sub_1DDEEEE88()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1DDEEEE98()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1DDEEEEA8()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1DDEEEEB8()
{
  return MEMORY[0x1F4183FA0]();
}

uint64_t sub_1DDEEEEC8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1DDEEEED8()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1DDEEEEE8()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1DDEEEEF8()
{
  return MEMORY[0x1F4183FE8]();
}

uint64_t sub_1DDEEEF08()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1DDEEEF18()
{
  return MEMORY[0x1F4187738]();
}

uint64_t sub_1DDEEEF28()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DDEEEF38()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1DDEEEF48()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1DDEEEF58()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1DDEEEF68()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1DDEEEF78()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1DDEEEF88()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DDEEEF98()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DDEEEFB8()
{
  return MEMORY[0x1F4187E08]();
}

uint64_t sub_1DDEEEFC8()
{
  return MEMORY[0x1F4184018]();
}

uint64_t sub_1DDEEEFD8()
{
  return MEMORY[0x1F4184030]();
}

uint64_t sub_1DDEEEFE8()
{
  return MEMORY[0x1F4184060]();
}

uint64_t sub_1DDEEEFF8()
{
  return MEMORY[0x1F4184078]();
}

uint64_t sub_1DDEEF008()
{
  return MEMORY[0x1F4184118]();
}

uint64_t sub_1DDEEF018()
{
  return MEMORY[0x1F4184160]();
}

uint64_t sub_1DDEEF028()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_1DDEEF038()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1DDEEF048()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1DDEEF058()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1DDEEF068()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1DDEEF078()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1DDEEF088()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1DDEEF098()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1DDEEF0A8()
{
  return MEMORY[0x1F41843E8]();
}

uint64_t sub_1DDEEF0B8()
{
  return MEMORY[0x1F4184418]();
}

uint64_t sub_1DDEEF0C8()
{
  return MEMORY[0x1F4184428]();
}

uint64_t sub_1DDEEF0D8()
{
  return MEMORY[0x1F4187740]();
}

uint64_t sub_1DDEEF0E8()
{
  return MEMORY[0x1F4187748]();
}

uint64_t sub_1DDEEF0F8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1DDEEF108()
{
  return MEMORY[0x1F41844F0]();
}

uint64_t sub_1DDEEF118()
{
  return MEMORY[0x1F4184510]();
}

uint64_t sub_1DDEEF128()
{
  return MEMORY[0x1F4184568]();
}

uint64_t sub_1DDEEF138()
{
  return MEMORY[0x1F4184570]();
}

uint64_t sub_1DDEEF148()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1DDEEF158()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1DDEEF168()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1DDEEF178()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DDEEF188()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DDEEF198()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DDEEF1A8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DDEEF1B8()
{
  return MEMORY[0x1F4166510]();
}

uint64_t sub_1DDEEF1C8()
{
  return MEMORY[0x1F4166520]();
}

uint64_t sub_1DDEEF1D8()
{
  return MEMORY[0x1F4166530]();
}

uint64_t sub_1DDEEF1E8()
{
  return MEMORY[0x1F4166538]();
}

uint64_t sub_1DDEEF1F8()
{
  return MEMORY[0x1F4166598]();
}

uint64_t sub_1DDEEF208()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1DDEEF218()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DDEEF228()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DDEEF238()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DDEEF248()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1DDEEF258()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DDEEF268()
{
  return MEMORY[0x1F40E6740]();
}

uint64_t sub_1DDEEF278()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1DDEEF288()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1DDEEF298()
{
  return MEMORY[0x1F4166650]();
}

uint64_t sub_1DDEEF2A8()
{
  return MEMORY[0x1F4166658]();
}

uint64_t sub_1DDEEF2B8()
{
  return MEMORY[0x1F4166668]();
}

uint64_t sub_1DDEEF2C8()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1DDEEF2D8()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1DDEEF2E8()
{
  return MEMORY[0x1F4166688]();
}

uint64_t sub_1DDEEF2F8()
{
  return MEMORY[0x1F41666C0]();
}

uint64_t sub_1DDEEF308()
{
  return MEMORY[0x1F41666F8]();
}

uint64_t sub_1DDEEF318()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_1DDEEF328()
{
  return MEMORY[0x1F4166808]();
}

uint64_t sub_1DDEEF338()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DDEEF348()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_1DDEEF358()
{
  return MEMORY[0x1F4166850]();
}

uint64_t sub_1DDEEF368()
{
  return MEMORY[0x1F4166888]();
}

uint64_t sub_1DDEEF378()
{
  return MEMORY[0x1F41668A0]();
}

uint64_t sub_1DDEEF388()
{
  return MEMORY[0x1F41668B0]();
}

uint64_t sub_1DDEEF398()
{
  return MEMORY[0x1F41668D8]();
}

uint64_t sub_1DDEEF3A8()
{
  return MEMORY[0x1F41668E0]();
}

uint64_t sub_1DDEEF3B8()
{
  return MEMORY[0x1F4166910]();
}

uint64_t sub_1DDEEF3C8()
{
  return MEMORY[0x1F4166950]();
}

uint64_t sub_1DDEEF3D8()
{
  return MEMORY[0x1F4166968]();
}

uint64_t sub_1DDEEF3E8()
{
  return MEMORY[0x1F4166988]();
}

uint64_t sub_1DDEEF3F8()
{
  return MEMORY[0x1F4166998]();
}

uint64_t sub_1DDEEF408()
{
  return MEMORY[0x1F41669A8]();
}

uint64_t sub_1DDEEF418()
{
  return MEMORY[0x1F41669C0]();
}

uint64_t sub_1DDEEF428()
{
  return MEMORY[0x1F41669C8]();
}

uint64_t sub_1DDEEF438()
{
  return MEMORY[0x1F41669D8]();
}

uint64_t sub_1DDEEF448()
{
  return MEMORY[0x1F41669E8]();
}

uint64_t sub_1DDEEF458()
{
  return MEMORY[0x1F41669F0]();
}

uint64_t sub_1DDEEF468()
{
  return MEMORY[0x1F4166A28]();
}

uint64_t sub_1DDEEF478()
{
  return MEMORY[0x1F4166A38]();
}

uint64_t sub_1DDEEF488()
{
  return MEMORY[0x1F4166A48]();
}

uint64_t sub_1DDEEF498()
{
  return MEMORY[0x1F4166A50]();
}

uint64_t sub_1DDEEF4A8()
{
  return MEMORY[0x1F40E6968]();
}

uint64_t sub_1DDEEF4B8()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1DDEEF4C8()
{
  return MEMORY[0x1F41845D8]();
}

uint64_t sub_1DDEEF4D8()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_1DDEEF4E8()
{
  return MEMORY[0x1F4184618]();
}

uint64_t sub_1DDEEF4F8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DDEEF508()
{
  return MEMORY[0x1F40E6B80]();
}

uint64_t sub_1DDEEF518()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DDEEF528()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DDEEF538()
{
  return MEMORY[0x1F40E6BA8]();
}

uint64_t sub_1DDEEF548()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1DDEEF558()
{
  return MEMORY[0x1F40E6BD0]();
}

uint64_t sub_1DDEEF568()
{
  return MEMORY[0x1F40E6C38]();
}

uint64_t sub_1DDEEF578()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1DDEEF588()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1DDEEF598()
{
  return MEMORY[0x1F40E6CF0]();
}

uint64_t sub_1DDEEF5A8()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1DDEEF5B8()
{
  return MEMORY[0x1F41848A8]();
}

uint64_t sub_1DDEEF5C8()
{
  return MEMORY[0x1F40E6D90]();
}

uint64_t sub_1DDEEF5D8()
{
  return MEMORY[0x1F4184938]();
}

uint64_t sub_1DDEEF5E8()
{
  return MEMORY[0x1F4184940]();
}

uint64_t sub_1DDEEF5F8()
{
  return MEMORY[0x1F4184950]();
}

uint64_t sub_1DDEEF608()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DDEEF618()
{
  return MEMORY[0x1F4184A68]();
}

uint64_t sub_1DDEEF628()
{
  return MEMORY[0x1F4184A70]();
}

uint64_t sub_1DDEEF638()
{
  return MEMORY[0x1F4184AD0]();
}

uint64_t sub_1DDEEF648()
{
  return MEMORY[0x1F4184AD8]();
}

uint64_t sub_1DDEEF658()
{
  return MEMORY[0x1F4184AE0]();
}

uint64_t sub_1DDEEF668()
{
  return MEMORY[0x1F4184AE8]();
}

uint64_t sub_1DDEEF678()
{
  return MEMORY[0x1F4184AF0]();
}

uint64_t sub_1DDEEF688()
{
  return MEMORY[0x1F4184AF8]();
}

uint64_t sub_1DDEEF698()
{
  return MEMORY[0x1F4184B00]();
}

uint64_t sub_1DDEEF6A8()
{
  return MEMORY[0x1F4184B08]();
}

uint64_t sub_1DDEEF6B8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DDEEF6C8()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1DDEEF6D8()
{
  return MEMORY[0x1F4184BE8]();
}

uint64_t sub_1DDEEF6E8()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DDEEF6F8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DDEEF708()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DDEEF718()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1DDEEF728()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1DDEEF738()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1DDEEF748()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1DDEEF758()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1DDEEF768()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1DDEEF778()
{
  return MEMORY[0x1F4185060]();
}

uint64_t sub_1DDEEF788()
{
  return MEMORY[0x1F4187750]();
}

uint64_t sub_1DDEEF798()
{
  return MEMORY[0x1F4187758]();
}

uint64_t sub_1DDEEF7A8()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1DDEEF7B8()
{
  return MEMORY[0x1F41850A8]();
}

uint64_t sub_1DDEEF7C8()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t sub_1DDEEF7D8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DDEEF7E8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DDEEF7F8()
{
  return MEMORY[0x1F41852A8]();
}

uint64_t sub_1DDEEF808()
{
  return MEMORY[0x1F41852D0]();
}

uint64_t sub_1DDEEF818()
{
  return MEMORY[0x1F41852D8]();
}

uint64_t sub_1DDEEF828()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1DDEEF838()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1DDEEF848()
{
  return MEMORY[0x1F4185328]();
}

uint64_t sub_1DDEEF858()
{
  return MEMORY[0x1F4185330]();
}

uint64_t sub_1DDEEF868()
{
  return MEMORY[0x1F4185338]();
}

uint64_t sub_1DDEEF878()
{
  return MEMORY[0x1F4185340]();
}

uint64_t sub_1DDEEF888()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DDEEF898()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DDEEF8A8()
{
  return MEMORY[0x1F4185440]();
}

uint64_t sub_1DDEEF8B8()
{
  return MEMORY[0x1F4185448]();
}

uint64_t sub_1DDEEF8C8()
{
  return MEMORY[0x1F4185450]();
}

uint64_t sub_1DDEEF8D8()
{
  return MEMORY[0x1F4185458]();
}

uint64_t sub_1DDEEF8E8()
{
  return MEMORY[0x1F4185460]();
}

uint64_t sub_1DDEEF8F8()
{
  return MEMORY[0x1F4185468]();
}

uint64_t sub_1DDEEF908()
{
  return MEMORY[0x1F4185470]();
}

uint64_t sub_1DDEEF918()
{
  return MEMORY[0x1F4185478]();
}

uint64_t sub_1DDEEF928()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1DDEEF938()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DDEEF948()
{
  return MEMORY[0x1F41859C8]();
}

uint64_t sub_1DDEEF958()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1DDEEF968()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1DDEEF978()
{
  return MEMORY[0x1F41859F8]();
}

uint64_t sub_1DDEEF988()
{
  return MEMORY[0x1F4185A00]();
}

uint64_t sub_1DDEEF998()
{
  return MEMORY[0x1F4185A08]();
}

uint64_t sub_1DDEEF9A8()
{
  return MEMORY[0x1F4185A28]();
}

uint64_t sub_1DDEEF9B8()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1DDEEF9C8()
{
  return MEMORY[0x1F4185BB0]();
}

uint64_t sub_1DDEEF9D8()
{
  return MEMORY[0x1F4185D00]();
}

uint64_t sub_1DDEEF9F8()
{
  return MEMORY[0x1F4185D70]();
}

uint64_t sub_1DDEEFA08()
{
  return MEMORY[0x1F4185D78]();
}

uint64_t sub_1DDEEFA18()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1DDEEFA28()
{
  return MEMORY[0x1F4185D88]();
}

uint64_t sub_1DDEEFA38()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1DDEEFA48()
{
  return MEMORY[0x1F4185D98]();
}

uint64_t sub_1DDEEFA58()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1DDEEFA68()
{
  return MEMORY[0x1F4185DB0]();
}

uint64_t sub_1DDEEFA78()
{
  return MEMORY[0x1F40E6DF8]();
}

uint64_t sub_1DDEEFA88()
{
  return MEMORY[0x1F40E6E20]();
}

uint64_t sub_1DDEEFA98()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1DDEEFAA8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DDEEFAB8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DDEEFAC8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DDEEFAD8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DDEEFAE8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DDEEFAF8()
{
  return MEMORY[0x1F4185EC0]();
}

uint64_t sub_1DDEEFB08()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DDEEFB18()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1DDEEFB28()
{
  return MEMORY[0x1F41862C0]();
}

uint64_t sub_1DDEEFB38()
{
  return MEMORY[0x1F41862C8]();
}

uint64_t sub_1DDEEFB48()
{
  return MEMORY[0x1F41862D0]();
}

uint64_t sub_1DDEEFB58()
{
  return MEMORY[0x1F41862D8]();
}

uint64_t sub_1DDEEFB68()
{
  return MEMORY[0x1F41862E0]();
}

uint64_t sub_1DDEEFB78()
{
  return MEMORY[0x1F41862E8]();
}

uint64_t sub_1DDEEFB88()
{
  return MEMORY[0x1F41862F0]();
}

uint64_t sub_1DDEEFB98()
{
  return MEMORY[0x1F41862F8]();
}

uint64_t sub_1DDEEFBA8()
{
  return MEMORY[0x1F4186300]();
}

uint64_t sub_1DDEEFBB8()
{
  return MEMORY[0x1F4186308]();
}

uint64_t sub_1DDEEFBC8()
{
  return MEMORY[0x1F4186310]();
}

uint64_t sub_1DDEEFBD8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1F40D9840](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1F40DF448]();
}

CFDataRef ColorSyncProfileCopyData(ColorSyncProfileRef prof, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D6560](prof, error);
}

ColorSyncProfileRef ColorSyncProfileCreateWithName(CFStringRef name)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D65A0](name);
}

uint64_t EFArraysAreEqual()
{
  return MEMORY[0x1F4117A18]();
}

uint64_t EFContentProtectionGetObservedState()
{
  return MEMORY[0x1F4117A78]();
}

uint64_t EFContentProtectionStateDescription()
{
  return MEMORY[0x1F4117A80]();
}

uint64_t EFIsCustomerBuild()
{
  return MEMORY[0x1F4117AC0]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1F4117B38]();
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return MEMORY[0x1F41177C0]();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return MEMORY[0x1F41177E8]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1F41177F0]();
}

uint64_t EMLogSearchableIndexStatus()
{
  return MEMORY[0x1F4117810]();
}

uint64_t EMShortStringForCategory()
{
  return MEMORY[0x1F4117828]();
}

uint64_t EMStringFromCategoryType()
{
  return MEMORY[0x1F4117830]();
}

uint64_t EMStringFromSubtype()
{
  return MEMORY[0x1F4117838]();
}

uint64_t MFMessageListLoadingSignpostLog()
{
  return MEMORY[0x1F412EFD0]();
}

uint64_t MFPreferredAbbreviatedNameForAddressAndDisplayName()
{
  return MEMORY[0x1F40EDDE0]();
}

uint64_t MFPreferredCompositeNameForAddressAndDisplayName()
{
  return MEMORY[0x1F40EDDE8]();
}

uint64_t MFPreferredCompositeNameForPerson()
{
  return MEMORY[0x1F40EDDF0]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x1F40ECE20]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

uint64_t MSPreferredAbbreviatedNameForAddressAndDisplayName()
{
  return MEMORY[0x1F412C4F8]();
}

uint64_t MSPreferredCompositeNameForAddressAndDisplayName()
{
  return MEMORY[0x1F412C500]();
}

uint64_t MSSharedContactStore()
{
  return MEMORY[0x1F412C508]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1F417CE98]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x1F417CEF8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4166B70]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4166B90]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4166BA0](category);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4166CC0](image);
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1F4166E10]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4166EC8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

uint64_t _EFLocalizedStringFromTable()
{
  return MEMORY[0x1F4117B98]();
}

uint64_t _UIBarsDesktopNavigationBarEnabled()
{
  return MEMORY[0x1F4166FB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x1F40C9D48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1F4186390]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

long double fmax(long double __x, long double __y)
{
  MEMORY[0x1F40CC190](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1F41863F8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1F4188208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1F4188210]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F4186578]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1F4186708]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1F41867C0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1F4186818]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1F4186820]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1F4186828]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}