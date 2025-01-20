void sub_1000035A0()
{
  qword_10003C770 = 0x4072C00000000000;
}

id sub_1000035B4(double a1)
{
  uint64_t v3 = sub_100030630();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v51 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v48 - v7;
  uint64_t v9 = type metadata accessor for InviteMessageView(0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006E88(&qword_10003C818);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for InviteMessageDetails();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = (id)__chkstk_darwin(v17);
  v22 = (double *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  if ((v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize + 16] & 1) == 0) {
    return result;
  }
  uint64_t v50 = v3;
  v23 = *(void **)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler];
  if (!v23) {
    return result;
  }
  uint64_t v48 = v4;
  uint64_t v49 = (uint64_t)&v48 - v21;
  uint64_t v24 = (uint64_t)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  swift_beginAccess();
  sub_100007AE0(v24, (uint64_t)v14, &qword_10003C818);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return (id)sub_100008414((uint64_t)v14, &qword_10003C818);
  }
  uint64_t v25 = v49;
  sub_100007338((uint64_t)v14, v49);
  sub_10000739C(v25, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
  uint64_t v26 = qword_10003C768;
  id v27 = v23;
  if (v26 != -1) {
    swift_once();
  }
  double v28 = *(double *)&qword_10003C770;
  if (*(double *)&qword_10003C770 >= a1) {
    double v28 = a1;
  }
  uint64_t v29 = *(void *)&v28;
  v30 = v1;
  sub_10000AAB4((uint64_t)v19, v29, 0, (uint64_t)v1, (uint64_t)&off_1000394E8, 0, 0, (uint64_t)v11);
  sub_1000307F0();
  id result = [v27 view];
  uint64_t v31 = v50;
  if (!result)
  {
    __break(1u);
    goto LABEL_23;
  }
  v32 = result;
  [result invalidateIntrinsicContentSize];

  id result = [v27 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v33 = result;
  [result layoutSubviews];

  id result = [v27 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v34 = result;
  [result intrinsicContentSize];
  double v36 = v35;

  id result = [v27 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  v37 = result;
  [result intrinsicContentSize];
  double v39 = v38;

  sub_1000305C0();
  v40 = sub_100030620();
  os_log_type_t v41 = sub_100030D60();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 134218240;
    double v52 = v39;
    sub_100030DA0();
    *(_WORD *)(v42 + 12) = 2048;
    double v52 = v36;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "content size width: %f, height: %f", (uint8_t *)v42, 0x16u);
    swift_slowDealloc();
  }

  v43 = *(void (**)(char *, uint64_t))(v48 + 8);
  v43(v8, v31);
  if (*(double *)&qword_10003C770 < a1) {
    a1 = *(double *)&qword_10003C770;
  }
  v44 = v51;
  sub_1000305C0();
  v45 = sub_100030620();
  os_log_type_t v46 = sub_100030D60();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 134218240;
    double v52 = a1;
    sub_100030DA0();
    *(_WORD *)(v47 + 12) = 2048;
    double v52 = v36;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "contentSizeThatFits %f,%f", (uint8_t *)v47, 0x16u);
    swift_slowDealloc();
  }

  v43(v44, v31);
  id result = (id)sub_100007404(v49, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
  double *v22 = a1;
  v22[1] = v36;
  *((unsigned char *)v22 + 16) = 0;
  return result;
}

void sub_100003C38(char a1)
{
  v2 = v1;
  uint64_t v4 = sub_100030630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for MessagesViewController();
  v13.receiver = v2;
  v13.super_class = v8;
  [super viewWillAppear:a1 & 1];
  sub_1000305C0();
  uint64_t v9 = sub_100030620();
  os_log_type_t v10 = sub_100030D60();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Register for family update notification", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v12 = [self defaultCenter];
  [v12 addObserver:v2 selector:"handleFamilyDidUpdate" name:FAFamilyUpdateNotification object:0];
}

void sub_100003E44(char a1)
{
  v2 = v1;
  uint64_t v4 = sub_100030630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for MessagesViewController();
  v13.receiver = v2;
  v13.super_class = v8;
  [super viewDidDisappear:a1 & 1];
  sub_1000305C0();
  uint64_t v9 = sub_100030620();
  os_log_type_t v10 = sub_100030D60();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unregister for family update notification", v11, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v12 = [self defaultCenter];
  [v12 removeObserver:v2 name:FAFamilyUpdateNotification object:0];
}

id sub_100004048(void *a1)
{
  uint64_t v3 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006E88(&qword_10003C7F0);
  uint64_t v114 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v115 = v8;
  v116 = (char *)&v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v117 = (char *)&v106 - v9;
  uint64_t v10 = sub_100030630();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v123 = v10;
  uint64_t v124 = v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v14 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v106 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  v113 = (char *)&v106 - v19;
  __chkstk_darwin(v18);
  v118 = (char *)&v106 - v20;
  uint64_t v21 = sub_100006E88(&qword_10003C820);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  v111 = (char *)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v106 - v24;
  uint64_t v26 = sub_100030410();
  uint64_t v120 = *(void *)(v26 - 8);
  uint64_t v121 = v26;
  __chkstk_darwin(v26);
  v119 = (char *)&v106 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100006E88(&qword_10003C868);
  __chkstk_darwin(v28 - 8);
  v30 = (char *)&v106 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_1000304E0();
  uint64_t v122 = *(void *)(v31 - 8);
  uint64_t v32 = __chkstk_darwin(v31);
  v34 = (char *)&v106 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  double v36 = (char *)&v106 - v35;
  v112 = a1;
  id v37 = [a1 selectedMessage];
  if (v37)
  {
    double v38 = v37;
    v110 = v36;
    id v39 = [v37 URL];
    if (v39)
    {
      v40 = v39;
      v108 = v5;
      v109 = v1;
      sub_1000304C0();

      uint64_t v41 = v122;
      uint64_t v42 = v31;
      v43 = *(void (**)(char *, char *, uint64_t))(v122 + 32);
      v43(v30, v34, v42);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v30, 0, 1, v42);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v30, 1, v42) != 1)
      {
        v44 = v110;
        uint64_t v107 = v42;
        v43(v110, v30, v42);
        sub_100030400();
        uint64_t v46 = v120;
        uint64_t v45 = v121;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v120 + 48))(v25, 1, v121) == 1)
        {
          sub_100008414((uint64_t)v25, &qword_10003C820);
          sub_1000305C0();
          uint64_t v47 = sub_100030620();
          os_log_type_t v48 = sub_100030D60();
          BOOL v49 = os_log_type_enabled(v47, v48);
          uint64_t v50 = v109;
          if (v49)
          {
            v51 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v51 = 0;
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "Missing url components for invite message url", v51, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v124 + 8))(v17, v123);
          id result = [v50 view];
          uint64_t v53 = v107;
          if (result)
          {
            v54 = result;
            id v55 = [self blackColor];
            [v54 setBackgroundColor:v55];

            return (id)(*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v44, v53);
          }
          else
          {
            __break(1u);
          }
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v119, v25, v45);
          v59 = v118;
          sub_1000305B0();
          id v60 = v38;
          v61 = sub_100030620();
          os_log_type_t v62 = sub_100030D60();
          BOOL v63 = os_log_type_enabled(v61, v62);
          v64 = v109;
          id v106 = v60;
          if (v63)
          {
            v65 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v65 = 67109120;
            v59 = v118;
            LODWORD(v126[0]) = [v60 isPending];
            sub_100030DA0();

            _os_log_impl((void *)&_mh_execute_header, v61, v62, "in compose screen %{BOOL}d", v65, 8u);
            swift_slowDealloc();
          }
          else
          {
          }
          uint64_t v66 = v123;
          uint64_t v67 = v124;
          v68 = v112;
          v69 = v113;
          uint64_t v70 = (uint64_t)v111;

          v72 = *(char **)(v67 + 8);
          uint64_t v71 = v67 + 8;
          v118 = v72;
          ((void (*)(char *, uint64_t))v72)(v59, v66);
          (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v70, v119, v45);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v70, 0, 1, v45);
          uint64_t v73 = (uint64_t)&v64[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
          swift_beginAccess();
          sub_100008470(v70, v73, &qword_10003C820);
          swift_endAccess();
          sub_1000305B0();
          id v74 = v68;
          v75 = sub_100030620();
          os_log_type_t v76 = sub_100030D60();
          v77 = &Family_MSMessagesAppViewController__metaData;
          if (os_log_type_enabled(v75, v76))
          {
            v78 = (uint8_t *)swift_slowAlloc();
            uint64_t v79 = swift_slowAlloc();
            uint64_t v124 = v71;
            v126[0] = v79;
            *(_DWORD *)v78 = 136315138;
            v113 = (char *)(v78 + 4);
            id v80 = [v74 recipientAddresses];
            v81 = v69;
            sub_100030CB0();

            uint64_t v82 = sub_100030CC0();
            unint64_t v84 = v83;
            swift_bridgeObjectRelease();
            uint64_t v125 = sub_10002E7E4(v82, v84, v126);
            sub_100030DA0();
            swift_bridgeObjectRelease();

            _os_log_impl((void *)&_mh_execute_header, v75, v76, "recipientAddresses from conversation %s", v78, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            v77 = &Family_MSMessagesAppViewController__metaData;
            swift_slowDealloc();

            v85 = v81;
            v64 = v109;
            ((void (*)(char *, uint64_t))v118)(v85, v123);
          }
          else
          {

            ((void (*)(char *, uint64_t))v118)(v69, v66);
          }
          uint64_t v86 = (uint64_t)v108;
          uint64_t v88 = (uint64_t)v116;
          uint64_t v87 = (uint64_t)v117;
          uint64_t v89 = v114;
          id v90 = [v74 *(SEL *)&v77[13].flags:v106];
          v91 = (void *)sub_100030CB0();

          if (v91[2])
          {
            uint64_t v93 = v91[4];
            unint64_t v92 = v91[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v93 = 0;
            unint64_t v92 = 0xE000000000000000;
          }
          v94 = &v64[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
          *(void *)v94 = v93;
          *((void *)v94 + 1) = v92;
          swift_bridgeObjectRelease();
          id v95 = v106;
          unsigned __int8 v96 = [v106 isPending];
          id v97 = [v95 time];
          if (v97)
          {
            v98 = v97;
            sub_1000304F0();

            uint64_t v99 = sub_100030510();
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v87, 0, 1, v99);
          }
          else
          {
            uint64_t v100 = sub_100030510();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v100 - 8) + 56))(v87, 1, 1, v100);
          }
          uint64_t v101 = sub_100030D20();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v86, 1, 1, v101);
          sub_100007AE0(v87, v88, &qword_10003C7F0);
          sub_100030D00();
          v102 = v64;
          uint64_t v103 = sub_100030CF0();
          unint64_t v104 = (*(unsigned __int8 *)(v89 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
          uint64_t v105 = swift_allocObject();
          *(void *)(v105 + 16) = v103;
          *(void *)(v105 + 24) = &protocol witness table for MainActor;
          *(void *)(v105 + 32) = v102;
          *(unsigned char *)(v105 + 40) = v96;
          sub_100006ED0(v88, v105 + v104);
          sub_100005FC4(v86, (uint64_t)&unk_10003C870, v105);
          swift_release();

          sub_100008414(v87, &qword_10003C7F0);
          (*(void (**)(char *, uint64_t))(v120 + 8))(v119, v121);
          return (id)(*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v110, v107);
        }
        return result;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v122 + 56))(v30, 1, 1, v31);
    }

    sub_100008414((uint64_t)v30, &qword_10003C868);
  }
  sub_1000305C0();
  v56 = sub_100030620();
  os_log_type_t v57 = sub_100030D60();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "Missing invite message url", v58, 2u);
    swift_slowDealloc();
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v124 + 8))(v14, v123);
}

void sub_100004D60(void *a1)
{
  v2 = v1;
  id v4 = [a1 view];
  if (v4)
  {
    id v46 = v4;
    id v5 = [v2 view];
    if (v5)
    {
      id v44 = v5;
      uint64_t v45 = a1;
      id v6 = [v2 childViewControllers];
      sub_1000076B4(0, &qword_10003C838);
      unint64_t v7 = sub_100030CB0();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_100030E60();
        if (!v8) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v8) {
          goto LABEL_15;
        }
      }
      if (v8 < 1)
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v9 = 0;
      do
      {
        if ((v7 & 0xC000000000000001) != 0) {
          id v10 = (id)sub_100030E20();
        }
        else {
          id v10 = *(id *)(v7 + 8 * v9 + 32);
        }
        uint64_t v11 = v10;
        ++v9;
        [v10 willMoveToParentViewController:0];
        id v12 = [v11 view];
        [v12 removeFromSuperview];

        [v11 removeFromParentViewController];
      }
      while (v8 != v9);
LABEL_15:
      swift_bridgeObjectRelease_n();
      id v13 = [v2 view];
      if (v13)
      {
        v14 = v13;
        id v15 = [self systemGray5Color];
        [v14 setBackgroundColor:v15];

        [v2 _balloonMaskEdgeInsets];
        uint64_t v17 = v16;
        uint64_t v19 = v18;
        uint64_t v21 = v20;
        uint64_t v23 = v22;
        [v2 addChildViewController:v45];
        id v24 = [v2 view];
        if (v24)
        {
          uint64_t v25 = v24;
          [v24 addSubview:v46];

          [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
          sub_100006E88(&qword_10003C840);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_100031EC0;
          *(void *)(inited + 32) = 1952867692;
          *(void *)(inited + 40) = 0xE400000000000000;
          *(void *)(inited + 48) = v19;
          *(void *)(inited + 72) = &type metadata for CGFloat;
          *(void *)(inited + 80) = 0x7468676972;
          *(void *)(inited + 88) = 0xE500000000000000;
          *(void *)(inited + 96) = v23;
          *(void *)(inited + 120) = &type metadata for CGFloat;
          *(void *)(inited + 128) = 7368564;
          *(void *)(inited + 136) = 0xE300000000000000;
          *(void *)(inited + 144) = v17;
          *(void *)(inited + 168) = &type metadata for CGFloat;
          *(void *)(inited + 176) = 0x6D6F74746F62;
          *(void *)(inited + 184) = 0xE600000000000000;
          *(void *)(inited + 216) = &type metadata for CGFloat;
          *(void *)(inited + 192) = v21;
          sub_100028128(inited);
          id v43 = self;
          swift_bridgeObjectRetain();
          NSString v27 = sub_100030C50();
          Class isa = sub_100030BE0().super.isa;
          uint64_t v29 = swift_initStackObject();
          *(_OWORD *)(v29 + 16) = xmmword_100031ED0;
          *(void *)(v29 + 32) = 2003134838;
          *(void *)(v29 + 40) = 0xE400000000000000;
          uint64_t v30 = sub_1000076B4(0, &qword_10003C848);
          *(void *)(v29 + 72) = v30;
          *(void *)(v29 + 48) = v46;
          id v31 = v46;
          sub_100028128(v29);
          Class v32 = sub_100030BE0().super.isa;
          swift_bridgeObjectRelease();
          id v33 = [v43 constraintsWithVisualFormat:v27 options:0 metrics:isa views:v32];

          sub_1000076B4(0, &qword_10003C850);
          unint64_t v34 = sub_100030CB0();
          swift_bridgeObjectRelease();

          sub_1000074E8(v34);
          swift_bridgeObjectRetain();
          NSString v35 = sub_100030C50();
          Class v36 = sub_100030BE0().super.isa;
          uint64_t v37 = swift_initStackObject();
          *(_OWORD *)(v37 + 16) = xmmword_100031ED0;
          *(void *)(v37 + 32) = 2003134838;
          *(void *)(v37 + 40) = 0xE400000000000000;
          *(void *)(v37 + 48) = v31;
          *(void *)(v37 + 72) = v30;
          id v38 = v31;
          sub_100028128(v37);
          Class v39 = sub_100030BE0().super.isa;
          swift_bridgeObjectRelease();
          id v40 = [v43 constraintsWithVisualFormat:v35 options:0 metrics:v36 views:v39];

          unint64_t v41 = sub_100030CB0();
          swift_bridgeObjectRelease();

          sub_1000074E8(v41);
          swift_bridgeObjectRelease();
          Class v42 = sub_100030CA0().super.isa;
          swift_bridgeObjectRelease();
          [v44 addConstraints:v42];

          [v45 didMoveToParentViewController:v2];
          [v2 requestResize];

          return;
        }
LABEL_21:
        __break(1u);
        return;
      }
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
  }
}

void sub_1000053EC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000054C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  *(unsigned char *)(v6 + 248) = a5;
  *(void *)(v6 + 64) = a4;
  *(void *)(v6 + 72) = a6;
  type metadata accessor for InviteMessageView(0);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  sub_100006E88(&qword_10003C818);
  *(void *)(v6 + 96) = swift_task_alloc();
  *(void *)(v6 + 104) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for InviteMessageDetails();
  *(void *)(v6 + 112) = v7;
  *(void *)(v6 + 120) = *(void *)(v7 - 8);
  *(void *)(v6 + 128) = swift_task_alloc();
  *(void *)(v6 + 136) = swift_task_alloc();
  uint64_t v8 = sub_100030630();
  *(void *)(v6 + 144) = v8;
  *(void *)(v6 + 152) = *(void *)(v8 - 8);
  *(void *)(v6 + 160) = swift_task_alloc();
  *(void *)(v6 + 168) = swift_task_alloc();
  sub_100006E88(&qword_10003C820);
  *(void *)(v6 + 176) = swift_task_alloc();
  uint64_t v9 = sub_100030410();
  *(void *)(v6 + 184) = v9;
  *(void *)(v6 + 192) = *(void *)(v9 - 8);
  *(void *)(v6 + 200) = swift_task_alloc();
  sub_100030D00();
  *(void *)(v6 + 208) = sub_100030CF0();
  uint64_t v11 = sub_100030CE0();
  *(void *)(v6 + 216) = v11;
  *(void *)(v6 + 224) = v10;
  return _swift_task_switch(sub_100005740, v11, v10);
}

uint64_t sub_100005740()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 64) + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents;
  swift_beginAccess();
  sub_100007AE0(v4, v3, &qword_10003C820);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 176);
    swift_release();
    sub_100008414(v5, &qword_10003C820);
    sub_1000305C0();
    uint64_t v6 = sub_100030620();
    os_log_type_t v7 = sub_100030D40();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Message bubble missing urlComponents", v8, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 144));
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
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 64);
    (*(void (**)(void, void, void))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 200), *(void *)(v0 + 176), *(void *)(v0 + 184));
    uint64_t v13 = *(void *)(v11
                    + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation);
    uint64_t v12 = *(void *)(v11
                    + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation
                    + 8);
    *(void *)(v0 + 232) = v12;
    uint64_t v14 = v11 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher;
    swift_bridgeObjectRetain();
    id v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v15;
    *id v15 = v0;
    v15[1] = sub_100005A10;
    uint64_t v16 = *(void *)(v0 + 200);
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v18 = *(void *)(v0 + 72);
    char v19 = *(unsigned char *)(v0 + 248);
    return sub_100028494(v17, v16, v19, v13, v12, v14, v18);
  }
}

uint64_t sub_100005A10()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 224);
  uint64_t v3 = *(void *)(v1 + 216);
  return _swift_task_switch(sub_100005B54, v3, v2);
}

uint64_t sub_100005B54()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[13];
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100008414(v0[13], &qword_10003C818);
    sub_1000305C0();
    uint64_t v4 = sub_100030620();
    os_log_type_t v5 = sub_100030D40();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Message bubble could not build inviteMessageDetail", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v8 = v0[19];
    uint64_t v7 = v0[20];
    uint64_t v9 = v0[18];

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  else
  {
    uint64_t v10 = v0[16];
    uint64_t v11 = v0[17];
    uint64_t v12 = v0[14];
    uint64_t v13 = v0[15];
    uint64_t v14 = v0[12];
    uint64_t v15 = v0[8];
    sub_100007338(v0[13], v11);
    uint64_t v16 = v15 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize;
    *(void *)uint64_t v16 = 0;
    *(void *)(v16 + 8) = 0;
    *(unsigned char *)(v16 + 16) = 1;
    sub_10000739C(v11, v14, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v14, 0, 1, v12);
    uint64_t v17 = v15 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
    swift_beginAccess();
    sub_100008470(v14, v17, &qword_10003C818);
    swift_endAccess();
    sub_10000739C(v11, v10, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
    if (qword_10003C768 != -1) {
      swift_once();
    }
    uint64_t v18 = v0[16];
    uint64_t v20 = v0[10];
    uint64_t v19 = v0[11];
    uint64_t v21 = (void *)v0[8];
    uint64_t v22 = qword_10003C770;
    id v23 = v21;
    sub_10000AAB4(v18, v22, 0, (uint64_t)v21, (uint64_t)&off_1000394E8, 0, 0, v19);
    sub_10000739C(v19, v20, type metadata accessor for InviteMessageView);
    id v24 = objc_allocWithZone((Class)sub_100006E88(&qword_10003C828));
    uint64_t v25 = (void *)sub_1000307E0();
    sub_1000307D0();
    id v26 = [v25 view];
    if (v26)
    {
      NSString v27 = v26;
      sub_100006E88(&qword_10003C830);
      if (swift_dynamicCastClass()) {
        sub_100030690();
      }
    }
    uint64_t v28 = v0[17];
    uint64_t v29 = (char *)v0[8];
    sub_100007404(v0[11], type metadata accessor for InviteMessageView);
    uint64_t v30 = *(void **)&v29[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler];
    *(void *)&v29[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = v25;
    id v31 = v25;

    sub_100004D60(v31);
    [v29 setReadyForDisplay];

    sub_100007404(v28, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
  }
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
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
  Class v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_100005F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005FC4(a1, a2, a3);
}

uint64_t sub_100005F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100005FC4(a1, a2, a3);
}

uint64_t sub_100005FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100030D20();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100030D10();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100008414(a1, &qword_10003C7E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100030CE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100006268()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006E88(&qword_10003C7F0);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v26 + 64);
  uint64_t v7 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_100030630();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000305C0();
  uint64_t v15 = sub_100030620();
  os_log_type_t v16 = sub_100030D60();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = v10;
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received notification for family update", v17, 2u);
    uint64_t v10 = v25;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v18 = sub_100030510();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 1, 1, v18);
  uint64_t v19 = sub_100030D20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 1, 1, v19);
  sub_100007AE0((uint64_t)v10, (uint64_t)v8, &qword_10003C7F0);
  sub_100030D00();
  id v20 = v1;
  uint64_t v21 = sub_100030CF0();
  unint64_t v22 = (*(unsigned __int8 *)(v26 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v21;
  *(void *)(v23 + 24) = &protocol witness table for MainActor;
  *(void *)(v23 + 32) = v20;
  *(unsigned char *)(v23 + 40) = 0;
  sub_100006ED0((uint64_t)v8, v23 + v22);
  sub_100005FC4((uint64_t)v4, (uint64_t)&unk_10003C800, v23);
  swift_release();
  return sub_100008414((uint64_t)v10, &qword_10003C7F0);
}

id sub_10000664C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (uint64_t *)&v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  uint64_t v7 = type metadata accessor for FamilyFetcher();
  uint64_t v8 = swift_allocObject();
  v6[3] = v7;
  v6[4] = (uint64_t)&off_100039A60;
  *uint64_t v6 = v8;
  uint64_t v9 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  uint64_t v11 = sub_100030410();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  uint64_t v13 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(void *)&v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  uint64_t v14 = &v3[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  if (a2)
  {
    NSString v15 = sub_100030C50();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v15 = 0;
  }
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for MessagesViewController();
  id v16 = [super initWithNibName:v15 bundle:a3];

  return v16;
}

id sub_100006844(void *a1)
{
  uint64_t v3 = (uint64_t *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  uint64_t v4 = type metadata accessor for FamilyFetcher();
  uint64_t v5 = swift_allocObject();
  v3[3] = v4;
  v3[4] = (uint64_t)&off_100039A60;
  *uint64_t v3 = v5;
  uint64_t v6 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  uint64_t v8 = sub_100030410();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  uint64_t v10 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(void *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  uint64_t v11 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for MessagesViewController();
  id v12 = [super initWithCoder:a1];

  return v12;
}

id sub_1000069C8(char a1)
{
  uint64_t v3 = (uint64_t *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher];
  uint64_t v4 = type metadata accessor for FamilyFetcher();
  uint64_t v5 = swift_allocObject();
  v3[3] = v4;
  v3[4] = (uint64_t)&off_100039A60;
  *uint64_t v3 = v5;
  uint64_t v6 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_recipientHandleFromConversation];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents];
  uint64_t v8 = sub_100030410();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails];
  uint64_t v10 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(void *)&v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler] = 0;
  uint64_t v11 = &v1[OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_computedSize];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  v11[16] = 1;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for MessagesViewController();
  return [super initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

id sub_100006B40()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesViewController();
  [super dealloc];
}

uint64_t sub_100006C08()
{
  return type metadata accessor for MessagesViewController();
}

uint64_t type metadata accessor for MessagesViewController()
{
  uint64_t result = qword_10003C7C0;
  if (!qword_10003C7C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006C5C()
{
  sub_100006D84(319, &qword_10003C7D0, (void (*)(uint64_t))&type metadata accessor for URLComponents);
  if (v0 <= 0x3F)
  {
    sub_100006D84(319, &qword_10003C7D8, (void (*)(uint64_t))type metadata accessor for InviteMessageDetails);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100006D84(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100030D90();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

__n128 initializeWithTake for InviteLoadingView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006DE8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006E08(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize()
{
  if (!qword_10003C7E0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10003C7E0);
    }
  }
}

uint64_t sub_100006E88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E88(&qword_10003C7F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006F38(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006E88(&qword_10003C7F0) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  char v8 = *(unsigned char *)(v1 + 40);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000890C;
  return sub_1000054C4(a1, v5, v6, v7, v8, v9);
}

BOOL sub_100007044(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_100007058(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100007064(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100007074(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100007150;
  return v6(a1);
}

uint64_t sub_100007150()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100007248()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007280(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000890C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003C808 + dword_10003C808);
  return v6(a1, v4);
}

uint64_t sub_100007338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000739C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007404(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007464(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_100007490(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000074B8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1000074E8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100030E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100030E60();
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
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
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
    uint64_t v9 = sub_100030E30();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000076F0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100030E60();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100030CD0();
}

uint64_t sub_1000076B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000076F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100030E60();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
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
    uint64_t v10 = sub_100030E60();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000079B4();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100006E88(&qword_10003C858);
          uint64_t v12 = sub_100007904(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000076B4(0, &qword_10003C850);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100030EA0();
  __break(1u);
  return result;
}

void (*sub_100007904(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100007A58(v6, a2, a3);
  return sub_10000796C;
}

void sub_10000796C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_1000079B4()
{
  unint64_t result = qword_10003C860;
  if (!qword_10003C860)
  {
    sub_100007A10(&qword_10003C858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C860);
  }
  return result;
}

uint64_t sub_100007A10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void (*sub_100007A58(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100030E20();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100007AD8;
  }
  __break(1u);
  return result;
}

void sub_100007AD8(id *a1)
{
}

uint64_t sub_100007AE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006E88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007B44(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100007C24;
  return v5(v2 + 32);
}

uint64_t sub_100007C24()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100007D38(void *a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100030630();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  id v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v37 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v12 = sub_100006E88(&qword_10003C818);
  __chkstk_darwin(v12 - 8);
  id v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for InviteMessageDetails();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  objc_super v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  Class v39 = a1;
  uint64_t v20 = (uint64_t)a1 + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
  swift_beginAccess();
  sub_100007AE0(v20, (uint64_t)v14, &qword_10003C818);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    _Block_copy(a2);
    sub_100008414((uint64_t)v14, &qword_10003C818);
    sub_1000305C0();
    uint64_t v21 = sub_100030620();
    os_log_type_t v22 = sub_100030D40();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Snapshot fallback, no bubble", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v41);
    os_log_type_t v48 = sub_1000083E8;
    uint64_t v49 = v19;
    aBlock = _NSConcreteStackBlock;
    uint64_t v45 = 1107296256;
    id v46 = sub_1000053EC;
    uint64_t v47 = &unk_100039578;
    id v24 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v25 = (objc_class *)type metadata accessor for MessagesViewController();
    v43.receiver = v39;
    v43.super_class = v25;
    [super updateSnapshotWithCompletionBlock:v24];
    _Block_release(v24);
  }
  else
  {
    sub_100007338((uint64_t)v14, (uint64_t)v18);
    switch(v18[232])
    {
      case 2:
        _Block_copy(a2);
        swift_bridgeObjectRelease();
        goto LABEL_8;
      default:
        char v26 = sub_100030ED0();
        _Block_copy(a2);
        swift_bridgeObjectRelease();
        if (v26)
        {
LABEL_8:
          sub_1000305C0();
          NSString v27 = sub_100030620();
          os_log_type_t v28 = sub_100030D60();
          if (os_log_type_enabled(v27, v28))
          {
            uint64_t v29 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Snapshot, state is pending. Don't use cached view", v29, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v41);
          a2[2](a2, 0);
        }
        else
        {
          uint64_t v30 = v38;
          sub_1000305C0();
          id v31 = sub_100030620();
          os_log_type_t v32 = sub_100030D60();
          if (os_log_type_enabled(v31, v32))
          {
            id v33 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v33 = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "Snapshot normal fallback", v33, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v40 + 8))(v30, v41);
          os_log_type_t v48 = sub_1000083E8;
          uint64_t v49 = v19;
          aBlock = _NSConcreteStackBlock;
          uint64_t v45 = 1107296256;
          id v46 = sub_1000053EC;
          uint64_t v47 = &unk_1000395A0;
          uint64_t v34 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          NSString v35 = (objc_class *)type metadata accessor for MessagesViewController();
          v42.receiver = v39;
          v42.super_class = v35;
          [super updateSnapshotWithCompletionBlock:v34];
          _Block_release(v34);
        }
        sub_100007404((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
        break;
    }
  }
  return swift_release();
}

uint64_t sub_1000083B0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000083E8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000083FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000840C()
{
  return swift_release();
}

uint64_t sub_100008414(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006E88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008470(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006E88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000084D8()
{
  uint64_t v1 = *(void *)(sub_100006E88(&qword_10003C7F0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 41) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();

  uint64_t v5 = sub_100030510();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100008608(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100006E88(&qword_10003C7F0) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = *(void *)(v1 + 32);
  char v8 = *(unsigned char *)(v1 + 40);
  uint64_t v9 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100008710;
  return sub_1000054C4(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_100008710()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008804(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008854(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008710;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003C878 + dword_10003C878);
  return v6(a1, v4);
}

uint64_t sub_100008920(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v27 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v12;
    uint64_t v13 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v13;
    uint64_t v14 = a2[17];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v14;
    uint64_t v15 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v15;
    uint64_t v16 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v16;
    uint64_t v17 = a2[23];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = v17;
    uint64_t v18 = a2[25];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = v18;
    uint64_t v19 = a2[27];
    *(void *)(a1 + 208) = a2[26];
    *(void *)(a1 + 216) = v19;
    *(void *)(a1 + 224) = a2[28];
    *(unsigned char *)(a1 + 232) = *((unsigned char *)a2 + 232);
    *(unsigned char *)(a1 + 233) = *((unsigned char *)a2 + 233);
    *(unsigned char *)(a1 + 234) = *((unsigned char *)a2 + 234);
    uint64_t v20 = a2[31];
    *(void *)(a1 + 240) = a2[30];
    *(void *)(a1 + 248) = v20;
    uint64_t v21 = a2[33];
    *(void *)(a1 + 256) = a2[32];
    *(void *)(a1 + 264) = v21;
    v59 = (int *)type metadata accessor for InviteMessageDetails();
    uint64_t v22 = v59[24];
    __dst = (void *)(v4 + v22);
    os_log_type_t v57 = (char *)a2 + v22;
    uint64_t v23 = sub_1000304E0();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48);
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v25(v57, 1, v23))
    {
      uint64_t v26 = sub_100006E88(&qword_10003C868);
      memcpy(__dst, v57, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 16))(__dst, v57, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
    }
    uint64_t v28 = v59[25];
    uint64_t v29 = (void *)(v4 + v28);
    uint64_t v30 = (char *)a2 + v28;
    if (v25((char *)a2 + v28, 1, v23))
    {
      uint64_t v31 = sub_100006E88(&qword_10003C868);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v29, v30, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v29, 0, 1, v23);
    }
    uint64_t v32 = v59[26];
    id v33 = (void *)(v4 + v32);
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = sub_100030510();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v37 = sub_100006E88(&qword_10003C7F0);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    *(unsigned char *)(v4 + v59[27]) = *((unsigned char *)a2 + v59[27]);
    uint64_t v38 = a3[5];
    uint64_t v39 = a3[6];
    uint64_t v40 = v4 + v38;
    uint64_t v41 = (uint64_t)a2 + v38;
    *(void *)uint64_t v40 = *(void *)v41;
    *(unsigned char *)(v40 + 8) = *(unsigned char *)(v41 + 8);
    long long v42 = *(_OWORD *)((char *)a2 + v39);
    *(_OWORD *)(v4 + v39) = v42;
    uint64_t v43 = a3[7];
    uint64_t v44 = v4 + v43;
    uint64_t v45 = (uint64_t)a2 + v43;
    long long v46 = *(_OWORD *)((char *)a2 + v43 + 24);
    *(_OWORD *)(v4 + v43 + 24) = v46;
    uint64_t v47 = v46;
    os_log_type_t v48 = **(void (***)(uint64_t, uint64_t, uint64_t))(v46 - 8);
    id v49 = (id)v42;
    v48(v44, v45, v47);
    uint64_t v50 = a3[8];
    uint64_t v51 = a3[9];
    uint64_t v52 = v4 + v50;
    uint64_t v53 = (uint64_t)a2 + v50;
    *(unsigned char *)uint64_t v52 = *(unsigned char *)v53;
    *(void *)(v52 + 8) = *(void *)(v53 + 8);
    uint64_t v54 = v4 + v51;
    uint64_t v55 = (uint64_t)a2 + v51;
    *(unsigned char *)uint64_t v54 = *(unsigned char *)v55;
    *(void *)(v54 + 8) = *(void *)(v55 + 8);
    *(void *)(v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100008E74(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v5 = a1 + v4[24];
  uint64_t v6 = sub_1000304E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = a1 + v4[25];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v10 = a1 + v4[26];
  uint64_t v11 = sub_100030510();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }

  sub_100008804(a1 + *(int *)(a2 + 28));
  swift_release();

  return swift_release();
}

uint64_t sub_1000090D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  uint64_t v17 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v17;
  uint64_t v18 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v18;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v19 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v19;
  uint64_t v20 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v20;
  os_log_type_t v57 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v21 = v57[24];
  __dst = (void *)(a1 + v21);
  uint64_t v55 = (const void *)(a2 + v21);
  uint64_t v22 = sub_1000304E0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v24(v55, 1, v22))
  {
    uint64_t v25 = sub_100006E88(&qword_10003C868);
    memcpy(__dst, v55, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(__dst, v55, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
  }
  uint64_t v26 = v57[25];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  if (v24((const void *)(a2 + v26), 1, v22))
  {
    uint64_t v29 = sub_100006E88(&qword_10003C868);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v27, v28, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v22);
  }
  uint64_t v30 = v57[26];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = sub_100030510();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100006E88(&qword_10003C7F0);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  *(unsigned char *)(a1 + v57[27]) = *(unsigned char *)(a2 + v57[27]);
  uint64_t v36 = a3[5];
  uint64_t v37 = a3[6];
  uint64_t v38 = a1 + v36;
  uint64_t v39 = a2 + v36;
  *(void *)uint64_t v38 = *(void *)v39;
  *(unsigned char *)(v38 + 8) = *(unsigned char *)(v39 + 8);
  long long v40 = *(_OWORD *)(a2 + v37);
  *(_OWORD *)(a1 + v37) = v40;
  uint64_t v41 = a3[7];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  long long v44 = *(_OWORD *)(a2 + v41 + 24);
  *(_OWORD *)(a1 + v41 + 24) = v44;
  uint64_t v45 = v44;
  long long v46 = **(void (***)(uint64_t, uint64_t, uint64_t))(v44 - 8);
  id v47 = (id)v40;
  v46(v42, v43, v45);
  uint64_t v48 = a3[8];
  uint64_t v49 = a3[9];
  uint64_t v50 = a1 + v48;
  uint64_t v51 = a2 + v48;
  *(unsigned char *)uint64_t v50 = *(unsigned char *)v51;
  *(void *)(v50 + 8) = *(void *)(v51 + 8);
  uint64_t v52 = a1 + v49;
  uint64_t v53 = a2 + v49;
  *(unsigned char *)uint64_t v52 = *(unsigned char *)v53;
  *(void *)(v52 + 8) = *(void *)(v53 + 8);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1000095DC(uint64_t a1, uint64_t a2, int *a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v6 = v5[24];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_1000304E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_100006E88(&qword_10003C868);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = v5[25];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  int v18 = v11((void *)(a1 + v15), 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_100006E88(&qword_10003C868);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = v5[26];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_100030510();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v22, v23, v24);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    uint64_t v29 = sub_100006E88(&qword_10003C7F0);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v22, v23, v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_19:
  *(unsigned char *)(a1 + v5[27]) = *(unsigned char *)(a2 + v5[27]);
  uint64_t v30 = a3[5];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v33 = *v32;
  *(unsigned char *)(v31 + 8) = *((unsigned char *)v32 + 8);
  *(void *)uint64_t v31 = v33;
  uint64_t v34 = a3[6];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void **)v36;
  uint64_t v38 = *(void *)(v36 + 8);
  uint64_t v39 = *(void **)v35;
  *(void *)uint64_t v35 = *(void *)v36;
  id v40 = v37;

  *(void *)(v35 + 8) = v38;
  sub_100009CA8((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  uint64_t v41 = a3[8];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  *(unsigned char *)uint64_t v42 = *(unsigned char *)v43;
  *(void *)(v42 + 8) = *(void *)(v43 + 8);
  swift_retain();
  swift_release();
  uint64_t v44 = a3[9];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
  *(void *)(v45 + 8) = *(void *)(v46 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t *sub_100009CA8(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
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
          *uint64_t result = *a2;
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
          *uint64_t v3 = *a2;
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

uint64_t sub_100009ED8(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  long long v10 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v10;
  long long v11 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v11;
  long long v12 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v12;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  long long v13 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v13;
  uint64_t v14 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v15 = v14[24];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  uint64_t v18 = sub_1000304E0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = sub_100006E88(&qword_10003C868);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  uint64_t v22 = v14[25];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v20((const void *)(a2 + v22), 1, v18))
  {
    uint64_t v25 = sub_100006E88(&qword_10003C868);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 32))(v23, v24, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v23, 0, 1, v18);
  }
  uint64_t v26 = v14[26];
  int v27 = (void *)(a1 + v26);
  int v28 = (const void *)(a2 + v26);
  uint64_t v29 = sub_100030510();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = sub_100006E88(&qword_10003C7F0);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v30 + 32))(v27, v28, v29);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  *(unsigned char *)(a1 + v14[27]) = *(unsigned char *)(a2 + v14[27]);
  uint64_t v32 = a3[5];
  uint64_t v33 = a3[6];
  uint64_t v34 = a1 + v32;
  uint64_t v35 = a2 + v32;
  *(void *)uint64_t v34 = *(void *)v35;
  *(unsigned char *)(v34 + 8) = *(unsigned char *)(v35 + 8);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  uint64_t v36 = a3[7];
  uint64_t v37 = a3[8];
  uint64_t v38 = a1 + v36;
  uint64_t v39 = a2 + v36;
  long long v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(void *)(v38 + 32) = *(void *)(v39 + 32);
  *(_OWORD *)(a1 + v37) = *(_OWORD *)(a2 + v37);
  uint64_t v41 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(void *)(a1 + v41) = *(void *)(a2 + v41);
  return a1;
}

uint64_t sub_10000A250(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v18;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v19 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v22 = v21[24];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = sub_1000304E0();
  uint64_t v26 = *(void *)(v25 - 8);
  int v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
LABEL_6:
    uint64_t v30 = sub_100006E88(&qword_10003C868);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_7:
  uint64_t v31 = v21[25];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  int v34 = v27((void *)(a1 + v31), 1, v25);
  int v35 = v27(v33, 1, v25);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v32, v33, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v32, 0, 1, v25);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v32, v25);
LABEL_12:
    uint64_t v36 = sub_100006E88(&qword_10003C868);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v32, v33, v25);
LABEL_13:
  uint64_t v37 = v21[26];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = sub_100030510();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v41 + 40))(v38, v39, v40);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v38, v40);
    goto LABEL_18;
  }
  if (v44)
  {
LABEL_18:
    uint64_t v45 = sub_100006E88(&qword_10003C7F0);
    memcpy(v38, v39, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v41 + 32))(v38, v39, v40);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
LABEL_19:
  *(unsigned char *)(a1 + v21[27]) = *(unsigned char *)(a2 + v21[27]);
  uint64_t v46 = a3[5];
  uint64_t v47 = a3[6];
  uint64_t v48 = a1 + v46;
  uint64_t v49 = a2 + v46;
  *(void *)uint64_t v48 = *(void *)v49;
  *(unsigned char *)(v48 + 8) = *(unsigned char *)(v49 + 8);
  uint64_t v50 = a1 + v47;
  uint64_t v51 = *(void *)(a2 + v47 + 8);
  uint64_t v52 = *(void **)(a1 + v47);
  *(void *)(a1 + v47) = *(void *)(a2 + v47);

  *(void *)(v50 + 8) = v51;
  uint64_t v53 = a3[7];
  uint64_t v54 = a1 + v53;
  uint64_t v55 = a2 + v53;
  sub_100008804(a1 + v53);
  long long v56 = *(_OWORD *)(v55 + 16);
  *(_OWORD *)uint64_t v54 = *(_OWORD *)v55;
  *(_OWORD *)(v54 + 16) = v56;
  *(void *)(v54 + 32) = *(void *)(v55 + 32);
  uint64_t v57 = a3[8];
  uint64_t v58 = a1 + v57;
  uint64_t v59 = a2 + v57;
  *(unsigned char *)uint64_t v58 = *(unsigned char *)v59;
  *(void *)(v58 + 8) = *(void *)(v59 + 8);
  swift_release();
  uint64_t v60 = a3[9];
  uint64_t v61 = a1 + v60;
  uint64_t v62 = a2 + v60;
  *(unsigned char *)uint64_t v61 = *(unsigned char *)v62;
  *(void *)(v61 + 8) = *(void *)(v62 + 8);
  swift_release();
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t sub_10000A810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A824);
}

uint64_t sub_10000A824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InviteMessageDetails();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 24);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10000A8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A8FC);
}

uint64_t sub_10000A8FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for InviteMessageDetails();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 24) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for InviteMessageView(uint64_t a1)
{
  return sub_100017D20(a1, qword_10003C8E0);
}

uint64_t sub_10000A9DC()
{
  uint64_t result = type metadata accessor for InviteMessageDetails();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10000AA98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AAB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  int v32 = a7;
  uint64_t v15 = sub_1000305A0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F2F4(a1, a8, (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
  uint64_t v19 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v20 = a8 + v19[5];
  *(void *)uint64_t v20 = a2;
  *(unsigned char *)(v20 + 8) = a3 & 1;
  uint64_t v21 = (void *)(a8 + v19[6]);
  *uint64_t v21 = a4;
  v21[1] = a5;
  uint64_t v22 = (uint64_t *)(a8 + v19[7]);
  uint64_t v23 = type metadata accessor for FamilyFetcher();
  uint64_t v24 = swift_allocObject();
  v22[3] = v23;
  v22[4] = (uint64_t)&off_100039A60;
  uint64_t *v22 = v24;
  uint64_t v25 = a8 + v19[8];
  char v33 = a6;
  sub_100030B40();
  uint64_t v26 = v35;
  *(unsigned char *)uint64_t v25 = v34;
  *(void *)(v25 + 8) = v26;
  uint64_t v27 = a8 + v19[9];
  char v33 = v32;
  sub_100030B40();
  uint64_t v28 = v35;
  *(unsigned char *)uint64_t v27 = v34;
  *(void *)(v27 + 8) = v28;
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v15);
  LOBYTE(v27) = sub_100030590();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  double v30 = 0.0;
  if (v27) {
    double v30 = 3.0;
  }
  *(double *)(a8 + v19[10]) = v30;
  return result;
}

uint64_t sub_10000ACD4(char a1, char a2)
{
  if (*(void *)&aAccepteddeclin[8 * a1] == *(void *)&aAccepteddeclin[8 * a2]
    && qword_100032508[a1] == qword_100032508[a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100030ED0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000AD5C(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000ADA0(uint64_t a1, int a2)
{
  **(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_10000ADC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v69 = type metadata accessor for InviteMessageView(0);
  __chkstk_darwin(v69);
  char v3 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006E88(&qword_10003C930);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E88(&qword_10003C938);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_100006E88(&qword_10003C940);
  __chkstk_darwin(v64);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100006E88(&qword_10003C948);
  __chkstk_darwin(v65);
  uint64_t v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006E88(&qword_10003C950);
  __chkstk_darwin(v14 - 8);
  uint64_t v68 = (uint64_t)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100006E88(&qword_10003C958);
  __chkstk_darwin(v67);
  uint64_t v66 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = sub_1000307B0();
  *((void *)v6 + 1) = 0x4028000000000000;
  v6[16] = 0;
  uint64_t v17 = sub_100006E88(&qword_10003C960);
  uint64_t v18 = v1;
  sub_10000B450(v1, &v6[*(int *)(v17 + 44)]);
  unsigned __int8 v19 = sub_1000308D0();
  unsigned __int8 v20 = sub_1000308F0();
  char v21 = sub_1000308E0();
  sub_1000308E0();
  if (sub_1000308E0() != v19) {
    char v21 = sub_1000308E0();
  }
  sub_1000308E0();
  if (sub_1000308E0() != v20) {
    char v21 = sub_1000308E0();
  }
  sub_100030640();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_100007AE0((uint64_t)v6, (uint64_t)v9, &qword_10003C930);
  double v30 = &v9[*(int *)(v7 + 36)];
  char *v30 = v21;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_100008414((uint64_t)v6, &qword_10003C930);
  char v31 = sub_1000308C0();
  switch(*(unsigned char *)(v18 + 232))
  {
    case 2:
      swift_bridgeObjectRelease();
      sub_100017D58(v18, (uint64_t)v3, type metadata accessor for InviteMessageView);
      break;
    default:
      sub_100030ED0();
      swift_bridgeObjectRelease();
      sub_100017D58(v18, (uint64_t)v3, type metadata accessor for InviteMessageView);
      break;
  }
  sub_100017DC0((uint64_t)v3, type metadata accessor for InviteMessageView);
  sub_100030640();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_100007AE0((uint64_t)v9, (uint64_t)v11, &qword_10003C938);
  uint64_t v40 = &v11[*(int *)(v64 + 36)];
  char *v40 = v31;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_100008414((uint64_t)v9, &qword_10003C938);
  char v41 = sub_1000308B0();
  sub_100030640();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  sub_100007AE0((uint64_t)v11, (uint64_t)v13, &qword_10003C940);
  uint64_t v50 = &v13[*(int *)(v65 + 36)];
  *uint64_t v50 = v41;
  *((void *)v50 + 1) = v43;
  *((void *)v50 + 2) = v45;
  *((void *)v50 + 3) = v47;
  *((void *)v50 + 4) = v49;
  v50[40] = 0;
  sub_100008414((uint64_t)v11, &qword_10003C940);
  uint64_t v51 = v18 + *(int *)(v69 + 20);
  double v52 = *(double *)v51;
  char v53 = *(unsigned char *)(v51 + 8);
  uint64_t v54 = sub_100030B90();
  uint64_t v55 = v68;
  sub_10000DA00(0.0, 1, 0.0, 1, v52, v53, 0.0, 1, v68, 0.0, 1, 0.0, 1, v54, v56, (uint64_t)&qword_10003C948, (void (*)(uint64_t, uint64_t, uint64_t))sub_100007AE0, &qword_10003C950);
  sub_100008414((uint64_t)v13, &qword_10003C948);
  id v57 = [self systemGray5Color];
  uint64_t v58 = sub_100030A80();
  char v59 = sub_1000308A0();
  uint64_t v60 = v66;
  sub_100007AE0(v55, v66, &qword_10003C950);
  uint64_t v61 = v60 + *(int *)(v67 + 36);
  *(void *)uint64_t v61 = v58;
  *(unsigned char *)(v61 + 8) = v59;
  sub_100008414(v55, &qword_10003C950);
  return sub_100020E50(v60, v70, &qword_10003C958);
}

uint64_t sub_10000B450@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v212 = a2;
  uint64_t v184 = sub_100006E88(&qword_10003C968);
  uint64_t v3 = __chkstk_darwin(v184);
  uint64_t v177 = (uint64_t)&v175 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v178 = (uint64_t)&v175 - v5;
  uint64_t v187 = sub_100006E88(&qword_10003C970);
  __chkstk_darwin(v187);
  v189 = (_OWORD *)((char *)&v175 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v182 = sub_100006E88(&qword_10003C978);
  __chkstk_darwin(v182);
  v183 = (_OWORD *)((char *)&v175 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v188 = sub_100006E88(&qword_10003C980);
  __chkstk_darwin(v188);
  v185 = (char *)&v175 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v201 = sub_100006E88(&qword_10003C988);
  uint64_t v9 = __chkstk_darwin(v201);
  v186 = (char *)&v175 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v195 = (char *)&v175 - v11;
  uint64_t v199 = sub_100006E88(&qword_10003C990);
  __chkstk_darwin(v199);
  uint64_t v200 = (uint64_t)&v175 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v194 = type metadata accessor for InviteActionsView(0);
  __chkstk_darwin(v194);
  uint64_t v181 = (uint64_t)&v175 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = sub_100006E88(&qword_10003C998);
  __chkstk_darwin(v191);
  v193 = (_OWORD *)((char *)&v175 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&long long v209 = type metadata accessor for InviteMessageView(0);
  uint64_t v15 = __chkstk_darwin(v209);
  uint64_t v175 = (uint64_t)&v175 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v176 = (uint64_t)&v175 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v179 = (char *)&v175 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v190 = (uint64_t)&v175 - v22;
  __chkstk_darwin(v21);
  uint64_t v180 = (uint64_t)&v175 - v23;
  uint64_t v196 = sub_100006E88(&qword_10003C9A0);
  __chkstk_darwin(v196);
  v192 = (char *)&v175 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v213 = sub_100006E88(&qword_10003C9A8);
  uint64_t v210 = *(void *)(v213 - 8);
  uint64_t v25 = __chkstk_darwin(v213);
  v198 = (char *)&v175 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v197 = (uint64_t)&v175 - v27;
  uint64_t v28 = sub_100006E88(&qword_10003C9B0);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v221 = (uint64_t)&v175 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v215 = (uint64_t)&v175 - v31;
  uint64_t v211 = sub_100030880();
  *(void *)&long long v207 = *(void *)(v211 - 8);
  __chkstk_darwin(v211);
  *(void *)&long long v206 = (char *)&v175 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v214 = sub_100006E88(&qword_10003C9B8);
  uint64_t v208 = *(void *)(v214 - 8);
  uint64_t v33 = __chkstk_darwin(v214);
  v220 = (char *)&v175 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  *(void *)&long long v205 = (char *)&v175 - v36;
  __chkstk_darwin(v35);
  v224 = (char *)&v175 - v37;
  uint64_t v38 = sub_100006E88(&qword_10003C9C0);
  __chkstk_darwin(v38 - 8);
  v203 = (char *)&v175 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = sub_100006E88(&qword_10003C9C8) - 8;
  uint64_t v40 = __chkstk_darwin(v204);
  uint64_t v223 = (uint64_t)&v175 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v222 = (uint64_t)&v175 - v42;
  uint64_t v43 = sub_1000305A0();
  uint64_t v44 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v46 = (char *)&v175 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for SettingsView(0);
  __chkstk_darwin(v47);
  uint64_t v49 = (char *)&v175 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_100006E88(&qword_10003C9D0);
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = __chkstk_darwin(v50);
  uint64_t v54 = (char *)&v175 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v52);
  uint64_t v56 = (char *)&v175 - v55;
  uint64_t v202 = a1;
  sub_100017D58(a1, (uint64_t)v49, type metadata accessor for InviteMessageView);
  sub_100017D58(a1, (uint64_t)&v49[*(int *)(v47 + 20)], (uint64_t (*)(void))type metadata accessor for InviteMessageDetails);
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v46, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v43);
  sub_100030590();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
  sub_100017FB4(&qword_10003C9D8, (void (*)(uint64_t))type metadata accessor for SettingsView);
  sub_100030A00();
  sub_100017DC0((uint64_t)v49, type metadata accessor for SettingsView);
  uint64_t v218 = v51;
  id v57 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
  v216 = v56;
  uint64_t v58 = v56;
  uint64_t v59 = v209;
  v217 = v54;
  uint64_t v219 = v50;
  v57(v58, v54, v50);
  sub_100017E20();
  uint64_t v60 = (uint64_t)v203;
  sub_100030A60();
  LOBYTE(v46) = sub_1000308B0();
  uint64_t v61 = v202;
  sub_100030640();
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v70 = v223;
  sub_100007AE0(v60, v223, &qword_10003C9C0);
  uint64_t v71 = v70 + *(int *)(v204 + 44);
  *(unsigned char *)uint64_t v71 = (_BYTE)v46;
  *(void *)(v71 + 8) = v63;
  *(void *)(v71 + 16) = v65;
  *(void *)(v71 + 24) = v67;
  *(void *)(v71 + 32) = v69;
  *(unsigned char *)(v71 + 40) = 0;
  sub_100008414(v60, &qword_10003C9C0);
  sub_100020E50(v70, v222, &qword_10003C9C8);
  uint64_t v72 = sub_1000307B0();
  sub_10000D488((void *)v61, (uint64_t)&v225);
  char v73 = v226[0];
  uint64_t v74 = *(void *)&v226[8];
  char v75 = v227[0];
  uint64_t v76 = *(void *)&v227[8];
  char v77 = v227[16];
  char v78 = v227[17];
  long long v79 = v225;
  long long v80 = *(_OWORD *)&v226[16];
  long long v225 = (unint64_t)v72;
  v226[0] = 0;
  *(_OWORD *)&v226[8] = v79;
  v226[24] = v73;
  *(void *)v227 = v74;
  *(_OWORD *)&v227[8] = v80;
  v227[24] = v75;
  *(void *)&long long v228 = v76;
  BYTE8(v228) = v77;
  BYTE9(v228) = v78;
  uint64_t v81 = v206;
  sub_100030870();
  sub_100006E88(&qword_10003C9E8);
  sub_10002169C(&qword_10003C9F0, &qword_10003C9E8);
  uint64_t v82 = v205;
  sub_100030A70();
  (*(void (**)(uint64_t, uint64_t))(v207 + 8))(v81, v211);
  uint64_t v83 = *(void *)&v227[8];
  uint64_t v84 = *(void *)&v227[16];
  LOBYTE(v81) = v227[24];
  sub_100017E74(*(uint64_t *)&v226[8], *(uint64_t *)&v226[16], v226[24]);
  swift_bridgeObjectRelease();
  char v85 = v81;
  uint64_t v86 = v61;
  sub_100017E74(v83, v84, v85);
  swift_bridgeObjectRelease();
  uint64_t v87 = v208;
  (*(void (**)(char *, uint64_t, uint64_t))(v208 + 32))(v224, v82, v214);
  uint64_t v88 = *(void *)(v61 + 224);
  char v89 = *(unsigned char *)(v61 + *(int *)(type metadata accessor for InviteMessageDetails() + 108));
  uint64_t v211 = v88;
  if ((v89 & 1) == 0)
  {
    uint64_t v91 = v213;
    uint64_t v92 = v210;
    if (*(unsigned char *)(v61 + 233) == 1)
    {
      uint64_t v93 = (uint64_t)v198;
      uint64_t v94 = (uint64_t)v192;
      switch(*(unsigned char *)(v86 + 232))
      {
        case 4:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_14;
        default:
          char v119 = sub_100030ED0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (v119)
          {
LABEL_14:
            uint64_t v131 = v181;
            sub_100017D58(v86, v181, type metadata accessor for InviteMessageView);
            sub_100017D58(v131, (uint64_t)v193, type metadata accessor for InviteActionsView);
            swift_storeEnumTagMultiPayload();
            sub_100006E88(&qword_10003CA18);
            sub_100017F30();
            sub_100017FB4(&qword_10003CA28, (void (*)(uint64_t))type metadata accessor for InviteActionsView);
            sub_100030800();
            sub_100017DC0(v131, type metadata accessor for InviteActionsView);
          }
          else
          {
            uint64_t v120 = v180;
            sub_100017D58(v86, v180, type metadata accessor for InviteMessageView);
            sub_100018E7C(v120, (uint64_t)&v225);
            long long v209 = v225;
            long long v207 = *(_OWORD *)v226;
            long long v206 = *(_OWORD *)&v226[16];
            long long v205 = *(_OWORD *)v227;
            uint64_t v121 = *(void *)&v227[16];
            unsigned __int8 v122 = v227[24];
            uint64_t v123 = v228;
            LOBYTE(v120) = sub_1000308B0();
            sub_100030640();
            unsigned __int8 v232 = v122;
            char v231 = 0;
            uint64_t v124 = v193;
            long long v125 = v207;
            _OWORD *v193 = v209;
            v124[1] = v125;
            long long v126 = v205;
            v124[2] = v206;
            v124[3] = v126;
            *((void *)v124 + 8) = v121;
            *((unsigned char *)v124 + 72) = v122;
            *((void *)v124 + 10) = v123;
            *((unsigned char *)v124 + 88) = v120;
            *((void *)v124 + 12) = v127;
            *((void *)v124 + 13) = v128;
            *((void *)v124 + 14) = v129;
            *((void *)v124 + 15) = v130;
            *((unsigned char *)v124 + 128) = 0;
            swift_storeEnumTagMultiPayload();
            sub_100006E88(&qword_10003CA18);
            sub_100017F30();
            sub_100017FB4(&qword_10003CA28, (void (*)(uint64_t))type metadata accessor for InviteActionsView);
            sub_100030800();
          }
          sub_100007AE0(v94, v200, &qword_10003C9A0);
          swift_storeEnumTagMultiPayload();
          sub_100017E84();
          sub_100017FFC();
          sub_100030800();
          sub_100008414(v94, &qword_10003C9A0);
          break;
      }
      goto LABEL_22;
    }
    uint64_t v95 = v61 + *(int *)(v59 + 32);
    char v96 = *(unsigned char *)v95;
    uint64_t v97 = *(void *)(v95 + 8);
    LOBYTE(v225) = v96;
    *((void *)&v225 + 1) = v97;
    swift_bridgeObjectRetain();
    sub_100006E88(&qword_10003C9F8);
    sub_100030B50();
    int v98 = v232;
    uint64_t v99 = v190;
    sub_100017D58(v61, v190, type metadata accessor for InviteMessageView);
    uint64_t v93 = (uint64_t)v198;
    if (v98 == 1)
    {
      sub_100017DC0(v99, type metadata accessor for InviteMessageView);
      uint64_t v100 = (uint64_t)v195;
    }
    else
    {
      uint64_t v101 = v99 + *(int *)(v59 + 36);
      char v102 = *(unsigned char *)v101;
      uint64_t v103 = *(void *)(v101 + 8);
      LOBYTE(v225) = v102;
      *((void *)&v225 + 1) = v103;
      sub_100030B50();
      int v104 = v232;
      sub_100017DC0(v99, type metadata accessor for InviteMessageView);
      uint64_t v100 = (uint64_t)v195;
      if (v104 != 1)
      {
        uint64_t v118 = (uint64_t)v179;
        switch(*(unsigned char *)(v86 + 232))
        {
          case 2:
            swift_bridgeObjectRelease();
            sub_100017D58(v86, v118, type metadata accessor for InviteMessageView);
            goto LABEL_18;
          default:
            char v132 = sub_100030ED0();
            swift_bridgeObjectRelease();
            sub_100017D58(v86, v118, type metadata accessor for InviteMessageView);
            if (v132)
            {
LABEL_18:
              sub_100017DC0(v118, type metadata accessor for InviteMessageView);
LABEL_19:
              uint64_t v133 = v181;
              sub_100017D58(v86, v181, type metadata accessor for InviteMessageView);
              uint64_t v134 = sub_100030B90();
              uint64_t v135 = v177;
              sub_10000DA00(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v177, 0.0, 1, 0.0, 1, v134, v136, (uint64_t)type metadata accessor for InviteActionsView, (void (*)(uint64_t, uint64_t, uint64_t))sub_100017D58, &qword_10003C968);
              sub_100017DC0(v133, type metadata accessor for InviteActionsView);
              uint64_t v137 = v178;
              sub_100020E50(v135, v178, &qword_10003C968);
              sub_100007AE0(v137, (uint64_t)v183, &qword_10003C968);
              swift_storeEnumTagMultiPayload();
              sub_100006E88(&qword_10003CA50);
              sub_10001816C();
              sub_10001826C();
              uint64_t v138 = (uint64_t)v185;
              sub_100030800();
              sub_100007AE0(v138, (uint64_t)v189, &qword_10003C980);
              swift_storeEnumTagMultiPayload();
              sub_100006E88(&qword_10003CA18);
              sub_1000180A8();
              sub_100017F30();
              uint64_t v115 = (uint64_t)v186;
              sub_100030800();
              sub_100008414(v138, &qword_10003C980);
              uint64_t v116 = v137;
              uint64_t v100 = (uint64_t)v195;
              v117 = &qword_10003C968;
              goto LABEL_20;
            }
            switch(*(unsigned char *)(v118 + 232))
            {
              case 4:
                swift_bridgeObjectRelease();
                goto LABEL_18;
              default:
                char v156 = sub_100030ED0();
                swift_bridgeObjectRelease();
                sub_100017DC0(v118, type metadata accessor for InviteMessageView);
                if (v156) {
                  goto LABEL_19;
                }
                switch(*(unsigned char *)(v86 + 232))
                {
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                    char v158 = sub_100030ED0();
                    swift_bridgeObjectRelease();
                    uint64_t v157 = v176;
                    sub_100017D58(v86, v176, type metadata accessor for InviteMessageView);
                    if (v158) {
                      goto LABEL_30;
                    }
                    switch(*(unsigned char *)(v157 + 232))
                    {
                      case 1:
                        swift_bridgeObjectRelease();
                        uint64_t v157 = v176;
                        goto LABEL_30;
                      default:
                        char v172 = sub_100030ED0();
                        swift_bridgeObjectRelease();
                        sub_100017DC0(v176, type metadata accessor for InviteMessageView);
                        uint64_t v159 = v175;
                        sub_100017D58(v86, v175, type metadata accessor for InviteMessageView);
                        if (v172) {
                          goto LABEL_31;
                        }
                        switch(*(unsigned char *)(v159 + 232))
                        {
                          case 3:
                            swift_bridgeObjectRelease();
                            uint64_t v159 = v175;
                            goto LABEL_31;
                          default:
                            char v173 = sub_100030ED0();
                            swift_bridgeObjectRelease();
                            sub_100017DC0(v175, type metadata accessor for InviteMessageView);
                            if (v173) {
                              goto LABEL_32;
                            }
                            uint64_t v174 = sub_100006E88(&qword_10003CA00);
                            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v174 - 8) + 56))(v100, 1, 1, v174);
                            break;
                        }
                        break;
                    }
                    break;
                  default:
                    swift_bridgeObjectRelease();
                    uint64_t v157 = v176;
                    sub_100017D58(v86, v176, type metadata accessor for InviteMessageView);
LABEL_30:
                    sub_100017DC0(v157, type metadata accessor for InviteMessageView);
                    uint64_t v159 = v175;
                    sub_100017D58(v86, v175, type metadata accessor for InviteMessageView);
LABEL_31:
                    sub_100017DC0(v159, type metadata accessor for InviteMessageView);
LABEL_32:
                    uint64_t v160 = v180;
                    sub_100017D58(v86, v180, type metadata accessor for InviteMessageView);
                    sub_100018E7C(v160, (uint64_t)&v225);
                    long long v209 = v225;
                    long long v207 = *(_OWORD *)v226;
                    long long v206 = *(_OWORD *)&v226[16];
                    long long v205 = *(_OWORD *)v227;
                    uint64_t v161 = *(void *)&v227[16];
                    unsigned __int8 v162 = v227[24];
                    uint64_t v163 = v228;
                    LOBYTE(v160) = sub_1000308B0();
                    sub_100030640();
                    unsigned __int8 v232 = v162;
                    char v231 = 0;
                    v164 = v189;
                    long long v165 = v207;
                    _OWORD *v189 = v209;
                    v164[1] = v165;
                    long long v166 = v205;
                    v164[2] = v206;
                    v164[3] = v166;
                    *((void *)v164 + 8) = v161;
                    *((unsigned char *)v164 + 72) = v162;
                    *((void *)v164 + 10) = v163;
                    *((unsigned char *)v164 + 88) = v160;
                    *((void *)v164 + 12) = v167;
                    *((void *)v164 + 13) = v168;
                    *((void *)v164 + 14) = v169;
                    *((void *)v164 + 15) = v170;
                    *((unsigned char *)v164 + 128) = 0;
                    swift_storeEnumTagMultiPayload();
                    sub_100006E88(&qword_10003CA18);
                    sub_1000180A8();
                    sub_100017F30();
                    sub_100030800();
                    uint64_t v171 = sub_100006E88(&qword_10003CA00);
                    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v171 - 8) + 56))(v100, 0, 1, v171);
                    break;
                }
                break;
            }
            break;
        }
        goto LABEL_21;
      }
    }
    uint64_t v106 = *(void *)(v86 + 48);
    uint64_t v105 = *(void *)(v86 + 56);
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_100030B90();
    sub_10000D840(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v225, 0.0, 1, 0.0, 1, v107, v108, v106, v105);
    swift_bridgeObjectRelease();
    long long v109 = v228;
    v110 = v183;
    v183[4] = *(_OWORD *)&v227[16];
    v110[5] = v109;
    long long v111 = v230;
    v110[6] = v229;
    v110[7] = v111;
    long long v112 = *(_OWORD *)v226;
    _OWORD *v110 = v225;
    v110[1] = v112;
    long long v113 = *(_OWORD *)v227;
    v110[2] = *(_OWORD *)&v226[16];
    v110[3] = v113;
    swift_storeEnumTagMultiPayload();
    sub_100006E88(&qword_10003CA50);
    sub_10001816C();
    sub_10001826C();
    uint64_t v114 = (uint64_t)v185;
    sub_100030800();
    sub_100007AE0(v114, (uint64_t)v189, &qword_10003C980);
    swift_storeEnumTagMultiPayload();
    sub_100006E88(&qword_10003CA18);
    sub_1000180A8();
    sub_100017F30();
    uint64_t v115 = (uint64_t)v186;
    sub_100030800();
    uint64_t v116 = v114;
    v117 = &qword_10003C980;
LABEL_20:
    sub_100008414(v116, v117);
    uint64_t v139 = sub_100006E88(&qword_10003CA00);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v139 - 8) + 56))(v115, 0, 1, v139);
    sub_100020E50(v115, v100, &qword_10003C988);
LABEL_21:
    sub_100007AE0(v100, v200, &qword_10003C988);
    swift_storeEnumTagMultiPayload();
    sub_100017E84();
    sub_100017FFC();
    sub_100030800();
    sub_100008414(v100, &qword_10003C988);
    uint64_t v91 = v213;
LABEL_22:
    uint64_t v140 = sub_100006E88(&qword_10003CA68);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v140 - 8) + 56))(v93, 0, 1, v140);
    uint64_t v141 = v197;
    sub_100020E50(v93, v197, &qword_10003C9A8);
    uint64_t v90 = v215;
    sub_100020E50(v141, v215, &qword_10003C9A8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v92 + 56))(v90, 0, 1, v91);
    goto LABEL_23;
  }
  uint64_t v90 = v215;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56))(v215, 1, 1, v213);
  swift_bridgeObjectRetain();
LABEL_23:
  v142 = *(void (**)(char *, char *, uint64_t))(v218 + 16);
  v143 = v217;
  uint64_t v144 = v219;
  v142(v217, v216, v219);
  uint64_t v145 = v223;
  sub_100007AE0(v222, v223, &qword_10003C9C8);
  v146 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  uint64_t v147 = v214;
  v146(v220, v224, v214);
  sub_100007AE0(v90, v221, &qword_10003C9B0);
  v148 = v212;
  v142(v212, v143, v144);
  v149 = (int *)sub_100006E88(&qword_10003CA70);
  sub_100007AE0(v145, (uint64_t)&v148[v149[12]], &qword_10003C9C8);
  v150 = v220;
  v146(&v148[v149[16]], v220, v147);
  *(void *)&v148[v149[20]] = v211;
  uint64_t v151 = v221;
  sub_100007AE0(v221, (uint64_t)&v148[v149[24]], &qword_10003C9B0);
  swift_bridgeObjectRetain();
  sub_100008414(v215, &qword_10003C9B0);
  v152 = *(void (**)(char *, uint64_t))(v87 + 8);
  v152(v224, v147);
  sub_100008414(v222, &qword_10003C9C8);
  v153 = *(void (**)(char *, uint64_t))(v218 + 8);
  uint64_t v154 = v219;
  v153(v216, v219);
  sub_100008414(v151, &qword_10003C9B0);
  swift_bridgeObjectRelease();
  v152(v150, v147);
  sub_100008414(v223, &qword_10003C9C8);
  return ((uint64_t (*)(char *, uint64_t))v153)(v217, v154);
}

uint64_t sub_10000D488@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100030950();
  uint64_t v60 = *(void *)(v4 - 8);
  uint64_t v61 = v4;
  __chkstk_darwin(v4);
  uint64_t v59 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = a1;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v62 = v6;
  uint64_t v63 = v7;
  unint64_t v53 = sub_1000190D0();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1000309F0();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_100030900();
  uint64_t v13 = sub_1000309C0();
  uint64_t v15 = v14;
  char v17 = v16;
  swift_release();
  sub_100017E74(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_100030920();
  uint64_t v18 = sub_1000309A0();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_100017E74(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  sub_100030AD0();
  uint64_t v23 = sub_1000309B0();
  uint64_t v56 = v24;
  uint64_t v57 = v23;
  char v26 = v25;
  uint64_t v58 = v27;
  swift_release();
  int v55 = v26 & 1;
  sub_100017E74(v18, v20, v22);
  swift_bridgeObjectRelease();
  uint64_t v28 = v54[3];
  uint64_t v62 = v54[2];
  uint64_t v63 = v28;
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_1000309F0();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_100030AD0();
  uint64_t v34 = sub_1000309B0();
  uint64_t v36 = v35;
  char v38 = v37;
  swift_release();
  LOBYTE(v18) = v38 & 1;
  sub_100017E74(v29, v31, v33);
  swift_bridgeObjectRelease();
  sub_100030990();
  uint64_t v40 = v59;
  uint64_t v39 = v60;
  uint64_t v41 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, enum case for Font.Leading.tight(_:), v61);
  sub_100030970();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v41);
  uint64_t v42 = sub_1000309C0();
  uint64_t v44 = v43;
  LOBYTE(v39) = v45;
  uint64_t v47 = v46;
  swift_release();
  LOBYTE(v29) = v39 & 1;
  sub_100017E74(v34, v36, v18);
  swift_bridgeObjectRelease();
  char v48 = v55;
  LOBYTE(v62) = v55;
  uint64_t v50 = v56;
  uint64_t v49 = v57;
  *(void *)a2 = v57;
  *(void *)(a2 + 8) = v50;
  *(unsigned char *)(a2 + 16) = v48;
  *(void *)(a2 + 24) = v58;
  *(void *)(a2 + 32) = v42;
  *(void *)(a2 + 40) = v44;
  *(unsigned char *)(a2 + 48) = v29;
  *(void *)(a2 + 56) = v47;
  *(_WORD *)(a2 + 64) = 256;
  uint64_t v51 = v49;
  sub_100019124(v49, v50, v48);
  swift_bridgeObjectRetain();
  sub_100019124(v42, v44, v29);
  swift_bridgeObjectRetain();
  sub_100017E74(v42, v44, v29);
  swift_bridgeObjectRelease();
  sub_100017E74(v51, v50, v62);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D840@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v18 = a16;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100030D50();
    uint64_t v27 = (void *)sub_100030890();
    sub_100030610();

    uint64_t v18 = a16;
  }
  sub_1000306B0();
  *(void *)a9 = v18;
  *(void *)(a9 + 8) = a17;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  *(_OWORD *)(a9 + 48) = v31;
  *(_OWORD *)(a9 + 64) = v32;

  return swift_bridgeObjectRetain();
}

__n128 sub_10000DA00@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), uint64_t *a18)
{
  uint64_t v20 = a17;
  char v21 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v24 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v24) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100030D50();
    long long v31 = (void *)sub_100030890();
    sub_100030610();

    char v21 = a18;
    uint64_t v20 = a17;
  }
  sub_1000306B0();
  v20(v18, a9, a16);
  long long v32 = (_OWORD *)(a9 + *(int *)(sub_100006E88(v21) + 36));
  v32[4] = v38;
  v32[5] = v39;
  v32[6] = v40;
  _OWORD *v32 = v34;
  v32[1] = v35;
  __n128 result = v37;
  v32[2] = v36;
  v32[3] = v37;
  return result;
}

uint64_t sub_10000DBE4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100030D50();
    long long v31 = (void *)sub_100030890();
    sub_100030610();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_1000306B0();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_100019124(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DDE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v159 = a2;
  uint64_t v160 = sub_100006E88(&qword_10003CC70);
  __chkstk_darwin(v160);
  uint64_t v149 = (uint64_t)&v124 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_100006E88(&qword_10003CC78);
  uint64_t v8 = __chkstk_darwin(v150);
  uint64_t v147 = (uint64_t)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v146 = (uint64_t)&v124 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v145 = (uint64_t)&v124 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v148 = (uint64_t)&v124 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v140 = (uint64_t)&v124 - v17;
  __chkstk_darwin(v16);
  uint64_t v151 = (uint64_t)&v124 - v18;
  uint64_t v157 = sub_100006E88(&qword_10003CC80);
  __chkstk_darwin(v157);
  uint64_t v158 = (uint64_t)&v124 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v163 = sub_1000306A0();
  __chkstk_darwin(v163);
  char v156 = (char *)&v124 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_100006E88(&qword_10003CC88);
  uint64_t v154 = *(void *)(v155 - 8);
  uint64_t v21 = __chkstk_darwin(v155);
  v142 = (char *)&v124 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v136 = (char *)&v124 - v24;
  __chkstk_darwin(v23);
  char v26 = (char *)&v124 - v25;
  uint64_t v161 = sub_100006E88(&qword_10003CC90);
  uint64_t v27 = __chkstk_darwin(v161);
  v143 = (char *)&v124 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v137 = (char *)&v124 - v30;
  __chkstk_darwin(v29);
  long long v32 = (char *)&v124 - v31;
  uint64_t v162 = sub_100006E88(&qword_10003CC98);
  uint64_t v33 = __chkstk_darwin(v162);
  uint64_t v144 = (uint64_t)&v124 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v139 = (uint64_t)&v124 - v36;
  __chkstk_darwin(v35);
  long long v38 = (char *)&v124 - v37;
  uint64_t v164 = sub_100006E88(&qword_10003CCA0);
  uint64_t v39 = __chkstk_darwin(v164);
  uint64_t v141 = (char *)&v124 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v138 = (char *)&v124 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v152 = (char *)&v124 - v44;
  __chkstk_darwin(v43);
  v153 = (uint64_t (*)(uint64_t))((char *)&v124 - v45);
  uint64_t v46 = type metadata accessor for InviteActionsView(0);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(void *)(v47 + 64);
  uint64_t v49 = __chkstk_darwin(v46 - 8);
  uint64_t v50 = (char *)&v124 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v49);
  uint64_t v52 = (char *)&v124 - v51;
  char v53 = *(unsigned char *)(a1 + 234);
  sub_100017D58(a1, (uint64_t)&v124 - v51, type metadata accessor for InviteActionsView);
  if (v53)
  {
LABEL_2:
    sub_100017DC0((uint64_t)v52, type metadata accessor for InviteActionsView);
LABEL_5:
    sub_100017D58(a1, (uint64_t)v50, type metadata accessor for InviteActionsView);
    unint64_t v55 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    uint64_t v56 = swift_allocObject();
    *(double *)(v56 + 16) = a3;
    *(double *)(v56 + 24) = a4;
    uint64_t v57 = sub_10001F2F4((uint64_t)v50, v56 + v55, type metadata accessor for InviteActionsView);
    __chkstk_darwin(v57);
    sub_100030B70();
    sub_100030B90();
    sub_1000306B0();
    uint64_t v58 = v154;
    uint64_t v59 = v155;
    (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v32, v26, v155);
    uint64_t v60 = &v32[*(int *)(v161 + 36)];
    long long v61 = v177;
    *((_OWORD *)v60 + 4) = v176;
    *((_OWORD *)v60 + 5) = v61;
    *((_OWORD *)v60 + 6) = v178;
    long long v62 = v173;
    *(_OWORD *)uint64_t v60 = v172;
    *((_OWORD *)v60 + 1) = v62;
    long long v63 = v175;
    *((_OWORD *)v60 + 2) = v174;
    *((_OWORD *)v60 + 3) = v63;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v26, v59);
    id v64 = [self systemBlueColor];
    uint64_t v65 = sub_100030A80();
    LOBYTE(v58) = sub_1000308A0();
    sub_100007AE0((uint64_t)v32, (uint64_t)v38, &qword_10003CC90);
    uint64_t v66 = &v38[*(int *)(v162 + 36)];
    *(void *)uint64_t v66 = v65;
    v66[8] = v58;
    sub_100008414((uint64_t)v32, &qword_10003CC90);
    uint64_t v67 = v156;
    uint64_t v68 = &v156[*(int *)(v163 + 20)];
    uint64_t v69 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v70 = sub_1000307A0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v70 - 8) + 104))(v68, v69, v70);
    __asm { FMOV            V0.2D, #10.0 }
    *uint64_t v67 = _Q0;
    uint64_t v76 = (uint64_t)v152;
    uint64_t v77 = (uint64_t)&v152[*(int *)(v164 + 36)];
    sub_100017D58((uint64_t)v67, v77, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v77 + *(int *)(sub_100006E88(&qword_10003CCA8) + 36)) = 256;
    sub_100007AE0((uint64_t)v38, v76, &qword_10003CC98);
    sub_100017DC0((uint64_t)v67, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    sub_100008414((uint64_t)v38, &qword_10003CC98);
    char v78 = &qword_10003CCA0;
    long long v79 = v153;
    sub_100020E50(v76, (uint64_t)v153, &qword_10003CCA0);
    sub_100007AE0((uint64_t)v79, v158, &qword_10003CCA0);
    swift_storeEnumTagMultiPayload();
    sub_100020094();
    sub_10002169C(&qword_10003CCE0, &qword_10003CC70);
    sub_100030800();
    uint64_t v80 = (uint64_t)v79;
  }
  else
  {
    switch(v52[232])
    {
      case 4:
        swift_bridgeObjectRelease();
        goto LABEL_2;
      default:
        char v54 = sub_100030ED0();
        swift_bridgeObjectRelease();
        sub_100017DC0((uint64_t)v52, type metadata accessor for InviteActionsView);
        if (v54) {
          goto LABEL_5;
        }
        v153 = type metadata accessor for InviteActionsView;
        uint64_t v135 = a1;
        sub_100017D58(a1, (uint64_t)v50, type metadata accessor for InviteActionsView);
        uint64_t v81 = *(unsigned __int8 *)(v47 + 80);
        uint64_t v82 = (v81 + 32) & ~v81;
        uint64_t v131 = v82;
        v152 = (char *)(v82 + v48);
        uint64_t v134 = v81 | 7;
        uint64_t v83 = swift_allocObject();
        *(double *)(v83 + 16) = a3;
        *(double *)(v83 + 24) = a4;
        uint64_t v133 = type metadata accessor for InviteActionsView;
        sub_10001F2F4((uint64_t)v50, v83 + v82, type metadata accessor for InviteActionsView);
        uint64_t v84 = v136;
        sub_100030B70();
        sub_100030B90();
        sub_1000306B0();
        uint64_t v85 = v154;
        char v132 = *(void (**)(char *, char *, uint64_t))(v154 + 16);
        uint64_t v86 = (uint64_t)v137;
        uint64_t v87 = v155;
        v132(v137, v84, v155);
        uint64_t v88 = (_OWORD *)(v86 + *(int *)(v161 + 36));
        long long v89 = v170;
        v88[4] = v169;
        v88[5] = v89;
        v88[6] = v171;
        long long v90 = v166;
        *uint64_t v88 = v165;
        v88[1] = v90;
        long long v91 = v168;
        v88[2] = v167;
        v88[3] = v91;
        uint64_t v154 = *(void *)(v85 + 8);
        ((void (*)(char *, uint64_t))v154)(v84, v87);
        uint64_t v136 = (char *)self;
        id v92 = [v136 secondarySystemFillColor];
        uint64_t v93 = sub_100030A80();
        LOBYTE(v84) = sub_1000308A0();
        uint64_t v94 = v139;
        sub_100007AE0(v86, v139, &qword_10003CC90);
        uint64_t v95 = v94 + *(int *)(v162 + 36);
        *(void *)uint64_t v95 = v93;
        *(unsigned char *)(v95 + 8) = (_BYTE)v84;
        sub_100008414(v86, &qword_10003CC90);
        char v96 = v156;
        uint64_t v97 = &v156[*(int *)(v163 + 20)];
        uint64_t v98 = enum case for RoundedCornerStyle.continuous(_:);
        LODWORD(v137) = enum case for RoundedCornerStyle.continuous(_:);
        uint64_t v129 = sub_1000307A0();
        uint64_t v130 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v129 - 8) + 104);
        v130(v97, v98, v129);
        __asm { FMOV            V0.2D, #10.0 }
        long long v128 = _Q0;
        *(_OWORD *)char v96 = _Q0;
        uint64_t v100 = (uint64_t)v138;
        uint64_t v101 = (uint64_t)&v138[*(int *)(v164 + 36)];
        uint64_t v127 = &type metadata accessor for RoundedRectangle;
        sub_100017D58((uint64_t)v96, v101, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
        uint64_t v126 = sub_100006E88(&qword_10003CCA8);
        *(_WORD *)(v101 + *(int *)(v126 + 36)) = 256;
        sub_100007AE0(v94, v100, &qword_10003CC98);
        long long v125 = &type metadata accessor for RoundedRectangle;
        sub_100017DC0((uint64_t)v96, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
        sub_100008414(v94, &qword_10003CC98);
        uint64_t v102 = v140;
        sub_100007AE0(v100, v140, &qword_10003CCA0);
        *(unsigned char *)(v102 + *(int *)(v150 + 36)) = 0;
        sub_100008414(v100, &qword_10003CCA0);
        char v78 = &qword_10003CC78;
        sub_100020E50(v102, v151, &qword_10003CC78);
        sub_100017D58(v135, (uint64_t)v50, v153);
        uint64_t v103 = swift_allocObject();
        *(double *)(v103 + 16) = a3;
        *(double *)(v103 + 24) = a4;
        sub_10001F2F4((uint64_t)v50, v103 + v131, v133);
        int v104 = v142;
        sub_100030B70();
        sub_100030B90();
        sub_1000306B0();
        uint64_t v105 = (uint64_t)v143;
        v132(v143, v104, v87);
        uint64_t v106 = (_OWORD *)(v105 + *(int *)(v161 + 36));
        long long v107 = v177;
        v106[4] = v176;
        v106[5] = v107;
        v106[6] = v178;
        long long v108 = v173;
        *uint64_t v106 = v172;
        v106[1] = v108;
        long long v109 = v175;
        v106[2] = v174;
        v106[3] = v109;
        ((void (*)(char *, uint64_t))v154)(v104, v87);
        id v110 = [v136 systemBlueColor];
        uint64_t v111 = sub_100030A80();
        LOBYTE(v100) = sub_1000308A0();
        uint64_t v112 = v144;
        sub_100007AE0(v105, v144, &qword_10003CC90);
        uint64_t v113 = v112 + *(int *)(v162 + 36);
        *(void *)uint64_t v113 = v111;
        *(unsigned char *)(v113 + 8) = v100;
        sub_100008414(v105, &qword_10003CC90);
        v130(&v96[*(int *)(v163 + 20)], v137, v129);
        *(_OWORD *)char v96 = v128;
        uint64_t v114 = (uint64_t)v141;
        uint64_t v115 = (uint64_t)&v141[*(int *)(v164 + 36)];
        sub_100017D58((uint64_t)v96, v115, (uint64_t (*)(void))v127);
        *(_WORD *)(v115 + *(int *)(v126 + 36)) = 256;
        sub_100007AE0(v112, v114, &qword_10003CC98);
        sub_100017DC0((uint64_t)v96, (uint64_t (*)(void))v125);
        sub_100008414(v112, &qword_10003CC98);
        uint64_t v116 = v145;
        sub_100007AE0(v114, v145, &qword_10003CCA0);
        *(unsigned char *)(v116 + *(int *)(v150 + 36)) = 0;
        sub_100008414(v114, &qword_10003CCA0);
        uint64_t v117 = v148;
        sub_100020E50(v116, v148, &qword_10003CC78);
        uint64_t v118 = v151;
        uint64_t v119 = v146;
        sub_100007AE0(v151, v146, &qword_10003CC78);
        uint64_t v120 = v147;
        sub_100007AE0(v117, v147, &qword_10003CC78);
        uint64_t v121 = v149;
        sub_100007AE0(v119, v149, &qword_10003CC78);
        uint64_t v122 = sub_100006E88(&qword_10003CCB0);
        sub_100007AE0(v120, v121 + *(int *)(v122 + 48), &qword_10003CC78);
        sub_100008414(v120, &qword_10003CC78);
        sub_100008414(v119, &qword_10003CC78);
        sub_100007AE0(v121, v158, &qword_10003CC70);
        swift_storeEnumTagMultiPayload();
        sub_100020094();
        sub_10002169C(&qword_10003CCE0, &qword_10003CC70);
        sub_100030800();
        sub_100008414(v121, &qword_10003CC70);
        sub_100008414(v117, &qword_10003CC78);
        uint64_t v80 = v118;
        break;
    }
  }
  return sub_100008414(v80, v78);
}

void sub_10000F0EC(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for InviteActionsView(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for InviteMessageView(0);
  uint64_t v11 = a1 + *(int *)(v10 + 24);
  uint64_t v12 = *(void **)v11;
  if (*(void *)v11)
  {
    v26[0] = *(void *)(v11 + 8);
    v26[1] = v1;
    uint64_t v13 = a1 + *(int *)(v10 + 36);
    char v14 = *(unsigned char *)v13;
    uint64_t v15 = *(void *)(v13 + 8);
    char v27 = v14;
    uint64_t v28 = v15;
    char v29 = 1;
    id v16 = v12;
    sub_100006E88(&qword_10003C9F8);
    sub_100030B60();
    sub_100030600();
    uint64_t v17 = (void *)sub_1000305F0();
    sub_1000305D0();

    swift_bridgeObjectRelease();
    uint64_t v18 = sub_100030D20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
    sub_100017D58(a1, (uint64_t)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for InviteActionsView);
    sub_100030D00();
    id v19 = v16;
    uint64_t v20 = sub_100030CF0();
    unint64_t v21 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    unint64_t v22 = (v5 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v20;
    *(void *)(v23 + 24) = &protocol witness table for MainActor;
    sub_10001F2F4((uint64_t)v6, v23 + v21, type metadata accessor for InviteActionsView);
    uint64_t v24 = (void *)(v23 + v22);
    uint64_t v25 = v26[0];
    *uint64_t v24 = v19;
    v24[1] = v25;
    sub_100005F70((uint64_t)v9, (uint64_t)&unk_10003CCF0, v23);
    swift_release();
  }
}

uint64_t sub_10000F3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  sub_100006E88(&qword_10003C868);
  v6[7] = swift_task_alloc();
  sub_100030D00();
  v6[8] = sub_100030CF0();
  uint64_t v8 = sub_100030CE0();
  v6[9] = v8;
  v6[10] = v7;
  return _swift_task_switch(sub_10000F49C, v8, v7);
}

uint64_t sub_10000F49C()
{
  uint64_t v1 = v0[4];
  sub_1000304D0();
  uint64_t v2 = type metadata accessor for InviteMessageView(0);
  v0[11] = v2;
  uint64_t v3 = *sub_10001F968((void *)(v1 + *(int *)(v2 + 28)), *(void *)(v1 + *(int *)(v2 + 28) + 24));
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10003CC50
                                                                                    + dword_10003CC50);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10000F594;
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  return v9(v6, v7, v5, v3, 0xD000000000000014, 0x8000000100032F60);
}

uint64_t sub_10000F594()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  sub_100008414(v2, &qword_10003C868);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 72);
  return _swift_task_switch(sub_10000F6E0, v4, v3);
}

uint64_t sub_10000F6E0()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v3 = (char *)(v2 + *(int *)(v1 + 36));
  char v4 = *v3;
  uint64_t v5 = *((void *)v3 + 1);
  *(unsigned char *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v5;
  *(unsigned char *)(v0 + 104) = 0;
  sub_100006E88(&qword_10003C9F8);
  sub_100030B60();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000F794@<X0>(uint64_t a1@<X8>)
{
  sub_1000190D0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000309F0();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_100030900();
  uint64_t v7 = sub_1000309C0();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_100017E74(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_100030AC0();
  uint64_t v13 = sub_1000309B0();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_100017E74(v7, v9, v12);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_10000F8C4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for InviteActionsView(0);
  uint64_t v36 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v37 = v4;
  uint64_t v38 = (uint64_t)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006E88(&qword_10003C868);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000304E0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v35 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  char v16 = (char *)v32 - v15;
  uint64_t v17 = type metadata accessor for InviteMessageDetails();
  sub_100007AE0(a1 + *(int *)(v17 + 100), (uint64_t)v10, &qword_10003C868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_100008414((uint64_t)v10, &qword_10003C868);
  }
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v12 + 32);
  v32[1] = v12 + 32;
  uint64_t v33 = v19;
  uint64_t v34 = v1;
  v19((unint64_t)v16, v10, v11);
  uint64_t v20 = a1 + *(int *)(type metadata accessor for InviteMessageView(0) + 32);
  char v21 = *(unsigned char *)v20;
  uint64_t v22 = *(void *)(v20 + 8);
  char v39 = v21;
  uint64_t v40 = v22;
  char v41 = 1;
  sub_100006E88(&qword_10003C9F8);
  sub_100030B60();
  sub_100030600();
  uint64_t v23 = (void *)sub_1000305F0();
  sub_1000305D0();

  swift_bridgeObjectRelease();
  uint64_t v24 = sub_100030D20();
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v32[0] = (uint64_t)v7;
  v25(v7, 1, 1, v24);
  uint64_t v26 = v38;
  sub_100017D58(a1, v38, type metadata accessor for InviteActionsView);
  char v27 = v35;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v35, v16, v11);
  sub_100030D00();
  uint64_t v28 = sub_100030CF0();
  unint64_t v29 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  unint64_t v30 = (v37 + *(unsigned __int8 *)(v12 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v28;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  sub_10001F2F4(v26, v31 + v29, type metadata accessor for InviteActionsView);
  v33(v31 + v30, v27, v11);
  sub_100005F70(v32[0], (uint64_t)&unk_10003CD58, v31);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v11);
}

uint64_t sub_10000FD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_100030D00();
  v5[3] = sub_100030CF0();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_10000FE0C;
  return sub_10000FFA8(a5, 2);
}

uint64_t sub_10000FE0C()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100030CE0();
  return _swift_task_switch(sub_10000FF48, v1, v0);
}

uint64_t sub_10000FF48()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000FFA8(uint64_t a1, uint64_t a2)
{
  v3[21] = a2;
  v3[22] = v2;
  v3[20] = a1;
  sub_100006E88(&qword_10003C868);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  uint64_t v4 = sub_1000304E0();
  v3[25] = v4;
  v3[26] = *(void *)(v4 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  uint64_t v5 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  v3[31] = v5;
  v3[32] = *(void *)(v5 + 64);
  v3[33] = swift_task_alloc();
  sub_100006E88(&qword_10003C7E8);
  v3[34] = swift_task_alloc();
  uint64_t v6 = sub_1000305A0();
  v3[35] = v6;
  v3[36] = *(void *)(v6 - 8);
  v3[37] = swift_task_alloc();
  uint64_t v7 = sub_100030630();
  v3[38] = v7;
  v3[39] = *(void *)(v7 - 8);
  v3[40] = swift_task_alloc();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v3[43] = sub_100030D00();
  v3[44] = sub_100030CF0();
  uint64_t v9 = sub_100030CE0();
  v3[45] = v9;
  v3[46] = v8;
  return _swift_task_switch(sub_100010270, v9, v8);
}

uint64_t sub_100010270()
{
  sub_1000305C0();
  uint64_t v1 = sub_100030620();
  os_log_type_t v2 = sub_100030D60();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 168);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134217984;
    *(void *)(v0 + 152) = v3;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "User didTap %ld button", v4, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v5 = *(void *)(v0 + 336);
  uint64_t v6 = *(void *)(v0 + 304);
  uint64_t v7 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 176);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 376) = v9;
  *(void *)(v0 + 384) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v5, v6);
  uint64_t v10 = type metadata accessor for InviteMessageView(0);
  *(void *)(v0 + 392) = v10;
  uint64_t v11 = v8 + *(int *)(v10 + 24);
  uint64_t v12 = *(void **)v11;
  *(void *)(v0 + 400) = *(void *)v11;
  if (!v12)
  {
    uint64_t v33 = v10;
    swift_release();
    sub_1000305C0();
    uint64_t v34 = sub_100030620();
    os_log_type_t v35 = sub_100030D40();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "No presenter, return", v36, 2u);
      swift_slowDealloc();
    }
    uint64_t v37 = *(void *)(v0 + 320);
    uint64_t v38 = *(void *)(v0 + 304);
    uint64_t v39 = *(void *)(v0 + 176);

    v9(v37, v38);
    uint64_t v40 = (char *)(v39 + *(int *)(v33 + 32));
    char v41 = *v40;
    uint64_t v42 = *((void *)v40 + 1);
    *(unsigned char *)(v0 + 120) = v41;
    *(void *)(v0 + 128) = v42;
    *(unsigned char *)(v0 + 573) = 0;
    sub_100006E88(&qword_10003C9F8);
    goto LABEL_10;
  }
  uint64_t v14 = *(void *)(v0 + 288);
  uint64_t v13 = *(void *)(v0 + 296);
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v16 = *(void *)(v11 + 8);
  *(void *)(v0 + 408) = v16;
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for FamilyFeatureFlags.familyPrivacyDisclosure(_:), v15);
  id v17 = v12;
  char v18 = sub_100030590();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  if (v18)
  {
    if (*(void *)(v0 + 168) == 1)
    {
      uint64_t v20 = *(void *)(v0 + 264);
      uint64_t v19 = *(void *)(v0 + 272);
      uint64_t v21 = *(void *)(v0 + 248);
      uint64_t v22 = *(void *)(v0 + 256);
      uint64_t v23 = *(void *)(v0 + 176);
      swift_release();
      uint64_t v24 = sub_100030D20();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v19, 1, 1, v24);
      sub_100017D58(v23, v20, type metadata accessor for InviteActionsView);
      id v25 = v17;
      uint64_t v26 = sub_100030CF0();
      unint64_t v27 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v26;
      *(void *)(v28 + 24) = &protocol witness table for MainActor;
      sub_10001F2F4(v20, v28 + v27, type metadata accessor for InviteActionsView);
      unint64_t v29 = (void *)(v28 + ((v22 + v27 + 7) & 0xFFFFFFFFFFFFFFF8));
      *unint64_t v29 = v25;
      v29[1] = v16;
      sub_100005F70(v19, (uint64_t)&unk_10003CD40, v28);
      swift_release();

      unint64_t v30 = (char *)(*(void *)(v0 + 176) + *(int *)(*(void *)(v0 + 392) + 32));
      char v31 = *v30;
      uint64_t v32 = *((void *)v30 + 1);
      *(unsigned char *)(v0 + 136) = v31;
      *(void *)(v0 + 144) = v32;
      *(unsigned char *)(v0 + 572) = 0;
      sub_100006E88(&qword_10003C9F8);
LABEL_10:
      sub_100030B60();
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
      uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
      return v43();
    }
    sub_100006E88(&qword_10003CD20);
    uint64_t v47 = swift_allocObject();
    *(void *)(v0 + 416) = v47;
    *(_OWORD *)(v47 + 16) = xmmword_100031FC0;
    uint64_t v48 = self;
    uint64_t v49 = (objc_class *)[v48 mainBundle];
    v72._countAndFlagsBits = 0xE000000000000000;
    v77._object = (void *)0x8000000100032FA0;
    v77._countAndFlagsBits = 0xD000000000000017;
    v81.value._countAndFlagsBits = 0;
    v81.value._object = 0;
    v50.super.Class isa = v49;
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    uint64_t v51 = sub_100030440(v77, v81, v50, v85, v72);
    uint64_t v53 = v52;

    *(void *)(v47 + 32) = v51;
    *(void *)(v47 + 40) = v53;
    char v54 = (objc_class *)[v48 mainBundle];
    v73._countAndFlagsBits = 0xE000000000000000;
    v78._countAndFlagsBits = 0x6C65636E6143;
    v78._object = (void *)0xE600000000000000;
    v82.value._countAndFlagsBits = 0;
    v82.value._object = 0;
    v55.super.Class isa = v54;
    v86._countAndFlagsBits = 0;
    v86._object = (void *)0xE000000000000000;
    uint64_t v56 = sub_100030440(v78, v82, v55, v86, v73);
    uint64_t v58 = v57;

    *(void *)(v47 + 48) = v56;
    *(void *)(v47 + 56) = v58;
    uint64_t v59 = (objc_class *)[v48 mainBundle];
    v79._countAndFlagsBits = 0xD00000000000001CLL;
    v74._countAndFlagsBits = 0xE000000000000000;
    v79._object = (void *)0x8000000100032FC0;
    v83.value._countAndFlagsBits = 0;
    v83.value._object = 0;
    v60.super.Class isa = v59;
    v87._countAndFlagsBits = 0;
    v87._object = (void *)0xE000000000000000;
    uint64_t v61 = sub_100030440(v79, v83, v60, v87, v74);
    uint64_t v63 = v62;

    *(void *)(v0 + 424) = v61;
    *(void *)(v0 + 432) = v63;
    id v64 = (objc_class *)[v48 mainBundle];
    v80._countAndFlagsBits = 0xD00000000000001ELL;
    v75._countAndFlagsBits = 0xE000000000000000;
    v80._object = (void *)0x8000000100032FE0;
    v84.value._countAndFlagsBits = 0;
    v84.value._object = 0;
    v65.super.Class isa = v64;
    v88._countAndFlagsBits = 0;
    v88._object = (void *)0xE000000000000000;
    uint64_t v66 = sub_100030440(v80, v84, v65, v88, v75);
    uint64_t v68 = v67;

    *(void *)(v0 + 440) = v66;
    *(void *)(v0 + 448) = v68;
    sub_100006E88(&qword_10003CD28);
    uint64_t v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_100031FD0;
    *(void *)(v0 + 456) = sub_1000204DC();
    *(NSNumber *)(v69 + 32) = sub_100030D80(2);
    *(NSNumber *)(v69 + 40) = sub_100030D80(1);
    sub_100030CD0();
    *(void *)(v0 + 464) = v69;
    *(void *)(v0 + 472) = sub_100030CF0();
    uint64_t v71 = sub_100030CE0();
    *(void *)(v0 + 480) = v71;
    *(void *)(v0 + 488) = v70;
    return _swift_task_switch(sub_100010A10, v71, v70);
  }
  else
  {
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v45;
    void *v45 = v0;
    v45[1] = sub_100011400;
    uint64_t v46 = *(void *)(v0 + 184);
    return sub_100012334(v46);
  }
}

uint64_t sub_100010A10()
{
  id v7 = (id)v0[50];
  NSString v1 = sub_100030C50();
  v0[62] = v1;
  NSString v2 = sub_100030C50();
  v0[63] = v2;
  Class isa = sub_100030CA0().super.isa;
  v0[64] = isa;
  Class v4 = sub_100030CA0().super.isa;
  v0[65] = v4;
  v0[2] = v0;
  v0[7] = (char *)v0 + 564;
  v0[3] = sub_100010B98;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10000ADA0;
  v0[13] = &unk_1000398A8;
  v0[14] = v5;
  [v7 family_presentAlertSheetWithTitle:v1 message:v2 buttonTitles:isa styles:v4 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100010B98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 488);
  uint64_t v2 = *(void *)(*(void *)v0 + 480);
  return _swift_task_switch(sub_100010CA0, v2, v1);
}

uint64_t sub_100010CA0()
{
  uint64_t v1 = *(void **)(v0 + 520);
  uint64_t v3 = *(void **)(v0 + 504);
  uint64_t v2 = *(void **)(v0 + 512);
  uint64_t v4 = *(void **)(v0 + 496);
  swift_release();
  *(_DWORD *)(v0 + 568) = *(_DWORD *)(v0 + 564);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);
  return _swift_task_switch(sub_100010D6C, v5, v6);
}

uint64_t sub_100010D6C()
{
  sub_1000305C0();
  uint64_t v1 = sub_100030620();
  os_log_type_t v2 = sub_100030D60();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = *(_DWORD *)(v0 + 568);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    *(_DWORD *)(v0 + 560) = v3;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "User in tap in alert sheet: %d", v4, 8u);
    swift_slowDealloc();
  }
  int v5 = *(_DWORD *)(v0 + 568);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 328);
  uint64_t v8 = *(void *)(v0 + 304);

  v6(v7, v8);
  if (v5)
  {
    uint64_t v9 = *(void **)(v0 + 400);
    swift_release();

    uint64_t v10 = (char *)(*(void *)(v0 + 176) + *(int *)(*(void *)(v0 + 392) + 32));
    char v11 = *v10;
    uint64_t v12 = *((void *)v10 + 1);
    *(unsigned char *)(v0 + 136) = v11;
    *(void *)(v0 + 144) = v12;
    *(unsigned char *)(v0 + 572) = 0;
    sub_100006E88(&qword_10003C9F8);
    sub_100030B60();
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
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  else
  {
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 528) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_100010FF8;
    uint64_t v16 = *(void *)(v0 + 192);
    return sub_100012334(v16);
  }
}

uint64_t sub_100010FF8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 368);
  uint64_t v3 = *(void *)(v1 + 360);
  return _swift_task_switch(sub_100011118, v3, v2);
}

uint64_t sub_100011118()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  (*(void (**)(void, void, uint64_t))(v2 + 16))(v0[29], v0[20], v1);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[24];
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v7 + 32))(v0[30], v0[29], v0[25]);
    sub_100008414(v8, &qword_10003C868);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 8))(v0[29], v0[25]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v9 = v0[50];
  uint64_t v10 = (void *)swift_task_alloc();
  v0[67] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_10001127C;
  uint64_t v11 = v0[30];
  uint64_t v12 = v0[21];
  return sub_100012F38(v11, v12, v9);
}

uint64_t sub_10001127C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 240);
  uint64_t v3 = *(void *)(*v0 + 208);
  uint64_t v4 = *(void *)(*v0 + 200);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 368);
  uint64_t v6 = *(void *)(v1 + 360);
  return _swift_task_switch(sub_1000216F0, v6, v5);
}

uint64_t sub_100011400()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 368);
  uint64_t v3 = *(void *)(v1 + 360);
  return _swift_task_switch(sub_100011520, v3, v2);
}

uint64_t sub_100011520()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[23];
  (*(void (**)(void, void, uint64_t))(v1 + 16))(v0[27], v0[20], v2);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2);
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[25];
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[23];
  if (v4 == 1)
  {
    (*(void (**)(void, void, void))(v7 + 32))(v0[28], v0[27], v0[25]);
    sub_100008414(v8, &qword_10003C868);
  }
  else
  {
    (*(void (**)(void, void))(v7 + 8))(v0[27], v0[25]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v5, v8, v6);
  }
  uint64_t v9 = v0[50];
  uint64_t v10 = (void *)swift_task_alloc();
  v0[69] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_100011684;
  uint64_t v11 = v0[28];
  uint64_t v12 = v0[21];
  return sub_100012F38(v11, v12, v9);
}

uint64_t sub_100011684()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 224);
  uint64_t v3 = *(void *)(*v0 + 208);
  uint64_t v4 = *(void *)(*v0 + 200);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 368);
  uint64_t v6 = *(void *)(v1 + 360);
  return _swift_task_switch(sub_100011808, v6, v5);
}

uint64_t sub_100011808()
{
  uint64_t v1 = *(void **)(v0 + 400);
  swift_release();

  uint64_t v2 = (char *)(*(void *)(v0 + 176) + *(int *)(*(void *)(v0 + 392) + 32));
  char v3 = *v2;
  uint64_t v4 = *((void *)v2 + 1);
  *(unsigned char *)(v0 + 136) = v3;
  *(void *)(v0 + 144) = v4;
  *(unsigned char *)(v0 + 572) = 0;
  sub_100006E88(&qword_10003C9F8);
  sub_100030B60();
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
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100011954@<X0>(uint64_t a1@<X8>)
{
  return sub_1000120BC((void (*)(uint64_t))&static Color.primary.getter, a1);
}

uint64_t sub_100011984()
{
  return swift_release();
}

uint64_t sub_100011A0C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for InviteActionsView(0);
  uint64_t v36 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v37 = v4;
  uint64_t v38 = (uint64_t)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006E88(&qword_10003C868);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000304E0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v11);
  os_log_type_t v35 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v32 - v15;
  uint64_t v17 = type metadata accessor for InviteMessageDetails();
  sub_100007AE0(a1 + *(int *)(v17 + 96), (uint64_t)v10, &qword_10003C868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    return sub_100008414((uint64_t)v10, &qword_10003C868);
  }
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v12 + 32);
  v32[1] = v12 + 32;
  uint64_t v33 = v19;
  uint64_t v34 = v1;
  v19((unint64_t)v16, v10, v11);
  uint64_t v20 = a1 + *(int *)(type metadata accessor for InviteMessageView(0) + 32);
  char v21 = *(unsigned char *)v20;
  uint64_t v22 = *(void *)(v20 + 8);
  char v39 = v21;
  uint64_t v40 = v22;
  char v41 = 1;
  sub_100006E88(&qword_10003C9F8);
  sub_100030B60();
  sub_100030600();
  uint64_t v23 = (void *)sub_1000305F0();
  sub_1000305D0();

  swift_bridgeObjectRelease();
  uint64_t v24 = sub_100030D20();
  id v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  v32[0] = (uint64_t)v7;
  v25(v7, 1, 1, v24);
  uint64_t v26 = v38;
  sub_100017D58(a1, v38, type metadata accessor for InviteActionsView);
  unint64_t v27 = v35;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v35, v16, v11);
  sub_100030D00();
  uint64_t v28 = sub_100030CF0();
  unint64_t v29 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  unint64_t v30 = (v37 + *(unsigned __int8 *)(v12 + 80) + v29) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v28;
  *(void *)(v31 + 24) = &protocol witness table for MainActor;
  sub_10001F2F4(v26, v31 + v29, type metadata accessor for InviteActionsView);
  v33(v31 + v30, v27, v11);
  sub_100005F70(v32[0], (uint64_t)&unk_10003CD00, v31);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v11);
}

uint64_t sub_100011E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_100030D00();
  v5[3] = sub_100030CF0();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100011F50;
  return sub_10000FFA8(a5, 1);
}

uint64_t sub_100011F50()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100030CE0();
  return _swift_task_switch(sub_1000216FC, v1, v0);
}

uint64_t sub_10001208C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000120BC((void (*)(uint64_t))&static Color.white.getter, a1);
}

uint64_t sub_1000120BC@<X0>(void (*a1)(uint64_t)@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3 = sub_100030530();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_100030470();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100030C40();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100030480();
  __chkstk_darwin(v6 - 8);
  sub_100030C30();
  sub_100030460();
  sub_100030520();
  sub_100030490();
  uint64_t v7 = sub_1000309E0();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_100030900();
  uint64_t v12 = sub_1000309C0();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  char v17 = v16 & 1;
  sub_100017E74(v7, v9, v11);
  uint64_t v18 = swift_bridgeObjectRelease();
  a1(v18);
  uint64_t v19 = sub_1000309B0();
  uint64_t v21 = v20;
  char v23 = v22;
  uint64_t v25 = v24;
  swift_release();
  sub_100017E74(v12, v14, v17);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v19;
  *(void *)(a2 + 8) = v21;
  *(unsigned char *)(a2 + 16) = v23 & 1;
  *(void *)(a2 + 24) = v25;
  return result;
}

uint64_t sub_100012334(uint64_t a1)
{
  v1[16] = a1;
  uint64_t v2 = sub_100030630();
  v1[17] = v2;
  v1[18] = *(void *)(v2 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_1000304E0();
  v1[20] = v3;
  v1[21] = *(void *)(v3 - 8);
  v1[22] = swift_task_alloc();
  sub_100030D00();
  v1[23] = sub_100030CF0();
  uint64_t v5 = sub_100030CE0();
  v1[24] = v5;
  v1[25] = v4;
  return _swift_task_switch(sub_100012484, v5, v4);
}

uint64_t sub_100012484()
{
  uint64_t v1 = v0[22];
  v0[26] = [objc_allocWithZone((Class)FAURLConfiguration) init];
  id v2 = [objc_allocWithZone((Class)FAURLConfiguration) init];
  v0[27] = v2;
  uint64_t v3 = FAURLEndpointPendingInviteActionFromMessagesV1;
  v0[2] = v0;
  v0[7] = v1;
  v0[3] = sub_1000125CC;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100012A14;
  v0[13] = &unk_100039910;
  v0[14] = v4;
  [v2 URLForEndpoint:v3 withCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000125CC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 224) = v2;
  uint64_t v3 = *(void *)(v1 + 200);
  uint64_t v4 = *(void *)(v1 + 192);
  if (v2) {
    uint64_t v5 = sub_1000127D8;
  }
  else {
    uint64_t v5 = sub_1000126FC;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000126FC()
{
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 128);

  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v5, v2, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v5, 0, 1, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000127D8()
{
  uint64_t v1 = *(void **)(v0 + 216);
  swift_release();
  swift_willThrow();

  sub_1000305C0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100030620();
  os_log_type_t v3 = sub_100030D40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void **)(v0 + 208);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 120) = v7;
    sub_100030DA0();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to retrieve PendingInviteActionFromMessagesV1 from config bag. Falling back to url from messages payload. Error: %@", v5, 0xCu);
    sub_100006E88(&qword_10003CC58);
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
  uint64_t v8 = *(void *)(v0 + 160);
  uint64_t v9 = *(void *)(v0 + 168);
  uint64_t v10 = *(void *)(v0 + 128);
  (*(void (**)(void, void))(*(void *)(v0 + 144) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 136));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v10, 1, 1, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  char v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_100012A14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_1000304E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E88(&qword_10003CD48);
    uint64_t v10 = swift_allocError();
    void *v11 = a3;
    id v12 = a3;
    return _swift_continuation_throwingResumeWithError(v9, v10);
  }
  else
  {
    sub_1000304C0();
    (*(void (**)(void, char *, uint64_t))(v6 + 32))(*(void *)(*(void *)(v9 + 64) + 40), v8, v5);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100012B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  sub_100006E88(&qword_10003C868);
  v6[7] = swift_task_alloc();
  sub_100030D00();
  v6[8] = sub_100030CF0();
  uint64_t v8 = sub_100030CE0();
  v6[9] = v8;
  v6[10] = v7;
  return _swift_task_switch(sub_100012C3C, v8, v7);
}

uint64_t sub_100012C3C()
{
  uint64_t v1 = v0[4];
  sub_1000304D0();
  uint64_t v2 = type metadata accessor for InviteMessageView(0);
  v0[11] = v2;
  uint64_t v3 = *sub_10001F968((void *)(v1 + *(int *)(v2 + 28)), *(void *)(v1 + *(int *)(v2 + 28) + 24));
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10003CC50
                                                                                    + dword_10003CC50);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[12] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100012D38;
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v7 = v0[5];
  return v9(v6, v7, v5, v3, 0x7542747065636341, 0xEC0000006E6F7474);
}

uint64_t sub_100012D38()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  sub_100008414(v2, &qword_10003C868);
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v1 + 72);
  return _swift_task_switch(sub_100012E84, v4, v3);
}

uint64_t sub_100012E84()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v3 = (char *)(v2 + *(int *)(v1 + 32));
  char v4 = *v3;
  uint64_t v5 = *((void *)v3 + 1);
  *(unsigned char *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v5;
  *(unsigned char *)(v0 + 104) = 0;
  sub_100006E88(&qword_10003C9F8);
  sub_100030B60();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100012F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  sub_100030530();
  v4[22] = swift_task_alloc();
  sub_100030C40();
  v4[23] = swift_task_alloc();
  uint64_t v5 = sub_100030630();
  v4[24] = v5;
  v4[25] = *(void *)(v5 - 8);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  sub_100030D00();
  v4[28] = sub_100030CF0();
  uint64_t v7 = sub_100030CE0();
  v4[29] = v7;
  v4[30] = v6;
  return _swift_task_switch(sub_100013098, v7, v6);
}

uint64_t sub_100013098()
{
  uint64_t v1 = v0[21];
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10003D018 + dword_10003D018);
  char v4 = (void *)swift_task_alloc();
  v0[31] = v4;
  *char v4 = v0;
  v4[1] = sub_100013154;
  uint64_t v6 = v0[18];
  uint64_t v5 = v0[19];
  return v8(v6, v3, v2, v5);
}

uint64_t sub_100013154(uint64_t a1, char a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 256) = a1;
  *(unsigned char *)(v4 + 264) = a2;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 240);
  uint64_t v6 = *(void *)(v3 + 232);
  return _swift_task_switch(sub_100013280, v6, v5);
}

uint64_t sub_100013280()
{
  unint64_t v29 = v0;
  char v1 = *((unsigned char *)v0 + 264);
  swift_release();
  if (v1)
  {
    uint64_t v7 = v0[32];
    sub_100030600();
    swift_errorRetain();
    uint64_t v8 = (void *)sub_1000305F0();
    sub_1000305E0();
    swift_bridgeObjectRelease();

    sub_1000305C0();
    sub_100020954(v7, 1);
    sub_100020954(v7, 1);
    uint64_t v9 = sub_100030620();
    os_log_type_t v10 = sub_100030D40();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = v0[32];
    uint64_t v13 = v0[27];
    uint64_t v14 = v0[24];
    uint64_t v15 = v0[25];
    if (v11)
    {
      uint64_t v27 = v0[27];
      char v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)char v16 = 136315138;
      swift_getErrorValue();
      uint64_t v17 = sub_100030F10();
      v0[17] = sub_10002E7E4(v17, v18, &v28);
      sub_100030DA0();
      swift_bridgeObjectRelease();
      sub_100020960(v12, 1);
      sub_100020960(v12, 1);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Updating invite status failed with error %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v27, v14);
    }
    else
    {
      sub_100020960(v0[32], 1);
      sub_100020960(v12, 1);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    uint64_t v19 = v0[32];
    uint64_t v20 = (void *)v0[20];
    sub_100030C30();
    sub_100030520();
    sub_100030C70();
    swift_getErrorValue();
    sub_100030F10();
    sub_100030C30();
    sub_100030520();
    sub_100030C70();
    NSString v21 = sub_100030C50();
    NSString v22 = sub_100030C50();
    NSString v23 = sub_100030C50();
    v0[6] = nullsub_1;
    v0[7] = 0;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_10000AD5C;
    v0[5] = &unk_1000398E8;
    uint64_t v24 = _Block_copy(v0 + 2);
    [v20 _presentAlertWithTitle:v21 message:v22 buttonTitle:v23 completion:v24];
    _Block_release(v24);

    sub_100020960(v19, 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100020960(v19, 1);
  }
  else
  {
    sub_100030600();
    uint64_t v2 = (void *)sub_1000305F0();
    sub_1000305E0();
    swift_bridgeObjectRelease();

    sub_1000305C0();
    uint64_t v3 = sub_100030620();
    os_log_type_t v4 = sub_100030D60();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = v0[19];
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 134217984;
      v0[14] = v5;
      sub_100030DA0();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Updated invite status to %ld", v6, 0xCu);
      swift_slowDealloc();
    }

    (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_10001380C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100030730();
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_100006E88(&qword_10003CC68);
  return sub_10000DDE4(v1, a1 + *(int *)(v3 + 44), 0.15, 0.25);
}

uint64_t sub_100013868()
{
  uint64_t v1 = type metadata accessor for SettingsView(0);
  uint64_t v2 = __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v28 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  os_log_type_t v10 = (char *)&v28 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  char v16 = (char *)&v28 - v15;
  uint64_t v17 = v0 + *(int *)(v14 + 20);
  int v18 = *(unsigned __int8 *)(v17 + 233);
  sub_100017D58(v0, (uint64_t)&v28 - v15, type metadata accessor for SettingsView);
  if (v18 == 1)
  {
    switch(v16[*(int *)(v1 + 20) + 232])
    {
      case 4:
        swift_bridgeObjectRelease();
        goto LABEL_6;
      default:
        char v19 = sub_100030ED0();
        swift_bridgeObjectRelease();
        sub_100017DC0((uint64_t)v16, type metadata accessor for SettingsView);
        sub_100017D58(v0, (uint64_t)v13, type metadata accessor for SettingsView);
        if (v19) {
          goto LABEL_7;
        }
LABEL_11:
        sub_100017DC0((uint64_t)v13, type metadata accessor for SettingsView);
LABEL_13:
        uint64_t v22 = *(void *)(v17 + 176);
        break;
    }
    goto LABEL_14;
  }
LABEL_6:
  sub_100017DC0((uint64_t)v16, type metadata accessor for SettingsView);
  sub_100017D58(v0, (uint64_t)v13, type metadata accessor for SettingsView);
LABEL_7:
  char v20 = v13[*(int *)(v1 + 20) + 233];
  sub_100017D58((uint64_t)v13, (uint64_t)v10, type metadata accessor for SettingsView);
  if ((v20 & 1) == 0)
  {
    switch(v10[*(int *)(v1 + 20) + 232])
    {
      case 1:
      case 2:
      case 3:
      case 4:
        char v21 = sub_100030ED0();
        swift_bridgeObjectRelease();
        sub_100017DC0((uint64_t)v10, type metadata accessor for SettingsView);
        sub_100017DC0((uint64_t)v13, type metadata accessor for SettingsView);
        if (v21) {
          goto LABEL_13;
        }
        goto LABEL_15;
      default:
        swift_bridgeObjectRelease();
        sub_100017DC0((uint64_t)v10, type metadata accessor for SettingsView);
        goto LABEL_11;
    }
  }
  sub_100017DC0((uint64_t)v10, type metadata accessor for SettingsView);
  sub_100017DC0((uint64_t)v13, type metadata accessor for SettingsView);
LABEL_15:
  uint64_t v23 = v17;
  char v24 = *(unsigned char *)(v17 + 233);
  sub_100017D58(v0, (uint64_t)v7, type metadata accessor for SettingsView);
  if (v24)
  {
    sub_100017DC0((uint64_t)v7, type metadata accessor for SettingsView);
    sub_100017D58(v0, (uint64_t)v4, type metadata accessor for SettingsView);
LABEL_22:
    sub_100017DC0((uint64_t)v4, type metadata accessor for SettingsView);
    return 0;
  }
  switch(v7[*(int *)(v1 + 20) + 232])
  {
    case 2:
      swift_bridgeObjectRelease();
      sub_100017DC0((uint64_t)v7, type metadata accessor for SettingsView);
      sub_100017D58(v0, (uint64_t)v4, type metadata accessor for SettingsView);
      break;
    default:
      char v25 = sub_100030ED0();
      swift_bridgeObjectRelease();
      sub_100017DC0((uint64_t)v7, type metadata accessor for SettingsView);
      sub_100017D58(v0, (uint64_t)v4, type metadata accessor for SettingsView);
      if ((v25 & 1) == 0) {
        goto LABEL_22;
      }
      break;
  }
  char v26 = v4[*(int *)(v1 + 20) + 234];
  sub_100017DC0((uint64_t)v4, type metadata accessor for SettingsView);
  if (v26) {
    return 0;
  }
  uint64_t v22 = *(void *)(v23 + 192);
LABEL_14:
  swift_bridgeObjectRetain();
  return v22;
}

uint64_t sub_100013EB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v65 = a2;
  uint64_t v2 = type metadata accessor for SettingsView(0);
  uint64_t v54 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v55 = v3;
  uint64_t v56 = (uint64_t)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006E88(&qword_10003CBE8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100006E88(&qword_10003CBF0);
  uint64_t v63 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v57 = (uint64_t)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006E88(&qword_10003CBF8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v64 = (uint64_t)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v59 = (uint64_t)&v53 - v11;
  uint64_t v12 = sub_100006E88(&qword_10003CC00);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v62 = (uint64_t)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  char v16 = (char *)&v53 - v15;
  uint64_t v17 = sub_1000307B0();
  sub_10001448C(&v66);
  uint64_t v19 = v66;
  uint64_t v18 = v67;
  uint64_t v21 = v68;
  uint64_t v20 = v69;
  uint64_t v22 = v70;
  uint64_t v66 = v17;
  uint64_t v67 = 0;
  uint64_t v23 = 1;
  LOBYTE(v68) = 1;
  uint64_t v69 = v19;
  uint64_t v70 = v18;
  uint64_t v71 = v21;
  uint64_t v72 = v20;
  uint64_t v73 = v22;
  sub_100006E88(&qword_10003CC08);
  sub_10002169C(&qword_10003CC10, &qword_10003CC08);
  NSBundle v60 = v16;
  sub_100030A60();
  uint64_t v24 = v58;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v25 = sub_100013868();
  if (v26)
  {
    uint64_t v27 = v25;
    uint64_t v28 = v26;
    *(void *)uint64_t v6 = sub_1000307C0();
    *((void *)v6 + 1) = 0;
    v6[16] = 1;
    sub_100006E88(&qword_10003CC20);
    uint64_t v29 = v56;
    sub_100017D58(v24, v56, type metadata accessor for SettingsView);
    unint64_t v30 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = sub_10001F2F4(v29, v31 + v30, type metadata accessor for SettingsView);
    __chkstk_darwin(v32);
    *(&v53 - 2) = v27;
    *(&v53 - 1) = v28;
    sub_100006E88(&qword_10003CC28);
    sub_1000211B0(&qword_10003CC30, &qword_10003CC28);
    sub_100030B70();
    swift_bridgeObjectRelease();
    char v33 = sub_1000308B0();
    sub_100030640();
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v42 = v57;
    sub_100007AE0((uint64_t)v6, v57, &qword_10003CBE8);
    uint64_t v43 = v61;
    uint64_t v44 = v42 + *(int *)(v61 + 36);
    *(unsigned char *)uint64_t v44 = v33;
    *(void *)(v44 + 8) = v35;
    *(void *)(v44 + 16) = v37;
    *(void *)(v44 + 24) = v39;
    *(void *)(v44 + 32) = v41;
    *(unsigned char *)(v44 + 40) = 0;
    sub_100008414((uint64_t)v6, &qword_10003CBE8);
    uint64_t v45 = v59;
    sub_100020E50(v42, v59, &qword_10003CBF0);
    uint64_t v23 = 0;
    uint64_t v46 = v43;
  }
  else
  {
    uint64_t v46 = v61;
    uint64_t v45 = v59;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v63 + 56))(v45, v23, 1, v46);
  uint64_t v47 = (uint64_t)v60;
  uint64_t v48 = v62;
  sub_100007AE0((uint64_t)v60, v62, &qword_10003CC00);
  uint64_t v49 = v64;
  sub_100007AE0(v45, v64, &qword_10003CBF8);
  uint64_t v50 = v65;
  sub_100007AE0(v48, v65, &qword_10003CC00);
  uint64_t v51 = sub_100006E88(&qword_10003CC18);
  sub_100007AE0(v49, v50 + *(int *)(v51 + 48), &qword_10003CBF8);
  sub_100008414(v45, &qword_10003CBF8);
  sub_100008414(v47, &qword_10003CC00);
  sub_100008414(v49, &qword_10003CBF8);
  return sub_100008414(v48, &qword_10003CC00);
}

uint64_t sub_10001448C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100006E88(&qword_10003CC60);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100030AE0();
  uint64_t v6 = sub_100030AA0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v8 = sub_100030910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 1, 1, v8);
  uint64_t v9 = sub_100030940();
  sub_100008414((uint64_t)v4, &qword_10003CC60);
  uint64_t result = swift_getKeyPath();
  *a1 = v5;
  a1[1] = KeyPath;
  a1[2] = v6;
  a1[3] = result;
  a1[4] = v9;
  return result;
}

void sub_1000145C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100030630();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for SettingsView(0);
  uint64_t v7 = v6 - 8;
  v43[0] = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v43[0] + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = sub_100006E88(&qword_10003C7E8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006E88(&qword_10003C868);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100013868();
  if (!v16)
  {
LABEL_7:
    uint64_t v20 = v0 + *(int *)(type metadata accessor for InviteMessageView(0) + 24);
    uint64_t v21 = *(void **)v20;
    if (*(void *)v20)
    {
      uint64_t v22 = *(void *)(v20 + 8);
      sub_100030600();
      id v23 = v21;
      uint64_t v24 = (void *)sub_1000305F0();
      sub_1000305D0();

      swift_bridgeObjectRelease();
      uint64_t v25 = sub_100030D20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v11, 1, 1, v25);
      sub_100017D58(v1, (uint64_t)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SettingsView);
      sub_100030D00();
      id v26 = v23;
      uint64_t v27 = sub_100030CF0();
      unint64_t v28 = (*(unsigned __int8 *)(v43[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43[0] + 80);
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v27;
      *(void *)(v29 + 24) = &protocol witness table for MainActor;
      sub_10001F2F4((uint64_t)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v29 + v28, type metadata accessor for SettingsView);
      unint64_t v30 = (void *)(v29 + ((v8 + v28 + 7) & 0xFFFFFFFFFFFFFFF8));
      void *v30 = v26;
      v30[1] = v22;
      sub_100005F9C((uint64_t)v11, (uint64_t)&unk_10003CC40, v29);
      swift_release();
    }
    else
    {
      sub_1000305C0();
      uint64_t v38 = sub_100030620();
      os_log_type_t v39 = sub_100030D40();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "No presenter, return", v40, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return;
  }
  uint64_t v17 = v0 + *(int *)(v7 + 28);
  if (v15 == *(void *)(v17 + 176) && v16 == *(void *)(v17 + 184))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v19 = sub_100030ED0();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0) {
      goto LABEL_7;
    }
  }
  sub_100030600();
  uint64_t v31 = (void *)sub_1000305F0();
  sub_1000305D0();

  swift_bridgeObjectRelease();
  uint64_t v32 = self;
  id v44 = 0;
  id v33 = [v32 urlDestinationTo:1 error:&v44];
  id v34 = v44;
  if (v33)
  {
    uint64_t v35 = v33;
    sub_1000304C0();
    id v36 = v34;

    uint64_t v37 = sub_1000304E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v14, 0, 1, v37);
  }
  else
  {
    id v41 = v44;
    sub_100030450();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v42 = sub_1000304E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v14, 1, 1, v42);
  }
  sub_100014E78((uint64_t)v14);
  sub_100008414((uint64_t)v14, &qword_10003C868);
}

__n128 sub_100014B9C@<Q0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100030780();
  __chkstk_darwin(v6 - 8);
  sub_100030770();
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_100030760(v36);
  v37._countAndFlagsBits = a1;
  v37._object = a2;
  sub_100030750(v37);
  v38._countAndFlagsBits = 32;
  v38._object = (void *)0xE100000000000000;
  sub_100030760(v38);
  sub_100030AE0();
  sub_100030740();
  swift_release();
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_100030760(v39);
  sub_100030790();
  uint64_t v7 = sub_1000309D0();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_100030990();
  uint64_t v12 = sub_1000309C0();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_100017E74(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_100030930();
  uint64_t v17 = sub_1000309A0();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_100017E74(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  sub_100030AA0();
  uint64_t v22 = sub_1000309B0();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release();
  sub_100017E74(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_100030BB0();
  sub_10000DBE4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v35, 0.0, 1, 0.0, 1, v29, v30, v22, v24, v26 & 1, v28);
  sub_100017E74(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  long long v31 = v35[7];
  *(_OWORD *)(a3 + 96) = v35[6];
  *(_OWORD *)(a3 + 112) = v31;
  *(_OWORD *)(a3 + 128) = v35[8];
  long long v32 = v35[3];
  *(_OWORD *)(a3 + 32) = v35[2];
  *(_OWORD *)(a3 + 48) = v32;
  long long v33 = v35[5];
  *(_OWORD *)(a3 + 64) = v35[4];
  *(_OWORD *)(a3 + 80) = v33;
  __n128 result = (__n128)v35[1];
  *(_OWORD *)a3 = v35[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

id sub_100014E78(uint64_t a1)
{
  uint64_t v55 = (char *)a1;
  uint64_t v1 = sub_100030630();
  uint64_t v56 = *(void *)(v1 - 8);
  uint64_t v57 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v52 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  char v10 = (char *)&v52 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = sub_100006E88(&qword_10003C868);
  __chkstk_darwin(v13 - 8);
  char v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1000304E0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  char v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v52 - v21;
  sub_100007AE0((uint64_t)v55, (uint64_t)v15, &qword_10003C868);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_100008414((uint64_t)v15, &qword_10003C868);
    sub_1000305C0();
    uint64_t v23 = sub_100030620();
    os_log_type_t v24 = sub_100030D40();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "invalid url", v25, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v4, v57);
    return 0;
  }
  uint64_t v55 = v10;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v15, v16);
  id v26 = [self defaultWorkspace];
  if (!v26)
  {
    sub_1000305C0();
    Swift::String v37 = sub_100030620();
    os_log_type_t v38 = sub_100030D40();
    if (os_log_type_enabled(v37, v38))
    {
      Swift::String v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "no workspace", v39, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v7, v57);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
    return 0;
  }
  uint64_t v27 = v26;
  sub_1000305C0();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v29 = v20;
  uint64_t v54 = v22;
  v28(v20, v22, v16);
  uint64_t v30 = sub_100030620();
  os_log_type_t v31 = sub_100030D60();
  if (os_log_type_enabled(v30, v31))
  {
    long long v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v59 = v53;
    *(_DWORD *)long long v32 = 136315138;
    uint64_t v52 = v32 + 4;
    sub_100017FB4(&qword_10003CC48, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v33 = sub_100030EC0();
    uint64_t v58 = sub_10002E7E4(v33, v34, &v59);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void (**)(char *, uint64_t))(v17 + 8);
    v35(v29, v16);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Opening url %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v35 = *(void (**)(char *, uint64_t))(v17 + 8);
    v35(v29, v16);
  }

  Swift::String v36 = *(void (**)(char *, uint64_t))(v56 + 8);
  v36(v12, v57);
  id v41 = v54;
  sub_1000304B0(v42);
  id v44 = v43;
  sub_100028128((uint64_t)&_swiftEmptyArrayStorage);
  Class isa = sub_100030BE0().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v46 = v27;
  id v40 = [v27 openSensitiveURL:v44 withOptions:isa];

  uint64_t v47 = (uint64_t)v55;
  sub_1000305C0();
  uint64_t v48 = sub_100030620();
  os_log_type_t v49 = sub_100030D60();
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v50 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 67109120;
    id v41 = v54;
    LODWORD(v59) = v40;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Did open Family Settings: %{BOOL}d", v50, 8u);
    uint64_t v47 = (uint64_t)v55;
    swift_slowDealloc();
  }

  v36((char *)v47, v57);
  v35(v41, v16);
  return v40;
}

uint64_t sub_10001558C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  sub_100006E88(&qword_10003C868);
  v6[6] = swift_task_alloc();
  sub_100030D00();
  v6[7] = sub_100030CF0();
  uint64_t v8 = sub_100030CE0();
  v6[8] = v8;
  v6[9] = v7;
  return _swift_task_switch(sub_100015658, v8, v7);
}

uint64_t sub_100015658()
{
  uint64_t v1 = v0[3];
  type metadata accessor for SettingsView(0);
  sub_1000304D0();
  uint64_t v2 = type metadata accessor for InviteMessageView(0);
  uint64_t v3 = *sub_10001F968((void *)(v1 + *(int *)(v2 + 28)), *(void *)(v1 + *(int *)(v2 + 28) + 24));
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))((char *)&dword_10003CC50
                                                                                             + dword_10003CC50);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10001576C;
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[4];
  return v9(v6, v7, v5, v3, 0x726F4D6E7261654CLL, 0xED00006B6E694C65);
}

uint64_t sub_10001576C(char a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 48);
  *(unsigned char *)(*v1 + 88) = a1;
  swift_task_dealloc();
  sub_100008414(v3, &qword_10003C868);
  uint64_t v4 = *(void *)(v2 + 72);
  uint64_t v5 = *(void *)(v2 + 64);
  return _swift_task_switch(sub_1000158C0, v5, v4);
}

uint64_t sub_1000158C0()
{
  char v1 = *(unsigned char *)(v0 + 88);
  uint64_t v2 = *(unsigned char **)(v0 + 16);
  swift_release();
  unsigned char *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10001593C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100030730();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_100006E88(&qword_10003CBE0);
  return sub_100013EB0(v1, a1 + *(int *)(v3 + 44));
}

double sub_100015988@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100030AF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100030B20();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  uint64_t v6 = sub_100030B10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_100030BA0();
  sub_100030670();
  uint64_t v7 = v12;
  char v8 = v13;
  uint64_t v9 = v14;
  char v10 = v15;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(unsigned char *)(a1 + 32) = v10;
  double result = *(double *)&v16;
  *(_OWORD *)(a1 + 40) = v16;
  return result;
}

uint64_t sub_100015B14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100006E88(&qword_10003CD60);
  __chkstk_darwin(v6 - 8);
  char v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v8 = sub_1000307B0();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v9 = sub_100006E88(&qword_10003CD68);
  sub_100015C68(a1, a2, (uint64_t)&v8[*(int *)(v9 + 44)]);
  sub_100030B90();
  sub_1000306B0();
  sub_100007AE0((uint64_t)v8, a3, &qword_10003CD60);
  char v10 = (_OWORD *)(a3 + *(int *)(sub_100006E88(&qword_10003CD70) + 36));
  long long v11 = v15[5];
  v10[4] = v15[4];
  v10[5] = v11;
  v10[6] = v15[6];
  long long v12 = v15[1];
  *char v10 = v15[0];
  v10[1] = v12;
  long long v13 = v15[3];
  v10[2] = v15[2];
  v10[3] = v13;
  return sub_100008414((uint64_t)v8, &qword_10003CD60);
}

uint64_t sub_100015C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v4 = sub_100006E88(&qword_10003CD78);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  sub_100030B90();
  sub_100030670();
  uint64_t v10 = v22;
  char v11 = v23;
  uint64_t v12 = v24;
  char v13 = v25;
  uint64_t v14 = v26;
  uint64_t v15 = v27;
  *(void *)uint64_t v9 = sub_1000307B0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  long long v16 = &v9[*(int *)(sub_100006E88(&qword_10003CD80) + 44)];
  *(void *)long long v16 = sub_100030730();
  *((void *)v16 + 1) = 0x4010000000000000;
  v16[16] = 0;
  uint64_t v17 = sub_100006E88(&qword_10003CD88);
  sub_100015E18(v20, v21, (uint64_t)&v16[*(int *)(v17 + 44)]);
  sub_100007AE0((uint64_t)v9, (uint64_t)v7, &qword_10003CD78);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  *(void *)(a3 + 16) = v10;
  *(unsigned char *)(a3 + 24) = v11;
  *(void *)(a3 + 32) = v12;
  *(unsigned char *)(a3 + 40) = v13;
  *(void *)(a3 + 48) = v14;
  *(void *)(a3 + 56) = v15;
  *(_WORD *)(a3 + 64) = 257;
  uint64_t v18 = sub_100006E88(&qword_10003CD90);
  sub_100007AE0((uint64_t)v7, a3 + *(int *)(v18 + 64), &qword_10003CD78);
  sub_100008414((uint64_t)v9, &qword_10003CD78);
  return sub_100008414((uint64_t)v7, &qword_10003CD78);
}

uint64_t sub_100015E18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v63 = a2;
  uint64_t v64 = a3;
  uint64_t v3 = sub_100030650();
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  __chkstk_darwin(v3);
  uint64_t v59 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100030860();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v57 = v5;
  uint64_t v58 = v6;
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006E88(&qword_10003CD98);
  uint64_t v55 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100006E88(&qword_10003CDA0);
  uint64_t v12 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006E88(&qword_10003CDA8);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100006E88(&qword_10003CDB0);
  uint64_t v20 = v19 - 8;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v65 = (uint64_t)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v56 = (uint64_t)&v54 - v23;
  sub_100030660();
  sub_100030850();
  sub_10002169C(&qword_10003CDB8, &qword_10003CD98);
  sub_100017FB4(&qword_10003CDC0, (void (*)(uint64_t))&type metadata accessor for CircularProgressViewStyle);
  uint64_t v24 = v57;
  sub_100030A30();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v8, v24);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v11, v9);
  uint64_t v25 = v54;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v18, v14, v54);
  *(_WORD *)&v18[*(int *)(v16 + 44)] = 257;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v25);
  uint64_t v27 = v59;
  uint64_t v26 = v60;
  uint64_t v28 = v61;
  (*(void (**)(char *, void, uint64_t))(v60 + 104))(v59, enum case for ControlSize.small(_:), v61);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = v65;
  os_log_type_t v31 = (uint64_t *)(v65 + *(int *)(v20 + 44));
  uint64_t v32 = sub_100006E88(&qword_10003CDC8);
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))((char *)v31 + *(int *)(v32 + 28), v27, v28);
  *os_log_type_t v31 = KeyPath;
  sub_100007AE0((uint64_t)v18, v30, &qword_10003CDA8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
  sub_100008414((uint64_t)v18, &qword_10003CDA8);
  uint64_t v33 = v30;
  uint64_t v34 = v56;
  sub_100020E50(v33, v56, &qword_10003CDB0);
  uint64_t v66 = v62;
  uint64_t v67 = v63;
  sub_1000190D0();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_1000309F0();
  uint64_t v37 = v36;
  LOBYTE(v20) = v38 & 1;
  sub_100030980();
  uint64_t v39 = sub_1000309C0();
  uint64_t v41 = v40;
  LOBYTE(v9) = v42;
  swift_release();
  LOBYTE(v16) = v9 & 1;
  sub_100017E74(v35, v37, v20);
  swift_bridgeObjectRelease();
  id v43 = [self secondaryLabelColor];
  sub_100030A80();
  uint64_t v44 = sub_1000309B0();
  uint64_t v46 = v45;
  LOBYTE(v9) = v47;
  uint64_t v49 = v48;
  swift_release();
  sub_100017E74(v39, v41, v16);
  swift_bridgeObjectRelease();
  uint64_t v50 = v65;
  sub_100007AE0(v34, v65, &qword_10003CDB0);
  uint64_t v51 = v64;
  sub_100007AE0(v50, v64, &qword_10003CDB0);
  uint64_t v52 = v51 + *(int *)(sub_100006E88(&qword_10003CDD0) + 48);
  *(void *)uint64_t v52 = v44;
  *(void *)(v52 + 8) = v46;
  *(unsigned char *)(v52 + 16) = v9 & 1;
  *(void *)(v52 + 24) = v49;
  sub_100019124(v44, v46, v9 & 1);
  swift_bridgeObjectRetain();
  sub_100008414(v34, &qword_10003CDB0);
  sub_100017E74(v44, v46, v9 & 1);
  swift_bridgeObjectRelease();
  return sub_100008414(v50, &qword_10003CDB0);
}

uint64_t sub_100016484@<X0>(uint64_t a1@<X8>)
{
  return sub_100015B14(*v1, v1[1], a1);
}

uint64_t sub_10001648C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000307B0();
  sub_1000165E8(a1, (uint64_t)v18);
  *(_OWORD *)&v19[71] = v18[4];
  *(_OWORD *)&v19[87] = v18[5];
  *(_OWORD *)&v19[103] = v18[6];
  *(_OWORD *)&v19[119] = v18[7];
  *(_OWORD *)&v19[7] = v18[0];
  *(_OWORD *)&v19[23] = v18[1];
  *(_OWORD *)&v19[39] = v18[2];
  *(_OWORD *)&v19[55] = v18[3];
  long long v21 = (unint64_t)v4;
  v22[0] = 0;
  long long v5 = *(_OWORD *)&v19[16];
  *(_OWORD *)&v22[33] = *(_OWORD *)&v19[32];
  long long v6 = *(_OWORD *)&v19[32];
  *(_OWORD *)&v22[17] = *(_OWORD *)&v19[16];
  long long v7 = *(_OWORD *)&v19[96];
  *(_OWORD *)&v22[81] = *(_OWORD *)&v19[80];
  long long v8 = *(_OWORD *)&v19[80];
  *(_OWORD *)&v22[97] = *(_OWORD *)&v19[96];
  long long v9 = *(_OWORD *)&v19[112];
  *(_OWORD *)&v22[113] = *(_OWORD *)&v19[112];
  long long v10 = *(_OWORD *)&v19[64];
  *(_OWORD *)&v22[49] = *(_OWORD *)&v19[48];
  long long v11 = *(_OWORD *)&v19[48];
  *(_OWORD *)&v22[65] = *(_OWORD *)&v19[64];
  long long v12 = *(_OWORD *)v19;
  *(_OWORD *)&v22[1] = *(_OWORD *)v19;
  long long v13 = *(_OWORD *)&v22[96];
  *(_OWORD *)(a2 + 96) = *(_OWORD *)&v22[80];
  *(_OWORD *)(a2 + 112) = v13;
  *(_OWORD *)(a2 + 128) = *(_OWORD *)&v22[112];
  long long v14 = *(_OWORD *)&v22[32];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v22[16];
  *(_OWORD *)(a2 + 48) = v14;
  long long v15 = *(_OWORD *)&v22[64];
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v22[48];
  *(_OWORD *)(a2 + 80) = v15;
  long long v16 = *(_OWORD *)v22;
  *(_OWORD *)a2 = v21;
  *(_OWORD *)(a2 + 16) = v16;
  long long v30 = v8;
  long long v31 = v7;
  *(_OWORD *)uint64_t v32 = v9;
  long long v26 = v5;
  long long v27 = v6;
  long long v28 = v11;
  long long v29 = v10;
  char v20 = 0;
  *(void *)&v22[128] = *(void *)&v19[127];
  *(void *)(a2 + 144) = *(void *)&v19[127];
  v23[0] = v4;
  v23[1] = 0;
  char v24 = 0;
  *(void *)&v32[15] = *(void *)&v19[127];
  long long v25 = v12;
  sub_10001FA74((uint64_t)&v21);
  return sub_10001FBC0((uint64_t)v23);
}

uint64_t sub_1000165E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = sub_100030730();
  sub_100016800(a1, v28);
  uint64_t v26 = v28[2];
  uint64_t v27 = v28[1];
  uint64_t v25 = v28[3];
  uint64_t v22 = v28[5];
  uint64_t v23 = v28[4];
  uint64_t v20 = v28[7];
  uint64_t v21 = v28[6];
  uint64_t v18 = v28[0];
  uint64_t v19 = v28[8];
  sub_100030980();
  uint64_t v4 = sub_1000309C0();
  uint64_t v6 = v5;
  LOBYTE(a1) = v7;
  swift_release();
  char v8 = a1 & 1;
  id v9 = [self secondaryLabelColor];
  sub_100030A80();
  uint64_t v10 = sub_1000309B0();
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  swift_release();
  sub_100017E74(v4, v6, v8);
  swift_bridgeObjectRelease();
  LOBYTE(v28[0]) = 0;
  char v29 = v14 & 1;
  *(void *)a2 = v24;
  *(void *)(a2 + 8) = 0x4000000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v27;
  *(void *)(a2 + 40) = v26;
  *(void *)(a2 + 48) = v25;
  *(void *)(a2 + 56) = v23;
  *(void *)(a2 + 64) = v22;
  *(void *)(a2 + 72) = v21;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v19;
  *(void *)(a2 + 96) = v10;
  *(void *)(a2 + 104) = v12;
  *(unsigned char *)(a2 + 112) = v14 & 1;
  *(void *)(a2 + 120) = v16;
  sub_10001FB0C(v18, v27, v26, v25);
  sub_10001FB50(v23);
  sub_100019124(v10, v12, v14 & 1);
  swift_bridgeObjectRetain();
  sub_100017E74(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  sub_10001FC58(v18, v27, v26, v25);

  return sub_10001FC9C(v23);
}

uint64_t sub_100016800@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  if (a1[3])
  {
    char v24 = v6 & 1;
    sub_100019124(*a1, v5, v6 & 1);
    swift_bridgeObjectRetain();
    sub_100030980();
    uint64_t v7 = sub_1000309C0();
    uint64_t v9 = v8;
    char v11 = v10;
    swift_release();
    sub_100030930();
    uint64_t v12 = sub_1000309A0();
    uint64_t v22 = v13;
    uint64_t v23 = v12;
    uint64_t v25 = v14;
    uint64_t v6 = v15 & 1;
    sub_100017E74(v4, v5, v24);
    swift_bridgeObjectRelease();
    sub_100017E74(v7, v9, v11 & 1);
    swift_bridgeObjectRelease();
    uint64_t v5 = v22;
    uint64_t v4 = v23;
    uint64_t v16 = a1[5];
    if (v16)
    {
LABEL_3:
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_100030AE0();
      uint64_t v17 = sub_100030980();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v19 = a1[6];
      uint64_t v20 = swift_getKeyPath();
      swift_retain();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v16 = a1[5];
    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t KeyPath = 0;
  uint64_t v17 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
LABEL_6:
  *a2 = v4;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v25;
  a2[4] = v16;
  a2[5] = KeyPath;
  a2[6] = v17;
  a2[7] = v20;
  a2[8] = v19;
  sub_10001FB0C(v4, v5, v6, v25);
  sub_10001FB50(v16);
  sub_10001FC9C(v16);

  return sub_10001FC58(v4, v5, v6, v25);
}

uint64_t sub_100016A08()
{
  return sub_100030A50();
}

double sub_100016A24@<D0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 48);
  v11[2] = *(_OWORD *)(v1 + 32);
  v11[3] = v3;
  v11[4] = *(_OWORD *)(v1 + 64);
  uint64_t v12 = *(void *)(v1 + 80);
  long long v4 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v4;
  uint64_t v5 = sub_1000307B0();
  sub_10001648C((uint64_t *)v11, (uint64_t)v13);
  *(_OWORD *)((char *)&v15[7] + 7) = v13[7];
  *(_OWORD *)((char *)&v15[6] + 7) = v13[6];
  *(_OWORD *)((char *)&v15[3] + 7) = v13[3];
  *(_OWORD *)((char *)&v15[2] + 7) = v13[2];
  *(_OWORD *)((char *)&v15[8] + 7) = v13[8];
  *(void *)((char *)&v15[9] + 7) = v14;
  *(_OWORD *)((char *)&v15[4] + 7) = v13[4];
  *(_OWORD *)((char *)&v15[5] + 7) = v13[5];
  *(_OWORD *)((char *)v15 + 7) = v13[0];
  *(_OWORD *)((char *)&v15[1] + 7) = v13[1];
  long long v6 = v15[7];
  *(_OWORD *)(a1 + 113) = v15[6];
  *(_OWORD *)(a1 + 129) = v6;
  *(_OWORD *)(a1 + 145) = v15[8];
  *(_OWORD *)(a1 + 160) = *(_OWORD *)((char *)&v15[8] + 15);
  long long v7 = v15[3];
  *(_OWORD *)(a1 + 49) = v15[2];
  *(_OWORD *)(a1 + 65) = v7;
  long long v8 = v15[5];
  *(_OWORD *)(a1 + 81) = v15[4];
  *(_OWORD *)(a1 + 97) = v8;
  double result = *(double *)v15;
  long long v10 = v15[1];
  *(_OWORD *)(a1 + 17) = v15[0];
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = 0x401C000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 33) = v10;
  return result;
}

double sub_100016B20@<D0>(uint64_t a1@<X8>)
{
  id v2 = [self opaqueSeparatorColor];
  uint64_t v3 = sub_100030A80();
  sub_100030B90();
  sub_100030670();
  *(void *)a1 = v3;
  *(_WORD *)(a1 + 8) = 256;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  double result = *(double *)&v7;
  *(_OWORD *)(a1 + 48) = v7;
  return result;
}

uint64_t sub_100016BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100006E88(&qword_10003CDF0);
  uint64_t v58 = *(void *)(v4 - 8);
  uint64_t v59 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  long long v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  long long v10 = (char *)&v48 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v48 - v12;
  __chkstk_darwin(v11);
  uint64_t v57 = (char *)&v48 - v14;
  uint64_t v15 = sub_100006E88(&qword_10003CDF8);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  char v24 = (char *)&v48 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v48 - v25;
  *(void *)uint64_t v26 = sub_1000307B0();
  *((void *)v26 + 1) = 0x4020000000000000;
  v26[16] = 0;
  unint64_t v27 = *(void *)(a1 + 16);
  unint64_t v28 = v27 - 1;
  if (v27 > 3) {
    unint64_t v28 = 3;
  }
  if ((v28 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v27 <= v28)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    swift_bridgeObjectRelease();
    sub_1000183E0(a1, v49, 0, (2 * a2) | 1);
    goto LABEL_10;
  }
  uint64_t v53 = v7;
  uint64_t v55 = v18;
  uint64_t v56 = a2;
  a2 = v28 + 1;
  uint64_t v49 = a1 + 32;
  sub_100030EE0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  char v29 = (void *)swift_dynamicCastClass();
  if (!v29)
  {
    swift_bridgeObjectRelease();
    char v29 = &_swiftEmptyArrayStorage;
  }
  uint64_t v52 = v10;
  uint64_t v30 = v29[2];
  swift_release();
  uint64_t v54 = v21;
  if (v30 != a2) {
    goto LABEL_20;
  }
  if (!swift_dynamicCastClass()) {
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v50 = sub_100006E88(&qword_10003CE00);
  long long v31 = &v26[*(int *)(v50 + 44)];
  swift_release();
  *(void *)(swift_allocObject() + 16) = a1;
  unint64_t v32 = sub_100020EF4();
  swift_bridgeObjectRetain();
  unint64_t v51 = v32;
  sub_100030B80();
  uint64_t v33 = v57;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
  uint64_t v35 = v59;
  v34(v57, v13, v59);
  v34(v31, v33, v35);
  *(void *)char v24 = sub_1000307B0();
  *((void *)v24 + 1) = 0x4020000000000000;
  v24[16] = 0;
  if (v27 <= 4)
  {
    uint64_t v40 = v53;
    uint64_t v39 = (uint64_t)v54;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v36 = (void *)swift_dynamicCastClass();
  if (!v36)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = &_swiftEmptyArrayStorage;
  }
  uint64_t v37 = v36[2];
  swift_release();
  if (v37 != v27 - 4)
  {
    swift_bridgeObjectRelease();
    sub_1000183E0(a1, v49, 4, (2 * v27) | 1);
    uint64_t v40 = v53;
    uint64_t v39 = (uint64_t)v54;
    goto LABEL_15;
  }
  uint64_t v38 = swift_dynamicCastClass();
  swift_bridgeObjectRelease();
  uint64_t v40 = v53;
  uint64_t v39 = (uint64_t)v54;
  if (!v38) {
LABEL_15:
  }
    swift_bridgeObjectRelease();
LABEL_17:
  uint64_t v41 = &v24[*(int *)(v50 + 44)];
  swift_bridgeObjectRelease();
  *(void *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain();
  sub_100030B80();
  char v42 = v52;
  uint64_t v43 = v59;
  v34(v52, v40, v59);
  v34(v41, v42, v43);
  sub_100007AE0((uint64_t)v26, v39, &qword_10003CDF8);
  uint64_t v44 = (uint64_t)v55;
  sub_100007AE0((uint64_t)v24, (uint64_t)v55, &qword_10003CDF8);
  uint64_t v45 = v56;
  sub_100007AE0(v39, v56, &qword_10003CDF8);
  uint64_t v46 = sub_100006E88(&qword_10003CE10);
  sub_100007AE0(v44, v45 + *(int *)(v46 + 48), &qword_10003CDF8);
  sub_100008414((uint64_t)v24, &qword_10003CDF8);
  sub_100008414((uint64_t)v26, &qword_10003CDF8);
  sub_100008414(v44, &qword_10003CDF8);
  return sub_100008414(v39, &qword_10003CDF8);
}

uint64_t sub_10001713C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v7 = *(void *)(a2 + 16);
  unint64_t v8 = v7 - 1;
  if (v7 > 3) {
    unint64_t v8 = 3;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v7 <= v8)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_1000183E0(v4, v4 + 32, 0, (2 * v5) | 1);
    goto LABEL_10;
  }
  uint64_t v4 = a2;
  unint64_t v3 = a1;
  unint64_t v5 = v8 + 1;
  sub_100030EE0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v9 = (void *)swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = &_swiftEmptyArrayStorage;
  }
  uint64_t v10 = v9[2];
  swift_release();
  if (v10 != v5) {
    goto LABEL_15;
  }
  uint64_t v11 = (void *)swift_dynamicCastClass();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }
LABEL_10:
  uint64_t result = swift_bridgeObjectRelease();
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v11[2] > v3)
  {
    uint64_t v13 = &v11[4 * v3];
    uint64_t v15 = v13[4];
    uint64_t v14 = v13[5];
    uint64_t v17 = v13[6];
    uint64_t v16 = v13[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_release();
    *a3 = v15;
    a3[1] = v14;
    a3[2] = v17;
    a3[3] = v16;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_100017284@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v6 = *(void *)(a2 + 16);
  if (v6 < 5)
  {
    unint64_t i = &_swiftEmptyArrayStorage;
    goto LABEL_9;
  }
  uint64_t v3 = a2;
  sub_100030EE0();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  unint64_t v7 = (void *)swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    unint64_t v7 = &_swiftEmptyArrayStorage;
  }
  uint64_t v8 = v7[2];
  swift_release();
  if (v8 != v6 - 4) {
    goto LABEL_14;
  }
  unint64_t i = (void *)swift_dynamicCastClass();
  swift_bridgeObjectRelease();
  if (i) {
    goto LABEL_9;
  }
  for (unint64_t i = &_swiftEmptyArrayStorage; ; unint64_t i = sub_1000183E0(v3, v3 + 32, 4, (2 * v6) | 1))
  {
    swift_bridgeObjectRelease();
LABEL_9:
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_13;
    }
    if (i[2] > a1) {
      break;
    }
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
  }
  uint64_t v10 = &i[4 * a1];
  uint64_t v12 = v10[4];
  uint64_t v11 = v10[5];
  uint64_t v14 = v10[6];
  uint64_t v13 = v10[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v12;
  a3[1] = v11;
  a3[2] = v14;
  a3[3] = v13;
  return result;
}

uint64_t sub_1000173BC()
{
  uint64_t v1 = sub_100030880();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100006E88(&qword_10003CDD8);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v0;
  *(void *)unint64_t v7 = sub_100030720();
  *((void *)v7 + 1) = 0x403E000000000000;
  v7[16] = 0;
  uint64_t v9 = sub_100006E88(&qword_10003CDE0);
  sub_100016BB0(v8, (uint64_t)&v7[*(int *)(v9 + 44)]);
  sub_100030870();
  sub_10002169C(&qword_10003CDE8, &qword_10003CDD8);
  sub_100030A70();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_100008414((uint64_t)v7, &qword_10003CDD8);
}

uint64_t sub_10001755C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  uint64_t v7 = sub_100006E88(&qword_10003CE70);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000303B0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  swift_bridgeObjectRetain();
  sub_1000303A0();
  sub_1000190D0();
  uint64_t v15 = sub_100030DD0();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  uint64_t v27 = v15;
  uint64_t v28 = v17;
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = v20;
  uint64_t v26 = v21;
  sub_100006E88(&qword_10003CE78);
  sub_100021408();
  sub_100030B30();
  swift_bridgeObjectRelease();
  sub_10002169C(&qword_10003CE98, &qword_10003CE70);
  sub_1000214A8();
  sub_100030A40();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1000177E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100030950();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  void v23[2] = a1;
  v23[3] = a2;
  sub_1000190D0();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1000309F0();
  uint64_t v12 = v11;
  char v14 = v13 & 1;
  sub_100030990();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  sub_100030970();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = sub_1000309C0();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  swift_release();
  sub_100017E74(v10, v12, v14);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a3 = v15;
  *(void *)(a3 + 8) = v17;
  *(unsigned char *)(a3 + 16) = v19 & 1;
  *(void *)(a3 + 24) = v21;
  return result;
}

uint64_t sub_10001799C@<X0>(uint64_t *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100030B00();
  uint64_t v3 = sub_100030960();
  uint64_t result = swift_getKeyPath();
  *a1 = v2;
  a1[1] = result;
  a1[2] = v3;
  return result;
}

uint64_t sub_100017A00@<X0>(uint64_t a1@<X8>)
{
  return sub_10001755C(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_100017A0C@<X0>(char *a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_100030830();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v25 = v1;
  uint64_t v26 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - v6;
  uint64_t v8 = sub_100030810();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v9 = v27;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  char v14 = (char *)&v25 - v13;
  sub_100030820();
  sub_100030840();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v16(v5, v7, v1);
  uint64_t v17 = v28;
  v15(v28, v12, v8);
  uint64_t v18 = sub_100006E88(&qword_10003CED0);
  uint64_t v19 = v25;
  v16(&v17[*(int *)(v18 + 48)], v5, v25);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v21 = v7;
  uint64_t v22 = v19;
  v20(v21, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v27 + 8);
  v23(v14, v8);
  v20(v5, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v8);
}

uint64_t sub_100017C90@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100030730();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v2 = sub_100006E88(&qword_10003CEC8);
  return sub_100017A0C((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t type metadata accessor for InviteActionsView(uint64_t a1)
{
  return sub_100017D20(a1, qword_10003CAD8);
}

uint64_t type metadata accessor for SettingsView(uint64_t a1)
{
  return sub_100017D20(a1, qword_10003CB68);
}

uint64_t sub_100017D20(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100017D58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017DC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100017E20()
{
  unint64_t result = qword_10003C9E0;
  if (!qword_10003C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003C9E0);
  }
  return result;
}

uint64_t sub_100017E74(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100017E84()
{
  unint64_t result = qword_10003CA08;
  if (!qword_10003CA08)
  {
    sub_100007A10(&qword_10003C9A0);
    sub_100017F30();
    sub_100017FB4(&qword_10003CA28, (void (*)(uint64_t))type metadata accessor for InviteActionsView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA08);
  }
  return result;
}

uint64_t sub_100017F30()
{
  return sub_10001819C(&qword_10003CA10, &qword_10003CA18, (void (*)(void))sub_100017F60);
}

unint64_t sub_100017F60()
{
  unint64_t result = qword_10003CA20;
  if (!qword_10003CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA20);
  }
  return result;
}

uint64_t sub_100017FB4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100017FFC()
{
  unint64_t result = qword_10003CA30;
  if (!qword_10003CA30)
  {
    sub_100007A10(&qword_10003C988);
    sub_1000180E4(&qword_10003CA38, &qword_10003CA00, (void (*)(void))sub_1000180A8, (void (*)(void))sub_100017F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA30);
  }
  return result;
}

uint64_t sub_1000180A8()
{
  return sub_1000180E4(&qword_10003CA40, &qword_10003C980, (void (*)(void))sub_10001816C, (void (*)(void))sub_10001826C);
}

uint64_t sub_1000180E4(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007A10(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001816C()
{
  return sub_10001819C(&qword_10003CA48, &qword_10003CA50, (void (*)(void))sub_100018218);
}

uint64_t sub_10001819C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007A10(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100018218()
{
  unint64_t result = qword_10003CA58;
  if (!qword_10003CA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA58);
  }
  return result;
}

unint64_t sub_10001826C()
{
  unint64_t result = qword_10003CA60;
  if (!qword_10003CA60)
  {
    sub_100007A10(&qword_10003C968);
    sub_100017FB4(&qword_10003CA28, (void (*)(uint64_t))type metadata accessor for InviteActionsView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA60);
  }
  return result;
}

uint64_t sub_100018318(uint64_t a1)
{
  uint64_t v2 = sub_100030650();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1000306D0();
}

void *sub_1000183E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return &_swiftEmptyArrayStorage;
    }
    uint64_t v8 = 4 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 32 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100006E88(&qword_10003CE18);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 1;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 5);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  unint64_t result = (void *)sub_100030EA0();
  __break(1u);
  return result;
}

uint64_t sub_100018554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[16] = a5;
  v6[17] = a6;
  v6[14] = a2;
  v6[15] = a4;
  v6[13] = a1;
  sub_100030530();
  v6[18] = swift_task_alloc();
  sub_100030C40();
  v6[19] = swift_task_alloc();
  uint64_t v7 = sub_100030630();
  v6[20] = v7;
  v6[21] = *(void *)(v7 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  sub_100006E88(&qword_10003C868);
  v6[24] = swift_task_alloc();
  uint64_t v8 = sub_1000304E0();
  v6[25] = v8;
  v6[26] = *(void *)(v8 - 8);
  v6[27] = swift_task_alloc();
  swift_retain();
  return _swift_task_switch(sub_100018720, 0, 0);
}

uint64_t sub_100018720()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  sub_100007AE0(v0[13], v3, &qword_10003C868);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100008414(v0[24], &qword_10003C868);
    sub_1000305C0();
    unint64_t v4 = sub_100030620();
    os_log_type_t v5 = sub_100030D40();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "invalid url in openFamilyInvite", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v7 = v0[23];
    uint64_t v8 = v0[20];
    uint64_t v9 = v0[21];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10(0);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[26] + 32))(v0[27], v0[24], v0[25]);
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10003D008 + dword_10003D008);
    unint64_t v12 = (void *)swift_task_alloc();
    v0[28] = v12;
    *unint64_t v12 = v0;
    v12[1] = sub_100018960;
    uint64_t v13 = v0[27];
    uint64_t v14 = v0[16];
    uint64_t v15 = v0[17];
    uint64_t v16 = v0[14];
    return v17(v13, v16, v14, v15);
  }
}

uint64_t sub_100018960(uint64_t a1)
{
  *(void *)(*(void *)v1 + 232) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100018A60, 0, 0);
}

uint64_t sub_100018A60()
{
  id v1 = [(id)v0[29] error];
  if (v1)
  {
    uint64_t v2 = v1;
    id v26 = (id)v0[14];
    sub_100030C30();
    sub_100030520();
    sub_100030C70();
    swift_getErrorValue();
    sub_100030F10();
    sub_100030C30();
    sub_100030520();
    sub_100030C70();
    NSString v3 = sub_100030C50();
    NSString v4 = sub_100030C50();
    NSString v5 = sub_100030C50();
    v0[6] = nullsub_1;
    v0[7] = 0;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_10000AD5C;
    v0[5] = &unk_1000397B8;
    uint64_t v6 = _Block_copy(v0 + 2);
    [v26 _presentAlertWithTitle:v3 message:v4 buttonTitle:v5 completion:v6];
    _Block_release(v6);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = (void *)v0[29];
  sub_1000305C0();
  id v8 = v7;
  uint64_t v9 = sub_100030620();
  os_log_type_t v10 = sub_100030D60();
  BOOL v11 = os_log_type_enabled(v9, v10);
  unint64_t v12 = (void *)v0[29];
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    v0[11] = v12;
    id v15 = v12;
    sub_100030DA0();
    void *v14 = v12;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Did present Family invite: %@", v13, 0xCu);
    sub_100006E88(&qword_10003CC58);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v16 = v0[29];
  }
  else
  {

    uint64_t v16 = v0[29];
    uint64_t v9 = v16;
  }
  uint64_t v18 = v0[26];
  uint64_t v17 = v0[27];
  uint64_t v19 = v0[25];
  uint64_t v21 = v0[21];
  uint64_t v20 = v0[22];
  uint64_t v22 = v0[20];

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  id v23 = [v16 success];

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(id))v0[1];
  return v24(v23);
}

uint64_t sub_100018E7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000190D0();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1000309F0();
  int v6 = *(unsigned __int8 *)(a1 + 232);
  char v7 = v5;
  uint64_t v26 = v9;
  uint64_t v27 = v8;
  uint64_t v25 = v4;
  switch(*(unsigned char *)(a1 + 232))
  {
    case 2:
      swift_bridgeObjectRelease();
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      goto LABEL_11;
    default:
      char v12 = v5;
      char v13 = sub_100030ED0();
      swift_bridgeObjectRelease();
      if (v13)
      {
        uint64_t v11 = 0;
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 160);
        uint64_t v10 = *(void *)(a1 + 168);
        swift_bridgeObjectRetain();
      }
      char v7 = v12;
      if (v6 == 1)
      {
        uint64_t v14 = sub_100030A90();
        goto LABEL_10;
      }
      if (!v6)
      {
        uint64_t v14 = sub_100030AB0();
LABEL_10:
        uint64_t v15 = v14;
        goto LABEL_12;
      }
LABEL_11:
      uint64_t v15 = sub_100030AA0();
LABEL_12:
      uint64_t v16 = v7 & 1;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1000309F0();
      uint64_t v19 = v18;
      char v21 = v20;
      uint64_t v23 = v22;
      uint64_t result = sub_100017DC0(a1, type metadata accessor for InviteMessageView);
      *(void *)a2 = v25;
      *(void *)(a2 + 8) = v27;
      *(void *)(a2 + 16) = v16;
      *(void *)(a2 + 24) = v26;
      *(void *)(a2 + 32) = v11;
      *(void *)(a2 + 40) = v10;
      *(void *)(a2 + 48) = v15;
      *(void *)(a2 + 56) = v17;
      *(void *)(a2 + 64) = v19;
      *(unsigned char *)(a2 + 72) = v21 & 1;
      *(void *)(a2 + 80) = v23;
      return result;
  }
}

unint64_t sub_1000190D0()
{
  unint64_t result = qword_10003CA78;
  if (!qword_10003CA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CA78);
  }
  return result;
}

uint64_t sub_100019124(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

void *initializeBufferWithCopyOfBuffer for InviteLoadingView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InviteLoadingView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for InviteLoadingView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for InviteLoadingView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InviteLoadingView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InviteLoadingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for InviteLoadingView()
{
  return &type metadata for InviteLoadingView;
}

uint64_t sub_100019278(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for InviteMessageView(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *(void *)a1 = *a2;
    a1 = v27 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v60 = (int *)v4;
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v12;
    uint64_t v13 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v13;
    uint64_t v14 = a2[17];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v14;
    uint64_t v15 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v15;
    uint64_t v16 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v16;
    uint64_t v17 = a2[23];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = v17;
    uint64_t v18 = a2[25];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = v18;
    uint64_t v19 = a2[27];
    *(void *)(a1 + 208) = a2[26];
    *(void *)(a1 + 216) = v19;
    *(void *)(a1 + 224) = a2[28];
    *(unsigned char *)(a1 + 232) = *((unsigned char *)a2 + 232);
    *(unsigned char *)(a1 + 233) = *((unsigned char *)a2 + 233);
    *(unsigned char *)(a1 + 234) = *((unsigned char *)a2 + 234);
    uint64_t v20 = a2[31];
    *(void *)(a1 + 240) = a2[30];
    *(void *)(a1 + 248) = v20;
    uint64_t v21 = a2[33];
    *(void *)(a1 + 256) = a2[32];
    *(void *)(a1 + 264) = v21;
    uint64_t v59 = (int *)type metadata accessor for InviteMessageDetails();
    uint64_t v22 = v59[24];
    __dst = (void *)(a1 + v22);
    uint64_t v57 = (char *)a2 + v22;
    uint64_t v23 = sub_1000304E0();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48);
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v25(v57, 1, v23))
    {
      uint64_t v26 = sub_100006E88(&qword_10003C868);
      memcpy(__dst, v57, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 16))(__dst, v57, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
    }
    uint64_t v28 = v59[25];
    uint64_t v29 = (void *)(a1 + v28);
    uint64_t v30 = (char *)a2 + v28;
    if (v25((char *)a2 + v28, 1, v23))
    {
      uint64_t v31 = sub_100006E88(&qword_10003C868);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v29, v30, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v29, 0, 1, v23);
    }
    uint64_t v32 = v59[26];
    uint64_t v33 = (void *)(a1 + v32);
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = sub_100030510();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v37 = sub_100006E88(&qword_10003C7F0);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    *(unsigned char *)(a1 + v59[27]) = *((unsigned char *)a2 + v59[27]);
    uint64_t v38 = v60[5];
    uint64_t v39 = a1 + v38;
    uint64_t v40 = (uint64_t)a2 + v38;
    *(void *)uint64_t v39 = *(void *)v40;
    *(unsigned char *)(v39 + 8) = *(unsigned char *)(v40 + 8);
    uint64_t v41 = v60[6];
    long long v42 = *(_OWORD *)((char *)a2 + v41);
    *(_OWORD *)(a1 + v41) = v42;
    uint64_t v43 = v60[7];
    uint64_t v44 = a1 + v43;
    uint64_t v45 = (uint64_t)a2 + v43;
    long long v46 = *(_OWORD *)((char *)a2 + v43 + 24);
    *(_OWORD *)(a1 + v43 + 24) = v46;
    uint64_t v47 = v46;
    uint64_t v48 = **(void (***)(uint64_t, uint64_t, uint64_t))(v46 - 8);
    id v49 = (id)v42;
    v48(v44, v45, v47);
    uint64_t v50 = v60[8];
    uint64_t v51 = a1 + v50;
    uint64_t v52 = (uint64_t)a2 + v50;
    *(unsigned char *)uint64_t v51 = *(unsigned char *)v52;
    *(void *)(v51 + 8) = *(void *)(v52 + 8);
    uint64_t v53 = v60[9];
    uint64_t v54 = a1 + v53;
    uint64_t v55 = (uint64_t)a2 + v53;
    *(unsigned char *)uint64_t v54 = *(unsigned char *)v55;
    *(void *)(v54 + 8) = *(void *)(v55 + 8);
    *(void *)(a1 + v60[10]) = *(uint64_t *)((char *)a2 + v60[10]);
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_1000197F0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v3 = a1 + v2[24];
  uint64_t v4 = sub_1000304E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  uint64_t v7 = a1 + v2[25];
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v8 = a1 + v2[26];
  uint64_t v9 = sub_100030510();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = type metadata accessor for InviteMessageView(0);

  sub_100008804(a1 + *(int *)(v11 + 28));
  swift_release();

  return swift_release();
}

uint64_t sub_100019A58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v17;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  uint64_t v19 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v19;
  uint64_t v20 = type metadata accessor for InviteMessageDetails();
  uint64_t v21 = *(int *)(v20 + 96);
  uint64_t v57 = (void *)(a1 + v21);
  uint64_t v58 = (int *)v20;
  uint64_t v56 = (const void *)(a2 + v21);
  uint64_t v22 = sub_1000304E0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v24(v56, 1, v22))
  {
    uint64_t v25 = sub_100006E88(&qword_10003C868);
    memcpy(v57, v56, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v57, v56, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v57, 0, 1, v22);
  }
  uint64_t v26 = v58[25];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  if (v24((const void *)(a2 + v26), 1, v22))
  {
    uint64_t v29 = sub_100006E88(&qword_10003C868);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v27, v28, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v22);
  }
  uint64_t v30 = v58[26];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = sub_100030510();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100006E88(&qword_10003C7F0);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  *(unsigned char *)(a1 + v58[27]) = *(unsigned char *)(a2 + v58[27]);
  uint64_t v36 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v37 = v36[5];
  uint64_t v38 = a1 + v37;
  uint64_t v39 = a2 + v37;
  *(void *)uint64_t v38 = *(void *)v39;
  *(unsigned char *)(v38 + 8) = *(unsigned char *)(v39 + 8);
  uint64_t v40 = v36[6];
  long long v41 = *(_OWORD *)(a2 + v40);
  *(_OWORD *)(a1 + v40) = v41;
  uint64_t v42 = v36[7];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  long long v45 = *(_OWORD *)(a2 + v42 + 24);
  *(_OWORD *)(a1 + v42 + 24) = v45;
  uint64_t v46 = v45;
  uint64_t v47 = **(void (***)(uint64_t, uint64_t, uint64_t))(v45 - 8);
  id v48 = (id)v41;
  v47(v43, v44, v46);
  uint64_t v49 = v36[8];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  *(unsigned char *)uint64_t v50 = *(unsigned char *)v51;
  *(void *)(v50 + 8) = *(void *)(v51 + 8);
  uint64_t v52 = v36[9];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  *(unsigned char *)uint64_t v53 = *(unsigned char *)v54;
  *(void *)(v53 + 8) = *(void *)(v54 + 8);
  *(void *)(a1 + v36[10]) = *(void *)(a2 + v36[10]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100019F7C(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v5 = v4[24];
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = sub_1000304E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v6, v8);
LABEL_6:
    uint64_t v13 = sub_100006E88(&qword_10003C868);
    memcpy(v6, v7, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v6, v7, v8);
LABEL_7:
  uint64_t v14 = v4[25];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  int v17 = v10((void *)(a1 + v14), 1, v8);
  int v18 = v10(v16, 1, v8);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v15, v16, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v15, 0, 1, v8);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v15, v8);
LABEL_12:
    uint64_t v19 = sub_100006E88(&qword_10003C868);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v15, v16, v8);
LABEL_13:
  uint64_t v20 = v4[26];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = sub_100030510();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_18;
  }
  if (v27)
  {
LABEL_18:
    uint64_t v28 = sub_100006E88(&qword_10003C7F0);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_19:
  *(unsigned char *)(a1 + v4[27]) = *(unsigned char *)(a2 + v4[27]);
  uint64_t v29 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v30 = v29[5];
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  char v33 = *(unsigned char *)(v32 + 8);
  *(void *)uint64_t v31 = *(void *)v32;
  *(unsigned char *)(v31 + 8) = v33;
  uint64_t v34 = v29[6];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  uint64_t v37 = *(void **)v36;
  uint64_t v38 = *(void *)(v36 + 8);
  uint64_t v39 = *(void **)v35;
  *(void *)uint64_t v35 = *(void *)v36;
  id v40 = v37;

  *(void *)(v35 + 8) = v38;
  sub_100009CA8((uint64_t *)(a1 + v29[7]), (uint64_t *)(a2 + v29[7]));
  uint64_t v41 = v29[8];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  *(unsigned char *)uint64_t v42 = *(unsigned char *)v43;
  *(void *)(v42 + 8) = *(void *)(v43 + 8);
  swift_retain();
  swift_release();
  uint64_t v44 = v29[9];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
  *(void *)(v45 + 8) = *(void *)(v46 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + v29[10]) = *(void *)(a2 + v29[10]);
  return a1;
}

uint64_t sub_10001A644(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  long long v9 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v9;
  long long v10 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v10;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  long long v11 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v11;
  int v12 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v13 = v12[24];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_1000304E0();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  if (v18(v15, 1, v16))
  {
    uint64_t v19 = sub_100006E88(&qword_10003C868);
    memcpy(v14, v15, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v20 = v12[25];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  if (v18((const void *)(a2 + v20), 1, v16))
  {
    uint64_t v23 = sub_100006E88(&qword_10003C868);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v21, v22, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v21, 0, 1, v16);
  }
  uint64_t v24 = v12[26];
  uint64_t v25 = (void *)(a1 + v24);
  int v26 = (const void *)(a2 + v24);
  uint64_t v27 = sub_100030510();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = sub_100006E88(&qword_10003C7F0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  *(unsigned char *)(a1 + v12[27]) = *(unsigned char *)(a2 + v12[27]);
  uint64_t v30 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v31 = v30[5];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  *(_OWORD *)(a1 + v30[6]) = *(_OWORD *)(a2 + v30[6]);
  uint64_t v34 = v30[7];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)(v35 + 32) = *(void *)(v36 + 32);
  long long v37 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
  *(_OWORD *)(v35 + 16) = v37;
  *(_OWORD *)(a1 + v30[8]) = *(_OWORD *)(a2 + v30[8]);
  *(_OWORD *)(a1 + v30[9]) = *(_OWORD *)(a2 + v30[9]);
  *(void *)(a1 + v30[10]) = *(void *)(a2 + v30[10]);
  return a1;
}

uint64_t sub_10001A9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v17;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v21 = v20[24];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_1000304E0();
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_6:
    uint64_t v29 = sub_100006E88(&qword_10003C868);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v22, v23, v24);
LABEL_7:
  uint64_t v30 = v20[25];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  int v33 = v26((void *)(a1 + v30), 1, v24);
  int v34 = v26(v32, 1, v24);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v31, v32, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v31, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v31, v24);
LABEL_12:
    uint64_t v35 = sub_100006E88(&qword_10003C868);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v31, v32, v24);
LABEL_13:
  uint64_t v36 = v20[26];
  long long v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  uint64_t v39 = sub_100030510();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v40 + 40))(v37, v38, v39);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v37, v39);
    goto LABEL_18;
  }
  if (v43)
  {
LABEL_18:
    uint64_t v44 = sub_100006E88(&qword_10003C7F0);
    memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v37, v38, v39);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
LABEL_19:
  *(unsigned char *)(a1 + v20[27]) = *(unsigned char *)(a2 + v20[27]);
  uint64_t v45 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v46 = v45[5];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  *(void *)uint64_t v47 = *(void *)v48;
  *(unsigned char *)(v47 + 8) = *(unsigned char *)(v48 + 8);
  uint64_t v49 = v45[6];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = (uint64_t *)(a2 + v49);
  uint64_t v52 = *v51;
  uint64_t v53 = v51[1];
  uint64_t v54 = *(void **)v50;
  *(void *)uint64_t v50 = v52;

  *(void *)(v50 + 8) = v53;
  uint64_t v55 = v45[7];
  uint64_t v56 = a1 + v55;
  uint64_t v57 = a2 + v55;
  sub_100008804(a1 + v55);
  long long v58 = *(_OWORD *)(v57 + 16);
  *(_OWORD *)uint64_t v56 = *(_OWORD *)v57;
  *(_OWORD *)(v56 + 16) = v58;
  *(void *)(v56 + 32) = *(void *)(v57 + 32);
  uint64_t v59 = v45[8];
  uint64_t v60 = a1 + v59;
  uint64_t v61 = a2 + v59;
  *(unsigned char *)uint64_t v60 = *(unsigned char *)v61;
  *(void *)(v60 + 8) = *(void *)(v61 + 8);
  swift_release();
  uint64_t v62 = v45[9];
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  *(unsigned char *)uint64_t v63 = *(unsigned char *)v64;
  *(void *)(v63 + 8) = *(void *)(v64 + 8);
  swift_release();
  *(void *)(a1 + v45[10]) = *(void *)(a2 + v45[10]);
  return a1;
}

uint64_t sub_10001AF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001AFA0);
}

uint64_t sub_10001AFA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InviteMessageView(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10001B00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B020);
}

uint64_t sub_10001B020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InviteMessageView(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10001B090()
{
  uint64_t result = type metadata accessor for InviteMessageView(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Subscription(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InviteStatusView(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_100017E74(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_release();
  sub_100017E74(*(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72));

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InviteStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = *(void *)(a2 + 8);
    char v7 = *(unsigned char *)(a2 + 16);
    sub_100019124(*(void *)a2, v6, v7);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(unsigned char *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 64);
  char v12 = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100019124(v10, v11, v12);
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = v12;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InviteStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24))
  {
    if (v4)
    {
      uint64_t v5 = *(void *)a2;
      uint64_t v6 = *(void *)(a2 + 8);
      char v7 = *(unsigned char *)(a2 + 16);
      sub_100019124(*(void *)a2, v6, v7);
      uint64_t v8 = *(void *)a1;
      uint64_t v9 = *(void *)(a1 + 8);
      char v10 = *(unsigned char *)(a1 + 16);
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = v6;
      *(unsigned char *)(a1 + 16) = v7;
      sub_100017E74(v8, v9, v10);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_10001B3D8(a1);
      long long v14 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v14;
    }
  }
  else if (v4)
  {
    uint64_t v11 = *(void *)a2;
    uint64_t v12 = *(void *)(a2 + 8);
    char v13 = *(unsigned char *)(a2 + 16);
    sub_100019124(*(void *)a2, v12, v13);
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v12;
    *(unsigned char *)(a1 + 16) = v13;
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v15;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  uint64_t v16 = *(void *)(a2 + 56);
  uint64_t v17 = *(void *)(a2 + 64);
  char v18 = *(unsigned char *)(a2 + 72);
  sub_100019124(v16, v17, v18);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  char v21 = *(unsigned char *)(a1 + 72);
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v17;
  *(unsigned char *)(a1 + 72) = v18;
  sub_100017E74(v19, v20, v21);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001B3D8(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for InviteStatusView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for InviteStatusView(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 24)) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void *)(a2 + 24);
  if (!v4)
  {
    sub_10001B3D8(a1);
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    goto LABEL_6;
  }
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100017E74(v6, v7, v8);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v10 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  char v11 = *(unsigned char *)(a2 + 72);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  char v14 = *(unsigned char *)(a1 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = v11;
  sub_100017E74(v12, v13, v14);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InviteStatusView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InviteStatusView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InviteStatusView()
{
  return &type metadata for InviteStatusView;
}

ValueMetadata *type metadata accessor for StackedSubscriptionsView()
{
  return &type metadata for StackedSubscriptionsView;
}

ValueMetadata *type metadata accessor for FamilyIconView()
{
  return &type metadata for FamilyIconView;
}

void *sub_10001B5E4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v12;
    uint64_t v13 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v13;
    uint64_t v14 = a2[17];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v14;
    uint64_t v15 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v15;
    uint64_t v16 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v16;
    uint64_t v17 = a2[23];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = v17;
    uint64_t v18 = a2[25];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = v18;
    uint64_t v19 = a2[27];
    *(void *)(a1 + 208) = a2[26];
    *(void *)(a1 + 216) = v19;
    *(void *)(a1 + 224) = a2[28];
    *(unsigned char *)(a1 + 232) = *((unsigned char *)a2 + 232);
    *(unsigned char *)(a1 + 233) = *((unsigned char *)a2 + 233);
    *(unsigned char *)(a1 + 234) = *((unsigned char *)a2 + 234);
    uint64_t v20 = a2[31];
    *(void *)(a1 + 240) = a2[30];
    *(void *)(a1 + 248) = v20;
    uint64_t v21 = a2[33];
    *(void *)(a1 + 256) = a2[32];
    *(void *)(a1 + 264) = v21;
    uint64_t v99 = (int *)type metadata accessor for InviteMessageDetails();
    uint64_t v22 = v99[24];
    uint64_t v95 = (char *)v4 + v22;
    long long v89 = (char *)a2 + v22;
    uint64_t v23 = sub_1000304E0();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v25(v89, 1, v23))
    {
      uint64_t v26 = sub_100006E88(&qword_10003C868);
      memcpy(v95, v89, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v95, v89, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v95, 0, 1, v23);
    }
    uint64_t v28 = v99[25];
    uint64_t v29 = (char *)v4 + v28;
    uint64_t v30 = (char *)a2 + v28;
    char v96 = (unsigned int (*)(const void *, uint64_t, uint64_t))v25;
    if (v25((char *)a2 + v28, 1, v23))
    {
      uint64_t v31 = sub_100006E88(&qword_10003C868);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v29, v30, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v29, 0, 1, v23);
    }
    uint64_t v32 = v99[26];
    int v33 = (char *)v4 + v32;
    int v34 = (char *)a2 + v32;
    uint64_t v35 = sub_100030510();
    uint64_t v36 = *(void *)(v35 - 8);
    long long v90 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    uint64_t v97 = v24;
    uint64_t v98 = v23;
    uint64_t v94 = v35;
    uint64_t v91 = v36;
    if (v90(v34, 1, v35))
    {
      uint64_t v37 = sub_100006E88(&qword_10003C7F0);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    *((unsigned char *)v4 + v99[27]) = *((unsigned char *)a2 + v99[27]);
    uint64_t v38 = (int *)type metadata accessor for InviteMessageView(0);
    uint64_t v39 = v38[5];
    uint64_t v40 = (char *)v4 + v39;
    uint64_t v41 = (uint64_t)a2 + v39;
    *(void *)uint64_t v40 = *(void *)v41;
    v40[8] = *(unsigned char *)(v41 + 8);
    uint64_t v42 = v38[6];
    long long v43 = *(_OWORD *)((char *)a2 + v42);
    *(_OWORD *)((char *)v4 + v42) = v43;
    uint64_t v44 = v38[7];
    uint64_t v45 = (char *)v4 + v44;
    uint64_t v46 = (uint64_t)a2 + v44;
    long long v47 = *(_OWORD *)((char *)a2 + v44 + 24);
    *(_OWORD *)((char *)v4 + v44 + 24) = v47;
    uint64_t v48 = v47;
    uint64_t v49 = **(void (***)(char *, uint64_t, uint64_t))(v47 - 8);
    id v50 = (id)v43;
    v49(v45, v46, v48);
    uint64_t v51 = v38[8];
    uint64_t v52 = (char *)v4 + v51;
    uint64_t v53 = (char *)a2 + v51;
    *uint64_t v52 = *v53;
    *((void *)v52 + 1) = *((void *)v53 + 1);
    uint64_t v54 = v38[9];
    uint64_t v55 = (char *)v4 + v54;
    uint64_t v56 = (char *)a2 + v54;
    *uint64_t v55 = *v56;
    *((void *)v55 + 1) = *((void *)v56 + 1);
    *(void *)((char *)v4 + v38[10]) = *(uint64_t *)((char *)a2 + v38[10]);
    uint64_t v57 = *(int *)(a3 + 20);
    long long v58 = (char *)v4 + v57;
    uint64_t v59 = (uint64_t)a2 + v57;
    uint64_t v60 = *(void *)(v59 + 8);
    *(void *)long long v58 = *(void *)v59;
    *((void *)v58 + 1) = v60;
    uint64_t v61 = *(void *)(v59 + 24);
    *((void *)v58 + 2) = *(void *)(v59 + 16);
    *((void *)v58 + 3) = v61;
    uint64_t v62 = *(void *)(v59 + 40);
    *((void *)v58 + 4) = *(void *)(v59 + 32);
    *((void *)v58 + 5) = v62;
    uint64_t v63 = *(void *)(v59 + 56);
    *((void *)v58 + 6) = *(void *)(v59 + 48);
    *((void *)v58 + 7) = v63;
    uint64_t v64 = *(void *)(v59 + 72);
    *((void *)v58 + 8) = *(void *)(v59 + 64);
    *((void *)v58 + 9) = v64;
    uint64_t v65 = *(void *)(v59 + 88);
    *((void *)v58 + 10) = *(void *)(v59 + 80);
    *((void *)v58 + 11) = v65;
    uint64_t v66 = *(void *)(v59 + 104);
    *((void *)v58 + 12) = *(void *)(v59 + 96);
    *((void *)v58 + 13) = v66;
    uint64_t v67 = *(void *)(v59 + 120);
    *((void *)v58 + 14) = *(void *)(v59 + 112);
    *((void *)v58 + 15) = v67;
    uint64_t v68 = *(void *)(v59 + 136);
    *((void *)v58 + 16) = *(void *)(v59 + 128);
    *((void *)v58 + 17) = v68;
    uint64_t v69 = *(void *)(v59 + 152);
    *((void *)v58 + 18) = *(void *)(v59 + 144);
    *((void *)v58 + 19) = v69;
    uint64_t v70 = *(void *)(v59 + 168);
    *((void *)v58 + 20) = *(void *)(v59 + 160);
    *((void *)v58 + 21) = v70;
    uint64_t v71 = *(void *)(v59 + 184);
    *((void *)v58 + 22) = *(void *)(v59 + 176);
    *((void *)v58 + 23) = v71;
    uint64_t v72 = *(void *)(v59 + 200);
    *((void *)v58 + 24) = *(void *)(v59 + 192);
    *((void *)v58 + 25) = v72;
    uint64_t v73 = *(void *)(v59 + 216);
    *((void *)v58 + 26) = *(void *)(v59 + 208);
    *((void *)v58 + 27) = v73;
    *((void *)v58 + 28) = *(void *)(v59 + 224);
    v58[232] = *(unsigned char *)(v59 + 232);
    v58[233] = *(unsigned char *)(v59 + 233);
    v58[234] = *(unsigned char *)(v59 + 234);
    uint64_t v74 = *(void *)(v59 + 248);
    *((void *)v58 + 30) = *(void *)(v59 + 240);
    *((void *)v58 + 31) = v74;
    uint64_t v75 = *(void *)(v59 + 264);
    *((void *)v58 + 32) = *(void *)(v59 + 256);
    *((void *)v58 + 33) = v75;
    uint64_t v76 = v99[24];
    __dsta = &v58[v76];
    Swift::String v88 = (const void *)(v59 + v76);
    swift_retain();
    swift_retain();
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v96(v88, 1, v98))
    {
      uint64_t v77 = sub_100006E88(&qword_10003C868);
      memcpy(__dsta, v88, *(void *)(*(void *)(v77 - 8) + 64));
      uint64_t v78 = v97;
    }
    else
    {
      uint64_t v78 = v97;
      (*(void (**)(char *, const void *, uint64_t))(v97 + 16))(__dsta, v88, v98);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v97 + 56))(__dsta, 0, 1, v98);
    }
    uint64_t v79 = v99[25];
    Swift::String v80 = &v58[v79];
    Swift::String_optional v81 = (const void *)(v59 + v79);
    if (v96((const void *)(v59 + v79), 1, v98))
    {
      uint64_t v82 = sub_100006E88(&qword_10003C868);
      memcpy(v80, v81, *(void *)(*(void *)(v82 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v78 + 16))(v80, v81, v98);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v78 + 56))(v80, 0, 1, v98);
    }
    uint64_t v83 = v99[26];
    Swift::String_optional v84 = &v58[v83];
    Swift::String v85 = (const void *)(v59 + v83);
    if (v90((char *)(v59 + v83), 1, v94))
    {
      uint64_t v86 = sub_100006E88(&qword_10003C7F0);
      memcpy(v84, v85, *(void *)(*(void *)(v86 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v91 + 16))(v84, v85, v94);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v91 + 56))(v84, 0, 1, v94);
    }
    v58[v99[27]] = *(unsigned char *)(v59 + v99[27]);
  }
  return v4;
}

uint64_t sub_10001BEEC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v4 = a1 + v3[24];
  uint64_t v5 = sub_1000304E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + v3[25];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v9 = a1 + v3[26];
  uint64_t v10 = sub_100030510();
  uint64_t v19 = *(void *)(v10 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  if (!v11(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v9, v10);
  }
  uint64_t v12 = type metadata accessor for InviteMessageView(0);

  sub_100008804(a1 + *(int *)(v12 + 28));
  swift_release();
  swift_release();
  uint64_t v13 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v13 + v3[24];
  if (!v7(v14, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v14, v5);
  }
  uint64_t v15 = v13 + v3[25];
  if (!v7(v15, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v15, v5);
  }
  uint64_t v16 = v13 + v3[26];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(v16, 1, v10);
  if (!result)
  {
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8);
    return v18(v16, v10);
  }
  return result;
}

uint64_t sub_10001C2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v90 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v90;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  uint64_t v12 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  uint64_t v13 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v13;
  uint64_t v14 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v14;
  uint64_t v15 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v15;
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  uint64_t v17 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v17;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v18 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v18;
  uint64_t v19 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v19;
  uint64_t v97 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v20 = v97[24];
  uint64_t v93 = (void *)(a1 + v20);
  uint64_t v86 = (const void *)(a2 + v20);
  uint64_t v21 = sub_1000304E0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23(v86, 1, v21))
  {
    uint64_t v24 = sub_100006E88(&qword_10003C868);
    memcpy(v93, v86, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v93, v86, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v93, 0, 1, v21);
  }
  uint64_t v25 = v97[25];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  uint64_t v94 = v23;
  if (v23((const void *)(a2 + v25), 1, v21))
  {
    uint64_t v28 = sub_100006E88(&qword_10003C868);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v26, v27, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v26, 0, 1, v21);
  }
  uint64_t v29 = v97[26];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (const void *)(a2 + v29);
  uint64_t v32 = sub_100030510();
  uint64_t v33 = *(void *)(v32 - 8);
  Swift::String v87 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48);
  uint64_t v95 = v22;
  uint64_t v96 = v21;
  uint64_t v91 = v33;
  uint64_t v92 = v32;
  if (v87(v31, 1, v32))
  {
    uint64_t v34 = sub_100006E88(&qword_10003C7F0);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v30, v31, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  *(unsigned char *)(a1 + v97[27]) = *(unsigned char *)(a2 + v97[27]);
  uint64_t v35 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v36 = v35[5];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(void *)uint64_t v37 = *(void *)v38;
  *(unsigned char *)(v37 + 8) = *(unsigned char *)(v38 + 8);
  uint64_t v39 = v35[6];
  long long v40 = *(_OWORD *)(a2 + v39);
  *(_OWORD *)(a1 + v39) = v40;
  uint64_t v41 = v35[7];
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  long long v44 = *(_OWORD *)(a2 + v41 + 24);
  *(_OWORD *)(a1 + v41 + 24) = v44;
  uint64_t v45 = v44;
  uint64_t v46 = **(void (***)(uint64_t, uint64_t, uint64_t))(v44 - 8);
  id v47 = (id)v40;
  v46(v42, v43, v45);
  uint64_t v48 = v35[8];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  *(unsigned char *)uint64_t v49 = *(unsigned char *)v50;
  *(void *)(v49 + 8) = *(void *)(v50 + 8);
  uint64_t v51 = v35[9];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = a2 + v51;
  *(unsigned char *)uint64_t v52 = *(unsigned char *)v53;
  *(void *)(v52 + 8) = *(void *)(v53 + 8);
  *(void *)(a1 + v35[10]) = *(void *)(a2 + v35[10]);
  uint64_t v54 = *(int *)(a3 + 20);
  uint64_t v55 = a1 + v54;
  uint64_t v56 = a2 + v54;
  uint64_t v57 = *(void *)(v56 + 8);
  *(void *)uint64_t v55 = *(void *)v56;
  *(void *)(v55 + 8) = v57;
  uint64_t v58 = *(void *)(v56 + 24);
  *(void *)(v55 + 16) = *(void *)(v56 + 16);
  *(void *)(v55 + 24) = v58;
  uint64_t v59 = *(void *)(v56 + 40);
  *(void *)(v55 + 32) = *(void *)(v56 + 32);
  *(void *)(v55 + 40) = v59;
  uint64_t v60 = *(void *)(v56 + 56);
  *(void *)(v55 + 48) = *(void *)(v56 + 48);
  *(void *)(v55 + 56) = v60;
  uint64_t v61 = *(void *)(v56 + 72);
  *(void *)(v55 + 64) = *(void *)(v56 + 64);
  *(void *)(v55 + 72) = v61;
  uint64_t v62 = *(void *)(v56 + 88);
  *(void *)(v55 + 80) = *(void *)(v56 + 80);
  *(void *)(v55 + 88) = v62;
  uint64_t v63 = *(void *)(v56 + 104);
  *(void *)(v55 + 96) = *(void *)(v56 + 96);
  *(void *)(v55 + 104) = v63;
  uint64_t v64 = *(void *)(v56 + 120);
  *(void *)(v55 + 112) = *(void *)(v56 + 112);
  *(void *)(v55 + 120) = v64;
  uint64_t v65 = *(void *)(v56 + 136);
  *(void *)(v55 + 128) = *(void *)(v56 + 128);
  *(void *)(v55 + 136) = v65;
  uint64_t v66 = *(void *)(v56 + 152);
  *(void *)(v55 + 144) = *(void *)(v56 + 144);
  *(void *)(v55 + 152) = v66;
  uint64_t v67 = *(void *)(v56 + 168);
  *(void *)(v55 + 160) = *(void *)(v56 + 160);
  *(void *)(v55 + 168) = v67;
  uint64_t v68 = *(void *)(v56 + 184);
  *(void *)(v55 + 176) = *(void *)(v56 + 176);
  *(void *)(v55 + 184) = v68;
  uint64_t v69 = *(void *)(v56 + 200);
  *(void *)(v55 + 192) = *(void *)(v56 + 192);
  *(void *)(v55 + 200) = v69;
  uint64_t v70 = *(void *)(v56 + 216);
  *(void *)(v55 + 208) = *(void *)(v56 + 208);
  *(void *)(v55 + 216) = v70;
  *(void *)(v55 + 224) = *(void *)(v56 + 224);
  *(unsigned char *)(v55 + 232) = *(unsigned char *)(v56 + 232);
  *(unsigned char *)(v55 + 233) = *(unsigned char *)(v56 + 233);
  *(unsigned char *)(v55 + 234) = *(unsigned char *)(v56 + 234);
  uint64_t v71 = *(void *)(v56 + 248);
  *(void *)(v55 + 240) = *(void *)(v56 + 240);
  *(void *)(v55 + 248) = v71;
  uint64_t v72 = *(void *)(v56 + 264);
  *(void *)(v55 + 256) = *(void *)(v56 + 256);
  *(void *)(v55 + 264) = v72;
  uint64_t v73 = v97[24];
  __dsta = (void *)(v55 + v73);
  Swift::String v85 = (const void *)(v56 + v73);
  swift_retain();
  swift_retain();
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v94(v85, 1, v96))
  {
    uint64_t v74 = sub_100006E88(&qword_10003C868);
    memcpy(__dsta, v85, *(void *)(*(void *)(v74 - 8) + 64));
    uint64_t v75 = v95;
  }
  else
  {
    uint64_t v75 = v95;
    (*(void (**)(void *, const void *, uint64_t))(v95 + 16))(__dsta, v85, v96);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v95 + 56))(__dsta, 0, 1, v96);
  }
  uint64_t v76 = v97[25];
  uint64_t v77 = (void *)(v55 + v76);
  uint64_t v78 = (const void *)(v56 + v76);
  if (v94((const void *)(v56 + v76), 1, v96))
  {
    uint64_t v79 = sub_100006E88(&qword_10003C868);
    memcpy(v77, v78, *(void *)(*(void *)(v79 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v75 + 16))(v77, v78, v96);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(v77, 0, 1, v96);
  }
  uint64_t v80 = v97[26];
  Swift::String_optional v81 = (void *)(v55 + v80);
  uint64_t v82 = (const void *)(v56 + v80);
  if (v87((const void *)(v56 + v80), 1, v92))
  {
    uint64_t v83 = sub_100006E88(&qword_10003C7F0);
    memcpy(v81, v82, *(void *)(*(void *)(v83 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v91 + 16))(v81, v82, v92);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v91 + 56))(v81, 0, 1, v92);
  }
  *(unsigned char *)(v55 + v97[27]) = *(unsigned char *)(v56 + v97[27]);
  return a1;
}

uint64_t sub_10001CB90(uint64_t a1, uint64_t a2, uint64_t a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v75 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v5 = v75[24];
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = sub_1000304E0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v6, v8);
LABEL_6:
    uint64_t v13 = sub_100006E88(&qword_10003C868);
    memcpy(v6, v7, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v6, v7, v8);
LABEL_7:
  uint64_t v14 = v75[25];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  int v17 = v10((void *)(a1 + v14), 1, v8);
  int v18 = v10(v16, 1, v8);
  uint64_t v74 = v9;
  uint64_t v71 = v10;
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v15, v16, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v15, 0, 1, v8);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v15, v8);
LABEL_12:
    uint64_t v19 = sub_100006E88(&qword_10003C868);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v15, v16, v8);
LABEL_13:
  uint64_t v20 = v75[26];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = sub_100030510();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  uint64_t v72 = v25;
  int v27 = v25(v22, 1, v23);
  uint64_t v70 = v24;
  if (v26)
  {
    if (v27)
    {
      uint64_t v28 = sub_100006E88(&qword_10003C7F0);
      memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
      uint64_t v29 = v23;
    }
    else
    {
      uint64_t v29 = v23;
      (*(void (**)(void *, void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
  }
  else
  {
    uint64_t v29 = v23;
    if (v27)
    {
      (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
      uint64_t v30 = sub_100006E88(&qword_10003C7F0);
      memcpy(v21, v22, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v24 + 24))(v21, v22, v23);
    }
  }
  *(unsigned char *)(a1 + v75[27]) = *(unsigned char *)(a2 + v75[27]);
  uint64_t v31 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v32 = v31[5];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  char v35 = *(unsigned char *)(v34 + 8);
  *(void *)uint64_t v33 = *(void *)v34;
  *(unsigned char *)(v33 + 8) = v35;
  uint64_t v36 = v31[6];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = *(void **)v38;
  uint64_t v40 = *(void *)(v38 + 8);
  uint64_t v41 = *(void **)v37;
  *(void *)uint64_t v37 = *(void *)v38;
  id v42 = v39;

  *(void *)(v37 + 8) = v40;
  sub_100009CA8((uint64_t *)(a1 + v31[7]), (uint64_t *)(a2 + v31[7]));
  uint64_t v43 = v31[8];
  uint64_t v44 = a1 + v43;
  uint64_t v45 = a2 + v43;
  *(unsigned char *)uint64_t v44 = *(unsigned char *)v45;
  *(void *)(v44 + 8) = *(void *)(v45 + 8);
  swift_retain();
  swift_release();
  uint64_t v46 = v31[9];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  *(unsigned char *)uint64_t v47 = *(unsigned char *)v48;
  *(void *)(v47 + 8) = *(void *)(v48 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + v31[10]) = *(void *)(a2 + v31[10]);
  uint64_t v49 = *(int *)(a3 + 20);
  uint64_t v50 = a1 + v49;
  uint64_t v51 = a2 + v49;
  *(void *)uint64_t v50 = *(void *)(a2 + v49);
  *(void *)(v50 + 8) = *(void *)(a2 + v49 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 16) = *(void *)(v51 + 16);
  *(void *)(v50 + 24) = *(void *)(v51 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 32) = *(void *)(v51 + 32);
  *(void *)(v50 + 40) = *(void *)(v51 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 48) = *(void *)(v51 + 48);
  *(void *)(v50 + 56) = *(void *)(v51 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 64) = *(void *)(v51 + 64);
  *(void *)(v50 + 72) = *(void *)(v51 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 80) = *(void *)(v51 + 80);
  *(void *)(v50 + 88) = *(void *)(v51 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 96) = *(void *)(v51 + 96);
  *(void *)(v50 + 104) = *(void *)(v51 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 112) = *(void *)(v51 + 112);
  *(void *)(v50 + 120) = *(void *)(v51 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 128) = *(void *)(v51 + 128);
  *(void *)(v50 + 136) = *(void *)(v51 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 144) = *(void *)(v51 + 144);
  *(void *)(v50 + 152) = *(void *)(v51 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 160) = *(void *)(v51 + 160);
  *(void *)(v50 + 168) = *(void *)(v51 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 176) = *(void *)(v51 + 176);
  *(void *)(v50 + 184) = *(void *)(v51 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 192) = *(void *)(v51 + 192);
  *(void *)(v50 + 200) = *(void *)(v51 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 208) = *(void *)(v51 + 208);
  *(void *)(v50 + 216) = *(void *)(v51 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 224) = *(void *)(v51 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v50 + 232) = *(unsigned char *)(v51 + 232);
  *(unsigned char *)(v50 + 233) = *(unsigned char *)(v51 + 233);
  *(unsigned char *)(v50 + 234) = *(unsigned char *)(v51 + 234);
  *(void *)(v50 + 240) = *(void *)(v51 + 240);
  *(void *)(v50 + 248) = *(void *)(v51 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v50 + 256) = *(void *)(v51 + 256);
  *(void *)(v50 + 264) = *(void *)(v51 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v52 = v75[24];
  uint64_t v53 = (void *)(v50 + v52);
  uint64_t v54 = (void *)(v51 + v52);
  LODWORD(v31) = v71((void *)(v50 + v52), 1, v8);
  int v55 = v71(v54, 1, v8);
  if (v31)
  {
    if (!v55)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 16))(v53, v54, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v53, 0, 1, v8);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v55)
  {
    (*(void (**)(void *, uint64_t))(v74 + 8))(v53, v8);
LABEL_27:
    uint64_t v56 = sub_100006E88(&qword_10003C868);
    memcpy(v53, v54, *(void *)(*(void *)(v56 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 24))(v53, v54, v8);
LABEL_28:
  uint64_t v57 = v75[25];
  uint64_t v58 = (void *)(v50 + v57);
  uint64_t v59 = (void *)(v51 + v57);
  int v60 = v71((void *)(v50 + v57), 1, v8);
  int v61 = v71(v59, 1, v8);
  if (v60)
  {
    if (!v61)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 16))(v58, v59, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v58, 0, 1, v8);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v61)
  {
    (*(void (**)(void *, uint64_t))(v74 + 8))(v58, v8);
LABEL_33:
    uint64_t v62 = sub_100006E88(&qword_10003C868);
    memcpy(v58, v59, *(void *)(*(void *)(v62 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 24))(v58, v59, v8);
LABEL_34:
  uint64_t v63 = v75[26];
  uint64_t v64 = (void *)(v50 + v63);
  uint64_t v65 = (void *)(v51 + v63);
  int v66 = v72((void *)(v50 + v63), 1, v29);
  int v67 = v72(v65, 1, v29);
  if (!v66)
  {
    if (!v67)
    {
      (*(void (**)(void *, void *, uint64_t))(v70 + 24))(v64, v65, v29);
      goto LABEL_40;
    }
    (*(void (**)(void *, uint64_t))(v70 + 8))(v64, v29);
    goto LABEL_39;
  }
  if (v67)
  {
LABEL_39:
    uint64_t v68 = sub_100006E88(&qword_10003C7F0);
    memcpy(v64, v65, *(void *)(*(void *)(v68 - 8) + 64));
    goto LABEL_40;
  }
  (*(void (**)(void *, void *, uint64_t))(v70 + 16))(v64, v65, v29);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v70 + 56))(v64, 0, 1, v29);
LABEL_40:
  *(unsigned char *)(v50 + v75[27]) = *(unsigned char *)(v51 + v75[27]);
  return a1;
}

uint64_t sub_10001D850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  long long v9 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  long long v10 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v10;
  long long v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  long long v12 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v12;
  uint64_t v13 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v14 = v13[24];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_1000304E0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v65 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v65(v16, 1, v17))
  {
    uint64_t v19 = sub_100006E88(&qword_10003C868);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v20 = v13[25];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (const void *)(a2 + v20);
  if (v65((const void *)(a2 + v20), 1, v17))
  {
    uint64_t v23 = sub_100006E88(&qword_10003C868);
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v21, v22, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v21, 0, 1, v17);
  }
  uint64_t v24 = v13[26];
  uint64_t v25 = (void *)(a1 + v24);
  int v26 = (const void *)(a2 + v24);
  uint64_t v27 = sub_100030510();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v62 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48);
  uint64_t v64 = v28;
  if (v62(v26, 1, v27))
  {
    uint64_t v29 = sub_100006E88(&qword_10003C7F0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 32))(v25, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  *(unsigned char *)(a1 + v13[27]) = *(unsigned char *)(a2 + v13[27]);
  uint64_t v30 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v31 = v30[5];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = a2 + v31;
  *(void *)uint64_t v32 = *(void *)v33;
  *(unsigned char *)(v32 + 8) = *(unsigned char *)(v33 + 8);
  *(_OWORD *)(a1 + v30[6]) = *(_OWORD *)(a2 + v30[6]);
  uint64_t v34 = v30[7];
  uint64_t v35 = a1 + v34;
  uint64_t v36 = a2 + v34;
  *(void *)(v35 + 32) = *(void *)(v36 + 32);
  long long v37 = *(_OWORD *)(v36 + 16);
  *(_OWORD *)uint64_t v35 = *(_OWORD *)v36;
  *(_OWORD *)(v35 + 16) = v37;
  *(_OWORD *)(a1 + v30[8]) = *(_OWORD *)(a2 + v30[8]);
  *(_OWORD *)(a1 + v30[9]) = *(_OWORD *)(a2 + v30[9]);
  *(void *)(a1 + v30[10]) = *(void *)(a2 + v30[10]);
  uint64_t v38 = *(int *)(a3 + 20);
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  long long v41 = *(_OWORD *)(a2 + v38 + 16);
  *(_OWORD *)uint64_t v39 = *(_OWORD *)(a2 + v38);
  *(_OWORD *)(v39 + 16) = v41;
  long long v42 = *(_OWORD *)(a2 + v38 + 48);
  *(_OWORD *)(v39 + 32) = *(_OWORD *)(a2 + v38 + 32);
  *(_OWORD *)(v39 + 48) = v42;
  long long v43 = *(_OWORD *)(a2 + v38 + 80);
  *(_OWORD *)(v39 + 64) = *(_OWORD *)(a2 + v38 + 64);
  *(_OWORD *)(v39 + 80) = v43;
  long long v44 = *(_OWORD *)(a2 + v38 + 112);
  *(_OWORD *)(v39 + 96) = *(_OWORD *)(a2 + v38 + 96);
  *(_OWORD *)(v39 + 112) = v44;
  long long v45 = *(_OWORD *)(a2 + v38 + 144);
  *(_OWORD *)(v39 + 128) = *(_OWORD *)(a2 + v38 + 128);
  *(_OWORD *)(v39 + 144) = v45;
  long long v46 = *(_OWORD *)(a2 + v38 + 176);
  *(_OWORD *)(v39 + 160) = *(_OWORD *)(a2 + v38 + 160);
  *(_OWORD *)(v39 + 176) = v46;
  long long v47 = *(_OWORD *)(a2 + v38 + 208);
  *(_OWORD *)(v39 + 192) = *(_OWORD *)(a2 + v38 + 192);
  *(_OWORD *)(v39 + 208) = v47;
  *(void *)(v39 + 224) = *(void *)(a2 + v38 + 224);
  *(unsigned char *)(v39 + 232) = *(unsigned char *)(a2 + v38 + 232);
  *(unsigned char *)(v39 + 233) = *(unsigned char *)(a2 + v38 + 233);
  *(unsigned char *)(v39 + 234) = *(unsigned char *)(a2 + v38 + 234);
  long long v48 = *(_OWORD *)(a2 + v38 + 256);
  *(_OWORD *)(v39 + 240) = *(_OWORD *)(a2 + v38 + 240);
  *(_OWORD *)(v39 + 256) = v48;
  uint64_t v49 = v13[24];
  uint64_t v50 = (void *)(v39 + v49);
  uint64_t v51 = (const void *)(v40 + v49);
  if (v65((const void *)(v40 + v49), 1, v17))
  {
    uint64_t v52 = sub_100006E88(&qword_10003C868);
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v50, v51, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v50, 0, 1, v17);
  }
  uint64_t v53 = v13[25];
  uint64_t v54 = (void *)(v39 + v53);
  int v55 = (const void *)(v40 + v53);
  if (v65((const void *)(v40 + v53), 1, v17))
  {
    uint64_t v56 = sub_100006E88(&qword_10003C868);
    memcpy(v54, v55, *(void *)(*(void *)(v56 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v54, v55, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v54, 0, 1, v17);
  }
  uint64_t v57 = v13[26];
  uint64_t v58 = (void *)(v39 + v57);
  uint64_t v59 = (const void *)(v40 + v57);
  if (v62((const void *)(v40 + v57), 1, v27))
  {
    uint64_t v60 = sub_100006E88(&qword_10003C7F0);
    memcpy(v58, v59, *(void *)(*(void *)(v60 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v64 + 32))(v58, v59, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v64 + 56))(v58, 0, 1, v27);
  }
  *(unsigned char *)(v39 + v13[27]) = *(unsigned char *)(v40 + v13[27]);
  return a1;
}

uint64_t sub_10001DE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v18;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v19 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v20;
  swift_bridgeObjectRelease();
  long long v109 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v21 = v109[24];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_1000304E0();
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_6:
    uint64_t v29 = sub_100006E88(&qword_10003C868);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v22, v23, v24);
LABEL_7:
  uint64_t v30 = v109[25];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  int v33 = v26((void *)(a1 + v30), 1, v24);
  int v34 = v26(v32, 1, v24);
  uint64_t v108 = v25;
  uint64_t v105 = v26;
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v31, v32, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v31, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v31, v24);
LABEL_12:
    uint64_t v35 = sub_100006E88(&qword_10003C868);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v31, v32, v24);
LABEL_13:
  uint64_t v36 = v109[26];
  long long v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  uint64_t v39 = sub_100030510();
  uint64_t v40 = *(void *)(v39 - 8);
  long long v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  uint64_t v106 = v41;
  int v43 = v41(v38, 1, v39);
  uint64_t v104 = v40;
  if (v42)
  {
    if (v43)
    {
      uint64_t v44 = sub_100006E88(&qword_10003C7F0);
      memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
      uint64_t v45 = v39;
    }
    else
    {
      uint64_t v45 = v39;
      (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v37, v38, v39);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
  }
  else
  {
    uint64_t v45 = v39;
    if (v43)
    {
      (*(void (**)(void *, uint64_t))(v40 + 8))(v37, v39);
      uint64_t v46 = sub_100006E88(&qword_10003C7F0);
      memcpy(v37, v38, *(void *)(*(void *)(v46 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v40 + 40))(v37, v38, v39);
    }
  }
  *(unsigned char *)(a1 + v109[27]) = *(unsigned char *)(a2 + v109[27]);
  long long v47 = (int *)type metadata accessor for InviteMessageView(0);
  uint64_t v48 = v47[5];
  uint64_t v49 = a1 + v48;
  uint64_t v50 = a2 + v48;
  *(void *)uint64_t v49 = *(void *)v50;
  *(unsigned char *)(v49 + 8) = *(unsigned char *)(v50 + 8);
  uint64_t v51 = v47[6];
  uint64_t v52 = a1 + v51;
  uint64_t v53 = (uint64_t *)(a2 + v51);
  uint64_t v54 = *v53;
  uint64_t v55 = v53[1];
  uint64_t v56 = *(void **)v52;
  *(void *)uint64_t v52 = v54;

  *(void *)(v52 + 8) = v55;
  uint64_t v57 = v47[7];
  uint64_t v58 = a1 + v57;
  uint64_t v59 = a2 + v57;
  sub_100008804(a1 + v57);
  long long v60 = *(_OWORD *)(v59 + 16);
  *(_OWORD *)uint64_t v58 = *(_OWORD *)v59;
  *(_OWORD *)(v58 + 16) = v60;
  *(void *)(v58 + 32) = *(void *)(v59 + 32);
  uint64_t v61 = v47[8];
  uint64_t v62 = a1 + v61;
  uint64_t v63 = a2 + v61;
  *(unsigned char *)uint64_t v62 = *(unsigned char *)v63;
  *(void *)(v62 + 8) = *(void *)(v63 + 8);
  swift_release();
  uint64_t v64 = v47[9];
  uint64_t v65 = a1 + v64;
  uint64_t v66 = a2 + v64;
  *(unsigned char *)uint64_t v65 = *(unsigned char *)v66;
  *(void *)(v65 + 8) = *(void *)(v66 + 8);
  swift_release();
  *(void *)(a1 + v47[10]) = *(void *)(a2 + v47[10]);
  uint64_t v67 = *(int *)(a3 + 20);
  uint64_t v68 = a1 + v67;
  uint64_t v69 = a2 + v67;
  uint64_t v70 = *(void *)(a2 + v67 + 8);
  *(void *)uint64_t v68 = *(void *)(a2 + v67);
  *(void *)(v68 + 8) = v70;
  swift_bridgeObjectRelease();
  uint64_t v71 = *(void *)(v69 + 24);
  *(void *)(v68 + 16) = *(void *)(v69 + 16);
  *(void *)(v68 + 24) = v71;
  swift_bridgeObjectRelease();
  uint64_t v72 = *(void *)(v69 + 40);
  *(void *)(v68 + 32) = *(void *)(v69 + 32);
  *(void *)(v68 + 40) = v72;
  swift_bridgeObjectRelease();
  uint64_t v73 = *(void *)(v69 + 56);
  *(void *)(v68 + 48) = *(void *)(v69 + 48);
  *(void *)(v68 + 56) = v73;
  swift_bridgeObjectRelease();
  uint64_t v74 = *(void *)(v69 + 72);
  *(void *)(v68 + 64) = *(void *)(v69 + 64);
  *(void *)(v68 + 72) = v74;
  swift_bridgeObjectRelease();
  uint64_t v75 = *(void *)(v69 + 88);
  *(void *)(v68 + 80) = *(void *)(v69 + 80);
  *(void *)(v68 + 88) = v75;
  swift_bridgeObjectRelease();
  uint64_t v76 = *(void *)(v69 + 104);
  *(void *)(v68 + 96) = *(void *)(v69 + 96);
  *(void *)(v68 + 104) = v76;
  swift_bridgeObjectRelease();
  uint64_t v77 = *(void *)(v69 + 120);
  *(void *)(v68 + 112) = *(void *)(v69 + 112);
  *(void *)(v68 + 120) = v77;
  swift_bridgeObjectRelease();
  uint64_t v78 = *(void *)(v69 + 136);
  *(void *)(v68 + 128) = *(void *)(v69 + 128);
  *(void *)(v68 + 136) = v78;
  swift_bridgeObjectRelease();
  uint64_t v79 = *(void *)(v69 + 152);
  *(void *)(v68 + 144) = *(void *)(v69 + 144);
  *(void *)(v68 + 152) = v79;
  swift_bridgeObjectRelease();
  uint64_t v80 = *(void *)(v69 + 168);
  *(void *)(v68 + 160) = *(void *)(v69 + 160);
  *(void *)(v68 + 168) = v80;
  swift_bridgeObjectRelease();
  uint64_t v81 = *(void *)(v69 + 184);
  *(void *)(v68 + 176) = *(void *)(v69 + 176);
  *(void *)(v68 + 184) = v81;
  swift_bridgeObjectRelease();
  uint64_t v82 = *(void *)(v69 + 200);
  *(void *)(v68 + 192) = *(void *)(v69 + 192);
  *(void *)(v68 + 200) = v82;
  swift_bridgeObjectRelease();
  uint64_t v83 = *(void *)(v69 + 216);
  *(void *)(v68 + 208) = *(void *)(v69 + 208);
  *(void *)(v68 + 216) = v83;
  swift_bridgeObjectRelease();
  *(void *)(v68 + 224) = *(void *)(v69 + 224);
  swift_bridgeObjectRelease();
  *(unsigned char *)(v68 + 232) = *(unsigned char *)(v69 + 232);
  *(unsigned char *)(v68 + 233) = *(unsigned char *)(v69 + 233);
  *(unsigned char *)(v68 + 234) = *(unsigned char *)(v69 + 234);
  uint64_t v84 = *(void *)(v69 + 248);
  *(void *)(v68 + 240) = *(void *)(v69 + 240);
  *(void *)(v68 + 248) = v84;
  swift_bridgeObjectRelease();
  uint64_t v85 = *(void *)(v69 + 264);
  *(void *)(v68 + 256) = *(void *)(v69 + 256);
  *(void *)(v68 + 264) = v85;
  swift_bridgeObjectRelease();
  uint64_t v86 = v109[24];
  Swift::String v87 = (void *)(v68 + v86);
  Swift::String v88 = (void *)(v69 + v86);
  LODWORD(v47) = v105((void *)(v68 + v86), 1, v24);
  int v89 = v105(v88, 1, v24);
  if (v47)
  {
    if (!v89)
    {
      (*(void (**)(void *, void *, uint64_t))(v108 + 32))(v87, v88, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v108 + 56))(v87, 0, 1, v24);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v89)
  {
    (*(void (**)(void *, uint64_t))(v108 + 8))(v87, v24);
LABEL_27:
    uint64_t v90 = sub_100006E88(&qword_10003C868);
    memcpy(v87, v88, *(void *)(*(void *)(v90 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, void *, uint64_t))(v108 + 40))(v87, v88, v24);
LABEL_28:
  uint64_t v91 = v109[25];
  uint64_t v92 = (void *)(v68 + v91);
  uint64_t v93 = (void *)(v69 + v91);
  int v94 = v105((void *)(v68 + v91), 1, v24);
  int v95 = v105(v93, 1, v24);
  if (v94)
  {
    if (!v95)
    {
      (*(void (**)(void *, void *, uint64_t))(v108 + 32))(v92, v93, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v108 + 56))(v92, 0, 1, v24);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v95)
  {
    (*(void (**)(void *, uint64_t))(v108 + 8))(v92, v24);
LABEL_33:
    uint64_t v96 = sub_100006E88(&qword_10003C868);
    memcpy(v92, v93, *(void *)(*(void *)(v96 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(void *, void *, uint64_t))(v108 + 40))(v92, v93, v24);
LABEL_34:
  uint64_t v97 = v109[26];
  uint64_t v98 = (void *)(v68 + v97);
  uint64_t v99 = (void *)(v69 + v97);
  int v100 = v106((void *)(v68 + v97), 1, v45);
  int v101 = v106(v99, 1, v45);
  if (!v100)
  {
    if (!v101)
    {
      (*(void (**)(void *, void *, uint64_t))(v104 + 40))(v98, v99, v45);
      goto LABEL_40;
    }
    (*(void (**)(void *, uint64_t))(v104 + 8))(v98, v45);
    goto LABEL_39;
  }
  if (v101)
  {
LABEL_39:
    uint64_t v102 = sub_100006E88(&qword_10003C7F0);
    memcpy(v98, v99, *(void *)(*(void *)(v102 - 8) + 64));
    goto LABEL_40;
  }
  (*(void (**)(void *, void *, uint64_t))(v104 + 32))(v98, v99, v45);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v104 + 56))(v98, 0, 1, v45);
LABEL_40:
  *(unsigned char *)(v68 + v109[27]) = *(unsigned char *)(v69 + v109[27]);
  return a1;
}

uint64_t sub_10001E900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E914);
}

uint64_t sub_10001E914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InviteMessageView(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for InviteMessageDetails();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10001EA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001EA20);
}

uint64_t sub_10001EA20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InviteMessageView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for InviteMessageDetails();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_10001EB24()
{
  uint64_t result = type metadata accessor for InviteMessageView(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for InviteMessageDetails();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001EBEC()
{
  return sub_10001EC28(&qword_10003CBA0, &qword_10003C958, (void (*)(void))sub_10001ECCC);
}

uint64_t sub_10001EC28(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007A10(a2);
    a3();
    sub_10002169C(&qword_10003CBD0, &qword_10003CBD8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001ECCC()
{
  return sub_10001819C(&qword_10003CBA8, &qword_10003C950, (void (*)(void))sub_10001ECFC);
}

uint64_t sub_10001ECFC()
{
  return sub_10001819C(&qword_10003CBB0, &qword_10003C948, (void (*)(void))sub_10001ED2C);
}

uint64_t sub_10001ED2C()
{
  return sub_10001819C(&qword_10003CBB8, &qword_10003C940, (void (*)(void))sub_10001ED5C);
}

unint64_t sub_10001ED5C()
{
  unint64_t result = qword_10003CBC0;
  if (!qword_10003CBC0)
  {
    sub_100007A10(&qword_10003C938);
    sub_10002169C(&qword_10003CBC8, &qword_10003C930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CBC0);
  }
  return result;
}

uint64_t sub_10001EDFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EE18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EE34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EE50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EE6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EE88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001EEA4()
{
  uint64_t v1 = type metadata accessor for SettingsView(0);
  uint64_t v21 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v19 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v20 = (v21 + 16) & ~v21;
  uint64_t v22 = v0;
  uint64_t v2 = v0 + v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v4 = v0 + v20 + v3[24];
  uint64_t v5 = sub_1000304E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = v2 + v3[25];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v9 = v2 + v3[26];
  uint64_t v10 = sub_100030510();
  uint64_t v17 = *(void *)(v10 - 8);
  uint64_t v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  if (!v18(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v10);
  }
  uint64_t v11 = type metadata accessor for InviteMessageView(0);

  sub_100008804(v2 + *(int *)(v11 + 28));
  swift_release();
  swift_release();
  uint64_t v12 = v2 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v12 + v3[24];
  if (!v7(v13, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v13, v5);
  }
  uint64_t v14 = v12 + v3[25];
  if (!v7(v14, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v14, v5);
  }
  uint64_t v15 = v12 + v3[26];
  if (!v18(v15, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v10);
  }

  return _swift_deallocObject(v22, v20 + v19, v21 | 7);
}

uint64_t sub_10001F2F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_10001F35C()
{
}

double sub_10001F3B8@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100014B9C(*(void *)(v1 + 16), (void *)*(void *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_10001F3C0()
{
  uint64_t v1 = type metadata accessor for SettingsView(0);
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v21 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  uint64_t v22 = (v23 + 32) & ~v23;
  uint64_t v2 = v0 + v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v4 = v0 + v22 + v3[24];
  uint64_t v5 = sub_1000304E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = v2 + v3[25];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v9 = v2 + v3[26];
  uint64_t v10 = sub_100030510();
  uint64_t v19 = *(void *)(v10 - 8);
  uint64_t v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  if (!v20(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v9, v10);
  }
  uint64_t v11 = type metadata accessor for InviteMessageView(0);

  sub_100008804(v2 + *(int *)(v11 + 28));
  swift_release();
  swift_release();
  uint64_t v12 = v2 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = v12 + v3[24];
  if (!v7(v13, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v13, v5);
  }
  uint64_t v14 = v12 + v3[25];
  if (!v7(v14, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v14, v5);
  }
  uint64_t v15 = v12 + v3[26];
  if (!v20(v15, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v15, v10);
  }
  unint64_t v16 = (v21 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = v16 + 16;

  return _swift_deallocObject(v0, v17, v23 | 7);
}

uint64_t sub_10001F83C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for SettingsView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_10000890C;
  return sub_10001558C(a1, v6, v7, v8, v10, v11);
}

void *sub_10001F968(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001F9AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F9BC()
{
  return swift_release();
}

uint64_t sub_10001F9C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000306E0();
  *a1 = result;
  return result;
}

uint64_t sub_10001F9F0()
{
  return sub_1000306F0();
}

uint64_t sub_10001FA1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100030700();
  *a1 = result;
  return result;
}

uint64_t sub_10001FA48()
{
  return sub_100030710();
}

uint64_t sub_10001FA74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 120);
  uint64_t v4 = *(void *)(a1 + 128);
  char v5 = *(unsigned char *)(a1 + 136);
  sub_10001FB0C(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
  sub_10001FB50(v2);
  sub_100019124(v3, v4, v5);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10001FB0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100019124(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001FB50(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10001FBC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 120);
  uint64_t v4 = *(void *)(a1 + 128);
  char v5 = *(unsigned char *)(a1 + 136);
  sub_10001FC58(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
  sub_10001FC9C(v2);
  sub_100017E74(v3, v4, v5);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001FC58(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100017E74(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10001FC9C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10001FD0C()
{
  return sub_10002002C();
}

uint64_t sub_10001FD28()
{
  uint64_t v1 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v4 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v5 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v6 = v0 + v3 + v5[24];
  uint64_t v7 = sub_1000304E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = v4 + v5[25];
  if (!v9(v10, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v11 = v4 + v5[26];
  uint64_t v12 = sub_100030510();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = type metadata accessor for InviteMessageView(0);

  sub_100008804(v4 + *(int *)(v14 + 28));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v16, v2 | 7);
}

uint64_t sub_100020014()
{
  return sub_10002002C();
}

uint64_t sub_10002002C()
{
  return sub_100011984();
}

unint64_t sub_100020094()
{
  unint64_t result = qword_10003CCB8;
  if (!qword_10003CCB8)
  {
    sub_100007A10(&qword_10003CCA0);
    sub_10001EC28(&qword_10003CCC0, &qword_10003CC98, (void (*)(void))sub_100020158);
    sub_10002169C(&qword_10003CCD8, &qword_10003CCA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CCB8);
  }
  return result;
}

unint64_t sub_100020158()
{
  unint64_t result = qword_10003CCC8;
  if (!qword_10003CCC8)
  {
    sub_100007A10(&qword_10003CC90);
    sub_10002169C(&qword_10003CCD0, &qword_10003CC88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CCC8);
  }
  return result;
}

uint64_t sub_1000201FC()
{
  return sub_10002002C();
}

uint64_t sub_100020214@<X0>(uint64_t a1@<X8>)
{
  return sub_10000F794(a1);
}

void sub_10002021C()
{
  sub_10000F0EC(*(void *)(v0 + 16));
}

uint64_t sub_10002023C(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_10000890C;
  return sub_10000F3D0(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_100020368()
{
  return sub_100011A0C(*(void *)(v0 + 16));
}

uint64_t sub_100020388(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(sub_1000304E0() - 8) + 80);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v11 = v1 + v5;
  uint64_t v12 = v1 + (v8 & ~v7);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_10000890C;
  return sub_100011E90(a1, v9, v10, v11, v12);
}

unint64_t sub_1000204DC()
{
  unint64_t result = qword_10003CD30;
  if (!qword_10003CD30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10003CD30);
  }
  return result;
}

uint64_t sub_100020520()
{
  uint64_t v1 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v17 = *(void *)(v1 + 64);
  swift_unknownObjectRelease();
  uint64_t v4 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v5 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v6 = v0 + v3 + v5[24];
  uint64_t v7 = sub_1000304E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = v4 + v5[25];
  if (!v9(v10, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v7);
  }
  uint64_t v11 = v4 + v5[26];
  uint64_t v12 = sub_100030510();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  unint64_t v14 = (v17 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = type metadata accessor for InviteMessageView(0);

  sub_100008804(v4 + *(int *)(v15 + 28));
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v14 + 16, v2 | 7);
}

uint64_t sub_100020828(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = (uint64_t *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_100008710;
  return sub_100012B70(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_100020954(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_100020960(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_10002096C()
{
  return sub_10000F8C4(*(void *)(v0 + 16));
}

uint64_t sub_10002098C()
{
  uint64_t v1 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v19 = *(void *)(v1 + 64);
  uint64_t v3 = sub_1000304E0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = *(void *)(v4 + 64);
  swift_unknownObjectRelease();
  uint64_t v6 = v0 + ((v2 + 32) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v8 = v6 + v7[24];
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (!v9(v8, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
  }
  uint64_t v10 = v6 + v7[25];
  if (!v9(v10, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v10, v3);
  }
  uint64_t v11 = v6 + v7[26];
  uint64_t v12 = sub_100030510();
  uint64_t v13 = *(void *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  uint64_t v14 = v2 | v5 | 7;
  uint64_t v15 = (((v2 + 32) & ~v2) + v19 + v5) & ~v5;
  uint64_t v16 = type metadata accessor for InviteMessageView(0);

  sub_100008804(v6 + *(int *)(v16 + 28));
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v15, v3);

  return _swift_deallocObject(v0, v15 + v18, v14);
}

uint64_t sub_100020CD4(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InviteActionsView(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(sub_1000304E0() - 8) + 80);
  unint64_t v8 = v5 + v6 + v7;
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = *(void *)(v1 + 24);
  uint64_t v11 = v1 + v5;
  uint64_t v12 = v1 + (v8 & ~v7);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_10000890C;
  return sub_10000FD4C(a1, v9, v10, v11, v12);
}

uint64_t sub_100020E28()
{
  return sub_1000306C0();
}

uint64_t sub_100020E50(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006E88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100020EB4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020EEC@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_10001713C(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_100020EF4()
{
  unint64_t result = qword_10003CE08;
  if (!qword_10003CE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE08);
  }
  return result;
}

uint64_t sub_100020F48@<X0>(unint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100017284(a1, *(void *)(v2 + 16), a2);
}

ValueMetadata *type metadata accessor for ThinDivider()
{
  return &type metadata for ThinDivider;
}

uint64_t destroy for Subscription()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Subscription(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Subscription(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for Subscription(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for Subscription(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Subscription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Subscription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionView()
{
  return &type metadata for SubscriptionView;
}

uint64_t sub_10002113C()
{
  return sub_10002169C(&qword_10003CE20, &qword_10003CE28);
}

uint64_t sub_100021178()
{
  return sub_1000211B0(&qword_10003CE30, &qword_10003CE38);
}

uint64_t sub_1000211B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007A10(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100021220()
{
  return sub_10002169C(&qword_10003CE40, &qword_10003CE48);
}

uint64_t sub_10002125C()
{
  return sub_10002169C(&qword_10003CE50, &qword_10003CE58);
}

unint64_t sub_10002129C()
{
  unint64_t result = qword_10003CE60;
  if (!qword_10003CE60)
  {
    sub_100007A10(&qword_10003CD70);
    sub_10002169C(&qword_10003CE68, &qword_10003CD60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE60);
  }
  return result;
}

uint64_t sub_10002133C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000213BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000213D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000213F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000177E4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1000213FC@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001799C(a1);
}

unint64_t sub_100021408()
{
  unint64_t result = qword_10003CE80;
  if (!qword_10003CE80)
  {
    sub_100007A10(&qword_10003CE78);
    sub_10002169C(&qword_10003CE88, &qword_10003CE90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CE80);
  }
  return result;
}

unint64_t sub_1000214A8()
{
  unint64_t result = qword_10003CEA0;
  if (!qword_10003CEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CEA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptionLabelStyle()
{
  return &type metadata for CaptionLabelStyle;
}

uint64_t sub_10002150C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000215A4()
{
  unint64_t result = qword_10003CEA8;
  if (!qword_10003CEA8)
  {
    sub_100007A10(&qword_10003CEB0);
    sub_10002169C(&qword_10003CEB8, &qword_10003CEC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CEA8);
  }
  return result;
}

uint64_t sub_100021644()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021660()
{
  return sub_10002169C(&qword_10003CED8, &qword_10003CEE0);
}

uint64_t sub_10002169C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007A10(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100021700(char a1)
{
  return *(void *)&aAccepteddeclin_0[8 * a1];
}

uint64_t sub_100021720(char *a1, char *a2)
{
  return sub_10000ACD4(*a1, *a2);
}

Swift::Int sub_10002172C()
{
  return sub_100021734();
}

Swift::Int sub_100021734()
{
  return sub_100030F30();
}

uint64_t sub_1000217A0()
{
  return sub_1000217A8();
}

uint64_t sub_1000217A8()
{
  sub_100030C80();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000217FC()
{
  return sub_100021804();
}

Swift::Int sub_100021804()
{
  return sub_100030F30();
}

uint64_t sub_10002186C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000226B4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10002189C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100021700(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000218C8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E88(&qword_10003CD48);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return _swift_continuation_throwingResumeWithError(a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;

  return swift_continuation_throwingResume();
}

uint64_t sub_100021988(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006E88(&qword_10003D028);
    unint64_t v2 = (void *)sub_100030E90();
  }
  else
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_100026398(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100026398(v35, v36);
    sub_100026398(v36, &v32);
    uint64_t result = sub_100030DF0(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_100026398(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1000263A8();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100021D48(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E88(&qword_10003CD48);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_100021DFC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

uint64_t sub_100021E50()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FamilyFetcher()
{
  return self;
}

uint64_t sub_100021E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = (void **)v5;
  unint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_10002EEE0(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    unint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      unint64_t v21 = (uint64_t *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10002FC4C();
    goto LABEL_7;
  }
  sub_10002F568(v17, a5 & 1);
  unint64_t v23 = sub_10002EEE0(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    uint64_t result = sub_100030F00();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_10002FA68(v14, a3, a4, a1, a2, v20);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100021FD8(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return _swift_task_switch(sub_100021FF8, 0, 0);
}

uint64_t sub_100021FF8()
{
  uint64_t v1 = v0[16];
  id v2 = [objc_allocWithZone((Class)FAFetchFamilyCircleRequest) init];
  v0[17] = v2;
  [v2 setCachePolicy:v1];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100022130;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000218C8;
  v0[13] = &unk_100039AA0;
  v0[14] = v3;
  [v2 startRequestWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100022130()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    id v2 = sub_1000222A4;
  }
  else {
    id v2 = sub_100022240;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100022240()
{
  uint64_t v1 = *(void *)(v0 + 120);
  id v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1000222A4()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  swift_errorRelease();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

uint64_t sub_100022320(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_100030630();
  id v7 = *(__objc2_class_ro **)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  id v10 = a1;
  unint64_t v11 = &Family_MSMessagesAppViewController__metaData;
  id v12 = [v10 members];
  sub_1000076B4(0, &qword_10003CFC0);
  unint64_t v13 = sub_100030CB0();

  if (v13 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100030E60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_22;
  }
  id v15 = [v10 *(SEL *)&v11[16].flags];
  unint64_t v16 = sub_100030CB0();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100030E60();
    if (v17) {
      goto LABEL_7;
    }
LABEL_26:
    swift_bridgeObjectRelease_n();
    goto LABEL_27;
  }
  uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v17) {
    goto LABEL_26;
  }
LABEL_7:
  uint64_t v31 = a2;
  unint64_t v32 = a3;
  long long v33 = v7;
  a3 = v16 & 0xC000000000000001;
  a2 = 4;
  id v7 = &Family_MSMessagesAppViewController__metaData;
  while (1)
  {
    if (a3) {
      id v18 = (id)sub_100030E20();
    }
    else {
      id v18 = *(id *)(v16 + 8 * a2);
    }
    uint64_t v19 = v18;
    unint64_t v11 = (__objc2_class_ro *)(a2 - 3);
    if (__OFADD__(a2 - 4, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if ([v18 isOrganizer]) {
      break;
    }

    ++a2;
    if (v11 == (__objc2_class_ro *)v17)
    {
      swift_bridgeObjectRelease_n();
      id v7 = v33;
      goto LABEL_27;
    }
  }
  swift_bridgeObjectRelease_n();
  id v21 = [v19 appleID];
  id v7 = v33;
  if (!v21)
  {

    goto LABEL_27;
  }
  char v22 = v21;
  uint64_t v23 = sub_100030C60();
  uint64_t v25 = v24;

  if (v23 == v31 && v25 == v32)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  char v26 = sub_100030ED0();
  swift_bridgeObjectRelease();

  if (v26)
  {
LABEL_22:

    return 0;
  }
LABEL_27:
  sub_1000305C0();
  uint64_t v27 = sub_100030620();
  os_log_type_t v28 = sub_100030D60();
  if (os_log_type_enabled(v27, v28))
  {
    long long v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "orgranizerAppleID and senderHandle do not match, receiver is already in another family", v29, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))&v7->ivar_base_size)(v9, v6);
  return 1;
}

uint64_t sub_1000226B4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000393D0;
  v6._object = a2;
  unint64_t v4 = sub_100030EB0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

void *sub_100022700(uint64_t a1)
{
  uint64_t v2 = sub_100030570();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  Swift::String v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  long long v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100006E88(&qword_10003CFE0);
    uint64_t v9 = sub_100030E00();
    uint64_t v10 = 0;
    id v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    id v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100024EB0(&qword_10003CFE8);
      uint64_t v16 = sub_100030C10();
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
          sub_100024EB0(&qword_10003CFF0);
          char v23 = sub_100030C20();
          uint64_t v24 = *v15;
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
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

BOOL sub_1000229F0()
{
  uint64_t v59 = sub_100030630();
  uint64_t v53 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  uint64_t v1 = (char *)&v45 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100030430();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v46 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  Swift::String v6 = (char *)&v45 - v5;
  uint64_t v7 = sub_100030510();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v45 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = sub_100030580();
  uint64_t v50 = *(void *)(v17 - 8);
  uint64_t v51 = v17;
  __chkstk_darwin(v17);
  unint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100030560();
  sub_100030540();
  sub_100030500();
  sub_100030540();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v57 = v7;
  uint64_t v55 = v8 + 8;
  uint64_t v49 = v20;
  v20(v11, v7);
  sub_100006E88(&qword_10003CFD8);
  uint64_t v21 = sub_100030570();
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100031ED0;
  (*(void (**)(unint64_t, void, uint64_t))(v22 + 104))(v24 + v23, enum case for Calendar.Component.day(_:), v21);
  sub_100022700(v24);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v52 = v16;
  uint64_t v54 = v14;
  uint64_t v25 = v46;
  sub_100030550();
  swift_bridgeObjectRelease();
  sub_1000305B0();
  uint64_t v26 = v47;
  uint64_t v27 = *(void (**)(char *, char *))(v47 + 16);
  uint64_t v56 = v6;
  uint64_t v28 = v48;
  v27(v25, v6);
  uint64_t v58 = v1;
  uint64_t v29 = sub_100030620();
  os_log_type_t v30 = sub_100030D60();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    uint64_t v32 = sub_100030420();
    uint64_t v34 = v25;
    if (v33) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = v32;
    }
    uint64_t v36 = *(void (**)(char *, uint64_t))(v26 + 8);
    v36(v34, v28);
    uint64_t v60 = v35;
    sub_100030DA0();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Invite date is %ld days old", v31, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    uint64_t v36 = *(void (**)(char *, uint64_t))(v26 + 8);
    v36(v25, v28);
  }

  (*(void (**)(char *, uint64_t))(v53 + 8))(v58, v59);
  long long v37 = v56;
  uint64_t v38 = sub_100030420();
  char v40 = v39;
  v36(v37, v28);
  uint64_t v41 = v57;
  int v42 = v49;
  v49(v54, v57);
  v42(v52, v41);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v51);
  return (v40 & 1) == 0 && v38 > 89;
}

void sub_100022F9C(uint8_t *a1, id a2)
{
  uint64_t v4 = sub_100006E88(&qword_10003C7F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v233 = (uint64_t)&v217 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v234 = sub_100030510();
  uint64_t v232 = *(void *)(v234 - 8);
  __chkstk_darwin(v234);
  long long v230 = (char *)&v217 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v231 = type metadata accessor for InviteMessageDetails();
  uint64_t v7 = __chkstk_darwin(v231);
  uint64_t v9 = (char *)&v217 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (uint64_t)&v217 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v225 = (uint64_t)&v217 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (uint64_t)&v217 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (uint64_t)&v217 - v19;
  __chkstk_darwin(v18);
  v245 = (char *)&v217 - v21;
  uint64_t v248 = sub_100030630();
  uint64_t v240 = *(void *)(v248 - 8);
  uint64_t v22 = __chkstk_darwin(v248);
  v243 = (char *)&v217 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v242 = (char *)&v217 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v217 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  uint64_t v30 = __chkstk_darwin(v29);
  v226 = (char *)&v217 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v217 - v33;
  uint64_t v35 = __chkstk_darwin(v32);
  long long v37 = (char *)&v217 - v36;
  __chkstk_darwin(v35);
  v247 = a1;
  v244 = v9;
  v236 = v28;
  if (!a2) {
    goto LABEL_119;
  }
  uint64_t v224 = v39;
  v237 = (char *)&v217 - v38;
  id v40 = [a2 members];
  unint64_t v241 = sub_1000076B4(0, &qword_10003CFC0);
  uint64_t v41 = sub_100030CB0();

  if ((sub_100022320(a2, *((void *)a1 + 32), *((void *)a1 + 33)) & 1) == 0)
  {
    if ((unint64_t)v41 >> 62) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (v42)
    {
      *(void *)&long long v239 = 0;
      unint64_t v43 = v41 & 0xC000000000000001;
      uint64_t v222 = v41 & 0xFFFFFFFFFFFFFF8;
      uint64_t v221 = v41 + 32;
      unint64_t v219 = v42;
      id v227 = a2;
      uint64_t v223 = v12;
      uint64_t v217 = v17;
      uint64_t v228 = v20;
      v220 = v34;
      long long v229 = v37;
      uint64_t v235 = v41;
      unint64_t v218 = v41 & 0xC000000000000001;
      while (1)
      {
        if (v43)
        {
          uint64_t v44 = v239;
          id v45 = (id)sub_100030E20();
        }
        else
        {
          uint64_t v44 = v239;
          if ((unint64_t)v239 >= *(void *)(v222 + 16))
          {
            __break(1u);
LABEL_174:

            __break(1u);
            return;
          }
          id v45 = *(id *)(v221 + 8 * v239);
        }
        uint64_t v46 = v45;
        BOOL v47 = __OFADD__(v44, 1);
        uint64_t v17 = v44 + 1;
        if (v47) {
          goto LABEL_116;
        }
        id v48 = [v45 appleID];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = sub_100030C60();
          uint64_t v52 = v51;

          if (v50 == *((void *)a1 + 30) && v52 == *((void *)a1 + 31))
          {
            swift_bridgeObjectRelease();
LABEL_72:
            swift_bridgeObjectRelease();
            int v89 = v237;
            sub_1000305C0();
            uint64_t v90 = (uint64_t)a1;
            uint64_t v91 = v245;
            sub_100024DF0(v90, (uint64_t)v245);
            uint64_t v92 = sub_100030620();
            os_log_type_t v93 = sub_100030D60();
            if (os_log_type_enabled(v92, v93))
            {
              int v94 = (uint8_t *)swift_slowAlloc();
              uint64_t v250 = swift_slowAlloc();
              *(_DWORD *)int v94 = 136315138;
              v247 = v94 + 4;
              uint64_t v95 = *((void *)v91 + 30);
              unint64_t v96 = *((void *)v91 + 31);
              swift_bridgeObjectRetain();
              uint64_t v249 = sub_10002E7E4(v95, v96, &v250);
              sub_100030DA0();
              swift_bridgeObjectRelease();
              sub_100024E54((uint64_t)v91);
              _os_log_impl((void *)&_mh_execute_header, v92, v93, "contact handle %s mapped to family member Apple Account", v94, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              sub_100024E54((uint64_t)v91);
            }

            uint64_t v77 = *(void (**)(char *, uint64_t))(v240 + 8);
            Swift::String v88 = v89;
            goto LABEL_76;
          }
          uint64_t v20 = sub_100030ED0();
          swift_bridgeObjectRelease();
          if (v20) {
            goto LABEL_72;
          }
        }
        id v54 = [v46 contact:v217];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v20 = (uint64_t)[v54 phoneNumbers];

          sub_100006E88(&qword_10003CFD0);
          uint64_t v41 = sub_100030CB0();
        }
        else
        {
          uint64_t v41 = (uint64_t)&_swiftEmptyArrayStorage;
        }
        id v238 = v46;
        *(void *)&long long v239 = v17;
        if ((unint64_t)v41 >> 62) {
          break;
        }
        unint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v42) {
          goto LABEL_22;
        }
LABEL_33:
        swift_bridgeObjectRelease();
        id v62 = [v238 contact];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v17 = (uint64_t)[v62 emailAddresses];

          sub_100006E88(&qword_10003CFD0);
          uint64_t v41 = sub_100030CB0();

          if ((unint64_t)v41 >> 62) {
            goto LABEL_50;
          }
        }
        else
        {
          uint64_t v41 = (uint64_t)&_swiftEmptyArrayStorage;
          if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
          {
LABEL_50:
            if (v41 < 0) {
              uint64_t v17 = v41;
            }
            else {
              uint64_t v17 = v41 & 0xFFFFFFFFFFFFFF8;
            }
            swift_bridgeObjectRetain();
            uint64_t v12 = sub_100030E60();
            swift_bridgeObjectRelease();
            if (v12)
            {
LABEL_36:
              a1 = (uint8_t *)*((void *)v247 + 30);
              uint64_t v9 = (char *)*((void *)v247 + 31);
              unint64_t v246 = v41 & 0xC000000000000001;
              unint64_t v42 = 4;
              while (1)
              {
                long long v37 = (char *)(v42 - 4);
                if (v246) {
                  id v64 = (id)sub_100030E20();
                }
                else {
                  id v64 = *(id *)(v41 + 8 * v42);
                }
                a2 = v64;
                uint64_t v34 = (char *)(v42 - 3);
                if (__OFADD__(v37, 1)) {
                  goto LABEL_78;
                }
                id v65 = [v64 value];
                uint64_t v20 = sub_100030C60();
                uint64_t v67 = v66;

                if ((uint8_t *)v20 == a1 && v67 == v9)
                {
                  swift_bridgeObjectRelease();
                  id v79 = v238;
                  uint64_t v80 = v220;
                  goto LABEL_67;
                }
                uint64_t v17 = sub_100030ED0();
                swift_bridgeObjectRelease();
                if (v17) {
                  break;
                }

                ++v42;
                if (v34 == (char *)v12) {
                  goto LABEL_47;
                }
              }
              id v79 = v238;
              uint64_t v80 = v220;
LABEL_67:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_1000305C0();
              uint64_t v81 = v80;
              uint64_t v82 = v217;
              sub_100024DF0((uint64_t)v247, v217);
              uint64_t v83 = sub_100030620();
              os_log_type_t v84 = sub_100030D60();
              if (!os_log_type_enabled(v83, v84))
              {

                sub_100024E54(v82);
                (*(void (**)(char *, uint64_t))(v240 + 8))(v81, v248);
                return;
              }
              uint64_t v85 = (uint8_t *)swift_slowAlloc();
              uint64_t v250 = swift_slowAlloc();
              *(_DWORD *)uint64_t v85 = 136315138;
              uint64_t v86 = *(void *)(v82 + 240);
              unint64_t v87 = *(void *)(v82 + 248);
              swift_bridgeObjectRetain();
              uint64_t v249 = sub_10002E7E4(v86, v87, &v250);
              sub_100030DA0();
              swift_bridgeObjectRelease();
              sub_100024E54(v82);
              _os_log_impl((void *)&_mh_execute_header, v83, v84, "contact handle %s mapped to family member email address", v85, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v77 = *(void (**)(char *, uint64_t))(v240 + 8);
              uint64_t v78 = (uint64_t *)&v251;
              goto LABEL_69;
            }
            goto LABEL_47;
          }
        }
        uint64_t v12 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v12) {
          goto LABEL_36;
        }
LABEL_47:

        swift_bridgeObjectRelease();
        a1 = v247;
        uint64_t v9 = v244;
        a2 = v227;
        uint64_t v12 = v223;
        unint64_t v43 = v218;
        if ((void)v239 == v219) {
          goto LABEL_80;
        }
      }
      if (v41 < 0) {
        uint64_t v20 = v41;
      }
      else {
        uint64_t v20 = v41 & 0xFFFFFFFFFFFFFF8;
      }
      swift_bridgeObjectRetain();
      unint64_t v42 = sub_100030E60();
      swift_bridgeObjectRelease();
      if (!v42) {
        goto LABEL_33;
      }
LABEL_22:
      a1 = (uint8_t *)*((void *)v247 + 30);
      uint64_t v9 = (char *)*((void *)v247 + 31);
      unint64_t v246 = v41 & 0xC000000000000001;
      uint64_t v12 = 4;
      while (1)
      {
        long long v37 = (char *)(v12 - 4);
        id v56 = v246 ? (id)sub_100030E20() : *(id *)(v41 + 8 * v12);
        a2 = v56;
        uint64_t v34 = (char *)(v12 - 3);
        if (__OFADD__(v37, 1)) {
          break;
        }
        id v57 = [v56 value];
        id v58 = [v57 stringValue];

        uint64_t v20 = sub_100030C60();
        uint64_t v60 = v59;

        if ((uint8_t *)v20 == a1 && v60 == v9)
        {
          swift_bridgeObjectRelease();
          id v69 = v238;
          uint64_t v70 = v229;
          goto LABEL_62;
        }
        uint64_t v17 = sub_100030ED0();
        swift_bridgeObjectRelease();
        if (v17)
        {
          id v69 = v238;
          uint64_t v70 = v229;
LABEL_62:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000305C0();
          uint64_t v71 = v228;
          sub_100024DF0((uint64_t)v247, v228);
          uint64_t v72 = sub_100030620();
          os_log_type_t v73 = sub_100030D60();
          if (!os_log_type_enabled(v72, v73))
          {

            sub_100024E54(v71);
            (*(void (**)(char *, uint64_t))(v240 + 8))(v70, v248);
            return;
          }
          uint64_t v74 = (uint8_t *)swift_slowAlloc();
          uint64_t v250 = swift_slowAlloc();
          *(_DWORD *)uint64_t v74 = 136315138;
          uint64_t v75 = *(void *)(v71 + 240);
          unint64_t v76 = *(void *)(v71 + 248);
          swift_bridgeObjectRetain();
          uint64_t v249 = sub_10002E7E4(v75, v76, &v250);
          sub_100030DA0();
          swift_bridgeObjectRelease();
          sub_100024E54(v71);
          _os_log_impl((void *)&_mh_execute_header, v72, v73, "contact handle %s mapped to family member phone number", v74, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v77 = *(void (**)(char *, uint64_t))(v240 + 8);
          uint64_t v78 = &v252;
LABEL_69:
          Swift::String v88 = (char *)*(v78 - 32);
LABEL_76:
          v77(v88, v248);
          return;
        }

        ++v12;
        if (v34 == (char *)v42) {
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      swift_bridgeObjectRetain();
      unint64_t v42 = sub_100030E60();
      swift_bridgeObjectRelease();
    }
  }
LABEL_80:
  swift_bridgeObjectRelease();
  id v97 = [a2 pendingMembersWithAllStatues];
  uint64_t v28 = v236;
  if (!v97)
  {
LABEL_119:
    sub_1000305C0();
    id v153 = a2;
    uint64_t v154 = sub_100030620();
    os_log_type_t v155 = sub_100030D60();
    if (os_log_type_enabled(v154, v155))
    {
      char v156 = (uint8_t *)swift_slowAlloc();
      uint64_t v250 = swift_slowAlloc();
      *(_DWORD *)char v156 = 136315138;
      if (a2)
      {
        id v157 = [v153 invites];
        if (v157)
        {
          uint64_t v158 = v157;
          sub_1000076B4(0, &qword_10003CFC8);
          sub_100030CB0();
        }
      }
      sub_1000076B4(0, &qword_10003CFC8);
      uint64_t v161 = sub_100030CC0();
      unint64_t v163 = v162;
      swift_bridgeObjectRelease();
      uint64_t v249 = sub_10002E7E4(v161, v163, &v250);
      sub_100030DA0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v154, v155, "invites %s", v156, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v159 = *(void (**)(char *, uint64_t))(v240 + 8);
      v159(v236, v248);
      a1 = v247;
      uint64_t v9 = v244;
      uint64_t v160 = v243;
      if (!a2) {
        goto LABEL_170;
      }
    }
    else
    {

      uint64_t v159 = *(void (**)(char *, uint64_t))(v240 + 8);
      v159(v28, v248);
      uint64_t v160 = v243;
      if (!a2) {
        goto LABEL_170;
      }
    }
    id v164 = [v153 invites:v217];
    if (v164)
    {
      long long v165 = v164;
      sub_1000076B4(0, &qword_10003CFC8);
      unint64_t v166 = sub_100030CB0();

      if (v166 >> 62) {
        goto LABEL_168;
      }
      uint64_t v168 = *(void *)((v166 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v168)
      {
        v240 += 8;
        unint64_t v241 = v166 & 0xC000000000000001;
        uint64_t v169 = 4;
        *(void *)&long long v167 = 136315138;
        long long v239 = v167;
        v236 = (char *)&type metadata for Any + 8;
        v237 = (char *)v168;
        id v238 = (id)v166;
        while (1)
        {
          id v170 = v241 ? (id)sub_100030E20() : *(id *)(v166 + 8 * v169);
          long long v171 = v170;
          if (__OFADD__(v169 - 4, 1)) {
            break;
          }
          v245 = (char *)(v169 - 3);
          long long v172 = v159;
          long long v173 = v242;
          sub_1000305C0();
          sub_100024DF0((uint64_t)a1, (uint64_t)v9);
          long long v174 = sub_100030620();
          os_log_type_t v175 = sub_100030D60();
          BOOL v176 = os_log_type_enabled(v174, v175);
          unint64_t v246 = v169;
          if (v176)
          {
            uint64_t v177 = swift_slowAlloc();
            uint64_t v250 = swift_slowAlloc();
            *(_DWORD *)uint64_t v177 = v239;
            uint64_t v179 = *((void *)v9 + 12);
            unint64_t v178 = *((void *)v9 + 13);
            swift_bridgeObjectRetain();
            *(void *)(v177 + 4) = sub_10002E7E4(v179, v178, &v250);
            uint64_t v160 = v243;
            swift_bridgeObjectRelease();
            uint64_t v180 = v9;
            sub_100024E54((uint64_t)v9);
            _os_log_impl((void *)&_mh_execute_header, v174, v175, "Invite code from message url %s", (uint8_t *)v177, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            uint64_t v180 = v9;
            sub_100024E54((uint64_t)v9);
          }

          uint64_t v159 = v172;
          v172(v173, v248);
          sub_1000305C0();
          a2 = v171;
          uint64_t v181 = sub_100030620();
          os_log_type_t v182 = sub_100030D60();
          if (os_log_type_enabled(v181, v182))
          {
            uint64_t v183 = swift_slowAlloc();
            uint64_t v250 = swift_slowAlloc();
            *(_DWORD *)uint64_t v183 = v239;
            id v184 = [a2 code];
            if (!v184) {
              goto LABEL_174;
            }
            v185 = v184;
            uint64_t v186 = sub_100030C60();
            unint64_t v188 = v187;

            *(void *)(v183 + 4) = sub_10002E7E4(v186, v188, &v250);
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v181, v182, "Invite code from family circle %s", (uint8_t *)v183, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v160 = v243;
            v172(v243, v248);
            uint64_t v9 = v244;
          }
          else
          {

            v172(v160, v248);
            uint64_t v9 = v180;
          }
          id v189 = [a2 organizerEmail];
          a1 = v247;
          if (v189)
          {
            uint64_t v190 = v189;
            uint64_t v191 = sub_100030C60();
            uint64_t v193 = v192;

            if (v191 == *((void *)a1 + 32) && v193 == *((void *)a1 + 33))
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v194 = sub_100030ED0();
              swift_bridgeObjectRelease();
              if ((v194 & 1) == 0) {
                goto LABEL_154;
              }
            }
            id v195 = [a2 inviteStatus];
            if (!v195 || (uint64_t v196 = v195, v197 = sub_100030C60(), v199 = v198, v196, !v199))
            {
LABEL_165:

              swift_bridgeObjectRelease();
              return;
            }
            if (v197 == 0x64656E696C636544 && v199 == 0xE800000000000000)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v200 = sub_100030ED0();
              swift_bridgeObjectRelease();
              if ((v200 & 1) == 0) {
                goto LABEL_165;
              }
            }
          }
LABEL_154:
          id v201 = [a2 organizerEmail];
          if (!v201) {
            goto LABEL_130;
          }
          uint64_t v202 = v201;
          uint64_t v203 = sub_100030C60();
          uint64_t v205 = v204;

          if (v203 == *((void *)a1 + 32) && v205 == *((void *)a1 + 33))
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v206 = sub_100030ED0();
            swift_bridgeObjectRelease();
            if ((v206 & 1) == 0) {
              goto LABEL_130;
            }
          }
          id v207 = [a2 inviteStatus];
          if (!v207 || (uint64_t v208 = v207, v209 = sub_100030C60(), v211 = v210, v208, !v211))
          {
LABEL_130:

            goto LABEL_131;
          }
          if (v209 == 0x64656E696C636544 && v211 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return;
          }
          char v212 = sub_100030ED0();
          swift_bridgeObjectRelease();

          if (v212)
          {
            swift_bridgeObjectRelease();
            return;
          }
LABEL_131:
          uint64_t v169 = v246 + 1;
          unint64_t v166 = (unint64_t)v238;
          if (v245 == v237) {
            goto LABEL_169;
          }
        }
        __break(1u);
LABEL_168:
        swift_bridgeObjectRetain();
        uint64_t v168 = sub_100030E60();
        swift_bridgeObjectRelease();
      }
LABEL_169:
      swift_bridgeObjectRelease();
    }
LABEL_170:
    uint64_t v213 = v233;
    sub_100024D28((uint64_t)&a1[*(int *)(v231 + 104)], v233);
    uint64_t v214 = v232;
    uint64_t v215 = v234;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v232 + 48))(v213, 1, v234) == 1)
    {
      sub_100024D90(v213);
    }
    else
    {
      v216 = v230;
      (*(void (**)(char *, uint64_t, uint64_t))(v214 + 32))(v230, v213, v215);
      sub_1000229F0();
      (*(void (**)(char *, uint64_t))(v214 + 8))(v216, v215);
    }
    return;
  }
  uint64_t v98 = v97;
  unint64_t v42 = sub_100030CB0();

  uint64_t v223 = v12;
  if (v42 >> 62) {
    goto LABEL_117;
  }
  uint64_t v99 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v99)
  {
LABEL_118:
    swift_bridgeObjectRelease();
    uint64_t v28 = v236;
    goto LABEL_119;
  }
LABEL_83:
  unint64_t v246 = v42 & 0xC000000000000001;
  uint64_t v100 = 4;
  id v227 = a2;
  long long v229 = (char *)v42;
  uint64_t v235 = v99;
  while (1)
  {
    if (v246) {
      id v101 = (id)sub_100030E20();
    }
    else {
      id v101 = *(id *)(v42 + 8 * v100);
    }
    uint64_t v102 = v101;
    uint64_t v103 = v100 - 3;
    if (__OFADD__(v100 - 4, 1))
    {
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      swift_bridgeObjectRetain();
      uint64_t v99 = sub_100030E60();
      swift_bridgeObjectRelease();
      if (!v99) {
        goto LABEL_118;
      }
      goto LABEL_83;
    }
    id v104 = [v101 inviteEmail];
    if (v104) {
      break;
    }
LABEL_86:

    ++v100;
    if (v103 == v99) {
      goto LABEL_118;
    }
  }
  uint64_t v105 = v104;
  uint64_t v106 = sub_100030C60();
  uint64_t v108 = v107;

  id v109 = [v102 statusString];
  if (!v109)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = v244;
LABEL_85:
    uint64_t v99 = v235;
    goto LABEL_86;
  }
  id v110 = v109;
  *(void *)&long long v239 = v102;
  uint64_t v228 = sub_100030C60();
  unint64_t v241 = v111;

  id v112 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  v237 = (char *)v106;
  NSString v113 = sub_100030C50();
  swift_bridgeObjectRelease();
  id v114 = [v112 initWithStringValue:v113];

  uint64_t v115 = (char *)*((void *)a1 + 30);
  uint64_t v116 = *((void *)a1 + 31);
  uint64_t v117 = v115;
  id v118 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  NSString v119 = sub_100030C50();
  swift_bridgeObjectRelease();
  v245 = (char *)[v118 initWithStringValue:v119];

  id v238 = v114;
  id v120 = [v114 fullyQualifiedDigits];
  if (v120)
  {
    uint64_t v121 = v120;
    uint64_t v122 = sub_100030C60();
    uint64_t v124 = v123;

    id v125 = [v245 fullyQualifiedDigits];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = sub_100030C60();
      uint64_t v129 = v128;

      if (v122 == v127 && v124 == v129)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_110:
        unint64_t v144 = v241;
        swift_bridgeObjectRelease();
        uint64_t v145 = v226;
        sub_1000305C0();
        uint64_t v146 = v225;
        sub_100024DF0((uint64_t)v247, v225);
        swift_bridgeObjectRetain_n();
        uint64_t v147 = sub_100030620();
        os_log_type_t v148 = sub_100030D60();
        if (os_log_type_enabled(v147, v148))
        {
          uint64_t v149 = swift_slowAlloc();
          uint64_t v250 = swift_slowAlloc();
          *(_DWORD *)uint64_t v149 = 136315394;
          uint64_t v150 = *(void *)(v146 + 240);
          unint64_t v151 = *(void *)(v146 + 248);
          swift_bridgeObjectRetain();
          uint64_t v249 = sub_10002E7E4(v150, v151, &v250);
          sub_100030DA0();
          swift_bridgeObjectRelease();
          sub_100024E54(v146);
          *(_WORD *)(v149 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v152 = v228;
          uint64_t v249 = sub_10002E7E4(v228, v241, &v250);
          unint64_t v144 = v241;
          sub_100030DA0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v147, v148, "contact handle %s found in pending members with status %s", (uint8_t *)v149, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v240 + 8))(v145, v248);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          sub_100024E54(v146);
          (*(void (**)(char *, uint64_t))(v240 + 8))(v145, v248);
          swift_bridgeObjectRelease();
          uint64_t v152 = v228;
        }
        id v142 = v238;
        uint64_t v143 = v152;
        uint64_t v141 = (void *)v144;
        goto LABEL_114;
      }
      char v130 = sub_100030ED0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a2 = v227;
      if (v130) {
        goto LABEL_110;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      a2 = v227;
    }
  }
  if (v237 != v117 || v108 != v116)
  {
    char v131 = sub_100030ED0();
    swift_bridgeObjectRelease();
    if (v131) {
      goto LABEL_105;
    }
    swift_bridgeObjectRelease();

    a1 = v247;
    uint64_t v9 = v244;
    uint64_t v102 = (void *)v239;
    unint64_t v42 = (unint64_t)v229;
    goto LABEL_85;
  }
  swift_bridgeObjectRelease();
LABEL_105:
  uint64_t v132 = v224;
  sub_1000305C0();
  unint64_t v133 = v241;
  uint64_t v134 = v223;
  sub_100024DF0((uint64_t)v247, v223);
  swift_bridgeObjectRetain_n();
  uint64_t v135 = sub_100030620();
  os_log_type_t v136 = sub_100030D60();
  if (os_log_type_enabled(v135, v136))
  {
    uint64_t v137 = swift_slowAlloc();
    uint64_t v250 = swift_slowAlloc();
    *(_DWORD *)uint64_t v137 = 136315394;
    uint64_t v138 = *(void *)(v134 + 240);
    unint64_t v139 = *(void *)(v134 + 248);
    swift_bridgeObjectRetain();
    uint64_t v249 = sub_10002E7E4(v138, v139, &v250);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    sub_100024E54(v134);
    *(_WORD *)(v137 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v140 = v228;
    uint64_t v249 = sub_10002E7E4(v228, v133, &v250);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v135, v136, "contact handle %s found in pending members with status %s", (uint8_t *)v137, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v132, v248);
    uint64_t v141 = (void *)v133;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    sub_100024E54(v134);
    (*(void (**)(uint64_t, uint64_t))(v240 + 8))(v132, v248);
    swift_bridgeObjectRelease();
    uint64_t v141 = (void *)v133;
    uint64_t v140 = v228;
  }
  id v142 = v238;
  uint64_t v143 = v140;
LABEL_114:
  sub_1000226B4(v143, v141);
}

uint64_t sub_100024D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E88(&qword_10003C7F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024D90(uint64_t a1)
{
  uint64_t v2 = sub_100006E88(&qword_10003C7F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024E54(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InviteMessageDetails();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024EB0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100030570();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for FamilyInviteStatus(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyInviteStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FamilyInviteStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x10002505CLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100025084(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10002508C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FamilyInviteStatus()
{
  return &type metadata for FamilyInviteStatus;
}

unint64_t sub_1000250A8()
{
  unint64_t result = qword_10003D000;
  if (!qword_10003D000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D000);
  }
  return result;
}

uint64_t sub_1000250FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[33] = a3;
  v4[34] = a4;
  v4[31] = a1;
  v4[32] = a2;
  uint64_t v5 = sub_100030630();
  v4[35] = v5;
  v4[36] = *(void *)(v5 - 8);
  v4[37] = swift_task_alloc();
  return _swift_task_switch(sub_1000251C0, 0, 0);
}

uint64_t sub_1000251C0()
{
  id v1 = [objc_allocWithZone((Class)FACircleContext) initWithEventType:FACircleEventTypeAcceptInvitationFromMessages];
  v0[38] = v1;
  id v2 = objc_allocWithZone((Class)NSURLComponents);
  sub_1000304B0(v3);
  uint64_t v5 = v4;
  id v6 = [v2 initWithURL:v4 resolvingAgainstBaseURL:1];

  if (v6)
  {
    uint64_t v8 = v0[33];
    uint64_t v7 = v0[34];
    id v9 = [v6 fa_queryItemsDictionary];
    uint64_t v10 = sub_100030BF0();

    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100021E84(v8, v7, 0xD000000000000013, 0x8000000100033130, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_100006E88(&qword_10003C840);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100031ED0;
    *(void *)(inited + 32) = 0xD000000000000011;
    *(void *)(inited + 40) = 0x8000000100033150;
    *(void *)(inited + 72) = sub_100006E88(&qword_10003D010);
    *(void *)(inited + 48) = v10;
    sub_100028128(inited);
    Class isa = sub_100030BE0().super.isa;
    swift_bridgeObjectRelease();
    [v1 setAdditionalParameters:isa];
  }
  uint64_t v14 = v0[32];
  NSString v15 = sub_100030C50();
  [v1 setClientName:v15];

  id v16 = [objc_allocWithZone((Class)FACircleStateController) initWithPresenter:v14];
  v0[39] = v16;
  v0[2] = v0;
  v0[7] = v0 + 28;
  v0[3] = sub_1000254DC;
  uint64_t v17 = swift_continuation_init();
  v0[20] = _NSConcreteStackBlock;
  v0[21] = 0x40000000;
  v0[22] = sub_100021DFC;
  v0[23] = &unk_100039B48;
  v0[24] = v17;
  [v16 performWithContext:v1 completion:v0 + 20];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000254DC()
{
  return _swift_task_switch(sub_1000255BC, 0, 0);
}

uint64_t sub_1000255BC()
{
  uint64_t v23 = v0;
  uint64_t v1 = *(void **)(v0 + 224);
  id v2 = [v1 error];
  if (v2)
  {
    int v3 = v2;
    sub_1000305C0();
    id v4 = v3;
    uint64_t v5 = sub_100030620();
    os_log_type_t v6 = sub_100030D40();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void **)(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 288);
    uint64_t v10 = *(void *)(v0 + 296);
    uint64_t v11 = *(void *)(v0 + 280);
    if (v7)
    {
      uint64_t v19 = *(void *)(v0 + 280);
      uint64_t v20 = *(void *)(v0 + 296);
      uint64_t v18 = *(void **)(v0 + 312);
      uint64_t v21 = v1;
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_getErrorValue();
      uint64_t v13 = sub_100030F10();
      *(void *)(v0 + 232) = sub_10002E7E4(v13, v14, &v22);
      sub_100030DA0();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error loading stateController: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v1 = v21;
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v20, v19);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    }
  }
  else
  {
    NSString v15 = *(void **)(v0 + 304);
  }
  swift_task_dealloc();
  id v16 = *(uint64_t (**)(void *))(v0 + 8);
  return v16(v1);
}

uint64_t sub_10002581C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[39] = a3;
  v4[40] = a4;
  v4[37] = a1;
  v4[38] = a2;
  uint64_t v5 = sub_1000304E0();
  v4[41] = v5;
  v4[42] = *(void *)(v5 - 8);
  v4[43] = swift_task_alloc();
  uint64_t v6 = sub_100030630();
  v4[44] = v6;
  v4[45] = *(void *)(v6 - 8);
  v4[46] = swift_task_alloc();
  v4[47] = swift_task_alloc();
  return _swift_task_switch(sub_10002594C, 0, 0);
}

uint64_t sub_10002594C()
{
  uint64_t v29 = v0;
  uint64_t v2 = v0[42];
  uint64_t v1 = v0[43];
  uint64_t v3 = v0[41];
  uint64_t v4 = v0[37];
  sub_1000305C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_100030620();
  os_log_type_t v6 = sub_100030D60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[43];
    uint64_t v26 = v0[44];
    uint64_t v27 = v0[47];
    uint64_t v8 = v0[42];
    uint64_t v24 = v0[41];
    uint64_t v25 = v0[45];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v10 = sub_1000304A0();
    v0[36] = sub_10002E7E4(v10, v11, &v28);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v24);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Loading url for updateFamilyStatus %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v12(v27, v26);
  }
  else
  {
    uint64_t v13 = v0[47];
    uint64_t v14 = v0[44];
    uint64_t v15 = v0[45];
    (*(void (**)(void, void))(v0[42] + 8))(v0[43], v0[41]);

    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  v0[48] = v12;
  id v16 = [self mainBundle];
  id v17 = [v16 bundleIdentifier];

  if (v17)
  {
    uint64_t v18 = sub_100030C60();
    unint64_t v20 = v19;
  }
  else
  {
    unint64_t v20 = 0x8000000100033170;
    uint64_t v18 = 0xD00000000000002DLL;
  }
  v0[49] = v18;
  v0[50] = v20;
  v0[51] = self;
  sub_100030D00();
  v0[52] = sub_100030CF0();
  uint64_t v22 = sub_100030CE0();
  return _swift_task_switch(sub_100025C3C, v22, v21);
}

uint64_t sub_100025C3C()
{
  uint64_t v1 = *(void **)(v0 + 408);
  swift_release();
  *(unsigned char *)(v0 + 441) = [v1 canSendText];
  return _swift_task_switch(sub_100025CB8, 0, 0);
}

uint64_t sub_100025CB8()
{
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 320);
  if (*(unsigned char *)(v0 + 441)) {
    uint64_t v4 = 49;
  }
  else {
    uint64_t v4 = 48;
  }
  sub_100006E88(&qword_10003D020);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100032540;
  *(void *)(inited + 32) = sub_100030C60();
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = 0x6E65726566657250;
  *(void *)(inited + 56) = 0xEB00000000736563;
  *(void *)(inited + 64) = sub_100030C60();
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = v2;
  *(void *)(inited + 88) = v1;
  *(void *)(inited + 96) = sub_100030C60();
  *(void *)(inited + 104) = v8;
  *(void *)(inited + 112) = v4;
  *(void *)(inited + 120) = 0xE100000000000000;
  unint64_t v9 = sub_100028370(inited);
  sub_100021988(v9);
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone((Class)FAUpdateFamilyInviteStatusRequest);
  swift_bridgeObjectRetain();
  NSString v11 = sub_100030C50();
  swift_bridgeObjectRelease();
  Class isa = sub_100030BE0().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v10 initWithInviteCode:v11 inviteStatus:v3 responseFormat:1 additionalRequestParameters:isa];
  *(void *)(v0 + 424) = v13;

  if (v13)
  {
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 440;
    *(void *)(v0 + 24) = sub_100025F7C;
    uint64_t v14 = swift_continuation_init();
    *(void *)(v0 + 208) = _NSConcreteStackBlock;
    *(void *)(v0 + 216) = 0x40000000;
    *(void *)(v0 + 224) = sub_100021D48;
    *(void *)(v0 + 232) = &unk_100039B60;
    *(void *)(v0 + 240) = v14;
    [v13 startRequestWithCompletionHandler:v0 + 208];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void, void))(v0 + 8);
    return v15(0, 0);
  }
}

uint64_t sub_100025F7C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 432) = v1;
  if (v1) {
    uint64_t v2 = sub_100026120;
  }
  else {
    uint64_t v2 = sub_10002608C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002608C()
{
  uint64_t v1 = *(void **)(v0 + 424);

  uint64_t v2 = *(unsigned __int8 *)(v0 + 440);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void))(v0 + 8);
  return v3(v2, 0);
}

uint64_t sub_100026120()
{
  uint64_t v18 = v0;
  uint64_t v1 = *(void **)(v0 + 424);
  swift_willThrow();

  sub_1000305C0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100030620();
  os_log_type_t v3 = sub_100030D40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v15 = *(void *)(v0 + 368);
    id v16 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    id v13 = *(void **)(v0 + 424);
    uint64_t v14 = *(void *)(v0 + 352);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_100030F10();
    *(void *)(v0 + 280) = sub_10002E7E4(v5, v6, &v17);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error updaing family invite status %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v16(v15, v14);
  }
  else
  {
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
    uint64_t v8 = *(void *)(v0 + 368);
    uint64_t v9 = *(void *)(v0 + 352);

    swift_errorRelease();
    swift_errorRelease();

    v7(v8, v9);
  }
  uint64_t v10 = *(void *)(v0 + 432);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  NSString v11 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v11(v10, 1);
}

_OWORD *sub_100026398(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000263A8()
{
  return swift_release();
}

void *sub_1000263B0(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v6;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v7;
    uint64_t v8 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v8;
    uint64_t v9 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v9;
    uint64_t v10 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v11 = a2[11];
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v11;
    uint64_t v12 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v12;
    uint64_t v13 = a2[15];
    *(void *)(a1 + 112) = a2[14];
    *(void *)(a1 + 120) = v13;
    uint64_t v14 = a2[17];
    *(void *)(a1 + 128) = a2[16];
    *(void *)(a1 + 136) = v14;
    uint64_t v15 = a2[19];
    *(void *)(a1 + 144) = a2[18];
    *(void *)(a1 + 152) = v15;
    uint64_t v16 = a2[21];
    *(void *)(a1 + 160) = a2[20];
    *(void *)(a1 + 168) = v16;
    uint64_t v17 = a2[23];
    *(void *)(a1 + 176) = a2[22];
    *(void *)(a1 + 184) = v17;
    uint64_t v18 = a2[25];
    *(void *)(a1 + 192) = a2[24];
    *(void *)(a1 + 200) = v18;
    uint64_t v19 = a2[27];
    *(void *)(a1 + 208) = a2[26];
    *(void *)(a1 + 216) = v19;
    *(void *)(a1 + 224) = a2[28];
    *(unsigned char *)(a1 + 232) = *((unsigned char *)a2 + 232);
    *(unsigned char *)(a1 + 233) = *((unsigned char *)a2 + 233);
    *(unsigned char *)(a1 + 234) = *((unsigned char *)a2 + 234);
    uint64_t v20 = a2[31];
    *(void *)(a1 + 240) = a2[30];
    *(void *)(a1 + 248) = v20;
    uint64_t v21 = a2[33];
    uint64_t v22 = a3[24];
    id v40 = (void *)(a1 + v22);
    uint64_t v39 = (char *)a2 + v22;
    *(void *)(a1 + 256) = a2[32];
    *(void *)(a1 + 264) = v21;
    uint64_t v23 = sub_1000304E0();
    uint64_t v24 = *(void *)(v23 - 8);
    uint64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
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
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v25(v39, 1, v23))
    {
      uint64_t v26 = sub_100006E88(&qword_10003C868);
      memcpy(v40, v39, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v40, v39, v23);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v24 + 56))(v40, 0, 1, v23);
    }
    uint64_t v28 = a3[25];
    uint64_t v29 = (char *)v4 + v28;
    uint64_t v30 = (char *)a2 + v28;
    if (v25((char *)a2 + v28, 1, v23))
    {
      uint64_t v31 = sub_100006E88(&qword_10003C868);
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v29, v30, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v29, 0, 1, v23);
    }
    uint64_t v32 = a3[26];
    uint64_t v33 = (char *)v4 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = sub_100030510();
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
    {
      uint64_t v37 = sub_100006E88(&qword_10003C7F0);
      memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    *((unsigned char *)v4 + a3[27]) = *((unsigned char *)a2 + a3[27]);
  }
  return v4;
}

uint64_t sub_100026830(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[24];
  uint64_t v5 = sub_1000304E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v8 = a1 + a2[25];
  if (!v7(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v9 = a1 + a2[26];
  uint64_t v10 = sub_100030510();
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v9, 1, v10);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v9, v10);
  }
  return result;
}

uint64_t sub_100026A74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v15;
  uint64_t v16 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v16;
  uint64_t v17 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v17;
  uint64_t v18 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v18;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v19 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v19;
  uint64_t v20 = *(void *)(a2 + 264);
  uint64_t v21 = a3[24];
  uint64_t v38 = (void *)(a1 + v21);
  uint64_t v37 = (const void *)(a2 + v21);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v20;
  uint64_t v22 = sub_1000304E0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v24(v37, 1, v22))
  {
    uint64_t v25 = sub_100006E88(&qword_10003C868);
    memcpy(v38, v37, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v38, v37, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v38, 0, 1, v22);
  }
  uint64_t v26 = a3[25];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  if (v24((const void *)(a2 + v26), 1, v22))
  {
    uint64_t v29 = sub_100006E88(&qword_10003C868);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v27, v28, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v22);
  }
  uint64_t v30 = a3[26];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = sub_100030510();
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    uint64_t v35 = sub_100006E88(&qword_10003C7F0);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  *(unsigned char *)(a1 + a3[27]) = *(unsigned char *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100026EA4(uint64_t a1, uint64_t a2, int *a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[24];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_1000304E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = sub_100006E88(&qword_10003C868);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[25];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  int v18 = v11((void *)(a1 + v15), 1, v9);
  int v19 = v11(v17, 1, v9);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v16, v17, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v16, v9);
LABEL_12:
    uint64_t v20 = sub_100006E88(&qword_10003C868);
    memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v16, v17, v9);
LABEL_13:
  uint64_t v21 = a3[26];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_100030510();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 24))(v22, v23, v24);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_18;
  }
  if (v28)
  {
LABEL_18:
    uint64_t v29 = sub_100006E88(&qword_10003C7F0);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 16))(v22, v23, v24);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_19:
  *(unsigned char *)(a1 + a3[27]) = *(unsigned char *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_1000274A4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  long long v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  long long v10 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v10;
  long long v11 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v11;
  long long v12 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v12;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_WORD *)(a1 + 233) = *(_WORD *)(a2 + 233);
  long long v13 = *(_OWORD *)(a2 + 256);
  uint64_t v14 = a3[24];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v13;
  uint64_t v17 = sub_1000304E0();
  uint64_t v18 = *(void *)(v17 - 8);
  int v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17))
  {
    uint64_t v20 = sub_100006E88(&qword_10003C868);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v21 = a3[25];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  if (v19((const void *)(a2 + v21), 1, v17))
  {
    uint64_t v24 = sub_100006E88(&qword_10003C868);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(v22, v23, v17);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  }
  uint64_t v25 = a3[26];
  uint64_t v26 = (void *)(a1 + v25);
  int v27 = (const void *)(a2 + v25);
  uint64_t v28 = sub_100030510();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
  {
    uint64_t v30 = sub_100006E88(&qword_10003C7F0);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  *(unsigned char *)(a1 + a3[27]) = *(unsigned char *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_1000277B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v18;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v19;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  *(unsigned char *)(a1 + 234) = *(unsigned char *)(a2 + 234);
  uint64_t v20 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[24];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = sub_1000304E0();
  uint64_t v26 = *(void *)(v25 - 8);
  int v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v23, v24, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
LABEL_6:
    uint64_t v30 = sub_100006E88(&qword_10003C868);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v23, v24, v25);
LABEL_7:
  uint64_t v31 = a3[25];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  int v34 = v27((void *)(a1 + v31), 1, v25);
  int v35 = v27(v33, 1, v25);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 32))(v32, v33, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v32, 0, 1, v25);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v32, v25);
LABEL_12:
    uint64_t v36 = sub_100006E88(&qword_10003C868);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 40))(v32, v33, v25);
LABEL_13:
  uint64_t v37 = a3[26];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = sub_100030510();
  uint64_t v41 = *(void *)(v40 - 8);
  unint64_t v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v41 + 40))(v38, v39, v40);
      goto LABEL_19;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v38, v40);
    goto LABEL_18;
  }
  if (v44)
  {
LABEL_18:
    uint64_t v45 = sub_100006E88(&qword_10003C7F0);
    memcpy(v38, v39, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v41 + 32))(v38, v39, v40);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
LABEL_19:
  *(unsigned char *)(a1 + a3[27]) = *(unsigned char *)(a2 + a3[27]);
  return a1;
}

uint64_t sub_100027CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100027CC0);
}

uint64_t sub_100027CC0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100006E88(&qword_10003C868);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 96);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100006E88(&qword_10003C7F0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 104);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100027DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100027E08);
}

uint64_t sub_100027E08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100006E88(&qword_10003C868);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 96);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100006E88(&qword_10003C7F0);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 104);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for InviteMessageDetails()
{
  uint64_t result = qword_10003D088;
  if (!qword_10003D088) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100027F88()
{
  sub_1000280D4(319, &qword_10003D098, (void (*)(uint64_t))&type metadata accessor for URL);
  if (v0 <= 0x3F)
  {
    sub_1000280D4(319, (unint64_t *)&unk_10003D0A0, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000280D4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100030D90();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_100028128(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    os_log_type_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006E88(&qword_10003D158);
  uint64_t v2 = sub_100030E90();
  os_log_type_t v3 = (void *)v2;
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
    sub_100007AE0(v6, (uint64_t)&v15, &qword_10003D160);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10002EEE0(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100026398(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100028260(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006E88(&qword_10003D140);
  uint64_t v2 = (void *)sub_100030E90();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 48);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 16);
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002EF58(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    char v10 = (void *)(v2[7] + 16 * result);
    *char v10 = v7;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_100028370(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006E88(&qword_10003D170);
  uint64_t v2 = (void *)sub_100030E90();
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
    unint64_t result = sub_10002EEE0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
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

uint64_t sub_100028494(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 1016) = a7;
  *(void *)(v7 + 1008) = a5;
  *(void *)(v7 + 1000) = a4;
  *(unsigned char *)(v7 + 1637) = a3;
  *(void *)(v7 + 992) = a2;
  *(void *)(v7 + 984) = a1;
  uint64_t v8 = type metadata accessor for InviteMessageDetails();
  *(void *)(v7 + 1024) = v8;
  *(void *)(v7 + 1032) = *(void *)(v8 - 8);
  *(void *)(v7 + 1040) = swift_task_alloc();
  sub_100006E88(&qword_10003C7F0);
  *(void *)(v7 + 1048) = swift_task_alloc();
  *(void *)(v7 + 1056) = swift_task_alloc();
  uint64_t v9 = sub_100030510();
  *(void *)(v7 + 1064) = v9;
  *(void *)(v7 + 1072) = *(void *)(v9 - 8);
  *(void *)(v7 + 1080) = swift_task_alloc();
  sub_100006E88(&qword_10003C868);
  *(void *)(v7 + 1088) = swift_task_alloc();
  uint64_t v10 = sub_100030630();
  *(void *)(v7 + 1096) = v10;
  *(void *)(v7 + 1104) = *(void *)(v10 - 8);
  *(void *)(v7 + 1112) = swift_task_alloc();
  *(void *)(v7 + 1120) = swift_task_alloc();
  *(void *)(v7 + 1128) = swift_task_alloc();
  *(void *)(v7 + 1136) = swift_task_alloc();
  *(void *)(v7 + 1144) = swift_task_alloc();
  *(void *)(v7 + 1152) = swift_task_alloc();
  *(void *)(v7 + 1160) = swift_task_alloc();
  *(void *)(v7 + 1168) = swift_task_alloc();
  *(void *)(v7 + 1176) = swift_task_alloc();
  *(void *)(v7 + 1184) = swift_task_alloc();
  uint64_t v11 = sub_1000303E0();
  *(void *)(v7 + 1192) = v11;
  *(void *)(v7 + 1200) = *(void *)(v11 - 8);
  *(void *)(v7 + 1208) = swift_task_alloc();
  return _swift_task_switch(sub_10002875C, 0, 0);
}

void *sub_10002875C()
{
  uint64_t v138 = v0;
  uint64_t v1 = sub_1000303F0();
  uint64_t v130 = v0;
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    if (v2)
    {
      unint64_t v3 = *(void *)(v0 + 1200);
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
      v3 += 16;
      unint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 64));
      uint64_t v133 = *(void *)(v3 + 56);
      uint64_t v134 = v4;
      unint64_t v135 = v3;
      char v131 = (void (**)(void, void))(v3 - 8);
      uint64_t v6 = &_swiftEmptyDictionarySingleton;
      ((void (*)(void, unint64_t, void))v4)(*(void *)(v0 + 1208), v5, *(void *)(v0 + 1192));
      while (1)
      {
        sub_1000303C0();
        char v8 = sub_10002FE08();
        char v9 = v8 == 40 ? 39 : v8;
        uint64_t v10 = sub_1000303D0();
        if (v11) {
          break;
        }
        uint64_t v24 = (uint64_t)v6;
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_10002EF58(v9);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27)
        {
          v137[0] = (uint64_t)v6;
          if (!swift_isUniquelyReferenced_nonNull_native())
          {
            sub_10002FAB8();
            uint64_t v24 = v137[0];
          }
          uint64_t v6 = (void *)v24;
          sub_10002F890(v25, v24);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_6:
        (*v131)(*(void *)(v0 + 1208), *(void *)(v0 + 1192));
        v5 += v133;
        if (!--v2) {
          goto LABEL_29;
        }
        ((void (*)(void, unint64_t, void))v134)(*(void *)(v0 + 1208), v5, *(void *)(v0 + 1192));
      }
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      BOOL v14 = v6;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v137[0] = (uint64_t)v6;
      unint64_t v17 = sub_10002EF58(v9);
      uint64_t v18 = v6[2];
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
      char v21 = v16;
      if (v14[3] < v20)
      {
        sub_10002F264(v20, isUniquelyReferenced_nonNull_native);
        BOOL v14 = (void *)v137[0];
        unint64_t v22 = sub_10002EF58(v9);
        if ((v21 & 1) != (v23 & 1))
        {
          return (void *)sub_100030F00();
        }
        unint64_t v17 = v22;
        if ((v21 & 1) == 0) {
          goto LABEL_23;
        }
LABEL_4:
        uint64_t v6 = v14;
        uint64_t v7 = (uint64_t *)(v14[7] + 16 * v17);
        *uint64_t v7 = v12;
        v7[1] = (uint64_t)v13;
        swift_bridgeObjectRelease();
LABEL_5:
        swift_bridgeObjectRelease();
        uint64_t v0 = v130;
        goto LABEL_6;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v16) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_10002FAB8();
        BOOL v14 = (void *)v137[0];
        if (v21) {
          goto LABEL_4;
        }
      }
LABEL_23:
      v14[(v17 >> 6) + 8] |= 1 << v17;
      *(unsigned char *)(v14[6] + v17) = v9;
      int v28 = (uint64_t *)(v14[7] + 16 * v17);
      *int v28 = v12;
      v28[1] = (uint64_t)v13;
      uint64_t v29 = v14[2];
      BOOL v30 = __OFADD__(v29, 1);
      uint64_t v31 = v29 + 1;
      if (v30) {
        goto LABEL_37;
      }
      uint64_t v6 = v14;
      v14[2] = v31;
      goto LABEL_5;
    }
    uint64_t v6 = &_swiftEmptyDictionarySingleton;
LABEL_29:
    swift_bridgeObjectRelease();
    unint64_t v32 = (unint64_t)v6;
  }
  else
  {
    unint64_t v32 = sub_100028260((uint64_t)&_swiftEmptyArrayStorage);
  }
  unint64_t v135 = v32;
  *(void *)(v0 + 1216) = v32;
  sub_1000305C0();
  uint64_t v33 = sub_100030620();
  os_log_type_t v34 = sub_100030D60();
  if (os_log_type_enabled(v33, v34))
  {
    int v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Building message..", v35, 2u);
    swift_slowDealloc();
  }
  uint64_t v36 = *(void *)(v0 + 1184);
  uint64_t v37 = *(void *)(v0 + 1104);
  uint64_t v38 = *(void *)(v0 + 1096);

  uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  *(void *)(v0 + 1224) = v39;
  *(void *)(v0 + 1232) = (v37 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v39(v36, v38);
  uint64_t v40 = swift_allocBox();
  BOOL v14 = (void *)v41;
  *(void *)(v0 + 1240) = v40;
  *(void *)(v0 + 1248) = v41;
  sub_10002DB5C(v41);
  *(unsigned char *)(v0 + 1633) = 0;
  sub_10002EE6C();
  sub_100030C00();
  uint64_t v42 = *(void *)(v0 + 456);
  void *v14 = *(void *)(v0 + 448);
  v14[1] = v42;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1628) = 1;
  sub_100030C00();
  uint64_t v134 = v39;
  uint64_t v43 = *(void *)(v0 + 616);
  v14[2] = *(void *)(v0 + 608);
  v14[3] = v43;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1625) = 4;
  sub_100030C00();
  uint64_t v44 = *(void *)(v0 + 680);
  v14[4] = *(void *)(v0 + 672);
  v14[5] = v44;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1612) = 7;
  sub_100030C00();
  uint64_t v45 = *(void *)(v0 + 408);
  v14[12] = *(void *)(v0 + 400);
  v14[13] = v45;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1635) = 8;
  sub_100030C00();
  uint64_t v46 = *(void *)(v0 + 440);
  v14[22] = *(void *)(v0 + 432);
  v14[23] = v46;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1634) = 10;
  sub_100030C00();
  uint64_t v13 = (unsigned char *)(v0 + 1631);
  uint64_t v47 = *(void *)(v0 + 472);
  v14[24] = *(void *)(v0 + 464);
  v14[25] = v47;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 1632) = 3;
  sub_100030C00();
LABEL_38:
  uint64_t v49 = *(void *)(v0 + 504);
  v14[6] = *(void *)(v0 + 496);
  v14[7] = v49;
  swift_bridgeObjectRelease();
  *uint64_t v13 = 17;
  sub_100030C00();
  uint64_t v50 = *(void *)(v130 + 1088);
  uint64_t v51 = *(void *)(v130 + 1024);
  sub_1000304D0();
  swift_bridgeObjectRelease();
  sub_100008470(v50, (uint64_t)v14 + *(int *)(v51 + 96), &qword_10003C868);
  *(unsigned char *)(v130 + 1630) = 28;
  sub_100030C00();
  uint64_t v52 = *(void *)(v130 + 1088);
  uint64_t v53 = *(void *)(v130 + 1024);
  sub_1000304D0();
  swift_bridgeObjectRelease();
  sub_100008470(v52, (uint64_t)v14 + *(int *)(v53 + 100), &qword_10003C868);
  *(unsigned char *)(v130 + 1629) = 13;
  sub_100030C00();
  uint64_t v54 = *(void *)(v130 + 1072);
  uint64_t v55 = *(void *)(v130 + 1064);
  uint64_t v56 = *(void *)(v130 + 1056);
  uint64_t v57 = *(void *)(v130 + 1016);
  uint64_t v58 = *(void *)(v130 + 600);
  v14[32] = *(void *)(v130 + 592);
  v14[33] = v58;
  swift_bridgeObjectRelease();
  sub_100007AE0(v57, v56, &qword_10003C7F0);
  uint64_t v132 = v14;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v56, 1, v55) == 1)
  {
    sub_100024D90(*(void *)(v130 + 1056));
    if (*(void *)(v135 + 16))
    {
      sub_10002EF58(34);
      if (v59)
      {
        id v60 = objc_allocWithZone((Class)NSDateFormatter);
        swift_bridgeObjectRetain();
        id v61 = [v60 init];
        NSString v62 = sub_100030C50();
        [v61 setDateFormat:v62];

        NSString v63 = sub_100030C50();
        swift_bridgeObjectRelease();
        id v64 = [v61 dateFromString:v63];

        if (v64)
        {
          sub_1000304F0();

          uint64_t v65 = 0;
        }
        else
        {
          uint64_t v65 = 1;
        }
        uint64_t v79 = *(void *)(v130 + 1048);
        uint64_t v80 = *(void *)(v130 + 1024);
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v130 + 1072) + 56))(v79, v65, 1, *(void *)(v130 + 1064));
        sub_100008470(v79, (uint64_t)v132 + *(int *)(v80 + 104), &qword_10003C7F0);
        sub_1000305B0();
        uint64_t v81 = sub_100030620();
        os_log_type_t v82 = sub_100030D30();
        if (os_log_type_enabled(v81, v82))
        {
          uint64_t v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v83 = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, v82, "got date from message url", v83, 2u);
          swift_slowDealloc();
        }
        uint64_t v84 = *(void *)(v130 + 1168);
        uint64_t v85 = *(void *)(v130 + 1096);

        v134(v84, v85);
      }
    }
  }
  else
  {
    uint64_t v66 = *(void *)(v130 + 1080);
    uint64_t v67 = *(void *)(v130 + 1072);
    uint64_t v68 = *(void *)(v130 + 1064);
    uint64_t v69 = *(void *)(v130 + 1024);
    (*(void (**)(uint64_t, void, uint64_t))(v67 + 32))(v66, *(void *)(v130 + 1056), v68);
    uint64_t v70 = (uint64_t)v14 + *(int *)(v69 + 104);
    sub_100024D90(v70);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v70, v66, v68);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v67 + 56))(v70, 0, 1, v68);
    sub_1000305B0();
    uint64_t v71 = sub_100030620();
    os_log_type_t v72 = sub_100030D30();
    if (os_log_type_enabled(v71, v72))
    {
      os_log_type_t v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v73 = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "got date from msmessage", v73, 2u);
      swift_slowDealloc();
    }
    uint64_t v74 = *(void *)(v130 + 1176);
    uint64_t v75 = *(void *)(v130 + 1096);
    uint64_t v76 = *(void *)(v130 + 1080);
    uint64_t v77 = *(void *)(v130 + 1072);
    uint64_t v78 = *(void *)(v130 + 1064);

    v134(v74, v75);
    (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
  }
  *(unsigned char *)(v130 + 1627) = 11;
  sub_100030C00();
  uint64_t v86 = *(void *)(v130 + 624);
  uint64_t v87 = *(void *)(v130 + 632);
  *(unsigned char *)(v130 + 1626) = 14;
  sub_100030C00();
  *(void *)(v130 + 1256) = *(void *)(v130 + 656);
  *(void *)(v130 + 1264) = *(void *)(v130 + 664);
  *(unsigned char *)(v130 + 1624) = 15;
  sub_100030C00();
  *(void *)(v130 + 1272) = *(void *)(v130 + 688);
  *(void *)(v130 + 1280) = *(void *)(v130 + 696);
  *(unsigned char *)(v130 + 1623) = 16;
  sub_100030C00();
  uint64_t v88 = *(void *)(v130 + 424);
  *(void *)(v130 + 1288) = *(void *)(v130 + 416);
  *(void *)(v130 + 1296) = v88;
  *(unsigned char *)(v130 + 1622) = 18;
  sub_100030C00();
  *(void *)(v130 + 1304) = *(void *)(v130 + 752);
  *(void *)(v130 + 1312) = *(void *)(v130 + 760);
  *(unsigned char *)(v130 + 1621) = 19;
  sub_100030C00();
  *(void *)(v130 + 1320) = *(void *)(v130 + 784);
  *(void *)(v130 + 1328) = *(void *)(v130 + 792);
  *(unsigned char *)(v130 + 1620) = 20;
  sub_100030C00();
  *(void *)(v130 + 1336) = *(void *)(v130 + 816);
  *(void *)(v130 + 1344) = *(void *)(v130 + 824);
  *(unsigned char *)(v130 + 1618) = 21;
  sub_100030C00();
  *(void *)(v130 + 1352) = *(void *)(v130 + 848);
  *(void *)(v130 + 1360) = *(void *)(v130 + 856);
  *(unsigned char *)(v130 + 1616) = 22;
  sub_100030C00();
  *(void *)(v130 + 1368) = *(void *)(v130 + 880);
  *(void *)(v130 + 1376) = *(void *)(v130 + 888);
  *(unsigned char *)(v130 + 1614) = 23;
  sub_100030C00();
  *(void *)(v130 + 1384) = *(void *)(v130 + 912);
  *(void *)(v130 + 1392) = *(void *)(v130 + 920);
  *(unsigned char *)(v130 + 1636) = 24;
  sub_100030C00();
  *(void *)(v130 + 1400) = *(void *)(v130 + 640);
  *(void *)(v130 + 1408) = *(void *)(v130 + 648);
  *(unsigned char *)(v130 + 1610) = 25;
  sub_100030C00();
  *(void *)(v130 + 1416) = *(void *)(v130 + 544);
  *(void *)(v130 + 1424) = *(void *)(v130 + 552);
  *(unsigned char *)(v130 + 1608) = 26;
  sub_100030C00();
  uint64_t v89 = *(void *)(v130 + 488);
  *(void *)(v130 + 1432) = *(void *)(v130 + 480);
  *(void *)(v130 + 1440) = v89;
  *(unsigned char *)(v130 + 1609) = 27;
  sub_100030C00();
  *(void *)(v130 + 1448) = *(void *)(v130 + 720);
  *(void *)(v130 + 1456) = *(void *)(v130 + 728);
  *(unsigned char *)(v130 + 1611) = 29;
  sub_100030C00();
  *(void *)(v130 + 1464) = *(void *)(v130 + 512);
  *(void *)(v130 + 1472) = *(void *)(v130 + 520);
  *(unsigned char *)(v130 + 1613) = 30;
  sub_100030C00();
  *(void *)(v130 + 1480) = *(void *)(v130 + 576);
  *(void *)(v130 + 1488) = *(void *)(v130 + 584);
  *(unsigned char *)(v130 + 1615) = 31;
  sub_100030C00();
  *(void *)(v130 + 1496) = *(void *)(v130 + 832);
  *(void *)(v130 + 1504) = *(void *)(v130 + 840);
  *(unsigned char *)(v130 + 1617) = 32;
  sub_100030C00();
  *(void *)(v130 + 1512) = *(void *)(v130 + 896);
  *(void *)(v130 + 1520) = *(void *)(v130 + 904);
  *(unsigned char *)(v130 + 1619) = 33;
  sub_100030C00();
  *(void *)(v130 + 1528) = *(void *)(v130 + 864);
  *(void *)(v130 + 1536) = *(void *)(v130 + 872);
  if (*(void *)(v135 + 16) && (unint64_t v91 = sub_10002EF58(12), (v92 & 1) != 0))
  {
    os_log_type_t v93 = (void *)(*(void *)(v135 + 56) + 16 * v91);
    uint64_t v94 = v93[1];
    v132[30] = *v93;
    v132[31] = v94;
  }
  else
  {
    uint64_t v95 = *(void *)(v130 + 1008);
    if (!v95) {
      goto LABEL_60;
    }
    v132[30] = *(void *)(v130 + 1000);
    v132[31] = v95;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_60:
  sub_1000305C0();
  swift_retain();
  unint64_t v96 = sub_100030620();
  os_log_type_t type = sub_100030D60();
  BOOL v97 = os_log_type_enabled(v96, type);
  uint64_t v124 = *(void *)(v130 + 1096);
  uint64_t v125 = *(void *)(v130 + 1160);
  if (v97)
  {
    uint64_t v98 = (uint8_t *)swift_slowAlloc();
    v137[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v98 = 136315138;
    swift_beginAccess();
    unint64_t v99 = v132[31];
    uint64_t v121 = v132[30];
    swift_bridgeObjectRetain();
    *(void *)(v130 + 976) = sub_10002E7E4(v121, v99, v137);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v96, type, "recipient handle is %s", v98, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }
  v134(v125, v124);
  log = (char *)&_swiftEmptyArrayStorage;
  *(void *)(v130 + 928) = &_swiftEmptyArrayStorage;
  *(void *)(v130 + 800) = v86;
  *(void *)(v130 + 808) = v87;
  *(void *)(v130 + 768) = 44;
  *(void *)(v130 + 776) = 0xE100000000000000;
  sub_1000190D0();
  uint64_t v100 = sub_100030DC0();
  swift_bridgeObjectRelease();
  uint64_t v101 = *(void *)(v100 + 16);
  if (v101)
  {
    uint64_t v122 = (char **)(v130 + 928);
    uint64_t v102 = (uint64_t *)(v100 + 40);
    while (1)
    {
      uint64_t v103 = *v102;
      *(void *)(v130 + 736) = *(v102 - 1);
      *(void *)(v130 + 744) = v103;
      *(void *)(v130 + 704) = 58;
      *(void *)(v130 + 712) = 0xE100000000000000;
      unint64_t result = (void *)sub_100030DC0();
      uint64_t v104 = result[2];
      if (!v104) {
        break;
      }
      if (v104 == 1) {
        goto LABEL_78;
      }
      uint64_t v127 = result[5];
      uint64_t v128 = result[4];
      uint64_t v105 = result[7];
      uint64_t v126 = result[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_10002E4D4();
      log = *v122;
      unint64_t v107 = *((void *)*v122 + 2);
      unint64_t v106 = *((void *)*v122 + 3);
      if (v107 >= v106 >> 1)
      {
        log = sub_10002E520((char *)(v106 > 1), v107 + 1, 1, log);
        *uint64_t v122 = log;
      }
      *((void *)log + 2) = v107 + 1;
      uint64_t v108 = &log[32 * v107];
      *((void *)v108 + 4) = v128;
      *((void *)v108 + 5) = v127;
      *((void *)v108 + 6) = v126;
      *((void *)v108 + 7) = v105;
      v102 += 2;
      if (!--v101) {
        goto LABEL_70;
      }
    }
    __break(1u);
LABEL_78:
    __break(1u);
  }
  else
  {
LABEL_70:
    uint64_t v109 = *(void *)(v130 + 1024);
    int v110 = *(unsigned __int8 *)(v130 + 1637);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v132[28] = log;
    *((unsigned char *)v132 + *(int *)(v109 + 108)) = v110;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v110 == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000305C0();
      unint64_t v111 = sub_100030620();
      os_log_type_t v112 = sub_100030D60();
      if (os_log_type_enabled(v111, v112))
      {
        NSString v113 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v111, v112, "Message is in compose screen, return message with minimal details", v113, 2u);
        swift_slowDealloc();
      }
      uint64_t v114 = *(void *)(v130 + 1152);
      uint64_t v115 = *(void *)(v130 + 1096);
      uint64_t v116 = *(void *)(v130 + 1032);
      uint64_t v117 = *(void *)(v130 + 1024);
      uint64_t v118 = *(void *)(v130 + 984);

      v134(v114, v115);
      sub_100024DF0((uint64_t)v132, v118);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v116 + 56))(v118, 0, 1, v117);
      swift_release();
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
      uint64_t v90 = *(uint64_t (**)(void))(v130 + 8);
      return (void *)v90();
    }
    else
    {
      uint64_t v119 = swift_allocObject();
      *(void *)(v130 + 1544) = v119;
      *(void *)(v119 + 16) = 0;
      os_log_type_t v136 = (uint64_t (*)(uint64_t))((char *)&dword_10003CFF8 + dword_10003CFF8);
      id v120 = (void *)swift_task_alloc();
      *(void *)(v130 + 1552) = v120;
      *id v120 = v130;
      v120[1] = sub_10002A4C8;
      return (void *)v136(1);
    }
  }
  return result;
}

uint64_t sub_10002A4C8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1560) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002A5C8, 0, 0);
}

uint64_t sub_10002A5C8()
{
  uint64_t v106 = v0;
  uint64_t v1 = *(void *)(v0 + 1544);
  uint64_t v2 = *(void *)(v0 + 1248);
  uint64_t v3 = *(uint8_t **)(v0 + 1040);
  uint64_t v4 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = *(void *)(v0 + 1560);

  sub_100024DF0(v2, (uint64_t)v3);
  unint64_t v5 = *(void **)(v1 + 16);
  id v6 = v5;
  sub_100022F9C(v3, v5);
  char v8 = v7;

  sub_100024E54((uint64_t)v3);
  switch(*(unsigned char *)(v2 + 232))
  {
    case 4:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    default:
      char v9 = sub_100030ED0();
      swift_bridgeObjectRelease();
      if (v9)
      {
LABEL_6:
        sub_1000305C0();
        char v21 = sub_100030620();
        os_log_type_t v22 = sub_100030D60();
        if (os_log_type_enabled(v21, v22))
        {
          char v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Invite status is unknown, fetch family again from server", v23, 2u);
          swift_slowDealloc();
        }
        uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
        uint64_t v25 = *(void *)(v0 + 1144);
        uint64_t v26 = *(void *)(v0 + 1096);

        v24(v25, v26);
        uint64_t v103 = (uint64_t (*)(uint64_t))((char *)&dword_10003CFF8 + dword_10003CFF8);
        char v27 = (void *)swift_task_alloc();
        *(void *)(v0 + 1568) = v27;
        *char v27 = v0;
        v27[1] = sub_10002B80C;
        return v103(2);
      }
      uint64_t v10 = *(void *)(v0 + 1240);
      *(unsigned char *)(*(void *)(v0 + 1248) + 232) = v8;
      sub_1000305C0();
      swift_retain_n();
      uint64_t v11 = sub_100030620();
      os_log_type_t v12 = sub_100030D60();
      uint64_t v13 = swift_allocObject();
      *(unsigned char *)(v13 + 16) = 32;
      uint64_t v14 = swift_allocObject();
      *(unsigned char *)(v14 + 16) = 8;
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = sub_10002FF50;
      *(void *)(v15 + 24) = v10;
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = sub_10002FFC4;
      *(void *)(v16 + 24) = v15;
      *(void *)(v0 + 1584) = sub_100006E88(&qword_10003D138);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100032540;
      *(void *)(inited + 32) = sub_10002FF68;
      *(void *)(inited + 40) = v13;
      *(void *)(inited + 48) = sub_100030378;
      *(void *)(inited + 56) = v14;
      *(void *)(inited + 64) = sub_10002FFEC;
      *(void *)(inited + 72) = v16;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      os_log_type_t v18 = v12;
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v19 = *(void *)(v0 + 1248);
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v105 = swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 258;
        v20[2] = 32;
        swift_release();
        v20[3] = 8;
        swift_release();
        uint64_t v88 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
        uint64_t v81 = *(void *)(v0 + 1096);
        uint64_t v84 = *(void *)(v0 + 1136);
        *(void *)(v0 + 968) = sub_10002E7E4(*(void *)&aAccepteddeclin_1[8 * *(char *)(v19 + 232)], qword_100032858[*(char *)(v19 + 232)], &v105);
        sub_100030DA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v11, v18, "invite status %s", v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v88(v84, v81);
      }
      else
      {
        uint64_t v29 = v11;
        BOOL v30 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
        uint64_t v31 = *(void *)(v0 + 1136);
        uint64_t v32 = *(void *)(v0 + 1096);

        swift_release();
        swift_release();
        swift_release_n();
        swift_release();
        swift_release();
        v30(v31, v32);
        swift_bridgeObjectRelease();
      }
      id v33 = [self defaultStore];
      *(void *)(v0 + 1592) = v33;
      if (v33)
      {
        os_log_type_t v34 = v33;
        *(void *)(v0 + 16) = v0;
        *(void *)(v0 + 56) = v0 + 936;
        *(void *)(v0 + 24) = sub_10002C974;
        uint64_t v35 = swift_continuation_init();
        *(void *)(v0 + 240) = _NSConcreteStackBlock;
        *(void *)(v0 + 248) = 0x40000000;
        *(void *)(v0 + 256) = sub_10002E364;
        *(void *)(v0 + 264) = &unk_100039CE0;
        *(void *)(v0 + 272) = v35;
        [v34 aa_primaryAppleAccountWithCompletion:v0 + 240];
        return _swift_continuation_await(v0 + 16);
      }
      uint64_t v36 = *(void **)(*(void *)(v0 + 1544) + 16);
      if (!v36 || (v37 = v36, char v38 = sub_100030D70(), v37, (v38 & 1) == 0)) {
        swift_bridgeObjectRelease();
      }
      uint64_t v39 = *(void *)(v0 + 1544);
      uint64_t v40 = *(void *)(v0 + 1248);
      *(unsigned char *)(v40 + 233) = 0;
      uint64_t v41 = *(void **)(v39 + 16);
      uint64_t v42 = *(void *)(v40 + 256);
      unint64_t v43 = *(void *)(v40 + 264);
      id v44 = v41;
      swift_bridgeObjectRetain();
      LOBYTE(v41) = sub_100022320(v41, v42, v43);
      swift_bridgeObjectRelease();

      uint64_t v104 = v40;
      *(unsigned char *)(v40 + 234) = v41 & 1;
      sub_1000305C0();
      swift_retain_n();
      uint64_t v45 = sub_100030620();
      os_log_type_t v46 = sub_100030D60();
      uint64_t v47 = swift_allocObject();
      *(unsigned char *)(v47 + 16) = 0;
      uint64_t v48 = swift_allocObject();
      *(unsigned char *)(v48 + 16) = 8;
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = sub_10002FFF4;
      *(void *)(v49 + 24) = v39;
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = sub_10003001C;
      *(void *)(v50 + 24) = v49;
      uint64_t v51 = swift_initStackObject();
      *(_OWORD *)(v51 + 16) = xmmword_100032540;
      *(void *)(v51 + 32) = sub_100030378;
      *(void *)(v51 + 40) = v47;
      *(void *)(v51 + 48) = sub_100030378;
      *(void *)(v51 + 56) = v48;
      *(void *)(v51 + 64) = sub_10003004C;
      *(void *)(v51 + 72) = v50;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      BOOL v52 = os_log_type_enabled(v45, v46);
      uint64_t v53 = *(void *)(v0 + 1544);
      if (v52)
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v54 = 256;
        v54[2] = 0;
        swift_release();
        v54[3] = 8;
        swift_release();
        swift_beginAccess();
        uint64_t v55 = *(void **)(v53 + 16);
        if (v55) {
          uint64_t v56 = (uint64_t)[v55 ageCategory];
        }
        else {
          uint64_t v56 = 9;
        }
        swift_release_n();
        *(void *)(v0 + 952) = v56;
        sub_100030DA0();
        swift_release();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Age category: %ld", v54, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }

      uint64_t v57 = *(void *)(v0 + 1544);
      (*(void (**)(void, void))(v0 + 1224))(*(void *)(v0 + 1128), *(void *)(v0 + 1096));
      swift_beginAccess();
      uint64_t v58 = *(void **)(v57 + 16);
      if (!v58 || [v58 ageCategory] != (id)1) {
        goto LABEL_29;
      }
      uint64_t v59 = sub_10002E2B8(2, *(void *)(v0 + 1216));
      uint64_t v61 = v60;
      swift_bridgeObjectRelease();
      if (v61)
      {
        uint64_t v62 = *(void *)(v0 + 1248);
        *(void *)(v62 + 16) = v59;
        *(void *)(v62 + 24) = v61;
LABEL_29:
        swift_bridgeObjectRelease();
      }
      uint64_t v63 = *(void *)(v0 + 1248);
      switch(*(unsigned char *)(v63 + 232))
      {
        case 1:
          uint64_t v100 = *(void *)(v0 + 1528);
          uint64_t v101 = *(void *)(v0 + 1536);
          uint64_t v95 = *(void *)(v0 + 1512);
          uint64_t v97 = *(void *)(v0 + 1520);
          long long v98 = *(_OWORD *)(v0 + 1496);
          uint64_t v92 = *(void *)(v0 + 1488);
          uint64_t v93 = *(void *)(v0 + 1480);
          uint64_t v86 = *(void *)(v0 + 1472);
          uint64_t v89 = *(void *)(v0 + 1464);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v66 = v89;
          }
          else {
            uint64_t v66 = v93;
          }
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v67 = v86;
          }
          else {
            uint64_t v67 = v92;
          }
          goto LABEL_52;
        case 2:
          uint64_t v102 = *(void *)(v0 + 1296);
          uint64_t v99 = *(void *)(v0 + 1288);
          uint64_t v72 = *(void *)(v0 + 1280);
          uint64_t v94 = *(void *)(v0 + 1264);
          uint64_t v96 = *(void *)(v0 + 1272);
          uint64_t v90 = *(void *)(v0 + 1256);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(void *)(v63 + 112) = v90;
          *(void *)(v63 + 120) = v94;
          *(void *)(v63 + 128) = v96;
          *(void *)(v63 + 136) = v72;
          *(void *)(v63 + 160) = v99;
          *(void *)(v63 + 168) = v102;
          *(void *)(v63 + 144) = v96;
          *(void *)(v63 + 152) = v72;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_55;
        case 3:
          uint64_t v100 = *(void *)(v0 + 1448);
          uint64_t v101 = *(void *)(v0 + 1456);
          uint64_t v95 = *(void *)(v0 + 1432);
          uint64_t v97 = *(void *)(v0 + 1440);
          long long v98 = *(_OWORD *)(v0 + 1416);
          uint64_t v87 = *(void *)(v0 + 1408);
          uint64_t v91 = *(void *)(v0 + 1400);
          uint64_t v73 = *(void *)(v0 + 1392);
          uint64_t v83 = *(void *)(v0 + 1384);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v66 = v83;
          }
          else {
            uint64_t v66 = v91;
          }
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v67 = v73;
          }
          else {
            uint64_t v67 = v87;
          }
          goto LABEL_52;
        case 4:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000305C0();
          uint64_t v68 = sub_100030620();
          os_log_type_t v69 = sub_100030D40();
          if (os_log_type_enabled(v68, v69))
          {
            uint64_t v70 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v70 = 0;
            _os_log_impl((void *)&_mh_execute_header, v68, v69, "Invite status unknown", v70, 2u);
            swift_slowDealloc();
            uint64_t v71 = *(NSObject **)(v0 + 1592);
          }
          else
          {
            uint64_t v71 = v68;
            uint64_t v68 = *(NSObject **)(v0 + 1592);
          }
          uint64_t v74 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
          uint64_t v75 = *(void *)(v0 + 1120);
          uint64_t v76 = *(void *)(v0 + 1096);

          v74(v75, v76);
          goto LABEL_55;
        default:
          uint64_t v100 = *(void *)(v0 + 1368);
          uint64_t v101 = *(void *)(v0 + 1376);
          uint64_t v95 = *(void *)(v0 + 1352);
          uint64_t v97 = *(void *)(v0 + 1360);
          long long v98 = *(_OWORD *)(v0 + 1336);
          uint64_t v64 = *(void *)(v0 + 1328);
          uint64_t v65 = *(void *)(v0 + 1312);
          uint64_t v82 = *(void *)(v0 + 1304);
          uint64_t v85 = *(void *)(v0 + 1320);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v66 = v82;
          }
          else {
            uint64_t v66 = v85;
          }
          if (*(unsigned char *)(v104 + 233)) {
            uint64_t v67 = v65;
          }
          else {
            uint64_t v67 = v64;
          }
LABEL_52:
          swift_bridgeObjectRelease();
          *(void *)(v63 + 112) = v66;
          *(void *)(v63 + 120) = v67;
          *(void *)(v63 + 128) = v95;
          *(void *)(v63 + 136) = v97;
          *(void *)(v63 + 160) = v100;
          *(void *)(v63 + 168) = v101;
          *(_OWORD *)(v63 + 144) = v98;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_55:
          uint64_t v77 = *(void *)(v0 + 1032);
          uint64_t v78 = *(void *)(v0 + 1024);
          uint64_t v79 = *(void *)(v0 + 984);
          sub_100024DF0(*(void *)(v0 + 1248), v79);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v77 + 56))(v79, 0, 1, v78);
          swift_release();
          swift_release();
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
          uint64_t v80 = *(uint64_t (**)(void))(v0 + 8);
          uint64_t result = v80();
          break;
      }
      return result;
  }
}

uint64_t sub_10002B80C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1576) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002B90C, 0, 0);
}

uint64_t sub_10002B90C()
{
  uint64_t v95 = v0;
  uint64_t v1 = *(void *)(v0 + 1544);
  uint64_t v2 = *(void *)(v0 + 1248);
  uint64_t v3 = *(uint8_t **)(v0 + 1040);
  uint64_t v4 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = *(void *)(v0 + 1576);

  sub_100024DF0(v2, (uint64_t)v3);
  unint64_t v5 = *(void **)(v1 + 16);
  id v6 = v5;
  sub_100022F9C(v3, v5);
  LOBYTE(v5) = v7;

  sub_100024E54((uint64_t)v3);
  uint64_t v8 = *(void *)(v0 + 1240);
  *(unsigned char *)(*(void *)(v0 + 1248) + 232) = (_BYTE)v5;
  sub_1000305C0();
  swift_retain_n();
  char v9 = sub_100030620();
  os_log_type_t v10 = sub_100030D60();
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 32;
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 8;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_10002FF50;
  *(void *)(v13 + 24) = v8;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_10002FFC4;
  *(void *)(v14 + 24) = v13;
  *(void *)(v0 + 1584) = sub_100006E88(&qword_10003D138);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100032540;
  *(void *)(inited + 32) = sub_10002FF68;
  *(void *)(inited + 40) = v11;
  *(void *)(inited + 48) = sub_100030378;
  *(void *)(inited + 56) = v12;
  *(void *)(inited + 64) = sub_10002FFEC;
  *(void *)(inited + 72) = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v16 = *(void *)(v0 + 1248);
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v94 = swift_slowAlloc();
    *(_WORD *)unint64_t v17 = 258;
    v17[2] = 32;
    swift_release();
    v17[3] = 8;
    swift_release();
    uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
    uint64_t v84 = *(void *)(v0 + 1096);
    uint64_t v86 = *(void *)(v0 + 1136);
    *(void *)(v0 + 968) = sub_10002E7E4(*(void *)&aAccepteddeclin_1[8 * *(char *)(v16 + 232)], qword_100032858[*(char *)(v16 + 232)], &v94);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "invite status %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v89(v86, v84);
  }
  else
  {
    os_log_type_t v18 = v9;
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
    uint64_t v20 = *(void *)(v0 + 1136);
    uint64_t v21 = *(void *)(v0 + 1096);

    swift_release();
    swift_release();
    swift_release_n();
    swift_release();
    swift_release();
    v19(v20, v21);
    swift_bridgeObjectRelease();
  }
  id v22 = [self defaultStore];
  *(void *)(v0 + 1592) = v22;
  if (v22)
  {
    char v23 = v22;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 936;
    *(void *)(v0 + 24) = sub_10002C974;
    uint64_t v24 = swift_continuation_init();
    *(void *)(v0 + 240) = _NSConcreteStackBlock;
    *(void *)(v0 + 248) = 0x40000000;
    *(void *)(v0 + 256) = sub_10002E364;
    *(void *)(v0 + 264) = &unk_100039CE0;
    *(void *)(v0 + 272) = v24;
    [v23 aa_primaryAppleAccountWithCompletion:v0 + 240];
    return _swift_continuation_await(v0 + 16);
  }
  uint64_t v25 = *(void **)(*(void *)(v0 + 1544) + 16);
  if (!v25 || (id v26 = v25, v27 = sub_100030D70(), v26, (v27 & 1) == 0)) {
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = *(void *)(v0 + 1544);
  uint64_t v29 = *(void *)(v0 + 1248);
  *(unsigned char *)(v29 + 233) = 0;
  BOOL v30 = *(void **)(v28 + 16);
  uint64_t v31 = *(void *)(v29 + 256);
  unint64_t v32 = *(void *)(v29 + 264);
  id v33 = v30;
  swift_bridgeObjectRetain();
  LOBYTE(v30) = sub_100022320(v30, v31, v32);
  swift_bridgeObjectRelease();

  uint64_t v90 = v29;
  *(unsigned char *)(v29 + 234) = v30 & 1;
  sub_1000305C0();
  swift_retain_n();
  os_log_type_t v34 = sub_100030620();
  os_log_type_t v35 = sub_100030D60();
  uint64_t v36 = swift_allocObject();
  *(unsigned char *)(v36 + 16) = 0;
  uint64_t v37 = swift_allocObject();
  *(unsigned char *)(v37 + 16) = 8;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = sub_10002FFF4;
  *(void *)(v38 + 24) = v28;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_10003001C;
  *(void *)(v39 + 24) = v38;
  uint64_t v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = xmmword_100032540;
  *(void *)(v40 + 32) = sub_100030378;
  *(void *)(v40 + 40) = v36;
  *(void *)(v40 + 48) = sub_100030378;
  *(void *)(v40 + 56) = v37;
  *(void *)(v40 + 64) = sub_10003004C;
  *(void *)(v40 + 72) = v39;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  BOOL v41 = os_log_type_enabled(v34, v35);
  uint64_t v42 = *(void *)(v0 + 1544);
  if (v41)
  {
    unint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v43 = 256;
    void v43[2] = 0;
    swift_release();
    v43[3] = 8;
    swift_release();
    swift_beginAccess();
    id v44 = *(void **)(v42 + 16);
    if (v44) {
      uint64_t v45 = (uint64_t)[v44 ageCategory];
    }
    else {
      uint64_t v45 = 9;
    }
    swift_release_n();
    *(void *)(v0 + 952) = v45;
    sub_100030DA0();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Age category: %ld", v43, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v46 = *(void *)(v0 + 1544);
  (*(void (**)(void, void))(v0 + 1224))(*(void *)(v0 + 1128), *(void *)(v0 + 1096));
  swift_beginAccess();
  uint64_t v47 = *(void **)(v46 + 16);
  if (v47 && [v47 ageCategory] == (id)1)
  {
    uint64_t v48 = sub_10002E2B8(2, *(void *)(v0 + 1216));
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    if (!v50) {
      goto LABEL_22;
    }
    uint64_t v51 = *(void *)(v0 + 1248);
    *(void *)(v51 + 16) = v48;
    *(void *)(v51 + 24) = v50;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v52 = *(void *)(v0 + 1248);
  switch(*(unsigned char *)(v52 + 232))
  {
    case 1:
      uint64_t v91 = *(void *)(v0 + 1528);
      uint64_t v93 = *(void *)(v0 + 1536);
      uint64_t v82 = *(void *)(v0 + 1512);
      uint64_t v85 = *(void *)(v0 + 1520);
      long long v87 = *(_OWORD *)(v0 + 1496);
      uint64_t v79 = *(void *)(v0 + 1488);
      uint64_t v80 = *(void *)(v0 + 1480);
      uint64_t v74 = *(void *)(v0 + 1472);
      uint64_t v76 = *(void *)(v0 + 1464);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v55 = v76;
      }
      else {
        uint64_t v55 = v80;
      }
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v56 = v74;
      }
      else {
        uint64_t v56 = v79;
      }
      goto LABEL_42;
    case 2:
      uint64_t v92 = *(void *)(v0 + 1296);
      uint64_t v88 = *(void *)(v0 + 1288);
      uint64_t v57 = *(void *)(v0 + 1280);
      uint64_t v81 = *(void *)(v0 + 1264);
      uint64_t v83 = *(void *)(v0 + 1272);
      uint64_t v77 = *(void *)(v0 + 1256);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v52 + 112) = v77;
      *(void *)(v52 + 120) = v81;
      *(void *)(v52 + 128) = v83;
      *(void *)(v52 + 136) = v57;
      *(void *)(v52 + 160) = v88;
      *(void *)(v52 + 168) = v92;
      *(void *)(v52 + 144) = v83;
      *(void *)(v52 + 152) = v57;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_47;
    case 3:
      uint64_t v91 = *(void *)(v0 + 1448);
      uint64_t v93 = *(void *)(v0 + 1456);
      uint64_t v82 = *(void *)(v0 + 1432);
      uint64_t v85 = *(void *)(v0 + 1440);
      long long v87 = *(_OWORD *)(v0 + 1416);
      uint64_t v75 = *(void *)(v0 + 1408);
      uint64_t v78 = *(void *)(v0 + 1400);
      uint64_t v58 = *(void *)(v0 + 1392);
      uint64_t v72 = *(void *)(v0 + 1384);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v55 = v72;
      }
      else {
        uint64_t v55 = v78;
      }
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v56 = v58;
      }
      else {
        uint64_t v56 = v75;
      }
      goto LABEL_42;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000305C0();
      uint64_t v59 = sub_100030620();
      os_log_type_t v60 = sub_100030D40();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "Invite status unknown", v61, 2u);
        swift_slowDealloc();
        uint64_t v62 = *(NSObject **)(v0 + 1592);
      }
      else
      {
        uint64_t v62 = v59;
        uint64_t v59 = *(NSObject **)(v0 + 1592);
      }
      uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
      uint64_t v64 = *(void *)(v0 + 1120);
      uint64_t v65 = *(void *)(v0 + 1096);

      v63(v64, v65);
      goto LABEL_47;
    default:
      uint64_t v91 = *(void *)(v0 + 1368);
      uint64_t v93 = *(void *)(v0 + 1376);
      uint64_t v82 = *(void *)(v0 + 1352);
      uint64_t v85 = *(void *)(v0 + 1360);
      long long v87 = *(_OWORD *)(v0 + 1336);
      uint64_t v53 = *(void *)(v0 + 1328);
      uint64_t v54 = *(void *)(v0 + 1312);
      uint64_t v71 = *(void *)(v0 + 1304);
      uint64_t v73 = *(void *)(v0 + 1320);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v55 = v71;
      }
      else {
        uint64_t v55 = v73;
      }
      if (*(unsigned char *)(v90 + 233)) {
        uint64_t v56 = v54;
      }
      else {
        uint64_t v56 = v53;
      }
LABEL_42:
      swift_bridgeObjectRelease();
      *(void *)(v52 + 112) = v55;
      *(void *)(v52 + 120) = v56;
      *(void *)(v52 + 128) = v82;
      *(void *)(v52 + 136) = v85;
      *(void *)(v52 + 160) = v91;
      *(void *)(v52 + 168) = v93;
      *(_OWORD *)(v52 + 144) = v87;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_47:
      uint64_t v66 = *(void *)(v0 + 1032);
      uint64_t v67 = *(void *)(v0 + 1024);
      uint64_t v68 = *(void *)(v0 + 984);
      sub_100024DF0(*(void *)(v0 + 1248), v68);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v68, 0, 1, v67);
      swift_release();
      swift_release();
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
      os_log_type_t v69 = *(uint64_t (**)(void))(v0 + 8);
      uint64_t result = v69();
      break;
  }
  return result;
}

uint64_t sub_10002C974()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 1600) = v1;
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_10002D820;
  }
  else
  {
    uint64_t v2 = sub_10002CB98;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002CB98()
{
  uint64_t v1 = *(void **)(v0 + 936);
  if (v1
    && (id v2 = objc_msgSend(*(id *)(v0 + 936), "aa_primaryEmail"), v1, v2))
  {
    uint64_t v3 = sub_100030C60();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }

  id v6 = *(void **)(*(void *)(v0 + 1544) + 16);
  if (v6 && (id v7 = v6, v8 = sub_100030D70(), v7, (v8 & 1) != 0))
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(v0 + 1248);
      if (*(void *)(v9 + 256) == v3 && v5 == *(void *)(v9 + 264))
      {
        swift_bridgeObjectRelease();
        char v11 = 1;
      }
      else
      {
        char v11 = sub_100030ED0();
        swift_bridgeObjectRelease();
      }
      goto LABEL_15;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  char v11 = 0;
LABEL_15:
  uint64_t v12 = *(void *)(v0 + 1544);
  uint64_t v13 = *(void *)(v0 + 1248);
  *(unsigned char *)(v13 + 233) = v11 & 1;
  uint64_t v14 = *(void **)(v12 + 16);
  uint64_t v15 = *(void *)(v13 + 256);
  unint64_t v16 = *(void *)(v13 + 264);
  id v17 = v14;
  swift_bridgeObjectRetain();
  LOBYTE(v14) = sub_100022320(v14, v15, v16);
  swift_bridgeObjectRelease();

  uint64_t v72 = v13;
  *(unsigned char *)(v13 + 234) = v14 & 1;
  sub_1000305C0();
  swift_retain_n();
  os_log_type_t v18 = sub_100030620();
  os_log_type_t v19 = sub_100030D60();
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = 0;
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_10002FFF4;
  *(void *)(v22 + 24) = v12;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_10003001C;
  *(void *)(v23 + 24) = v22;
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100032540;
  *(void *)(inited + 32) = sub_100030378;
  *(void *)(inited + 40) = v20;
  *(void *)(inited + 48) = sub_100030378;
  *(void *)(inited + 56) = v21;
  *(void *)(inited + 64) = sub_10003004C;
  *(void *)(inited + 72) = v23;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  BOOL v25 = os_log_type_enabled(v18, v19);
  uint64_t v26 = *(void *)(v0 + 1544);
  if (v25)
  {
    char v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v27 = 256;
    v27[2] = 0;
    swift_release();
    v27[3] = 8;
    swift_release();
    swift_beginAccess();
    uint64_t v28 = *(void **)(v26 + 16);
    if (v28) {
      uint64_t v29 = (uint64_t)[v28 ageCategory];
    }
    else {
      uint64_t v29 = 9;
    }
    swift_release_n();
    *(void *)(v0 + 952) = v29;
    sub_100030DA0();
    swift_release();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Age category: %ld", v27, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }

  uint64_t v30 = *(void *)(v0 + 1544);
  (*(void (**)(void, void))(v0 + 1224))(*(void *)(v0 + 1128), *(void *)(v0 + 1096));
  swift_beginAccess();
  uint64_t v31 = *(void **)(v30 + 16);
  if (!v31 || [v31 ageCategory] != (id)1) {
    goto LABEL_25;
  }
  uint64_t v32 = sub_10002E2B8(2, *(void *)(v0 + 1216));
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  if (v34)
  {
    uint64_t v35 = *(void *)(v0 + 1248);
    *(void *)(v35 + 16) = v32;
    *(void *)(v35 + 24) = v34;
LABEL_25:
    swift_bridgeObjectRelease();
  }
  uint64_t v36 = *(void *)(v0 + 1248);
  switch(*(unsigned char *)(v36 + 232))
  {
    case 1:
      uint64_t v74 = *(void *)(v0 + 1536);
      uint64_t v71 = *(void *)(v0 + 1528);
      uint64_t v66 = *(void *)(v0 + 1512);
      uint64_t v68 = *(void *)(v0 + 1520);
      long long v69 = *(_OWORD *)(v0 + 1496);
      uint64_t v63 = *(void *)(v0 + 1488);
      uint64_t v64 = *(void *)(v0 + 1480);
      uint64_t v58 = *(void *)(v0 + 1472);
      uint64_t v60 = *(void *)(v0 + 1464);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v39 = v60;
      }
      else {
        uint64_t v39 = v64;
      }
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v40 = v58;
      }
      else {
        uint64_t v40 = v63;
      }
      goto LABEL_46;
    case 2:
      uint64_t v73 = *(void *)(v0 + 1296);
      uint64_t v70 = *(void *)(v0 + 1288);
      uint64_t v41 = *(void *)(v0 + 1280);
      uint64_t v65 = *(void *)(v0 + 1264);
      uint64_t v67 = *(void *)(v0 + 1272);
      uint64_t v61 = *(void *)(v0 + 1256);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v36 + 112) = v61;
      *(void *)(v36 + 120) = v65;
      *(void *)(v36 + 128) = v67;
      *(void *)(v36 + 136) = v41;
      *(void *)(v36 + 160) = v70;
      *(void *)(v36 + 168) = v73;
      *(void *)(v36 + 144) = v67;
      *(void *)(v36 + 152) = v41;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_52;
    case 3:
      uint64_t v74 = *(void *)(v0 + 1456);
      uint64_t v71 = *(void *)(v0 + 1448);
      uint64_t v66 = *(void *)(v0 + 1432);
      uint64_t v68 = *(void *)(v0 + 1440);
      long long v69 = *(_OWORD *)(v0 + 1416);
      uint64_t v59 = *(void *)(v0 + 1408);
      uint64_t v62 = *(void *)(v0 + 1400);
      uint64_t v42 = *(void *)(v0 + 1392);
      uint64_t v56 = *(void *)(v0 + 1384);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v39 = v56;
      }
      else {
        uint64_t v39 = v62;
      }
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v40 = v42;
      }
      else {
        uint64_t v40 = v59;
      }
      goto LABEL_46;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000305C0();
      unint64_t v43 = sub_100030620();
      os_log_type_t v44 = sub_100030D40();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Invite status unknown", v45, 2u);
        swift_slowDealloc();
        uint64_t v46 = *(NSObject **)(v0 + 1592);
      }
      else
      {
        uint64_t v46 = v43;
        unint64_t v43 = *(NSObject **)(v0 + 1592);
      }
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 1224);
      uint64_t v48 = *(void *)(v0 + 1120);
      uint64_t v49 = *(void *)(v0 + 1096);

      v47(v48, v49);
      goto LABEL_52;
    default:
      uint64_t v74 = *(void *)(v0 + 1376);
      uint64_t v71 = *(void *)(v0 + 1368);
      uint64_t v66 = *(void *)(v0 + 1352);
      uint64_t v68 = *(void *)(v0 + 1360);
      long long v69 = *(_OWORD *)(v0 + 1336);
      uint64_t v37 = *(void *)(v0 + 1328);
      uint64_t v38 = *(void *)(v0 + 1312);
      uint64_t v55 = *(void *)(v0 + 1304);
      uint64_t v57 = *(void *)(v0 + 1320);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v39 = v55;
      }
      else {
        uint64_t v39 = v57;
      }
      if (*(unsigned char *)(v72 + 233)) {
        uint64_t v40 = v38;
      }
      else {
        uint64_t v40 = v37;
      }
LABEL_46:
      swift_bridgeObjectRelease();
      *(void *)(v36 + 112) = v39;
      *(void *)(v36 + 120) = v40;
      *(void *)(v36 + 128) = v66;
      *(void *)(v36 + 136) = v68;
      *(void *)(v36 + 160) = v71;
      *(void *)(v36 + 168) = v74;
      *(_OWORD *)(v36 + 144) = v69;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_52:
      uint64_t v50 = *(void *)(v0 + 1032);
      uint64_t v51 = *(void *)(v0 + 1024);
      uint64_t v52 = *(void *)(v0 + 984);
      sub_100024DF0(*(void *)(v0 + 1248), v52);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v52, 0, 1, v51);
      swift_release();
      swift_release();
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
      uint64_t v53 = *(uint64_t (**)(void))(v0 + 8);
      return v53();
  }
}

uint64_t sub_10002D820()
{
  unint64_t v16 = v0;
  uint64_t v1 = (void *)v0[199];
  swift_willThrow();

  swift_release();
  swift_release();
  sub_1000305C0();
  swift_errorRetain();
  swift_errorRetain();
  id v2 = sub_100030620();
  os_log_type_t v3 = sub_100030D40();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[153];
    uint64_t v13 = v0[139];
    uint64_t v12 = v0[137];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_getErrorValue();
    uint64_t v5 = sub_100030F10();
    v0[118] = sub_10002E7E4(v5, v6, &v15);
    sub_100030DA0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v14(v13, v12);
  }
  else
  {
    id v7 = (void (*)(uint64_t, uint64_t))v0[153];
    uint64_t v8 = v0[139];
    uint64_t v9 = v0[137];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    v7(v8, v9);
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[129] + 56))(v0[123], 1, 1, v0[128]);
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
  os_log_type_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_10002DB5C@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0xE000000000000000;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0xE000000000000000;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0xE000000000000000;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 120) = 0xE000000000000000;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0xE000000000000000;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0xE000000000000000;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 168) = 0xE000000000000000;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = 0xE000000000000000;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 200) = 0xE000000000000000;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0xE000000000000000;
  *(void *)(a1 + 224) = &_swiftEmptyArrayStorage;
  *(_WORD *)(a1 + 232) = 4;
  *(unsigned char *)(a1 + 234) = 1;
  *(void *)(a1 + 240) = 0;
  *(void *)(a1 + 248) = 0xE000000000000000;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0xE000000000000000;
  id v2 = (int *)type metadata accessor for InviteMessageDetails();
  uint64_t v3 = a1 + v2[24];
  uint64_t v4 = sub_1000304E0();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(a1 + v2[25], 1, 1, v4);
  uint64_t v6 = a1 + v2[26];
  uint64_t v7 = sub_100030510();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(unsigned char *)(a1 + v2[27]) = 0;
  return result;
}

uint64_t sub_10002DCB4(char a1)
{
  uint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x536567617373656DLL;
      break;
    case 2:
      return result;
    case 3:
      uint64_t result = 0xD000000000000012;
      break;
    case 4:
    case 5:
    case 34:
    case 35:
      uint64_t result = 0xD000000000000011;
      break;
    case 6:
      uint64_t result = 0xD000000000000012;
      break;
    case 7:
      uint64_t result = 0x7255657469766E69;
      break;
    case 8:
      uint64_t result = 0xD000000000000017;
      break;
    case 9:
      uint64_t result = 0xD000000000000018;
      break;
    case 10:
      uint64_t result = 0xD000000000000012;
      break;
    case 11:
      uint64_t result = 0xD000000000000010;
      break;
    case 12:
      uint64_t result = 0x7265766965636572;
      break;
    case 13:
      uint64_t result = 0x61487265646E6573;
      break;
    case 14:
      uint64_t result = 0x54676E69646E6570;
      break;
    case 15:
      uint64_t result = 0x53676E69646E6570;
      break;
    case 16:
      uint64_t result = 0x49676E69646E6570;
      break;
    case 17:
      uint64_t result = 0x6E49747065636361;
      break;
    case 18:
      uint64_t result = 0xD000000000000013;
      break;
    case 19:
      uint64_t result = 0xD000000000000015;
      break;
    case 20:
      uint64_t result = 0xD000000000000018;
      break;
    case 21:
      uint64_t result = 0xD000000000000016;
      break;
    case 22:
      uint64_t v3 = 0x747065636361;
      goto LABEL_36;
    case 23:
      uint64_t result = 0xD000000000000012;
      break;
    case 24:
      uint64_t result = 0xD000000000000014;
      break;
    case 25:
      uint64_t result = 0xD000000000000017;
      break;
    case 26:
      uint64_t result = 0xD000000000000015;
      break;
    case 27:
      uint64_t result = 0x4964657269707865;
      break;
    case 28:
      uint64_t result = 0xD000000000000010;
      break;
    case 29:
      uint64_t result = 0xD000000000000013;
      break;
    case 30:
      uint64_t result = 0xD000000000000015;
      break;
    case 31:
      uint64_t result = 0xD000000000000018;
      break;
    case 32:
      uint64_t result = 0xD000000000000016;
      break;
    case 33:
      uint64_t v3 = 0x6E696C636564;
LABEL_36:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6465000000000000;
      break;
    case 36:
      uint64_t result = 0xD000000000000013;
      break;
    case 37:
      uint64_t result = 0xD000000000000017;
      break;
    case 38:
      uint64_t result = 0xD00000000000001DLL;
      break;
    case 39:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      uint64_t result = 0x546567617373656DLL;
      break;
  }
  return result;
}

uint64_t sub_10002E0B0(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_10002DCB4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10002DCB4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100030ED0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10002E13C()
{
  char v1 = *v0;
  sub_100030F20();
  sub_10002DCB4(v1);
  sub_100030C80();
  swift_bridgeObjectRelease();
  return sub_100030F30();
}

uint64_t sub_10002E1A0()
{
  sub_10002DCB4(*v0);
  sub_100030C80();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10002E1F4()
{
  char v1 = *v0;
  sub_100030F20();
  sub_10002DCB4(v1);
  sub_100030C80();
  swift_bridgeObjectRelease();
  return sub_100030F30();
}

uint64_t sub_10002E254@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10002FE08();
  *a1 = result;
  return result;
}

uint64_t sub_10002E284@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002DCB4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10002E2B0()
{
  return sub_10002DCB4(*v0);
}

uint64_t sub_10002E2B8(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  unint64_t v3 = sub_10002EF58(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(void *)(*(void *)(a2 + 56) + 16 * v3);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_10002E310()
{
  type metadata accessor for InviteMessageDetails();
  uint64_t v0 = swift_projectBox();
  swift_beginAccess();
  return sub_100021700(*(unsigned char *)(v0 + 232));
}

uint64_t sub_10002E364(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100006E88(&qword_10003CD48);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    char v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_1000300AC((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_10002E428(uint64_t a1)
{
  swift_beginAccess();
  char v2 = *(void **)(a1 + 16);
  if (v2) {
    return (uint64_t)[v2 ageCategory];
  }
  else {
    return 9;
  }
}

uint64_t sub_10002E480(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10002E4BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_10002E4CC(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

char *sub_10002E4D4()
{
  char v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v1;
  if (!result)
  {
    uint64_t result = sub_10002E520(result, *((void *)v1 + 2) + 1, 1, v1);
    *uint64_t v0 = result;
  }
  return result;
}

char *sub_10002E520(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006E88(&qword_10003CE18);
      os_log_type_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10002FE5C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unsigned char **sub_10002E630(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  char v4 = *result;
  *char v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10002E640(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_100030DA0();
  *a1 = v5;
  return result;
}

void *sub_10002E6A0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_100030EA0();
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

uint64_t sub_10002E744(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10002E76C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10002E7E4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100030DA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10002E7E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002E8B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100030114((uint64_t)v12, *a3);
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
      sub_100030114((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008804((uint64_t)v12);
  return v7;
}

uint64_t sub_10002E8B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100030DB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002EA74(a5, a6);
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
  uint64_t v8 = sub_100030E40();
  if (!v8)
  {
    sub_100030E50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100030EA0();
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

uint64_t sub_10002EA74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002EB0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002ECEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002ECEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002EB0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10002EC84(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100030E10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100030E50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100030C90();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100030EA0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100030E50();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002EC84(uint64_t a1, uint64_t a2)
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
  sub_100006E88(&qword_10003D150);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002ECEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006E88(&qword_10003D150);
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
  uint64_t result = sub_100030EA0();
  __break(1u);
  return result;
}

uint64_t sub_10002EE3C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_10002EE6C()
{
  unint64_t result = qword_10003D130;
  if (!qword_10003D130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D130);
  }
  return result;
}

unint64_t sub_10002EEC0(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_10002EEE0(uint64_t a1, uint64_t a2)
{
  sub_100030F20();
  sub_100030C80();
  Swift::Int v4 = sub_100030F30();

  return sub_10002F018(a1, a2, v4);
}

unint64_t sub_10002EF58(char a1)
{
  sub_100030F20();
  sub_10002DCB4(a1);
  sub_100030C80();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_100030F30();

  return sub_10002F0FC(a1, v2);
}

uint64_t sub_10002EFE0()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_10002F018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100030ED0() & 1) == 0)
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
      while (!v14 && (sub_100030ED0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002F0FC(char a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = sub_10002DCB4(*(unsigned char *)(*(void *)(v2 + 48) + v5));
    uint64_t v9 = v8;
    uint64_t v10 = sub_10002DCB4(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    char v15 = sub_100030ED0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v4;
      unint64_t v5 = (v5 + 1) & v16;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (sub_10002DCB4(*(unsigned char *)(*(void *)(v2 + 48) + v5)) != v13 || v17 != v14)
        {
          char v19 = sub_100030ED0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v19 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v16;
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

uint64_t sub_10002F264(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006E88(&qword_10003D140);
  char v37 = a2;
  uint64_t v6 = sub_100030E80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    char v26 = *(unsigned char *)(*(void *)(v5 + 48) + v21);
    char v27 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v21);
    uint64_t v28 = *v27;
    uint64_t v29 = v27[1];
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100030F20();
    sub_10002DCB4(v26);
    sub_100030C80();
    swift_bridgeObjectRelease();
    uint64_t result = sub_100030F30();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v7 + 48) + v18) = v26;
    char v19 = (void *)(*(void *)(v7 + 56) + 16 * v18);
    void *v19 = v28;
    v19[1] = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002F568(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006E88(&qword_10003D170);
  char v42 = a2;
  uint64_t v6 = sub_100030E80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    unint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    BOOL v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100030F20();
    sub_100030C80();
    uint64_t result = sub_100030F30();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    char v19 = (void *)(*(void *)(v7 + 48) + v18);
    void *v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10002F890(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100030DE0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        char v9 = *(unsigned char *)(*(void *)(a2 + 48) + v6);
        sub_100030F20();
        sub_10002DCB4(v9);
        sub_100030C80();
        swift_bridgeObjectRelease();
        uint64_t result = sub_100030F30();
        unint64_t v10 = result & v7;
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
          uint64_t v12 = (unsigned char *)(v11 + v3);
          int64_t v13 = (unsigned char *)(v11 + v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
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

unint64_t sub_10002FA68(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  unint64_t v6 = (void *)(a6[6] + 16 * result);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

void *sub_10002FAB8()
{
  char v1 = v0;
  sub_100006E88(&qword_10003D140);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100030E70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v19 = (void *)(*(void *)(v4 + 56) + 16 * v15);
    void *v19 = v18;
    v19[1] = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_10002FC4C()
{
  char v1 = v0;
  sub_100006E88(&qword_10003D170);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100030E70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    unint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *unint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002FE08()
{
  unint64_t v0 = sub_100030EF0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x28) {
    return 40;
  }
  else {
    return v0;
  }
}

uint64_t sub_10002FE5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100030EA0();
  __break(1u);
  return result;
}

uint64_t sub_10002FF50()
{
  return sub_10002E310();
}

uint64_t sub_10002FF58()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10002FF68(unsigned char **result)
{
  uint64_t v2 = *result;
  unsigned char *v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_10002FF7C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10002FF8C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002FFC4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002FFEC(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10002E76C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10002FFF4()
{
  return sub_10002E428(v0);
}

uint64_t sub_10002FFFC()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003000C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10003001C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_10003004C(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 8;
  uint64_t result = sub_100030DA0();
  *a1 = v3;
  return result;
}

uint64_t sub_1000300AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006E88(&qword_10003D148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030114(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t getEnumTagSinglePayload for InviteQueryItem(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xD9) {
    goto LABEL_17;
  }
  if (a2 + 39 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 39) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 39;
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
      return (*a1 | (v4 << 8)) - 39;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 39;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x28;
  int v8 = v6 - 40;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InviteQueryItem(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 39 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 39) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD8)
  {
    unsigned int v6 = ((a2 - 217) >> 8) + 1;
    *uint64_t result = a2 + 39;
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
        JUMPOUT(0x1000302CCLL);
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
          *uint64_t result = a2 + 39;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InviteQueryItem()
{
  return &type metadata for InviteQueryItem;
}

ValueMetadata *type metadata accessor for Subscription()
{
  return &type metadata for Subscription;
}

unint64_t sub_100030318()
{
  unint64_t result = qword_10003D168;
  if (!qword_10003D168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003D168);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000303A0()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_1000303B0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_1000303C0()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_1000303D0()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_1000303E0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_1000303F0()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_100030400()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100030410()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100030420()
{
  return DateComponents.day.getter();
}

uint64_t sub_100030430()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100030440(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100030450()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100030460()
{
  return static LocalizedStringResource.BundleDescription.familyCircleUI.getter();
}

uint64_t sub_100030470()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100030480()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100030490()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000304A0()
{
  return URL.absoluteString.getter();
}

void sub_1000304B0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000304C0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000304D0()
{
  return URL.init(string:)();
}

uint64_t sub_1000304E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000304F0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030500()
{
  return Date.init()();
}

uint64_t sub_100030510()
{
  return type metadata accessor for Date();
}

uint64_t sub_100030520()
{
  return static Locale.current.getter();
}

uint64_t sub_100030530()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100030540()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_100030550()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_100030560()
{
  return static Calendar.current.getter();
}

uint64_t sub_100030570()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100030580()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100030590()
{
  return static FamilyFeatureFlags.enabled(_:)();
}

uint64_t sub_1000305A0()
{
  return type metadata accessor for FamilyFeatureFlags();
}

uint64_t sub_1000305B0()
{
  return static FamilyLogger.common.getter();
}

uint64_t sub_1000305C0()
{
  return static FamilyLogger.extension.getter();
}

uint64_t sub_1000305D0()
{
  return dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteInteractionEvent(action:inviteState:isReceiver:)();
}

uint64_t sub_1000305E0()
{
  return dispatch thunk of FamilyInviteAnalytics.sendFamilyInviteStatusUpdateEvent(updateStatus:success:)();
}

uint64_t sub_1000305F0()
{
  return static FamilyInviteAnalytics.shared.getter();
}

uint64_t sub_100030600()
{
  return type metadata accessor for FamilyInviteAnalytics();
}

uint64_t sub_100030610()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100030620()
{
  return Logger.logObject.getter();
}

uint64_t sub_100030630()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100030640()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100030650()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100030660()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_100030670()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100030680()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_100030690()
{
  return _UIHostingView.addsKeyboardToSafeAreaInsets.setter();
}

uint64_t sub_1000306A0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_1000306B0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000306C0()
{
  return EnvironmentValues.controlSize.getter();
}

uint64_t sub_1000306D0()
{
  return EnvironmentValues.controlSize.setter();
}

uint64_t sub_1000306E0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000306F0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100030700()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100030710()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100030720()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100030730()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100030740()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_100030750(Swift::String a1)
{
}

void sub_100030760(Swift::String a1)
{
}

uint64_t sub_100030770()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100030780()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100030790()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_1000307A0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_1000307B0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000307C0()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t sub_1000307D0()
{
  return dispatch thunk of UIHostingController._disableSafeArea.setter();
}

uint64_t sub_1000307E0()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000307F0()
{
  return dispatch thunk of UIHostingController.rootView.setter();
}

uint64_t sub_100030800()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100030810()
{
  return type metadata accessor for LabelStyleConfiguration.Icon();
}

uint64_t sub_100030820()
{
  return LabelStyleConfiguration.icon.getter();
}

uint64_t sub_100030830()
{
  return type metadata accessor for LabelStyleConfiguration.Title();
}

uint64_t sub_100030840()
{
  return LabelStyleConfiguration.title.getter();
}

uint64_t sub_100030850()
{
  return CircularProgressViewStyle.init()();
}

uint64_t sub_100030860()
{
  return type metadata accessor for CircularProgressViewStyle();
}

uint64_t sub_100030870()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_100030880()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100030890()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000308A0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000308B0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000308C0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000308D0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_1000308E0()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_1000308F0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_100030900()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100030910()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100030920()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_100030930()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_100030940()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_100030950()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_100030960()
{
  return static Font.caption.getter();
}

uint64_t sub_100030970()
{
  return Font.leading(_:)();
}

uint64_t sub_100030980()
{
  return static Font.caption2.getter();
}

uint64_t sub_100030990()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000309A0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000309B0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000309C0()
{
  return Text.font(_:)();
}

uint64_t sub_1000309D0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000309E0()
{
  return Text.init(_:)();
}

uint64_t sub_1000309F0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100030A00()
{
  return View.fa_availableIf(condition:)();
}

uint64_t sub_100030A10()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100030A20()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100030A30()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t sub_100030A40()
{
  return View.labelStyle<A>(_:)();
}

uint64_t sub_100030A50()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100030A60()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_100030A70()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_100030A80()
{
  return Color.init(uiColor:)();
}

uint64_t sub_100030A90()
{
  return static Color.red.getter();
}

uint64_t sub_100030AA0()
{
  return static Color.gray.getter();
}

uint64_t sub_100030AB0()
{
  return static Color.green.getter();
}

uint64_t sub_100030AC0()
{
  return static Color.white.getter();
}

uint64_t sub_100030AD0()
{
  return static Color.primary.getter();
}

uint64_t sub_100030AE0()
{
  return Image.init(systemName:)();
}

uint64_t sub_100030AF0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100030B00()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100030B10()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100030B20()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_100030B30()
{
  return Label.init(title:icon:)();
}

uint64_t sub_100030B40()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100030B50()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100030B60()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100030B70()
{
  return Button.init(action:label:)();
}

uint64_t sub_100030B80()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100030B90()
{
  return static Alignment.center.getter();
}

uint64_t sub_100030BA0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100030BB0()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_100030BC0()
{
  return Animation.delay(_:)();
}

uint64_t sub_100030BD0()
{
  return static Animation.easeInOut(duration:)();
}

NSDictionary sub_100030BE0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100030BF0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030C00()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_100030C10()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_100030C20()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_100030C30()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100030C40()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100030C50()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100030C60()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030C70()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100030C80()
{
  return String.hash(into:)();
}

Swift::Int sub_100030C90()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100030CA0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100030CB0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100030CC0()
{
  return Array.description.getter();
}

uint64_t sub_100030CD0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100030CE0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100030CF0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100030D00()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100030D10()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100030D20()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100030D30()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100030D40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100030D50()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100030D60()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100030D70()
{
  return FAFamilyCircle.amIOrganizer.getter();
}

NSNumber sub_100030D80(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100030D90()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100030DA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100030DB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100030DC0()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100030DD0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_100030DE0()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100030DF0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100030E00()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100030E10()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100030E20()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100030E30()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100030E40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100030E50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100030E60()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100030E70()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100030E80()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100030E90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100030EA0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100030EB0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100030EC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100030ED0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100030EE0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_100030EF0()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_100030F00()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100030F10()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100030F20()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100030F30()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__presentAlertSheetWith_styles_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertSheetWith:styles:completion:");
}

id objc_msgSend__presentAlertSheetWithTitle_message_buttonTitles_styles_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:");
}