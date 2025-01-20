id sub_5BB8()
{
  id result;

  result = [objc_allocWithZone((Class)NSDateFormatter) init];
  qword_31750 = (uint64_t)result;
  return result;
}

id sub_5C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow] = 0;
  if (a3)
  {
    NSString v5 = sub_270B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for StartSharingTimeSelectionCell();
  id v6 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:", a1, v5);

  uint64_t v7 = qword_30F20;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  v9 = (void *)qword_31750;
  [(id)qword_31750 setDateStyle:2];
  [v9 setTimeStyle:0];

  return v8;
}

uint64_t sub_5E74(void *a1)
{
  v3 = sub_26DB8();
  Class isa = v3[-1].isa;
  uint64_t v6 = __chkstk_darwin(v3, v5);
  id v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  objc_super v11 = (char *)&v78 - v10;
  uint64_t v12 = sub_A070(&qword_310D0);
  __chkstk_darwin(v12 - 8, v13);
  v15 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_A070(&qword_312F8);
  __chkstk_darwin(v16 - 8, v17);
  v19 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_26A98();
  uint64_t result = __chkstk_darwin(v20, v21);
  v25 = (char *)&v78 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return result;
  }
  v81 = v3;
  uint64_t v82 = v23;
  v79 = v1;
  v80 = v25;
  v26 = a1;
  NSString v27 = sub_270B8();
  id v28 = [v26 propertyForKey:v27];

  if (v28)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
  }
  uint64_t v29 = v82;
  sub_E454((uint64_t)&v86, (uint64_t)&v89, &qword_31300);
  if (!*((void *)&v90 + 1))
  {
    sub_E658((uint64_t)&v89, &qword_31300);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v19, 1, 1, v20);
    goto LABEL_10;
  }
  int v30 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v19, v30 ^ 1u, 1, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v19, 1, v20) == 1)
  {
LABEL_10:
    sub_E658((uint64_t)v19, &qword_312F8);
    sub_26D88();
    v33 = sub_26DA8();
    os_log_type_t v34 = sub_27238();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_0, v33, v34, "Expected start date property of specifier", v35, 2u);
      swift_slowDealloc();
      v36 = v26;
    }
    else
    {
      v36 = v33;
      v33 = v26;
    }
    v37 = v81;

    return (*((uint64_t (**)(char *, NSObject *))isa + 1))(v8, v37);
  }
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v80, v19, v20);
  NSString v31 = sub_270B8();
  id v32 = [v26 propertyForKey:v31];

  if (v32)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
  }
  sub_E454((uint64_t)&v86, (uint64_t)&v89, &qword_31300);
  if (*((void *)&v90 + 1))
  {
    if (swift_dynamicCast())
    {
      char v38 = v84;
      v39 = v80;
      sub_26A68();
      char v40 = sub_26A88();
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = v26;
      v42 = v26;
      sub_D1EC((uint64_t)v15, v38, v40 & 1, (uint64_t)sub_E4F0, v41, (uint64_t *)&v89);
      long long v93 = v89;
      sub_E454((uint64_t)&v93 + 8, (uint64_t)v94, &qword_311F8);
      uint64_t v92 = *((void *)&v90 + 1);
      long long v86 = v89;
      long long v87 = v90;
      long long v88 = v91;
      id v43 = objc_allocWithZone((Class)sub_A070(&qword_31308));
      swift_retain();
      sub_DFD4((uint64_t)&v92);
      swift_retain();
      sub_DFA8((uint64_t)v94);
      uint64_t v44 = sub_26E98();
      uint64_t v45 = OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow;
      v46 = v79;
      v47 = *(void **)&v79[OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow];
      *(void *)&v79[OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow] = v44;

      v48 = *(void **)&v46[v45];
      if (v48)
      {
        id v49 = v48;
        id v50 = [v49 view];
        if (v50)
        {
          v51 = v50;
          NSString v52 = sub_270B8();
          id v53 = [v42 propertyForKey:v52];

          if (v53)
          {
            sub_272C8();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v84 = 0u;
            long long v85 = 0u;
          }
          v59 = v79;
          sub_E454((uint64_t)&v84, (uint64_t)&v86, &qword_31300);
          v81 = v42;
          id v78 = v49;
          if (*((void *)&v87 + 1))
          {
            sub_E550(0, &qword_31330);
            if (swift_dynamicCast())
            {
              id v60 = v83;
              objc_msgSend(v83, "addChildViewController:", v49, v78);
              NSString v61 = sub_270B8();
              [v42 removePropertyForKey:v61];

              v59 = v79;
            }
          }
          else
          {
            sub_E658((uint64_t)&v86, &qword_31300);
          }
          id v62 = objc_msgSend(v59, "contentView", v78);
          [v62 addSubview:v51];

          sub_A070(&qword_31310);
          uint64_t v63 = swift_allocObject();
          *(_OWORD *)(v63 + 16) = xmmword_27CB0;
          uint64_t v64 = sub_E550(0, &qword_31318);
          *(void *)(v63 + 56) = v64;
          *(void *)(v63 + 32) = v51;
          id v65 = v51;
          Class v66 = sub_27168().super.isa;
          swift_bridgeObjectRelease();
          [v59 setAccessibilityElements:v66];

          [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
          sub_A070(&qword_31320);
          uint64_t v67 = swift_allocObject();
          *(_OWORD *)(v67 + 16) = xmmword_27CC0;
          sub_E550(0, &qword_31328);
          id v68 = [v59 contentView];
          *((void *)&v87 + 1) = v64;
          *((void *)&v85 + 1) = v64;
          *(void *)&long long v86 = v68;
          *(void *)&long long v84 = v65;
          id v69 = v65;
          *(void *)(v67 + 32) = sub_7310(&v86, 5, 0, &v84, 5, 1.0, 0.0);
          id v70 = [v59 contentView];
          *((void *)&v87 + 1) = v64;
          *((void *)&v85 + 1) = v64;
          *(void *)&long long v86 = v70;
          *(void *)&long long v84 = v69;
          id v71 = v69;
          *(void *)(v67 + 40) = sub_7310(&v86, 6, 0, &v84, 6, 1.0, 0.0);
          id v72 = [v59 contentView];
          *((void *)&v87 + 1) = v64;
          *((void *)&v85 + 1) = v64;
          *(void *)&long long v86 = v72;
          *(void *)&long long v84 = v71;
          id v73 = v71;
          *(void *)(v67 + 48) = sub_7310(&v86, 3, 0, &v84, 3, 1.0, 0.0);
          id v74 = [v59 contentView];
          *((void *)&v87 + 1) = v64;
          *((void *)&v85 + 1) = v64;
          *(void *)&long long v86 = v74;
          *(void *)&long long v84 = v73;
          id v75 = v73;
          *(void *)(v67 + 56) = sub_7310(&v86, 4, 0, &v84, 4, 1.0, 0.0);
          *(void *)&long long v86 = v67;
          sub_27198();
          v76 = self;
          Class v77 = sub_27168().super.isa;
          swift_bridgeObjectRelease();
          [v76 activateConstraints:v77];
          swift_release();

          sub_E4F8((uint64_t)v94);
          sub_E524((uint64_t)&v92);

          swift_release();
          return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v80, v20);
        }
        (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v20);
        swift_release();

        sub_E4F8((uint64_t)v94);
        sub_E524((uint64_t)&v92);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v82 + 8))(v39, v20);
        swift_release();

        sub_E4F8((uint64_t)v94);
        sub_E524((uint64_t)&v92);
      }
      return swift_release();
    }
  }
  else
  {
    sub_E658((uint64_t)&v89, &qword_31300);
  }
  v54 = v80;
  v55 = v81;
  sub_26D88();
  v56 = sub_26DA8();
  os_log_type_t v57 = sub_27238();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_0, v56, v57, "Expected showCurrent property of specifier", v58, 2u);
    swift_slowDealloc();
  }

  (*((void (**)(char *, NSObject *))isa + 1))(v11, v55);
  return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v54, v20);
}

id sub_69E8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_26A98();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_26C68();
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_A070(&qword_312F8);
  __chkstk_darwin(v13 - 8, v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_26C58();
  sub_6C14(a1, (uint64_t)v12, (uint64_t)v16);
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v16, 1, v4) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v16, v4);
    uint64_t v17 = sub_27428();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
  }
  NSString v18 = sub_270B8();
  [a2 setProperty:v17 forKey:v18];
  swift_unknownObjectRelease();

  return [a2 performButtonAction];
}

uint64_t sub_6C14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a3;
  uint64_t v59 = a2;
  uint64_t v4 = sub_A070(&qword_310D0);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  id v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  id v50 = (char *)&v47 - v10;
  uint64_t v11 = sub_26C68();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  id v49 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_A070(&qword_310C8);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v51 = (uint64_t)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_26C18();
  uint64_t v52 = *(void *)(v18 - 8);
  uint64_t v53 = v18;
  __chkstk_darwin(v18, v19);
  v48 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_26CE8();
  uint64_t v54 = *(void *)(v21 - 8);
  uint64_t v55 = v21;
  __chkstk_darwin(v21, v22);
  uint64_t v24 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_26A98();
  uint64_t v56 = *(void *)(v25 - 8);
  uint64_t v57 = v25;
  __chkstk_darwin(v25, v26);
  id v28 = (char *)&v47 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v60 = a1;
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  uint64_t v29 = OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected;
  if ((*(unsigned char *)(a1 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected) & 1) == 0)
  {
    v47 = v8;
    os_log_type_t v34 = v24;
    sub_26CD8();
    swift_getKeyPath();
    uint64_t v60 = a1;
    sub_26D18();
    swift_release();
    if (*(unsigned char *)(a1 + v29))
    {
      uint64_t v35 = v51;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v51, 1, 1, v53);
    }
    else
    {
      swift_getKeyPath();
      uint64_t v60 = a1;
      sub_26D18();
      swift_release();
      uint64_t v36 = a1 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
      swift_beginAccess();
      uint64_t v35 = v51;
      sub_E290(v36, v51, &qword_310C8);
      uint64_t v37 = v52;
      uint64_t v38 = v53;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v35, 1, v53) != 1)
      {
        v42 = v48;
        (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v48, v35, v38);
        id v43 = v50;
        uint64_t v44 = v37;
        sub_26CC8();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v43, 1, v11) != 1)
        {
          (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v49, v43, v11);
          uint64_t v45 = v47;
          sub_26CB8();
          (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v45, 0, 1, v11);
          sub_26A78();
          swift_release();
          v46 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
          v46(v59, v11);
          v46((uint64_t)v49, v11);
          (*(void (**)(char *, uint64_t))(v44 + 8))(v42, v38);
          (*(void (**)(char *, uint64_t))(v54 + 8))(v34, v55);
          goto LABEL_3;
        }
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v59, v11);
        (*(void (**)(char *, uint64_t))(v37 + 8))(v42, v38);
        (*(void (**)(char *, uint64_t))(v54 + 8))(v34, v55);
        v39 = &qword_310D0;
        uint64_t v40 = (uint64_t)v43;
LABEL_8:
        sub_E658(v40, v39);
        uint64_t v33 = 1;
        uint64_t v30 = v57;
        uint64_t v32 = v58;
        uint64_t v31 = v56;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v32, v33, 1, v30);
      }
    }
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v59, v11);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v24, v55);
    v39 = &qword_310C8;
    uint64_t v40 = v35;
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
  sub_26A78();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v59, v11);
LABEL_3:
  uint64_t v31 = v56;
  uint64_t v30 = v57;
  uint64_t v32 = v58;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))(v58, v28, v57);
  uint64_t v33 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 56))(v32, v33, 1, v30);
}

id sub_7310(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double a6, double a7)
{
  sub_E58C(a1, a1[3]);
  uint64_t v14 = sub_27408();
  uint64_t v15 = a4[3];
  if (v15)
  {
    uint64_t v16 = sub_E58C(a4, a4[3]);
    uint64_t v24 = a5;
    uint64_t v25 = a2;
    uint64_t v17 = a3;
    uint64_t v18 = *(void *)(v15 - 8);
    __chkstk_darwin(v16, v16);
    uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    uint64_t v21 = sub_27408();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v15);
    a3 = v17;
    a5 = v24;
    a2 = v25;
    sub_E5D0((uint64_t)a4);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [(id)swift_getObjCClassFromMetadata() constraintWithItem:v14 attribute:a2 relatedBy:a3 toItem:v21 attribute:a5 multiplier:a6 constant:a7];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_E5D0((uint64_t)a1);
  return v22;
}

id sub_74E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StartSharingTimeSelectionCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StartSharingTimeSelectionCell()
{
  return self;
}

uint64_t sub_754C()
{
  uint64_t v0 = sub_A070(&qword_31358);
  __chkstk_darwin(v0 - 8, v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A070(&qword_31360);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26C18();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  started = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
  sub_E76C((uint64_t)started, qword_31758);
  uint64_t v14 = sub_E620((uint64_t)started, (uint64_t)qword_31758);
  uint64_t v15 = sub_26CE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = sub_26CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  sub_26C08();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  uint64_t v17 = v14 + started[5];
  uint64_t v18 = sub_26C68();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v20 = (void *)(v14 + started[6]);
  *uint64_t v20 = 0x5941444F54;
  v20[1] = 0xE500000000000000;
  uint64_t v21 = (void *)(v14 + started[7]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  return result;
}

uint64_t sub_7874()
{
  uint64_t v0 = sub_A070(&qword_31358);
  __chkstk_darwin(v0 - 8, v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A070(&qword_31360);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26C18();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  started = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
  sub_E76C((uint64_t)started, qword_31770);
  uint64_t v14 = sub_E620((uint64_t)started, (uint64_t)qword_31770);
  uint64_t v15 = sub_26CE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = sub_26CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  sub_26C08();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  uint64_t v17 = v14 + started[5];
  uint64_t v18 = sub_26C68();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v20 = (void *)(v14 + started[6]);
  *uint64_t v20 = 0x535941445F3033;
  v20[1] = 0xE700000000000000;
  uint64_t v21 = (void *)(v14 + started[7]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  return result;
}

uint64_t sub_7BA4()
{
  uint64_t v0 = sub_A070(&qword_31358);
  __chkstk_darwin(v0 - 8, v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A070(&qword_31360);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26C18();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  started = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
  sub_E76C((uint64_t)started, qword_31788);
  uint64_t v14 = sub_E620((uint64_t)started, (uint64_t)qword_31788);
  uint64_t v15 = sub_26CE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = sub_26CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  sub_26C08();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  uint64_t v17 = v14 + started[5];
  uint64_t v18 = sub_26C68();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v20 = (void *)(v14 + started[6]);
  *uint64_t v20 = 0x524145595F31;
  v20[1] = 0xE600000000000000;
  uint64_t v21 = (void *)(v14 + started[7]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  return result;
}

uint64_t sub_7ECC()
{
  uint64_t v0 = sub_A070(&qword_31358);
  __chkstk_darwin(v0 - 8, v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_A070(&qword_31360);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_26C18();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  started = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
  sub_E76C((uint64_t)started, qword_317A0);
  uint64_t v14 = sub_E620((uint64_t)started, (uint64_t)qword_317A0);
  uint64_t v15 = sub_26CE8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
  uint64_t v16 = sub_26CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  sub_26C08();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14, v12, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v14, 0, 1, v8);
  uint64_t v17 = v14 + started[5];
  uint64_t v18 = sub_26C68();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v20 = (void *)(v14 + started[6]);
  *uint64_t v20 = 0x53524145595F32;
  v20[1] = 0xE700000000000000;
  uint64_t v21 = (void *)(v14 + started[7]);
  *uint64_t v21 = 0;
  v21[1] = 0;
  return result;
}

uint64_t sub_81F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26CA8();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v6 = sub_27098();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v8 = sub_A070(&qword_310D0);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26C68();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E290(a1, (uint64_t)v11, &qword_310D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_E658((uint64_t)v11, &qword_310D0);
    uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 56))(a2, 1, 1, started);
  }
  else
  {
    uint64_t v39 = a2;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v38(v16, v11, v12);
    sub_270A8();
    type metadata accessor for WalletPrivacySettingsController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v20 = [self bundleForClass:ObjCClassFromMetadata];
    sub_26C98();
    sub_270E8();
    sub_A070(&qword_31348);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_27CB0;
    id v22 = [objc_allocWithZone((Class)NSDateFormatter) init];
    [v22 setDateStyle:1];
    [v22 setTimeStyle:0];
    Class isa = sub_26C48().super.isa;
    id v24 = [v22 stringFromDate:isa];

    uint64_t v25 = sub_270C8();
    uint64_t v27 = v26;

    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_E718();
    *(void *)(v21 + 32) = v25;
    *(void *)(v21 + 40) = v27;
    uint64_t v28 = sub_270D8();
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    uint64_t v31 = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
    uint64_t v32 = v39;
    uint64_t v33 = (char *)(v39 + v31[5]);
    v38(v33, v16, v12);
    uint64_t v34 = sub_26C18();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v32, 1, 1, v34);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v33, 0, 1, v12);
    uint64_t v35 = (void *)(v32 + v31[6]);
    void *v35 = 0x544E4552525543;
    v35[1] = 0xE700000000000000;
    uint64_t v36 = (uint64_t *)(v32 + v31[7]);
    uint64_t *v36 = v28;
    v36[1] = v30;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v31 - 1) + 56))(v32, 0, 1, v31);
  }
}

uint64_t sub_86B4()
{
  uint64_t v1 = sub_26CA8();
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v3 = sub_27098();
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v5 = (uint64_t *)(v0 + *(int *)(type metadata accessor for MenuButton.SharingStartDate(0) + 28));
  if (v5[1])
  {
    uint64_t v6 = *v5;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_270A8();
    type metadata accessor for WalletPrivacySettingsController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v8 = [self bundleForClass:ObjCClassFromMetadata];
    sub_26C98();
    uint64_t v6 = sub_270E8();
  }
  swift_bridgeObjectRetain();
  return v6;
}

Swift::Int sub_8840()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26C68();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A070(&qword_310D0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_26C18();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_A070(&qword_310C8);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_27448();
  sub_E290(v1, (uint64_t)v19, &qword_310C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v19, 1, v11) == 1)
  {
    sub_27468(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v19, v11);
    sub_27468(1u);
    sub_CD94(&qword_31188, (void (*)(uint64_t))&type metadata accessor for DateComponents);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  sub_E290(v1 + *(int *)(started + 20), (uint64_t)v10, &qword_310D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) == 1)
  {
    sub_27468(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v10, v2);
    sub_27468(1u);
    sub_CD94(&qword_31190, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  sub_27108();
  if (*(void *)(v1 + *(int *)(started + 28) + 8))
  {
    sub_27468(1u);
    swift_bridgeObjectRetain();
    sub_27108();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_27468(0);
  }
  return sub_27478();
}

void sub_8C40(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v3 = v2;
  uint64_t v4 = sub_26C68();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v23 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_A070(&qword_310D0);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26C18();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_A070(&qword_310C8);
  __chkstk_darwin(v17 - 8, v18);
  id v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E290(v3, (uint64_t)v20, &qword_310C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v20, 1, v12) == 1)
  {
    sub_27468(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v20, v12);
    sub_27468(1u);
    sub_CD94(&qword_31188, (void (*)(uint64_t))&type metadata accessor for DateComponents);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  uint64_t v21 = v24;
  sub_E290(v3 + *(int *)(v24 + 20), (uint64_t)v11, &qword_310D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    sub_27468(0);
  }
  else
  {
    uint64_t v22 = v23;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v23, v11, v4);
    sub_27468(1u);
    sub_CD94(&qword_31190, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v22, v4);
  }
  sub_27108();
  if (*(void *)(v3 + *(int *)(v21 + 28) + 8))
  {
    sub_27468(1u);
    swift_bridgeObjectRetain();
    sub_27108();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_27468(0);
  }
}

Swift::Int sub_9034(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_26C68();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v24 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A070(&qword_310D0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_26C18();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_A070(&qword_310C8);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_27448();
  sub_E290(v2, (uint64_t)v19, &qword_310C8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v19, 1, v11) == 1)
  {
    sub_27468(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v19, v11);
    sub_27468(1u);
    sub_CD94(&qword_31188, (void (*)(uint64_t))&type metadata accessor for DateComponents);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
  uint64_t v20 = v25;
  sub_E290(v2 + *(int *)(v25 + 20), (uint64_t)v10, &qword_310D0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
  {
    sub_27468(0);
  }
  else
  {
    uint64_t v21 = v24;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v24, v10, v3);
    sub_27468(1u);
    sub_CD94(&qword_31190, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_27068();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v21, v3);
  }
  sub_27108();
  if (*(void *)(v2 + *(int *)(v20 + 28) + 8))
  {
    sub_27468(1u);
    swift_bridgeObjectRetain();
    sub_27108();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_27468(0);
  }
  return sub_27478();
}

uint64_t sub_9438@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(v2 + *(int *)(a1 + 24));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_9450@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
  swift_beginAccess();
  return sub_DEEC(v3, a1);
}

uint64_t sub_951C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
  swift_beginAccess();
  return sub_DEEC(v4, a2);
}

uint64_t sub_95E8(uint64_t a1, uint64_t *a2)
{
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  __chkstk_darwin(started - 8, v5);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_DEEC(a1, (uint64_t)v7);
  uint64_t v8 = *a2;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D08();
  swift_release();
  return sub_E0DC((uint64_t)v7);
}

uint64_t sub_9710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
  swift_beginAccess();
  sub_E154(a2, v3);
  return swift_endAccess();
}

uint64_t sub_977C()
{
  swift_getKeyPath();
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected);
}

uint64_t sub_9824@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected);
  return result;
}

uint64_t sub_98D4()
{
  return swift_release();
}

uint64_t sub_99A4(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = sub_A070(&qword_31340);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  uint64_t v12 = *(void *)(started - 8);
  uint64_t v14 = __chkstk_darwin(started, v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)&v22 - v18;
  sub_26D28();
  sub_81F8(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, started) == 1)
  {
    sub_E658((uint64_t)v10, &qword_31340);
  }
  else
  {
    sub_E6B4((uint64_t)v10, (uint64_t)v16);
    if (a2)
    {
      sub_E658(a1, &qword_310D0);
      sub_E6B4((uint64_t)v16, (uint64_t)v19);
      goto LABEL_9;
    }
    sub_E0DC((uint64_t)v16);
  }
  if (qword_30F30 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_E620(started, (uint64_t)qword_31770);
  sub_DEEC(v20, (uint64_t)v19);
  sub_E658(a1, &qword_310D0);
LABEL_9:
  sub_E6B4((uint64_t)v19, v3 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate);
  *(unsigned char *)(v3 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected) = a3 & 1;
  return v3;
}

uint64_t sub_9BDC()
{
  sub_E0DC(v0 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate);
  uint64_t v1 = v0 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel___observationRegistrar;
  uint64_t v2 = sub_26D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_9C8C()
{
  return type metadata accessor for MenuButton.SharingStartDateModel(0);
}

uint64_t type metadata accessor for MenuButton.SharingStartDateModel(uint64_t a1)
{
  return sub_9DA8(a1, qword_30FB8);
}

uint64_t sub_9CB4()
{
  uint64_t result = type metadata accessor for MenuButton.SharingStartDate(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_26D38();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for MenuButton.SharingStartDate(uint64_t a1)
{
  return sub_9DA8(a1, (uint64_t *)&unk_31130);
}

uint64_t sub_9DA8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_9DE0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_26C18();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_A070(&qword_310C8);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_26C68();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = sub_A070(&qword_310D0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v17 = a3[6];
    uint64_t v18 = a3[7];
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = (uint64_t *)((char *)a1 + v18);
    uint64_t v23 = (uint64_t *)((char *)a2 + v18);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_A070(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_A0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_26C18();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_26C68();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_A22C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_26C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_A070(&qword_310C8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_26C68();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_A070(&qword_310D0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = &a1[v15];
  uint64_t v18 = &a2[v15];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = v19;
  uint64_t v20 = &a1[v16];
  uint64_t v21 = &a2[v16];
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = *(void *)v21;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_A46C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_26C18();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_A070(&qword_310C8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_26C68();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_A070(&qword_310D0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  uint64_t v21 = a3[6];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_A794(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_26C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_A070(&qword_310C8);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  int v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_26C68();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = sub_A070(&qword_310D0);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  return a1;
}

char *sub_A9B8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_26C18();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = sub_A070(&qword_310C8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_26C68();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v20 = sub_A070(&qword_310D0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_13:
  uint64_t v21 = a3[6];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v25 = *(void *)v23;
  uint64_t v24 = *((void *)v23 + 1);
  *(void *)uint64_t v22 = v25;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[7];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v30 = *(void *)v28;
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = v30;
  *((void *)v27 + 1) = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_ACC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_ACD4);
}

uint64_t sub_ACD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_A070(&qword_310C8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_A070(&qword_310D0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_ADF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_AE08);
}

uint64_t sub_AE08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_A070(&qword_310C8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_A070(&qword_310D0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_AF24()
{
  sub_B038(319, &qword_31140, (void (*)(uint64_t))&type metadata accessor for DateComponents);
  if (v0 <= 0x3F)
  {
    sub_B038(319, (unint64_t *)&unk_31148, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_B038(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_27298();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for MenuButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MenuButton()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for MenuButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for MenuButton(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MenuButton(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MenuButton(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MenuButton(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MenuButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MenuButton()
{
  return &type metadata for MenuButton;
}

uint64_t sub_B33C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_B358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  __chkstk_darwin(started, v3);
  uint64_t v55 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_26EC8();
  uint64_t v53 = *(void *)(v5 - 8);
  uint64_t v54 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_A070(&qword_311B8);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_A070(&qword_311C0);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_A070(&qword_311C8);
  __chkstk_darwin(v51, v18);
  uint64_t v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_A070(&qword_311D0);
  uint64_t v21 = *(void *)(v52 - 8);
  __chkstk_darwin(v52, v22);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_A070(&qword_311D8);
  __chkstk_darwin(v50, v25);
  id v49 = (char *)&v48 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v20 = sub_26E88();
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v27 = (uint64_t)&v20[*(int *)(sub_A070(&qword_311E0) + 44)];
  *(void *)uint64_t v12 = sub_26E48();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v28 = sub_A070(&qword_311E8);
  sub_B990(v2, (uint64_t)&v12[*(int *)(v28 + 44)]);
  LOBYTE(v2) = sub_26ED8();
  sub_26DC8();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_E290((uint64_t)v12, (uint64_t)v17, &qword_311B8);
  uint64_t v37 = &v17[*(int *)(v14 + 44)];
  char *v37 = (char)v2;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  sub_E658((uint64_t)v12, &qword_311B8);
  sub_E454((uint64_t)v17, v27, &qword_311C0);
  sub_26EB8();
  sub_E3F8(&qword_311F0, &qword_311C8);
  sub_26F98();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v8, v54);
  sub_E658((uint64_t)v20, &qword_311C8);
  uint64_t v38 = (uint64_t)v49;
  uint64_t v39 = v52;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v49, v24, v52);
  uint64_t v40 = (uint64_t (**)())(v38 + *(int *)(v50 + 36));
  *uint64_t v40 = sub_CC4C;
  v40[1] = 0;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v39);
  uint64_t v41 = v48;
  long long v60 = *v48;
  sub_E454((uint64_t)&v60 + 8, (uint64_t)v61, &qword_311F8);
  long long v58 = v60;
  sub_A070(&qword_31200);
  sub_26FC8();
  uint64_t v42 = v59;
  swift_getKeyPath();
  *(void *)&long long v58 = v42;
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  uint64_t v43 = v42 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
  swift_beginAccess();
  uint64_t v44 = v55;
  sub_DEEC(v43, v55);
  swift_release();
  uint64_t v59 = *((void *)v41 + 3);
  uint64_t v45 = (_OWORD *)swift_allocObject();
  long long v46 = v41[1];
  v45[1] = *v41;
  v45[2] = v46;
  v45[3] = v41[2];
  swift_retain();
  sub_DFA8((uint64_t)v61);
  sub_DFD4((uint64_t)&v59);
  sub_E000();
  sub_CD94(&qword_31180, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDate);
  swift_retain();
  sub_26FA8();
  swift_release();
  sub_E0DC(v44);
  return sub_E658(v38, &qword_311D8);
}

uint64_t sub_B990@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = a2;
  uint64_t v83 = sub_26E78();
  uint64_t v84 = *(void *)(v83 - 8);
  __chkstk_darwin(v83, v3);
  uint64_t v82 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_26DF8();
  uint64_t v73 = *(void *)(v71 - 8);
  __chkstk_darwin(v71, v5);
  id v65 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_A070(&qword_31218);
  uint64_t v69 = *(void *)(v67 - 8);
  __chkstk_darwin(v67, v7);
  uint64_t v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_A070(&qword_31220);
  uint64_t v79 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v10);
  uint64_t v63 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_A070(&qword_31228);
  uint64_t v75 = *(void *)(v77 - 8);
  __chkstk_darwin(v77, v12);
  Class v66 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_A070(&qword_31230) - 8;
  __chkstk_darwin(v70, v14);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_A070(&qword_31238) - 8;
  __chkstk_darwin(v72, v17);
  uint64_t v68 = (uint64_t)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_A070(&qword_31240) - 8;
  __chkstk_darwin(v80, v19);
  uint64_t v76 = (uint64_t)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_A070(&qword_31248) - 8;
  uint64_t v22 = __chkstk_darwin(v81, v21);
  uint64_t v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v25);
  uint64_t v78 = (uint64_t)&v62 - v26;
  uint64_t v64 = a1;
  long long v87 = a1;
  long long v86 = a1;
  sub_A070(&qword_31250);
  sub_A070(&qword_31258);
  sub_E1C8();
  uint64_t v27 = sub_DEA4(&qword_31268);
  uint64_t v28 = sub_26E38();
  uint64_t v29 = sub_DEA4(&qword_31270);
  uint64_t v30 = sub_E3F8(&qword_31278, &qword_31270);
  *(void *)&long long v88 = v29;
  *((void *)&v88 + 1) = v30;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(void *)&long long v88 = v27;
  *((void *)&v88 + 1) = v28;
  *(void *)&long long v89 = OpaqueTypeConformance2;
  *((void *)&v89 + 1) = &protocol witness table for InlinePickerStyle;
  swift_getOpaqueTypeConformance2();
  sub_26EF8();
  uint64_t v32 = v65;
  sub_26DE8();
  uint64_t v33 = sub_E3F8(&qword_31280, &qword_31218);
  uint64_t v34 = sub_CD94(&qword_31288, (void (*)(uint64_t))&type metadata accessor for ButtonMenuStyle);
  uint64_t v35 = v63;
  uint64_t v36 = v67;
  uint64_t v37 = v71;
  sub_26FB8();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v32, v37);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v36);
  uint64_t v38 = v82;
  sub_26E68();
  *(void *)&long long v88 = v36;
  *((void *)&v88 + 1) = v37;
  *(void *)&long long v89 = v33;
  *((void *)&v89 + 1) = v34;
  swift_getOpaqueTypeConformance2();
  sub_CD94(&qword_31290, (void (*)(uint64_t))&type metadata accessor for BorderedButtonStyle);
  uint64_t v39 = v66;
  uint64_t v40 = v74;
  uint64_t v41 = v83;
  sub_26F58();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v38, v41);
  (*(void (**)(char *, uint64_t))(v79 + 8))(v35, v40);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v43 = v75;
  uint64_t v44 = v77;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v16, v39, v77);
  uint64_t v45 = &v16[*(int *)(v70 + 44)];
  *(void *)uint64_t v45 = KeyPath;
  v45[8] = 2;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v39, v44);
  LODWORD(KeyPath) = sub_26EA8();
  uint64_t v46 = v68;
  sub_E290((uint64_t)v16, v68, &qword_31230);
  *(_DWORD *)(v46 + *(int *)(v72 + 44)) = KeyPath;
  sub_E658((uint64_t)v16, &qword_31230);
  LOBYTE(KeyPath) = sub_26EE8();
  long long v47 = v64[1];
  long long v88 = *v64;
  long long v89 = v47;
  long long v90 = v64[2];
  sub_E23C();
  sub_26F28();
  sub_26DC8();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v56 = v76;
  sub_E290(v46, v76, &qword_31238);
  uint64_t v57 = v56 + *(int *)(v80 + 44);
  *(unsigned char *)uint64_t v57 = KeyPath;
  *(void *)(v57 + 8) = v49;
  *(void *)(v57 + 16) = v51;
  *(void *)(v57 + 24) = v53;
  *(void *)(v57 + 32) = v55;
  *(unsigned char *)(v57 + 40) = 0;
  sub_E658(v46, &qword_31238);
  sub_E290(v56, (uint64_t)v24, &qword_31240);
  v24[*(int *)(v81 + 44)] = 0;
  sub_E658(v56, &qword_31240);
  uint64_t v58 = v78;
  sub_E454((uint64_t)v24, v78, &qword_31248);
  sub_E290(v58, (uint64_t)v24, &qword_31248);
  uint64_t v59 = v85;
  sub_E290((uint64_t)v24, v85, &qword_31248);
  uint64_t v60 = v59 + *(int *)(sub_A070(&qword_312A0) + 48);
  *(void *)uint64_t v60 = 0;
  *(unsigned char *)(v60 + 8) = 0;
  sub_E658(v58, &qword_31248);
  return sub_E658((uint64_t)v24, &qword_31248);
}

uint64_t sub_C304@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_26E38();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  uint64_t v39 = v4;
  __chkstk_darwin(v3, v5);
  uint64_t v37 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A070(&qword_312B0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_A070(&qword_31270);
  uint64_t v34 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_A070(&qword_31268);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v35 = v13;
  uint64_t v36 = v14;
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_26E58();
  uint64_t v32 = v19;
  uint64_t v33 = v18;
  v30[3] = v20;
  uint64_t v31 = v21;
  long long v42 = *a1;
  sub_A070(&qword_31200);
  sub_26FD8();
  uint64_t v23 = v43;
  uint64_t v22 = v44;
  uint64_t v24 = v45;
  swift_getKeyPath();
  uint64_t v43 = v23;
  uint64_t v44 = v22;
  uint64_t v45 = v24;
  sub_A070(&qword_312B8);
  sub_26FF8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v41 = a1;
  type metadata accessor for MenuButton.SharingStartDate(0);
  sub_A070(&qword_312C0);
  sub_CD94(&qword_312C8, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDate);
  sub_E360();
  sub_26FE8();
  uint64_t v25 = sub_E3F8(&qword_31278, &qword_31270);
  sub_26F78();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v9);
  uint64_t v26 = v37;
  sub_26E28();
  uint64_t v43 = v9;
  uint64_t v44 = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v27 = v35;
  uint64_t v28 = v38;
  sub_26F68();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v27);
}

uint64_t sub_C740()
{
  return sub_27008();
}

uint64_t sub_C888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_26E48();
  sub_86B4();
  sub_E2F4();
  uint64_t result = sub_26F18();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = result;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5 & 1;
  *(void *)(a1 + 48) = v6;
  return result;
}

uint64_t sub_C900@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_26CA8();
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v6 = sub_27098();
  __chkstk_darwin(v6 - 8, v7);
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  __chkstk_darwin(started, v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v36 = *a1;
  sub_A070(&qword_31200);
  sub_26FC8();
  uint64_t v12 = v34;
  swift_getKeyPath();
  *(void *)&long long v36 = v12;
  sub_CD94(&qword_31208, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDateModel);
  sub_26D18();
  swift_release();
  uint64_t v13 = v12 + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__selectedDate;
  swift_beginAccess();
  sub_DEEC(v13, (uint64_t)v11);
  swift_release();
  uint64_t v14 = (uint64_t *)&v11[*(int *)(started + 28)];
  if (v14[1])
  {
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_270A8();
    type metadata accessor for WalletPrivacySettingsController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v18 = [self bundleForClass:ObjCClassFromMetadata];
    sub_26C98();
    uint64_t v15 = sub_270E8();
    uint64_t v16 = v19;
  }
  swift_bridgeObjectRetain();
  sub_E0DC((uint64_t)v11);
  uint64_t v34 = v15;
  uint64_t v35 = v16;
  sub_E2F4();
  uint64_t v20 = sub_26F18();
  uint64_t v22 = v21;
  char v24 = v23 & 1;
  LODWORD(v34) = sub_26EA8();
  uint64_t v25 = sub_26F08();
  uint64_t v27 = v26;
  char v29 = v28;
  uint64_t v31 = v30;
  sub_E348(v20, v22, v24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v25;
  *(void *)(a2 + 8) = v27;
  *(unsigned char *)(a2 + 16) = v29 & 1;
  *(void *)(a2 + 24) = v31;
  *(_WORD *)(a2 + 32) = 256;
  return result;
}

uint64_t sub_CC4C()
{
  return sub_26DD8();
}

uint64_t sub_CC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void (**)())(a3 + 32);
  sub_A070(&qword_31200);
  sub_26FC8();
  v3();
  return swift_release();
}

uint64_t sub_CCE8()
{
  return sub_26F88();
}

uint64_t sub_CD04@<X0>(uint64_t a1@<X8>)
{
  return sub_B358(a1);
}

void *sub_CD40()
{
  return &protocol witness table for String;
}

uint64_t sub_CD4C()
{
  return sub_CD94(&qword_31180, (void (*)(uint64_t))type metadata accessor for MenuButton.SharingStartDate);
}

uint64_t sub_CD94(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_CDDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v5 = sub_A070(&qword_310D0);
  uint64_t v7 = __chkstk_darwin(v5 - 8, v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = sub_26C68();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_26CE8();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26CD8();
  sub_26CC8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a2, v13);
    uint64_t v23 = sub_26C18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(a1, v23);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
    sub_E658((uint64_t)v12, &qword_310D0);
    uint64_t v24 = sub_26A98();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v31, 1, 1, v24);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v12, v13);
    sub_26CB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
    uint64_t v30 = v18;
    uint64_t v26 = v31;
    sub_26A78();
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v27(a2, v13);
    uint64_t v28 = sub_26C18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(a1, v28);
    v27((uint64_t)v17, v13);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v30);
    uint64_t v29 = sub_26A98();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v26, 0, 1, v29);
  }
}

