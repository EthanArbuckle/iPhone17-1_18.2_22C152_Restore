char *sub_4A3C(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  double y;
  double width;
  double height;
  char *v16;
  uint64_t inited;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  NSString v47;
  NSString v48;
  id v49;
  NSString v50;
  id v51;
  NSString v52;
  uint64_t v53;
  id v54;
  NSString v55;
  id v56;
  NSString v57;
  id v58;
  NSString v59;
  uint64_t v60;
  id v61;
  NSString v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  objc_super v94;

  v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel;
  v4 = objc_allocWithZone((Class)UILabel);
  v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UILabel) init];
  v7 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UILabel) init];
  v8 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)UILabel) init];
  v9 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel;
  *(void *)&v5[v9] = [objc_allocWithZone((Class)UILabel) init];
  v10 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel;
  *(void *)&v5[v10] = [objc_allocWithZone((Class)UILabel) init];
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_alwaysOn] = 0;
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_device] = a1;
  v11 = objc_allocWithZone((Class)CLKDeviceMetrics);
  v87 = a1;
  v12 = objc_msgSend(v11, "initWithDevice:identitySizeClass:");
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_deviceMetrics] = v12;

  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v94.receiver = v5;
  v94.super_class = (Class)type metadata accessor for DepthRectangularSimpleHistoryView();
  v16 = (char *)objc_msgSendSuper2(&v94, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v16 setClipsToBounds:1];
  sub_66B8(&qword_47D58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_37EF0;
  v88 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel;
  v18 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel];
  *(void *)(inited + 32) = v18;
  v91 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel;
  v19 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel];
  *(void *)(inited + 40) = v19;
  v90 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel;
  v20 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel];
  *(void *)(inited + 48) = v20;
  v89 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel;
  v21 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel];
  *(void *)(inited + 56) = v21;
  v92 = inited;
  sub_36EA8();
  v22 = self;
  v23 = v92 & 0xC000000000000001;
  v24 = v18;
  v25 = v19;
  v26 = v20;
  v27 = v21;
  if ((v92 & 0xC000000000000001) != 0) {
    v28 = (id)sub_37128();
  }
  else {
    v28 = *(id *)(v92 + 32);
  }
  v29 = v28;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v29 setFont:qword_49528];
  v30 = [v22 grayColor];
  [v29 setTextColor:v30];

  if (v23) {
    v31 = (id)sub_37128();
  }
  else {
    v31 = *(id *)(v92 + 40);
  }
  v32 = v31;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v32 setFont:qword_49528];
  v33 = [v22 grayColor];
  [v32 setTextColor:v33];

  if (v23) {
    v34 = (id)sub_37128();
  }
  else {
    v34 = *(id *)(v92 + 48);
  }
  v35 = v34;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v35 setFont:qword_49528];
  v36 = [v22 grayColor];
  [v35 setTextColor:v36];

  if (v23) {
    v37 = (id)sub_37128();
  }
  else {
    v37 = *(id *)(v92 + 56);
  }
  v38 = v37;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v38 setFont:qword_49528];
  v39 = [v22 grayColor];
  [v38 setTextColor:v39];
  swift_bridgeObjectRelease();

  v40 = qword_47C68;
  v41 = *(id *)&v16[v88];
  if (v40 != -1) {
    swift_once();
  }
  [v41 setTextColor:qword_494F8];

  v42 = *(id *)&v16[v90];
  v43 = [v22 whiteColor];
  [v42 setTextColor:v43];

  v44 = qword_47BE0;
  v45 = *(id *)&v16[v88];
  if (v44 != -1) {
    swift_once();
  }
  v46 = (id)qword_49468;
  v47 = sub_36DC8();
  v48 = sub_36DC8();
  v49 = [v46 localizedStringForKey:v47 value:0 table:v48];

  sub_36DD8();
  sub_66FC();
  sub_37058();
  swift_bridgeObjectRelease();
  v50 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v45 setText:v50];

  v51 = *(id *)&v16[v91];
  v52 = sub_36DC8();
  [v51 setText:v52];

  v53 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel;
  v54 = *(id *)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel];
  v55 = sub_36DC8();
  [v54 setText:v55];

  v56 = *(id *)&v16[v90];
  v57 = sub_36DC8();
  [v56 setText:v57];

  v58 = *(id *)&v16[v89];
  v59 = sub_36DC8();
  [v58 setText:v59];

  v60 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel;
  v61 = *(id *)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel];
  v62 = sub_36DC8();
  [v61 setText:v62];

  v63 = swift_initStackObject();
  *(_OWORD *)(v63 + 16) = xmmword_37F00;
  v86 = v53;
  v64 = *(void **)&v16[v53];
  *(void *)(v63 + 32) = v64;
  v65 = *(void **)&v16[v60];
  *(void *)(v63 + 40) = v65;
  v93 = v63;
  sub_36EA8();
  v66 = v64;
  v67 = v65;
  if ((v93 & 0xC000000000000001) != 0) {
    v68 = (id)sub_37128();
  }
  else {
    v68 = *(id *)(v93 + 32);
  }
  v69 = v68;
  if (qword_47CA0 != -1) {
    swift_once();
  }
  [v69 setFont:qword_49530];
  v70 = [v22 grayColor];
  [v69 setTextColor:v70];

  if ((v93 & 0xC000000000000001) != 0) {
    v71 = (id)sub_37128();
  }
  else {
    v71 = *(id *)(v93 + 40);
  }
  v72 = v71;
  if (qword_47CA0 != -1) {
    swift_once();
  }
  [v72 setFont:qword_49530];
  v73 = [v22 grayColor];
  [v72 setTextColor:v73];
  swift_bridgeObjectRelease();

  v74 = *(void **)&v16[v86];
  v75 = *(void **)&v16[v91];
  v76 = *(void **)&v16[v90];
  v77 = *(void **)&v16[v89];
  v78 = *(void **)&v16[v60];
  v79 = *(id *)&v16[v88];
  v80 = v74;
  v81 = v75;
  v82 = v76;
  v83 = v77;
  v84 = v78;
  [v16 addSubview:v79];
  [v16 addSubview:v80];
  [v16 addSubview:v81];
  [v16 addSubview:v82];
  [v16 addSubview:v83];
  [v16 addSubview:v84];

  return v16;
}

void sub_5498()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36B58();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  __chkstk_darwin(v2);
  uint64_t v43 = (uint64_t)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  v46 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(v0
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel);
  v10 = self;
  id v11 = [v10 grayColor];
  id v49 = v9;
  [v9 setTextColor:v11];

  v12 = *(void **)(v1
                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel);
  id v13 = [v10 grayColor];
  id v50 = v12;
  [v12 setTextColor:v13];

  v14 = *(void **)(v1
                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel);
  id v15 = [v10 grayColor];
  [v14 setTextColor:v15];

  v16 = *(void **)(v1
                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel);
  id v17 = [v10 whiteColor];
  [v16 setTextColor:v17];

  if (qword_47BD0 != -1) {
    swift_once();
  }
  id v18 = objc_retain(*(id *)(*(void *)(qword_49428
                                      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                          + 16));
  sub_36A68();

  NSString v19 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v14 setText:v19];

  uint64_t v20 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_metrics;
  swift_beginAccess();
  sub_65F0(v20, (uint64_t)v8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v22 = type metadata accessor for DepthComplicationMetrics;
LABEL_11:
      sub_6980((uint64_t)v8, v22);
      return;
    }
  }
  else if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v8, 1, v48) != 1)
  {
    sub_6810((uint64_t)v8, (uint64_t)v46);
    [v16 setHidden:0];
    swift_retain();
    uint64_t v31 = v43;
    sub_AD50(v43);
    uint64_t v32 = v45;
    v51[3] = v45;
    v51[4] = sub_6874();
    v33 = sub_68CC(v51);
    uint64_t v34 = v44;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v44 + 16))(v33, v31, v32);
    sub_36A98();
    sub_6930((uint64_t)v51);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v31, v32);
    NSString v35 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v49 setText:v35];

    v8 = v46;
    id v36 = objc_retain(*(id *)(*(void *)(qword_49428
                                        + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                            + 16));
    sub_36AE8();

    NSString v37 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v16 setText:v37];

    id v38 = objc_retain(*(id *)(*(void *)(qword_49428
                                        + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                            + 16));
    sub_36AD8();

    NSString v39 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v50 setText:v39];

    v40 = *(void **)(v1
                   + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel);
    id v41 = objc_retain(*(id *)(*(void *)(qword_49428
                                        + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                            + 16));
    sub_36AC8();

    NSString v42 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v40 setText:v42];

    v22 = type metadata accessor for HistoricalDepthMetrics;
    goto LABEL_11;
  }
  [v16 setHidden:1];
  NSString v23 = sub_36DC8();
  [v49 setText:v23];

  NSString v24 = sub_36DC8();
  [v50 setText:v24];

  v25 = *(void **)(v1
                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel);
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v26 = (id)qword_49468;
  NSString v27 = sub_36DC8();
  NSString v28 = sub_36DC8();
  id v29 = [v26 localizedStringForKey:v27 value:0 table:v28];

  sub_36DD8();
  NSString v30 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v25 setText:v30];
}

id sub_5BDC()
{
  [v0 bounds];
  double v1 = CGRectGetWidth(v48) * 0.4;
  double v2 = v1 + 2.0;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel];
  [v3 intrinsicContentSize];
  v49.size.width = v4;
  double v6 = v5;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.height = v6;
  double Width = CGRectGetWidth(v49);
  if (v1 >= Width) {
    double v8 = Width;
  }
  else {
    double v8 = v1;
  }
  v9 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel];
  [v9 intrinsicContentSize];
  v50.size.width = v10;
  double v12 = v11;
  v50.origin.y = 0.0;
  v50.origin.x = v1 + 2.0;
  v50.size.height = v12;
  double v13 = CGRectGetWidth(v50);
  [v0 bounds];
  double v14 = CGRectGetWidth(v51) - v2;
  if (v14 < v13) {
    double v13 = v14;
  }
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v8, v6);
  objc_msgSend(v9, "setFrame:", v1 + 2.0, 0.0, v13, v12);
  id v15 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel];
  [v15 intrinsicContentSize];
  CGFloat v17 = v16;
  double v19 = v18;
  [v0 bounds];
  double Height = CGRectGetHeight(v52);
  v53.origin.x = 0.0;
  v53.origin.y = 0.0;
  v53.size.width = v17;
  v53.size.height = v19;
  double v21 = Height - CGRectGetHeight(v53);
  v54.origin.x = 0.0;
  v54.origin.y = v21;
  v54.size.width = v17;
  v54.size.height = v19;
  double v22 = CGRectGetWidth(v54);
  if (v1 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v1;
  }
  NSString v24 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel];
  [v24 intrinsicContentSize];
  CGFloat v26 = v25;
  double v28 = v27;
  [v0 bounds];
  double v29 = CGRectGetHeight(v55);
  v56.origin.x = 0.0;
  v56.origin.y = 0.0;
  v56.size.width = v26;
  v56.size.height = v28;
  double v30 = v29 - CGRectGetHeight(v56);
  v57.origin.x = v2;
  v57.origin.y = v30;
  v57.size.width = v26;
  v57.size.height = v28;
  double v31 = CGRectGetWidth(v57);
  [v0 bounds];
  double v32 = CGRectGetWidth(v58) - v2;
  if (v32 < v31) {
    double v31 = v32;
  }
  objc_msgSend(v15, "setFrame:", 0.0, v21, v23, v19);
  objc_msgSend(v24, "setFrame:", v2, v30, v31, v28);
  v33 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel];
  [v33 intrinsicContentSize];
  double v35 = v34;
  double v37 = v36;
  [v0 bounds];
  CGFloat v38 = CGRectGetHeight(v59) * 0.5;
  v60.origin.x = 0.0;
  v60.origin.y = 0.0;
  v60.size.width = v35;
  v60.size.height = v37;
  double v39 = v38 - CGRectGetHeight(v60) * 0.5;
  v40 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel];
  [v40 intrinsicContentSize];
  v61.size.width = v41;
  double v43 = v42;
  v61.origin.x = v2;
  v61.origin.y = v39;
  v61.size.height = v43;
  double v44 = CGRectGetWidth(v61);
  [v0 bounds];
  double v45 = CGRectGetWidth(v62) - v2;
  if (v45 < v44) {
    double v44 = v45;
  }
  objc_msgSend(v33, "setFrame:", 0.0, v39, v35, v37);

  return objc_msgSend(v40, "setFrame:", v2, v39, v44, v43);
}

uint64_t sub_5F68()
{
  sub_66B8(&qword_47D58);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_37EF0;
  *(void *)(v1 + 32) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel) layer];
  *(void *)(v1 + 40) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel) layer];
  *(void *)(v1 + 48) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel) layer];
  *(void *)(v1 + 56) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel) layer];
  sub_36EA8();
  return v1;
}

uint64_t sub_6050()
{
  sub_66B8(&qword_47D58);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_37F00;
  *(void *)(v1 + 32) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel) layer];
  *(void *)(v1 + 40) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel) layer];
  sub_36EA8();
  return v1;
}

void *sub_60F8()
{
  unint64_t v1 = sub_5F68();
  sub_15188(v1);
  id v2 = [*(id *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel) layer];
  id v3 = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel) layer];
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_371E8();
    BOOL v9 = __OFADD__(v8, 2);
    uint64_t v5 = v8 + 2;
    if (!v9)
    {
LABEL_3:
      sub_6750(v5);
      sub_36EA8();
      id v2 = v2;
      sub_36E78();
      if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) < *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    uint64_t v5 = v4 + 2;
    if (!__OFADD__(v4, 2)) {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_10:
  sub_36EB8();
LABEL_4:
  sub_36EC8();
  sub_36EA8();
  id v6 = v3;
  sub_36E78();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_36EB8();
  }
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return &_swiftEmptyArrayStorage;
}

id sub_62EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthRectangularSimpleHistoryView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_63E8()
{
  return type metadata accessor for DepthRectangularSimpleHistoryView();
}

uint64_t type metadata accessor for DepthRectangularSimpleHistoryView()
{
  uint64_t result = qword_47D48;
  if (!qword_47D48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_643C()
{
  uint64_t result = type metadata accessor for DepthComplicationMetrics(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_64F0(uint64_t a1, char a2)
{
  uint64_t v5 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65F0(a1, (uint64_t)v7);
  uint64_t v8 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_metrics];
  swift_beginAccess();
  sub_6654((uint64_t)v7, v8);
  swift_endAccess();
  v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_alwaysOn] = a2;
  sub_5498();
  [v2 setNeedsLayout];
  return [v2 layoutIfNeeded];
}

void *sub_65D8()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_65F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DepthComplicationMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DepthComplicationMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_66B8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_66FC()
{
  unint64_t result = qword_47D60;
  if (!qword_47D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_47D60);
  }
  return result;
}

uint64_t sub_6750(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_371E8();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_37138();
    *unint64_t v1 = result;
  }
  return result;
}

uint64_t sub_6810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HistoricalDepthMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_6874()
{
  unint64_t result = qword_47DD0;
  if (!qword_47DD0)
  {
    sub_36B58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_47DD0);
  }
  return result;
}

uint64_t *sub_68CC(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_6930(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6980(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_69E0()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthLabel;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthValueLabel;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_depthUnitLabel;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_numberOfDivesLabel;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v5 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeUnitLabel;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_timeValueLabel;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)UILabel) init];
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion33DepthRectangularSimpleHistoryView_alwaysOn] = 0;

  sub_371D8();
  __break(1u);
}

__n128 initializeWithTake for ActiveView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_6B38(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6B58(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for Bar(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_6BDC(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_6BE8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_6C08(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_6C5C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_6CAC()
{
  type metadata accessor for TimelineDataProvider();
  swift_allocObject();
  uint64_t result = sub_6CEC();
  qword_49428 = result;
  return result;
}

uint64_t sub_6CEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_366B8();
  uint64_t v73 = *(void *)(v2 - 8);
  uint64_t v74 = v2;
  __chkstk_darwin(v2);
  v72 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_36C78();
  v76 = *(void (**)(char *, uint64_t))(v78 - 8);
  __chkstk_darwin(v78);
  v77 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v5 = __chkstk_darwin(v70);
  uint64_t v71 = (uint64_t)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v75 = (char *)&v60 - v7;
  uint64_t v8 = sub_36D38();
  uint64_t v68 = *(void *)(v8 - 8);
  uint64_t v69 = v8;
  __chkstk_darwin(v8);
  v67 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36B88();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  double v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, "fiui_sharedHealthStoreForCarousel");
  if (!v14)
  {
    __break(1u);
    goto LABEL_8;
  }
  CGRect v60 = (char *)OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_healthStore;
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_healthStore) = v14;
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_subscriptions) = &_swiftEmptySetSingleton;
  uint64_t v15 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_temperatureSubject;
  uint64_t v65 = v11;
  double v16 = *(void (**)(void))(v11 + 104);
  unsigned int v62 = enum case for Temperature.unknown(_:);
  uint64_t v66 = v10;
  uint64_t v63 = v11 + 104;
  CGRect v61 = (void (*)(char *, void, uint64_t))v16;
  v16(v13);
  sub_66B8(&qword_480C0);
  swift_allocObject();
  v64 = v13;
  *(void *)(v1 + v15) = sub_36768();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged) = 0;
  uint64_t v80 = 37;
  unint64_t v81 = 0xE100000000000000;
  v82._countAndFlagsBits = sub_372D8();
  sub_36E48(v82);
  swift_bridgeObjectRelease();
  CGFloat v17 = (void *)sub_36918();
  id v18 = objc_allocWithZone((Class)HKObserverSet);
  NSString v19 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v20 = [v18 initWithName:v19 loggingCategory:v17];

  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_depthSubscribers) = v20;
  uint64_t v80 = 37;
  unint64_t v81 = 0xE100000000000000;
  v83._countAndFlagsBits = sub_372D8();
  sub_36E48(v83);
  swift_bridgeObjectRelease();
  double v21 = (void *)sub_36918();
  id v22 = objc_allocWithZone((Class)HKObserverSet);
  NSString v23 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v24 = [v22 initWithName:v23 loggingCategory:v21];

  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_temperatureSubscribers) = v24;
  id v25 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v26 = sub_36DC8();
  id v27 = [v25 initWithSuiteName:v26];

  if (!v27)
  {
LABEL_8:
    uint64_t result = sub_371D8();
    __break(1u);
    return result;
  }
  double v28 = *(void **)&v60[v1];
  type metadata accessor for HealthKitSettingsStore();
  swift_allocObject();
  id v29 = v28;
  id v30 = v27;
  double v31 = (void *)sub_2181C(v29, v30);

  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_healthKitSettingsStore) = v31;
  double v32 = (void *)v31[10];
  v33 = (void *)v31[11];
  double v34 = (void *)v31[12];
  type metadata accessor for SettingsStore();
  swift_allocObject();
  double v35 = (char *)v30;
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settingsStore) = sub_33ED4(v35, v33, v32, v34);
  swift_retain();
  uint64_t v36 = (uint64_t)v67;
  sub_36748();
  swift_release();
  uint64_t v37 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  uint64_t v39 = v68;
  uint64_t v38 = v69;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 32))(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings, v36, v69);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v36, v37, v38);
  type metadata accessor for ComplicationFormatter();
  swift_allocObject();
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter) = sub_2D164(v36);
  swift_beginAccess();
  v40 = v77;
  sub_36D08();
  LOBYTE(v38) = sub_36C58();
  CGFloat v41 = (void (*)(char *, uint64_t))*((void *)v76 + 1);
  v41(v40, v78);
  swift_endAccess();
  CGRect v60 = v35;
  v76 = v41;
  if (v38)
  {
    uint64_t v42 = enum case for WaterDepth.unknown(_:);
    uint64_t v43 = sub_36858();
    uint64_t v44 = (uint64_t)v75;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v75, v42, v43);
    uint64_t v45 = v44 + *(int *)(type metadata accessor for LiveMetrics(0) + 20);
    uint64_t v46 = enum case for UnderwaterTime.zero(_:);
    uint64_t v47 = sub_36C38();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v45, v46, v47);
  }
  else
  {
    uint64_t v44 = (uint64_t)v75;
  }
  uint64_t v48 = v74;
  swift_storeEnumTagMultiPayload();
  uint64_t v49 = v71;
  sub_65F0(v44, v71);
  CGRect v50 = v72;
  sub_366A8();
  CGRect v51 = (objc_class *)type metadata accessor for DepthTimelineEntryModel(0);
  CGRect v52 = objc_allocWithZone(v51);
  uint64_t v53 = v73;
  (*(void (**)(unsigned char *, char *, uint64_t))(v73 + 16))(&v52[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate], v50, v48);
  v52[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_alwaysOn] = 0;
  sub_65F0(v49, (uint64_t)&v52[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics]);
  v79.receiver = v52;
  v79.super_class = v51;
  id v54 = objc_msgSendSuper2(&v79, "init");
  sub_AACC(v49);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v48);
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentDepthModel) = v54;
  uint64_t v55 = (uint64_t)v64;
  uint64_t v56 = v66;
  v61(v64, v62, v66);
  swift_beginAccess();
  CGRect v57 = v77;
  sub_36D08();
  LOBYTE(v54) = sub_36C58();
  v76(v57, v78);
  swift_endAccess();
  id v58 = sub_1DED0(v55, (v54 & 1) == 0, 0);
  (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v55, v56);
  *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentTemperatureModel) = v58;
  sub_76EC();

  sub_AACC(v44);
  return v1;
}

uint64_t sub_768C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_76EC()
{
  return swift_release();
}

uint64_t sub_77E4(uint64_t a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_9D4C(a1);
    return swift_release();
  }
  return result;
}

void sub_7844(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = a2;
  uint64_t v100 = a1;
  uint64_t v2 = sub_366B8();
  uint64_t v96 = *(void *)(v2 - 8);
  uint64_t v97 = v2;
  __chkstk_darwin(v2);
  v95 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_36C78();
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  v92 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_36D38();
  uint64_t v90 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  v88 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_36718();
  uint64_t v101 = *(void *)(v6 - 8);
  uint64_t v102 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  v99 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v87 = (char *)&v78 - v9;
  uint64_t v10 = sub_66B8(&qword_483A0);
  __chkstk_darwin(v10 - 8);
  v84 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_36B28();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v82 = (uint64_t)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_36858();
  uint64_t v81 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v80 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v15 = __chkstk_darwin(v14);
  CGFloat v17 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  id v20 = (char *)&v78 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v89 = (uint64_t)&v78 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  id v25 = (char *)&v78 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  double v28 = (char *)&v78 - v27;
  __chkstk_darwin(v26);
  id v30 = (char *)&v78 - v29;
  uint64_t v31 = sub_367C8();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  double v34 = (uint64_t *)((char *)&v78 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_AB28(0, &qword_480C8);
  *double v34 = sub_36F98();
  (*(void (**)(uint64_t *, void, uint64_t))(v32 + 104))(v34, enum case for DispatchPredicate.onQueue(_:), v31);
  char v35 = sub_367D8();
  (*(void (**)(uint64_t *, uint64_t))(v32 + 8))(v34, v31);
  if ((v35 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x8618);
  }
  uint64_t v36 = v100;
  sub_65F0(v100, (uint64_t)v30);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_AACC((uint64_t)v30);
  uint64_t v98 = v14;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v38 = v103;
    char v39 = *(unsigned char *)(v103 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged);
    sub_65F0(v36, (uint64_t)v28);
    if (v39)
    {
      sub_AACC((uint64_t)v28);
      goto LABEL_10;
    }
  }
  else
  {
    sub_65F0(v36, (uint64_t)v28);
    uint64_t v38 = v103;
  }
  sub_65F0((uint64_t)v28, (uint64_t)v25);
  int v40 = swift_getEnumCaseMultiPayload();
  sub_AACC((uint64_t)v25);
  sub_AACC((uint64_t)v28);
  if (v40
    || (*(unsigned char *)(v38 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged) & 1) != 0)
  {
    CGFloat v41 = v99;
    sub_368F8();
    sub_65F0(v36, (uint64_t)v20);
    swift_retain();
    uint64_t v42 = sub_36708();
    os_log_type_t v43 = sub_36F38();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 67109376;
      sub_65F0((uint64_t)v20, (uint64_t)v17);
      BOOL v45 = swift_getEnumCaseMultiPayload() == 1;
      sub_AACC((uint64_t)v17);
      sub_AACC((uint64_t)v20);
      LODWORD(aBlock[0]) = v45;
      sub_37038();
      *(_WORD *)(v44 + 8) = 1024;
      LODWORD(aBlock[0]) = *(unsigned __int8 *)(v38
                                              + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged);
      sub_37038();
      swift_release();
      _os_log_impl(&dword_0, v42, v43, "TimelineDataProvider: Not updating depth model with sensor due to mismatching isHistorical=%{BOOL}d and isSubmerged=%{BOOL}d", (uint8_t *)v44, 0xEu);
      swift_slowDealloc();
    }
    else
    {
      sub_AACC((uint64_t)v20);

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v101 + 8))(v41, v102);
    return;
  }
LABEL_10:
  swift_retain();
  uint64_t v46 = v80;
  sub_B134(v80);
  uint64_t v47 = v82;
  sub_B42C(v82);
  uint64_t v48 = v85;
  uint64_t v49 = (uint64_t)v84;
  uint64_t v50 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v84, v47, v86);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v49, 0, 1, v50);
  uint64_t v103 = sub_36A88();
  unint64_t v52 = v51;
  sub_ABEC(v49);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v50);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v46, v83);
  uint64_t v53 = v87;
  sub_368F8();
  swift_bridgeObjectRetain();
  id v54 = sub_36708();
  os_log_type_t v55 = sub_36F48();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 136380931;
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_328C0(v103, v52, aBlock);
    sub_37038();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v56 + 12) = 2080;
    unint64_t v57 = 0x8000000000038C50;
    uint64_t v58 = 0xD000000000000013;
    switch((char)v79)
    {
      case 1:
        unint64_t v57 = 0xE700000000000000;
        uint64_t v58 = 0x73726F736E6573;
        break;
      case 2:
        unint64_t v57 = 0xE900000000000074;
        uint64_t v58 = 0x694B68746C616548;
        break;
      case 3:
        unint64_t v57 = 0xE800000000000000;
        uint64_t v58 = 0x656469727265766FLL;
        break;
      case 4:
        break;
      case 5:
        unint64_t v57 = 0xE700000000000000;
        uint64_t v58 = 0x64676E69766964;
        break;
      default:
        unint64_t v57 = 0xE400000000000000;
        uint64_t v58 = 1701736302;
        break;
    }
    uint64_t v107 = sub_328C0(v58, v57, aBlock);
    sub_37038();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v54, v55, "TimelineDataProvider: Received depth update: %{private}s (%s)", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v101 + 8))(v53, v102);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v101 + 8))(v53, v102);
  }
  uint64_t v59 = v38 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  uint64_t v60 = v90;
  CGRect v61 = v88;
  uint64_t v62 = v59;
  uint64_t v63 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v88, v62, v91);
  v64 = v92;
  sub_36D08();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v63);
  LOBYTE(v63) = sub_36C58();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v64, v94);
  uint64_t v65 = v96;
  uint64_t v66 = v89;
  if (v63)
  {
    sub_65F0(v36, v89);
    v67 = v95;
    sub_366A8();
    uint64_t v68 = (objc_class *)type metadata accessor for DepthTimelineEntryModel(0);
    uint64_t v69 = objc_allocWithZone(v68);
    uint64_t v70 = v97;
    (*(void (**)(unsigned char *, char *, uint64_t))(v65 + 16))(&v69[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate], v67, v97);
    v69[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_alwaysOn] = 0;
    sub_65F0(v66, (uint64_t)&v69[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics]);
    v104.receiver = v69;
    v104.super_class = v68;
    id v71 = objc_msgSendSuper2(&v104, "init");
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    v67 = v95;
    sub_366A8();
    v72 = (objc_class *)type metadata accessor for DepthTimelineEntryModel(0);
    uint64_t v73 = objc_allocWithZone(v72);
    uint64_t v70 = v97;
    (*(void (**)(unsigned char *, char *, uint64_t))(v65 + 16))(&v73[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate], v67, v97);
    v73[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_alwaysOn] = 0;
    sub_65F0(v66, (uint64_t)&v73[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics]);
    v106.receiver = v73;
    v106.super_class = v72;
    id v71 = objc_msgSendSuper2(&v106, "init");
  }
  id v74 = v71;
  sub_AACC(v66);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v70);
  v75 = *(void **)(v38 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentDepthModel);
  *(void *)(v38 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentDepthModel) = v74;

  v76 = *(void **)(v38 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_depthSubscribers);
  aBlock[4] = (uint64_t)sub_AC4C;
  aBlock[5] = v38;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_768C;
  aBlock[3] = (uint64_t)&unk_41468;
  v77 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v76 notifyObservers:v77];
  _Block_release(v77);
}

uint64_t sub_8630(uint64_t a1, int a2)
{
  uint64_t v143 = sub_36C78();
  uint64_t v142 = *(void *)(v143 - 8);
  __chkstk_darwin(v143);
  v141 = (char *)&v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_36D38();
  uint64_t v139 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  v138 = (char *)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_36D68();
  uint64_t v128 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  v127 = (char *)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_36BE8();
  uint64_t v125 = *(void *)(v126 - 8);
  __chkstk_darwin(v126);
  v124 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_66B8(&qword_480D0);
  uint64_t v131 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  v129 = (char *)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_36CB8();
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v136 = (char *)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_36718();
  uint64_t v145 = *(void *)(v144 - 8);
  uint64_t v10 = __chkstk_darwin(v144);
  v123 = (char *)&v116 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v116 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  v135 = (char *)&v116 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v116 - v17;
  uint64_t v19 = sub_36B88();
  uint64_t v148 = *(void *)(v19 - 8);
  uint64_t v20 = __chkstk_darwin(v19);
  v122 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v147 = (uint64_t)&v116 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v116 - v25;
  __chkstk_darwin(v24);
  v137 = (char *)&v116 - v27;
  uint64_t v28 = sub_367C8();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v31 = (uint64_t *)((char *)&v116 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_AB28(0, &qword_480C8);
  *uint64_t v31 = sub_36F98();
  (*(void (**)(uint64_t *, void, uint64_t))(v29 + 104))(v31, enum case for DispatchPredicate.onQueue(_:), v28);
  char v32 = sub_367D8();
  (*(void (**)(uint64_t *, uint64_t))(v29 + 8))(v31, v28);
  if ((v32 & 1) == 0)
  {
    __break(1u);
    goto LABEL_55;
  }
  if (!(_BYTE)a2)
  {
    uint64_t v120 = 0;
    uint64_t v49 = v146;
    uint64_t v34 = v148;
    uint64_t v50 = v137;
LABEL_22:
    uint64_t v65 = enum case for Temperature.unknown(_:);
    uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 104);
    v66(v147, enum case for Temperature.unknown(_:), v19);
    char v157 = 0;
    v66((uint64_t)v50, v65, v19);
    sub_AB64();
    unsigned __int8 v67 = sub_36DB8();
    uint64_t v68 = *(char **)(v34 + 8);
    v137 = (char *)(v34 + 8);
    v135 = v68;
    ((void (*)(char *, uint64_t))v68)(v50, v19);
    int v69 = v67 & (v157 == 0);
    if (v69) {
      goto LABEL_26;
    }
    uint64_t v70 = v49 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    id v71 = v14;
    uint64_t v72 = v139;
    uint64_t v73 = v138;
    uint64_t v74 = v70;
    uint64_t v75 = v140;
    (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v138, v74, v140);
    v76 = v141;
    sub_36D08();
    uint64_t v77 = v72;
    uint64_t v14 = v71;
    uint64_t v78 = v148;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v73, v75);
    LOBYTE(v75) = sub_36C58();
    (*(void (**)(char *, uint64_t))(v142 + 8))(v76, v143);
    if ((v75 & 1) == 0)
    {
LABEL_26:
      sub_368F8();
      v92 = sub_36708();
      os_log_type_t v93 = sub_36F48();
      if (os_log_type_enabled(v92, v93))
      {
        uint64_t v94 = (uint8_t *)swift_slowAlloc();
        uint64_t v95 = swift_slowAlloc();
        *(_DWORD *)uint64_t v94 = 136315138;
        uint64_t aBlock = v95;
        if (v69) {
          uint64_t v96 = 1701602409;
        }
        else {
          uint64_t v96 = 0x616C696176616E75;
        }
        if (v69) {
          unint64_t v97 = 0xE400000000000000;
        }
        else {
          unint64_t v97 = 0xEB00000000656C62;
        }
        uint64_t v155 = sub_328C0(v96, v97, &aBlock);
        sub_37038();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v92, v93, "TimelineDataProvider: Updating water temperature model (%s)", v94, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v145 + 8))(v14, v144);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v145 + 8))(v14, v144);
      }
LABEL_46:
      swift_beginAccess();
      BOOL v105 = v157 == 2 || v157 == 4;
      uint64_t v106 = v49 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
      swift_beginAccess();
      uint64_t v107 = v139;
      v108 = v138;
      uint64_t v109 = v140;
      (*(void (**)(char *, uint64_t, uint64_t))(v139 + 16))(v138, v106, v140);
      v110 = v141;
      sub_36D08();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v108, v109);
      LOBYTE(v106) = sub_36C58();
      (*(void (**)(char *, uint64_t))(v142 + 8))(v110, v143);
      uint64_t v111 = v147;
      id v112 = sub_1DED0(v147, (v106 & 1) == 0, v105);
      v113 = *(void **)(v49
                      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentTemperatureModel);
      *(void *)(v49 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentTemperatureModel) = v112;

      v114 = *(void **)(v49
                      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_temperatureSubscribers);
      v153 = sub_ABBC;
      uint64_t v154 = v49;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      uint64_t v150 = 1107296256;
      v151 = sub_768C;
      v152 = &unk_41440;
      v115 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      [v114 notifyObservers:v115];
      _Block_release(v115);
      return ((uint64_t (*)(uint64_t, uint64_t))v135)(v111, v19);
    }
    uint64_t v79 = *(void *)(v49 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
    uint64_t v80 = v122;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v122, v147, v19);
    int v81 = (*(uint64_t (**)(char *, uint64_t))(v78 + 88))(v80, v19);
    if (v81 == enum case for Temperature.temperature(_:))
    {
      (*(void (**)(char *, uint64_t))(v78 + 96))(v80, v19);
      (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v136, v80, v134);
      v122 = (char *)(v79 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings);
      swift_retain();
      uint64_t v82 = v124;
      uint64_t v148 = v79;
      sub_36CE8();
      uint64_t v83 = v127;
      sub_36B98();
      uint64_t v125 = *(void *)(v125 + 8);
      uint64_t v84 = v126;
      ((void (*)(char *, uint64_t))v125)(v82, v126);
      sub_36CA8();
      uint64_t v85 = *(void (**)(char *, uint64_t))(v128 + 8);
      uint64_t v86 = v130;
      v85(v83, v130);
      sub_36CE8();
      sub_36B98();
      ((void (*)(char *, uint64_t))v125)(v82, v84);
      sub_36D58();
      v85(v83, v86);
      sub_AB28(0, &qword_480D8);
      v87 = v129;
      sub_365D8();
      uint64_t v88 = v148;
      uint64_t aBlock = sub_36FD8();
      uint64_t v150 = v89;
      swift_retain();
      sub_1E168(&aBlock, v88);
      swift_release();
      uint64_t v90 = aBlock;
      unint64_t v91 = v150;
      (*(void (**)(char *, uint64_t))(v131 + 8))(v87, v132);
      (*(void (**)(char *, uint64_t))(v133 + 8))(v136, v134);
      swift_release();
      goto LABEL_37;
    }
    if (v81 == v65)
    {
      unint64_t v91 = 0xE200000000000000;
      uint64_t v90 = 11565;
LABEL_37:
      uint64_t v98 = v123;
      sub_368F8();
      swift_bridgeObjectRetain();
      v99 = sub_36708();
      os_log_type_t v100 = sub_36F48();
      if (os_log_type_enabled(v99, v100))
      {
        uint64_t v101 = 0xD000000000000013;
        uint64_t v102 = swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v102 = 136380931;
        swift_bridgeObjectRetain();
        uint64_t v155 = sub_328C0(v90, v91, &aBlock);
        sub_37038();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v102 + 12) = 2080;
        swift_beginAccess();
        unint64_t v103 = 0x8000000000038C50;
        uint64_t v49 = v146;
        switch(v157)
        {
          case 1:
            unint64_t v103 = 0xE700000000000000;
            uint64_t v101 = 0x73726F736E6573;
            break;
          case 2:
            unint64_t v103 = 0xE900000000000074;
            uint64_t v101 = 0x694B68746C616548;
            break;
          case 3:
            unint64_t v103 = 0xE800000000000000;
            uint64_t v101 = 0x656469727265766FLL;
            break;
          case 4:
            break;
          case 5:
            unint64_t v103 = 0xE700000000000000;
            uint64_t v101 = 0x64676E69766964;
            break;
          default:
            unint64_t v103 = 0xE400000000000000;
            uint64_t v101 = 1701736302;
            break;
        }
        uint64_t v155 = sub_328C0(v101, v103, &aBlock);
        sub_37038();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v99, v100, "TimelineDataProvider: Updating water temperature model with %{private}s (%s)", (uint8_t *)v102, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v145 + 8))(v123, v144);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v145 + 8))(v98, v144);
      }
      goto LABEL_46;
    }
LABEL_56:
    swift_retain();
    sub_37258();
    __break(1u);
    JUMPOUT(0x9D20);
  }
  if (a2 != 1
    || (*(unsigned char *)(v146 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged) & 1) != 0)
  {
    uint64_t v33 = *(void *)(v146 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
    uint64_t v34 = v148;
    (*(void (**)(char *, uint64_t, uint64_t))(v148 + 16))(v26, a1, v19);
    int v35 = (*(uint64_t (**)(char *, uint64_t))(v34 + 88))(v26, v19);
    uint64_t v121 = v19;
    int v119 = a2;
    if (v35 == enum case for Temperature.temperature(_:))
    {
      (*(void (**)(char *, uint64_t))(v34 + 96))(v26, v19);
      (*(void (**)(char *, char *, uint64_t))(v133 + 32))(v136, v26, v134);
      swift_retain();
      uint64_t v36 = v124;
      uint64_t v117 = v33;
      sub_36CE8();
      uint64_t v37 = v127;
      sub_36B98();
      uint64_t v38 = *(void (**)(char *, uint64_t))(v125 + 8);
      v118 = v14;
      uint64_t v39 = v126;
      v38(v36, v126);
      sub_36CA8();
      int v40 = *(void (**)(char *, uint64_t))(v128 + 8);
      uint64_t v41 = v130;
      v40(v37, v130);
      sub_36CE8();
      sub_36B98();
      uint64_t v42 = v36;
      uint64_t v34 = v148;
      uint64_t v43 = v39;
      uint64_t v14 = v118;
      v38(v42, v43);
      sub_36D58();
      v40(v37, v41);
      sub_AB28(0, &qword_480D8);
      uint64_t v44 = v129;
      sub_365D8();
      uint64_t v45 = v117;
      uint64_t aBlock = sub_36FD8();
      uint64_t v150 = v46;
      swift_retain();
      sub_1E168(&aBlock, v45);
      uint64_t v120 = 0;
      swift_release();
      uint64_t v47 = aBlock;
      unint64_t v48 = v150;
      (*(void (**)(char *, uint64_t))(v131 + 8))(v44, v132);
      (*(void (**)(char *, uint64_t))(v133 + 8))(v136, v134);
      swift_release();
      goto LABEL_10;
    }
    if (v35 == enum case for Temperature.unknown(_:))
    {
      uint64_t v120 = 0;
      unint64_t v48 = 0xE200000000000000;
      uint64_t v47 = 11565;
LABEL_10:
      unint64_t v51 = v135;
      sub_368F8();
      swift_bridgeObjectRetain();
      unint64_t v52 = sub_36708();
      os_log_type_t v53 = sub_36F48();
      BOOL v54 = os_log_type_enabled(v52, v53);
      uint64_t v50 = v137;
      if (v54)
      {
        uint64_t v55 = swift_slowAlloc();
        uint64_t aBlock = swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = 136380931;
        swift_bridgeObjectRetain();
        uint64_t v156 = sub_328C0(v47, v48, &aBlock);
        sub_37038();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v55 + 12) = 2080;
        unint64_t v56 = 0x8000000000038C50;
        uint64_t v19 = v121;
        uint64_t v49 = v146;
        uint64_t v57 = 0xD000000000000013;
        switch((char)v119)
        {
          case 2:
            unint64_t v56 = 0xE900000000000074;
            uint64_t v57 = 0x694B68746C616548;
            break;
          case 3:
            unint64_t v56 = 0xE800000000000000;
            uint64_t v57 = 0x656469727265766FLL;
            break;
          case 4:
            break;
          case 5:
            unint64_t v56 = 0xE700000000000000;
            uint64_t v57 = 0x64676E69766964;
            break;
          default:
            unint64_t v56 = 0xE700000000000000;
            uint64_t v57 = 0x73726F736E6573;
            break;
        }
        uint64_t v156 = sub_328C0(v57, v56, &aBlock);
        sub_37038();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v52, v53, "TimelineDataProvider: Received water temperature update: %{private}s (%s)", (uint8_t *)v55, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v145 + 8))(v135, v144);
        uint64_t v34 = v148;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v145 + 8))(v51, v144);
        uint64_t v49 = v146;
        uint64_t v19 = v121;
      }
      goto LABEL_22;
    }
LABEL_55:
    swift_retain();
    sub_37258();
    __break(1u);
    goto LABEL_56;
  }
  uint64_t v58 = v148;
  uint64_t v59 = v137;
  (*(void (**)(char *, void, uint64_t))(v148 + 104))(v137, enum case for Temperature.unknown(_:), v19);
  sub_AB64();
  char v60 = sub_36DB8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v59, v19);
  if ((v60 & 1) == 0)
  {
    sub_368F8();
    uint64_t v62 = sub_36708();
    os_log_type_t v63 = sub_36F38();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_0, v62, v63, "TimelineDataProvider: Not updating water temperature model with sensor value since we are not currently submerged.", v64, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v145 + 8))(v18, v144);
  }
  return result;
}

uint64_t sub_9D4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_36B88();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v31);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36D38();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_367C8();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_AB28(0, &qword_480C8);
  *uint64_t v15 = sub_36F98();
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  char v16 = sub_367D8();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    uint64_t v18 = v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v18, v30, v8);
    swift_endAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
    type metadata accessor for ComplicationFormatter();
    swift_allocObject();
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter) = sub_2D164((uint64_t)v11);
    swift_release();
    sub_A260();
    if (*(unsigned char *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_isSubmerged) == 1)
    {
      uint64_t v19 = enum case for WaterDepth.unknown(_:);
      uint64_t v20 = sub_36858();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v7, v19, v20);
      uint64_t v21 = &v7[*(int *)(type metadata accessor for LiveMetrics(0) + 20)];
      uint64_t v22 = enum case for UnderwaterTime.zero(_:);
      uint64_t v23 = sub_36C38();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104))(v21, v22, v23);
      swift_storeEnumTagMultiPayload();
      sub_7844((uint64_t)v7, 0);
      sub_AACC((uint64_t)v7);
      uint64_t v24 = enum case for Temperature.unknown(_:);
      uint64_t v26 = v32;
      uint64_t v25 = v33;
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 104);
      v27(v5, enum case for Temperature.unknown(_:), v33);
      sub_8630((uint64_t)v5, 0);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v25);
    }
    else
    {
      uint64_t v28 = type metadata accessor for HistoricalDepthMetrics(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v7, 1, 1, v28);
      swift_storeEnumTagMultiPayload();
      sub_7844((uint64_t)v7, 2);
      sub_AACC((uint64_t)v7);
      uint64_t v24 = enum case for Temperature.unknown(_:);
      uint64_t v26 = v32;
      uint64_t v25 = v33;
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v32 + 104);
    }
    v27(v5, v24, v25);
    sub_8630((uint64_t)v5, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v5, v25);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_A260()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36C78();
  uint64_t v47 = *(void *)(v2 - 8);
  uint64_t v48 = v2;
  __chkstk_darwin(v2);
  uint64_t v46 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36BE8();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36D38();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v49 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36718();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  os_log_type_t v53 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v39 - v14;
  sub_368F8();
  swift_retain_n();
  char v16 = sub_36708();
  os_log_type_t v17 = sub_36F48();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v50 = v10;
  uint64_t v52 = v11;
  uint64_t v44 = v8;
  uint64_t v45 = v7;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v51 = v0;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v41 = swift_slowAlloc();
    v55[0] = v41;
    int v40 = v20;
    *(_DWORD *)uint64_t v20 = 136315138;
    v39[1] = v20 + 4;
    uint64_t v21 = v51 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    uint64_t v22 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v49, v21, v7);
    sub_36CE8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
    uint64_t v23 = sub_36BC8();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v6, v43);
    uint64_t v54 = sub_328C0(v23, v25, v55);
    sub_37038();
    swift_release_n();
    uint64_t v10 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v16, v17, "TimelineDataProvider: Settings has units: %s", v40, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v51;
    swift_slowDealloc();

    uint64_t v26 = *(void (**)(char *, uint64_t))(v52 + 8);
    v26(v15, v10);
    uint64_t v27 = v22;
  }
  else
  {

    swift_release_n();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 8);
    v26(v15, v10);
    uint64_t v27 = v49;
  }
  sub_368F8();
  swift_retain();
  uint64_t v28 = sub_36708();
  os_log_type_t v29 = sub_36F48();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 67109120;
    uint64_t v31 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    uint64_t v32 = v44;
    uint64_t v33 = v27;
    uint64_t v34 = v31;
    int v35 = v27;
    uint64_t v36 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v33, v34, v45);
    uint64_t v37 = v46;
    sub_36D08();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v36);
    LOBYTE(v35) = sub_36C58();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v48);
    LODWORD(v54) = v35 & 1;
    uint64_t v10 = v50;
    sub_37038();
    swift_release();
    _os_log_impl(&dword_0, v28, v29, "TimelineDataProvider: Settings has fitness tracking enabled: %{BOOL}d", v30, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  return ((uint64_t (*)(char *, uint64_t))v26)(v53, v10);
}

uint64_t sub_A84C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  uint64_t v2 = sub_36D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_temperatureSubscribers));
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentTemperatureModel));
  return v0;
}

uint64_t sub_A950()
{
  sub_A84C();

  return swift_deallocClassInstance();
}

uint64_t sub_A9A8()
{
  return type metadata accessor for TimelineDataProvider();
}

uint64_t type metadata accessor for TimelineDataProvider()
{
  uint64_t result = qword_47EC0;
  if (!qword_47EC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A9FC()
{
  uint64_t result = sub_36D38();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_AACC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DepthComplicationMetrics(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_AB28(uint64_t a1, unint64_t *a2)
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

unint64_t sub_AB64()
{
  unint64_t result = qword_480E0;
  if (!qword_480E0)
  {
    sub_36B88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_480E0);
  }
  return result;
}

id sub_ABBC(void *a1)
{
  return [a1 timelineCurrentEntryModelUpdated:*(void *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentTemperatureModel)];
}

uint64_t sub_ABD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_ABE4()
{
  return swift_release();
}

uint64_t sub_ABEC(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_483A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_AC4C(void *a1)
{
  return [a1 timelineCurrentEntryModelUpdated:*(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_currentDepthModel)];
}

uint64_t sub_AC64()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_AC9C(uint64_t a1)
{
  return sub_77E4(a1);
}

unint64_t sub_ACA4()
{
  unint64_t result = qword_480F0;
  if (!qword_480F0)
  {
    sub_AD00(&qword_480E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_480F0);
  }
  return result;
}

uint64_t sub_AD00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_AD50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  sub_66B8(&qword_48378);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v24 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36C88();
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v21 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36858();
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v26 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_366B8();
  ((void (*)(void))__chkstk_darwin)();
  sub_36658();
  ((void (*)(void))__chkstk_darwin)();
  v18[1] = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_366F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v18 - v13;
  sub_366E8();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  sub_36688();
  type metadata accessor for HistoricalDepthMetrics(0);
  sub_36648();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v26, v1, v20);
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v21, enum case for TemperatureRange.unknown(_:), v23);
  char v16 = v24;
  v15(v24, v14, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v16, 0, 1, v8);
  swift_bridgeObjectRetain();
  sub_36B48();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_B134@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for LiveMetrics(0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_66B8(&qword_481F0);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36858();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65F0(v2, (uint64_t)v13);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_135D8((uint64_t)v13, (uint64_t)v5, type metadata accessor for LiveMetrics);
      (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a1, v5, v8);
      return sub_13640((uint64_t)v5, type metadata accessor for LiveMetrics);
    }
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))(a1, enum case for WaterDepth.unknown(_:), v8);
  }
  sub_13570((uint64_t)v13, (uint64_t)v7);
  uint64_t v16 = type metadata accessor for HistoricalDepthMetrics(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v7, 1, v16) == 1)
  {
    sub_13704((uint64_t)v7, &qword_481F0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v9 + 104))(a1, enum case for WaterDepth.unknown(_:), v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v7, v8);
  sub_13640((uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v11, v8);
}

uint64_t sub_B42C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = sub_66B8(&qword_483A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36B58();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65F0(v1, (uint64_t)v15);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1) {
      sub_13640((uint64_t)v15, type metadata accessor for DepthComplicationMetrics);
    }
    return sub_36A08();
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1) {
    return sub_36A08();
  }
  sub_135D8((uint64_t)v15, (uint64_t)v12, type metadata accessor for HistoricalDepthMetrics);
  sub_AD50((uint64_t)v8);
  sub_36B38();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v19)
  {
    sub_36B08();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_36B28();
    uint64_t v21 = *(void *)(v20 - 8);
    int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v4, 1, v20);
    uint64_t v23 = v26;
    if (v22 != 1)
    {
      sub_13640((uint64_t)v12, type metadata accessor for HistoricalDepthMetrics);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(v23, v4, v20);
    }
  }
  else
  {
    uint64_t v24 = sub_36B28();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v4, 1, 1, v24);
  }
  sub_36A08();
  sub_13640((uint64_t)v12, type metadata accessor for HistoricalDepthMetrics);
  return sub_13704((uint64_t)v4, &qword_483A0);
}

void sub_B7F4()
{
  qword_49458 = 0x6E4F737961776C61;
  qword_49460 = 0xE800000000000000;
}

uint64_t sub_B818(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v33 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v8 = v7 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v9 = v6 + 1;
    if (__OFADD__(v6, 1)) {
      goto LABEL_38;
    }
    if (v9 >= v33) {
      break;
    }
    unint64_t v10 = *(void *)(v32 + 8 * v9);
    ++v6;
    if (!v10)
    {
      int64_t v6 = v9 + 1;
      if (v9 + 1 >= v33) {
        break;
      }
      unint64_t v10 = *(void *)(v32 + 8 * v6);
      if (!v10)
      {
        int64_t v6 = v9 + 2;
        if (v9 + 2 >= v33) {
          break;
        }
        unint64_t v10 = *(void *)(v32 + 8 * v6);
        if (!v10)
        {
          int64_t v11 = v9 + 3;
          if (v11 >= v33) {
            break;
          }
          unint64_t v10 = *(void *)(v32 + 8 * v11);
          if (!v10)
          {
            while (1)
            {
              int64_t v6 = v11 + 1;
              if (__OFADD__(v11, 1)) {
                goto LABEL_39;
              }
              if (v6 >= v33) {
                goto LABEL_33;
              }
              unint64_t v10 = *(void *)(v32 + 8 * v6);
              ++v11;
              if (v10) {
                goto LABEL_21;
              }
            }
          }
          int64_t v6 = v11;
        }
      }
    }
LABEL_21:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v6 << 6);
LABEL_22:
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v8);
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = (void *)*v2;
    int v35 = (void *)*v2;
    *uint64_t v2 = 0x8000000000000000;
    unint64_t v19 = sub_29BDC(v14, v13);
    uint64_t v20 = v17[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21))
    {
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      uint64_t result = sub_37288();
      __break(1u);
      return result;
    }
    char v23 = v18;
    if (v17[3] >= v22)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v26 = v35;
        if (v18) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_12C7C();
        uint64_t v26 = v35;
        if (v23) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_12964(v22, isUniquelyReferenced_nonNull_native);
      unint64_t v24 = sub_29BDC(v14, v13);
      if ((v23 & 1) != (v25 & 1)) {
        goto LABEL_40;
      }
      unint64_t v19 = v24;
      uint64_t v26 = v35;
      if (v23)
      {
LABEL_4:
        *(void *)(v26[7] + 8 * v19) = v15;
        goto LABEL_5;
      }
    }
    v26[(v19 >> 6) + 8] |= 1 << v19;
    uint64_t v27 = (uint64_t *)(v26[6] + 16 * v19);
    *uint64_t v27 = v14;
    v27[1] = v13;
    *(void *)(v26[7] + 8 * v19) = v15;
    uint64_t v28 = v26[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_37;
    }
    v26[2] = v30;
    swift_bridgeObjectRetain();
LABEL_5:
    *uint64_t v2 = v26;
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_33:

  return swift_release();
}

uint64_t sub_BB08@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_36718();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  __chkstk_darwin(v2);
  uint64_t v32 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_66B8(&qword_48370);
  __chkstk_darwin(v4 - 8);
  int64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36C38();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_66B8(&qword_48338);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_36858();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_36818();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_13704((uint64_t)v13, &qword_48338);
  }
  else
  {
    uint64_t v30 = v10;
    uint64_t v31 = a1;
    char v18 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v18(v17, v13, v14);
    sub_36BF8();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      char v25 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      uint64_t v26 = v30;
      v25(v30, v6, v7);
      uint64_t v27 = v31;
      v18(v31, v17, v14);
      uint64_t v28 = type metadata accessor for LiveMetrics(0);
      v25(&v27[*(int *)(v28 + 20)], v26, v7);
      return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    sub_13704((uint64_t)v6, &qword_48370);
    a1 = v31;
  }
  unint64_t v19 = v32;
  sub_368F8();
  uint64_t v20 = sub_36708();
  os_log_type_t v21 = sub_36F48();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_0, v20, v21, "LiveMetrics: Failed to decode LiveMetrics from metadata", v22, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v33 + 8))(v19, v34);
  uint64_t v23 = type metadata accessor for LiveMetrics(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a1, 1, 1, v23);
}

uint64_t sub_BF88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v36 = a1;
  uint64_t v3 = sub_36718();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v37 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v34 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v34 - v16;
  uint64_t v18 = sub_66B8(&qword_481F0);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  os_log_type_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v34 - v22;
  sub_65F0(v2, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_13640((uint64_t)v17, type metadata accessor for DepthComplicationMetrics);
  }
  else
  {
    sub_13570((uint64_t)v17, (uint64_t)v23);
    sub_136A0((uint64_t)v23, (uint64_t)v21, &qword_481F0);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v21, 1, v5) != 1)
    {
      sub_135D8((uint64_t)v21, (uint64_t)v8, type metadata accessor for HistoricalDepthMetrics);
      uint64_t v32 = v36;
      sub_AD50(v36);
      sub_13640((uint64_t)v8, type metadata accessor for HistoricalDepthMetrics);
      sub_13704((uint64_t)v23, &qword_481F0);
      uint64_t v33 = sub_36B58();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 0, 1, v33);
    }
    sub_13704((uint64_t)v23, &qword_481F0);
    sub_13704((uint64_t)v21, &qword_481F0);
  }
  unint64_t v24 = v37;
  sub_368F8();
  sub_65F0(v2, (uint64_t)v15);
  char v25 = sub_36708();
  os_log_type_t v26 = sub_36F48();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_65F0((uint64_t)v15, (uint64_t)v12);
    uint64_t v28 = sub_36DF8();
    uint64_t v38 = sub_328C0(v28, v29, &v39);
    sub_37038();
    swift_bridgeObjectRelease();
    sub_13640((uint64_t)v15, type metadata accessor for DepthComplicationMetrics);
    _os_log_impl(&dword_0, v25, v26, "DepthComplicationMetrics: Not rendering summary for non-historic metrics (%s)", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v35);
  }
  else
  {
    sub_13640((uint64_t)v15, type metadata accessor for DepthComplicationMetrics);

    (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v35);
  }
  uint64_t v30 = sub_36B58();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v36, 1, 1, v30);
}

void *sub_C4B0()
{
  uint64_t v1 = type metadata accessor for LiveMetrics(0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_36718();
  uint64_t v54 = *(void *)(v52 - 8);
  uint64_t v4 = __chkstk_darwin(v52);
  uint64_t v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v50 - v7;
  uint64_t v55 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v9 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v53 = (uint64_t)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v50 - v15;
  uint64_t v57 = &_swiftEmptyDictionarySingleton;
  sub_65F0(v0, (uint64_t)v50 - v15);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v50[1] = v6;
  uint64_t v51 = v8;
  if (EnumCaseMultiPayload <= 1) {
    sub_13640((uint64_t)v16, type metadata accessor for DepthComplicationMetrics);
  }
  NSString v18 = sub_36DC8();
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v56 = &_swiftEmptyDictionarySingleton;
  sub_12E34((uint64_t)v18, 0xD000000000000012, 0x8000000000038CD0, isUniquelyReferenced_nonNull_native, &v56);
  uint64_t v20 = v56;
  uint64_t v57 = v56;
  swift_bridgeObjectRelease();
  sub_65F0(v0, (uint64_t)v14);
  int v21 = swift_getEnumCaseMultiPayload();
  if (v21)
  {
    if (v21 == 1)
    {
      sub_135D8((uint64_t)v14, (uint64_t)v3, type metadata accessor for LiveMetrics);
      unint64_t v56 = &_swiftEmptyDictionarySingleton;
      uint64_t v22 = sub_36828();
      sub_B818(v22);
      swift_bridgeObjectRelease();
      uint64_t v23 = sub_36C28();
      sub_B818(v23);
      swift_bridgeObjectRelease();
      sub_B818((uint64_t)v56);
      swift_bridgeObjectRelease();
      unint64_t v24 = type metadata accessor for LiveMetrics;
      uint64_t v25 = (uint64_t)v3;
LABEL_14:
      sub_13640(v25, v24);
    }
  }
  else
  {
    uint64_t v26 = v55;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v55) != 1)
    {
      uint64_t v27 = v53;
      sub_135D8((uint64_t)v14, v53, type metadata accessor for HistoricalDepthMetrics);
      Class isa = sub_36EE8().super.super.isa;
      char v29 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v56 = v20;
      sub_12E34((uint64_t)isa, 0xD000000000000012, 0x8000000000038CF0, v29, &v56);
      uint64_t v30 = v56;
      swift_bridgeObjectRelease();
      Class v31 = sub_36F18().super.super.isa;
      char v32 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v56 = v30;
      sub_12E34((uint64_t)v31, 0xD000000000000017, 0x8000000000038D10, v32, &v56);
      uint64_t v33 = v56;
      uint64_t v57 = v56;
      swift_bridgeObjectRelease();
      if (*(void *)(v27 + *(int *)(v26 + 32) + 8))
      {
        swift_bridgeObjectRetain();
        NSString v34 = sub_36DC8();
        swift_bridgeObjectRelease();
        char v35 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v56 = v33;
        sub_12E34((uint64_t)v34, 0xD00000000000001FLL, 0x8000000000038D30, v35, &v56);
        uint64_t v57 = v56;
        swift_bridgeObjectRelease();
      }
      uint64_t v36 = sub_36808();
      sub_B818(v36);
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void **)(v27 + *(int *)(v26 + 28));
      uint64_t v38 = v54;
      uint64_t v39 = v51;
      if (v37)
      {
        swift_bridgeObjectRetain();
        sub_368F8();
        int v40 = sub_36708();
        os_log_type_t v41 = sub_36F48();
        if (os_log_type_enabled(v40, v41))
        {
          uint64_t v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v42 = 0;
          _os_log_impl(&dword_0, v40, v41, "DepthComplicationMetrics: Adding graph metadata", v42, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v52);
        sub_365C8();
        swift_allocObject();
        sub_365B8();
        unint64_t v56 = v37;
        sub_66B8(&qword_48350);
        sub_13BC4(&qword_483C0, &qword_483C8);
        uint64_t v43 = sub_365A8();
        unint64_t v45 = v44;
        swift_bridgeObjectRelease();
        swift_release();
        Class v46 = sub_36668().super.isa;
        uint64_t v47 = v57;
        char v48 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v56 = v47;
        sub_12E34((uint64_t)v46, 0xD000000000000018, 0x8000000000038D50, v48, &v56);
        uint64_t v57 = v56;
        swift_bridgeObjectRelease();
        sub_13518(v43, v45);
      }
      unint64_t v24 = type metadata accessor for HistoricalDepthMetrics;
      uint64_t v25 = v27;
      goto LABEL_14;
    }
  }
  return v57;
}

uint64_t sub_CD30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v85 = sub_36718();
  uint64_t v4 = *(void *)(v85 - 8);
  uint64_t v5 = __chkstk_darwin(v85);
  uint64_t v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v82 = (char *)&v77 - v9;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v77 - v10;
  uint64_t v12 = sub_66B8(&qword_48338);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_36858();
  uint64_t v83 = *(void *)(v15 - 8);
  uint64_t v84 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v80 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  int v81 = (char *)&v77 - v18;
  uint64_t v19 = sub_66B8((uint64_t *)&unk_48340);
  __chkstk_darwin(v19 - 8);
  int v21 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for LiveMetrics(0);
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16)
    || (unint64_t v26 = sub_29BDC(0xD000000000000012, 0x8000000000038CD0), (v27 & 1) == 0)
    || (uint64_t v88 = *(void *)(*(void *)(a1 + 56) + 8 * v26),
        swift_unknownObjectRetain(),
        uint64_t v79 = sub_66B8((uint64_t *)&unk_48A90),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_368F8();
    uint64_t v43 = sub_36708();
    os_log_type_t v44 = sub_36F38();
    if (os_log_type_enabled(v43, v44))
    {
      unint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v45 = 0;
      _os_log_impl(&dword_0, v43, v44, "DepthComplicationMetrics: Unable to recreate historical metrics from metadata, category is missing.", v45, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v85);
    uint64_t v46 = type metadata accessor for DepthComplicationMetrics(0);
    os_log_type_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56);
    uint64_t v42 = a2;
    goto LABEL_14;
  }
  uint64_t v78 = (char *)a2;
  uint64_t v28 = v86;
  char v29 = v87;
  swift_bridgeObjectRetain();
  v30._rawValue = &off_41190;
  uint64_t v77 = v28;
  v89._countAndFlagsBits = v28;
  v89._object = v29;
  Swift::Int v31 = sub_37238(v30, v89);
  swift_bridgeObjectRelease();
  switch(v31)
  {
    case 0:
      swift_bridgeObjectRelease();
      sub_367F8();
      uint64_t v50 = v83;
      uint64_t v49 = v84;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v14, 1, v84) == 1)
      {
        sub_13704((uint64_t)v14, &qword_48338);
        uint64_t v51 = (uint64_t)v78;
      }
      else
      {
        uint64_t v57 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
        uint64_t v58 = v81;
        v57(v81, v14, v49);
        uint64_t v51 = (uint64_t)v78;
        if (*(void *)(a1 + 16))
        {
          unint64_t v59 = sub_29BDC(0xD000000000000012, 0x8000000000038CF0);
          if (v60)
          {
            uint64_t v86 = *(void *)(*(void *)(a1 + 56) + 8 * v59);
            swift_unknownObjectRetain();
            if (swift_dynamicCast())
            {
              if (*(void *)(a1 + 16))
              {
                uint64_t v61 = v88;
                unint64_t v62 = sub_29BDC(0xD000000000000017, 0x8000000000038D10);
                if (v63)
                {
                  uint64_t v86 = *(void *)(*(void *)(a1 + 56) + 8 * v62);
                  swift_unknownObjectRetain();
                  if (swift_dynamicCast())
                  {
                    uint64_t v64 = *(void *)(a1 + 16);
                    uint64_t v85 = v88;
                    if (v64)
                    {
                      unint64_t v65 = sub_29BDC(0xD00000000000001FLL, 0x8000000000038D30);
                      uint64_t v66 = v80;
                      if (v67)
                      {
                        uint64_t v88 = *(void *)(*(void *)(a1 + 56) + 8 * v65);
                        swift_unknownObjectRetain();
                        int v68 = swift_dynamicCast();
                        if (v68) {
                          uint64_t v69 = v86;
                        }
                        else {
                          uint64_t v69 = 0;
                        }
                        if (v68) {
                          uint64_t v70 = (uint64_t)v87;
                        }
                        else {
                          uint64_t v70 = 0;
                        }
                      }
                      else
                      {
                        uint64_t v69 = 0;
                        uint64_t v70 = 0;
                      }
                    }
                    else
                    {
                      uint64_t v69 = 0;
                      uint64_t v70 = 0;
                      uint64_t v66 = v80;
                    }
                    uint64_t v73 = v81;
                    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v66, v81, v49);
                    uint64_t v74 = sub_12FA4(a1);
                    (*(void (**)(char *, uint64_t))(v50 + 8))(v73, v49);
                    uint64_t v52 = (uint64_t)v78;
                    v57(v78, v66, v49);
                    uint64_t v75 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
                    *(void *)(v52 + v75[5]) = v61;
                    *(void *)(v52 + v75[6]) = v85;
                    *(void *)(v52 + v75[7]) = v74;
                    v76 = (uint64_t *)(v52 + v75[8]);
                    uint64_t *v76 = v69;
                    v76[1] = v70;
                    (*(void (**)(uint64_t, void, uint64_t, int *))(*((void *)v75 - 1) + 56))(v52, 0, 1, v75);
                    uint64_t v40 = type metadata accessor for DepthComplicationMetrics(0);
                    goto LABEL_22;
                  }
                }
              }
            }
          }
        }
        (*(void (**)(char *, uint64_t))(v50 + 8))(v58, v49);
      }
      uint64_t v72 = type metadata accessor for HistoricalDepthMetrics(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v51, 1, 1, v72);
      uint64_t v40 = type metadata accessor for DepthComplicationMetrics(0);
      swift_storeEnumTagMultiPayload();
      os_log_type_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
      uint64_t v42 = v51;
      goto LABEL_41;
    case 2:
      swift_bridgeObjectRelease();
      uint64_t v40 = type metadata accessor for DepthComplicationMetrics(0);
      uint64_t v52 = (uint64_t)v78;
LABEL_22:
      swift_storeEnumTagMultiPayload();
      os_log_type_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
      uint64_t v42 = v52;
LABEL_41:
      uint64_t v47 = 0;
      uint64_t v46 = v40;
      return v41(v42, v47, 1, v46);
    case 1:
      swift_bridgeObjectRelease();
      sub_BB08(v21);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
      {
        sub_13704((uint64_t)v21, (uint64_t *)&unk_48340);
        sub_368F8();
        char v32 = sub_36708();
        os_log_type_t v33 = sub_36F38();
        BOOL v34 = os_log_type_enabled(v32, v33);
        uint64_t v35 = (uint64_t)v78;
        if (v34)
        {
          uint64_t v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v36 = 0;
          _os_log_impl(&dword_0, v32, v33, "DepthComplicationMetrics: Failed to decode live current depth value", v36, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v85);
        (*(void (**)(uint64_t, void, uint64_t))(v83 + 104))(v35, enum case for WaterDepth.unknown(_:), v84);
        uint64_t v37 = v35 + *(int *)(v22 + 20);
        uint64_t v38 = enum case for UnderwaterTime.zero(_:);
        uint64_t v39 = sub_36C38();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v37, v38, v39);
        uint64_t v40 = type metadata accessor for DepthComplicationMetrics(0);
        swift_storeEnumTagMultiPayload();
        os_log_type_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
        uint64_t v42 = v35;
        goto LABEL_41;
      }
      sub_135D8((uint64_t)v21, (uint64_t)v25, type metadata accessor for LiveMetrics);
      uint64_t v52 = (uint64_t)v78;
      sub_135D8((uint64_t)v25, (uint64_t)v78, type metadata accessor for LiveMetrics);
      uint64_t v40 = type metadata accessor for DepthComplicationMetrics(0);
      goto LABEL_22;
  }
  uint64_t v53 = v82;
  sub_368F8();
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_36708();
  os_log_type_t v55 = sub_36F38();
  if (os_log_type_enabled(v54, v55))
  {
    unint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v86 = swift_slowAlloc();
    *(_DWORD *)unint64_t v56 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v88 = sub_328C0(v77, (unint64_t)v29, &v86);
    sub_37038();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v54, v55, "DepthComplicationMetrics: Unable to recreate historical metrics from metadata, category %s is invalid", v56, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v53, v85);
  uint64_t v71 = (uint64_t)v78;
  uint64_t v46 = type metadata accessor for DepthComplicationMetrics(0);
  os_log_type_t v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56);
  uint64_t v42 = v71;
LABEL_14:
  uint64_t v47 = 1;
  return v41(v42, v47, 1, v46);
}

uint64_t sub_D860()
{
  uint64_t v1 = type metadata accessor for LiveMetrics(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36858();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - v15;
  sub_65F0(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, (uint64_t)v9);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_135D8((uint64_t)v9, (uint64_t)v3, type metadata accessor for LiveMetrics);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v3, v10);
      sub_13640((uint64_t)v3, type metadata accessor for LiveMetrics);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_13570((uint64_t)v9, (uint64_t)v6);
  uint64_t v18 = type metadata accessor for HistoricalDepthMetrics(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v6, 1, v18) == 1)
  {
    sub_13704((uint64_t)v6, &qword_481F0);
LABEL_6:
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v16, enum case for WaterDepth.unknown(_:), v10);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v6, v10);
  sub_13640((uint64_t)v6, type metadata accessor for HistoricalDepthMetrics);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v14, v10);
LABEL_8:
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v16, v10);
  if (v19 == enum case for WaterDepth.shallow(_:)
    || v19 == enum case for WaterDepth.nominal(_:)
    || v19 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    return 0;
  }
  uint64_t v22 = 1;
  if (v19 == enum case for WaterDepth.unknown(_:) || v19 == enum case for WaterDepth.notSubmerged(_:)) {
    return v22;
  }
  if (v19 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    return 0;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_DC48()
{
  uint64_t v1 = type metadata accessor for LiveMetrics(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36858();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - v15;
  sub_65F0(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, (uint64_t)v9);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_135D8((uint64_t)v9, (uint64_t)v3, type metadata accessor for LiveMetrics);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v3, v10);
      sub_13640((uint64_t)v3, type metadata accessor for LiveMetrics);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_13570((uint64_t)v9, (uint64_t)v6);
  uint64_t v18 = type metadata accessor for HistoricalDepthMetrics(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48))(v6, 1, v18) == 1)
  {
    sub_13704((uint64_t)v6, &qword_481F0);
LABEL_6:
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v16, enum case for WaterDepth.unknown(_:), v10);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v6, v10);
  sub_13640((uint64_t)v6, type metadata accessor for HistoricalDepthMetrics);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v14, v10);
LABEL_8:
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v16, v10);
  BOOL v21 = v19 != enum case for WaterDepth.shallow(_:) && v19 != enum case for WaterDepth.nominal(_:);
  if (!v21 || v19 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    return v21;
  }
  BOOL v21 = 0;
  if (v19 == enum case for WaterDepth.unknown(_:) || v19 == enum case for WaterDepth.notSubmerged(_:)) {
    return v21;
  }
  if (v19 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    return 1;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

id sub_E094(uint64_t a1)
{
  switch(a1)
  {
    case 8:
      return sub_E4F8();
    case 11:
      type metadata accessor for DepthRectangularView();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v2 = [self fullColorImageProviderWithImageViewClass:ObjCClassFromMetadata];
      sub_E2EC();
      sub_66B8((uint64_t *)&unk_48A90);
      Class isa = sub_36D78().super.isa;
      swift_bridgeObjectRelease();
      [v2 setMetadata:isa];

      uint64_t v4 = (objc_class *)CLKComplicationTemplateGraphicRectangularFull;
LABEL_9:
      id v8 = [objc_allocWithZone(v4) initWithImageProvider:v2];

      return v8;
    case 10:
      type metadata accessor for DepthRichCircularView();
      uint64_t v6 = swift_getObjCClassFromMetadata();
      id v2 = [self fullColorImageProviderWithImageViewClass:v6];
      sub_E2EC();
      sub_66B8((uint64_t *)&unk_48A90);
      Class v7 = sub_36D78().super.isa;
      swift_bridgeObjectRelease();
      [v2 setMetadata:v7];

      uint64_t v4 = (objc_class *)CLKComplicationTemplateGraphicCircularImage;
      goto LABEL_9;
    default:
      sub_37108(45);
      swift_bridgeObjectRelease();
      v10._countAndFlagsBits = sub_37248();
      sub_36E48(v10);
      swift_bridgeObjectRelease();
      id result = (id)sub_371D8();
      __break(1u);
      break;
  }
  return result;
}

unint64_t sub_E2EC()
{
  unint64_t v8 = sub_E3DC((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v0 = sub_C4B0();
  sub_B818((uint64_t)v0);
  swift_bridgeObjectRelease();
  if (qword_47BD8 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_49458;
  uint64_t v2 = qword_49460;
  swift_bridgeObjectRetain();
  Class isa = sub_36ED8().super.super.isa;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v7 = v8;
  sub_12E34((uint64_t)isa, v1, v2, isUniquelyReferenced_nonNull_native, &v7);
  unint64_t v5 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_E3DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_66B8(&qword_483B8);
  uint64_t v2 = (void *)sub_37218();
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
    swift_unknownObjectRetain();
    unint64_t result = sub_29BDC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    Swift::String v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

id sub_E4F8()
{
  uint64_t v1 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v17 - v5;
  if ((sub_D860() & 1) != 0
    || (sub_65F0(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, (uint64_t)v6),
        int v7 = swift_getEnumCaseMultiPayload(),
        sub_13640((uint64_t)v6, type metadata accessor for DepthComplicationMetrics),
        v7 == 2))
  {
    id v8 = sub_F740();
    id v9 = sub_E6D0();
    id v10 = sub_EE38();
    sub_65F0(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, (uint64_t)v4);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    sub_13640((uint64_t)v4, type metadata accessor for DepthComplicationMetrics);
    if (EnumCaseMultiPayload == 2) {
      uint64_t v12 = sub_137B4();
    }
    else {
      uint64_t v12 = (uint64_t)sub_139FC();
    }
    id v13 = (id)v12;
    id v14 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCornerGaugeImage) initWithGaugeProvider:v8 leadingTextProvider:v9 trailingTextProvider:v10 imageProvider:v12];
  }
  else
  {
    id v8 = sub_F740();
    id v9 = sub_E6D0();
    id v10 = sub_EE38();
    id v13 = sub_F1C4();
    id v14 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCornerGaugeText) initWithGaugeProvider:v8 leadingTextProvider:v9 trailingTextProvider:v10 outerTextProvider:v13];
  }
  id v15 = v14;

  return v15;
}

id sub_E6D0()
{
  uint64_t v0 = sub_66B8(&qword_483A0);
  __chkstk_darwin(v0 - 8);
  unint64_t v62 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_36B28();
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v60 = (uint64_t)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v3 = __chkstk_darwin(v57);
  uint64_t v58 = (uint64_t)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v56 = (uint64_t)&v47 - v5;
  uint64_t v6 = sub_36D38();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_369D8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v65 = v10;
  uint64_t v66 = v11;
  __chkstk_darwin(v10);
  id v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_36858();
  uint64_t v67 = *(void *)(v55 - 8);
  uint64_t v14 = __chkstk_darwin(v55);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v47 - v17;
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_49428;
  swift_retain();
  sub_369A8();
  uint64_t v20 = v19 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v54 = v7 + 16;
  v53(v9, v20, v6);
  char v48 = v18;
  sub_36848();
  BOOL v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v49 = v7 + 8;
  uint64_t v52 = v21;
  v21(v9, v6);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v66 + 8);
  v66 += 8;
  uint64_t v51 = v22;
  v22(v13, v65);
  sub_36A78();
  uint64_t v50 = v6;
  swift_release();
  uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
  v67 += 8;
  uint64_t v64 = v23;
  uint64_t v24 = v55;
  v23((uint64_t)v18, v55);
  NSString v25 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v26 = [self textProviderWithText:v25];

  uint64_t v27 = v59 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics;
  id v28 = v26;
  sub_B134((uint64_t)v16);
  char v29 = v13;
  uint64_t v30 = v56;
  sub_65F0(v27, v56);
  Swift::Int v31 = v9;
  uint64_t v32 = (uint64_t)v16;
  LOBYTE(v26) = swift_getEnumCaseMultiPayload() == 2;
  sub_13640(v30, type metadata accessor for DepthComplicationMetrics);
  uint64_t v33 = v58;
  sub_65F0(v27, v58);
  char v34 = swift_getEnumCaseMultiPayload() == 0;
  sub_13640(v33, type metadata accessor for DepthComplicationMetrics);
  id v35 = sub_2BF9C(v32, 0, (char)v26, v34);
  v64(v32, v24);
  [v28 setTintColor:v35];

  uint64_t v36 = qword_49428;
  id v37 = v28;
  swift_retain();
  sub_369A8();
  uint64_t v38 = v36 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  uint64_t v39 = v50;
  v53(v31, v38, v50);
  uint64_t v40 = v48;
  sub_36848();
  v52(v31, v39);
  v51(v29, v65);
  uint64_t v41 = v60;
  sub_B42C(v60);
  uint64_t v43 = v61;
  uint64_t v42 = (uint64_t)v62;
  uint64_t v44 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v41, v63);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v42, 0, 1, v44);
  sub_36A88();
  sub_13704(v42, &qword_483A0);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v44);
  v64((uint64_t)v40, v24);
  NSString v45 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v37 setAccessibilityLabel:v45];

  return v37;
}

id sub_EE38()
{
  uint64_t v24 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v1 = __chkstk_darwin(v24);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v21 - v4;
  uint64_t v6 = sub_36858();
  uint64_t v22 = *(void *)(v6 - 8);
  uint64_t v23 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36B28();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v13 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics;
  swift_retain();
  sub_B42C((uint64_t)v12);
  sub_2CAA0((uint64_t)v12);
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRetain();
  NSString v14 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v15 = [self textProviderWithText:v14];

  id v16 = v15;
  sub_B134((uint64_t)v8);
  sub_65F0(v13, (uint64_t)v5);
  LOBYTE(v14) = swift_getEnumCaseMultiPayload() == 2;
  sub_13640((uint64_t)v5, type metadata accessor for DepthComplicationMetrics);
  sub_65F0(v13, (uint64_t)v3);
  char v17 = swift_getEnumCaseMultiPayload() == 0;
  sub_13640((uint64_t)v3, type metadata accessor for DepthComplicationMetrics);
  id v18 = sub_2BF9C((uint64_t)v8, 1, (char)v14, v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
  [v16 setTintColor:v18];

  NSString v19 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v16 setAccessibilityLabel:v19];

  return v16;
}

id sub_F1C4()
{
  uint64_t v1 = sub_66B8(&qword_483A0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36B28();
  uint64_t v5 = *(void **)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36858();
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  v27[1] = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics;
  swift_retain();
  uint64_t v33 = v0;
  sub_B134((uint64_t)v10);
  sub_B42C((uint64_t)v7);
  uint64_t v30 = (void (*)(char *, char *, uint64_t))v5[2];
  v30(v3, v7, v4);
  char v29 = (void (*)(char *, void, uint64_t, uint64_t))v5[7];
  v29(v3, 0, 1, v4);
  uint64_t v11 = sub_36A88();
  uint64_t v31 = v12;
  uint64_t v32 = v11;
  sub_13704((uint64_t)v3, &qword_483A0);
  swift_release();
  id v28 = (void (*)(char *, uint64_t))v5[1];
  v28(v7, v4);
  uint64_t v34 = *(void *)(v34 + 8);
  ((void (*)(char *, uint64_t))v34)(v10, v35);
  swift_retain();
  sub_B134((uint64_t)v10);
  sub_B42C((uint64_t)v7);
  v30(v3, v7, v4);
  v29(v3, 0, 1, v4);
  uint64_t v13 = sub_36A88();
  uint64_t v15 = v14;
  sub_13704((uint64_t)v3, &qword_483A0);
  swift_release();
  v28(v7, v4);
  ((void (*)(char *, uint64_t))v34)(v10, v35);
  sub_DC48();
  NSString v16 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v17 = [self textProviderWithText:v16];

  [v17 setUseLowercaseSmallCaps:1];
  uint64_t v18 = qword_47BE0;
  id v19 = v17;
  if (v18 != -1) {
    swift_once();
  }
  id v20 = (id)qword_49468;
  NSString v21 = sub_36DC8();
  NSString v22 = sub_36DC8();
  id v23 = [v20 localizedStringForKey:v21 value:0 table:v22];

  sub_36DD8();
  swift_bridgeObjectRelease();

  sub_66B8(&qword_483A8);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_38040;
  *(void *)(v24 + 56) = &type metadata for String;
  *(void *)(v24 + 64) = sub_13760();
  *(void *)(v24 + 32) = v13;
  *(void *)(v24 + 40) = v15;
  sub_36DE8();
  swift_bridgeObjectRelease();
  NSString v25 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v19 setAccessibilityLabel:v25];

  return v19;
}

id sub_F740()
{
  uint64_t v1 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)v29 - v6;
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v29 - v8;
  uint64_t v30 = sub_36858();
  uint64_t v10 = *(void *)(v30 - 8);
  uint64_t v11 = __chkstk_darwin(v30);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v29 - v14;
  uint64_t v16 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics;
  sub_B134((uint64_t)v29 - v14);
  sub_65F0(v16, (uint64_t)v9);
  v29[1] = v1;
  char v17 = swift_getEnumCaseMultiPayload() == 2;
  sub_13640((uint64_t)v9, type metadata accessor for DepthComplicationMetrics);
  sub_65F0(v16, (uint64_t)v7);
  LOBYTE(v9) = swift_getEnumCaseMultiPayload() == 0;
  sub_13640((uint64_t)v7, type metadata accessor for DepthComplicationMetrics);
  sub_2B8F4((uint64_t)v15, v17, (char)v9);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  id v19 = v15;
  uint64_t v20 = v30;
  v18(v19, v30);
  sub_B134((uint64_t)v13);
  sub_65F0(v16, (uint64_t)v4);
  char v21 = swift_getEnumCaseMultiPayload() == 0;
  sub_13640((uint64_t)v4, type metadata accessor for DepthComplicationMetrics);
  sub_2BD2C((uint64_t)v13, v21);
  v18(v13, v20);
  float v22 = sub_FA78();
  sub_AB28(0, (unint64_t *)&unk_48390);
  Class isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  sub_AB28(0, (unint64_t *)&unk_48A50);
  Class v24 = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  NSString v25 = self;
  *(float *)&double v26 = v22;
  id v27 = [v25 gaugeProviderWithStyle:1 gaugeColors:isa gaugeColorLocations:v24 fillFraction:v26];

  return v27;
}

float sub_FA78()
{
  uint64_t v1 = v0;
  uint64_t v99 = sub_36718();
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  os_log_type_t v100 = (char *)&v95 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_66B8(&qword_48380);
  __chkstk_darwin(v3 - 8);
  v108 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_369D8();
  uint64_t v109 = *(void *)(v5 - 8);
  uint64_t v110 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  unint64_t v103 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v102 = (char *)&v95 - v8;
  uint64_t v9 = sub_36858();
  uint64_t v10 = *(uint8_t **)(v9 - 8);
  uint64_t v117 = v9;
  v118 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v97 = (uint64_t)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v107 = (uint64_t)&v95 - v14;
  __chkstk_darwin(v13);
  uint64_t v120 = (char *)&v95 - v15;
  uint64_t v16 = sub_36A58();
  uint64_t v115 = *(void *)(v16 - 8);
  uint64_t v116 = v16;
  __chkstk_darwin(v16);
  v114 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_36D38();
  uint64_t v112 = *(void *)(v18 - 8);
  uint64_t v113 = v18;
  __chkstk_darwin(v18);
  uint64_t v111 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_36B58();
  uint64_t v101 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  float v22 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_66B8(&qword_48388);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  objc_super v104 = (char *)&v95 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v105 = (uint64_t)&v95 - v26;
  uint64_t v27 = sub_66B8(&qword_481F0);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  uint64_t v30 = (char *)&v95 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v32 = (char *)&v95 - v31;
  uint64_t v33 = sub_36978();
  uint64_t v121 = *(void *)(v33 - 8);
  uint64_t v122 = v33;
  uint64_t v34 = __chkstk_darwin(v33);
  uint64_t v106 = (char *)&v95 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  int v119 = (char *)&v95 - v36;
  uint64_t v37 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v38 = __chkstk_darwin(v37);
  uint64_t v40 = (char *)&v95 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  uint64_t v42 = (char *)&v95 - v41;
  if (sub_D860()) {
    return CLKSimpleGaugeProviderFillFractionEmpty;
  }
  uint64_t v43 = (uint64_t)v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics;
  sub_65F0((uint64_t)v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics, (uint64_t)v42);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_13640((uint64_t)v42, type metadata accessor for DepthComplicationMetrics);
  if (EnumCaseMultiPayload == 2) {
    return CLKSimpleGaugeProviderFillFractionEmpty;
  }
  uint64_t v96 = v1;
  uint64_t v95 = v43;
  sub_65F0(v43, (uint64_t)v40);
  int v47 = swift_getEnumCaseMultiPayload();
  if (v47)
  {
    char v48 = v118;
    uint64_t v49 = v122;
    if (v47 == 1) {
      sub_13640((uint64_t)v40, type metadata accessor for DepthComplicationMetrics);
    }
    uint64_t v50 = v117;
    uint64_t v51 = v121;
    uint64_t v52 = v119;
    if (qword_47BD0 != -1) {
      swift_once();
    }
    uint64_t v53 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    uint64_t v54 = v111;
    uint64_t v55 = v112;
    uint64_t v56 = v113;
    (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v111, v53, v113);
    uint64_t v57 = v114;
    sub_36CC8();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
    sub_369E8();
    (*(void (**)(char *, uint64_t))(v115 + 8))(v57, v116);
    uint64_t v58 = (uint64_t)v120;
  }
  else
  {
    sub_13570((uint64_t)v40, (uint64_t)v32);
    sub_136A0((uint64_t)v32, (uint64_t)v30, &qword_481F0);
    uint64_t v59 = type metadata accessor for HistoricalDepthMetrics(0);
    int v60 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 48))(v30, 1, v59);
    char v48 = v118;
    uint64_t v49 = v122;
    if (v60 == 1)
    {
      sub_13704((uint64_t)v30, &qword_481F0);
      uint64_t v51 = v121;
      uint64_t v61 = v105;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v121 + 56))(v105, 1, 1, v49);
      uint64_t v50 = v117;
      uint64_t v62 = (uint64_t)v104;
      uint64_t v63 = v106;
    }
    else
    {
      sub_AD50((uint64_t)v22);
      sub_13640((uint64_t)v30, type metadata accessor for HistoricalDepthMetrics);
      sub_36B38();
      uint64_t v65 = v64;
      (*(void (**)(char *, uint64_t))(v101 + 8))(v22, v20);
      uint64_t v63 = v106;
      uint64_t v61 = v105;
      if (v65)
      {
        sub_36948();
        swift_bridgeObjectRelease();
        uint64_t v50 = v117;
        uint64_t v51 = v121;
      }
      else
      {
        uint64_t v51 = v121;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v121 + 56))(v105, 1, 1, v49);
        uint64_t v50 = v117;
      }
      uint64_t v62 = (uint64_t)v104;
    }
    sub_136A0(v61, v62, &qword_48388);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v62, 1, v49) == 1)
    {
      if (qword_47BD0 != -1) {
        swift_once();
      }
      uint64_t v66 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
      swift_beginAccess();
      uint64_t v67 = v111;
      uint64_t v68 = v112;
      uint64_t v69 = v113;
      (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v111, v66, v113);
      uint64_t v70 = v114;
      sub_36CC8();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v67, v69);
      uint64_t v63 = v106;
      sub_369E8();
      (*(void (**)(char *, uint64_t))(v115 + 8))(v70, v116);
      sub_13704(v105, &qword_48388);
      sub_13704((uint64_t)v32, &qword_481F0);
      sub_13704(v62, &qword_48388);
      uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 32);
    }
    else
    {
      sub_13704(v61, &qword_48388);
      sub_13704((uint64_t)v32, &qword_481F0);
      uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 32);
      v71(v63, v62, v49);
    }
    uint64_t v52 = v119;
    v71(v119, (uint64_t)v63, v49);
    uint64_t v58 = (uint64_t)v120;
  }
  sub_B134(v58);
  int v72 = (*((uint64_t (**)(uint64_t, uint64_t))v48 + 11))(v58, v50);
  uint64_t v73 = v96;
  if (v72 == enum case for WaterDepth.shallow(_:) || v72 == enum case for WaterDepth.nominal(_:))
  {
    uint64_t v74 = (void (*)(uint64_t, uint64_t))*((void *)v48 + 1);
    v74(v58, v50);
    uint64_t v75 = v107;
    sub_B134(v107);
    v76 = v108;
    sub_36838();
    v74(v75, v50);
    uint64_t v77 = (uint64_t)v76;
    uint64_t v78 = v109;
    uint64_t v79 = v76;
    uint64_t v80 = v110;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v109 + 48))(v79, 1, v110) != 1)
    {
      int v81 = v102;
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 32))(v102, v77, v80);
      sub_36988();
      double v83 = v82;
      uint64_t v84 = v103;
      sub_36968();
      sub_36988();
      double v86 = v85;
      v87 = *(void (**)(char *, uint64_t))(v78 + 8);
      v87(v84, v80);
      float v45 = v83 / v86;
      v87(v81, v80);
      goto LABEL_35;
    }
    sub_13704(v77, &qword_48380);
LABEL_33:
    float v45 = CLKSimpleGaugeProviderFillFractionEmpty;
LABEL_35:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v49);
    return v45;
  }
  if (v72 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v49);
    (*((void (**)(uint64_t, uint64_t))v48 + 1))(v58, v50);
    return 1.0;
  }
  if (v72 == enum case for WaterDepth.unknown(_:) || v72 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_33;
  }
  if (v72 == enum case for WaterDepth.depthExceedingSensorLimit(_:))
  {
    (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v49);
    return 1.0;
  }
  else
  {
    uint64_t v88 = v100;
    sub_368F8();
    id v89 = v73;
    uint64_t v90 = sub_36708();
    os_log_type_t v91 = sub_36F38();
    if (os_log_type_enabled(v90, v91))
    {
      v92 = (uint8_t *)swift_slowAlloc();
      uint64_t v124 = swift_slowAlloc();
      *(_DWORD *)v92 = 136315138;
      v118 = v92 + 4;
      sub_B134(v97);
      uint64_t v93 = sub_36E08();
      uint64_t v123 = sub_328C0(v93, v94, &v124);
      uint64_t v52 = v119;
      sub_37038();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v90, v91, "DepthTimelineEntryModel: gaugeFullAction: unknown switch case %s", v92, 0xCu);
      swift_arrayDestroy();
      uint64_t v58 = (uint64_t)v120;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v98 + 8))(v100, v99);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v98 + 8))(v88, v99);
    }
    float v45 = CLKSimpleGaugeProviderFillFractionEmpty;
    (*(void (**)(char *, uint64_t))(v121 + 8))(v52, v122);
    (*((void (**)(uint64_t, uint64_t))v48 + 1))(v58, v50);
  }
  return v45;
}

id sub_10990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthTimelineEntryModel(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10A50()
{
  return type metadata accessor for DepthTimelineEntryModel(0);
}

uint64_t type metadata accessor for DepthTimelineEntryModel(uint64_t a1)
{
  return sub_114FC(a1, (uint64_t *)&unk_48140);
}

uint64_t sub_10A78()
{
  uint64_t result = sub_366B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DepthComplicationMetrics(319);
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

uint64_t type metadata accessor for DepthComplicationMetrics(uint64_t a1)
{
  return sub_114FC(a1, (uint64_t *)&unk_48268);
}

uint64_t *sub_10B6C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_36858();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10C68(uint64_t a1)
{
  uint64_t v2 = sub_36858();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10CEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10D98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[8];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10E68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_10F00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[8];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  void *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10FC8);
}

uint64_t sub_10FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
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

uint64_t sub_11094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_110A8);
}

uint64_t sub_110A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_36858();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for HistoricalDepthMetrics(uint64_t a1)
{
  return sub_114FC(a1, qword_481A8);
}

uint64_t sub_11184()
{
  uint64_t result = sub_36858();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_11234(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = sub_36858();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      uint64_t v13 = *(int *)(type metadata accessor for LiveMetrics(0) + 20);
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_36C38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
      uint64_t v9 = *((void *)v8 - 1);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v9 + 48))(a2, 1, v8))
      {
        uint64_t v10 = sub_66B8(&qword_481F0);
        memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        uint64_t v17 = sub_36858();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
        *(uint64_t *)((char *)a1 + v8[5]) = *(uint64_t *)((char *)a2 + v8[5]);
        *(uint64_t *)((char *)a1 + v8[6]) = *(uint64_t *)((char *)a2 + v8[6]);
        *(uint64_t *)((char *)a1 + v8[7]) = *(uint64_t *)((char *)a2 + v8[7]);
        uint64_t v18 = v8[8];
        uint64_t v19 = (uint64_t *)((char *)a1 + v18);
        uint64_t v20 = (uint64_t *)((char *)a2 + v18);
        uint64_t v21 = v20[1];
        *uint64_t v19 = *v20;
        v19[1] = v21;
        float v22 = *(void (**)(uint64_t *, void, uint64_t, int *))(v9 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v22(a1, 0, 1, v8);
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t type metadata accessor for LiveMetrics(uint64_t a1)
{
  return sub_114FC(a1, qword_48300);
}

uint64_t sub_114FC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_11534(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v4 = sub_36858();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    uint64_t v5 = a1 + *(int *)(type metadata accessor for LiveMetrics(0) + 20);
    uint64_t v6 = sub_36C38();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  else if (!result)
  {
    uint64_t v3 = type metadata accessor for HistoricalDepthMetrics(0);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(a1, 1, v3);
    if (!result)
    {
      uint64_t v8 = sub_36858();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

char *sub_116AC(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_36858();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    uint64_t v11 = *(int *)(type metadata accessor for LiveMetrics(0) + 20);
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = sub_36C38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_66B8(&qword_481F0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_36858();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
      *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
      *(void *)&a1[v7[6]] = *(void *)&a2[v7[6]];
      *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
      uint64_t v16 = v7[8];
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = *(void (**)(char *, void, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(a1, 0, 1, v7);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *sub_11910(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_13640((uint64_t)a1, type metadata accessor for DepthComplicationMetrics);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_36858();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = *(int *)(type metadata accessor for LiveMetrics(0) + 20);
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      uint64_t v14 = sub_36C38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
      uint64_t v8 = *((void *)v7 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_66B8(&qword_481F0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v15 = sub_36858();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
        *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
        *(void *)&a1[v7[6]] = *(void *)&a2[v7[6]];
        *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
        uint64_t v16 = v7[8];
        uint64_t v17 = &a1[v16];
        uint64_t v18 = &a2[v16];
        *(void *)uint64_t v17 = *(void *)v18;
        *((void *)v17 + 1) = *((void *)v18 + 1);
        uint64_t v19 = *(void (**)(char *, void, uint64_t, int *))(v8 + 56);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v19(a1, 0, 1, v7);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *sub_11BA0(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = sub_36858();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
    uint64_t v11 = *(int *)(type metadata accessor for LiveMetrics(0) + 20);
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = sub_36C38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
    uint64_t v8 = *((void *)v7 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_66B8(&qword_481F0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_36858();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
      *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
      *(void *)&a1[v7[6]] = *(void *)&a2[v7[6]];
      *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
      *(_OWORD *)&a1[v7[8]] = *(_OWORD *)&a2[v7[8]];
      (*(void (**)(char *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *sub_11DF0(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_13640((uint64_t)a1, type metadata accessor for DepthComplicationMetrics);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v10 = sub_36858();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, a2, v10);
      uint64_t v11 = *(int *)(type metadata accessor for LiveMetrics(0) + 20);
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      uint64_t v14 = sub_36C38();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = (int *)type metadata accessor for HistoricalDepthMetrics(0);
      uint64_t v8 = *((void *)v7 - 1);
      if ((*(unsigned int (**)(char *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
      {
        uint64_t v9 = sub_66B8(&qword_481F0);
        memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
      }
      else
      {
        uint64_t v15 = sub_36858();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        *(void *)&a1[v7[5]] = *(void *)&a2[v7[5]];
        *(void *)&a1[v7[6]] = *(void *)&a2[v7[6]];
        *(void *)&a1[v7[7]] = *(void *)&a2[v7[7]];
        *(_OWORD *)&a1[v7[8]] = *(_OWORD *)&a2[v7[8]];
        (*(void (**)(char *, void, uint64_t, int *))(v8 + 56))(a1, 0, 1, v7);
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_12064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1208C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_120BC()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_120CC()
{
  sub_12190();
  if (v0 <= 0x3F)
  {
    type metadata accessor for LiveMetrics(319);
    if (v1 <= 0x3F) {
      swift_initEnumMetadataMultiPayload();
    }
  }
}

void sub_12190()
{
  if (!qword_48278)
  {
    type metadata accessor for HistoricalDepthMetrics(255);
    unint64_t v0 = sub_37028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48278);
    }
  }
}

uint64_t *sub_121E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_36858();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_36C38();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_122F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_36858();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_36C38();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_12398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_36C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_12450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_36C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_12508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_36C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_125C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_36C38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_12678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1268C);
}

uint64_t sub_1268C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36858();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_36C38();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_12784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_12798);
}

uint64_t sub_12798(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_36858();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_36C38();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_1289C()
{
  uint64_t result = sub_36858();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_36C38();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_12964(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_66B8(&qword_483B8);
  char v36 = a2;
  uint64_t v6 = sub_37208();
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
    float v22 = (void *)(v5 + 64);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_372A8();
    sub_36E38();
    uint64_t result = sub_372C8();
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
  float v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *float v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_12C7C()
{
  unint64_t v1 = v0;
  sub_66B8(&qword_483B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_371F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

uint64_t sub_12E34(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = (void *)*a5;
  unint64_t v12 = sub_29BDC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_12C7C();
LABEL_7:
    uint64_t v18 = (void *)*a5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_12964(v15, a4 & 1);
  unint64_t v21 = sub_29BDC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_37288();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a5;
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
  void v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_12FA4(uint64_t a1)
{
  uint64_t v2 = sub_36718();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v30 - v9;
  __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v30 - v11;
  if (!*(void *)(a1 + 16) || (sub_29BDC(0xD000000000000018, 0x8000000000038D50), (v13 & 1) == 0))
  {
    sub_368F8();
    uint64_t v18 = sub_36708();
    os_log_type_t v19 = sub_36F38();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "DepthComplicationMetrics: graphData metadata is nil", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    return 0;
  }
  if (!*(void *)(a1 + 16)
    || (unint64_t v14 = sub_29BDC(0xD000000000000018, 0x8000000000038D50), (v15 & 1) == 0)
    || (uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8 * v14),
        swift_unknownObjectRetain(),
        sub_66B8((uint64_t *)&unk_48A90),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_368F8();
    unint64_t v21 = sub_36708();
    os_log_type_t v22 = sub_36F38();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "DepthComplicationMetrics: Graph metadata is not castable to data", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
    return 0;
  }
  uint64_t v17 = v31;
  unint64_t v16 = v32;
  sub_36598();
  swift_allocObject();
  sub_36588();
  sub_66B8(&qword_48350);
  sub_13BC4(&qword_48358, &qword_48360);
  sub_36578();
  swift_release();
  uint64_t v25 = v31;
  sub_368F8();
  uint64_t v26 = sub_36708();
  os_log_type_t v27 = sub_36F38();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_0, v26, v27, "DepthComplicationMetrics: Decoded graph data", v29, 2u);
    swift_slowDealloc();
  }
  sub_13518(v17, v16);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
  return v25;
}

uint64_t sub_13518(uint64_t a1, unint64_t a2)
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

uint64_t sub_13570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_481F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_135D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_13640(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_136A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_66B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_13704(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_66B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_13760()
{
  unint64_t result = qword_483B0;
  if (!qword_483B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_483B0);
  }
  return result;
}

uint64_t sub_137B4()
{
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_49468;
  NSString v1 = sub_36DC8();
  id v2 = [self imageNamed:v1 inBundle:v0 compatibleWithTraitCollection:0];

  if (v2)
  {
    id v3 = [self providerWithFullColorImage:v2];
    id v4 = [self whiteColor];
    [v3 setTintColor:v4];

    id v5 = (id)qword_49468;
    NSString v6 = sub_36DC8();
    NSString v7 = sub_36DC8();
    id v8 = [v5 localizedStringForKey:v6 value:0 table:v7];

    sub_36DD8();
    NSString v9 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v3 setAccessibilityLabel:v9];

    return (uint64_t)v3;
  }
  else
  {
    uint64_t result = sub_371D8();
    __break(1u);
  }
  return result;
}

id sub_139FC()
{
  NSString v0 = sub_36DC8();
  id v1 = [self symbolImageProviderWithSystemName:v0];

  id v2 = [self whiteColor];
  [v1 setTintColor:v2];

  uint64_t v3 = qword_47BE0;
  id v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  id v5 = (id)qword_49468;
  NSString v6 = sub_36DC8();
  NSString v7 = sub_36DC8();
  id v8 = [v5 localizedStringForKey:v6 value:0 table:v7];

  sub_36DD8();
  NSString v9 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v4 setAccessibilityLabel:v9];

  return v4;
}

uint64_t sub_13BC4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_AD00(&qword_48350);
    sub_13C44(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_13C44(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_368D8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CMWaterSubmersionDepthState.description.getter(uint64_t a1)
{
  uint64_t result = 0xD000000000000010;
  if (a1 > 299)
  {
    if (a1 > 499)
    {
      if (a1 == 500) {
        return 0x78614D747361702ELL;
      }
      if (a1 == 600) {
        return 0xD000000000000011;
      }
    }
    else
    {
      if (a1 == 300) {
        return 0x6772656D6275732ELL;
      }
      if (a1 == 400) {
        return 0xD000000000000014;
      }
    }
    return 0x4E574F4E4B4E55;
  }
  if (!a1) {
    return 0x6E776F6E6B6E752ELL;
  }
  if (a1 == 100) {
    return 0x656D627553746F6ELL;
  }
  if (a1 != 200) {
    return 0x4E574F4E4B4E55;
  }
  return result;
}

uint64_t WaterDepth.simulatedSubmersionState.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36858();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for WaterDepth.shallow(_:))
  {
    uint64_t v7 = 200;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v7;
  }
  if (v6 == enum case for WaterDepth.nominal(_:))
  {
    uint64_t v7 = 300;
    goto LABEL_7;
  }
  if (v6 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    uint64_t v7 = 500;
    goto LABEL_7;
  }
  if (v6 == enum case for WaterDepth.unknown(_:)) {
    return 0;
  }
  if (v6 == enum case for WaterDepth.notSubmerged(_:)) {
    return 100;
  }
  if (v6 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    return 600;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

id sub_13F54()
{
  type metadata accessor for ComplicationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_49468 = (uint64_t)result;
  return result;
}

uint64_t sub_13FA8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ComplicationBundle()
{
  return self;
}

void sub_13FDC(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v7 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)type metadata accessor for DepthGraphView()) init];
  id v8 = &v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics];
  uint64_t v9 = type metadata accessor for HistoricalDepthMetrics(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_alwaysOn] = 0;
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_device] = a1;
  id v10 = objc_allocWithZone((Class)NSTextAttachment);
  id v11 = a1;
  id v12 = [v10 init];
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_depthSymbolAttachment] = v12;

  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v48.receiver = v5;
  v48.super_class = (Class)type metadata accessor for DepthRectangularHistoricalGraphView();
  unint64_t v16 = (char *)objc_msgSendSuper2(&v48, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v16 setClipsToBounds:1];
  id v17 = *(id *)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_depthSymbolAttachment];
  NSString v18 = sub_36DC8();
  id v19 = [self _systemImageNamed:v18];

  if (v19)
  {
    uint64_t v20 = self;
    id v21 = [v20 whiteColor];
    id v22 = [v19 imageWithTintColor:v21];

    [v17 setImage:v22];
    sub_66B8(&qword_47D58);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_37F00;
    uint64_t v46 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel;
    uint64_t v24 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel];
    *(void *)(inited + 32) = v24;
    uint64_t v25 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel;
    uint64_t v26 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel];
    *(void *)(inited + 40) = v26;
    uint64_t v47 = inited;
    sub_36EA8();
    id v27 = v24;
    id v28 = v26;
    if ((v47 & 0xC000000000000001) != 0) {
      id v29 = (id)sub_37128();
    }
    else {
      id v29 = *(id *)(v47 + 32);
    }
    uint64_t v30 = v29;
    if (qword_47C98 != -1) {
      swift_once();
    }
    [v30 setFont:qword_49528];
    id v31 = [v20 whiteColor];
    [v30 setTextColor:v31];

    if ((v47 & 0xC000000000000001) != 0) {
      id v32 = (id)sub_37128();
    }
    else {
      id v32 = *(id *)(v47 + 40);
    }
    uint64_t v33 = v32;
    if (qword_47C98 != -1) {
      swift_once();
    }
    [v33 setFont:qword_49528];
    id v34 = [v20 whiteColor];
    [v33 setTextColor:v34];
    swift_bridgeObjectRelease();

    uint64_t v35 = qword_47C68;
    id v36 = *(id *)&v16[v25];
    if (v35 != -1) {
      swift_once();
    }
    [v36 setTextColor:qword_494F8];

    id v37 = *(id *)&v16[v46];
    id v38 = sub_14544();
    [v37 setAttributedText:v38];

    id v39 = *(id *)&v16[v25];
    sub_148F8();
    NSString v40 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v39 setText:v40];

    uint64_t v41 = *(void **)&v16[v25];
    uint64_t v42 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView];
    id v43 = *(id *)&v16[v46];
    id v44 = v41;
    id v45 = v42;
    [v16 addSubview:v43];
    [v16 addSubview:v44];
    [v16 addSubview:v45];
  }
  else
  {
    __break(1u);
  }
}

id sub_14544()
{
  uint64_t v1 = sub_36B58();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics;
  swift_beginAccess();
  sub_15B80(v12, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_15BE8((uint64_t)v7);
    id v13 = objc_allocWithZone((Class)NSAttributedString);
    NSString v14 = sub_36DC8();
    id v15 = [v13 initWithString:v14];
  }
  else
  {
    sub_6810((uint64_t)v7, (uint64_t)v11);
    sub_AB28(0, (unint64_t *)&qword_484F0);
    id v15 = [(id)swift_getObjCClassFromMetadata() attributedStringWithAttachment:*(void *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_depthSymbolAttachment)];
    if (qword_47BD0 != -1) {
      swift_once();
    }
    swift_retain();
    sub_AD50((uint64_t)v4);
    v21[3] = v1;
    v21[4] = sub_6874();
    unint64_t v16 = sub_68CC(v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v16, v4, v1);
    sub_36A98();
    sub_6930((uint64_t)v21);
    swift_release();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v17 = objc_allocWithZone((Class)NSAttributedString);
    NSString v18 = sub_36DC8();
    swift_bridgeObjectRelease();
    id v19 = [v17 initWithString:v18];

    [v15 appendAttributedString:v19];
    sub_6980((uint64_t)v11, type metadata accessor for HistoricalDepthMetrics);
  }
  return v15;
}

uint64_t sub_148F8()
{
  uint64_t v1 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics;
  swift_beginAccess();
  sub_15B80(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_15BE8((uint64_t)v3);
    return 0;
  }
  else
  {
    sub_6810((uint64_t)v3, (uint64_t)v7);
    if (qword_47BD0 != -1) {
      swift_once();
    }
    double v10 = *(double *)&v7[*(int *)(v4 + 20)];
    id v11 = *(void **)(*(void *)(qword_49428
                               + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                   + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_compactDiveDurationFormatter);
    swift_retain();
    id v12 = [v11 stringFromTimeInterval:v10];
    if (v12)
    {
      id v13 = v12;
      uint64_t v9 = sub_36DD8();
      swift_release();
    }
    else
    {
      swift_release();
      uint64_t v9 = 0;
    }
    sub_6980((uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
  }
  return v9;
}

id sub_14B3C()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel];
  [v1 intrinsicContentSize];
  double v3 = v2;
  double v5 = v4;
  [v0 bounds];
  double Width = CGRectGetWidth(v22);
  if (Width < v3) {
    double v3 = Width;
  }
  v23.origin.x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = v3;
  v23.size.double height = v5;
  objc_msgSend(v0, "bounds", CGRectGetMaxY(v23));
  double v8 = v7;
  [v0 bounds];
  double v10 = v9;
  v24.origin.x = 0.0;
  v24.origin.double y = 0.0;
  v24.size.double width = v3;
  v24.size.double height = v5;
  double v11 = v10 - CGRectGetMaxY(v24);
  v25.origin.x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.double width = v3;
  v25.size.double height = v5;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView], "setFrame:", 0.0, CGRectGetMaxY(v25), v8, v11);
  objc_msgSend(v1, "setFrame:", 0.0, 0.0, v3, v5);
  id v12 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel];
  [v12 intrinsicContentSize];
  double v14 = v13;
  double v16 = v15;
  v26.origin.x = 0.0;
  v26.origin.double y = 0.0;
  v26.size.double width = v3;
  v26.size.double height = v5;
  double v17 = CGRectGetMaxX(v26) + 5.0;
  [v0 bounds];
  double v18 = CGRectGetMaxX(v27) - v17;
  if (v18 >= v14) {
    double v19 = v14;
  }
  else {
    double v19 = v18;
  }

  return objc_msgSend(v12, "setFrame:", v17, 0.0, v19, v16);
}

uint64_t sub_14D20()
{
  return sub_14D48(&OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel, &OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer);
}

uint64_t sub_14D34()
{
  return sub_14D48(&OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel, &OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer);
}

uint64_t sub_14D48(void *a1, void *a2)
{
  uint64_t v5 = v2;
  sub_66B8(&qword_47D58);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_38160;
  *(void *)(v6 + 32) = [*(id *)(v5 + *a1) layer];
  sub_36EA8();
  id v7 = objc_retain(objc_retain(*(id *)(*(void *)(v5
                                                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView)
                                     + *a2)));
  swift_bridgeObjectRetain();
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return v6;
}

uint64_t sub_14E68()
{
  uint64_t v0 = sub_14D20();
  unint64_t v1 = sub_3223C();
  sub_15188(v1);
  sub_15188((unint64_t)&_swiftEmptyArrayStorage);
  unint64_t v2 = sub_14D34();
  sub_15188(v2);
  unint64_t v3 = sub_3230C();
  sub_15188(v3);
  return v0;
}

id sub_14F64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthRectangularHistoricalGraphView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_15028()
{
  return type metadata accessor for DepthRectangularHistoricalGraphView();
}

uint64_t type metadata accessor for DepthRectangularHistoricalGraphView()
{
  uint64_t result = qword_484C8;
  if (!qword_484C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1507C()
{
  sub_12190();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *sub_15134()
{
  unint64_t v0 = sub_3223C();
  sub_15188(v0);
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_15188(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_371E8();
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
  uint64_t v15 = sub_371E8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v6;
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
    uint64_t v9 = sub_37138();
    swift_bridgeObjectRelease();
    *unint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_15354(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_371E8();
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

  return sub_36EA8();
}

uint64_t sub_15354(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_371E8();
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
    uint64_t v10 = sub_371E8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_15618();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_66B8(&qword_484E0);
          uint64_t v12 = sub_15568(v16, i, a3);
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
    sub_AB28(0, &qword_484D8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_37228();
  __break(1u);
  return result;
}

void (*sub_15568(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_15674(v6, a2, a3);
  return sub_155D0;
}

void sub_155D0(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t sub_15618()
{
  unint64_t result = qword_484E8;
  if (!qword_484E8)
  {
    sub_AD00(&qword_484E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_484E8);
  }
  return result;
}

void (*sub_15674(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_37128();
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
    return sub_156F4;
  }
  __break(1u);
  return result;
}

void sub_156F4(id *a1)
{
}

id sub_156FC(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_66B8(&qword_481F0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  id v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  double v17 = (char *)&v30 - v16;
  __chkstk_darwin(v15);
  double v19 = (char *)&v30 - v18;
  sub_15C48(a1, (uint64_t)v10, type metadata accessor for DepthComplicationMetrics);
  if (swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v19, 1, 1, v4);
    sub_6980((uint64_t)v10, type metadata accessor for DepthComplicationMetrics);
  }
  else
  {
    sub_13570((uint64_t)v10, (uint64_t)v19);
  }
  uint64_t v20 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics];
  swift_beginAccess();
  sub_15B18((uint64_t)v19, v20);
  swift_endAccess();
  id v21 = *(char **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView];
  sub_15B80(v20, (uint64_t)v17);
  CGRect v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v22(v17, 1, v4))
  {
    sub_15BE8((uint64_t)v17);
    uint64_t v23 = 0;
  }
  else
  {
    sub_15C48((uint64_t)v17, (uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
    sub_15BE8((uint64_t)v17);
    uint64_t v23 = *(void *)&v7[*(int *)(v4 + 28)];
    swift_bridgeObjectRetain();
    sub_6980((uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
  }
  sub_15B80(v20, (uint64_t)v14);
  if (v22(v14, 1, v4))
  {
    sub_15BE8((uint64_t)v14);
    double v24 = 0.0;
  }
  else
  {
    sub_15C48((uint64_t)v14, (uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
    sub_15BE8((uint64_t)v14);
    double v24 = *(double *)&v7[*(int *)(v4 + 20)];
    sub_6980((uint64_t)v7, type metadata accessor for HistoricalDepthMetrics);
  }
  *(void *)&v21[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_graphData] = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2FC80(v24);
  [v21 setNeedsLayout];
  swift_bridgeObjectRelease();
  CGRect v25 = *(void **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel];
  id v26 = sub_14544();
  [v25 setAttributedText:v26];

  CGRect v27 = *(void **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel];
  sub_148F8();
  NSString v28 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v27 setText:v28];

  return [v2 setNeedsLayout];
}

uint64_t sub_15B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_481F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_15B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_481F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_15BE8(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_481F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_15C48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_15CB0()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_maxDepthLabel;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_durationLabel;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_graphView;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)type metadata accessor for DepthGraphView()) init];
  uint64_t v4 = &v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_metrics];
  uint64_t v5 = type metadata accessor for HistoricalDepthMetrics(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion35DepthRectangularHistoricalGraphView_alwaysOn] = 0;

  sub_371D8();
  __break(1u);
}

void sub_15DD0()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel;
  id v2 = objc_allocWithZone((Class)UILabel);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel;
  *(void *)&v3[v4] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v5 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel;
  *(void *)&v3[v5] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v6 = &v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_underwaterTime];
  uint64_t v7 = enum case for UnderwaterTime.zero(_:);
  uint64_t v8 = sub_36C38();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  id v9 = [objc_allocWithZone((Class)NSTextAttachment) init];
  *(void *)&v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_pauseSymbolAttachment] = v9;

  v62.receiver = v3;
  v62.super_class = (Class)type metadata accessor for TentativeEndTimerView(0);
  id v10 = objc_msgSendSuper2(&v62, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v11 = self;
  uint64_t v12 = qword_47C98;
  uint64_t v13 = (char *)v10;
  if (v12 != -1) {
    swift_once();
  }
  [(id)qword_49528 pointSize];
  id v14 = objc_msgSend(v11, "systemFontOfSize:");
  id v15 = [self configurationWithFont:v14];

  id v16 = v15;
  NSString v17 = sub_36DC8();
  id v18 = [self _systemImageNamed:v17 withConfiguration:v16];

  if (v18)
  {
    double v19 = self;
    id v20 = [v19 whiteColor];
    id v21 = [v18 imageWithTintColor:v20];

    uint64_t v22 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_pauseSymbolAttachment;
    int v60 = v21;
    [*(id *)&v13[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_pauseSymbolAttachment] setImage:v21];
    uint64_t v23 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel;
    id v24 = *(id *)&v13[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel];
    id v25 = [v19 whiteColor];
    [v24 setTextColor:v25];

    uint64_t v59 = v23;
    uint64_t v26 = qword_47CA0;
    id v27 = *(id *)&v13[v23];
    if (v26 != -1) {
      swift_once();
    }
    id v28 = [(id)qword_49530 fontWithSize:32.0];
    [v27 setFont:v28];

    uint64_t v58 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel;
    uint64_t v29 = qword_47C68;
    id v30 = *(id *)&v13[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel];
    if (v29 != -1) {
      swift_once();
    }
    uint64_t v61 = v16;
    [v30 setTextColor:qword_494F8];

    uint64_t v31 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel;
    id v32 = *(id *)&v13[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel];
    id v57 = v19;
    id v33 = [v19 grayColor];
    [v32 setTextColor:v33];

    sub_18A18();
    id v34 = [(id)swift_getObjCClassFromMetadata() attributedStringWithAttachment:*(void *)&v13[v22]];
    if (qword_47BE0 != -1) {
      swift_once();
    }
    id v35 = (id)qword_49468;
    NSString v36 = sub_36DC8();
    NSString v37 = sub_36DC8();
    id v38 = [v35 localizedStringForKey:v36 value:0 table:v37];

    sub_36DD8();
    id v39 = objc_allocWithZone((Class)NSAttributedString);
    NSString v40 = sub_36DC8();
    swift_bridgeObjectRelease();
    id v41 = [v39 initWithString:v40];

    [v34 appendAttributedString:v41];
    [*(id *)&v13[v58] setAttributedText:v34];
    uint64_t v42 = (void *)qword_49468;
    id v43 = *(id *)&v13[v31];
    id v44 = v42;
    NSString v45 = sub_36DC8();
    NSString v46 = sub_36DC8();
    id v47 = [v44 localizedStringForKey:v45 value:0 table:v46];

    sub_36DD8();
    NSString v48 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v43 setText:v48];

    uint64_t v49 = v13;
    id v50 = [v57 blackColor];
    [v49 setBackgroundColor:v50];

    uint64_t v51 = *(void **)&v13[v31];
    uint64_t v52 = qword_49528;
    id v53 = *(id *)&v13[v58];
    id v54 = v51;
    [v53 setFont:v52];
    [v49 addSubview:v53];

    uint64_t v55 = qword_49528;
    id v56 = v54;
    [v56 setFont:v55];
    [v49 addSubview:v56];

    [v49 addSubview:*(void *)&v13[v59]];
  }
  else
  {
    __break(1u);
  }
}

id sub_16570(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_36C38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = &v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_underwaterTime];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  swift_endAccess();
  id v9 = *(void **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel];
  if (qword_47BD0 != -1) {
    swift_once();
  }
  id v10 = objc_retain(*(id *)(*(void *)(qword_49428
                                      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                          + 16));
  sub_36C18();
  sub_36AD8();

  NSString v11 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v9 setText:v11];

  return [v2 setNeedsLayout];
}

id sub_16740()
{
  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for TentativeEndTimerView(0);
  objc_msgSendSuper2(&v22, "layoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel];
  [v1 intrinsicContentSize];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  objc_msgSend(v1, "setFrame:", 0.0, 0.0, v2, v4);
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel];
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  [v0 bounds];
  CGFloat Height = CGRectGetHeight(v23);
  CGFloat v12 = Height - v10;
  objc_msgSend(v6, "setFrame:", 0.0, Height - v10, v8, v10);
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel];
  [v13 intrinsicContentSize];
  double v15 = v14;
  double v17 = v16;
  v24.origin.x = 0.0;
  v24.origin.double y = v12;
  v24.size.double width = v8;
  v24.size.double height = v10;
  double MinY = CGRectGetMinY(v24);
  v25.origin.x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.double width = v3;
  v25.size.double height = v5;
  double v19 = MinY - CGRectGetMaxY(v25) + v17 * -0.5;
  if (v19 >= 0.0) {
    double v20 = -4.0;
  }
  else {
    double v20 = v19 + -4.0;
  }
  v26.origin.x = 0.0;
  v26.origin.double y = 0.0;
  v26.size.double width = v3;
  v26.size.double height = v5;
  return objc_msgSend(v13, "setFrame:", 0.0, CGRectGetMaxY(v26) + v20, v15, v17);
}

uint64_t sub_16924()
{
  uint64_t v1 = v0;
  sub_66B8(&qword_47D58);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_38160;
  *(void *)(v2 + 32) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel) layer];
  sub_36EA8();
  uint64_t v3 = v2;
  id v4 = [*(id *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel) layer];
  swift_bridgeObjectRetain();
  id v5 = v4;
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  id v6 = [*(id *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel) layer];
  swift_bridgeObjectRetain();
  id v7 = v6;
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return v3;
}

id sub_16B1C()
{
  return sub_184EC(type metadata accessor for TentativeEndTimerView);
}

uint64_t sub_16BE4()
{
  return type metadata accessor for TentativeEndTimerView(0);
}

uint64_t type metadata accessor for TentativeEndTimerView(uint64_t a1)
{
  return sub_114FC(a1, (uint64_t *)&unk_48548);
}

uint64_t sub_16C0C()
{
  uint64_t result = sub_36C38();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_16CB0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel;
  id v4 = objc_allocWithZone((Class)UILabel);
  id v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v7 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v8 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel;
  *(void *)&v5[v8] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v9 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel;
  *(void *)&v5[v9] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v10 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView;
  *(void *)&v5[v10] = [objc_allocWithZone((Class)type metadata accessor for TentativeEndTimerView(0)) init];
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_alwaysOn] = 0;
  v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_device] = a1;
  id v11 = objc_allocWithZone((Class)CLKDeviceMetrics);
  id v75 = a1;
  id v12 = objc_msgSend(v11, "initWithDevice:identitySizeClass:");
  *(void *)&v5[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_deviceMetrics] = v12;

  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v79.receiver = v5;
  v79.super_class = (Class)type metadata accessor for DepthRectangularLiveView(0);
  double v16 = (char *)objc_msgSendSuper2(&v79, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v16 setClipsToBounds:1];
  sub_66B8(&qword_47D58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_381D0;
  uint64_t v76 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel;
  id v18 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel];
  *(void *)(inited + 32) = v18;
  uint64_t v19 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel;
  double v20 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel];
  *(void *)(inited + 40) = v20;
  uint64_t v21 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel;
  objc_super v22 = *(void **)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel];
  *(void *)(inited + 48) = v22;
  uint64_t v77 = inited;
  sub_36EA8();
  unint64_t v23 = v77 & 0xC000000000000001;
  id v24 = v18;
  id v25 = v20;
  id v26 = v22;
  if ((v77 & 0xC000000000000001) != 0) {
    id v27 = (id)sub_37128();
  }
  else {
    id v27 = *(id *)(v77 + 32);
  }
  id v28 = v27;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v28 setFont:qword_49528];

  if (v23) {
    id v29 = (id)sub_37128();
  }
  else {
    id v29 = *(id *)(v77 + 40);
  }
  id v30 = v29;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v30 setFont:qword_49528];

  if (v23) {
    id v31 = (id)sub_37128();
  }
  else {
    id v31 = *(id *)(v77 + 48);
  }
  id v32 = v31;
  if (qword_47C98 != -1) {
    swift_once();
  }
  [v32 setFont:qword_49528];
  swift_bridgeObjectRelease();

  id v33 = *(void **)&v16[v21];
  id v34 = self;
  id v35 = v33;
  id v36 = [v34 grayColor];
  [v35 setTextColor:v36];

  uint64_t v37 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel;
  id v38 = *(id *)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel];
  id v39 = [v34 whiteColor];
  [v38 setTextColor:v39];

  uint64_t v40 = qword_47BE0;
  id v41 = *(id *)&v16[v76];
  if (v40 != -1) {
    swift_once();
  }
  id v42 = (id)qword_49468;
  NSString v43 = sub_36DC8();
  NSString v44 = sub_36DC8();
  id v45 = [v42 localizedStringForKey:v43 value:0 table:v44];

  sub_36DD8();
  sub_66FC();
  sub_37058();
  swift_bridgeObjectRelease();
  NSString v46 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v41 setText:v46];

  id v47 = *(id *)&v16[v19];
  NSString v48 = sub_36DC8();
  [v47 setText:v48];

  uint64_t v49 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel;
  id v50 = *(id *)&v16[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel];
  NSString v51 = sub_36DC8();
  [v50 setText:v51];

  id v52 = *(id *)&v16[v21];
  NSString v53 = sub_36DC8();
  [v52 setText:v53];

  id v54 = *(id *)&v16[v37];
  NSString v55 = sub_36DC8();
  [v54 setText:v55];

  uint64_t v56 = swift_initStackObject();
  *(_OWORD *)(v56 + 16) = xmmword_37F00;
  id v57 = *(void **)&v16[v49];
  *(void *)(v56 + 32) = v57;
  uint64_t v58 = *(void **)&v16[v37];
  *(void *)(v56 + 40) = v58;
  uint64_t v78 = v56;
  sub_36EA8();
  id v59 = v57;
  id v60 = v58;
  if ((v78 & 0xC000000000000001) != 0) {
    id v61 = (id)sub_37128();
  }
  else {
    id v61 = *(id *)(v78 + 32);
  }
  objc_super v62 = v61;
  if (qword_47CA0 != -1) {
    swift_once();
  }
  [v62 setFont:qword_49530];

  if ((v78 & 0xC000000000000001) != 0) {
    id v63 = (id)sub_37128();
  }
  else {
    id v63 = *(id *)(v78 + 40);
  }
  uint64_t v64 = v63;
  if (qword_47CA0 != -1) {
    swift_once();
  }
  [v64 setFont:qword_49530];
  swift_bridgeObjectRelease();

  uint64_t v65 = *(void **)&v16[v49];
  uint64_t v66 = *(void **)&v16[v19];
  uint64_t v67 = *(void **)&v16[v21];
  uint64_t v68 = *(void **)&v16[v37];
  id v69 = *(id *)&v16[v76];
  id v70 = v65;
  id v71 = v66;
  id v72 = v67;
  id v73 = v68;
  [v16 addSubview:v69];
  [v16 addSubview:v70];
  [v16 addSubview:v71];
  [v16 addSubview:v72];
  [v16 addSubview:v73];

  return v16;
}

uint64_t sub_174F0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v11 = (char *)&v22 - v10;
  uint64_t v12 = type metadata accessor for LiveMetrics(0);
  __chkstk_darwin(v12);
  double v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65F0(a1, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_186E4((uint64_t)v11, (uint64_t)v14);
    sub_65F0(a1, (uint64_t)v9);
    uint64_t v15 = (uint64_t)&v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_metrics];
    swift_beginAccess();
    sub_6654((uint64_t)v9, v15);
    swift_endAccess();
    v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_alwaysOn] = a2 & 1;
    char v16 = sub_36C08();
    if ((v16 & 1) != v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView])
    {
      v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView] = v16 & 1;
      uint64_t v17 = *(void *)&v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView];
      if (v16)
      {
        [v3 addSubview:*(void *)&v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView]];
        [v3 bringSubviewToFront:v17];
        id v18 = (objc_class *)type metadata accessor for DepthRectangularLiveView(0);
        v23.receiver = v3;
        v23.super_class = v18;
        objc_msgSendSuper2(&v23, "setNeedsLayout");
      }
      else
      {
        [*(id *)&v3[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView] removeFromSuperview];
      }
    }
    sub_1775C((uint64_t)v14);
    [v3 setNeedsLayout];
    [v3 layoutIfNeeded];
    uint64_t v19 = type metadata accessor for LiveMetrics;
    uint64_t v20 = (uint64_t)v14;
  }
  else
  {
    uint64_t v19 = type metadata accessor for DepthComplicationMetrics;
    uint64_t v20 = (uint64_t)v11;
  }
  return sub_18748(v20, v19);
}

void sub_1775C(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = &off_48000;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView) == 1)
  {
    uint64_t v5 = type metadata accessor for LiveMetrics(0);
    sub_16570(a1 + *(int *)(v5 + 20));
  }
  else
  {
    uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel);
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_alwaysOn) == 1)
    {
      NSString v7 = sub_36DC8();
      [v6 setText:v7];

      uint64_t v8 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel);
      NSString v9 = sub_36DC8();
      [v8 setText:v9];

      uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel);
      if (qword_47BE0 != -1) {
        swift_once();
      }
      id v11 = (id)qword_49468;
      NSString v12 = sub_36DC8();
      NSString v13 = sub_36DC8();
      id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

      sub_36DD8();
      NSString v15 = sub_36DC8();
      swift_bridgeObjectRelease();
      [v10 setText:v15];
      char v16 = &off_49000;
    }
    else
    {
      if (qword_47BD0 != -1) {
        swift_once();
      }
      swift_retain();
      sub_36A78();
      swift_release();
      NSString v17 = sub_36DC8();
      swift_bridgeObjectRelease();
      [v6 setText:v17];

      id v18 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel);
      uint64_t v19 = *(void **)(*(void *)(qword_49428
                                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                     + 16);
      type metadata accessor for LiveMetrics(0);
      id v20 = v19;
      sub_36C18();
      sub_36AD8();

      NSString v21 = sub_36DC8();
      char v16 = &off_49000;
      swift_bridgeObjectRelease();
      [v18 setText:v21];

      uint64_t v22 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel);
      id v23 = objc_retain(*(id *)(*(void *)(qword_49428
                                          + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                              + 16));
      sub_36C18();
      sub_36AC8();

      NSString v15 = sub_36DC8();
      swift_bridgeObjectRelease();
      [v22 setText:v15];
      id v4 = &off_48000;
    }

    id v24 = *(void **)((char *)v4[175] + v2);
    if (qword_47BD0 != -1) {
      swift_once();
    }
    id v25 = objc_retain(*(id *)(*(void *)((char *)v16[133]
                                        + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                            + 16));
    sub_36AB8();

    NSString v26 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v24 setText:v26];
  }
  if (sub_367E8())
  {
    if (qword_47C70 != -1) {
      swift_once();
    }
    id v27 = &qword_49500;
  }
  else
  {
    if (qword_47C68 != -1) {
      swift_once();
    }
    id v27 = &qword_494F8;
  }
  id v28 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel);
  id v29 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel);
  id v30 = *(void **)((char *)v4[175] + v2);
  id v37 = (id)*v27;
  id v31 = v28;
  id v32 = v29;
  id v33 = v30;
  [v31 setTextColor:v37];
  [v32 setTextColor:v37];
  [v33 setTextColor:v37];

  if ((sub_367E8() & 1) == 0)
  {
    id v34 = [v33 textColor];
    if (!v34)
    {
      __break(1u);
      return;
    }
    id v35 = v34;
    id v36 = [v34 colorWithAlphaComponent:0.7];

    [v33 setTextColor:v36];
  }
}

id sub_17D1C()
{
  if (v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView])
  {
    uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView];
    [v0 bounds];
    uint64_t v6 = v1;
  }
  else
  {
    [v0 bounds];
    double v7 = CGRectGetWidth(v48) * 0.4;
    double v8 = v7 + 2.0;
    NSString v9 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel];
    [v9 intrinsicContentSize];
    v49.size.double width = v10;
    double v12 = v11;
    v49.origin.x = 0.0;
    v49.origin.double y = 0.0;
    v49.size.double height = v12;
    double Width = CGRectGetWidth(v49);
    if (v7 < Width) {
      double Width = v7;
    }
    double v46 = Width;
    id v14 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel];
    [v14 intrinsicContentSize];
    CGFloat v16 = v15;
    double v18 = v17;
    [v0 bounds];
    double Height = CGRectGetHeight(v50);
    v51.origin.x = 0.0;
    v51.origin.double y = 0.0;
    v51.size.double width = v16;
    v51.size.double height = v18;
    double v20 = Height - CGRectGetHeight(v51);
    v52.origin.x = 0.0;
    v52.origin.double y = v20;
    v52.size.double width = v16;
    v52.size.double height = v18;
    double v21 = CGRectGetWidth(v52);
    if (v7 >= v21) {
      double v22 = v21;
    }
    else {
      double v22 = v7;
    }
    id v23 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel];
    [v23 intrinsicContentSize];
    CGFloat v25 = v24;
    double v27 = v26;
    [v0 bounds];
    double v28 = CGRectGetHeight(v53);
    v54.origin.x = 0.0;
    v54.origin.double y = 0.0;
    v54.size.double width = v25;
    v54.size.double height = v27;
    double v29 = v28 - CGRectGetHeight(v54);
    v55.origin.x = v8;
    v55.origin.double y = v29;
    v55.size.double width = v25;
    v55.size.double height = v27;
    double v30 = CGRectGetWidth(v55);
    [v0 bounds];
    double v31 = CGRectGetWidth(v56) - v8;
    if (v31 < v30) {
      double v30 = v31;
    }
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v46, v12);
    objc_msgSend(v14, "setFrame:", 0.0, v20, v22, v18);
    objc_msgSend(v23, "setFrame:", v8, v29, v30, v27);
    id v32 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel];
    [v32 intrinsicContentSize];
    double v34 = v33;
    double v36 = v35;
    [v0 bounds];
    CGFloat v37 = CGRectGetHeight(v57) * 0.5;
    v58.origin.x = 0.0;
    v58.origin.double y = 0.0;
    v58.size.double width = v34;
    v58.size.double height = v36;
    double v38 = v37 - CGRectGetHeight(v58) * 0.5;
    id v39 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel];
    [v39 intrinsicContentSize];
    v59.size.double width = v40;
    CGFloat v42 = v41;
    v59.origin.x = v8;
    v59.origin.double y = v38;
    v59.size.double height = v42;
    double v43 = CGRectGetWidth(v59);
    [v0 bounds];
    double v44 = CGRectGetWidth(v60) - v8;
    if (v44 < v43) {
      double v43 = v44;
    }
    objc_msgSend(v32, "setFrame:", 0.0, v38, v34, v36);
    uint64_t v6 = v39;
    double v2 = v8;
    double v3 = v38;
    double v4 = v43;
    double v5 = v42;
  }

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

uint64_t sub_1808C()
{
  uint64_t v1 = v0;
  sub_66B8(&qword_47D58);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_37F00;
  *(void *)(v2 + 32) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel) layer];
  *(void *)(v2 + 40) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel) layer];
  sub_36EA8();
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView);
  uint64_t v4 = v2;
  id v5 = [*(id *)(v3 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel) layer];
  swift_bridgeObjectRetain();
  id v6 = v5;
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v4 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return v4;
}

void *sub_181DC()
{
  id v1 = [*(id *)(*(void *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView)+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel) layer];
  sub_36E78();
  if (*(void *)((char *)&dword_10 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
    sub_36EB8();
  }
  sub_36EC8();
  sub_36EA8();

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_182A4()
{
  uint64_t v1 = v0;
  sub_66B8(&qword_47D58);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_381D0;
  *(void *)(v2 + 32) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel) layer];
  *(void *)(v2 + 40) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel) layer];
  *(void *)(v2 + 48) = [*(id *)(v1+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel) layer];
  sub_36EA8();
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView);
  uint64_t v4 = v2;
  id v5 = [*(id *)(v3 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel) layer];
  swift_bridgeObjectRetain();
  id v6 = v5;
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v4 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t sub_18414()
{
  uint64_t v0 = sub_1808C();
  uint64_t v1 = sub_181DC();
  sub_15188((unint64_t)v1);
  unint64_t v2 = sub_182A4();
  sub_15188(v2);
  unint64_t v3 = sub_16924();
  sub_15188(v3);
  return v0;
}

void sub_184A8()
{
}

id sub_184D4()
{
  return sub_184EC(type metadata accessor for DepthRectangularLiveView);
}

id sub_184EC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_185F0()
{
  return type metadata accessor for DepthRectangularLiveView(0);
}

uint64_t type metadata accessor for DepthRectangularLiveView(uint64_t a1)
{
  return sub_114FC(a1, (uint64_t *)&unk_485D8);
}

uint64_t sub_18618()
{
  uint64_t result = type metadata accessor for DepthComplicationMetrics(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_186E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LiveMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18748(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_187A8()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_timeValueLabel;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_divePausedLabel;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_diveToContinueLabel;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v4 = &v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21TentativeEndTimerView_underwaterTime];
  uint64_t v5 = enum case for UnderwaterTime.zero(_:);
  uint64_t v6 = sub_36C38();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);

  sub_371D8();
  __break(1u);
}

void sub_188C0()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthLabel;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthValueLabel;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_depthUnitLabel;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeUnitLabel;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v5 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_timeValueLabel;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_tentativeTimeView;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)type metadata accessor for TentativeEndTimerView(0)) init];
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_alwaysOn] = 0;
  v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion24DepthRectangularLiveView_showTentativeView] = 0;

  sub_371D8();
  __break(1u);
}

unint64_t sub_18A18()
{
  unint64_t result = qword_484F0;
  if (!qword_484F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_484F0);
  }
  return result;
}

uint64_t sub_18A58(id a1, uint64_t a2, uint64_t a3, char a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  if (a4)
  {
    id v15 = [a1 filtersForView:a2 style:0];
    if (v15)
    {
      CGFloat v16 = v15;
      sub_197A0();
      unint64_t v14 = sub_36E98();
    }
    else
    {
      unint64_t v14 = 0;
    }
    id v20 = [a1 filtersForView:a2 style:1];
    if (v20)
    {
      double v21 = v20;
      sub_197A0();
      unint64_t v19 = sub_36E98();
    }
    else
    {
      unint64_t v19 = 0;
    }
    id v22 = [a1 filtersForView:a2 style:2];
    if (v22) {
      goto LABEL_14;
    }
LABEL_17:
    unint64_t v84 = 0;
    goto LABEL_18;
  }
  id v12 = [a1 filtersForView:a2 style:0 fraction:*(double *)&a3];
  if (v12)
  {
    NSString v13 = v12;
    sub_197A0();
    unint64_t v14 = sub_36E98();
  }
  else
  {
    unint64_t v14 = 0;
  }
  id v17 = [a1 filtersForView:a2 style:1 fraction:*(double *)&a3];
  if (v17)
  {
    double v18 = v17;
    sub_197A0();
    unint64_t v19 = sub_36E98();
  }
  else
  {
    unint64_t v19 = 0;
  }
  id v22 = [a1 filtersForView:a2 style:2 fraction:*(double *)&a3];
  if (!v22) {
    goto LABEL_17;
  }
LABEL_14:
  id v23 = v22;
  sub_197A0();
  unint64_t v84 = sub_36E98();

LABEL_18:
  unint64_t v79 = a6;
  if (a5 >> 62) {
    goto LABEL_84;
  }
  uint64_t v24 = *(void *)((char *)&dword_10 + (a5 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
LABEL_20:
  if (v24)
  {
    uint64_t v25 = 0;
    unint64_t v26 = a5 & 0xC000000000000001;
    unint64_t v74 = a5 + 32;
    uint64_t v76 = v24;
    unint64_t v77 = a5;
    unint64_t v75 = a5 & 0xC000000000000001;
    while (1)
    {
      if (v26) {
        id v28 = (id)sub_37128();
      }
      else {
        id v28 = *(id *)(v74 + 8 * v25);
      }
      double v29 = v28;
      BOOL v30 = __OFADD__(v25++, 1);
      if (v30)
      {
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        swift_bridgeObjectRetain();
        uint64_t v24 = sub_371E8();
        goto LABEL_20;
      }
      if (v14) {
        break;
      }
      Class isa = 0;
LABEL_23:
      [v29 setFilters:isa];

      if (v25 == v24) {
        goto LABEL_49;
      }
    }
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_371E8();
      swift_bridgeObjectRelease();
      id v83 = v29;
      if (v31) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
      id v83 = v28;
      if (v31)
      {
LABEL_31:
        double v86 = &_swiftEmptyArrayStorage;
        sub_32F18(0, v31 & ~(v31 >> 63), 0);
        if (v31 < 0) {
          goto LABEL_82;
        }
        if ((v14 & 0xC000000000000001) != 0)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            sub_37128();
            sub_197A0();
            swift_dynamicCast();
            double v33 = v86;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_32F18(0, v33[2] + 1, 1);
              double v33 = v86;
            }
            unint64_t v35 = v33[2];
            unint64_t v34 = v33[3];
            if (v35 >= v34 >> 1)
            {
              sub_32F18(v34 > 1, v35 + 1, 1);
              double v33 = v86;
            }
            v33[2] = v35 + 1;
            sub_197E0(v85, &v33[4 * v35 + 4]);
          }
        }
        else
        {
          sub_197A0();
          double v36 = (id *)(v14 + 32);
          do
          {
            id v37 = *v36;
            swift_dynamicCast();
            double v38 = v86;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_32F18(0, v38[2] + 1, 1);
              double v38 = v86;
            }
            unint64_t v40 = v38[2];
            unint64_t v39 = v38[3];
            if (v40 >= v39 >> 1)
            {
              sub_32F18(v39 > 1, v40 + 1, 1);
              double v38 = v86;
            }
            v38[2] = v40 + 1;
            sub_197E0(v85, &v38[4 * v40 + 4]);
            ++v36;
            --v31;
          }
          while (v31);
        }
        uint64_t v24 = v76;
        a5 = v77;
        unint64_t v26 = v75;
      }
    }
    Class isa = sub_36E88().super.isa;
    swift_bridgeObjectRelease();
    double v29 = v83;
    goto LABEL_23;
  }
LABEL_49:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a5 = v79;
  unint64_t v41 = a7;
  if (v79 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_371E8();
    if (v42) {
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v42 = *(void *)((char *)&dword_10 + (v79 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v42)
    {
LABEL_51:
      unint64_t v14 = 0;
      unint64_t v43 = v79 & 0xC000000000000001;
      uint64_t v81 = v42;
      while (1)
      {
        if (v43) {
          id v45 = (id)sub_37128();
        }
        else {
          id v45 = *(id *)(v79 + 32 + 8 * v14);
        }
        double v46 = v45;
        BOOL v30 = __OFADD__(v14++, 1);
        if (v30) {
          goto LABEL_81;
        }
        if (v19) {
          break;
        }
        Class v44 = 0;
LABEL_53:
        [v46 setFilters:v44];

        if (v14 == v42)
        {
          swift_bridgeObjectRelease();
          unint64_t v41 = a7;
          goto LABEL_87;
        }
      }
      if (v19 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_371E8();
        swift_bridgeObjectRelease();
        if (v47) {
          goto LABEL_61;
        }
      }
      else
      {
        uint64_t v47 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8));
        if (v47)
        {
LABEL_61:
          double v86 = &_swiftEmptyArrayStorage;
          sub_32F18(0, v47 & ~(v47 >> 63), 0);
          if (v47 < 0) {
            goto LABEL_83;
          }
          if ((v19 & 0xC000000000000001) != 0)
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              sub_37128();
              sub_197A0();
              swift_dynamicCast();
              CGRect v49 = v86;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_32F18(0, v49[2] + 1, 1);
                CGRect v49 = v86;
              }
              unint64_t v51 = v49[2];
              unint64_t v50 = v49[3];
              if (v51 >= v50 >> 1)
              {
                sub_32F18(v50 > 1, v51 + 1, 1);
                CGRect v49 = v86;
              }
              v49[2] = v51 + 1;
              sub_197E0(v85, &v49[4 * v51 + 4]);
            }
          }
          else
          {
            sub_197A0();
            CGRect v52 = (id *)(v19 + 32);
            do
            {
              id v53 = *v52;
              swift_dynamicCast();
              CGRect v54 = v86;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_32F18(0, v54[2] + 1, 1);
                CGRect v54 = v86;
              }
              unint64_t v56 = v54[2];
              unint64_t v55 = v54[3];
              if (v56 >= v55 >> 1)
              {
                sub_32F18(v55 > 1, v56 + 1, 1);
                CGRect v54 = v86;
              }
              v54[2] = v56 + 1;
              sub_197E0(v85, &v54[4 * v56 + 4]);
              ++v52;
              --v47;
            }
            while (v47);
          }
          unint64_t v43 = v79 & 0xC000000000000001;
          a5 = v79;
          uint64_t v42 = v81;
        }
      }
      Class v44 = sub_36E88().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
  }
  swift_bridgeObjectRelease();
LABEL_87:
  swift_bridgeObjectRelease();
  if (v41 >> 62) {
    goto LABEL_120;
  }
  uint64_t v57 = *(void *)((char *)&dword_10 + (v41 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (v57)
  {
LABEL_89:
    uint64_t v58 = 0;
    unint64_t v59 = v41 & 0xC000000000000001;
    uint64_t v82 = v57;
    unint64_t v78 = v41 + 32;
    while (1)
    {
      if (v59) {
        id v61 = (id)sub_37128();
      }
      else {
        id v61 = *(id *)(v78 + 8 * v58);
      }
      objc_super v62 = v61;
      BOOL v30 = __OFADD__(v58++, 1);
      if (v30)
      {
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        swift_bridgeObjectRetain();
        uint64_t v57 = sub_371E8();
        if (!v57) {
          goto LABEL_121;
        }
        goto LABEL_89;
      }
      if (v84) {
        break;
      }
      Class v60 = 0;
LABEL_91:
      [v62 setFilters:v60];

      if (v58 == v57) {
        goto LABEL_121;
      }
    }
    if (v84 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_371E8();
      swift_bridgeObjectRelease();
      if (v63) {
        goto LABEL_99;
      }
    }
    else
    {
      uint64_t v63 = *(void *)((char *)&dword_10 + (v84 & 0xFFFFFFFFFFFFFF8));
      if (v63)
      {
LABEL_99:
        double v86 = &_swiftEmptyArrayStorage;
        sub_32F18(0, v63 & ~(v63 >> 63), 0);
        if (v63 < 0) {
          goto LABEL_119;
        }
        if ((v84 & 0xC000000000000001) != 0)
        {
          for (uint64_t k = 0; k != v63; ++k)
          {
            sub_37128();
            sub_197A0();
            swift_dynamicCast();
            uint64_t v65 = v86;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_32F18(0, v65[2] + 1, 1);
              uint64_t v65 = v86;
            }
            unint64_t v67 = v65[2];
            unint64_t v66 = v65[3];
            if (v67 >= v66 >> 1)
            {
              sub_32F18(v66 > 1, v67 + 1, 1);
              uint64_t v65 = v86;
            }
            v65[2] = v67 + 1;
            sub_197E0(v85, &v65[4 * v67 + 4]);
          }
        }
        else
        {
          sub_197A0();
          uint64_t v68 = (id *)(v84 + 32);
          do
          {
            id v69 = *v68;
            swift_dynamicCast();
            id v70 = v86;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_32F18(0, v70[2] + 1, 1);
              id v70 = v86;
            }
            unint64_t v72 = v70[2];
            unint64_t v71 = v70[3];
            if (v72 >= v71 >> 1)
            {
              sub_32F18(v71 > 1, v72 + 1, 1);
              id v70 = v86;
            }
            v70[2] = v72 + 1;
            sub_197E0(v85, &v70[4 * v72 + 4]);
            ++v68;
            --v63;
          }
          while (v63);
        }
        unint64_t v41 = a7;
        uint64_t v57 = v82;
      }
    }
    Class v60 = sub_36E88().super.isa;
    swift_bridgeObjectRelease();
    goto LABEL_91;
  }
LABEL_121:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1956C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_371E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  NSString v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_32F18(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_37128();
        sub_197A0();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_32F18(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_32F18(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_197E0(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      double v8 = (id *)(a1 + 32);
      sub_197A0();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_32F18(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_32F18(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_197E0(v12, &v3[4 * v11 + 4]);
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

unint64_t sub_197A0()
{
  unint64_t result = qword_48A70;
  if (!qword_48A70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48A70);
  }
  return result;
}

_OWORD *sub_197E0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_197F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v27 = sub_66B8(&qword_48658);
  __chkstk_darwin(v27);
  long long v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36BE8();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_36D38();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36D68();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  CGFloat v16 = (char *)&v24 - v15;
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
  sub_36CE8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_36B98();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
  uint64_t v18 = *(int *)(v27 + 48);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v2, v16, v10);
  v2[v18] = 0;
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v2, v10);
  if (v19 == enum case for WaterTemperatureUnit.celcius(_:)
    || v19 == enum case for WaterTemperatureUnit.fahrenheit(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v14, v19, v10);
    uint64_t v20 = v28;
    sub_36C98();
    uint64_t v21 = enum case for Temperature.temperature(_:);
    uint64_t v22 = sub_36B88();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  else
  {
    uint64_t result = sub_37258();
    __break(1u);
  }
  return result;
}

uint64_t sub_19BF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v27 = sub_66B8(&qword_48658);
  __chkstk_darwin(v27);
  long long v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36BE8();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_36D38();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36D68();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  CGFloat v16 = (char *)&v24 - v15;
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
  sub_36CE8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_36B98();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
  uint64_t v18 = *(int *)(v27 + 48);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v2, v16, v10);
  v2[v18] = 1;
  uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v2, v10);
  if (v19 == enum case for WaterTemperatureUnit.celcius(_:)
    || v19 == enum case for WaterTemperatureUnit.fahrenheit(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v14, v19, v10);
    uint64_t v20 = v28;
    sub_36C98();
    uint64_t v21 = enum case for Temperature.temperature(_:);
    uint64_t v22 = sub_36B88();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
  else
  {
    uint64_t result = sub_37258();
    __break(1u);
  }
  return result;
}

BOOL sub_1A004()
{
  uint64_t v0 = sub_36718();
  uint64_t v66 = *(void *)(v0 - 8);
  uint64_t v67 = v0;
  __chkstk_darwin(v0);
  uint64_t v65 = (char *)&v48 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_36BE8();
  Class v60 = *(void (**)(char *, uint64_t))(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v63 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_36D38();
  uint64_t v68 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_36D68();
  uint64_t v5 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  unint64_t v59 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_66B8(&qword_48648);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v58 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = sub_36B88();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  CGFloat v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v48 - v17;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))((char *)&v48 - v17, enum case for Temperature.unknown(_:), v12);
  char v19 = sub_36B78();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v13 + 8);
  v20(v18, v12);
  if (v19) {
    return 0;
  }
  sub_36B68();
  uint64_t v21 = sub_36CB8();
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
  if (v55(v11, 1, v21) == 1) {
    goto LABEL_6;
  }
  uint64_t v56 = v22;
  uint64_t v54 = v21;
  uint64_t v57 = v5;
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  uint64_t v24 = v68;
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
  uint64_t v26 = v4;
  uint64_t v27 = v23;
  uint64_t v28 = v62;
  uint64_t v52 = v68 + 16;
  unint64_t v51 = v25;
  v25(v4, v27, v62);
  double v29 = v63;
  sub_36CE8();
  BOOL v30 = *(void (**)(char *, uint64_t))(v24 + 8);
  id v53 = v26;
  uint64_t v68 = v24 + 8;
  unint64_t v50 = v30;
  v30(v26, v28);
  uint64_t v31 = v59;
  sub_36B98();
  CGRect v48 = (void (*)(char *, uint64_t))*((void *)v60 + 1);
  v48(v29, v64);
  sub_36CA8();
  double v33 = v32;
  unint64_t v34 = *(void (**)(char *, uint64_t))(v57 + 8);
  v57 += 8;
  Class v60 = v34;
  v34(v31, v61);
  unint64_t v35 = *(void (**)(char *, uint64_t))(v56 + 8);
  uint64_t v36 = v54;
  v56 += 8;
  CGRect v49 = v35;
  v35(v11, v54);
  sub_197F0((uint64_t)v16);
  uint64_t v11 = v58;
  sub_36B68();
  v20(v16, v12);
  if (v55(v11, 1, v36) == 1)
  {
LABEL_6:
    sub_1E108((uint64_t)v11);
    id v37 = v65;
    sub_368F8();
    double v38 = sub_36708();
    os_log_type_t v39 = sub_36F38();
    if (os_log_type_enabled(v38, v39))
    {
      unint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v40 = 0;
      _os_log_impl(&dword_0, v38, v39, "Unable to convert temperatures for comparison.", v40, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v66 + 8))(v37, v67);
    return 0;
  }
  uint64_t v42 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  unint64_t v43 = v53;
  uint64_t v44 = v62;
  v51(v53, v42, v62);
  id v45 = v63;
  sub_36CE8();
  v50(v43, v44);
  sub_36B98();
  v48(v45, v64);
  sub_36CA8();
  double v47 = v46;
  v60(v31, v61);
  v49(v11, v36);
  return v33 < v47;
}

BOOL sub_1A78C()
{
  uint64_t v0 = sub_36718();
  uint64_t v43 = *(void *)(v0 - 8);
  uint64_t v44 = v0;
  __chkstk_darwin(v0);
  uint64_t v42 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_66B8(&qword_48648);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  unint64_t v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - v5;
  uint64_t v7 = sub_36BE8();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36D38();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_36D68();
  uint64_t v48 = *(void *)(v14 - 8);
  uint64_t v49 = v14;
  __chkstk_darwin(v14);
  double v47 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_36B88();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v40 = (uint64_t)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v39 - v20;
  (*(void (**)(char *, void, uint64_t))(v17 + 104))((char *)&v39 - v20, enum case for Temperature.unknown(_:), v16);
  char v22 = sub_36B78();
  os_log_type_t v39 = *(void (**)(char *, uint64_t))(v17 + 8);
  v39(v21, v16);
  if (v22) {
    return 0;
  }
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v23, v10);
  sub_36CE8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v24 = v47;
  sub_36B98();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v9, v46);
  sub_36B68();
  uint64_t v25 = sub_36CB8();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v6, 1, v25) == 1) {
    goto LABEL_6;
  }
  sub_36CA8();
  double v29 = v28;
  BOOL v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v30(v6, v25);
  uint64_t v31 = v40;
  sub_19BF4(v40);
  uint64_t v6 = v41;
  sub_36B68();
  v39((char *)v31, v16);
  if (v27(v6, 1, v25) == 1)
  {
LABEL_6:
    sub_1E108((uint64_t)v6);
    double v32 = v42;
    sub_368F8();
    double v33 = sub_36708();
    os_log_type_t v34 = sub_36F38();
    if (os_log_type_enabled(v33, v34))
    {
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v35 = 0;
      _os_log_impl(&dword_0, v33, v34, "Unable to convert temperatures for comparison.", v35, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v44);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v49);
    return 0;
  }
  sub_36CA8();
  double v38 = v37;
  v30(v6, v25);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v49);
  return v38 < v29;
}

id sub_1AE28(uint64_t a1)
{
  if (a1 == 8)
  {
    return sub_1B29C();
  }
  else if (a1 == 10)
  {
    id v3 = sub_1D600();
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1) {
      uint64_t v4 = sub_1E36C(1);
    }
    else {
      uint64_t v4 = (uint64_t)sub_1AF9C();
    }
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (void *)sub_1CEB8();
    id v7 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCircularOpenGaugeImage) initWithGaugeProvider:v3 bottomImageProvider:v5 centerTextProvider:v6];

    return v7;
  }
  else
  {
    sub_37108(45);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = sub_37248();
    sub_36E48(v9);
    swift_bridgeObjectRelease();
    id result = (id)sub_371D8();
    __break(1u);
  }
  return result;
}

id sub_1AF9C()
{
  uint64_t v1 = sub_36B88();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v0;
  uint64_t v5 = enum case for Temperature.unknown(_:);
  uint64_t v6 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v6(v4, enum case for Temperature.unknown(_:), v1);
  sub_36B78();
  id v7 = *(void (**)(char *, uint64_t))(v2 + 8);
  v7(v4, v1);
  NSString v8 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v9 = [self symbolImageProviderWithSystemName:v8];

  v6(v4, v5, v1);
  LOBYTE(v6) = sub_36B78();
  v7(v4, v1);
  if (v6)
  {
    id v10 = [self whiteColor];
  }
  else if (*(unsigned char *)(v14 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_historical) == 1)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    id v10 = (id)qword_49490;
  }
  else
  {
    id v10 = [objc_allocWithZone((Class)UIColor) initWithRed:0.384313725 green:0.796078431 blue:0.980392157 alpha:1.0];
  }
  uint64_t v11 = v10;
  [v9 setTintColor:v10];

  return v9;
}

void sub_1B250(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_1B29C()
{
  uint64_t v1 = sub_36B88();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for Temperature.unknown(_:), v1);
  char v5 = sub_36B78();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0
    || *(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1)
  {
    id v6 = sub_1D600();
    id v7 = (void *)sub_1B46C();
    NSString v8 = (void *)sub_1BD74();
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1) {
      uint64_t v9 = sub_1E36C(0);
    }
    else {
      uint64_t v9 = (uint64_t)sub_1ECD0();
    }
    id v10 = (void *)v9;
    id v11 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCornerGaugeImage) initWithGaugeProvider:v6 leadingTextProvider:v7 trailingTextProvider:v8 imageProvider:v9];
  }
  else
  {
    id v6 = sub_1D600();
    id v7 = (void *)sub_1B46C();
    NSString v8 = (void *)sub_1BD74();
    id v10 = (void *)sub_1C680();
    id v11 = [objc_allocWithZone((Class)CLKComplicationTemplateGraphicCornerGaugeText) initWithGaugeProvider:v6 leadingTextProvider:v7 trailingTextProvider:v8 outerTextProvider:v10];
  }
  id v12 = v11;

  return v12;
}

uint64_t sub_1B46C()
{
  uint64_t v65 = sub_66B8(&qword_48650);
  __chkstk_darwin(v65);
  uint64_t v1 = (char *)&v55 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_36D68();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v68 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_36BE8();
  uint64_t v3 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  char v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_66B8(&qword_480D0);
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  __chkstk_darwin(v6);
  id v70 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_36CB8();
  uint64_t v8 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  id v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_36B88();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v55 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v55 - v19;
  sub_197F0((uint64_t)&v55 - v19);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v66 = v1;
  uint64_t v21 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
  char v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  unint64_t v74 = v20;
  uint64_t v63 = v22;
  uint64_t v64 = v12 + 16;
  v22(v18, (uint64_t)v20, v11);
  uint64_t v62 = *(uint64_t (**)(char *, uint64_t))(v12 + 88);
  uint64_t v60 = v12 + 88;
  int v23 = v62(v18, v11);
  unint64_t v77 = v15;
  uint64_t v78 = v11;
  int v61 = enum case for Temperature.temperature(_:);
  if (v23 == enum case for Temperature.temperature(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v18, v11);
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    unint64_t v59 = v10;
    v24(v10, v18, v75);
    uint64_t v25 = v21;
    uint64_t v26 = v12;
    uint64_t v57 = v25 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings;
    swift_retain();
    sub_36CE8();
    uint64_t v27 = v68;
    sub_36B98();
    uint64_t v56 = *(void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v28 = v67;
    v56(v5, v67);
    sub_36CA8();
    uint64_t v58 = v8;
    double v29 = *(void (**)(char *, uint64_t))(v69 + 8);
    uint64_t v30 = v71;
    v29(v27, v71);
    sub_36CE8();
    sub_36B98();
    v56(v5, v28);
    sub_36D58();
    v29(v27, v30);
    uint64_t v11 = v78;
    sub_AB28(0, &qword_480D8);
    uint64_t v31 = v70;
    sub_365D8();
    v79[0] = sub_36FD8();
    v79[1] = v32;
    swift_retain();
    sub_1E168(v79, v25);
    swift_release();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v73);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v75);
    swift_release();
  }
  else
  {
    if (v23 != enum case for Temperature.unknown(_:))
    {
      swift_retain();
      sub_37258();
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v26 = v12;
  }
  double v33 = *(void (**)(char *, uint64_t))(v26 + 8);
  v33(v74, v11);
  NSString v34 = sub_36DC8();
  swift_bridgeObjectRelease();
  uint64_t v18 = (char *)[self textProviderWithText:v34];

  if (*(unsigned char *)(v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1)
  {
    uint64_t v35 = qword_47BF8;
    uint64_t v36 = v18;
    if (v35 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49488;
LABEL_23:
    id v46 = v37;
    uint64_t v47 = v78;
LABEL_24:
    [v18 setTintColor:v46];

    unint64_t v50 = v18;
    uint64_t v51 = (uint64_t)v77;
    sub_197F0((uint64_t)v77);
    sub_1E79C(v51);
    v33((char *)v51, v47);
    NSString v52 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v50 setAccessibilityLabel:v52];

    return (uint64_t)v50;
  }
  if (*(unsigned char *)(v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_historical))
  {
    uint64_t v38 = qword_47C00;
    os_log_type_t v39 = v18;
    if (v38 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49490;
    goto LABEL_23;
  }
  uint64_t v40 = v66;
  uint64_t v41 = *(int *)(v65 + 48);
  uint64_t v42 = v78;
  v63(v66, v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature, v78);
  v40[v41] = 0;
  int v43 = v62(v40, v42);
  if (v43 == v61)
  {
    uint64_t v44 = qword_47CB8;
    uint64_t v45 = v18;
    if (v44 != -1) {
      swift_once();
    }
    id v46 = (id)qword_49548;
    uint64_t v47 = v78;
    v33(v40, v78);
    goto LABEL_24;
  }
  if (v43 == enum case for Temperature.unknown(_:))
  {
    uint64_t v48 = qword_47CA8;
    uint64_t v49 = v18;
    if (v48 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49538;
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v54 = v18;
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_1BD74()
{
  uint64_t v65 = sub_66B8(&qword_48650);
  __chkstk_darwin(v65);
  uint64_t v1 = (char *)&v55 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_36D68();
  uint64_t v69 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v68 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_36BE8();
  uint64_t v3 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  char v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_66B8(&qword_480D0);
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  __chkstk_darwin(v6);
  id v70 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_36CB8();
  uint64_t v8 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  id v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_36B88();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v55 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v55 - v19;
  sub_19BF4((uint64_t)&v55 - v19);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v66 = v1;
  uint64_t v21 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
  char v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  unint64_t v74 = v20;
  uint64_t v63 = v22;
  uint64_t v64 = v12 + 16;
  v22(v18, (uint64_t)v20, v11);
  uint64_t v62 = *(uint64_t (**)(char *, uint64_t))(v12 + 88);
  uint64_t v60 = v12 + 88;
  int v23 = v62(v18, v11);
  unint64_t v77 = v15;
  uint64_t v78 = v11;
  int v61 = enum case for Temperature.temperature(_:);
  if (v23 == enum case for Temperature.temperature(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v18, v11);
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    unint64_t v59 = v10;
    v24(v10, v18, v75);
    uint64_t v25 = v21;
    uint64_t v26 = v12;
    uint64_t v57 = v25 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings;
    swift_retain();
    sub_36CE8();
    uint64_t v27 = v68;
    sub_36B98();
    uint64_t v56 = *(void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v28 = v67;
    v56(v5, v67);
    sub_36CA8();
    uint64_t v58 = v8;
    double v29 = *(void (**)(char *, uint64_t))(v69 + 8);
    uint64_t v30 = v71;
    v29(v27, v71);
    sub_36CE8();
    sub_36B98();
    v56(v5, v28);
    sub_36D58();
    v29(v27, v30);
    uint64_t v11 = v78;
    sub_AB28(0, &qword_480D8);
    uint64_t v31 = v70;
    sub_365D8();
    v79[0] = sub_36FD8();
    v79[1] = v32;
    swift_retain();
    sub_1E168(v79, v25);
    swift_release();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v31, v73);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v75);
    swift_release();
  }
  else
  {
    if (v23 != enum case for Temperature.unknown(_:))
    {
      swift_retain();
      sub_37258();
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v26 = v12;
  }
  double v33 = *(void (**)(char *, uint64_t))(v26 + 8);
  v33(v74, v11);
  NSString v34 = sub_36DC8();
  swift_bridgeObjectRelease();
  uint64_t v18 = (char *)[self textProviderWithText:v34];

  if (*(unsigned char *)(v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1)
  {
    uint64_t v35 = qword_47BF8;
    uint64_t v36 = v18;
    if (v35 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49488;
LABEL_23:
    id v46 = v37;
    uint64_t v47 = v78;
LABEL_24:
    [v18 setTintColor:v46];

    unint64_t v50 = v18;
    uint64_t v51 = (uint64_t)v77;
    sub_19BF4((uint64_t)v77);
    sub_1E79C(v51);
    v33((char *)v51, v47);
    NSString v52 = sub_36DC8();
    swift_bridgeObjectRelease();
    [v50 setAccessibilityLabel:v52];

    return (uint64_t)v50;
  }
  if (*(unsigned char *)(v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_historical))
  {
    uint64_t v38 = qword_47C00;
    os_log_type_t v39 = v18;
    if (v38 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49490;
    goto LABEL_23;
  }
  uint64_t v40 = v66;
  uint64_t v41 = *(int *)(v65 + 48);
  uint64_t v42 = v78;
  v63(v66, v76 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature, v78);
  v40[v41] = 1;
  int v43 = v62(v40, v42);
  if (v43 == v61)
  {
    uint64_t v44 = qword_47CC0;
    uint64_t v45 = v18;
    if (v44 != -1) {
      swift_once();
    }
    id v46 = (id)qword_49550;
    uint64_t v47 = v78;
    v33(v40, v78);
    goto LABEL_24;
  }
  if (v43 == enum case for Temperature.unknown(_:))
  {
    uint64_t v48 = qword_47CB0;
    uint64_t v49 = v18;
    if (v48 != -1) {
      swift_once();
    }
    double v37 = (void *)qword_49540;
    goto LABEL_23;
  }
LABEL_26:
  uint64_t v54 = v18;
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_1C680()
{
  uint64_t v1 = sub_36D68();
  uint64_t v61 = *(void *)(v1 - 8);
  uint64_t v62 = v1;
  __chkstk_darwin(v1);
  uint64_t v58 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36BE8();
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  __chkstk_darwin(v3);
  uint64_t v54 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_66B8(&qword_480D0);
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  __chkstk_darwin(v5);
  uint64_t v57 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36CB8();
  uint64_t v64 = *(void *)(v7 - 8);
  uint64_t v65 = v7;
  __chkstk_darwin(v7);
  uint64_t v63 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36B88();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v53 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v53 - v17;
  uint64_t v19 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature;
  uint64_t v20 = enum case for Temperature.unknown(_:);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v21(v16, enum case for Temperature.unknown(_:), v9);
  char v22 = sub_36B78();
  int v23 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  uint64_t v69 = v9;
  uint64_t v66 = v23;
  uint64_t v67 = v10 + 8;
  v23((uint64_t)v16, v9);
  if ((v22 & 1) != 0
    || *(unsigned char *)(v68 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1)
  {
    uint64_t v24 = (uint64_t)v18;
    v21(v18, v20, v69);
  }
  else
  {
    uint64_t v24 = (uint64_t)v18;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v18, v19, v69);
  }
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v25 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
  uint64_t v26 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v24, v69);
  int v27 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v13, v26);
  if (v27 == enum case for Temperature.temperature(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v13, v69);
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v13, v65);
    swift_retain();
    uint64_t v28 = v54;
    sub_36CE8();
    uint64_t v53 = v24;
    double v29 = v58;
    sub_36B98();
    uint64_t v30 = v56;
    uint64_t v31 = *(void (**)(char *, uint64_t))(v55 + 8);
    v31(v28, v56);
    sub_36CA8();
    uint64_t v32 = v62;
    uint64_t v55 = v25;
    double v33 = *(void (**)(char *, uint64_t))(v61 + 8);
    v33(v29, v62);
    sub_36CE8();
    sub_36B98();
    v31(v28, v30);
    sub_36D58();
    NSString v34 = v29;
    uint64_t v24 = v53;
    v33(v34, v32);
    sub_AB28(0, &qword_480D8);
    uint64_t v35 = v57;
    sub_365D8();
    uint64_t v36 = sub_36FD8();
    uint64_t v38 = v37;
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v60);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
    swift_release();
  }
  else
  {
    if (v27 != v20)
    {
      swift_retain();
      uint64_t result = sub_37258();
      __break(1u);
      return result;
    }
    uint64_t v38 = (void *)0xE200000000000000;
    uint64_t v36 = 11565;
  }
  if (sub_1A004() || sub_1A78C())
  {
    uint64_t v70 = 126;
    unint64_t v71 = 0xE100000000000000;
    v72._countAndFlagsBits = v36;
    v72._object = v38;
    sub_36E48(v72);
    swift_bridgeObjectRelease();
  }
  NSString v39 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v40 = [self textProviderWithText:v39];

  uint64_t v41 = qword_47BE0;
  id v42 = v40;
  if (v41 != -1) {
    swift_once();
  }
  id v43 = (id)qword_49468;
  NSString v44 = sub_36DC8();
  NSString v45 = sub_36DC8();
  id v46 = [v43 localizedStringForKey:v44 value:0 table:v45];

  sub_36DD8();
  sub_66B8(&qword_483A8);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_38040;
  uint64_t v48 = sub_1E79C(v24);
  uint64_t v50 = v49;
  *(void *)(v47 + 56) = &type metadata for String;
  *(void *)(v47 + 64) = sub_13760();
  *(void *)(v47 + 32) = v48;
  *(void *)(v47 + 40) = v50;
  sub_36DE8();
  swift_bridgeObjectRelease();
  NSString v51 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v42 setAccessibilityLabel:v51];

  v66(v24, v69);
  return (uint64_t)v42;
}

uint64_t sub_1CEB8()
{
  uint64_t v51 = sub_36D68();
  uint64_t v49 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v48 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_36BE8();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  __chkstk_darwin(v2);
  NSString v45 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_66B8(&qword_480D0);
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  __chkstk_darwin(v4);
  uint64_t v50 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_36CB8();
  uint64_t v56 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v55 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36B88();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v44 - v13;
  __chkstk_darwin(v12);
  uint64_t v60 = v0;
  uint64_t v61 = (char *)&v44 - v15;
  uint64_t v16 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature;
  uint64_t v17 = enum case for Temperature.unknown(_:);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v18(v14, enum case for Temperature.unknown(_:), v7);
  char v19 = sub_36B78();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  uint64_t v59 = v8 + 8;
  uint64_t v57 = v20;
  v20((uint64_t)v14, v7);
  uint64_t v21 = &off_48000;
  if ((v19 & 1) != 0
    || *(unsigned char *)(v60 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) == 1)
  {
    v18(v61, v17, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v61, v16, v7);
  }
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v22 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v61, v7);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  uint64_t v54 = v7;
  if (v23 == enum case for Temperature.temperature(_:))
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v55, v11, v58);
    swift_retain();
    uint64_t v24 = v45;
    uint64_t v44 = v22;
    sub_36CE8();
    uint64_t v25 = v48;
    sub_36B98();
    uint64_t v26 = v47;
    int v27 = *(void (**)(char *, uint64_t))(v46 + 8);
    v27(v24, v47);
    sub_36CA8();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v49 + 8);
    uint64_t v29 = v51;
    v28(v25, v51);
    sub_36CE8();
    sub_36B98();
    uint64_t v30 = v26;
    uint64_t v21 = &off_48000;
    v27(v24, v30);
    sub_36D58();
    v28(v25, v29);
    sub_AB28(0, &qword_480D8);
    uint64_t v31 = v50;
    sub_365D8();
    uint64_t v32 = v44;
    uint64_t v62 = sub_36FD8();
    unint64_t v63 = v33;
    swift_retain();
    sub_1E168(&v62, v32);
    swift_release();
    uint64_t v35 = v62;
    NSString v34 = (void *)v63;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v31, v53);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v58);
    swift_release();
  }
  else
  {
    if (v23 != v17)
    {
      swift_retain();
      uint64_t result = sub_37258();
      __break(1u);
      return result;
    }
    NSString v34 = (void *)0xE200000000000000;
    uint64_t v35 = 11565;
  }
  uint64_t v36 = v60;
  if (sub_1A004() || sub_1A78C())
  {
    uint64_t v37 = v54;
    if ((*((unsigned char *)v21[191] + v36) & 1) == 0)
    {
      uint64_t v62 = 126;
      unint64_t v63 = 0xE100000000000000;
      v64._countAndFlagsBits = v35;
      v64._object = v34;
      sub_36E48(v64);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v37 = v54;
  }
  NSString v38 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v39 = [self textProviderWithText:v38];

  id v40 = v39;
  uint64_t v41 = (uint64_t)v61;
  sub_1E79C((uint64_t)v61);
  NSString v42 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v40 setAccessibilityLabel:v42];

  v57(v41, v37);
  return (uint64_t)v40;
}

id sub_1D600()
{
  sub_2C3A0(*(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable), *(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_historical));
  if (qword_47C10 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1D734();
  int v2 = v1;
  sub_AB28(0, (unint64_t *)&unk_48390);
  Class isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  sub_AB28(0, (unint64_t *)&unk_48A50);
  Class v4 = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = self;
  LODWORD(v6) = v2;
  id v7 = [v5 gaugeProviderWithStyle:0 gaugeColors:isa gaugeColorLocations:v4 fillFraction:v6];

  return v7;
}

uint64_t sub_1D734()
{
  uint64_t v1 = sub_36D68();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v53 = v1;
  uint64_t v54 = v2;
  __chkstk_darwin(v1);
  uint64_t v52 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_66B8(&qword_48648);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v51 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v40 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v12 = sub_36B88();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v50 = (uint64_t)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v40 - v19;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))((char *)&v40 - v19, enum case for Temperature.unknown(_:), v12);
  char v21 = sub_36B78();
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
  uint64_t result = v22(v20, v12);
  if ((v21 & 1) == 0
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable) != 1)
  {
    sub_36B68();
    uint64_t v24 = sub_36CB8();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    uint64_t v49 = v24;
    if (((unsigned int (*)(char *, uint64_t))v48)(v11, 1) != 1)
    {
      uint64_t v26 = v54;
      int v27 = *(void (**)(void))(v54 + 104);
      uint64_t v28 = v52;
      unsigned int v43 = enum case for WaterTemperatureUnit.celcius(_:);
      uint64_t v46 = v9;
      uint64_t v29 = v53;
      uint64_t v44 = v54 + 104;
      NSString v42 = (void (*)(char *, void, uint64_t))v27;
      v27(v52);
      uint64_t v47 = v25 + 48;
      sub_36CA8();
      uint64_t v30 = v29;
      uint64_t v31 = v46;
      uint64_t v41 = *(void (**)(char *, uint64_t))(v26 + 8);
      uint64_t v54 = v26 + 8;
      v41(v28, v30);
      uint64_t v32 = *(void (**)(char *, uint64_t))(v25 + 8);
      uint64_t v33 = v49;
      uint64_t v45 = v25 + 8;
      id v40 = v32;
      v32(v11, v49);
      sub_197F0((uint64_t)v18);
      sub_36B68();
      v22(v18, v12);
      NSString v34 = v48;
      if (v48(v31, 1, v33) == 1)
      {
        uint64_t v11 = v31;
      }
      else
      {
        uint64_t v35 = v52;
        uint64_t v36 = v53;
        v42(v52, v43, v53);
        sub_36CA8();
        v41(v35, v36);
        uint64_t v37 = v31;
        uint64_t v38 = v49;
        v40(v37, v49);
        uint64_t v39 = v50;
        sub_19BF4(v50);
        uint64_t v11 = v51;
        sub_36B68();
        v22((char *)v39, v12);
        if (v34(v11, 1, v38) != 1)
        {
          v42(v35, v43, v36);
          sub_36CA8();
          v41(v35, v36);
          return ((uint64_t (*)(char *, uint64_t))v40)(v11, v49);
        }
      }
    }
    return sub_1E108((uint64_t)v11);
  }
  return result;
}

id sub_1DCB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TemperatureTimelineEntryModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1DDA4()
{
  return type metadata accessor for TemperatureTimelineEntryModel();
}

uint64_t type metadata accessor for TemperatureTimelineEntryModel()
{
  uint64_t result = qword_48638;
  if (!qword_48638) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DDF8()
{
  uint64_t result = sub_366B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_36B88();
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

id sub_1DED0(uint64_t a1, int a2, int a3)
{
  int v18 = a2;
  int v19 = a3;
  uint64_t v4 = sub_366B8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36B88();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v12(v11, a1, v8);
  sub_366A8();
  uint64_t v13 = (objc_class *)type metadata accessor for TemperatureTimelineEntryModel();
  uint64_t v14 = objc_allocWithZone(v13);
  (*(void (**)(unsigned char *, char *, uint64_t))(v5 + 16))(&v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_entryDate], v7, v4);
  v12(&v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_temperature], (uint64_t)v11, v8);
  v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_unavailable] = v18;
  v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_historical] = v19;
  v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion29TemperatureTimelineEntryModel_alwaysOn] = 0;
  v20.receiver = v14;
  v20.super_class = v13;
  id v15 = objc_msgSendSuper2(&v20, "init");
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_1E108(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_48648);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E168(void *a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v25 = sub_36638();
  __chkstk_darwin(v25);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  unint64_t v7 = a1[1];
  objc_super v20 = a1;
  uint64_t v28 = 0;
  unint64_t v29 = 0xE000000000000000;
  uint64_t v23 = v8 & 0xFFFFFFFFFFFFLL;
  uint64_t v24 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(v7) & 0xF;
  }
  else {
    uint64_t v9 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    v19[1] = v2;
    uint64_t v21 = (v7 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v22 = v7 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v10 = (void (**)(char *, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i < v9; i += v13)
    {
      if ((v7 & 0x1000000000000000) != 0)
      {
        sub_370F8();
      }
      else
      {
        if ((v7 & 0x2000000000000000) != 0)
        {
          uint64_t v26 = v8;
          uint64_t v27 = v22;
        }
        else if ((v8 & 0x1000000000000000) == 0)
        {
          sub_37148();
        }
        sub_37158();
      }
      uint64_t v13 = v12;
      sub_2CE7C((uint64_t)v6);
      char v14 = sub_36628();
      (*v10)(v6, v25);
      if (v14) {
        sub_36E28();
      }
    }
    id v15 = v20;
    uint64_t v16 = v28;
    unint64_t v17 = v29;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    id v15 = v20;
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *id v15 = v16;
  v15[1] = v17;
  return result;
}

uint64_t sub_1E36C(char a1)
{
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_49468;
  NSString v3 = sub_36DC8();
  id v4 = [self imageNamed:v3 inBundle:v2 compatibleWithTraitCollection:0];

  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (a1)
    {
      [v5 size];
      [v6 size];
      sub_36FF8();
      double v8 = v7;
      double v10 = v9;
      id v11 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", v7, v9);
      uint64_t v12 = (double *)swift_allocObject();
      *((void *)v12 + 2) = v6;
      v12[3] = v8;
      v12[4] = v10;
      uint64_t v13 = swift_allocObject();
      char v14 = sub_1EEE0;
      *(void *)(v13 + 16) = sub_1EEE0;
      *(void *)(v13 + 24) = v12;
      aBlock[4] = sub_1EF0C;
      aBlock[5] = v13;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B250;
      aBlock[3] = &unk_41568;
      id v15 = _Block_copy(aBlock);
      id v16 = v6;
      swift_retain();
      swift_release();
      id v17 = [v11 imageWithActions:v15];

      _Block_release(v15);
      LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      if ((v11 & 1) == 0)
      {
LABEL_8:
        id v18 = [self providerWithFullColorImage:v17];
        id v19 = [self whiteColor];
        [v18 setTintColor:v19];

        id v20 = (id)qword_49468;
        NSString v21 = sub_36DC8();
        NSString v22 = sub_36DC8();
        id v23 = [v20 localizedStringForKey:v21 value:0 table:v22];

        sub_36DD8();
        NSString v24 = sub_36DC8();
        swift_bridgeObjectRelease();
        [v18 setAccessibilityLabel:v24];

        sub_1EE98((uint64_t)v14);
        return (uint64_t)v18;
      }
      __break(1u);
    }
    char v14 = 0;
    id v17 = v6;
    goto LABEL_8;
  }
  uint64_t result = sub_371D8();
  __break(1u);
  return result;
}

uint64_t sub_1E79C(uint64_t a1)
{
  uint64_t v28 = sub_36D68();
  uint64_t v31 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  NSString v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_36BE8();
  uint64_t v27 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  id v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_66B8(&qword_480D0);
  uint64_t v32 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v30 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_36CB8();
  uint64_t v8 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  double v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_36B88();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  char v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v15 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v14, v11);
  if (v16 == enum case for Temperature.temperature(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v14, v11);
    uint64_t v26 = v8;
    id v17 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v25[0] = v10;
    v17(v10, v14, v33);
    v25[1] = v15;
    swift_retain();
    sub_36CE8();
    sub_36B98();
    id v18 = *(void (**)(char *, uint64_t))(v27 + 8);
    uint64_t v19 = v29;
    v18(v5, v29);
    sub_36CA8();
    uint64_t v20 = v28;
    uint64_t v27 = v6;
    NSString v21 = *(void (**)(char *, uint64_t))(v31 + 8);
    v21(v3, v28);
    sub_36CE8();
    sub_36B98();
    v18(v5, v19);
    sub_36D58();
    v21(v3, v20);
    sub_AB28(0, &qword_480D8);
    NSString v22 = v30;
    sub_365D8();
    uint64_t v23 = sub_36FD8();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v27);
    (*(void (**)(void, uint64_t))(v26 + 8))(v25[0], v33);
    swift_release();
    return v23;
  }
  if (v16 == enum case for Temperature.unknown(_:)) {
    return 11565;
  }
  swift_retain();
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

id sub_1ECD0()
{
  NSString v0 = sub_36DC8();
  id v1 = [self symbolImageProviderWithSystemName:v0];

  id v2 = [self whiteColor];
  [v1 setTintColor:v2];

  uint64_t v3 = qword_47BE0;
  id v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  id v5 = (id)qword_49468;
  NSString v6 = sub_36DC8();
  NSString v7 = sub_36DC8();
  id v8 = [v5 localizedStringForKey:v6 value:0 table:v7];

  sub_36DD8();
  NSString v9 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v4 setAccessibilityLabel:v9];

  return v4;
}

uint64_t sub_1EE98(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1EEA8()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_1EEE0()
{
  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1EEFC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1EF0C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1EF34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1EF44()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for DepthRichCircularTickProvider()
{
  return &type metadata for DepthRichCircularTickProvider;
}

id sub_1EF5C(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10 = [objc_allocWithZone((Class)UIBezierPath) init];
  uint64_t v11 = 0;
  do
  {
    uint64_t v12 = v11 + 1;
    v39.origin.x = a2;
    v39.origin.double y = a3;
    v39.size.double width = a4;
    v39.size.double height = a5;
    double Width = CGRectGetWidth(v39);
    v40.origin.x = a2;
    v40.origin.double y = a3;
    v40.size.double width = a4;
    v40.size.double height = a5;
    double Height = CGRectGetHeight(v40);
    if (Height >= Width) {
      double Height = Width;
    }
    double v15 = Height * 0.5 + -1.5;
    double v37 = v15 + -3.0;
    v41.origin.x = a2;
    v41.origin.double y = a3;
    v41.size.double width = a4;
    v41.size.double height = a5;
    double MidX = CGRectGetMidX(v41);
    __double2 v17 = __sincos_stret((double)v11 * 0.112199738 + 2.35619449);
    double v35 = MidX + v17.__cosval * v15;
    v42.origin.x = a2;
    v42.origin.double y = a3;
    v42.size.double width = a4;
    v42.size.double height = a5;
    CGFloat v18 = CGRectGetMidY(v42) + v17.__sinval * v15;
    v43.origin.x = a2;
    v43.origin.double y = a3;
    v43.size.double width = a4;
    v43.size.double height = a5;
    CGFloat v19 = CGRectGetMidX(v43) + v17.__cosval * v37;
    v44.origin.x = a2;
    v44.origin.double y = a3;
    v44.size.double width = a4;
    v44.size.double height = a5;
    CGFloat v20 = CGRectGetMidY(v44) + v17.__sinval * v37;
    objc_msgSend(v10, "moveToPoint:", v35, v18);
    objc_msgSend(v10, "addLineToPoint:", v19, v20);
    ++v11;
  }
  while (v12 != 14);
  uint64_t v21 = 0;
  do
  {
    uint64_t v22 = v21 + 1;
    v45.origin.x = a2;
    v45.origin.double y = a3;
    v45.size.double width = a4;
    v45.size.double height = a5;
    double v23 = CGRectGetWidth(v45);
    v46.origin.x = a2;
    v46.origin.double y = a3;
    v46.size.double width = a4;
    v46.size.double height = a5;
    double v24 = CGRectGetHeight(v46);
    if (v24 >= v23) {
      double v24 = v23;
    }
    double v25 = v24 * 0.5 + -1.5;
    double v38 = v25 + -3.0;
    v47.origin.x = a2;
    v47.origin.double y = a3;
    v47.size.double width = a4;
    v47.size.double height = a5;
    double v26 = CGRectGetMidX(v47);
    __double2 v27 = __sincos_stret((double)v21 * 0.174532925 + 5.49778714);
    double v36 = v26 + v27.__cosval * v25;
    v48.origin.x = a2;
    v48.origin.double y = a3;
    v48.size.double width = a4;
    v48.size.double height = a5;
    CGFloat v28 = CGRectGetMidY(v48) + v27.__sinval * v25;
    v49.origin.x = a2;
    v49.origin.double y = a3;
    v49.size.double width = a4;
    v49.size.double height = a5;
    CGFloat v29 = CGRectGetMidX(v49) + v27.__cosval * v38;
    v50.origin.x = a2;
    v50.origin.double y = a3;
    v50.size.double width = a4;
    v50.size.double height = a5;
    CGFloat v30 = CGRectGetMidY(v50) + v27.__sinval * v38;
    objc_msgSend(v10, "moveToPoint:", v36, v28);
    objc_msgSend(v10, "addLineToPoint:", v29, v30);
    ++v21;
  }
  while (v22 != 9);
  id v31 = [objc_allocWithZone((Class)CAShapeLayer) init];
  objc_msgSend(v31, "setFrame:", a2, a3, a4, a5);
  id v32 = [a1 CGColor];
  [v31 setStrokeColor:v32];

  [v31 setLineWidth:1.15];
  [v31 setLineCap:kCALineCapRound];
  id v33 = [v10 CGPath];
  [v31 setPath:v33];

  return v31;
}

void *sub_1F354(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_29C54((uint64_t)a1);
      if (v7)
      {
        id v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_371B8();

  if (!v4) {
    return 0;
  }
  sub_AB28(0, (unint64_t *)&qword_488D0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

HKQuantityType sub_1F42C(uint64_t a1)
{
  return sub_1F454(a1, (id *)&HKQuantityTypeIdentifierUnderwaterDepth, (HKQuantityType *)&qword_48660);
}

HKQuantityType sub_1F440(uint64_t a1)
{
  return sub_1F454(a1, (id *)&HKQuantityTypeIdentifierWaterTemperature, (HKQuantityType *)&qword_48668);
}

HKQuantityType sub_1F454(uint64_t a1, id *a2, HKQuantityType *a3)
{
  sub_AB28(0, &qword_488C0);
  result.super.super.super.Class isa = sub_36F58((HKQuantityTypeIdentifier)*a2).super.super.super.isa;
  a3->super.super.super.Class isa = result.super.super.super.isa;
  return result;
}

uint64_t sub_1F4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_36798();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_367B8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB28(0, &qword_480C8);
  uint64_t v11 = (void *)sub_36F98();
  aBlock[4] = sub_21CAC;
  aBlock[5] = a2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1F7B0;
  aBlock[3] = &unk_415D8;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_367A8();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_21CCC(&qword_488A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_66B8(&qword_488B0);
  sub_21D14();
  sub_37068();
  sub_36FA8();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1F758()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1FD54();
    return swift_release();
  }
  return result;
}

uint64_t sub_1F7B0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1F7F4()
{
  swift_beginAccess();
  notify_cancel(*(_DWORD *)(v0 + 60));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HealthKitSettingsStore()
{
  return self;
}

void sub_1F8A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (const char *)HKProtectedHealthDatabaseDidBecomeAvailableNotification;
  sub_AB28(0, &qword_480C8);
  uint64_t v3 = sub_36F98();
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_21E74;
  v6[5] = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_1FA44;
  v6[3] = &unk_416C8;
  uint64_t v5 = _Block_copy(v6);
  swift_release();
  swift_beginAccess();
  notify_register_dispatch(v2, (int *)(v1 + 56), v3, v5);
  swift_endAccess();
  _Block_release(v5);
}

uint64_t sub_1F9D0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    sub_1FD54();
    swift_beginAccess();
    notify_cancel(*(_DWORD *)(v1 + 56));
    return swift_release();
  }
  return result;
}

uint64_t sub_1FA44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1FA98()
{
  if (kHKNanoLifestylePrivacyPreferencesChangedNotification)
  {
    uint64_t v1 = v0;
    sub_36DD8();
    sub_AB28(0, &qword_480C8);
    uint64_t v2 = sub_36F98();
    uint64_t v3 = swift_allocObject();
    swift_weakInit();
    v6[4] = sub_21E6C;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1FA44;
    v6[3] = &unk_416A0;
    uint64_t v4 = _Block_copy(v6);
    swift_release();
    uint64_t v5 = sub_36E18();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    notify_register_dispatch((const char *)(v5 + 32), (int *)(v1 + 60), v2, v4);
    swift_endAccess();
    swift_release();
    _Block_release(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1FC08()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_36DD8();
    id v1 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v2 = sub_36DC8();
    swift_bridgeObjectRelease();
    id v3 = [v1 initWithSuiteName:v2];

    if (v3)
    {
      objc_msgSend(v3, "hk_BOOLForKey:defaultValue:", kHKPrivacyPreferencesKeyEnableFitnessTracking, 1);
      swift_retain();
      sub_36738();
      swift_release();

      return swift_release();
    }
    else
    {
      uint64_t result = sub_371D8();
      __break(1u);
    }
  }
  return result;
}

void sub_1FD54()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  id v3 = (id)v0[8];
  NSString v4 = sub_36DC8();
  id v5 = [v3 stringForKey:v4];

  if (v5)
  {
    sub_36DD8();

    swift_retain();
    NSString v6 = sub_36DC8();
    swift_bridgeObjectRelease();
    id v7 = [self unitFromString:v6];

    v23[0] = v7;
    sub_36738();

    swift_release();
  }
  id v8 = (id)v1[8];
  NSString v9 = sub_36DC8();
  id v10 = [v8 stringForKey:v9];

  if (v10)
  {
    sub_36DD8();

    swift_retain();
    NSString v11 = sub_36DC8();
    swift_bridgeObjectRelease();
    id v12 = [self unitFromString:v11];

    v23[0] = v12;
    sub_36738();

    swift_release();
  }
  uint64_t v13 = (void *)v1[2];
  sub_66B8(&qword_47D58);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_37F00;
  if (qword_47BE8 != -1) {
    swift_once();
  }
  double v15 = (void *)qword_48660;
  *(void *)(inited + 32) = qword_48660;
  uint64_t v16 = qword_47BF0;
  id v17 = v15;
  if (v16 != -1) {
    swift_once();
  }
  CGFloat v18 = (void *)qword_48668;
  *(void *)(inited + 40) = qword_48668;
  sub_36EA8();
  id v19 = v18;
  sub_216C8(inited);
  swift_bridgeObjectRelease();
  sub_AB28(0, &qword_488C0);
  sub_21D70();
  Class isa = sub_36EF8().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v1;
  *(void *)(v21 + 24) = v2;
  v23[4] = sub_21E10;
  v23[5] = v21;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256;
  v23[2] = sub_20880;
  v23[3] = &unk_41628;
  uint64_t v22 = _Block_copy(v23);
  swift_retain();
  swift_release();
  [v13 preferredUnitsForQuantityTypes:isa completion:v22];
  _Block_release(v22);
}

uint64_t sub_20100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a3;
  uint64_t v5 = sub_36718();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36798();
  uint64_t v39 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  NSString v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_367B8();
  uint64_t v37 = *(void *)(v12 - 8);
  uint64_t v38 = v12;
  __chkstk_darwin(v12);
  char v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_47BE8 != -1) {
    swift_once();
  }
  id v15 = (id)qword_48660;
  uint64_t v16 = sub_1F354(v15, a1);

  if (v16)
  {
    uint64_t v35 = v9;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    if (qword_47BF0 != -1) {
      swift_once();
    }
    id v19 = (id)qword_48668;
    CGFloat v20 = sub_1F354(v19, a1);

    if (v20)
    {
      sub_AB28(0, &qword_480C8);
      uint64_t v21 = (void *)sub_36F98();
      uint64_t v22 = (void *)swift_allocObject();
      v22[2] = v36;
      v22[3] = v16;
      v22[4] = v20;
      aBlock[4] = (uint64_t)sub_21E60;
      aBlock[5] = (uint64_t)v22;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1F7B0;
      aBlock[3] = (uint64_t)&unk_41678;
      double v23 = _Block_copy(aBlock);
      swift_retain();
      id v24 = v16;
      id v25 = v20;
      swift_release();
      sub_367A8();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_21CCC(&qword_488A8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_66B8(&qword_488B0);
      sub_21D14();
      uint64_t v26 = v35;
      sub_37068();
      sub_36FA8();
      _Block_release(v23);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v26);
      return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v14, v38);
    }

    uint64_t v5 = v18;
    uint64_t v6 = v17;
  }
  sub_36908();
  swift_errorRetain();
  swift_errorRetain();
  CGFloat v28 = sub_36708();
  os_log_type_t v29 = sub_36F38();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = v6;
    id v31 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v31 = 136315138;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v32 = sub_37298();
      unint64_t v34 = v33;
    }
    else
    {
      unint64_t v34 = 0xE300000000000000;
      uint64_t v32 = 7104878;
    }
    aBlock[10] = sub_328C0(v32, v34, aBlock);
    sub_37038();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v28, v29, "Failed to retrieve preferred depth units from HealthKit with error %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v8, v5);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_206BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  swift_retain();
  sub_36738();

  swift_release();
  id v13 = a3;
  id v6 = a3;
  swift_retain();
  sub_36738();

  swift_release();
  id v7 = *(id *)(a1 + 64);
  swift_retain();
  sub_36748();
  swift_release();
  NSString v8 = [v13 unitString];

  if (!v8)
  {
    sub_36DD8();
    NSString v8 = sub_36DC8();
    swift_bridgeObjectRelease();
  }
  NSString v9 = sub_36DC8();
  [v7 setObject:v8 forKey:v9];

  id v10 = *(id *)(a1 + 64);
  swift_retain();
  sub_36748();
  swift_release();
  NSString v11 = [v13 unitString];

  if (!v11)
  {
    sub_36DD8();
    NSString v11 = sub_36DC8();
    swift_bridgeObjectRelease();
  }
  NSString v12 = sub_36DC8();
  [v10 setObject:v11 forKey:v12];
}

void sub_20880(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_AB28(0, &qword_488C0);
  sub_AB28(0, (unint64_t *)&qword_488D0);
  sub_21D70();
  uint64_t v5 = sub_36D88();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_2095C(void *a1, void *a2)
{
  id v3 = v2;
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
    uint64_t v9 = sub_370A8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_AB28(0, &qword_488C0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_37098();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_20BFC(v7, result + 1);
    CGFloat v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_20DF4();
      double v23 = v28;
    }
    else
    {
      double v23 = (void *)v22;
      id v24 = v8;
    }
    sub_21094((uint64_t)v8, v23);
    *id v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_37008(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_AB28(0, &qword_488C0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_37018();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        CGFloat v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
        char v19 = sub_37018();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *id v3 = 0x8000000000000000;
    id v8 = a2;
    sub_21118((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *id v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_20BFC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_66B8(&qword_488D8);
    uint64_t v2 = sub_370E8();
    uint64_t v14 = v2;
    sub_37088();
    if (sub_370B8())
    {
      sub_AB28(0, &qword_488C0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_20DF4();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_37008(*(void *)(v2 + 40));
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
      while (sub_370B8());
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

uint64_t sub_20DF4()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_66B8(&qword_488D8);
  uint64_t v3 = sub_370D8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    CGFloat v28 = v0;
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
                id v1 = v28;
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
      uint64_t result = sub_37008(*(void *)(v4 + 40));
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
  *id v1 = v4;
  return result;
}

unint64_t sub_21094(uint64_t a1, void *a2)
{
  sub_37008(a2[5]);
  unint64_t result = sub_37078();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_21118(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_20DF4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_212A0();
      goto LABEL_14;
    }
    sub_2144C();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_37008(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_AB28(0, &qword_488C0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_37018();

    if (v12)
    {
LABEL_13:
      sub_37278();
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
        char v15 = sub_37018();

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

id sub_212A0()
{
  id v1 = v0;
  sub_66B8(&qword_488D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_370C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *id v1 = v4;
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

uint64_t sub_2144C()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_66B8(&qword_488D8);
  uint64_t v3 = sub_370D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  CGFloat v28 = v0;
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
    uint64_t result = sub_37008(v19);
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
    id v1 = v28;
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

uint64_t sub_216C8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_371E8();
    swift_bridgeObjectRelease();
  }
  sub_AB28(0, &qword_488C0);
  sub_21D70();
  uint64_t result = sub_36F08();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_371E8();
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
        uint64_t v6 = (void *)sub_37128();
        sub_2095C(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_2095C(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2181C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_36FB8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[3] = 0x6544646568636143;
  v2[4] = 0xEF74696E55687470;
  v2[5] = 0xD00000000000001ALL;
  v2[6] = 0x8000000000039750;
  v2[7] = 0;
  v2[9] = 0;
  if (qword_47BE8 != -1) {
    swift_once();
  }
  id v10 = (id)_HKGenerateDefaultUnitForQuantityType();
  if (!v10)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v23 = v10;
  sub_66B8(&qword_48890);
  swift_allocObject();
  v2[10] = sub_36768();
  if (qword_47BF0 != -1) {
    swift_once();
  }
  id v11 = (id)_HKGenerateDefaultUnitForQuantityType();
  if (!v11) {
    goto LABEL_10;
  }
  id v23 = v11;
  swift_allocObject();
  v2[11] = sub_36768();
  LOBYTE(v23) = 1;
  sub_66B8(&qword_48898);
  swift_allocObject();
  v2[12] = sub_36768();
  v2[8] = a2;
  v2[2] = a1;
  int64_t v12 = self;
  id v13 = a2;
  id v14 = a1;
  id v15 = [v12 defaultCenter];
  id v16 = v14;
  sub_36FC8();

  swift_allocObject();
  swift_weakInit();
  sub_21CCC(&qword_488A0, (void (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher);
  uint64_t v17 = sub_36788();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v3[9] = v17;
  swift_release();
  sub_1F8A0();
  sub_1FA98();
  sub_1FD54();
  sub_36DD8();
  id v18 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v19 = sub_36DC8();
  swift_bridgeObjectRelease();
  id v20 = [v18 initWithSuiteName:v19];

  if (v20)
  {
    LOBYTE(v23) = objc_msgSend(v20, "hk_BOOLForKey:defaultValue:", kHKPrivacyPreferencesKeyEnableFitnessTracking, 1);
    swift_retain();
    sub_36738();

    swift_release();
    return (uint64_t)v3;
  }
LABEL_11:
  uint64_t result = sub_371D8();
  __break(1u);
  return result;
}

uint64_t sub_21C6C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_21CA4(uint64_t a1)
{
  return sub_1F4B0(a1, v1);
}

uint64_t sub_21CAC()
{
  return sub_1F758();
}

uint64_t sub_21CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21CC4()
{
  return swift_release();
}

uint64_t sub_21CCC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_21D14()
{
  unint64_t result = qword_488B8;
  if (!qword_488B8)
  {
    sub_AD00(&qword_488B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_488B8);
  }
  return result;
}

unint64_t sub_21D70()
{
  unint64_t result = qword_488C8;
  if (!qword_488C8)
  {
    sub_AB28(255, &qword_488C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_488C8);
  }
  return result;
}

uint64_t sub_21DD8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_21E10(uint64_t a1, uint64_t a2)
{
  return sub_20100(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_21E18()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_21E60()
{
  sub_206BC(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_21E6C()
{
  return sub_1FC08();
}

uint64_t sub_21E74()
{
  return sub_1F9D0();
}

id sub_21F18()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIImageView) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_21F8C()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels);
  }
  else
  {
    type metadata accessor for DepthRichCircularLabelView();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_22004()
{
  uint64_t v1 = sub_36928();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  __chkstk_darwin(v1);
  CGRect v41 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36BE8();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  uint64_t v38 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36D38();
  uint64_t v35 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36A58();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  __chkstk_darwin(v8);
  id v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_369D8();
  uint64_t v44 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  id v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)&v33 - v15;
  uint64_t v17 = sub_36858();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v18 + 88))(v20, v17);
  if (result == enum case for WaterDepth.shallow(_:)) {
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
  if (result == enum case for WaterDepth.nominal(_:))
  {
    (*(void (**)(char *, uint64_t))(v18 + 96))(v20, v17);
    id v23 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
    uint64_t v34 = v11;
    v23(v16, v20, v11);
    sub_36988();
    if (qword_47BD0 != -1) {
      swift_once();
    }
    uint64_t v24 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    uint64_t v25 = v35;
    BOOL v26 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    v26(v7, v24, v5);
    sub_36CC8();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v25 + 8);
    v27(v7, v5);
    uint64_t v28 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    v26(v7, v28, v5);
    uint64_t v29 = v38;
    sub_36CE8();
    v27(v7, v5);
    uint64_t v30 = v41;
    sub_36BB8();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v40);
    sub_369F8();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v30, v43);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v37);
    sub_36988();
    id v31 = *(void (**)(char *, uint64_t))(v44 + 8);
    uint64_t v32 = v34;
    v31(v14, v34);
    return ((uint64_t (*)(char *, uint64_t))v31)(v16, v32);
  }
  else
  {
    if (result == enum case for WaterDepth.depthExceedingNominalRange(_:)) {
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
    if (result != enum case for WaterDepth.unknown(_:)
      && result != enum case for WaterDepth.notSubmerged(_:)
      && result != enum case for WaterDepth.depthExceedingSensorLimit(_:))
    {
      uint64_t result = sub_37258();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22678()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36D38();
  uint64_t v26 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36858();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn) == 1
    && *(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) != 1)
  {
    goto LABEL_18;
  }
  uint64_t v12 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v11, v12, v5);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
  if (v14 == enum case for WaterDepth.shallow(_:)
    || v14 == enum case for WaterDepth.nominal(_:)
    || v14 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
LABEL_17:
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable) != 1)
    {
      id v25 = sub_21F8C();
      v13(v9, v12, v5);
      if (qword_47BD0 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
      swift_beginAccess();
      uint64_t v21 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v4, v20, v2);
      LOBYTE(v20) = sub_22A54((uint64_t)v4);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      char v22 = v20;
      id v23 = v25;
      uint64_t v19 = sub_2EA00(v22, *(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical));

      return (uint64_t)v19;
    }
LABEL_18:
    sub_66B8(&qword_47D58);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_38160;
    *(void *)(v18 + 32) = sub_21F18();
    uint64_t v27 = v18;
    sub_36EA8();
    return v27;
  }
  if (v14 == enum case for WaterDepth.unknown(_:) || v14 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_18;
  }
  if (v14 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_17;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_22A54(uint64_t a1)
{
  uint64_t v59 = a1;
  uint64_t v1 = sub_36A58();
  uint64_t v61 = *(void *)(v1 - 8);
  uint64_t v62 = v1;
  __chkstk_darwin(v1);
  uint64_t v60 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_36BE8();
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = (void (*)(void, void))v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_36D38();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v52 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_36928();
  uint64_t v58 = *(void *)(v63 - 8);
  uint64_t v9 = __chkstk_darwin(v63);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v57 = (char *)&v49 - v12;
  uint64_t v13 = sub_36858();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_369D8();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v56 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v53 = (char *)&v49 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  id v25 = (char *)&v49 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v49 - v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v64, v13);
  int v28 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v16, v13);
  if (v28 == enum case for WaterDepth.shallow(_:)
    || v28 == enum case for WaterDepth.nominal(_:)
    || v28 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    goto LABEL_8;
  }
  uint64_t v29 = 0;
  if (v28 != enum case for WaterDepth.unknown(_:) && v28 != enum case for WaterDepth.notSubmerged(_:))
  {
    if (v28 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
      return 2;
    }
    sub_37258();
    __break(1u);
LABEL_8:
    (*(void (**)(char *, uint64_t))(v14 + 96))(v16, v13);
    uint64_t v64 = v18;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v27, v16, v17);
    uint64_t v49 = v17;
    CGRect v50 = v27;
    if (qword_47BD0 != -1) {
      swift_once();
    }
    uint64_t v30 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
    swift_beginAccess();
    uint64_t v32 = v51;
    uint64_t v31 = v52;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v8, v30, v52);
    sub_36CE8();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v31);
    uint64_t v33 = v57;
    sub_36BB8();
    uint64_t v34 = v55;
    uint64_t v35 = *(void (**)(char *, void))(v54 + 8);
    v35(v5, v55);
    uint64_t v36 = v60;
    sub_36CC8();
    sub_36CE8();
    sub_36BB8();
    v35(v5, v34);
    sub_369F8();
    uint64_t v37 = v58;
    uint64_t v38 = *(void (**)(void, void))(v58 + 8);
    uint64_t v39 = v63;
    uint64_t v59 = v58 + 8;
    uint64_t v55 = v38;
    v38(v11, v63);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v36, v62);
    uint64_t v40 = v50;
    sub_369C8();
    CGRect v41 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    v41(v11, v33, v39);
    uint64_t v42 = v53;
    sub_369B8();
    sub_369C8();
    v41(v11, v33, v39);
    uint64_t v43 = v56;
    sub_369B8();
    sub_27E68((unint64_t *)&qword_48A68, (void (*)(uint64_t))&type metadata accessor for DepthValue);
    uint64_t v44 = v49;
    char v45 = sub_36D98();
    CGRect v46 = *(void (**)(char *, uint64_t))(v64 + 8);
    v46(v40, v44);
    if (v45)
    {
      char v47 = sub_36998();
      v46(v43, v44);
      v46(v42, v44);
      v46(v25, v44);
      v55(v33, v39);
      return (v47 & 1) == 0;
    }
    v46(v43, v44);
    v46(v42, v44);
    v46(v25, v44);
    v55(v33, v39);
    return 2;
  }
  return v29;
}

void *sub_2322C()
{
  uint64_t v1 = sub_36D38();
  uint64_t v26 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36858();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v26 - v9;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn) == 1
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) != 1)
  {
    goto LABEL_18;
  }
  uint64_t v11 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v10, v4);
  if (v13 == enum case for WaterDepth.shallow(_:)
    || v13 == enum case for WaterDepth.nominal(_:)
    || v13 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_17:
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable) != 1)
    {
      id v19 = sub_21F8C();
      v12(v8, v11, v4);
      if (qword_47BD0 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
      swift_beginAccess();
      uint64_t v21 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v3, v20, v1);
      char v22 = sub_22A54((uint64_t)v3);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v1);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      if (v22)
      {
        if (v22 != 1)
        {

          return &_swiftEmptyArrayStorage;
        }
        sub_66B8(&qword_47D58);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_38160;
        id v24 = sub_2E33C();
      }
      else
      {
        sub_66B8(&qword_47D58);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_38160;
        id v24 = sub_2E270();
      }
      *(void *)(v23 + 32) = v24;
      uint64_t v27 = v23;
      sub_36EA8();
      uint64_t v18 = v27;

      return (void *)v18;
    }
LABEL_18:
    sub_66B8(&qword_47D58);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_38160;
    *(void *)(v17 + 32) = sub_21F18();
    uint64_t v28 = v17;
    sub_36EA8();
    return (void *)v28;
  }
  if (v13 == enum case for WaterDepth.unknown(_:) || v13 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_18;
  }
  if (v13 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_17;
  }
  uint64_t result = (void *)sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_23678()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36858();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v20 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer);
  if (v6)
  {
    id v7 = v6;
    sub_36E78();
    if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v20 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_36EB8();
    sub_36EC8();
    sub_36EA8();
  }
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer);
  if (!v8) {
    return v20;
  }
  uint64_t v9 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  int v10 = (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 88))(v5, v2);
  if (v10 == enum case for WaterDepth.shallow(_:) || (int v11 = v10, v10 == enum case for WaterDepth.nominal(_:)))
  {
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    return v20;
  }
  if (v10 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    int v13 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    id v14 = v8;
    v13(v5, v2);
LABEL_17:
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical))
    {
    }
    else
    {
      id v18 = v8;
      sub_36E78();
      if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                     + (v20 & 0xFFFFFFFFFFFFFF8)) >> 1)
        sub_36EB8();
      sub_36EC8();
      sub_36EA8();
    }
    return v20;
  }
  if (v10 == enum case for WaterDepth.unknown(_:) || v10 == enum case for WaterDepth.notSubmerged(_:)) {
    return v20;
  }
  int v16 = enum case for WaterDepth.depthExceedingSensorLimit(_:);
  id v17 = v8;
  if (v11 == v16) {
    goto LABEL_17;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_23940()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36858();
  uint64_t v3 = *(void **)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  unint64_t v33 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer);
  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v32 = v1;
  uint64_t v10 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  uint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v3[2];
  v31(v8, v10, v2);
  uint64_t v30 = (uint64_t (*)(char *, uint64_t))v3[11];
  int v11 = v30(v8, v2);
  int v12 = enum case for WaterDepth.shallow(_:);
  if (v11 == enum case for WaterDepth.shallow(_:) || (int v13 = v11, v11 == enum case for WaterDepth.nominal(_:)))
  {
    id v14 = (void (*)(char *, uint64_t))v3[1];
    id v15 = v9;
    v14(v8, v2);
LABEL_5:
    uint64_t v1 = v32;
LABEL_6:
    id v16 = v9;
    sub_36E78();
    if (*(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v33 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_36EB8();
    sub_36EC8();
    sub_36EA8();
    goto LABEL_9;
  }
  if (v11 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    int v27 = enum case for WaterDepth.depthExceedingNominalRange(_:);
    int v28 = enum case for WaterDepth.nominal(_:);
    uint64_t v29 = (void (*)(char *, uint64_t))v3[1];
    id v20 = v9;
    v29(v8, v2);
  }
  else
  {
    if (v11 == enum case for WaterDepth.unknown(_:) || v11 == enum case for WaterDepth.notSubmerged(_:))
    {
      id v22 = v9;
      goto LABEL_5;
    }
    int v27 = enum case for WaterDepth.depthExceedingNominalRange(_:);
    int v28 = enum case for WaterDepth.nominal(_:);
    int v23 = enum case for WaterDepth.depthExceedingSensorLimit(_:);
    id v24 = v9;
    if (v13 != v23) {
      goto LABEL_36;
    }
  }
  v31(v6, v10, v2);
  int v21 = v30(v6, v2);
  if (v21 == v12)
  {
    ((void (*)(char *, uint64_t))v3[1])(v6, v2);
    uint64_t v1 = v32;
    goto LABEL_9;
  }
  uint64_t v1 = v32;
  if (v21 == v28)
  {
    ((void (*)(char *, uint64_t))v3[1])(v6, v2);
    goto LABEL_9;
  }
  if (v21 != v27)
  {
    if (v21 == enum case for WaterDepth.unknown(_:) || v21 == enum case for WaterDepth.notSubmerged(_:)) {
      goto LABEL_9;
    }
    if (v21 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
      goto LABEL_34;
    }
LABEL_36:
    uint64_t result = sub_37258();
    __break(1u);
    return result;
  }
  ((void (*)(char *, uint64_t))v3[1])(v6, v2);
LABEL_34:
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) == 1) {
    goto LABEL_6;
  }
LABEL_9:

LABEL_10:
  id v17 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer);
  if (v17 && *(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) == 1)
  {
    id v18 = v17;
    sub_36E78();
    if (*(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v33 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_36EB8();
    sub_36EC8();
    sub_36EA8();
  }
  return v33;
}

id sub_23D5C(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_filterProvider] = 0;
  uint64_t v3 = &v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  uint64_t v4 = enum case for WaterDepth.unknown(_:);
  uint64_t v5 = sub_36858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104))(v3, v4, v5);
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] = 1;
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical] = 0;
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_device] = a1;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontSizeFactor] = 0x3FF0000000000000;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for DepthRichCircularView();
  return objc_msgSendSuper2(&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

void sub_23EE4(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_filterProvider] = 0;
  uint64_t v2 = &v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  uint64_t v3 = enum case for WaterDepth.unknown(_:);
  uint64_t v4 = sub_36858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v2, v3, v4);
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] = 1;
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical] = 0;
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] = 0;
  uint64_t v5 = &v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___icon] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView____lazy_storage___labels] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor] = 0;

  sub_371D8();
  __break(1u);
}

void sub_2425C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer);
  if (v1) {
    [v1 setFilters:0];
  }
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer);
  if (v2) {
    [v2 setFilters:0];
  }
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer);
  if (v3) {
    [v3 setFilters:0];
  }
  id v4 = sub_21F18();
  id v5 = sub_21F8C();
  id v6 = sub_2E270();

  id v7 = sub_21F8C();
  id v8 = sub_2E33C();

  id v9 = v4;
  id v10 = [v9 layer];
  [v10 setFilters:0];

  id v11 = v6;
  id v12 = [v11 layer];
  [v12 setFilters:0];

  id v13 = v8;
  id v14 = [v13 layer];
  [v14 setFilters:0];
}

uint64_t sub_243D8(uint64_t result, char a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_filterProvider);
  if (!v3) {
    return result;
  }
  if (a2)
  {
    id v8 = [(id)swift_unknownObjectRetain() filtersForView:v2 style:0];
    if (v8)
    {
      id v9 = v8;
      sub_AB28(0, (unint64_t *)&qword_48A70);
      unint64_t v7 = sub_36E98();
    }
    else
    {
      unint64_t v7 = 0;
    }
    id v13 = [v3 filtersForView:v2 style:1];
    if (v13)
    {
      id v14 = v13;
      sub_AB28(0, (unint64_t *)&qword_48A70);
      unint64_t v12 = sub_36E98();
    }
    else
    {
      unint64_t v12 = 0;
    }
    id v15 = [v3 filtersForView:v2 style:2];
    if (v15) {
      goto LABEL_16;
    }
LABEL_19:
    unint64_t v17 = 0;
    goto LABEL_20;
  }
  double v4 = *(double *)&result;
  id v5 = [(id)swift_unknownObjectRetain() filtersForView:v2 style:0 fraction:*(double *)&result];
  if (v5)
  {
    id v6 = v5;
    sub_AB28(0, (unint64_t *)&qword_48A70);
    unint64_t v7 = sub_36E98();
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v10 = [v3 filtersForView:v2 style:1 fraction:v4];
  if (v10)
  {
    id v11 = v10;
    sub_AB28(0, (unint64_t *)&qword_48A70);
    unint64_t v12 = sub_36E98();
  }
  else
  {
    unint64_t v12 = 0;
  }
  id v15 = [v3 filtersForView:v2 style:2 fraction:v4];
  if (!v15) {
    goto LABEL_19;
  }
LABEL_16:
  id v16 = v15;
  sub_AB28(0, (unint64_t *)&qword_48A70);
  unint64_t v17 = sub_36E98();

LABEL_20:
  unint64_t v18 = sub_22678();
  sub_277EC(v7, v18);
  swift_bridgeObjectRelease();
  unint64_t v19 = sub_23678();
  sub_2793C(v7, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v20 = sub_23940();
  sub_2793C(v12, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v21 = sub_2322C();
  sub_277EC(v17, (unint64_t)v21);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_246CC()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for DepthRichCircularView();
  objc_msgSendSuper2(&v12, "layoutSubviews");
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = sub_21F18();
  id v10 = sub_21F18();
  [v10 frame];

  CLKRectCenteredIntegralRectForDevice();
  objc_msgSend(v9, "setFrame:");

  id v11 = sub_21F8C();
  objc_msgSend(v11, "setFrame:", v2, v4, v6, v8);

  sub_25BF4(v2, v4, v6, v8);
}

void sub_24848()
{
  id v1 = sub_21F8C();
  [v1 removeFromSuperview];

  id v2 = sub_21F18();
  if (v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] == 1)
  {
    if (qword_47BE0 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_47C78;
    id v4 = (id)qword_49468;
    if (v3 != -1) {
      swift_once();
    }
    id v5 = (id)qword_49508;
    NSString v6 = sub_36DC8();
    id v7 = [self imageNamed:v6 inBundle:v4 withConfiguration:v5];

    if (!v7)
    {
LABEL_14:
      sub_371D8();
      __break(1u);
      return;
    }
  }
  else
  {
    if (qword_47C78 != -1) {
      swift_once();
    }
    id v8 = (id)qword_49508;
    NSString v9 = sub_36DC8();
    id v7 = [self systemImageNamed:v9 withConfiguration:v8];

    if (!v7) {
      goto LABEL_14;
    }
  }
  [v2 setImage:v7];

  id v10 = sub_21F18();
  id v11 = [self whiteColor];
  [v10 setTintColor:v11];

  id v12 = sub_21F18();
  [v12 sizeToFit];

  id v13 = sub_21F18();
  [v0 addSubview:v13];
}

void sub_24B44()
{
  id v1 = v0;
  uint64_t v2 = sub_36BE8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_36D38();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = sub_21F18();
  [v10 removeFromSuperview];

  id v11 = sub_21F8C();
  [v1 addSubview:v11];

  sub_24E20();
  id v12 = sub_21F8C();
  id v13 = sub_2E270();

  sub_250B8();
  NSString v14 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v13 setText:v14];

  id v15 = sub_21F8C();
  id v16 = sub_2E33C();

  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
  sub_36CE8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_36BD8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v18 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v16 setText:v18];
}

void sub_24E20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_36D38();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_36858();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSString v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v10 = sub_21F8C();
  uint64_t v11 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v12, v2);
  char v13 = sub_22A54((uint64_t)v5);
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  NSString v14 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontDescriptor);
  double v15 = *(double *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_fontSizeFactor);
  id v16 = v14;
  sub_22004();
  sub_2EAEC(v13, v14, *(unsigned char *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical), v15, v17);
}

uint64_t sub_250B8()
{
  uint64_t v1 = sub_36858();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36718();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) == 1)
  {
    uint64_t v9 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary;
    swift_beginAccess();
    sub_27CD8(v9, (uint64_t)&v21);
    if (v22)
    {
      sub_27D84(&v21, (uint64_t)v23);
      if (qword_47BD0 != -1) {
        swift_once();
      }
      uint64_t v10 = *(void *)(qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter);
      uint64_t v11 = v24;
      uint64_t v12 = v25;
      char v13 = sub_27D40(v23, v24);
      swift_retain();
      uint64_t v14 = sub_2D7D8((uint64_t)v13, v10, v11, v12);
      swift_release();
      sub_6930((uint64_t)v23);
    }
    else
    {
      sub_13704((uint64_t)&v21, &qword_48A60);
      sub_368F8();
      id v16 = sub_36708();
      os_log_type_t v17 = sub_36F48();
      if (os_log_type_enabled(v16, v17))
      {
        NSString v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v18 = 0;
        _os_log_impl(&dword_0, v16, v17, "DepthRichCircularView: No summary present for historical metrics", v18, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      return 11565;
    }
  }
  else
  {
    if (qword_47BD0 != -1) {
      swift_once();
    }
    uint64_t v15 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v15, v1);
    swift_retain();
    uint64_t v14 = sub_36A78();
    swift_release();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v14;
}

uint64_t sub_25444()
{
  uint64_t v1 = sub_36858();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v51 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v45 - v5;
  uint64_t v7 = sub_66B8(&qword_483A0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  CGRect v48 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = sub_36B28();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v54 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = v0;
  uint64_t v15 = (uint64_t)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary];
  swift_beginAccess();
  sub_27CD8(v15, (uint64_t)v55);
  uint64_t v16 = v56;
  uint64_t v53 = v13;
  uint64_t v50 = v12;
  if (!v56)
  {
    sub_13704((uint64_t)v55, &qword_48A60);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
LABEL_7:
    sub_36A08();
    sub_13704((uint64_t)v11, &qword_483A0);
    goto LABEL_9;
  }
  os_log_type_t v17 = sub_27D40(v55, v56);
  uint64_t v18 = *(void *)(v16 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v20);
  sub_13704((uint64_t)v55, &qword_48A60);
  sub_36D48();
  uint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
  if (v22)
  {
    sub_36B08();
    swift_bridgeObjectRelease();
    uint64_t v12 = v50;
    uint64_t v23 = v53;
  }
  else
  {
    uint64_t v23 = v53;
    uint64_t v12 = v50;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v53 + 56))(v11, 1, 1, v50);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v11, 1, v12) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v54, v11, v12);
LABEL_9:
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v24 = &v52[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  swift_beginAccess();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v25(v6, v24, v1);
  uint64_t v26 = v2;
  uint64_t v49 = v1;
  int v27 = v6;
  uint64_t v28 = v53;
  uint64_t v29 = (uint64_t)v48;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v48, v54, v12);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v29, 0, 1, v12);
  swift_retain();
  uint64_t v30 = sub_36A88();
  uint64_t v46 = v31;
  uint64_t v47 = v30;
  sub_13704(v29, &qword_483A0);
  swift_release();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v26 + 8);
  unint64_t v33 = v27;
  uint64_t v34 = v49;
  v32(v33, v49);
  uint64_t v35 = v51;
  v25(v51, v24, v34);
  int v36 = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v35, v34);
  if (v36 == enum case for WaterDepth.shallow(_:)
    || v36 == enum case for WaterDepth.nominal(_:)
    || v36 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    v32(v51, v34);
  }
  else if (v36 != enum case for WaterDepth.unknown(_:) {
         && v36 != enum case for WaterDepth.notSubmerged(_:)
  }
         && v36 != enum case for WaterDepth.depthExceedingSensorLimit(_:))
  {
    uint64_t result = sub_37258();
    __break(1u);
    return result;
  }
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v37 = (id)qword_49468;
  NSString v38 = sub_36DC8();
  NSString v39 = sub_36DC8();
  id v40 = [v37 localizedStringForKey:v38 value:0 table:v39];

  sub_36DD8();
  swift_bridgeObjectRelease();

  sub_66B8(&qword_483A8);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_38040;
  *(void *)(v41 + 56) = &type metadata for String;
  *(void *)(v41 + 64) = sub_13760();
  uint64_t v42 = v46;
  *(void *)(v41 + 32) = v47;
  *(void *)(v41 + 40) = v42;
  sub_36DE8();
  swift_bridgeObjectRelease();
  NSString v43 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v52 setAccessibilityLabel:v43];

  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v54, v50);
}

void sub_25BF4(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = sub_36B28();
  uint64_t v59 = *(void *)(v9 - 8);
  uint64_t v60 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v58 = &v55[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v57 = &v55[-v12];
  uint64_t v13 = sub_36858();
  uint64_t v14 = *(void **)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v63 = &v55[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v68 = &v55[-v18];
  __chkstk_darwin(v17);
  uint64_t v20 = &v55[-v19];
  uint64_t v21 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer;
  [*(id *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_tickLayer] removeFromSuperlayer];
  uint64_t v62 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer;
  [*(id *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer] removeFromSuperlayer];
  uint64_t v61 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer;
  [*(id *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthLayer] removeFromSuperlayer];
  uint64_t v22 = &v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  swift_beginAccess();
  uint64_t v23 = (void (*)(unsigned char *, char *, uint64_t))v14[2];
  uint64_t v67 = v22;
  uint64_t v70 = v23;
  v23(v20, v22, v13);
  uint64_t v65 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable;
  uint64_t v24 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical;
  uint64_t v25 = (void *)sub_2C604((uint64_t)v20, v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable], v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical]);
  uint64_t v26 = (void (*)(unsigned char *, uint64_t))v14[1];
  id v27 = v25;
  uint64_t v66 = v26;
  v26(v20, v13);
  id v69 = v27;
  id v28 = sub_1EF5C(v27, a1, a2, a3, a4);
  id v29 = [v4 layer];
  [v29 insertSublayer:v28 atIndex:0];

  uint64_t v30 = *(void **)&v4[v21];
  *(void *)&v4[v21] = v28;
  id v31 = v28;

  if (v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] == 1 && v4[v24] != 1)
  {
    id v38 = v69;
    goto LABEL_28;
  }
  id v64 = v31;
  unint64_t v33 = v67;
  uint64_t v32 = v68;
  v70(v68, v67, v13);
  uint64_t v34 = (uint64_t (*)(unsigned char *, uint64_t))v14[11];
  int v35 = v34(v32, v13);
  int v36 = enum case for WaterDepth.shallow(_:);
  int v37 = enum case for WaterDepth.nominal(_:);
  if (v35 == enum case for WaterDepth.shallow(_:)
    || v35 == enum case for WaterDepth.nominal(_:)
    || v35 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    int v56 = enum case for WaterDepth.depthExceedingNominalRange(_:);
    v66(v32, v13);
  }
  else
  {
    if (v35 == enum case for WaterDepth.unknown(_:) || v35 == enum case for WaterDepth.notSubmerged(_:)) {
      goto LABEL_12;
    }
    int v56 = enum case for WaterDepth.depthExceedingNominalRange(_:);
    if (v35 != enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
      goto LABEL_30;
    }
  }
  if (v4[v65])
  {
LABEL_12:
    id v38 = v69;
    id v31 = v64;
LABEL_28:

    return;
  }
  NSString v39 = v63;
  v70(v63, v33, v13);
  int v40 = v34(v39, v13);
  if (v40 == v36 || v40 == v37)
  {
    v66(v63, v13);
    goto LABEL_23;
  }
  if (v40 == v56)
  {
    v66(v63, v13);
LABEL_22:
    uint64_t v41 = v57;
    sub_36A08();
    NSString v43 = v58;
    uint64_t v42 = v59;
    uint64_t v44 = v60;
    (*(void (**)(unsigned char *, void, uint64_t))(v59 + 104))(v58, enum case for DeviceType.nonUltra(_:), v60);
    char v45 = sub_36B18();
    uint64_t v46 = *(void (**)(unsigned char *, uint64_t))(v42 + 8);
    v46(v43, v44);
    v46(v41, v44);
    if ((v45 & 1) == 0)
    {
      id v47 = sub_269FC(a1, a2, a3, a4);
      goto LABEL_24;
    }
LABEL_23:
    id v47 = sub_26254((uint64_t)v4, a1, a2, a3, a4);
LABEL_24:
    CGRect v48 = v47;
    id v49 = [v4 layer];
    id v31 = v64;
    [v49 insertSublayer:v48 above:v64];

    uint64_t v50 = *(void **)&v4[v61];
    *(void *)&v4[v61] = v48;
    id v38 = v48;

    uint64_t v51 = *(void **)&v4[v62];
    if (v51)
    {
      id v52 = v51;
      id v53 = [v4 layer];
      [v53 insertSublayer:v52 above:v38];

      uint64_t v54 = v38;
      id v38 = v69;
    }
    else
    {
      uint64_t v54 = v31;
      id v31 = v69;
    }

    goto LABEL_28;
  }
  if (v40 == enum case for WaterDepth.unknown(_:) || v40 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_23;
  }
  if (v40 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_22;
  }
LABEL_30:
  sub_37258();
  __break(1u);
}

id sub_26254(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) == 1)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    id v10 = (id)qword_49490;
  }
  else
  {
    id v10 = [self blackColor];
  }
  uint64_t v11 = v10;
  id v12 = sub_1EF5C(v10, a2, a3, a4, a5);
  id v13 = sub_267EC(a2, a3, a4, a5);
  [v12 setMask:v13];

  uint64_t v14 = *(void **)(a1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer);
  *(void *)(a1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer) = v12;
  id v15 = v12;

  id v16 = sub_263D8(a2, a3, a4, a5);
  id v17 = sub_267EC(a2, a3, a4, a5);
  [v16 setMask:v17];

  return v16;
}

id sub_263D8(double a1, double a2, double a3, double a4)
{
  id v9 = [objc_allocWithZone((Class)CAGradientLayer) init];
  objc_msgSend(v9, "setFrame:", a1, a2, a3, a4);
  int v10 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical);
  sub_66B8((uint64_t *)&unk_48A40);
  if (v10 == 1)
  {
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_38360;
    if (qword_47C08 != -1) {
      swift_once();
    }
    id v12 = [(id)qword_49498 CGColor];
    type metadata accessor for CGColor(0);
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = v13;
    *(void *)(v11 + 32) = v12;
    id v15 = [(id)qword_49498 CGColor];
    *(void *)(v11 + 88) = v14;
    *(void *)(v11 + 64) = v15;
    Class isa = sub_36E88().super.isa;
    swift_bridgeObjectRelease();
    [v9 setColors:isa];

    sub_66B8(&qword_47D58);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_37F00;
    *(void *)(v17 + 32) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.0];
    *(void *)(v17 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:1.0];
  }
  else
  {
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_38350;
    if (qword_47C18 != -1) {
      swift_once();
    }
    id v19 = [(id)qword_494A8 CGColor];
    type metadata accessor for CGColor(0);
    uint64_t v21 = v20;
    *(void *)(v18 + 56) = v20;
    *(void *)(v18 + 32) = v19;
    if (qword_47C20 != -1) {
      swift_once();
    }
    id v22 = [(id)qword_494B0 CGColor];
    *(void *)(v18 + 88) = v21;
    *(void *)(v18 + 64) = v22;
    if (qword_47C28 != -1) {
      swift_once();
    }
    id v23 = [(id)qword_494B8 CGColor];
    *(void *)(v18 + 120) = v21;
    *(void *)(v18 + 96) = v23;
    Class v24 = sub_36E88().super.isa;
    swift_bridgeObjectRelease();
    [v9 setColors:v24];

    sub_66B8(&qword_47D58);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_381D0;
    *(void *)(v25 + 32) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.0];
    *(void *)(v25 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.4];
    *(void *)(v25 + 48) = [objc_allocWithZone((Class)NSNumber) initWithDouble:1.0];
  }
  sub_36EA8();
  sub_AB28(0, (unint64_t *)&unk_48A50);
  Class v26 = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  [v9 setLocations:v26];

  return v9;
}

id sub_267EC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double Height = CGRectGetHeight(*(CGRect *)&a1);
  double v9 = Height * 0.5;
  v24.origin.x = a1;
  v24.origin.double y = a2;
  v24.size.double width = a3;
  v24.size.double height = a4;
  CGFloat v10 = CGRectGetMidY(v24) + Height * 0.5 * -0.707106781;
  v25.origin.x = a1;
  v25.origin.double y = a2;
  v25.size.double width = a3;
  v25.size.double height = a4;
  CGFloat v11 = CGRectGetMidY(v25) + Height * 0.5 * 0.707106781 - v10;
  sub_22004();
  CGFloat v13 = v10 + v12 * v11;
  double v14 = sqrt(v9 * v9 - (v13 - v9) * (v13 - v9));
  double v15 = Height * 0.5 + v14;
  double v16 = Height - v15;
  atan2(v13 - v9, v9 + v14 - v9);
  atan2(v13 - v9, v16 - v9);
  id v17 = [objc_allocWithZone((Class)UIBezierPath) init];
  objc_msgSend(v17, "moveToPoint:", v15, v13);
  sub_36FE8();
  objc_msgSend(v17, "addQuadCurveToPoint:controlPoint:", v16, v13, v18, v19);
  sub_36FE8();
  objc_msgSend(v17, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1);
  id v20 = [objc_allocWithZone((Class)CAShapeLayer) init];
  objc_msgSend(v20, "setFrame:", a1, a2, a3, a4);
  id v21 = [v17 CGPath];
  [v20 setPath:v21];

  return v20;
}

id sub_269FC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical;
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical) == 1)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    id v10 = (id)qword_49490;
  }
  else
  {
    id v10 = [self blackColor];
  }
  CGFloat v11 = v10;
  id v12 = sub_1EF5C(v10, a1, a2, a3, a4);

  CGFloat v13 = *(void **)(v4 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer);
  *(void *)(v4 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depthTickLayer) = v12;
  id v14 = v12;

  id v15 = [objc_allocWithZone((Class)CAShapeLayer) init];
  objc_msgSend(v15, "setFrame:", a1, a2, a3, a4);
  id v16 = objc_msgSend(self, "bezierPathWithOvalInRect:", a1, a2, a3, a4);
  id v17 = [v16 CGPath];

  [v15 setPath:v17];
  if (*(unsigned char *)(v4 + v9) == 1)
  {
    if (qword_47C08 != -1) {
      swift_once();
    }
    double v18 = &qword_49498;
  }
  else
  {
    if (qword_47C50 != -1) {
      swift_once();
    }
    double v18 = &qword_494E0;
  }
  id v19 = [(id)*v18 CGColor];
  [v15 setFillColor:v19];

  [v15 addSublayer:v14];
  return v15;
}

id sub_26C98()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthRichCircularView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_26DD8()
{
  return type metadata accessor for DepthRichCircularView();
}

uint64_t type metadata accessor for DepthRichCircularView()
{
  uint64_t result = qword_489D0;
  if (!qword_489D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_26E2C()
{
  uint64_t result = sub_36858();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

id sub_26F10(void *a1)
{
  objc_super v2 = v1;
  uint64_t v57 = sub_36718();
  uint64_t v4 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v6 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_66B8(&qword_48A78);
  __chkstk_darwin(v7 - 8);
  uint64_t v55 = (uint64_t)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36858();
  uint64_t v59 = *(void *)(v9 - 8);
  uint64_t v60 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v58 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  CGFloat v13 = (char *)v53 - v12;
  uint64_t v14 = sub_66B8((uint64_t *)&unk_48A80);
  __chkstk_darwin(v14 - 8);
  id v16 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v54 = (uint64_t)v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  id v23 = (char *)v53 - v22;
  __chkstk_darwin(v21);
  uint64_t v56 = (uint64_t)v53 - v24;
  if (!a1) {
    goto LABEL_14;
  }
  id v25 = [a1 metadata];
  if (!v25) {
    goto LABEL_14;
  }
  Class v26 = v25;
  v53[1] = sub_66B8((uint64_t *)&unk_48A90);
  uint64_t v27 = sub_36D88();

  sub_CD30(v27, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
  {
    uint64_t v28 = v56;
    sub_27D9C((uint64_t)v16, v56);
    if (qword_47BD8 == -1)
    {
      if (!*(void *)(v27 + 16)) {
        goto LABEL_12;
      }
    }
    else
    {
      swift_once();
      if (!*(void *)(v27 + 16)) {
        goto LABEL_12;
      }
    }
    uint64_t v29 = qword_49460;
    uint64_t v30 = qword_49458;
    swift_bridgeObjectRetain();
    unint64_t v31 = sub_29BDC(v30, v29);
    if (v32)
    {
      uint64_t v33 = *(void *)(*(void *)(v27 + 56) + 8 * v31);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&long long v62 = v33;
      if (swift_dynamicCast())
      {
        char v34 = v61;
        sub_B134((uint64_t)v13);
        int v35 = &v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
        swift_beginAccess();
        uint64_t v36 = v59;
        uint64_t v37 = v28;
        uint64_t v38 = v60;
        (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v35, v13, v60);
        swift_endAccess();
        sub_65F0(v37, (uint64_t)v23);
        LOBYTE(v35) = swift_getEnumCaseMultiPayload() == 2;
        sub_AACC((uint64_t)v23);
        v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] = (_BYTE)v35;
        uint64_t v39 = v54;
        sub_65F0(v37, v54);
        LOBYTE(v35) = swift_getEnumCaseMultiPayload() == 0;
        sub_AACC(v39);
        v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical] = (_BYTE)v35;
        uint64_t v40 = v55;
        sub_BF88(v55);
        uint64_t v41 = sub_36B58();
        uint64_t v42 = *(void *)(v41 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41) == 1)
        {
          sub_13704(v40, &qword_48A78);
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v64 = 0;
        }
        else
        {
          *((void *)&v63 + 1) = v41;
          uint64_t v64 = sub_27E68((unint64_t *)&qword_47DD0, (void (*)(uint64_t))&type metadata accessor for DiveSummary);
          uint64_t v51 = sub_68CC((uint64_t *)&v62);
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(v42 + 32))(v51, v40, v41);
        }
        id v47 = v58;
        uint64_t v52 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_summary];
        swift_beginAccess();
        sub_27E00((uint64_t)&v62, v52);
        swift_endAccess();
        sub_AACC(v56);
        v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] = v34;
        goto LABEL_17;
      }
      goto LABEL_13;
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    sub_AACC(v28);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_13704((uint64_t)v16, (uint64_t *)&unk_48A80);
LABEL_14:
  sub_368F8();
  NSString v43 = sub_36708();
  os_log_type_t v44 = sub_36F38();
  if (os_log_type_enabled(v43, v44))
  {
    char v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v45 = 0;
    _os_log_impl(&dword_0, v43, v44, "Circular complication missing expected metadata.", v45, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v57);
  uint64_t v36 = v59;
  uint64_t v38 = v60;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v13, enum case for WaterDepth.unknown(_:), v60);
  uint64_t v46 = &v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v36 + 40))(v46, v13, v38);
  swift_endAccess();
  v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] = 1;
  v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical] = 0;
  v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] = 0;
  id v47 = v58;
LABEL_17:
  sub_2425C();
  if (v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_alwaysOn] == 1
    && v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_historical] != 1)
  {
    goto LABEL_28;
  }
  CGRect v48 = &v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_depth];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v47, v48, v38);
  int v49 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v47, v38);
  if (v49 == enum case for WaterDepth.shallow(_:)
    || v49 == enum case for WaterDepth.nominal(_:)
    || v49 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    goto LABEL_26;
  }
  if (v49 == enum case for WaterDepth.unknown(_:) || v49 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_28;
  }
  if (v49 != enum case for WaterDepth.depthExceedingSensorLimit(_:))
  {
    sub_37258();
    __break(1u);
LABEL_26:
    (*(void (**)(char *, uint64_t))(v36 + 8))(v47, v38);
  }
  if (v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion21DepthRichCircularView_unavailable] != 1)
  {
    sub_24B44();
    goto LABEL_30;
  }
LABEL_28:
  sub_24848();
LABEL_30:
  sub_25444();
  [v2 setNeedsLayout];
  return [v2 layoutIfNeeded];
}

uint64_t sub_277EC(unint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_371E8();
    uint64_t v4 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (!v4) {
      goto LABEL_13;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((a2 & 0xC000000000000001) != 0) {
      id v8 = (id)sub_37128();
    }
    else {
      id v8 = *(id *)(a2 + 8 * v6 + 32);
    }
    uint64_t v9 = v8;
    id v10 = [v8 layer];
    if (a1)
    {
      sub_1956C(a1);
      v7.super.Class isa = sub_36E88().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v7.super.Class isa = 0;
    }
    ++v6;
    [v10 setFilters:v7.super.isa];
  }
  while (v4 != v6);
LABEL_13:

  return swift_bridgeObjectRelease();
}

uint64_t sub_2793C(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (a2 >> 62) {
    goto LABEL_34;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_371E8())
  {
    uint64_t v5 = 0;
    unint64_t v6 = v2 & 0xC000000000000001;
    unint64_t v23 = v2 + 32;
    NSArray v7 = &selRef_resumeLiveFullColorImageView;
    uint64_t v25 = v4;
    unint64_t v26 = v2;
    unint64_t v24 = v2 & 0xC000000000000001;
    while (1)
    {
      id v9 = v6 ? (id)sub_37128() : *(id *)(v23 + 8 * v5);
      id v10 = v9;
      if (__OFADD__(v5++, 1)) {
        break;
      }
      if (a1)
      {
        if (a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_371E8();
          swift_bridgeObjectRelease();
          id v27 = v10;
          if (v12)
          {
LABEL_13:
            uint64_t v29 = &_swiftEmptyArrayStorage;
            sub_32F18(0, v12 & ~(v12 >> 63), 0);
            if (v12 < 0) {
              goto LABEL_33;
            }
            if ((a1 & 0xC000000000000001) != 0)
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                sub_37128();
                sub_AB28(0, (unint64_t *)&qword_48A70);
                swift_dynamicCast();
                uint64_t v14 = v29;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_32F18(0, v14[2] + 1, 1);
                  uint64_t v14 = v29;
                }
                unint64_t v16 = v14[2];
                unint64_t v15 = v14[3];
                if (v16 >= v15 >> 1)
                {
                  sub_32F18(v15 > 1, v16 + 1, 1);
                  uint64_t v14 = v29;
                }
                v14[2] = v16 + 1;
                sub_197E0(v28, &v14[4 * v16 + 4]);
              }
            }
            else
            {
              sub_AB28(0, (unint64_t *)&qword_48A70);
              uint64_t v17 = (id *)(a1 + 32);
              do
              {
                id v18 = *v17;
                swift_dynamicCast();
                uint64_t v19 = v29;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_32F18(0, v19[2] + 1, 1);
                  uint64_t v19 = v29;
                }
                unint64_t v21 = v19[2];
                unint64_t v20 = v19[3];
                if (v21 >= v20 >> 1)
                {
                  sub_32F18(v20 > 1, v21 + 1, 1);
                  uint64_t v19 = v29;
                }
                void v19[2] = v21 + 1;
                sub_197E0(v28, &v19[4 * v21 + 4]);
                ++v17;
                --v12;
              }
              while (v12);
            }
            uint64_t v4 = v25;
            unint64_t v2 = v26;
            unint64_t v6 = v24;
            NSArray v7 = &selRef_resumeLiveFullColorImageView;
          }
        }
        else
        {
          uint64_t v12 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
          id v27 = v9;
          if (v12) {
            goto LABEL_13;
          }
        }
        Class isa = sub_36E88().super.isa;
        swift_bridgeObjectRelease();
        id v10 = v27;
        goto LABEL_5;
      }
      Class isa = 0;
LABEL_5:
      objc_msgSend(v10, v7[84], isa);

      if (v5 == v4) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_27CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_48A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_27D40(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_27D84(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_27D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DepthComplicationMetrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_27E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_48A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_27E68(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_27EB0(void *a1)
{
  type metadata accessor for DepthComplicationMetrics(0);
  swift_storeEnumTagMultiPayload();
  v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_alwaysOn] = 0;
  *(_OWORD *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView] = xmmword_383F0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_filterProvider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_device] = a1;
  id v3 = objc_allocWithZone((Class)CLKDeviceMetrics);
  uint64_t v4 = v1;
  id v5 = a1;
  id v6 = [v3 initWithDevice:v5 identitySizeClass:8];
  *(void *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_deviceMetrics] = v6;

  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for DepthRectangularView();
  id v10 = objc_msgSendSuper2(&v12, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v10 setClipsToBounds:1];

  return v10;
}

BOOL sub_2814C(uint64_t a1)
{
  uint64_t v35 = a1;
  uint64_t v1 = sub_36A58();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  uint64_t v32 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36D38();
  uint64_t v33 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSArray v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_66B8(&qword_481F0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  unint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v18);
  unint64_t v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_65F0(v35, (uint64_t)v20);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      BOOL v22 = *(void *)(v34 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8) >> 62 != 1;
      sub_29E98((uint64_t)v20, type metadata accessor for DepthComplicationMetrics);
      return v22;
    }
    goto LABEL_9;
  }
  unint64_t v23 = v7;
  uint64_t v24 = v33;
  sub_13570((uint64_t)v20, (uint64_t)v17);
  sub_15B80((uint64_t)v17, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) == 1)
  {
    sub_13704((uint64_t)v17, &qword_481F0);
    sub_13704((uint64_t)v15, &qword_481F0);
LABEL_9:
    BOOL v29 = *(void *)(v34 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8) >> 62 == 0;
    return !v29;
  }
  sub_2A5CC((uint64_t)v15, (uint64_t)v11, type metadata accessor for HistoricalDepthMetrics);
  double v25 = *(double *)&v11[*(int *)(v8 + 20)];
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v23, v26, v5);
  sub_36CC8();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v5);
  sub_36A28();
  double v28 = v27;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v31);
  sub_29E98((uint64_t)v11, type metadata accessor for HistoricalDepthMetrics);
  sub_13704((uint64_t)v17, &qword_481F0);
  if (v28 > v25) {
    goto LABEL_9;
  }
  BOOL v29 = *(void *)(v34 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8) >> 62 == 2;
  return !v29;
}

id sub_285EC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LiveMetrics(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (char **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView];
  unint64_t v14 = *(void *)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8];
  if (v14 >> 62 != 3)
  {
    unint64_t v15 = *v13;
    sub_29A14(*v13, *(void *)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8]);
    [v15 removeFromSuperview];
    uint64_t v16 = *v13;
    unint64_t v17 = (unint64_t)v13[1];
    *(_OWORD *)uint64_t v13 = xmmword_383F0;
    sub_29A34(v16, v17);
    sub_29A34(v15, v14);
  }
  sub_65F0(a1, (uint64_t)v12);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_2A5CC((uint64_t)v12, (uint64_t)v6, type metadata accessor for LiveMetrics);
      uint64_t v19 = *(void **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_device];
      id v20 = objc_allocWithZone((Class)type metadata accessor for DepthRectangularLiveView(0));
      unint64_t v21 = sub_16CB0(v19);
      unint64_t v23 = *v13;
      unint64_t v22 = (unint64_t)v13[1];
      *uint64_t v13 = v21;
      v13[1] = (char *)0x40000000000414E8;
      sub_29A34(v23, v22);
      id result = (id)sub_29E98((uint64_t)v6, type metadata accessor for LiveMetrics);
      goto LABEL_9;
    }
    uint64_t v25 = type metadata accessor for HistoricalDepthMetrics(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
  }
  else
  {
    sub_13570((uint64_t)v12, (uint64_t)v9);
  }
  sub_28890((uint64_t)v9);
  id result = (id)sub_13704((uint64_t)v9, &qword_481F0);
LABEL_9:
  if ((unint64_t)v13[1] >> 62 != 3) {
    return [v2 addSubview:*v13];
  }
  return result;
}

void sub_28890(uint64_t a1)
{
  uint64_t v2 = sub_36718();
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v47 = (char *)&v46 - v6;
  uint64_t v7 = sub_36A58();
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_36D38();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_66B8(&qword_481F0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for HistoricalDepthMetrics(0);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15B80(a1, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_13704((uint64_t)v16, &qword_481F0);
LABEL_7:
    sub_368F8();
    uint64_t v25 = sub_36708();
    os_log_type_t v26 = sub_36F48();
    if (os_log_type_enabled(v25, v26))
    {
      double v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "DepthRectangularView: Reconfiguring with historical simple", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v5, v51);
    uint64_t v28 = v52;
    BOOL v29 = *(void **)(v52 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_device);
    id v30 = objc_allocWithZone((Class)type metadata accessor for DepthRectangularSimpleHistoryView());
    uint64_t v31 = sub_4A3C(v29);
    uint64_t v32 = (char **)(v28 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
    uint64_t v34 = *(void **)(v28 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
    unint64_t v33 = *(void *)(v28 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8);
    *uint64_t v32 = v31;
    v32[1] = (char *)&off_41260;
    sub_29A34(v34, v33);
    return;
  }
  sub_2A5CC((uint64_t)v16, (uint64_t)v20, type metadata accessor for HistoricalDepthMetrics);
  double v21 = *(double *)&v20[*(int *)(v17 + 20)];
  if (qword_47BD0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_49428 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v22, v10);
  sub_36CC8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_36A28();
  double v24 = v23;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v49);
  if (v24 > v21)
  {
    sub_29E98((uint64_t)v20, type metadata accessor for HistoricalDepthMetrics);
    goto LABEL_7;
  }
  uint64_t v35 = v47;
  sub_368F8();
  uint64_t v36 = sub_36708();
  os_log_type_t v37 = sub_36F48();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_0, v36, v37, "DepthRectangularView: Reconfiguring with historical graph", v38, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v50 + 8))(v35, v51);
  uint64_t v39 = v52;
  uint64_t v40 = *(void **)(v52 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_device);
  id v41 = objc_allocWithZone((Class)type metadata accessor for DepthRectangularHistoricalGraphView());
  sub_13FDC(v40);
  uint64_t v42 = (void *)(v39 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
  os_log_type_t v44 = *(void **)(v39 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
  unint64_t v43 = *(void *)(v39 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8);
  *uint64_t v42 = v45;
  v42[1] = 0x80000000000414B8;
  sub_29A34(v44, v43);
  sub_29E98((uint64_t)v20, type metadata accessor for HistoricalDepthMetrics);
}

void sub_28E58()
{
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for DepthRectangularView();
  objc_msgSendSuper2(&v19, "layoutSubviews");
  uint64_t v1 = (id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView];
  unint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8];
  if (v2 >> 62 != 3)
  {
    id v3 = *v1;
    sub_29A14(*v1, *(void *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8]);
    [v0 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_deviceMetrics] scaledValue:CLKRichRectangularContentMargin];
    CGFloat v13 = v12;
    v20.origin.x = v5;
    v20.origin.double y = v7;
    v20.size.double width = v9;
    v20.size.double height = v11;
    CGRect v21 = CGRectInset(v20, v13, 0.0);
    objc_msgSend(v3, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    if ([v3 effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
    {
      CGAffineTransformMakeScale(&v18, -1.0, 1.0);
      long long v16 = *(_OWORD *)&v18.c;
      long long v17 = *(_OWORD *)&v18.a;
      CGFloat tx = v18.tx;
      tdouble y = v18.ty;
      sub_29A14(v3, v2);
      *(_OWORD *)&v18.a = v17;
      *(_OWORD *)&v18.c = v16;
      v18.CGFloat tx = tx;
      v18.tdouble y = ty;
      [v3 setTransform:&v18];
      sub_2901C(v3);
      sub_29A34(v3, v2);
    }
    sub_29A34(v3, v2);
  }
}

uint64_t sub_2901C(void *a1)
{
  id v1 = [a1 subviews];
  sub_AB28(0, &qword_48B60);
  unint64_t v2 = sub_36E98();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_371E8();
    swift_bridgeObjectRelease();
    if (v3)
    {
LABEL_3:
      sub_AB28(0, &qword_48B68);
      uint64_t result = swift_getObjCClassFromMetadata();
      if (v3 < 1)
      {
        __break(1u);
      }
      else
      {
        uint64_t v5 = result;
        for (uint64_t i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            id v7 = (id)sub_37128();
          }
          else {
            id v7 = *(id *)(v2 + 8 * i + 32);
          }
          double v8 = v7;
          if (([v7 isKindOfClass:v5] & 1) != 0
            || [v8 semanticContentAttribute] == (char *)&dword_0 + 3)
          {
            CGAffineTransformMakeScale(&v9, -1.0, 1.0);
            [v8 setTransform:&v9];
          }
          else
          {
            sub_2901C(v8);
          }
        }
        return swift_bridgeObjectRelease();
      }
      return result;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    if (v3) {
      goto LABEL_3;
    }
  }

  return swift_bridgeObjectRelease();
}

void sub_2927C(double a1)
{
  unint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_filterProvider);
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView;
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
    unint64_t v6 = *(void *)(v4 + 8);
    uint64_t v7 = v6;
    switch(v6 >> 62)
    {
      case 1uLL:
      case 2uLL:
        uint64_t v7 = v6 & 0x3FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      case 3uLL:
        return;
      default:
LABEL_4:
        uint64_t ObjectType = swift_getObjectType();
        double v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 16);
        swift_unknownObjectRetain();
        sub_29A14(v5, v6);
        unint64_t v11 = v10(ObjectType, v7);
        unint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(ObjectType, v7);
        unint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(ObjectType, v7);
        sub_18A58(v2, v3, *(uint64_t *)&a1, 0, v11, v12, v13);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_29A34(v5, v6);
        swift_unknownObjectRelease();
        break;
    }
  }
}

void sub_29468()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_filterProvider);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView;
    uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
    unint64_t v5 = *(void *)(v3 + 8);
    uint64_t v6 = v5;
    switch(v5 >> 62)
    {
      case 1uLL:
      case 2uLL:
        uint64_t v6 = v5 & 0x3FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      case 3uLL:
        return;
      default:
LABEL_4:
        uint64_t ObjectType = swift_getObjectType();
        double v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 16);
        swift_unknownObjectRetain();
        sub_29A14(v4, v5);
        unint64_t v9 = v8(ObjectType, v6);
        unint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(ObjectType, v6);
        unint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(ObjectType, v6);
        sub_18A58(v1, v2, 0, 1, v9, v10, v11);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_29A34(v4, v5);
        swift_unknownObjectRelease();
        break;
    }
  }
}

void sub_29634()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView);
  unint64_t v2 = *(void *)(v1 + 8);
  uint64_t v4 = v2;
  switch(v2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      uint64_t v4 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      goto LABEL_3;
    case 3uLL:
      return;
    default:
LABEL_3:
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 40);
      sub_29A14(v3, v2);
      unint64_t v7 = v6(ObjectType, v4);
      unint64_t v8 = v7;
      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_371E8();
        if (!v9) {
          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v9 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (!v9) {
          goto LABEL_12;
        }
      }
      if (v9 < 1)
      {
        __break(1u);
        JUMPOUT(0x297B8);
      }
      for (uint64_t i = 0; i != v9; ++i)
      {
        if ((v8 & 0xC000000000000001) != 0) {
          id v11 = (id)sub_37128();
        }
        else {
          id v11 = *(id *)(v8 + 8 * i + 32);
        }
        unint64_t v12 = v11;
        [v11 setFilters:0];
      }
LABEL_12:
      swift_bridgeObjectRelease();
      sub_29A34(v3, v2);
      swift_bridgeObjectRelease();
      return;
  }
}

id sub_297F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthRectangularView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_298C4()
{
  return type metadata accessor for DepthRectangularView();
}

uint64_t type metadata accessor for DepthRectangularView()
{
  uint64_t result = qword_48B50;
  if (!qword_48B50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_29918()
{
  uint64_t result = type metadata accessor for DepthComplicationMetrics(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ActiveView(void *a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  sub_29A14(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

id sub_29A14(id result, unint64_t a2)
{
  if (a2 >> 62 != 3) {
    return result;
  }
  return result;
}

void destroy for ActiveView(uint64_t a1)
{
}

void sub_29A34(id a1, unint64_t a2)
{
  if (a2 >> 62 != 3) {
}
  }

uint64_t assignWithCopy for ActiveView(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  sub_29A14(*(id *)a2, v4);
  unint64_t v5 = *(void **)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  sub_29A34(v5, v6);
  return a1;
}

uint64_t assignWithTake for ActiveView(uint64_t a1, _OWORD *a2)
{
  id v3 = *(void **)a1;
  unint64_t v4 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  sub_29A34(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActiveView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 57) >> 5) | (4
                                                          * ((*(void *)(a1 + 8) >> 57) & 0x18 | *(void *)(a1 + 8) & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ActiveView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)uint64_t result = a2 - 125;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_29B78(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 62;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_29B94(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_29BA4(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  }
  else
  {
    *uint64_t result = (a2 - 3);
    result[1] = 0xC000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActiveView()
{
  return &type metadata for ActiveView;
}

unint64_t sub_29BDC(uint64_t a1, uint64_t a2)
{
  sub_372A8();
  sub_36E38();
  Swift::Int v4 = sub_372C8();

  return sub_29C98(a1, a2, v4);
}

unint64_t sub_29C54(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_37008(*(void *)(v2 + 40));

  return sub_29D7C(a1, v4);
}

unint64_t sub_29C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_37268() & 1) == 0)
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
      while (!v14 && (sub_37268() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_29D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_AB28(0, &qword_488C0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_37018();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_37018();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_29E98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_29EF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_36718();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  char v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)v47 - v8;
  uint64_t v10 = sub_66B8((uint64_t *)&unk_48A80);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DepthComplicationMetrics(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  long long v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  objc_super v19 = (char *)v47 - v18;
  if (!a1) {
    goto LABEL_13;
  }
  id v20 = [a1 metadata];
  if (!v20) {
    goto LABEL_13;
  }
  CGRect v21 = v20;
  uint64_t v48 = v4;
  v47[1] = sub_66B8((uint64_t *)&unk_48A90);
  uint64_t v22 = sub_36D88();

  sub_CD30(v22, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
  {
    sub_2A5CC((uint64_t)v12, (uint64_t)v19, type metadata accessor for DepthComplicationMetrics);
    if (qword_47BD8 == -1)
    {
      if (!*(void *)(v22 + 16)) {
        goto LABEL_11;
      }
    }
    else
    {
      swift_once();
      if (!*(void *)(v22 + 16)) {
        goto LABEL_11;
      }
    }
    uint64_t v23 = qword_49460;
    uint64_t v24 = qword_49458;
    swift_bridgeObjectRetain();
    unint64_t v25 = sub_29BDC(v24, v23);
    if (v26)
    {
      uint64_t v27 = *(void *)(*(void *)(v22 + 56) + 8 * v25);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v51 = v27;
      if (swift_dynamicCast())
      {
        char v28 = v50;
        sub_65F0((uint64_t)v19, (uint64_t)v17);
        uint64_t v29 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_metrics];
        swift_beginAccess();
        sub_6654((uint64_t)v17, v29);
        swift_endAccess();
        sub_29E98((uint64_t)v19, type metadata accessor for DepthComplicationMetrics);
        v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_alwaysOn] = v28;
        uint64_t v4 = v48;
        uint64_t v30 = v49;
        goto LABEL_16;
      }
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v4 = v48;
    sub_29E98((uint64_t)v19, type metadata accessor for DepthComplicationMetrics);
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  sub_13704((uint64_t)v12, (uint64_t *)&unk_48A80);
  uint64_t v4 = v48;
LABEL_13:
  sub_368F8();
  uint64_t v31 = sub_36708();
  os_log_type_t v32 = sub_36F38();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v33 = 0;
    _os_log_impl(&dword_0, v31, v32, "DepthRectangularView: Rectangular complication missing expected metadata.", v33, 2u);
    swift_slowDealloc();
  }

  uint64_t v30 = v49;
  (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v4);
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_metrics];
  swift_beginAccess();
  sub_6654((uint64_t)v17, v34);
  swift_endAccess();
  v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_alwaysOn] = 0;
LABEL_16:
  sub_29634();
  uint64_t v35 = (uint64_t)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_metrics];
  swift_beginAccess();
  sub_65F0(v35, (uint64_t)v17);
  BOOL v36 = sub_2814C((uint64_t)v17);
  sub_29E98((uint64_t)v17, type metadata accessor for DepthComplicationMetrics);
  if (v36)
  {
    sub_368F8();
    os_log_type_t v37 = sub_36708();
    os_log_type_t v38 = sub_36F48();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_0, v37, v38, "DepthRectangularView: Needs configuration", v39, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v4);
    sub_65F0(v35, (uint64_t)v17);
    sub_285EC((uint64_t)v17);
    sub_29E98((uint64_t)v17, type metadata accessor for DepthComplicationMetrics);
  }
  uint64_t v40 = *(void **)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView];
  unint64_t v41 = *(void *)&v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_activeView + 8];
  uint64_t v42 = v41;
  switch(v41 >> 62)
  {
    case 1uLL:
    case 2uLL:
      uint64_t v42 = v41 & 0x3FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    case 3uLL:
      break;
    default:
LABEL_22:
      uint64_t ObjectType = swift_getObjectType();
      sub_65F0(v35, (uint64_t)v17);
      uint64_t v44 = v2[OBJC_IVAR____TtC32DepthComplicationBundleCompanion20DepthRectangularView_alwaysOn];
      uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 8);
      sub_29A14(v40, v41);
      v45(v17, v44, ObjectType, v42);
      sub_29A34(v40, v41);
      sub_29E98((uint64_t)v17, type metadata accessor for DepthComplicationMetrics);
      break;
  }
  [v2 setNeedsLayout];
  return [v2 layoutIfNeeded];
}

uint64_t sub_2A5CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_UNKNOWN **sub_2A72C()
{
  return &off_411F8;
}

id sub_2A828()
{
  uint64_t v18 = sub_36C78();
  uint64_t v1 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36D38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_36B88();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Temperature.unknown(_:), v8);
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14BaseDataSource_timelineDataProvider)
      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
  sub_36D08();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  char v13 = sub_36C58();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v18);
  id v14 = sub_1DED0((uint64_t)v11, (v13 & 1) == 0, 0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v15 = sub_1AE28((uint64_t)[v17[1] family]);

  return v15;
}

id sub_2AB30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TemperatureDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TemperatureDataSource()
{
  return self;
}

uint64_t sub_2AB88()
{
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_49468;
  NSString v1 = sub_36DC8();
  NSString v2 = sub_36DC8();
  id v3 = [v0 localizedStringForKey:v1 value:0 table:v2];

  uint64_t v4 = sub_36DD8();
  return v4;
}

void sub_2AC80(char *a1, uint64_t a2)
{
  uint64_t v26 = a2;
  id v22 = a1;
  uint64_t v3 = sub_366B8();
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_36C78();
  uint64_t v6 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36D38();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_36B88();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for Temperature.unknown(_:), v13);
  uint64_t v17 = *(void *)&a1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14BaseDataSource_timelineDataProvider]
      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_settings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v17, v9);
  sub_36D08();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  LOBYTE(v17) = sub_36C58();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v23);
  id v18 = sub_1DED0((uint64_t)v16, (v17 & 1) == 0, 0);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_366A8();
  id v19 = sub_1AE28((uint64_t)[v22 family]);
  Class isa = sub_36698().super.isa;
  id v21 = [self entryWithDate:isa complicationTemplate:v19];

  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
  (*(void (**)(uint64_t, id))(v26 + 16))(v26, v21);
}

BOOL sub_2B034(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_2B04C()
{
  Swift::UInt v1 = *v0;
  sub_372A8();
  sub_372B8(v1);
  return sub_372C8();
}

void sub_2B094()
{
  sub_372B8(*v0);
}

Swift::Int sub_2B0C0()
{
  Swift::UInt v1 = *v0;
  sub_372A8();
  sub_372B8(v1);
  return sub_372C8();
}

id sub_2B104()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  qword_49488 = (uint64_t)result;
  return result;
}

id sub_2B150(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47BF8, (void **)&qword_49488, (void **)&qword_49490);
}

id sub_2B17C()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.278431373 green:0.278431373 blue:0.28627451 alpha:1.0];
  qword_49498 = (uint64_t)result;
  return result;
}

uint64_t sub_2B1C8()
{
  sub_66B8(&qword_47D58);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_37F00;
  *(void *)(v0 + 32) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.0];
  *(void *)(v0 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:1.0];
  uint64_t result = sub_36EA8();
  qword_494A0 = v0;
  return result;
}

id sub_2B26C()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.309803922 green:0.988235294 blue:1.0 alpha:1.0];
  qword_494A8 = (uint64_t)result;
  return result;
}

id sub_2B2B8()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.337254902 green:0.792156863 blue:0.988235294 alpha:1.0];
  qword_494B0 = (uint64_t)result;
  return result;
}

id sub_2B308()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.0392156863 green:0.517647059 blue:1.0 alpha:1.0];
  qword_494B8 = (uint64_t)result;
  return result;
}

id sub_2B354(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C18, (void **)&qword_494A8, (void **)&qword_494C0);
}

id sub_2B380(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C28, (void **)&qword_494B8, (void **)&qword_494C8);
}

id sub_2B3AC(uint64_t a1)
{
  return sub_2B4C4(a1, &qword_47C30, (id *)&qword_494C0, &qword_494D0);
}

id sub_2B3D8(uint64_t a1)
{
  return sub_2B4C4(a1, &qword_47C38, (id *)&qword_494C8, &qword_494D8);
}

id sub_2B404()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.894117647 blue:0.17254902 alpha:1.0];
  qword_494E0 = (uint64_t)result;
  return result;
}

id sub_2B450()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.0 green:0.803921569 blue:1.0 alpha:1.0];
  qword_494E8 = (uint64_t)result;
  return result;
}

id sub_2B498(uint64_t a1)
{
  return sub_2B4C4(a1, &qword_47C58, (id *)&qword_494E8, &qword_494F0);
}

id sub_2B4C4(uint64_t a1, void *a2, id *a3, void *a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  id result = [*a3 colorWithAlphaComponent:0.5];
  *a4 = result;
  return result;
}

id sub_2B524()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:0.521568627 green:0.97254902 blue:0.992156863 alpha:1.0];
  qword_494F8 = (uint64_t)result;
  return result;
}

id sub_2B578()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.88627451 blue:0.356862745 alpha:1.0];
  qword_49500 = (uint64_t)result;
  return result;
}

id sub_2B5C4()
{
  id result = [self configurationWithPointSize:18.0];
  qword_49508 = (uint64_t)result;
  return result;
}

void sub_2B604(uint64_t a1)
{
}

void sub_2B61C(uint64_t a1)
{
}

void sub_2B62C(double a1, uint64_t a2, void *a3)
{
  uint64_t v5 = self;
  id v6 = CLKRoundedFontDesignName;
  id v7 = [v5 systemFontOfSize:v6 weight:a1 design:UIFontWeightSemibold];

  id v8 = [v7 CLKFontWithMonospacedNumbers];
  *a3 = v8;
}

void sub_2B6E0()
{
  uint64_t v0 = self;
  id v1 = CLKRoundedFontDesignName;
  id v2 = [v0 systemFontOfSize:v1 weight:11.0 design:UIFontWeightSemibold];

  qword_49520 = (uint64_t)v2;
}

id sub_2B768(uint64_t a1)
{
  return sub_2B78C(18.0, a1, &qword_49528);
}

id sub_2B778(uint64_t a1)
{
  return sub_2B78C(34.0, a1, &qword_49530);
}

id sub_2B78C(double a1, uint64_t a2, void *a3)
{
  id result = [self systemFontOfSize:a1 weight:UIFontWeightMedium];
  *a3 = result;
  return result;
}

id sub_2B7EC(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C48, (void **)&qword_494D8, (void **)&qword_49538);
}

id sub_2B818(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C40, (void **)&qword_494D0, (void **)&qword_49540);
}

id sub_2B844(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C38, (void **)&qword_494C8, (void **)&qword_49548);
}

id sub_2B870(uint64_t a1)
{
  return sub_2B89C(a1, &qword_47C30, (void **)&qword_494C0, (void **)&qword_49550);
}

id sub_2B89C(uint64_t a1, void *a2, void **a3, void **a4)
{
  if (*a2 != -1) {
    swift_once();
  }
  id v6 = *a3;
  *a4 = *a3;

  return v6;
}

uint64_t sub_2B8F4(uint64_t a1, char a2, char a3)
{
  uint64_t v6 = sub_36858();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    sub_66B8(&qword_47D58);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_37F00;
    if (qword_47BF8 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)qword_49488;
LABEL_9:
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v11;
    uint64_t v30 = v10;
    sub_36EA8();
    uint64_t v12 = v30;
    id v13 = v11;
LABEL_36:
    id v27 = v13;
    return v12;
  }
  if (a3)
  {
    sub_66B8(&qword_47D58);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_37F00;
    if (qword_47C00 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)qword_49490;
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v14 == enum case for WaterDepth.shallow(_:) || v14 == enum case for WaterDepth.nominal(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    goto LABEL_16;
  }
  if (v14 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_28:
    sub_66B8(&qword_47D58);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_381D0;
    if (qword_47C30 != -1) {
      swift_once();
    }
    id v21 = (void *)qword_494C0;
    *(void *)(v16 + 32) = qword_494C0;
    uint64_t v22 = qword_47C38;
    id v23 = v21;
    if (v22 != -1) {
      swift_once();
    }
    uint64_t v24 = (void *)qword_494C8;
    *(void *)(v16 + 40) = qword_494C8;
    uint64_t v25 = qword_47C50;
    id v26 = v24;
    if (v25 != -1) {
      swift_once();
    }
    id v13 = (id)qword_494E0;
    *(void *)(v16 + 48) = qword_494E0;
LABEL_35:
    uint64_t v30 = v16;
    sub_36EA8();
    uint64_t v12 = v30;
    goto LABEL_36;
  }
  if (v14 == enum case for WaterDepth.unknown(_:) || v14 == enum case for WaterDepth.notSubmerged(_:))
  {
LABEL_16:
    sub_66B8(&qword_47D58);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_37F00;
    if (qword_47C30 != -1) {
      swift_once();
    }
    uint64_t v17 = (void *)qword_494C0;
    *(void *)(v16 + 32) = qword_494C0;
    uint64_t v18 = qword_47C38;
    id v19 = v17;
    if (v18 != -1) {
      swift_once();
    }
    id v13 = (id)qword_494C8;
    *(void *)(v16 + 40) = qword_494C8;
    goto LABEL_35;
  }
  if (v14 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_28;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

uint64_t sub_2BD2C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_36858();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
LABEL_8:
    if (qword_47C10 != -1) {
      swift_once();
    }
    return swift_bridgeObjectRetain();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for WaterDepth.shallow(_:) || v8 == enum case for WaterDepth.nominal(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_8;
  }
  if (v8 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_18:
    sub_66B8(&qword_47D58);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_381D0;
    *(void *)(v12 + 32) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.0];
    *(void *)(v12 + 40) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.5];
    *(void *)(v12 + 48) = [objc_allocWithZone((Class)NSNumber) initWithDouble:0.75];
    uint64_t v14 = v12;
    sub_36EA8();
    return v14;
  }
  if (v8 == enum case for WaterDepth.unknown(_:) || v8 == enum case for WaterDepth.notSubmerged(_:)) {
    goto LABEL_8;
  }
  if (v8 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_18;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

id sub_2BF9C(uint64_t a1, char a2, char a3, char a4)
{
  uint64_t v8 = sub_66B8(&qword_48BF8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if (qword_47BF8 == -1)
    {
LABEL_3:
      uint64_t v11 = (void *)qword_49488;
LABEL_34:
      return v11;
    }
LABEL_40:
    swift_once();
    goto LABEL_3;
  }
  if (a4)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)qword_49490;
    goto LABEL_34;
  }
  int v12 = a2 & 1;
  uint64_t v13 = *(int *)(v8 + 48);
  uint64_t v14 = sub_36858();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v10, a1, v14);
  v10[v13] = v12;
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v10, v14);
  if (v16 == enum case for WaterDepth.shallow(_:))
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    goto LABEL_10;
  }
  if (v16 != enum case for WaterDepth.nominal(_:))
  {
    if (v16 == enum case for WaterDepth.depthExceedingNominalRange(_:))
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    }
    else
    {
      if (v16 == enum case for WaterDepth.unknown(_:))
      {
        if (!v12) {
          goto LABEL_11;
        }
        goto LABEL_28;
      }
      if (v16 == enum case for WaterDepth.notSubmerged(_:))
      {
LABEL_10:
        if (!v12)
        {
LABEL_11:
          if (qword_47C40 != -1) {
            swift_once();
          }
          uint64_t v11 = (void *)qword_494D0;
          goto LABEL_34;
        }
LABEL_28:
        if (qword_47C48 != -1) {
          swift_once();
        }
        uint64_t v11 = (void *)qword_494D8;
        goto LABEL_34;
      }
      if (v16 != enum case for WaterDepth.depthExceedingSensorLimit(_:))
      {
        sub_37258();
        __break(1u);
        goto LABEL_40;
      }
    }
    if (v12)
    {
      if (qword_47C50 != -1) {
        swift_once();
      }
      uint64_t v11 = (void *)qword_494E0;
      goto LABEL_34;
    }
LABEL_20:
    if (qword_47C30 != -1) {
      swift_once();
    }
    uint64_t v11 = (void *)qword_494C0;
    goto LABEL_34;
  }
  if (!v12)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    goto LABEL_20;
  }
  if (qword_47C38 != -1) {
    swift_once();
  }
  uint64_t v17 = *(void (**)(char *, uint64_t))(v15 + 8);
  id v18 = (id)qword_494C8;
  v17(v10, v14);
  return v18;
}

uint64_t sub_2C3A0(char a1, char a2)
{
  sub_66B8(&qword_47D58);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_37F00;
  if (a1)
  {
    if (qword_47BF8 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)qword_49488;
LABEL_9:
    *(void *)(v4 + 32) = v5;
    *(void *)(v4 + 40) = v5;
    sub_36EA8();
    id v6 = v5;
    goto LABEL_15;
  }
  if (a2)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    uint64_t v5 = (void *)qword_49490;
    goto LABEL_9;
  }
  if (qword_47CB8 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_49548;
  *(void *)(v4 + 32) = qword_49548;
  uint64_t v8 = qword_47CC0;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  id v6 = (id)qword_49550;
  *(void *)(v4 + 40) = qword_49550;
  sub_36EA8();
LABEL_15:
  id v10 = v6;
  return v4;
}

double sub_2C52C(char a1, double a2)
{
  if (a1)
  {
    if (a1 != 1) {
      return 25.0;
    }
    double v2 = a2 + -0.5 + a2 + -0.5;
    double v3 = sub_2C5FC(v2 * 60.0 + (1.0 - v2) * 44.0);
    double v4 = (1.0 - v2) * -24.0;
    double v5 = -10.0;
  }
  else
  {
    double v2 = a2 + a2;
    double v6 = 1.0 - (a2 + a2);
    double v3 = sub_2C5FC((a2 + a2) * -18.0 + v6 * -28.0);
    double v4 = v6 * 24.0;
    double v5 = 44.0;
  }
  double v7 = v2 * v5 + v4;
  double v8 = v3 * 0.5;
  sub_2C5FC(v7);
  return v8;
}

double sub_2C5FC(double a1)
{
  return round(a1);
}

uint64_t sub_2C604(uint64_t a1, char a2, char a3)
{
  uint64_t v6 = sub_36858();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_47BF8 != -1) {
      swift_once();
    }
    id v10 = &qword_49488;
    return *v10;
  }
  if (a3)
  {
    if (qword_47C00 != -1) {
      swift_once();
    }
    id v10 = &qword_49490;
    return *v10;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  int v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v11 == enum case for WaterDepth.shallow(_:)
    || v11 == enum case for WaterDepth.nominal(_:)
    || v11 == enum case for WaterDepth.depthExceedingNominalRange(_:))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
LABEL_27:
    if (qword_47C58 != -1) {
      swift_once();
    }
    id v10 = &qword_494E8;
    return *v10;
  }
  if (v11 == enum case for WaterDepth.unknown(_:) || v11 == enum case for WaterDepth.notSubmerged(_:))
  {
    if (qword_47C60 != -1) {
      swift_once();
    }
    id v10 = &qword_494F0;
    return *v10;
  }
  if (v11 == enum case for WaterDepth.depthExceedingSensorLimit(_:)) {
    goto LABEL_27;
  }
  uint64_t result = sub_37258();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ComplicationStyle()
{
  return &type metadata for ComplicationStyle;
}

unsigned char *initializeBufferWithCopyOfBuffer for ComplicationStyle.GaugePosition(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ComplicationStyle.GaugePosition(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ComplicationStyle.GaugePosition(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2C9FCLL);
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

uint64_t sub_2CA24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2CA2C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ComplicationStyle.GaugePosition()
{
  return &type metadata for ComplicationStyle.GaugePosition;
}

unint64_t sub_2CA4C()
{
  unint64_t result = qword_48C00;
  if (!qword_48C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48C00);
  }
  return result;
}

uint64_t sub_2CAA0(uint64_t a1)
{
  uint64_t v29 = a1;
  uint64_t v28 = sub_369D8();
  uint64_t v32 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  int v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36978();
  uint64_t v30 = *(void *)(v4 - 8);
  uint64_t v31 = v4;
  __chkstk_darwin(v4);
  unsigned int v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36BE8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_36928();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v27 = v1;
  sub_36CE8();
  sub_36BB8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_36938();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for DepthUnit.m(_:), v11);
  sub_2D940();
  sub_36E68();
  sub_36E68();
  uint64_t v19 = v33;
  uint64_t v18 = v34;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, v11);
  if (v18 == v19) {
    sub_36968();
  }
  else {
    sub_36958();
  }
  uint64_t v21 = v28;
  uint64_t v22 = *(void **)(v27
                 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_depthIntegerNumberFormatter);
  sub_369C8();
  Class isa = sub_36EE8().super.super.isa;
  id v24 = [v22 stringFromNumber:isa];

  if (v24)
  {
    uint64_t v25 = sub_36DD8();
  }
  else
  {
    uint64_t v25 = 16191;
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v3, v21);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
  v20(v17, v11);
  return v25;
}

uint64_t sub_2CE7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_36638();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  id v10 = (char *)&v24 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = sub_66B8(&qword_48D20);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v24 - v17;
  uint64_t v19 = v1
      + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter____lazy_storage___degreeSymbolStrippingSet;
  swift_beginAccess();
  sub_2D870(v19, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v18, 1, v3) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v18, v3);
  }
  sub_2D778((uint64_t)v18);
  sub_365E8();
  sub_365F8();
  sub_36608();
  uint64_t v25 = v16;
  uint64_t v20 = a1;
  uint64_t v21 = *(void (**)(char *, uint64_t))(v4 + 8);
  v21(v7, v3);
  v21(v10, v3);
  sub_36618();
  sub_36608();
  v21(v10, v3);
  v21(v12, v3);
  uint64_t v22 = (uint64_t)v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v25, v20, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v22, 0, 1, v3);
  swift_beginAccess();
  sub_2D8D8(v22, v19);
  return swift_endAccess();
}

id sub_2D164(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_36D38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v2
     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter____lazy_storage___degreeSymbolStrippingSet;
  uint64_t v9 = sub_36638();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings;
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  uint64_t v25 = a1;
  v11(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings, a1, v4);
  v11((uint64_t)v7, v10, v4);
  id v12 = objc_allocWithZone((Class)sub_36AF8());
  *(void *)(v2 + 16) = sub_36AA8();
  id v13 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_depthIntegerNumberFormatter) = v13;
  [v13 setMaximumFractionDigits:0];
  [v13 setMinimumFractionDigits:0];
  id v14 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
  uint64_t v15 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureFormatter;
  *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureFormatter) = v14;
  [v14 setUnitStyle:1];
  id result = [v14 numberFormatter];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v17 = result;
  [result setMaximumFractionDigits:0];

  id result = [*(id *)(v2 + v15) numberFormatter];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v18 = result;
  [result setMinimumFractionDigits:0];

  [*(id *)(v2 + v15) setUnitOptions:1];
  id v19 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
  uint64_t v20 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureUnitlessFormatter;
  *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureUnitlessFormatter) = v19;
  [v19 setUnitStyle:1];
  [v19 setUnitOptions:5];
  id result = [v19 numberFormatter];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v21 = result;
  [result setMaximumFractionDigits:0];

  id result = [*(id *)(v2 + v20) numberFormatter];
  if (result)
  {
    uint64_t v22 = result;
    [result setMinimumFractionDigits:0];

    id v23 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
    *(void *)(v2
              + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_compactDiveDurationFormatter) = v23;
    [v23 setAllowedUnits:192];
    [v23 setZeroFormattingBehavior:0x10000];
    [v23 setUnitsStyle:0];
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v4);
    return (id)v2;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_2D4F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_settings;
  uint64_t v2 = sub_36D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_depthIntegerNumberFormatter));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureFormatter));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_temperatureUnitlessFormatter));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_compactDiveDurationFormatter));
  sub_2D778(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter____lazy_storage___degreeSymbolStrippingSet);

  return swift_deallocClassInstance();
}

uint64_t sub_2D5E8()
{
  return type metadata accessor for ComplicationFormatter();
}

uint64_t type metadata accessor for ComplicationFormatter()
{
  uint64_t result = qword_48C60;
  if (!qword_48C60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2D63C()
{
  sub_36D38();
  if (v0 <= 0x3F)
  {
    sub_2D720();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2D720()
{
  if (!qword_48C70)
  {
    sub_36638();
    unint64_t v0 = sub_37028();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_48C70);
    }
  }
}

uint64_t sub_2D778(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_48D20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2D7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[3] = a3;
  v9[4] = a4;
  uint64_t v6 = sub_68CC(v9);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v6, a1, a3);
  uint64_t v7 = sub_36A98();
  sub_6930((uint64_t)v9);
  return v7;
}

uint64_t sub_2D870(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_48D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2D8D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_48D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_2D940()
{
  unint64_t result = qword_48D28;
  if (!qword_48D28)
  {
    sub_36928();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48D28);
  }
  return result;
}

_UNKNOWN **sub_2DA8C()
{
  return &off_41228;
}

id sub_2DB88()
{
  uint64_t v1 = sub_366B8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = enum case for WaterDepth.unknown(_:);
  uint64_t v9 = sub_36858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104))(v7, v8, v9);
  uint64_t v10 = &v7[*(int *)(type metadata accessor for LiveMetrics(0) + 20)];
  uint64_t v11 = enum case for UnderwaterTime.zero(_:);
  uint64_t v12 = sub_36C38();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  swift_storeEnumTagMultiPayload();
  sub_366A8();
  id v13 = (objc_class *)type metadata accessor for DepthTimelineEntryModel(0);
  id v14 = objc_allocWithZone(v13);
  (*(void (**)(unsigned char *, char *, uint64_t))(v2 + 16))(&v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate], v4, v1);
  v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_alwaysOn] = 0;
  sub_65F0((uint64_t)v7, (uint64_t)&v14[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics]);
  v18.receiver = v14;
  v18.super_class = v13;
  id v15 = objc_msgSendSuper2(&v18, "init");
  sub_AACC((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v16 = sub_E094((uint64_t)[v0 family]);

  return v16;
}

id sub_2DE3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DepthDataSource()
{
  return self;
}

uint64_t sub_2DE94()
{
  if (qword_47BE0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_49468;
  NSString v1 = sub_36DC8();
  NSString v2 = sub_36DC8();
  id v3 = [v0 localizedStringForKey:v1 value:0 table:v2];

  uint64_t v4 = sub_36DD8();
  return v4;
}

void sub_2DF80(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_366B8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DepthComplicationMetrics(0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = enum case for WaterDepth.unknown(_:);
  uint64_t v12 = sub_36858();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104))(v10, v11, v12);
  id v13 = &v10[*(int *)(type metadata accessor for LiveMetrics(0) + 20)];
  uint64_t v14 = enum case for UnderwaterTime.zero(_:);
  uint64_t v15 = sub_36C38();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  swift_storeEnumTagMultiPayload();
  sub_366A8();
  id v16 = (objc_class *)type metadata accessor for DepthTimelineEntryModel(0);
  uint64_t v17 = objc_allocWithZone(v16);
  (*(void (**)(unsigned char *, char *, uint64_t))(v5 + 16))(&v17[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_entryDate], v7, v4);
  v17[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_alwaysOn] = 0;
  sub_65F0((uint64_t)v10, (uint64_t)&v17[OBJC_IVAR____TtC32DepthComplicationBundleCompanion23DepthTimelineEntryModel_metrics]);
  v23.receiver = v17;
  v23.super_class = v16;
  id v18 = objc_msgSendSuper2(&v23, "init");
  sub_AACC((uint64_t)v10);
  id v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v7, v4);
  sub_366A8();
  id v20 = sub_E094((uint64_t)[a1 family]);
  Class isa = sub_36698().super.isa;
  id v22 = [self entryWithDate:isa complicationTemplate:v20];

  v19(v7, v4);
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v22);
}

id sub_2E270()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel;
  NSString v2 = *(void **)(v0
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UILabel) init];
    [v4 setFont:*(void *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont)];
    [v4 setNumberOfLines:1];
    [v4 setTextAlignment:1];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    NSString v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2E33C()
{
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel;
  NSString v2 = *(void **)(v0
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UILabel) init];
    [v4 setFont:*(void *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont)];
    [v4 setNumberOfLines:1];
    [v4 setTextAlignment:1];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    NSString v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_2E408(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel] = 0;
  *(void *)&v4[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel] = 0;
  uint64_t v9 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont;
  uint64_t v10 = qword_47C80;
  uint64_t v11 = v4;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_49510;
  *(void *)&v4[v9] = qword_49510;
  uint64_t v13 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont;
  uint64_t v14 = qword_47C90;
  id v15 = v12;
  if (v14 != -1) {
    swift_once();
  }
  id v16 = (void *)qword_49520;
  *(void *)&v11[v13] = qword_49520;
  uint64_t v17 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont;
  uint64_t v18 = qword_47C88;
  id v19 = v16;
  if (v18 != -1) {
    swift_once();
  }
  id v20 = (void *)qword_49518;
  *(void *)&v11[v17] = qword_49518;
  *(void *)&v11[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_activeConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v11[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_lineHeightConstraints] = &_swiftEmptyArrayStorage;
  id v21 = v20;

  v46.receiver = v11;
  v46.super_class = (Class)type metadata accessor for DepthRichCircularLabelView();
  id v22 = objc_msgSendSuper2(&v46, "initWithFrame:", a1, a2, a3, a4);
  id v23 = sub_2E270();
  [v22 addSubview:v23];

  id v24 = v22;
  id v25 = sub_2E33C();
  [v24 addSubview:v25];

  id v26 = self;
  sub_66B8(&qword_47D58);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_37EF0;
  id v28 = sub_2E270();
  id v29 = [v28 leadingAnchor];

  id v30 = [v24 leadingAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v27 + 32) = v31;
  id v32 = sub_2E270();
  id v33 = [v32 trailingAnchor];

  id v34 = [v24 trailingAnchor];
  id v35 = [v33 constraintEqualToAnchor:v34];

  *(void *)(v27 + 40) = v35;
  id v36 = sub_2E33C();
  id v37 = [v36 leadingAnchor];

  id v38 = [v24 leadingAnchor];
  id v39 = [v37 constraintEqualToAnchor:v38];

  *(void *)(v27 + 48) = v39;
  id v40 = sub_2E33C();
  id v41 = [v40 trailingAnchor];

  id v42 = [v24 trailingAnchor];
  id v43 = [v41 constraintEqualToAnchor:v42];

  *(void *)(v27 + 56) = v43;
  sub_36EA8();
  sub_2F880();
  Class isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  [v26 activateConstraints:isa];

  sub_2F2D4();
  sub_2EAEC(0, 0, 0, 1.0, 0.0);

  return v24;
}

void sub_2E874(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___depthLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView____lazy_storage___unitLabel] = 0;
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont;
  if (qword_47C80 != -1) {
    swift_once();
  }
  id v3 = (void *)qword_49510;
  *(void *)&v1[v2] = qword_49510;
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont;
  uint64_t v5 = qword_47C90;
  id v6 = v3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = (void *)qword_49520;
  *(void *)&v1[v4] = qword_49520;
  uint64_t v8 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont;
  uint64_t v9 = qword_47C88;
  id v10 = v7;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_49518;
  *(void *)&v1[v8] = qword_49518;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_activeConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_lineHeightConstraints] = &_swiftEmptyArrayStorage;
  id v12 = v11;

  sub_371D8();
  __break(1u);
}

void *sub_2EA00(char a1, char a2)
{
  if ((a2 & 1) == 0) {
    return &_swiftEmptyArrayStorage;
  }
  if (a1)
  {
    if (a1 == 1)
    {
      sub_66B8(&qword_47D58);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_38160;
      *(void *)(v2 + 32) = sub_2E270();
    }
    else
    {
      sub_66B8(&qword_47D58);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_37F00;
      *(void *)(v2 + 32) = sub_2E270();
      *(void *)(v2 + 40) = sub_2E33C();
    }
  }
  else
  {
    sub_66B8(&qword_47D58);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_38160;
    *(void *)(v2 + 32) = sub_2E33C();
  }
  sub_36EA8();
  return (void *)v2;
}

void sub_2EAEC(char a1, void *a2, char a3, double a4, double a5)
{
  id v6 = v5;
  id v11 = sub_2E270();
  id v12 = [v11 layer];

  [v12 setFilters:0];
  id v13 = sub_2E33C();
  id v14 = [v13 layer];

  [v14 setFilters:0];
  sub_2F530(a2, a4);
  id v15 = sub_2E270();
  [v15 setFont:*(void *)&v6[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont]];

  id v16 = sub_2E33C();
  [v16 setFont:*(void *)&v6[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont]];

  double v17 = sub_2C52C(a1, a5);
  double v19 = v18;
  id v20 = self;
  uint64_t v21 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_activeConstraints;
  sub_2F880();
  swift_bridgeObjectRetain();
  Class isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  id v68 = v20;
  [v20 deactivateConstraints:isa];

  if (a1)
  {
    if (a1 != 1)
    {
      sub_66B8(&qword_47D58);
      uint64_t v50 = swift_allocObject();
      *(_OWORD *)(v50 + 16) = xmmword_37F00;
      id v51 = sub_2E270();
      id v52 = [v51 firstBaselineAnchor];

      id v53 = [v6 topAnchor];
      id v54 = [v52 constraintEqualToAnchor:v53 constant:v17];

      *(void *)(v50 + 32) = v54;
      id v55 = sub_2E33C();
      id v56 = [v55 firstBaselineAnchor];

      id v57 = [v6 bottomAnchor];
      id v58 = [v56 constraintEqualToAnchor:v57 constant:v19];

      *(void *)(v50 + 40) = v58;
      sub_36EA8();
      *(void *)&v6[v21] = v50;
      swift_bridgeObjectRelease();
      id v59 = sub_2E270();
      uint64_t v60 = self;
      if (a3) {
        char v61 = &selRef_whiteColor;
      }
      else {
        char v61 = &selRef_blackColor;
      }
      id v62 = [v60 *v61];
      [v59 setTextColor:v62];

      id v63 = sub_2E33C();
      id v64 = [self *v61];
      [v63 setTextColor:v64];

      id v65 = sub_2E270();
      [v65 setFont:*(void *)&v6[OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont]];
      goto LABEL_22;
    }
    sub_66B8(&qword_47D58);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_37F00;
    id v24 = sub_2E270();
    id v25 = [v24 firstBaselineAnchor];

    id v26 = [v6 topAnchor];
    id v27 = [v25 constraintEqualToAnchor:v26 constant:v17];

    *(void *)(v23 + 32) = v27;
    id v28 = sub_2E33C();
    id v29 = [v28 firstBaselineAnchor];

    id v30 = [v6 bottomAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30 constant:v19];

    *(void *)(v23 + 40) = v31;
    sub_36EA8();
    *(void *)&v6[v21] = v23;
    swift_bridgeObjectRelease();
    id v32 = sub_2E270();
    id v33 = self;
    id v34 = &selRef_whiteColor;
    if ((a3 & 1) == 0) {
      id v34 = &selRef_blackColor;
    }
    id v35 = [v33 *v34];
    [v32 setTextColor:v35];

    id v36 = sub_2E33C();
    if (a3)
    {
      if (qword_47C00 != -1) {
        swift_once();
      }
      id v37 = (id)qword_49490;
    }
    else
    {
      id v37 = [self whiteColor];
    }
    id v65 = v37;
    [v36 setTextColor:v37];
  }
  else
  {
    sub_66B8(&qword_47D58);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_37F00;
    id v39 = sub_2E33C();
    id v40 = [v39 firstBaselineAnchor];

    id v41 = [v6 topAnchor];
    id v42 = [v40 constraintEqualToAnchor:v41 constant:v19];

    *(void *)(v38 + 32) = v42;
    id v43 = sub_2E270();
    id v44 = [v43 firstBaselineAnchor];

    id v45 = [v6 bottomAnchor];
    id v46 = [v44 constraintEqualToAnchor:v45 constant:v17];

    *(void *)(v38 + 40) = v46;
    sub_36EA8();
    *(void *)&v6[v21] = v38;
    swift_bridgeObjectRelease();
    id v47 = sub_2E270();
    if (a3)
    {
      if (qword_47C00 != -1) {
        swift_once();
      }
      id v48 = (id)qword_49490;
      uint64_t v49 = &selRef_whiteColor;
    }
    else
    {
      id v48 = [self whiteColor];
      uint64_t v49 = &selRef_blackColor;
    }
    [v47 setTextColor:v48];

    id v36 = sub_2E33C();
    id v65 = [self *v49];
    [v36 setTextColor:v65];
  }

LABEL_22:
  swift_bridgeObjectRetain();
  Class v66 = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  [v68 activateConstraints:v66];

  sub_2F2D4();
}

void sub_2F2D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_lineHeightConstraints;
  sub_2F880();
  swift_bridgeObjectRetain();
  Class isa = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  [v2 deactivateConstraints:isa];

  sub_66B8(&qword_47D58);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_37F00;
  id v6 = sub_2E270();
  id v7 = [v6 heightAnchor];

  id v8 = sub_2E270();
  id v9 = [v8 font];

  if (!v9)
  {
    __break(1u);
    goto LABEL_7;
  }
  [v9 lineHeight];
  double v11 = v10;

  id v12 = [v7 constraintEqualToConstant:v11];
  *(void *)(v5 + 32) = v12;
  id v13 = sub_2E33C();
  id v14 = [v13 heightAnchor];

  id v15 = sub_2E33C();
  id v16 = [v15 font];

  if (!v16)
  {
LABEL_7:
    __break(1u);
    return;
  }
  [v16 lineHeight];
  double v18 = v17;

  id v19 = [v14 constraintEqualToConstant:v18];
  *(void *)(v5 + 40) = v19;
  sub_36EA8();
  *(void *)(v1 + v3) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Class v20 = sub_36E88().super.isa;
  swift_bridgeObjectRelease();
  [v2 activateConstraints:v20];
}

void sub_2F530(void *a1, double a2)
{
  if (a1)
  {
    uint64_t v5 = self;
    id v6 = a1;
    id v7 = [v5 fontWithDescriptor:v6 size:a2 * 19.5];
    id v8 = [v7 CLKFontWithMonospacedNumbers];

    id v9 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont) = v8;

    id v10 = [v5 fontWithDescriptor:v6 size:a2 * 11.0];
    double v11 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont) = v10;

    id v12 = [v5 fontWithDescriptor:v6 size:a2 * 15.0];
    id v13 = [v12 CLKFontWithMonospacedNumbers];

    id v22 = *(id *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont) = v13;
  }
  else
  {
    if (qword_47C80 != -1) {
      swift_once();
    }
    id v14 = (void *)qword_49510;
    id v15 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_depthLabelFont) = qword_49510;
    id v16 = v14;

    if (qword_47C90 != -1) {
      swift_once();
    }
    double v17 = (void *)qword_49520;
    double v18 = *(void **)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_unitLabelFont) = qword_49520;
    id v19 = v17;

    if (qword_47C88 != -1) {
      swift_once();
    }
    Class v20 = (void *)qword_49518;
    id v22 = *(id *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont);
    *(void *)(v2 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion26DepthRichCircularLabelView_limitFont) = qword_49518;
    id v21 = v20;
  }
}

id sub_2F78C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthRichCircularLabelView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DepthRichCircularLabelView()
{
  return self;
}

unint64_t sub_2F880()
{
  unint64_t result = qword_48DB8;
  if (!qword_48DB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_48DB8);
  }
  return result;
}

char *sub_2F8C0()
{
  *(void *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_graphData] = 0;
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel;
  id v2 = objc_allocWithZone((Class)UILabel);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel;
  *(void *)&v3[v4] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v5 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer;
  *(void *)&v3[v5] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer;
  *(void *)&v3[v6] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v7 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer;
  *(void *)&v3[v7] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v8 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer;
  *(void *)&v3[v8] = [objc_allocWithZone((Class)CAShapeLayer) init];

  v27.receiver = v3;
  v27.super_class = (Class)type metadata accessor for DepthGraphView();
  id v9 = (char *)objc_msgSendSuper2(&v27, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_66B8(&qword_47D58);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_37F00;
  double v11 = *(void **)&v9[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel];
  *(void *)(inited + 32) = v11;
  id v12 = *(void **)&v9[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel];
  *(void *)(inited + 40) = v12;
  uint64_t v26 = inited;
  sub_36EA8();
  id v13 = self;
  id v14 = v9;
  id v15 = v11;
  id v16 = v12;
  if ((v26 & 0xC000000000000001) != 0) {
    id v17 = (id)sub_37128();
  }
  else {
    id v17 = *(id *)(v26 + 32);
  }
  double v18 = v17;
  if (qword_47C98 != -1) {
    swift_once();
  }
  id v19 = [(id)qword_49528 fontWithSize:12.0];
  [v18 setFont:v19];

  id v20 = [v13 grayColor];
  [v18 setTextColor:v20];

  [v14 addSubview:v18];
  if ((v26 & 0xC000000000000001) != 0) {
    id v21 = (id)sub_37128();
  }
  else {
    id v21 = *(id *)(v26 + 40);
  }
  id v22 = v21;
  if (qword_47C98 != -1) {
    swift_once();
  }
  id v23 = [(id)qword_49528 fontWithSize:12.0];
  [v22 setFont:v23];

  id v24 = [v13 grayColor];
  [v22 setTextColor:v24];

  [v14 addSubview:v22];
  swift_bridgeObjectRelease();

  [v14 setSemanticContentAttribute:3];
  return v14;
}

void sub_2FC80(double a1)
{
  uint64_t v3 = qword_47BD0;
  id v4 = *(id *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel);
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void **)(*(void *)(qword_49428
                            + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_compactDiveDurationFormatter);
  swift_retain();
  id v6 = [v5 stringFromTimeInterval:0.0];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_36DD8();
    swift_release();
  }
  else
  {
    swift_release();
  }
  NSString v8 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v4 setText:v8];

  id v9 = *(void **)(*(void *)(qword_49428
                            + OBJC_IVAR____TtC32DepthComplicationBundleCompanion20TimelineDataProvider_formatter)
                + OBJC_IVAR____TtC32DepthComplicationBundleCompanion21ComplicationFormatter_compactDiveDurationFormatter);
  id v10 = *(id *)(v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel);
  swift_retain();
  id v11 = [v9 stringFromTimeInterval:a1];
  if (v11)
  {
    id v12 = v11;
    sub_36DD8();
    swift_release();
  }
  else
  {
    swift_release();
  }
  NSString v13 = sub_36DC8();
  swift_bridgeObjectRelease();
  [v10 setText:v13];
}

void sub_2FE80()
{
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for DepthGraphView();
  objc_msgSendSuper2(&v18, "layoutSubviews");
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel;
  [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel] intrinsicContentSize];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel;
  [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel] intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  [v0 bounds];
  double MaxY = CGRectGetMaxY(v19);
  [*(id *)&v0[v1] _firstBaselineOffsetFromTop];
  double v13 = MaxY - v12;
  [v0 bounds];
  double v14 = CGRectGetMaxY(v20);
  [*(id *)&v0[v6] _firstBaselineOffsetFromTop];
  double v16 = v14 - v15;
  [v0 bounds];
  CGFloat v17 = CGRectGetMaxX(v21) - v8 + -5.0;
  objc_msgSend(*(id *)&v0[v1], "setFrame:", 5.0, v13, v3, v5);
  objc_msgSend(*(id *)&v0[v6], "setFrame:", v17, v16, v8, v10);
  sub_3001C();
}

void sub_3001C()
{
  uint64_t v1 = v0;
  uint64_t v270 = sub_36718();
  uint64_t v251 = *(void *)(v270 - 8);
  uint64_t v2 = __chkstk_darwin(v270);
  v281 = (char *)&v247 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v280 = (char *)&v247 - v5;
  __chkstk_darwin(v4);
  v288 = (char *)&v247 - v6;
  v277 = (int *)sub_66B8(&qword_48E20);
  uint64_t v256 = *((void *)v277 - 1);
  __chkstk_darwin(v277);
  v276 = (CGFloat *)((char *)&v247 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_66B8(&qword_48E28);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  CGMutablePathRef v293 = (CGMutablePathRef)((char *)&v247 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  CGMutablePathRef v292 = (CGMutablePathRef)((char *)&v247 - v11);
  uint64_t v12 = sub_66B8(&qword_48E30);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  v296 = (char *)&v247 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v252 = (char *)&v247 - v15;
  v301 = (void *)sub_368D8();
  CGMutablePathRef v278 = (CGMutablePathRef)*(v301 - 1);
  uint64_t v16 = __chkstk_darwin(v301);
  v298 = (char *)&v247 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v295 = (uint64_t)&v247 - v18;
  uint64_t v273 = sub_36928();
  v275 = *(char ****)(v273 - 8);
  __chkstk_darwin(v273);
  v269 = (void (**)(char *, char **, char **))((char *)&v247 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v271 = sub_369D8();
  uint64_t v261 = *(void *)(v271 - 8);
  uint64_t v20 = __chkstk_darwin(v271);
  v255 = (char *)&v247 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  v254 = (char *)&v247 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v253 = (char *)&v247 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v282 = (char *)&v247 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v283 = (char *)&v247 - v29;
  __chkstk_darwin(v28);
  v300 = (char **)((char *)&v247 - v30);
  uint64_t v297 = sub_368B8();
  v285 = *(char **)(v297 - 8);
  uint64_t v31 = __chkstk_darwin(v297);
  v274 = (char *)&v247 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  v299 = (char *)&v247 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v284 = (char *)&v247 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v294 = (char *)&v247 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  *(void *)&long long v286 = (char *)&v247 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v272 = (char *)&v247 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v262 = (char *)&v247 - v44;
  __chkstk_darwin(v43);
  v266 = (char *)&v247 - v45;
  id v46 = (CGFloat *)OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer;
  [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer] removeFromSuperlayer];
  id v47 = *(void **)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer];
  uint64_t v48 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer;
  uint64_t v263 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer;
  [v47 removeFromSuperlayer];
  uint64_t v265 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer;
  [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer] removeFromSuperlayer];
  uint64_t v264 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer;
  [*(id *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer] removeFromSuperlayer];
  id v49 = [objc_allocWithZone((Class)CAShapeLayer) init];
  id v50 = [objc_allocWithZone((Class)CAShapeLayer) init];
  id v51 = [objc_allocWithZone((Class)CAShapeLayer) init];
  p_b = (CGFloat *)[objc_allocWithZone((Class)CAShapeLayer) init];
  id v52 = *(void **)((char *)v46 + (void)v1);
  id v53 = v49;
  id v54 = [v52 filters];
  [v53 setFilters:v54];

  id v55 = *(void **)&v1[v48];
  id v56 = v50;
  id v57 = [v55 filters];
  [v56 setFilters:v57];

  uint64_t v58 = v265;
  id v59 = *(void **)&v1[v265];
  id v60 = v51;
  id v61 = [v59 filters];
  [v60 setFilters:v61];

  uint64_t v62 = v264;
  id v63 = *(void **)&v1[v264];
  id v64 = p_b;
  id v65 = [v63 filters];
  [(CGFloat *)v64 setFilters:v65];

  Class v66 = *(void **)((char *)v46 + (void)v1);
  *(void *)((char *)v46 + (void)v1) = v53;
  id v260 = v53;

  unint64_t v67 = v263;
  id v68 = *(void **)&v1[v263];
  *(void *)&v1[v263] = v56;
  id v259 = v56;

  id v69 = *(void **)&v1[v58];
  *(void *)&v1[v58] = v60;
  uint64_t v70 = v58;
  id v71 = v60;

  Swift::String v72 = *(void **)&v1[v62];
  *(void *)&v1[v62] = v64;
  uint64_t v73 = v62;
  unint64_t v74 = v64;

  p_b = v46;
  id v75 = *(id *)((char *)v46 + (void)v1);
  uint64_t v76 = &selRef_resumeLiveFullColorImageView;
  [v1 bounds];
  unint64_t v77 = (int *)&selRef_resumeLiveFullColorImageView;
  objc_msgSend(v75, "setFrame:");

  id v78 = *(id *)&v1[v67];
  [v1 bounds];
  objc_msgSend(v78, "setFrame:");

  id v79 = *(id *)&v1[v70];
  [v1 bounds];
  objc_msgSend(v79, "setFrame:");

  CGMutablePathRef v80 = (CGMutablePathRef)*(id *)&v1[v73];
  [v1 bounds];
  -[CGPath setFrame:](v80, "setFrame:");

  [v1 bounds];
  double v82 = v81 + -1.0;
  CGMutablePathRef Mutable = CGPathCreateMutable();
  if (v82 * 0.25 == 0.0)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  v257 = v74;
  id v258 = v71;
  unint64_t v77 = v1;
  sub_333C4(v77, 0.0, v82, v82 * 0.25, 0.5);
  uint64_t v84 = v83;
  v267 = v77;

  uint64_t v85 = *(void *)(v84 + 16);
  if (v85)
  {
    *(void *)&v313.CGFloat a = _swiftEmptyArrayStorage;
    sub_37188();
    unint64_t v77 = (int *)(v84 + 56);
    uint64_t v76 = v300;
    do
    {
      unint64_t v67 = (unint64_t)CGPathCreateWithRect(*(CGRect *)(v77 - 6), 0);
      sub_37168();
      sub_37198();
      sub_371A8();
      sub_37178();
      v77 += 8;
      --v85;
    }
    while (v85);
    CGFloat a = v313.a;
    swift_bridgeObjectRelease();
    if (!(*(void *)&a >> 62))
    {
LABEL_6:
      uint64_t v87 = *(void *)((char *)&dword_10 + (*(void *)&a & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      CGMutablePathRef v80 = Mutable;
      if (!v87) {
        goto LABEL_17;
      }
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    CGFloat a = COERCE_DOUBLE(_swiftEmptyArrayStorage);
    uint64_t v76 = v300;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v87 = sub_371E8();
  CGMutablePathRef v80 = Mutable;
  if (!v87) {
    goto LABEL_17;
  }
LABEL_7:
  v313.CGFloat a = 1.0;
  v313.b = 0.0;
  v313.c = 0.0;
  v313.d = 1.0;
  v313.CGFloat tx = 0.0;
  v313.tdouble y = 0.0;
  if (v87 < 1)
  {
LABEL_74:
    __break(1u);
LABEL_75:
    swift_once();
    goto LABEL_71;
  }
  if ((*(void *)&a & 0xC000000000000001) != 0)
  {
    uint64_t v88 = 0;
    CGMutablePathRef v80 = Mutable;
    do
    {
      id v89 = (const CGPath *)sub_37128();
      ++v88;
      sub_36F68(v89, &v313);
      swift_unknownObjectRelease();
    }
    while (v87 != v88);
  }
  else
  {
    uint64_t v90 = (void **)(*(void *)&a + 32);
    CGMutablePathRef v80 = Mutable;
    do
    {
      os_log_type_t v91 = *v90++;
      v92 = v91;
      sub_36F68(v92, &v313);

      --v87;
    }
    while (v87);
  }
LABEL_17:
  swift_bridgeObjectRelease_n();
  uint64_t v93 = p_b;
  [*(id *)((char *)p_b + (void)v1) setPath:v80];
  unint64_t v94 = *(void **)((char *)v93 + (void)v1);
  uint64_t v95 = self;
  id v96 = v94;
  id v97 = [v95 grayColor];
  id v98 = [v97 colorWithAlphaComponent:0.5];

  id v99 = [v98 CGColor];
  [v96 setFillColor:v99];

  os_log_type_t v100 = v267;
  id v101 = [v267 layer];
  [v101 addSublayer:*(void *)((char *)v93 + (void)v1)];

  uint64_t v102 = *(void *)((char *)v100 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_graphData);
  if (!v102)
  {

    return;
  }
  v247 = (CGPath *)v95;
  v248 = v1;
  unint64_t v103 = *(void **)((char *)v100 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel);
  *(void *)&long long v279 = v102;
  swift_bridgeObjectRetain();
  [v103 bounds];
  double v105 = v104;
  uint64_t v106 = enum case for DepthUnit.m(_:);
  uint64_t v107 = v275 + 13;
  v108 = v275[13];
  uint64_t v109 = v269;
  uint64_t v110 = v273;
  ((void (*)(void, void, uint64_t))v108)(v269, enum case for DepthUnit.m(_:), v273);
  sub_369B8();
  unsigned int v250 = v106;
  v275 = v107;
  v249 = v108;
  ((void (*)(void, uint64_t, uint64_t))v108)(v109, v106, v110);
  sub_369B8();
  uint64_t v111 = v266;
  sub_36888();
  uint64_t v112 = *(CGFloat **)(v279 + 16);
  p_b = v112;
  if (v112)
  {
    v289 = (char *)*((void *)v278 + 2);
    uint64_t v113 = v279 + ((*((unsigned __int8 *)v278 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v278 + 80));
    v287 = (void (**)(char *, uint64_t))*((void *)v278 + 9);
    p_CGFloat tx = (CGFloat *)((char *)v278 + 16);
    v114 = (void (**)(uint64_t, uint64_t))((char *)v278 + 8);
    uint64_t v115 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v285 + 48);
    uint64_t v116 = (void (**)(char *, uint64_t, uint64_t))(v285 + 32);
    swift_bridgeObjectRetain();
    uint64_t v117 = _swiftEmptyArrayStorage;
    uint64_t v118 = v297;
    uint64_t v119 = (uint64_t)v252;
    do
    {
      uint64_t v120 = v295;
      uint64_t v70 = (uint64_t)v301;
      ((void (*)(uint64_t, uint64_t, void *))v289)(v295, v113, v301);
      sub_368C8();
      (*v114)(v120, v70);
      if ((*v115)(v119, 1, v118) == 1)
      {
        sub_3362C(v119);
      }
      else
      {
        uint64_t v121 = v118;
        uint64_t v122 = *v116;
        uint64_t v123 = v286;
        (*v116)((char *)v286, v119, v121);
        v122(v294, v123, v121);
        if (swift_isUniquelyReferenced_nonNull_native()) {
          unint64_t v124 = (unint64_t)v117;
        }
        else {
          unint64_t v124 = sub_32658(0, v117[2] + 1, 1, (unint64_t)v117);
        }
        uint64_t v70 = *(void *)(v124 + 16);
        unint64_t v125 = *(void *)(v124 + 24);
        if (v70 >= v125 >> 1) {
          unint64_t v124 = sub_32658(v125 > 1, v70 + 1, 1, v124);
        }
        *(void *)(v124 + 16) = v70 + 1;
        uint64_t v117 = (void *)v124;
        uint64_t v126 = v297;
        v122((char *)(v124+ ((v285[80] + 32) & ~(unint64_t)v285[80])+ *((void *)v285 + 9) * v70), (uint64_t)v294, v297);
        uint64_t v118 = v126;
      }
      v113 += (uint64_t)v287;
      uint64_t v112 = (CGFloat *)((char *)v112 - 1);
    }
    while (v112);
    swift_bridgeObjectRelease();
    uint64_t v111 = v266;
    v127 = v117;
  }
  else
  {
    v127 = _swiftEmptyArrayStorage;
    uint64_t v118 = v297;
  }
  uint64_t v128 = v285;
  v129 = v285 + 16;
  uint64_t v130 = (void (*)(char *, char *, uint64_t))*((void *)v285 + 2);
  uint64_t v131 = v272;
  v130(v272, v111, v118);
  uint64_t v132 = v127[2];
  if (v132)
  {
    unint64_t v133 = (v128[80] + 32) & ~(unint64_t)v128[80];
    uint64_t v295 = (uint64_t)v130;
    uint64_t v134 = (char *)v127 + v133;
    p_CGFloat tx = (CGFloat *)*((void *)v128 + 9);
    v289 = (char *)(v261 + 16);
    v135 = (void (**)(char *, uint64_t))(v261 + 8);
    v287 = (void (**)(char *, uint64_t))(v128 + 8);
    *(void *)&long long v286 = v127;
    swift_bridgeObjectRetain();
    v294 = v129;
    uint64_t v136 = v118;
    uint64_t v137 = v271;
    v138 = v255;
    uint64_t v139 = v254;
    uint64_t v70 = (uint64_t)v253;
    uint64_t v140 = v299;
    do
    {
      ((void (*)(char *, char *, uint64_t))v295)(v140, v134, v136);
      sub_36868();
      sub_36868();
      sub_3368C();
      if (sub_36DA8()) {
        v141 = v138;
      }
      else {
        v141 = v139;
      }
      (*(void (**)(uint64_t, char *, uint64_t))v289)(v70, v141, v137);
      uint64_t v142 = *v135;
      (*v135)(v138, v137);
      v142(v139, v137);
      sub_36878();
      uint64_t v140 = v299;
      (*v287)(v299, v136);
      uint64_t v134 = (char *)p_tx + (void)v134;
      --v132;
    }
    while (v132);
    swift_bridgeObjectRelease();
    uint64_t v118 = v136;
    uint64_t v128 = v285;
    uint64_t v130 = (void (*)(char *, char *, uint64_t))v295;
  }
  uint64_t v143 = (char *)*((void *)v128 + 4);
  CGMutablePathRef v80 = (CGMutablePathRef)(v128 + 32);
  uint64_t v144 = v262;
  v272 = v143;
  ((void (*)(char *, char *, uint64_t))v143)(v262, v131, v118);
  swift_bridgeObjectRelease();
  [v267 bounds];
  double v146 = v145 - v105;
  v130(v284, v144, v118);
  ((void (*)(void, void, uint64_t))v249)(v269, v250, v273);
  sub_369B8();
  unint64_t v67 = 0;
  uint64_t v273 = (uint64_t)v278 + 16;
  uint64_t v147 = (void (**)(char *, char *, void *))((char *)v278 + 32);
  p_CGFloat tx = (CGFloat *)(v256 + 56);
  v289 = (char *)(v256 + 48);
  v287 = (void (**)(char *, uint64_t))((char *)v80 + 16);
  v299 = (char *)(v261 + 8);
  v269 = (void (**)(char *, char **, char **))(v261 + 32);
  double v148 = v146 + -5.0;
  v285 = (char *)v80;
  v275 = (char ***)((char *)v80 - 24);
  *(void *)&long long v286 = (char *)v278 + 8;
  v149 = (char *)_swiftEmptyArrayStorage;
  uint64_t v295 = -1;
  uint64_t v76 = (char **)v271;
  unint64_t v77 = v277;
  while (1)
  {
    uint64_t v150 = v293;
    uint64_t v151 = (uint64_t)v296;
    if ((CGFloat *)v67 == p_b)
    {
      uint64_t v152 = 1;
      unint64_t v67 = (unint64_t)p_b;
    }
    else
    {
      if (v67 >= *(void *)(v279 + 16))
      {
        __break(1u);
        goto LABEL_73;
      }
      CGMutablePathRef v153 = v278;
      uint64_t v154 = (char *)v276 + v77[12];
      uint64_t v155 = v301;
      (*((void (**)(char *, unint64_t, void *))v278 + 2))(v154, v279+ ((*((unsigned __int8 *)v153 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v153 + 80))+ *((void *)v153 + 9) * v67, v301);
      uint64_t v156 = (char *)v150 + v77[12];
      *uint64_t v150 = v67;
      (*((void (**)(char *, char *, void *))v153 + 4))(v156, v154, v155);
      uint64_t v152 = 0;
      ++v67;
      uint64_t v151 = (uint64_t)v296;
    }
    (*(void (**)(void *, uint64_t, uint64_t, int *))p_tx)(v150, v152, 1, v77);
    CGMutablePathRef v157 = v292;
    sub_336E4((uint64_t)v150, (uint64_t)v292);
    if ((*(unsigned int (**)(CGMutablePathRef, uint64_t, int *))v289)(v157, 1, v77) == 1) {
      break;
    }
    uint64_t v70 = *(void *)v157;
    (*v147)(v298, (char *)v157 + v77[12], v301);
    sub_368C8();
    uint64_t v158 = v297;
    int v159 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))*v287)(v151, 1, v297);
    if (v159 == 1)
    {
      sub_3362C(v151);
      double v170 = 0.0;
      double v175 = 0.0;
    }
    else
    {
      v294 = v149;
      v160 = v274;
      ((void (*)(char *, uint64_t, uint64_t))v272)(v274, v151, v158);
      v161 = v300;
      sub_36868();
      sub_3368C();
      char v162 = sub_36D98();
      v163 = *(void (**)(char *, char **))v299;
      (*(void (**)(char **, char **))v299)(v161, v76);
      if ((v162 & 1) == 0)
      {
        sub_36868();
        v164 = v282;
        v163(v282, v76);
        (*v269)(v164, v161, v76);
        uint64_t v295 = v70;
      }
      sub_36898();
      sub_36988();
      double v166 = v165;
      v167 = v283;
      sub_368A8();
      sub_36988();
      double v169 = v168;
      v163(v167, v76);
      double v170 = v148 * (v166 / v169) + 5.0;
      v163((char *)v300, v76);
      sub_36868();
      sub_36988();
      double v172 = v171;
      sub_368A8();
      sub_36988();
      double v174 = v173;
      v163(v167, v76);
      double v175 = v148 * (v172 / v174) + 5.0;
      v163((char *)v300, v76);
      ((void (*)(char *, uint64_t))*v275)(v160, v297);
      unint64_t v77 = v277;
      v149 = v294;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v149 = sub_32548(0, *((void *)v149 + 2) + 1, 1, v149);
    }
    unint64_t v177 = *((void *)v149 + 2);
    unint64_t v176 = *((void *)v149 + 3);
    CGMutablePathRef v80 = (CGMutablePathRef)(v177 + 1);
    if (v177 >= v176 >> 1) {
      v149 = sub_32548((char *)(v176 > 1), v177 + 1, 1, v149);
    }
    *((void *)v149 + 2) = v80;
    v178 = &v149[32 * v177];
    *((double *)v178 + 4) = (double)v70 * 4.5 + 3.5;
    *((double *)v178 + 5) = v170;
    *((double *)v178 + 6) = v175;
    v178[56] = v159 != 1;
    (*(void (**)(char *, void *))v286)(v298, v301);
  }
  swift_bridgeObjectRelease();
  CGMutablePathRef v292 = CGPathCreateMutable();
  CGMutablePathRef v293 = CGPathCreateMutable();
  CGMutablePathRef v278 = CGPathCreateMutable();
  v294 = v149;
  v180 = (char *)*((void *)v149 + 2);
  uint64_t v181 = v270;
  v182 = v288;
  if (v180)
  {
    v301 = (void *)(v251 + 8);
    p_b = &v308.b;
    p_CGFloat tx = &v308.tx;
    v289 = &v310;
    v287 = (void (**)(char *, uint64_t))&v312;
    v277 = (int *)&v307.b;
    v276 = &v307.tx;
    v183 = (double *)(v294 + 56);
    *(void *)&long long v179 = 136315138;
    long long v286 = v179;
    v285 = (char *)&type metadata for Any + 8;
    *(void *)&long long v179 = 134217984;
    long long v279 = v179;
    do
    {
      v298 = v180;
      uint64_t v197 = v181;
      double v198 = *(v183 - 3);
      uint64_t v199 = *((void *)v183 - 2);
      v200 = (char *)*((void *)v183 - 1);
      char v201 = *(unsigned char *)v183;
      sub_368F8();
      v202 = sub_36708();
      os_log_type_t v203 = sub_36F48();
      BOOL v204 = os_log_type_enabled(v202, v203);
      v296 = v200;
      if (v204)
      {
        uint64_t v205 = swift_slowAlloc();
        uint64_t v306 = swift_slowAlloc();
        *(_DWORD *)uint64_t v205 = v286;
        double v302 = v198;
        uint64_t v303 = v199;
        v304 = v200;
        char v305 = v201;
        uint64_t v206 = sub_36E08();
        *(void *)(v205 + 4) = sub_328C0(v206, v207, &v306);
        uint64_t v181 = v270;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v202, v203, "Drawing bar %s", (uint8_t *)v205, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v208 = (void (*)(char *, uint64_t))*v301;
        ((void (*)(char *, uint64_t))*v301)(v288, v181);
      }
      else
      {

        v208 = (void (*)(char *, uint64_t))*v301;
        uint64_t v181 = v197;
        ((void (*)(char *, uint64_t))*v301)(v182, v197);
      }
      double v209 = v198;
      if (v201)
      {
        sub_368F8();
        v210 = sub_36708();
        os_log_type_t v211 = sub_36F48();
        if (os_log_type_enabled(v210, v211))
        {
          uint64_t v212 = swift_slowAlloc();
          *(_DWORD *)uint64_t v212 = v279;
          *(double *)(v212 + 4) = v198;
          _os_log_impl(&dword_0, v210, v211, "DepthGraphView: range: %f", (uint8_t *)v212, 0xCu);
          swift_slowDealloc();
        }
        CGFloat v213 = *(double *)&v296;

        v208(v281, v181);
        v214 = v289;
        *(void *)v289 = 0;
        *((void *)v214 + 1) = 0;
        uint64_t v309 = 0x3FF0000000000000;
        uint64_t v311 = 0x3FF0000000000000;
        v215 = v287;
        *v287 = 0;
        v215[1] = 0;
        sub_36F78();
        sub_36F88();
        v182 = v288;
        uint64_t v196 = v295;
        if (v295) {
          goto LABEL_59;
        }
        v315.origin.x = v209 + -2.75;
        v315.size.double width = 5.5;
        v315.size.double height = 5.5;
        v315.origin.double y = v213;
        v193 = CGPathCreateWithEllipseInRect(v315, 0);
        v216 = v277;
        *(void *)v277 = 0;
        *((void *)v216 + 1) = 0;
        v307.CGFloat a = 1.0;
        v307.d = 1.0;
        v217 = v276;
        CGFloat *v276 = 0.0;
        v217[1] = 0.0;
        sub_36F68(v193, &v307);
      }
      else
      {
        sub_368F8();
        v218 = sub_36708();
        os_log_type_t v219 = sub_36F48();
        if (os_log_type_enabled(v218, v219))
        {
          uint64_t v220 = swift_slowAlloc();
          *(_DWORD *)uint64_t v220 = v279;
          *(double *)(v220 + 4) = v198;
          _os_log_impl(&dword_0, v218, v219, "DepthGraphView: dotRect: %f", (uint8_t *)v220, 0xCu);
          swift_slowDealloc();
        }

        v208(v280, v181);
        v184 = v300;
        sub_369A8();
        sub_36988();
        double v186 = v185;
        v187 = v283;
        sub_368A8();
        sub_36988();
        double v189 = v188;
        v190 = *(void (**)(char *, char **))v299;
        v191 = v187;
        uint64_t v192 = v271;
        (*(void (**)(char *, uint64_t))v299)(v191, v271);
        v190((char *)v184, (char **)v192);
        v314.size.double width = 1.25;
        v314.size.double height = 1.25;
        v314.origin.x = v209 + -1.25;
        v314.origin.double y = v148 * (v186 / v189) + 5.0;
        v193 = CGPathCreateWithEllipseInRect(v314, 0);
        v194 = p_b;
        CGFloat *p_b = 0.0;
        v194[1] = 0.0;
        v308.CGFloat a = 1.0;
        v308.d = 1.0;
        v195 = p_tx;
        *p_CGFloat tx = 0.0;
        v195[1] = 0.0;
        sub_36F68(v193, &v308);
        v182 = v288;
        uint64_t v196 = v295;
      }

LABEL_59:
      v183 += 4;
      uint64_t v295 = v196 - 1;
      v180 = v298 - 1;
    }
    while (v298 != (unsigned char *)&dword_0 + 1);
  }
  swift_bridgeObjectRelease();
  v300 = *v275;
  ((void (*)(char *, uint64_t))v300)(v284, v297);
  CGMutablePathRef v80 = v247;
  v221 = [(CGPath *)v247 grayColor];
  uint64_t v70 = (uint64_t)v248;
  uint64_t v222 = v263;
  id v223 = *(id *)&v248[v263];
  unint64_t v67 = (unint64_t)&selRef_resumeLiveFullColorImageView;
  v301 = v221;
  id v224 = [v221 CGColor];
  [v223 setFillColor:v224];

  id v225 = *(id *)(v70 + v222);
  id v226 = [v225 fillColor];
  [v225 setStrokeColor:v226];

  uint64_t v76 = &selRef_resumeLiveFullColorImageView;
  [*(id *)(v70 + v222) setPath:v293];
  unint64_t v77 = v267;
  id v227 = [v267 layer];
  [v227 addSublayer:*(void *)(v70 + v222)];

  if (qword_47C68 != -1) {
    goto LABEL_75;
  }
LABEL_71:
  v228 = (void *)qword_494F8;
  uint64_t v229 = v264;
  id v230 = *(id *)(v70 + v264);
  id v231 = [v228 *(SEL *)(v67 + 752)];
  [v230 setFillColor:v231];

  id v232 = *(id *)(v70 + v229);
  id v233 = [v228 *(SEL *)(v67 + 752)];
  [v232 setStrokeColor:v233];

  [*(id *)(v70 + v229) setLineCap:kCALineCapRound];
  [*(id *)(v70 + v229) setLineWidth:2.5];
  v234 = v76[99];
  CGMutablePathRef v235 = v292;
  objc_msgSend(*(id *)(v70 + v229), v234, v292);
  id v236 = [v77 layer];
  [v236 addSublayer:*(void *)(v70 + v229)];

  uint64_t v237 = v265;
  id v238 = *(id *)(v70 + v265);
  id v239 = [(CGPath *)v80 whiteColor];
  id v240 = [v239 *(SEL *)(v67 + 752)];

  [v238 setFillColor:v240];
  id v241 = *(id *)(v70 + v237);
  id v242 = [v241 fillColor];
  [v241 setStrokeColor:v242];

  CGMutablePathRef v243 = v278;
  [*(id *)(v70 + v237) setPath:v278];
  id v244 = [v77 layer];
  [v244 addSublayer:*(void *)(v70 + v237)];

  (*(void (**)(char *, uint64_t))v299)(v282, v271);
  uint64_t v245 = v297;
  v246 = v300;
  ((void (*)(char *, uint64_t))v300)(v262, v297);
  ((void (*)(char *, uint64_t))v246)(v266, v245);
}

uint64_t sub_3223C()
{
  sub_66B8(&qword_47D58);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_37EF0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel);
  id v5 = v2;
  id v6 = v3;
  *(void *)(v1 + 48) = [v4 layer];
  *(void *)(v1 + 56) = [*(id *)(v0+ OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel) layer];
  sub_36EA8();
  return v1;
}

uint64_t sub_3230C()
{
  sub_66B8(&qword_47D58);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_38160;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer);
  *(void *)(v1 + 32) = v2;
  uint64_t v7 = v1;
  sub_36EA8();
  id v3 = v2;
  unint64_t v4 = sub_3223C();
  sub_15188(v4);
  id v5 = *(id *)(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer);
  swift_bridgeObjectRetain();
  sub_36E78();
  if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v7 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_36EB8();
  sub_36EC8();
  sub_36EA8();
  swift_bridgeObjectRelease();

  return v7;
}

id sub_32454()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DepthGraphView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DepthGraphView()
{
  return self;
}

char *sub_32548(char *result, int64_t a2, char a3, char *a4)
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
      sub_66B8(&qword_48E40);
      uint64_t v10 = (char *)swift_allocObject();
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
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_338A8(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_32658(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_66B8(&qword_48E38);
  uint64_t v10 = *(void *)(sub_368B8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_371C8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_368B8() - 8);
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
    sub_3374C(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_328C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_32994(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_33994((uint64_t)v12, *a3);
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
      sub_33994((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6930((uint64_t)v12);
  return v7;
}

uint64_t sub_32994(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_37048();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_32B50(a5, a6);
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
  uint64_t v8 = sub_37148();
  if (!v8)
  {
    sub_371C8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_37228();
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

uint64_t sub_32B50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_32BE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_32DC8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_32DC8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_32BE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_32D60(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_37118();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_371C8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_36E58();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_37228();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_371C8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_32D60(uint64_t a1, uint64_t a2)
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
  sub_66B8(&qword_48E48);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_32DC8(char a1, int64_t a2, char a3, char *a4)
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
    sub_66B8(&qword_48E48);
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
  uint64_t result = sub_37228();
  __break(1u);
  return result;
}

uint64_t sub_32F18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_32F58(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_32F38(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_330C8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_32F58(char a1, int64_t a2, char a3, char *a4)
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
    sub_66B8((uint64_t *)&unk_48A40);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_37228();
  __break(1u);
  return result;
}

uint64_t sub_330C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_66B8(&qword_48E50);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_37228();
  __break(1u);
  return result;
}

uint64_t sub_33228(double a1, double a2, double a3)
{
  uint64_t result = 0;
  char v4 = 0;
  uint64_t v5 = 0;
  double v6 = a1;
  do
  {
    BOOL v8 = v6 <= a2;
    if (a3 > 0.0) {
      BOOL v8 = v6 >= a2;
    }
    if (v8)
    {
      if ((v6 != a2) | v4 & 1) {
        return result;
      }
      char v4 = 1;
    }
    else
    {
      BOOL v7 = __OFADD__(v5++, 1);
      if (v7) {
        goto LABEL_12;
      }
      double v6 = a1 + (double)v5 * a3;
    }
    BOOL v7 = __OFADD__(result++, 1);
  }
  while (!v7);
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void sub_3329C()
{
  *(void *)&v0[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_graphData] = 0;
  uint64_t v1 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationStartLabel;
  *(void *)&v0[v1] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v2 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_durationEndLabel;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v3 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_gridLayer;
  *(void *)&v0[v3] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v4 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_dotLayer;
  *(void *)&v0[v4] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v5 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_maxDotLayer;
  *(void *)&v0[v5] = [objc_allocWithZone((Class)CAShapeLayer) init];
  uint64_t v6 = OBJC_IVAR____TtC32DepthComplicationBundleCompanion14DepthGraphView_barLayer;
  *(void *)&v0[v6] = [objc_allocWithZone((Class)CAShapeLayer) init];

  sub_371D8();
  __break(1u);
}

void sub_333C4(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = sub_33228(a2, a3, a4);
  sub_32F38(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0) {
    goto LABEL_30;
  }
  char v11 = 0;
  uint64_t v12 = 0;
  if (!v10)
  {
    double v15 = a2;
    goto LABEL_16;
  }
  double v13 = a2;
  do
  {
    BOOL v14 = v13 <= a3;
    if (a4 > 0.0) {
      BOOL v14 = v13 >= a3;
    }
    if (v14)
    {
      if (v11 & 1 | (v13 != a3)) {
        goto LABEL_28;
      }
      char v11 = 1;
      double v15 = v13;
    }
    else
    {
      BOOL v16 = __OFADD__(v12++, 1);
      if (v16) {
        goto LABEL_29;
      }
      double v15 = a2 + (double)v12 * a4;
    }
    [a1 bounds];
    CGFloat Height = CGRectGetHeight(v27);
    unint64_t v19 = _swiftEmptyArrayStorage[2];
    unint64_t v18 = _swiftEmptyArrayStorage[3];
    if (v19 >= v18 >> 1) {
      sub_32F38(v18 > 1, v19 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v19 + 1;
    uint64_t v20 = (char *)&_swiftEmptyArrayStorage[4 * v19];
    *((double *)v20 + 4) = v13 + a5;
    *(_OWORD *)(v20 + 40) = xmmword_38630;
    *((CGFloat *)v20 + 7) = Height;
    double v13 = v15;
    --v10;
  }
  while (v10);
  while (1)
  {
LABEL_16:
    BOOL v21 = v15 <= a3;
    if (a4 > 0.0) {
      BOOL v21 = v15 >= a3;
    }
    if (!v21) {
      break;
    }
    if ((v15 != a3) | v11 & 1) {
      return;
    }
    char v11 = 1;
    double v22 = v15;
LABEL_23:
    [a1 bounds];
    CGFloat v23 = CGRectGetHeight(v28);
    unint64_t v25 = _swiftEmptyArrayStorage[2];
    unint64_t v24 = _swiftEmptyArrayStorage[3];
    if (v25 >= v24 >> 1) {
      sub_32F38(v24 > 1, v25 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v25 + 1;
    uint64_t v26 = (char *)&_swiftEmptyArrayStorage[4 * v25];
    *((double *)v26 + 4) = v15 + a5;
    *(_OWORD *)(v26 + 40) = xmmword_38630;
    *((CGFloat *)v26 + 7) = v23;
    double v15 = v22;
  }
  BOOL v16 = __OFADD__(v12++, 1);
  if (!v16)
  {
    double v22 = a2 + (double)v12 * a4;
    goto LABEL_23;
  }
  __break(1u);
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_3362C(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_48E30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_3368C()
{
  unint64_t result = qword_48A68;
  if (!qword_48A68)
  {
    sub_369D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_48A68);
  }
  return result;
}

uint64_t sub_336E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_66B8(&qword_48E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_3374C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_368B8() - 8);
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
  uint64_t result = sub_37228();
  __break(1u);
  return result;
}

char *sub_338A8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    BOOL v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_37228();
  __break(1u);
  return result;
}

uint64_t sub_33994(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

__n128 initializeWithCopy for Bar(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Bar(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Bar(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_33A94(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_33A9C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Bar()
{
  return &type metadata for Bar;
}

uint64_t HKUnit.depthUnit.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  int v4 = self;
  id v5 = [v4 footUnit];
  sub_33CAC();
  char v6 = sub_37018();

  if (v6)
  {
    BOOL v7 = (unsigned int *)&enum case for DepthUnit.ft(_:);
  }
  else
  {
    id v8 = [v4 meterUnit];
    char v9 = sub_37018();

    if ((v9 & 1) == 0)
    {
      sub_37108(37);
      swift_bridgeObjectRelease();
      id v14 = [v2 description];
      uint64_t v15 = sub_36DD8();
      unint64_t v17 = v16;

      v19._countAndFlagsBits = v15;
      v19._object = v17;
      sub_36E48(v19);
      swift_bridgeObjectRelease();
      v20._countAndFlagsBits = 0x74706564206F7420;
      v20._object = (void *)0xED000074696E5568;
      sub_36E48(v20);
      uint64_t result = sub_371D8();
      __break(1u);
      return result;
    }
    BOOL v7 = (unsigned int *)&enum case for DepthUnit.m(_:);
  }
  uint64_t v10 = *v7;
  uint64_t v11 = sub_36928();
  unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);

  return v12(a1, v10, v11);
}

unint64_t sub_33CAC()
{
  unint64_t result = qword_488D0;
  if (!qword_488D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_488D0);
  }
  return result;
}

uint64_t HKUnit.waterTemperatureUnit.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  int v4 = self;
  id v5 = [v4 degreeCelsiusUnit];
  sub_33CAC();
  char v6 = sub_37018();

  if (v6)
  {
    BOOL v7 = (unsigned int *)&enum case for WaterTemperatureUnit.celcius(_:);
  }
  else
  {
    id v8 = [v4 degreeFahrenheitUnit];
    char v9 = sub_37018();

    if ((v9 & 1) == 0)
    {
      sub_37108(48);
      swift_bridgeObjectRelease();
      id v14 = [v2 description];
      uint64_t v15 = sub_36DD8();
      unint64_t v17 = v16;

      v19._countAndFlagsBits = v15;
      v19._object = v17;
      sub_36E48(v19);
      swift_bridgeObjectRelease();
      v20._countAndFlagsBits = 0xD000000000000018;
      v20._object = (void *)0x800000000003A360;
      sub_36E48(v20);
      uint64_t result = sub_371D8();
      __break(1u);
      return result;
    }
    BOOL v7 = (unsigned int *)&enum case for WaterTemperatureUnit.fahrenheit(_:);
  }
  uint64_t v10 = *v7;
  uint64_t v11 = sub_36D68();
  unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);

  return v12(a1, v10, v11);
}

void *sub_33ED4(void *a1, void *a2, void *a3, void *a4)
{
  id v5 = v4;
  uint64_t v10 = sub_36C78();
  uint64_t v30 = *(void *)(v10 - 8);
  uint64_t v31 = v10;
  __chkstk_darwin(v10);
  uint64_t v29 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_36D68();
  __chkstk_darwin(v12 - 8);
  uint64_t v27 = (uint64_t)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_36928();
  __chkstk_darwin(v14 - 8);
  BOOL v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_36BE8();
  uint64_t v25 = *(void *)(v17 - 8);
  uint64_t v26 = v17;
  __chkstk_darwin(v17);
  Swift::String v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_36D38();
  __chkstk_darwin(v20 - 8);
  sub_36D28();
  sub_66B8(&qword_480E8);
  swift_allocObject();
  v4[2] = sub_36768();
  *(void *)((char *)v4 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_subscriptions) = &_swiftEmptySetSingleton;
  v4[5] = a2;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a3;
  swift_retain();
  swift_retain();
  CGRect v28 = a4;
  swift_retain();
  id v32 = a1;
  sub_36748();
  BOOL v21 = v33;
  HKUnit.depthUnit.getter((uint64_t)v16);

  sub_36748();
  double v22 = v34;
  HKUnit.waterTemperatureUnit.getter(v27);

  sub_36BA8();
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))((uint64_t)v5 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_unitSettings, v19, v26);
  sub_36748();
  CGFloat v23 = v29;
  sub_36C48();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))((uint64_t)v5 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_privacySettings, v23, v31);
  swift_retain();
  sub_34DD0();
  sub_36758();
  swift_release();
  uint64_t v33 = a3;
  swift_allocObject();
  swift_weakInit();
  sub_66B8(&qword_48890);
  sub_3546C(&qword_49030, &qword_48890);
  sub_36788();
  swift_release();
  swift_beginAccess();
  sub_36728();
  swift_endAccess();
  swift_release();
  uint64_t v33 = a2;
  swift_allocObject();
  swift_weakInit();
  sub_36788();
  swift_release();
  swift_beginAccess();
  sub_36728();
  swift_endAccess();
  swift_release();
  uint64_t v33 = v28;
  swift_allocObject();
  swift_weakInit();
  sub_66B8(&qword_48898);
  sub_3546C(&qword_49038, &qword_48898);
  sub_36788();
  swift_release();
  swift_beginAccess();
  sub_36728();
  swift_endAccess();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_34454(void **a1, uint64_t a2, uint64_t (*a3)(void), const char *a4, void (*a5)(void), void (*a6)(void))
{
  uint64_t v37 = a4;
  uint64_t v10 = sub_36D38();
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a3(0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = sub_36718();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Swift::String v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v34 = v17;
    uint64_t v35 = v16;
    uint64_t v36 = v15;
    sub_36908();
    double v22 = v20;
    CGFloat v23 = sub_36708();
    os_log_type_t v24 = sub_36F48();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v33 = a6;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138543362;
      id v32 = v12;
      uint64_t v38 = v22;
      uint64_t v26 = v22;
      uint64_t v31 = a5;
      uint64_t v27 = v26;
      a6 = v33;
      sub_37038();
      *uint64_t v30 = v22;

      a5 = v31;
      _os_log_impl(&dword_0, v23, v24, v37, v25, 0xCu);
      sub_66B8(&qword_48368);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      CGFloat v23 = v22;
    }

    uint64_t v28 = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v19, v35);
    uint64_t v29 = v36;
    a5(v28);
    swift_beginAccess();
    a6(v29);
    swift_endAccess();
    swift_retain();
    sub_34DD0();
    sub_36758();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_347A0(unsigned __int8 *a1)
{
  uint64_t v2 = sub_36D38();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_36718();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v7 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_36908();
    char v9 = sub_36708();
    os_log_type_t v10 = sub_36F48();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 67240192;
      int v12 = v7;
      sub_37038();
      _os_log_impl(&dword_0, v9, v10, "SettingsStore: updated fitnessTrackingEnabled=%{BOOL,public}d", v11, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_beginAccess();
    sub_36C68();
    swift_endAccess();
    swift_retain();
    sub_34DD0();
    sub_36758();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_349EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_66B8(&qword_49040);
  __chkstk_darwin(v2 - 8);
  uint64_t v31 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_368E8();
  uint64_t v4 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  char v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_36B28();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v28 - v12;
  sub_36A08();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for DeviceType.ultra(_:), v7);
  sub_36B18();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v11, v7);
  v14(v13, v7);
  uint64_t v15 = a1;
  sub_36A18();
  id v16 = *(id *)(v32 + 24);
  NSString v17 = sub_36DC8();
  id v18 = [v16 dataForKey:v17];

  if (v18)
  {
    uint64_t v19 = sub_36678();
    unint64_t v21 = v20;

    sub_36598();
    swift_allocObject();
    sub_36588();
    sub_3551C();
    uint64_t v22 = v30;
    CGFloat v23 = v31;
    uint64_t v24 = v29;
    sub_36578();
    if (v22)
    {
      swift_release();
      sub_13518(v19, v21);
      uint64_t v25 = sub_36A58();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v15, v25);
    }
    sub_13518(v19, v21);
    swift_release();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v23, 0, 1, v24);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v23, v24);
  }
  else
  {
    uint64_t v27 = (uint64_t)v31;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v31, 1, 1, v29);
    sub_36A38();
    sub_354BC(v27);
  }
  return sub_36A48();
}

uint64_t sub_34DD0()
{
  uint64_t v1 = v0;
  uint64_t v15 = sub_36C78();
  uint64_t v2 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_36BE8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_36A58();
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_36D28();
  sub_349EC((uint64_t)v11);
  sub_36CD8();
  uint64_t v12 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_unitSettings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  sub_36CF8();
  uint64_t v13 = v1 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_privacySettings;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v15);
  return sub_36D18();
}

uint64_t sub_350E4()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_unitSettings;
  uint64_t v2 = sub_36BE8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion13SettingsStore_privacySettings;
  uint64_t v4 = sub_36C78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_351C4()
{
  sub_350E4();

  return swift_deallocClassInstance();
}

uint64_t sub_3521C()
{
  return type metadata accessor for SettingsStore();
}

uint64_t type metadata accessor for SettingsStore()
{
  uint64_t result = qword_48E90;
  if (!qword_48E90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_35270()
{
  uint64_t result = sub_36BE8();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_36C78();
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

uint64_t sub_3536C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_353A4(void **a1)
{
  return sub_34454(a1, v1, (uint64_t (*)(void))&type metadata accessor for DepthUnit, "SettingsStore: updated depthUnit=%{public}@", (void (*)(void))HKUnit.depthUnit.getter, (void (*)(void))&UnitSettings.depthUnit.setter);
}

uint64_t sub_35404(void **a1)
{
  return sub_34454(a1, v1, (uint64_t (*)(void))&type metadata accessor for WaterTemperatureUnit, "SettingsStore: updated waterTemperatureUnit=%{public}@", (void (*)(void))HKUnit.waterTemperatureUnit.getter, (void (*)(void))&UnitSettings.waterTemperatureUnit.setter);
}

uint64_t sub_35464(unsigned __int8 *a1)
{
  return sub_347A0(a1);
}

uint64_t sub_3546C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_AD00(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_354BC(uint64_t a1)
{
  uint64_t v2 = sub_66B8(&qword_49040);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_3551C()
{
  unint64_t result = qword_49048;
  if (!qword_49048)
  {
    sub_368E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_49048);
  }
  return result;
}

id sub_35648()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataSourceContainer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DataSourceContainer()
{
  return self;
}

void sub_356A0()
{
  qword_49088 = 0x656469727265766FLL;
  unk_49090 = 0xEF64656C62616E45;
}

double sub_357CC(void *a1)
{
  id v1 = a1;
  NSString v2 = sub_36DC8();
  [v1 doubleForKey:v2];
  double v4 = v3;

  return v4;
}

uint64_t sub_358D0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider__depth;
  uint64_t v2 = sub_66B8(&qword_49340);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider__waterTemperature;
  uint64_t v4 = sub_66B8(&qword_49348);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider__historicalWaterTemperature, v4);
  uint64_t v6 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider__historicalMetrics;
  uint64_t v7 = sub_66B8(&qword_49350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider__overrideEnabled;
  uint64_t v9 = sub_66B8(&qword_49358);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  uint64_t v10 = v0 + OBJC_IVAR____TtC32DepthComplicationBundleCompanion16OverrideProvider_settings;
  uint64_t v11 = sub_36D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_35AE0()
{
  return type metadata accessor for OverrideProvider();
}

uint64_t type metadata accessor for OverrideProvider()
{
  uint64_t result = qword_49100;
  if (!qword_49100) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_35B34()
{
  sub_35D00(319, &qword_49110, (void (*)(uint64_t))&type metadata accessor for WaterDepth);
  if (v0 <= 0x3F)
  {
    sub_35D00(319, &qword_49118, (void (*)(uint64_t))&type metadata accessor for Temperature);
    if (v1 <= 0x3F)
    {
      sub_35D54();
      if (v2 <= 0x3F)
      {
        sub_35DB0();
        if (v3 <= 0x3F)
        {
          sub_36D38();
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_35D00(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_36778();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_35D54()
{
  if (!qword_49120)
  {
    sub_AD00(&qword_481F0);
    unint64_t v0 = sub_36778();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_49120);
    }
  }
}

void sub_35DB0()
{
  if (!qword_49128)
  {
    unint64_t v0 = sub_36778();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_49128);
    }
  }
}

uint64_t sub_35EB4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_66B8(&qword_48378);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_366C8();
  uint64_t v9 = sub_366F8();
  uint64_t v10 = *(void *)(v9 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    Class isa = sub_366D8().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  unsigned int v12 = [a2 supportsCapability:isa];

  if (v12)
  {
    uint64_t v13 = (*(uint64_t (**)(void))(v3 + 120))();
    char v14 = sub_36044(a1, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_36044(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

id sub_36100(void *a1, void *a2, void *a3)
{
  uint64_t v26 = a2;
  id v27 = a1;
  uint64_t v5 = sub_36718();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = qword_47BD0;
  uint64_t v10 = v3;
  if (v9 != -1) {
    swift_once();
  }
  *(void *)&v10[OBJC_IVAR____TtC32DepthComplicationBundleCompanion14BaseDataSource_timelineDataProvider] = qword_49428;
  swift_retain();

  uint64_t v11 = (objc_class *)type metadata accessor for BaseDataSource();
  v29.receiver = v10;
  v29.super_class = v11;
  id v12 = objc_msgSendSuper2(&v29, "initWithComplication:family:forDevice:", v27, v26, a3);
  sub_368F8();
  id v13 = v12;
  char v14 = sub_36708();
  os_log_type_t v15 = sub_36F28();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v8;
    uint64_t v17 = v16;
    id v18 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 138412546;
    id v28 = v13;
    uint64_t v25 = v6;
    id v19 = v13;
    CGFloat v23 = a3;
    id v20 = v19;
    sub_37038();
    *id v18 = v13;

    unint64_t v21 = v23;
    *(_WORD *)(v17 + 12) = 2048;
    id v28 = v26;
    uint64_t v6 = v25;
    sub_37038();
    _os_log_impl(&dword_0, v14, v15, "%@ initialized for family %ld", (uint8_t *)v17, 0x16u);
    sub_66B8(&qword_48368);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v8 = v24;
    swift_slowDealloc();
  }
  else
  {

    unint64_t v21 = v13;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

id sub_36444()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseDataSource();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BaseDataSource()
{
  return self;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_36578()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_36588()
{
  return JSONDecoder.init()();
}

uint64_t sub_36598()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_365A8()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_365B8()
{
  return JSONEncoder.init()();
}

uint64_t sub_365C8()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_365D8()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_365E8()
{
  return static CharacterSet.decimalDigits.getter();
}

uint64_t sub_365F8()
{
  return static CharacterSet.punctuationCharacters.getter();
}

uint64_t sub_36608()
{
  return CharacterSet.union(_:)();
}

uint64_t sub_36618()
{
  return static CharacterSet.letters.getter();
}

uint64_t sub_36628()
{
  return CharacterSet.contains(_:)();
}

uint64_t sub_36638()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_36648()
{
  return DateInterval.init(start:duration:)();
}

uint64_t sub_36658()
{
  return type metadata accessor for DateInterval();
}

NSData sub_36668()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_36678()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_36688()
{
  return static Date.distantPast.getter();
}

NSDate sub_36698()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_366A8()
{
  return Date.init()();
}

uint64_t sub_366B8()
{
  return type metadata accessor for Date();
}

uint64_t sub_366C8()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_366D8()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_366E8()
{
  return UUID.init()();
}

uint64_t sub_366F8()
{
  return type metadata accessor for UUID();
}

uint64_t sub_36708()
{
  return Logger.logObject.getter();
}

uint64_t sub_36718()
{
  return type metadata accessor for Logger();
}

uint64_t sub_36728()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_36738()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_36748()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_36758()
{
  return CurrentValueSubject.value.setter();
}

uint64_t sub_36768()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_36778()
{
  return type metadata accessor for Published();
}

uint64_t sub_36788()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_36798()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_367A8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_367B8()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_367C8()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_367D8()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_367E8()
{
  return WaterDepth.isExceedingMaxDepth.getter();
}

uint64_t sub_367F8()
{
  return static WaterDepth.maxDepth(fromMetadata:)();
}

uint64_t sub_36808()
{
  return WaterDepth.asMaxDepthMetadata.getter();
}

uint64_t sub_36818()
{
  return static WaterDepth.currentDepth(fromMetadata:)();
}

uint64_t sub_36828()
{
  return WaterDepth.asCurrentDepthMetadata.getter();
}

uint64_t sub_36838()
{
  return WaterDepth.depthValue.getter();
}

uint64_t sub_36848()
{
  return static WaterDepth.from(depthValue:withConfiguration:)();
}

uint64_t sub_36858()
{
  return type metadata accessor for WaterDepth();
}

uint64_t sub_36868()
{
  return DepthValueRange.max.getter();
}

uint64_t sub_36878()
{
  return DepthValueRange.max.setter();
}

uint64_t sub_36888()
{
  return DepthValueRange.init(min:max:)();
}

uint64_t sub_36898()
{
  return DepthValueRange.min.getter();
}

uint64_t sub_368A8()
{
  return DepthValueRange.range.getter();
}

uint64_t sub_368B8()
{
  return type metadata accessor for DepthValueRange();
}

uint64_t sub_368C8()
{
  return DepthIntervalSummary.depthRange.getter();
}

uint64_t sub_368D8()
{
  return type metadata accessor for DepthIntervalSummary();
}

uint64_t sub_368E8()
{
  return type metadata accessor for DepthProviderSetting();
}

uint64_t sub_368F8()
{
  return static DepthLog.complications.getter();
}

uint64_t sub_36908()
{
  return static DepthLog.default.getter();
}

uint64_t sub_36918()
{
  return static DepthLog.osLogger.getter();
}

uint64_t sub_36928()
{
  return type metadata accessor for DepthUnit();
}

uint64_t sub_36938()
{
  return static DepthLimit.depthLimit(forDeviceType:)();
}

uint64_t sub_36948()
{
  return static DepthLimit.depthLimit(forDeviceIdentifier:)();
}

uint64_t sub_36958()
{
  return DepthLimit.feet.getter();
}

uint64_t sub_36968()
{
  return DepthLimit.meters.getter();
}

uint64_t sub_36978()
{
  return type metadata accessor for DepthLimit();
}

uint64_t sub_36988()
{
  return DepthValue.canonicalValue.getter();
}

uint64_t sub_36998()
{
  return static DepthValue.< infix(_:_:)();
}

uint64_t sub_369A8()
{
  return static DepthValue.zero.getter();
}

uint64_t sub_369B8()
{
  return DepthValue.init(value:inUnit:)();
}

uint64_t sub_369C8()
{
  return DepthValue.value(forUnit:)();
}

uint64_t sub_369D8()
{
  return type metadata accessor for DepthValue();
}

uint64_t sub_369E8()
{
  return DepthSettings.currentDeviceDepthLimit.getter();
}

uint64_t sub_369F8()
{
  return DepthSettings.nominalDepthLimit(inUnit:)();
}

uint64_t sub_36A08()
{
  return static DepthSettings.currentDevice.getter();
}

uint64_t sub_36A18()
{
  return DepthSettings.init(currentDeviceIsUltra:)();
}

uint64_t sub_36A28()
{
  return DepthSettings.deepDiveTimeThreshold.getter();
}

uint64_t sub_36A38()
{
  return DepthSettings.provider.getter();
}

uint64_t sub_36A48()
{
  return DepthSettings.provider.setter();
}

uint64_t sub_36A58()
{
  return type metadata accessor for DepthSettings();
}

uint64_t sub_36A68()
{
  return dispatch thunk of DepthFormatter.complicationMaxDepthUnitString.getter();
}

uint64_t sub_36A78()
{
  return dispatch thunk of DepthFormatter.formatDepthValueForComplicationsOnly(_:)();
}

uint64_t sub_36A88()
{
  return dispatch thunk of DepthFormatter.formatMaxDepth(_:compact:includeSpace:deviceType:)();
}

uint64_t sub_36A98()
{
  return dispatch thunk of DepthFormatter.formatMaxDepthForComplicationsOnly(summary:)();
}

uint64_t sub_36AA8()
{
  return DepthFormatter.init(configuration:)();
}

uint64_t sub_36AB8()
{
  return dispatch thunk of DepthFormatter.depthUnitString.getter();
}

uint64_t sub_36AC8()
{
  return dispatch thunk of DepthFormatter.complicationDurationUnitString(forDuration:)();
}

uint64_t sub_36AD8()
{
  return dispatch thunk of DepthFormatter.formatComplicationDiveDuration(_:)();
}

uint64_t sub_36AE8()
{
  return dispatch thunk of DepthFormatter.complicationFormatNumberOfDives(_:)();
}

uint64_t sub_36AF8()
{
  return type metadata accessor for DepthFormatter();
}

uint64_t sub_36B08()
{
  return static DeviceType.deviceType(forDeviceIdentifier:)();
}

uint64_t sub_36B18()
{
  return static DeviceType.== infix(_:_:)();
}

uint64_t sub_36B28()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_36B38()
{
  return DiveSummary.deviceIdentifier.getter();
}

uint64_t sub_36B48()
{
  return DiveSummary.init(workoutID:dateInterval:maxDepth:underwaterDuration:temperatureRange:numberOfDives:diveID:deviceIdentifier:)();
}

uint64_t sub_36B58()
{
  return type metadata accessor for DiveSummary();
}

uint64_t sub_36B68()
{
  return Temperature.temperature.getter();
}

uint64_t sub_36B78()
{
  return static Temperature.== infix(_:_:)();
}

uint64_t sub_36B88()
{
  return type metadata accessor for Temperature();
}

uint64_t sub_36B98()
{
  return UnitSettings.waterTemperatureUnit.getter();
}

uint64_t sub_36BA8()
{
  return UnitSettings.init(depthUnit:waterTemperatureUnit:)();
}

uint64_t sub_36BB8()
{
  return UnitSettings.depthUnit.getter();
}

uint64_t sub_36BC8()
{
  return UnitSettings.loggingString.getter();
}

uint64_t sub_36BD8()
{
  return UnitSettings.localizedString.getter();
}

uint64_t sub_36BE8()
{
  return type metadata accessor for UnitSettings();
}

uint64_t sub_36BF8()
{
  return static UnderwaterTime.underwaterTime(fromComplicationMetadata:)();
}

uint64_t sub_36C08()
{
  return UnderwaterTime.isTentative.getter();
}

uint64_t sub_36C18()
{
  return UnderwaterTime.timeIntervalUntilNow.getter();
}

uint64_t sub_36C28()
{
  return UnderwaterTime.asComplicationMetadata.getter();
}

uint64_t sub_36C38()
{
  return type metadata accessor for UnderwaterTime();
}

uint64_t sub_36C48()
{
  return PrivacySettings.init(fitnessTrackingEnabled:)();
}

uint64_t sub_36C58()
{
  return PrivacySettings.fitnessTrackingEnabled.getter();
}

uint64_t sub_36C68()
{
  return PrivacySettings.fitnessTrackingEnabled.setter();
}

uint64_t sub_36C78()
{
  return type metadata accessor for PrivacySettings();
}

uint64_t sub_36C88()
{
  return type metadata accessor for TemperatureRange();
}

uint64_t sub_36C98()
{
  return TemperatureValue.init(value:inUnit:)();
}

uint64_t sub_36CA8()
{
  return TemperatureValue.value(forUnit:)();
}

uint64_t sub_36CB8()
{
  return type metadata accessor for TemperatureValue();
}

uint64_t sub_36CC8()
{
  return DiveConfiguration.depth.getter();
}

uint64_t sub_36CD8()
{
  return DiveConfiguration.depth.setter();
}

uint64_t sub_36CE8()
{
  return DiveConfiguration.units.getter();
}

uint64_t sub_36CF8()
{
  return DiveConfiguration.units.setter();
}

uint64_t sub_36D08()
{
  return DiveConfiguration.privacy.getter();
}

uint64_t sub_36D18()
{
  return DiveConfiguration.privacy.setter();
}

uint64_t sub_36D28()
{
  return DiveConfiguration.init()();
}

uint64_t sub_36D38()
{
  return type metadata accessor for DiveConfiguration();
}

uint64_t sub_36D48()
{
  return dispatch thunk of SummaryPresentable.deviceIdentifier.getter();
}

uint64_t sub_36D58()
{
  return WaterTemperatureUnit.unitTemperature.getter();
}

uint64_t sub_36D68()
{
  return type metadata accessor for WaterTemperatureUnit();
}

NSDictionary sub_36D78()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_36D88()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_36D98()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_36DA8()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

uint64_t sub_36DB8()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_36DC8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_36DD8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_36DE8()
{
  return String.init(format:_:)();
}

uint64_t sub_36DF8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_36E08()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_36E18()
{
  return String.utf8CString.getter();
}

uint64_t sub_36E28()
{
  return String.UnicodeScalarView.append(_:)();
}

uint64_t sub_36E38()
{
  return String.hash(into:)();
}

void sub_36E48(Swift::String a1)
{
}

Swift::Int sub_36E58()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_36E68()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_36E78()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_36E88()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_36E98()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_36EA8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_36EB8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_36EC8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_36ED8()
{
  return Bool._bridgeToObjectiveC()();
}

NSNumber sub_36EE8()
{
  return Double._bridgeToObjectiveC()();
}

NSSet sub_36EF8()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_36F08()
{
  return Set.init(minimumCapacity:)();
}

NSNumber sub_36F18()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_36F28()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_36F38()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_36F48()
{
  return static os_log_type_t.default.getter();
}

HKQuantityType sub_36F58(HKQuantityTypeIdentifier a1)
{
  return HKQuantityType.init(_:)(a1);
}

void sub_36F68(CGPathRef _, CGAffineTransform *transform)
{
}

uint64_t sub_36F78()
{
  return CGMutablePathRef.move(to:transform:)();
}

uint64_t sub_36F88()
{
  return CGMutablePathRef.addLine(to:transform:)();
}

uint64_t sub_36F98()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_36FA8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_36FB8()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_36FC8()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_36FD8()
{
  return NSMeasurementFormatter.string<A>(from:)();
}

uint64_t sub_36FE8()
{
  return CGRect.center.getter();
}

uint64_t sub_36FF8()
{
  return CGSize.roundToScreenScale()();
}

Swift::Int sub_37008(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_37018()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_37028()
{
  return type metadata accessor for Optional();
}

uint64_t sub_37038()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_37048()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_37058()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_37068()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_37078()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_37088()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_37098()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_370A8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_370B8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_370C8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_370D8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_370E8()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_370F8()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

void sub_37108(Swift::Int a1)
{
}

uint64_t sub_37118()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_37128()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_37138()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_37148()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_37158()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t sub_37168()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_37178()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_37188()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_37198()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_371A8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_371B8()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_371C8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_371D8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_371E8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_371F8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_37208()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_37218()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_37228()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_37238(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_37248()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_37258()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_37268()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_37278()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_37288()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_37298()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_372A8()
{
  return Hasher.init(_seed:)();
}

void sub_372B8(Swift::UInt a1)
{
}

Swift::Int sub_372C8()
{
  return Hasher._finalize()();
}

uint64_t sub_372D8()
{
  return _typeName(_:qualified:)();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return _CLKRectCenteredIntegralRectForDevice();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKGenerateDefaultUnitForQuantityType()
{
  return __HKGenerateDefaultUnitForQuantityType();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
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

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
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