uint64_t sub_D198@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26E08();
  *a1 = result;
  return result;
}

uint64_t sub_D1C4()
{
  return sub_26E18();
}

uint64_t sub_D1EC@<X0>(uint64_t a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v10 = sub_A070(&qword_310D0);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A070(&qword_31338);
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  uint64_t v15 = *(void *)(*(void *)(started - 8) + 72);
  unint64_t v16 = (*(unsigned __int8 *)(*(void *)(started - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(started - 8) + 80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_27CD0;
  uint64_t v18 = v17 + v16;
  if (qword_30F28 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_E620(started, (uint64_t)qword_31758);
  sub_DEEC(v19, v18);
  if (qword_30F30 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_E620(started, (uint64_t)qword_31770);
  sub_DEEC(v20, v18 + v15);
  if (qword_30F38 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_E620(started, (uint64_t)qword_31788);
  sub_DEEC(v21, v18 + 2 * v15);
  if (qword_30F40 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_E620(started, (uint64_t)qword_317A0);
  sub_DEEC(v22, v18 + 3 * v15);
  sub_E290(a1, (uint64_t)v13, &qword_310D0);
  type metadata accessor for MenuButton.SharingStartDateModel(0);
  uint64_t v23 = swift_allocObject();
  sub_99A4((uint64_t)v13, a2 & 1, a3 & 1);
  uint64_t result = sub_E658(a1, &qword_310D0);
  *a6 = v23;
  a6[1] = 0;
  a6[2] = 0x4014000000000000;
  a6[3] = v17;
  uint64_t v25 = v27;
  a6[4] = v26;
  a6[5] = v25;
  return result;
}

void sub_D4B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21WalletPrivacySettings29StartSharingTimeSelectionCell_menuButtonRow] = 0;
  NSString v7 = sub_270B8();
  swift_bridgeObjectRelease();
  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for StartSharingTimeSelectionCell();
  id v8 = objc_msgSendSuper2(&v13, "initWithStyle:reuseIdentifier:specifier:", a1, v7, a4);

  if (v8)
  {
    uint64_t v9 = qword_30F20;
    id v10 = v8;
    if (v9 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)qword_31750;
    [(id)qword_31750 setDateStyle:2];
    [v11 setTimeStyle:0];
    id v12 = a4;
    sub_5E74(a4);
  }
  else
  {
    __break(1u);
  }
}

void sub_D5D0()
{
  id v1 = [v0 specifier];
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for StartSharingTimeSelectionCell();
  objc_msgSendSuper2(&v5, "refreshCellContentsWithSpecifier:", v1);

  [v0 setUserInteractionEnabled:1];
  id v2 = [self clearColor];
  [v0 setBackgroundColor:v2];

  id v3 = [v0 titleLabel];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 setHidden:1];
  }
}

uint64_t sub_D6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v78 = sub_26C68();
  uint64_t v76 = *(void *)(v78 - 8);
  __chkstk_darwin(v78, v4);
  uint64_t v72 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_A070(&qword_31198);
  __chkstk_darwin(v75, v6);
  uint64_t v77 = (uint64_t)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_A070(&qword_310D0);
  uint64_t v10 = __chkstk_darwin(v8 - 8, v9);
  uint64_t v73 = (uint64_t)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v81 = (uint64_t)&v71 - v14;
  __chkstk_darwin(v13, v15);
  uint64_t v82 = (uint64_t)&v71 - v16;
  uint64_t v17 = sub_26C18();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v74 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_A070(&qword_311A0);
  uint64_t v22 = v21 - 8;
  __chkstk_darwin(v21, v23);
  uint64_t v25 = (char *)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_A070(&qword_310C8);
  uint64_t v28 = __chkstk_darwin(v26 - 8, v27);
  uint64_t v30 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v28, v31);
  uint64_t v34 = (char *)&v71 - v33;
  __chkstk_darwin(v32, v35);
  uint64_t v37 = (char *)&v71 - v36;
  uint64_t v79 = a1;
  sub_E290(a1, (uint64_t)&v71 - v36, &qword_310C8);
  uint64_t v80 = a2;
  sub_E290(a2, (uint64_t)v34, &qword_310C8);
  uint64_t v38 = (uint64_t)&v25[*(int *)(v22 + 56)];
  sub_E290((uint64_t)v37, (uint64_t)v25, &qword_310C8);
  sub_E290((uint64_t)v34, v38, &qword_310C8);
  uint64_t v39 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  if (v39((uint64_t)v25, 1, v17) == 1)
  {
    sub_E658((uint64_t)v34, &qword_310C8);
    sub_E658((uint64_t)v37, &qword_310C8);
    if (v39(v38, 1, v17) == 1)
    {
      sub_E658((uint64_t)v25, &qword_310C8);
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v40 = &qword_311A0;
    uint64_t v41 = (uint64_t)v25;
LABEL_14:
    sub_E658(v41, v40);
    return 0;
  }
  sub_E290((uint64_t)v25, (uint64_t)v30, &qword_310C8);
  if (v39(v38, 1, v17) == 1)
  {
    sub_E658((uint64_t)v34, &qword_310C8);
    sub_E658((uint64_t)v37, &qword_310C8);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v17);
    goto LABEL_6;
  }
  long long v42 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v74, v38, v17);
  sub_CD94(&qword_311B0, (void (*)(uint64_t))&type metadata accessor for DateComponents);
  char v43 = sub_27088();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v18 + 8);
  v44(v42, v17);
  sub_E658((uint64_t)v34, &qword_310C8);
  sub_E658((uint64_t)v37, &qword_310C8);
  v44(v30, v17);
  sub_E658((uint64_t)v25, &qword_310C8);
  if ((v43 & 1) == 0) {
    return 0;
  }
LABEL_8:
  uint64_t started = (int *)type metadata accessor for MenuButton.SharingStartDate(0);
  uint64_t v46 = v82;
  sub_E290(v79 + started[5], v82, &qword_310D0);
  uint64_t v47 = v81;
  sub_E290(v80 + started[5], v81, &qword_310D0);
  uint64_t v48 = v77;
  uint64_t v49 = v77 + *(int *)(v75 + 48);
  sub_E290(v46, v77, &qword_310D0);
  sub_E290(v47, v49, &qword_310D0);
  uint64_t v50 = v76;
  uint64_t v51 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48);
  uint64_t v52 = v78;
  if (v51(v48, 1, v78) == 1)
  {
    sub_E658(v47, &qword_310D0);
    sub_E658(v46, &qword_310D0);
    if (v51(v49, 1, v52) == 1)
    {
      sub_E658(v48, &qword_310D0);
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  uint64_t v53 = v73;
  sub_E290(v48, v73, &qword_310D0);
  if (v51(v49, 1, v52) == 1)
  {
    sub_E658(v81, &qword_310D0);
    sub_E658(v82, &qword_310D0);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v52);
LABEL_13:
    uint64_t v40 = &qword_31198;
    uint64_t v41 = v48;
    goto LABEL_14;
  }
  uint64_t v55 = v53;
  uint64_t v56 = v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v72, v49, v52);
  sub_CD94(&qword_311A8, (void (*)(uint64_t))&type metadata accessor for Date);
  char v57 = sub_27088();
  uint64_t v58 = *(void (**)(char *, uint64_t))(v50 + 8);
  v58(v56, v52);
  sub_E658(v81, &qword_310D0);
  sub_E658(v82, &qword_310D0);
  v58((char *)v55, v52);
  sub_E658(v48, &qword_310D0);
  if ((v57 & 1) == 0) {
    return 0;
  }
LABEL_18:
  uint64_t v59 = started[6];
  uint64_t v60 = v79;
  uint64_t v61 = v80;
  uint64_t v62 = *(void *)(v79 + v59);
  uint64_t v63 = *(void *)(v79 + v59 + 8);
  uint64_t v64 = (void *)(v80 + v59);
  if (v62 == *v64 && v63 == v64[1] || (v65 = sub_27418(), uint64_t result = 0, (v65 & 1) != 0))
  {
    uint64_t v66 = started[7];
    uint64_t v67 = (void *)(v60 + v66);
    uint64_t v68 = *(void *)(v60 + v66 + 8);
    uint64_t v69 = (void *)(v61 + v66);
    uint64_t v70 = v69[1];
    if (v68)
    {
      if (v70 && (*v67 == *v69 && v68 == v70 || (sub_27418() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v70)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_DEA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_DEEC(uint64_t a1, uint64_t a2)
{
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 16))(a2, a1, started);
  return a2;
}

uint64_t sub_DF50()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_DFA0(uint64_t a1, uint64_t a2)
{
  return sub_CC74(a1, a2, v2 + 16);
}

uint64_t sub_DFA8(uint64_t a1)
{
  return a1;
}

uint64_t sub_DFD4(uint64_t a1)
{
  return a1;
}

unint64_t sub_E000()
{
  unint64_t result = qword_31210;
  if (!qword_31210)
  {
    sub_DEA4(&qword_311D8);
    sub_DEA4(&qword_311C8);
    sub_E3F8(&qword_311F0, &qword_311C8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31210);
  }
  return result;
}

uint64_t sub_E0DC(uint64_t a1)
{
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(started - 8) + 8))(a1, started);
  return a1;
}

uint64_t sub_E138()
{
  return sub_9710(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_E154(uint64_t a1, uint64_t a2)
{
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 24))(a2, a1, started);
  return a2;
}

uint64_t sub_E1B8@<X0>(uint64_t a1@<X8>)
{
  return sub_C304(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_E1C0@<X0>(uint64_t a1@<X8>)
{
  return sub_C900(*(long long **)(v1 + 16), a1);
}

unint64_t sub_E1C8()
{
  unint64_t result = qword_31260;
  if (!qword_31260)
  {
    sub_DEA4(&qword_31250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31260);
  }
  return result;
}

unint64_t sub_E23C()
{
  unint64_t result = qword_31298;
  if (!qword_31298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31298);
  }
  return result;
}

uint64_t sub_E290(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A070(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_E2F4()
{
  unint64_t result = qword_312A8;
  if (!qword_312A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_312A8);
  }
  return result;
}

uint64_t sub_E348(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_E358()
{
  return sub_C740();
}

unint64_t sub_E360()
{
  unint64_t result = qword_312D0;
  if (!qword_312D0)
  {
    sub_DEA4(&qword_312C0);
    sub_E3F8(&qword_312D8, &qword_312E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_312D0);
  }
  return result;
}

uint64_t sub_E3F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_DEA4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_E43C()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtCV21WalletPrivacySettings10MenuButton21SharingStartDateModel__sinceOpeningSelected) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_E454(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A070(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_E4B8()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_E4F0(uint64_t a1)
{
  return sub_69E8(a1, *(void **)(v1 + 16));
}

uint64_t sub_E4F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_E524(uint64_t a1)
{
  return a1;
}

uint64_t sub_E550(uint64_t a1, unint64_t *a2)
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

void *sub_E58C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_E5D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_E620(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_E658(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_A070(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_E6B4(uint64_t a1, uint64_t a2)
{
  uint64_t started = type metadata accessor for MenuButton.SharingStartDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(started - 8) + 32))(a2, a1, started);
  return a2;
}

unint64_t sub_E718()
{
  unint64_t result = qword_31350;
  if (!qword_31350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31350);
  }
  return result;
}

uint64_t *sub_E76C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_E7D0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_E87C(int a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v28 = (unint64_t)&_swiftEmptyArrayStorage;
  unint64_t v5 = *(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appsSpecifiers];
  if (v5)
  {
    uint64_t v6 = (objc_class *)ObjectType;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_27388();
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v7 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_4:
        if (v7 < 1)
        {
          __break(1u);
          goto LABEL_41;
        }
        uint64_t v22 = v6;
        LODWORD(v23) = a1;
        for (uint64_t i = 0; i != v7; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0) {
            id v9 = (id)sub_27338();
          }
          else {
            id v9 = *(id *)(v5 + 8 * i + 32);
          }
          uint64_t v10 = v9;
          NSString v11 = sub_270B8();
          id v12 = [v10 propertyForKey:v11];

          if (v12)
          {
            sub_272C8();
            swift_unknownObjectRelease();
          }
          else
          {
            memset(v25, 0, sizeof(v25));
          }
          sub_11390((uint64_t)v25, (uint64_t)v26);
          if (v27)
          {
            if ((swift_dynamicCast() & 1) != 0 && HIBYTE(v23) == 1)
            {
              id v13 = v10;
              sub_27158();
              if (*(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                             + (v28 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_271A8();
              sub_271C8();
              sub_27198();
              Class isa = sub_271D8().super.super.isa;
              NSString v15 = sub_270B8();
              [v13 setProperty:isa forKey:v15];
            }
            else
            {
            }
          }
          else
          {

            sub_113F8((uint64_t)v26);
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v16 = v28;
LABEL_24:
        if (v16 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_27388();
          swift_bridgeObjectRelease();
          if (!v21)
          {
LABEL_27:
            if (v16 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v17 = sub_27388();
              swift_bridgeObjectRelease();
              if (v17)
              {
LABEL_29:
                if (v17 >= 1)
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if ((v16 & 0xC000000000000001) != 0) {
                      id v19 = (id)sub_27338();
                    }
                    else {
                      id v19 = *(id *)(v16 + 8 * j + 32);
                    }
                    uint64_t v20 = v19;
                    objc_msgSend(v2, "reloadSpecifier:", v19, v22, v23);
                  }
                  goto LABEL_38;
                }
LABEL_41:
                __break(1u);
                return;
              }
            }
            else
            {
              uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
              if (v17) {
                goto LABEL_29;
              }
            }
LABEL_38:
            swift_bridgeObjectRelease();
            v24.receiver = v2;
            v24.super_class = v6;
            objc_msgSendSuper2(&v24, "viewWillAppear:", a1 & 1);
            return;
          }
        }
        else if (!*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8)))
        {
          goto LABEL_27;
        }
        sub_26B58();
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v16 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_24;
  }
}

id sub_EC70()
{
  uint64_t v1 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)PKAppProtectionShieldConfiguration) init];
    [v4 setShowAuthOnAppear:0];
    id v5 = [self createShieldViewControllerWithConfiguration:v4];
    if (!v5) {
      id v5 = [objc_allocWithZone((Class)UIViewController) init];
    }

    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

char *sub_ED48()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_authorizationManager;
  v13[3] = sub_26AB8();
  v13[4] = (uint64_t)&protocol witness table for FinancialDataTCC;
  sub_114D0(v13);
  id v3 = v0;
  sub_26AA8();
  sub_26B68();
  swift_allocObject();
  *(void *)&v0[v2] = sub_26B28();
  *(void *)&v3[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appsSpecifiers] = 0;
  uint64_t v4 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive;
  id v5 = [self sharedApplication];
  id v6 = [v5 applicationState];

  v3[v4] = v6 == 0;
  v3[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher] = 0;
  v3[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen] = 0;
  uint64_t v7 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator;
  *(void *)&v3[v7] = [self shared];
  *(void *)&v3[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController] = 0;

  v12.receiver = v3;
  v12.super_class = ObjectType;
  uint64_t v8 = (char *)objc_msgSendSuper2(&v12, "initWithNibName:bundle:", 0, 0);
  id v9 = *(void **)&v8[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator];
  uint64_t v10 = v8;
  [v9 registerObserver:v10];
  sub_23D10();

  return v10;
}

void sub_EF04(void *a1)
{
  uint64_t v2 = v1;

  uint64_t v3 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_authorizationManager;
  v8[3] = sub_26AB8();
  v8[4] = (uint64_t)&protocol witness table for FinancialDataTCC;
  sub_114D0(v8);
  sub_26AA8();
  sub_26B68();
  swift_allocObject();
  *(void *)&v1[v3] = sub_26B28();
  *(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appsSpecifiers] = 0;
  uint64_t v4 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive;
  id v5 = [self sharedApplication];
  id v6 = [v5 applicationState];

  v2[v4] = v6 == 0;
  v2[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher] = 0;
  v2[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen] = 0;
  uint64_t v7 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator;
  *(void *)&v2[v7] = [self shared];
  *(void *)&v2[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController____lazy_storage___shieldViewController] = 0;

  sub_27378();
  __break(1u);
}

id sub_F088()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  [*(id *)&v0[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator] unregisterObserver:v0];
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_F220()
{
  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v13, "viewWillLayoutSubviews");
  if (v0[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen] >= 2u)
  {
    id v1 = sub_EC70();
    id v2 = [v1 view];

    if (v2)
    {
      id v3 = [v0 view];
      if (v3)
      {
        uint64_t v4 = v3;
        [v3 bounds];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;

        objc_msgSend(v2, "setFrame:", v6, v8, v10, v12);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void *sub_F364()
{
  id v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_26DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  double v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_26CA8();
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v9 = sub_27098();
  __chkstk_darwin(v9 - 8, v10);
  if (v1[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen] != 1) {
    return _swiftEmptyArrayStorage;
  }
  NSString v11 = sub_270B8();
  id v12 = [v1 valueForKey:v11];

  if (v12)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v47, 0, sizeof(v47));
  }
  sub_11390((uint64_t)v47, (uint64_t)v48);
  if (v48[3])
  {
    sub_A070(&qword_313C8);
    if (swift_dynamicCast())
    {
      unint64_t v13 = v46[1];
LABEL_29:
      uint64_t v37 = sub_1AA38(v13);
      swift_bridgeObjectRelease();
      return (void *)v37;
    }
  }
  else
  {
    sub_113F8((uint64_t)v48);
  }
  NSString v14 = sub_270B8();
  id v15 = [v1 loadSpecifiersFromPlistName:v14 target:v1];

  if (!v15 || (*(void *)&v47[0] = 0, sub_11458(), sub_27178(), v15, !*(void *)&v47[0]))
  {
    sub_26D88();
    uint64_t v34 = sub_26DA8();
    os_log_type_t v35 = sub_27238();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      v48[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315138;
      *(void *)&v47[0] = sub_25C5C(0xD000000000000015, 0x8000000000027F50, v48);
      sub_272A8();
      _os_log_impl(&dword_0, v34, v35, "Unable to load specifiers from: %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return _swiftEmptyArrayStorage;
  }
  v48[0] = *(void *)&v47[0];
  sub_26B58();
  sub_26B48();
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_159E8(v16);
  swift_bridgeObjectRelease();
  *(void *)&v47[0] = v17;
  sub_106A4((uint64_t *)v47);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)&v47[0];
  id v19 = v1;
  uint64_t v20 = sub_10058(v18, v19);

  swift_release();
  uint64_t v21 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appsSpecifiers;
  *(void *)&v19[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appsSpecifiers] = v20;
  swift_bridgeObjectRelease();
  unint64_t v22 = *(void *)&v19[v21];
  if (v22)
  {
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v23 = sub_27388();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
    }
    if (v23)
    {
      sub_270A8();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      uint64_t v25 = self;
      v46[0] = ObjCClassFromMetadata;
      id v26 = [v25 bundleForClass:ObjCClassFromMetadata];
      sub_26C98();
      sub_270E8();
      uint64_t v27 = self;
      NSString v28 = sub_270B8();
      swift_bridgeObjectRelease();
      id v29 = [v27 preferenceSpecifierNamed:v28 target:0 set:0 get:0 detail:0 cell:0 edit:0];

      if (v29)
      {
        sub_270A8();
        id v30 = [v25 bundleForClass:v46[0]];
        sub_26C98();
        sub_270E8();
        NSString v31 = sub_270B8();
        swift_bridgeObjectRelease();
        [v29 setProperty:v31 forKey:PSFooterTextGroupKey];

        id v32 = v29;
        sub_27158();
        if (*(void *)((char *)&dword_10 + (v48[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                          + (v48[0] & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_271A8();
        sub_271C8();
        sub_27198();
        unint64_t v33 = swift_bridgeObjectRetain();
        sub_15758(v33);
        swift_bridgeObjectRelease();
LABEL_28:

        unint64_t v13 = v48[0];
        unint64_t v43 = swift_bridgeObjectRetain();
        sub_1AA38(v43);
        swift_bridgeObjectRelease();
        Class isa = sub_27168().super.isa;
        swift_bridgeObjectRelease();
        [v19 setSpecifiers:isa];

        goto LABEL_29;
      }
      goto LABEL_33;
    }
    swift_bridgeObjectRelease();
  }
  id v38 = [self emptyGroupSpecifier];
  if (v38)
  {
    uint64_t v39 = v38;
    sub_270A8();
    uint64_t v40 = swift_getObjCClassFromMetadata();
    id v41 = [self bundleForClass:v40];
    sub_26C98();
    sub_270E8();
    NSString v42 = sub_270B8();
    swift_bridgeObjectRelease();
    [v39 setProperty:v42 forKey:PSFooterTextGroupKey];

    id v32 = v39;
    sub_27158();
    if (*(void *)((char *)&dword_10 + (v48[0] & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                      + (v48[0] & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_271A8();
    sub_271C8();
    sub_27198();
    goto LABEL_28;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  unint64_t result = (void *)swift_release();
  __break(1u);
  return result;
}

void sub_FBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_26DB8();
  __chkstk_darwin(v6, v7);
  id v8 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v9 = sub_210A8(a1, a2, 0);
  uint64_t v10 = v9;
  if (v9)
  {
    NSString v11 = [v9 localizedName];
    if (!v11)
    {
      sub_270C8();
      NSString v11 = sub_270B8();
      swift_bridgeObjectRelease();
    }
    id v12 = self;
    type metadata accessor for FinanceDataAuthorizationLevelController();
    id v13 = [v12 preferenceSpecifierNamed:v11 target:v3 set:"authChanged::" get:"getAuthWithSpecifier:" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

    if (v13)
    {
      NSString v14 = sub_270B8();
      NSString v15 = sub_270B8();
      [v13 setProperty:v14 forKey:v15];

      NSString v16 = sub_270B8();
      [v13 setProperty:v16 forKey:PSLazyIconAppID];

      Class isa = sub_271D8().super.super.isa;
      id v18 = PSLazyIconLoading;
      [v13 setProperty:isa forKey:v18];

      return;
    }
  }
  else
  {
    __break(1u);
  }

  __break(1u);
}

void *sub_10058(uint64_t a1, void *a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    a2;
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      swift_bridgeObjectRetain();
      sub_FBD0(v6, v7);
      uint64_t v9 = v8;
      swift_bridgeObjectRelease();
      if (v9)
      {
        sub_27158();
        if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_271A8();
        }
        sub_271C8();
        sub_27198();
      }
      v5 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = a2;
  }

  swift_release();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10220(void *a1)
{
  uint64_t v2 = sub_26DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_26AE8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  NSString v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v12 = sub_270B8();
  id v13 = [a1 propertyForKey:v12];

  if (v13)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_11390((uint64_t)v20, (uint64_t)v21);
  if (v22)
  {
    if (swift_dynamicCast())
    {
      sub_26B38();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for LocalizedStringTable.bankConnect(_:), v7);
      uint64_t v17 = sub_26AD8();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      return v17;
    }
  }
  else
  {
    sub_113F8((uint64_t)v21);
  }
  sub_26D88();
  NSString v14 = sub_26DA8();
  os_log_type_t v15 = sub_27238();
  if (os_log_type_enabled(v14, v15))
  {
    NSString v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "Expected bundleID property on specifier", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return 0;
}

uint64_t type metadata accessor for WalletPrivacySettingsController()
{
  return self;
}

Swift::Int sub_106A4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1A7D0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10710(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_10710(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_273D8(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_10DFC(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      NSString v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_10ECC((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_19C64((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_271B8();
    *(void *)(v7 + 16) = v6;
    v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  NSString v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    NSString v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_27418();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_27418()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      NSString v11 = sub_19968(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      NSString v11 = sub_19968((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    NSString v42 = v11 + 32;
    unint64_t v43 = &v11[16 * v41 + 32];
    *(void *)unint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          char v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        long long v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        long long v88 = v42;
        unint64_t v89 = v44;
        long long v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_10ECC((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)long long v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        NSString v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        NSString v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      unint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        id v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_27418() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)id v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
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
LABEL_160:
  Swift::Int result = sub_27368();
  __break(1u);
  return result;
}

uint64_t sub_10DFC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_27418(), (result & 1) == 0))
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
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
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

uint64_t sub_10ECC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        id v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_27418() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)id v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)id v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    NSString v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_27418() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_19A64((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

id sub_11168(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_26DB8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  int64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v9 = sub_270B8();
  id v10 = [a1 propertyForKey:v9];

  if (v10)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_11390((uint64_t)v16, (uint64_t)v17);
  if (v18)
  {
    if (swift_dynamicCast())
    {
      sub_26B18();
      swift_bridgeObjectRelease();
      return [v2 reloadSpecifier:a1];
    }
  }
  else
  {
    sub_113F8((uint64_t)v17);
  }
  sub_26D88();
  uint64_t v12 = sub_26DA8();
  os_log_type_t v13 = sub_27238();
  if (os_log_type_enabled(v12, v13))
  {
    NSString v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v14 = 0;
    _os_log_impl(&dword_0, v12, v13, "Expected bundleID property on specifier", v14, 2u);
    swift_slowDealloc();
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_11390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A070(&qword_31300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_113F8(uint64_t a1)
{
  uint64_t v2 = sub_A070(&qword_31300);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_11458()
{
  unint64_t result = qword_316D0;
  if (!qword_316D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_316D0);
  }
  return result;
}

uint64_t sub_11498()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t *sub_114D0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id sub_1160C(char a1)
{
  v20.receiver = v1;
  v20.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v20, "viewDidAppear:", a1 & 1);
  unint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers];
  if (v3 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_27388();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      id v14 = v1;
      char v15 = 0;
      unint64_t v5 = 0;
      uint64_t v1 = (char *)(v3 & 0xC000000000000001);
      while (1)
      {
        if (v1)
        {
          id v6 = (id)sub_27338();
        }
        else
        {
          if (v5 >= *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)))
          {
            __break(1u);
            goto LABEL_25;
          }
          id v6 = *(id *)(v3 + 8 * v5 + 32);
        }
        uint64_t v7 = v6;
        unint64_t v8 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
LABEL_23:
          swift_bridgeObjectRelease();
          return objc_msgSend(v14, "reloadSpecifiers", v14);
        }
        NSString v9 = sub_270B8();
        id v10 = [v7 propertyForKey:v9];

        if (v10)
        {
          sub_272C8();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v17, 0, sizeof(v17));
        }
        sub_11390((uint64_t)v17, (uint64_t)v18);
        if (!v19) {
          break;
        }
        if ((swift_dynamicCast() & 1) != 0 && v16 == 1)
        {
          Class isa = sub_271D8().super.super.isa;
          NSString v12 = sub_270B8();
          [v7 setProperty:isa forKey:v12];

          char v15 = 1;
          unint64_t v5 = v8;
          if (v8 == v4) {
            goto LABEL_23;
          }
        }
        else
        {

LABEL_5:
          ++v5;
          if (v8 == v4)
          {
            id result = (id)swift_bridgeObjectRelease();
            if ((v15 & 1) == 0) {
              return result;
            }
            return objc_msgSend(v14, "reloadSpecifiers", v14);
          }
        }
      }

      sub_E658((uint64_t)v18, &qword_31300);
      goto LABEL_5;
    }
  }
  return (id)swift_bridgeObjectRelease();
}

void *sub_118F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  id v10 = (char *)&v68 - v9;
  uint64_t v11 = sub_A070(&qword_31458);
  __chkstk_darwin(v11 - 8, v12);
  id v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_26CA8();
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_27098();
  __chkstk_darwin(v19 - 8, v20);
  NSString v21 = sub_270B8();
  id v22 = [v1 valueForKey:v21];

  if (v22)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v74 = 0u;
    long long v75 = 0u;
  }
  sub_11390((uint64_t)&v74, (uint64_t)v76);
  if (v77)
  {
    sub_A070(&qword_313C8);
    if (swift_dynamicCast())
    {
      uint64_t v23 = sub_1AA38(v71);
      swift_bridgeObjectRelease();
      return (void *)v23;
    }
    uint64_t v69 = v18;
    uint64_t v70 = v3;
  }
  else
  {
    uint64_t v69 = v18;
    uint64_t v70 = v3;
    sub_E658((uint64_t)v76, &qword_31300);
  }
  id v24 = [v1 title];
  NSString v25 = sub_270B8();
  id v26 = [v1 loadSpecifiersFromPlistName:v25 target:v1];

  if (!v26
    || (v76[0] = 0,
        sub_E550(0, (unint64_t *)&qword_316D0),
        sub_27178(),
        v26,
        (uint64_t v27 = v76[0]) == 0))
  {
LABEL_39:

    sub_26D88();
    uint64_t v64 = sub_26DA8();
    os_log_type_t v65 = sub_27238();
    if (os_log_type_enabled(v64, v65))
    {
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      v76[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v66 = 136315138;
      *(void *)&long long v74 = sub_25C5C(0xD000000000000014, 0x8000000000028790, v76);
      sub_272A8();
      _os_log_impl(&dword_0, v64, v65, "Unable to load specifiers from: %s", v66, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v70 + 8))(v7, v2);
    return _swiftEmptyArrayStorage;
  }
  uint64_t v68 = v2;
  uint64_t v28 = (uint64_t)v14;
  uint64_t v73 = v76[0];
  uint64_t v29 = v76[0] & 0xFFFFFFFFFFFFFF8;
  if (!((unint64_t)v76[0] >> 62))
  {
    uint64_t v30 = *(void *)((char *)&dword_10 + (v76[0] & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v30) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  if (!sub_27388())
  {
LABEL_38:
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v68;
    goto LABEL_39;
  }
LABEL_13:
  if ((v27 & 0xC000000000000001) != 0)
  {
    uint64_t v31 = (char *)sub_27338();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_45;
    }
    uint64_t v31 = (char *)*(id *)(v27 + 32);
  }
  uint64_t v7 = v31;
  uint64_t v29 = v28;
  swift_bridgeObjectRelease();
  [v1 setTitle:v24];

  id result = [v1 specifier];
  uint64_t v33 = v68;
  if (result)
  {
    uint64_t v34 = result;
    NSString v35 = sub_270B8();
    id v36 = [v34 propertyForKey:v35];

    if (v36)
    {
      sub_272C8();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
    }
    sub_11390((uint64_t)&v74, (uint64_t)v76);
    if (v77)
    {
      if (swift_dynamicCast())
      {
        uint64_t v37 = v71;
        uint64_t v38 = v72;
        BOOL v39 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_bundleIdentifier];
        *(void *)BOOL v39 = v71;
        *((void *)v39 + 1) = v38;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_retain();
        sub_26B18();
        swift_release();
        id v40 = objc_allocWithZone((Class)LSApplicationRecord);
        id v41 = sub_210A8(v37, v38, 0);
        uint64_t v46 = v41;
        if (v41)
        {
          id v47 = [v41 localizedName];
          uint64_t v48 = sub_270C8();
          uint64_t v50 = v49;

          sub_270A8();
          type metadata accessor for WalletPrivacySettingsController();
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          id v52 = [self bundleForClass:ObjCClassFromMetadata];
          sub_26C98();
          sub_270E8();
          sub_A070(&qword_31348);
          uint64_t v53 = swift_allocObject();
          *(_OWORD *)(v53 + 16) = xmmword_27CB0;
          *(void *)(v53 + 56) = &type metadata for String;
          *(void *)(v53 + 64) = sub_E718();
          *(void *)(v53 + 32) = v48;
          *(void *)(v53 + 40) = v50;
          sub_270D8();
          swift_bridgeObjectRelease();
          NSString v54 = sub_270B8();
          swift_bridgeObjectRelease();
          [v7 setProperty:v54 forKey:PSFooterTextGroupKey];
        }
        uint64_t v28 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator;
        if (*(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator])
        {
          swift_retain();
          sub_26B88();
          swift_release();
        }
        unint64_t v55 = *(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers];
        if (!(v55 >> 62))
        {
          if (*(void *)((char *)&dword_10 + (v55 & 0xFFFFFFFFFFFFFF8)))
          {
LABEL_34:
            unint64_t v60 = swift_bridgeObjectRetain();
            sub_15758(v60);
            if (*(void *)&v1[v28])
            {
              swift_allocObject();
              swift_unknownObjectWeakInit();
              swift_retain();
              swift_retain();
              sub_26B88();
              swift_release();
              swift_release();
            }
            unint64_t v61 = v73;
            unint64_t v62 = swift_bridgeObjectRetain();
            sub_1AA38(v62);
            swift_bridgeObjectRelease();
            Class isa = sub_27168().super.isa;
            swift_bridgeObjectRelease();
            [v1 setSpecifiers:isa];

            uint64_t v23 = sub_1AA38(v61);
            swift_bridgeObjectRelease();

            return (void *)v23;
          }
LABEL_33:
          uint64_t v56 = sub_27228();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v29, 1, 1, v56);
          sub_27208();
          char v57 = v1;
          uint64_t v58 = sub_271F8();
          uint64_t v59 = (void *)swift_allocObject();
          v59[2] = v58;
          v59[3] = &protocol witness table for MainActor;
          v59[4] = v57;
          sub_1B080(v29, (uint64_t)&unk_31468, (uint64_t)v59);
          swift_release();
          goto LABEL_34;
        }
LABEL_45:
        swift_bridgeObjectRetain();
        uint64_t v67 = sub_27388();
        swift_bridgeObjectRelease();
        if (v67) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
    }
    else
    {
      sub_E658((uint64_t)v76, &qword_31300);
    }
    sub_26D88();
    NSString v42 = sub_26DA8();
    os_log_type_t v43 = sub_27238();
    if (os_log_type_enabled(v42, v43))
    {
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v44 = 0;
      _os_log_impl(&dword_0, v42, v43, "Expected bundleID property of specifier", v44, 2u);
      uint64_t v33 = v68;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v70 + 8))(v10, v33);
    sub_A070(&qword_31310);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_27CB0;
    uint64_t v45 = v73;
    *(void *)(v23 + 56) = sub_A070(&qword_313C8);
    *(void *)(v23 + 32) = v45;

    return (void *)v23;
  }
  __break(1u);
  return result;
}

uint64_t sub_123D8()
{
  v0[2] = sub_27208();
  v0[3] = sub_271F8();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_12484;
  return sub_126AC();
}

uint64_t sub_12484()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_271E8();
  if (v0) {
    uint64_t v4 = sub_12640;
  }
  else {
    uint64_t v4 = sub_125E0;
  }
  return _swift_task_switch(v4, v3, v2);
}

uint64_t sub_125E0()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_12640()
{
  swift_release();
  swift_errorRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_126AC()
{
  v1[10] = v0;
  sub_A070(&qword_31458);
  v1[11] = swift_task_alloc();
  uint64_t v2 = sub_269F8();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = sub_A070(&qword_31478);
  v1[16] = swift_task_alloc();
  sub_A070(&qword_31480);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  uint64_t v3 = sub_26C88();
  v1[20] = v3;
  v1[21] = *(void *)(v3 - 8);
  v1[22] = swift_task_alloc();
  uint64_t v4 = sub_269E8();
  v1[23] = v4;
  v1[24] = *(void *)(v4 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v5 = sub_26AC8();
  v1[26] = v5;
  v1[27] = *(void *)(v5 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  uint64_t v6 = sub_26A58();
  v1[30] = v6;
  v1[31] = *(void *)(v6 - 8);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  uint64_t v7 = sub_26B08();
  v1[34] = v7;
  v1[35] = *(void *)(v7 - 8);
  v1[36] = swift_task_alloc();
  v1[37] = sub_27208();
  v1[38] = sub_271F8();
  uint64_t v9 = sub_271E8();
  v1[39] = v9;
  v1[40] = v8;
  return _swift_task_switch(sub_12A40, v9, v8);
}

uint64_t sub_12A40()
{
  v0[8] = _swiftEmptyArrayStorage;
  uint64_t v1 = v0[10];
  uint64_t v2 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountForSpecifier;
  v0[41] = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountForSpecifier;
  uint64_t v3 = (void *)(v1 + v2);
  swift_beginAccess();
  void *v3 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator);
  v0[42] = v4;
  if (v4)
  {
    swift_retain();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[43] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_12C44;
    return PrivacySettingsStoreCoordinator.allAccountsByInstitutionKey()();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
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
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_12C44(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[44] = a1;
  v3[45] = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = v3[39];
    uint64_t v5 = v3[40];
    uint64_t v6 = sub_13B48;
  }
  else
  {
    uint64_t v4 = v3[39];
    uint64_t v5 = v3[40];
    uint64_t v6 = sub_12D64;
  }
  return _swift_task_switch(v6, v4, v5);
}

void sub_12D64()
{
  uint64_t v121 = v0;
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v1 = *(void *)(v0 + 360);
  swift_release();
  unint64_t v3 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_15AD0(v2);
  swift_bridgeObjectRelease();
  v120[0] = (uint64_t)v4;
  sub_15924(v120, (uint64_t (*)(void))&type metadata accessor for AccountInstitutionKey, (uint64_t (*)(uint64_t))sub_1A7F8, sub_17244);
  if (v1)
  {
    swift_release();
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = v120[0];
  uint64_t v6 = *(void *)(v120[0] + 16);
  uint64_t v7 = *(void *)(v0 + 352);
  if (v6)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)(v0 + 280);
    uint64_t v112 = *(void *)(v0 + 80)
         + OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_bundleIdentifier;
    unint64_t v10 = v120[0] + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v0 + 216);
    v110 = (void (**)(uint64_t, uint64_t))(v11 + 8);
    v111 = (void (**)(uint64_t, void, uint64_t))(v11 + 104);
    uint64_t v12 = *(void *)(v0 + 104);
    v102 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 192) + 8);
    v109 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 168) + 8);
    v108 = (void (**)(uint64_t, void, uint64_t))(v12 + 104);
    Swift::Int v107 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56);
    Swift::Int v106 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    unint64_t v96 = (void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
    unint64_t v101 = (void (**)(uint64_t, uint64_t))(v12 + 8);
    uint64_t v87 = v2;
    uint64_t v88 = *(void *)(v0 + 248);
    uint64_t v95 = (void (**)(void, void))(v9 + 8);
    uint64_t v100 = PSCellClassKey;
    uint64_t v99 = PSTableCellSubtitleColorKey;
    uint64_t v98 = PSTableCellSubtitleTextKey;
    unsigned int v104 = enum case for AccountStatus.locked(_:);
    unsigned int v105 = enum case for AccountOriginType.bankConnect(_:);
    uint64_t v97 = PSEnabledKey;
    uint64_t v103 = *(void *)(v0 + 120);
    uint64_t v89 = v9;
    unint64_t v90 = v3;
    uint64_t v85 = *(void *)(v0 + 352);
    uint64_t v86 = v120[0];
    uint64_t v84 = *(void *)(v120[0] + 16);
    unint64_t v93 = v10;
    while (v8 < *(void *)(v5 + 16))
    {
      (*(void (**)(void, unint64_t, void))(v9 + 16))(*(void *)(v0 + 288), v10 + *(void *)(v9 + 72) * v8, *(void *)(v0 + 272));
      if (*(void *)(v2 + 16))
      {
        unint64_t v13 = sub_262F8(*(void *)(v0 + 288));
        if (v14)
        {
          v120[0] = *(void *)(*(void *)(v7 + 56) + 8 * v13);
          swift_bridgeObjectRetain_n();
          sub_15924(v120, (uint64_t (*)(void))&type metadata accessor for InternalAccount, (uint64_t (*)(uint64_t))sub_1A7E4, sub_15C24);
          swift_bridgeObjectRelease();
          uint64_t v94 = v120[0];
          uint64_t v15 = self;
          sub_26AF8();
          NSString v16 = sub_270B8();
          swift_bridgeObjectRelease();
          v116 = v15;
          id v17 = [v15 groupSpecifierWithID:v16];

          if (!v17) {
            goto LABEL_44;
          }
          if (v3 > 1)
          {
            sub_26AF8();
            NSString v18 = sub_270B8();
            swift_bridgeObjectRelease();
            [v17 setName:v18];
          }
          id v19 = v17;
          sub_27158();
          unint64_t v10 = v93;
          if (*(void *)((char *)&dword_10 + (*(void *)(v0 + 64) & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + (*(void *)(v0 + 64) & 0xFFFFFFFFFFFFFF8)) >> 1) {
            sub_271A8();
          }
          sub_271C8();
          sub_27198();
          uint64_t v20 = *(void *)(v94 + 16);
          if (v20)
          {
            id v91 = v19;
            unint64_t v92 = v8;
            type metadata accessor for SingleAccountSharingChoiceController();
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            unint64_t v21 = v94 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
            id v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16);
            v113 = v22;
            uint64_t v114 = *(void *)(v88 + 72);
            while (1)
            {
              uint64_t v119 = v20;
              uint64_t v23 = *(void *)(v0 + 80);
              v22(*(void *)(v0 + 264), v21, *(void *)(v0 + 240));
              sub_26A18();
              NSString v24 = sub_270B8();
              swift_bridgeObjectRelease();
              id v25 = [v116 preferenceSpecifierNamed:v24 target:v23 set:0 get:"accountLinked:" detail:ObjCClassFromMetadata cell:2 edit:0];

              if (!v25) {
                goto LABEL_43;
              }
              uint64_t v27 = *(void *)(v0 + 224);
              uint64_t v26 = *(void *)(v0 + 232);
              uint64_t v28 = *(void *)(v0 + 208);
              sub_26A08();
              (*v111)(v27, v105, v28);
              sub_1A1D8(&qword_31498, (void (*)(uint64_t))&type metadata accessor for AccountOriginType);
              sub_27148();
              sub_27148();
              int v29 = *(unsigned __int16 *)(v0 + 368);
              int v30 = *(unsigned __int16 *)(v0 + 370);
              uint64_t v31 = *v110;
              (*v110)(v27, v28);
              v31(v26, v28);
              if (v29 == v30)
              {
                uint64_t v32 = *(void *)(v0 + 200);
                uint64_t v33 = *(void *)(v0 + 184);
                *(void *)(v0 + 72) = sub_E550(0, &qword_314A8);
                sub_A070(&qword_314B0);
                [v25 setProperty:sub_27428() forKey:v100];
                swift_unknownObjectRelease();
                id v34 = [self secondaryLabelColor];
                [v25 setProperty:v34 forKey:v99];

                sub_26A28();
                sub_269D8();
                (*v102)(v32, v33);
                NSString v35 = sub_270B8();
                swift_bridgeObjectRelease();
                [v25 setProperty:v35 forKey:v98];
              }
              uint64_t v36 = *(void *)(v0 + 176);
              uint64_t v37 = *(void *)(v0 + 160);
              sub_26A18();
              NSString v38 = sub_270B8();
              swift_bridgeObjectRelease();
              NSString v39 = sub_270B8();
              [v25 setProperty:v38 forKey:v39];

              sub_26A48();
              Class isa = sub_26C78().super.isa;
              (*v109)(v36, v37);
              NSString v41 = sub_270B8();
              [v25 setProperty:isa forKey:v41];

              unint64_t v118 = v21;
              if (*(void *)(v112 + 8))
              {
                swift_bridgeObjectRetain();
                NSString v42 = sub_270B8();
                swift_bridgeObjectRelease();
              }
              else
              {
                NSString v42 = 0;
              }
              uint64_t v44 = *(void *)(v0 + 144);
              uint64_t v43 = *(void *)(v0 + 152);
              uint64_t v45 = *(void *)(v0 + 128);
              uint64_t v46 = *(void *)(v0 + 96);
              NSString v47 = sub_270B8();
              [v25 setProperty:v42 forKey:v47];
              swift_unknownObjectRelease();

              sub_26A38();
              (*v108)(v44, v104, v46);
              (*v107)(v44, 0, 1, v46);
              uint64_t v48 = v45 + *(int *)(v103 + 48);
              sub_1A220(v43, v45);
              sub_1A220(v44, v48);
              uint64_t v49 = *v106;
              int v50 = (*v106)(v45, 1, v46);
              uint64_t v51 = *(void *)(v0 + 96);
              if (v50 == 1) {
                break;
              }
              sub_1A220(*(void *)(v0 + 128), *(void *)(v0 + 136));
              int v55 = v49(v48, 1, v51);
              uint64_t v56 = *(void *)(v0 + 144);
              uint64_t v57 = *(void *)(v0 + 152);
              uint64_t v58 = *(void *)(v0 + 136);
              if (v55 == 1)
              {
                uint64_t v59 = *(void *)(v0 + 96);
                sub_E658(*(void *)(v0 + 144), &qword_31480);
                sub_E658(v57, &qword_31480);
                (*v101)(v58, v59);
                NSString v54 = (void *)(v0 + 64);
LABEL_28:
                sub_E658(*(void *)(v0 + 128), &qword_31478);
                goto LABEL_31;
              }
              uint64_t v60 = *(void *)(v0 + 128);
              uint64_t v61 = *(void *)(v0 + 112);
              uint64_t v62 = *(void *)(v0 + 96);
              (*v96)(v61, v48, v62);
              sub_1A1D8(&qword_314A0, (void (*)(uint64_t))&type metadata accessor for AccountStatus);
              char v117 = sub_27088();
              uint64_t v63 = *v101;
              (*v101)(v61, v62);
              sub_E658(v56, &qword_31480);
              sub_E658(v57, &qword_31480);
              v63(v58, v62);
              sub_E658(v60, &qword_31480);
              NSString v54 = (void *)(v0 + 64);
              if (v117) {
                goto LABEL_30;
              }
LABEL_31:
              id v65 = v25;
              sub_27158();
              if (*(void *)((char *)&dword_10 + (*v54 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                              + (*v54 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_271A8();
              uint64_t v67 = *(void *)(v0 + 256);
              uint64_t v66 = *(void *)(v0 + 264);
              uint64_t v68 = *(void *)(v0 + 240);
              uint64_t v69 = (uint64_t *)(*(void *)(v0 + 80) + *(void *)(v0 + 328));
              sub_271C8();
              sub_27198();
              swift_beginAccess();
              v113(v67, v66, v68);
              id v70 = v65;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v120[0] = *v69;
              *uint64_t v69 = 0x8000000000000000;
              sub_223BC(v67, v70, isUniquelyReferenced_nonNull_native);
              *uint64_t v69 = v120[0];

              swift_bridgeObjectRelease();
              swift_endAccess();

              (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v66, v68);
              unint64_t v21 = v118 + v114;
              id v22 = v113;
              uint64_t v20 = v119 - 1;
              if (v119 == 1)
              {
                swift_release();
                uint64_t v5 = v86;
                uint64_t v2 = v87;
                uint64_t v6 = v84;
                uint64_t v7 = v85;
                unint64_t v8 = v92;
                unint64_t v10 = v93;
                id v19 = v91;
                goto LABEL_5;
              }
            }
            uint64_t v52 = *(void *)(v0 + 152);
            sub_E658(*(void *)(v0 + 144), &qword_31480);
            sub_E658(v52, &qword_31480);
            int v53 = v49(v48, 1, v51);
            NSString v54 = (void *)(v0 + 64);
            if (v53 == 1)
            {
              sub_E658(*(void *)(v0 + 128), &qword_31480);
LABEL_30:
              Class v64 = sub_271D8().super.super.isa;
              [v25 setProperty:v64 forKey:v97];

              goto LABEL_31;
            }
            goto LABEL_28;
          }
          swift_release();
LABEL_5:

          uint64_t v9 = v89;
          unint64_t v3 = v90;
        }
      }
      ++v8;
      (*v95)(*(void *)(v0 + 288), *(void *)(v0 + 272));
      if (v8 == v6) {
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
  }
  else
  {
LABEL_36:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v72 = *(void *)(v0 + 80);
    unint64_t v73 = *(void *)(v0 + 64);
    uint64_t v74 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers;
    uint64_t v75 = *(void *)(v72
                    + OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unsigned __int8 v76 = sub_1546C(v73, v75);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v76)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v78 = *(void **)(v0 + 80);
      uint64_t v77 = *(void *)(v0 + 88);
      *(void *)(v72 + v74) = v73;
      swift_bridgeObjectRelease();
      uint64_t v79 = sub_27228();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v77, 1, 1, v79);
      id v80 = v78;
      uint64_t v81 = sub_271F8();
      uint64_t v82 = (void *)swift_allocObject();
      v82[2] = v81;
      v82[3] = &protocol witness table for MainActor;
      v82[4] = v80;
      sub_1B080(v77, (uint64_t)&unk_31490, (uint64_t)v82);
      swift_release();
    }
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
    unint64_t v83 = *(void (**)(void))(v0 + 8);
    v83();
  }
}

uint64_t sub_13B48()
{
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_13C74(uint64_t a1)
{
  uint64_t v2 = sub_A070(&qword_31458);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_27228();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_27208();
  swift_retain();
  uint64_t v7 = sub_271F8();
  unint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = a1;
  sub_1B22C((uint64_t)v5, (uint64_t)&unk_314D8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_13D8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  sub_27208();
  v4[7] = sub_271F8();
  uint64_t v6 = sub_271E8();
  return _swift_task_switch(sub_13E24, v6, v5);
}

uint64_t sub_13E24()
{
  swift_release();
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  uint64_t v2 = Strong;
  if (Strong)
  {
    [Strong reloadSpecifiers];
  }
  **(unsigned char **)(v0 + 40) = v2 == 0;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_13F44(void *a1)
{
  id v113 = a1;
  uint64_t v2 = sub_26DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v111 = v2;
  uint64_t v112 = v3;
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v98 - v9;
  uint64_t v11 = sub_A070(&qword_310D0);
  __chkstk_darwin(v11 - 8, v12);
  char v14 = (char *)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_26C68();
  uint64_t v101 = *(void *)(v15 - 8);
  uint64_t v102 = v15;
  __chkstk_darwin(v15, v16);
  uint64_t v100 = (char *)&v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_26CA8();
  __chkstk_darwin(v18 - 8, v19);
  unsigned int v104 = (char *)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_27098();
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v23 = sub_26C88();
  uint64_t v108 = *(void *)(v23 - 8);
  v109 = (char *)v23;
  __chkstk_darwin(v23, v24);
  uint64_t v26 = (char *)&v98 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_A070(&qword_312F8);
  __chkstk_darwin(v27 - 8, v28);
  int v30 = (char *)&v98 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_26A98();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v105 = v31;
  uint64_t v106 = v32;
  __chkstk_darwin(v31, v33);
  uint64_t v103 = (char *)&v98 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_A070(&qword_31448);
  __chkstk_darwin(v35 - 8, v36);
  NSString v38 = (char *)&v98 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v39 = (void *)sub_26A58();
  uint64_t v40 = *(v39 - 1);
  __chkstk_darwin(v39, v41);
  v110 = (char *)&v98 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator])
  {
    sub_26D88();
    uint64_t v48 = sub_26DA8();
    os_log_type_t v49 = sub_27238();
    if (os_log_type_enabled(v48, v49))
    {
      int v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v50 = 0;
      _os_log_impl(&dword_0, v48, v49, "Expected store coordinator", v50, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v7, v111);
    return 0;
  }
  Swift::Int v107 = v1;
  uint64_t v43 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountForSpecifier];
  swift_beginAccess();
  uint64_t v98 = v43;
  uint64_t v44 = *(void *)v43;
  if (*(void *)(v44 + 16))
  {
    uint64_t v99 = v14;
    swift_retain();
    id v45 = v113;
    unint64_t v46 = sub_262B4((uint64_t)v45);
    if (v47)
    {
      (*(void (**)(char *, unint64_t, void *))(v40 + 16))(v38, *(void *)(v44 + 56) + *(void *)(v40 + 72) * v46, v39);
      (*(void (**)(char *, void, uint64_t, void *))(v40 + 56))(v38, 0, 1, v39);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, void *))(v40 + 56))(v38, 1, 1, v39);
    }

    char v14 = v99;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, void *))(v40 + 56))(v38, 1, 1, v39);
    swift_retain();
  }
  if ((*(unsigned int (**)(char *, uint64_t, void *))(v40 + 48))(v38, 1, v39) == 1)
  {
    sub_E658((uint64_t)v38, &qword_31448);
    swift_endAccess();
    sub_26D88();
    id v51 = v113;
    uint64_t v52 = v107;
    id v53 = v51;
    NSString v54 = v52;
    int v55 = sub_26DA8();
    os_log_type_t v56 = sub_27238();
    int v57 = v56;
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v58 = swift_slowAlloc();
      LODWORD(v108) = v57;
      uint64_t v59 = v58;
      uint64_t v60 = (void *)swift_slowAlloc();
      v110 = (char *)swift_slowAlloc();
      uint64_t v115 = (uint64_t)v53;
      v116 = v110;
      *(_DWORD *)uint64_t v59 = 138412546;
      id v61 = v53;
      id v113 = v39;
      id v62 = v61;
      sub_272A8();
      *uint64_t v60 = v53;

      *(_WORD *)(v59 + 12) = 2080;
      v109 = v10;
      sub_E550(0, (unint64_t *)&qword_316D0);
      sub_19C78();
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_27048();
      unint64_t v65 = v64;
      swift_bridgeObjectRelease();
      uint64_t v115 = sub_25C5C(v63, v65, (uint64_t *)&v116);
      sub_272A8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v55, (os_log_type_t)v108, "    Inconsistent state for specifier: %@ dict: %s", (uint8_t *)v59, 0x16u);
      sub_A070(&qword_313D0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      (*(void (**)(char *, uint64_t))(v112 + 8))(v109, v111);
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v112 + 8))(v10, v111);
    }
    return 0;
  }
  uint64_t v66 = (uint64_t)v30;
  uint64_t v67 = v110;
  uint64_t v68 = v38;
  uint64_t v69 = v39;
  (*(void (**)(char *, char *, void *))(v40 + 32))(v110, v68, v39);
  uint64_t result = swift_endAccess();
  if (*(void *)&v107[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_bundleIdentifier
                      + 8])
  {
    swift_bridgeObjectRetain();
    sub_26A48();
    sub_26B98();
    (*(void (**)(char *, char *))(v108 + 8))(v26, v109);
    swift_bridgeObjectRelease();
    uint64_t v73 = v105;
    uint64_t v72 = v106;
    int v74 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v106 + 48))(v66, 1, v105);
    if (v74 == 1)
    {
      sub_E658(v66, &qword_312F8);
      sub_270A8();
      type metadata accessor for WalletPrivacySettingsController();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v76 = objc_msgSend(self, "bundleForClass:", ObjCClassFromMetadata, v98);
      sub_26C98();
      uint64_t v71 = sub_270E8();
      swift_release();
      (*(void (**)(char *, void *))(v40 + 8))(v67, v69);
      return v71;
    }
    uint64_t v77 = v40;
    uint64_t v78 = v103;
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v103, v66, v73);
    uint64_t v79 = v69;
    if (sub_26A88())
    {
      uint64_t v80 = v72;
      sub_270A8();
      type metadata accessor for WalletPrivacySettingsController();
      uint64_t v81 = swift_getObjCClassFromMetadata();
      id v82 = objc_msgSend(self, "bundleForClass:", v81, v98);
      sub_26C98();
      uint64_t v71 = sub_270E8();
      swift_release();
      (*(void (**)(char *, uint64_t))(v80 + 8))(v78, v73);
      (*(void (**)(char *, void *))(v77 + 8))(v110, v79);
      return v71;
    }
    sub_26A68();
    uint64_t v83 = v101;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v101 + 48))(v14, 1, v102) != 1)
    {
      uint64_t v84 = v100;
      (*(void (**)(char *))(v83 + 32))(v100);
      id v85 = objc_allocWithZone((Class)NSDateFormatter);
      id v86 = objc_msgSend(v85, "init", v98);
      [v86 setDateStyle:1];
      [v86 setTimeStyle:0];
      sub_270A8();
      type metadata accessor for WalletPrivacySettingsController();
      uint64_t v87 = v83;
      uint64_t v88 = swift_getObjCClassFromMetadata();
      id v89 = [self bundleForClass:v88];
      sub_26C98();
      sub_270E8();
      sub_A070(&qword_31348);
      uint64_t v90 = swift_allocObject();
      id v113 = v79;
      id v91 = (void *)v90;
      *(_OWORD *)(v90 + 16) = xmmword_27CB0;
      unint64_t v92 = v84;
      Class isa = sub_26C48().super.isa;
      id v94 = [v86 stringFromDate:isa];

      uint64_t v95 = sub_270C8();
      uint64_t v97 = v96;

      v91[7] = &type metadata for String;
      v91[8] = sub_E718();
      v91[4] = v95;
      v91[5] = v97;
      uint64_t v71 = sub_270D8();

      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v92, v102);
      (*(void (**)(char *, uint64_t))(v106 + 8))(v103, v105);
      (*(void (**)(char *, id))(v77 + 8))(v110, v113);
      return v71;
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v106 + 8))(v78, v73);
    (*(void (**)(char *, void *))(v77 + 8))(v110, v69);
    sub_E658((uint64_t)v14, &qword_310D0);
    return 0;
  }
  __break(1u);
  return result;
}

id sub_14DDC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = &v3[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_bundleIdentifier];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_authorizationStateManager;
  v16[3] = sub_26AB8();
  v16[4] = (uint64_t)&protocol witness table for FinancialDataTCC;
  sub_114D0(v16);
  uint64_t v9 = v3;
  sub_26AA8();
  sub_26B68();
  swift_allocObject();
  *(void *)&v3[v8] = sub_26B28();
  uint64_t v10 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator;
  sub_26BC8();
  swift_allocObject();
  *(void *)&v9[v10] = sub_26BB8();
  sub_26AA8();
  uint64_t v11 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountForSpecifier;
  *(void *)&v9[v11] = sub_1AC9C((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v9[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers] = _swiftEmptyArrayStorage;
  *(void *)&v9[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController____lazy_storage___applicationRecord] = 1;

  if (a2)
  {
    NSString v12 = sub_270B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }
  v15.receiver = v9;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, "initWithNibName:bundle:", v12, a3);

  return v13;
}

id sub_14FC4(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_bundleIdentifier];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_authorizationStateManager;
  v12[3] = sub_26AB8();
  v12[4] = (uint64_t)&protocol witness table for FinancialDataTCC;
  sub_114D0(v12);
  uint64_t v6 = v1;
  sub_26AA8();
  sub_26B68();
  swift_allocObject();
  *(void *)&v1[v5] = sub_26B28();
  uint64_t v7 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_storeCoordinator;
  sub_26BC8();
  swift_allocObject();
  *(void *)&v6[v7] = sub_26BB8();
  sub_26AA8();
  uint64_t v8 = OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountForSpecifier;
  *(void *)&v6[v8] = sub_1AC9C((uint64_t)_swiftEmptyArrayStorage);
  *(void *)&v6[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController_accountSpecifiers] = _swiftEmptyArrayStorage;
  *(void *)&v6[OBJC_IVAR____TtC21WalletPrivacySettings39FinanceDataAuthorizationLevelController____lazy_storage___applicationRecord] = 1;

  v11.receiver = v6;
  v11.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  return v9;
}

id sub_15138()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_15244()
{
  return type metadata accessor for FinanceDataAuthorizationLevelController();
}

uint64_t type metadata accessor for FinanceDataAuthorizationLevelController()
{
  uint64_t result = qword_31438;
  if (!qword_31438) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_15298()
{
  uint64_t result = sub_26AB8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_15364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_27208();
  *(void *)(v4 + 24) = sub_271F8();
  uint64_t v6 = sub_271E8();
  return _swift_task_switch(sub_153FC, v6, v5);
}

uint64_t sub_153FC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  [v1 reloadSpecifiers];
  objc_super v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_1546C(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_27388();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_27388();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
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
  for (id result = *(id *)(v3 + 32); ; id result = (id)sub_27338())
  {
    objc_super v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)sub_27338();
LABEL_22:
    id v13 = v12;
    sub_E550(0, (unint64_t *)&qword_316D0);
    char v14 = sub_27288();

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
          id v18 = (id)sub_27338();
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)sub_27338();
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_27288();

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
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_27288();

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

uint64_t sub_15758(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_27388();
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
  uint64_t v15 = sub_27388();
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
    uint64_t v9 = sub_27348();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_19CE0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_27388();
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

  return sub_27198();
}

uint64_t sub_15924(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t), uint64_t (*a4)(void *))
{
  uint64_t v7 = *(void *)(a2(0) - 8);
  uint64_t v8 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v8 = a3(v8);
  }
  uint64_t v9 = *(void *)(v8 + 16);
  v11[0] = v8 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v11[1] = v9;
  uint64_t result = a4(v11);
  *a1 = v8;
  return result;
}

void *sub_159E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_A070(&qword_314E8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1A288((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1A8CC();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_15AD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_A070(&qword_314C0);
  uint64_t v3 = *(void *)(sub_26B08() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      uint64_t v9 = sub_1A488(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1A8CC();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Int sub_15C24(uint64_t *a1)
{
  uint64_t v2 = sub_269E8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  v280 = (char *)&v264 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  v281 = (char *)&v264 - v9;
  uint64_t v11 = __chkstk_darwin(v8, v10);
  v270 = (char *)&v264 - v12;
  uint64_t v14 = __chkstk_darwin(v11, v13);
  v271 = (char *)&v264 - v15;
  __chkstk_darwin(v14, v16);
  v266 = (char *)&v264 - v17;
  uint64_t v18 = sub_26A58();
  uint64_t v276 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18, v19);
  v273 = (char *)&v264 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v25 = (char *)&v264 - v24;
  uint64_t v27 = __chkstk_darwin(v23, v26);
  uint64_t v29 = (char *)&v264 - v28;
  uint64_t v31 = __chkstk_darwin(v27, v30);
  uint64_t v33 = (char *)&v264 - v32;
  uint64_t v35 = __chkstk_darwin(v31, v34);
  v277 = (char *)&v264 - v36;
  uint64_t v38 = __chkstk_darwin(v35, v37);
  v278 = (char *)&v264 - v39;
  uint64_t v41 = __chkstk_darwin(v38, v40);
  v267 = (char *)&v264 - v42;
  __chkstk_darwin(v41, v43);
  v268 = (char *)&v264 - v44;
  v300 = a1;
  Swift::Int v45 = a1[1];
  Swift::Int result = sub_273D8(v45);
  if (result >= v45)
  {
    if ((v45 & 0x8000000000000000) == 0)
    {
      if (v45) {
        return sub_17E04(0, v45, 1, v300);
      }
      return result;
    }
    goto LABEL_217;
  }
  if (v45 >= 0) {
    uint64_t v47 = v45;
  }
  else {
    uint64_t v47 = v45 + 1;
  }
  if (v45 < -1) {
    goto LABEL_225;
  }
  uint64_t v284 = v2;
  Swift::Int v265 = result;
  if (v45 < 2)
  {
    uint64_t v50 = v276;
    unint64_t v275 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80));
    v264 = _swiftEmptyArrayStorage;
    if (v45 != 1)
    {
      unint64_t v203 = _swiftEmptyArrayStorage[2];
      id v53 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_176;
    }
  }
  else
  {
    uint64_t v48 = v47 >> 1;
    uint64_t v49 = sub_271B8();
    *(void *)(v49 + 16) = v48;
    uint64_t v50 = v276;
    unint64_t v51 = (*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
    v264 = (void *)v49;
    unint64_t v275 = v49 + v51;
  }
  Swift::Int v52 = 0;
  v283 = (void (**)(char *, uint64_t))(v3 + 8);
  v291 = (void (**)(void))(v50 + 8);
  uint64_t v292 = v50 + 16;
  v298 = (Swift::Int *)(v50 + 32);
  id v53 = (char *)_swiftEmptyArrayStorage;
  v285 = v25;
  uint64_t v286 = v18;
  v289 = v33;
  v290 = v29;
  do
  {
    Swift::Int v54 = v52;
    v272 = v53;
    Swift::Int v274 = v52;
    if (v52 + 1 >= v45)
    {
      Swift::Int v63 = v52 + 1;
      goto LABEL_77;
    }
    uint64_t v55 = *v300;
    uint64_t v56 = *(void *)(v50 + 72);
    Swift::Int v299 = v52 + 1;
    int v57 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    v57(v268, v55 + v56 * (v52 + 1), v18);
    uint64_t v269 = v55;
    uint64_t v301 = v56;
    v294 = v57;
    v57(v267, v55 + v56 * v54, v18);
    uint64_t v58 = sub_26A18();
    uint64_t v60 = v59;
    uint64_t v61 = sub_26A18();
    Swift::Int v296 = v45;
    if (v58 == v61 && v60 == v62)
    {
      swift_bridgeObjectRelease_n();
LABEL_19:
      unint64_t v65 = v266;
      sub_26A28();
      uint64_t v66 = sub_269D8();
      unint64_t v68 = v67;
      uint64_t v69 = v284;
      id v70 = *v283;
      (*v283)(v65, v284);
      unint64_t v295 = sub_1A80C(4uLL, v66, v68);
      unint64_t v72 = v71;
      uint64_t v74 = v73;
      uint64_t v297 = v75;
      swift_bridgeObjectRelease();
      sub_26A28();
      uint64_t v76 = sub_269D8();
      unint64_t v78 = v77;
      v70(v65, v69);
      unint64_t v79 = sub_1A80C(4uLL, v76, v78);
      unint64_t v81 = v80;
      uint64_t v83 = v82;
      uint64_t v85 = v84;
      swift_bridgeObjectRelease();
      if (v74 == v83 && v297 == v85 && v295 >> 16 == v79 >> 16 && v72 >> 16 == v81 >> 16) {
        LODWORD(v295) = 0;
      }
      else {
        LODWORD(v295) = sub_273E8();
      }
      uint64_t v25 = v285;
      uint64_t v18 = v286;
      uint64_t v33 = v289;
      uint64_t v29 = v290;
      Swift::Int v54 = v274;
      Swift::Int v45 = v296;
      goto LABEL_26;
    }
    char v64 = sub_27418();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v64) {
      goto LABEL_19;
    }
    uint64_t v131 = sub_26A18();
    uint64_t v133 = v132;
    uint64_t v134 = sub_26A18();
    Swift::Int v54 = v274;
    if (v131 == v134 && v133 == v135)
    {
      LODWORD(v295) = 0;
      uint64_t v29 = v290;
    }
    else
    {
      LODWORD(v295) = sub_27418();
      uint64_t v29 = v290;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v86 = *v291;
    ((void (*)(char *, uint64_t))*v291)(v267, v18);
    v288 = v86;
    ((void (*)(char *, uint64_t))v86)(v268, v18);
    Swift::Int v63 = v54 + 2;
    if (v54 + 2 >= v45) {
      goto LABEL_63;
    }
    uint64_t v287 = v301 * v299;
    uint64_t v87 = v269;
    uint64_t v282 = v301 * v63;
    while (1)
    {
      Swift::Int v293 = v63;
      uint64_t v88 = v286;
      id v89 = v294;
      v294(v278, v87 + v282, v286);
      v89(v277, v87 + v287, v88);
      uint64_t v90 = sub_26A18();
      uint64_t v92 = v91;
      if (v90 == sub_26A18() && v92 == v93)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v94 = sub_27418();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v94 & 1) == 0)
        {
          uint64_t v127 = sub_26A18();
          uint64_t v129 = v128;
          if (v127 == sub_26A18() && v129 == v130)
          {
            int v124 = 0;
            Swift::Int v45 = v296;
          }
          else
          {
            int v124 = sub_27418();
            Swift::Int v45 = v296;
          }
          goto LABEL_51;
        }
      }
      uint64_t v95 = v271;
      sub_26A28();
      uint64_t v96 = sub_269D8();
      unint64_t v98 = v97;
      uint64_t v99 = v284;
      uint64_t v100 = *v283;
      (*v283)(v95, v284);
      if ((v98 & 0x2000000000000000) != 0) {
        uint64_t v101 = HIBYTE(v98) & 0xF;
      }
      else {
        uint64_t v101 = v96 & 0xFFFFFFFFFFFFLL;
      }
      unint64_t v102 = sub_27118();
      if (v103) {
        unint64_t v102 = 15;
      }
      if (4 * v101 < v102 >> 14) {
        goto LABEL_208;
      }
      Swift::Int v299 = v87;
      unint64_t v104 = sub_27138();
      unint64_t v106 = v105;
      uint64_t v108 = v107;
      uint64_t v297 = v109;
      swift_bridgeObjectRelease();
      v110 = v270;
      sub_26A28();
      uint64_t v111 = sub_269D8();
      unint64_t v113 = v112;
      v100(v110, v99);
      if ((v113 & 0x2000000000000000) != 0) {
        uint64_t v114 = HIBYTE(v113) & 0xF;
      }
      else {
        uint64_t v114 = v111 & 0xFFFFFFFFFFFFLL;
      }
      unint64_t v115 = sub_27118();
      if (v116) {
        unint64_t v115 = 15;
      }
      if (4 * v114 < v115 >> 14)
      {
LABEL_209:
        __break(1u);
LABEL_210:
        __break(1u);
LABEL_211:
        __break(1u);
LABEL_212:
        __break(1u);
LABEL_213:
        __break(1u);
LABEL_214:
        __break(1u);
LABEL_215:
        __break(1u);
LABEL_216:
        __break(1u);
LABEL_217:
        __break(1u);
LABEL_218:
        __break(1u);
LABEL_219:
        __break(1u);
LABEL_220:
        __break(1u);
LABEL_221:
        __break(1u);
LABEL_222:
        __break(1u);
LABEL_223:
        __break(1u);
LABEL_224:
        __break(1u);
LABEL_225:
        Swift::Int result = sub_27368();
        __break(1u);
        return result;
      }
      unint64_t v117 = sub_27138();
      unint64_t v119 = v118;
      uint64_t v121 = v120;
      uint64_t v123 = v122;
      swift_bridgeObjectRelease();
      if (v108 == v121 && v297 == v123 && v104 >> 16 == v117 >> 16 && v106 >> 16 == v119 >> 16) {
        int v124 = 0;
      }
      else {
        int v124 = sub_273E8();
      }
      uint64_t v25 = v285;
      uint64_t v33 = v289;
      uint64_t v29 = v290;
      Swift::Int v45 = v296;
      uint64_t v87 = v299;
LABEL_51:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v125 = v286;
      v126 = (void (*)(char *, uint64_t))v288;
      ((void (*)(char *, uint64_t))v288)(v277, v286);
      v126(v278, v125);
      if ((v295 ^ v124)) {
        break;
      }
      Swift::Int v63 = v293 + 1;
      v87 += v301;
      if (v45 == v293 + 1)
      {
        Swift::Int v63 = v45;
        uint64_t v18 = v286;
        goto LABEL_62;
      }
    }
    uint64_t v18 = v286;
    Swift::Int v63 = v293;
LABEL_62:
    Swift::Int v54 = v274;
LABEL_63:
    uint64_t v50 = v276;
    v136 = v272;
    if (v295)
    {
      if (v63 < v54) {
        goto LABEL_220;
      }
      if (v54 < v63)
      {
        Swift::Int v137 = v54;
        uint64_t v138 = 0;
        uint64_t v139 = v301 * (v63 - 1);
        Swift::Int v140 = v63 * v301;
        Swift::Int v141 = v137;
        uint64_t v142 = v137 * v301;
        do
        {
          if (v141 != v63 + v138 - 1)
          {
            uint64_t v144 = v269;
            if (!v269) {
              goto LABEL_223;
            }
            unint64_t v145 = v269 + v142;
            uint64_t v297 = v269 + v139;
            Swift::Int v299 = *v298;
            ((void (*)(char *, uint64_t, uint64_t, char *))v299)(v273, v269 + v142, v18, v136);
            if (v142 < v139 || v145 >= v144 + v140)
            {
              uint64_t v143 = v297;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v143 = v297;
              if (v142 != v139) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            ((void (*)(uint64_t, char *, uint64_t))v299)(v143, v273, v18);
            uint64_t v50 = v276;
            v136 = v272;
            uint64_t v29 = v290;
          }
          ++v141;
          --v138;
          v139 -= v301;
          v140 -= v301;
          v142 += v301;
        }
        while (v141 < v63 + v138);
        uint64_t v25 = v285;
        uint64_t v33 = v289;
        Swift::Int v54 = v274;
        Swift::Int v45 = v296;
      }
    }
LABEL_77:
    if (v63 >= v45) {
      goto LABEL_121;
    }
    if (__OFSUB__(v63, v54)) {
      goto LABEL_216;
    }
    if (v63 - v54 >= v265) {
      goto LABEL_121;
    }
    if (__OFADD__(v54, v265)) {
      goto LABEL_218;
    }
    if (v54 + v265 >= v45) {
      Swift::Int v146 = v45;
    }
    else {
      Swift::Int v146 = v54 + v265;
    }
    if (v146 < v54) {
      goto LABEL_219;
    }
    if (v63 == v146) {
      goto LABEL_121;
    }
    v147 = *(void (**)(void))(v50 + 72);
    uint64_t v287 = *(void *)(v50 + 16);
    v288 = v147;
    uint64_t v148 = (void)v147 * (v63 - 1);
    Swift::Int v299 = v63 * (void)v147;
    uint64_t v269 = v146;
    while (2)
    {
      uint64_t v150 = 0;
      Swift::Int v293 = v63;
      uint64_t v282 = v148;
      while (2)
      {
        v151 = v25;
        uint64_t v152 = *v300;
        Swift::Int v296 = v299 + v150;
        uint64_t v297 = v54;
        v153 = (void (*)(char *, uint64_t, uint64_t))v287;
        uint64_t v154 = v150;
        ((void (*)(char *, Swift::Int, uint64_t))v287)(v33, v299 + v150 + v152, v18);
        uint64_t v301 = v154;
        unint64_t v295 = v148 + v154;
        v153(v29, v148 + v154 + v152, v18);
        uint64_t v155 = sub_26A18();
        uint64_t v157 = v156;
        if (v155 == sub_26A18() && v157 == v158)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_95;
        }
        char v159 = sub_27418();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v159)
        {
LABEL_95:
          v160 = v281;
          sub_26A28();
          uint64_t v161 = sub_269D8();
          unint64_t v163 = v162;
          uint64_t v164 = v284;
          v165 = *v283;
          (*v283)(v160, v284);
          if ((v163 & 0x2000000000000000) != 0) {
            uint64_t v166 = HIBYTE(v163) & 0xF;
          }
          else {
            uint64_t v166 = v161 & 0xFFFFFFFFFFFFLL;
          }
          unint64_t v167 = sub_27118();
          if (v168) {
            unint64_t v167 = 15;
          }
          if (4 * v166 < v167 >> 14)
          {
            __break(1u);
LABEL_193:
            __break(1u);
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
LABEL_198:
            __break(1u);
LABEL_199:
            __break(1u);
LABEL_200:
            __break(1u);
LABEL_201:
            __break(1u);
LABEL_202:
            __break(1u);
LABEL_203:
            __break(1u);
LABEL_204:
            __break(1u);
LABEL_205:
            __break(1u);
LABEL_206:
            __break(1u);
LABEL_207:
            __break(1u);
LABEL_208:
            __break(1u);
            goto LABEL_209;
          }
          unint64_t v169 = sub_27138();
          unint64_t v171 = v170;
          uint64_t v173 = v172;
          v294 = v174;
          swift_bridgeObjectRelease();
          v175 = v280;
          sub_26A28();
          uint64_t v176 = sub_269D8();
          unint64_t v178 = v177;
          v165(v175, v164);
          if ((v178 & 0x2000000000000000) != 0) {
            uint64_t v179 = HIBYTE(v178) & 0xF;
          }
          else {
            uint64_t v179 = v176 & 0xFFFFFFFFFFFFLL;
          }
          unint64_t v180 = sub_27118();
          if (v181) {
            unint64_t v180 = 15;
          }
          if (4 * v179 < v180 >> 14) {
            goto LABEL_193;
          }
          unint64_t v182 = sub_27138();
          unint64_t v184 = v183;
          uint64_t v186 = v185;
          v188 = v187;
          swift_bridgeObjectRelease();
          if (v173 == v186 && v294 == v188 && v169 >> 16 == v182 >> 16 && v171 >> 16 == v184 >> 16)
          {
            swift_bridgeObjectRelease_n();
            v198 = *v291;
            uint64_t v29 = v290;
            uint64_t v18 = v286;
            (*v291)();
            uint64_t v33 = v289;
            ((void (*)(char *, uint64_t))v198)(v289, v18);
            uint64_t v25 = v285;
            Swift::Int v149 = v293;
            uint64_t v148 = v282;
            goto LABEL_88;
          }
          char v189 = sub_273E8();
          uint64_t v25 = v285;
          uint64_t v18 = v286;
          uint64_t v33 = v289;
          uint64_t v29 = v290;
          uint64_t v148 = v282;
          goto LABEL_115;
        }
        uint64_t v190 = sub_26A18();
        uint64_t v192 = v191;
        if (v190 != sub_26A18() || v192 != v193)
        {
          char v189 = sub_27418();
          uint64_t v25 = v151;
LABEL_115:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v194 = *v291;
          ((void (*)(char *, uint64_t))*v291)(v29, v18);
          ((void (*)(char *, uint64_t))v194)(v33, v18);
          if ((v189 & 1) == 0)
          {
            Swift::Int v149 = v293;
            goto LABEL_88;
          }
          uint64_t v195 = *v300;
          if (!*v300) {
            goto LABEL_221;
          }
          uint64_t v196 = v195 + v148 + v301;
          v197 = (void (*)(uint64_t, char *, uint64_t))*v298;
          ((void (*)(char *, uint64_t, uint64_t))*v298)(v25, v195 + v299 + v301, v18);
          swift_arrayInitWithTakeFrontToBack();
          v197(v196, v25, v18);
          uint64_t v150 = v301 - (void)v288;
          Swift::Int v54 = v297 + 1;
          Swift::Int v149 = v293;
          if (v293 == v297 + 1) {
            goto LABEL_88;
          }
          continue;
        }
        break;
      }
      swift_bridgeObjectRelease_n();
      v199 = *v291;
      ((void (*)(char *, uint64_t))*v291)(v29, v18);
      ((void (*)(char *, uint64_t))v199)(v33, v18);
      Swift::Int v149 = v293;
      uint64_t v25 = v151;
LABEL_88:
      Swift::Int v63 = v149 + 1;
      v148 += (uint64_t)v288;
      v299 += (Swift::Int)v288;
      Swift::Int v54 = v274;
      if (v63 != v269) {
        continue;
      }
      break;
    }
    Swift::Int v63 = v269;
LABEL_121:
    if (v63 < v54) {
      goto LABEL_215;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v293 = v63;
    if (isUniquelyReferenced_nonNull_native) {
      id v53 = v272;
    }
    else {
      id v53 = sub_19968(0, *((void *)v272 + 2) + 1, 1, v272);
    }
    unint64_t v202 = *((void *)v53 + 2);
    unint64_t v201 = *((void *)v53 + 3);
    unint64_t v203 = v202 + 1;
    uint64_t v50 = v276;
    if (v202 >= v201 >> 1)
    {
      v254 = sub_19968((char *)(v201 > 1), v202 + 1, 1, v53);
      uint64_t v50 = v276;
      id v53 = v254;
    }
    *((void *)v53 + 2) = v203;
    v204 = v53 + 32;
    v205 = &v53[16 * v202 + 32];
    Swift::Int v206 = v293;
    *(void *)v205 = v274;
    *((void *)v205 + 1) = v206;
    if (v202)
    {
      while (2)
      {
        unint64_t v207 = v203 - 1;
        if (v203 >= 4)
        {
          v212 = &v204[16 * v203];
          uint64_t v213 = *((void *)v212 - 8);
          uint64_t v214 = *((void *)v212 - 7);
          BOOL v218 = __OFSUB__(v214, v213);
          uint64_t v215 = v214 - v213;
          if (v218) {
            goto LABEL_198;
          }
          uint64_t v217 = *((void *)v212 - 6);
          uint64_t v216 = *((void *)v212 - 5);
          BOOL v218 = __OFSUB__(v216, v217);
          uint64_t v210 = v216 - v217;
          char v211 = v218;
          if (v218) {
            goto LABEL_199;
          }
          unint64_t v219 = v203 - 2;
          v220 = &v204[16 * v203 - 32];
          uint64_t v222 = *(void *)v220;
          uint64_t v221 = *((void *)v220 + 1);
          BOOL v218 = __OFSUB__(v221, v222);
          uint64_t v223 = v221 - v222;
          if (v218) {
            goto LABEL_201;
          }
          BOOL v218 = __OFADD__(v210, v223);
          uint64_t v224 = v210 + v223;
          if (v218) {
            goto LABEL_204;
          }
          if (v224 >= v215)
          {
            v242 = &v204[16 * v207];
            uint64_t v244 = *(void *)v242;
            uint64_t v243 = *((void *)v242 + 1);
            BOOL v218 = __OFSUB__(v243, v244);
            uint64_t v245 = v243 - v244;
            if (v218) {
              goto LABEL_210;
            }
            BOOL v235 = v210 < v245;
          }
          else
          {
LABEL_140:
            if (v211) {
              goto LABEL_200;
            }
            unint64_t v219 = v203 - 2;
            v225 = &v204[16 * v203 - 32];
            uint64_t v227 = *(void *)v225;
            uint64_t v226 = *((void *)v225 + 1);
            BOOL v228 = __OFSUB__(v226, v227);
            uint64_t v229 = v226 - v227;
            char v230 = v228;
            if (v228) {
              goto LABEL_203;
            }
            v231 = &v204[16 * v207];
            uint64_t v233 = *(void *)v231;
            uint64_t v232 = *((void *)v231 + 1);
            BOOL v218 = __OFSUB__(v232, v233);
            uint64_t v234 = v232 - v233;
            if (v218) {
              goto LABEL_206;
            }
            if (__OFADD__(v229, v234)) {
              goto LABEL_207;
            }
            if (v229 + v234 < v210) {
              goto LABEL_152;
            }
            BOOL v235 = v210 < v234;
          }
          if (v235) {
            unint64_t v207 = v219;
          }
        }
        else
        {
          if (v203 == 3)
          {
            uint64_t v209 = *((void *)v53 + 4);
            uint64_t v208 = *((void *)v53 + 5);
            BOOL v218 = __OFSUB__(v208, v209);
            uint64_t v210 = v208 - v209;
            char v211 = v218;
            goto LABEL_140;
          }
          uint64_t v236 = *((void *)v53 + 4);
          uint64_t v237 = *((void *)v53 + 5);
          BOOL v218 = __OFSUB__(v237, v236);
          uint64_t v229 = v237 - v236;
          char v230 = v218;
LABEL_152:
          if (v230) {
            goto LABEL_202;
          }
          v238 = &v204[16 * v207];
          uint64_t v240 = *(void *)v238;
          uint64_t v239 = *((void *)v238 + 1);
          BOOL v218 = __OFSUB__(v239, v240);
          uint64_t v241 = v239 - v240;
          if (v218) {
            goto LABEL_205;
          }
          if (v241 < v229) {
            goto LABEL_169;
          }
        }
        unint64_t v246 = v207 - 1;
        if (v207 - 1 >= v203) {
          goto LABEL_194;
        }
        if (!*v300) {
          goto LABEL_222;
        }
        v247 = v53;
        v248 = &v204[16 * v246];
        uint64_t v249 = *(void *)v248;
        v250 = &v204[16 * v207];
        uint64_t v251 = *((void *)v250 + 1);
        uint64_t v252 = v279;
        sub_18828(*v300 + *(void *)(v50 + 72) * *(void *)v248, *v300 + *(void *)(v50 + 72) * *(void *)v250, *v300 + *(void *)(v50 + 72) * v251, v275);
        if (v252)
        {
          v255 = v264;
LABEL_174:
          swift_bridgeObjectRelease();
          v255[2] = 0;
          return swift_bridgeObjectRelease();
        }
        if (v251 < v249) {
          goto LABEL_195;
        }
        if (v207 > *((void *)v247 + 2)) {
          goto LABEL_196;
        }
        *(void *)v248 = v249;
        *(void *)&v204[16 * v246 + 8] = v251;
        unint64_t v253 = *((void *)v247 + 2);
        if (v207 >= v253) {
          goto LABEL_197;
        }
        uint64_t v279 = 0;
        unint64_t v203 = v253 - 1;
        memmove(&v204[16 * v207], v250 + 16, 16 * (v253 - 1 - v207));
        id v53 = v247;
        *((void *)v247 + 2) = v253 - 1;
        uint64_t v50 = v276;
        uint64_t v33 = v289;
        uint64_t v29 = v290;
        if (v253 <= 2) {
          goto LABEL_169;
        }
        continue;
      }
    }
    unint64_t v203 = 1;
LABEL_169:
    Swift::Int v45 = v300[1];
    Swift::Int v52 = v293;
    uint64_t v25 = v285;
  }
  while (v293 < v45);
LABEL_176:
  if (v203 >= 2)
  {
    uint64_t v256 = *v300;
    v255 = v264;
    while (1)
    {
      unint64_t v257 = v203 - 2;
      if (v203 < 2) {
        goto LABEL_211;
      }
      if (!v256) {
        goto LABEL_224;
      }
      v258 = v53;
      uint64_t v259 = *(void *)&v53[16 * v257 + 32];
      uint64_t v260 = *(void *)&v53[16 * v203 + 24];
      uint64_t v261 = v279;
      sub_18828(v256 + *(void *)(v50 + 72) * v259, v256 + *(void *)(v50 + 72) * *(void *)&v53[16 * v203 + 16], v256 + *(void *)(v50 + 72) * v260, v275);
      if (v261) {
        goto LABEL_174;
      }
      if (v260 < v259) {
        goto LABEL_212;
      }
      uint64_t v279 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v258 = sub_19C64((uint64_t)v258);
      }
      if (v257 >= *((void *)v258 + 2)) {
        goto LABEL_213;
      }
      v262 = &v258[16 * v257 + 32];
      *(void *)v262 = v259;
      *((void *)v262 + 1) = v260;
      unint64_t v263 = *((void *)v258 + 2);
      if (v203 > v263) {
        goto LABEL_214;
      }
      memmove(&v258[16 * v203 + 16], &v258[16 * v203 + 32], 16 * (v263 - v203));
      id v53 = v258;
      *((void *)v258 + 2) = v263 - 1;
      unint64_t v203 = v263 - 1;
      uint64_t v50 = v276;
      if (v263 <= 2) {
        goto LABEL_189;
      }
    }
  }
  v255 = v264;
LABEL_189:
  swift_bridgeObjectRelease();
  v255[2] = 0;
  return swift_bridgeObjectRelease();
}

Swift::Int sub_17244(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_26B08();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  Swift::Int v140 = (char *)&v135 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v155 = (char *)&v135 - v11;
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v150 = (char *)&v135 - v14;
  __chkstk_darwin(v13, v15);
  v151 = (char *)&v135 - v16;
  Swift::Int v17 = a1[1];
  Swift::Int result = sub_273D8(v17);
  if (result >= v17)
  {
    if (v17 < 0) {
      goto LABEL_140;
    }
    if (v17) {
      return sub_18508(0, v17, 1, a1);
    }
    return result;
  }
  if (v17 >= 0) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v17 + 1;
  }
  if (v17 < -1) {
    goto LABEL_148;
  }
  uint64_t v153 = v4;
  uint64_t v154 = a1;
  Swift::Int v137 = result;
  if (v17 < 2)
  {
    uint64_t v23 = (char *)_swiftEmptyArrayStorage;
    unint64_t v142 = (unint64_t)_swiftEmptyArrayStorage
         + ((*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80));
    v136 = _swiftEmptyArrayStorage;
    if (v17 != 1)
    {
      unint64_t v25 = _swiftEmptyArrayStorage[2];
LABEL_106:
      if (v25 >= 2)
      {
        uint64_t v129 = *v154;
        do
        {
          unint64_t v130 = v25 - 2;
          if (v25 < 2) {
            goto LABEL_135;
          }
          if (!v129) {
            goto LABEL_147;
          }
          uint64_t v131 = *(void *)&v23[16 * v130 + 32];
          uint64_t v132 = *(void *)&v23[16 * v25 + 24];
          sub_19320(v129 + v5[9] * v131, v129 + v5[9] * *(void *)&v23[16 * v25 + 16], v129 + v5[9] * v132, v142);
          if (v2) {
            break;
          }
          if (v132 < v131) {
            goto LABEL_136;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v23 = sub_19C64((uint64_t)v23);
          }
          if (v130 >= *((void *)v23 + 2)) {
            goto LABEL_137;
          }
          uint64_t v133 = &v23[16 * v130 + 32];
          *(void *)uint64_t v133 = v131;
          *((void *)v133 + 1) = v132;
          unint64_t v134 = *((void *)v23 + 2);
          if (v25 > v134) {
            goto LABEL_138;
          }
          memmove(&v23[16 * v25 + 16], &v23[16 * v25 + 32], 16 * (v134 - v25));
          *((void *)v23 + 2) = v134 - 1;
          unint64_t v25 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      v136[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v20 = v19 >> 1;
    uint64_t v21 = sub_271B8();
    *(void *)(v21 + 16) = v20;
    unint64_t v22 = (*((unsigned __int8 *)v5 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v5 + 80);
    v136 = (void *)v21;
    unint64_t v142 = v21 + v22;
  }
  Swift::Int v24 = 0;
  uint64_t v148 = (void (**)(char *, uint64_t))(v5 + 1);
  Swift::Int v149 = v5 + 2;
  uint64_t v158 = (void (**)(char *, uint64_t, uint64_t))(v5 + 4);
  uint64_t v23 = (char *)_swiftEmptyArrayStorage;
  uint64_t v143 = v5;
  while (1)
  {
    Swift::Int v26 = v24;
    Swift::Int v27 = v24 + 1;
    Swift::Int v141 = v24;
    if (v24 + 1 >= v17) {
      goto LABEL_37;
    }
    uint64_t v28 = v153;
    uint64_t v29 = *v154;
    uint64_t v145 = v29;
    Swift::Int v146 = v24 + 1;
    Swift::Int v157 = v143[9];
    Swift::Int v30 = v157;
    uint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v143[2];
    v31(v151, v29 + v157 * v27, v153);
    uint64_t v32 = v29 + v30 * v26;
    uint64_t v33 = v150;
    v31(v150, v32, v28);
    uint64_t v34 = sub_1A1D8(&qword_314C8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
    uint64_t v35 = v151;
    Swift::Int v152 = v34;
    LODWORD(v156) = sub_27078();
    Swift::Int v36 = v17;
    uint64_t v37 = (void (*)(char *, uint64_t))v143[1];
    uint64_t v38 = v33;
    Swift::Int v26 = v141;
    v37(v38, v28);
    v37(v35, v28);
    Swift::Int v39 = v157;
    Swift::Int v27 = v26 + 2;
    Swift::Int v147 = v36;
    if (v26 + 2 >= v36)
    {
      Swift::Int v17 = v147;
      if ((v156 & 1) == 0) {
        goto LABEL_37;
      }
    }
    else
    {
      uint64_t v138 = v23;
      uint64_t v135 = v2;
      v146 *= v157;
      uint64_t v40 = v145;
      Swift::Int v41 = v157 * v27;
      while (1)
      {
        Swift::Int v42 = v27;
        uint64_t v43 = v151;
        uint64_t v44 = v153;
        v31(v151, v40 + v41, v153);
        Swift::Int v45 = v150;
        v31(v150, v40 + v146, v44);
        int v46 = sub_27078();
        v37(v45, v44);
        v37(v43, v44);
        if ((v156 ^ v46)) {
          break;
        }
        Swift::Int v27 = v42 + 1;
        Swift::Int v39 = v157;
        v40 += v157;
        if (v147 == v42 + 1)
        {
          Swift::Int v17 = v147;
          Swift::Int v27 = v147;
          uint64_t v2 = v135;
          uint64_t v23 = v138;
          Swift::Int v26 = v141;
          if (v156) {
            goto LABEL_25;
          }
          goto LABEL_37;
        }
      }
      uint64_t v2 = v135;
      uint64_t v23 = v138;
      Swift::Int v27 = v42;
      Swift::Int v26 = v141;
      Swift::Int v17 = v147;
      Swift::Int v39 = v157;
      if ((v156 & 1) == 0) {
        goto LABEL_37;
      }
    }
LABEL_25:
    if (v27 < v26) {
      goto LABEL_141;
    }
    if (v26 >= v27)
    {
LABEL_37:
      unint64_t v51 = v154;
      goto LABEL_38;
    }
    uint64_t v138 = v23;
    uint64_t v47 = 0;
    uint64_t v48 = v39 * (v27 - 1);
    Swift::Int v49 = v27 * v39;
    uint64_t v50 = v26 * v39;
    unint64_t v51 = v154;
    Swift::Int v152 = v27;
    do
    {
      if (v26 != v27 + v47 - 1)
      {
        uint64_t v53 = v145;
        if (!v145) {
          goto LABEL_146;
        }
        uint64_t v54 = v2;
        unint64_t v55 = v145 + v50;
        uint64_t v56 = (char *)(v145 + v48);
        uint64_t v156 = *v158;
        v156(v140, v145 + v50, v153);
        if (v50 < v48 || v55 >= v53 + v49)
        {
          uint64_t v52 = v153;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          uint64_t v52 = v153;
          if (v50 != v48) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v156(v56, (uint64_t)v140, v52);
        uint64_t v2 = v54;
        unint64_t v51 = v154;
        Swift::Int v27 = v152;
        Swift::Int v39 = v157;
      }
      ++v26;
      --v47;
      v48 -= v39;
      v49 -= v39;
      v50 += v39;
    }
    while (v26 < v27 + v47);
    uint64_t v23 = v138;
    Swift::Int v26 = v141;
    Swift::Int v17 = v147;
LABEL_38:
    uint64_t v57 = v153;
    if (v27 >= v17) {
      goto LABEL_57;
    }
    if (__OFSUB__(v27, v26)) {
      goto LABEL_139;
    }
    if (v27 - v26 >= v137) {
      goto LABEL_57;
    }
    if (__OFADD__(v26, v137)) {
      goto LABEL_142;
    }
    Swift::Int v58 = v26 + v137 >= v17 ? v17 : v26 + v137;
    if (v58 < v26) {
      break;
    }
    if (v27 != v58)
    {
      uint64_t v138 = v23;
      uint64_t v135 = v2;
      uint64_t v59 = v143[9];
      uint64_t v144 = (void (*)(char *, uint64_t, uint64_t))v143[2];
      uint64_t v145 = v59;
      uint64_t v60 = v59 * (v27 - 1);
      Swift::Int v61 = v27 * v59;
      Swift::Int v139 = v58;
      do
      {
        uint64_t v63 = 0;
        Swift::Int v152 = v27;
        Swift::Int v146 = v61;
        Swift::Int v147 = v60;
        while (1)
        {
          uint64_t v64 = *v51;
          uint64_t v156 = (void (*)(char *, uint64_t, uint64_t))(v61 + v63);
          Swift::Int v157 = v26;
          Swift::Int v65 = v61 + v63 + v64;
          uint64_t v66 = v151;
          unint64_t v67 = v51;
          unint64_t v68 = v144;
          v144(v151, v65, v57);
          uint64_t v69 = v60 + v63 + v64;
          id v70 = v150;
          v68(v150, v69, v57);
          sub_1A1D8(&qword_314C8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
          LOBYTE(v64) = sub_27078();
          unint64_t v71 = *v148;
          (*v148)(v70, v57);
          v71(v66, v57);
          if ((v64 & 1) == 0) {
            break;
          }
          uint64_t v72 = *v67;
          if (!*v67) {
            goto LABEL_144;
          }
          Swift::Int v61 = v146;
          uint64_t v60 = v147;
          uint64_t v73 = (char *)(v72 + v147 + v63);
          uint64_t v74 = *v158;
          uint64_t v75 = v153;
          (*v158)(v155, v72 + v146 + v63, v153);
          uint64_t v57 = v75;
          swift_arrayInitWithTakeFrontToBack();
          v74(v73, (uint64_t)v155, v75);
          v63 -= v145;
          Swift::Int v26 = v157 + 1;
          Swift::Int v62 = v152;
          unint64_t v51 = v154;
          if (v152 == v157 + 1) {
            goto LABEL_49;
          }
        }
        Swift::Int v62 = v152;
        uint64_t v57 = v153;
        unint64_t v51 = v67;
        Swift::Int v61 = v146;
        uint64_t v60 = v147;
LABEL_49:
        Swift::Int v27 = v62 + 1;
        v60 += v145;
        v61 += v145;
        Swift::Int v26 = v141;
      }
      while (v27 != v139);
      Swift::Int v27 = v139;
      uint64_t v2 = v135;
      uint64_t v23 = v138;
    }
LABEL_57:
    if (v27 < v26) {
      goto LABEL_134;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v152 = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v23 = sub_19968(0, *((void *)v23 + 2) + 1, 1, v23);
    }
    unint64_t v78 = *((void *)v23 + 2);
    unint64_t v77 = *((void *)v23 + 3);
    unint64_t v25 = v78 + 1;
    if (v78 >= v77 >> 1) {
      uint64_t v23 = sub_19968((char *)(v77 > 1), v78 + 1, 1, v23);
    }
    *((void *)v23 + 2) = v25;
    unint64_t v79 = v23 + 32;
    unint64_t v80 = &v23[16 * v78 + 32];
    Swift::Int v81 = v152;
    *(void *)unint64_t v80 = v26;
    *((void *)v80 + 1) = v81;
    if (v78)
    {
      while (1)
      {
        unint64_t v82 = v25 - 1;
        if (v25 >= 4)
        {
          uint64_t v87 = &v79[16 * v25];
          uint64_t v88 = *((void *)v87 - 8);
          uint64_t v89 = *((void *)v87 - 7);
          BOOL v93 = __OFSUB__(v89, v88);
          uint64_t v90 = v89 - v88;
          if (v93) {
            goto LABEL_123;
          }
          uint64_t v92 = *((void *)v87 - 6);
          uint64_t v91 = *((void *)v87 - 5);
          BOOL v93 = __OFSUB__(v91, v92);
          uint64_t v85 = v91 - v92;
          char v86 = v93;
          if (v93) {
            goto LABEL_124;
          }
          unint64_t v94 = v25 - 2;
          uint64_t v95 = &v79[16 * v25 - 32];
          uint64_t v97 = *(void *)v95;
          uint64_t v96 = *((void *)v95 + 1);
          BOOL v93 = __OFSUB__(v96, v97);
          uint64_t v98 = v96 - v97;
          if (v93) {
            goto LABEL_126;
          }
          BOOL v93 = __OFADD__(v85, v98);
          uint64_t v99 = v85 + v98;
          if (v93) {
            goto LABEL_129;
          }
          if (v99 >= v90)
          {
            unint64_t v117 = &v79[16 * v82];
            uint64_t v119 = *(void *)v117;
            uint64_t v118 = *((void *)v117 + 1);
            BOOL v93 = __OFSUB__(v118, v119);
            uint64_t v120 = v118 - v119;
            if (v93) {
              goto LABEL_133;
            }
            BOOL v110 = v85 < v120;
            goto LABEL_94;
          }
        }
        else
        {
          if (v25 != 3)
          {
            uint64_t v111 = *((void *)v23 + 4);
            uint64_t v112 = *((void *)v23 + 5);
            BOOL v93 = __OFSUB__(v112, v111);
            uint64_t v104 = v112 - v111;
            char v105 = v93;
            goto LABEL_88;
          }
          uint64_t v84 = *((void *)v23 + 4);
          uint64_t v83 = *((void *)v23 + 5);
          BOOL v93 = __OFSUB__(v83, v84);
          uint64_t v85 = v83 - v84;
          char v86 = v93;
        }
        if (v86) {
          goto LABEL_125;
        }
        unint64_t v94 = v25 - 2;
        uint64_t v100 = &v79[16 * v25 - 32];
        uint64_t v102 = *(void *)v100;
        uint64_t v101 = *((void *)v100 + 1);
        BOOL v103 = __OFSUB__(v101, v102);
        uint64_t v104 = v101 - v102;
        char v105 = v103;
        if (v103) {
          goto LABEL_128;
        }
        unint64_t v106 = &v79[16 * v82];
        uint64_t v108 = *(void *)v106;
        uint64_t v107 = *((void *)v106 + 1);
        BOOL v93 = __OFSUB__(v107, v108);
        uint64_t v109 = v107 - v108;
        if (v93) {
          goto LABEL_131;
        }
        if (__OFADD__(v104, v109)) {
          goto LABEL_132;
        }
        if (v104 + v109 >= v85)
        {
          BOOL v110 = v85 < v109;
LABEL_94:
          if (v110) {
            unint64_t v82 = v94;
          }
          goto LABEL_96;
        }
LABEL_88:
        if (v105) {
          goto LABEL_127;
        }
        unint64_t v113 = &v79[16 * v82];
        uint64_t v115 = *(void *)v113;
        uint64_t v114 = *((void *)v113 + 1);
        BOOL v93 = __OFSUB__(v114, v115);
        uint64_t v116 = v114 - v115;
        if (v93) {
          goto LABEL_130;
        }
        if (v116 < v104) {
          goto LABEL_14;
        }
LABEL_96:
        unint64_t v121 = v82 - 1;
        if (v82 - 1 >= v25)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
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
          goto LABEL_143;
        }
        if (!*v154) {
          goto LABEL_145;
        }
        uint64_t v122 = v23;
        uint64_t v123 = &v79[16 * v121];
        uint64_t v124 = *(void *)v123;
        uint64_t v125 = &v79[16 * v82];
        uint64_t v126 = *((void *)v125 + 1);
        sub_19320(*v154 + v143[9] * *(void *)v123, *v154 + v143[9] * *(void *)v125, *v154 + v143[9] * v126, v142);
        if (v2) {
          goto LABEL_117;
        }
        if (v126 < v124) {
          goto LABEL_120;
        }
        if (v82 > *((void *)v122 + 2)) {
          goto LABEL_121;
        }
        uint64_t v127 = v122;
        *(void *)uint64_t v123 = v124;
        *(void *)&v79[16 * v121 + 8] = v126;
        unint64_t v128 = *((void *)v122 + 2);
        if (v82 >= v128) {
          goto LABEL_122;
        }
        uint64_t v23 = v127;
        unint64_t v25 = v128 - 1;
        memmove(&v79[16 * v82], v125 + 16, 16 * (v128 - 1 - v82));
        *((void *)v23 + 2) = v128 - 1;
        if (v128 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v25 = 1;
LABEL_14:
    Swift::Int v17 = v154[1];
    Swift::Int v24 = v152;
    uint64_t v5 = v143;
    if (v152 >= v17) {
      goto LABEL_106;
    }
  }
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
  Swift::Int result = sub_27368();
  __break(1u);
  return result;
}

unint64_t sub_17E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v95 = a4;
  uint64_t v77 = a1;
  uint64_t v6 = sub_269E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  unint64_t v82 = &v75[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9, v11);
  uint64_t v83 = &v75[-v12];
  uint64_t v13 = sub_26A58();
  uint64_t v15 = __chkstk_darwin(v13, v14);
  Swift::Int v17 = &v75[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = __chkstk_darwin(v15, v18);
  uint64_t v98 = &v75[-v20];
  unint64_t result = __chkstk_darwin(v19, v21);
  unint64_t v25 = &v75[-v23];
  uint64_t v90 = a3;
  uint64_t v76 = a2;
  if (a3 == a2) {
    return result;
  }
  char v86 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v87 = v24 + 16;
  uint64_t v26 = *(void *)(v24 + 72);
  uint64_t v80 = v6;
  Swift::Int v81 = (void (**)(unsigned char *, uint64_t))(v7 + 8);
  uint64_t v84 = (void (**)(unsigned char *, uint64_t))(v24 + 8);
  uint64_t v85 = &v75[-v23];
  uint64_t v92 = (void (**)(unsigned char *, uint64_t, uint64_t))(v24 + 32);
  uint64_t v27 = v26 * (v90 - 1);
  uint64_t v88 = v26;
  uint64_t v97 = v26 * v90;
  unint64_t v78 = v17;
  uint64_t v79 = v13;
  while (2)
  {
    uint64_t v99 = 0;
    uint64_t v96 = v77;
    uint64_t v89 = v27;
    while (1)
    {
      uint64_t v29 = v6;
      uint64_t v30 = *v95;
      uint64_t v31 = v99;
      uint64_t v94 = v97 + v99;
      uint64_t v32 = v86;
      v86(v25, v97 + v99 + v30, v13);
      uint64_t v93 = v27 + v31;
      v32(v98, v27 + v31 + v30, v13);
      uint64_t v33 = sub_26A18();
      uint64_t v35 = v34;
      if (v33 == sub_26A18() && v35 == v36) {
        break;
      }
      char v37 = sub_27418();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v29;
      if (v37) {
        goto LABEL_13;
      }
      uint64_t v66 = sub_26A18();
      uint64_t v68 = v67;
      if (v66 == sub_26A18() && v68 == v69)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v74 = (uint64_t (*)(unsigned char *, uint64_t))*v84;
        (*v84)(v98, v13);
        unint64_t v25 = v85;
        unint64_t result = v74(v85, v13);
        goto LABEL_5;
      }
      char v65 = sub_27418();
LABEL_33:
      uint64_t v27 = v89;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v70 = (uint64_t (*)(unsigned char *, uint64_t))*v84;
      (*v84)(v98, v13);
      unint64_t v25 = v85;
      unint64_t result = v70(v85, v13);
      if (v65)
      {
        uint64_t v71 = *v95;
        if (!*v95) {
          goto LABEL_39;
        }
        uint64_t v72 = v71 + v27 + v99;
        uint64_t v73 = (uint64_t (*)(uint64_t, unsigned char *, uint64_t))*v92;
        (*v92)(v17, v71 + v97 + v99, v13);
        swift_arrayInitWithTakeFrontToBack();
        unint64_t result = v73(v72, v17, v13);
        v99 -= v88;
        if (v90 != ++v96) {
          continue;
        }
      }
      goto LABEL_6;
    }
    swift_bridgeObjectRelease_n();
    uint64_t v6 = v29;
LABEL_13:
    uint64_t v38 = v83;
    sub_26A28();
    uint64_t v39 = sub_269D8();
    unint64_t v41 = v40;
    Swift::Int v42 = *v81;
    (*v81)(v38, v6);
    if ((v41 & 0x2000000000000000) != 0) {
      uint64_t v43 = HIBYTE(v41) & 0xF;
    }
    else {
      uint64_t v43 = v39 & 0xFFFFFFFFFFFFLL;
    }
    unint64_t result = sub_27118();
    if (v44) {
      unint64_t result = 15;
    }
    if (4 * v43 >= result >> 14)
    {
      unint64_t v45 = sub_27138();
      uint64_t v46 = v6;
      unint64_t v48 = v47;
      uint64_t v50 = v49;
      uint64_t v91 = v51;
      swift_bridgeObjectRelease();
      uint64_t v52 = v82;
      sub_26A28();
      uint64_t v53 = sub_269D8();
      unint64_t v55 = v54;
      v42(v52, v46);
      if ((v55 & 0x2000000000000000) != 0) {
        uint64_t v56 = HIBYTE(v55) & 0xF;
      }
      else {
        uint64_t v56 = v53 & 0xFFFFFFFFFFFFLL;
      }
      unint64_t result = sub_27118();
      if (v57) {
        unint64_t result = 15;
      }
      if (4 * v56 < result >> 14) {
        goto LABEL_38;
      }
      unint64_t v58 = sub_27138();
      unint64_t v60 = v59;
      uint64_t v62 = v61;
      uint64_t v64 = v63;
      swift_bridgeObjectRelease();
      if (v50 == v62 && v91 == v64 && v45 >> 16 == v58 >> 16 && v48 >> 16 == v60 >> 16)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v28 = (uint64_t (*)(unsigned char *, uint64_t))*v84;
        uint64_t v13 = v79;
        (*v84)(v98, v79);
        unint64_t v25 = v85;
        unint64_t result = v28(v85, v13);
        uint64_t v6 = v80;
        Swift::Int v17 = v78;
LABEL_5:
        uint64_t v27 = v89;
LABEL_6:
        v27 += v88;
        v97 += v88;
        if (++v90 == v76) {
          return result;
        }
        continue;
      }
      char v65 = sub_273E8();
      uint64_t v13 = v79;
      uint64_t v6 = v80;
      Swift::Int v17 = v78;
      goto LABEL_33;
    }
    break;
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_18508(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = sub_26B08();
  uint64_t v9 = __chkstk_darwin(v7, v8);
  char v44 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  unint64_t v40 = (char *)&v32 - v13;
  uint64_t result = __chkstk_darwin(v12, v14);
  uint64_t v39 = (char *)&v32 - v17;
  uint64_t v42 = a3;
  uint64_t v33 = a2;
  if (a3 != a2)
  {
    uint64_t v19 = *(void (**)(void, void, void))(v16 + 16);
    uint64_t v18 = v16 + 16;
    uint64_t v20 = *(void *)(v18 + 56);
    uint64_t v35 = (uint64_t (**)(char *, uint64_t))(v18 - 8);
    uint64_t v36 = (void (*)(char *, uint64_t, uint64_t))v19;
    char v37 = a4;
    uint64_t v38 = v18;
    uint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v47 = v20 * (v42 - 1);
    uint64_t v41 = v20;
    uint64_t v46 = v20 * v42;
LABEL_5:
    uint64_t v21 = 0;
    uint64_t v45 = v34;
    while (1)
    {
      uint64_t v22 = *a4;
      uint64_t v23 = v46 + v21 + *a4;
      uint64_t v24 = v39;
      unint64_t v25 = v36;
      v36(v39, v23, v7);
      uint64_t v26 = v40;
      v25(v40, v47 + v21 + v22, v7);
      sub_1A1D8(&qword_314C8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
      LOBYTE(v25) = sub_27078();
      uint64_t v27 = *v35;
      (*v35)(v26, v7);
      uint64_t v28 = v24;
      a4 = v37;
      uint64_t result = v27(v28, v7);
      if ((v25 & 1) == 0)
      {
LABEL_4:
        v47 += v41;
        v46 += v41;
        if (++v42 == v33) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v29 = *a4;
      if (!*a4) {
        break;
      }
      uint64_t v30 = v29 + v47 + v21;
      uint64_t v31 = *v43;
      (*v43)(v44, v29 + v46 + v21, v7);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(v30, v44, v7);
      v21 -= v41;
      if (v42 == ++v45) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_18828(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v132 = a4;
  uint64_t v124 = sub_269E8();
  uint64_t v7 = *(void *)(v124 - 8);
  __chkstk_darwin(v124, v8);
  uint64_t v123 = (char *)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_26A58();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  unint64_t v129 = (unint64_t)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  unint64_t v128 = (char *)&v116 - v17;
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v131 = (char *)&v116 - v20;
  __chkstk_darwin(v19, v21);
  unint64_t v130 = (unint64_t)&v116 - v22;
  uint64_t v24 = *(void *)(v23 + 72);
  if (!v24)
  {
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  if (a2 - a1 == 0x8000000000000000 && v24 == -1) {
    goto LABEL_92;
  }
  int64_t v25 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v24 == -1) {
    goto LABEL_93;
  }
  uint64_t v26 = (uint64_t)(a2 - a1) / v24;
  unint64_t v135 = a1;
  unint64_t v134 = v132;
  uint64_t v27 = v25 / v24;
  uint64_t v122 = v10;
  if (v26 >= v25 / v24)
  {
    if (v27 < 0) {
      goto LABEL_94;
    }
    uint64_t v29 = v27 * v24;
    if (v132 < a2 || a2 + v29 <= v132)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v132 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v70 = v132 + v29;
    unint64_t v133 = v132 + v29;
    unint64_t v135 = a2;
    if (v29 < 1 || a1 >= a2)
    {
LABEL_59:
      sub_19B20(&v135, &v134, (uint64_t *)&v133, (uint64_t (*)(void))&type metadata accessor for InternalAccount);
      return 1;
    }
    uint64_t v73 = -v24;
    uint64_t v74 = *(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16);
    unint64_t v117 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v125 = v11 + 16;
    uint64_t v118 = (void (**)(unint64_t, uint64_t))(v11 + 8);
    uint64_t v119 = v74;
    uint64_t v120 = -v24;
    unint64_t v121 = (char *)a1;
    while (1)
    {
      uint64_t v75 = v119;
      v119((unint64_t)v128, v70 + v73, v10);
      v75(v129, a2 + v73, v10);
      uint64_t v76 = sub_26A18();
      uint64_t v78 = v77;
      uint64_t v79 = sub_26A18();
      uint64_t v131 = (char *)(a2 + v73);
      if (v76 == v79 && v78 == v80) {
        break;
      }
      char v81 = sub_27418();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v81) {
        goto LABEL_64;
      }
      unint64_t v106 = a3;
      uint64_t v112 = sub_26A18();
      uint64_t v114 = v113;
      if (v112 == sub_26A18() && v114 == v115)
      {
        char v104 = 0;
        uint64_t v105 = v10;
      }
      else
      {
        char v104 = sub_27418();
        uint64_t v105 = v10;
      }
LABEL_71:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v73 = v120;
      unint64_t v107 = v106 + v120;
      uint64_t v108 = *v118;
      (*v118)(v129, v105);
      uint64_t v10 = v105;
      v108((unint64_t)v128, v105);
      if (v104)
      {
        if (v106 < a2 || v107 >= a2)
        {
          BOOL v110 = v131;
          swift_arrayInitWithTakeFrontToBack();
          uint64_t v109 = v121;
        }
        else
        {
          uint64_t v109 = v121;
          BOOL v110 = v131;
          if (v106 != a2) {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v135 += v73;
      }
      else
      {
        unint64_t v111 = v133;
        v133 += v73;
        if (v106 < v111 || v107 >= v111)
        {
          swift_arrayInitWithTakeFrontToBack();
          BOOL v110 = (char *)a2;
          uint64_t v109 = v121;
        }
        else
        {
          uint64_t v109 = v121;
          if (v106 != v111) {
            swift_arrayInitWithTakeBackToFront();
          }
          BOOL v110 = (char *)a2;
        }
      }
      unint64_t v70 = v133;
      if (v133 > v132)
      {
        a2 = (unint64_t)v110;
        a3 = v106 + v73;
        if (v110 > v109) {
          continue;
        }
      }
      goto LABEL_59;
    }
    swift_bridgeObjectRelease_n();
LABEL_64:
    unint64_t v126 = a3;
    unint64_t v127 = a2;
    unint64_t v82 = v123;
    sub_26A28();
    uint64_t v83 = sub_269D8();
    unint64_t v85 = v84;
    char v86 = *v117;
    uint64_t v87 = v124;
    (*v117)(v82, v124);
    unint64_t v130 = sub_1A80C(4uLL, v83, v85);
    unint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    swift_bridgeObjectRelease();
    sub_26A28();
    uint64_t v94 = sub_269D8();
    unint64_t v96 = v95;
    v86(v82, v87);
    unint64_t v97 = sub_1A80C(4uLL, v94, v96);
    unint64_t v99 = v98;
    uint64_t v101 = v100;
    uint64_t v103 = v102;
    swift_bridgeObjectRelease();
    if (v91 == v101 && v93 == v103 && v130 >> 16 == v97 >> 16 && v89 >> 16 == v99 >> 16) {
      char v104 = 0;
    }
    else {
      char v104 = sub_273E8();
    }
    uint64_t v105 = v122;
    unint64_t v106 = v126;
    a2 = v127;
    goto LABEL_71;
  }
  if ((v26 & 0x8000000000000000) == 0)
  {
    uint64_t v28 = v26 * v24;
    if (v132 < a1 || a1 + v28 <= v132)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v132 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v128 = (char *)(v132 + v28);
    unint64_t v133 = v132 + v28;
    if (v28 >= 1 && a2 < a3)
    {
      uint64_t v31 = *(char **)(v11 + 16);
      uint64_t v125 = v11 + 16;
      unint64_t v126 = a3;
      uint64_t v120 = v11 + 8;
      unint64_t v121 = v31;
      uint64_t v118 = (void (**)(unint64_t, uint64_t))(v7 + 8);
      uint64_t v119 = (void (*)(unint64_t, unint64_t, uint64_t))v24;
      while (1)
      {
        uint64_t v32 = v121;
        ((void (*)(unint64_t, unint64_t, uint64_t))v121)(v130, a2, v10);
        ((void (*)(char *, unint64_t, uint64_t))v32)(v131, v132, v10);
        uint64_t v33 = sub_26A18();
        uint64_t v35 = v34;
        if (v33 == sub_26A18() && v35 == v36) {
          break;
        }
        char v37 = sub_27418();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v37) {
          goto LABEL_27;
        }
        uint64_t v64 = sub_26A18();
        uint64_t v66 = v65;
        if (v64 == sub_26A18() && v66 == v67)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v68 = *(void (**)(char *, uint64_t))v120;
          (*(void (**)(char *, uint64_t))v120)(v131, v10);
          v68((char *)v130, v10);
LABEL_41:
          unint64_t v62 = v135;
          unint64_t v69 = v134 + v24;
          if (v135 < v134 || v135 >= v69)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v135 != v134)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v134 = v69;
          unint64_t v63 = a2;
          goto LABEL_50;
        }
        char v60 = sub_27418();
LABEL_33:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v61 = *(void (**)(char *, uint64_t))v120;
        (*(void (**)(char *, uint64_t))v120)(v131, v10);
        v61((char *)v130, v10);
        if ((v60 & 1) == 0) {
          goto LABEL_41;
        }
        unint64_t v62 = v135;
        unint64_t v63 = a2 + v24;
        if (v135 < a2 || v135 >= v63)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v135 == a2)
        {
          unint64_t v62 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_50:
        unint64_t v135 = v62 + v24;
        unint64_t v132 = v134;
        if (v134 < (unint64_t)v128)
        {
          a2 = v63;
          if (v63 < a3) {
            continue;
          }
        }
        goto LABEL_59;
      }
      swift_bridgeObjectRelease_n();
LABEL_27:
      unint64_t v127 = a2;
      uint64_t v38 = v123;
      sub_26A28();
      uint64_t v39 = sub_269D8();
      unint64_t v41 = v40;
      uint64_t v42 = *v118;
      uint64_t v43 = v124;
      (*v118)((unint64_t)v38, v124);
      unint64_t v132 = sub_1A80C(4uLL, v39, v41);
      unint64_t v129 = (unint64_t)v44;
      uint64_t v46 = v45;
      uint64_t v48 = v47;
      swift_bridgeObjectRelease();
      sub_26A28();
      uint64_t v49 = sub_269D8();
      unint64_t v51 = v50;
      v42((unint64_t)v38, v43);
      unint64_t v52 = sub_1A80C(4uLL, v49, v51);
      unint64_t v54 = v53;
      uint64_t v56 = v55;
      uint64_t v58 = v57;
      swift_bridgeObjectRelease();
      if (v46 == v56 && v48 == v58 && v132 >> 16 == v52 >> 16 && v129 >> 16 == v54 >> 16)
      {
        swift_bridgeObjectRelease_n();
        unint64_t v59 = *(void (**)(char *, uint64_t))v120;
        uint64_t v10 = v122;
        (*(void (**)(char *, uint64_t))v120)(v131, v122);
        v59((char *)v130, v10);
        a3 = v126;
        a2 = v127;
        uint64_t v24 = (uint64_t)v119;
        goto LABEL_41;
      }
      char v60 = sub_273E8();
      uint64_t v10 = v122;
      a3 = v126;
      a2 = v127;
      uint64_t v24 = (uint64_t)v119;
      goto LABEL_33;
    }
    goto LABEL_59;
  }
LABEL_94:
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

uint64_t sub_19320(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_26B08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v58 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v13);
  uint64_t v57 = (char *)v51 - v14;
  uint64_t v59 = *(void *)(v15 + 72);
  if (!v59)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (a2 - a1 == 0x8000000000000000 && v59 == -1) {
    goto LABEL_68;
  }
  int64_t v16 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v59 == -1) {
    goto LABEL_69;
  }
  uint64_t v17 = (uint64_t)(a2 - a1) / v59;
  unint64_t v62 = a1;
  unint64_t v61 = a4;
  uint64_t v18 = v16 / v59;
  if (v17 >= v16 / v59)
  {
    if ((v18 & 0x8000000000000000) == 0)
    {
      uint64_t v20 = v18 * v59;
      if (a4 < a2 || a2 + v20 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        uint64_t v21 = v9;
      }
      else
      {
        uint64_t v21 = v9;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v36 = a4 + v20;
      unint64_t v60 = a4 + v20;
      unint64_t v62 = a2;
      unint64_t v54 = a1;
      if (v20 >= 1 && a1 < a2)
      {
        unint64_t v38 = -v59;
        unint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
        uint64_t v39 = v21 + 16;
        v51[1] = v39 - 8;
        unint64_t v52 = v40;
        unint64_t v55 = -v59;
        uint64_t v56 = v39;
        unint64_t v53 = a4;
        unint64_t v41 = v57;
        uint64_t v42 = (void (**)(char *, uint64_t))(v39 - 8);
        do
        {
          uint64_t v59 = a3 + v38;
          uint64_t v43 = v52;
          v52(v41, v36 + v38, v8);
          unint64_t v44 = a2 + v38;
          unint64_t v45 = a3;
          uint64_t v46 = v58;
          v43(v58, v44, v8);
          sub_1A1D8(&qword_314C8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
          LOBYTE(v43) = sub_27078();
          uint64_t v47 = *v42;
          (*v42)(v46, v8);
          v47(v41, v8);
          if (v43)
          {
            a3 = v59;
            if (v45 < a2 || v59 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v48 = v53;
            }
            else
            {
              unint64_t v48 = v53;
              if (v45 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v38 = v55;
            v62 += v55;
          }
          else
          {
            a3 = v59;
            unint64_t v49 = v60;
            v60 += v55;
            if (v45 < v49 || v59 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v44 = a2;
              unint64_t v38 = v55;
              unint64_t v48 = v53;
            }
            else
            {
              unint64_t v48 = v53;
              if (v45 != v49) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v44 = a2;
              unint64_t v38 = v55;
            }
          }
          unint64_t v36 = v60;
          if (v60 <= v48) {
            break;
          }
          a2 = v44;
        }
        while (v44 > v54);
      }
      goto LABEL_66;
    }
  }
  else if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = v17 * v59;
    if (a4 < a1 || a1 + v19 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v55 = a4 + v19;
    unint64_t v60 = a4 + v19;
    if (v19 >= 1 && a2 < a3)
    {
      uint64_t v23 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      uint64_t v56 = v9 + 16;
      uint64_t v24 = (void (**)(char *, uint64_t))(v9 + 8);
      do
      {
        unint64_t v25 = a3;
        uint64_t v26 = v57;
        v23(v57, a2, v8);
        unint64_t v27 = a4;
        uint64_t v28 = v58;
        v23(v58, v27, v8);
        sub_1A1D8(&qword_314C8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
        char v29 = sub_27078();
        uint64_t v30 = *v24;
        (*v24)(v28, v8);
        v30(v26, v8);
        unint64_t v31 = v62;
        if (v29)
        {
          unint64_t v32 = a2 + v59;
          if (v62 < a2 || v62 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v25;
          }
          else
          {
            a3 = v25;
            if (v62 == a2) {
              unint64_t v31 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        else
        {
          unint64_t v34 = v61 + v59;
          if (v62 < v61 || v62 >= v34)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v25;
          }
          else
          {
            a3 = v25;
            if (v62 != v61) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v61 = v34;
          unint64_t v32 = a2;
        }
        unint64_t v62 = v31 + v59;
        a4 = v61;
        if (v61 >= v55) {
          break;
        }
        a2 = v32;
      }
      while (v32 < a3);
    }
LABEL_66:
    sub_19B20(&v62, &v61, (uint64_t *)&v60, (uint64_t (*)(void))&type metadata accessor for AccountInstitutionKey);
    return 1;
  }
LABEL_70:
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

char *sub_19968(char *result, int64_t a2, char a3, char *a4)
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
    sub_A070(&qword_314B8);
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
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_19A64(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_273C8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

uint64_t sub_19B20(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = sub_273C8();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_19C64(uint64_t a1)
{
  return sub_19968(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_19C78()
{
  unint64_t result = qword_31450;
  if (!qword_31450)
  {
    sub_E550(255, (unint64_t *)&qword_316D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31450);
  }
  return result;
}

uint64_t sub_19CE0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_27388();
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
    uint64_t v10 = sub_27388();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1A9C8();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_A070(&qword_313C8);
          uint64_t v12 = sub_22FF8(v16, i, a3);
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
    sub_E550(0, (unint64_t *)&qword_316D0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

uint64_t sub_19EF4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_19F2C()
{
  return sub_13C74(v0);
}

uint64_t sub_19F38()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_19FEC;
  return sub_123D8();
}

uint64_t sub_19FEC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1A0E4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1A124(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1AA34;
  return sub_15364(a1, v4, v5, v6);
}

uint64_t sub_1A1D8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1A220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A070(&qword_31480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A288(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
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
    *uint64_t v5 = a4;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

uint64_t sub_1A488(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_26B08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  unint64_t v44 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v11, v13);
  uint64_t v43 = (char *)&v34 - v15;
  uint64_t v45 = a4;
  uint64_t v18 = *(void *)(a4 + 64);
  uint64_t v17 = a4 + 64;
  uint64_t v16 = v18;
  uint64_t v39 = v17;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 32);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    uint64_t v33 = v39;
    *a1 = v45;
    a1[1] = v33;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v36 = -1 << *(unsigned char *)(v17 - 32);
  char v37 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v40 = v9 + 32;
  uint64_t v41 = v9 + 16;
  int64_t v38 = (unint64_t)(63 - v19) >> 6;
  int64_t v35 = v38 - 1;
  uint64_t v42 = a3;
  uint64_t v24 = v43;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v25 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v26 = v25 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v30 = v44;
    uint64_t v31 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v44, *(void *)(v45 + 48) + v31 * v26, v8);
    unint64_t v32 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v32(v24, v30, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(a2, v24, v8);
    a3 = v42;
    if (v23 == v42) {
      goto LABEL_37;
    }
    a2 += v31;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v27 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v27 >= v38) {
      goto LABEL_32;
    }
    unint64_t v28 = *(void *)(v39 + 8 * v27);
    if (!v28) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v27 << 6);
    int64_t v22 = v27;
  }
  v22 += 2;
  if (v27 + 1 >= v38)
  {
    unint64_t v21 = 0;
    int64_t v22 = v27;
    goto LABEL_36;
  }
  unint64_t v28 = *(void *)(v39 + 8 * v22);
  if (v28) {
    goto LABEL_14;
  }
  int64_t v29 = v27 + 2;
  if (v27 + 2 >= v38) {
    goto LABEL_32;
  }
  unint64_t v28 = *(void *)(v39 + 8 * v29);
  if (v28) {
    goto LABEL_17;
  }
  int64_t v22 = v27 + 3;
  if (v27 + 3 >= v38)
  {
    unint64_t v21 = 0;
    int64_t v22 = v27 + 2;
    goto LABEL_36;
  }
  unint64_t v28 = *(void *)(v39 + 8 * v22);
  if (v28)
  {
LABEL_14:
    int64_t v27 = v22;
    goto LABEL_18;
  }
  int64_t v29 = v27 + 4;
  if (v27 + 4 >= v38)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v36;
    a1 = v37;
    goto LABEL_38;
  }
  unint64_t v28 = *(void *)(v39 + 8 * v29);
  if (v28)
  {
LABEL_17:
    int64_t v27 = v29;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v27 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v27 >= v38)
    {
      unint64_t v21 = 0;
      int64_t v22 = v35;
      goto LABEL_36;
    }
    unint64_t v28 = *(void *)(v39 + 8 * v27);
    ++v29;
    if (v28) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1A7D0(uint64_t a1)
{
  return sub_21378(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1A7E4(void *a1)
{
  return sub_21654(0, a1[2], 0, a1);
}

uint64_t sub_1A7F8(void *a1)
{
  return sub_21674(0, a1[2], 0, a1);
}

unint64_t sub_1A80C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = sub_27118();
  if (v4) {
    uint64_t result = 15;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_12;
  }

  return sub_27138();
}

uint64_t sub_1A8CC()
{
  return swift_release();
}

uint64_t sub_1A8D4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1A914(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1AA34;
  return sub_13D8C(a1, v4, v5, v6);
}

unint64_t sub_1A9C8()
{
  unint64_t result = qword_314E0;
  if (!qword_314E0)
  {
    sub_DEA4(&qword_313C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_314E0);
  }
  return result;
}

void sub_1AA24(id a1)
{
  if (a1 != (char *)&dword_0 + 1) {
}
  }

uint64_t sub_1AA38(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_27388();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = _swiftEmptyArrayStorage;
  uint64_t result = sub_21358(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_27338();
        sub_E550(0, (unint64_t *)&qword_316D0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21358(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_21358(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_23C08(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_E550(0, (unint64_t *)&qword_316D0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21358(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_21358(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_23C08(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

unint64_t sub_1AC9C(uint64_t a1)
{
  uint64_t v2 = sub_A070(&qword_315F8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unint64_t v6 = (void *)((char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A070(&qword_31600);
  uint64_t v7 = sub_273B8();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  unint64_t v10 = (char *)v6 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_E290(v13, (uint64_t)v6, &qword_315F8);
    uint64_t v15 = *v6;
    unint64_t result = sub_262B4(*v6);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v15;
    uint64_t v19 = v8[7];
    uint64_t v20 = sub_26A58();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, v10, v20);
    uint64_t v21 = v8[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
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

unint64_t sub_1AE94(uint64_t a1)
{
  uint64_t v2 = sub_A070(&qword_315E0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unint64_t v6 = (void *)((char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_A070(&qword_315F0);
  uint64_t v7 = sub_273B8();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = (uint64_t)v6 + *(int *)(v2 + 48);
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_E290(v13, (uint64_t)v6, &qword_315E0);
    uint64_t v15 = *v6;
    unint64_t result = sub_262B4(*v6);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v15;
    uint64_t v19 = v8[7];
    uint64_t v20 = sub_A070(&qword_312F8);
    unint64_t result = sub_E454(v10, v19 + *(void *)(*(void *)(v20 - 8) + 72) * v18, &qword_312F8);
    uint64_t v21 = v8[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
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

uint64_t sub_1B080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_27228();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_27218();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_E658(a1, &qword_31458);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_271E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_27228();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_27218();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_E658(a1, &qword_31458);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_271E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_A070((uint64_t *)&unk_31620);
  return swift_task_create();
}

uint64_t sub_1B3E0(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_A070(&qword_31580);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_A070(&qword_312F8);
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_E658(a1, &qword_31580);
    sub_218DC((uint64_t)a2, (uint64_t)v9);

    return sub_E658((uint64_t)v9, &qword_31580);
  }
  else
  {
    sub_E454(a1, (uint64_t)v13, &qword_312F8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_2253C((uint64_t)v13, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v18;

    return swift_bridgeObjectRelease();
  }
}

void sub_1B650()
{
  uint64_t v1 = v0;
  uint64_t v234 = (void *)sub_26DB8();
  uint64_t v235 = *(v234 - 1);
  uint64_t v3 = __chkstk_darwin(v234, v2);
  uint64_t v5 = (char *)&v202 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v3, v6);
  uint64_t v9 = (char *)&v202 - v8;
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v233 = (char *)&v202 - v12;
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v202 - v14;
  uint64_t v16 = sub_26CA8();
  __chkstk_darwin(v16 - 8, v17);
  BOOL v218 = (char *)&v202 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_27098();
  __chkstk_darwin(v19 - 8, v20);
  uint64_t v217 = (char *)&v202 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_A070(&qword_31580);
  __chkstk_darwin(v22 - 8, v23);
  uint64_t v216 = (char *)&v202 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v230 = sub_26A98();
  uint64_t v229 = *(void *)(v230 - 8);
  uint64_t v26 = __chkstk_darwin(v230, v25);
  v220 = (char *)&v202 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v26, v28);
  uint64_t v226 = (char *)&v202 - v30;
  uint64_t v32 = __chkstk_darwin(v29, v31);
  uint64_t v213 = (char *)&v202 - v33;
  __chkstk_darwin(v32, v34);
  v225 = (char *)&v202 - v35;
  uint64_t v36 = sub_A070(&qword_310D0);
  __chkstk_darwin(v36 - 8, v37);
  uint64_t v227 = (char *)&v202 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v215 = sub_A070(&qword_312F8);
  uint64_t v214 = *(void *)(v215 - 8);
  uint64_t v40 = __chkstk_darwin(v215, v39);
  uint64_t v222 = (uint64_t)&v202 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __chkstk_darwin(v40, v42);
  uint64_t v224 = (char *)&v202 - v44;
  uint64_t v46 = __chkstk_darwin(v43, v45);
  uint64_t v219 = (uint64_t)&v202 - v47;
  uint64_t v49 = __chkstk_darwin(v46, v48);
  uint64_t v223 = (uint64_t)&v202 - v50;
  uint64_t v52 = __chkstk_darwin(v49, v51);
  uint64_t v221 = (char *)&v202 - v53;
  uint64_t v55 = __chkstk_darwin(v52, v54);
  uint64_t v57 = (char *)&v202 - v56;
  __chkstk_darwin(v55, v58);
  unint64_t v60 = (char *)&v202 - v59;
  uint64_t v61 = sub_A070(&qword_315B0);
  uint64_t v63 = __chkstk_darwin(v61 - 8, v62);
  uint64_t v65 = (uint64_t)&v202 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v63, v66);
  uint64_t v68 = (char *)&v202 - v67;
  uint64_t v231 = sub_26C88();
  uint64_t v232 = *(char **)(v231 - 8);
  __chkstk_darwin(v231, v69);
  BOOL v228 = (char *)&v202 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v71 = sub_270B8();
  id v72 = [v1 valueForKey:v71];

  if (v72)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v240 = 0u;
    long long v241 = 0u;
  }
  sub_E454((uint64_t)&v240, (uint64_t)&v242, &qword_31300);
  if (v243)
  {
    sub_A070(&qword_313C8);
    if (swift_dynamicCast())
    {
      sub_1AA38((unint64_t)v237);
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v73 = v1;
  }
  else
  {
    uint64_t v73 = v1;
    sub_E658((uint64_t)&v242, &qword_31300);
  }
  NSString v74 = sub_270B8();
  v212 = v73;
  id v75 = [v73 loadSpecifiersFromPlistName:v74 target:v73];

  if (!v75) {
    goto LABEL_111;
  }
  unint64_t v242 = 0;
  sub_E550(0, (unint64_t *)&qword_316D0);
  sub_27178();

  uint64_t v76 = v242;
  if (!v242) {
    goto LABEL_111;
  }
  uint64_t v209 = v57;
  uint64_t v77 = v15;
  unint64_t v239 = v242;
  if (!(v242 >> 62))
  {
    uint64_t v78 = *(void *)((char *)&dword_10 + (v242 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain_n();
    if (v78) {
      goto LABEL_13;
    }
    goto LABEL_110;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v78 = sub_27388();
  if (!v78)
  {
LABEL_110:
    swift_bridgeObjectRelease_n();
LABEL_111:
    sub_26D88();
    v197 = sub_26DA8();
    os_log_type_t v198 = sub_27238();
    if (os_log_type_enabled(v197, v198))
    {
      v199 = (uint8_t *)swift_slowAlloc();
      unint64_t v242 = swift_slowAlloc();
      *(_DWORD *)v199 = 136315138;
      *(void *)&long long v240 = sub_25C5C(0xD00000000000001ALL, 0x80000000000288D0, (uint64_t *)&v242);
      sub_272A8();
      _os_log_impl(&dword_0, v197, v198, "Unable to load specifiers from: %s", v199, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, void *))(v235 + 8))(v5, v234);
    return;
  }
LABEL_13:
  unint64_t v208 = v76 & 0xC000000000000001;
  uint64_t v205 = v78;
  uint64_t v206 = (uint64_t)v77;
  if ((v76 & 0xC000000000000001) != 0)
  {
    id v210 = (id)sub_27338();
    uint64_t v79 = v212;
  }
  else
  {
    uint64_t v79 = v212;
    if (!*(void *)((char *)&dword_10 + (v76 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
LABEL_116:
      __break(1u);
      goto LABEL_117;
    }
    id v210 = *(id *)(v76 + 32);
  }
  uint64_t v207 = v76 & 0xFFFFFFFFFFFFFF8;
  char v211 = (id *)v76;
  swift_bridgeObjectRelease();
  id v80 = [v79 specifier];
  if (!v80)
  {
LABEL_124:
    __break(1u);
    goto LABEL_125;
  }
  char v81 = v80;
  NSString v82 = sub_270B8();
  id v83 = [v81 propertyForKey:v82];

  if (v83)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v240 = 0u;
    long long v241 = 0u;
  }
  sub_E454((uint64_t)&v240, (uint64_t)&v242, &qword_31300);
  if (!v243)
  {
    sub_E658((uint64_t)&v242, &qword_31300);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_26:
    sub_26D88();
    uint64_t v90 = sub_26DA8();
    os_log_type_t v91 = sub_27238();
    BOOL v92 = os_log_type_enabled(v90, v91);
    uint64_t v93 = v210;
    uint64_t v94 = v211;
    if (v92)
    {
      unint64_t v95 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v95 = 0;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v90, v91, "Expected bundleID property of specifier", v95, 2u);
      swift_slowDealloc();

      (*(void (**)(char *, void *))(v235 + 8))(v9, v234);
    }
    else
    {

      (*(void (**)(char *, void *))(v235 + 8))(v9, v234);
      swift_bridgeObjectRelease();
    }
    sub_A070(&qword_31310);
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_27CB0;
    *(void *)(v96 + 56) = sub_A070(&qword_313C8);
    *(void *)(v96 + 32) = v94;
    goto LABEL_42;
  }
  uint64_t v84 = v238;
  unint64_t v85 = &v79[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier];
  unint64_t v203 = v237;
  *(void *)unint64_t v85 = v237;
  *((void *)v85 + 1) = v84;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v86 = [v79 specifier];
  if (!v86)
  {
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  uint64_t v87 = v86;
  NSString v88 = sub_270B8();
  id v89 = [v87 propertyForKey:v88];

  uint64_t v204 = v84;
  if (v89)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v240 = 0u;
    long long v241 = 0u;
  }
  sub_E454((uint64_t)&v240, (uint64_t)&v242, &qword_31300);
  unint64_t v97 = v212;
  if (!v243)
  {
    swift_bridgeObjectRelease();
    sub_E658((uint64_t)&v242, &qword_31300);
LABEL_38:
    uint64_t v102 = v211;
    uint64_t v103 = v233;
    sub_26D88();
    char v104 = sub_26DA8();
    os_log_type_t v105 = sub_27238();
    BOOL v106 = os_log_type_enabled(v104, v105);
    uint64_t v93 = v210;
    if (v106)
    {
      unint64_t v107 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v107 = 0;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v104, v105, "Expected account name property of specifier", v107, 2u);
      swift_slowDealloc();

      (*(void (**)(char *, void *))(v235 + 8))(v103, v234);
    }
    else
    {

      (*(void (**)(char *, void *))(v235 + 8))(v103, v234);
      swift_bridgeObjectRelease();
    }
    sub_A070(&qword_31310);
    uint64_t v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_27CB0;
    *(void *)(v108 + 56) = sub_A070(&qword_313C8);
    *(void *)(v108 + 32) = v102;
LABEL_42:

    return;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  uint64_t v233 = v237;
  id v98 = [v97 specifier];
  if (!v98)
  {
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  unint64_t v99 = v98;
  NSString v100 = sub_270B8();
  id v101 = [v99 propertyForKey:v100];

  if (v101)
  {
    sub_272C8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v240 = 0u;
    long long v241 = 0u;
  }
  uint64_t v109 = v231;
  BOOL v110 = v232;
  sub_E454((uint64_t)&v240, (uint64_t)&v242, &qword_31300);
  if (v243)
  {
    int v111 = swift_dynamicCast();
    uint64_t v112 = (void (*)(char *, void, uint64_t, uint64_t))*((void *)v110 + 7);
    v112(v68, v111 ^ 1u, 1, v109);
    if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v110 + 6))(v68, 1, v109) != 1)
    {
      uint64_t v113 = v228;
      (*((void (**)(char *, char *, uint64_t))v110 + 4))(v228, v68, v109);
      (*((void (**)(uint64_t, char *, uint64_t))v110 + 2))(v65, v113, v109);
      v112((char *)v65, 0, 1, v109);
      uint64_t v114 = v212;
      uint64_t v115 = (uint64_t)&v212[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID];
      swift_beginAccess();
      sub_23BA4(v65, v115, &qword_315B0);
      swift_endAccess();
      NSString v116 = sub_270B8();
      swift_bridgeObjectRelease();
      [v114 setTitle:v116];

      uint64_t v65 = (uint64_t)&v114[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate];
      swift_beginAccess();
      sub_E290(v65, (uint64_t)v60, &qword_312F8);
      uint64_t v76 = v229;
      uint64_t v79 = *(char **)(v229 + 48);
      uint64_t v68 = (char *)v230;
      uint64_t v233 = (char *)(v229 + 48);
      LODWORD(v113) = ((uint64_t (*)(char *, uint64_t, uint64_t))v79)(v60, 1, v230);
      sub_E658((uint64_t)v60, &qword_312F8);
      uint64_t v117 = (uint64_t)v209;
      if (v113 == 1)
      {
        sub_1D688((uint64_t)v209);
        swift_beginAccess();
        sub_23BA4(v117, v65, &qword_312F8);
        swift_endAccess();
        uint64_t v118 = v221;
        sub_E290(v65, (uint64_t)v221, &qword_312F8);
        int v119 = ((uint64_t (*)(char *, uint64_t, char *))v79)(v118, 1, v68);
        sub_E658((uint64_t)v118, &qword_312F8);
        if (v119 != 1)
        {
          sub_E290(v65, v117, &qword_312F8);
          uint64_t v120 = (uint64_t)&v114[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
          swift_beginAccess();
          sub_23BA4(v117, v120, &qword_312F8);
          swift_endAccess();
        }
      }
      sub_A070(&qword_315D8);
      unint64_t v60 = (char *)sub_A070(&qword_315E0);
      uint64_t v121 = *(void *)(*((void *)v60 - 1) + 72);
      unint64_t v122 = (*(unsigned __int8 *)(*((void *)v60 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v60 - 1) + 80);
      uint64_t v123 = swift_allocObject();
      *(_OWORD *)(v123 + 16) = xmmword_28050;
      uint64_t v221 = v79;
      uint64_t v206 = v65;
      if (v208)
      {
        uint64_t v124 = v76;
        id v125 = (id)sub_27338();
      }
      else
      {
        if (*(void *)(v207 + 16) < 2uLL)
        {
LABEL_117:
          __break(1u);
          goto LABEL_118;
        }
        uint64_t v124 = v76;
        id v125 = v211[5];
      }
      uint64_t v79 = (char *)(v123 + v122);
      unint64_t v133 = v123 + v122 + *((int *)v60 + 12);
      *(void *)(v123 + v122) = v125;
      uint64_t v134 = sub_26C68();
      uint64_t v68 = *(char **)(*(void *)(v134 - 8) + 56);
      uint64_t v76 = (uint64_t)v227;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v68)(v227, 1, 1, v134);
      sub_26A78();
      unint64_t v135 = *(void **)(v124 + 56);
      uint64_t v235 = v124 + 56;
      uint64_t v234 = v135;
      ((void (*)(unint64_t, void, uint64_t, uint64_t))v135)(v133, 0, 1, v230);
      if (v208)
      {
        id v136 = (id)sub_27338();
        uint64_t v65 = v206;
      }
      else
      {
        uint64_t v65 = v206;
        if (*(void *)(v207 + 16) < 3uLL)
        {
LABEL_118:
          __break(1u);
          goto LABEL_119;
        }
        id v136 = v211[6];
      }
      Swift::Int v137 = &v79[v121 + *((int *)v60 + 12)];
      *(void *)&v79[v121] = v136;
      uint64_t v138 = v227;
      sub_26C38();
      ((void (*)(char *, void, uint64_t, uint64_t))v68)(v138, 0, 1, v134);
      sub_26A78();
      uint64_t v139 = v230;
      ((void (*)(char *, void, uint64_t, uint64_t))v234)(v137, 0, 1, v230);
      if (v208)
      {
        id v140 = (id)sub_27338();
        uint64_t v68 = v225;
        uint64_t v76 = (uint64_t)v221;
      }
      else
      {
        uint64_t v68 = v225;
        uint64_t v76 = (uint64_t)v221;
        if (*(void *)(v207 + 16) < 4uLL)
        {
LABEL_119:
          __break(1u);
          goto LABEL_120;
        }
        id v140 = v211[7];
      }
      Swift::Int v141 = &v79[2 * v121];
      unint64_t v142 = &v141[*((int *)v60 + 12)];
      *(void *)Swift::Int v141 = v140;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v234)(v142, 1, 1, v139);
      unint64_t v143 = sub_1AE94(v123);
      uint64_t v79 = v212;
      uint64_t v144 = (unint64_t *)&v212[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_specifierForAccountStartDate];
      swift_beginAccess();
      *uint64_t v144 = v143;
      swift_bridgeObjectRelease();
      uint64_t v145 = v223;
      sub_E290(v65, v223, &qword_312F8);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v76)(v145, 1, v139) == 1)
      {
        uint64_t v146 = v145;
      }
      else
      {
        uint64_t v147 = v229;
        uint64_t v148 = *(void (**)(char *, uint64_t, uint64_t))(v229 + 32);
        v148(v68, v145, v139);
        if (sub_26A88())
        {
          (*(void (**)(char *, uint64_t))(v147 + 8))(v68, v139);
LABEL_73:
          uint64_t v65 = 0;
          goto LABEL_74;
        }
        Swift::Int v149 = &v79[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
        swift_beginAccess();
        uint64_t v150 = (uint64_t)v149;
        uint64_t v151 = v219;
        sub_E290(v150, v219, &qword_312F8);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v76)(v151, 1, v139) != 1)
        {
          v160 = v213;
          v148(v213, v151, v139);
          int v161 = sub_26A88();
          unint64_t v162 = *(void (**)(char *, uint64_t))(v229 + 8);
          v162(v160, v139);
          v162(v68, v139);
          uint64_t v65 = v161 ^ 1u;
LABEL_74:
          unint64_t v60 = v224;
          uint64_t v152 = (uint64_t)&v79[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
          swift_beginAccess();
          sub_E290(v152, (uint64_t)v60, &qword_312F8);
          int v153 = ((uint64_t (*)(char *, uint64_t, uint64_t))v76)(v60, 1, v139);
          uint64_t v76 = (uint64_t)v210;
          LODWORD(v233) = v65;
          if (v153 == 1)
          {
            sub_E658((uint64_t)v60, &qword_312F8);
            unint64_t v154 = v205 - 1;
            if (!__OFSUB__(v205, 1))
            {
              unint64_t v60 = v232;
              if (v208)
              {
                uint64_t v155 = (char *)sub_27338();
              }
              else
              {
                if ((v154 & 0x8000000000000000) != 0)
                {
LABEL_122:
                  __break(1u);
                  goto LABEL_123;
                }
                if (v154 >= *(void *)(v207 + 16))
                {
LABEL_123:
                  __break(1u);
                  goto LABEL_124;
                }
                uint64_t v155 = (char *)v211[v154 + 4];
              }
              uint64_t v68 = v155;
              swift_bridgeObjectRelease();
              char v159 = 0;
LABEL_97:
              [(id)v76 setProperty:v68 forKey:PSRadioGroupCheckedSpecifierKey];
              uint64_t v166 = self;
              NSString v167 = sub_270B8();
              id v168 = [v166 preferenceSpecifierNamed:v167 target:v79 set:"emptySetter:" get:0 detail:0 cell:-1 edit:0];

              if (!v168)
              {
LABEL_127:

                __break(1u);
                return;
              }
              uint64_t v169 = OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier;
              unint64_t v170 = *(void **)&v79[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier];
              *(void *)&v79[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier] = v168;

              unint64_t v171 = *(void **)&v79[v169];
              if (!v171)
              {
LABEL_106:
                id v183 = objc_allocWithZone((Class)LSApplicationRecord);
                id v184 = sub_210A8((uint64_t)v203, v204, 0);
                uint64_t v185 = v184;
                if (v184)
                {
                  id v186 = [v184 localizedName];
                  uint64_t v187 = sub_270C8();
                  uint64_t v189 = v188;

                  sub_270A8();
                  type metadata accessor for WalletPrivacySettingsController();
                  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
                  id v191 = [self bundleForClass:ObjCClassFromMetadata];
                  sub_26C98();
                  sub_270E8();
                  sub_A070(&qword_31348);
                  uint64_t v192 = swift_allocObject();
                  *(_OWORD *)(v192 + 16) = xmmword_27CB0;
                  *(void *)(v192 + 56) = &type metadata for String;
                  *(void *)(v192 + 64) = sub_E718();
                  *(void *)(v192 + 32) = v187;
                  *(void *)(v192 + 40) = v189;
                  sub_270D8();
                  uint64_t v76 = (uint64_t)v210;
                  swift_bridgeObjectRelease();
                  NSString v193 = sub_270B8();
                  swift_bridgeObjectRelease();
                  [(id)v76 setProperty:v193 forKey:PSFooterTextGroupKey];
                }
                unint64_t v194 = v239;
                unint64_t v195 = swift_bridgeObjectRetain();
                sub_1AA38(v195);
                swift_bridgeObjectRelease();
                Class isa = sub_27168().super.isa;
                swift_bridgeObjectRelease();
                [v79 setSpecifiers:isa];

                sub_1AA38(v194);
                swift_bridgeObjectRelease();
                (*((void (**)(char *, uint64_t))v60 + 1))(v228, v231);
                return;
              }
              uint64_t v172 = v68;
              uint64_t started = type metadata accessor for StartSharingTimeSelectionCell();
              uint64_t v65 = v171;
              sub_A070(&qword_315E8);
              [(id)v65 setProperty:sub_27428() forKey:PSCellClassKey];
              swift_unknownObjectRelease();
              [(id)v65 setButtonAction:"menuUpdated"];
              uint64_t v173 = v222;
              sub_E290(v152, v222, &qword_312F8);
              uint64_t v174 = v230;
              uint64_t v175 = 0;
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v221)(v173, 1, v230) != 1)
              {
                uint64_t v176 = v229;
                (*(void (**)(char *, uint64_t, uint64_t))(v229 + 16))(v220, v173, v174);
                uint64_t v175 = sub_27428();
                uint64_t v76 = (uint64_t)v210;
                (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v173, v174);
              }
              NSString v177 = sub_270B8();
              [(id)v65 setProperty:v175 forKey:v177];
              swift_unknownObjectRelease();

              Class v178 = sub_271D8().super.super.isa;
              NSString v179 = sub_270B8();
              [(id)v65 setProperty:v178 forKey:v179];

              NSString v180 = sub_270B8();
              [(id)v65 setProperty:v79 forKey:v180];

              uint64_t v68 = v172;
              if ((v159 & 1) == 0)
              {
LABEL_105:

                goto LABEL_106;
              }
              if (!(v239 >> 62))
              {
                uint64_t v181 = *(void *)((char *)&dword_10 + (v239 & 0xFFFFFFFFFFFFFF8));
                id v182 = (id)v65;
                if (v181 >= 3)
                {
LABEL_104:
                  sub_22CFC(3, 3, v65);
                  goto LABEL_105;
                }
                goto LABEL_121;
              }
LABEL_120:
              id v200 = (id)v65;
              swift_bridgeObjectRetain();
              uint64_t v201 = sub_27388();
              swift_bridgeObjectRelease();
              if (v201 >= 3) {
                goto LABEL_104;
              }
LABEL_121:
              __break(1u);
              goto LABEL_122;
            }
            goto LABEL_116;
          }
          (*(void (**)(char *, char *, uint64_t))(v229 + 32))(v226, v60, v139);
          char v156 = sub_26A88();
          if (v156)
          {
            if (v208) {
              Swift::Int v157 = (char *)sub_27338();
            }
            else {
              Swift::Int v157 = (char *)v211[5];
            }
            uint64_t v68 = v157;
            swift_bridgeObjectRelease();
            unint64_t v60 = v232;
            goto LABEL_96;
          }
          if (v208)
          {
            uint64_t v227 = (char *)sub_27338();
            swift_beginAccess();
            if (*v144)
            {
              id v158 = (id)sub_27338();
LABEL_93:
              uint64_t v164 = v158;
              swift_bridgeObjectRelease();
              uint64_t v165 = (uint64_t)v216;
              (*(void (**)(char *, char *, uint64_t))(v229 + 16))(v216, v226, v139);
              ((void (*)(uint64_t, void, uint64_t, uint64_t))v234)(v165, 0, 1, v139);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v214 + 56))(v165, 0, 1, v215);
              sub_1B3E0(v165, v164);
              swift_endAccess();
LABEL_95:
              unint64_t v60 = v232;
              uint64_t v76 = (uint64_t)v210;
              uint64_t v68 = v227;
LABEL_96:
              char v159 = v156 ^ 1;
              (*(void (**)(char *, uint64_t))(v229 + 8))(v226, v139);
              goto LABEL_97;
            }
          }
          else
          {
            unint64_t v163 = v211;
            uint64_t v227 = (char *)v211[6];
            swift_beginAccess();
            if (*v144)
            {
              id v158 = v163[6];
              goto LABEL_93;
            }
          }
          swift_endAccess();
          swift_bridgeObjectRelease();
          goto LABEL_95;
        }
        (*(void (**)(char *, uint64_t))(v229 + 8))(v68, v139);
        uint64_t v146 = v151;
      }
      sub_E658(v146, &qword_312F8);
      goto LABEL_73;
    }
  }
  else
  {
    sub_E658((uint64_t)&v242, &qword_31300);
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v110 + 7))(v68, 1, 1, v109);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_E658((uint64_t)v68, &qword_315B0);
  uint64_t v126 = v206;
  sub_26D88();
  unint64_t v127 = sub_26DA8();
  os_log_type_t v128 = sub_27238();
  if (os_log_type_enabled(v127, v128))
  {
    unint64_t v129 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v129 = 0;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v127, v128, "Expected account id property of specifier", v129, 2u);
    swift_slowDealloc();

    (*(void (**)(uint64_t, void *))(v235 + 8))(v126, v234);
  }
  else
  {

    (*(void (**)(uint64_t, void *))(v235 + 8))(v126, v234);
    swift_bridgeObjectRelease();
  }
  unint64_t v130 = v210;
  uint64_t v131 = v211;
  sub_A070(&qword_31310);
  uint64_t v132 = swift_allocObject();
  *(_OWORD *)(v132 + 16) = xmmword_27CB0;
  *(void *)(v132 + 56) = sub_A070(&qword_313C8);
  *(void *)(v132 + 32) = v131;
}

uint64_t sub_1D688@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_26DB8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_A070(&qword_312F8);
  uint64_t result = __chkstk_darwin(v8 - 8, v9);
  uint64_t v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_storeCoordinator))
  {
    if (*(void *)(v1
                   + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier
                   + 8))
    {
      swift_retain();
      swift_bridgeObjectRetain();
      sub_26B98();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v17 = sub_26A98();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v17) == 1)
      {
        sub_E658((uint64_t)v12, &qword_312F8);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a1, 1, 1, v17);
      }
      else
      {
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v18 + 32))(a1, v12, v17);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_26D88();
    uint64_t v13 = sub_26DA8();
    os_log_type_t v14 = sub_27238();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "Expected store coordinator", v15, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);
    uint64_t v16 = sub_26A98();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a1, 1, 1, v16);
  }
  return result;
}

uint64_t sub_1DA14()
{
  uint64_t v1 = sub_26DB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = __chkstk_darwin(v1, v3);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  uint64_t v9 = (char *)&v38 - v8;
  uint64_t v10 = sub_A070(&qword_312F8);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  os_log_type_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v15);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v18 = sub_26A98();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void **)(v0 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier);
  if (v23)
  {
    uint64_t v38 = v2;
    uint64_t v39 = v1;
    id v24 = v23;
    NSString v25 = sub_270B8();
    id v26 = [v24 propertyForKey:v25];

    if (v26)
    {
      sub_272C8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v40, 0, sizeof(v40));
    }
    sub_E454((uint64_t)v40, (uint64_t)v41, &qword_31300);
    if (v42)
    {
      int v31 = swift_dynamicCast();
      uint64_t v32 = *(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56);
      v32(v17, v31 ^ 1u, 1, v18);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) != 1)
      {

        uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
        v33(v22, v17, v18);
        v33(v14, v22, v18);
        v32(v14, 0, 1, v18);
        uint64_t v34 = v0 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate;
        swift_beginAccess();
        sub_23BA4((uint64_t)v14, v34, &qword_312F8);
        return swift_endAccess();
      }
    }
    else
    {
      sub_E658((uint64_t)v41, &qword_31300);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
    }
    sub_E658((uint64_t)v17, &qword_312F8);
    sub_26D88();
    uint64_t v35 = sub_26DA8();
    os_log_type_t v36 = sub_27238();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "Expected account Date property of specifier", v37, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v9, v39);
  }
  else
  {
    sub_26D88();
    uint64_t v27 = sub_26DA8();
    os_log_type_t v28 = sub_27238();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "Expected timeDateSpecifier to exists", v29, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
}

uint64_t sub_1DF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a4;
  sub_A070(&qword_315B0);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  uint64_t v5 = sub_26C88();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = sub_26A98();
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  sub_A070(&qword_310D0);
  v4[24] = swift_task_alloc();
  sub_A070(&qword_312F8);
  v4[25] = swift_task_alloc();
  uint64_t v7 = sub_26DB8();
  v4[26] = v7;
  v4[27] = *(void *)(v7 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  sub_27208();
  v4[30] = sub_271F8();
  uint64_t v9 = sub_271E8();
  v4[31] = v9;
  v4[32] = v8;
  return _swift_task_switch(sub_1E180, v9, v8);
}

void sub_1E180()
{
  uint64_t v58 = v0;
  uint64_t v2 = (id *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_storeCoordinator);
  *(void *)(v0 + 264) = v3;
  if (v3)
  {
    uint64_t v4 = *(void *)(v0 + 200);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = *(void *)(v0 + 176);
    uint64_t v7 = v1 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate;
    swift_beginAccess();
    sub_E290(v7, v4, &qword_312F8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    int v9 = v8(v4, 1, v5);
    *(_DWORD *)(v0 + 284) = v9;
    swift_retain();
    sub_E658(v4, &qword_312F8);
    int v10 = v8(v7, 1, v5);
    uint64_t v11 = *(void *)(v0 + 192);
    if (v10)
    {
      uint64_t v12 = sub_26C68();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
    }
    else
    {
      uint64_t v21 = *(void *)(v0 + 176);
      uint64_t v20 = *(void *)(v0 + 184);
      uint64_t v22 = *(void *)(v0 + 168);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v7, v22);
      sub_26A68();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    }
    uint64_t v23 = *(void **)(v0 + 120);
    sub_26D88();
    id v24 = v23;
    NSString v25 = sub_26DA8();
    os_log_type_t v26 = sub_27238();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v52 = v26;
      log = v25;
      int v54 = v9;
      uint64_t v27 = *(void *)(v0 + 144);
      uint64_t v28 = *(void *)(v0 + 152);
      uint64_t v29 = *(void *)(v0 + 136);
      uint64_t v30 = *(void *)(v0 + 120);
      uint64_t v31 = swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 141559043;
      *(void *)(v0 + 88) = 1752392040;
      sub_272A8();
      *(_WORD *)(v31 + 12) = 2081;
      uint64_t v32 = v30 + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID;
      swift_beginAccess();
      sub_E290(v32, v29, &qword_315B0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v29, 1, v27) == 1)
      {
        id v51 = *v2;

        __break(1u);
      }
      else
      {
        uint64_t v34 = *(void *)(v0 + 152);
        uint64_t v33 = *(void *)(v0 + 160);
        uint64_t v35 = *(void *)(v0 + 144);
        os_log_type_t v36 = *(char **)(v0 + 120);
        (*(void (**)(uint64_t, void, uint64_t))(v34 + 32))(v33, *(void *)(v0 + 136), v35);
        sub_23B00(&qword_315C0, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v37 = sub_273F8();
        unint64_t v39 = v38;
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
        *(void *)(v0 + 96) = sub_25C5C(v37, v39, &v57);
        sub_272A8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 22) = 2160;
        *(void *)(v0 + 104) = 1752392040;
        sub_272A8();
        *(_WORD *)(v31 + 32) = 2081;
        uint64_t v40 = (uint64_t *)&v36[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier];
        unint64_t v41 = *(void *)&v36[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier
                            + 8];
        if (v41)
        {
          BOOL v42 = v54 != 1;
          uint64_t v43 = *(void *)(v0 + 216);
          uint64_t v55 = *(void *)(v0 + 208);
          uint64_t v56 = *(void *)(v0 + 224);
          uint64_t v44 = *(void **)(v0 + 120);
          uint64_t v45 = *v40;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 112) = sub_25C5C(v45, v41, &v57);
          sub_272A8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v31 + 42) = 1024;
          *(_DWORD *)(v0 + 280) = v42;
          sub_272A8();
          _os_log_impl(&dword_0, log, v52, "Update account %{private,mask.hash}s\nfor %{private,mask.hash}s: %{BOOL}d", (uint8_t *)v31, 0x30u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v56, v55);
LABEL_15:
          uint64_t v50 = (void *)swift_task_alloc();
          *(void *)(v0 + 272) = v50;
          *uint64_t v50 = v0;
          v50[1] = sub_1E828;
          sub_1EB88();
          return;
        }
      }

      __break(1u);
      return;
    }
    uint64_t v47 = *(void *)(v0 + 216);
    uint64_t v46 = *(void *)(v0 + 224);
    uint64_t v48 = *(void *)(v0 + 208);
    uint64_t v49 = *(void **)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
    goto LABEL_15;
  }
  swift_release();
  sub_26D88();
  uint64_t v13 = sub_26DA8();
  os_log_type_t v14 = sub_27238();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "Expected store coordinator", v15, 2u);
    swift_slowDealloc();
  }
  uint64_t v16 = *(void *)(v0 + 232);
  uint64_t v17 = *(void *)(v0 + 208);
  uint64_t v18 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(void (**)(void))(v0 + 8);
  v19();
}

uint64_t sub_1E828(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 288) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 256);
  uint64_t v4 = *(void *)(v2 + 248);
  return _swift_task_switch(sub_1E950, v4, v3);
}

uint64_t sub_1E950()
{
  int v1 = *(unsigned __int8 *)(v0 + 288);
  swift_release();
  if (v1 != 1)
  {
    sub_E658(*(void *)(v0 + 192), &qword_310D0);
    swift_release();
    goto LABEL_6;
  }
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 120) + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID;
  swift_beginAccess();
  sub_E290(v5, v4, &qword_315B0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v7 = *(char **)(v0 + 120);
  if (!*(void *)&v7[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier
                     + 8])
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v8 = *(void *)(v0 + 192);
  uint64_t v9 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 144);
  uint64_t v10 = *(void *)(v0 + 128);
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v11 = v7;
  swift_bridgeObjectRetain();
  sub_26B78();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_E658(v8, &qword_310D0);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v13);
LABEL_6:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_1EB88()
{
  v1[2] = v0;
  sub_27208();
  v1[3] = sub_271F8();
  uint64_t v3 = sub_271E8();
  v1[4] = v3;
  v1[5] = v2;
  return _swift_task_switch(sub_1EC20, v3, v2);
}

uint64_t sub_1EC20()
{
  id v1 = [*(id *)(v0 + 16) navigationController];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 viewControllers];

    sub_E550(0, &qword_31330);
    unint64_t v4 = sub_27188();

    if (v4 >> 62)
    {
LABEL_26:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_27388();
      swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8));
      if (v5)
      {
LABEL_4:
        unint64_t v6 = 0;
        uint64_t v22 = v5;
        do
        {
          if ((v4 & 0xC000000000000001) != 0)
          {
            id v7 = (id)sub_27338();
          }
          else
          {
            if (v6 >= *(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)))
            {
              __break(1u);
              return AppProtectionCoordinator.requestAccess()();
            }
            id v7 = *(id *)(v4 + 32 + 8 * v6);
          }
          uint64_t v8 = v7;
          if (__OFADD__(v6++, 1)) {
            goto LABEL_25;
          }
          id v10 = [v7 childViewControllers];
          unint64_t v11 = sub_27188();

          if (v11 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v12 = sub_27388();
            swift_bridgeObjectRelease();
            if (v12)
            {
LABEL_13:
              uint64_t v13 = 0;
              while (1)
              {
                id v14 = (v11 & 0xC000000000000001) != 0 ? (id)sub_27338() : *(id *)(v11 + 8 * v13 + 32);
                uint64_t v15 = v14;
                uint64_t v16 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  break;
                }
                type metadata accessor for WalletPrivacySettingsController();
                if (swift_dynamicCastClass())
                {

                  swift_bridgeObjectRelease_n();
                  swift_bridgeObjectRelease();
                  goto LABEL_32;
                }

                ++v13;
                if (v16 == v12) {
                  goto LABEL_5;
                }
              }
              __break(1u);
LABEL_25:
              __break(1u);
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain();
            if (v12) {
              goto LABEL_13;
            }
          }
LABEL_5:
          swift_bridgeObjectRelease_n();
        }
        while (v6 != v22);
      }
    }
    swift_bridgeObjectRelease();
  }
  sub_26D78();
  uint64_t v17 = (void *)sub_26D68();
  BOOL v18 = sub_26D58();

  if (v18)
  {
    *(void *)(v0 + 48) = sub_26D68();
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v19;
    void *v19 = v0;
    v19[1] = sub_1EF90;
    return AppProtectionCoordinator.requestAccess()();
  }
  else
  {
LABEL_32:
    swift_release();
    uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v20(1);
  }
}

uint64_t sub_1EF90(char a1)
{
  uint64_t v2 = *v1;
  id v3 = *(void **)(*v1 + 48);
  *(unsigned char *)(*v1 + 64) = a1;
  swift_task_dealloc();

  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = *(void *)(v2 + 32);
  return _swift_task_switch(sub_1F0D8, v5, v4);
}

uint64_t sub_1F0D8()
{
  swift_release();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 64);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_1F13C(void *a1)
{
  uint64_t v2 = sub_27018();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_27038();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  unint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E550(0, (unint64_t *)&unk_316A0);
  uint64_t v12 = (void *)sub_27258();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  aBlock[4] = sub_23AE0;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1F4E8;
  aBlock[3] = &unk_2D178;
  id v14 = _Block_copy(aBlock);
  id v15 = a1;
  sub_27028();
  v17[1] = _swiftEmptyArrayStorage;
  sub_23B00(&qword_315C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_A070((uint64_t *)&unk_316B0);
  sub_23B48();
  sub_272D8();
  sub_27268();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return swift_release();
}

id sub_1F3F4(void *a1)
{
  id result = [a1 specifier];
  if (result)
  {
    uint64_t v3 = result;
    Class isa = sub_271D8().super.super.isa;
    NSString v5 = sub_270B8();
    [v3 setProperty:isa forKey:v5];

    id v6 = [a1 navigationController];
    return [a1 reloadSpecifiers];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1F4E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1F668(void *a1)
{
  id v160 = a1;
  uint64_t v2 = sub_26DB8();
  unint64_t v163 = *(uint64_t (***)(char *, id))(v2 - 8);
  id v164 = (id)v2;
  uint64_t v4 = __chkstk_darwin(v2, v3);
  id v6 = (char *)&v141 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v4, v7);
  uint64_t v10 = (char *)&v141 - v9;
  __chkstk_darwin(v8, v11);
  Swift::Int v157 = (char *)&v141 - v12;
  uint64_t v148 = sub_A070(&qword_31578);
  __chkstk_darwin(v148, v13);
  uint64_t v149 = (uint64_t)&v141 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_26C68();
  uint64_t v150 = *(void *)(v151 - 8);
  __chkstk_darwin(v151, v15);
  char v156 = (char *)&v141 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_A070(&qword_31358);
  __chkstk_darwin(v17 - 8, v18);
  uint64_t v155 = (char *)&v141 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_A070(&qword_31360);
  __chkstk_darwin(v20 - 8, v21);
  int v153 = (char *)&v141 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_26C18();
  __chkstk_darwin(v23 - 8, v24);
  unint64_t v154 = (char *)&v141 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_A070(&qword_310D0);
  uint64_t v28 = __chkstk_darwin(v26 - 8, v27);
  uint64_t v144 = (char *)&v141 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28, v30);
  uint64_t v147 = (char *)&v141 - v31;
  uint64_t v32 = sub_26A98();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v161 = v32;
  uint64_t v162 = v33;
  uint64_t v35 = __chkstk_darwin(v32, v34);
  Swift::Int v141 = (char *)&v141 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __chkstk_darwin(v35, v37);
  unint64_t v143 = (char *)&v141 - v39;
  __chkstk_darwin(v38, v40);
  uint64_t v146 = (char *)&v141 - v41;
  uint64_t v42 = sub_A070(&qword_31580);
  __chkstk_darwin(v42 - 8, v43);
  uint64_t v45 = (char *)&v141 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_A070(&qword_312F8);
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v49 = __chkstk_darwin(v46, v48);
  uint64_t v142 = (uint64_t)&v141 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __chkstk_darwin(v49, v51);
  uint64_t v145 = (uint64_t)&v141 - v53;
  uint64_t v55 = __chkstk_darwin(v52, v54);
  uint64_t v57 = (char *)&v141 - v56;
  uint64_t v59 = __chkstk_darwin(v55, v58);
  uint64_t v152 = (uint64_t)&v141 - v60;
  uint64_t v62 = __chkstk_darwin(v59, v61);
  id v158 = (char *)&v141 - v63;
  uint64_t v65 = __chkstk_darwin(v62, v64);
  uint64_t v159 = (uint64_t)&v141 - v66;
  uint64_t v68 = __chkstk_darwin(v65, v67);
  uint64_t v70 = (char *)&v141 - v69;
  __chkstk_darwin(v68, v71);
  uint64_t v73 = (char *)&v141 - v72;
  NSString v74 = v1;
  id v75 = (uint64_t *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_specifierForAccountStartDate];
  swift_beginAccess();
  uint64_t v76 = *v75;
  if (!v76)
  {
    sub_26D88();
    char v81 = sub_26DA8();
    uint64_t v82 = sub_27238();
    if (os_log_type_enabled(v81, (os_log_type_t)v82))
    {
      id v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v83 = 0;
      uint64_t v84 = "specifierForAccountStartDate should exists";
LABEL_7:
      _os_log_impl(&dword_0, v81, (os_log_type_t)v82, v84, v83, 2u);
      swift_slowDealloc();
    }
LABEL_8:

    return v163[1](v6, v164);
  }
  if (*(void *)(v76 + 16))
  {
    swift_bridgeObjectRetain();
    id v77 = v160;
    unint64_t v78 = sub_262B4((uint64_t)v77);
    if (v79)
    {
      sub_E290(*(void *)(v76 + 56) + *(void *)(v47 + 72) * v78, (uint64_t)v45, &qword_312F8);
      uint64_t v80 = 0;
    }
    else
    {
      uint64_t v80 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v45, v80, 1, v46);

    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v45, 1, v46) == 1) {
      goto LABEL_12;
    }
    sub_E454((uint64_t)v45, (uint64_t)v70, &qword_312F8);
    uint64_t v86 = v161;
    uint64_t v87 = v162;
    os_log_type_t v91 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v162 + 48);
    if (v91(v70, 1, v161) == 1)
    {
      sub_E658((uint64_t)v70, &qword_312F8);
      goto LABEL_13;
    }
    BOOL v92 = *(uint64_t (***)(char *, id))(v87 + 32);
    ((void (*)(char *, char *, uint64_t))v92)(v73, v70, v86);
    id v160 = *(id *)(v87 + 56);
    ((void (*)(char *, void, uint64_t, uint64_t))v160)(v73, 0, 1, v86);
    sub_E658((uint64_t)v73, &qword_312F8);
    uint64_t v93 = *(void **)&v74[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier];
    if (v93)
    {
      uint64_t v94 = v74;
      unint64_t v163 = v92;
      id v95 = v93;
      NSString v96 = sub_270B8();
      id v97 = [v95 propertyForKey:v96];

      if (v97)
      {
        sub_272C8();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v165, 0, sizeof(v165));
      }
      uint64_t v98 = v159;
      sub_E454((uint64_t)v165, (uint64_t)v166, &qword_31300);
      uint64_t v99 = v161;
      if (v167)
      {
        uint64_t v100 = swift_dynamicCast() ^ 1;
        uint64_t v101 = v98;
      }
      else
      {
        sub_E658((uint64_t)v166, &qword_31300);
        uint64_t v101 = v98;
        uint64_t v100 = 1;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v160)(v101, v100, 1, v99);
      if (v91((char *)v98, 1, v99) == 1)
      {
        uint64_t v102 = &v94[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate];
        swift_beginAccess();
        uint64_t v103 = (uint64_t)v102;
        uint64_t v104 = v152;
        sub_E290(v103, v152, &qword_312F8);
        if (v91((char *)v104, 1, v99) == 1)
        {
          sub_E658(v104, &qword_312F8);
          uint64_t v105 = (uint64_t)v158;
        }
        else
        {
          id v164 = v95;
          uint64_t v112 = v146;
          uint64_t v113 = v163;
          ((void (*)(char *, uint64_t, uint64_t))v163)(v146, v104, v99);
          uint64_t v114 = (uint64_t)v147;
          uint64_t v115 = v99;
          sub_26A68();
          int v116 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v114, 1, v151);
          sub_E658(v114, &qword_310D0);
          uint64_t v105 = (uint64_t)v158;
          if (v116 != 1)
          {
            ((void (*)(char *, char *, uint64_t))v113)(v158, v112, v115);
            ((void (*)(uint64_t, void, uint64_t, uint64_t))v160)(v105, 0, 1, v115);
            id v95 = v164;
            goto LABEL_51;
          }
          (*(void (**)(char *, uint64_t))(v162 + 8))(v112, v115);
          id v95 = v164;
        }
        uint64_t v117 = sub_26CE8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56))(v153, 1, 1, v117);
        uint64_t v118 = sub_26CF8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v118 - 8) + 56))(v155, 1, 1, v118);
        uint64_t v119 = (uint64_t)v154;
        sub_26C08();
        uint64_t v120 = (uint64_t)v156;
        sub_26C58();
        sub_CDDC(v119, v120, v105);
LABEL_51:
        uint64_t v140 = (uint64_t)&v94[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
        swift_beginAccess();
        sub_2388C(v105, v140);
        swift_endAccess();
        [v94 reloadSpecifiers];

        sub_E658(v105, &qword_312F8);
        return sub_E658(v98, &qword_312F8);
      }
      id v164 = v95;
      sub_E290(v98, (uint64_t)v57, &qword_312F8);
      uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v91)(v57, 1, v99);
      if (result == 1)
      {
        __break(1u);
        return result;
      }
      char v106 = sub_26A88();
      unint64_t v107 = *(void (**)(char *, uint64_t))(v162 + 8);
      v162 += 8;
      v107(v57, v99);
      if (v106)
      {
        uint64_t v108 = &v94[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate];
        swift_beginAccess();
        uint64_t v109 = (uint64_t)v108;
        uint64_t v110 = v145;
        sub_E290(v109, v145, &qword_312F8);
        unsigned int v111 = v91((char *)v110, 1, v99);
        id v95 = v164;
        if (v111 == 1)
        {
          sub_E658(v110, &qword_312F8);
          uint64_t v105 = (uint64_t)v158;
        }
        else
        {
          os_log_type_t v128 = v143;
          unint64_t v129 = v163;
          ((void (*)(char *, uint64_t, uint64_t))v163)(v143, v110, v99);
          uint64_t v130 = (uint64_t)v144;
          uint64_t v131 = v99;
          sub_26A68();
          int v132 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v130, 1, v151);
          sub_E658(v130, &qword_310D0);
          uint64_t v105 = (uint64_t)v158;
          if (v132 != 1)
          {
            ((void (*)(char *, char *, uint64_t))v129)(v158, v128, v131);
            ((void (*)(uint64_t, void, uint64_t, uint64_t))v160)(v105, 0, 1, v131);
            uint64_t v98 = v159;
            id v95 = v164;
            goto LABEL_51;
          }
          v107(v128, v131);
          id v95 = v164;
        }
        uint64_t v133 = sub_26CE8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v133 - 8) + 56))(v153, 1, 1, v133);
        uint64_t v134 = sub_26CF8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v134 - 8) + 56))(v155, 1, 1, v134);
        uint64_t v135 = (uint64_t)v154;
        sub_26C08();
        uint64_t v136 = (uint64_t)v156;
        sub_26C58();
        sub_CDDC(v135, v136, v105);
        uint64_t v98 = v159;
        goto LABEL_51;
      }
      uint64_t v121 = &v94[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
      swift_beginAccess();
      uint64_t v122 = v149;
      uint64_t v123 = v149 + *(int *)(v148 + 48);
      uint64_t v124 = (uint64_t)v121;
      uint64_t v125 = v161;
      sub_E290(v124, v149, &qword_312F8);
      uint64_t v126 = v122;
      sub_E290(v159, v123, &qword_312F8);
      unsigned int v127 = v91((char *)v122, 1, v125);
      id v95 = v164;
      if (v127 == 1)
      {
        if (v91((char *)v123, 1, v125) == 1)
        {
          sub_E658(v126, &qword_312F8);
          uint64_t v98 = v159;
LABEL_49:

          return sub_E658(v98, &qword_312F8);
        }
      }
      else
      {
        uint64_t v137 = v142;
        sub_E290(v126, v142, &qword_312F8);
        if (v91((char *)v123, 1, v125) != 1)
        {
          uint64_t v138 = v141;
          ((void (*)(char *, uint64_t, uint64_t))v163)(v141, v123, v125);
          sub_23B00(&qword_31588, (void (*)(uint64_t))&type metadata accessor for AccountStartDate);
          char v139 = sub_27088();
          v107(v138, v125);
          v107((char *)v137, v125);
          sub_E658(v126, &qword_312F8);
          uint64_t v105 = (uint64_t)v158;
          uint64_t v98 = v159;
          if (v139) {
            goto LABEL_49;
          }
LABEL_50:
          sub_E290(v98, v105, &qword_312F8);
          goto LABEL_51;
        }
        v107((char *)v137, v125);
      }
      sub_E658(v126, &qword_31578);
      uint64_t v105 = (uint64_t)v158;
      uint64_t v98 = v159;
      goto LABEL_50;
    }
    id v6 = v157;
    sub_26D88();
    char v81 = sub_26DA8();
    LOBYTE(v82) = sub_27238();
    if (os_log_type_enabled(v81, (os_log_type_t)v82))
    {
      id v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v83 = 0;
      uint64_t v84 = "Expected timeDateSpecifier to exists";
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v45, 1, 1, v46);
LABEL_12:
  sub_E658((uint64_t)v45, &qword_31580);
  uint64_t v86 = v161;
  uint64_t v87 = v162;
LABEL_13:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56))(v73, 1, 1, v86);
  sub_E658((uint64_t)v73, &qword_312F8);
  sub_26D88();
  NSString v88 = sub_26DA8();
  os_log_type_t v89 = sub_27238();
  if (os_log_type_enabled(v88, v89))
  {
    uint64_t v90 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v90 = 0;
    _os_log_impl(&dword_0, v88, v89, "selectedAccountStartDate should exists", v90, 2u);
    swift_slowDealloc();
  }

  return v163[1](v10, v164);
}

id sub_20A10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = &v3[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v3[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID];
  uint64_t v10 = sub_26C88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_storeCoordinator;
  sub_26BC8();
  swift_allocObject();
  uint64_t v12 = v4;
  *(void *)&v4[v11] = sub_26BB8();
  uint64_t v13 = &v12[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate];
  uint64_t v14 = sub_26A98();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v13, 1, 1, v14);
  v15(&v12[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate], 1, 1, v14);
  *(void *)&v12[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_specifierForAccountStartDate] = 0;
  *(void *)&v12[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier] = 0;
  *(void *)&v12[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController____lazy_storage___applicationRecord] = 1;

  if (a2)
  {
    NSString v16 = sub_270B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  v19.receiver = v12;
  v19.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v19, "initWithNibName:bundle:", v16, a3);

  return v17;
}

id sub_20C4C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_bundleIdentifier];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_accountID];
  uint64_t v7 = sub_26C88();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_storeCoordinator;
  sub_26BC8();
  swift_allocObject();
  uint64_t v9 = v2;
  *(void *)&v2[v8] = sub_26BB8();
  uint64_t v10 = &v9[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_initialAccountStartDate];
  uint64_t v11 = sub_26A98();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v12(&v9[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate], 1, 1, v11);
  *(void *)&v9[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_specifierForAccountStartDate] = 0;
  *(void *)&v9[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_timeDateSpecifier] = 0;
  *(void *)&v9[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController____lazy_storage___applicationRecord] = 1;

  v15.receiver = v9;
  v15.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);

  return v13;
}

uint64_t sub_20EDC()
{
  return type metadata accessor for SingleAccountSharingChoiceController();
}

uint64_t type metadata accessor for SingleAccountSharingChoiceController()
{
  uint64_t result = qword_31558;
  if (!qword_31558) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_20F30()
{
  sub_21054(319, &qword_31568, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F)
  {
    sub_21054(319, &qword_31570, (void (*)(uint64_t))&type metadata accessor for AccountStartDate);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_21054(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_27298();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

id sub_210A8(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_270B8();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_26C28();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_21184(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_21260;
  return v6(a1);
}

uint64_t sub_21260()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_21358(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_214E4(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_21378(char a1, int64_t a2, char a3, char *a4)
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
    sub_A070(&qword_314E8);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
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
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

uint64_t sub_214E4(char a1, int64_t a2, char a3, char *a4)
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
    sub_A070(&qword_31310);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

uint64_t sub_21654(char a1, int64_t a2, char a3, void *a4)
{
  return sub_21694(a1, a2, a3, a4, &qword_31608, (uint64_t (*)(void))&type metadata accessor for InternalAccount);
}

uint64_t sub_21674(char a1, int64_t a2, char a3, void *a4)
{
  return sub_21694(a1, a2, a3, a4, &qword_314C0, (uint64_t (*)(void))&type metadata accessor for AccountInstitutionKey);
}

uint64_t sub_21694(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    NSString v16 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_A070(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  NSString v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  _OWORD v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

uint64_t sub_218DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_262B4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v19 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22A88();
      uint64_t v9 = v19;
    }

    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = sub_A070(&qword_312F8);
    uint64_t v18 = *(void *)(v11 - 8);
    sub_E454(v10 + *(void *)(v18 + 72) * v6, a2, &qword_312F8);
    sub_221C0(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = sub_A070(&qword_312F8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }

  return v12(v13, v14, 1, v15);
}

uint64_t sub_21A78(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = sub_26A58();
  uint64_t v5 = *(void *)(v44 - 8);
  __chkstk_darwin(v44, v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_A070(&qword_31600);
  int v43 = a2;
  uint64_t v10 = sub_273A8();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v39 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v41 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v40 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v17 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v19 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v21 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v22 = v21 | (v19 << 6);
      }
      else
      {
        int64_t v23 = v19 + 1;
        if (__OFADD__(v19, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v23 >= v40) {
          goto LABEL_34;
        }
        unint64_t v24 = v41[v23];
        ++v19;
        if (!v24)
        {
          int64_t v19 = v23 + 1;
          if (v23 + 1 >= v40) {
            goto LABEL_34;
          }
          unint64_t v24 = v41[v19];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v40)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v39;
              if (v43)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v9 + 32);
                if (v38 >= 64) {
                  bzero(v41, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v41 = -1 << v38;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v41[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v19 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_41;
                }
                if (v19 >= v40) {
                  goto LABEL_34;
                }
                unint64_t v24 = v41[v19];
                ++v25;
                if (v24) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v19 = v25;
          }
        }
LABEL_21:
        unint64_t v15 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v19 << 6);
      }
      uint64_t v26 = *(void **)(*(void *)(v9 + 48) + 8 * v22);
      uint64_t v27 = v5;
      uint64_t v28 = *(void *)(v5 + 72);
      unint64_t v29 = *(void *)(v9 + 56) + v28 * v22;
      if (v43)
      {
        (*v16)(v8, v29, v44);
      }
      else
      {
        (*v42)(v8, v29, v44);
        id v30 = v26;
      }
      uint64_t result = sub_27278(*(void *)(v11 + 40));
      uint64_t v31 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v17 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v32) & ~*(void *)(v17 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v17 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v20 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      *(void *)(*(void *)(v11 + 48) + 8 * v20) = v26;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v11 + 56) + v28 * v20, v8, v44);
      ++*(void *)(v11 + 16);
      uint64_t v5 = v27;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v11;
  return result;
}

uint64_t sub_21E2C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_A070(&qword_312F8);
  uint64_t v42 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_A070(&qword_315F0);
  int v43 = a2;
  uint64_t v10 = sub_273A8();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v39 = v2;
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v41 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  int64_t v40 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v16 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v18 = 0;
  while (1)
  {
    if (v15)
    {
      unint64_t v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    int64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v18;
    if (!v24)
    {
      int64_t v18 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v18];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v18 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v18 >= v40) {
              goto LABEL_34;
            }
            unint64_t v24 = v41[v18];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v18 = v25;
      }
    }
LABEL_21:
    unint64_t v15 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    uint64_t v26 = *(void **)(*(void *)(v9 + 48) + 8 * v21);
    uint64_t v27 = *(void *)(v42 + 72);
    uint64_t v28 = *(void *)(v9 + 56) + v27 * v21;
    if (v43)
    {
      sub_E454(v28, (uint64_t)v8, &qword_312F8);
    }
    else
    {
      sub_E290(v28, (uint64_t)v8, &qword_312F8);
      id v29 = v26;
    }
    uint64_t result = sub_27278(*(void *)(v11 + 40));
    uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v19 = __clz(__rbit64((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v16 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v19 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(void *)(*(void *)(v11 + 48) + 8 * v19) = v26;
    uint64_t result = sub_E454((uint64_t)v8, *(void *)(v11 + 56) + v27 * v19, &qword_312F8);
    ++*(void *)(v11 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
  if (v37 >= 64) {
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v37;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v11;
  return result;
}

void sub_221C0(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_272E8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_27278(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9 || v3 < v13) {
            goto LABEL_6;
          }
        }
        else if (v13 < v9 && v3 < v13)
        {
          goto LABEL_6;
        }
        uint64_t v16 = *(void *)(a2 + 48);
        uint64_t v17 = (void *)(v16 + 8 * v3);
        int64_t v18 = (void *)(v16 + 8 * v6);
        if (v3 != v6 || v17 >= v18 + 1) {
          *uint64_t v17 = *v18;
        }
        uint64_t v19 = *(void *)(a2 + 56);
        uint64_t v20 = *(void *)(*(void *)(sub_A070(&qword_312F8) - 8) + 72);
        int64_t v21 = v20 * v3;
        unint64_t v22 = v19 + v20 * v3;
        int64_t v23 = v20 * v6;
        unint64_t v24 = v19 + v20 * v6 + v20;
        if (v21 < v23 || v22 >= v24)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v21 == v23) {
            goto LABEL_6;
          }
          swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v26 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v27 = *v26;
    uint64_t v28 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v26 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v28 = *v26;
    uint64_t v27 = (-1 << a1) - 1;
  }
  uint64_t *v26 = v28 & v27;
  uint64_t v29 = *(void *)(a2 + 16);
  BOOL v30 = __OFSUB__(v29, 1);
  uint64_t v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_223BC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_262B4((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_227F4();
      goto LABEL_7;
    }
    sub_21A78(v12, a3 & 1);
    unint64_t v23 = sub_262B4((uint64_t)a2);
    if ((v13 & 1) == (v24 & 1))
    {
      unint64_t v9 = v23;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    sub_E550(0, (unint64_t *)&qword_316D0);
    id result = (id)sub_27438();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    uint64_t v16 = v15[7];
    uint64_t v17 = sub_26A58();
    uint64_t v18 = *(void *)(v17 - 8);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 40);
    uint64_t v20 = v17;
    uint64_t v21 = v16 + *(void *)(v18 + 72) * v9;
    return (id)v19(v21, a1, v20);
  }
LABEL_13:
  sub_226A0(v9, (uint64_t)a2, a1, v15);

  return a2;
}

id sub_2253C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_262B4((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 >= v12 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v15 = *v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      uint64_t v17 = sub_A070(&qword_312F8);
      return (id)sub_23BA4(a1, v16 + *(void *)(*(void *)(v17 - 8) + 72) * v9, &qword_312F8);
    }
    goto LABEL_11;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_22A88();
    goto LABEL_7;
  }
  sub_21E2C(v12, a3 & 1);
  unint64_t v19 = sub_262B4((uint64_t)a2);
  if ((v13 & 1) != (v20 & 1))
  {
LABEL_15:
    sub_E550(0, (unint64_t *)&qword_316D0);
    id result = (id)sub_27438();
    __break(1u);
    return result;
  }
  unint64_t v9 = v19;
  unint64_t v15 = *v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2274C(v9, (uint64_t)a2, a1, v15);

  return a2;
}

uint64_t sub_226A0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_26A58();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2274C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_A070(&qword_312F8);
  uint64_t result = sub_E454(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, &qword_312F8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

id sub_227F4()
{
  uint64_t v1 = sub_26A58();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A070(&qword_31600);
  char v24 = v0;
  uint64_t v6 = *v0;
  uint64_t v7 = sub_27398();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_23:
    id result = (id)swift_release();
    *char v24 = v8;
    return result;
  }
  id result = (id)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v25 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  uint64_t v28 = v2 + 16;
  int64_t v26 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v27 = v2 + 32;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void **)(*(void *)(v6 + 48) + 8 * v16);
    unint64_t v19 = *(void *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v5, *(void *)(v6 + 56) + v19, v1);
    *(void *)(*(void *)(v8 + 48) + v17) = v18;
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v8 + 56) + v19, v5, v1);
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v26) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_22A88()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_A070(&qword_312F8);
  uint64_t v27 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_A070(&qword_315F0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_27398();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (id)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v25 = v1;
  id result = (id)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v26 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v26 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    unint64_t v19 = *(void **)(*(void *)(v6 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v27 + 72) * v17;
    sub_E290(*(void *)(v6 + 56) + v20, (uint64_t)v5, &qword_312F8);
    *(void *)(*(void *)(v8 + 48) + v18) = v19;
    sub_E454((uint64_t)v5, *(void *)(v8 + 56) + v20, &qword_312F8);
    id result = v19;
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    id result = (id)swift_release();
    uint64_t v1 = v25;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v26 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v26 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_22CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    if (!(*v4 >> 62))
    {
      if (*(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8)) >= a2) {
        goto LABEL_4;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_27388();
  swift_bridgeObjectRelease();
  if (v22 < v5) {
    goto LABEL_29;
  }
LABEL_4:
  uint64_t v8 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_27388();
    swift_bridgeObjectRelease();
    uint64_t v10 = v23 + v7;
    if (!__OFADD__(v23, v7)) {
      goto LABEL_8;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (*v4 >> 62) {
    goto LABEL_32;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (*v4 & 0xFFFFFFFFFFFFFF8));
  uint64_t v10 = v9 + v7;
  if (__OFADD__(v9, v7)) {
    goto LABEL_34;
  }
LABEL_8:
  unint64_t v11 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v11;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v11 & 0x8000000000000000) != 0
    || (v11 & 0x4000000000000000) != 0
    || (uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8, v10 > *(void *)((char *)&dword_18 + (v11 & 0xFFFFFFFFFFFFFF8)) >> 1))
  {
    if (!(v11 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      unint64_t v11 = sub_27348();
      swift_bridgeObjectRelease();
      *uint64_t v4 = v11;
      uint64_t v13 = v11 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_35:
    swift_bridgeObjectRetain();
    sub_27388();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  unint64_t v14 = (void *)(v13 + 32 + 8 * v6);
  sub_E550(0, (unint64_t *)&qword_316D0);
  swift_arrayDestroy();
  if (v7)
  {
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_27388();
      swift_bridgeObjectRelease();
      uint64_t v16 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_17:
        if (v16 < 0)
        {
LABEL_42:
          uint64_t result = sub_273C8();
          __break(1u);
          return result;
        }
        unint64_t v17 = (char *)(v14 + 1);
        uint64_t v18 = (char *)(v13 + 32 + 8 * v5);
        if (v14 + 1 != (void *)v18 || v17 >= &v18[8 * v16]) {
          memmove(v17, v18, 8 * v16);
        }
        if (!(v11 >> 62))
        {
          uint64_t v19 = *(void *)(v13 + 16);
          uint64_t v20 = v19 + v7;
          if (!__OFADD__(v19, v7))
          {
LABEL_23:
            *(void *)(v13 + 16) = v20;
            goto LABEL_24;
          }
          goto LABEL_41;
        }
LABEL_39:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_27388();
        swift_bridgeObjectRelease();
        uint64_t v20 = v25 + v7;
        if (!__OFADD__(v25, v7)) {
          goto LABEL_23;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v13 + 16);
      uint64_t v16 = v15 - v5;
      if (!__OFSUB__(v15, v5)) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
LABEL_24:
  *unint64_t v14 = v3;

  return sub_27198();
}

void (*sub_22FF8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_230A8(v6, a2, a3);
  return sub_23060;
}

void sub_23060(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_230A8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_27338();
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
    return sub_23128;
  }
  __break(1u);
  return result;
}

void sub_23128(id *a1)
{
}

uint64_t sub_23130(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_23210;
  return v5(v2 + 32);
}

uint64_t sub_23210()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id sub_23324()
{
  uint64_t v1 = sub_A070(&qword_312F8);
  uint64_t v3 = __chkstk_darwin(v1 - 8, v2);
  uint64_t v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3, v6);
  uint64_t v8 = &v14[-v7];
  uint64_t v9 = (uint64_t)v0
     + OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate;
  swift_beginAccess();
  sub_E290(v9, (uint64_t)v8, &qword_312F8);
  uint64_t v10 = sub_26A98();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10);
  id result = (id)sub_E658((uint64_t)v8, &qword_312F8);
  if (v12 != 1)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
    swift_beginAccess();
    sub_23BA4((uint64_t)v5, v9, &qword_312F8);
    swift_endAccess();
    return [v0 reloadSpecifiers];
  }
  return result;
}

id sub_234CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_A070(&qword_310D0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_A070(&qword_312F8);
  __chkstk_darwin(v11 - 8, v12);
  unint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_26A98();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = &v1[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_specifierForAccountStartDate];
  swift_beginAccess();
  if (*(void *)v20)
  {
    uint64_t v21 = (uint64_t)&v1[OBJC_IVAR____TtC21WalletPrivacySettings36SingleAccountSharingChoiceController_currentAccountStartDate];
    swift_beginAccess();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v21, 1, v15)
      || ((*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v21, v15),
          char v22 = sub_26A88(),
          id result = (id)(*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15),
          (v22 & 1) == 0))
    {
      uint64_t v24 = sub_26C68();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v10, 1, 1, v24);
      sub_26A78();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
      swift_beginAccess();
      sub_23BA4((uint64_t)v14, v21, &qword_312F8);
      swift_endAccess();
      return [v1 reloadSpecifiers];
    }
  }
  else
  {
    sub_26D88();
    uint64_t v25 = sub_26DA8();
    os_log_type_t v26 = sub_27238();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "specifierForAccountStartDate should exists", v27, 2u);
      swift_slowDealloc();
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_2388C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_A070(&qword_312F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_238F4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_23934(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_19FEC;
  return sub_1DF24(a1, v4, v5, v6);
}

uint64_t sub_239E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1AA34;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_315A0 + dword_315A0);
  return v6(a1, v4);
}

uint64_t sub_23AA0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_23AD8()
{
  return sub_1F13C(*(void **)(v0 + 16));
}

id sub_23AE0()
{
  return sub_1F3F4(*(void **)(v0 + 16));
}

uint64_t sub_23AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_23AF8()
{
  return swift_release();
}

uint64_t sub_23B00(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23B48()
{
  unint64_t result = qword_315D0;
  if (!qword_315D0)
  {
    sub_DEA4((uint64_t *)&unk_316B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_315D0);
  }
  return result;
}

uint64_t sub_23BA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_A070(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

_OWORD *sub_23C08(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23C18()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_23C50(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19FEC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_31610 + dword_31610);
  return v6(a1, v4);
}

void sub_23D10()
{
  id v1 = [self defaultCenter];
  [v1 addObserver:v0 selector:"didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v1 addObserver:v0 selector:"willEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  [v1 addObserver:v0 selector:"applicationWillResignActive" name:UIApplicationWillResignActiveNotification object:0];
  [v1 addObserver:v0 selector:"applicationDidBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];
  [v1 addObserver:v0 selector:"didAddDeactivationReasonWithNotification:" name:_UIApplicationWillAddDeactivationReasonNotification object:0];
  [v1 addObserver:v0 selector:"didRemoveDeactivationReasonWithNotification:" name:_UIApplicationDidRemoveDeactivationReasonNotification object:0];
}

void sub_23E5C()
{
  id v1 = v0;
  uint64_t v2 = sub_27018();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_27038();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator;
  if ([*(id *)&v1[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator] isEffectivelyLocked])
  {
    uint64_t v13 = *(void **)&v1[v12];
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v1;
    uint64_t v25 = sub_26514;
    uint64_t v26 = v14;
    aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    uint64_t v23 = sub_24CB4;
    uint64_t v24 = &unk_2D2D0;
    uint64_t v15 = _Block_copy(&aBlock);
    id v16 = v13;
    uint64_t v17 = v1;
    swift_release();
    [v16 isShieldRequiredWithCompletion:v15];
    _Block_release(v15);
  }
  else
  {
    sub_E550(0, (unint64_t *)&unk_316A0);
    uint64_t v18 = (void *)sub_27258();
    uint64_t v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v25 = sub_264BC;
    uint64_t v26 = v19;
    aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    uint64_t v23 = sub_1F4E8;
    uint64_t v24 = &unk_2D280;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_release();
    sub_27028();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_26970(&qword_315C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_A070((uint64_t *)&unk_316B0);
    sub_23B48();
    sub_272D8();
    sub_27268();
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
}

BOOL sub_241F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_2420C()
{
  Swift::UInt v1 = *v0;
  sub_27448();
  sub_27458(v1);
  return sub_27478();
}

void sub_24254()
{
  sub_27458(*v0);
}

Swift::Int sub_24280()
{
  Swift::UInt v1 = *v0;
  sub_27448();
  sub_27458(v1);
  return sub_27478();
}

uint64_t sub_242C4(char a1)
{
  uint64_t v2 = sub_27018();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_27038();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E550(0, (unint64_t *)&unk_316A0);
  uint64_t v12 = (void *)sub_27258();
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(unsigned char *)(v14 + 24) = a1;
  aBlock[4] = sub_26554;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1F4E8;
  aBlock[3] = &unk_2D320;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  sub_27028();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_26970(&qword_315C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_A070((uint64_t *)&unk_316B0);
  sub_23B48();
  sub_272D8();
  sub_27268();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

void sub_245A4(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    if (a2) {
      unsigned __int8 v5 = 2;
    }
    else {
      unsigned __int8 v5 = 1;
    }
    sub_24608(v5);
  }
}

void sub_24608(unsigned __int8 a1)
{
  uint64_t v2 = v1;
  unsigned int v3 = a1;
  uint64_t v4 = sub_27018();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_27038();
  uint64_t v54 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v53 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_26DB8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  id v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen;
  if (v2[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen] != v3)
  {
    uint64_t v52 = v8;
    uint64_t v48 = v9;
    sub_26D98();
    uint64_t v18 = sub_26DA8();
    os_log_type_t v19 = sub_27248();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v50 = v4;
    uint64_t v51 = v17;
    uint64_t v49 = v5;
    if (v20)
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v46 = v21 + 4;
      LOBYTE(v55) = v3;
      uint64_t v22 = sub_270F8();
      uint64_t v47 = v2;
      uint64_t v55 = sub_25C5C(v22, v23, aBlock);
      sub_272A8();
      uint64_t v2 = v47;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v18, v19, "Setting privacy settings screen: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    uint64_t v24 = v52;
    if (v3 >= 2)
    {
      if (v3 == 2) {
        [*(id *)&v2[OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator] requestAccess];
      }
      id v30 = sub_EC70();
      id v31 = [v30 parentViewController];

      if (!v31)
      {
        id v32 = sub_EC70();
        [v2 addChildViewController:v32];

        id v33 = [v2 view];
        if (!v33)
        {
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
        unint64_t v34 = v33;
        id v35 = sub_EC70();
        id v36 = [v35 view];

        if (!v36)
        {
LABEL_22:
          __break(1u);
          return;
        }
        [v34 addSubview:v36];

        id v37 = sub_EC70();
        [v37 didMoveToParentViewController:v2];
      }
      sub_E550(0, (unint64_t *)&unk_316A0);
      uint64_t v38 = (void *)sub_27258();
      uint64_t v39 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_26560;
      aBlock[5] = v39;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1F4E8;
      aBlock[3] = (uint64_t)&unk_2D348;
      int64_t v40 = _Block_copy(aBlock);
      swift_release();
      uint64_t v41 = v53;
      sub_27028();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_26970(&qword_315C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_A070((uint64_t *)&unk_316B0);
      sub_23B48();
      uint64_t v42 = v50;
      sub_272D8();
      sub_27268();
      _Block_release(v40);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v42);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v48);
    }
    else
    {
      id v25 = sub_EC70();
      id v26 = [v25 parentViewController];

      if (v26)
      {
        id v27 = sub_EC70();
        id v28 = [v27 view];

        if (!v28)
        {
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
        [v28 removeFromSuperview];

        id v29 = sub_EC70();
        [v29 removeFromParentViewController];
      }
    }
    int v43 = v2[v51];
    v2[v51] = v3;
    id v44 = [v2 view];
    if (v44)
    {
      uint64_t v45 = v44;
      [v44 setNeedsLayout];

      if ((v3 == 1) == (v43 != 1)) {
        [v2 reloadSpecifiers];
      }
      return;
    }
    __break(1u);
    goto LABEL_20;
  }
}

uint64_t sub_24CB4(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_24D08()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    Swift::UInt v1 = (void *)Strong;
    sub_24608(1u);
  }
}

id sub_24D60()
{
  uint64_t v1 = sub_27018();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_27038();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [*(id *)(v0+ OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_appProtectionCoordinator) isEffectivelyLocked];
  if (result)
  {
    if (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_currentScreen) <= 1u)
    {
      sub_E550(0, (unint64_t *)&unk_316A0);
      uint64_t v12 = (void *)sub_27258();
      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_26968;
      aBlock[5] = v13;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1F4E8;
      aBlock[3] = &unk_2D370;
      uint64_t v14 = _Block_copy(aBlock);
      swift_release();
      sub_27028();
      aBlock[0] = _swiftEmptyArrayStorage;
      sub_26970(&qword_315C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_A070((uint64_t *)&unk_316B0);
      sub_23B48();
      sub_272D8();
      sub_27268();
      _Block_release(v14);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  return result;
}

void sub_25058()
{
  uint64_t v0 = sub_26DB8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26D98();
  uint64_t v5 = sub_26DA8();
  os_log_type_t v6 = sub_27248();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Restricting privacy settings to shield", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    sub_24608(3u);
  }
  id v10 = [self sharedApplication];
  [v10 _updateSnapshotForBackgroundApplication:1];
}

void sub_25208()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    id v2 = [Strong parentViewController];
    if (!v2)
    {
      uint64_t v3 = v1;
LABEL_12:

      return;
    }
    uint64_t v3 = v2;
    id v4 = [v1 navigationController];
    if (!v4)
    {
      uint64_t v5 = v1;
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v5 = v4;
    id v6 = [v4 viewControllers];
    sub_E550(0, &qword_31330);
    unint64_t v7 = sub_27188();

    sub_25360((uint64_t)v1, v7);
    if (v8)
    {
      sub_25360((uint64_t)v3, v7);
      char v11 = v10;
      swift_bridgeObjectRelease();
      uint64_t v9 = v3;
      if (v11)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = v1;
    }

    goto LABEL_10;
  }
}

void sub_25360(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_27338();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_E550(0, &qword_31330);
      char v6 = sub_27288();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)sub_27338();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_27288();

          if (v10) {
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
        uint64_t v3 = sub_27388();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_256DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26BE8();
  if (!v2)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    return sub_113F8((uint64_t)&v8);
  }
  uint64_t v3 = v2;
  sub_270C8();
  sub_27318();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_26390((uint64_t)v7), (v5 & 1) != 0))
  {
    sub_26428(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_263D4((uint64_t)v7);
  if (!*((void *)&v9 + 1)) {
    return sub_113F8((uint64_t)&v8);
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) != 0 && v7[0] == 3)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher) = 1;
    if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive) & 1) == 0) {
      return (uint64_t)sub_24D60();
    }
  }
  return result;
}

void sub_2581C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_26BE8();
  if (!v2)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_12:
    sub_113F8((uint64_t)&v7);
    return;
  }
  uint64_t v3 = v2;
  sub_270C8();
  sub_27318();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_26390((uint64_t)v6), (v5 & 1) != 0))
  {
    sub_26428(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v7);
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_263D4((uint64_t)v6);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) != 0 && v6[0] == 3)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationInAppSwitcher) = 0;
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC21WalletPrivacySettings31WalletPrivacySettingsController_isApplicationActive) == 1) {
      sub_23E5C();
    }
  }
}

uint64_t sub_2595C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_26BF8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26BD8();
  id v11 = a1;
  a4(v10);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

unsigned char *initializeBufferWithCopyOfBuffer for Screen(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Screen(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Screen(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x25BB8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_25BE0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25BEC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Screen()
{
  return &type metadata for Screen;
}

unint64_t sub_25C08()
{
  unint64_t result = qword_31690;
  if (!qword_31690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_31690);
  }
  return result;
}

uint64_t sub_25C5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25D30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_26428((uint64_t)v12, *a3);
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
      sub_26428((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_E5D0((uint64_t)v12);
  return v7;
}

uint64_t sub_25D30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_272B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25EEC(a5, a6);
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
  uint64_t v8 = sub_27358();
  if (!v8)
  {
    sub_27368();
    __break(1u);
LABEL_17:
    uint64_t result = sub_273C8();
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

uint64_t sub_25EEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_25F84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_26164(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_26164(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_25F84(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_260FC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_27328();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_27368();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_27128();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_273C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_27368();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_260FC(uint64_t a1, uint64_t a2)
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
  sub_A070((uint64_t *)&unk_316C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_26164(char a1, int64_t a2, char a3, char *a4)
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
    sub_A070((uint64_t *)&unk_316C0);
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
  uint64_t result = sub_273C8();
  __break(1u);
  return result;
}

unint64_t sub_262B4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_27278(*(void *)(v2 + 40));

  return sub_26568(a1, v4);
}

unint64_t sub_262F8(uint64_t a1)
{
  sub_26B08();
  sub_26970(&qword_316D8, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
  uint64_t v2 = sub_27058();

  return sub_26684(a1, v2);
}

unint64_t sub_26390(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_272F8(*(void *)(v2 + 40));

  return sub_26844(a1, v4);
}

uint64_t sub_263D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_26428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_26484()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_264BC()
{
}

uint64_t sub_264C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_264D4()
{
  return swift_release();
}

uint64_t sub_264DC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_26514(char a1)
{
  return sub_242C4(a1);
}

uint64_t sub_2651C()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_26554()
{
  sub_245A4(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void sub_26560()
{
}

unint64_t sub_26568(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_E550(0, (unint64_t *)&qword_316D0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_27288();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_27288();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_26684(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v4 = sub_26B08();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v2;
  uint64_t v9 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  uint64_t v19 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v13 = v5 + 16;
    uint64_t v12 = v14;
    uint64_t v15 = *(void *)(v13 + 56);
    do
    {
      v12(v8, *(void *)(v21 + 48) + v15 * v10, v4);
      sub_26970((unint64_t *)&unk_316E0, (void (*)(uint64_t))&type metadata accessor for AccountInstitutionKey);
      char v16 = sub_27088();
      (*(void (**)(char *, uint64_t))(v13 - 8))(v8, v4);
      if (v16) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }
    while (((*(void *)(v19 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_26844(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_2690C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_27308();
      sub_263D4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2690C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_26968()
{
}

uint64_t sub_26970(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_269D8()
{
  return AccountNumber.value.getter();
}

uint64_t sub_269E8()
{
  return type metadata accessor for AccountNumber();
}

uint64_t sub_269F8()
{
  return type metadata accessor for AccountStatus();
}

uint64_t sub_26A08()
{
  return InternalAccount.originType.getter();
}

uint64_t sub_26A18()
{
  return InternalAccount.displayName.getter();
}

uint64_t sub_26A28()
{
  return InternalAccount.accountNumber.getter();
}

uint64_t sub_26A38()
{
  return InternalAccount.accountStatus.getter();
}

uint64_t sub_26A48()
{
  return InternalAccount.id.getter();
}

uint64_t sub_26A58()
{
  return type metadata accessor for InternalAccount();
}

uint64_t sub_26A68()
{
  return AccountStartDate.selectedDate.getter();
}

uint64_t sub_26A78()
{
  return AccountStartDate.init(selectedDate:sinceOpeningSelected:)();
}

uint64_t sub_26A88()
{
  return AccountStartDate.sinceOpeningSelected.getter();
}

uint64_t sub_26A98()
{
  return type metadata accessor for AccountStartDate();
}

uint64_t sub_26AA8()
{
  return FinancialDataTCC.init()();
}

uint64_t sub_26AB8()
{
  return type metadata accessor for FinancialDataTCC();
}

uint64_t sub_26AC8()
{
  return type metadata accessor for AccountOriginType();
}

uint64_t sub_26AD8()
{
  return FKLocalizedString(for:table:)();
}

uint64_t sub_26AE8()
{
  return type metadata accessor for LocalizedStringTable();
}

uint64_t sub_26AF8()
{
  return AccountInstitutionKey.institutionName.getter();
}

uint64_t sub_26B08()
{
  return type metadata accessor for AccountInstitutionKey();
}

uint64_t sub_26B18()
{
  return AppAuthorizationStateManager.refreshAuthorization(bundleID:)();
}

uint64_t sub_26B28()
{
  return AppAuthorizationStateManager.init(tccCoordinator:)();
}

uint64_t sub_26B38()
{
  return AppAuthorizationStateManager.authorizationType(bundleID:)();
}

uint64_t sub_26B48()
{
  return AppAuthorizationStateManager.authorizationType.getter();
}

void sub_26B58()
{
}

uint64_t sub_26B68()
{
  return type metadata accessor for AppAuthorizationStateManager();
}

uint64_t sub_26B78()
{
  return PrivacySettingsStoreCoordinator.modifyLinking(accountID:bundleID:linked:since:completion:)();
}

uint64_t sub_26B88()
{
  return PrivacySettingsStoreCoordinator.updateHandler.setter();
}

uint64_t sub_26B98()
{
  return PrivacySettingsStoreCoordinator.linkedAccountDate(toBundleID:withAccountID:)();
}

uint64_t sub_26BB8()
{
  return PrivacySettingsStoreCoordinator.init()();
}

uint64_t sub_26BC8()
{
  return type metadata accessor for PrivacySettingsStoreCoordinator();
}

uint64_t sub_26BD8()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_26BE8()
{
  return Notification.userInfo.getter();
}

uint64_t sub_26BF8()
{
  return type metadata accessor for Notification();
}

uint64_t sub_26C08()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_26C18()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_26C28()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_26C38()
{
  return static Date.distantPast.getter();
}

NSDate sub_26C48()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_26C58()
{
  return static Date.now.getter();
}

uint64_t sub_26C68()
{
  return type metadata accessor for Date();
}

NSUUID sub_26C78()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_26C88()
{
  return type metadata accessor for UUID();
}

uint64_t sub_26C98()
{
  return static Locale.current.getter();
}

uint64_t sub_26CA8()
{
  return type metadata accessor for Locale();
}

uint64_t sub_26CB8()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_26CC8()
{
  return Calendar.date(byAdding:to:wrappingComponents:)();
}

uint64_t sub_26CD8()
{
  return static Calendar.current.getter();
}

uint64_t sub_26CE8()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_26CF8()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_26D08()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_26D18()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_26D28()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_26D38()
{
  return type metadata accessor for ObservationRegistrar();
}

BOOL sub_26D58()
{
  return AppProtectionCoordinator.isEffectivelyLocked()();
}

uint64_t sub_26D68()
{
  return static AppProtectionCoordinator.shared.getter();
}

uint64_t sub_26D78()
{
  return type metadata accessor for AppProtectionCoordinator();
}

uint64_t sub_26D88()
{
  return static Logger.bankConnect.getter();
}

uint64_t sub_26D98()
{
  return static Logger.appProtection.getter();
}

uint64_t sub_26DA8()
{
  return Logger.logObject.getter();
}

uint64_t sub_26DB8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_26DC8()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_26DD8()
{
  return Transaction.animation.setter();
}

uint64_t sub_26DE8()
{
  return ButtonMenuStyle.init()();
}

uint64_t sub_26DF8()
{
  return type metadata accessor for ButtonMenuStyle();
}

uint64_t sub_26E08()
{
  return EnvironmentValues.menuIndicatorVisibility.getter();
}

uint64_t sub_26E18()
{
  return EnvironmentValues.menuIndicatorVisibility.setter();
}

uint64_t sub_26E28()
{
  return InlinePickerStyle.init()();
}

uint64_t sub_26E38()
{
  return type metadata accessor for InlinePickerStyle();
}

uint64_t sub_26E48()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_26E58()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_26E68()
{
  return BorderedButtonStyle.init()();
}

uint64_t sub_26E78()
{
  return type metadata accessor for BorderedButtonStyle();
}

uint64_t sub_26E88()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_26E98()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_26EA8()
{
  return static HierarchicalShapeStyle.primary.getter();
}

uint64_t sub_26EB8()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_26EC8()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_26ED8()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_26EE8()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_26EF8()
{
  return Menu.init(content:label:)();
}

uint64_t sub_26F08()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_26F18()
{
  return Text.init<A>(_:)();
}

uint64_t sub_26F28()
{
  return View.defaultListElementVerticalSpacing()();
}

uint64_t sub_26F38()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_26F48()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_26F58()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_26F68()
{
  return View.pickerStyle<A>(_:)();
}

uint64_t sub_26F78()
{
  return View.labelsHidden()();
}

uint64_t sub_26F88()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_26F98()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_26FA8()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_26FB8()
{
  return View.menuStyle<A>(_:)();
}

uint64_t sub_26FC8()
{
  return State.wrappedValue.getter();
}

uint64_t sub_26FD8()
{
  return State.projectedValue.getter();
}

uint64_t sub_26FE8()
{
  return Picker<>.init(_:selection:content:)();
}

uint64_t sub_26FF8()
{
  return Binding.subscript.getter();
}

uint64_t sub_27008()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_27018()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_27028()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_27038()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_27048()
{
  return Dictionary.description.getter();
}

uint64_t sub_27058()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_27068()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_27078()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_27088()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_27098()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_270A8()
{
  return String.LocalizationValue.init(_:)();
}

NSString sub_270B8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_270C8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_270D8()
{
  return String.init(format:_:)();
}

uint64_t sub_270E8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_270F8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_27108()
{
  return String.hash(into:)();
}

uint64_t sub_27118()
{
  return String.index(_:offsetBy:limitedBy:)();
}

Swift::Int sub_27128()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_27138()
{
  return String.subscript.getter();
}

uint64_t sub_27148()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_27158()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_27168()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_27178()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_27188()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_27198()
{
  return specialized Array._endMutation()();
}

uint64_t sub_271A8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_271B8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_271C8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_271D8()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_271E8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_271F8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_27208()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_27218()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_27228()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_27238()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_27248()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_27258()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_27268()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int sub_27278(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_27288()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_27298()
{
  return type metadata accessor for Optional();
}

uint64_t sub_272A8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_272B8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_272C8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_272D8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_272E8()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_272F8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_27308()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_27318()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_27328()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_27338()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_27348()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_27358()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_27368()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_27378()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_27388()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_27398()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_273A8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_273B8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_273C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_273D8(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_273E8()
{
  return _stringCompareInternal(_:_:_:_:expecting:)();
}

uint64_t sub_273F8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_27408()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_27418()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_27428()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_27438()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_27448()
{
  return Hasher.init(_seed:)();
}

void sub_27458(Swift::UInt a1)
{
}

void sub_27468(Swift::UInt8 a1)
{
}

Swift::Int sub_27478()
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}