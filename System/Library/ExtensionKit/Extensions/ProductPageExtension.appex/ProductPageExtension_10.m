uint64_t sub_100744CF0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (**v14)();
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v4 = sub_100779CC0();
  __chkstk_darwin(v4 - 8);
  v5 = sub_10000D280(&qword_10096F370);
  v6 = *(void *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16))(v9, a1, v5, v7);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  if (v10 == enum case for DiffablePagePresenter.UpdatePhase.completed<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v9, v5);
    swift_release();
    *((unsigned char *)v2 + qword_1009A9048) = 1;
    (*(void (**)(void))((swift_isaMask & *v2) + 0x188))(0);
    if (sub_100774B30())
    {
      sub_10076FE40();
      swift_release();
    }
    v11 = (void *)((char *)v2 + qword_100959B18);
    swift_beginAccess();
    v12 = *v11;
    if (*v11)
    {
      v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v14 = (uint64_t (**)())(v12
                           + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
      v15 = *(void *)(v12
                      + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
      *v14 = sub_100746A58;
      v14[1] = (uint64_t (*)())v13;
      sub_1000194B0(v15);
    }
    sub_100774B20();
    return swift_release();
  }
  else if (v10 == enum case for DiffablePagePresenter.UpdatePhase.error<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v9, v5);
    v17 = *((void *)v9 + 1);
    sub_100779DB0();
    sub_100746A74(&qword_100972BA0, 255, (void (*)(uint64_t))&type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter);
    swift_errorRetain();
    swift_retain();
    sub_1000194C0(v17);
    v18 = sub_100779D70();
    (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x188))(v18);
    sub_1000194B0(v17);
    return swift_errorRelease();
  }
  else if (v10 == enum case for DiffablePagePresenter.UpdatePhase.started<A>(_:))
  {
    sub_100774B20();
    sub_100779CB0();
    v19 = objc_allocWithZone((Class)sub_100779CE0());
    v20 = sub_100779CD0();
    (*(void (**)(uint64_t))((swift_isaMask & *v2) + 0x188))(v20);
    if (sub_100774B30())
    {
      sub_10076FE70();
      swift_release();
    }
    sub_100774B20();
    return sub_10076D600();
  }
  else
  {
    (*(void (**)(void))((swift_isaMask & *v2) + 0x188))(0);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

id sub_100745200(uint64_t a1)
{
  v2 = v1;
  uint64_t v4 = sub_100779CC0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000D280(&qword_100972B88);
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  v9 = &v75[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, __n128))(v6 + 16))(v9, a1, v5, v7);
  int v10 = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 88))(v9, v5);
  if (v10 == enum case for DiffablePagePresenter.UpdatePhase.completed<A>(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 96))(v9, v5);
    swift_release();
    v2[qword_1009A9048] = 1;
    uint64_t v11 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v12 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v13 = *(void **)&v2[v11];
    *(void *)&v2[v11] = 0;

    id v14 = *(id *)&v2[v11];
    id result = [v2 view];
    if (result)
    {
      v16 = result;
      [result bounds];
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;

      uint64_t v76 = v18;
      uint64_t v77 = v20;
      uint64_t v78 = v22;
      uint64_t v79 = v24;
      char v80 = 0;
      sub_100774C60();

      if (sub_100774B30())
      {
        sub_10076FE40();
        swift_release();
      }
      v25 = (uint64_t *)&v2[qword_100959B18];
      swift_beginAccess();
      uint64_t v26 = *v25;
      if (*v25)
      {
        uint64_t v27 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v28 = (uint64_t (**)())(v26
                             + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
        uint64_t v29 = *(void *)(v26
                        + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
        *v28 = sub_100746A58;
        v28[1] = (uint64_t (*)())v27;
        sub_1000194B0(v29);
      }
      sub_100774B20();
      return (id)swift_release();
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v10 == enum case for DiffablePagePresenter.UpdatePhase.error<A>(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 96))(v9, v5);
    uint64_t v30 = *((void *)v9 + 1);
    sub_100779DB0();
    sub_100746A74(&qword_100972B90, 255, (void (*)(uint64_t))&type metadata accessor for SearchChartsAndCategoriesDiffablePagePresenter);
    swift_errorRetain();
    swift_retain();
    sub_1000194C0(v30);
    v31 = (void *)sub_100779D70();
    uint64_t v32 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v33 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v34 = *(void **)&v2[v32];
    *(void *)&v2[v32] = v31;
    id v35 = v31;

    id v36 = *(id *)&v2[v32];
    id result = [v2 view];
    if (result)
    {
      v37 = result;
      [result bounds];
      uint64_t v39 = v38;
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      uint64_t v45 = v44;

      uint64_t v76 = v39;
      uint64_t v77 = v41;
      uint64_t v78 = v43;
      uint64_t v79 = v45;
      char v80 = 0;
      sub_100774C60();

      sub_1000194B0(v30);
      return (id)swift_errorRelease();
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v10 != enum case for DiffablePagePresenter.UpdatePhase.started<A>(_:))
  {
    uint64_t v62 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v63 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v64 = *(void **)&v2[v62];
    *(void *)&v2[v62] = 0;

    id v65 = *(id *)&v2[v62];
    id result = [v2 view];
    if (result)
    {
      v66 = result;
      [result bounds];
      uint64_t v68 = v67;
      uint64_t v70 = v69;
      uint64_t v72 = v71;
      uint64_t v74 = v73;

      uint64_t v76 = v68;
      uint64_t v77 = v70;
      uint64_t v78 = v72;
      uint64_t v79 = v74;
      char v80 = 0;
      sub_100774C60();

      return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
    }
    goto LABEL_21;
  }
  sub_100774B20();
  sub_100779CB0();
  id v46 = objc_allocWithZone((Class)sub_100779CE0());
  v47 = (void *)sub_100779CD0();
  uint64_t v48 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
  id v49 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
  sub_100774C70();

  v50 = *(void **)&v2[v48];
  *(void *)&v2[v48] = v47;
  id v51 = v47;

  id v52 = *(id *)&v2[v48];
  id result = [v2 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v53 = result;
  [result bounds];
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;

  uint64_t v76 = v55;
  uint64_t v77 = v57;
  uint64_t v78 = v59;
  uint64_t v79 = v61;
  char v80 = 0;
  sub_100774C60();

  if (sub_100774B30())
  {
    sub_10076FE70();
    swift_release();
  }
  sub_100774B20();
  return (id)sub_10076D600();
}

id sub_100745894(uint64_t a1)
{
  v2 = v1;
  uint64_t v4 = sub_100779CC0();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_10000D280(&qword_100970C80);
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  v9 = &v75[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, __n128))(v6 + 16))(v9, a1, v5, v7);
  int v10 = (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 88))(v9, v5);
  if (v10 == enum case for DiffablePagePresenter.UpdatePhase.completed<A>(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 96))(v9, v5);
    swift_release();
    v2[qword_1009A9048] = 1;
    uint64_t v11 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v12 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v13 = *(void **)&v2[v11];
    *(void *)&v2[v11] = 0;

    id v14 = *(id *)&v2[v11];
    id result = [v2 view];
    if (result)
    {
      v16 = result;
      [result bounds];
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;

      uint64_t v76 = v18;
      uint64_t v77 = v20;
      uint64_t v78 = v22;
      uint64_t v79 = v24;
      char v80 = 0;
      sub_100774C60();

      if (sub_100774B30())
      {
        sub_10076FE40();
        swift_release();
      }
      v25 = (uint64_t *)&v2[qword_100959B18];
      swift_beginAccess();
      uint64_t v26 = *v25;
      if (*v25)
      {
        uint64_t v27 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v28 = (uint64_t (**)())(v26
                             + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
        uint64_t v29 = *(void *)(v26
                        + OBJC_IVAR____TtC20ProductPageExtension33BaseCollectionCompositionalLayout_pendingPrepareObserver);
        *v28 = sub_100746A58;
        v28[1] = (uint64_t (*)())v27;
        sub_1000194B0(v29);
      }
      sub_100774B20();
      return (id)swift_release();
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v10 == enum case for DiffablePagePresenter.UpdatePhase.error<A>(_:))
  {
    (*(void (**)(unsigned char *, uint64_t))(v6 + 96))(v9, v5);
    uint64_t v30 = *((void *)v9 + 1);
    sub_100779DB0();
    sub_100746A74(&qword_100972B98, 255, (void (*)(uint64_t))&type metadata accessor for ProductDiffablePagePresenter);
    swift_errorRetain();
    swift_retain();
    sub_1000194C0(v30);
    v31 = (void *)sub_100779D70();
    uint64_t v32 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v33 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v34 = *(void **)&v2[v32];
    *(void *)&v2[v32] = v31;
    id v35 = v31;

    id v36 = *(id *)&v2[v32];
    id result = [v2 view];
    if (result)
    {
      v37 = result;
      [result bounds];
      uint64_t v39 = v38;
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      uint64_t v45 = v44;

      uint64_t v76 = v39;
      uint64_t v77 = v41;
      uint64_t v78 = v43;
      uint64_t v79 = v45;
      char v80 = 0;
      sub_100774C60();

      sub_1000194B0(v30);
      return (id)swift_errorRelease();
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v10 != enum case for DiffablePagePresenter.UpdatePhase.started<A>(_:))
  {
    uint64_t v62 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
    id v63 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
    sub_100774C70();

    v64 = *(void **)&v2[v62];
    *(void *)&v2[v62] = 0;

    id v65 = *(id *)&v2[v62];
    id result = [v2 view];
    if (result)
    {
      v66 = result;
      [result bounds];
      uint64_t v68 = v67;
      uint64_t v70 = v69;
      uint64_t v72 = v71;
      uint64_t v74 = v73;

      uint64_t v76 = v68;
      uint64_t v77 = v70;
      uint64_t v78 = v72;
      uint64_t v79 = v74;
      char v80 = 0;
      sub_100774C60();

      return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
    }
    goto LABEL_21;
  }
  sub_100774B20();
  sub_100779CB0();
  id v46 = objc_allocWithZone((Class)sub_100779CE0());
  v47 = (void *)sub_100779CD0();
  uint64_t v48 = OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController;
  id v49 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_overlayViewController];
  sub_100774C70();

  v50 = *(void **)&v2[v48];
  *(void *)&v2[v48] = v47;
  id v51 = v47;

  id v52 = *(id *)&v2[v48];
  id result = [v2 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v53 = result;
  [result bounds];
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;

  uint64_t v76 = v55;
  uint64_t v77 = v57;
  uint64_t v78 = v59;
  uint64_t v79 = v61;
  char v80 = 0;
  sub_100774C60();

  if (sub_100774B30())
  {
    sub_10076FE70();
    swift_release();
  }
  sub_100774B20();
  return (id)sub_10076D600();
}

uint64_t sub_100745F28()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    v1 = (void *)result;
    swift_retain();

    uint64_t v2 = sub_100774B30();
    uint64_t result = swift_release();
    if (v2)
    {
      sub_10076FE40();
      return swift_release();
    }
  }
  return result;
}

void sub_100745FC0(uint64_t a1)
{
  uint64_t v3 = sub_10000D280(&qword_100972B88);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100745200(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == enum case for DiffablePagePresenter.UpdatePhase.completed<A>(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    sub_100776150();
    if (v7)
    {
      NSString v8 = sub_10077BC80();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v8 = 0;
    }
    [v1 setTitle:v8];
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_100746148()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20ProductPageExtension29StoreCollectionViewController_objectGraph);
  type metadata accessor for SearchChartsAndCategoriesShelfSupplementaryProvider();
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = sub_100746A74(&qword_100972B78, 255, (void (*)(uint64_t))&type metadata accessor for SearchChartsAndCategoriesDiffablePagePresenter);
  *(void *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v2 + 32) = v3;
  swift_unknownObjectWeakAssign();
  *(void *)(v2 + 16) = v1;
  sub_100746A74(&qword_100972B80, v4, (void (*)(uint64_t))type metadata accessor for SearchChartsAndCategoriesShelfSupplementaryProvider);
  swift_retain();
  return v2;
}

uint64_t sub_100746244@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100777780();
  char v4 = v3;
  sub_10076D900();
  swift_allocObject();
  uint64_t v5 = sub_10076D8F0();
  swift_allocObject();
  uint64_t v6 = sub_10076D8F0();
  a1[3] = (uint64_t)&type metadata for SearchChartsAndCategoriesPageGridProvider;
  a1[4] = sub_10074698C();
  uint64_t result = swift_allocObject();
  *a1 = result;
  *(void *)(result + 16) = v5;
  *(void *)(result + 24) = v6;
  *(void *)(result + 32) = v2;
  *(unsigned char *)(result + 40) = v4 & 1;
  return result;
}

unint64_t sub_10074630C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for SearchChartsAndCategoriesPageShelfLayoutSpacingProvider;
  unint64_t result = sub_100746938();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100746340(uint64_t a1)
{
  uint64_t v2 = sub_10076A040();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  __chkstk_darwin(v2);
  char v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D280((uint64_t *)&unk_10096F360);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FlowDestination();
  __chkstk_darwin(v8);
  int v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v30 - v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v30 - v18;
  sub_100066F70(a1, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() != 8)
  {
    sub_100066FD4((uint64_t)v10);
LABEL_9:
    char v24 = 0;
    return v24 & 1;
  }
  swift_release();
  uint64_t v20 = sub_10000D280(&qword_100962DC0);
  sub_10005B6F8((uint64_t)&v10[*(int *)(v20 + 48)], (uint64_t)v19);
  sub_1007725F0();
  uint64_t v21 = (uint64_t)&v7[*(int *)(v5 + 48)];
  sub_10005B61C((uint64_t)v16, (uint64_t)v7);
  sub_10005B61C((uint64_t)v19, v21);
  uint64_t v22 = v30;
  uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  if (v23((uint64_t)v7, 1, v31) != 1)
  {
    sub_10005B61C((uint64_t)v7, (uint64_t)v13);
    if (v23(v21, 1, v31) != 1)
    {
      uint64_t v26 = v4;
      uint64_t v27 = v4;
      uint64_t v28 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(v27, v21, v31);
      sub_100746A74(&qword_10094DD00, 255, (void (*)(uint64_t))&type metadata accessor for URL);
      char v24 = sub_10077BC30();
      uint64_t v29 = *(void (**)(char *, uint64_t))(v22 + 8);
      v29(v26, v28);
      sub_10000FA80((uint64_t)v16, (uint64_t *)&unk_10094FEE0);
      sub_10000FA80((uint64_t)v19, (uint64_t *)&unk_10094FEE0);
      v29(v13, v28);
      sub_10000FA80((uint64_t)v7, (uint64_t *)&unk_10094FEE0);
      return v24 & 1;
    }
    sub_10000FA80((uint64_t)v16, (uint64_t *)&unk_10094FEE0);
    sub_10000FA80((uint64_t)v19, (uint64_t *)&unk_10094FEE0);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v31);
    goto LABEL_8;
  }
  sub_10000FA80((uint64_t)v16, (uint64_t *)&unk_10094FEE0);
  sub_10000FA80((uint64_t)v19, (uint64_t *)&unk_10094FEE0);
  if (v23(v21, 1, v31) != 1)
  {
LABEL_8:
    sub_10000FA80((uint64_t)v7, (uint64_t *)&unk_10096F360);
    goto LABEL_9;
  }
  sub_10000FA80((uint64_t)v7, (uint64_t *)&unk_10094FEE0);
  char v24 = 1;
  return v24 & 1;
}

uint64_t type metadata accessor for SearchChartsAndCategoriesDiffablePageViewController()
{
  uint64_t result = qword_1009724C8;
  if (!qword_1009724C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1007467C8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100746800()
{
  return type metadata accessor for SearchChartsAndCategoriesDiffablePageViewController();
}

uint64_t sub_100746808(uint64_t a1)
{
  return sub_100746340(a1) & 1;
}

uint64_t sub_100746830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000D280(&qword_1009543A0);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10076CDC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_10056CAB0(1, 1, 0, 0, 0, (uint64_t)v4, a1);
  return sub_10000FA80((uint64_t)v4, &qword_1009543A0);
}

uint64_t type metadata accessor for SearchChartsAndCategoriesShelfSupplementaryProvider()
{
  return self;
}

unint64_t sub_100746938()
{
  unint64_t result = qword_100972B68;
  if (!qword_100972B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100972B68);
  }
  return result;
}

unint64_t sub_10074698C()
{
  unint64_t result = qword_100972B70;
  if (!qword_100972B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100972B70);
  }
  return result;
}

uint64_t sub_1007469E0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_100746A20()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100746A58()
{
  return sub_100745F28();
}

uint64_t sub_100746A74(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

Swift::Void __swiftcall UIImageView.show(image:isAnimationPermitted:)(UIImage_optional image, Swift::Bool isAnimationPermitted)
{
  uint64_t v3 = v2;
  Class isa = image.value.super.isa;
  if (image.is_nil)
  {
    id v5 = objc_msgSend(v3, "image", isAnimationPermitted);

    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = objc_msgSend(v3, "layer", isAnimationPermitted);
  [v7 removeAllAnimations];

  if (isa)
  {
    if (v6)
    {
      uint64_t v8 = isa;
      [v3 setAlpha:0.0];
      [v3 setImage:v8];
      sub_100019840(0, (unint64_t *)&qword_10095EBE0);
      uint64_t v9 = (void *)sub_10077C570();
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v3;
      v15[4] = sub_10007ADCC;
      v15[5] = v10;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 1107296256;
      v15[2] = sub_1000A3B88;
      v15[3] = &unk_1008A8710;
      uint64_t v11 = _Block_copy(v15);
      id v12 = v3;
      swift_release();
      [v9 addAnimations:v11];
      _Block_release(v11);
      [v9 startAnimation];

      return;
    }
    v13 = v3;
    Class v14 = isa;
  }
  else
  {
    v13 = v3;
    Class v14 = 0;
  }

  [v13 setImage:v14];
}

uint64_t sub_100746CE4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100746D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100746D2C()
{
  return swift_release();
}

id sub_100746D38()
{
  id v1 = [v0 image];

  return v1;
}

void sub_100746D70(void *a1)
{
  [v1 setImage:a1];
}

void (*sub_100746DB8(void *a1))(id *a1)
{
  a1[1] = v1;
  *a1 = [v1 image];
  return sub_1006E09E0;
}

uint64_t sub_100746E18(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v6 = (uint64_t)v5;
  int v12 = *v5;
  double Width = CGRectGetWidth(*(CGRect *)&a2);
  double v14 = Width;
  if (v12 == 1)
  {
    v68.origin.x = a2;
    v68.origin.y = a3;
    v68.size.width = a4;
    v68.size.height = a5;
    CGRectGetWidth(v68);
    double v15 = *((double *)v5 + 9);
  }
  else
  {
    double v14 = Width * 0.5;
    v69.origin.x = a2;
    v69.origin.y = a3;
    v69.size.width = a4;
    v69.size.height = a5;
    double v15 = CGRectGetWidth(v69);
    v70.origin.x = a2;
    v70.origin.y = a3;
    v70.size.width = a4;
    v70.size.height = a5;
    double Height = CGRectGetHeight(v70);
    if (Height < v15) {
      double v15 = Height;
    }
  }
  CGFloat rect = v15;
  sub_10000FA3C((void *)v5 + 10, *((void *)v5 + 13));
  sub_10077C680();
  sub_100779F60();
  if (v12) {
    CGFloat v17 = *((double *)v5 + 2);
  }
  else {
    CGFloat v17 = *((double *)v5 + 6);
  }
  CGFloat v57 = v14;
  if (v12) {
    uint64_t v18 = 8;
  }
  else {
    uint64_t v18 = 40;
  }
  v71.origin.x = a2;
  v71.origin.y = a3;
  v71.size.width = a4;
  v71.size.height = a5;
  CGRectGetHeight(v71);
  sub_10000FA3C((void *)v5 + 15, *((void *)v5 + 18));
  sub_100779F70();
  CGFloat v20 = v19;
  double v22 = v21;
  CGFloat v23 = a4;
  CGFloat v24 = a5;
  double v25 = *(double *)&v5[v18];
  sub_10000FA3C((void *)v5 + 15, *((void *)v5 + 18));
  CGFloat v51 = v25;
  CGFloat v52 = v22;
  CGFloat v26 = v24;
  CGFloat v27 = v23;
  sub_10077C680();
  sub_100779F60();
  v72.origin.x = a2;
  v72.origin.y = a3;
  v72.size.width = v23;
  v72.size.height = v26;
  CGRectGetWidth(v72);
  v73.origin.x = 0.0;
  v73.origin.y = 0.0;
  v73.size.width = v57;
  v73.size.height = rect;
  CGRectGetHeight(v73);
  CGFloat v28 = v57;
  if (v12)
  {
    v74.origin.x = a2;
    v74.origin.y = a3;
    v74.size.width = v23;
    v74.size.height = v26;
    CGRectGetWidth(v74);
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    CGFloat v31 = rect;
    CGRectGetMaxX(*(CGRect *)(&v28 - 2));
  }
  sub_10074777C((uint64_t)v5, (uint64_t)v67);
  sub_10055A714((uint64_t)v67);
  sub_10000FA3C((void *)v5 + 25, *((void *)v5 + 28));
  sub_100779130();
  sub_10000FA3C(v66, v66[3]);
  sub_10077C680();
  sub_100779F60();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v66);
  CGFloat v54 = a2;
  CGFloat v55 = a3;
  v75.origin.x = a2;
  v75.origin.y = a3;
  v75.size.width = v23;
  v75.size.height = v26;
  CGRectGetHeight(v75);
  sub_10000FA3C((void *)v5 + 20, *((void *)v5 + 23));
  sub_100779F70();
  CGFloat v33 = v32;
  double v35 = v34;
  int v36 = v5[2];
  sub_10074777C(v6, (uint64_t)v66);
  CGFloat v53 = v26;
  if (v36 == 1)
  {
    sub_10055A714((uint64_t)v66);
    CGFloat v37 = rect;
    goto LABEL_19;
  }
  char v38 = v66[0];
  sub_10055A714((uint64_t)v66);
  CGFloat v37 = rect;
  if ((v38 & 1) == 0)
  {
LABEL_19:
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    CGFloat v44 = v57;
    double MaxY = CGRectGetMaxY(*(CGRect *)(&v37 - 3));
    id v46 = (double *)(v6 + 24);
    if (!*(unsigned char *)v6) {
      id v46 = (double *)(v6 + 56);
    }
    double v41 = MaxY - *v46 - v35;
    CGFloat v39 = *(double *)(v6 + 16);
    double v40 = *(double *)(v6 + 48);
    if (*(unsigned char *)v6) {
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  CGFloat v39 = *(double *)(v6 + 16);
  double v40 = *(double *)(v6 + 48);
  if (*(unsigned char *)v6)
  {
    double v41 = *(double *)(v6 + 8);
LABEL_22:
    int v47 = 1;
    goto LABEL_25;
  }
  double v41 = *(double *)(v6 + 40);
LABEL_24:
  int v47 = 0;
  CGFloat v39 = v40;
LABEL_25:
  sub_10000FA3C((void *)(v6 + 160), *(void *)(v6 + 184));
  sub_10077C680();
  sub_100779F60();
  if (v47)
  {
    type metadata accessor for TodayListCardLockupContainer();
    sub_100282948(*(void *)(v6 + 280), a1);
  }
  v76.origin.x = 0.0;
  v76.origin.y = 0.0;
  v76.size.height = rect;
  v76.size.width = v57;
  CGRectGetMaxY(v76);
  v77.origin.x = v39;
  v77.origin.y = v41;
  v77.size.width = v33;
  v77.size.height = v35;
  CGRectGetMaxY(v77);
  v78.origin.x = v54;
  v78.origin.y = v55;
  v78.size.width = v27;
  v78.size.height = v53;
  CGRectGetWidth(v78);
  sub_10000FA3C((void *)(v6 + 240), *(void *)(v6 + 264));
  sub_100779130();
  sub_10000FA3C(v64, v65);
  sub_10077C680();
  sub_100779F60();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
  uint64_t v48 = v6 + 328;
  sub_10016EE54(v6 + 328, (uint64_t)&v62);
  if (v63)
  {
    sub_10000F8DC(&v62, (uint64_t)v64);
    sub_10016EE54(v6 + 288, (uint64_t)&v60);
    if (v61)
    {
      sub_10000F8DC(&v60, (uint64_t)&v62);
      sub_10016EE54(v6 + 368, (uint64_t)&v58);
      if (v59)
      {
        sub_10000F8DC(&v58, (uint64_t)&v60);
        sub_10000FA3C(v64, v65);
        sub_100779F70();
        v79.origin.x = v54;
        v79.origin.y = v55;
        v79.size.width = v27;
        v79.size.height = v53;
        CGRectGetHeight(v79);
        v80.origin.x = v17;
        v80.origin.y = v51;
        v80.size.width = v20;
        v80.size.height = v52;
        CGRectGetMaxY(v80);
        v81.origin.x = v17;
        v81.origin.y = v51;
        v81.size.width = v20;
        v81.size.height = v52;
        CGRectGetMaxY(v81);
        sub_10000FA3C(&v62, v63);
        sub_10077C680();
        sub_100779F60();
        if (qword_10094A160 != -1) {
          swift_once();
        }
        sub_10000FA3C(v64, v65);
        sub_100779F60();
        sub_10000FA3C(&v60, v61);
        sub_10077C680();
        sub_100779F60();
        _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)&v60);
        _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)&v62);
        return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
      }
      sub_10016EFEC((uint64_t)&v58);
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)&v62);
    }
    else
    {
      sub_10016EFEC((uint64_t)&v60);
    }
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
  }
  else
  {
    sub_10016EFEC((uint64_t)&v62);
  }
  uint64_t v49 = v6 + 288;
  sub_10016EE54(v49, (uint64_t)v64);
  if (v65)
  {
    sub_10000FA3C(v64, v65);
    sub_100779F60();
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
  }
  else
  {
    sub_10016EFEC((uint64_t)v64);
  }
  sub_10016EE54(v48, (uint64_t)v64);
  if (v65)
  {
    sub_10000FA3C(v64, v65);
    sub_100779F60();
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
  }
  else
  {
    sub_10016EFEC((uint64_t)v64);
  }
  sub_10016EE54(v49, (uint64_t)v64);
  if (v65)
  {
    sub_10000FA3C(v64, v65);
    sub_100779F60();
    return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v64);
  }
  return sub_10016EFEC((uint64_t)v64);
}

uint64_t sub_10074777C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1007477B4()
{
  qword_1009AE528 = 0x4046800000000000;
}

uint64_t destroy for ExtraWideListTodayCardLayout(void *a1)
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 10));
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 15));
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 20));
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 25));
  uint64_t result = _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 30));
  if (a1[39]) {
    uint64_t result = _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 36));
  }
  if (a1[44]) {
    uint64_t result = _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 41));
  }
  if (a1[49])
  {
    return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)(a1 + 46));
  }
  return result;
}

uint64_t initializeWithCopy for ExtraWideListTodayCardLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  long long v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  long long v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  int v12 = (_OWORD *)(a1 + 288);
  v13 = (_OWORD *)(a2 + 288);
  uint64_t v14 = *(void *)(a2 + 312);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 320);
    *(void *)(a1 + 312) = v14;
    *(void *)(a1 + 320) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 304);
    *int v12 = *v13;
    *(_OWORD *)(a1 + 304) = v16;
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
  }
  CGFloat v17 = (_OWORD *)(a1 + 328);
  uint64_t v18 = (_OWORD *)(a2 + 328);
  uint64_t v19 = *(void *)(a2 + 352);
  if (v19)
  {
    uint64_t v20 = *(void *)(a2 + 360);
    *(void *)(a1 + 352) = v19;
    *(void *)(a1 + 360) = v20;
    (**(void (***)(_OWORD *, _OWORD *))(v19 - 8))(v17, v18);
  }
  else
  {
    long long v21 = *(_OWORD *)(a2 + 344);
    *CGFloat v17 = *v18;
    *(_OWORD *)(a1 + 344) = v21;
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
  }
  double v22 = (_OWORD *)(a1 + 368);
  CGFloat v23 = (_OWORD *)(a2 + 368);
  uint64_t v24 = *(void *)(a2 + 392);
  if (v24)
  {
    uint64_t v25 = *(void *)(a2 + 400);
    *(void *)(a1 + 392) = v24;
    *(void *)(a1 + 400) = v25;
    (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
  }
  else
  {
    long long v26 = *(_OWORD *)(a2 + 384);
    *double v22 = *v23;
    *(_OWORD *)(a1 + 384) = v26;
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
  }
  return a1;
}

uint64_t assignWithCopy for ExtraWideListTodayCardLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  sub_100032D7C((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  sub_100032D7C((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  sub_100032D7C((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  sub_100032D7C((uint64_t *)(a1 + 200), (uint64_t *)(a2 + 200));
  sub_100032D7C((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  uint64_t v4 = *(void *)(a2 + 312);
  if (*(void *)(a1 + 312))
  {
    if (v4)
    {
      sub_100032D7C((uint64_t *)(a1 + 288), (uint64_t *)(a2 + 288));
      goto LABEL_8;
    }
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 288);
  }
  else if (v4)
  {
    *(void *)(a1 + 312) = v4;
    *(void *)(a1 + 320) = *(void *)(a2 + 320);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 288, a2 + 288);
    goto LABEL_8;
  }
  long long v5 = *(_OWORD *)(a2 + 288);
  long long v6 = *(_OWORD *)(a2 + 304);
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  *(_OWORD *)(a1 + 288) = v5;
  *(_OWORD *)(a1 + 304) = v6;
LABEL_8:
  uint64_t v7 = *(void *)(a2 + 352);
  if (*(void *)(a1 + 352))
  {
    if (v7)
    {
      sub_100032D7C((uint64_t *)(a1 + 328), (uint64_t *)(a2 + 328));
      goto LABEL_15;
    }
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 328);
  }
  else if (v7)
  {
    *(void *)(a1 + 352) = v7;
    *(void *)(a1 + 360) = *(void *)(a2 + 360);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 328, a2 + 328);
    goto LABEL_15;
  }
  long long v8 = *(_OWORD *)(a2 + 328);
  long long v9 = *(_OWORD *)(a2 + 344);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(_OWORD *)(a1 + 328) = v8;
  *(_OWORD *)(a1 + 344) = v9;
LABEL_15:
  uint64_t v10 = *(void *)(a2 + 392);
  if (!*(void *)(a1 + 392))
  {
    if (v10)
    {
      *(void *)(a1 + 392) = v10;
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 368, a2 + 368);
      return a1;
    }
LABEL_21:
    long long v11 = *(_OWORD *)(a2 + 368);
    long long v12 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 368) = v11;
    *(_OWORD *)(a1 + 384) = v12;
    return a1;
  }
  if (!v10)
  {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 368);
    goto LABEL_21;
  }
  sub_100032D7C((uint64_t *)(a1 + 368), (uint64_t *)(a2 + 368));
  return a1;
}

void *initializeWithTake for ExtraWideListTodayCardLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x198uLL);
}

uint64_t assignWithTake for ExtraWideListTodayCardLayout(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 80);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 160);
  long long v5 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v5;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 240);
  long long v6 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v6;
  uint64_t v7 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v7;
  if (*(void *)(a1 + 312)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 288);
  }
  long long v8 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v8;
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  if (*(void *)(a1 + 352)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 328);
  }
  long long v9 = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 328) = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 344) = v9;
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  if (*(void *)(a1 + 392)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 368);
  }
  long long v10 = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 368) = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 384) = v10;
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExtraWideListTodayCardLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 408)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtraWideListTodayCardLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
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
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 408) = 1;
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
      *(void *)(result + 104) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 408) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtraWideListTodayCardLayout()
{
  return &type metadata for ExtraWideListTodayCardLayout;
}

double sub_100747FE4@<D0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 1);
  char v3 = *(unsigned char *)(v1 + 2);
  double result = *(double *)(v1 + 72);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(unsigned char *)(a1 + 1) = v2;
  *(unsigned char *)(a1 + 2) = v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(v1 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v1 + 56);
  *(double *)(a1 + 72) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ExtraWideListTodayCardLayout.Metrics(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[80]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ExtraWideListTodayCardLayout.Metrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(unsigned char *)double result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtraWideListTodayCardLayout.Metrics()
{
  return &type metadata for ExtraWideListTodayCardLayout.Metrics;
}

char *sub_1007480E4(unint64_t a1)
{
  uint64_t v67 = sub_100778570();
  uint64_t v3 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  v66 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_10077B9F0();
  int v5 = *(char **)(v53 - 8);
  __chkstk_darwin(v53);
  CGFloat v52 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100778450();
  long long v8 = *(void (***)(char *, uint64_t))(v7 - 8);
  __chkstk_darwin(v7);
  long long v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10076A040();
  uint64_t v14 = *(void *)(v68 - 8);
  __chkstk_darwin(v68);
  uint64_t v69 = v3;
  CGRect v70 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1 >> 62;
  v64 = v8;
  if (a1 >> 62)
  {
LABEL_42:
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10077D140();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  sub_1007493F4(v17);
  uint64_t v18 = &v1[OBJC_IVAR____TtC20ProductPageExtension20AnnotationImagesView_imageViews];
  swift_beginAccess();
  uint64_t v19 = *(char **)v18;
  if (v16)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    double result = (char *)sub_10077D140();
    uint64_t v20 = result;
    if (result) {
      goto LABEL_5;
    }
LABEL_34:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  uint64_t v20 = *(char **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  double result = (char *)swift_bridgeObjectRetain();
  if (!v20) {
    goto LABEL_34;
  }
LABEL_5:
  unint64_t v62 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
    goto LABEL_45;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return result;
  }
  uint64_t v16 = *(void *)(a1 + 32);
  swift_retain();
  if ((unint64_t)v19 >> 62) {
    goto LABEL_46;
  }
LABEL_8:
  uint64_t v22 = *(void *)(((unint64_t)v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v22)
  {
LABEL_47:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_48;
  }
LABEL_9:
  double v41 = v1;
  CGFloat v23 = v19;
  uint64_t v19 = 0;
  unint64_t v65 = (unint64_t)v23 & 0xC000000000000001;
  uint64_t v51 = (unint64_t)v23 & 0xFFFFFFFFFFFFFF8;
  CGFloat v54 = v23;
  v50 = v23 + 32;
  uint64_t v63 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  ++v64;
  uint64_t v61 = (void (**)(char *, char *, uint64_t))(v14 + 32);
  int v47 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  id v46 = (void (**)(char *, uint64_t))(v5 + 8);
  long long v60 = (void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v59 = (void (**)(char *, uint64_t))(v69 + 8);
  uint64_t v43 = a1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v42 = a1 + 40;
  long long v58 = v20 - 1;
  long long v45 = xmmword_10078DE60;
  unint64_t v44 = 0x80000001007F3780;
  uint64_t v14 = v68;
  uint64_t v56 = v22;
  unint64_t v49 = a1;
  uint64_t v48 = v7;
  CGFloat v57 = v10;
  CGFloat v55 = v13;
  while (1)
  {
    if (v65)
    {
      uint64_t v24 = (char *)sub_10077D030();
    }
    else
    {
      if ((unint64_t)v19 >= *(void *)(v51 + 16))
      {
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        uint64_t v16 = sub_10077D030();
        if (!((unint64_t)v19 >> 62)) {
          goto LABEL_8;
        }
LABEL_46:
        CGFloat v57 = v10;
        swift_bridgeObjectRetain();
        long long v10 = v57;
        uint64_t v56 = sub_10077D140();
        swift_bridgeObjectRelease();
        uint64_t v22 = v56;
        if (!v56) {
          goto LABEL_47;
        }
        goto LABEL_9;
      }
      uint64_t v24 = (char *)*(id *)&v50[8 * (void)v19];
    }
    int v5 = v24;
    sub_100778690();
    sub_100778440();
    (*v64)(v10, v7);
    sub_10076A030();
    swift_bridgeObjectRelease();
    if ((*v63)(v13, 1, v14) == 1)
    {
      sub_10000FA80((uint64_t)v13, (uint64_t *)&unk_10094FEE0);
LABEL_37:
      swift_release();

      swift_bridgeObjectRelease();
      return (char *)swift_bridgeObjectRelease();
    }
    (*v61)(v70, v13, v14);
    uint64_t v25 = sub_10076A010();
    if (!v26)
    {
      (*v60)(v70, v68);
      goto LABEL_37;
    }
    uint64_t v27 = v25;
    uint64_t v28 = v26;
    if ((sub_1007784A0() & 1) == 0)
    {
      (*v60)(v70, v68);
      swift_release();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (char *)swift_bridgeObjectRelease();
    }
    uint64_t v69 = v16;
    uint64_t v29 = qword_100949258;
    swift_bridgeObjectRetain();
    if (v29 != -1) {
      swift_once();
    }
    id v30 = (id)qword_100968DD8;
    NSString v31 = sub_10077BC80();
    swift_bridgeObjectRelease();
    id v32 = [self imageNamed:v31 inBundle:v30 withConfiguration:0];

    if (!v32)
    {
      if (qword_100949CE8 != -1) {
        swift_once();
      }
      uint64_t v33 = v53;
      uint64_t v34 = sub_10000D2C4(v53, (uint64_t)qword_1009AD5C8);
      double v35 = v52;
      (*v47)(v52, v34, v33);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = v45;
      sub_10077AF20();
      v71[3] = &type metadata for String;
      v71[0] = v27;
      v71[1] = v28;
      swift_bridgeObjectRetain();
      sub_10077AFD0();
      sub_10000FA80((uint64_t)v71, &qword_10094BAD0);
      sub_10077B8B0();
      swift_bridgeObjectRelease();
      (*v46)(v35, v33);
      id v32 = [objc_allocWithZone((Class)UIImage) init];
      a1 = v49;
      uint64_t v7 = v48;
    }
    long long v10 = (char *)v7;
    swift_bridgeObjectRelease();
    uint64_t v14 = v68;
    (*v60)(v70, v68);
    [v32 size];
    if (qword_10094A168 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_100772B80();
    sub_10000D2C4(v36, (uint64_t)qword_1009AE530);
    sub_100772B60();
    CGFloat v37 = v66;
    uint64_t v7 = v69;
    sub_100778580();
    sub_100778550();
    (*v59)(v37, v67);
    sub_10077C740();
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v38, v39);
    id v40 = v32;
    uint64_t v1 = (char *)[v5 layer];
    [v1 removeAllAnimations];

    [v5 setImage:v40];
    swift_release();

    if (v58 == v19) {
      break;
    }
    uint64_t v20 = v19 + 1;
    if (v62)
    {
      uint64_t v16 = sub_10077D030();
      v13 = v55;
      uint64_t v7 = (uint64_t)v10;
    }
    else
    {
      v13 = v55;
      if ((unint64_t)v20 >= *(void *)(v43 + 16)) {
        goto LABEL_44;
      }
      uint64_t v7 = (uint64_t)v10;
      uint64_t v16 = *(void *)(v42 + 8 * (void)v19);
      swift_retain();
    }
    long long v10 = v57;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    if ((char *)v56 == ++v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_40;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_40:
  uint64_t v1 = v41;
LABEL_48:
  objc_msgSend(v1, "invalidateIntrinsicContentSize", v41);
  return (char *)[v1 setNeedsLayout];
}

unint64_t sub_100748C70()
{
  if (!(*v0 >> 62))
  {
    if (*(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10077D140();
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
LABEL_3:
  unint64_t result = sub_100749DCC();
  if (!result)
  {
    if (*v0 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_10077D140();
      swift_bridgeObjectRelease();
      unint64_t result = v4 - 1;
      if (!__OFSUB__(v4, 1)) {
        return sub_100748D3C(result);
      }
    }
    else
    {
      uint64_t v2 = *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t result = v2 - 1;
      if (!__OFSUB__(v2, 1)) {
        return sub_100748D3C(result);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100748D3C(unint64_t a1)
{
  uint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t v3 = sub_1004BF938(v3);
    uint64_t *v1 = v3;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
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
      *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
      sub_10077BEE0();
      return v10;
    }
  }
  uint64_t result = sub_10077D1A0();
  __break(1u);
  return result;
}

uint64_t sub_100748E28(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_1004BF950(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      unint64_t v7 = &v3[3 * a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 7, 24 * v6);
      v3[2] = v5;
      uint64_t *v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_10077D1A0();
  __break(1u);
  return result;
}

uint64_t sub_100749098()
{
  uint64_t v0 = sub_100772B80();
  sub_1000104E8(v0, qword_1009AE530);
  sub_10000D2C4(v0, (uint64_t)qword_1009AE530);
  return sub_100772B70();
}

id sub_100749250(void *a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_10000D280(&qword_100972C28);
  __chkstk_darwin(v5);
  *(void *)&v2[OBJC_IVAR____TtC20ProductPageExtension20AnnotationImagesView_imageViews] = _swiftEmptyArrayStorage;
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  uint64_t v6 = v2;
  sub_100779320();
  sub_100749D4C();
  sub_10077A000();

  v14.receiver = v6;
  v14.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v14, "initWithCoder:", a1);
  id v8 = v7;
  if (v7)
  {
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    id v12 = v7;
    objc_msgSend(v12, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  }
  return v8;
}

uint64_t sub_1007493F4(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC20ProductPageExtension20AnnotationImagesView_imageViews];
  uint64_t result = swift_beginAccess();
  if (*(void *)v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10077D140();
    uint64_t result = swift_bridgeObjectRelease();
    if (v6 == a1) {
      return result;
    }
  }
  else if (*(void *)((*(void *)v3 & 0xFFFFFFFFFFFFFF8) + 0x10) == a1)
  {
    return result;
  }
  if (*(void *)v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10077D140();
    swift_bridgeObjectRelease();
    if (v7 > a1) {
      goto LABEL_5;
    }
  }
  else if (*(void *)((*(void *)v3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a1)
  {
LABEL_5:
    swift_beginAccess();
    uint64_t v5 = (void *)sub_100748C70();
    uint64_t result = swift_endAccess();
    if (!v5)
    {
      __break(1u);
      return result;
    }
    [v5 removeFromSuperview];
    swift_beginAccess();
    sub_10000D280(&qword_100972C60);
    sub_100779FF0();
    swift_endAccess();

    return sub_1007493F4(a1);
  }
  swift_beginAccess();
  sub_10000D280(&qword_100972C60);
  sub_100779FD0();
  swift_endAccess();
  swift_beginAccess();
  id v8 = v9;
  sub_10077BEB0();
  if (*(void *)((*(void *)v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v3 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_10077BEF0();
  sub_10077BF70();
  sub_10077BEE0();
  swift_endAccess();
  [v1 addSubview:v8];

  return sub_1007493F4(a1);
}

uint64_t sub_100749824()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v17 = sub_100779050();
  uint64_t v2 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100772B80();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = sub_100772B90();
  uint64_t v9 = *(void *)(v16[0] - 8);
  *(void *)&double v10 = __chkstk_darwin(v16[0]).n128_u64[0];
  id v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18.receiver = v0;
  v18.super_class = ObjectType;
  v16[1] = ObjectType;
  objc_msgSendSuper2(&v18, "layoutSubviews", v10);
  swift_beginAccess();
  unint64_t v13 = swift_bridgeObjectRetain();
  sub_1004634FC(v13);
  swift_bridgeObjectRelease();
  if (qword_10094A168 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10000D2C4(v5, (uint64_t)qword_1009AE530);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
  sub_100772B50();
  sub_100770A80();
  sub_100772B40();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v17);
  return (*(uint64_t (**)(char *, void))(v9 + 8))(v12, v16[0]);
}

id sub_100749B2C@<X0>(void *a1@<X8>)
{
  type metadata accessor for AnnotationImagesView.AnnotationImageView();
  id result = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  *a1 = result;
  return result;
}

uint64_t sub_100749BF0()
{
  return type metadata accessor for AnnotationImagesView();
}

uint64_t type metadata accessor for AnnotationImagesView()
{
  uint64_t result = qword_100972C10;
  if (!qword_100972C10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100749C44()
{
  sub_100749CE4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100749CE4()
{
  if (!qword_100972C20)
  {
    sub_10000F894(&qword_100972C28);
    sub_100749D4C();
    unint64_t v0 = sub_10077A010();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100972C20);
    }
  }
}

unint64_t sub_100749D4C()
{
  unint64_t result = qword_100972C30;
  if (!qword_100972C30)
  {
    sub_10000F894(&qword_100972C28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100972C30);
  }
  return result;
}

uint64_t type metadata accessor for AnnotationImagesView.AnnotationImageView()
{
  return self;
}

uint64_t sub_100749DCC()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v0 = v1;
  if (!result || v1 < 0 || (v1 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_1004BF938(v1);
    uint64_t v1 = result;
    *unint64_t v0 = result;
  }
  uint64_t v3 = v1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    uint64_t v6 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 8 * v5 + 0x20);
    *(void *)(v3 + 16) = v5;
    sub_10077BEE0();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100749E3C(unint64_t a1, uint64_t a2)
{
  uint64_t v49 = sub_100778570();
  uint64_t v4 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_10077B9F0();
  uint64_t v6 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  long long v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100778450();
  uint64_t v8 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  double v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_10076A040();
  uint64_t v14 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v50 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10077D140();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  objc_super v18 = _swiftEmptyArrayStorage;
  if (!v17) {
    goto LABEL_27;
  }
  long long v60 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10077D080();
  if (v17 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v57 = v17;
  CGFloat v54 = v16;
  uint64_t v40 = a2;
  uint64_t v20 = 0;
  CGFloat v55 = (void (**)(char *, uint64_t))(v8 + 8);
  unint64_t v56 = v50 & 0xC000000000000001;
  long long v21 = (unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  CGFloat v52 = (void (**)(char *, uint64_t))(v14 + 8);
  uint64_t v53 = (void (**)(char *, char *, uint64_t))(v14 + 32);
  unint64_t v44 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v43 = (void (**)(char *, uint64_t))(v6 + 8);
  int v47 = (void (**)(char *, uint64_t))(v4 + 8);
  long long v42 = xmmword_10078DE60;
  unint64_t v41 = 0x80000001007F3780;
  uint64_t v22 = v51;
  do
  {
    if (v56) {
      sub_10077D030();
    }
    else {
      swift_retain();
    }
    sub_100778690();
    sub_100778440();
    (*v55)(v10, v58);
    sub_10076A030();
    swift_bridgeObjectRelease();
    if ((*v21)(v13, 1, v22) == 1)
    {
      sub_10000FA80((uint64_t)v13, (uint64_t *)&unk_10094FEE0);
LABEL_7:
      sub_100779C50();
      swift_allocObject();
      sub_100779C20();
      swift_release();
      goto LABEL_8;
    }
    CGFloat v23 = v54;
    (*v53)(v54, v13, v22);
    uint64_t v24 = sub_10076A010();
    if (!v25)
    {
      (*v52)(v23, v22);
      goto LABEL_7;
    }
    uint64_t v26 = v24;
    uint64_t v27 = v25;
    if ((sub_1007784A0() & 1) == 0)
    {
      uint64_t v38 = v51;
      (*v52)(v54, v51);
      uint64_t v22 = v38;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    uint64_t v28 = qword_100949258;
    swift_bridgeObjectRetain();
    if (v28 != -1) {
      swift_once();
    }
    id v29 = (id)qword_100968DD8;
    NSString v30 = sub_10077BC80();
    swift_bridgeObjectRelease();
    id v31 = objc_msgSend(self, "imageNamed:inBundle:withConfiguration:", v30, v29, 0, v40, v41);

    if (!v31)
    {
      if (qword_100949CE8 != -1) {
        swift_once();
      }
      uint64_t v32 = v46;
      uint64_t v33 = sub_10000D2C4(v46, (uint64_t)qword_1009AD5C8);
      (*v44)(v45, v33, v32);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = v42;
      sub_10077AF20();
      v59[3] = &type metadata for String;
      v59[0] = v26;
      v59[1] = v27;
      swift_bridgeObjectRetain();
      sub_10077AFD0();
      sub_10000FA80((uint64_t)v59, &qword_10094BAD0);
      uint64_t v34 = v46;
      double v35 = v45;
      sub_10077B8B0();
      swift_bridgeObjectRelease();
      (*v43)(v35, v34);
      id v31 = [objc_allocWithZone((Class)UIImage) init];
    }
    swift_bridgeObjectRelease();
    uint64_t v22 = v51;
    (*v52)(v54, v51);
    [v31 size];
    if (qword_10094A168 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_100772B80();
    sub_10000D2C4(v36, (uint64_t)qword_1009AE530);
    sub_100772B60();
    CGFloat v37 = v48;
    sub_100778580();
    sub_100778550();
    (*v47)(v37, v49);
    sub_10077C740();
    sub_100779C50();
    swift_allocObject();
    sub_100779C20();
    swift_release();

LABEL_8:
    ++v20;
    sub_10077D060();
    sub_10077D090();
    sub_10077D0A0();
    sub_10077D070();
  }
  while (v57 != v20);
  objc_super v18 = v60;
LABEL_27:
  sub_100463270((unint64_t)v18);
  swift_bridgeObjectRelease();
  if (qword_10094A168 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_100772B80();
  sub_10000D2C4(v39, (uint64_t)qword_1009AE530);
  sub_100772B30();
  return swift_bridgeObjectRelease();
}

double sub_10074A79C()
{
  double result = 10.0;
  xmmword_1009AE550 = xmmword_1007B4690;
  *(_OWORD *)&qword_1009AE560 = xmmword_1007B4690;
  return result;
}

double sub_10074A7B4()
{
  double result = 15.0;
  xmmword_1009AE570 = xmmword_1007BBDA0;
  *(_OWORD *)&qword_1009AE580 = xmmword_1007BBDA0;
  return result;
}

uint64_t sub_10074A7CC()
{
  uint64_t v0 = sub_100779230();
  sub_1000104E8(v0, qword_100972C68);
  uint64_t v1 = sub_10000D2C4(v0, (uint64_t)qword_100972C68);
  if (qword_1009494D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D2C4(v0, (uint64_t)qword_1009ABF78);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

char *sub_10074A894(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v11 = sub_10000D280(&qword_100950D80);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v47 - v15;
  v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_hasMoreButton] = 1;
  v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_alwaysShowsMoreButtonWhenCollapsed] = 0;
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines] = 3;
  v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed] = 1;
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString] = 0;
  uint64_t v17 = &v5[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreTapHandler];
  *uint64_t v17 = 0;
  v17[1] = 0;
  uint64_t v18 = qword_1009494D8;
  uint64_t v19 = v5;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100779230();
  uint64_t v21 = sub_10000D2C4(v20, (uint64_t)qword_1009ABF78);
  *(void *)&v19[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton] = sub_10042954C(v21, a1);
  sub_10076EEF0();
  uint64_t v22 = (void *)sub_10076EED0();
  *(void *)&v19[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel] = v22;
  id v23 = v22;
  sub_10076EEA0();

  uint64_t v24 = (objc_class *)type metadata accessor for ExpandableTextView();
  v47.receiver = v19;
  v47.super_class = v24;
  id v25 = objc_msgSendSuper2(&v47, "initWithFrame:", a2, a3, a4, a5);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v29 = (char *)v25;
  objc_msgSend(v29, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  [v29 setUserInteractionEnabled:1];
  [v29 setBackgroundColor:a1];
  uint64_t v30 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel;
  id v31 = *(void **)&v29[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel];
  [v31 setNumberOfLines:*(void *)&v29[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines]];
  [v31 setLineBreakMode:0];
  [v31 setTextAlignment:4];
  if (qword_10094A180 != -1) {
    swift_once();
  }
  uint64_t v32 = sub_10000D2C4(v20, (uint64_t)qword_100972C68);
  uint64_t v33 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v16, v32, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v16, 0, 1, v20);
  sub_100019738((uint64_t)v16, (uint64_t)v13, &qword_100950D80);
  sub_10076EE30();
  sub_10000FA80((uint64_t)v16, &qword_100950D80);
  [v29 addSubview:*(void *)&v29[v30]];
  uint64_t v34 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton;
  id v35 = [*(id *)&v29[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton] traitCollection];
  id v36 = [v35 preferredContentSizeCategory];

  char v37 = sub_10077C560();
  uint64_t v38 = *(void **)&v29[v34];
  [v38 addTarget:v29 action:"moreFrom:" forControlEvents:64];
  if (v37)
  {
    uint64_t v39 = qword_10094A178;
    id v40 = v38;
    if (v39 == -1) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v41 = qword_10094A170;
  id v42 = v38;
  if (v41 != -1) {
LABEL_10:
  }
    swift_once();
LABEL_9:
  sub_100770A30();

  uint64_t v43 = *(void **)&v29[v34];
  unint64_t v44 = v29;
  id v45 = v43;
  [v44 addSubview:v45];

  return v44;
}

void sub_10074AEB4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
  id v7 = [v6 text];
  if (!v7)
  {
    if (!a2) {
      return;
    }
LABEL_11:
    uint64_t v14 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v14 = a1 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      sub_100771410();
      swift_bridgeObjectRetain();
      sub_1007713C0();
      sub_1007713B0();
      uint64_t v15 = sub_100771430();
      char v16 = 0;
    }
    else
    {
      char v16 = 0;
      uint64_t v15 = 0;
    }
    goto LABEL_19;
  }
  uint64_t v8 = v7;
  uint64_t v9 = sub_10077BCB0();
  uint64_t v11 = v10;

  if (a2)
  {
    if (v11)
    {
      if (v9 == a1 && v11 == a2)
      {
        swift_bridgeObjectRelease();
LABEL_24:
        swift_bridgeObjectRelease();
        return;
      }
      char v13 = sub_10077D230();
      swift_bridgeObjectRelease();
      if (v13) {
        goto LABEL_24;
      }
    }
    goto LABEL_11;
  }
  if (!v11) {
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = 0;
  char v16 = 1;
LABEL_19:
  uint64_t v17 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString;
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString);
  *(void *)(v3 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString) = v15;

  uint64_t v19 = *(void **)(v3 + v17);
  if (v19)
  {
    id v20 = v19;
    sub_1007713F0();

    swift_bridgeObjectRelease();
LABEL_27:
    NSString v21 = sub_10077BC80();
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  if ((v16 & 1) == 0) {
    goto LABEL_27;
  }
  NSString v21 = 0;
LABEL_28:
  [v6 setText:v21];

  sub_10074B870();
}

id sub_10074B20C()
{
  uint64_t v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for ExpandableTextView();
  objc_msgSendSuper2(&v18, "layoutSubviews");
  sub_100770A80();
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel];
  objc_msgSend(v10, "sizeThatFits:", v6, v8);
  double v12 = v11;
  v19.origin.x = v3;
  v19.origin.y = v5;
  v19.size.width = v7;
  v19.size.height = v9;
  objc_msgSend(v10, "setFrame:", v3, v5, CGRectGetWidth(v19), v12);
  char v13 = *(void **)&v1[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton];
  id result = [v13 isHidden];
  if ((result & 1) == 0)
  {
    id result = [v10 numberOfLines];
    if (__OFSUB__(result, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString];
      if (v15)
      {
        id v16 = v15;
        [v10 numberOfLines];
        [v10 lineBreakMode];
        uint64_t v17 = sub_1007713D0();
      }
      else
      {
        uint64_t v17 = 0;
      }
      objc_msgSend(v13, "sizeThatFits:", v7, v9);
      v20.origin.x = v3;
      v20.origin.y = v5;
      v20.size.width = v7;
      v20.size.height = v9;
      CGRectGetMaxX(v20);
      v21.origin.x = v3;
      v21.origin.y = v5;
      v21.size.width = v7;
      v21.size.height = v9;
      CGRectGetMaxY(v21);
      sub_100770A80();
      sub_10077C700();
      objc_msgSend(v13, "setFrame:");
      *((unsigned char *)v13 + qword_100964560) = v17 == 1;
      return sub_1004CE334();
    }
  }
  return result;
}

void sub_10074B528(void *a1, char a2, int a3, uint64_t a4)
{
  uint64_t v9 = sub_10000D280(&qword_100960768);
  __chkstk_darwin(v9 - 8);
  double v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100778C30();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v26 - v16;
  if (a1)
  {
    int v28 = a3;
    uint64_t v27 = v15;
    uint64_t v29 = a4;
    uint64_t v18 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed;
    int v19 = v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed];
    v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed] = a2 & 1;
    if (a2)
    {
      uint64_t v20 = *(void *)&v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines];
      CGRect v21 = *(void **)&v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel];
      id v22 = a1;
      [v21 setNumberOfLines:v20];
    }
    else
    {
      CGRect v21 = *(void **)&v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel];
      id v23 = a1;
      [v21 setNumberOfLines:0];
    }
    if (v19 != v4[v18]) {
      sub_10074B870();
    }
    id v24 = a1;
    sub_10074CCF8(a1);

    v4[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_alwaysShowsMoreButtonWhenCollapsed] = v28 & 1;
    sub_100019738(v29, (uint64_t)v11, &qword_100960768);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_10000FA80((uint64_t)v11, &qword_100960768);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, v11, v12);
      uint64_t v25 = v27;
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v27, v17, v12);
      [v21 setTextAlignment:sub_1000A1904(v25)];
      (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
    }
    [v4 setNeedsLayout];
  }
  else
  {
    sub_10074AEB4(0, 0);
    [v4 setNeedsLayout];
  }
}

id sub_10074B870()
{
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel] attributedText];
  if (v1)
  {
    double v2 = v1;
    if (v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_hasMoreButton] == 1
      && v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed] == 1)
    {
      if (v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_alwaysShowsMoreButtonWhenCollapsed] == 1)
      {
        [*(id *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton] setHidden:0];
      }
      else
      {
        id v4 = [v1 length];
        double v5 = *(void **)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton];
        if (v4)
        {
          double left = UIEdgeInsetsZero.left;
          double bottom = UIEdgeInsetsZero.bottom;
          double right = UIEdgeInsetsZero.right;
          uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines];
          type metadata accessor for ExpandableTextView();
          sub_100770A80();
          double v11 = v10;
          sub_10074C73C(v2, 0, v9, v0, UIEdgeInsetsZero.top, left, bottom, right, v12, 1.79769313e308);
          [v5 setHidden:v11 >= v13];
        }
        else
        {
          [*(id *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton] setHidden:1];
        }
      }

      goto LABEL_8;
    }
  }
  [*(id *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreButton] setHidden:1];
LABEL_8:

  return [v0 setNeedsLayout];
}

id sub_10074BB6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExpandableTextView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExpandableTextView()
{
  return self;
}

id sub_10074BC4C()
{
  return [*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) numberOfLines];
}

id sub_10074BC68(uint64_t a1)
{
  return [*(id *)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) setNumberOfLines:a1];
}

id (*sub_10074BC88(void *a1))(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
  a1[1] = v3;
  *a1 = [v3 numberOfLines];
  return sub_10074BCE8;
}

id sub_10074BCE8(uint64_t a1, uint64_t a2)
{
  return sub_10074BD9C(a1, a2, (SEL *)&selRef_setNumberOfLines_);
}

id sub_10074BCF4()
{
  return [*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) lineBreakMode];
}

id sub_10074BD10(uint64_t a1)
{
  return [*(id *)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) setLineBreakMode:a1];
}

id (*sub_10074BD30(void *a1))(uint64_t a1, uint64_t a2)
{
  double v3 = *(void **)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
  a1[1] = v3;
  *a1 = [v3 lineBreakMode];
  return sub_10074BD90;
}

id sub_10074BD90(uint64_t a1, uint64_t a2)
{
  return sub_10074BD9C(a1, a2, (SEL *)&selRef_setLineBreakMode_);
}

id sub_10074BD9C(uint64_t a1, uint64_t a2, SEL *a3)
{
  return objc_msgSend(*(id *)(a1 + 8), *a3, *(void *)a1);
}

id sub_10074BDB0()
{
  id v1 = [*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) font];

  return v1;
}

void sub_10074BDF4(void *a1)
{
  [*(id *)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) setFont:a1];
}

void (*sub_10074BE48(void *a1))(id *a1)
{
  double v3 = *(void **)(*v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
  a1[1] = v3;
  *a1 = [v3 font];
  return sub_10074BEB0;
}

void sub_10074BEB0(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], "setFont:");
}

id sub_10074BEF8()
{
  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel), "jet_isTextExtraTall");
}

id sub_10074BF28()
{
  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel), "jet_languageAwareOutsets");
}

id sub_10074BF44()
{
  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel), "jet_textLength");
}

uint64_t sub_10074BF60(uint64_t a1)
{
  swift_getObjectType();
  sub_100019738(a1, (uint64_t)v11, &qword_10094BAD0);
  if (!v12)
  {
    sub_10000FA80((uint64_t)v11, &qword_10094BAD0);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    char v8 = 0;
    return v8 & 1;
  }
  if (*(unsigned __int8 *)(v1
                          + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_isCollapsed) != v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_isCollapsed]
    || (double v3 = (double *)(v1
                      + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_layoutMargins),
        id v4 = (double *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_layoutMargins],
        *(double *)(v1
                  + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_layoutMargins) != *(double *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_layoutMargins])
    || v3[1] != v4[1]
    || v3[2] != v4[2]
    || v3[3] != v4[3]
    || *(void *)(v1
                 + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_collapsedNumberOfLines) != *(void *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_collapsedNumberOfLines]
    || *(double *)(v1
                 + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize) != *(double *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize]
    || *(double *)(v1
                 + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize
                 + 8) != *(double *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize
                                       + 8]
    || (sub_100019840(0, (unint64_t *)&qword_100954370),
        id v5 = *(id *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_traitCollection],
        char v6 = sub_10077CB10(),
        v5,
        (v6 & 1) == 0))
  {

    goto LABEL_15;
  }
  id v7 = *(id *)&v10[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_attributedText];
  char v8 = sub_10077CB10();

  return v8 & 1;
}

Swift::Int sub_10074C188()
{
  uint64_t v1 = v0;
  sub_10077D370();
  sub_10077D330(*(unsigned char *)(v0
                         + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_isCollapsed));
  sub_10077C1B0();
  sub_10077D320(*(void *)(v0
                          + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_collapsedNumberOfLines));
  uint64_t v2 = v0
     + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize;
  if ((*(void *)(v0
                  + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize) & 0x7FFFFFFFFFFFFFFFLL) != 0)
    Swift::UInt64 v3 = *(void *)(v0
                   + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize);
  else {
    Swift::UInt64 v3 = 0;
  }
  sub_10077D340(v3);
  if ((*(void *)(v2 + 8) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = *(void *)(v2 + 8);
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_10077D340(v4);
  id v5 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_traitCollection));
  sub_10077CB20();

  id v6 = objc_retain(*(id *)(v1
                         + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_attributedText));
  sub_10077CB20();

  return sub_10077D350();
}

uint64_t type metadata accessor for ExpandableTextView.MeasurementsCacheKey()
{
  return self;
}

uint64_t sub_10074C340(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100019738(a1, (uint64_t)v17, &qword_10094BAD0);
  uint64_t v4 = v18;
  if (v18)
  {
    id v5 = sub_10000FA3C(v17, v18);
    uint64_t v6 = *(void *)(v4 - 8);
    __n128 v7 = __chkstk_darwin(v5);
    uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v6 + 16))(v9, v7);
    uint64_t v10 = sub_10077D210();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v17);
  }
  else
  {
    uint64_t v10 = 0;
  }
  v16.receiver = v1;
  v16.super_class = ObjectType;
  unsigned int v11 = objc_msgSendSuper2(&v16, "isEqual:", v10);
  swift_unknownObjectRelease();
  if (!v11) {
    return 0;
  }
  sub_100019738(a1, (uint64_t)v17, &qword_10094BAD0);
  if (!v18)
  {
    sub_10000FA80((uint64_t)v17, &qword_10094BAD0);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = (void *)v15[1];
  uint64_t v13 = JUMeasurementsEqual();

  return v13;
}

uint64_t sub_10074C54C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_10077CDF0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_10000FA80((uint64_t)v10, &qword_10094BAD0);
  return v8 & 1;
}

Swift::Int sub_10074C600()
{
  sub_10077D370();
  uint64_t v1 = (void *)(v0
                + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D610CacheValue_measurements);
  if ((*(void *)(v0
                  + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D610CacheValue_measurements) & 0x7FFFFFFFFFFFFFFFLL) != 0)
    Swift::UInt64 v2 = *(void *)(v0
                   + OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D610CacheValue_measurements);
  else {
    Swift::UInt64 v2 = 0;
  }
  sub_10077D340(v2);
  if ((v1[1] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v3 = v1[1];
  }
  else {
    Swift::UInt64 v3 = 0;
  }
  sub_10077D340(v3);
  if ((v1[2] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = v1[2];
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_10077D340(v4);
  if ((v1[3] & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v5 = v1[3];
  }
  else {
    Swift::UInt64 v5 = 0;
  }
  sub_10077D340(v5);
  return sub_10077D350();
}

uint64_t type metadata accessor for ExpandableTextView.CacheValue()
{
  return self;
}

id sub_10074C704()
{
  id result = [objc_allocWithZone((Class)NSCache) init];
  qword_100972C80 = (uint64_t)result;
  return result;
}

double sub_10074C73C(void *a1, char a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  uint64_t v20 = sub_10000D280(&qword_100950D80);
  __chkstk_darwin(v20 - 8);
  id v22 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v23 = a1;
    id v24 = [a4 traitCollection];
    uint64_t v25 = (objc_class *)type metadata accessor for ExpandableTextView.MeasurementsCacheKey();
    uint64_t v26 = objc_allocWithZone(v25);
    v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_isCollapsed] = a2 & 1;
    uint64_t v27 = (double *)&v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_layoutMargins];
    *uint64_t v27 = a5;
    v27[1] = a6;
    v27[2] = a7;
    v27[3] = a8;
    *(void *)&v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_collapsedNumberOfLines] = a3;
    int v28 = (double *)&v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_fittingSize];
    *int v28 = a9;
    v28[1] = a10;
    *(void *)&v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_traitCollection] = v24;
    *(void *)&v26[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D620MeasurementsCacheKey_attributedText] = v23;
    v49.receiver = v26;
    v49.super_class = v25;
    id v29 = objc_msgSendSuper2(&v49, "init");
    if (qword_10094A188 != -1) {
      swift_once();
    }
    uint64_t v30 = (char *)[(id)qword_100972C80 objectForKey:v29];
    if (v30)
    {
      id v31 = v30;

      a9 = *(double *)&v31[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D610CacheValue_measurements];
    }
    else
    {
      uint64_t v32 = qword_10094A180;
      id v31 = (char *)v23;
      if (v32 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_100779230();
      uint64_t v34 = sub_10000D2C4(v33, (uint64_t)qword_100972C68);
      uint64_t v35 = *(void *)(v33 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v22, v34, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v22, 0, 1, v33);
      sub_100779660();
      sub_100779680();
      sub_100779670();
      double v37 = v36;
      uint64_t v39 = v38;
      uint64_t v41 = v40;

      sub_10000FA80((uint64_t)v22, &qword_100950D80);
      id v42 = (void *)qword_100972C80;
      uint64_t v43 = (objc_class *)type metadata accessor for ExpandableTextView.CacheValue();
      unint64_t v44 = (char *)objc_allocWithZone(v43);
      id v45 = (double *)&v44[OBJC_IVAR____TtCC20ProductPageExtension18ExpandableTextViewP33_781A3C9D9766F06FE2FBFD638E0A64D610CacheValue_measurements];
      *id v45 = a9;
      v45[1] = a5 + a7 + v37;
      *((void *)v45 + 2) = v39;
      *((void *)v45 + 3) = v41;
      v48.receiver = v44;
      v48.super_class = v43;
      id v46 = objc_msgSendSuper2(&v48, "init");
      [v42 setObject:v46 forKey:v29];
    }
  }
  return a9;
}

BOOL sub_10074CAE0(void *a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  sub_10074C73C(a1, 0, a2, a3, a4, a5, a6, a7, a8, 1.79769313e308);
  return v10 > a9;
}

void sub_10074CB28(void *a1)
{
  uint64_t v2 = v1;
  Swift::UInt64 v3 = a1;
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString;
  Swift::UInt64 v5 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = sub_1007713F0();
    uint64_t v9 = v8;

    if (!v3)
    {
      if (!v9) {
        return;
      }
      swift_bridgeObjectRelease();
      Swift::UInt64 v3 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    if (!a1) {
      return;
    }
    uint64_t v9 = 0;
    uint64_t v7 = 0;
  }
  id v10 = v3;
  uint64_t v11 = sub_1007713F0();
  uint64_t v13 = v12;

  if (!v9)
  {
    if (!v13) {
      return;
    }
    goto LABEL_17;
  }
  if (!v13)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    id v16 = v10;
    char v17 = sub_100771400();

    if (v17) {
      Swift::UInt64 v3 = 0;
    }
    else {
      id v18 = v16;
    }
LABEL_21:
    int v19 = *(void **)(v2 + v4);
    *(void *)(v2 + v4) = v3;

    uint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
    uint64_t v21 = *(void **)(v2 + v4);
    if (v21)
    {
      id v22 = v21;
      id v23 = (void *)sub_1007713A0();
    }
    else
    {
      id v23 = 0;
    }
    [v20 setAttributedText:v23];

    sub_10074B870();
    return;
  }
  if (v7 != v11 || v9 != v13)
  {
    char v15 = sub_10077D230();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15) {
      return;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

void sub_10074CCF8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel);
  id v5 = [v4 attributedText];
  id v6 = v5;
  if (a1)
  {
    if (v5)
    {
      sub_100019840(0, (unint64_t *)&unk_100964520);
      id v7 = a1;
      char v8 = sub_10077CB10();

      if (v8) {
        return;
      }
    }
    else
    {
      id v7 = a1;
    }
    id v9 = [v7 length];
    if (v9)
    {
      id v10 = (objc_class *)sub_100771410();
      id v11 = v7;
      sub_1007713B0();
      id v12 = objc_allocWithZone(v10);
      id v9 = (id)sub_100771420();
    }
  }
  else
  {
    if (!v5) {
      return;
    }

    id v9 = 0;
  }
  uint64_t v13 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString;
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString);
  *(void *)(v2 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString) = v9;

  char v15 = *(void **)(v2 + v13);
  if (v15)
  {
    id v16 = v15;
    id v17 = (id)sub_1007713A0();
  }
  else
  {
    id v17 = a1;
  }
  [v4 setAttributedText:v17];

  sub_10074B870();
}

char *sub_10074CE80(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10000D280(&qword_100950D80);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v9 = (char *)&v17 - v8;
  id v10 = objc_allocWithZone((Class)type metadata accessor for ExpandableTextView());
  id v11 = a2;
  id v12 = sub_10074A894(v11, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = sub_100779230();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v9, a1, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
  sub_100019738((uint64_t)v9, (uint64_t)v6, &qword_100950D80);
  char v15 = v12;
  sub_10076EE30();
  sub_10000FA80((uint64_t)v9, &qword_100950D80);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v15;
}

void sub_10074D03C()
{
  v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_hasMoreButton] = 1;
  v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_alwaysShowsMoreButtonWhenCollapsed] = 0;
  *(void *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines] = 3;
  v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed] = 1;
  *(void *)&v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_languageAwareString] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_moreTapHandler];
  void *v1 = 0;
  v1[1] = 0;

  sub_10077D120();
  __break(1u);
}

id sub_10074D0F0(char *a1, double a2, double a3, double a4, double a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v11 = &a1[qword_1009AE598];
  id v12 = (objc_class *)sub_10076C770();
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  id v13 = objc_allocWithZone(v12);
  uint64_t v14 = a1;
  id v15 = objc_msgSend(v13, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v14[qword_1009AE590] = v15;

  v17.receiver = v14;
  v17.super_class = ObjectType;
  return objc_msgSendSuper2(&v17, "initWithFrame:", a2, a3, a4, a5);
}

uint64_t sub_10074D1C0()
{
  return sub_10076C6D0();
}

id sub_10074D1F4(void *a1)
{
  return [a1 addSubview:*(void *)(v1 + qword_1009AE590)];
}

void sub_10074D20C()
{
}

void sub_10074D21C(uint64_t a1)
{
}

uint64_t type metadata accessor for FramedArtworkCollectionViewCell()
{
  uint64_t result = qword_100972DA0;
  if (!qword_100972DA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10074D278()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10074D2C8()
{
  return type metadata accessor for FramedArtworkCollectionViewCell();
}

id sub_10074D2D0()
{
  return *(id *)(v0 + qword_1009AE590);
}

double sub_10074D2E0()
{
  return *(double *)(v0 + qword_1009AE598);
}

void sub_10074D2F8()
{
  id v1 = *(id *)(v0 + qword_1009AE590);
  sub_10076C5A0();

  sub_10076C770();
  sub_10074D420((unint64_t *)&qword_100951BB0, (void (*)(uint64_t))&type metadata accessor for ArtworkView);
  id v2 = v1;
  sub_10076D5F0();
}

uint64_t sub_10074D3C8(uint64_t a1)
{
  uint64_t result = sub_10074D420(&qword_100972F28, (void (*)(uint64_t))type metadata accessor for FramedArtworkCollectionViewCell);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10074D420(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10074D468(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_10076A280();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  objc_super v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  *(unsigned char *)(v7 + 72) = a3;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(unsigned char *)(v7 + 96) = a6;
  sub_10076A270();
  uint64_t v18 = sub_10076A250();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v23[1] = v18;
  v23[2] = v20;
  sub_10077CFB0();
  long long v21 = v25;
  *(_OWORD *)(v7 + 16) = v24;
  *(_OWORD *)(v7 + 32) = v21;
  *(void *)(v7 + 48) = v26;
  return v7;
}

uint64_t sub_10074D5B8(void *a1)
{
  if (*(void *)v1 != *a1) {
    goto LABEL_10;
  }
  if ((sub_10077CF90() & 1) == 0) {
    goto LABEL_10;
  }
  type metadata accessor for BoolUserDefaultsDebugSetting();
  uint64_t v2 = swift_dynamicCastClass();
  if (!v2) {
    goto LABEL_10;
  }
  uint64_t v3 = v2;
  BOOL v4 = *(void *)(v2 + 56) == *(void *)(v1 + 56) && *(void *)(v2 + 64) == *(void *)(v1 + 64);
  if (v4 || (char v5 = sub_10077D230(), v6 = 0, (v5 & 1) != 0))
  {
    if (*(unsigned __int8 *)(v3 + 72) != *(unsigned __int8 *)(v1 + 72))
    {
LABEL_10:
      char v6 = 0;
      return v6 & 1;
    }
    if (*(void *)(v3 + 80) == *(void *)(v1 + 80) && *(void *)(v3 + 88) == *(void *)(v1 + 88)
      || (v8 = sub_10077D230(), char v6 = 0, (v8 & 1) != 0))
    {
      char v6 = *(unsigned char *)(v3 + 96) ^ *(unsigned char *)(v1 + 96) ^ 1;
    }
  }
  return v6 & 1;
}

void sub_10074D6D0()
{
  sub_10077CFA0();
  swift_bridgeObjectRetain();
  sub_10077BD90();
  swift_bridgeObjectRelease();
  sub_10077D330(*(unsigned char *)(v0 + 72));
  swift_bridgeObjectRetain();
  sub_10077BD90();
  swift_bridgeObjectRelease();
  sub_10077D330(*(unsigned char *)(v0 + 96));
}

uint64_t sub_10074D764()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10074D794()
{
  sub_100019524(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BoolUserDefaultsDebugSetting()
{
  return self;
}

unint64_t sub_10074D800(uint64_t a1)
{
  uint64_t v3 = sub_10076E260();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v67 = (unint64_t)_swiftEmptyArrayStorage;
  sub_10076E270();
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v7 == enum case for ShareSheetData.Metadata.article(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    id v8 = objc_allocWithZone((Class)type metadata accessor for URLActivityItemProvider());
    swift_retain();
    swift_retain();
    id v9 = sub_1005FEA94(v1, a1, (uint64_t)&_swiftEmptySetSingleton);
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v10 = sub_100774A10();
    uint64_t v12 = v11;
    id v13 = (objc_class *)type metadata accessor for TextActivityItemProvider();
    uint64_t v14 = (char *)objc_allocWithZone(v13);
    uint64_t v15 = (uint64_t *)&v14[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text];
    *uint64_t v15 = v10;
    v15[1] = v12;
    uint64_t v16 = qword_100949D18;
    objc_super v17 = v14;
    swift_bridgeObjectRetain();
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v18 = (void *)qword_10096B848;
    swift_bridgeObjectRetain();
    sub_10074E0EC((uint64_t)&_swiftEmptySetSingleton, v18);
    *(void *)&v17[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_excludedActivityTypes] = v19;

    NSString v20 = sub_10077BC80();
    swift_bridgeObjectRelease();
    v64.receiver = v17;
    v64.super_class = v13;
    id v21 = objc_msgSendSuper2(&v64, "initWithPlaceholderItem:", v20);

    id v22 = v21;
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v23 = sub_100774A20();
    if (!v23) {
      goto LABEL_29;
    }
    goto LABEL_9;
  }
  if (v7 == enum case for ShareSheetData.Metadata.product(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    sub_10000D280((uint64_t *)&unk_10096B2F0);
    uint64_t inited = swift_initStackObject();
    long long v63 = xmmword_10078DF90;
    *(_OWORD *)(inited + 16) = xmmword_10078DF90;
    uint64_t v32 = (void *)UIActivityTypeSaveToNotes;
    *(void *)(inited + 32) = UIActivityTypeSaveToNotes;
    swift_retain();
    swift_retain();
    id v33 = v32;
    uint64_t v34 = sub_10016ACD8(inited);
    swift_setDeallocating();
    type metadata accessor for ActivityType(0);
    swift_arrayDestroy();
    id v35 = objc_allocWithZone((Class)type metadata accessor for URLActivityItemProvider());
    id v9 = sub_1005FEA94(v1, a1, (uint64_t)v34);
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v36 = sub_100774A90();
    uint64_t v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = v63;
    *(void *)(v37 + 32) = v33;
    swift_retain();
    id v38 = v33;
    uint64_t v39 = sub_10016ACD8(v37);
    swift_setDeallocating();
    swift_arrayDestroy();
    id v40 = objc_allocWithZone((Class)type metadata accessor for ArtworkActivityItemProvider());
    uint64_t v41 = sub_10065C860(v36, a1, (uint64_t)v39);
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v42 = sub_100774A50();
    if (v42)
    {
      uint64_t v43 = v42;
      unint64_t v44 = (objc_class *)type metadata accessor for NotesMetadataActivityItemProvider();
      id v45 = (char *)objc_allocWithZone(v44);
      *(_OWORD *)&v45[OBJC_IVAR____TtC20ProductPageExtension33NotesMetadataActivityItemProvider____lazy_storage___notesMetadata] = xmmword_1007BBFB0;
      *(void *)&v45[OBJC_IVAR____TtC20ProductPageExtension33NotesMetadataActivityItemProvider_metadata] = v43;
      swift_retain();
      NSString v46 = sub_10077BC80();
      v65.receiver = v45;
      v65.super_class = v44;
      id v47 = objc_msgSendSuper2(&v65, "initWithPlaceholderItem:", v46);

      id v48 = v47;
      sub_10077BEB0();
      if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10077BEF0();
      }
      sub_10077BF70();
      sub_10077BEE0();
      swift_release();
    }
    swift_release();

    goto LABEL_32;
  }
  if (v7 == enum case for ShareSheetData.Metadata.appEvent(_:))
  {
    (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
    id v49 = objc_allocWithZone((Class)type metadata accessor for URLActivityItemProvider());
    swift_retain();
    swift_retain();
    id v9 = sub_1005FEA94(v1, a1, (uint64_t)&_swiftEmptySetSingleton);
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v50 = sub_10076AC20();
    uint64_t v52 = v51;
    uint64_t v53 = (objc_class *)type metadata accessor for TextActivityItemProvider();
    CGFloat v54 = (char *)objc_allocWithZone(v53);
    CGFloat v55 = (uint64_t *)&v54[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text];
    *CGFloat v55 = v50;
    v55[1] = v52;
    uint64_t v56 = qword_100949D18;
    uint64_t v57 = v54;
    swift_bridgeObjectRetain();
    if (v56 != -1) {
      swift_once();
    }
    uint64_t v58 = (void *)qword_10096B848;
    swift_bridgeObjectRetain();
    sub_10074E0EC((uint64_t)&_swiftEmptySetSingleton, v58);
    *(void *)&v57[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_excludedActivityTypes] = v59;

    NSString v60 = sub_10077BC80();
    swift_bridgeObjectRelease();
    v66.receiver = v57;
    v66.super_class = v53;
    id v61 = objc_msgSendSuper2(&v66, "initWithPlaceholderItem:", v60);

    id v22 = v61;
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    uint64_t v23 = sub_10076AC30();
    if (!v23) {
      goto LABEL_29;
    }
LABEL_9:
    uint64_t v24 = v23;
    sub_10000D280((uint64_t *)&unk_10096B2F0);
    uint64_t v25 = swift_initStackObject();
    *(_OWORD *)(v25 + 16) = xmmword_10078DF90;
    uint64_t v26 = (void *)UIActivityTypeSaveToNotes;
    *(void *)(v25 + 32) = UIActivityTypeSaveToNotes;
    swift_retain();
    swift_retain();
    id v27 = v26;
    int v28 = sub_10016ACD8(v25);
    swift_setDeallocating();
    type metadata accessor for ActivityType(0);
    swift_arrayDestroy();
    id v29 = objc_allocWithZone((Class)type metadata accessor for ArtworkActivityItemProvider());
    uint64_t v30 = sub_10065C860(v24, a1, (uint64_t)v28);
    sub_10077BEB0();
    if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_10077BEF0();
    }
    sub_10077BF70();
    sub_10077BEE0();
    swift_release();

LABEL_29:
    swift_release();

LABEL_32:
    return v67;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v67;
}

void sub_10074E0EC(uint64_t a1, void *a2)
{
  int64_t v3 = 0;
  v14[1] = a2;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    sub_100168898(v14, *(id *)(*(void *)(a1 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_10074E258(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  v35[2] = a2;
  id v41 = a1;
  uint64_t v3 = sub_10077CBC0();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  id v38 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100769EF0();
  __chkstk_darwin(v5 - 8);
  v35[1] = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D280((uint64_t *)&unk_10095E060);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10077CC90();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1007786B0();
  uint64_t v43 = v14;
  uint64_t v15 = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  uint64_t v44 = v15;
  uint64_t v16 = sub_10001054C(v42);
  objc_super v17 = *(void (**)(uint64_t *))(*(void *)(v14 - 8) + 104);
  unsigned int v36 = enum case for Feature.iOS.review_summarization(_:);
  v17(v16);
  char v18 = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v42);
  if (v18) {
    sub_10077CCA0();
  }
  else {
    sub_10077CCD0();
  }
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for UIButton.Configuration.Size.large(_:), v10);
  sub_10077CBB0();
  if (v37)
  {
    sub_10000D280((uint64_t *)&unk_100955860);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10078DF90;
    *(void *)(inited + 32) = NSFontAttributeName;
    uint64_t v20 = qword_10094A1D0;
    swift_bridgeObjectRetain();
    id v21 = NSFontAttributeName;
    if (v20 != -1) {
      swift_once();
    }
    id v22 = (void *)qword_100973018;
    *(void *)(inited + 64) = sub_100019840(0, (unint64_t *)&qword_10094BCF0);
    *(void *)(inited + 40) = v22;
    id v23 = v22;
    sub_100610BF8(inited);
    sub_100769F00();
    sub_100769EB0();
    uint64_t v24 = sub_100769EA0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 0, 1, v24);
    sub_10077CC40();
  }
  uint64_t v43 = v14;
  uint64_t v44 = v15;
  uint64_t v25 = sub_10001054C(v42);
  ((void (*)(uint64_t *, void, uint64_t))v17)(v25, v36, v14);
  char v26 = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v42);
  if (v26) {
    sub_10077CC10();
  }
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, enum case for UIButton.Configuration.CornerStyle.fixed(_:), v40);
  sub_10077CBD0();
  id v27 = (void (*)(uint64_t *, void))sub_10077CB80();
  sub_10077A260();
  v27(v42, 0);
  sub_100019840(0, (unint64_t *)&qword_10094BD10);
  int v28 = self;
  id v29 = (objc_class *)[v28 systemGray6Color];
  v30.super.Class isa = (Class)[v28 secondarySystemBackgroundColor];
  v31.super.Class isa = v29;
  sub_10077CA10(v31, v30);
  sub_10077CC50();
  if (qword_10094A1A0 != -1) {
    swift_once();
  }
  sub_10077CBE0();
  if (qword_10094A1D8 != -1) {
    swift_once();
  }
  id v32 = (id)qword_100973020;
  sub_10077CB70();
  id v33 = v41;
  return sub_10077CCC0();
}

uint64_t sub_10074E7F8()
{
  uint64_t v0 = sub_100779000();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (UIFontTextStyle *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_10094EB20);
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v3 = UIFontTextStyleBody;
  (*(void (**)(UIFontTextStyle *, void, uint64_t, __n128))(v1 + 104))(v3, enum case for FontSource.textStyle(_:), v0, v6);
  unint64_t v9 = UIFontTextStyleBody;
  sub_10076C890();
  sub_10076C870();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_10074E99C(uint64_t a1)
{
  return sub_10074EAB4(a1, &qword_1009AE5E0, &qword_1009AE5E8, qword_1009AE5C8);
}

uint64_t sub_10074E9B4()
{
  uint64_t v0 = sub_1007786B0();
  v4[3] = v0;
  v4[4] = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  uint64_t v1 = sub_10001054C(v4);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for Feature.iOS.review_summarization(_:), v0);
  LOBYTE(v0) = sub_10076A690();
  uint64_t result = _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v4);
  double v3 = 7.0;
  if (v0) {
    double v3 = 4.0;
  }
  qword_1009AE5F0 = *(void *)&v3;
  return result;
}

void sub_10074EA8C()
{
  qword_1009AE5F8 = 0x4028000000000000;
}

uint64_t sub_10074EA9C(uint64_t a1)
{
  return sub_10074EAB4(a1, &qword_1009AE618, &qword_1009AE620, qword_1009AE600);
}

uint64_t sub_10074EAB4(uint64_t a1, uint64_t *a2, void *a3, uint64_t *a4)
{
  uint64_t v7 = sub_100779000();
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = __chkstk_darwin(v7);
  uint64_t v11 = (UIFontTextStyle *)((char *)&v16[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = UIFontTextStyleBody;
  (*(void (**)(UIFontTextStyle *, void, uint64_t, __n128))(v8 + 104))(v11, enum case for FontSource.textStyle(_:), v7, v9);
  *a2 = sub_1007797E0();
  *a3 = &protocol witness table for StaticDimension;
  sub_10001054C(a4);
  v16[3] = v7;
  v16[4] = (uint64_t)&protocol witness table for FontSource;
  uint64_t v12 = sub_10001054C(v16);
  (*(void (**)(uint64_t *, UIFontTextStyle *, uint64_t))(v8 + 16))(v12, v11, v7);
  int64_t v13 = UIFontTextStyleBody;
  sub_1007797F0();
  return (*(uint64_t (**)(UIFontTextStyle *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_10074EC38(uint64_t a1)
{
  return sub_10074EC60(a1, &enum case for SystemImage.squareAndPencil(_:), &qword_1009AE628);
}

uint64_t sub_10074EC4C(uint64_t a1)
{
  return sub_10074EC60(a1, &enum case for SystemImage.questionmarkCircle(_:), &qword_1009AE630);
}

uint64_t sub_10074EC60(uint64_t a1, unsigned int *a2, uint64_t *a3)
{
  uint64_t v5 = sub_10076CEE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  __n128 v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, *a2, v5, v7);
  uint64_t v10 = sub_10076CED0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *a3 = v10;
  return result;
}

void sub_10074ED5C()
{
  qword_100973010 = 0x4020000000000000;
}

void sub_10074ED6C()
{
  uint64_t v0 = sub_1007786B0();
  v4[3] = v0;
  v4[4] = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  uint64_t v1 = sub_10001054C(v4);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for Feature.iOS.review_summarization(_:), v0);
  LOBYTE(v0) = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v4);
  if (v0)
  {
    id v2 = [self preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
    id v3 = [self fontWithDescriptor:v2 size:0.0];
  }
  else
  {
    id v3 = [self preferredFontForTextStyle:UIFontTextStyleBody];
  }
  qword_100973018 = (uint64_t)v3;
}

void sub_10074EED0()
{
  uint64_t v0 = sub_1007786B0();
  v9[3] = v0;
  v9[4] = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  uint64_t v1 = sub_10001054C(v9);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for Feature.iOS.review_summarization(_:), v0);
  LOBYTE(v0) = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v9);
  if (v0)
  {
    if (qword_10094A1D0 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_100973018;
    id v3 = self;
    id v4 = v2;
    id v5 = [v3 configurationWithFont:v4 scale:1];
  }
  else
  {
    if (qword_10094A1D0 != -1) {
      swift_once();
    }
    uint64_t v6 = (void *)qword_100973018;
    __n128 v7 = self;
    id v4 = v6;
    id v5 = [v7 configurationWithFont:v4];
  }
  id v8 = v5;

  qword_100973020 = (uint64_t)v8;
}

char *sub_10074F06C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_10000D280(&qword_100969190);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v4[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewAction];
  uint64_t v13 = sub_10000D280(&qword_10095FAE0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v14(&v4[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportAction], 1, 1, v13);
  id v15 = objc_allocWithZone((Class)UIButton);
  uint64_t v16 = v4;
  id v17 = [v15 init];
  *(void *)&v16[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton] = v17;
  id v18 = [objc_allocWithZone((Class)UIButton) init];
  *(void *)&v16[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton] = v18;

  uint64_t v19 = (objc_class *)type metadata accessor for ProductReviewActionsView();
  v40.receiver = v16;
  v40.super_class = v19;
  id v20 = objc_msgSendSuper2(&v40, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  uint64_t v24 = (char *)v20;
  objc_msgSend(v24, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  uint64_t v25 = OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton;
  if (qword_10094A1B8 != -1) {
    swift_once();
  }
  sub_10074E258((void *)qword_1009AE628, 0, 0);
  uint64_t v26 = sub_10077CD00();
  id v27 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56);
  v27(v11, 0, 1, v26);
  sub_10077CD30();
  id v28 = [*(id *)&v24[v25] titleLabel];
  if (v28)
  {
    id v29 = v28;
    if (qword_10094A1D0 != -1) {
      swift_once();
    }
    [v29 setFont:qword_100973018];
  }
  UIColor v30 = *(void **)&v24[v25];
  [v30 addTarget:v24 action:"writeReviewWithSender:" forControlEvents:64];
  id v31 = v30;
  id v32 = [v24 tintColor];
  [v31 setTitleColor:v32 forState:0];

  [v24 addSubview:*(void *)&v24[v25]];
  uint64_t v33 = OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton;
  if (qword_10094A1C0 != -1) {
    swift_once();
  }
  sub_10074E258((void *)qword_1009AE630, 0, 0);
  v27(v11, 0, 1, v26);
  sub_10077CD30();
  id v34 = [*(id *)&v24[v33] titleLabel];
  if (v34)
  {
    id v35 = v34;
    if (qword_10094A1D0 != -1) {
      swift_once();
    }
    [v35 setFont:qword_100973018];
  }
  unsigned int v36 = *(void **)&v24[v33];
  [v36 addTarget:v24 action:"supportWithSender:" forControlEvents:64];
  id v37 = v36;
  id v38 = [v24 tintColor];
  [v37 setTitleColor:v38 forState:0];

  [v24 addSubview:*(void *)&v24[v33]];
  return v24;
}

uint64_t sub_10074F63C(uint64_t a1)
{
  return sub_10074F66C(a1, &OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewAction);
}

uint64_t sub_10074F660(uint64_t a1)
{
  return sub_10074F66C(a1, &OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportAction);
}

uint64_t sub_10074F66C(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_10077AE60();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10077B6E0();
  uint64_t v6 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  id v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v39 - v10;
  uint64_t v12 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  __chkstk_darwin(v12);
  uint64_t v43 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000D280(&qword_10095BF20);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000D280(&qword_10095FAE0);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = v2 + *a2;
  swift_beginAccess();
  sub_1001E0174(v24, (uint64_t)v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    uint64_t v25 = &qword_10095BF20;
    uint64_t v26 = (uint64_t)v19;
    return sub_10000FA80(v26, v25);
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v19, v20);
  sub_10076E860();
  sub_10076CA90();
  swift_release();
  uint64_t v27 = sub_10000D280((uint64_t *)&unk_10094B750);
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v16, 1, v27) == 1)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    uint64_t v25 = (uint64_t *)&unk_10094C410;
    uint64_t v26 = (uint64_t)v16;
    return sub_10000FA80(v26, v25);
  }
  uint64_t v41 = v27;
  sub_10076E870();
  uint64_t v30 = sub_10076E860();
  uint64_t v31 = v49[5];
  v49[3] = sub_100777F70();
  v49[4] = sub_100751A40((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
  v49[0] = v31;
  swift_retain();
  uint64_t v39 = v30;
  sub_10059D318();
  id v32 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v40 = v28;
  uint64_t v33 = v42;
  v32(v8, v11, v42);
  id v34 = v44;
  sub_10077AE40();
  sub_10077B2E0();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v48);
  id v35 = v43;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v43, v11, v33);
  uint64_t v37 = v45;
  uint64_t v36 = v46;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v35, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v46);
  uint64_t v38 = v41;
  sub_10077B3A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v49);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v16, v38);
}

uint64_t sub_10074FC74(void *a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_10077CDF0();
    id v7 = (id)swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    id v7 = a1;
  }
  a4(v7);

  return sub_10000FA80((uint64_t)v9, &qword_10094BAD0);
}

uint64_t sub_10074FCF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v2 = sub_100779E60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v8 = (char *)&v38 - v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v38 - v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v15 = sub_100779720();
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v46 = v15;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v48 = (char *)&v38 - v19;
  sub_1007796F0();
  uint64_t v20 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton);
  uint64_t v50 = sub_100019840(0, (unint64_t *)&qword_100955870);
  uint64_t v51 = &protocol witness table for UIButton;
  uint64_t v43 = v50;
  id v49 = v20;
  uint64_t v21 = type metadata accessor for ProductReviewActionsView();
  id v22 = v20;
  uint64_t v42 = v21;
  uint64_t v44 = v1;
  sub_100770A80();
  double v24 = v23;
  if (qword_10094A1A8 != -1) {
    swift_once();
  }
  double v25 = v24 * 0.5 - *(double *)&qword_1009AE5F8 * 0.5;
  *((void *)v14 + 3) = &type metadata for CGFloat;
  *((void *)v14 + 4) = &protocol witness table for CGFloat;
  *(double *)uint64_t v14 = v25;
  unsigned int v41 = enum case for Resize.Rule.replaced(_:);
  uint64_t v26 = *(void (**)(char *))(v3 + 104);
  v26(v14);
  uint64_t v27 = enum case for Resize.Rule.unchanged(_:);
  ((void (*)(char *, void, uint64_t))v26)(v11, enum case for Resize.Rule.unchanged(_:), v2);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v8, v27, v2);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v5, v27, v2);
  uint64_t v28 = sub_100779E70();
  uint64_t v39 = v8;
  uint64_t v40 = v28;
  uint64_t v53 = v28;
  CGFloat v54 = &protocol witness table for Resize;
  sub_10001054C(v52);
  sub_100779E80();
  sub_100779700();
  uint64_t v45 = *(void *)(v45 + 8);
  id v29 = v17;
  uint64_t v30 = v46;
  ((void (*)(char *, uint64_t))v45)(v29, v46);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v52);
  uint64_t v31 = *(void **)(v44 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton);
  uint64_t v50 = v43;
  uint64_t v51 = &protocol witness table for UIButton;
  id v49 = v31;
  id v32 = v31;
  sub_100770A80();
  double v34 = v33 * 0.5 - *(double *)&qword_1009AE5F8 * 0.5;
  *((void *)v14 + 3) = &type metadata for CGFloat;
  *((void *)v14 + 4) = &protocol witness table for CGFloat;
  *(double *)uint64_t v14 = v34;
  ((void (*)(char *, void, uint64_t))v26)(v14, v41, v2);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v11, v27, v2);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v39, v27, v2);
  ((void (*)(char *, uint64_t, uint64_t))v26)(v5, v27, v2);
  uint64_t v53 = v40;
  CGFloat v54 = &protocol witness table for Resize;
  sub_10001054C(v52);
  sub_100779E80();
  id v35 = v47;
  v47[3] = v30;
  v35[4] = (uint64_t)&protocol witness table for HorizontalStack;
  sub_10001054C(v35);
  uint64_t v36 = v48;
  sub_100779700();
  ((void (*)(char *, uint64_t))v45)(v36, v30);
  return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v52);
}

uint64_t sub_1007501E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v2 = sub_100779E60();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v8 = (char *)&v35 - v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v35 - v10;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v42 = sub_1007794B0();
  uint64_t v45 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v44 = (char *)&v35 - v18;
  sub_100779490();
  uint64_t v38 = v1;
  uint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton);
  uint64_t v41 = sub_100019840(0, (unint64_t *)&qword_100955870);
  uint64_t v47 = v41;
  uint64_t v48 = &protocol witness table for UIButton;
  uint64_t v46 = v19;
  uint64_t v40 = type metadata accessor for ProductReviewActionsView();
  id v20 = v19;
  sub_100770A80();
  CGFloat Width = CGRectGetWidth(v52);
  *((void *)v14 + 3) = &type metadata for CGFloat;
  *((void *)v14 + 4) = &protocol witness table for CGFloat;
  *(CGFloat *)uint64_t v14 = Width;
  unsigned int v39 = enum case for Resize.Rule.replaced(_:);
  id v22 = *(void (**)(char *))(v3 + 104);
  v22(v14);
  uint64_t v23 = enum case for Resize.Rule.unchanged(_:);
  uint64_t v36 = v11;
  ((void (*)(char *, void, uint64_t))v22)(v11, enum case for Resize.Rule.unchanged(_:), v2);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v8, v23, v2);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v5, v23, v2);
  uint64_t v37 = sub_100779E70();
  uint64_t v50 = v37;
  uint64_t v51 = &protocol witness table for Resize;
  sub_10001054C(v49);
  double v24 = v8;
  double v25 = v5;
  sub_100779E80();
  sub_1007794A0();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v45 + 8);
  v45 += 8;
  uint64_t v27 = v16;
  uint64_t v28 = v42;
  v26(v27, v42);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v49);
  id v29 = *(void **)(v38 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton);
  uint64_t v47 = v41;
  uint64_t v48 = &protocol witness table for UIButton;
  uint64_t v46 = v29;
  id v30 = v29;
  sub_100770A80();
  CGFloat v31 = CGRectGetWidth(v53);
  *((void *)v14 + 3) = &type metadata for CGFloat;
  *((void *)v14 + 4) = &protocol witness table for CGFloat;
  *(CGFloat *)uint64_t v14 = v31;
  ((void (*)(char *, void, uint64_t))v22)(v14, v39, v2);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v36, v23, v2);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v24, v23, v2);
  ((void (*)(char *, uint64_t, uint64_t))v22)(v25, v23, v2);
  uint64_t v50 = v37;
  uint64_t v51 = &protocol witness table for Resize;
  sub_10001054C(v49);
  sub_100779E80();
  id v32 = v43;
  v43[3] = v28;
  v32[4] = (uint64_t)&protocol witness table for VerticalStack;
  sub_10001054C(v32);
  double v33 = v44;
  sub_1007794A0();
  v26(v33, v28);
  return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v49);
}

uint64_t sub_100750680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton);
  type metadata accessor for ProductReviewActionsView();
  sub_100770A80();
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  double v7 = v6;
  id v8 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton);
  sub_100770A80();
  objc_msgSend(v8, "sizeThatFits:", v9, v10);
  double v12 = v11;
  sub_100770A80();
  double v14 = v13 * 0.5;
  if (qword_10094A1A8 != -1) {
    swift_once();
  }
  double v15 = v14 + *(double *)&qword_1009AE5F8 * -0.5;
  if (v15 < v7 || v15 < v12)
  {
    return sub_1007501E4(a1);
  }
  else
  {
    return sub_10074FCF8(a1);
  }
}

id sub_1007507C8()
{
  uint64_t v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for ProductReviewActionsView();
  objc_msgSendSuper2(&v29, "layoutSubviews");
  uint64_t v2 = sub_1007786B0();
  uint64_t v27 = v2;
  uint64_t v28 = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  uint64_t v3 = sub_10001054C(v26);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v2 - 8) + 104))(v3, enum case for Feature.iOS.review_summarization(_:), v2);
  LOBYTE(v2) = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v26);
  if (v2)
  {
    sub_100750680(v26);
    sub_10000FA3C(v26, v27);
    [v1 bounds];
    id v4 = [v1 traitCollection];
    sub_100779F60();

    return (id)_s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v26);
  }
  else
  {
    double v6 = *(void **)&v1[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton];
    sub_100770A80();
    objc_msgSend(v6, "measurementsWithFitting:in:", v1, v7, v8);
    if (qword_10094A190 != -1) {
      swift_once();
    }
    sub_10000FA3C(qword_1009AE5A0, qword_1009AE5B8);
    sub_100779280();
    double v10 = v9;
    sub_100770A80();
    objc_msgSend(v6, "sizeThatFits:", v11, v12);
    double v14 = v13;
    CGFloat v16 = v15;
    uint64_t v17 = *(void **)&v1[OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton];
    sub_100770A80();
    objc_msgSend(v17, "sizeThatFits:", v18, v19);
    double v21 = v20;
    sub_100770A80();
    double v22 = v10 + CGRectGetMinY(v30);
    sub_100770A80();
    CGFloat MinX = CGRectGetMinX(v31);
    sub_100770A80();
    sub_10077C6F0();
    objc_msgSend(v6, "setFrame:");
    sub_100770A80();
    if (CGRectGetWidth(v32) >= v14 + v21)
    {
      sub_100770A80();
      CGRectGetMaxX(v34);
    }
    else
    {
      v33.origin.x = MinX;
      v33.origin.y = v22;
      v33.size.width = v14;
      v33.size.height = v16;
      CGRectGetMaxY(v33);
      id v24 = [v6 titleLabel];
      if (v24)
      {
        double v25 = v24;
        [v24 _baselineOffsetFromBottom];
      }
      sub_100770A80();
      CGRectGetMinX(v35);
      sub_100770A80();
      CGRectGetMidY(v36);
    }
    sub_100770A80();
    sub_10077C6F0();
    return objc_msgSend(v17, "setFrame:");
  }
}

double sub_100750BF4(double a1, double a2)
{
  uint64_t ObjectType = swift_getObjectType();
  double v6 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_writeReviewButton);
  id v7 = [v6 titleForState:0];
  if (v7) {
    goto LABEL_2;
  }
  id v18 = [v6 titleLabel];
  double v10 = v18;
  if (!v18)
  {
    uint64_t v8 = 0;
    goto LABEL_3;
  }
  id v7 = [v18 text];

  if (v7)
  {
LABEL_2:
    uint64_t v8 = sub_10077BCB0();
    double v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    double v10 = 0;
  }
LABEL_3:
  double v11 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension24ProductReviewActionsView_supportButton);
  id v12 = [v11 titleForState:0];
  if (v12) {
    goto LABEL_4;
  }
  id v19 = [v11 titleLabel];
  double v15 = v19;
  if (!v19)
  {
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  id v12 = [v19 text];

  if (v12)
  {
LABEL_4:
    uint64_t v13 = sub_10077BCB0();
    double v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    double v15 = 0;
  }
LABEL_5:
  double v16 = sub_1001D27C8(v8, v10, v13, v15, v2, ObjectType, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

id sub_100750E10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductReviewActionsView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100750EB8()
{
  return type metadata accessor for ProductReviewActionsView();
}

uint64_t type metadata accessor for ProductReviewActionsView()
{
  uint64_t result = qword_100973058;
  if (!qword_100973058) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100750F0C()
{
  sub_1001DFC88();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

double sub_100750FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, double a6, double a7)
{
  uint64_t v61 = a3;
  uint64_t v60 = sub_10077D200();
  uint64_t v59 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  double v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100779000();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v18 = (UIFontTextStyle *)((char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_10077CD00();
  __chkstk_darwin(v19 - 8);
  uint64_t v20 = sub_1007786B0();
  v62[3] = v20;
  v62[4] = sub_100751A40((unint64_t *)&qword_10094FF30, (void (*)(uint64_t))&type metadata accessor for Feature.iOS);
  double v21 = sub_10001054C(v62);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for Feature.iOS.review_summarization(_:), v20);
  LOBYTE(v20) = sub_10076A690();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v62);
  if ((v20 & 1) == 0)
  {
    *id v18 = UIFontTextStyleBody;
    (*(void (**)(UIFontTextStyle *, void, uint64_t))(v16 + 104))(v18, enum case for FontSource.textStyle(_:), v15);
    objc_super v29 = UIFontTextStyleBody;
    uint64_t v58 = a5;
    v30.super.Class isa = (Class)[a5 traitCollection];
    Class isa = v30.super.isa;
    v32.super.Class isa = sub_100778FF0(v30).super.isa;

    (*(void (**)(UIFontTextStyle *, uint64_t))(v16 + 8))(v18, v15);
    double v33 = 0.0;
    double v34 = 0.0;
    if (a2)
    {
      NSString v35 = sub_10077BC80();
      sub_10000D280((uint64_t *)&unk_100955860);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10078DF90;
      *(void *)(inited + 32) = NSFontAttributeName;
      *(void *)(inited + 64) = sub_100019840(0, (unint64_t *)&qword_10094BCF0);
      *(UIFont *)(inited + 40) = v32;
      uint64_t v37 = NSFontAttributeName;
      uint64_t v38 = v32.super.isa;
      sub_100610BF8(inited);
      type metadata accessor for Key(0);
      sub_100751A40((unint64_t *)&qword_100957DC0, type metadata accessor for Key);
      Class v39 = sub_10077BB30().super.isa;
      swift_bridgeObjectRelease();
      objc_msgSend(v35, "boundingRectWithSize:options:attributes:context:", 1, v39, 0, a6, a7);
      double v34 = v40;
    }
    if (a4)
    {
      NSString v41 = sub_10077BC80();
      sub_10000D280((uint64_t *)&unk_100955860);
      uint64_t v42 = swift_initStackObject();
      *(_OWORD *)(v42 + 16) = xmmword_10078DF90;
      *(void *)(v42 + 32) = NSFontAttributeName;
      *(void *)(v42 + 64) = sub_100019840(0, (unint64_t *)&qword_10094BCF0);
      *(UIFont *)(v42 + 40) = v32;
      uint64_t v43 = v32.super.isa;
      uint64_t v44 = NSFontAttributeName;
      sub_100610BF8(v42);
      type metadata accessor for Key(0);
      sub_100751A40((unint64_t *)&qword_100957DC0, type metadata accessor for Key);
      Class v45 = sub_10077BB30().super.isa;
      swift_bridgeObjectRelease();
      objc_msgSend(v41, "boundingRectWithSize:options:attributes:context:", 1, v45, 0, a6, a7);
      double v33 = v46;
    }
    uint64_t v47 = v59;
    if (qword_10094A198 != -1) {
      swift_once();
    }
    sub_10000FA3C(qword_1009AE5C8, qword_1009AE5E0);
    sub_1000F6F40();
    uint64_t v48 = v58;
    sub_100779260();
    double v50 = v49;
    uint64_t v51 = *(void (**)(char *, uint64_t))(v47 + 8);
    uint64_t v52 = v60;
    v51(v14, v60);
    double v53 = v34 + v33;
    if (qword_10094A1A0 != -1) {
      swift_once();
    }
    double v54 = v53 + v50 + *(double *)&qword_1009AE5F0 + v50 + *(double *)&qword_1009AE5F0;
    id v55 = [v48 traitCollection];
    char v56 = sub_10077C3C0();

    if (v56)
    {
      if (qword_10094A1B0 != -1) {
        swift_once();
      }
      sub_10000FA3C(qword_1009AE600, qword_1009AE618);
      sub_1000F6F40();
      sub_100779260();
      v51(v14, v52);
    }
    if (v54 <= a6)
    {
      if (qword_10094A190 == -1)
      {
LABEL_29:
        sub_10000FA3C(qword_1009AE5A0, qword_1009AE5B8);
        sub_1000F6F40();
        sub_100779260();

        v51(v14, v52);
        return a6;
      }
    }
    else if (qword_10094A190 == -1)
    {
      goto LABEL_29;
    }
    swift_once();
    goto LABEL_29;
  }
  sub_100019840(0, (unint64_t *)&qword_100955870);
  if (qword_10094A1B8 != -1) {
    swift_once();
  }
  sub_10074E258((void *)qword_1009AE628, a1, a2);
  double v22 = (void *)sub_10077CD10();
  objc_msgSend(v22, "sizeThatFits:", a6, a7);
  double v24 = v23;
  if (qword_10094A1C0 != -1) {
    swift_once();
  }
  sub_10074E258((void *)qword_1009AE630, v61, a4);
  double v25 = (void *)sub_10077CD10();
  objc_msgSend(v25, "sizeThatFits:", a6, a7);
  double v27 = v26;
  if (qword_10094A1A8 != -1) {
    swift_once();
  }
  double v28 = a6 * 0.5 + *(double *)&qword_1009AE5F8 * -0.5;
  if ((v28 < v24 || v28 < v27) && qword_10094A1C8 != -1) {
    swift_once();
  }

  return a6;
}

uint64_t sub_100751954(uint64_t a1)
{
  return sub_1007519C4(a1, &qword_10094A1A8, &qword_1009AE5F8, (uint64_t (*)(void *))&HorizontalStack.Properties.trailingSpacing.setter);
}

uint64_t sub_10075198C(uint64_t a1)
{
  return sub_1007519C4(a1, &qword_10094A1C8, &qword_100973010, (uint64_t (*)(void *))&VerticalStack.Properties.bottomSpacing.setter);
}

uint64_t sub_1007519C4(uint64_t a1, void *a2, uint64_t *a3, uint64_t (*a4)(void *))
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v6 = *a3;
  v8[3] = &type metadata for CGFloat;
  v8[4] = &protocol witness table for CGFloat;
  v8[0] = v6;
  return a4(v8);
}

uint64_t sub_100751A40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100751A88(void *a1)
{
  if (*v1 != *a1) {
    goto LABEL_23;
  }
  objc_super v2 = v1;
  if ((sub_10077CF90() & 1) == 0) {
    goto LABEL_23;
  }
  type metadata accessor for NavigationActionDebugSetting();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3) {
    goto LABEL_23;
  }
  uint64_t v4 = v3;
  if (*(void *)(v3 + 56) != v2[7] || *(void *)(v3 + 64) != v2[8])
  {
    char v6 = 0;
    if ((sub_10077D230() & 1) == 0) {
      return v6 & 1;
    }
  }
  id v7 = *(uint64_t (**)(uint64_t))(v4 + 72);
  if (!v7)
  {
    uint64_t v17 = (void (*)(uint64_t))v2[9];
    uint64_t v18 = swift_retain();
    if (v17)
    {
      v17(v18);
      uint64_t v16 = v19;
LABEL_18:
      swift_release();
      if (v16) {
        goto LABEL_22;
      }
LABEL_26:
      char v6 = 1;
      return v6 & 1;
    }
LABEL_25:
    swift_release();
    goto LABEL_26;
  }
  uint64_t v8 = swift_retain();
  uint64_t v9 = v7(v8);
  uint64_t v11 = v10;
  id v12 = (uint64_t (*)(void))v2[9];
  if (!v12)
  {
    if (v10) {
      goto LABEL_21;
    }
    goto LABEL_25;
  }
  uint64_t v13 = v9;
  uint64_t v14 = v12();
  uint64_t v16 = v15;
  if (!v11) {
    goto LABEL_18;
  }
  if (!v15)
  {
LABEL_21:
    swift_release();
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    char v6 = 0;
    return v6 & 1;
  }
  if (v13 == v14 && v11 == v15) {
    char v6 = 1;
  }
  else {
    char v6 = sub_10077D230();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

uint64_t type metadata accessor for NavigationActionDebugSetting()
{
  return self;
}

uint64_t sub_100751C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = sub_10076A280();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v7 + 56) = a1;
  *(void *)(v7 + 64) = a2;
  *(void *)(v7 + 72) = a3;
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(void *)(v7 + 96) = a6;
  sub_1000194C0(a3);
  swift_retain();
  sub_10076A270();
  uint64_t v18 = sub_10076A250();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v23[1] = v18;
  v23[2] = v20;
  sub_10077CFB0();
  long long v21 = v25;
  *(_OWORD *)(v7 + 16) = v24;
  *(_OWORD *)(v7 + 32) = v21;
  *(void *)(v7 + 48) = v26;
  return v7;
}

UIColor sub_100751DD8(uint64_t a1)
{
  return sub_100751E04(0.9, a1, (UIColor *)&qword_1009AE650);
}

UIColor sub_100751DEC(uint64_t a1)
{
  return sub_100751E04(0.6, a1, (UIColor *)&qword_1009AE658);
}

UIColor sub_100751E04(double a1, uint64_t a2, UIColor *a3)
{
  sub_10003C118();
  double v5 = self;
  id v6 = [v5 blackColor];
  uint64_t v7 = (objc_class *)[v6 colorWithAlphaComponent:a1];

  id v8 = [v5 whiteColor];
  uint64_t v9 = (objc_class *)[v8 colorWithAlphaComponent:a1];

  v10.super.Class isa = v7;
  v11.super.Class isa = v9;
  result.super.Class isa = sub_10077CA10(v10, v11).super.isa;
  a3->super.Class isa = result.super.isa;
  return result;
}

char *sub_100751EDC(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView;
  type metadata accessor for TitleHeaderView(0);
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  UIColor v11 = v4;
  *(void *)&v4[v9] = [v10 init];
  id v12 = &v11[OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState];
  uint64_t v13 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for InteractiveTitleHeaderView();
  id v14 = objc_msgSendSuper2(&v19, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v15 = self;
  uint64_t v16 = (char *)v14;
  id v17 = [v15 clearColor];
  [v16 setBackgroundColor:v17];

  objc_msgSend(v16, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  [v16 addSubview:*(void *)&v16[OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView]];

  return v16;
}

id sub_10075233C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InteractiveTitleHeaderView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1007523C0()
{
  return type metadata accessor for InteractiveTitleHeaderView();
}

uint64_t type metadata accessor for InteractiveTitleHeaderView()
{
  uint64_t result = qword_100973170;
  if (!qword_100973170) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100752414()
{
  sub_100221260();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1007524B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState;
  swift_beginAccess();
  return sub_100752808(v3, a1);
}

id sub_10075250C(uint64_t a1)
{
  return sub_100752530(a1);
}

id sub_100752530(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_100961180);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&aBlock[-1] - v8;
  uint64_t v10 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  uint64_t v11 = sub_100479910();
  id v12 = *(void **)&v1[OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView];
  id result = [v12 overrideUserInterfaceStyle];
  if (result != (id)v11)
  {
    uint64_t v14 = (uint64_t)&v1[OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState];
    swift_beginAccess();
    sub_100752808(v14, (uint64_t)v9);
    uint64_t v15 = *(void *)(v10 - 8);
    int v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v10);
    sub_100752870((uint64_t)v9);
    if (v16 == 1)
    {
      [v12 setOverrideUserInterfaceStyle:v11];
    }
    else
    {
      id v17 = self;
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v2;
      *(void *)(v18 + 24) = v11;
      aBlock[4] = sub_100752908;
      aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000A3B88;
      aBlock[3] = &unk_1008A88D0;
      objc_super v19 = _Block_copy(aBlock);
      id v20 = v2;
      swift_release();
      [v17 transitionWithView:v12 duration:5308420 options:v19 animations:0 completion:0.4];
      _Block_release(v19);
    }
    sub_10022249C(a1, (uint64_t)v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v6, 0, 1, v10);
    swift_beginAccess();
    sub_100222500((uint64_t)v6, v14);
    return (id)swift_endAccess();
  }
  return result;
}

uint64_t sub_100752808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_100961180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100752870(uint64_t a1)
{
  uint64_t v2 = sub_10000D280((uint64_t *)&unk_100961180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1007528D0()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_100752908()
{
  return [*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView) setOverrideUserInterfaceStyle:*(void *)(v0 + 24)];
}

uint64_t sub_100752924(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100752934()
{
  return swift_release();
}

uint64_t sub_10075293C()
{
  uint64_t v0 = sub_10077B9D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10077B9F0();
  sub_1000104E8(v4, qword_1009AE668);
  sub_10000D2C4(v4, (uint64_t)qword_1009AE668);
  if (qword_100949CE0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000D2C4(v0, (uint64_t)qword_1009AD5B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_10077B9E0();
}

uint64_t sub_100752A90()
{
  uint64_t v0 = sub_10077C340();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10077C300();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_10077AD70();
  __chkstk_darwin(v5 - 8);
  sub_1000C5DAC();
  sub_10077AD50();
  v7[1] = _swiftEmptyArrayStorage;
  sub_10075ABA8(&qword_100956BF0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_10000D280(&qword_100956BF8);
  sub_1001F9138(&qword_100956C00, &qword_100956BF8);
  sub_10077CE80();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_10077C370();
  qword_1009AE680 = result;
  return result;
}

void sub_100752CD0(char a1)
{
  uint64_t v2 = v1;
  int v4 = a1 & 1;
  uint64_t v5 = sub_10076A240();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v9 = *(unsigned __int8 *)(v2 + OBJC_IVAR___RootViewController_isVisibleInClientWindow);
  *(unsigned char *)(v2 + OBJC_IVAR___RootViewController_isVisibleInClientWindow) = a1;
  if (v9 != v4)
  {
    if (a1)
    {
      sub_10075660C();
      sub_100754CBC();
      sub_100773150();
      sub_10076A230();
      sub_10076A210();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      sub_100773140();
      sub_10077B370();
      if (*(unsigned char *)(v2 + OBJC_IVAR___RootViewController_isViewAppeared)) {
        sub_100777840();
      }
    }
    else
    {
      sub_100754FA8();
      if ((*(unsigned char *)(v2 + OBJC_IVAR___RootViewController_startedDisappearTransition) & 1) == 0) {
        sub_100756C2C();
      }
    }
    sub_100777840();
  }
}

id sub_100752E68(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = v3;
  uint64_t v7 = sub_10076DEF0();
  uint64_t v43 = *(void *)(v7 - 8);
  uint64_t v44 = v7;
  __chkstk_darwin(v7);
  int v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR___RootViewController_installAttributionGate;
  uint64_t v11 = qword_10094A1F8;
  id v12 = v4;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = (void *)qword_1009AE680;
  sub_100777870();
  swift_allocObject();
  id v14 = v13;
  *(void *)&v4[v10] = sub_100777820();
  uint64_t v15 = OBJC_IVAR___RootViewController_viewAppeared;
  sub_100777860();
  swift_allocObject();
  *(void *)&v12[v15] = sub_100777850();
  uint64_t v16 = OBJC_IVAR___RootViewController_prewarmFetchFinished;
  swift_allocObject();
  *(void *)&v12[v16] = sub_100777850();
  uint64_t v17 = OBJC_IVAR___RootViewController_onboardingCompleted;
  swift_allocObject();
  *(void *)&v12[v17] = sub_100777850();
  uint64_t v18 = OBJC_IVAR___RootViewController_visibleInClientWindow;
  swift_allocObject();
  *(void *)&v12[v18] = sub_100777850();
  v12[OBJC_IVAR___RootViewController_isVisibleInClientWindow] = 0;
  v12[OBJC_IVAR___RootViewController_isViewAppeared] = 0;
  v12[OBJC_IVAR___RootViewController_isPreview] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_adAttributionManager] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_currentUISnapshot] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_objectGraph] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_freshnessWatchdog] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_currentItem] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_currentParameters] = 0;
  objc_super v19 = &v12[OBJC_IVAR___RootViewController_clientBundleId];
  *(void *)objc_super v19 = 0;
  *((void *)v19 + 1) = 0;
  v12[OBJC_IVAR___RootViewController_startedDisappearTransition] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_rootViewController] = 0;
  *(void *)&v12[OBJC_IVAR___RootViewController_storeNavigationController] = 0;
  uint64_t v20 = OBJC_IVAR___RootViewController_bootstrapPendingClosuresHandler;
  sub_1007764E0();
  swift_allocObject();
  *(void *)&v12[v20] = sub_1007764D0();
  *(void *)&v12[OBJC_IVAR___RootViewController_customNavigationItem] = 0;
  long long v21 = &v12[OBJC_IVAR___RootViewController_promptString];
  *(void *)long long v21 = 0;
  *((void *)v21 + 1) = 0;
  v12[OBJC_IVAR___RootViewController_askToBuy] = 2;
  v12[OBJC_IVAR___RootViewController_appHasBeenInBackground] = 0;
  v12[OBJC_IVAR___RootViewController_isOnboardingFinished] = 0;
  v12[OBJC_IVAR___RootViewController_isPresentingContentFinished] = 0;

  if (a2)
  {
    NSString v22 = sub_10077BC80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  double v23 = (objc_class *)type metadata accessor for RootViewController();
  v47.receiver = v12;
  v47.super_class = v23;
  id v24 = objc_msgSendSuper2(&v47, "initWithNibName:bundle:", v22, a3);

  long long v25 = self;
  id v26 = v24;
  objc_msgSend(v25, "as_activatePresentationHack");
  id v27 = [self sharedCoordinator];
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10075ABF0;
  aBlock[5] = v28;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000A3B88;
  aBlock[3] = &unk_1008A8B30;
  objc_super v29 = _Block_copy(aBlock);
  swift_release();
  [v27 registerAppBootstrapHandler:v29];
  _Block_release(v29);

  swift_retain();
  swift_retain();
  sub_100777810();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  sub_100777810();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  sub_100777810();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  sub_100777810();
  swift_release();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  swift_retain();
  sub_100777830();
  swift_release();
  swift_release();
  if (qword_10094A098 != -1) {
    swift_once();
  }
  id v45 = a3;
  qword_1009AE390 = (uint64_t)&off_1008A8908;
  swift_unknownObjectWeakAssign();
  id v30 = [self sharedCapabilities];
  if (v30)
  {
    CGRect v31 = v30;
    [v30 setPreventURLDataDetection:1];
  }
  UIFont v32 = self;
  [v32 setFlushTimerEnabled:0];
  [v32 setDisableBackgroundMetrics:1];
  uint64_t v42 = OBJC_IVAR___RootViewController_bootstrapPendingClosuresHandler;
  uint64_t v33 = enum case for BootstrapPhase.onboarding(_:);
  uint64_t v34 = v43;
  NSString v41 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 104);
  NSString v35 = v9;
  CGRect v36 = v9;
  uint64_t v37 = v44;
  v41(v36, enum case for BootstrapPhase.onboarding(_:), v44);
  sub_1007764C0();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v34 + 8);
  v38(v35, v37);
  sub_100754578();
  sub_100757318();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v41(v35, v33, v37);
  swift_retain();
  sub_1007764C0();
  v38(v35, v37);
  swift_release_n();

  return v26;
}

void sub_1007535EC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100753FE4();
  }
}

void sub_100753640()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = *(void *)&Strong[OBJC_IVAR___RootViewController_adAttributionManager];

    if (v1) {
      goto LABEL_17;
    }
  }
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectWeakLoadStrong();
  if (!v2) {
    goto LABEL_17;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___RootViewController_currentParameters);
  swift_bridgeObjectRetain();

  if (!v4) {
    goto LABEL_17;
  }
  sub_100771BF0();
  if ((sub_100771B90() & 1) == 0) {
    goto LABEL_16;
  }
  swift_beginAccess();
  uint64_t v5 = swift_unknownObjectWeakLoadStrong();
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = *(void **)(v5 + OBJC_IVAR___RootViewController_currentItem);
  id v8 = v7;

  if (!v7) {
    goto LABEL_16;
  }
  swift_beginAccess();
  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (!v9
    || (uint64_t v10 = (void *)v9,
        uint64_t v11 = *(void *)(v9 + OBJC_IVAR___RootViewController_clientBundleId + 8),
        swift_bridgeObjectRetain(),
        v10,
        !v11))
  {

LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_beginAccess();
  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  if (v12)
  {
    uint64_t v13 = (char *)v12;
    swift_beginAccess();
    id v14 = (char *)swift_unknownObjectWeakLoadStrong();
    long long v21 = v13;
    if (v14)
    {
      uint64_t v15 = v14;
      if (*(void *)&v14[OBJC_IVAR___RootViewController_objectGraph])
      {
        swift_retain();
        uint64_t v16 = sub_10076CAA0();
        swift_release();
        if (v16)
        {
          sub_10076DD80();

          swift_release();
        }
        else
        {
        }
      }
      else
      {
      }
    }
    swift_allocObject();
    id v20 = v8;
    *(void *)&v21[OBJC_IVAR___RootViewController_adAttributionManager] = sub_100771BB0();

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_17:
  swift_beginAccess();
  uint64_t v17 = swift_unknownObjectWeakLoadStrong();
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = *(void *)(v17 + OBJC_IVAR___RootViewController_adAttributionManager);
    swift_retain();

    if (v19)
    {
      sub_100771BA0();
      swift_release();
    }
  }
}

id sub_10075391C()
{
  uint64_t v0 = self;
  [v0 setFlushTimerEnabled:1];

  return [v0 setDisableBackgroundMetrics:0];
}

uint64_t sub_100753978()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_retain();

    sub_100777840();
    return swift_release();
  }
  return result;
}

uint64_t sub_100753A74()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___RootViewController_currentParameters);
  if (!v1 || !*(void *)(v1 + 16))
  {
    long long v6 = 0u;
    long long v7 = 0u;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_10069F580(0x73776F7242626577, 0xEA00000000007265);
  if ((v3 & 1) == 0)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_10000F7E8(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  swift_bridgeObjectRelease();
  if (!*((void *)&v7 + 1))
  {
LABEL_9:
    sub_10000FA80((uint64_t)&v6, &qword_10094BAD0);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v5;
  }
  return 0;
}

id sub_100753B58(void *a1, uint64_t a2)
{
  char v3 = v2;
  uint64_t v6 = sub_10076DEF0();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  CGRect v36 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100759484(a1))
  {
    uint64_t v8 = *(void *)&v2[OBJC_IVAR___RootViewController_promptString];
    uint64_t v9 = *(void *)&v2[OBJC_IVAR___RootViewController_promptString + 8];
    char v10 = v2[OBJC_IVAR___RootViewController_askToBuy] & 1;
    type metadata accessor for ArcadeSubscribePageBootstrap();
    uint64_t v11 = swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v12 = v2;
    swift_bridgeObjectRetain();
    uint64_t v13 = a1;
    uint64_t v14 = sub_1007596F0(a1, a2, v8, v9, v10, (uint64_t)v12, v11);
    uint64_t v15 = &off_1008956F0;
  }
  else
  {
    uint64_t v16 = OBJC_IVAR___RootViewController_adAttributionManager;
    if (!*(void *)&v2[OBJC_IVAR___RootViewController_adAttributionManager])
    {
      sub_100771BF0();
      if (sub_100771B90())
      {
        if (*(void *)&v2[OBJC_IVAR___RootViewController_clientBundleId + 8])
        {
          if (*(void *)&v2[OBJC_IVAR___RootViewController_objectGraph])
          {
            swift_bridgeObjectRetain();
            swift_retain();
            uint64_t v17 = sub_10076CAA0();
            swift_release();
            if (v17)
            {
              sub_10076DD80();
              swift_release();
            }
          }
          else
          {
            swift_bridgeObjectRetain();
          }
          swift_allocObject();
          swift_bridgeObjectRetain();
          id v18 = a1;
          *(void *)&v2[v16] = sub_100771BB0();
          swift_release();
        }
      }
    }
    uint64_t v19 = *(void *)&v2[OBJC_IVAR___RootViewController_promptString];
    uint64_t v20 = *(void *)&v2[OBJC_IVAR___RootViewController_promptString + 8];
    char v21 = v2[OBJC_IVAR___RootViewController_askToBuy] & 1;
    uint64_t v22 = *(void *)&v2[v16];
    type metadata accessor for ProductPageBootstrap();
    uint64_t v23 = swift_allocObject();
    swift_retain();
    uint64_t v13 = v2;
    swift_bridgeObjectRetain();
    id v24 = a1;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100759838(v24, a2, v19, v20, v21, v22, (uint64_t)v13, (uint64_t)v13, v23);

    swift_release();
    uint64_t v15 = &off_1008A8FD0;
    uint64_t v12 = v13;
  }

  long long v25 = *(void **)&v3[OBJC_IVAR___RootViewController_currentItem];
  *(void *)&v3[OBJC_IVAR___RootViewController_currentItem] = a1;
  id v26 = a1;

  *(void *)&v3[OBJC_IVAR___RootViewController_currentParameters] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_10076E830();
  sub_10076E810();
  sub_10076E780();
  swift_release();
  sub_100753A74();
  sub_100770C00();
  id v27 = (void *)swift_allocObject();
  v27[2] = v3;
  v27[3] = v14;
  v27[4] = v15;
  objc_super v29 = v36;
  uint64_t v28 = v37;
  uint64_t v30 = v38;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, enum case for BootstrapPhase.onboarding(_:), v38);
  CGRect v31 = v3;
  swift_unknownObjectRetain();
  sub_1007764C0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  swift_release();
  swift_getObjectType();
  UIFont v32 = (id (__cdecl *)())v15[1];
  swift_unknownObjectRetain();
  id v33 = v32();
  swift_unknownObjectRelease_n();
  return v33;
}

id sub_100753FE4()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_10076DEF0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR___RootViewController_objectGraph;
  *(void *)&v0[OBJC_IVAR___RootViewController_objectGraph] = 0;
  swift_release();
  uint64_t v8 = *(void **)&v0[OBJC_IVAR___RootViewController_storeNavigationController];
  *(void *)&v0[OBJC_IVAR___RootViewController_storeNavigationController] = 0;

  *(void *)&v0[OBJC_IVAR___RootViewController_freshnessWatchdog] = 0;
  swift_release();
  uint64_t v9 = OBJC_IVAR___RootViewController_isOnboardingFinished;
  v0[OBJC_IVAR___RootViewController_isOnboardingFinished] = 0;
  v0[OBJC_IVAR___RootViewController_isPresentingContentFinished] = 0;
  char v10 = *(void **)&v0[OBJC_IVAR___RootViewController_currentItem];
  if (v10)
  {
    uint64_t v11 = *(void *)&v0[OBJC_IVAR___RootViewController_currentParameters];
    if (v11)
    {
      uint64_t v43 = v9;
      id v12 = v10;
      swift_bridgeObjectRetain();
      id v44 = v12;
      id v13 = sub_100753B58(v12, v11);
      swift_bridgeObjectRelease();
      sub_1007599E0();
      uint64_t v14 = OBJC_IVAR___RootViewController_rootViewController;
      uint64_t v15 = *(void **)&v1[OBJC_IVAR___RootViewController_rootViewController];
      *(void *)&v1[OBJC_IVAR___RootViewController_rootViewController] = v13;
      id v16 = v13;

      uint64_t v17 = *(void **)&v1[v14];
      uint64_t v45 = v7;
      if (!v17)
      {
        id v18 = v16;
        goto LABEL_18;
      }
      id v18 = v17;
      id v19 = [v18 parentViewController];

      if (v19)
      {
LABEL_11:

LABEL_18:
        uint64_t v34 = swift_allocObject();
        *(void *)(v34 + 16) = v1;
        *(void *)(v34 + 24) = ObjectType;
        uint64_t v35 = *(void (**)(char *, void, uint64_t))(v4 + 104);
        v35(v6, enum case for BootstrapPhase.onboarding(_:), v3);
        CGRect v36 = v1;
        uint64_t v43 = ObjectType;
        uint64_t v37 = v36;
        sub_1007764C0();
        uint64_t v38 = *(void (**)(char *, uint64_t))(v4 + 8);
        v38(v6, v3);
        swift_release();
        uint64_t v39 = swift_allocObject();
        uint64_t v40 = v43;
        *(void *)(v39 + 16) = v37;
        *(void *)(v39 + 24) = v40;
        v35(v6, enum case for BootstrapPhase.initialBootstrap(_:), v3);
        NSString v41 = v37;
        sub_1007764C0();
        v38(v6, v3);

        return (id)swift_release();
      }
      uint64_t v20 = v3;
      [v1 addChildViewController:v18];
      id result = [v18 view];
      if (result)
      {
        uint64_t v22 = result;
        id result = [v1 view];
        if (result)
        {
          uint64_t v23 = result;
          [result bounds];
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;

          objc_msgSend(v22, "setFrame:", v25, v27, v29, v31);
          id result = [v18 view];
          if (result)
          {
            UIFont v32 = result;
            [result setAutoresizingMask:18];

            [v18 didMoveToParentViewController:v1];
            uint64_t v3 = v20;
            if (v1[OBJC_IVAR___RootViewController_isViewAppeared] == 1
              && v1[OBJC_IVAR___RootViewController_isVisibleInClientWindow] == 1)
            {
              sub_100754CBC();
            }
            goto LABEL_11;
          }
          goto LABEL_21;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
LABEL_21:
      __break(1u);
      return result;
    }
  }
  if (qword_100949CF8 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_10077B9F0();
  sub_10000D2C4(v33, (uint64_t)qword_1009AD5F8);
  sub_10000D280((uint64_t *)&unk_10094B830);
  sub_10077AFE0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
  sub_10077AF20();
  sub_10077B8B0();

  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_100754578()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_10076DEF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v0;
  *(void *)(v6 + 24) = ObjectType;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BootstrapPhase.onboarding(_:), v2);
  id v7 = v0;
  sub_1007764C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_release();
}

uint64_t sub_1007546E0(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR___RootViewController_objectGraph;
  if (*(void *)(a1 + OBJC_IVAR___RootViewController_objectGraph))
  {
    uint64_t v3 = (uint64_t *)swift_retain();
    *(void *)(a1 + v1) = sub_10073EA04(v3);
    swift_release();
    return swift_release();
  }
  else
  {
    if (qword_10094A1F0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_10077B9F0();
    sub_10000D2C4(v5, (uint64_t)qword_1009AE668);
    sub_10000D280((uint64_t *)&unk_10094B830);
    sub_10077AFE0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
    sub_10077AF20();
    sub_10077B8B0();
    return swift_bridgeObjectRelease();
  }
}

void sub_100754A10(char a1)
{
  uint64_t v2 = v1;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  objc_msgSendSuper2(&v5, "viewDidDisappear:", a1 & 1);
  if (*(void *)&v2[OBJC_IVAR___RootViewController_adAttributionManager])
  {
    swift_retain();
    sub_100771BE0();
    swift_release();
  }
  v2[OBJC_IVAR___RootViewController_isViewAppeared] = 0;
  uint64_t v4 = OBJC_IVAR___RootViewController_startedDisappearTransition;
  if (v2[OBJC_IVAR___RootViewController_startedDisappearTransition] == 1)
  {
    sub_100754FA8();
    sub_100756C2C();
    v2[v4] = 0;
  }
}

void sub_100754B08()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___RootViewController_rootViewController];
  if (!v1) {
    return;
  }
  id v17 = v1;
  id v2 = [v17 parentViewController];

  if (!v2)
  {
    [v0 addChildViewController:v17];
    id v3 = [v17 view];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [v0 view];
      if (v5)
      {
        uint64_t v6 = v5;
        [v5 bounds];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        objc_msgSend(v4, "setFrame:", v8, v10, v12, v14);
        id v15 = [v17 view];
        if (v15)
        {
          id v16 = v15;
          [v15 setAutoresizingMask:18];

          [v17 didMoveToParentViewController:v0];
          if (v0[OBJC_IVAR___RootViewController_isViewAppeared] == 1
            && v0[OBJC_IVAR___RootViewController_isVisibleInClientWindow] == 1)
          {
            sub_100754CBC();
          }
          goto LABEL_9;
        }
LABEL_15:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_9:
}

void sub_100754CBC()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___RootViewController_rootViewController];
  if (!v1) {
    return;
  }
  id v32 = v1;
  id v2 = [v32 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_25;
  }
  id v3 = v2;
  id v4 = [v2 superview];

  if (!v4)
  {
    if (v0[OBJC_IVAR___RootViewController_isVisibleInClientWindow] == 1)
    {
      [v32 beginAppearanceTransition:1 animated:0];
      id v5 = [v32 view];
      if (v5)
      {
        uint64_t v6 = v5;
        id v7 = [v0 view];
        if (v7)
        {
          double v8 = v7;
          [v7 bounds];
          double v10 = v9;
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;

          objc_msgSend(v6, "setFrame:", v10, v12, v14, v16);
          id v17 = [v0 view];
          if (v17)
          {
            id v18 = v17;
            id v19 = [v32 view];
            if (v19)
            {
              uint64_t v20 = v19;
              [v18 addSubview:v19];

              uint64_t v21 = OBJC_IVAR___RootViewController_currentUISnapshot;
              uint64_t v22 = *(void **)&v0[OBJC_IVAR___RootViewController_currentUISnapshot];
              if (v22)
              {
                id v23 = v22;
                [v23 removeFromSuperview];
                [*(id *)&v0[v21] removeFromSuperview];
                double v24 = *(void **)&v0[v21];
                *(void *)&v0[v21] = 0;
              }
              [v32 endAppearanceTransition];
              type metadata accessor for StoreNavigationController();
              uint64_t v25 = swift_dynamicCastClass();
              if (v25)
              {
                double v26 = (void *)v25;
                id v27 = v32;
                id v28 = [v26 topViewController];
                if (v28)
                {
                  double v29 = v28;
                  self;
                  double v30 = (void *)swift_dynamicCastObjCClass();
                  if (v30)
                  {
                    id v31 = [v30 collectionViewLayout];
                    [v31 invalidateLayout];

                    id v27 = v31;
                  }
                }
              }
              if (v0[OBJC_IVAR___RootViewController_isViewAppeared] == 1) {
                sub_100777840();
              }
              goto LABEL_21;
            }
LABEL_28:
            __break(1u);
            return;
          }
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    sub_1007550B4();
  }
LABEL_21:
}

void sub_100754FA8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___RootViewController_rootViewController);
  if (!v1) {
    return;
  }
  id v8 = v1;
  id v2 = [v8 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  id v3 = v2;
  id v4 = [v2 superview];

  id v5 = v8;
  if (v4)
  {
    [v8 beginAppearanceTransition:0 animated:0];
    sub_1007550B4();
    id v6 = [v8 view];
    if (v6)
    {
      id v7 = v6;
      [v6 removeFromSuperview];

      [v8 endAppearanceTransition];
      id v5 = v8;
      goto LABEL_6;
    }
LABEL_11:
    __break(1u);
    return;
  }
LABEL_6:
}

void sub_1007550B4()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___RootViewController_rootViewController];
  if (!v1) {
    return;
  }
  uint64_t v2 = OBJC_IVAR___RootViewController_currentUISnapshot;
  if (*(void *)&v0[OBJC_IVAR___RootViewController_currentUISnapshot]) {
    return;
  }
  id v58 = *(id *)&v0[OBJC_IVAR___RootViewController_rootViewController];
  if ((v0[OBJC_IVAR___RootViewController_isVisibleInClientWindow] & 1) == 0
    && (v0[OBJC_IVAR___RootViewController_isViewAppeared] & 1) == 0)
  {
    id v21 = v1;
    [v21 beginAppearanceTransition:1 animated:0];
    id v22 = [v21 view];
    if (v22)
    {
      id v23 = v22;
      id v24 = [v0 view];
      if (v24)
      {
        uint64_t v25 = v24;
        [v24 bounds];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        objc_msgSend(v23, "setFrame:", v27, v29, v31, v33);
        id v34 = [v0 view];
        if (v34)
        {
          uint64_t v35 = v34;
          id v36 = [v21 view];
          if (v36)
          {
            uint64_t v37 = v36;
            [v35 addSubview:v36];

            id v38 = [v21 view];
            if (v38)
            {
              uint64_t v39 = v38;
              id v40 = [v38 snapshotViewAfterScreenUpdates:1];

              if (v40)
              {
                NSString v41 = *(void **)&v0[v2];
                id v42 = v40;
                [v41 removeFromSuperview];
                uint64_t v43 = *(void **)&v0[v2];
                *(void *)&v0[v2] = v40;

                id v44 = [v0 view];
                if (!v44)
                {
LABEL_34:
                  __break(1u);
                  goto LABEL_35;
                }
                uint64_t v45 = v44;
                [v44 bounds];
                double v47 = v46;
                double v49 = v48;
                double v51 = v50;
                double v53 = v52;

                objc_msgSend(v42, "setFrame:", v47, v49, v51, v53);
                id v54 = [v0 view];
                if (!v54)
                {
LABEL_35:
                  __break(1u);
                  return;
                }
                id v55 = v54;
                [v54 addSubview:v42];
              }
              [v21 beginAppearanceTransition:0 animated:0];
              id v56 = [v21 view];
              if (v56)
              {
                uint64_t v57 = v56;
                [v56 removeFromSuperview];

                [v21 endAppearanceTransition];
                goto LABEL_22;
              }
LABEL_33:
              __break(1u);
              goto LABEL_34;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v3 = [v1 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_26;
  }
  id v4 = v3;
  id v5 = [v3 snapshotViewAfterScreenUpdates:1];

  if (v5)
  {
    id v6 = *(void **)&v0[v2];
    id v7 = v5;
    [v6 removeFromSuperview];
    id v8 = *(void **)&v0[v2];
    *(void *)&v0[v2] = v5;

    id v9 = [v0 view];
    if (v9)
    {
      double v10 = v9;
      [v9 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      objc_msgSend(v7, "setFrame:", v12, v14, v16, v18);
      id v19 = [v0 view];
      if (v19)
      {
        uint64_t v20 = v19;
        [v19 addSubview:v7];

        goto LABEL_22;
      }
      goto LABEL_27;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_22:
}

uint64_t sub_1007554E4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v43 = a1;
  uint64_t v44 = sub_10076DEF0();
  uint64_t v7 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  id v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10076A040();
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)&double v12 = __chkstk_darwin(v10).n128_u64[0];
  v42[1] = v13;
  double v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = OBJC_IVAR___RootViewController_customNavigationItem;
  double v16 = *(void **)&v4[OBJC_IVAR___RootViewController_customNavigationItem];
  if (v16)
  {
    id v17 = objc_msgSend(v16, "leftBarButtonItem", v12);
    if (v17)
    {
      double v18 = v17;
      id v19 = [a2 navigationItem];
      v42[0] = a2;
      uint64_t v20 = v14;
      id v21 = v9;
      uint64_t v22 = v7;
      uint64_t v23 = v10;
      uint64_t v24 = a3;
      id v25 = v19;
      [v19 setLeftBarButtonItem:v18];

      a3 = v24;
      uint64_t v10 = v23;
      uint64_t v7 = v22;
      id v9 = v21;
      double v14 = v20;
      a2 = (void *)v42[0];
    }
    double v26 = *(void **)&v4[v15];
    if (v26)
    {
      id v27 = [v26 rightBarButtonItem];
      if (v27)
      {
        double v28 = v27;
        uint64_t v29 = a3;
        id v30 = [a2 navigationItem];
        [v30 setRightBarButtonItem:v28];

        a3 = v29;
      }
    }
  }
  id v31 = objc_msgSend(a2, "navigationController", v12);
  if (v31)
  {
    double v32 = v31;
    [v31 setNavigationBarHidden:v4[OBJC_IVAR___RootViewController_isPreview] animated:1];
  }
  if (v4[OBJC_IVAR___RootViewController_isPreview] == 1)
  {
    swift_getObjectType();
    uint64_t v33 = swift_conformsToProtocol2();
    if (v33) {
      uint64_t v34 = v33;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v33) {
      uint64_t v35 = a2;
    }
    else {
      uint64_t v35 = 0;
    }
    if (v35)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void, uint64_t, uint64_t))(v34 + 32))(0, ObjectType, v34);
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a3, v10);
  unint64_t v37 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v43;
  *(void *)(v38 + 24) = v4;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v38 + v37, v14, v10);
  uint64_t v39 = v44;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for BootstrapPhase.onboarding(_:), v44);
  swift_retain();
  id v40 = v4;
  sub_1007764C0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v39);
  return swift_release();
}

uint64_t sub_1007558C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a3;
  uint64_t v33 = sub_100774470();
  uint64_t v31 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v29 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D280((uint64_t *)&unk_10094C740);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10076A040();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1007758C0();
  uint64_t v30 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100770A70();
  sub_10077B320();
  sub_10077B8E0();
  double v14 = *(void **)(a2 + OBJC_IVAR___RootViewController_currentItem);
  id v15 = v14;
  BOOL v16 = sub_100759484(v14);

  if (*(unsigned char *)(a2 + OBJC_IVAR___RootViewController_isVisibleInClientWindow))
  {
    sub_100777840();
    return swift_release();
  }
  else
  {
    uint64_t v28 = a2;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v34, v8);
    if (v16)
    {
      double v18 = v29;
      sub_100774460();
      sub_10075ABA8(&qword_100973278, (void (*)(uint64_t))&type metadata accessor for ArcadeSubscribePageIntent);
      uint64_t v19 = v33;
      sub_100770A60();
      unint64_t v20 = sub_1000C5DAC();
      uint64_t v21 = sub_10077C350();
      uint64_t v36 = v20;
      unint64_t v37 = &protocol witness table for OS_dispatch_queue;
      v35[0] = v21;
      sub_10077B930();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
      swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v22 = sub_10077C350();
      uint64_t v36 = v20;
      unint64_t v37 = &protocol witness table for OS_dispatch_queue;
      v35[0] = v22;
      sub_10077B960();
      swift_release();
      swift_release();
      swift_release();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
      return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v18, v19);
    }
    else
    {
      uint64_t v23 = sub_10076D3F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v7, 1, 1, v23);
      sub_1007758B0();
      sub_10075ABA8(&qword_100973270, (void (*)(uint64_t))&type metadata accessor for ShelfBasedProductPageIntent);
      uint64_t v24 = v32;
      sub_100770A60();
      uint64_t v36 = sub_10077B4E0();
      unint64_t v37 = &protocol witness table for SyncTaskScheduler;
      sub_10001054C(v35);
      sub_10077B4D0();
      sub_10077B920();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
      unint64_t v25 = sub_1000C5DAC();
      uint64_t v26 = sub_10077C350();
      uint64_t v36 = v25;
      unint64_t v37 = &protocol witness table for OS_dispatch_queue;
      v35[0] = v26;
      sub_10077B930();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
      swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v27 = sub_10077C350();
      uint64_t v36 = v25;
      unint64_t v37 = &protocol witness table for OS_dispatch_queue;
      v35[0] = v27;
      sub_10077B960();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
      return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v13, v24);
    }
  }
}

uint64_t sub_100755EF4()
{
  sub_10076E830();
  sub_10076E810();
  sub_10076E790();

  return swift_release();
}

uint64_t sub_100755F44()
{
  sub_10076E830();
  sub_10076E810();
  sub_10076E790();

  return swift_release();
}

uint64_t sub_100755F90()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_retain();

    sub_100777840();
    return swift_release();
  }
  return result;
}

uint64_t sub_100756174(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = *(void **)(v4 + OBJC_IVAR___RootViewController_customNavigationItem);
  *(void *)(v4 + OBJC_IVAR___RootViewController_customNavigationItem) = a1;
  id v9 = a1;

  uint64_t v10 = (void *)(v4 + OBJC_IVAR___RootViewController_promptString);
  *uint64_t v10 = a2;
  v10[1] = a3;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)(v4 + OBJC_IVAR___RootViewController_askToBuy) = a4;
  return result;
}

void sub_10075636C(void *a1)
{
  unsigned int v3 = [a1 BOOLValue];
  uint64_t v4 = OBJC_IVAR___RootViewController_isPreview;
  if (v3 == *(unsigned __int8 *)(v1 + OBJC_IVAR___RootViewController_isPreview)) {
    return;
  }
  *(unsigned char *)(v1 + v4) = [a1 BOOLValue];
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR___RootViewController_rootViewController);
  if (!v5) {
    return;
  }
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6) {
    return;
  }
  uint64_t v7 = (void *)v6;
  id v18 = v5;
  objc_msgSend(v7, "setNavigationBarHidden:animated:", objc_msgSend(a1, "BOOLValue"), 1);
  id v8 = [v7 visibleViewController];
  if (!v8)
  {
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  id v9 = v8;
  swift_getObjectType();
  uint64_t v10 = swift_conformsToProtocol2();
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 0;
  }
  if (!v12)
  {

LABEL_14:
    uint64_t v11 = 0;
  }
  if ([a1 BOOLValue])
  {
    if (v12)
    {
      uint64_t ObjectType = swift_getObjectType();
      double v14 = *(void (**)(void, uint64_t, uint64_t))(v11 + 32);
      swift_unknownObjectRetain();
      v14(0, ObjectType, v11);

      swift_unknownObjectRelease_n();
      return;
    }
    goto LABEL_23;
  }
  if (!v12)
  {
LABEL_23:

    return;
  }
  uint64_t v15 = swift_getObjectType();
  BOOL v16 = *(void (**)(uint64_t, uint64_t))(v11 + 40);
  swift_unknownObjectRetain();
  v16(v15, v11);
  swift_unknownObjectRelease();

  uint64_t v17 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v11 + 48))(v17, v11);

  swift_unknownObjectRelease();
}

uint64_t sub_10075660C()
{
  uint64_t v1 = v0;
  uint64_t v22 = sub_10076DEF0();
  uint64_t v2 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10076B930();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - v11;
  uint64_t v21 = OBJC_IVAR___RootViewController_appHasBeenInBackground;
  if (*(unsigned char *)(v1 + OBJC_IVAR___RootViewController_appHasBeenInBackground)) {
    uint64_t v13 = (unsigned int *)&enum case for AppEnterMetricsEvent.EnterKind.taskSwitch(_:);
  }
  else {
    uint64_t v13 = (unsigned int *)&enum case for AppEnterMetricsEvent.EnterKind.launch(_:);
  }
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v12, *v13, v5, v10);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v23 = v12;
  v15(v8, v12, v5);
  unint64_t v16 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v16, v8, v5);
  uint64_t v18 = v22;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for BootstrapPhase.presentingContent(_:), v22);
  swift_retain();
  sub_1007764C0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  swift_release();
  swift_release();
  if (*(unsigned char *)(v1 + v21) == 1 && *(void *)(v1 + OBJC_IVAR___RootViewController_freshnessWatchdog))
  {
    swift_retain();
    sub_100771370();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v23, v5);
}

void sub_100756924(uint64_t a1, uint64_t a2)
{
  v19[1] = a2;
  uint64_t v2 = sub_10077B6E0();
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10077B360();
  uint64_t v20 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10077B060();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = AVAudioSessionModeDefault;
  sub_1001F8D6C(AVAudioSessionCategoryPlayback, v12, 1, 0, 0);

  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v14 = (void *)Strong;
    uint64_t v15 = *(void *)(Strong + OBJC_IVAR___RootViewController_objectGraph);
    swift_retain();

    if (v15)
    {
      swift_beginAccess();
      uint64_t v16 = swift_unknownObjectWeakLoadStrong();
      if (v16 && (uint64_t v17 = (void *)v16, v18 = sub_100753A74(), v17, (v18 & 1) != 0))
      {
        swift_release();
      }
      else
      {
        sub_10076B940();
        sub_100778360();
        sub_10077B6C0();
        sub_10077B350();
        swift_release();
        swift_release();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
        (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      }
    }
  }
}

void sub_100756C2C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___RootViewController_objectGraph);
  if (v1)
  {
    swift_retain();
    if (sub_100753A74())
    {
      swift_release();
    }
    else
    {
      id v2 = [self processInfo];
      NSString v3 = sub_10077BC80();
      v5[4] = sub_100759120;
      v5[5] = v1;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 1107296256;
      v5[2] = sub_1002A76CC;
      v5[3] = &unk_1008A8978;
      uint64_t v4 = _Block_copy(v5);
      swift_retain();
      swift_release();
      [v2 performExpiringActivityWithReason:v3 usingBlock:v4];
      _Block_release(v4);
      swift_release();
    }
  }
  *(unsigned char *)(v0 + OBJC_IVAR___RootViewController_appHasBeenInBackground) = 1;
}

void sub_100756D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10077AD30();
  uint64_t v15 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10077AD70();
  uint64_t v6 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  sub_1000C5DAC();
  uint64_t v10 = (void *)sub_10077C350();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = v9;
  aBlock[4] = sub_100759180;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000A3B88;
  aBlock[3] = &unk_1008A89C8;
  uint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v13 = v9;
  swift_release();
  sub_10077AD50();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10075ABA8((unint64_t *)&qword_100958C50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000D280((uint64_t *)&unk_10094FEF0);
  sub_1001F9138((unint64_t *)&qword_100958C60, (uint64_t *)&unk_10094FEF0);
  sub_10077CE80();
  sub_10077C360();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  sub_10077C500();
}

uint64_t sub_10075706C(uint64_t a1, void *a2)
{
  uint64_t v20 = a2;
  uint64_t v2 = sub_10077B6E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10077B360();
  uint64_t v6 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10077B060();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076B920();
  sub_100778360();
  sub_10077B6C0();
  sub_10077B350();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v20;
  *(void *)(v13 + 16) = v20;
  unint64_t v15 = sub_1000C5DAC();
  id v16 = v14;
  uint64_t v17 = sub_10077C350();
  v22[3] = v15;
  v22[4] = &protocol witness table for OS_dispatch_queue;
  v22[0] = v17;
  sub_10077B960();
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100757318()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_10076DEF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v0;
  *(void *)(v6 + 24) = ObjectType;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BootstrapPhase.initialBootstrap(_:), v2);
  id v7 = v0;
  sub_1007764C0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_release();
}

void sub_100757488(uint64_t a1)
{
  uint64_t v72 = a1;
  uint64_t v59 = sub_10077AE60();
  uint64_t v58 = *(void *)(v59 - 8);
  __chkstk_darwin(v59);
  id v54 = (char *)&v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_10077B6E0();
  uint64_t v53 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  double v50 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  double v51 = (char *)&v50 - v4;
  uint64_t v57 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  double v52 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v6 - 8);
  CGRect v71 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10076C0B0();
  uint64_t v67 = *(void *)(v8 - 8);
  uint64_t v68 = v8;
  __chkstk_darwin(v8);
  CGRect v70 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100773560();
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v65 = v10;
  __chkstk_darwin(v10);
  uint64_t v69 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1007726E0();
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  objc_super v66 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10077B1B0();
  __chkstk_darwin(v13 - 8);
  long long v63 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000D280((uint64_t *)&unk_10094C740);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1007787A0();
  uint64_t v60 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10094A0A0 != -1) {
    swift_once();
  }
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_12:
    uint64_t v31 = v72;
    if (sub_100753A74())
    {
      if (qword_10094A1F0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_10077B9F0();
      sub_10000D2C4(v32, (uint64_t)qword_1009AE668);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
      sub_10077AF20();
      sub_10077B890();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v33 = *(void **)(v31 + OBJC_IVAR___RootViewController_objectGraph);
      if (v33)
      {
        sub_10076DE40();
        sub_10077B320();
        swift_retain();
        sub_10077B8E0();
        sub_1005CA13C(v76, 1);
        sub_10000D280(&qword_10094B2C8);
        char v34 = sub_10077BF20();
        swift_release();
        swift_bridgeObjectRelease();
        if (v34)
        {
          uint64_t v78 = 0;
          long long v76 = 0u;
          long long v77 = 0u;
          (*(void (**)(char *, void, uint64_t))(v60 + 104))(v23, enum case for FlowPage.onboarding(_:), v21);
          uint64_t v35 = sub_10076A040();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v20, 1, 1, v35);
          uint64_t v36 = sub_10076D3F0();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v17, 1, 1, v36);
          CGRect v75 = &type metadata for OnboardingConfiguration;
          char v74 = 1;
          sub_10077B190();
          (*(void (**)(char *, void, uint64_t))(v61 + 104))(v66, enum case for FlowAnimationBehavior.never(_:), v62);
          unint64_t v37 = *(void (**)(char *, void, uint64_t))(v64 + 104);
          id v73 = v33;
          v37(v69, enum case for FlowPresentationContext.infer(_:), v65);
          (*(void (**)(char *, void, uint64_t))(v67 + 104))(v70, enum case for FlowOrigin.inapp(_:), v68);
          sub_10077B6F0();
          uint64_t v38 = sub_10076C090();
          swift_allocObject();
          uint64_t v39 = sub_10076C040();
          uint64_t v40 = (uint64_t)v71;
          sub_10076CA90();
          uint64_t v41 = sub_10000D280((uint64_t *)&unk_10094B750);
          uint64_t v42 = *(void *)(v41 - 8);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41) == 1)
          {
            swift_release();
            swift_release();
            sub_10000FA80(v40, (uint64_t *)&unk_10094C410);
          }
          else
          {
            *((void *)&v77 + 1) = v38;
            uint64_t v78 = sub_10075ABA8((unint64_t *)&qword_100953240, (void (*)(uint64_t))&type metadata accessor for FlowAction);
            *(void *)&long long v76 = v39;
            swift_retain_n();
            uint64_t v72 = v39;
            uint64_t v43 = v51;
            sub_10059D318();
            uint64_t v44 = v53;
            uint64_t v45 = v56;
            (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v50, v43, v56);
            double v46 = v54;
            sub_10077AE40();
            sub_10077B2E0();
            (*(void (**)(char *, uint64_t))(v58 + 8))(v46, v59);
            double v47 = v52;
            (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v52, v43, v45);
            uint64_t v48 = v55;
            uint64_t v49 = v57;
            (*(void (**)(char *, void, uint64_t))(v55 + 104))(v47, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v57);
            sub_10077B3A0();
            swift_release();
            (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
            _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)&v76);
            swift_release();
            swift_release_n();
            swift_release();
            (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v40, v41);
          }
          return;
        }
        swift_release();
      }
    }
    sub_100758094();
    return;
  }
  while (1)
  {
    id v73 = Strong;
    id v26 = [Strong viewIfLoaded];
    if (v26)
    {
      uint64_t v27 = v26;
      id v28 = [v26 window];

      if (v28)
      {
        unsigned __int8 v29 = [v28 isHidden];

        if ((v29 & 1) == 0) {
          break;
        }
      }
    }
    id v25 = [v73 presentedViewController];

    uint64_t Strong = v25;
    if (!v25) {
      goto LABEL_12;
    }
  }
  id v30 = v73;
}

uint64_t sub_100758094()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10076DEF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10077ADE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000C5DAC();
  uint64_t *v9 = sub_10077C350();
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  char v10 = sub_10077AE10();
  uint64_t v12 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
  uint64_t v11 = (uint64_t (*)(char *, uint64_t))(v7 + 8);
  v12(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR___RootViewController_bootstrapPendingClosuresHandler);
  uint64_t v9 = (uint64_t *)enum case for BootstrapPhase.onboarding(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v3 + 104);
  v19(v5, (uint64_t *)enum case for BootstrapPhase.onboarding(_:), v2);
  char v14 = sub_1007764A0();
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t result = v11(v5, v2);
  uint64_t v6 = OBJC_IVAR___RootViewController_isOnboardingFinished;
  if (*(unsigned char *)(v1 + OBJC_IVAR___RootViewController_isOnboardingFinished) != 1 || (v14 & 1) != 0)
  {
    v17[1] = v13;
    uint64_t v18 = v1;
    if (qword_100949CF8 == -1)
    {
LABEL_5:
      uint64_t v16 = sub_10077B9F0();
      v17[0] = sub_10000D2C4(v16, (uint64_t)qword_1009AD5F8);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
      sub_10077AF20();
      sub_10077B890();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v18 + v6) = 1;
      v19(v5, v9, v2);
      sub_1007764B0();
      return v11(v5, v2);
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  return result;
}

void sub_100758408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_10077ADE0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000C5DAC();
  *uint64_t v8 = sub_10077C350();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  char v9 = sub_10077AE10();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  char v10 = *(void **)(v3 + OBJC_IVAR___RootViewController_storeNavigationController);
  if (!v10)
  {
    if (qword_10094A1F0 == -1)
    {
LABEL_8:
      uint64_t v14 = sub_10077B9F0();
      sub_10000D2C4(v14, (uint64_t)qword_1009AE668);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
      sub_10077AF20();
      sub_10077B8B0();
      swift_bridgeObjectRelease();
      return;
    }
LABEL_13:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR___RootViewController_objectGraph);
  if (v11)
  {
    id v12 = v10;
    swift_retain();
    if (sub_10004705C())
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(a2 + 16))(v12, v11, ObjectType, a2);
    }
    sub_1007587E0();

    swift_release();
  }
  else
  {
    uint64_t v15 = qword_10094A1F0;
    id v16 = v10;
    if (v15 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_10077B9F0();
    sub_10000D2C4(v17, (uint64_t)qword_1009AE668);
    sub_10000D280((uint64_t *)&unk_10094B830);
    sub_10077AFE0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
    sub_10077AF20();
    sub_10077B8B0();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1007587E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10076DEF0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10077ADE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000C5DAC();
  uint64_t *v9 = sub_10077C350();
  (*(void (**)(uint64_t *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  char v10 = sub_10077AE10();
  id v12 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
  uint64_t v11 = (uint64_t (*)(char *, uint64_t))(v7 + 8);
  v12(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR___RootViewController_bootstrapPendingClosuresHandler);
  char v9 = (uint64_t *)enum case for BootstrapPhase.presentingContent(_:);
  uint64_t v19 = *(void (**)(char *, uint64_t *, uint64_t))(v3 + 104);
  v19(v5, (uint64_t *)enum case for BootstrapPhase.presentingContent(_:), v2);
  char v14 = sub_1007764A0();
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t result = v11(v5, v2);
  uint64_t v6 = OBJC_IVAR___RootViewController_isPresentingContentFinished;
  if (*(unsigned char *)(v1 + OBJC_IVAR___RootViewController_isPresentingContentFinished) != 1 || (v14 & 1) != 0)
  {
    v17[1] = v13;
    uint64_t v18 = v1;
    if (qword_10094A1F0 == -1)
    {
LABEL_5:
      uint64_t v16 = sub_10077B9F0();
      v17[0] = sub_10000D2C4(v16, (uint64_t)qword_1009AE668);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DF90;
      sub_10077AF20();
      sub_10077B890();
      swift_bridgeObjectRelease();
      *(unsigned char *)(v18 + v6) = 1;
      v19(v5, v9, v2);
      sub_1007764B0();
      return v11(v5, v2);
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  return result;
}

void sub_100758B54(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100777FD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *(void *)&v2[OBJC_IVAR___RootViewController_currentParameters];
  if (!v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    goto LABEL_17;
  }
  uint64_t v10 = sub_10077BCB0();
  uint64_t v12 = v11;
  if (!*(void *)(v9 + 16))
  {
    long long v25 = 0u;
    long long v26 = 0u;
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v13 = v10;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_10069F580(v13, v12);
  if ((v15 & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  sub_10000F7E8(*(void *)(v9 + 56) + 32 * v14, (uint64_t)&v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v26 + 1))
  {
LABEL_17:
    sub_10000FA80((uint64_t)&v25, &qword_10094BAD0);
    return;
  }
  if (swift_dynamicCast())
  {
    if (v24[15])
    {
      uint64_t v16 = *(void **)&v3[OBJC_IVAR___RootViewController_currentItem];
      if (v16)
      {
        id v17 = [v16 iTunesStoreIdentifier];
        if (v17)
        {
          id v18 = v17;
          sub_100777FC0();
          char v19 = sub_100777FA0();
          (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
          if (v19)
          {
            if (a2)
            {
              if (a2 == 1)
              {
                [v3 userDidInteractWithProduct:1];
                [v3 finishWithResult:3 completion:0];
              }
              else
              {
                [v3 userDidInteractWithProduct:2];
                [v3 finishWithResult:0 completion:0];
              }
            }
            else
            {
              [v3 userDidInteractWithProduct:0];
              uint64_t v20 = *(void **)&v3[OBJC_IVAR___RootViewController_customNavigationItem];
              if (v20)
              {
                id v21 = [v20 leftBarButtonItem];
                if (v21)
                {
                  uint64_t v22 = v21;
                  v27._countAndFlagsBits = 0x445F4E4F49544341;
                  v27._object = (void *)0xEB00000000454E4FLL;
                  v28._countAndFlagsBits = 0;
                  v28._object = (void *)0xE000000000000000;
                  sub_10076EB70(v27, v28);
                  NSString v23 = sub_10077BC80();
                  swift_bridgeObjectRelease();
                  [v22 setTitle:v23];
                }
              }
            }
          }
        }
      }
    }
  }
}

id sub_100758E68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RootViewController()
{
  return self;
}

id sub_100759004(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_10077BC80();
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
    sub_100769F40();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_1007590E0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100759118()
{
  sub_100757488(*(void *)(v0 + 16));
}

void sub_100759120(uint64_t a1)
{
  sub_100756D88(a1, v1);
}

uint64_t sub_100759128(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100759138()
{
  return swift_release();
}

uint64_t sub_100759140()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100759180()
{
  return sub_10075706C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100759188()
{
  return _swift_deallocObject(v0, 24, 7);
}

Swift::Int sub_1007591C0()
{
  return sub_10077C510();
}

uint64_t sub_1007591E4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10075921C()
{
  uint64_t v1 = sub_10076B930();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1007592E8()
{
  uint64_t v1 = *(void *)(sub_10076B930() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_100756924(v2, v3);
}

uint64_t sub_10075934C()
{
  uint64_t v1 = sub_10076A040();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100759420()
{
  uint64_t v1 = *(void *)(sub_10076A040() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1007558C8(v2, v3, v4);
}

BOOL sub_100759484(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  id v2 = [v1 itemDictionary];
  uint64_t v3 = sub_10077BB40();

  sub_10077CFB0();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_10069F32C((uint64_t)v14), (v5 & 1) != 0))
  {
    sub_10000F7E8(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v15);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100019524((uint64_t)v14);
  if (!*((void *)&v16 + 1))
  {

    sub_10000FA80((uint64_t)&v15, &qword_10094BAD0);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:

    return 0;
  }
  id v6 = [v1 itemKind];
  if (!v6)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  id v7 = v6;
  uint64_t v8 = sub_10077BCB0();
  uint64_t v10 = v9;

  if (v8 != 0x6572617774666F73 || v10 != 0xED00006E4F646441)
  {
    char v11 = sub_10077D230();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_14:
  v17._object = (void *)0x80000001007FD640;
  v17._countAndFlagsBits = 0xD000000000000010;
  BOOL v12 = sub_10077BE30(v17);
  swift_bridgeObjectRelease();

  return v12;
}

uint64_t sub_1007596CC()
{
  return sub_100755F90();
}

uint64_t sub_1007596E8()
{
  return sub_1007546E0(*(void *)(v0 + 16));
}

uint64_t sub_1007596F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  *(void *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_delegate + 8) = 0;
  uint64_t v13 = swift_unknownObjectWeakInit();
  *(void *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_lookupItem) = a1;
  *(void *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_parameters) = a2;
  unint64_t v14 = (void *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_promptString);
  *unint64_t v14 = a3;
  v14[1] = a4;
  *(unsigned char *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_askToBuy) = a5;
  *(void *)(v13 + 8) = &off_1008A8930;
  swift_unknownObjectWeakAssign();
  type metadata accessor for NavigationBarManualCheckLayoutMarginsChange();
  long long v15 = (objc_class *)type metadata accessor for StoreNavigationController();
  long long v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC20ProductPageExtension25StoreNavigationController_objectGraph] = 0;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v21.receiver = v16;
  v21.super_class = v15;
  swift_retain();
  id v18 = a1;
  id v19 = objc_msgSendSuper2(&v21, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, 0);
  objc_msgSend(v19, "setDelegate:", v19, v21.receiver, v21.super_class);
  *(void *)(a7 + OBJC_IVAR____TtC20ProductPageExtension28ArcadeSubscribePageBootstrap_navigationController) = v19;
  swift_release();
  return sub_10004F044();
}

uint64_t sub_100759838(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15 = a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_delegate;
  *(void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v16 = a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_ppeInteractionObserver;
  *(void *)(v16 + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_lookupItem) = a1;
  *(void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_parameters) = a2;
  Swift::String v17 = (void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_promptString);
  *Swift::String v17 = a3;
  v17[1] = a4;
  *(unsigned char *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_askToBuy) = a5;
  *(void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_adAttributionManager) = a6;
  *(void *)(v15 + 8) = &off_1008A8930;
  swift_unknownObjectWeakAssign();
  *(void *)(v16 + 8) = &off_1008A88F8;
  swift_unknownObjectWeakAssign();
  type metadata accessor for NavigationBarManualCheckLayoutMarginsChange();
  id v18 = (objc_class *)type metadata accessor for StoreNavigationController();
  id v19 = (char *)objc_allocWithZone(v18);
  *(void *)&v19[OBJC_IVAR____TtC20ProductPageExtension25StoreNavigationController_objectGraph] = 0;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v24.receiver = v19;
  v24.super_class = v18;
  swift_retain();
  id v21 = a1;
  swift_retain();
  id v22 = objc_msgSendSuper2(&v24, "initWithNavigationBarClass:toolbarClass:", ObjCClassFromMetadata, 0);
  [v22 setDelegate:v22];
  *(void *)(a9 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController) = v22;
  swift_release();
  return sub_10004F044();
}

id sub_1007599E0()
{
  uint64_t v1 = OBJC_IVAR___RootViewController_rootViewController;
  id result = *(id *)(v0 + OBJC_IVAR___RootViewController_rootViewController);
  if (!result) {
    return result;
  }
  id result = [result willMoveToParentViewController:0];
  uint64_t v3 = *(void **)(v0 + v1);
  if (!v3) {
    return result;
  }
  id v4 = v3;
  id result = [v4 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }
  char v5 = result;
  id v6 = [result superview];

  if (!v6) {
    goto LABEL_7;
  }
  [v4 beginAppearanceTransition:0 animated:0];
  sub_1007550B4();
  id result = [v4 view];
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  id v7 = result;
  [result removeFromSuperview];

  [v4 endAppearanceTransition];
LABEL_7:

  id result = *(id *)(v0 + v1);
  if (result)
  {
    return [result removeFromParentViewController];
  }
  return result;
}

uint64_t sub_100759B14()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100759B54()
{
  sub_100758408(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_100759B80()
{
  uint64_t v1 = OBJC_IVAR___RootViewController_installAttributionGate;
  if (qword_10094A1F8 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_1009AE680;
  sub_100777870();
  swift_allocObject();
  id v3 = v2;
  *(void *)&v0[v1] = sub_100777820();
  uint64_t v4 = OBJC_IVAR___RootViewController_viewAppeared;
  sub_100777860();
  swift_allocObject();
  *(void *)&v0[v4] = sub_100777850();
  uint64_t v5 = OBJC_IVAR___RootViewController_prewarmFetchFinished;
  swift_allocObject();
  *(void *)&v0[v5] = sub_100777850();
  uint64_t v6 = OBJC_IVAR___RootViewController_onboardingCompleted;
  swift_allocObject();
  *(void *)&v0[v6] = sub_100777850();
  uint64_t v7 = OBJC_IVAR___RootViewController_visibleInClientWindow;
  swift_allocObject();
  *(void *)&v0[v7] = sub_100777850();
  v0[OBJC_IVAR___RootViewController_isVisibleInClientWindow] = 0;
  v0[OBJC_IVAR___RootViewController_isViewAppeared] = 0;
  v0[OBJC_IVAR___RootViewController_isPreview] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_adAttributionManager] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_currentUISnapshot] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_objectGraph] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_freshnessWatchdog] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_currentItem] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_currentParameters] = 0;
  uint64_t v8 = &v0[OBJC_IVAR___RootViewController_clientBundleId];
  *uint64_t v8 = 0;
  v8[1] = 0;
  v0[OBJC_IVAR___RootViewController_startedDisappearTransition] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_rootViewController] = 0;
  *(void *)&v0[OBJC_IVAR___RootViewController_storeNavigationController] = 0;
  uint64_t v9 = OBJC_IVAR___RootViewController_bootstrapPendingClosuresHandler;
  sub_1007764E0();
  swift_allocObject();
  *(void *)&v0[v9] = sub_1007764D0();
  *(void *)&v0[OBJC_IVAR___RootViewController_customNavigationItem] = 0;
  uint64_t v10 = &v0[OBJC_IVAR___RootViewController_promptString];
  *uint64_t v10 = 0;
  v10[1] = 0;
  v0[OBJC_IVAR___RootViewController_askToBuy] = 2;
  v0[OBJC_IVAR___RootViewController_appHasBeenInBackground] = 0;
  v0[OBJC_IVAR___RootViewController_isOnboardingFinished] = 0;
  v0[OBJC_IVAR___RootViewController_isPresentingContentFinished] = 0;

  sub_10077D120();
  __break(1u);
}

uint64_t sub_100759E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10077AF90();
  __chkstk_darwin(v4 - 8);
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10077B9F0();
  __chkstk_darwin(v6);
  id v7 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v9 = sub_100759004(a1, a2, 1);
  id v10 = [v9 appClipMetadata];

  if (!v10) {
    return 0;
  }

  return 1;
}

uint64_t sub_10075A208(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10076D3E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10076D3F0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = sub_100759E10(a1, a2);
  uint64_t v15 = (unsigned int *)&enum case for ReferrerData.Kind.appClip(_:);
  if ((v14 & 1) == 0) {
    uint64_t v15 = (unsigned int *)&enum case for ReferrerData.Kind.unspecified(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *v15, v6);
  swift_bridgeObjectRetain();
  sub_10076D3D0();
  sub_10076E830();
  sub_10076E810();
  sub_10076E7A0();
  swift_release();
  sub_10076E810();
  sub_10076E770();
  swift_release();
  uint64_t v16 = (uint64_t *)(v3 + OBJC_IVAR___RootViewController_clientBundleId);
  uint64_t *v16 = a1;
  v16[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_10075A42C()
{
  uint64_t v1 = sub_10077AE60();
  uint64_t v54 = *(void *)(v1 - 8);
  uint64_t v55 = v1;
  __chkstk_darwin(v1);
  double v51 = (char *)v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_10077B6E0();
  uint64_t v50 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v4 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v48 = (char *)v45 - v6;
  uint64_t v53 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v7 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  uint64_t v49 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10077B1B0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v45 - v17;
  uint64_t v19 = sub_10076A040();
  uint64_t v20 = *(void *)(v19 - 8);
  __n128 v21 = __chkstk_darwin(v19);
  NSString v23 = (char *)v45 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v24 = *(void **)(v0 + OBJC_IVAR___RootViewController_currentItem);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v20 + 56))(v18, 1, 1, v19, v21);
LABEL_7:
    Swift::String v27 = (uint64_t *)&unk_10094FEE0;
    uint64_t v28 = (uint64_t)v18;
    return sub_10000FA80(v28, v27);
  }
  uint64_t v47 = v7;
  id v25 = objc_msgSend(v24, "productPageURL", v21.n128_f64[0]);
  if (v25)
  {
    long long v26 = v25;
    sub_10076A000();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v15, 0, 1, v19);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v15, 1, 1, v19);
  }
  sub_10005B6F8((uint64_t)v15, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1) {
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v18, v19);
  uint64_t v30 = *(void *)(v0 + OBJC_IVAR___RootViewController_objectGraph);
  if (!v30) {
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  }
  swift_retain();
  sub_100769FD0();
  sub_10077B190();
  uint64_t v31 = sub_10076FA10();
  swift_allocObject();
  uint64_t v32 = sub_10076FA00();
  if (v32)
  {
    uint64_t v33 = v32;
    sub_10076CA90();
    uint64_t v34 = sub_10000D280((uint64_t *)&unk_10094B750);
    uint64_t v35 = *(void *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v11, 1, v34) == 1)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
      swift_release();
      swift_release();
      Swift::String v27 = (uint64_t *)&unk_10094C410;
      uint64_t v28 = (uint64_t)v11;
      return sub_10000FA80(v28, v27);
    }
    v56[3] = v31;
    v56[4] = sub_10075ABA8((unint64_t *)&qword_100961380, (void (*)(uint64_t))&type metadata accessor for ExternalUrlAction);
    v56[0] = v33;
    swift_retain_n();
    v45[2] = v33;
    uint64_t v36 = v48;
    v45[0] = v34;
    sub_10059D318();
    uint64_t v37 = v50;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
    v45[1] = v30;
    uint64_t v39 = v52;
    v38(v4, v36, v52);
    uint64_t v46 = v35;
    uint64_t v40 = v51;
    sub_10077AE40();
    sub_10077B2E0();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
    uint64_t v41 = v49;
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v49, v36, v39);
    uint64_t v42 = v47;
    uint64_t v43 = v53;
    (*(void (**)(char *, void, uint64_t))(v47 + 104))(v41, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v53);
    uint64_t v44 = v45[0];
    sub_10077B3A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v56);
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v11, v44);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    return swift_release();
  }
}

uint64_t sub_10075ABA8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10075ABF0()
{
}

void sub_10075ABF8()
{
}

uint64_t sub_10075AC00()
{
  return sub_100753978();
}

double sub_10075AC2C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_1001DB418(*a1, a6);
}

unint64_t sub_10075AC38(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_10075AFA8(*a1, a2, a3);
}

uint64_t sub_10075AC40()
{
  uint64_t v0 = sub_10077D200();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100947FE8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1007797E0();
  sub_10000D2C4(v4, (uint64_t)qword_1009A8438);
  sub_100778FD0();
  sub_100779260();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t sub_10075AD88()
{
  uint64_t v0 = sub_10077D200();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100947FE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1007797E0();
  sub_10000D2C4(v4, (uint64_t)qword_1009A8420);
  sub_100778FD0();
  sub_100779260();
  uint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t sub_10075AED0()
{
  return sub_10075AF60((unint64_t *)&unk_100973280, (void (*)(uint64_t))&type metadata accessor for TitledButtonStack);
}

uint64_t sub_10075AF18()
{
  return sub_10075AF60(&qword_1009548B0, (void (*)(uint64_t))&type metadata accessor for NilState);
}

uint64_t sub_10075AF60(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10075AFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v20 = sub_10076A4A0();
  __chkstk_darwin(v20);
  v19[0] = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v9 = sub_10000D280((uint64_t *)&unk_100955988);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001DA044();
  v19[1] = a1;
  unint64_t result = sub_100770470();
  unint64_t v13 = result;
  if (!(result >> 62))
  {
    uint64_t v14 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    sub_100770460();
    sub_100770450();
    sub_10000D280((uint64_t *)&unk_10094BF20);
    sub_10076C830();
    uint64_t v17 = sub_10000D280(&qword_100955968);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
    uint64_t v18 = (uint64_t)v3 + OBJC_IVAR____TtC20ProductPageExtension35TitledButtonStackCollectionViewCell_lineBreaks;
    swift_beginAccess();
    sub_10075B224((uint64_t)v11, v18);
    swift_endAccess();
    return (unint64_t)[v4 setNeedsLayout];
  }
  unint64_t result = sub_10077D140();
  uint64_t v14 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        uint64_t v16 = sub_10077D030();
      }
      else
      {
        uint64_t v16 = *(void *)(v13 + 8 * i + 32);
        swift_retain();
      }
      sub_1001DA1D0(v16, a3);
      swift_release();
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10075B224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_100955988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall NotifyMeButtonPresenter.tearDown()()
{
  uint64_t v1 = OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer);
  if (v2)
  {
    [v2 invalidate];
    uint64_t v2 = *(void **)(v0 + v1);
  }
  *(void *)(v0 + v1) = 0;
}

Swift::Void __swiftcall NotifyMeButtonPresenter.didTapButton(sender:)(UIButton sender)
{
  uint64_t v2 = *(void *)(v1 + 24);
  if (v2
    && (*(unsigned char *)(v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) & 1) == 0)
  {
    swift_retain();
    if (sub_10076DBF0())
    {
      if (sub_100774300()) {
        sub_10075E29C(v2);
      }
      else {
        sub_10075E6F8(v2);
      }
      swift_release();
    }
    else
    {
      sub_1007742D0();
      uint64_t v4 = swift_allocObject();
      swift_weakInit();
      uint64_t v5 = swift_allocObject();
      swift_weakInit();
      uint64_t v6 = (UIButton *)swift_allocObject();
      v6[2].super.super.super.super.Class isa = (Class)v4;
      v6[3].super.super.super.super.Class isa = (Class)v5;
      v6[4].super.super.super.super.Class isa = (Class)v2;
      v6[5].super.super.super.super.Class isa = sender.super.super.super.super.isa;
      uint64_t v7 = swift_allocObject();
      swift_weakInit();
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = v7;
      *(void *)(v8 + 24) = v2;
      uint64_t v9 = sub_100019840(0, (unint64_t *)&qword_1009577F0);
      swift_retain_n();
      uint64_t v10 = sender.super.super.super.super.isa;
      swift_retain();
      v11[3] = v9;
      v11[4] = &protocol witness table for OS_dispatch_queue;
      v11[0] = sub_10077C350();
      sub_10077B930();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v11);
      swift_release();
    }
  }
}

uint64_t sub_10075B52C()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t NotifyMeButtonPresenter.__allocating_init(userNotificationsManager:notificationConfig:view:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  NotifyMeButtonPresenter.init(userNotificationsManager:notificationConfig:view:asPartOf:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_10075B5D4()
{
  uint64_t v1 = sub_10076A240();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v20 - v6;
  if (!*(void *)(v0 + 24))
  {
    uint64_t v16 = v0 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
    swift_beginAccess();
    uint64_t result = swift_unknownObjectWeakLoadStrong();
    if (!result) {
      return result;
    }
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 40))(1, 0, ObjectType, v18);
    return swift_unknownObjectRelease();
  }
  swift_retain();
  sub_10076BA90();
  sub_10076A230();
  sub_10075ED00((unint64_t *)&unk_1009733E0, (void (*)(uint64_t))&type metadata accessor for Date);
  char v8 = sub_10077BC20();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v4, v1);
  v9(v7, v1);
  char v10 = sub_100774300();
  uint64_t v11 = v0 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v12 = *(void *)(v11 + 8);
    uint64_t v13 = swift_getObjectType();
    (*(void (**)(BOOL, void, uint64_t, uint64_t))(v12 + 40))((v8 & 1) == 0, 0, v13, v12);
    swift_unknownObjectRelease();
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v14 = *(void *)(v11 + 8);
    uint64_t v15 = swift_getObjectType();
    (*(void (**)(void, void, uint64_t, uint64_t))(v14 + 32))(v10 & 1, 0, v15, v14);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return swift_release();
}

uint64_t NotifyMeButtonPresenter.view.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t NotifyMeButtonPresenter.view.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  sub_10075B5D4();
  return swift_unknownObjectRelease();
}

void (*NotifyMeButtonPresenter.view.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return sub_10075B9C4;
}

void sub_10075B9C4(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
    sub_10075B5D4();
  }

  free(v3);
}

uint64_t NotifyMeButtonPresenter.init(userNotificationsManager:notificationConfig:view:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = sub_10077B360();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  *(void *)(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer) = 0;
  *(unsigned char *)(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 0;
  swift_beginAccess();
  *(void *)(v15 + 8) = a4;
  swift_unknownObjectWeakAssign();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  swift_retain();
  sub_100778360();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_metricsPipeline, v14, v11);
  *(void *)(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_objectGraph) = a5;
  sub_10076DE40();
  swift_retain();
  *(void *)(v6 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_bag) = sub_1007783B0();
  sub_10075B5D4();
  sub_10075BCA0();
  id v16 = [self defaultCenter];
  sub_100774320();
  swift_retain();
  uint64_t v17 = (void *)sub_100774290();
  [v16 addObserver:v6 selector:"userNotificationsDidChangeNotification:" name:v17 object:0];

  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return v6;
}

void sub_10075BCA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000D280((uint64_t *)&unk_1009591C0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10076A240();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v21 - v12;
  if (!v0[3])
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v7 + 56))(v5, 1, 1, v6, v11);
    goto LABEL_7;
  }
  sub_10076BA90();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_7:
    sub_10000FA80((uint64_t)v5, (uint64_t *)&unk_1009591C0);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v5, v6);
  sub_10076A230();
  char v14 = sub_10076A1D0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  if ((v14 & 1) != 0
    && (uint64_t v16 = OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer,
        !*(void *)((char *)v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_displayTimeReachedTimer)))
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v13, v6);
    v22[3] = v2;
    v22[0] = v1;
    memset(v21, 0, sizeof(v21));
    id v17 = objc_allocWithZone((Class)NSTimer);
    swift_retain();
    id v18 = sub_10075E084((uint64_t)v9, v22, (uint64_t)"displayTimeReached", v21, 0, 0.0);
    id v19 = [self mainRunLoop];
    [v19 addTimer:v18 forMode:NSRunLoopCommonModes];

    v15(v13, v6);
    uint64_t v20 = *(void **)((char *)v1 + v16);
    *(void *)((char *)v1 + v16) = v18;
  }
  else
  {
    v15(v13, v6);
  }
}

uint64_t NotifyMeButtonPresenter.deinit()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  swift_release();
  swift_release();
  uint64_t v2 = v0 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_metricsPipeline;
  uint64_t v3 = sub_10077B360();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_release();
  sub_10000F76C(v0 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view);

  return v0;
}

uint64_t NotifyMeButtonPresenter.__deallocating_deinit()
{
  NotifyMeButtonPresenter.deinit();

  return swift_deallocClassInstance();
}

uint64_t sub_10075C118(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a4;
  uint64_t v5 = sub_10077AE60();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10077B6E0();
  uint64_t v34 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v32 - v12;
  uint64_t v14 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v35 = *(void *)(v14 - 8);
  uint64_t v36 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v17 - 8);
  id v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v20 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong) {
      return swift_release();
    }
    uint64_t v23 = Strong;
    if (v20)
    {
      swift_retain();
      uint64_t v24 = v39;
      char v25 = sub_100774300();
      swift_release();
      if (v25) {
        sub_10075E29C(v24);
      }
      else {
        sub_10075E6F8(v24);
      }
      goto LABEL_11;
    }
    uint64_t v26 = sub_10076BAC0();
    if (!v26)
    {
LABEL_11:
      swift_release();
      return swift_release();
    }
    uint64_t v39 = v26;
    sub_10076CA90();
    uint64_t v27 = sub_10000D280((uint64_t *)&unk_10094B750);
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v19, 1, v27) == 1)
    {
      swift_release();
      swift_release();
      swift_release();
      return sub_10000FA80((uint64_t)v19, (uint64_t *)&unk_10094C410);
    }
    else
    {
      v40[3] = sub_100777F70();
      v40[4] = sub_10075ED00((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
      v40[0] = v39;
      swift_retain_n();
      uint64_t v33 = v28;
      sub_10059D318();
      uint64_t v32 = v23;
      uint64_t v29 = v34;
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v10, v13, v8);
      sub_10077AE40();
      sub_10077B2E0();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v38);
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v16, v13, v8);
      uint64_t v31 = v35;
      uint64_t v30 = v36;
      (*(void (**)(char *, void, uint64_t))(v35 + 104))(v16, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v36);
      sub_10077B3A0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v40);
      swift_release();
      swift_release_n();
      swift_release();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v19, v27);
    }
  }
  return result;
}

uint64_t sub_10075C62C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10075C67C(char *a1)
{
  return sub_10075C118(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10075C688()
{
  uint64_t v0 = sub_10077AE60();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10077B6E0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v26 = v10;
  uint64_t v27 = v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v18 = sub_10076BAA0();
    if (v18)
    {
      uint64_t v19 = v18;
      sub_10076CA90();
      uint64_t v20 = sub_10000D280((uint64_t *)&unk_10094B750);
      uint64_t v25 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v16, 1, v20) == 1)
      {
        swift_release();
        swift_release();
        return sub_10000FA80((uint64_t)v16, (uint64_t *)&unk_10094C410);
      }
      else
      {
        v30[3] = sub_100777F70();
        v30[4] = sub_10075ED00((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
        v30[0] = v19;
        swift_retain_n();
        uint64_t v24 = v20;
        sub_10059D318();
        (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
        sub_10077AE40();
        sub_10077B2E0();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v29);
        (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v13, v9, v3);
        uint64_t v21 = v26;
        uint64_t v22 = v27;
        (*(void (**)(char *, void, uint64_t))(v27 + 104))(v13, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v26);
        uint64_t v23 = v24;
        sub_10077B3A0();
        swift_release();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v21);
        _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v30);
        swift_release_n();
        swift_release();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v23);
      }
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_10075CB00()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10075CB40()
{
  return sub_10075C688();
}

uint64_t sub_10075CB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = a4;
  uint64_t v47 = a3;
  uint64_t v5 = sub_10077AE60();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  __chkstk_darwin(v5);
  uint64_t v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10077B6E0();
  uint64_t v40 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v38 - v11;
  uint64_t v13 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v42 = *(void *)(v13 - 8);
  uint64_t v43 = v13;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1007742E0();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v24 = result;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, a1, v19);
    int v25 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v22, v19);
    if (v25 == enum case for UserNotificationsManager.SchedulingResult.scheduleChanged(_:)
      || v25 == enum case for UserNotificationsManager.SchedulingResult.scheduleAlreadyExists(_:))
    {
      uint64_t v29 = sub_10076BAB0();
      if (v29)
      {
        uint64_t v30 = v29;
        swift_beginAccess();
        if (swift_weakLoadStrong())
        {
          sub_10076CA90();
          uint64_t v31 = sub_10000D280((uint64_t *)&unk_10094B750);
          uint64_t v32 = *(void *)(v31 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v18, 1, v31) == 1)
          {
            swift_release();
            swift_release();
            sub_10000FA80((uint64_t)v18, (uint64_t *)&unk_10094C410);
          }
          else
          {
            v48[3] = sub_100777F70();
            v48[4] = sub_10075ED00((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
            v48[0] = v30;
            swift_retain_n();
            uint64_t v39 = v31;
            sub_10059D318();
            uint64_t v33 = v40;
            (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v9, v12, v7);
            uint64_t v47 = v32;
            uint64_t v34 = v41;
            sub_10077AE40();
            sub_10077B2E0();
            uint64_t v46 = v30;
            (*(void (**)(char *, uint64_t))(v44 + 8))(v34, v45);
            (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v15, v12, v7);
            uint64_t v36 = v42;
            uint64_t v35 = v43;
            (*(void (**)(char *, void, uint64_t))(v42 + 104))(v15, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v43);
            uint64_t v37 = v39;
            sub_10077B3A0();
            swift_release();
            (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v35);
            _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v48);
            swift_release();
            swift_release_n();
            swift_release();
            (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v37);
          }
        }
        else
        {
          swift_release();
        }
      }
    }
    else
    {
      if (v25 != enum case for UserNotificationsManager.SchedulingResult.signInDidNotComplete(_:))
      {
        uint64_t result = sub_10077D220();
        __break(1u);
        return result;
      }
      uint64_t v26 = v24 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
      swift_beginAccess();
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v27 = *(void *)(v26 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void, void, uint64_t, uint64_t))(v27 + 32))(0, 0, ObjectType, v27);
        swift_unknownObjectRelease();
      }
    }
    *(unsigned char *)(v24 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_10075D184(uint64_t a1)
{
  uint64_t v2 = sub_1007742E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    int v8 = (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 88))(v5, v2);
    if (v8 != enum case for UserNotificationsManager.SchedulingResult.scheduleChanged(_:)
      && v8 != enum case for UserNotificationsManager.SchedulingResult.scheduleAlreadyExists(_:))
    {
      if (v8 != enum case for UserNotificationsManager.SchedulingResult.signInDidNotComplete(_:))
      {
        uint64_t result = sub_10077D220();
        __break(1u);
        return result;
      }
      uint64_t v10 = v7 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
      swift_beginAccess();
      if (swift_unknownObjectWeakLoadStrong())
      {
        uint64_t v11 = *(void *)(v10 + 8);
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 32))(1, 0, ObjectType, v11);
        swift_unknownObjectRelease();
      }
    }
    *(unsigned char *)(v7 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_10075D358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v42 = a5;
  uint64_t v5 = sub_10077AE60();
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10077B6E0();
  uint64_t v38 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v33 - v12;
  uint64_t v14 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v39 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v21 = result;
    uint64_t v22 = sub_10076BAA0();
    if (v22)
    {
      uint64_t v23 = v22;
      swift_beginAccess();
      uint64_t Strong = swift_weakLoadStrong();
      if (Strong)
      {
        uint64_t v25 = v23;
        uint64_t v37 = Strong;
        sub_10076CA90();
        uint64_t v26 = sub_10000D280((uint64_t *)&unk_10094B750);
        uint64_t v36 = *(void *)(v26 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v19, 1, v26) == 1)
        {
          swift_release();
          swift_release();
          sub_10000FA80((uint64_t)v19, (uint64_t *)&unk_10094C410);
        }
        else
        {
          v43[3] = sub_100777F70();
          v43[4] = sub_10075ED00((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
          uint64_t v35 = v25;
          v43[0] = v25;
          swift_retain_n();
          uint64_t v34 = v26;
          sub_10059D318();
          uint64_t v27 = v38;
          (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v10, v13, v8);
          sub_10077AE40();
          sub_10077B2E0();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v41);
          (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v16, v13, v8);
          uint64_t v28 = v39;
          (*(void (**)(char *, void, uint64_t))(v39 + 104))(v16, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v14);
          uint64_t v29 = v34;
          sub_10077B3A0();
          swift_release();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v14);
          _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v43);
          swift_release();
          swift_release_n();
          swift_release();
          (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v29);
        }
      }
      else
      {
        swift_release();
      }
    }
    uint64_t v30 = v21 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v31 = *(void *)(v30 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void, void, uint64_t, uint64_t))(v31 + 32))(v42 & 1, 0, ObjectType, v31);
      swift_unknownObjectRelease();
    }
    *(unsigned char *)(v21 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 0;
    return swift_release();
  }
  return result;
}

void sub_10075D890()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10077AD30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10077AD70();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + 24))
  {
    uint64_t v30 = v8;
    uint64_t v31 = v3;
    swift_retain();
    uint64_t v11 = sub_100769D00();
    if (v11)
    {
      uint64_t v12 = v11;
      sub_100774320();
      uint64_t v32 = sub_1007742B0();
      uint64_t v33 = v13;
      sub_10077CFB0();
      if (*(void *)(v12 + 16) && (unint64_t v14 = sub_10069F32C((uint64_t)aBlock), (v15 & 1) != 0))
      {
        sub_10000F7E8(*(void *)(v12 + 56) + 32 * v14, (uint64_t)&v34);
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_100019524((uint64_t)aBlock);
      if (*((void *)&v35 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v17 = v32;
          uint64_t v16 = v33;
          if (v17 == sub_10076BA80() && v16 == v18)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v29 = sub_10077D230();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v29 & 1) == 0)
            {
LABEL_27:
              swift_release();
              return;
            }
          }
        }
      }
      else
      {
        sub_10000FA80((uint64_t)&v34, &qword_10094BAD0);
      }
    }
    uint64_t v19 = sub_100769D00();
    if (v19)
    {
      uint64_t v20 = v19;
      sub_100774320();
      uint64_t v32 = sub_1007742C0();
      uint64_t v33 = v21;
      sub_10077CFB0();
      if (*(void *)(v20 + 16) && (unint64_t v22 = sub_10069F32C((uint64_t)aBlock), (v23 & 1) != 0))
      {
        sub_10000F7E8(*(void *)(v20 + 56) + 32 * v22, (uint64_t)&v34);
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_100019524((uint64_t)aBlock);
      if (*((void *)&v35 + 1))
      {
        sub_100019840(0, (unint64_t *)&qword_10094EB40);
        if (swift_dynamicCast())
        {
          uint64_t v24 = (void *)v32;
          swift_beginAccess();
          uint64_t Strong = swift_unknownObjectWeakLoadStrong();

          if (Strong)
          {
            swift_unknownObjectRelease();
            if (v24 == (void *)Strong) {
              goto LABEL_27;
            }
          }
        }
      }
      else
      {
        sub_10000FA80((uint64_t)&v34, &qword_10094BAD0);
      }
    }
    sub_100019840(0, (unint64_t *)&qword_1009577F0);
    uint64_t v26 = (void *)sub_10077C350();
    uint64_t v27 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_10075ECB0;
    aBlock[5] = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000A3B88;
    aBlock[3] = &unk_1008A8C70;
    uint64_t v28 = _Block_copy(aBlock);
    swift_release();
    sub_10077AD50();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10075ED00((unint64_t *)&qword_100958C50, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10000D280((uint64_t *)&unk_10094FEF0);
    sub_1000C5FB4();
    sub_10077CE80();
    sub_10077C360();
    swift_release();
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v30);
  }
}

uint64_t sub_10075DDC4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_10075B5D4();
    return swift_release();
  }
  return result;
}

id sub_10075E084(uint64_t a1, void *a2, uint64_t a3, void *a4, int a5, double a6)
{
  uint64_t v7 = v6;
  LODWORD(v8) = a5;
  v14.super.Class isa = sub_10076A1C0().super.isa;
  sub_10000FA3C(a2, a2[3]);
  uint64_t v15 = sub_10077D210();
  uint64_t v16 = a4[3];
  if (v16)
  {
    uint64_t v17 = sub_10000FA3C(a4, a4[3]);
    v29[1] = v29;
    uint64_t v18 = *(void *)(v16 - 8);
    uint64_t v31 = a1;
    int v30 = v8;
    uint64_t v8 = v18;
    __n128 v19 = __chkstk_darwin(v17);
    uint64_t v21 = v7;
    uint64_t v22 = a3;
    char v23 = (char *)v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v8 + 16))(v23, v19);
    uint64_t v24 = sub_10077D210();
    uint64_t v25 = v23;
    a3 = v22;
    uint64_t v7 = v21;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v16);
    LOBYTE(v8) = v30;
    a1 = v31;
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)a4);
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v26 = [v7 initWithFireDate:v14.super.isa interval:v15 target:a3 selector:v24 userInfo:v8 & 1 repeats:a6];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v27 = sub_10076A240();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(a1, v27);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)a2);
  return v26;
}

uint64_t sub_10075E29C(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v2 = sub_10077B6E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D280((uint64_t *)&unk_100954900);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10077B060();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v27 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 1;
  uint64_t v12 = v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    v26[1] = v1;
    uint64_t v13 = v2;
    uint64_t v14 = *(void *)(v12 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v16 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(v14 + 32);
    uint64_t v17 = v14;
    uint64_t v2 = v13;
    v16(0, 1, ObjectType, v17);
    swift_unknownObjectRelease();
  }
  sub_10076BA70();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000FA80((uint64_t)v8, (uint64_t *)&unk_100954900);
  }
  else
  {
    uint64_t v18 = v27;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v27, v8, v9);
    sub_10077B6C0();
    sub_10077B350();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
  }
  swift_unknownObjectWeakLoadStrong();
  uint64_t v19 = v28;
  sub_100774310();
  swift_unknownObjectRelease();
  swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v20;
  v22[3] = v19;
  void v22[4] = v21;
  uint64_t v23 = sub_100019840(0, (unint64_t *)&qword_1009577F0);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v24 = sub_10077C350();
  v29[3] = v23;
  v29[4] = &protocol witness table for OS_dispatch_queue;
  v29[0] = v24;
  sub_10077B930();
  swift_release();
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v29);
  swift_release();
  return swift_release();
}

uint64_t sub_10075E6F8(uint64_t a1)
{
  uint64_t v28 = sub_10077B6E0();
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000D280((uint64_t *)&unk_100954900);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10077B060();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v27 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_isSchedulingNotification) = 1;
  uint64_t v12 = v1 + OBJC_IVAR____TtC20ProductPageExtension23NotifyMeButtonPresenter_view;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v26 = v10;
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = v26;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 32))(1, 1, ObjectType, v13);
    swift_unknownObjectRelease();
  }
  sub_10076BA60();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000FA80((uint64_t)v8, (uint64_t *)&unk_100954900);
  }
  else
  {
    uint64_t v15 = v27;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v27, v8, v9);
    sub_10077B6C0();
    sub_10077B350();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v28);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  swift_unknownObjectWeakLoadStrong();
  sub_1007742F0();
  swift_unknownObjectRelease();
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  uint64_t v17 = swift_allocObject();
  swift_weakInit();
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = v16;
  v18[3] = a1;
  v18[4] = v17;
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  uint64_t v21 = (void *)swift_allocObject();
  _OWORD v21[2] = v19;
  v21[3] = a1;
  v21[4] = v20;
  uint64_t v22 = sub_100019840(0, (unint64_t *)&qword_1009577F0);
  swift_retain_n();
  swift_retain();
  swift_retain();
  uint64_t v23 = sub_10077C350();
  v29[3] = v22;
  v29[4] = &protocol witness table for OS_dispatch_queue;
  v29[0] = v23;
  sub_10077B930();
  swift_release();
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v29);
  swift_release();
  return swift_release();
}

uint64_t sub_10075EB94()
{
  return type metadata accessor for NotifyMeButtonPresenter();
}

uint64_t type metadata accessor for NotifyMeButtonPresenter()
{
  uint64_t result = qword_100973320;
  if (!qword_100973320) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10075EBE8()
{
  uint64_t result = sub_10077B360();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10075ECB0()
{
  return sub_10075DDC4();
}

uint64_t sub_10075ECB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10075ECC8()
{
  return swift_release();
}

uint64_t sub_10075ECD0(uint64_t a1)
{
  return sub_10075D184(a1);
}

uint64_t sub_10075ECDC(uint64_t a1)
{
  return sub_10075D358(a1, v1[2], v1[3], v1[4], 1);
}

uint64_t sub_10075ED00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10075ED4C(uint64_t a1)
{
  return sub_10075CB48(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10075ED5C(uint64_t a1)
{
  return sub_10075D358(a1, v1[2], v1[3], v1[4], 0);
}

uint64_t type metadata accessor for GenericPageLayoutSectionProvider()
{
  uint64_t result = qword_1009733F0;
  if (!qword_1009733F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10075EDD0()
{
  return swift_initClassMetadata2();
}

id sub_10075EE10(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v39 = a8;
  uint64_t v37 = a6;
  uint64_t v38 = a7;
  uint64_t v36 = a5;
  uint64_t v34 = a3;
  uint64_t v13 = sub_100777C30();
  uint64_t v35 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000D280((uint64_t *)&unk_100955840);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v30 = a2;
  uint64_t v41 = a2;
  uint64_t v42 = v34;
  sub_100775F00();
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t (*)(), char *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100775F10();
  uint64_t v31 = a10;
  uint64_t v32 = a9;
  uint64_t v33 = a4;
  uint64_t v21 = a4;
  uint64_t v22 = a1;
  id v23 = (id)v20(a1, sub_1002E6548, v40, v21, v36, v37, v38, v39, a9, a10);
  sub_100770EC0();
  swift_getKeyPath();
  sub_10077B140();
  uint64_t v24 = v35;
  swift_release();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v24 + 88))(v15, v13);
  if (v25 == enum case for Shelf.ContentType.ribbonBar(_:))
  {

    uint64_t v26 = (unint64_t *)v30();
    uint64_t v27 = sub_10075F5BC(v22, v26, v33, v36, v37, v38, v39, v32, v31);
    swift_bridgeObjectRelease();

    return (id)v27;
  }
  else if (v25 == enum case for Shelf.ContentType.smallContactCard(_:))
  {
    [v23 setOrthogonalScrollingBehavior:2];
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v13);
  }
  return v23;
}

id sub_10075F120(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v29 = a5;
  int v28 = a3;
  uint64_t v25 = a2;
  uint64_t v8 = sub_1007789C0();
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self sectionWithGroup:a1];
  swift_getObjectType();
  sub_100775220();
  sub_100019840(0, &qword_100959C80);
  Class isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();
  [v11 setBoundarySupplementaryItems:isa];

  sub_100775210();
  sub_100019840(0, &qword_100973450);
  Class v13 = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();
  [v11 setDecorationItems:v13];

  sub_100770E40();
  sub_100778960();
  double v15 = v14;
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v27);
  sub_10000FA3C(a6, a6[3]);
  sub_1007751D0();
  double v19 = v18;
  sub_10000FA3C(a6, a6[3]);
  sub_1007751F0();
  objc_msgSend(v11, "setContentInsets:", v19, v15, v20, v17);
  if ((v28 & 1) == 0) {
    [v11 setOrthogonalScrollingBehavior:v25];
  }
  sub_100775EF0();
  uint64_t v21 = (const void *)sub_10077BF10();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  if (v21)
  {
    aBlock[4] = v21;
    aBlock[5] = v23;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10075F480;
    aBlock[3] = &unk_1008A8D10;
    uint64_t v21 = _Block_copy(aBlock);
    swift_release();
  }
  objc_msgSend(v11, "setVisibleItemsInvalidationHandler:", v21, v25);
  _Block_release(v21);
  return v11;
}

uint64_t sub_10075F480(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, double, double))(a1 + 32);
  sub_10000D280(&qword_10094B5F0);
  uint64_t v9 = sub_10077BED0();
  swift_retain();
  swift_unknownObjectRetain();
  v8(v9, a5, a2, a3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_10075F534(uint64_t a1)
{
  swift_allocObject();
  sub_10000D21C(a1, (uint64_t)v4);
  uint64_t v2 = sub_100775EC0();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1);
  return v2;
}

uint64_t sub_10075F5BC(uint64_t a1, unint64_t *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v87 = a6;
  uint64_t v92 = a8;
  uint64_t v93 = a7;
  uint64_t v86 = a5;
  v85 = a4;
  uint64_t v84 = a3;
  uint64_t v11 = sub_10000D280(&qword_1009503A0);
  __chkstk_darwin(v11 - 8);
  Class v13 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10076FC20();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  double v17 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v18 = (void *)sub_1007789C0();
  uint64_t ObjectType = *(v18 - 1);
  id v91 = v18;
  __chkstk_darwin(v18);
  v88 = (double *)((char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v98 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v20 = a2[2];
  uint64_t v89 = a1;
  uint64_t v82 = v15;
  unint64_t v83 = v20;
  if (v20)
  {
    CGRect v80 = v13;
    sub_10076DA60();
    uint64_t v21 = *(void *)(v15 + 16);
    uint64_t v22 = (uint64_t)a2 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v94 = *(void *)(v15 + 72);
    *(void *)&long long v95 = v21;
    CGRect v81 = (objc_class *)a2;
    swift_bridgeObjectRetain();
    do
    {
      ((void (*)(char *, uint64_t, uint64_t))v95)(v17, v22, v14);
      sub_10075FF6C();
      sub_10076FB40();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      if (v97)
      {
        sub_10077BEB0();
        if (*(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10077BEF0();
        }
        sub_10077BF70();
        sub_10077BEE0();
      }
      v22 += v94;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    uint64_t v23 = (void *)v98;
    a1 = v89;
    Class v13 = v80;
  }
  else
  {
    uint64_t v23 = _swiftEmptyArrayStorage;
  }
  uint64_t v24 = v88;
  sub_100770E40();
  sub_100778890();
  uint64_t v26 = v25;
  id v27 = v91;
  int v28 = *(void (**)(double *, id))(ObjectType + 8);
  v28(v24, v91);
  uint64_t v29 = sub_100770E50();
  int v30 = (objc_class *)type metadata accessor for SnapshotPageTraitEnvironment();
  uint64_t v31 = (char *)objc_allocWithZone(v30);
  uint64_t v32 = &v31[OBJC_IVAR____TtC20ProductPageExtension28SnapshotPageTraitEnvironment_pageContainerSize];
  *(void *)uint64_t v32 = v26;
  *((void *)v32 + 1) = 0x7FEFFFFFFFFFFFFFLL;
  *(void *)&v31[OBJC_IVAR____TtC20ProductPageExtension28SnapshotPageTraitEnvironment_traitCollection] = v29;
  v96.receiver = v31;
  v96.super_class = v30;
  id v33 = objc_msgSendSuper2(&v96, "init");
  uint64_t v34 = (objc_class *)[v33 traitCollection];

  sub_100770E40();
  sub_100778940();
  double v36 = v35;
  v28(v24, v27);
  sub_100770E40();
  sub_100778930();
  double v38 = v37;
  v28(v24, v27);
  uint64_t v39 = sub_1001B49FC((unint64_t)v23, v34, v36, v38);
  swift_bridgeObjectRelease();
  if ((sub_10077BF20() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_100019840(0, (unint64_t *)&qword_10096DE20);
    uint64_t v56 = sub_100770ED0();
    uint64_t v57 = *(void *)(v56 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v13, a1, v56);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v13, 0, 1, v56);
    uint64_t v58 = sub_10077C640();

    sub_1000C6010((uint64_t)v13);
    return v58;
  }
  uint64_t v94 = a9;
  sub_1001B43C4(v34, 0, 0, 0, 0, 1);
  double v41 = v40;
  unint64_t v98 = (unint64_t)_swiftEmptyArrayStorage;
  *(double *)&long long v95 = v39[2];
  CGRect v81 = v34;
  v88 = v39;
  if (!(void)v95)
  {
    double v47 = 0.0;
LABEL_21:
    swift_bridgeObjectRelease();
    double v59 = (double)(v95 - 1);
    sub_100773A30();
    sub_1007739B0();
    sub_100779D50();
    sub_10000D280((uint64_t *)&unk_10094BD00);
    uint64_t v60 = swift_allocObject();
    long long v95 = xmmword_10078E350;
    *(_OWORD *)(v60 + 16) = xmmword_10078E350;
    uint64_t v61 = v81;
    *(void *)(v60 + 32) = v81;
    uint64_t v62 = v61;
    long long v63 = (void *)sub_100779D60();
    sub_10077C050();
    double v65 = v64;

    objc_super v66 = self;
    uint64_t v67 = self;
    id v68 = [v67 absoluteDimension:v47 + v65 * v59];
    id v69 = [v67 absoluteDimension:v41];
    id v70 = [self sizeWithWidthDimension:v68 heightDimension:v69];

    sub_100019840(0, (unint64_t *)&qword_100954950);
    Class isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
    id v72 = [v66 horizontalGroupWithLayoutSize:v70 subitems:isa];

    id v73 = self;
    sub_1007739B0();
    uint64_t v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = v95;
    *(void *)(v74 + 32) = v62;
    CGRect v75 = v62;
    long long v76 = (void *)sub_100779D60();
    sub_10077C050();
    double v78 = v77;

    id v79 = [v73 fixedSpacing:v78];
    [v72 setInterItemSpacing:v79];

    uint64_t v58 = (uint64_t)sub_10075F120((uint64_t)v72, 1, 0, v89, v84, v85);
    return v58;
  }
  uint64_t v42 = self;
  id v91 = self;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t result = self;
  if (v83)
  {
    if ((unint64_t)v95 <= v83)
    {
      uint64_t v44 = (void *)result;
      uint64_t v45 = 0;
      uint64_t v46 = v39 + 4;
      double v47 = 0.0;
      do
      {
        double v48 = v46[v45];
        id v49 = [v42 absoluteDimension:v48];
        id v50 = [v42 absoluteDimension:v41];
        id v51 = [v91 sizeWithWidthDimension:v49 heightDimension:v50];

        sub_1007747E0();
        sub_100019840(0, (unint64_t *)&unk_100955C60);
        id v52 = v51;
        Class v53 = sub_10077BEC0().super.isa;
        swift_bridgeObjectRelease();
        id v54 = [v44 itemWithLayoutSize:v52 supplementaryItems:v53];

        id v55 = v54;
        sub_10077BEB0();
        if (*(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10077BEF0();
        }
        ++v45;
        sub_10077BF70();
        sub_10077BEE0();

        double v47 = v47 + v48;
      }
      while ((void)v95 != v45);
      goto LABEL_21;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10075FF60()
{
  return type metadata accessor for GenericPageLayoutSectionProvider();
}

unint64_t sub_10075FF6C()
{
  unint64_t result = qword_100973440;
  if (!qword_100973440)
  {
    sub_10076DA60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973440);
  }
  return result;
}

uint64_t sub_10075FFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10075FFD4()
{
  return swift_release();
}

id sub_10075FFDC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(void), uint64_t a11)
{
  uint64_t v38 = a5;
  uint64_t v39 = a6;
  double v36 = a3;
  uint64_t v37 = a4;
  uint64_t v35 = a2;
  uint64_t v33 = a9;
  uint64_t v14 = sub_100777C30();
  uint64_t v34 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000D280((uint64_t *)&unk_100955840);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = a10;
  uint64_t v30 = a11;
  uint64_t v44 = a10;
  uint64_t v45 = a11;
  double v41 = sub_1000F3AF8;
  uint64_t v42 = &v43;
  sub_100775F00();
  uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t (*)(), char *, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100775F10();
  uint64_t v31 = a8;
  uint64_t v32 = a7;
  id v22 = (id)v21(a1, sub_100760300, v40, v35, v36, v37, v38, v39, a7, a8);
  sub_100770EC0();
  swift_getKeyPath();
  sub_10077B140();
  uint64_t v23 = v34;
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v16, v14);
  if (v24 == enum case for Shelf.ContentType.ribbonBar(_:))
  {

    uint64_t v25 = (unint64_t *)v29();
    uint64_t v26 = sub_10075F5BC(a1, v25, v35, v36, v37, v38, v39, v32, v31);
    swift_bridgeObjectRelease();

    return (id)v26;
  }
  else if (v24 == enum case for Shelf.ContentType.smallContactCard(_:))
  {
    [v22 setOrthogonalScrollingBehavior:2];
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v14);
  }
  return v22;
}

void sub_100760304()
{
  qword_100973458 = 0x4072700000000000;
}

void sub_100760318()
{
  qword_100973460 = 0x4078C00000000000;
}

void sub_10076032C()
{
  qword_100973468 = 0x4080880000000000;
}

void sub_100760340(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_10077D200();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  Class v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2) {
      return;
    }
LABEL_3:
    v31.origin.x = a2;
    v31.origin.y = a3;
    v31.size.width = a4;
    v31.size.height = a5;
    CGRectGetMidX(v31);
    v32.origin.x = a2;
    v32.origin.y = a3;
    v32.size.width = a4;
    v32.size.height = a5;
    CGRectGetMidY(v32);
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v14 = (id)sub_10077D030();
    }
    else
    {
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
        goto LABEL_16;
      }
      id v14 = *(id *)(a1 + 40);
    }
    uint64_t v15 = v14;
    [v14 frame];
    CGRectGetWidth(v33);
    [v15 frame];
    CGRectGetHeight(v34);
    uint64_t v16 = enum case for FloatingPointRoundingRule.down(_:);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v17(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_10077C8C0();
    double v19 = v18;
    double v21 = v20;
    id v22 = *(void (**)(char *, uint64_t))(v11 + 8);
    v22(v13, v10);
    objc_msgSend(v15, "setPosition:", v19, v21);
    [v15 setZPosition:0.0];
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v23 = (id)sub_10077D030();
LABEL_10:
      int v24 = v23;
      [v23 frame];
      CGRectGetWidth(v35);
      v36.origin.x = a2;
      v36.origin.y = a3;
      v36.size.width = a4;
      v36.size.height = a5;
      CGRectGetMaxY(v36);
      [v24 frame];
      CGRectGetHeight(v37);
      v17(v13, v16, v10);
      sub_10077C8C0();
      double v26 = v25;
      double v28 = v27;
      v22(v13, v10);
      objc_msgSend(v24, "setPosition:", v26, v28);
      [v24 setZPosition:1.0];

      return;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v23 = *(id *)(a1 + 32);
      goto LABEL_10;
    }
LABEL_16:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_10077D140();
  swift_bridgeObjectRelease();
  if (v29 == 2) {
    goto LABEL_3;
  }
}

void sub_1007606A8(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_10077D200();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  Class v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) != 3) {
      return;
    }
LABEL_3:
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    CGRectGetMidX(v38);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    CGRectGetMidY(v39);
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v14 = (id)sub_10077D030();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_20;
      }
      id v14 = *(id *)(a1 + 32);
    }
    uint64_t v15 = v14;
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    CGRectGetMaxY(v40);
    [v15 frame];
    CGRectGetHeight(v41);
    uint64_t v16 = enum case for FloatingPointRoundingRule.down(_:);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v17(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_10077C8C0();
    double v19 = v18;
    double v21 = v20;
    id v22 = *(void (**)(char *, uint64_t))(v11 + 8);
    v22(v13, v10);
    objc_msgSend(v15, "setPosition:", v19, v21);
    [v15 setZPosition:1.0];
    id v36 = v15;
    unint64_t v37 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v23 = (id)sub_10077D030();
LABEL_10:
      int v24 = v23;
      objc_msgSend(v23, "frame", v36);
      CGRectGetWidth(v42);
      v43.origin.x = a2;
      v43.origin.y = a3;
      v43.size.width = a4;
      v43.size.height = a5;
      CGRectGetMinY(v43);
      [v24 frame];
      CGRectGetHeight(v44);
      v17(v13, v16, v10);
      sub_10077C8C0();
      double v26 = v25;
      double v28 = v27;
      v22(v13, v10);
      objc_msgSend(v24, "setPosition:", v26, v28);
      [v24 setZPosition:0.0];
      if (v37)
      {
        id v29 = (id)sub_10077D030();
LABEL_14:
        uint64_t v30 = v29;
        [v29 frame];
        CGRectGetWidth(v45);
        v46.origin.x = a2;
        v46.origin.y = a3;
        v46.size.width = a4;
        v46.size.height = a5;
        CGRectGetMinY(v46);
        [v30 frame];
        CGRectGetHeight(v47);
        v17(v13, v16, v10);
        sub_10077C8C0();
        double v32 = v31;
        double v34 = v33;
        v22(v13, v10);
        objc_msgSend(v30, "setPosition:", v32, v34);
        [v30 setZPosition:0.0];

        return;
      }
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
      {
        id v29 = *(id *)(a1 + 48);
        goto LABEL_14;
      }
LABEL_21:
      __break(1u);
      return;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      id v23 = *(id *)(a1 + 40);
      goto LABEL_10;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_10077D140();
  swift_bridgeObjectRelease();
  if (v35 == 3) {
    goto LABEL_3;
  }
}

void sub_100760B08(unint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = sub_10077D200();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  Class v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) != 4) {
      return;
    }
LABEL_3:
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    CGRectGetMidX(v47);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    CGRectGetMidY(v48);
    unint64_t v14 = a1 & 0xC000000000000001;
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v15 = (id)sub_10077D030();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_24;
      }
      id v15 = *(id *)(a1 + 32);
    }
    uint64_t v16 = v15;
    [v15 frame];
    CGRectGetWidth(v49);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    CGRectGetMaxY(v50);
    [v16 frame];
    CGRectGetHeight(v51);
    uint64_t v17 = enum case for FloatingPointRoundingRule.down(_:);
    CGRect v46 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
    v46(v13, enum case for FloatingPointRoundingRule.down(_:), v10);
    sub_10077C8C0();
    double v19 = v18;
    double v21 = v20;
    id v23 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v22 = v11 + 8;
    CGRect v45 = v23;
    v23(v13, v10);
    objc_msgSend(v16, "setPosition:", v19, v21);
    [v16 setZPosition:1.0];
    if (v14)
    {
      id v24 = (id)sub_10077D030();
LABEL_10:
      double v25 = v24;
      [v24 frame];
      CGRectGetWidth(v52);
      [v25 frame];
      CGRectGetHeight(v53);
      v46(v13, v17, v10);
      sub_10077C8C0();
      double v27 = v26;
      double v29 = v28;
      v45(v13, v10);
      objc_msgSend(v25, "setPosition:", v27, v29);
      [v25 setZPosition:0.0];
      unint64_t v43 = a1 & 0xC000000000000001;
      uint64_t v44 = v22;
      if (v14)
      {
        id v30 = (id)sub_10077D030();
LABEL_14:
        double v31 = v30;
        objc_msgSend(v25, "position", v43, v44);
        [v31 frame];
        CGRectGetWidth(v54);
        [v25 position];
        v46(v13, v17, v10);
        sub_10077C8C0();
        double v33 = v32;
        double v35 = v34;
        v45(v13, v10);
        objc_msgSend(v31, "setPosition:", v33, v35);
        [v31 setZPosition:0.0];
        if (v43)
        {
          id v36 = (id)sub_10077D030();
LABEL_18:
          unint64_t v37 = v36;
          [v16 position];
          [v37 frame];
          CGRectGetWidth(v55);
          [v16 position];
          v46(v13, v17, v10);
          sub_10077C8C0();
          double v39 = v38;
          double v41 = v40;
          v45(v13, v10);
          objc_msgSend(v37, "setPosition:", v39, v41);
          [v37 setZPosition:1.0];

          return;
        }
        if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 4uLL)
        {
          id v36 = *(id *)(a1 + 56);
          goto LABEL_18;
        }
LABEL_26:
        __break(1u);
        return;
      }
      if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v30 = *(id *)(a1 + 40);
        goto LABEL_14;
      }
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
    {
      id v24 = *(id *)(a1 + 48);
      goto LABEL_10;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_10077D140();
  swift_bridgeObjectRelease();
  if (v42 == 4) {
    goto LABEL_3;
  }
}

ValueMetadata *type metadata accessor for OfferStateActionImplementation()
{
  return &type metadata for OfferStateActionImplementation;
}

uint64_t sub_10076107C()
{
  return sub_100761A98((unint64_t *)&unk_100973470, (void (*)(uint64_t))&type metadata accessor for OfferStateAction);
}

uint64_t sub_1007610B0(uint64_t *a1, uint64_t a2)
{
  return sub_10076156C(*a1, a2);
}

uint64_t sub_1007610B8(uint64_t a1)
{
  uint64_t v2 = sub_10077AE60();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  __chkstk_darwin(v2);
  double v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10077B6E0();
  uint64_t v28 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v27 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_10000D280((uint64_t *)&unk_10094B740);
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000D280((uint64_t *)&unk_10094C410);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000D280((uint64_t *)&unk_10094B750);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  double v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1;
  swift_retain();
  sub_10077B310();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_10005CB1C((uint64_t)v14);
    sub_10000D280(&qword_10094BA30);
    sub_10005BC28();
    swift_allocError();
    *double v19 = 1;
    uint64_t v20 = sub_10077B940();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    uint64_t v35[3] = sub_100777F70();
    v35[4] = sub_100761A98((unint64_t *)&qword_10094C420, (void (*)(uint64_t))&type metadata accessor for Action);
    v35[0] = v34;
    swift_retain();
    sub_10059D318();
    uint64_t v21 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v27, v8, v4);
    uint64_t v22 = v29;
    sub_10077AE40();
    sub_10077B2E0();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v33);
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v11, v8, v4);
    uint64_t v24 = v30;
    uint64_t v23 = v31;
    (*(void (**)(char *, void, uint64_t))(v30 + 104))(v11, enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:), v31);
    uint64_t v20 = sub_10077B3A0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v35);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  swift_release();
  return v20;
}

uint64_t sub_10076156C(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = sub_10076B670();
  uint64_t v38 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  v33[0] = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  double v40 = (char *)v33 - v5;
  __chkstk_darwin(v6);
  unint64_t v37 = (char *)v33 - v7;
  uint64_t v8 = sub_10000D280((uint64_t *)&unk_10094B750);
  uint64_t v34 = *(void *)(v8 - 8);
  uint64_t v35 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100777FD0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D280(&qword_10094BA30);
  uint64_t v39 = sub_10077B990();
  sub_100778380();
  swift_getObjectType();
  sub_10076F130();
  sub_10076B8F0();
  swift_unknownObjectRelease();
  uint64_t v15 = v11;
  uint64_t v16 = v40;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v15);
  id v36 = v10;
  v33[1] = a2;
  double v18 = v37;
  uint64_t v17 = v38;
  sub_100778370();
  uint64_t v19 = sub_10076F100();
  swift_getObjectType();
  sub_10076F120();
  uint64_t v20 = v41;
  sub_10076B7F0();
  char v21 = sub_10076B660();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v22(v16, v18, v20);
  if (v21)
  {
    double v40 = *(char **)(v17 + 8);
    ((void (*)(char *, uint64_t))v40)(v16, v20);
    goto LABEL_4;
  }
  char v23 = sub_10076B610();
  double v40 = *(char **)(v17 + 8);
  ((void (*)(char *, uint64_t))v40)(v16, v20);
  if (v23)
  {
LABEL_4:
    uint64_t v24 = sub_10076F0E0();
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    double v27 = v36;
    if (!v24)
    {
      swift_retain();
      uint64_t v24 = v19;
    }
    goto LABEL_12;
  }
  uint64_t v28 = v33[0];
  v22((char *)v33[0], v18, v20);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 88))(v28, v20) == enum case for LegacyAppState.openable(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v28, v20);

    uint64_t v29 = sub_100771540();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
    uint64_t v30 = sub_10076F0F0();
    double v27 = v36;
    if (v30)
    {
      uint64_t v24 = v30;
    }
    else
    {
      swift_retain();
      uint64_t v24 = v19;
    }
    uint64_t v26 = v34;
    uint64_t v25 = v35;
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v40)(v28, v20);
    swift_retain();
    uint64_t v24 = v19;
    uint64_t v26 = v34;
    uint64_t v25 = v35;
    double v27 = v36;
  }
LABEL_12:
  sub_1007610B8(v24);
  swift_release();
  uint64_t v31 = v39;
  sub_10077B910();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  ((void (*)(char *, uint64_t))v40)(v18, v41);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
  return v31;
}

uint64_t sub_100761A98(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100761AEC(uint64_t a1, int a2, char a3, char a4)
{
  uint64_t v5 = v4;
  int v54 = a2;
  uint64_t v9 = sub_10000D280(&qword_100973480);
  __chkstk_darwin(v9 - 8);
  uint64_t v56 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000D280(&qword_100964538);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_bodyLabel];
  uint64_t v55 = a1;
  if ((a3 & 1) == 0)
  {
LABEL_5:
    uint64_t v26 = (void *)sub_10076D9F0();
    id v27 = [v5 traitCollection];
    id v28 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:v26];
    id v53 = [v26 length];
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = 0;
    *(void *)(v29 + 24) = v27;
    *(void *)(v29 + 32) = v28;
    *(unsigned char *)(v29 + 40) = 1;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_10002C3F0;
    *(void *)(v30 + 24) = v29;
    uint64_t v62 = sub_1000AAC20;
    uint64_t v63 = v30;
    aBlock = _NSConcreteStackBlock;
    uint64_t v59 = 1107296256;
    uint64_t v60 = sub_10002B36C;
    uint64_t v61 = &unk_1008A8DA8;
    uint64_t v31 = _Block_copy(&aBlock);
    id v32 = v27;
    id v24 = v28;
    swift_retain();
    swift_release();
    objc_msgSend(v26, "enumerateAttributesInRange:options:usingBlock:", 0, v53, 0x100000, v31);
    _Block_release(v31);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_7;
  }
  if (a4)
  {
    sub_10076D9A0();
    id v16 = [v5 traitCollection];
    sub_10076C800();

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v17 = v57;
    id v18 = [v5 traitCollection];
    id v19 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:v17];
    id v20 = [v17 length];
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = 0;
    *(void *)(v21 + 24) = v18;
    *(void *)(v21 + 32) = v19;
    *(unsigned char *)(v21 + 40) = 1;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_10002C820;
    *(void *)(v22 + 24) = v21;
    uint64_t v62 = sub_1003D6B28;
    uint64_t v63 = v22;
    aBlock = _NSConcreteStackBlock;
    uint64_t v59 = 1107296256;
    uint64_t v60 = sub_10002B36C;
    uint64_t v61 = &unk_1008A8E98;
    char v23 = _Block_copy(&aBlock);
    id v53 = v18;
    id v24 = v19;
    swift_retain();
    swift_release();
    objc_msgSend(v17, "enumerateAttributesInRange:options:usingBlock:", 0, v20, 0x100000, v23);
    _Block_release(v23);
    char v25 = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v25 & 1) == 0) {
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v34 = (void *)sub_10076D9B0();
  id v35 = [v5 traitCollection];
  id v36 = [objc_allocWithZone((Class)NSMutableAttributedString) initWithAttributedString:v34];
  id v37 = [v34 length];
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = 0;
  *(void *)(v38 + 24) = v35;
  *(void *)(v38 + 32) = v36;
  *(unsigned char *)(v38 + 40) = 1;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = sub_10002C820;
  *(void *)(v39 + 24) = v38;
  uint64_t v62 = sub_1003D6B28;
  uint64_t v63 = v39;
  aBlock = _NSConcreteStackBlock;
  uint64_t v59 = 1107296256;
  uint64_t v60 = sub_10002B36C;
  uint64_t v61 = &unk_1008A8E20;
  double v40 = _Block_copy(&aBlock);
  id v53 = v35;
  id v24 = v36;
  swift_retain();
  swift_release();
  objc_msgSend(v34, "enumerateAttributesInRange:options:usingBlock:", 0, v37, 0x100000, v40);
  _Block_release(v40);
  LOBYTE(v40) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  id result = (id)swift_release();
  if (v40)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  sub_10074CCF8(v24);

  uint64_t v42 = OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed;
  int v43 = *(unsigned __int8 *)(v15 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed);
  char v44 = v54;
  *(unsigned char *)(v15 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_isCollapsed) = v54 & 1;
  if (v44) {
    uint64_t v45 = *(void *)(v15 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_collapsedNumberOfLines);
  }
  else {
    uint64_t v45 = 0;
  }
  [*(id *)(v15 + OBJC_IVAR____TtC20ProductPageExtension18ExpandableTextView_textLabel) setNumberOfLines:v45];
  if (v43 != *(unsigned __int8 *)(v15 + v42)) {
    sub_10074B870();
  }
  uint64_t v46 = sub_10076DA00();
  CGRect v47 = (uint64_t *)&v5[OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitle];
  uint64_t *v47 = v46;
  v47[1] = v48;
  swift_bridgeObjectRelease();
  sub_1003F0454();
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleArtwork] = sub_10076D9C0();
  swift_retain();
  swift_release();
  sub_1003F0454();
  swift_release();
  uint64_t v49 = (uint64_t)v56;
  sub_10076D9E0();
  uint64_t v50 = sub_10076D9D0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 0, 1, v50);
  uint64_t v51 = (uint64_t)&v5[OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleArtworkAlignment];
  swift_beginAccess();
  sub_10076231C(v49, v51);
  swift_endAccess();
  sub_1003F0454();
  sub_1003F0DD4(v49);
  return [v5 setNeedsLayout];
}

uint64_t sub_1007622F4()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100762304(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100762314()
{
  return swift_release();
}

uint64_t sub_10076231C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000D280(&qword_100973480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100762388()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10076239C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t LinkableHeaderViewLayout.init(metrics:topSeparator:text:bottomSeparator:)@<X0>(_OWORD *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, long long *a4@<X3>, _OWORD *a5@<X8>)
{
  long long v8 = a1[7];
  a5[6] = a1[6];
  a5[7] = v8;
  long long v9 = a1[9];
  a5[8] = a1[8];
  a5[9] = v9;
  long long v10 = a1[3];
  a5[2] = a1[2];
  a5[3] = v10;
  long long v11 = a1[5];
  a5[4] = a1[4];
  a5[5] = v11;
  long long v12 = a1[1];
  *a5 = *a1;
  a5[1] = v12;
  sub_10000F8DC(a2, (uint64_t)(a5 + 10));
  sub_10000F8DC(a3, (uint64_t)a5 + 200);

  return sub_10000F8DC(a4, (uint64_t)(a5 + 15));
}

uint64_t LinkableHeaderViewLayout.placeChildren(relativeTo:in:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_10077D200();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FA3C(v4 + 20, v4[23]);
  sub_100779110();
  CGFloat v34 = v15;
  CGFloat v35 = v14;
  v37.origin.x = a1;
  v37.origin.y = a2;
  v37.size.width = a3;
  v37.size.height = a4;
  CGFloat MinX = CGRectGetMinX(v37);
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  CGFloat MinY = CGRectGetMinY(v38);
  sub_10000FA3C(v4 + 20, v4[23]);
  sub_100779090();
  v39.origin.x = a1;
  v39.origin.y = a2;
  v39.size.width = a3;
  v39.size.height = a4;
  CGRectGetWidth(v39);
  sub_10000FA3C(v5, v5[3]);
  sub_1000F6F40();
  sub_100779260();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  CGFloat v32 = a1;
  v40.origin.x = a1;
  v40.origin.y = a2;
  v40.size.width = a3;
  v40.size.height = a4;
  CGRectGetHeight(v40);
  sub_10000FA3C(v5 + 25, v5[28]);
  sub_100779100();
  double v18 = v17;
  CGFloat v20 = v19;
  *(CGFloat *)&v31[1] = a2;
  v31[2] = v21;
  uint64_t v36 = v22;
  v41.origin.x = a1;
  v41.origin.y = a2;
  v41.size.width = a3;
  CGFloat v23 = a4;
  v41.size.height = a4;
  CGFloat v24 = CGRectGetMidX(v41) + v18 * -0.5;
  v42.origin.x = MinX;
  v42.size.height = v34;
  v42.origin.y = MinY;
  v42.size.width = v35;
  double MaxY = CGRectGetMaxY(v42);
  sub_10000FA3C(v5 + 5, v5[8]);
  sub_100779280();
  CGFloat v27 = MaxY + v26;
  sub_10000FA3C(v5 + 25, v5[28]);
  sub_100779090();
  sub_10000FA3C(v5 + 30, v5[33]);
  sub_100779110();
  CGFloat v34 = v29;
  CGFloat v35 = v28;
  v43.origin.x = v32;
  v43.origin.y = a2;
  v43.size.width = a3;
  v43.size.height = v23;
  CGRectGetMinX(v43);
  v44.origin.x = v24;
  v44.origin.y = v27;
  v44.size.width = v18;
  v44.size.height = v20;
  CGRectGetMaxY(v44);
  sub_10000FA3C(v5 + 10, v5[13]);
  sub_100779250();
  sub_10000FA3C(v4 + 30, v4[33]);
  sub_100779090();
  return sub_100779010();
}

double LinkableHeaderViewLayout.measurements(fitting:in:)(uint64_t a1, double a2)
{
  swift_getObjectType();

  return sub_1007628DC(a2, a1, v2);
}

uint64_t LinkableHeaderViewLayout.Metrics.bottomSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10003FC84(v1 + 120, a1);
}

uint64_t LinkableHeaderViewLayout.Metrics.bottomSpace.setter(uint64_t a1)
{
  return sub_10020B9B0(a1, v1 + 120);
}

uint64_t LinkableHeaderViewLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_10003FB38(v1, a1);
}

double sub_1007628DC(double a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_10077D200();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FA3C(a3, a3[3]);
  sub_1000F6F40();
  sub_100779260();
  long long v9 = *(void (**)(char *, uint64_t))(v6 + 8);
  v9(v8, v5);
  sub_10000FA3C(a3 + 25, a3[28]);
  sub_100779100();
  sub_10003FC84((uint64_t)(a3 + 15), (uint64_t)v12);
  if (v13)
  {
    sub_10000FA3C(v12, v13);
    sub_1000F6F40();
    sub_100779260();
    v9(v8, v5);
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v12);
  }
  else
  {
    sub_1000ED00C((uint64_t)v12);
  }
  sub_10000FA3C(a3 + 30, a3[33]);
  sub_100779110();
  sub_10000FA3C(a3 + 20, a3[23]);
  sub_100779110();
  sub_10000FA3C(a3 + 5, a3[8]);
  sub_100779280();
  sub_10000FA3C(a3 + 10, a3[13]);
  sub_100779250();
  return a1;
}

uint64_t destroy for LinkableHeaderViewLayout(uint64_t a1)
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 40);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 80);
  if (*(void *)(a1 + 144)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
  }
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 160);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 200);

  return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 240);
}

uint64_t initializeWithCopy for LinkableHeaderViewLayout(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  uint64_t v7 = (_OWORD *)(a1 + 120);
  long long v8 = (_OWORD *)(a2 + 120);
  uint64_t v9 = *(void *)(a2 + 144);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v9;
    *(void *)(a1 + 152) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 136);
    *uint64_t v7 = *v8;
    *(_OWORD *)(a1 + 136) = v11;
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
  }
  long long v12 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 160, a2 + 160);
  long long v13 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 200, a2 + 200);
  uint64_t v14 = *(void *)(a2 + 264);
  uint64_t v15 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v14;
  *(void *)(a1 + 272) = v15;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 240, a2 + 240);
  return a1;
}

uint64_t assignWithCopy for LinkableHeaderViewLayout(uint64_t a1, uint64_t a2)
{
  sub_100032D7C((uint64_t *)a1, (uint64_t *)a2);
  sub_100032D7C((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  sub_100032D7C((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  uint64_t v4 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v4)
    {
      *(void *)(a1 + 144) = v4;
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 120, a2 + 120);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 120);
    long long v6 = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(_OWORD *)(a1 + 120) = v5;
    *(_OWORD *)(a1 + 136) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
    goto LABEL_7;
  }
  sub_100032D7C((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
LABEL_8:
  sub_100032D7C((uint64_t *)(a1 + 160), (uint64_t *)(a2 + 160));
  sub_100032D7C((uint64_t *)(a1 + 200), (uint64_t *)(a2 + 200));
  sub_100032D7C((uint64_t *)(a1 + 240), (uint64_t *)(a2 + 240));
  return a1;
}

void *initializeWithTake for LinkableHeaderViewLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x118uLL);
}

uint64_t assignWithTake for LinkableHeaderViewLayout(uint64_t a1, uint64_t a2)
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
  }
  long long v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 160);
  long long v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 240);
  long long v8 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v8;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  return a1;
}

uint64_t getEnumTagSinglePayload for LinkableHeaderViewLayout(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 280)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LinkableHeaderViewLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
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
    *(_OWORD *)(result + 264) = 0u;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 280) = 1;
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
    *(unsigned char *)(result + 280) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LinkableHeaderViewLayout()
{
  return &type metadata for LinkableHeaderViewLayout;
}

uint64_t destroy for LinkableHeaderViewLayout.Metrics(uint64_t a1)
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 40);
  uint64_t result = _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 80);
  if (*(void *)(a1 + 144))
  {
    return _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
  }
  return result;
}

uint64_t initializeWithCopy for LinkableHeaderViewLayout.Metrics(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  long long v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  long long v7 = (_OWORD *)(a1 + 120);
  long long v8 = (_OWORD *)(a2 + 120);
  uint64_t v9 = *(void *)(a2 + 144);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v9;
    *(void *)(a1 + 152) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    long long v11 = *(_OWORD *)(a2 + 136);
    *long long v7 = *v8;
    *(_OWORD *)(a1 + 136) = v11;
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
  }
  return a1;
}

uint64_t assignWithCopy for LinkableHeaderViewLayout.Metrics(uint64_t a1, uint64_t a2)
{
  sub_100032D7C((uint64_t *)a1, (uint64_t *)a2);
  sub_100032D7C((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  sub_100032D7C((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  uint64_t v4 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v4)
    {
      *(void *)(a1 + 144) = v4;
      *(void *)(a1 + 152) = *(void *)(a2 + 152);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 120, a2 + 120);
      return a1;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 120);
    long long v6 = *(_OWORD *)(a2 + 136);
    *(void *)(a1 + 152) = *(void *)(a2 + 152);
    *(_OWORD *)(a1 + 120) = v5;
    *(_OWORD *)(a1 + 136) = v6;
    return a1;
  }
  if (!v4)
  {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
    goto LABEL_7;
  }
  sub_100032D7C((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  return a1;
}

uint64_t assignWithTake for LinkableHeaderViewLayout.Metrics(uint64_t a1, uint64_t a2)
{
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  if (*(void *)(a1 + 144)) {
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(a1 + 120);
  }
  long long v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  return a1;
}

ValueMetadata *type metadata accessor for LinkableHeaderViewLayout.Metrics()
{
  return &type metadata for LinkableHeaderViewLayout.Metrics;
}

uint64_t sub_10076346C(unint64_t a1, uint64_t a2)
{
  unint64_t v4 = a1;
  unint64_t v24 = a1;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v19 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    id v16 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_10000F7E8(*(void *)(a2 + 56) + 32 * i, (uint64_t)v23);
    *(void *)&long long v22 = v18;
    *((void *)&v22 + 1) = v17;
    v21[0] = v22;
    v21[1] = v23[0];
    _OWORD v21[2] = v23[1];
    swift_bridgeObjectRetain();
    sub_100764F1C(&v24, (uint64_t *)v21, &v20);
    sub_10000FA80((uint64_t)v21, &qword_100973700);
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v4;
    }
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v4 = v20;
    unint64_t v24 = v20;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v10++, 1)) {
      break;
    }
    if (v10 >= v19) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    if (!v14)
    {
      int64_t v15 = v10 + 1;
      if (v10 + 1 >= v19) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14) {
        goto LABEL_16;
      }
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v19) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14) {
        goto LABEL_16;
      }
      int64_t v15 = v10 + 3;
      if (v10 + 3 >= v19) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14)
      {
LABEL_16:
        int64_t v10 = v15;
        goto LABEL_17;
      }
      int64_t v15 = v10 + 4;
      if (v10 + 4 < v19)
      {
        unint64_t v14 = *(void *)(v5 + 8 * v15);
        if (!v14)
        {
          while (1)
          {
            int64_t v10 = v15 + 1;
            if (__OFADD__(v15, 1)) {
              goto LABEL_29;
            }
            if (v10 >= v19) {
              goto LABEL_26;
            }
            unint64_t v14 = *(void *)(v5 + 8 * v10);
            ++v15;
            if (v14) {
              goto LABEL_17;
            }
          }
        }
        goto LABEL_16;
      }
LABEL_26:
      swift_release();
      return v4;
    }
LABEL_17:
    unint64_t v8 = (v14 - 1) & v14;
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_100763684()
{
  uint64_t v0 = sub_10077B9D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10077B9F0();
  sub_1000104E8(v4, qword_100973488);
  sub_10000D2C4(v4, (uint64_t)qword_100973488);
  if (qword_100949CE0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_10000D2C4(v0, (uint64_t)qword_1009AD5B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_10077B9E0();
}

id sub_1007637D8()
{
  uint64_t v0 = (void *)sub_1007657DC();

  return v0;
}

uint64_t sub_100763804(uint64_t a1)
{
  uint64_t v3 = sub_10077B880();
  __n128 v4 = __chkstk_darwin(v3);
  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
  (*(void (**)(char *, uint64_t, __n128))(v7 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  id v8 = objc_allocWithZone((Class)sub_1007724F0());
  id v9 = v6;
  return sub_100772500();
}

void sub_1007638E8()
{
  uint64_t v1 = sub_100779CC0();
  __chkstk_darwin(v1 - 8);
  sub_100779CB0();
  id v2 = objc_allocWithZone((Class)sub_100779CE0());
  uint64_t v3 = (void *)sub_100779CD0();
  __n128 v4 = *(void **)(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
  sub_10000D280((uint64_t *)&unk_10094BD00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10078E350;
  *(void *)(v5 + 32) = v3;
  sub_10077BEE0();
  sub_100019840(0, (unint64_t *)&qword_10094D450);
  id v6 = v3;
  Class isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();
  [v4 setViewControllers:isa];
}

uint64_t sub_100763A2C(uint64_t a1)
{
  uint64_t v25 = sub_10077AE60();
  uint64_t v2 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  CGFloat v23 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000D280((uint64_t *)&unk_10094B750);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000D280(&qword_100973708);
  __chkstk_darwin(v8 - 8);
  int64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000510E4(a1);
  sub_10000D280(&qword_100958C20);
  uint64_t v24 = v2;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10078DE50;
  long long v12 = (objc_class *)sub_100771A20();
  uint64_t v13 = sub_1007719D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  id v14 = objc_allocWithZone(v12);
  int64_t v15 = (void *)sub_1007719E0();
  uint64_t v28 = (uint64_t)v15;
  sub_10077AE50();

  id v16 = [objc_allocWithZone((Class)type metadata accessor for AppEventLiveIndicatorAnimationCoordinator()) init];
  uint64_t v28 = (uint64_t)v16;
  sub_10077AE50();

  uint64_t v17 = v26;
  sub_100763DE8();
  sub_10077AE50();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v28 = v11;
  sub_10000D280(&qword_10094D130);
  sub_100051984();
  uint64_t v18 = sub_10077B2F0();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v19 = *(void *)(v17 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_adAttributionManager);
  if (v19)
  {
    sub_100771BF0();
    uint64_t v28 = v19;
    swift_retain();
    swift_retain();
    unint64_t v20 = v23;
    sub_10077AE50();
    uint64_t v21 = sub_10077B2E0();
    swift_release();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v25);
    return v21;
  }
  return v18;
}

uint64_t sub_100763DE8()
{
  sub_10076CAB0();
  sub_10077B3B0();
  sub_10000D280((uint64_t *)&unk_10094B750);
  sub_100766E34();
  sub_10077B390();
  sub_100766E88();
  sub_10077B390();
  sub_100766EDC();
  sub_10077B390();
  sub_100766F30();
  sub_10077B390();
  sub_100766F84();
  sub_10077B390();
  sub_100766FD8();
  sub_10077B390();
  sub_10076702C();
  sub_10077B390();
  sub_100767080();
  sub_10077B390();
  sub_1007670D4();
  sub_10077B390();
  sub_100767128();
  sub_10077B390();
  sub_10076717C();
  sub_10077B390();
  sub_1007671D0();
  sub_10077B390();
  sub_100767224();
  sub_10077B390();
  sub_100767278();
  sub_10077B390();
  sub_1004490E0();
  sub_10077B390();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_1007672CC((uint64_t)&v8, (uint64_t)v10);
  sub_100767328();
  sub_10077B390();
  sub_10076737C((uint64_t)v10);
  sub_1007657DC();
  sub_10000D280(&qword_100973788);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_10078FBD0;
  *(void *)(v1 + 56) = &type metadata for ArticlePresentingFlowActionLogic;
  *(void *)(v1 + 64) = &off_10088B2B8;
  *(void *)(v1 + 96) = &type metadata for ArcadeWelcomeFlowActionLogic;
  *(void *)(v1 + 104) = &off_1008A7998;
  *(void *)(v1 + 136) = &type metadata for NavigationControllerFlowActionLogic;
  *(void *)(v1 + 144) = &off_100891160;
  *(void *)(v1 + 176) = &type metadata for TabBarControllerFlowActionLogic;
  *(void *)(v1 + 184) = &off_100893D20;
  *(void *)(v1 + 216) = &type metadata for RootFlowActionLogic;
  *(void *)(v1 + 224) = &off_10088F320;
  type metadata accessor for FlowActionImplementation();
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  *(void *)(v2 + 24) = v1;
  v10[0] = v2;
  sub_1007673D0();
  sub_10077B390();
  swift_release();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_10002A2A8((uint64_t)&v8, (uint64_t)v10);
  sub_100767428();
  sub_10077B390();
  sub_10076747C((uint64_t)v10);
  sub_1007674D0();
  sub_10077B390();
  sub_100767524();
  sub_10077B390();
  sub_100767578();
  sub_10077B390();
  sub_1007675CC();
  sub_10077B390();
  sub_100767620();
  sub_10077B390();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_100767674((uint64_t)&v8, (uint64_t)v10);
  sub_1007676D0();
  sub_10077B390();
  sub_100767724((uint64_t)v10);
  sub_100767778();
  sub_10077B390();
  sub_1007677CC();
  sub_10077B390();
  sub_100767820();
  sub_10077B390();
  sub_100767874();
  sub_10077B390();
  sub_1007678C8();
  sub_10077B390();
  sub_10076791C();
  sub_10077B390();
  uint64_t v3 = v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_ppeInteractionObserver;
  swift_unknownObjectWeakLoadStrong();
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v9 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = v4;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_1004D6388((uint64_t)&v8, (uint64_t)v10);
  sub_100767970();
  sub_10077B390();
  sub_1007679C4((uint64_t)v10);
  sub_100767A18();
  sub_10077B390();
  swift_unknownObjectWeakLoadStrong();
  uint64_t v5 = *(void *)(v3 + 8);
  uint64_t v9 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = v5;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_1004D6388((uint64_t)&v8, (uint64_t)v10);
  sub_100767A6C();
  sub_10077B390();
  sub_100767AC0((uint64_t)v10);
  sub_100767B14();
  sub_10077B390();
  sub_100767B68();
  sub_10077B390();
  sub_100767BBC();
  sub_10077B390();
  sub_1006445F0();
  sub_10077B390();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_10002A2A8((uint64_t)&v8, (uint64_t)v10);
  sub_100767C10();
  sub_10077B390();
  sub_100767C64((uint64_t)v10);
  sub_100767CB8();
  sub_10077B390();
  sub_100767D0C();
  sub_10077B390();
  sub_100767D60();
  sub_10077B390();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_100767DB4((uint64_t)&v8, (uint64_t)v10);
  sub_100767E10();
  sub_10077B390();
  sub_100767E64((uint64_t)v10);
  sub_100767EB8();
  sub_10077B390();
  sub_100767F0C();
  sub_10077B390();
  sub_100767F60();
  sub_10077B390();
  sub_1007657DC();
  swift_unknownObjectUnownedInit();
  sub_10002A2A8((uint64_t)&v8, (uint64_t)v10);
  sub_100767FB4();
  sub_10077B390();
  sub_100768008((uint64_t)v10);
  swift_unknownObjectWeakLoadStrong();
  uint64_t v6 = *(void *)(v3 + 8);
  uint64_t v9 = 0;
  swift_unknownObjectWeakInit();
  uint64_t v9 = v6;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  sub_10076805C((uint64_t)&v8, (uint64_t)v10);
  sub_1007680B8();
  sub_10077B390();
  return sub_10076810C((uint64_t)v10);
}

uint64_t sub_1007645B4(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = a2;
  uint64_t v4 = sub_10076DEF0();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000D280(&qword_100973708);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for AdHeaderProvider();
  sub_10077B310();
  uint64_t v30 = v31;
  sub_100019840(0, &qword_100967FF0);
  sub_10076CAB0();
  sub_10077B8E0();
  int64_t v10 = v31;
  sub_100771A20();
  sub_10077B8E0();
  uint64_t v11 = v31;
  long long v12 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
  void *v9 = v12;
  uint64_t v13 = enum case for URLProtocolDelegate.DialogStyle.alert(_:);
  uint64_t v14 = sub_1007719D0();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v15 + 104))(v9, v13, v14);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v9, 0, 1, v14);
  id v16 = v12;
  sub_1007719F0();
  [v10 setDelegate:v11];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = Strong;
    *(void *)(Strong + OBJC_IVAR___RootViewController_objectGraph) = a1;
    swift_retain();
    swift_release();
    uint64_t v19 = *(void **)(v18 + OBJC_IVAR___RootViewController_storeNavigationController);
    *(void *)(v18 + OBJC_IVAR___RootViewController_storeNavigationController) = v16;
    id v20 = v16;

    *(void *)(v18 + OBJC_IVAR___RootViewController_freshnessWatchdog) = v27;
    swift_retain();
    swift_unknownObjectRelease();
    swift_release();
  }
  uint64_t v21 = swift_unknownObjectWeakLoadStrong();
  if (v21)
  {
    long long v22 = (char *)v21;
    uint64_t v24 = v28;
    uint64_t v23 = v29;
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(v6, enum case for BootstrapPhase.initialBootstrap(_:), v29);
    sub_1007764B0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v23);
    if (*(void *)&v22[OBJC_IVAR___RootViewController_freshnessWatchdog])
    {
      swift_retain();
      sub_100771360();
      swift_release();
    }
    [v22 loadDidFinish];

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return swift_release();
}

uint64_t sub_100764944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v4 = sub_10000D280(&qword_100962D90);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100769DC0();
  uint64_t v36 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v10 - 8);
  long long v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10076A040();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v18 = __chkstk_darwin(v17).n128_u64[0];
  id v20 = (char *)&v31 - v19;
  uint64_t v34 = v2;
  id v21 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_lookupItem), "productPageURL", v18);
  if (!v21)
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    v24(v12, 1, 1, v13);
    goto LABEL_5;
  }
  long long v22 = v21;
  uint64_t v32 = v7;
  uint64_t v35 = a2;
  sub_10076A000();

  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v23(v12, v16, v13);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v24(v12, 0, 1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    a2 = v35;
LABEL_5:
    sub_10000FA80((uint64_t)v12, (uint64_t *)&unk_10094FEE0);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v24)(a2, 1, 1, v13);
  }
  v23(v20, v12, v13);
  sub_100769D60();
  uint64_t v26 = v36;
  uint64_t v27 = v32;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v6, 1, v32) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v9, v6, v27);
    sub_10076DE40();
    sub_10077B2A0();
    uint64_t v28 = (void *)sub_10076DD10();
    uint64_t v29 = swift_bridgeObjectRetain();
    uint64_t v30 = sub_100765CFC(v29, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10076346C((unint64_t)_swiftEmptyArrayStorage, v30);
    swift_release();
    sub_100769D50();
    sub_100769D70();
    swift_release();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v32);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v20, v13);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v13);
  sub_10000FA80((uint64_t)v6, &qword_100962D90);
  a2 = v35;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v24)(a2, 1, 1, v13);
}

void sub_100764DB4()
{
  uint64_t v1 = sub_100779D90();
  __chkstk_darwin(v1 - 8);
  swift_errorRetain();
  sub_100779D80();
  id v2 = objc_allocWithZone((Class)sub_100779DB0());
  swift_retain();
  uint64_t v3 = (void *)sub_100779DA0();
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
  sub_10000D280((uint64_t *)&unk_10094BD00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10078E350;
  *(void *)(v5 + 32) = v3;
  sub_10077BEE0();
  sub_100019840(0, (unint64_t *)&qword_10094D450);
  id v6 = v3;
  Class isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();
  [v4 setViewControllers:isa];
}

uint64_t sub_100764F1C@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v23 = sub_100769D30();
  uint64_t v6 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - v10;
  unint64_t v12 = *a1;
  uint64_t v13 = a2[1];
  uint64_t v25 = *a2;
  uint64_t v26 = v13;
  sub_10000F7E8((uint64_t)(a2 + 2), (uint64_t)v27);
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    sub_100769D20();
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_10049AF1C(0, *(void *)(v12 + 16) + 1, 1, v12);
    }
    uint64_t v14 = v23;
    unint64_t v16 = *(void *)(v12 + 16);
    unint64_t v15 = *(void *)(v12 + 24);
    if (v16 >= v15 >> 1) {
      unint64_t v12 = sub_10049AF1C(v15 > 1, v16 + 1, 1, v12);
    }
    *(void *)(v12 + 16) = v16 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v16, v11, v14);
  }
  else
  {
    uint64_t v18 = a2[1];
    uint64_t v25 = *a2;
    uint64_t v26 = v18;
    sub_10000F7E8((uint64_t)(a2 + 2), (uint64_t)v27);
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      uint64_t v25 = v24;
      sub_10077D1F0();
      sub_100769D20();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v12 = sub_10049AF1C(0, *(void *)(v12 + 16) + 1, 1, v12);
      }
      uint64_t v19 = v23;
      unint64_t v21 = *(void *)(v12 + 16);
      unint64_t v20 = *(void *)(v12 + 24);
      if (v21 >= v20 >> 1) {
        unint64_t v12 = sub_10049AF1C(v20 > 1, v21 + 1, 1, v12);
      }
      *(void *)(v12 + 16) = v21 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v21, v8, v19);
    }
  }
  *a3 = v12;
  return result;
}

uint64_t sub_10076522C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F76C(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_delegate);
  sub_10000F76C(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_ppeInteractionObserver);

  return swift_release();
}

uint64_t sub_1007652C0()
{
  sub_10000F76C(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC20ProductPageExtension13BaseBootstrap_logger;
  uint64_t v2 = sub_10077B280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F76C(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_delegate);
  sub_10000F76C(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_ppeInteractionObserver);

  swift_release();
  return v0;
}

uint64_t sub_1007653E4()
{
  sub_1007652C0();

  return swift_deallocClassInstance();
}

uint64_t sub_10076543C()
{
  return type metadata accessor for ProductPageBootstrap();
}

uint64_t type metadata accessor for ProductPageBootstrap()
{
  uint64_t result = qword_100973508;
  if (!qword_100973508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100765490()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_100765510(uint64_t a1, void *a2)
{
  return sub_100765EB8(a2);
}

uint64_t sub_100765518(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_10000D280(&qword_100957EC0);
  uint64_t result = sub_10077D190();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v30) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v30) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v30) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v30) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v30) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10000F7E8(*(void *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_100071430(v33, v32);
    sub_10077D310();
    swift_bridgeObjectRetain();
    sub_10077BD90();
    uint64_t result = sub_10077D360();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v19;
    v28[1] = v18;
    uint64_t result = (uint64_t)sub_100071430(v32, (_OWORD *)(*(void *)(v8 + 56) + 32 * v23));
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1007657DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100779CC0();
  __chkstk_darwin(v2 - 8);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC20ProductPageExtension13BaseBootstrap_isBootstrapping) & 1) == 0)
  {
    *(unsigned char *)(v0 + OBJC_IVAR____TtC20ProductPageExtension13BaseBootstrap_isBootstrapping) = 1;
    sub_100779CB0();
    id v3 = objc_allocWithZone((Class)sub_100779CE0());
    uint64_t v4 = (void *)sub_100779CD0();
    uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
    sub_10000D280((uint64_t *)&unk_10094BD00);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10078E350;
    *(void *)(v6 + 32) = v4;
    v12[0] = v6;
    sub_10077BEE0();
    sub_100019840(0, (unint64_t *)&qword_10094D450);
    id v7 = v4;
    Class isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
    [v5 setViewControllers:isa];

    sub_10004F644(v12);
    sub_10000FA3C(v12, v12[3]);
    sub_100771B40();
    uint64_t v9 = sub_100019840(0, (unint64_t *)&qword_1009577F0);
    swift_retain_n();
    v11[3] = v9;
    v11[4] = &protocol witness table for OS_dispatch_queue;
    v11[0] = sub_10077C350();
    sub_10077B930();
    swift_release();
    swift_release_n();
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v11);
    sub_10076B590();
    sub_10076B580();
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v12);
  }
  return *(void *)(v1 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
}

uint64_t sub_100765A28(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  char v24 = (unint64_t *)result;
  int64_t v4 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = a3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v28 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v33 = a4;
  unint64_t v25 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        unint64_t v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v9 = v8 | (v4 << 6);
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_42;
        }
        if (v10 >= v28) {
          return sub_100765518(v24, a2, v26, a3);
        }
        unint64_t v11 = *(void *)(v27 + 8 * v10);
        ++v4;
        if (!v11)
        {
          int64_t v4 = v10 + 1;
          if (v10 + 1 >= v28) {
            return sub_100765518(v24, a2, v26, a3);
          }
          unint64_t v11 = *(void *)(v27 + 8 * v4);
          if (!v11)
          {
            int64_t v4 = v10 + 2;
            if (v10 + 2 >= v28) {
              return sub_100765518(v24, a2, v26, a3);
            }
            unint64_t v11 = *(void *)(v27 + 8 * v4);
            if (!v11)
            {
              int64_t v12 = v10 + 3;
              if (v12 >= v28) {
                return sub_100765518(v24, a2, v26, a3);
              }
              unint64_t v11 = *(void *)(v27 + 8 * v12);
              if (!v11)
              {
                while (1)
                {
                  int64_t v4 = v12 + 1;
                  if (__OFADD__(v12, 1)) {
                    goto LABEL_43;
                  }
                  if (v4 >= v28) {
                    return sub_100765518(v24, a2, v26, a3);
                  }
                  unint64_t v11 = *(void *)(v27 + 8 * v4);
                  ++v12;
                  if (v11) {
                    goto LABEL_20;
                  }
                }
              }
              int64_t v4 = v12;
            }
          }
        }
LABEL_20:
        unint64_t v7 = (v11 - 1) & v11;
        unint64_t v9 = __clz(__rbit64(v11)) + (v4 << 6);
      }
      unint64_t v13 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v9);
      uint64_t v14 = *v13;
      uint64_t v15 = v13[1];
      sub_10000F7E8(*(void *)(a3 + 56) + 32 * v9, (uint64_t)v32);
      v30[0] = v14;
      v30[1] = v15;
      sub_10000F7E8((uint64_t)v32, (uint64_t)&v31);
      uint64_t v16 = v33[2];
      if (v16) {
        break;
      }
LABEL_4:
      swift_bridgeObjectRetain_n();
      sub_10000FA80((uint64_t)v30, &qword_100973700);
      _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v32);
      uint64_t result = swift_bridgeObjectRelease();
    }
    if (v33[4] != v14 || v33[5] != v15)
    {
      uint64_t result = sub_10077D230();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_37:
    swift_bridgeObjectRetain_n();
    sub_10000FA80((uint64_t)v30, &qword_100973700);
    _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v32);
    uint64_t result = swift_bridgeObjectRelease();
    *(unint64_t *)((char *)v24 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    if (__OFADD__(v26++, 1))
    {
      __break(1u);
      return sub_100765518(v24, a2, v26, a3);
    }
  }
  if (v16 == 1) {
    goto LABEL_4;
  }
  uint64_t v18 = v25;
  uint64_t v19 = 1;
  while (1)
  {
    uint64_t v20 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (*(v18 - 1) == v14 && *v18 == v15) {
      goto LABEL_37;
    }
    uint64_t result = sub_10077D230();
    if (result) {
      goto LABEL_37;
    }
    v18 += 2;
    ++v19;
    if (v20 == v16) {
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_100765CFC(uint64_t a1, void *a2)
{
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100765A28((uint64_t)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100765A28((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_100765EB8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10077B9F0();
  uint64_t v114 = *(void *)(v4 - 8);
  uint64_t v115 = v4;
  __chkstk_darwin(v4);
  v116 = (char *)v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  size_t v8 = (char *)v87 - v7;
  uint64_t v96 = sub_10077B360();
  uint64_t v95 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  uint64_t v94 = (char *)v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10076C0B0();
  uint64_t v107 = *(void *)(v10 - 8);
  uint64_t v108 = v10;
  __chkstk_darwin(v10);
  v110 = (char *)v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = sub_1007726E0();
  uint64_t v103 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v109 = (char *)v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_100773560();
  uint64_t v101 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  v106 = (char *)v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10077B1B0();
  __chkstk_darwin(v14 - 8);
  v104 = (char *)v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10000D280((uint64_t *)&unk_10094C740);
  __chkstk_darwin(v16 - 8);
  v100 = (char *)v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v98 = (char *)sub_1007787A0();
  uint64_t v97 = *((void *)v98 - 1);
  __chkstk_darwin(v98);
  v99 = (char *)v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000D280((uint64_t *)&unk_10094FEE0);
  __chkstk_darwin(v19 - 8);
  unint64_t v21 = (char *)v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  char v24 = (char *)v87 - v23;
  __chkstk_darwin(v25);
  uint64_t v92 = (char *)v87 - v26;
  __chkstk_darwin(v27);
  uint64_t v93 = (uint64_t)v87 - v28;
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)v87 - v30;
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)v87 - v33;
  uint64_t v35 = sub_10076A040();
  uint64_t v36 = *(void **)(v35 - 8);
  __chkstk_darwin(v35);
  CGRect v38 = (char *)v87 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = a1;
  sub_100764944((uint64_t)a1, (uint64_t)v34);
  v112 = (uint64_t (*)(char *, uint64_t, uint64_t))v36[6];
  v113 = v36 + 6;
  int v39 = v112(v34, 1, v35);
  uint64_t v117 = v35;
  if (v39 == 1)
  {
    CGRect v40 = v36;
    sub_10000FA80((uint64_t)v34, (uint64_t *)&unk_10094FEE0);
    if (qword_10094A218 != -1) {
      swift_once();
    }
    uint64_t v41 = v115;
    uint64_t v42 = sub_10000D2C4(v115, (uint64_t)qword_100973488);
    uint64_t v43 = v114;
    (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v116, v42, v41);
    sub_10000D280((uint64_t *)&unk_10094B830);
    sub_10077AFE0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DE60;
    sub_10077AF20();
    id v44 = [*(id *)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_lookupItem) productPageURL];
    uint64_t v45 = v40;
    if (v44)
    {
      uint64_t v46 = v44;
      sub_10076A000();

      uint64_t v47 = 0;
    }
    else
    {
      uint64_t v47 = 1;
    }
    uint64_t v58 = v117;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v45[7])(v21, v47, 1, v117);
    sub_10005B6F8((uint64_t)v21, (uint64_t)v24);
    if (v112(v24, 1, v58) == 1)
    {
      sub_10000FA80((uint64_t)v24, (uint64_t *)&unk_10094FEE0);
      long long v120 = 0u;
      long long v121 = 0u;
    }
    else
    {
      *((void *)&v121 + 1) = v58;
      uint64_t v59 = sub_10001054C((uint64_t *)&v120);
      ((void (*)(uint64_t *, char *, uint64_t))v45[4])(v59, v24, v58);
    }
    sub_10077AFB0();
    sub_10000FA80((uint64_t)&v120, &qword_10094BAD0);
    uint64_t v60 = v116;
    sub_10077B8B0();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v60, v41);
  }
  else
  {
    uint64_t v89 = v8;
    uint64_t v48 = (void (*)(char *, char *, uint64_t))v36[4];
    v87[1] = v36 + 4;
    v87[0] = v48;
    v48(v38, v34, v35);
    sub_10076CC20();
    uint64_t v49 = *(void **)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_lookupItem);
    uint64_t v50 = *(void *)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_promptString);
    uint64_t v51 = *(void *)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_promptString + 8);
    uint64_t v91 = v2;
    int v52 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_askToBuy);
    swift_bridgeObjectRetain();
    id v88 = v49;
    uint64_t v53 = ProductPage.init(lookupItem:promptString:askToBuy:)(v88, v50, v51, v52);
    uint64_t v54 = sub_100772990();
    swift_allocObject();
    swift_retain();
    uint64_t v90 = v53;
    uint64_t v55 = sub_100772980();
    uint64_t v122 = 0;
    long long v120 = 0u;
    long long v121 = 0u;
    (*(void (**)(char *, void, char *))(v97 + 104))(v99, enum case for FlowPage.product(_:), v98);
    uint64_t v56 = (void (*)(char *, char *, uint64_t))v36[2];
    unint64_t v98 = v38;
    v56(v31, v38, v35);
    v116 = (char *)v36;
    uint64_t v97 = v36[7];
    ((void (*)(char *, void, uint64_t, uint64_t))v97)(v31, 0, 1, v35);
    uint64_t v57 = sub_10076D3F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v100, 1, 1, v57);
    if (v55)
    {
      *((void *)&v119 + 1) = v54;
      *(void *)&long long v118 = v55;
    }
    else
    {
      long long v118 = 0u;
      long long v119 = 0u;
    }
    v100 = (char *)v55;
    swift_retain();
    sub_10077B190();
    (*(void (**)(char *, void, uint64_t))(v101 + 104))(v106, enum case for FlowPresentationContext.infer(_:), v102);
    (*(void (**)(char *, void, uint64_t))(v103 + 104))(v109, enum case for FlowAnimationBehavior.infer(_:), v105);
    (*(void (**)(char *, void, uint64_t))(v107 + 104))(v110, enum case for FlowOrigin.inapp(_:), v108);
    sub_10077B6F0();
    sub_10076C090();
    swift_allocObject();
    uint64_t v62 = (void *)sub_10076C040();
    uint64_t v63 = v91;
    id v64 = [(id)sub_1007657DC() traitCollection];
    uint64_t v122 = 0;
    long long v120 = 0u;
    long long v121 = 0u;
    double v65 = v111;
    objc_super v66 = sub_10048E958((uint64_t)v62, (uint64_t)v64, (uint64_t)&v120, v111);

    sub_10000FA80((uint64_t)&v120, &qword_10094DD30);
    if (v66)
    {
      uint64_t v67 = v117;
      id v68 = *(void **)(v63 + OBJC_IVAR____TtC20ProductPageExtension20ProductPageBootstrap_navigationController);
      sub_10000D280((uint64_t *)&unk_10094BD00);
      uint64_t v69 = swift_allocObject();
      *(_OWORD *)(v69 + 16) = xmmword_10078E350;
      *(void *)(v69 + 32) = v66;
      *(void *)&long long v120 = v69;
      sub_10077BEE0();
      sub_100019840(0, (unint64_t *)&qword_10094D450);
      id v70 = v66;
      Class isa = sub_10077BEC0().super.isa;
      swift_bridgeObjectRelease();
      [v68 setViewControllers:isa];

      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      id v73 = v116;
      uint64_t v74 = (uint64_t)v98;
      if (Strong)
      {
        sub_1007554E4((uint64_t)v65, v70, (uint64_t)v98);
        swift_unknownObjectRelease();
      }
      CGRect v75 = v94;
      sub_100778360();
      sub_10076B700();
      swift_release();
      swift_release();

      swift_release();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v75, v96);
      return (*((uint64_t (**)(uint64_t, uint64_t))v73 + 1))(v74, v67);
    }
    else
    {
      uint64_t v76 = v117;
      if (qword_10094A218 != -1) {
        swift_once();
      }
      v111 = v62;
      uint64_t v77 = v115;
      uint64_t v78 = sub_10000D2C4(v115, (uint64_t)qword_100973488);
      uint64_t v79 = v114;
      (*(void (**)(char *, uint64_t, uint64_t))(v114 + 16))(v89, v78, v77);
      sub_10000D280((uint64_t *)&unk_10094B830);
      sub_10077AFE0();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_10078DE60;
      sub_10077AF20();
      id v80 = [v88 productPageURL];
      if (v80)
      {
        CGRect v81 = v80;
        uint64_t v82 = (uint64_t)v92;
        sub_10076A000();

        uint64_t v83 = 0;
      }
      else
      {
        uint64_t v83 = 1;
        uint64_t v82 = (uint64_t)v92;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v97)(v82, v83, 1, v76);
      uint64_t v84 = v93;
      sub_10005B6F8(v82, v93);
      if (v112((char *)v84, 1, v76) == 1)
      {
        sub_10000FA80(v84, (uint64_t *)&unk_10094FEE0);
        long long v120 = 0u;
        long long v121 = 0u;
      }
      else
      {
        *((void *)&v121 + 1) = v76;
        v85 = sub_10001054C((uint64_t *)&v120);
        ((void (*)(uint64_t *, uint64_t, uint64_t))v87[0])(v85, v84, v76);
      }
      sub_10077AFB0();
      sub_10000FA80((uint64_t)&v120, &qword_10094BAD0);
      uint64_t v86 = v89;
      sub_10077B8B0();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v86, v77);
      return (*((uint64_t (**)(char *, uint64_t))v116 + 1))(v98, v76);
    }
  }
}

unint64_t sub_100766E34()
{
  unint64_t result = qword_100973710;
  if (!qword_100973710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973710);
  }
  return result;
}

unint64_t sub_100766E88()
{
  unint64_t result = qword_100973718;
  if (!qword_100973718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973718);
  }
  return result;
}

unint64_t sub_100766EDC()
{
  unint64_t result = qword_100973720;
  if (!qword_100973720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973720);
  }
  return result;
}

unint64_t sub_100766F30()
{
  unint64_t result = qword_100973728;
  if (!qword_100973728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973728);
  }
  return result;
}

unint64_t sub_100766F84()
{
  unint64_t result = qword_100973730;
  if (!qword_100973730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973730);
  }
  return result;
}

unint64_t sub_100766FD8()
{
  unint64_t result = qword_100973738;
  if (!qword_100973738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973738);
  }
  return result;
}

unint64_t sub_10076702C()
{
  unint64_t result = qword_100973740;
  if (!qword_100973740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973740);
  }
  return result;
}

unint64_t sub_100767080()
{
  unint64_t result = qword_100973748;
  if (!qword_100973748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973748);
  }
  return result;
}

unint64_t sub_1007670D4()
{
  unint64_t result = qword_100973750;
  if (!qword_100973750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973750);
  }
  return result;
}

unint64_t sub_100767128()
{
  unint64_t result = qword_100973758;
  if (!qword_100973758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973758);
  }
  return result;
}

unint64_t sub_10076717C()
{
  unint64_t result = qword_100973760;
  if (!qword_100973760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973760);
  }
  return result;
}

unint64_t sub_1007671D0()
{
  unint64_t result = qword_100973768;
  if (!qword_100973768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973768);
  }
  return result;
}

unint64_t sub_100767224()
{
  unint64_t result = qword_100973770;
  if (!qword_100973770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973770);
  }
  return result;
}

unint64_t sub_100767278()
{
  unint64_t result = qword_100973778;
  if (!qword_100973778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973778);
  }
  return result;
}

uint64_t sub_1007672CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100767328()
{
  unint64_t result = qword_100973780;
  if (!qword_100973780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973780);
  }
  return result;
}

uint64_t sub_10076737C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1007673D0()
{
  unint64_t result = qword_100973790;
  if (!qword_100973790)
  {
    type metadata accessor for FlowActionImplementation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973790);
  }
  return result;
}

unint64_t sub_100767428()
{
  unint64_t result = qword_100973798;
  if (!qword_100973798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973798);
  }
  return result;
}

uint64_t sub_10076747C(uint64_t a1)
{
  return a1;
}

unint64_t sub_1007674D0()
{
  unint64_t result = qword_1009737A0;
  if (!qword_1009737A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737A0);
  }
  return result;
}

unint64_t sub_100767524()
{
  unint64_t result = qword_1009737A8;
  if (!qword_1009737A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737A8);
  }
  return result;
}

unint64_t sub_100767578()
{
  unint64_t result = qword_1009737B0;
  if (!qword_1009737B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737B0);
  }
  return result;
}

unint64_t sub_1007675CC()
{
  unint64_t result = qword_1009737B8;
  if (!qword_1009737B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737B8);
  }
  return result;
}

unint64_t sub_100767620()
{
  unint64_t result = qword_1009737C0;
  if (!qword_1009737C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737C0);
  }
  return result;
}

uint64_t sub_100767674(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1007676D0()
{
  unint64_t result = qword_1009737C8;
  if (!qword_1009737C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737C8);
  }
  return result;
}

uint64_t sub_100767724(uint64_t a1)
{
  return a1;
}

unint64_t sub_100767778()
{
  unint64_t result = qword_1009737D0;
  if (!qword_1009737D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737D0);
  }
  return result;
}

unint64_t sub_1007677CC()
{
  unint64_t result = qword_1009737D8;
  if (!qword_1009737D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737D8);
  }
  return result;
}

unint64_t sub_100767820()
{
  unint64_t result = qword_1009737E0;
  if (!qword_1009737E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737E0);
  }
  return result;
}

unint64_t sub_100767874()
{
  unint64_t result = qword_1009737E8;
  if (!qword_1009737E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737E8);
  }
  return result;
}

unint64_t sub_1007678C8()
{
  unint64_t result = qword_1009737F0;
  if (!qword_1009737F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737F0);
  }
  return result;
}

unint64_t sub_10076791C()
{
  unint64_t result = qword_1009737F8;
  if (!qword_1009737F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1009737F8);
  }
  return result;
}

unint64_t sub_100767970()
{
  unint64_t result = qword_100973800;
  if (!qword_100973800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973800);
  }
  return result;
}

uint64_t sub_1007679C4(uint64_t a1)
{
  return a1;
}

unint64_t sub_100767A18()
{
  unint64_t result = qword_100973808;
  if (!qword_100973808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973808);
  }
  return result;
}

unint64_t sub_100767A6C()
{
  unint64_t result = qword_100973810;
  if (!qword_100973810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973810);
  }
  return result;
}

uint64_t sub_100767AC0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100767B14()
{
  unint64_t result = qword_100973818;
  if (!qword_100973818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973818);
  }
  return result;
}

unint64_t sub_100767B68()
{
  unint64_t result = qword_100973820;
  if (!qword_100973820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973820);
  }
  return result;
}

unint64_t sub_100767BBC()
{
  unint64_t result = qword_100973828;
  if (!qword_100973828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973828);
  }
  return result;
}

unint64_t sub_100767C10()
{
  unint64_t result = qword_100973830;
  if (!qword_100973830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973830);
  }
  return result;
}

uint64_t sub_100767C64(uint64_t a1)
{
  return a1;
}

unint64_t sub_100767CB8()
{
  unint64_t result = qword_100973838;
  if (!qword_100973838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973838);
  }
  return result;
}

unint64_t sub_100767D0C()
{
  unint64_t result = qword_100973840;
  if (!qword_100973840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973840);
  }
  return result;
}

unint64_t sub_100767D60()
{
  unint64_t result = qword_100973848;
  if (!qword_100973848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973848);
  }
  return result;
}

uint64_t sub_100767DB4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_100767E10()
{
  unint64_t result = qword_100973850;
  if (!qword_100973850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973850);
  }
  return result;
}

uint64_t sub_100767E64(uint64_t a1)
{
  return a1;
}

unint64_t sub_100767EB8()
{
  unint64_t result = qword_100973858;
  if (!qword_100973858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973858);
  }
  return result;
}

unint64_t sub_100767F0C()
{
  unint64_t result = qword_100973860;
  if (!qword_100973860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973860);
  }
  return result;
}

unint64_t sub_100767F60()
{
  unint64_t result = qword_100973868;
  if (!qword_100973868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973868);
  }
  return result;
}

unint64_t sub_100767FB4()
{
  unint64_t result = qword_100973870;
  if (!qword_100973870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973870);
  }
  return result;
}

uint64_t sub_100768008(uint64_t a1)
{
  return a1;
}

uint64_t sub_10076805C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1007680B8()
{
  unint64_t result = qword_100973878;
  if (!qword_100973878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100973878);
  }
  return result;
}

uint64_t sub_10076810C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100768160()
{
  return sub_100768470(&qword_10095A5E0, (void (*)(uint64_t))type metadata accessor for AnnotationCollectionViewCell);
}

double sub_1007681AC()
{
  uint64_t v1 = sub_1007789C0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000D280(&qword_100960398);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  size_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076BF60();
  sub_100768470((unint64_t *)&unk_100961790, (void (*)(uint64_t))&type metadata accessor for Annotation);
  sub_10076FB40();
  uint64_t v9 = v17;
  if (!v17) {
    return 0.0;
  }
  v15[0] = v6;
  v15[1] = v0;
  sub_10015A0B4();
  sub_10076FB70();
  sub_10077BA30();
  if (v16) {
    char v10 = 1;
  }
  else {
    char v10 = sub_10076BF10();
  }
  swift_getKeyPath();
  sub_10076FBA0();
  swift_release();
  sub_100778940();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v12 = sub_100632D50();
  swift_getObjectType();
  sub_10032F5EC(v9, v10 & 1, v12);
  double v11 = v13;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15[0] + 8))(v8, v5);
  return v11;
}

uint64_t sub_100768470(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100768624()
{
  id v1 = [v0 collectionView];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 panGestureRecognizer];

    [v3 removeTarget:v0 action:0];
  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  return objc_msgSendSuper2(&v5, "dealloc");
}

uint64_t sub_100768778()
{
  return type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
}

uint64_t type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout()
{
  uint64_t result = qword_1009738B0;
  if (!qword_1009738B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1007687CC()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  objc_msgSendSuper2(&v7, "prepareLayout");
  id v1 = [v0 collectionView];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 panGestureRecognizer];

    [v3 removeTarget:v0 action:0];
  }
  id v4 = [v0 collectionView];
  if (v4)
  {
    objc_super v5 = v4;
    id v6 = [v4 panGestureRecognizer];

    [v6 addTarget:v0 action:"panGestureRecognizedBy:"];
  }
}

void sub_1007689E0(double a1, double a2, double a3, double a4)
{
  objc_super v5 = v4;
  uint64_t v10 = sub_10000D280((uint64_t *)&unk_1009543F0);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10076A5F0();
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)&double v15 = __chkstk_darwin(v13).n128_u64[0];
  uint64_t v17 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_msgSend(v4, "collectionView", v15);
  if (!v18) {
    goto LABEL_13;
  }
  uint64_t v19 = v18;
  [v18 bounds];
  id v20 = objc_msgSend(v4, "layoutAttributesForElementsInRect:");
  if (!v20) {
    goto LABEL_12;
  }
  unint64_t v21 = v20;
  sub_1000D9740();
  unint64_t v22 = sub_10077BED0();

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_10077D140();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v23)
  {
LABEL_12:

LABEL_13:
    uint64_t v35 = (objc_class *)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
    v68.receiver = v5;
    v68.super_class = v35;
    objc_msgSendSuper2(&v68, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a1, a2, a3, a4);
    return;
  }
  char v24 = (objc_class *)type metadata accessor for ScreenshotGalleryCollectionViewFlowLayout();
  v67.receiver = v5;
  v67.super_class = v24;
  objc_msgSendSuper2(&v67, "targetContentOffsetForProposedContentOffset:withScrollingVelocity:", a1, a2, a3, a4);
  uint64_t v26 = v25;
  uint64_t v27 = (uint64_t)[v19 numberOfItemsInSection:0];
  uint64_t v28 = v27 - 1;
  if (v27 < 1) {
    goto LABEL_22;
  }
  v64[1] = v26;
  [v19 frame];
  double v30 = v29 + a1;
  [v5 collectionViewContentSize];
  if (v30 >= v31) {
    goto LABEL_22;
  }
  id v32 = [v19 traitCollection];
  int v33 = sub_10077C3D0();

  int v66 = v33;
  if ((v33 & 1) == 0) {
    uint64_t v28 = 0;
  }
  if (a1 > 0.0)
  {
    double v34 = 0.0;
    long long v65 = xmmword_10078DE60;
    do
    {
      sub_10000D280((uint64_t *)&unk_100956280);
      uint64_t v37 = swift_allocObject();
      *(_OWORD *)(v37 + 16) = v65;
      *(void *)(v37 + 32) = 0;
      *(void *)(v37 + 40) = v28;
      sub_10076A4E0();
      Class isa = sub_10076A4F0().super.isa;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
      id v39 = [v5 layoutAttributesForItemAtIndexPath:isa];

      if (!v39) {
        goto LABEL_22;
      }
      [v39 bounds];
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;

      v69.origin.x = v41;
      v69.origin.y = v43;
      v69.size.width = v45;
      v69.size.height = v47;
      double Width = CGRectGetWidth(v69);
      if (v34 + Width * 0.5 >= a1) {
        break;
      }
      [v5 minimumLineSpacing];
      if (v66)
      {
        BOOL v36 = __OFSUB__(v28--, 1);
        if (v36)
        {
          __break(1u);
          goto LABEL_44;
        }
      }
      else
      {
        BOOL v36 = __OFADD__(v28++, 1);
        if (v36)
        {
          __break(1u);
          goto LABEL_22;
        }
      }
      double v34 = v34 + Width + v49;
    }
    while (v34 < a1);
  }
  uint64_t v50 = (uint64_t)v5
      + OBJC_IVAR____TtC20ProductPageExtension41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
  swift_beginAccess();
  sub_1000D9780(v50, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    sub_10043DE28((uint64_t)v12);
    goto LABEL_39;
  }
  uint64_t v51 = sub_10076A570();
  sub_10043DE28((uint64_t)v12);
  if (v28 != v51) {
    goto LABEL_39;
  }
  if (!((a3 >= 0.0) | v66 & 1))
  {
LABEL_30:
    if (!__OFSUB__(v28, 1))
    {
      uint64_t v28 = (v28 - 1) & ~((v28 - 1) >> 63);
      goto LABEL_39;
    }
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (a3 <= 0.0)
  {
    if (a3 < 0.0 && ((v66 ^ 1) & 1) == 0) {
      goto LABEL_34;
    }
LABEL_39:
    sub_10000D280((uint64_t *)&unk_100956280);
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_10078DE60;
    *(void *)(v53 + 32) = 0;
    *(void *)(v53 + 40) = v28;
    sub_10076A4E0();
    Class v54 = sub_10076A4F0().super.isa;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    id v55 = [v5 layoutAttributesForItemAtIndexPath:v54];

    if (v55)
    {
      [v55 frame];
      CGFloat v57 = v56;
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;

      [v19 bounds];
      CGRectGetWidth(v70);
      v71.origin.x = v57;
      v71.origin.y = v59;
      v71.size.width = v61;
      v71.size.height = v63;
      CGRectGetWidth(v71);

      return;
    }
LABEL_22:

    return;
  }
  if (v66) {
    goto LABEL_30;
  }
LABEL_34:
  id v52 = [v19 numberOfItemsInSection:0];
  if (__OFSUB__(v52, 1))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (!__OFADD__(v28, 1))
  {
    if (v28 + 1 >= (uint64_t)v52 - 1) {
      uint64_t v28 = (uint64_t)v52 - 1;
    }
    else {
      ++v28;
    }
    goto LABEL_39;
  }
LABEL_46:
  __break(1u);
}

id sub_100769058(void *a1)
{
  uint64_t v3 = sub_10000D280((uint64_t *)&unk_1009543F0);
  __chkstk_darwin(v3 - 8);
  objc_super v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v7 = __chkstk_darwin(v6).n128_u64[0];
  uint64_t v9 = (char *)&v22 - v8;
  id result = objc_msgSend(a1, "state", v7);
  if (result == (id)1)
  {
    id v11 = [v1 collectionView];
    if (v11)
    {
      id v12 = v11;
      id v13 = [v1 collectionView];
      if (v13)
      {
        uint64_t v14 = v13;
        [v13 bounds];
        double MidX = CGRectGetMidX(v23);
        [v14 bounds];
        double MidY = CGRectGetMidY(v24);
      }
      else
      {
        double MidX = 0.0;
        double MidY = 0.0;
      }
      id v18 = objc_msgSend(v12, "indexPathForItemAtPoint:", MidX, MidY);

      if (v18)
      {
        sub_10076A530();

        uint64_t v19 = sub_10076A5F0();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 0, 1, v19);
      }
      else
      {
        uint64_t v20 = sub_10076A5F0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 1, 1, v20);
      }
      sub_100219798((uint64_t)v5, (uint64_t)v9);
    }
    else
    {
      uint64_t v17 = sub_10076A5F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
    }
    uint64_t v21 = (uint64_t)v1
        + OBJC_IVAR____TtC20ProductPageExtension41ScreenshotGalleryCollectionViewFlowLayout_indexPathAtInitialScroll;
    swift_beginAccess();
    sub_100162490((uint64_t)v9, v21);
    return (id)swift_endAccess();
  }
  return result;
}

double sub_100769324(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8)
{
  unint64_t v11 = sub_10076CC60();
  uint64_t v12 = sub_10076CC50();
  double v13 = sub_10038D884(v11, v12, a8, 0.0, 0.0, a1, a2, a1);
  swift_bridgeObjectRelease();
  swift_release();
  return v13;
}

id sub_1007693B4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  return sub_1007694A0(*a1, a2, a4, a5, a6);
}

uint64_t sub_1007693C8()
{
  return sub_100769458((unint64_t *)&unk_100960F20, (void (*)(uint64_t))&type metadata accessor for Screenshots);
}

uint64_t sub_100769410()
{
  return sub_100769458(&qword_1009548B0, (void (*)(uint64_t))&type metadata accessor for NilState);
}

uint64_t sub_100769458(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_1007694A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = v5;
  uint64_t v83 = sub_1007791F0();
  uint64_t v8 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v84 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  CGRect v71 = (char *)&v69 - v11;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v69 - v13;
  __chkstk_darwin(v15);
  CGRect v70 = (char *)&v69 - v16;
  uint64_t v17 = sub_10076CC50();
  uint64_t v78 = OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_platform;
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_platform] = v17;
  swift_release();
  id v18 = *(void **)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_flowLayout];
  [a5 pageMarginInsets];
  objc_msgSend(v18, "setSectionInset:");
  uint64_t v76 = a5;
  id v19 = [a5 snapshotPageTraitEnvironment];
  uint64_t v77 = OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_pageTraits;
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_pageTraits] = v19;
  swift_unknownObjectRelease();
  uint64_t v20 = sub_10076CC60();
  uint64_t v21 = *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_artwork];
  *(void *)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_artwork] = v20;
  unint64_t v22 = swift_bridgeObjectRetain();
  char v23 = sub_1003C9318(v22, v21);
  swift_bridgeObjectRelease();
  uint64_t v24 = (uint64_t)&selRef_tableView_willSelectRowAtIndexPath_;
  if ((v23 & 1) == 0) {
    [*(id *)&v5[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_collectionView] reloadData];
  }
  swift_bridgeObjectRelease();
  unint64_t v25 = sub_10076CC60();
  unint64_t v26 = v25;
  if (v25 >> 62) {
LABEL_31:
  }
    uint64_t v27 = sub_10077D140();
  else {
    uint64_t v27 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v28 = v71;
  double v29 = v70;
  if (v27)
  {
    unint64_t v75 = v26 & 0xC000000000000001;
    CGRect v81 = (void (**)(char *, char *, uint64_t))(v8 + 16);
    double v30 = _swiftEmptyArrayStorage;
    uint64_t v82 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v24 = 4;
    unint64_t v74 = v26;
    uint64_t v73 = v27;
    id v72 = v6;
    while (1)
    {
      id v80 = v30;
      uint64_t v31 = v24 - 4;
      if (v75)
      {
        uint64_t v8 = sub_10077D030();
        uint64_t v32 = v24 - 3;
        if (__OFADD__(v31, 1)) {
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v8 = *(void *)(v26 + 8 * v24);
        swift_retain();
        uint64_t v32 = v24 - 3;
        if (__OFADD__(v31, 1))
        {
LABEL_30:
          __break(1u);
          goto LABEL_31;
        }
      }
      uint64_t v79 = v32;
      sub_100778590();
      sub_100779200();
      char v33 = sub_10038CB8C();
      uint64_t v34 = swift_retain();
      sub_1000846E8(v34, (uint64_t)v85);
      swift_release();
      sub_10011DE84((uint64_t)v85);
      id result = *(id *)&v6[v77];
      if (!result)
      {
        __break(1u);
        return result;
      }
      double v36 = v86;
      double v37 = v87;
      [result pageContainerSize];
      double v39 = v38;
      double v41 = v40;
      [v6 bounds];
      double v43 = v42;
      double v44 = *v81;
      uint64_t v45 = v83;
      (*v81)(v28, v29, v83);
      uint64_t v46 = v8;
      if ((v33 & 1) == 0) {
        break;
      }
      CGFloat v47 = v84;
      uint64_t v48 = v45;
      char v49 = sub_100779160();
      uint64_t v50 = *v82;
      (*v82)(v28, v48);
      if (v49)
      {
        uint64_t v45 = v48;
        uint64_t v28 = v71;
        double v29 = v70;
LABEL_17:
        v44(v14, v29, v45);
        v44(v84, v29, v45);
        if (v33) {
          char v51 = 1;
        }
        else {
          char v51 = sub_100779160();
        }
        uint64_t v6 = v72;
        goto LABEL_22;
      }
      id v52 = v70;
      sub_1007791A0();
      uint64_t v53 = v47;
      double v29 = v52;
      v44(v53, v52, v48);
      char v51 = 1;
      uint64_t v6 = v72;
      uint64_t v28 = v71;
LABEL_22:
      uint64_t v54 = v46;
      uint64_t v55 = v83;
      v50(v84, v83);
      char v56 = v51 & 1;
      CGFloat v57 = v76;
      double v58 = sub_1006A0EE4(1, v56, v76, v43, v39, v41);
      id v59 = [v57 traitCollection];
      sub_10077C390();

      sub_1007791C0();
      double v60 = v58 - (v36 + v37);
      sub_1007791C0();
      uint64_t v62 = v61;
      v50(v14, v55);
      v50(v29, v55);
      swift_retain();
      CGFloat v63 = v80;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        CGFloat v63 = sub_10049A2DC(0, *((void *)v63 + 2) + 1, 1, v63);
      }
      unint64_t v26 = v74;
      uint64_t v64 = v73;
      unint64_t v66 = *((void *)v63 + 2);
      unint64_t v65 = *((void *)v63 + 3);
      objc_super v67 = v63;
      if (v66 >= v65 >> 1) {
        objc_super v67 = sub_10049A2DC((double *)(v65 > 1), v66 + 1, 1, v63);
      }
      *((void *)v67 + 2) = v66 + 1;
      double v30 = v67;
      objc_super v68 = &v67[3 * v66];
      *((void *)v68 + 4) = v54;
      v68[5] = v60;
      *((void *)v68 + 6) = v62;
      swift_release();
      ++v24;
      if (v79 == v64)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = 0x10091B000;
        goto LABEL_29;
      }
    }
    uint64_t v50 = *v82;
    (*v82)(v28, v45);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  double v30 = _swiftEmptyArrayStorage;
LABEL_29:
  *(void *)&v6[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_sizedArtwork] = v30;
  swift_bridgeObjectRelease();
  return [*(id *)&v6[OBJC_IVAR____TtC20ProductPageExtension33ScreenshotShelfCollectionViewCell_collectionView] *(SEL *)(v24 + 688)];
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100769B50()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t sub_100769B90()
{
  return EntityProperty.wrappedValue.getter();
}

uint64_t sub_100769BA0()
{
  return EntityProperty.wrappedValue.setter();
}

uint64_t sub_100769BB0()
{
  return EntityProperty.projectedValue.getter();
}

uint64_t sub_100769BC0()
{
  return EntityProperty<>.init(title:)();
}

uint64_t sub_100769BD0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100769BE0()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100769C00()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100769C10()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100769C20()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100769C30()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation<A, B>(_:)();
}

void sub_100769C40(Swift::String a1)
{
}

uint64_t sub_100769C50()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100769C60()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100769C70()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100769C80()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100769CA0()
{
  return NSNotFound.getter();
}

uint64_t sub_100769CB0()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_100769CC0()
{
  return static CharacterSet.excessiveLeading.getter();
}

uint64_t sub_100769CD0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_100769CE0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100769CF0()
{
  return Notification.name.getter();
}

uint64_t sub_100769D00()
{
  return Notification.userInfo.getter();
}

uint64_t sub_100769D10()
{
  return type metadata accessor for Notification();
}

uint64_t sub_100769D20()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_100769D30()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100769D40()
{
  return URLComponents.queryItems.modify();
}

uint64_t sub_100769D50()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_100769D60()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100769D70()
{
  return URLComponents.url.getter();
}

uint64_t sub_100769D80()
{
  return URLComponents.host.setter();
}

uint64_t sub_100769D90()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_100769DA0()
{
  return URLComponents.string.getter();
}

uint64_t sub_100769DB0()
{
  return URLComponents.init()();
}

uint64_t sub_100769DC0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100769DD0()
{
  return DateComponents.day.getter();
}

uint64_t sub_100769DE0()
{
  return DateComponents.year.getter();
}

uint64_t sub_100769DF0()
{
  return DateComponents.month.getter();
}

uint64_t sub_100769E00()
{
  return DateComponents.minute.getter();
}

uint64_t sub_100769E10()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100769E20()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_100769E30()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_100769E40()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_100769E50()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_100769E60()
{
  return AttributeScopes.UIKitAttributes.paragraphStyle.getter();
}

uint64_t sub_100769E70()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t sub_100769E80()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t sub_100769E90()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_100769EA0()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_100769EB0()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_100769EC0()
{
  return AttributedString.subscript.modify();
}

uint64_t sub_100769ED0()
{
  return AttributeContainer.subscript.setter();
}

uint64_t sub_100769EE0()
{
  return AttributeContainer.init()();
}

uint64_t sub_100769EF0()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_100769F00()
{
  return AttributeContainer.init(_:)();
}

uint64_t sub_100769F10()
{
  return AttributedSubstring.subscript.setter();
}

uint64_t sub_100769F20()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_100769F30()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100769F40()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100769F50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100769F60()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_100769F70()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100769F80()
{
  return AttributedStringProtocol.range<A>(of:options:locale:)();
}

uint64_t sub_100769F90()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_100769FA0()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100769FB0()
{
  return static FormatStyleCapitalizationContext.unknown.getter();
}

uint64_t sub_100769FC0()
{
  return type metadata accessor for FormatStyleCapitalizationContext();
}

uint64_t sub_100769FD0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100769FE0()
{
  return URL.lastPathComponent.getter();
}

void sub_100769FF0(NSURL *retstr@<X8>)
{
}

uint64_t sub_10076A000()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10076A010()
{
  return URL.host.getter();
}

uint64_t sub_10076A020()
{
  return URL.scheme.getter();
}

uint64_t sub_10076A030()
{
  return URL.init(string:)();
}

uint64_t sub_10076A040()
{
  return type metadata accessor for URL();
}

NSData sub_10076A050()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10076A060()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10076A070()
{
  return static Date.FormatStyle.TimeStyle.standard.getter();
}

uint64_t sub_10076A080()
{
  return type metadata accessor for Date.FormatStyle.TimeStyle();
}

uint64_t sub_10076A090()
{
  return static Date.FormatStyle.DateStyle.omitted.getter();
}

uint64_t sub_10076A0A0()
{
  return type metadata accessor for Date.FormatStyle.DateStyle();
}

uint64_t sub_10076A0B0()
{
  return Date.FormatStyle.secondFraction(_:)();
}

uint64_t sub_10076A0C0()
{
  return Date.FormatStyle.init(date:time:locale:calendar:timeZone:capitalizationContext:)();
}

uint64_t sub_10076A0D0()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t sub_10076A0E0()
{
  return static Date.FormatStyle.Symbol.SecondFraction.fractional(_:)();
}

uint64_t sub_10076A0F0()
{
  return type metadata accessor for Date.FormatStyle.Symbol.SecondFraction();
}

uint64_t sub_10076A100()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.omitted.getter();
}

uint64_t sub_10076A110()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t sub_10076A120()
{
  return static Date.FormatStyle.Symbol.Hour.twoDigits(amPM:)();
}

uint64_t sub_10076A130()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t sub_10076A140()
{
  return static Date.FormatStyle.Symbol.Minute.twoDigits.getter();
}

uint64_t sub_10076A150()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Minute();
}

uint64_t sub_10076A160()
{
  return static Date.FormatStyle.Symbol.Second.twoDigits.getter();
}

uint64_t sub_10076A170()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Second();
}

uint64_t sub_10076A180()
{
  return Date.FormatStyle.minute(_:)();
}

uint64_t sub_10076A190()
{
  return Date.FormatStyle.second(_:)();
}

uint64_t sub_10076A1A0()
{
  return type metadata accessor for Date.FormatStyle();
}

uint64_t sub_10076A1B0()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_10076A1C0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10076A1D0()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_10076A1E0()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_10076A1F0()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10076A200()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_10076A210()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_10076A220()
{
  return Date.formatted<A>(_:)();
}

uint64_t sub_10076A230()
{
  return Date.init()();
}

uint64_t sub_10076A240()
{
  return type metadata accessor for Date();
}

uint64_t sub_10076A250()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10076A260()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10076A270()
{
  return UUID.init()();
}

uint64_t sub_10076A280()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10076A290()
{
  return Locale.identifier.getter();
}

uint64_t sub_10076A2A0()
{
  return Locale.regionCode.getter();
}

uint64_t sub_10076A2B0()
{
  return Locale.isJapanese.getter();
}

uint64_t sub_10076A2C0()
{
  return Locale.prefersSmallerText.getter();
}

uint64_t sub_10076A2D0()
{
  return Locale.baseWritingDirection.getter();
}

uint64_t sub_10076A2E0()
{
  return Locale.paragraphLineHeightMultiple.getter();
}

uint64_t sub_10076A2F0()
{
  return Locale.isKorean.getter();
}

uint64_t sub_10076A300()
{
  return Locale.isChinese.getter();
}

uint64_t sub_10076A310()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_10076A320()
{
  return static Locale.availableIdentifiers.getter();
}

uint64_t sub_10076A330()
{
  return static Locale.storefront.getter();
}

uint64_t sub_10076A340()
{
  return Locale.hasExtraTallWritingSystem.getter();
}

uint64_t sub_10076A350()
{
  return static Locale.current.getter();
}

uint64_t sub_10076A360()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10076A370()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_10076A380()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_10076A390()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_10076A3A0()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_10076A3B0()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t sub_10076A3C0()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_10076A3D0()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_10076A3E0()
{
  return static Calendar.autoupdatingCurrent.getter();
}

uint64_t sub_10076A3F0()
{
  return Calendar.date(from:)();
}

uint64_t sub_10076A400()
{
  return static Calendar.current.getter();
}

uint64_t sub_10076A410()
{
  return Calendar.nextDate(after:matching:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_10076A420()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10076A430()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_10076A440()
{
  return type metadata accessor for IndexSet.Index();
}

uint64_t sub_10076A450()
{
  return IndexSet.makeIterator()();
}

void sub_10076A460(NSIndexSet *retstr@<X8>)
{
}

uint64_t sub_10076A470()
{
  return static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10076A480()
{
  return IndexSet.count.getter();
}

BOOL sub_10076A490(Swift::Int a1)
{
  return IndexSet.contains(_:)(a1);
}

uint64_t sub_10076A4A0()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_10076A4B0()
{
  return static TimeZone.autoupdatingCurrent.getter();
}

uint64_t sub_10076A4C0()
{
  return static TimeZone.current.getter();
}

uint64_t sub_10076A4D0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_10076A4E0()
{
  return IndexPath.init(arrayLiteral:)();
}

NSIndexPath sub_10076A4F0()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_10076A500()
{
  return static IndexPath.> infix(_:_:)();
}

uint64_t sub_10076A510()
{
  return static IndexPath.< infix(_:_:)();
}

uint64_t sub_10076A520()
{
  return static IndexPath.== infix(_:_:)();
}

uint64_t sub_10076A530()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10076A540()
{
  return IndexPath.init(row:section:)();
}

uint64_t sub_10076A550()
{
  return IndexPath.row.getter();
}

uint64_t sub_10076A560()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_10076A570()
{
  return IndexPath.item.getter();
}

uint64_t sub_10076A580()
{
  return IndexPath.section.getter();
}

uint64_t sub_10076A590()
{
  return IndexPath.count.getter();
}

uint64_t sub_10076A5A0()
{
  return IndexPath.init(index:)();
}

void sub_10076A5B0(Swift::Int a1)
{
}

uint64_t sub_10076A5C0()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_10076A5D0()
{
  return IndexPath.appending(_:)();
}

uint64_t sub_10076A5E0()
{
  return IndexPath.init()();
}

uint64_t sub_10076A5F0()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_10076A600()
{
  return IndexPath.subscript.getter();
}

uint64_t sub_10076A610()
{
  return type metadata accessor for CGPathFillRule();
}

NSNumber sub_10076A620()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_10076A630()
{
  return static CGFloat.allColumns.getter();
}

uint64_t sub_10076A640()
{
  return static CGFloat.solvedValue(between:and:forInput:)();
}

uint64_t sub_10076A650()
{
  return CGFloat.isLessThanOrEffectivelyEqualTo(_:accuracy:)();
}

uint64_t sub_10076A660()
{
  return CGFloat.rounded(_:toScale:)();
}

uint64_t sub_10076A670()
{
  return CGFloat.scalingLike(_:with:)();
}

uint64_t sub_10076A680()
{
  return CGFloat.rawValue(in:)();
}

uint64_t sub_10076A690()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_10076A6A0()
{
  return GameLayerAchievementsPresenter.init(gameRecord:entryPoint:achievementIdsToHighlight:achievementIdToPresent:)();
}

uint64_t sub_10076A6B0()
{
  return type metadata accessor for GameLayerAchievementsPresenter();
}

uint64_t sub_10076A6C0()
{
  return type metadata accessor for GameLayerAchievementsEntryPoint();
}

uint64_t sub_10076A6D0()
{
  return GameLayerAchievementsViewController.init(presenter:theme:objectGraph:)();
}

uint64_t sub_10076A6E0()
{
  return type metadata accessor for GameLayerAchievementsViewController();
}

uint64_t sub_10076A6F0()
{
  return type metadata accessor for Achievement();
}

uint64_t sub_10076A700()
{
  return static AchievementCard.defaultMetrics.getter();
}

uint64_t sub_10076A710()
{
  return AchievementCard.alwaysShowShadow.setter();
}

uint64_t sub_10076A720()
{
  return AchievementCard.backgroundEffectsGroup.setter();
}

uint64_t sub_10076A730()
{
  return AchievementCard.init(frame:metrics:theme:)();
}

uint64_t sub_10076A740()
{
  return AchievementCard.model.setter();
}

uint64_t sub_10076A750()
{
  return type metadata accessor for AchievementCard();
}

uint64_t sub_10076A760()
{
  return type metadata accessor for AchievementsTheme();
}

uint64_t sub_10076A770()
{
  return SmallPlayerCardData.buttonText.getter();
}

uint64_t sub_10076A780()
{
  return SmallPlayerCardData.avatarImage.getter();
}

uint64_t sub_10076A790()
{
  return SmallPlayerCardData.buttonAction.getter();
}

uint64_t sub_10076A7A0()
{
  return SmallPlayerCardData.removeButtonAction.getter();
}

uint64_t sub_10076A7B0()
{
  return SmallPlayerCardData.shouldShowMessagesBadge.getter();
}

uint64_t sub_10076A7C0()
{
  return SmallPlayerCardData.avatarArtworkLoaderConfig.getter();
}

uint64_t sub_10076A7D0()
{
  return SmallPlayerCardData.init(id:title:subtitle:buttonText:avatarArtworkLoaderConfig:avatarImage:shouldShowMessagesBadge:buttonAction:removeButtonAction:isEnabled:segue:messagesGroupIdentifier:groupRecipients:)();
}

uint64_t sub_10076A7E0()
{
  return SmallPlayerCardData.id.getter();
}

uint64_t sub_10076A7F0()
{
  return SmallPlayerCardData.segue.getter();
}

uint64_t sub_10076A800()
{
  return SmallPlayerCardData.title.getter();
}

uint64_t sub_10076A810()
{
  return SmallPlayerCardData.subtitle.getter();
}

uint64_t sub_10076A820()
{
  return type metadata accessor for SmallPlayerCardData();
}

uint64_t sub_10076A830()
{
  return SmallPlayerCardView.closeButton.getter();
}

uint64_t sub_10076A840()
{
  return dispatch thunk of SmallPlayerCardView.prepareForReuse()();
}

uint64_t sub_10076A850()
{
  return dispatch thunk of SmallPlayerCardView.buttonActionBlock.setter();
}

uint64_t sub_10076A860()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.getter();
}

uint64_t sub_10076A870()
{
  return dispatch thunk of SmallPlayerCardView.closeButtonActionBlock.setter();
}

uint64_t sub_10076A880()
{
  return dispatch thunk of SmallPlayerCardView.show(image:isAnimationPermitted:)();
}

uint64_t sub_10076A890()
{
  return static SmallPlayerCardView.size(fitting:traitEnvironment:)();
}

uint64_t sub_10076A8A0()
{
  return dispatch thunk of SmallPlayerCardView.apply(data:shouldSetImage:)();
}

uint64_t sub_10076A8B0()
{
  return dispatch thunk of SmallPlayerCardView.image.getter();
}

uint64_t sub_10076A8C0()
{
  return type metadata accessor for SmallPlayerCardView();
}

uint64_t sub_10076A8D0()
{
  return type metadata accessor for AchievementCardLayout.Metrics();
}

uint64_t sub_10076A8E0()
{
  return type metadata accessor for DashboardLaunchContext();
}

uint64_t sub_10076A8F0()
{
  return static ActivityFeedPlatterView.viewHeight(for:)();
}

uint64_t sub_10076A900()
{
  return ActivityFeedPlatterView.init(data:actionHandlers:)();
}

uint64_t sub_10076A910()
{
  return type metadata accessor for ActivityFeedPlatterView();
}

uint64_t sub_10076A920()
{
  return JetDashboardViewController.__allocating_init(launchContext:request:navigationProxy:)();
}

uint64_t sub_10076A930()
{
  return type metadata accessor for JetDashboardViewController();
}

uint64_t sub_10076A940()
{
  return type metadata accessor for ActivityFeedLockupViewModel();
}

uint64_t sub_10076A950()
{
  return PlayerProfileViewController.__allocating_init(playerId:navigationProxy:objectGraph:)();
}

uint64_t sub_10076A960()
{
  return type metadata accessor for PlayerProfileViewController();
}

uint64_t sub_10076A970()
{
  return ActivityFeedLockupActionHandlers.init(profileHandler:leaderboardsHandler:achievementsHandler:appHandler:)();
}

uint64_t sub_10076A980()
{
  return type metadata accessor for ActivityFeedLockupActionHandlers();
}

uint64_t sub_10076A990()
{
  return dispatch thunk of AppStoreAd.instanceId.getter();
}

uint64_t sub_10076A9A0()
{
  return dispatch thunk of AppStoreAd.appMetadata.getter();
}

uint64_t sub_10076A9B0()
{
  return dispatch thunk of AppStoreAd.privacyInfo.getter();
}

uint64_t sub_10076A9C0()
{
  return dispatch thunk of AppStoreAd.impressionId.getter();
}

uint64_t sub_10076A9D0()
{
  return dispatch thunk of AppStoreAd.unfilledReason.getter();
}

uint64_t sub_10076A9E0()
{
  return dispatch thunk of AppStoreAd.clientRequestId.getter();
}

uint64_t sub_10076A9F0()
{
  return dispatch thunk of AppStoreAd.positionInformation.getter();
}

uint64_t sub_10076AA00()
{
  return dispatch thunk of AppStoreAd.adamId.getter();
}

uint64_t sub_10076AA10()
{
  return dispatch thunk of AppStoreAd.cppIds.getter();
}

uint64_t sub_10076AA20()
{
  return dispatch thunk of AppStoreAd.toroId.getter();
}

uint64_t sub_10076AA30()
{
  return dispatch thunk of AppStoreAd.metadata.getter();
}

uint64_t sub_10076AA40()
{
  return static AppStoreConfig.iris.getter();
}

uint64_t sub_10076AA50()
{
  return static AppStoreConfig.flora.getter();
}

uint64_t sub_10076AA60()
{
  return static AppStoreConfig.metis.getter();
}

uint64_t sub_10076AA70()
{
  return static AppStoreConfig.thetis.getter();
}

uint64_t sub_10076AA80()
{
  return type metadata accessor for AppStoreConfig();
}

uint64_t sub_10076AA90()
{
  return AppStoreModule.initialize(storeFront:storeFrontLocale:config:bag:defaultAppRequestMetaFields:)();
}

uint64_t sub_10076AAA0()
{
  return AppStoreModule.getAd(config:appRequestMetaFields:adamId:_:)();
}

uint64_t sub_10076AAB0()
{
  return static AppStoreModule.shared.getter();
}

uint64_t sub_10076AAC0()
{
  return type metadata accessor for AppStoreModule();
}

uint64_t sub_10076AAD0()
{
  return AppStoreRequestTask.clientRequestId.getter();
}

uint64_t sub_10076AAE0()
{
  return AppStoreRequestTask.cancel(_:)();
}

uint64_t sub_10076AAF0()
{
  return AppStoreRequestTask.toroId.getter();
}

uint64_t sub_10076AB00()
{
  return AppStoreMetricManager.interacted(_:type:completion:)();
}

uint64_t sub_10076AB10()
{
  return static AppStoreMetricManager.sharedInstance.getter();
}

void sub_10076AB20(Swift::String _, Swift::Int threshold)
{
}

void sub_10076AB30(Swift::String a1)
{
}

void sub_10076AB40(Swift::String a1)
{
}

uint64_t sub_10076AB50()
{
  return AppStoreMetricManager.discarded(_:reasonCode:)();
}

uint64_t sub_10076AB60()
{
  return type metadata accessor for AppStoreMetricManager();
}

uint64_t sub_10076AB70()
{
  return type metadata accessor for AppStoreInteractionType();
}

uint64_t sub_10076AB80()
{
  return type metadata accessor for AppStoreAdUnfilledReason();
}

uint64_t sub_10076AB90()
{
  return type metadata accessor for AppStoreTaskCancelReason();
}

uint64_t sub_10076ABA0()
{
  return type metadata accessor for AppStoreMetricDiscardReason();
}

uint64_t sub_10076ABB0()
{
  return AppEntityViewAnnotation.init<A>(entity:state:)();
}

uint64_t sub_10076ABC0()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t sub_10076ABD0()
{
  return IntentView.init(what:transaction:configuration:working:failed:content:)();
}

uint64_t sub_10076ABE0()
{
  return LoadingView.init<>()();
}

uint64_t sub_10076AC00()
{
  return IntentViewConfiguration.init()();
}

uint64_t sub_10076AC10()
{
  return type metadata accessor for IntentViewConfiguration();
}

uint64_t sub_10076AC20()
{
  return ShareSheetAppEventMetadata.text.getter();
}

uint64_t sub_10076AC30()
{
  return ShareSheetAppEventMetadata.artwork.getter();
}

uint64_t sub_10076AC40()
{
  return ShareSheetAppEventMetadata.subtitle.getter();
}

uint64_t sub_10076AC50()
{
  return makeModernAppStateController(deviceAppFetcher:updateRegistry:dataSources:)();
}

uint64_t sub_10076AC60()
{
  return StreamlinedInAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_10076AC70()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.activeStateDataSource.getter();
}

uint64_t sub_10076AC80()
{
  return static StreamlinedInAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_10076AC90()
{
  return type metadata accessor for StreamlinedInAppPurchaseOfferButtonPresenter();
}

uint64_t sub_10076ACA0()
{
  return SupplementaryAppPlatform.systemImageName.getter();
}

uint64_t sub_10076ACB0()
{
  return SupplementaryAppPlatform.rawValue.getter();
}

uint64_t sub_10076ACC0()
{
  return type metadata accessor for SupplementaryAppPlatform();
}

uint64_t sub_10076ACD0()
{
  return InstallPagePreInstallFreeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076ACE0()
{
  return InstallPagePreInstallFreeLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:parentTitleSpace:parentTitleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:bottomSpace:)();
}

uint64_t sub_10076ACF0()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout.Metrics();
}

uint64_t sub_10076AD00()
{
  return InstallPagePreInstallFreeLayout.init(metrics:iconView:titleText:parentTitleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_10076AD10()
{
  return type metadata accessor for InstallPagePreInstallFreeLayout();
}

uint64_t sub_10076AD20()
{
  return InstallPagePreInstallPaidLayout.measurements(fitting:in:)();
}

uint64_t sub_10076AD30()
{
  return InstallPagePreInstallPaidLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076AD40()
{
  return InstallPagePreInstallPaidLayout.Metrics.init(titleSpace:subtitleSpace:separatorSpace:descriptionSpace:iconViewMargin:bottomLockupMargin:horizontalMargin:)();
}

uint64_t sub_10076AD50()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout.Metrics();
}

uint64_t sub_10076AD60()
{
  return InstallPagePreInstallPaidLayout.init(metrics:iconView:titleText:subtitleText:separator:descriptionText:bottomLockupView:)();
}

uint64_t sub_10076AD70()
{
  return type metadata accessor for InstallPagePreInstallPaidLayout();
}

uint64_t sub_10076AD80()
{
  return TodayCardMediaAppIcon.icon.getter();
}

uint64_t sub_10076AD90()
{
  return type metadata accessor for TodayCardMediaAppIcon();
}

uint64_t sub_10076ADA0()
{
  return TodayCardMediaAppEvent.formattedDates.getter();
}

uint64_t sub_10076ADB0()
{
  return TodayCardMediaAppEvent.tintColor.getter();
}

uint64_t sub_10076ADC0()
{
  return type metadata accessor for TodayCardMediaAppEvent();
}

uint64_t sub_10076ADD0()
{
  return BadgeContentKeyContentRatingResource.getter();
}

uint64_t sub_10076ADE0()
{
  return BadgeContentKeyContentRating.getter();
}

uint64_t sub_10076ADF0()
{
  return PurchaseHistoryAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_10076AE00()
{
  return type metadata accessor for PurchaseHistoryAppStateDataSource();
}

uint64_t sub_10076AE10()
{
  return TodayCardMediaInAppPurchase.lockup.getter();
}

uint64_t sub_10076AE20()
{
  return type metadata accessor for TodayCardMediaInAppPurchase();
}

uint64_t sub_10076AE30()
{
  return CondensedSearchInAppEventContentLayout.Metrics.lockupBottomSpacing.getter();
}

uint64_t sub_10076AE40()
{
  return static CondensedSearchInAppEventContentLayout.Metrics.standard.getter();
}

uint64_t sub_10076AE50()
{
  return type metadata accessor for CondensedSearchInAppEventContentLayout.Metrics();
}

uint64_t _s20ProductPageExtension33CondensedInAppPurchaseContentViewC7metrics0F16StoreKitInternal0d6SearchefG10CardLayoutV7MetricsVvpfi_0()
{
  return static CondensedSearchInAppPurchaseCardLayout.Metrics.baseMetrics.getter();
}

uint64_t sub_10076AE70()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.cardInsets.getter();
}

uint64_t sub_10076AE80()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerFont.getter();
}

uint64_t sub_10076AE90()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.tileOffset.getter();
}

uint64_t sub_10076AEA0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleFont.getter();
}

uint64_t sub_10076AEB0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.textTopMargin.getter();
}

uint64_t sub_10076AEC0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_10076AED0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_10076AEE0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleTextSpace.getter();
}

uint64_t sub_10076AEF0()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleNumberOfLines.getter();
}

uint64_t sub_10076AF00()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.headerNumberOfLines.getter();
}

uint64_t sub_10076AF10()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.offerButtonTopMargin.getter();
}

uint64_t sub_10076AF20()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.withCornerTileOffset(_:)();
}

uint64_t sub_10076AF30()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_10076AF40()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.artworkTrailingMargin.getter();
}

Swift::Int sub_10076AF50(UITraitCollection a1)
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.subtitleNumberOfLines(for:)(a1);
}

uint64_t sub_10076AF60()
{
  return CondensedSearchInAppPurchaseCardLayout.Metrics.titleFont.getter();
}

uint64_t sub_10076AF70()
{
  return type metadata accessor for CondensedSearchInAppPurchaseCardLayout.Metrics();
}

uint64_t sub_10076AF80()
{
  return dispatch thunk of TriggerPersistantStore.date(for:)();
}

uint64_t sub_10076AF90()
{
  return dispatch thunk of TriggerPersistantStore.remove(_:)();
}

void sub_10076AFA0(Swift::OpaquePointer a1)
{
}

uint64_t sub_10076AFB0()
{
  return TodayCardMediaMultiAppFallback.dominantStyle.getter();
}

uint64_t sub_10076AFC0()
{
  return TodayCardMediaMultiAppFallback.additionalText.getter();
}

uint64_t sub_10076AFD0()
{
  return TodayCardMediaMultiAppFallback.lockups.getter();
}

uint64_t sub_10076AFE0()
{
  return type metadata accessor for TodayCardMediaMultiAppFallback();
}

uint64_t sub_10076AFF0()
{
  return BadgeContentKeyNativeContentView.getter();
}

uint64_t sub_10076B000()
{
  return RemotePersonalizationAppStateDataSource.__allocating_init(asPartOf:)();
}

uint64_t sub_10076B010()
{
  return type metadata accessor for RemotePersonalizationAppStateDataSource();
}

uint64_t sub_10076B020()
{
  return type metadata accessor for TodayCardMediaBrandedSingleApp();
}

uint64_t sub_10076B030()
{
  return InAppPurchaseState.hasBeenPurchased.getter();
}

uint64_t sub_10076B040()
{
  return type metadata accessor for InAppPurchaseState();
}

uint64_t sub_10076B050()
{
  return type metadata accessor for InAppPurchaseTheme();
}

uint64_t sub_10076B060()
{
  return InAppPurchaseAction.streamlineBuyAction.getter();
}

uint64_t sub_10076B070()
{
  return InAppPurchaseAction.installRequiredAction.getter();
}

uint64_t sub_10076B080()
{
  return InAppPurchaseAction.minimumShortVersionSupportingInAppPurchaseFlow.getter();
}

uint64_t sub_10076B090()
{
  return InAppPurchaseAction.appBundleId.getter();
}

uint64_t sub_10076B0A0()
{
  return InAppPurchaseAction.productTitle.getter();
}

uint64_t sub_10076B0B0()
{
  return InAppPurchaseAction.productIdentifier.getter();
}

uint64_t sub_10076B0C0()
{
  return InAppPurchaseAction.additionalBuyParams.getter();
}

uint64_t sub_10076B0D0()
{
  return InAppPurchaseAction.appTitle.getter();
}

uint64_t sub_10076B0E0()
{
  return InAppPurchaseAction.appAdamId.getter();
}

uint64_t sub_10076B0F0()
{
  return type metadata accessor for InAppPurchaseAction();
}

uint64_t sub_10076B100()
{
  return InAppPurchaseLockup.productAction.getter();
}

uint64_t sub_10076B110()
{
  return InAppPurchaseLockup.isSubscription.getter();
}

uint64_t sub_10076B120()
{
  return InAppPurchaseLockup.descriptionText.getter();
}

uint64_t sub_10076B130()
{
  return InAppPurchaseLockup.theme.getter();
}

uint64_t sub_10076B140()
{
  return InAppPurchaseLockup.parent.getter();
}

uint64_t sub_10076B150()
{
  return type metadata accessor for InAppPurchaseLockup();
}

uint64_t sub_10076B160()
{
  return InAppPurchaseShowcase.descriptionText.getter();
}

uint64_t sub_10076B170()
{
  return InAppPurchaseShowcase.lockup.getter();
}

uint64_t sub_10076B180()
{
  return InAppPurchaseShowcase.subtitle.getter();
}

uint64_t sub_10076B190()
{
  return type metadata accessor for InAppPurchaseShowcase();
}

uint64_t sub_10076B1A0()
{
  return InAppPurchaseIconLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076B1B0()
{
  return InAppPurchaseIconLayout.Metrics.mainIconSize.getter();
}

uint64_t sub_10076B1C0()
{
  return InAppPurchaseIconLayout.Metrics.mainIconDimension.getter();
}

uint64_t sub_10076B1D0()
{
  return InAppPurchaseIconLayout.Metrics.init(mainIconDimension:shouldPlaceTileAtOrigin:scaleToFit:)();
}

uint64_t sub_10076B1E0()
{
  return InAppPurchaseIconLayout.Metrics.tileIconWidth.getter();
}

uint64_t sub_10076B1F0()
{
  return InAppPurchaseIconLayout.Metrics.scaleToFit.getter();
}

uint64_t sub_10076B200()
{
  return InAppPurchaseIconLayout.Metrics.tileOffset.getter();
}

uint64_t sub_10076B210()
{
  return InAppPurchaseIconLayout.Metrics.overallSize.getter();
}

uint64_t sub_10076B220()
{
  return InAppPurchaseIconLayout.Metrics.displaysPlus.getter();
}

uint64_t sub_10076B230()
{
  return InAppPurchaseIconLayout.Metrics.plusLineWidth.getter();
}

uint64_t sub_10076B240()
{
  return InAppPurchaseIconLayout.Metrics.tileBorderWidth.getter();
}

uint64_t sub_10076B250()
{
  return type metadata accessor for InAppPurchaseIconLayout.Metrics();
}

uint64_t sub_10076B260()
{
  return InAppPurchaseIconLayout.init(metrics:artworkView:artworkContainingView:backgroundView:plusView:tileArtworkView:tileArtworkBackgroundView:)();
}

uint64_t sub_10076B270()
{
  return type metadata accessor for InAppPurchaseIconLayout();
}

uint64_t sub_10076B280()
{
  return InAppPurchaseInstallPage.preInstallOfferDescription.getter();
}

uint64_t sub_10076B290()
{
  return InAppPurchaseInstallPage.parentLockup.getter();
}

uint64_t sub_10076B2A0()
{
  return InAppPurchaseInstallPage.lockup.getter();
}

uint64_t sub_10076B2B0()
{
  return type metadata accessor for InAppPurchaseInstallPage();
}

uint64_t sub_10076B2C0()
{
  return InAppPurchaseSearchResult.lockup.getter();
}

uint64_t sub_10076B2D0()
{
  return type metadata accessor for InAppPurchaseSearchResult();
}

uint64_t sub_10076B2E0()
{
  return InAppPurchaseStateDataSource.init(withStateProvider:)();
}

void sub_10076B2F0()
{
}

uint64_t sub_10076B300()
{
  return InAppPurchaseStateDataSource.addObserver(_:action:)();
}

uint64_t sub_10076B310()
{
  return InAppPurchaseStateDataSource.removeObserver(_:)();
}

uint64_t sub_10076B320()
{
  return InAppPurchaseStateDataSource.state(for:subscriptionFamilyId:)();
}

uint64_t sub_10076B330()
{
  return type metadata accessor for InAppPurchaseStateDataSource();
}

uint64_t sub_10076B340()
{
  return InAppPurchaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076B350()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconMargin.getter();
}

uint64_t sub_10076B360()
{
  return InAppPurchaseLockupViewLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_10076B370()
{
  return InAppPurchaseLockupViewLayout.Metrics.isHeightConstrained.setter();
}

uint64_t sub_10076B380()
{
  return InAppPurchaseLockupViewLayout.Metrics.init(iconSize:iconMargin:titlePrimaryLineSpace:titleSecondaryLineSpace:subtitleLineSpace:descriptionPrimaryLineSpace:descriptionSecondaryLineSpace:offerButtonMargin:offerButtonSize:isHeightConstrained:)();
}

uint64_t sub_10076B390()
{
  return InAppPurchaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_10076B3A0()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout.Metrics();
}

uint64_t sub_10076B3B0()
{
  return InAppPurchaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_10076B3C0()
{
  return type metadata accessor for InAppPurchaseLockupViewLayout();
}

uint64_t sub_10076B3D0()
{
  return InAppPurchaseSearchResultLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076B3E0()
{
  return static InAppPurchaseSearchResultLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_10076B3F0()
{
  return InAppPurchaseSearchResultLayout.Metrics.init(offerButtonSize:offerButtonMargin:inAppPurchaseTextSpace:titleTextSpace:subtitleTextSpace:descriptionTextSpace:detailsBottomMargin:accessibilityDetailsBottomMargin:preferredMainArtworkWidth:regularLockupAreaAspectRatio:compactLockupAreaAspectRatio:regularBodySideEdgeInsetPercentage:regularBodyHorizontalComponentSpacingPercentage:compactBodySideEdgeInsetPercentage:compactBodyHorizontalComponentSpacingPercentage:inAppIconBottomMargin:bodyVerticalPadding:)();
}

uint64_t sub_10076B400()
{
  return InAppPurchaseSearchResultLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_10076B410()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout.Metrics();
}

uint64_t sub_10076B420()
{
  return InAppPurchaseSearchResultLayout.init(metrics:inAppPurchaseText:titleText:subtitleText:offerButton:inAppPurchaseIcon:inAppPurchaseDescription:inAppPurchaseBackgroundView:)();
}

uint64_t sub_10076B430()
{
  return type metadata accessor for InAppPurchaseSearchResultLayout();
}

uint64_t sub_10076B440()
{
  return InAppPurchaseInstallPagePresenter.init(objectGraph:sidepack:pageUrl:appStateController:)();
}

uint64_t sub_10076B450()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.purchaseDidComplete(for:)();
}

uint64_t sub_10076B460()
{
  return static InAppPurchaseInstallPagePresenter.use(stateDataSource:)();
}

uint64_t sub_10076B470()
{
  return dispatch thunk of InAppPurchaseInstallPagePresenter.view.setter();
}

uint64_t sub_10076B480()
{
  return type metadata accessor for InAppPurchaseInstallPagePresenter();
}

uint64_t sub_10076B490()
{
  return InAppPurchaseOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:restrictions:subtitlePosition:alignment:)();
}

uint64_t sub_10076B4A0()
{
  return static InAppPurchaseOfferButtonPresenter.use(stateDataSource:)();
}

uint64_t sub_10076B4B0()
{
  return type metadata accessor for InAppPurchaseOfferButtonPresenter();
}

uint64_t sub_10076B4C0()
{
  return InAppPurchaseShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076B4D0()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_10076B4E0()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.init(iconSize:titleSpace:subtitleSpace:offerTopSpace:offerButtonSize:descriptionSpace:)();
}

uint64_t sub_10076B4F0()
{
  return InAppPurchaseShowcaseLockupViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_10076B500()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_10076B510()
{
  return InAppPurchaseShowcaseLockupViewLayout.init(metrics:iconView:titleText:subtitleText:descriptionText:offerButton:)();
}

uint64_t sub_10076B520()
{
  return type metadata accessor for InAppPurchaseShowcaseLockupViewLayout();
}

uint64_t sub_10076B530()
{
  return OpenAppAction.destination.getter();
}

uint64_t sub_10076B540()
{
  return OpenAppAction.allowBetaApps.getter();
}

uint64_t sub_10076B550()
{
  return OpenAppAction.init(title:adamId:allowBetaApps:destination:presentationStyle:actionMetrics:)();
}

uint64_t sub_10076B560()
{
  return OpenAppAction.adamId.getter();
}

uint64_t sub_10076B570()
{
  return type metadata accessor for OpenAppAction();
}

uint64_t sub_10076B580()
{
  return dispatch thunk of static ASDInAppPurchaseDatabase.refresh()();
}

uint64_t sub_10076B590()
{
  return type metadata accessor for ASDInAppPurchaseDatabase();
}

uint64_t sub_10076B5A0()
{
  return ASDInAppPurchaseStateProvider.init()();
}

uint64_t sub_10076B5B0()
{
  return type metadata accessor for ASDInAppPurchaseStateProvider();
}

uint64_t sub_10076B5C0()
{
  return type metadata accessor for ClearAppUsageDataAction();
}

uint64_t sub_10076B5D0()
{
  return LegacyAppState.AppInstallationDetails.hasPostProcessing.getter();
}

uint64_t sub_10076B5E0()
{
  return LegacyAppState.AppInstallationDetails.downloadingPhaseProgress.getter();
}

uint64_t sub_10076B5F0()
{
  return LegacyAppState.AppInstallationDetails.postProcessingPhaseProgress.getter();
}

uint64_t sub_10076B600()
{
  return type metadata accessor for LegacyAppState.AppInstallationDetails();
}

uint64_t sub_10076B610()
{
  return LegacyAppState.isUpdatable.getter();
}

uint64_t sub_10076B620()
{
  return LegacyAppState.hasBeenPurchased.getter();
}

uint64_t sub_10076B630()
{
  return LegacyAppState.isLocalApplication.getter();
}

uint64_t sub_10076B640()
{
  return LegacyAppState.estimatedTimeRemaining.getter();
}

uint64_t sub_10076B650()
{
  return LegacyAppState.estimatedTimeRemainingText.getter();
}

uint64_t sub_10076B660()
{
  return LegacyAppState.isBuyable.getter();
}

uint64_t sub_10076B670()
{
  return type metadata accessor for LegacyAppState();
}

uint64_t sub_10076B680()
{
  return type metadata accessor for ModernAppStateDataSource();
}

uint64_t sub_10076B690()
{
  return ModernAppStateDataSource.init(_:isIncremental:supportedAppKinds:)();
}

uint64_t sub_10076B6A0()
{
  return SelectAppAction.adamId.getter();
}

uint64_t sub_10076B6B0()
{
  return type metadata accessor for SelectAppAction();
}

uint64_t sub_10076B6C0()
{
  return static UpdateStore.didChangeNotification.getter();
}

uint64_t sub_10076B6D0()
{
  return static UpdateStore.shared.getter();
}

uint64_t sub_10076B6E0()
{
  return type metadata accessor for UpdateStore();
}

uint64_t sub_10076B6F0()
{
  return static PendingAppLaunch.didFailToLaunch()();
}

uint64_t sub_10076B700()
{
  return static PendingAppLaunch.didFinishLaunch(postEventUsing:)();
}

uint64_t sub_10076B710()
{
  return RestoreAppStoreAction.gatedAppAdamId.getter();
}

uint64_t sub_10076B720()
{
  return RestoreAppStoreAction.init(actionMetrics:gatedAppAdamId:)();
}

uint64_t sub_10076B730()
{
  return type metadata accessor for RestoreAppStoreAction();
}

uint64_t sub_10076B740()
{
  return TodayCardAppEventLockupOverlay.lockup.getter();
}

uint64_t sub_10076B750()
{
  return type metadata accessor for TodayCardAppEventLockupOverlay();
}

uint64_t sub_10076B760()
{
  return dispatch thunk of AppSearchResult.shouldDisplayMedia.getter();
}

uint64_t sub_10076B770()
{
  return AppSearchResult.lockup.getter();
}

uint64_t sub_10076B780()
{
  return type metadata accessor for AppSearchResult();
}

uint64_t sub_10076B790()
{
  return type metadata accessor for AppShowcaseType();
}

uint64_t sub_10076B7A0()
{
  return dispatch thunk of AppStateMachine.hasCurrentBetaState.getter();
}

uint64_t sub_10076B7B0()
{
  return dispatch thunk of AppStateMachine.addStateTransitionObserver(_:action:)();
}

uint64_t sub_10076B7C0()
{
  return dispatch thunk of AppStateMachine.appStateController.getter();
}

uint64_t sub_10076B7D0()
{
  return dispatch thunk of AppStateMachine.removeStateTransitionActions(for:)();
}

uint64_t sub_10076B7E0()
{
  return dispatch thunk of AppStateMachine.currentState.getter();
}

uint64_t sub_10076B7F0()
{
  return dispatch thunk of AppStateMachine.currentStateIncludingBeta(_:)();
}

uint64_t sub_10076B800()
{
  return dispatch thunk of AppStateMachine.startDownloadTime.getter();
}

uint64_t sub_10076B810()
{
  return dispatch thunk of AppStateMachine.adamId.getter();
}

uint64_t sub_10076B820()
{
  return type metadata accessor for AppPromotionType();
}

uint64_t sub_10076B830()
{
  return AppUpdateLockups.pendingManual.getter();
}

uint64_t sub_10076B840()
{
  return type metadata accessor for AppUpdateLockups();
}

uint64_t sub_10076B850()
{
  return AppEventDetailPage.appEvent.getter();
}

uint64_t sub_10076B860()
{
  return AppEventDetailPage.shareAction.getter();
}

uint64_t sub_10076B870()
{
  return AppEventDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_10076B880()
{
  return AppEventDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_10076B890()
{
  return AppEventDetailPage.video.getter();
}

uint64_t sub_10076B8A0()
{
  return AppEventDetailPage.artwork.getter();
}

uint64_t sub_10076B8B0()
{
  return type metadata accessor for AppEventDetailPage();
}

uint64_t sub_10076B8C0()
{
  return dispatch thunk of AppStateController.refreshState(for:)();
}

uint64_t sub_10076B8D0()
{
  return dispatch thunk of AppStateController.setWaiting(for:installationType:)();
}

uint64_t sub_10076B8E0()
{
  return dispatch thunk of AppStateController.clearWaiting(for:refreshState:)();
}

uint64_t sub_10076B8F0()
{
  return dispatch thunk of AppStateController.stateMachine(forApp:)();
}

uint64_t sub_10076B900()
{
  return dispatch thunk of AppStateController.refreshDataSources(for:completion:)();
}

uint64_t sub_10076B910()
{
  return AppStateController.clearWaiting(for:)();
}

uint64_t sub_10076B920()
{
  return static AppExitMetricsEvent.makeData()();
}

uint64_t sub_10076B930()
{
  return type metadata accessor for AppEnterMetricsEvent.EnterKind();
}

uint64_t sub_10076B940()
{
  return static AppEnterMetricsEvent.makeData(enterKind:)();
}

uint64_t sub_10076B950()
{
  return AppEventSearchResult.appEvent.getter();
}

uint64_t sub_10076B960()
{
  return AppEventSearchResult.lockup.getter();
}

uint64_t sub_10076B970()
{
  return type metadata accessor for AppEventSearchResult();
}

uint64_t sub_10076B990()
{
  return AppUpdatesDataSource.makeUpdatesLockupsStream()();
}

uint64_t sub_10076B9A0()
{
  return AppUpdatesDataSource.init(objectGraph:)();
}

uint64_t sub_10076B9B0()
{
  return type metadata accessor for AppUpdatesDataSource();
}

uint64_t sub_10076B9C0()
{
  return AppEventFormattedDate.countdownToDate.getter();
}

uint64_t sub_10076B9D0()
{
  return AppEventFormattedDate.displayFromDate.getter();
}

uint64_t sub_10076B9E0()
{
  return AppEventFormattedDate.displayText.getter();
}

uint64_t sub_10076B9F0()
{
  return AppEventFormattedDate.showLiveIndicator.getter();
}

uint64_t sub_10076BA00()
{
  return AppEventFormattedDate.countdownStringKey.getter();
}

uint64_t sub_10076BA10()
{
  return AppOfferButtonPresenter.init(displayProperties:buttonAction:appStateController:appStoreInstallStateMonitor:restrictions:subtitlePosition:alignment:hasCompactRedownloads:arePreordersCancellable:includeBetaApps:)();
}

uint64_t sub_10076BA20()
{
  return type metadata accessor for AppOfferButtonPresenter();
}

uint64_t sub_10076BA30()
{
  return AppLaunchTrampolineAction.fallbackAction.getter();
}

uint64_t sub_10076BA40()
{
  return AppLaunchTrampolineAction.payloadUrl.getter();
}

uint64_t sub_10076BA50()
{
  return AppLaunchTrampolineAction.bundleId.getter();
}

uint64_t sub_10076BA60()
{
  return AppEventNotificationConfig.scheduleClickEvent.getter();
}

uint64_t sub_10076BA70()
{
  return AppEventNotificationConfig.cancelScheduleClickEvent.getter();
}

uint64_t sub_10076BA80()
{
  return AppEventNotificationConfig.appEventId.getter();
}

uint64_t sub_10076BA90()
{
  return AppEventNotificationConfig.displayTime.getter();
}

uint64_t sub_10076BAA0()
{
  return AppEventNotificationConfig.failureAction.getter();
}

uint64_t sub_10076BAB0()
{
  return AppEventNotificationConfig.scheduledAction.getter();
}

uint64_t sub_10076BAC0()
{
  return AppEventNotificationConfig.notAuthorizedAction.getter();
}

uint64_t sub_10076BAD0()
{
  return AppEventDetailPagePresenter.init(objectGraph:appEventDetailPage:)();
}

uint64_t sub_10076BAE0()
{
  return dispatch thunk of AppEventDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_10076BAF0()
{
  return dispatch thunk of AppEventDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_10076BB00()
{
  return dispatch thunk of AppEventDetailPagePresenter.view.setter();
}

uint64_t sub_10076BB10()
{
  return type metadata accessor for AppEventDetailPagePresenter();
}

uint64_t sub_10076BB20()
{
  return AppShowcaseLockupViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076BB30()
{
  return AppShowcaseLockupViewLayout.Metrics.init(isCenterAligned:iconSize:wordmarkSpace:titleSpace:titleWithWordmarkSpace:descriptionSpace:descriptionBottomBufferSpace:offerLabelSpace:offerLabelBottomBufferSpace:offerButtonSize:crossLinkTitleSpace:crossLinkTitleWithWordmarkSpace:crossLinkSubtitleSpace:)();
}

uint64_t sub_10076BB40()
{
  return type metadata accessor for AppShowcaseLockupViewLayout.Metrics();
}

uint64_t sub_10076BB50()
{
  return AppShowcaseLockupViewLayout.init(metrics:iconView:wordmarkView:titleText:descriptionText:offerButton:offerText:crossLinkTitleText:crossLinkSubtitleText:)();
}

uint64_t sub_10076BB60()
{
  return type metadata accessor for AppShowcaseLockupViewLayout();
}

uint64_t sub_10076BB70()
{
  return AppPromotionDetailPagePresenter.init(objectGraph:appPromotionDetailPage:)();
}

uint64_t sub_10076BB80()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.lockupClickAction.getter();
}

uint64_t sub_10076BB90()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.sizeClassDidChange()();
}

uint64_t sub_10076BBA0()
{
  return dispatch thunk of AppPromotionDetailPagePresenter.view.setter();
}

uint64_t sub_10076BBB0()
{
  return type metadata accessor for AppPromotionDetailPagePresenter();
}

uint64_t sub_10076BBC0()
{
  return AppEvent.moduleVideo.getter();
}

uint64_t sub_10076BBD0()
{
  return AppEvent.requirements.getter();
}

uint64_t sub_10076BBE0()
{
  return AppEvent.moduleArtwork.getter();
}

uint64_t sub_10076BBF0()
{
  return AppEvent.formattedDates.getter();
}

uint64_t sub_10076BC00()
{
  return AppEvent.mediaOverlayStyle.getter();
}

uint64_t sub_10076BC10()
{
  return AppEvent.notificationConfig.getter();
}

uint64_t sub_10076BC20()
{
  return AppEvent.includeBorderInDarkMode.getter();
}

uint64_t sub_10076BC30()
{
  return AppEvent.hideLockupWhenNotInstalled.getter();
}

uint64_t sub_10076BC40()
{
  return AppEvent.kind.getter();
}

uint64_t sub_10076BC50()
{
  return AppEvent.title.getter();
}

uint64_t sub_10076BC60()
{
  return AppEvent.detail.getter();
}

uint64_t sub_10076BC70()
{
  return AppEvent.lockup.getter();
}

uint64_t sub_10076BC80()
{
  return AppEvent.subtitle.getter();
}

uint64_t sub_10076BC90()
{
  return type metadata accessor for AppEvent();
}

uint64_t sub_10076BCA0()
{
  return AppPlatform.rawValue.getter();
}

uint64_t sub_10076BCB0()
{
  return type metadata accessor for AppPlatform();
}

uint64_t sub_10076BCC0()
{
  return AppShowcase.descriptionText.getter();
}

uint64_t sub_10076BCD0()
{
  return AppShowcase.type.getter();
}

uint64_t sub_10076BCE0()
{
  return AppShowcase.video.getter();
}

uint64_t sub_10076BCF0()
{
  return AppShowcase.lockup.getter();
}

uint64_t sub_10076BD00()
{
  return type metadata accessor for AppShowcase();
}

uint64_t sub_10076BD10()
{
  return AppPromotion.clickAction.getter();
}

uint64_t sub_10076BD20()
{
  return AppPromotion.promotionType.getter();
}

uint64_t sub_10076BD30()
{
  return type metadata accessor for AppPromotion();
}

uint64_t sub_10076BD40()
{
  return type metadata accessor for StoreViewControllerLifecycleEvent();
}

uint64_t sub_10076BD50()
{
  return dispatch thunk of StoreViewControllerLifecycleObserver.observe(lifecycleEvent:)();
}

uint64_t sub_10076BD60()
{
  return StoreTab.Identifier.init(navigationTab:)();
}

uint64_t sub_10076BD70()
{
  return StoreTab.Identifier.init(rawValue:)();
}

uint64_t sub_10076BD80()
{
  return StoreTab.Identifier.rawValue.getter();
}

uint64_t sub_10076BD90()
{
  return type metadata accessor for StoreTab.Identifier();
}

uint64_t sub_10076BDA0()
{
  return StoreTab.init(identifier:url:title:imageIdentifier:editorialPageUrls:)();
}

uint64_t sub_10076BDB0()
{
  return type metadata accessor for StoreTab();
}

uint64_t sub_10076BDC0()
{
  return type metadata accessor for AppStoreEngagementEvent();
}

uint64_t sub_10076BDD0()
{
  return AppStoreEngagementManager.recordEngagement(event:resultHandler:)();
}

uint64_t sub_10076BDE0()
{
  return AppStoreEngagementManager.properties.getter();
}

uint64_t sub_10076BDF0()
{
  return AppStoreEngagementManager.init(objectGraph:subscriptionManager:)();
}

void sub_10076BE00(Swift::String _, Swift::Bool isEnabled)
{
}

BOOL sub_10076BE10(Swift::String identifier)
{
  return AppStoreEngagementManager.isBadgeEnabled(identifier:)(identifier);
}

uint64_t sub_10076BE20()
{
  return AppStoreEngagementManager.previouslyDisabledProperties.getter();
}

uint64_t sub_10076BE30()
{
  return type metadata accessor for AppStoreEngagementManager();
}

uint64_t sub_10076BE40()
{
  return dispatch thunk of AppStoreInstallStateMonitor.onAppStoreInstallStateChange.getter();
}

uint64_t sub_10076BE50()
{
  return dispatch thunk of AppStoreInstallStateMonitor.appStoreInstalled.getter();
}

void sub_10076BE60()
{
}

uint64_t sub_10076BE70()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.loadInferences(for:)();
}

uint64_t sub_10076BE80()
{
  return dispatch thunk of AppStoreOnDeviceRecommendationsManager.clearData()();
}

uint64_t sub_10076BE90()
{
  return type metadata accessor for AppStoreOnDeviceRecommendationsManager();
}

uint64_t sub_10076BEA0()
{
  return AppStoreDeepLink.init(userActivity:refApp:)();
}

uint64_t sub_10076BEB0()
{
  return AppStoreDeepLink.url.getter();
}

uint64_t sub_10076BEC0()
{
  return AppStoreDeepLink.referral.getter();
}

uint64_t sub_10076BED0()
{
  return type metadata accessor for AppStoreDeepLink();
}

uint64_t sub_10076BEE0()
{
  return dispatch thunk of AdsService.registerDependencies(sessionProviding:onDeviceAdProvider:)();
}

uint64_t sub_10076BEF0()
{
  return type metadata accessor for AdsService();
}

uint64_t sub_10076BF00()
{
  return Annotation.linkAction.getter();
}

uint64_t sub_10076BF10()
{
  return Annotation.shouldAlwaysPresentExpanded.getter();
}

uint64_t sub_10076BF20()
{
  return Annotation.items.getter();
}

uint64_t sub_10076BF30()
{
  return Annotation.title.getter();
}

uint64_t sub_10076BF40()
{
  return Annotation.summary.getter();
}

uint64_t sub_10076BF50()
{
  return Annotation.items_V2.getter();
}

uint64_t sub_10076BF60()
{
  return type metadata accessor for Annotation();
}

uint64_t sub_10076BF70()
{
  return ArcadePage.subscriptionLockup.getter();
}

uint64_t sub_10076BF80()
{
  return type metadata accessor for ArcadePage();
}

uint64_t sub_10076BF90()
{
  return type metadata accessor for BadgeStyle();
}

uint64_t sub_10076BFA0()
{
  return BorderView.borderColor.setter();
}

uint64_t sub_10076BFB0()
{
  return BorderView.borderWidth.setter();
}

uint64_t sub_10076BFC0()
{
  return type metadata accessor for BorderView();
}

uint64_t sub_10076BFD0()
{
  return FlowAction.referrerUrl.getter();
}

uint64_t sub_10076BFE0()
{
  return FlowAction.setPageData(_:)();
}

uint64_t sub_10076BFF0()
{
  return FlowAction.referrerData.getter();
}

uint64_t sub_10076C000()
{
  return FlowAction.animationBehavior.getter();
}

uint64_t sub_10076C010()
{
  return FlowAction.presentationContext.getter();
}

uint64_t sub_10076C020()
{
  return FlowAction.presentationContext.setter();
}

uint64_t sub_10076C030()
{
  return FlowAction.pageDataPageRenderMetrics.getter();
}

uint64_t sub_10076C040()
{
  return FlowAction.init(id:title:artwork:page:url:referrerUrl:referrerData:pageData:actionMetrics:presentationContext:animationBehavior:origin:presentationStyle:presentation:)();
}

uint64_t sub_10076C050()
{
  return FlowAction.page.getter();
}

uint64_t sub_10076C060()
{
  return FlowAction.origin.getter();
}

uint64_t sub_10076C070()
{
  return FlowAction.pageUrl.getter();
}

uint64_t sub_10076C080()
{
  return FlowAction.pageData<A>(as:or:)();
}

uint64_t sub_10076C090()
{
  return type metadata accessor for FlowAction();
}

uint64_t sub_10076C0A0()
{
  return static FlowOrigin.== infix(_:_:)();
}

uint64_t sub_10076C0B0()
{
  return type metadata accessor for FlowOrigin();
}

uint64_t sub_10076C0C0()
{
  return static GameCenter.fetchGameRecord(for:with:)();
}

uint64_t sub_10076C0D0()
{
  return static GameCenter.withLocalPlayer(on:_:)();
}

uint64_t sub_10076C0E0()
{
  return static GameCenter.addContactToDenyList(_:for:)();
}

uint64_t sub_10076C0F0()
{
  return type metadata accessor for GameCenter.PushFriendInvitationType();
}

uint64_t sub_10076C100()
{
  return static GameCenter.inviteFriendViewController(localPlayer:contactId:)();
}

uint64_t sub_10076C120()
{
  return type metadata accessor for GameCenter();
}

uint64_t sub_10076C130()
{
  return HttpAction.failureAction.getter();
}

uint64_t sub_10076C140()
{
  return HttpAction.successAction.getter();
}

uint64_t sub_10076C150()
{
  return HttpAction.needsMediaToken.getter();
}

uint64_t sub_10076C160()
{
  return HttpAction.start(urlSession:bag:process:bagContract:mediaTokenService:)();
}

uint64_t sub_10076C170()
{
  return type metadata accessor for HttpAction();
}

uint64_t sub_10076C180()
{
  return dispatch thunk of LinkLoader.setPresentation(_:forKey:)();
}

uint64_t sub_10076C190()
{
  return dispatch thunk of LinkLoader.fetchPresentation(for:cacheEnabled:)();
}

uint64_t sub_10076C1A0()
{
  return dispatch thunk of LinkLoader.availablePresentation(for:)();
}

uint64_t sub_10076C1B0()
{
  return LinkLoader.init(_:)();
}

uint64_t sub_10076C1C0()
{
  return type metadata accessor for MSOContext();
}

uint64_t sub_10076C1D0()
{
  return static OfferStyle.== infix(_:_:)();
}

uint64_t sub_10076C1E0()
{
  return type metadata accessor for OfferStyle();
}

uint64_t sub_10076C1F0()
{
  return PageFacets.FacetGroup.title.getter();
}

uint64_t sub_10076C200()
{
  return PageFacets.FacetGroup.facets.getter();
}

uint64_t sub_10076C210()
{
  return type metadata accessor for PageFacets.FacetGroup();
}

uint64_t sub_10076C220()
{
  return PageFacets.facetGroups.getter();
}

uint64_t sub_10076C230()
{
  return type metadata accessor for PageFacets.Facet.DisplayType();
}

uint64_t sub_10076C240()
{
  return PageFacets.Facet.displayType.getter();
}

uint64_t sub_10076C250()
{
  return PageFacets.Facet.defaultOptions.getter();
}

uint64_t sub_10076C260()
{
  return PageFacets.Facet.isHiddenFromMenu.getter();
}

uint64_t sub_10076C270()
{
  return PageFacets.Facet.displayOptionsInline.getter();
}

uint64_t sub_10076C280()
{
  return PageFacets.Facet.metricsParameterName.getter();
}

uint64_t sub_10076C290()
{
  return PageFacets.Facet.showsSelectedOptions.getter();
}

uint64_t sub_10076C2A0()
{
  return static PageFacets.Facet.== infix(_:_:)();
}

uint64_t sub_10076C2B0()
{
  return PageFacets.Facet.id.getter();
}

uint64_t sub_10076C2C0()
{
  return PageFacets.Facet.title.getter();
}

uint64_t sub_10076C2D0()
{
  return PageFacets.Facet.Option.metricsValue.getter();
}

uint64_t sub_10076C2E0()
{
  return PageFacets.Facet.Option.systemImageName.getter();
}

uint64_t sub_10076C2F0()
{
  return static PageFacets.Facet.Option.== infix(_:_:)();
}

uint64_t sub_10076C300()
{
  return PageFacets.Facet.Option.title.getter();
}

uint64_t sub_10076C310()
{
  return type metadata accessor for PageFacets.Facet.Option();
}

uint64_t sub_10076C320()
{
  return PageFacets.Facet.options.getter();
}

uint64_t sub_10076C330()
{
  return type metadata accessor for PageFacets.Facet();
}

uint64_t sub_10076C340()
{
  return type metadata accessor for PageFacets();
}

uint64_t sub_10076C350()
{
  return RateAction.adamId.getter();
}

uint64_t sub_10076C360()
{
  return dispatch thunk of RateAction.rating.getter();
}

uint64_t sub_10076C370()
{
  return dispatch thunk of RateAction.rating.setter();
}

uint64_t sub_10076C380()
{
  return RateAction.Parameter.rawValue.getter();
}

uint64_t sub_10076C390()
{
  return type metadata accessor for RateAction.Parameter();
}

uint64_t sub_10076C3A0()
{
  return type metadata accessor for RateAction();
}

uint64_t sub_10076C3B0()
{
  return dispatch thunk of ShadowView.shouldAnimateBoundsChange.setter();
}

uint64_t sub_10076C3C0()
{
  return ShadowView.__allocating_init(radius:style:)();
}

uint64_t sub_10076C3D0()
{
  return dispatch thunk of ShadowView.shadow.setter();
}

uint64_t sub_10076C3E0()
{
  return dispatch thunk of ShadowView.setCorner(radius:style:)();
}

uint64_t sub_10076C3F0()
{
  return type metadata accessor for ShadowView();
}

uint64_t sub_10076C400()
{
  return ShelfBatch.shelves.getter();
}

uint64_t sub_10076C410()
{
  return StyledText.init(rawText:rawTextType:)();
}

uint64_t sub_10076C420()
{
  return dispatch thunk of StyledText.plainText.getter();
}

uint64_t sub_10076C430()
{
  return dispatch thunk of StyledText.asAttributedString(using:)();
}

uint64_t sub_10076C440()
{
  return type metadata accessor for StyledText.MediaType();
}

uint64_t sub_10076C450()
{
  return type metadata accessor for StyledText();
}

uint64_t sub_10076C460()
{
  return tryToFetch(artworkFor:into:on:asPartOf:)();
}

uint64_t sub_10076C470()
{
  return AlertAction.destructiveActionIndex.getter();
}

uint64_t sub_10076C480()
{
  return AlertAction.cancelTitle.getter();
}

uint64_t sub_10076C490()
{
  return AlertAction.isCancelable.getter();
}

uint64_t sub_10076C4A0()
{
  return AlertAction.buttonActions.getter();
}

uint64_t sub_10076C4B0()
{
  return AlertAction.toastDuration.getter();
}

uint64_t sub_10076C4C0()
{
  return AlertAction.style.getter();
}

uint64_t sub_10076C4D0()
{
  return AlertAction.init(title:message:isCancelable:cancelTitle:cancelAction:buttonActions:destructiveActionIndex:style:artwork:toastDuration:presentationStyle:actionMetrics:)();
}

uint64_t sub_10076C4E0()
{
  return AlertAction.message.getter();
}

uint64_t sub_10076C4F0()
{
  return type metadata accessor for AlertAction();
}

uint64_t sub_10076C500()
{
  return ArcadeState.isSubscribed.getter();
}

uint64_t sub_10076C510()
{
  return ArcadeState.shortSummary.getter();
}

uint64_t sub_10076C520()
{
  return ArcadeState.isTrialAvailable.getter();
}

uint64_t sub_10076C530()
{
  return type metadata accessor for ArcadeState();
}

uint64_t sub_10076C540()
{
  return ArticlePage.__allocating_init(copying:replacingCard:)();
}

uint64_t sub_10076C550()
{
  return type metadata accessor for ArticlePage();
}

uint64_t sub_10076C560()
{
  return static ArtworkView.cardArtworkView.getter();
}

uint64_t sub_10076C570()
{
  return static ArtworkView.iconArtworkView.getter();
}

uint64_t sub_10076C580()
{
  return static ArtworkView.brickArtworkView.getter();
}

uint64_t sub_10076C590()
{
  return static ArtworkView.iapIconArtworkView.getter();
}

uint64_t sub_10076C5A0()
{
  return ArtworkView.isImageHidden.setter();
}

uint64_t sub_10076C5B0()
{
  return ArtworkView.roundedCorners.setter();
}

uint64_t sub_10076C5C0()
{
  return ArtworkView.backgroundColor.setter();
}

uint64_t sub_10076C5D0()
{
  return static ArtworkView.iconBorderColor.getter();
}

uint64_t sub_10076C5E0()
{
  return static ArtworkView.iconBorderWidth.getter();
}

uint64_t sub_10076C5F0()
{
  return ArtworkView.artworkTintColor.setter();
}

uint64_t sub_10076C600()
{
  return ArtworkView.placeholderColor.setter();
}

uint64_t sub_10076C610()
{
  return ArtworkView.clipImageToBounds.setter();
}

uint64_t sub_10076C620()
{
  return ArtworkView.frameUpdatesImageSize.setter();
}

uint64_t sub_10076C630()
{
  return ArtworkView.isDisplayingSymbolImage.getter();
}

uint64_t sub_10076C640()
{
  return ArtworkView.shouldSymbolImageSelfSize.setter();
}

uint64_t sub_10076C650()
{
  return ArtworkView.setImageDisablesAnimations.setter();
}

uint64_t sub_10076C660()
{
  return ArtworkView.preferredSymbolConfiguration.getter();
}

uint64_t sub_10076C670()
{
  return ArtworkView.preferredSymbolConfiguration.setter();
}

uint64_t sub_10076C680()
{
  return ArtworkView.imageBaselineOffsetFromBottom.getter();
}

uint64_t sub_10076C690()
{
  return ArtworkView.accessibilityIgnoresInvertColors.setter();
}

void sub_10076C6A0(UIImage_optional image, Swift::Bool isAnimationPermitted)
{
}

uint64_t sub_10076C6B0()
{
  return ArtworkView.frame.modify();
}

uint64_t sub_10076C6C0()
{
  return ArtworkView.frame.getter();
}

uint64_t sub_10076C6D0()
{
  return ArtworkView.frame.setter();
}

uint64_t sub_10076C6E0()
{
  return ArtworkView.image.getter();
}

uint64_t sub_10076C6F0()
{
  return ArtworkView.image.setter();
}

uint64_t sub_10076C700()
{
  return ArtworkView.style.getter();
}

uint64_t sub_10076C710()
{
  return ArtworkView.style.setter();
}

uint64_t sub_10076C720()
{
  return ArtworkView.shadow.setter();
}

void sub_10076C730(UIImage_optional image, Swift::Bool animated)
{
}

uint64_t sub_10076C740()
{
  return ArtworkView.imageSize.getter();
}

uint64_t sub_10076C750()
{
  return ArtworkView.imageSize.setter();
}

uint64_t sub_10076C760()
{
  return ArtworkView.setCorner(radius:style:)();
}

uint64_t sub_10076C770()
{
  return type metadata accessor for ArtworkView();
}

uint64_t sub_10076C780()
{
  return BlankAction.__allocating_init(actionMetrics:)();
}

uint64_t sub_10076C790()
{
  return BlankAction.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_10076C7A0()
{
  return type metadata accessor for BlankAction();
}

uint64_t sub_10076C7B0()
{
  return BrickLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076C7C0()
{
  return BrickLayout.Metrics.init(artworkAspectRatio:labelSpace:labelFontSource:isLabelFullWidth:numberOfLines:)();
}

uint64_t sub_10076C7D0()
{
  return type metadata accessor for BrickLayout.Metrics();
}

uint64_t sub_10076C7E0()
{
  return BrickLayout.init(metrics:artworkView:labelView:)();
}

uint64_t sub_10076C7F0()
{
  return type metadata accessor for BrickLayout();
}

uint64_t sub_10076C800()
{
  return Conditional.evaluate<>(in:)();
}

uint64_t sub_10076C810()
{
  return Conditional.evaluate(with:)();
}

uint64_t sub_10076C820()
{
  return Conditional<>.init(regularValue:rightToLeftValue:)();
}

uint64_t sub_10076C830()
{
  return Conditional<>.init(regularValue:compactValue:)();
}

uint64_t sub_10076C840()
{
  return Conditional<>.init(accessibleLayoutValue:regularLayoutValue:)();
}

uint64_t sub_10076C850()
{
  return Conditional<>.init(value:)();
}

uint64_t sub_10076C860()
{
  return Conditional<>.init(property:trueValue:falseValue:)();
}

uint64_t sub_10076C870()
{
  return Conditional<>.anyDimension.getter();
}

uint64_t sub_10076C880()
{
  return Conditional<>.init(regularConstant:compactConstant:regularSource:compactSource:)();
}

uint64_t sub_10076C890()
{
  return Conditional<>.init(regularConstant:compactConstant:source:)();
}

uint64_t sub_10076C8A0()
{
  return Conditional<>.init(roundedCornersConstant:nonRoundedCornersConstant:source:)();
}

uint64_t sub_10076C8B0()
{
  return Conditional<>.init(accessibleLayoutConstant:regularLayoutConstant:source:)();
}

uint64_t sub_10076C8C0()
{
  return Conditional<>.value(in:rounded:)();
}

uint64_t sub_10076C8D0()
{
  return Conditional<>.init(roundedCornersValue:nonRoundedCornersValue:)();
}

uint64_t sub_10076C8E0()
{
  return Conditional<>.value.getter();
}

uint64_t sub_10076C8F0()
{
  return Conditional<>.init(whenOneOf:use:otherwiseUse:)();
}

uint64_t sub_10076C900()
{
  return type metadata accessor for Conditional();
}

uint64_t sub_10076C910()
{
  return Conditional.init(_:)();
}

uint64_t sub_10076C920()
{
  return static CornerStyle.== infix(_:_:)();
}

uint64_t sub_10076C930()
{
  return type metadata accessor for CornerStyle();
}

uint64_t sub_10076C940()
{
  return DynamicPage.presentationOptions.getter();
}

uint64_t sub_10076C950()
{
  return FinanceType.url.getter();
}

uint64_t sub_10076C960()
{
  return type metadata accessor for FinanceType();
}

uint64_t sub_10076C970()
{
  return FlowPreview.init(destination:actions:)();
}

uint64_t sub_10076C980()
{
  return FlowPreview.destination.getter();
}

uint64_t sub_10076C990()
{
  return FlowPreview.actions.getter();
}

uint64_t sub_10076C9A0()
{
  return type metadata accessor for FlowPreview();
}

uint64_t sub_10076C9B0()
{
  return FramedMedia.isFullWidth.getter();
}

uint64_t sub_10076C9C0()
{
  return FramedMedia.hasRoundedCorners.getter();
}

uint64_t sub_10076C9D0()
{
  return FramedMedia.caption.getter();
}

uint64_t sub_10076C9E0()
{
  return FramedMedia.ordinal.getter();
}

uint64_t sub_10076C9F0()
{
  return FramedVideo.video.getter();
}

uint64_t sub_10076CA00()
{
  return FramedVideo.artwork.getter();
}

uint64_t sub_10076CA10()
{
  return type metadata accessor for FramedVideo();
}

uint64_t sub_10076CA20()
{
  return GenericPage.presentationOptions.getter();
}

uint64_t sub_10076CA30()
{
  return GenericPage.title.getter();
}

uint64_t sub_10076CA40()
{
  return GenericPage.init(shelves:title:shareAction:presentationOptions:nextPage:isIncomplete:uber:loadCompletedAction:pageRefreshPolicy:pageMetrics:pageRenderEvent:context:)();
}

uint64_t sub_10076CA50()
{
  return type metadata accessor for GenericPage();
}

void sub_10076CA60()
{
}

uint64_t sub_10076CA70()
{
  return type metadata accessor for LocalAction();
}

uint64_t sub_10076CA80()
{
  return ObjectGraph.artworkLoader.getter();
}

uint64_t sub_10076CA90()
{
  return ObjectGraph.actionDispatcher.getter();
}

uint64_t sub_10076CAA0()
{
  return ObjectGraph.bag.getter();
}

uint64_t sub_10076CAB0()
{
  return type metadata accessor for ObjectGraph();
}

uint64_t sub_10076CAC0()
{
  return OfferAction.buyCompletedAction.getter();
}

uint64_t sub_10076CAD0()
{
  return OfferAction.purchaseToken.getter();
}

uint64_t sub_10076CAE0()
{
  return OfferAction.purchaseToken.setter();
}

uint64_t sub_10076CAF0()
{
  return OfferAction.includeBetaApps.getter();
}

uint64_t sub_10076CB00()
{
  return OfferAction.adamId.getter();
}

uint64_t sub_10076CB10()
{
  return OfferAction.bundleId.getter();
}

uint64_t sub_10076CB20()
{
  return type metadata accessor for OfferAction();
}

uint64_t sub_10076CB30()
{
  return static Placeholder.subtitleText.getter();
}

uint64_t sub_10076CB40()
{
  return static Placeholder.appEventKindText.getter();
}

uint64_t sub_10076CB50()
{
  return static Placeholder.headingTitleText.getter();
}

uint64_t sub_10076CB60()
{
  return static Placeholder.appEventTitleText.getter();
}

uint64_t sub_10076CB70()
{
  return static Placeholder.appEventSubtitleText.getter();
}

uint64_t sub_10076CB80()
{
  return static Placeholder.titleText.getter();
}

uint64_t sub_10076CB90()
{
  return type metadata accessor for Placeholder();
}

uint64_t sub_10076CBA0()
{
  return PrivacyType.categories.getter();
}

uint64_t sub_10076CBB0()
{
  return PrivacyType.wantsScrollFocus.getter();
}

uint64_t sub_10076CBC0()
{
  return PrivacyType.style.getter();
}

uint64_t sub_10076CBD0()
{
  return PrivacyType.title.getter();
}

uint64_t sub_10076CBE0()
{
  return PrivacyType.detail.getter();
}

uint64_t sub_10076CBF0()
{
  return PrivacyType.artwork.getter();
}

uint64_t sub_10076CC00()
{
  return type metadata accessor for PrivacyType();
}

uint64_t sub_10076CC10()
{
  return dispatch thunk of ProductPage.__allocating_init(adamId:bundleId:icon:heading:title:subtitle:ordinal:rating:buttonAction:offerDisplayProperties:titleOfferDisplayProperties:clickAction:shareAction:developerAction:uberArtwork:uberArtworkForCompactDisplay:uberVideo:uberStyle:logoArtwork:navigationBarIconArtwork:media:badges:isComplete:pageTopBackgroundColor:pageBottomBackgroundColor:hasDarkUserInterfaceStyle:purchasedOrdering:notPurchasedOrdering:shelfMapping:headerMessage:isAskToBuyApproval:mediaSectionTitle:pageMetrics:pageRenderEvent:expandedOfferDetails:regularPriceFormatted:theme:externalVersionIdentifier:updateBuyParams:banner:secondaryBanner:descriptionHeader:description:fullProductFetchedAction:appPromotionDetailPageAction:pageRefreshPolicy:alwaysAllowReviews:)();
}

uint64_t sub_10076CC20()
{
  return type metadata accessor for ProductPage();
}

uint64_t sub_10076CC30()
{
  return ReviewsPage.SortOption.selectedActionTitle.getter();
}

uint64_t sub_10076CC40()
{
  return type metadata accessor for ReviewsPage();
}

uint64_t sub_10076CC50()
{
  return Screenshots.mediaPlatform.getter();
}

uint64_t sub_10076CC60()
{
  return Screenshots.artwork.getter();
}

uint64_t sub_10076CC70()
{
  return type metadata accessor for Screenshots();
}

uint64_t sub_10076CC80()
{
  return SheetAction.destructiveActionIndex.getter();
}

uint64_t sub_10076CC90()
{
  return SheetAction.cancelTitle.getter();
}

uint64_t sub_10076CCA0()
{
  return SheetAction.checkedIndex.getter();
}

uint64_t sub_10076CCB0()
{
  return SheetAction.isCancelable.getter();
}

uint64_t sub_10076CCC0()
{
  return SheetAction.style.getter();
}

uint64_t sub_10076CCD0()
{
  return SheetAction.actions.getter();
}

uint64_t sub_10076CCE0()
{
  return SheetAction.message.getter();
}

uint64_t sub_10076CCF0()
{
  return SheetAction.isCustom.getter();
}

uint64_t sub_10076CD00()
{
  return ShelfHeader.shouldUseShelfHeader.getter();
}

uint64_t sub_10076CD10()
{
  return type metadata accessor for ShelfHeader.ArtworkType();
}

uint64_t sub_10076CD20()
{
  return ShelfHeader.titleAction.getter();
}

uint64_t sub_10076CD30()
{
  return ShelfHeader.titleArtwork.getter();
}

uint64_t sub_10076CD40()
{
  return ShelfHeader.Configuration.titleColor.getter();
}

uint64_t sub_10076CD50()
{
  return ShelfHeader.Configuration.init(eyebrowColor:eyebrowImageColor:titleColor:titleImageColor:subtitleColor:accessoryColor:includeSeparator:includeTrailingArtwork:prefersShelfHeader:)();
}

uint64_t sub_10076CD60()
{
  return ShelfHeader.Configuration.eyebrowColor.getter();
}

uint64_t sub_10076CD70()
{
  return ShelfHeader.Configuration.subtitleColor.getter();
}

uint64_t sub_10076CD80()
{
  return ShelfHeader.Configuration.accessoryColor.getter();
}

uint64_t sub_10076CD90()
{
  return ShelfHeader.Configuration.titleImageColor.getter();
}

uint64_t sub_10076CDA0()
{
  return ShelfHeader.Configuration.includeSeparator.getter();
}

uint64_t sub_10076CDB0()
{
  return ShelfHeader.Configuration.eyebrowImageColor.getter();
}

uint64_t sub_10076CDC0()
{
  return type metadata accessor for ShelfHeader.Configuration();
}

uint64_t sub_10076CDD0()
{
  return ShelfHeader.configuration.getter();
}

uint64_t sub_10076CDE0()
{
  return ShelfHeader.eyebrowAction.getter();
}

uint64_t sub_10076CDF0()
{
  return ShelfHeader.eyebrowArtwork.getter();
}

uint64_t sub_10076CE00()
{
  return ShelfHeader.accessoryAction.getter();
}

uint64_t sub_10076CE10()
{
  return ShelfHeader.titleArtworkType.getter();
}

uint64_t sub_10076CE20()
{
  return ShelfHeader.eyebrowArtworkType.getter();
}

uint64_t sub_10076CE30()
{
  return ShelfHeader.hasTrailingArtwork.getter();
}

uint64_t sub_10076CE40()
{
  return ShelfHeader.eyebrowTrailingArtwork.getter();
}

uint64_t sub_10076CE50()
{
  return ShelfHeader.title.getter();
}

uint64_t sub_10076CE60()
{
  return ShelfHeader.init(eyebrow:eyebrowArtwork:eyebrowArtworkType:eyebrowAction:eyebrowTrailingArtwork:title:titleArtwork:titleArtworkType:titleAction:subtitle:trailingArtwork:accessoryAction:configuration:)();
}

uint64_t sub_10076CE70()
{
  return ShelfHeader.eyebrow.getter();
}

uint64_t sub_10076CE80()
{
  return ShelfHeader.subtitle.getter();
}

uint64_t sub_10076CE90()
{
  return type metadata accessor for ShelfHeader();
}

uint64_t sub_10076CEA0()
{
  return type metadata accessor for ShelfMarker();
}

uint64_t sub_10076CEB0()
{
  return static SystemImage.load(artwork:with:includePrivateImages:)();
}

uint64_t sub_10076CEC0()
{
  return static SystemImage.load(_:with:includePrivateImages:)();
}

uint64_t sub_10076CED0()
{
  return static SystemImage.load(_:with:)();
}

uint64_t sub_10076CEE0()
{
  return type metadata accessor for SystemImage();
}

uint64_t sub_10076CEF0()
{
  return static TimingCurve.easingCurve1.getter();
}

uint64_t sub_10076CF00()
{
  return static TimingCurve.easingCurve2.getter();
}

uint64_t sub_10076CF10()
{
  return TimingCurve.controlPoint1.getter();
}

uint64_t sub_10076CF20()
{
  return TimingCurve.controlPoint2.getter();
}

uint64_t sub_10076CF30()
{
  return type metadata accessor for TimingCurve();
}

uint64_t sub_10076CF40()
{
  return type metadata accessor for TitleEffect();
}

uint64_t sub_10076CF50()
{
  return dispatch thunk of VideoPlayer.playerItem.getter();
}

uint64_t sub_10076CF60()
{
  return dispatch thunk of VideoPlayer.releaseAssets()();
}

uint64_t sub_10076CF70()
{
  return dispatch thunk of VideoPlayer.shouldBePlaying.getter();
}

uint64_t sub_10076CF80()
{
  return dispatch thunk of VideoPlayer.startPreloading()();
}

uint64_t sub_10076CF90()
{
  return dispatch thunk of VideoPlayer.shouldLoopPlayback.setter();
}

uint64_t sub_10076CFA0()
{
  return VideoPlayer.init(with:)();
}

uint64_t sub_10076CFB0()
{
  return dispatch thunk of VideoPlayer.state.getter();
}

uint64_t sub_10076CFC0()
{
  return dispatch thunk of VideoPlayer.restart()();
}

uint64_t sub_10076CFD0()
{
  return dispatch thunk of VideoPlayer.delegate.setter();
}

uint64_t sub_10076CFE0()
{
  return dispatch thunk of VideoPlayer.videoUrl.getter();
}

uint64_t sub_10076CFF0()
{
  return dispatch thunk of VideoPlayer.isLoading.getter();
}

uint64_t sub_10076D000()
{
  return dispatch thunk of VideoPlayer.isPlaying.getter();
}

uint64_t sub_10076D010()
{
  return type metadata accessor for VideoPlayer();
}

uint64_t sub_10076D020()
{
  return type metadata accessor for ASKBootstrap.TargetType();
}

uint64_t sub_10076D030()
{
  return static ASKBootstrap.tokenServiceClient.getter();
}

uint64_t sub_10076D040()
{
  return ActionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076D050()
{
  return static ActionLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_10076D060()
{
  return ActionLayout.Metrics.init(artworkSize:maxArtworkSize:artworkMargin:artworkLeadingMargin:labelWithArtworkLeadingMargin:accessoryMargin:labelFontSource:labelVerticalMargin:searchAdButtonTopMargin:searchAdButtonLeadingMargin:shouldLabelFitAvailableWidth:)();
}

uint64_t sub_10076D070()
{
  return ActionLayout.Metrics.artworkSize.getter();
}

uint64_t sub_10076D080()
{
  return ActionLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_10076D090()
{
  return ActionLayout.Metrics.maxArtworkSize.getter();
}

uint64_t sub_10076D0A0()
{
  return ActionLayout.Metrics.labelFontSource.getter();
}

uint64_t sub_10076D0B0()
{
  return type metadata accessor for ActionLayout.Metrics();
}

uint64_t sub_10076D0C0()
{
  return ActionLayout.init(metrics:artworkView:labelView:accessoryView:searchAdButton:artworkBaselineOffsetFromBottom:isDisplayingSearchTrendingItem:restrictArtworkSizeToMetrics:in:)();
}

uint64_t sub_10076D0D0()
{
  return type metadata accessor for ActionLayout();
}

uint64_t sub_10076D0E0()
{
  return ArcadeAction.postSubscribeAction.getter();
}

uint64_t sub_10076D0F0()
{
  return ArcadeAction.subscriptionToken.getter();
}

uint64_t sub_10076D100()
{
  return ArcadeAction.appAdamId.getter();
}

uint64_t sub_10076D110()
{
  return ArcadeAction.productId.getter();
}

uint64_t sub_10076D120()
{
  return ArcadeFooter.buttonAction.getter();
}

uint64_t sub_10076D130()
{
  return ArcadeFooter.backgroundColor.getter();
}

uint64_t sub_10076D140()
{
  return ArcadeFooter.icons.getter();
}

uint64_t sub_10076D150()
{
  return ArcadeFooter.footnote.getter();
}

uint64_t sub_10076D160()
{
  return ArcadeLockup.impressionMetrics.getter();
}

uint64_t sub_10076D170()
{
  return ArcadeLockup.subscribedSubtitle.getter();
}

uint64_t sub_10076D180()
{
  return ArcadeLockup.nonsubscribedSubtitle.getter();
}

uint64_t sub_10076D190()
{
  return ArcadeLockup.offerDisplayProperties.getter();
}

uint64_t sub_10076D1A0()
{
  return ArcadeLockup.subscribedButtonAction.getter();
}

uint64_t sub_10076D1B0()
{
  return ArcadeLockup.unsubscribedButtonAction.getter();
}

uint64_t sub_10076D1C0()
{
  return HeroCarousel.wantsTopGradient.getter();
}

uint64_t sub_10076D1D0()
{
  return HeroCarousel.wantsBottomGradient.getter();
}

uint64_t sub_10076D1E0()
{
  return HeroCarousel.autoScrollConfiguration.getter();
}

uint64_t sub_10076D1F0()
{
  return HeroCarousel.id.getter();
}

uint64_t sub_10076D200()
{
  return HeroCarousel.items.getter();
}

uint64_t sub_10076D210()
{
  return type metadata accessor for HeroCarousel();
}

uint64_t sub_10076D220()
{
  return HideCriteria.isHidden.getter();
}

uint64_t sub_10076D230()
{
  return type metadata accessor for HideCriteria();
}

uint64_t sub_10076D240()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_10076D250()
{
  return Interpolator.value(forInput:)();
}

uint64_t sub_10076D260()
{
  return Interpolator.init(fromValue:toValue:curve:)();
}

uint64_t sub_10076D270()
{
  return LinkableText.plainText.getter();
}

uint64_t sub_10076D280()
{
  return LinkableText.styledText.getter();
}

uint64_t sub_10076D290()
{
  return LinkableText.linkedSubstrings.getter();
}

uint64_t sub_10076D2A0()
{
  return LinkableText.__allocating_init(id:text:linkedSubstrings:)();
}

uint64_t sub_10076D2B0()
{
  return type metadata accessor for LinkableText();
}

uint64_t sub_10076D2C0()
{
  return dispatch thunk of MetricsEvent.metricsData.getter();
}

uint64_t sub_10076D2D0()
{
  return PosterLockup.footerText.getter();
}

uint64_t sub_10076D2E0()
{
  return PosterLockup.epicHeading.getter();
}

uint64_t sub_10076D2F0()
{
  return PosterLockup.posterVideo.getter();
}

uint64_t sub_10076D300()
{
  return PosterLockup.posterArtwork.getter();
}

uint64_t sub_10076D310()
{
  return PosterLockup.isDark.getter();
}

uint64_t sub_10076D320()
{
  return type metadata accessor for PosterLockup();
}

uint64_t sub_10076D330()
{
  return ProductMedia.hasPortraitPhoneMedia.getter();
}

uint64_t sub_10076D340()
{
  return ProductMedia.allPlatforms.getter();
}

uint64_t sub_10076D350()
{
  return ProductMedia.platformDescription.getter();
}

uint64_t sub_10076D360()
{
  return type metadata accessor for ProductMedia.DescriptionPlacement();
}

uint64_t sub_10076D370()
{
  return ProductMedia.descriptionPlacement(when:)();
}

uint64_t sub_10076D380()
{
  return ProductMedia.allPlatformsDescription.getter();
}

uint64_t sub_10076D390()
{
  return ProductMedia.items.getter();
}

uint64_t sub_10076D3A0()
{
  return ProductMedia.platform.getter();
}

uint64_t sub_10076D3B0()
{
  return type metadata accessor for ProductMedia();
}

uint64_t sub_10076D3C0()
{
  return type metadata accessor for PurchaseType();
}

uint64_t sub_10076D3D0()
{
  return ReferrerData.init(app:externalUrl:kind:)();
}

uint64_t sub_10076D3E0()
{
  return type metadata accessor for ReferrerData.Kind();
}

uint64_t sub_10076D3F0()
{
  return type metadata accessor for ReferrerData();
}

uint64_t sub_10076D400()
{
  return SearchAction.guidedSearchOptimizationTerm.getter();
}

uint64_t sub_10076D410()
{
  return SearchAction.guidedSearchTokens.getter();
}

uint64_t sub_10076D420()
{
  return SearchAction.prefixTerm.getter();
}

uint64_t sub_10076D430()
{
  return SearchAction.excludedTerms.getter();
}

uint64_t sub_10076D440()
{
  return SearchAction.originatingTerm.getter();
}

uint64_t sub_10076D450()
{
  return SearchAction.spellCheckEnabled.getter();
}

uint64_t sub_10076D460()
{
  return SearchAction.term.getter();
}

uint64_t sub_10076D470()
{
  return SearchAction.init(title:term:url:origin:source:entity:spellCheckEnabled:excludedTerms:originatingTerm:prefixTerm:guidedSearchTokens:guidedSearchOptimizationTerm:actionMetrics:)();
}

uint64_t sub_10076D480()
{
  return SearchAction.entity.getter();
}

uint64_t sub_10076D490()
{
  return SearchAction.origin.getter();
}

uint64_t sub_10076D4A0()
{
  return SearchAction.source.getter();
}

uint64_t sub_10076D4B0()
{
  return type metadata accessor for SearchAction();
}

uint64_t sub_10076D4C0()
{
  return type metadata accessor for SearchEntity();
}

uint64_t sub_10076D4D0()
{
  return type metadata accessor for SearchOrigin();
}

uint64_t sub_10076D4E0()
{
  return SearchResult.condensedBehavior.getter();
}

uint64_t sub_10076D4F0()
{
  return type metadata accessor for SearchResult();
}

uint64_t sub_10076D500()
{
  return TitledButton.id.getter();
}

uint64_t sub_10076D510()
{
  return TitledButton.title.getter();
}

uint64_t sub_10076D520()
{
  return TitledButton.action.getter();
}

uint64_t sub_10076D530()
{
  return WordmarkView.show(wordmark:with:)();
}

uint64_t sub_10076D540()
{
  return WordmarkView.init(frame:wordmark:referenceLineHeight:alignment:)();
}

uint64_t sub_10076D550()
{
  return type metadata accessor for WordmarkView.Alignment();
}

uint64_t sub_10076D560()
{
  return WordmarkView.alignment.setter();
}

uint64_t sub_10076D570()
{
  return type metadata accessor for WordmarkView();
}

uint64_t sub_10076D580()
{
  return ArtworkLoader.fetchArtwork(using:forReason:closestMatch:handlerKey:completionHandler:)();
}

uint64_t sub_10076D590()
{
  return ArtworkLoader.fetchArtwork<A>(using:forReason:closestMatch:into:)();
}

void sub_10076D5A0(Swift::OpaquePointer using)
{
}

uint64_t sub_10076D5B0()
{
  return ArtworkLoader.__allocating_init(cacheLimit:renderIntent:)();
}

uint64_t sub_10076D5C0()
{
  return static ArtworkLoader.handlerKey<A>(for:)();
}

uint64_t sub_10076D5D0()
{
  return ArtworkLoader.isOccluded.setter();
}

uint64_t sub_10076D5E0()
{
  return ArtworkLoader.forgetFetch(forHandlerKey:deprioritizingFetch:)();
}

uint64_t sub_10076D5F0()
{
  return ArtworkLoader.forgetFetch<A>(forView:deprioritizingFetch:)();
}

uint64_t sub_10076D600()
{
  return ArtworkLoader.pageRenderMetrics.setter();
}

uint64_t sub_10076D610()
{
  return ArtworkLoader.init(parent:)();
}

uint64_t sub_10076D620()
{
  return ArtworkLoader.register(resourceLoader:)();
}

uint64_t sub_10076D630()
{
  return type metadata accessor for ArtworkLoader();
}

uint64_t sub_10076D640()
{
  return dispatch thunk of BasePresenter.pageRenderMetrics.getter();
}

uint64_t sub_10076D650()
{
  return dispatch thunk of BasePresenter.pendingPageRender.getter();
}

uint64_t sub_10076D660()
{
  return BasePresenter.impressionsTracker.getter();
}

uint64_t sub_10076D670()
{
  return BasePresenter.impressionsCalculator.getter();
}

uint64_t sub_10076D680()
{
  return dispatch thunk of BasePresenter.didLoad()();
}

uint64_t sub_10076D690()
{
  return dispatch thunk of BasePresenter.referrer.getter();
}

uint64_t sub_10076D6A0()
{
  return dispatch thunk of BasePresenter.referrer.setter();
}

uint64_t sub_10076D6B0()
{
  return type metadata accessor for BasePresenter();
}

uint64_t sub_10076D6C0()
{
  return EditorialCard.clickAction.getter();
}

uint64_t sub_10076D6D0()
{
  return EditorialCard.mediaOverlayStyle.getter();
}

uint64_t sub_10076D6E0()
{
  return EditorialCard.appEventFormattedDates.getter();
}

uint64_t sub_10076D6F0()
{
  return EditorialCard.title.getter();
}

uint64_t sub_10076D700()
{
  return EditorialCard.lockup.getter();
}

uint64_t sub_10076D710()
{
  return EditorialCard.artwork.getter();
}

uint64_t sub_10076D720()
{
  return EditorialCard.caption.getter();
}

uint64_t sub_10076D730()
{
  return EditorialCard.subtitle.getter();
}

uint64_t sub_10076D740()
{
  return type metadata accessor for EditorialCard();
}

uint64_t sub_10076D750()
{
  return EditorialLink.summaryText.getter();
}

uint64_t sub_10076D760()
{
  return EditorialLink.descriptionText.getter();
}

uint64_t sub_10076D770()
{
  return EditorialLink.linkPresentationEnabled.getter();
}

uint64_t sub_10076D780()
{
  return dispatch thunk of EditorialLink.url.getter();
}

uint64_t sub_10076D790()
{
  return type metadata accessor for EditorialLink();
}

uint64_t sub_10076D7A0()
{
  return EditorsChoice.showsBadge.getter();
}

uint64_t sub_10076D7B0()
{
  return EditorsChoice.isCollapsed.getter();
}

uint64_t sub_10076D7C0()
{
  return EditorsChoice.notes.getter();
}

uint64_t sub_10076D7D0()
{
  return EditorsChoice.title.getter();
}

uint64_t sub_10076D7E0()
{
  return type metadata accessor for EditorsChoice();
}

uint64_t sub_10076D7F0()
{
  return FramedArtwork.artwork.getter();
}

uint64_t sub_10076D800()
{
  return type metadata accessor for FramedArtwork();
}

uint64_t sub_10076D810()
{
  return dispatch thunk of GladiatorRule.validate(events:)();
}

uint64_t sub_10076D820()
{
  return dispatch thunk of MediaPlatform.supplementaryAppPlatforms.getter();
}

uint64_t sub_10076D830()
{
  return MediaPlatform.appPlatform.getter();
}

uint64_t sub_10076D840()
{
  return dispatch thunk of MediaPlatform.isPhonePlatform.getter();
}

uint64_t sub_10076D850()
{
  return static MediaPlatform.systemImages(platforms:)();
}

uint64_t sub_10076D860()
{
  return MediaPlatform.systemImageName.getter();
}

uint64_t sub_10076D870()
{
  return MediaPlatform.deviceBorderThickness.getter();
}

uint64_t sub_10076D880()
{
  return MediaPlatform.deviceCornerRadiusFactor.getter();
}

uint64_t sub_10076D890()
{
  return type metadata accessor for MediaPlatform();
}

uint64_t sub_10076D8A0()
{
  return NavigationTab.pageContext.getter();
}

uint64_t sub_10076D8B0()
{
  return static NavigationTab.== infix(_:_:)();
}

uint64_t sub_10076D8C0()
{
  return NavigationTab.init(intValue:)();
}

uint64_t sub_10076D8D0()
{
  return NavigationTab.rawValue.getter();
}

uint64_t sub_10076D8E0()
{
  return type metadata accessor for NavigationTab();
}

uint64_t sub_10076D8F0()
{
  return PageGridCache.init()();
}

uint64_t sub_10076D900()
{
  return type metadata accessor for PageGridCache();
}

uint64_t sub_10076D910()
{
  return PrivacyFooter.bodyText.getter();
}

uint64_t sub_10076D920()
{
  return type metadata accessor for PrivacyFooter();
}

uint64_t sub_10076D930()
{
  return PrivacyHeader.isDetailHeader.getter();
}

uint64_t sub_10076D940()
{
  return PrivacyHeader.supplementaryItems.getter();
}

uint64_t sub_10076D950()
{
  return PrivacyHeader.bodyText.getter();
}

uint64_t sub_10076D960()
{
  return type metadata accessor for PrivacyHeader();
}

uint64_t sub_10076D970()
{
  return type metadata accessor for ProductReview.ReviewSource();
}

uint64_t sub_10076D980()
{
  return ProductReview.source.getter();
}

uint64_t sub_10076D990()
{
  return type metadata accessor for ProductReview();
}

uint64_t sub_10076D9A0()
{
  return ReviewSummary.bodySeeAll.getter();
}

uint64_t sub_10076D9B0()
{
  return ReviewSummary.bodyWithTitle.getter();
}

uint64_t sub_10076D9C0()
{
  return ReviewSummary.subtitleArtwork.getter();
}

uint64_t sub_10076D9D0()
{
  return type metadata accessor for ReviewSummary.SubtitleArtworkAlignment();
}

uint64_t sub_10076D9E0()
{
  return ReviewSummary.subtitleArtworkAlignment.getter();
}

uint64_t sub_10076D9F0()
{
  return ReviewSummary.body.getter();
}

uint64_t sub_10076DA00()
{
  return ReviewSummary.subtitle.getter();
}

uint64_t sub_10076DA10()
{
  return type metadata accessor for ReviewSummary();
}

uint64_t sub_10076DA20()
{
  return RibbonBarItem.artworkTintColor.getter();
}

uint64_t sub_10076DA30()
{
  return RibbonBarItem.accessibilityLabel.getter();
}

uint64_t sub_10076DA40()
{
  return RibbonBarItem.title.getter();
}

uint64_t sub_10076DA50()
{
  return RibbonBarItem.artwork.getter();
}

uint64_t sub_10076DA60()
{
  return type metadata accessor for RibbonBarItem();
}

uint64_t sub_10076DA70()
{
  return RoundedButton.hasDivider.getter();
}

uint64_t sub_10076DA80()
{
  return RoundedButton.buttonColor.getter();
}

uint64_t sub_10076DA90()
{
  return RoundedButton.type.getter();
}

uint64_t sub_10076DAA0()
{
  return RoundedButton.title.getter();
}

uint64_t sub_10076DAB0()
{
  return RoundedButton.action.getter();
}

uint64_t sub_10076DAC0()
{
  return RoundedButton.textColor.getter();
}

uint64_t sub_10076DAD0()
{
  return type metadata accessor for RoundedButton();
}

uint64_t sub_10076DAE0()
{
  return ShelvesIntent.init(requests:)();
}

uint64_t sub_10076DAF0()
{
  return type metadata accessor for ShelvesIntent();
}

uint64_t sub_10076DB00()
{
  return SmallBreakout.backgroundColor.getter();
}

uint64_t sub_10076DB10()
{
  return SmallBreakout.details.getter();
}

uint64_t sub_10076DB20()
{
  return type metadata accessor for TopChartsPage();
}

uint64_t sub_10076DB30()
{
  return UpdatesLockup.size.getter();
}

uint64_t sub_10076DB40()
{
  return UpdatesLockup.version.getter();
}

uint64_t sub_10076DB50()
{
  return UpdatesLockup.whatsNew.getter();
}

uint64_t sub_10076DB60()
{
  return VideoControls.containsInlineControls.getter();
}

uint64_t sub_10076DB70()
{
  return static VideoControls.muteUnmute.getter();
}

uint64_t sub_10076DB80()
{
  return static VideoControls.prominentPlay.getter();
}

uint64_t sub_10076DB90()
{
  return type metadata accessor for VideoControls();
}

uint64_t sub_10076DBA0()
{
  return VideoFillMode.contentMode.getter();
}

uint64_t sub_10076DBB0()
{
  return VideoFillMode.videoGravity.getter();
}

uint64_t sub_10076DBC0()
{
  return type metadata accessor for VideoFillMode();
}

uint64_t sub_10076DBD0()
{
  return ASKBagContract.isStorePersonalizationOnboardingEnabled.getter();
}

uint64_t sub_10076DBE0()
{
  return ASKBagContract.refreshArcadeEntitlementsOnLoadingArcadeView.getter();
}

uint64_t sub_10076DBF0()
{
  return ASKBagContract.enableAppEventsServerNotifications.getter();
}

uint64_t sub_10076DC00()
{
  return ASKBagContract.arcadeSAGURL.getter();
}

uint64_t sub_10076DC10()
{
  return ASKBagContract.fetchTimeout.getter();
}

uint64_t sub_10076DC20()
{
  return ASKBagContract.enableSearchTags.getter();
}

uint64_t sub_10076DC30()
{
  return ASKBagContract.isArcadeSupported.getter();
}

uint64_t sub_10076DC40()
{
  return type metadata accessor for ASKBagContract.AdPlacementBagValue();
}

uint64_t sub_10076DC50()
{
  return ASKBagContract.adsOverrideLanguage.getter();
}

uint64_t sub_10076DC60()
{
  return ASKBagContract.enabledAdPlacements.getter();
}

uint64_t sub_10076DC70()
{
  return ASKBagContract.arcadeProductFamilyId.getter();
}

uint64_t sub_10076DC80()
{
  return ASKBagContract.isSponsoredAdsEnabled.getter();
}

uint64_t sub_10076DC90()
{
  return ASKBagContract.familyPurchasesEnabled.getter();
}

uint64_t sub_10076DCA0()
{
  return ASKBagContract.isQRCodeBadgingEnabled.getter();
}

uint64_t sub_10076DCB0()
{
  return ASKBagContract.arePreordersCancellable.getter();
}

uint64_t sub_10076DCC0()
{
  return ASKBagContract.impressionableThreshold.getter();
}

uint64_t sub_10076DCD0()
{
  return ASKBagContract.enableReviewSummarization.getter();
}

uint64_t sub_10076DCE0()
{
  return ASKBagContract.isSearchLandingAdsEnabled.getter();
}

uint64_t sub_10076DCF0()
{
  return ASKBagContract.defaultAutoPlayVideoSetting.getter();
}

uint64_t sub_10076DD00()
{
  return ASKBagContract.enableLocationPrivacyNotice.getter();
}

uint64_t sub_10076DD10()
{
  return ASKBagContract.productPageParameterAllowList.getter();
}

uint64_t sub_10076DD20()
{
  return ASKBagContract.isNaturalLanguageSearchEnabled.getter();
}

uint64_t sub_10076DD30()
{
  return ASKBagContract.arcadeSubscribePageDismissDelay.getter();
}

uint64_t sub_10076DD40()
{
  return ASKBagContract.downloadProgressDisplayWaitTime.getter();
}

uint64_t sub_10076DD50()
{
  return ASKBagContract.impressionableViewablePercentage.getter();
}

uint64_t sub_10076DD60()
{
  return ASKBagContract.gameCenterActivitySharingReprompt.getter();
}

uint64_t sub_10076DD70()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNotice.getter();
}

uint64_t sub_10076DD80()
{
  return ASKBagContract.installAttributionTimerDelaySeconds.getter();
}

uint64_t sub_10076DD90()
{
  return ASKBagContract.promotedContentContextPrefetchLimit.getter();
}

uint64_t sub_10076DDA0()
{
  return ASKBagContract.downloadProgressDisplayRemainingTime.getter();
}

uint64_t sub_10076DDB0()
{
  return ASKBagContract.productPageDownloadingOrderingTimeout.getter();
}

uint64_t sub_10076DDC0()
{
  return ASKBagContract.todayAdMediumLockupScreenshotsEnabled.getter();
}

uint64_t sub_10076DDD0()
{
  return ASKBagContract.isProductPageDownloadingOrderingEnabled.getter();
}

uint64_t sub_10076DDE0()
{
  return ASKBagContract.arcadeDownloadPacksGetAllCTADismissDelay.getter();
}

uint64_t sub_10076DDF0()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeEnabledRegions.getter();
}

uint64_t sub_10076DE00()
{
  return ASKBagContract.personalizedAdsScrollRequiredDisabledRegionCodes.getter();
}

uint64_t sub_10076DE10()
{
  return ASKBagContract.enablePersonalizedAdsPrivacyNoticeHighlightedOption.getter();
}

uint64_t sub_10076DE20()
{
  return ASKBagContract.personalizedAdsPrivacyNoticeHighlightedOptionEnabledRegions.getter();
}

uint64_t sub_10076DE30()
{
  return ASKBagContract.amsBag.getter();
}

uint64_t sub_10076DE40()
{
  return type metadata accessor for ASKBagContract();
}

uint64_t sub_10076DE50()
{
  return type metadata accessor for AccountSection.ContentItem();
}

uint64_t sub_10076DE60()
{
  return ArcadePageUrls.init(subscriberUrl:nonSubscriberUrl:)();
}

uint64_t sub_10076DE70()
{
  return type metadata accessor for ArcadePageUrls();
}

uint64_t sub_10076DE80()
{
  return ArcadeShowcase.iconArtworks.getter();
}

uint64_t sub_10076DE90()
{
  return ArcadeShowcase.subscribedAction.getter();
}

uint64_t sub_10076DEA0()
{
  return ArcadeShowcase.unsubscribedAction.getter();
}

uint64_t sub_10076DEB0()
{
  return ArcadeShowcase.subscribedDescription.getter();
}

uint64_t sub_10076DEC0()
{
  return ArcadeShowcase.offerDisplayProperties.getter();
}

uint64_t sub_10076DED0()
{
  return ArcadeShowcase.unsubscribedDescription.getter();
}

uint64_t sub_10076DEE0()
{
  return type metadata accessor for ArcadeShowcase();
}

uint64_t sub_10076DEF0()
{
  return type metadata accessor for BootstrapPhase();
}

uint64_t sub_10076DF00()
{
  return dispatch thunk of ClickableModel.clickAction.getter();
}

uint64_t sub_10076DF10()
{
  return dispatch thunk of ClickableModel.clickSender.getter();
}

uint64_t sub_10076DF20()
{
  return CompoundAction.init(title:actions:presentationStyle:actionMetrics:)();
}

uint64_t sub_10076DF30()
{
  return CompoundAction.actions.getter();
}

uint64_t sub_10076DF40()
{
  return type metadata accessor for CompoundAction();
}

uint64_t sub_10076DF50()
{
  return CopyTextAction.text.getter();
}

uint64_t sub_10076DF60()
{
  return type metadata accessor for CopyTextAction();
}

uint64_t sub_10076DF70()
{
  return CornerStylable<>.applyCorner(radius:style:)();
}

uint64_t sub_10076DF80()
{
  return EditorialQuote.attribution.getter();
}

uint64_t sub_10076DF90()
{
  return EditorialQuote.text.getter();
}

uint64_t sub_10076DFA0()
{
  return type metadata accessor for EditorialQuote();
}

uint64_t sub_10076DFB0()
{
  return EmptyPlaceable.init()();
}

uint64_t sub_10076DFC0()
{
  return type metadata accessor for EmptyPlaceable();
}

uint64_t sub_10076DFD0()
{
  return FootnoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076DFE0()
{
  return FootnoteLayout.Metrics.init(textSpace:bottomSpace:chevronMargin:)();
}

uint64_t sub_10076DFF0()
{
  return type metadata accessor for FootnoteLayout.Metrics();
}

uint64_t sub_10076E000()
{
  return FootnoteLayout.init(metrics:labelView:chevronView:)();
}

uint64_t sub_10076E010()
{
  return type metadata accessor for FootnoteLayout();
}

uint64_t sub_10076E020()
{
  return GladiatorRules.rules.getter();
}

uint64_t sub_10076E030()
{
  return GladiatorRules.init()();
}

uint64_t sub_10076E040()
{
  return type metadata accessor for GladiatorRules();
}

uint64_t sub_10076E050()
{
  return HorizontalRule.isFullWidth.getter();
}

void sub_10076E060(CAShapeLayer to, CGColorRef lineColor, UITraitCollection traitCollection)
{
}

uint64_t sub_10076E070()
{
  return HorizontalRule.Style.lineThickness(traitCollection:)();
}

uint64_t sub_10076E080()
{
  return HorizontalRule.Style.path(in:traitCollection:)();
}

uint64_t sub_10076E090()
{
  return type metadata accessor for HorizontalRule.Style();
}

uint64_t sub_10076E0A0()
{
  return HorizontalRule.color.getter();
}

uint64_t sub_10076E0B0()
{
  return HorizontalRule.style.getter();
}

uint64_t sub_10076E0C0()
{
  return type metadata accessor for HorizontalRule();
}

uint64_t sub_10076E0D0()
{
  return type metadata accessor for ItemBackground();
}

uint64_t sub_10076E0E0()
{
  return dispatch thunk of NetworkInquiry.isConstrained.getter();
}

uint64_t sub_10076E0F0()
{
  return dispatch thunk of NetworkInquiry.isLikelyReachable.getter();
}

uint64_t sub_10076E100()
{
  return dispatch thunk of NetworkInquiry.observe(on:_:)();
}

uint64_t sub_10076E110()
{
  return type metadata accessor for OfferTitleType();
}

uint64_t sub_10076E120()
{
  return OnDeviceAdvert.init(instanceId:impressionId:adamId:placementType:metadata:privacy:positionInfo:appMetadata:cppIds:)();
}

uint64_t sub_10076E130()
{
  return OnDeviceAdvert.instanceId.getter();
}

uint64_t sub_10076E140()
{
  return type metadata accessor for OnDeviceAdvert();
}

uint64_t sub_10076E150()
{
  return type metadata accessor for PreorderStatus();
}

uint64_t sub_10076E160()
{
  return PurchaseIntent.init(from:stateMachine:additionalHeaders:presentingSceneIdentifier:)();
}

uint64_t sub_10076E170()
{
  return type metadata accessor for PurchaseIntent();
}

uint64_t sub_10076E180()
{
  return type metadata accessor for PurchaseResult();
}

uint64_t sub_10076E190()
{
  return type metadata accessor for RuleIdentifier();
}

uint64_t sub_10076E1A0()
{
  return dispatch thunk of ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

uint64_t sub_10076E1B0()
{
  return dispatch thunk of ScrollObserver.didScroll(in:)();
}

uint64_t sub_10076E1C0()
{
  return ScrollObserver.didScroll(visibleItems:layoutEnvironment:contentOffset:)();
}

void sub_10076E1D0(UIScrollView in)
{
}

void sub_10076E1E0(UIScrollView in)
{
}

void sub_10076E1F0(UIScrollView in, Swift::Bool willDecelerate)
{
}

void sub_10076E200(UIScrollView in)
{
}

uint64_t sub_10076E210()
{
  return ScrollObserver.willEndDragging(in:with:targetContentOffset:)();
}

void sub_10076E220(UIScrollView in)
{
}

uint64_t sub_10076E230()
{
  return SearchAdAction.action.getter();
}

uint64_t sub_10076E240()
{
  return type metadata accessor for SearchAdAction();
}

uint64_t sub_10076E250()
{
  return ShareSheetData.url.getter();
}

uint64_t sub_10076E260()
{
  return type metadata accessor for ShareSheetData.Metadata();
}

uint64_t sub_10076E270()
{
  return ShareSheetData.metadata.getter();
}

uint64_t sub_10076E280()
{
  return ShareSheetData.shortUrl.getter();
}

uint64_t sub_10076E290()
{
  return dispatch thunk of ShelfPresenter.interactiveShelfBackground(at:)();
}

uint64_t sub_10076E2A0()
{
  return dispatch thunk of ShelfPresenter.prefersHorizontalShelf(for:)();
}

uint64_t sub_10076E2B0()
{
  return dispatch thunk of ShelfPresenter.isShelfHidden(for:)();
}

uint64_t sub_10076E2C0()
{
  return dispatch thunk of ShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_10076E2D0()
{
  return dispatch thunk of ShelfPresenter.background(for:)();
}

uint64_t sub_10076E2E0()
{
  return dispatch thunk of ShelfPresenter.contentType(for:)();
}

uint64_t sub_10076E2F0()
{
  return dispatch thunk of ShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_10076E300()
{
  return dispatch thunk of ShelfPresenter.sectionCount.getter();
}

uint64_t sub_10076E310()
{
  return dispatch thunk of ShelfPresenter.seeAllAction(for:)();
}

uint64_t sub_10076E320()
{
  return dispatch thunk of ShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_10076E330()
{
  return dispatch thunk of ShelfPresenter.didSelectItem(at:)();
}

uint64_t sub_10076E340()
{
  return dispatch thunk of ShelfPresenter.rowsPerColumn(for:)();
}

uint64_t sub_10076E350()
{
  return dispatch thunk of ShelfPresenter.doesModelExist(for:)();
}

uint64_t sub_10076E360()
{
  return dispatch thunk of ShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_10076E370()
{
  return dispatch thunk of ShelfPresenter.itemBackground(forItemAt:)();
}

uint64_t sub_10076E380()
{
  return dispatch thunk of ShelfPresenter.didSelectSeeAll(for:)();
}

uint64_t sub_10076E390()
{
  return dispatch thunk of ShelfPresenter.didSelectNestedItem(at:)();
}

uint64_t sub_10076E3A0()
{
  return dispatch thunk of ShelfPresenter.model(at:)();
}

uint64_t sub_10076E3B0()
{
  return dispatch thunk of ShelfPresenter.shelf(for:)();
}

uint64_t sub_10076E3C0()
{
  return dispatch thunk of ShelfPresenter.title(for:)();
}

uint64_t sub_10076E3D0()
{
  return dispatch thunk of ShelfPresenter.eyebrow(for:)();
}

uint64_t sub_10076E3E0()
{
  return dispatch thunk of ShelfPresenter.subtitle(for:)();
}

uint64_t sub_10076E3F0()
{
  return SnapshotUpdate.contentSnapshot.getter();
}

uint64_t sub_10076E400()
{
  return SnapshotUpdate.useReloadData.getter();
}

uint64_t sub_10076E410()
{
  return SnapshotUpdate.animated.getter();
}

uint64_t sub_10076E420()
{
  return TodayCardMedia.otdTextStyle.getter();
}

uint64_t sub_10076E430()
{
  return TodayCardMedia.impressionMetrics.getter();
}

uint64_t sub_10076E440()
{
  return type metadata accessor for TodayCardMedia.TitleBackingGradient();
}

uint64_t sub_10076E450()
{
  return TodayCardMedia.titleBackingGradient.getter();
}

uint64_t sub_10076E460()
{
  return TodayCardMedia.Kind.rawValue.getter();
}

uint64_t sub_10076E470()
{
  return TodayCardMedia.kind.getter();
}

uint64_t sub_10076E480()
{
  return type metadata accessor for TodayCardMedia();
}

uint64_t sub_10076E490()
{
  return UnifiedMessage.placement.getter();
}

uint64_t sub_10076E4A0()
{
  return type metadata accessor for UnifiedMessage();
}

uint64_t sub_10076E4B0()
{
  return dispatch thunk of UpsellBreakout.clickAction.getter();
}

uint64_t sub_10076E4C0()
{
  return UpsellBreakout.DisplayProperties.badgeColor.getter();
}

uint64_t sub_10076E4D0()
{
  return UpsellBreakout.DisplayProperties.titleColor.getter();
}

uint64_t sub_10076E4E0()
{
  return UpsellBreakout.DisplayProperties.backgroundColor.getter();
}

uint64_t sub_10076E4F0()
{
  return UpsellBreakout.DisplayProperties.descriptionColor.getter();
}

uint64_t sub_10076E500()
{
  return UpsellBreakout.DisplayProperties.callToActionColor.getter();
}

uint64_t sub_10076E510()
{
  return UpsellBreakout.DisplayProperties.wantsBlur.getter();
}

uint64_t sub_10076E520()
{
  return type metadata accessor for UpsellBreakout.DisplayProperties();
}

uint64_t sub_10076E530()
{
  return UpsellBreakout.displayProperties.getter();
}

uint64_t sub_10076E540()
{
  return UpsellBreakout.offerButtonAction.getter();
}

uint64_t sub_10076E550()
{
  return UpsellBreakout.buttonCallToAction.getter();
}

uint64_t sub_10076E560()
{
  return UpsellBreakout.offerDisplayProperties.getter();
}

uint64_t sub_10076E570()
{
  return UpsellBreakout.video.getter();
}

uint64_t sub_10076E580()
{
  return UpsellBreakout.artwork.getter();
}

uint64_t sub_10076E590()
{
  return UpsellBreakout.details.getter();
}

uint64_t sub_10076E5A0()
{
  return type metadata accessor for UpsellBreakout();
}

uint64_t sub_10076E5B0()
{
  return AdPlacementType.rawValue.getter();
}

uint64_t sub_10076E5C0()
{
  return type metadata accessor for AdPlacementType();
}

uint64_t sub_10076E5D0()
{
  return type metadata accessor for ArtworkGridType();
}

uint64_t sub_10076E5E0()
{
  return BreakoutDetails.callToActionButtonAction.getter();
}

uint64_t sub_10076E5F0()
{
  return BreakoutDetails.description.getter();
}

uint64_t sub_10076E600()
{
  return BreakoutDetails.TextAlignment.textAlignment(in:)();
}

uint64_t sub_10076E610()
{
  return type metadata accessor for BreakoutDetails.TextAlignment();
}

uint64_t sub_10076E620()
{
  return BreakoutDetails.textAlignment.getter();
}

uint64_t sub_10076E630()
{
  return type metadata accessor for BreakoutDetails.BackgroundStyle();
}

uint64_t sub_10076E640()
{
  return BreakoutDetails.backgroundStyle.getter();
}

uint64_t sub_10076E650()
{
  return BreakoutDetails.badgeColorOverride.getter();
}

uint64_t sub_10076E660()
{
  return type metadata accessor for BreakoutDetails.Badge();
}

uint64_t sub_10076E670()
{
  return BreakoutDetails.badge.getter();
}

uint64_t sub_10076E680()
{
  return BreakoutDetails.title.getter();
}

uint64_t sub_10076E690()
{
  return dispatch thunk of CellWithArtwork.cancelArtworkFetch(on:deprioritizingFetch:)();
}

uint64_t sub_10076E6A0()
{
  return dispatch thunk of CellWithArtwork.fetch(artwork:on:)();
}

uint64_t sub_10076E6B0()
{
  return ContingentOffer.trunkAppIcon.getter();
}

uint64_t sub_10076E6C0()
{
  return ContingentOffer.description.getter();
}

uint64_t sub_10076E6D0()
{
  return ContingentOffer.offerLockup.getter();
}

uint64_t sub_10076E6E0()
{
  return ContingentOffer.additionalInfo.getter();
}

uint64_t sub_10076E6F0()
{
  return ContingentOffer.learnMoreTitle.getter();
}

uint64_t sub_10076E700()
{
  return ContingentOffer.backgroundArtwork.getter();
}

uint64_t sub_10076E710()
{
  return ContingentOffer.mediaOverlayStyle.getter();
}

uint64_t sub_10076E720()
{
  return ContingentOffer.badge.getter();
}

uint64_t sub_10076E730()
{
  return ContingentOffer.label.getter();
}

uint64_t sub_10076E740()
{
  return ContingentOffer.title.getter();
}

uint64_t sub_10076E750()
{
  return ContingentOffer.subtitle.getter();
}

uint64_t sub_10076E760()
{
  return type metadata accessor for ContingentOffer();
}

uint64_t sub_10076E770()
{
  return dispatch thunk of MetricsActivity.changeHostApp(_:)();
}

uint64_t sub_10076E780()
{
  return dispatch thunk of MetricsActivity.changeContext(_:)();
}

uint64_t sub_10076E790()
{
  return dispatch thunk of MetricsActivity.changePreloaded(_:)();
}

uint64_t sub_10076E7A0()
{
  return dispatch thunk of MetricsActivity.setReferrerData(_:)();
}

uint64_t sub_10076E7B0()
{
  return dispatch thunk of MetricsActivity.contextualAction.getter();
}

uint64_t sub_10076E7C0()
{
  return dispatch thunk of MetricsActivity.currentPageFields.getter();
}

uint64_t sub_10076E7D0()
{
  return dispatch thunk of MetricsActivity.currentPageFields.setter();
}

uint64_t sub_10076E7E0()
{
  return dispatch thunk of MetricsActivity.performingContext(for:body:)();
}

uint64_t sub_10076E7F0()
{
  return dispatch thunk of MetricsActivity.changePageReferrerUrl(_:)();
}

uint64_t sub_10076E800()
{
  return dispatch thunk of MetricsActivity.currentSearchAdRotationDataProvider.getter();
}

uint64_t sub_10076E810()
{
  return static MetricsActivity.current.getter();
}

uint64_t sub_10076E820()
{
  return dispatch thunk of MetricsActivity.preloaded.getter();
}

uint64_t sub_10076E830()
{
  return type metadata accessor for MetricsActivity();
}

uint64_t sub_10076E840()
{
  return NetworkActivity.delegate.setter();
}

uint64_t sub_10076E850()
{
  return type metadata accessor for NetworkActivity();
}

uint64_t sub_10076E860()
{
  return ObjectGraphPair.objectGraph.getter();
}

uint64_t sub_10076E870()
{
  return ObjectGraphPair.value.getter();
}

uint64_t sub_10076E880()
{
  return static OfferLabelStyle.== infix(_:_:)();
}

uint64_t sub_10076E890()
{
  return static OfferLabelStyle.infer.getter();
}

uint64_t sub_10076E8A0()
{
  return type metadata accessor for OfferLabelStyle();
}

uint64_t sub_10076E8B0()
{
  return PageEnvironment.dynamicTypeSize.getter();
}

uint64_t sub_10076E8C0()
{
  return PageEnvironment.init(traitCollection:)();
}

uint64_t sub_10076E8D0()
{
  return PageEnvironment.isHorizontalSizeClassCompact.getter();
}

uint64_t sub_10076E8E0()
{
  return PageEnvironment.isHorizontalSizeClassRegular.getter();
}

uint64_t sub_10076E8F0()
{
  return type metadata accessor for PageEnvironment();
}

uint64_t sub_10076E900()
{
  return dispatch thunk of PageGridCaching.invalidateCache()();
}

uint64_t sub_10076E920()
{
  return PageGridCaching.supplementaryPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

uint64_t sub_10076E930()
{
  return PageGridCaching.contentPageGrid(for:surroundedBy:containerSize:safeAreaInsets:environment:)();
}

void sub_10076E940()
{
}

uint64_t sub_10076E950()
{
  return PageRefreshGate.performRefresh.setter();
}

uint64_t sub_10076E960()
{
  return PageRefreshGate.viewWillAppear(on:)();
}

uint64_t sub_10076E970()
{
  return PageRefreshGate.appWillBackground(on:)();
}

uint64_t sub_10076E980()
{
  return PageRefreshGate.appWillForeground(on:)();
}

uint64_t sub_10076E990()
{
  return PageRefreshGate.viewWillDisappear(on:)();
}

uint64_t sub_10076E9A0()
{
  return PageRefreshGate.init(policy:)();
}

uint64_t sub_10076E9B0()
{
  return type metadata accessor for PageRefreshGate();
}

uint64_t sub_10076E9C0()
{
  return PrivacyCategory.prefersSmallArtwork.getter();
}

uint64_t sub_10076E9D0()
{
  return PrivacyCategory.style.getter();
}

uint64_t sub_10076E9E0()
{
  return PrivacyCategory.title.getter();
}

uint64_t sub_10076E9F0()
{
  return PrivacyCategory.artwork.getter();
}

uint64_t sub_10076EA00()
{
  return PrivacyCategory.dataTypes.getter();
}

uint64_t sub_10076EA10()
{
  return type metadata accessor for PrivacyCategory();
}

uint64_t sub_10076EA20()
{
  return ProductPageLink.systemImageName.getter();
}

uint64_t sub_10076EA30()
{
  return ProductPageLink.text.getter();
}

uint64_t sub_10076EA40()
{
  return type metadata accessor for ProductPageLink();
}

uint64_t sub_10076EA50()
{
  return static ShelfBackground.== infix(_:_:)();
}

uint64_t sub_10076EA60()
{
  return type metadata accessor for ShelfBackground();
}

uint64_t sub_10076EA70()
{
  return SpacerDimension.init(constant:)();
}

uint64_t sub_10076EA80()
{
  return type metadata accessor for SpacerDimension();
}

uint64_t sub_10076EA90()
{
  return SuggestedFriend.init(contactID:contactAssociationID:handle:fullName:supportsFriendingViaPush:)();
}

uint64_t sub_10076EAA0()
{
  return type metadata accessor for SuggestedFriend();
}

uint64_t sub_10076EAB0()
{
  return TabChangeAction.init(navigationTab:actions:popToRoot:presentationStyle:actionMetrics:)();
}

uint64_t sub_10076EAC0()
{
  return TabChangeAction.navigationTab.getter();
}

uint64_t sub_10076EAD0()
{
  return TabChangeAction.actions.getter();
}

uint64_t sub_10076EAE0()
{
  return TabChangeAction.popToRoot.getter();
}

uint64_t sub_10076EAF0()
{
  return type metadata accessor for TabChangeAction();
}

uint64_t sub_10076EB00()
{
  return dispatch thunk of TitledParagraph.collapsedText.getter();
}

uint64_t sub_10076EB10()
{
  return TitledParagraph.primarySubtitle.getter();
}

uint64_t sub_10076EB20()
{
  return TitledParagraph.secondarySubtitle.getter();
}

uint64_t sub_10076EB30()
{
  return dispatch thunk of TitledParagraph.text.getter();
}

uint64_t sub_10076EB40()
{
  return TitledParagraph.style.getter();
}

uint64_t sub_10076EB50()
{
  return type metadata accessor for TitledParagraph();
}

uint64_t sub_10076EB60(Swift::String _, Swift::OpaquePointer with)
{
  return localizedString(_:with:)(_, with)._countAndFlagsBits;
}

uint64_t sub_10076EB70(Swift::String _, Swift::String comment)
{
  return localizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_10076EB80()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.TitleStyle();
}

uint64_t sub_10076EB90()
{
  return AccountPresenter.AccountDetailItem.titleStyle.getter();
}

uint64_t sub_10076EBA0()
{
  return AccountPresenter.AccountDetailItem.accessoryMargin.getter();
}

uint64_t sub_10076EBB0()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.ImageConfiguration();
}

uint64_t sub_10076EBC0()
{
  return AccountPresenter.AccountDetailItem.shouldShowFullTitle.getter();
}

uint64_t sub_10076EBD0()
{
  return AccountPresenter.AccountDetailItem.image.getter();
}

uint64_t sub_10076EBE0()
{
  return AccountPresenter.AccountDetailItem.title.getter();
}

uint64_t sub_10076EBF0()
{
  return AccountPresenter.AccountDetailItem.detail.getter();
}

uint64_t sub_10076EC00()
{
  return AccountPresenter.AccountDetailItem.disabled.getter();
}

uint64_t sub_10076EC10()
{
  return AccountPresenter.AccountDetailItem.subtitle.getter();
}

uint64_t sub_10076EC20()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem.Accessory();
}

uint64_t sub_10076EC30()
{
  return AccountPresenter.AccountDetailItem.accessory.getter();
}

uint64_t sub_10076EC40()
{
  return type metadata accessor for AccountPresenter.AccountDetailItem();
}

uint64_t sub_10076EC50()
{
  return AccountPresenter.init(objectGraph:accountStore:appStateController:iapStateProvider:restrictions:profilePictureDiameter:arcadeSubscriptionManager:gameCenterFriendRequestCoordinator:)();
}

uint64_t sub_10076EC60()
{
  return dispatch thunk of AccountPresenter.canUninstall(_:)();
}

uint64_t sub_10076EC70()
{
  return dispatch thunk of AccountPresenter.didSelectItem(_:)();
}

uint64_t sub_10076EC80()
{
  return dispatch thunk of AccountPresenter.refreshUpdates(fromServer:forceServerFetch:refreshBadgeCount:)();
}

uint64_t sub_10076EC90()
{
  return dispatch thunk of AccountPresenter.didFinishSignIn()();
}

uint64_t sub_10076ECA0()
{
  return dispatch thunk of AccountPresenter.onApplySnapshot.getter();
}

uint64_t sub_10076ECB0()
{
  return dispatch thunk of AccountPresenter.isUpdatesLoading.getter();
}

uint64_t sub_10076ECC0()
{
  return AccountPresenter.UpdatesLockupItem.isCollapsed.getter();
}

uint64_t sub_10076ECD0()
{
  return AccountPresenter.UpdatesLockupItem.moreButtonHandler.getter();
}

uint64_t sub_10076ECE0()
{
  return AccountPresenter.UpdatesLockupItem.lockup.getter();
}

uint64_t sub_10076ECF0()
{
  return type metadata accessor for AccountPresenter.UpdatesLockupItem();
}

uint64_t sub_10076ED00()
{
  return dispatch thunk of AccountPresenter.shelfImpressionMetrics(at:)();
}

uint64_t sub_10076ED10()
{
  return type metadata accessor for AccountPresenter.Item();
}

uint64_t sub_10076ED20()
{
  return dispatch thunk of AccountPresenter.view.setter();
}

uint64_t sub_10076ED30()
{
  return dispatch thunk of AccountPresenter.title.getter();
}

uint64_t sub_10076ED40()
{
  return type metadata accessor for AccountPresenter.Section.Identifier();
}

uint64_t sub_10076ED50()
{
  return AccountPresenter.Section.footerText.getter();
}

uint64_t sub_10076ED60()
{
  return AccountPresenter.Section.headerText.getter();
}

uint64_t sub_10076ED70()
{
  return AccountPresenter.Section.identifier.getter();
}

uint64_t sub_10076ED80()
{
  return AccountPresenter.Section.footerButtonHandler.getter();
}

uint64_t sub_10076ED90()
{
  return dispatch thunk of AccountPresenter.uninstall(_:)();
}

uint64_t sub_10076EDA0()
{
  return type metadata accessor for AccountPresenter();
}

uint64_t sub_10076EDB0()
{
  return type metadata accessor for AlertActionStyle();
}

uint64_t sub_10076EDC0()
{
  return static AutomaticUpdates.enabledDidChangeNotification.getter();
}

uint64_t sub_10076EDD0()
{
  return type metadata accessor for AutomaticUpdates();
}

uint64_t sub_10076EDE0()
{
  return type metadata accessor for BadgeViewSpacing();
}

uint64_t sub_10076EE00()
{
  return static ConfigurableCell.reuseIdentifier(in:)();
}

uint64_t sub_10076EE10()
{
  return dispatch thunk of DynamicTypeLabel.updateFont(to:)();
}

uint64_t sub_10076EE20()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.getter();
}

uint64_t sub_10076EE30()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCase.setter();
}

uint64_t sub_10076EE40()
{
  return DynamicTypeLabel.__allocating_init(customTextStyle:numberOfLines:lineBreakMode:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_10076EE50()
{
  return dispatch thunk of DynamicTypeLabel.customTextStyle.setter();
}

uint64_t sub_10076EE60()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.getter();
}

uint64_t sub_10076EE70()
{
  return dispatch thunk of DynamicTypeLabel.directionalTextAlignment.setter();
}

uint64_t sub_10076EE80()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.getter();
}

uint64_t sub_10076EE90()
{
  return dispatch thunk of DynamicTypeLabel.contentSizeCategoryMapping.setter();
}

uint64_t sub_10076EEA0()
{
  return dispatch thunk of DynamicTypeLabel.wantsFastBaselineMeasurement.setter();
}

uint64_t sub_10076EEB0()
{
  return dispatch thunk of DynamicTypeLabel.fontUseCaseContentSizeCategory.setter();
}

uint64_t sub_10076EEC0()
{
  return dispatch thunk of DynamicTypeLabel.traitCollectionForFontUseCases.getter();
}

uint64_t sub_10076EED0()
{
  return DynamicTypeLabel.__allocating_init(frame:)();
}

uint64_t sub_10076EEE0()
{
  return DynamicTypeLabel.init(useCase:numberOfLines:lineBreakMode:isUserInteractionEnabled:directionalTextAlignment:contentSizeCategoryMapping:)();
}

uint64_t sub_10076EEF0()
{
  return type metadata accessor for DynamicTypeLabel();
}

uint64_t sub_10076EF00()
{
  return method lookup function for DynamicTypeLabel();
}

uint64_t sub_10076EF10()
{
  return type metadata accessor for EditorialPageKey();
}

uint64_t sub_10076EF20()
{
  return GameCenterPlayer.displayName.getter();
}

uint64_t sub_10076EF30()
{
  return GameCenterPlayer.alias.getter();
}

uint64_t sub_10076EF40()
{
  return GameCenterPlayer.action.getter();
}

uint64_t sub_10076EF50()
{
  return dispatch thunk of GameCenterPlayer.artwork.getter();
}

uint64_t sub_10076EF60()
{
  return dispatch thunk of HeroCarouselItem.clickAction.getter();
}

uint64_t sub_10076EF70()
{
  return dispatch thunk of HeroCarouselItem.titleEffect.getter();
}

uint64_t sub_10076EF80()
{
  return HeroCarouselItem.backgroundColor.getter();
}

uint64_t sub_10076EF90()
{
  return HeroCarouselItem.impressionMetrics.getter();
}

uint64_t sub_10076EFA0()
{
  return HeroCarouselItem.video.getter();
}

uint64_t sub_10076EFB0()
{
  return HeroCarouselItem.artwork.getter();
}

uint64_t sub_10076EFC0()
{
  return HeroCarouselItem.overlay.getter();
}

uint64_t sub_10076EFD0()
{
  return type metadata accessor for InstallationType();
}

uint64_t sub_10076EFE0()
{
  return MixedMediaLockup.showMetadataInformationInLockup.getter();
}

uint64_t sub_10076EFF0()
{
  return MixedMediaLockup.overrideLockupPosition.getter();
}

uint64_t sub_10076F000()
{
  return type metadata accessor for MixedMediaLockup.LockupPosition();
}

uint64_t sub_10076F010()
{
  return MixedMediaLockup.screenshots.getter();
}

uint64_t sub_10076F020()
{
  return MixedMediaLockup.metadataRibbonItems.getter();
}

uint64_t sub_10076F030()
{
  return MixedMediaLockup.searchTagRibbonItems.getter();
}

uint64_t sub_10076F040()
{
  return MixedMediaLockup.screenshotsDisplayStyle.getter();
}

uint64_t sub_10076F050()
{
  return MixedMediaLockup.shouldEvenlyDistributeRibbonItems.getter();
}

uint64_t sub_10076F060()
{
  return MixedMediaLockup.init(adamId:bundleId:icon:heading:title:subtitle:developerTagline:editorialTagline:editorialDescription:shortEditorialDescription:ordinal:rating:ratingCount:buttonAction:offerDisplayProperties:clickAction:contextMenuData:impressionMetrics:overrideLockupPosition:trailers:screenshots:screenshotsDisplayStyle:metadataRibbonItems:searchTagRibbonItems:shouldEvenlyDistributeRibbonItems:showMetadataInformationInLockup:)();
}

uint64_t sub_10076F070()
{
  return MixedMediaLockup.trailers.getter();
}

uint64_t sub_10076F080()
{
  return type metadata accessor for MixedMediaLockup();
}

uint64_t sub_10076F090()
{
  return OfferEnvironment.isArcadeEnvironment.getter();
}

uint64_t sub_10076F0A0()
{
  return static OfferEnvironment.== infix(_:_:)();
}

uint64_t sub_10076F0B0()
{
  return static OfferEnvironment.infer.getter();
}

uint64_t sub_10076F0C0()
{
  return type metadata accessor for OfferEnvironment();
}

uint64_t sub_10076F0D0()
{
  return OfferStateAction.subscribePageAction.getter();
}

uint64_t sub_10076F0E0()
{
  return OfferStateAction.buyAction.getter();
}

uint64_t sub_10076F0F0()
{
  return OfferStateAction.openAction.getter();
}

uint64_t sub_10076F100()
{
  return OfferStateAction.defaultAction.getter();
}

uint64_t sub_10076F110()
{
  return OfferStateAction.preferredActionFor(stateMachine:)();
}

uint64_t sub_10076F120()
{
  return OfferStateAction.includeBetaApps.getter();
}

uint64_t sub_10076F130()
{
  return OfferStateAction.adamId.getter();
}

uint64_t sub_10076F140()
{
  return type metadata accessor for OfferStateAction();
}

uint64_t sub_10076F150()
{
  return dispatch thunk of OffsetGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076F160()
{
  return static OffsetGridLayout.numberOfViewsNeeded(toFill:with:)();
}

uint64_t sub_10076F170()
{
  return static OffsetGridLayout.Metrics.centerOffsetLayout(with:interItemSpacing:lineSpacing:numberOfRows:originOffset:)();
}

uint64_t sub_10076F180()
{
  return type metadata accessor for OffsetGridLayout.Metrics();
}

uint64_t sub_10076F190()
{
  return OffsetGridLayout.init(metrics:views:)();
}

uint64_t sub_10076F1A0()
{
  return type metadata accessor for OffsetGridLayout();
}

uint64_t sub_10076F1B0()
{
  return PageGridProvider.bottomPadding(for:surroundedBy:containerSize:environment:)();
}

uint64_t sub_10076F1C0()
{
  return PageMetricsEvent.init(error:pageUrl:)();
}

uint64_t sub_10076F1D0()
{
  return type metadata accessor for PageMetricsEvent();
}

uint64_t sub_10076F1E0()
{
  return PlaceholderBrick.init(style:title:badge:artworks:)();
}

uint64_t sub_10076F1F0()
{
  return type metadata accessor for PlaceholderBrick();
}

uint64_t sub_10076F200()
{
  return type metadata accessor for PrivacyTypeStyle();
}

uint64_t sub_10076F210()
{
  return ProductMediaItem.screenshot.getter();
}

uint64_t sub_10076F220()
{
  return ProductMediaItem.video.getter();
}

uint64_t sub_10076F230()
{
  return type metadata accessor for ProductMediaItem();
}

uint64_t sub_10076F240()
{
  return type metadata accessor for ProductPageTheme();
}

uint64_t sub_10076F250()
{
  return dispatch thunk of ProductPresenter.alwaysAllowReviews.getter();
}

uint64_t sub_10076F260()
{
  return type metadata accessor for ProductPresenter();
}

uint64_t sub_10076F270()
{
  return ProductTopLockup.offerAction.getter();
}

uint64_t sub_10076F280()
{
  return ProductTopLockup.PrimaryBanner.hideCriteria.getter();
}

uint64_t sub_10076F290()
{
  return type metadata accessor for ProductTopLockup.PrimaryBanner();
}

uint64_t sub_10076F2A0()
{
  return ProductTopLockup.developerName.getter();
}

uint64_t sub_10076F2B0()
{
  return ProductTopLockup.primaryBanner(for:)();
}

uint64_t sub_10076F2C0()
{
  return ProductTopLockup.tertiaryTitle.getter();
}

uint64_t sub_10076F2D0()
{
  return ProductTopLockup.secondaryBanner.getter();
}

uint64_t sub_10076F2E0()
{
  return ProductTopLockup.developerTagline.getter();
}

uint64_t sub_10076F2F0()
{
  return ProductTopLockup.hasExpandedOffer.getter();
}

uint64_t sub_10076F300()
{
  return ProductTopLockup.expandedOfferTitles.getter();
}

uint64_t sub_10076F310()
{
  return ProductTopLockup.offerDisplayProperties.getter();
}

uint64_t sub_10076F320()
{
  return ProductTopLockup.offerSubtitlesOverride.getter();
}

uint64_t sub_10076F330()
{
  return ProductTopLockup.hasExpandedOfferDetails.getter();
}

uint64_t sub_10076F340()
{
  return ProductTopLockup.wantsInlineUberPresentationStyle.getter();
}

uint64_t sub_10076F350()
{
  return ProductTopLockup.uber.getter();
}

uint64_t sub_10076F360()
{
  return ProductTopLockup.theme.getter();
}

uint64_t sub_10076F370()
{
  return ProductTopLockup.title.getter();
}

uint64_t sub_10076F380()
{
  return ProductTopLockup.adamId.getter();
}

uint64_t sub_10076F390()
{
  return ProductTopLockup.subtitle.getter();
}

uint64_t sub_10076F3A0()
{
  return ProductTopLockup.iconStyle.getter();
}

uint64_t sub_10076F3B0()
{
  return type metadata accessor for ProductTopLockup();
}

uint64_t sub_10076F3C0()
{
  return ReviewsContainer.alwaysAllowReviews.getter();
}

uint64_t sub_10076F3D0()
{
  return ReviewsContainer.editorsChoice.getter();
}

uint64_t sub_10076F3E0()
{
  return ReviewsContainer.reviewSummary.getter();
}

uint64_t sub_10076F3F0()
{
  return ReviewsContainer.supportAction.getter();
}

uint64_t sub_10076F400()
{
  return ReviewsContainer.writeReviewAction.getter();
}

uint64_t sub_10076F410()
{
  return ReviewsContainer.adamId.getter();
}

uint64_t sub_10076F420()
{
  return ReviewsContainer.ratings.getter();
}

uint64_t sub_10076F430()
{
  return ReviewsContainer.reviews.getter();
}

uint64_t sub_10076F440()
{
  return ReviewsContainer.tapToRate.getter();
}

uint64_t sub_10076F450()
{
  return type metadata accessor for ReviewsContainer();
}

uint64_t sub_10076F460()
{
  return static RiverViewStyling.defaultSpeed.getter();
}

uint64_t sub_10076F470()
{
  return static RiverViewStyling.todayTabSpeed.getter();
}

uint64_t sub_10076F480()
{
  return RiverViewStyling.interRowSpacing.getter();
}

uint64_t sub_10076F490()
{
  return RiverViewStyling.interItemSpacing.getter();
}

uint64_t sub_10076F4A0()
{
  return static RiverViewStyling.defaultRowOffsets.getter();
}

uint64_t sub_10076F4B0()
{
  return static RiverViewStyling.defaultInterRowSpacing.getter();
}

uint64_t sub_10076F4C0()
{
  return static RiverViewStyling.defaultInterItemSpacing.getter();
}

uint64_t sub_10076F4D0()
{
  return RiverViewStyling.speed.getter();
}

uint64_t sub_10076F4E0()
{
  return RiverViewStyling.init(itemSize:interRowSpacing:interItemSpacing:speed:rowOffsets:reverseAlternatingRows:)();
}

uint64_t sub_10076F4F0()
{
  return RiverViewStyling.itemSize.getter();
}

uint64_t sub_10076F500()
{
  return type metadata accessor for RiverViewStyling();
}

uint64_t sub_10076F510()
{
  return SearchHintLayout.measurements(fitting:in:)();
}

uint64_t sub_10076F520()
{
  return SearchHintLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076F530()
{
  return SearchHintLayout.Metrics.init(leadingMargin:trailingMargin:textLeadingMargin:iconHorizontalCenterMargin:iconSize:)();
}

uint64_t sub_10076F540()
{
  return SearchHintLayout.Metrics.iconSize.getter();
}

uint64_t sub_10076F550()
{
  return type metadata accessor for SearchHintLayout.Metrics();
}

uint64_t sub_10076F560()
{
  return SearchHintLayout.init(metrics:iconView:titleLabel:separatorView:)();
}

uint64_t sub_10076F570()
{
  return type metadata accessor for SearchHintLayout();
}

uint64_t sub_10076F580()
{
  return ShareSheetAction.shareSheetStyle.getter();
}

uint64_t sub_10076F590()
{
  return type metadata accessor for ShareSheetAction.ShareSheetStyle();
}

uint64_t sub_10076F5A0()
{
  return ShareSheetAction.activities.getter();
}

uint64_t sub_10076F5B0()
{
  return ShareSheetAction.data.getter();
}

uint64_t sub_10076F5C0()
{
  return ShareSheetAction.Activity.activityType.getter();
}

uint64_t sub_10076F5D0()
{
  return ShareSheetAction.Activity.action.getter();
}

uint64_t sub_10076F5E0()
{
  return type metadata accessor for ShareSheetAction.Activity();
}

uint64_t sub_10076F5F0()
{
  return type metadata accessor for ShareSheetAction();
}

uint64_t sub_10076F600()
{
  return SheetActionStyle.allowsDisplayOfTitle.getter();
}

uint64_t sub_10076F610()
{
  return type metadata accessor for SheetActionStyle();
}

uint64_t sub_10076F620()
{
  return TodayCardOverlay.Kind.rawValue.getter();
}

uint64_t sub_10076F630()
{
  return TodayCardOverlay.kind.getter();
}

uint64_t sub_10076F640()
{
  return type metadata accessor for TodayCardOverlay();
}

uint64_t sub_10076F650()
{
  return dispatch thunk of TodayCardTrigger.identifier.getter();
}

uint64_t sub_10076F660()
{
  return dispatch thunk of TodayCardTrigger.clearActivationContext()();
}

uint64_t sub_10076F670()
{
  return dispatch thunk of TodayCardTrigger.adamId.getter();
}

uint64_t sub_10076F680()
{
  return UpsellGridLayout.measurements(fitting:in:)();
}

uint64_t sub_10076F690()
{
  return static UpsellGridLayout.largeIconSize(fitting:using:in:)();
}

uint64_t sub_10076F6A0()
{
  return UpsellGridLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076F6B0()
{
  return UpsellGridLayout.Metrics.init(dimensionSmallIconCount:)();
}

uint64_t sub_10076F6C0()
{
  return type metadata accessor for UpsellGridLayout.Metrics();
}

uint64_t sub_10076F6D0()
{
  return UpsellGridLayout.init(metrics:icons:)();
}

uint64_t sub_10076F6E0()
{
  return static UpsellGridLayout.iconCount(fitting:using:in:)();
}

uint64_t sub_10076F6F0()
{
  return static UpsellGridLayout.iconSizes(fitting:using:in:)();
}

uint64_t sub_10076F700()
{
  return type metadata accessor for UpsellGridLayout();
}

uint64_t sub_10076F710()
{
  return static VideoPlayerState.== infix(_:_:)();
}

uint64_t sub_10076F720()
{
  return type metadata accessor for VideoPlayerState();
}

uint64_t sub_10076F730()
{
  return dispatch thunk of VideoViewManager.videoView<A>(with:videoUrl:configuration:templateMediaEvent:templateClickEvent:asPartOf:)();
}

uint64_t sub_10076F740()
{
  return VideoViewManager.init(networkInquiry:metricsPipeline:)();
}

uint64_t sub_10076F750()
{
  return type metadata accessor for VideoViewManager();
}

uint64_t sub_10076F760()
{
  return AnnotationItem_V2.headingArtworkItems.getter();
}

uint64_t sub_10076F770()
{
  return AnnotationItem_V2.text.getter();
}

uint64_t sub_10076F780()
{
  return AnnotationItem_V2.heading.getter();
}

uint64_t sub_10076F790()
{
  return AnnotationItem_V2.TextPair.leadingText.getter();
}

uint64_t sub_10076F7A0()
{
  return AnnotationItem_V2.TextPair.trailingText.getter();
}

uint64_t sub_10076F7B0()
{
  return type metadata accessor for AnnotationItem_V2.TextPair();
}

uint64_t sub_10076F7C0()
{
  return AnnotationItem_V2.listText.getter();
}

uint64_t sub_10076F7D0()
{
  return AnnotationItem_V2.textPairs.getter();
}

uint64_t sub_10076F7E0()
{
  return ArcadeStateChange.newState.getter();
}

uint64_t sub_10076F7F0()
{
  return ArcadeStateChange.oldState.getter();
}

uint64_t sub_10076F800()
{
  return type metadata accessor for ArcadeStateChange();
}

uint64_t sub_10076F810()
{
  return ArcadeWelcomeItem.body.getter();
}

uint64_t sub_10076F820()
{
  return ArcadeWelcomeItem.artwork.getter();
}

uint64_t sub_10076F830()
{
  return ArcadeWelcomeItem.headline.getter();
}

uint64_t sub_10076F840()
{
  return type metadata accessor for ArcadeWelcomePage.ContentType();
}

uint64_t sub_10076F850()
{
  return type metadata accessor for ArcadeWelcomePage();
}

uint64_t sub_10076F860()
{
  return static BadgeDisplayStyle.style(forBadgeCount:pageTraits:indentForBadges:)();
}

uint64_t sub_10076F870()
{
  return type metadata accessor for BadgeDisplayStyle();
}

uint64_t sub_10076F880()
{
  return type metadata accessor for BadgeLeadingValue();
}

uint64_t sub_10076F890()
{
  return static ClickMetricsEvent.makeErrorRetryEvent()();
}

uint64_t sub_10076F8A0()
{
  return static ClickMetricsEvent.tabClickEvent(named:at:)();
}

uint64_t sub_10076F8B0()
{
  return static ClickMetricsEvent.makeBackClickEvent()();
}

uint64_t sub_10076F8C0()
{
  return ClickMetricsEvent.init(targetType:targetId:including:excluding:eventFields:)();
}

uint64_t sub_10076F8D0()
{
  return type metadata accessor for ClickMetricsEvent();
}

uint64_t sub_10076F8E0()
{
  return DebugMetricsEvent.iconSymbol.getter();
}

uint64_t sub_10076F8F0()
{
  return DebugMetricsEvent.description.getter();
}

uint64_t sub_10076F900()
{
  return DebugMetricsEvent.summaryInfo.getter();
}

uint64_t sub_10076F910()
{
  return DebugMetricsEvent.date.getter();
}

uint64_t sub_10076F920()
{
  return DebugMetricsEvent.title.getter();
}

uint64_t sub_10076F930()
{
  return DebugMetricsEvent.topic.getter();
}

uint64_t sub_10076F940()
{
  return DebugMetricsEvent.fields.getter();
}

uint64_t sub_10076F950()
{
  return DebugMetricsEvent.issues.getter();
}

uint64_t sub_10076F960()
{
  return type metadata accessor for DebugMetricsEvent();
}

uint64_t sub_10076F970()
{
  return dispatch thunk of DynamicTypeButton.updateFont(to:)();
}

uint64_t sub_10076F980()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.getter();
}

uint64_t sub_10076F990()
{
  return dispatch thunk of DynamicTypeButton.fontUseCase.setter();
}

uint64_t sub_10076F9A0()
{
  return DynamicTypeButton.__allocating_init(useCase:)();
}

uint64_t sub_10076F9B0()
{
  return type metadata accessor for DynamicTypeButton();
}

uint64_t sub_10076F9C0()
{
  return method lookup function for DynamicTypeButton();
}

uint64_t sub_10076F9D0()
{
  return ExternalUrlAction.isSensitive.getter();
}

uint64_t sub_10076F9E0()
{
  return ExternalUrlAction.timeoutSeconds.getter();
}

uint64_t sub_10076F9F0()
{
  return ExternalUrlAction.url.getter();
}

uint64_t sub_10076FA00()
{
  return ExternalUrlAction.init(title:urlString:isSensitive:timeoutSeconds:artwork:presentationStyle:actionMetrics:)();
}

uint64_t sub_10076FA10()
{
  return type metadata accessor for ExternalUrlAction();
}

uint64_t sub_10076FA20()
{
  return FlowPreviewAction.presentationContext.getter();
}

uint64_t sub_10076FA30()
{
  return FlowPreviewAction.previewViewController.getter();
}

uint64_t sub_10076FA40()
{
  return FlowPreviewAction.requiresNavigationController.getter();
}

uint64_t sub_10076FA50()
{
  return type metadata accessor for FlowPreviewAction();
}

uint64_t sub_10076FA60()
{
  return GameCenterFriends.getter();
}

uint64_t sub_10076FA70()
{
  return GuidedSearchToken.isSelected.getter();
}

uint64_t sub_10076FA80()
{
  return GuidedSearchToken.displayName.getter();
}

uint64_t sub_10076FA90()
{
  return GuidedSearchToken.leadingIconSymbolName.getter();
}

uint64_t sub_10076FAA0()
{
  return InformationRibbon.hasTopSeparator.getter();
}

uint64_t sub_10076FAB0()
{
  return InformationRibbon.hasBottomSeparator.getter();
}

uint64_t sub_10076FAC0()
{
  return InformationRibbon.separatorsAreFullWidth.getter();
}

uint64_t sub_10076FAD0()
{
  return InformationRibbon.badges.getter();
}

uint64_t sub_10076FAE0()
{
  return type metadata accessor for InformationRibbon.Alignment();
}

uint64_t sub_10076FAF0()
{
  return InformationRibbon.alignment.getter();
}

uint64_t sub_10076FB00()
{
  return type metadata accessor for InformationRibbon();
}

uint64_t sub_10076FB10()
{
  return ItemLayoutContext.parentShelfLayoutContext.getter();
}

uint64_t sub_10076FB20()
{
  return ItemLayoutContext.withUpdatedLayoutOptions(_:)();
}

uint64_t sub_10076FB30()
{
  return ItemLayoutContext.componentLayoutOptions.getter();
}

uint64_t sub_10076FB40()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_10076FB50()
{
  return ItemLayoutContext.typedModel<A>(as:)();
}

uint64_t sub_10076FB60()
{
  return ItemLayoutContext.typedModel<A>(is:)();
}

uint64_t sub_10076FB70()
{
  return ItemLayoutContext.typedState<A>(as:)();
}

uint64_t sub_10076FB80()
{
  return ItemLayoutContext.mutableState.getter();
}

uint64_t sub_10076FB90()
{
  return ItemLayoutContext.sectionIndex.getter();
}

uint64_t sub_10076FBA0()
{
  return ItemLayoutContext.subscript.getter();
}

uint64_t sub_10076FBB0()
{
  return ItemLayoutContext.typedWritableState<A>(as:)();
}

uint64_t sub_10076FBC0()
{
  return ItemLayoutContext.item.getter();
}

uint64_t sub_10076FBD0()
{
  return ItemLayoutContext.index.getter();
}

uint64_t sub_10076FBE0()
{
  return ItemLayoutContext.state.getter();
}

uint64_t sub_10076FBF0()
{
  return ItemLayoutContext.Metadata.init()();
}

uint64_t sub_10076FC00()
{
  return type metadata accessor for ItemLayoutContext.Metadata();
}

uint64_t sub_10076FC10()
{
  return ItemLayoutContext.indexPath.getter();
}

uint64_t sub_10076FC20()
{
  return type metadata accessor for ItemLayoutContext();
}

uint64_t sub_10076FC30()
{
  return dispatch thunk of LargeHeroBreakout.clickAction.getter();
}

uint64_t sub_10076FC40()
{
  return LargeHeroBreakout.backgroundColor.getter();
}

uint64_t sub_10076FC50()
{
  return LargeHeroBreakout.detailsDisplayProperties.getter();
}

uint64_t sub_10076FC60()
{
  return LargeHeroBreakout.video.getter();
}

uint64_t sub_10076FC70()
{
  return LargeHeroBreakout.artwork.getter();
}

uint64_t sub_10076FC80()
{
  return LargeHeroBreakout.details.getter();
}

uint64_t sub_10076FC90()
{
  return LargeHeroBreakout.heading.getter();
}

uint64_t sub_10076FCA0()
{
  return type metadata accessor for LargeHeroBreakout();
}

uint64_t sub_10076FCB0()
{
  return LargeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076FCC0()
{
  return LargeLockupLayout.Metrics.init(headingSpace:titleSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:bottomSpace:isTextHorizontallyCentered:)();
}

uint64_t sub_10076FCD0()
{
  return type metadata accessor for LargeLockupLayout.Metrics();
}

uint64_t sub_10076FCE0()
{
  return LargeLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:)();
}

uint64_t sub_10076FCF0()
{
  return type metadata accessor for LargeLockupLayout();
}

uint64_t sub_10076FD00()
{
  return LockupMediaLayout.DisplayType.numberOfViews.getter();
}

uint64_t sub_10076FD10()
{
  return type metadata accessor for LockupMediaLayout.DisplayType();
}

uint64_t sub_10076FD20()
{
  return LockupMediaLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076FD30()
{
  return LockupMediaLayout.Metrics.displayType.getter();
}

uint64_t sub_10076FD40()
{
  return LockupMediaLayout.Metrics.displayType.setter();
}

uint64_t sub_10076FD50()
{
  return LockupMediaLayout.Metrics.init(interItemSpacing:displayType:mediaAspectRatio:boundingAspectRatio:)();
}

uint64_t sub_10076FD60()
{
  return LockupMediaLayout.Metrics.boundingAspectRatio.getter();
}

uint64_t sub_10076FD70()
{
  return type metadata accessor for LockupMediaLayout.Metrics();
}

uint64_t sub_10076FD80()
{
  return LockupMediaLayout.init(metrics:mediaViews:)();
}

uint64_t sub_10076FD90()
{
  return static LockupMediaLayout.mediaSize(using:fitting:with:)();
}

uint64_t sub_10076FDA0()
{
  return type metadata accessor for LockupMediaLayout();
}

uint64_t sub_10076FDB0()
{
  return type metadata accessor for MediaMetricsEvent.ActionType();
}

uint64_t sub_10076FDC0()
{
  return type metadata accessor for MediaMetricsEvent.ActionContext();
}

uint64_t sub_10076FDD0()
{
  return type metadata accessor for MediaMetricsEvent.ActionDetails();
}

uint64_t sub_10076FDE0()
{
  return static MediaMetricsEvent.fillIn(template:actionType:actionDetails:actionContext:url:duration:position:)();
}

uint64_t sub_10076FDF0()
{
  return MediaOverlayStyle.userInterfaceStyle.getter();
}

uint64_t sub_10076FE00()
{
  return MediaOverlayStyle.inverseUserInterfaceStyle.getter();
}

uint64_t sub_10076FE10()
{
  return type metadata accessor for MediaOverlayStyle();
}

uint64_t sub_10076FE20()
{
  return PageRefreshPolicy.shouldSendEventsForPageExit.getter();
}

uint64_t sub_10076FE30()
{
  return PageRefreshPolicy.updateDelayInterval.getter();
}

uint64_t sub_10076FE40()
{
  return PendingPageRender.isLayoutPending.setter();
}

uint64_t sub_10076FE50()
{
  return PendingPageRender.appearTime.setter();
}

uint64_t sub_10076FE60()
{
  return PendingPageRender.disappearTime.setter();
}

uint64_t sub_10076FE70()
{
  return PendingPageRender.observeAssets(_:)();
}

uint64_t sub_10076FE80()
{
  return PendingPageRender.DisappearTimeAndReason.init(reason:timeInterval:)();
}

uint64_t sub_10076FE90()
{
  return type metadata accessor for PendingPageRender.DisappearTimeAndReason();
}

uint64_t sub_10076FEA0()
{
  return PrivacyDefinition.definition.getter();
}

uint64_t sub_10076FEB0()
{
  return PrivacyDefinition.title.getter();
}

uint64_t sub_10076FEC0()
{
  return type metadata accessor for PrivacyDefinition();
}

uint64_t sub_10076FED0()
{
  return PrivacyTypeLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_10076FEE0()
{
  return PrivacyTypeLayout.Metrics.iconBaseline.setter();
}

uint64_t sub_10076FEF0()
{
  return PrivacyTypeLayout.Metrics.iconTopSpace.setter();
}

uint64_t sub_10076FF00()
{
  return PrivacyTypeLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_10076FF10()
{
  return PrivacyTypeLayout.Metrics.detailTopSpace.setter();
}

uint64_t sub_10076FF20()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics.HorizontalAlignment();
}

uint64_t sub_10076FF30()
{
  return PrivacyTypeLayout.Metrics.compactBottomMargin.setter();
}

uint64_t sub_10076FF40()
{
  return PrivacyTypeLayout.Metrics.init(horizontalAlignment:iconTopSpace:iconSize:iconBaseline:titleTopSpace:detailTopSpace:maxTextWidth:minimumCategoriesColumnWidth:categoriesTopSpace:categoriesHorizontalPadding:categoriesBottomSpace:horizontalMargin:compactBottomMargin:regularBottomMargin:)();
}

uint64_t sub_10076FF50()
{
  return PrivacyTypeLayout.Metrics.horizontalAlignment.setter();
}

uint64_t sub_10076FF60()
{
  return PrivacyTypeLayout.Metrics.regularBottomMargin.setter();
}

uint64_t sub_10076FF70()
{
  return PrivacyTypeLayout.Metrics.iconSize.getter();
}

uint64_t sub_10076FF80()
{
  return PrivacyTypeLayout.Metrics.iconSize.setter();
}

uint64_t sub_10076FF90()
{
  return type metadata accessor for PrivacyTypeLayout.Metrics();
}

uint64_t sub_10076FFA0()
{
  return PrivacyTypeLayout.init(metrics:shadowView:backgroundView:separatorView:iconView:titleLabel:detailLabel:categoryViews:style:)();
}

uint64_t sub_10076FFB0()
{
  return type metadata accessor for PrivacyTypeLayout();
}

uint64_t sub_10076FFC0()
{
  return ProductCapability.artworkTintColor.getter();
}

uint64_t sub_10076FFD0()
{
  return ProductCapability.captionTrailingArtwork.getter();
}

uint64_t sub_10076FFE0()
{
  return ProductCapability.title.getter();
}

uint64_t sub_10076FFF0()
{
  return ProductCapability.artwork.getter();
}

uint64_t sub_100770000()
{
  return ProductCapability.caption.getter();
}

uint64_t sub_100770010()
{
  return type metadata accessor for ProductCapability();
}

uint64_t sub_100770020()
{
  return RateLimitedAction.primaryAction.getter();
}

uint64_t sub_100770030()
{
  return RateLimitedAction.fallbackAction.getter();
}

uint64_t sub_100770040()
{
  return static RateLimitedAction.preferencesKey.getter();
}

uint64_t sub_100770050()
{
  return RateLimitedAction.actionKey.getter();
}

uint64_t sub_100770060()
{
  return RateLimitedAction.rateLimit.getter();
}

uint64_t sub_100770070()
{
  return type metadata accessor for RateLimitedAction();
}

uint64_t sub_100770080()
{
  return type metadata accessor for RoundedButtonType();
}

uint64_t sub_100770090()
{
  return dispatch thunk of RoundedCornerView.setCorner(radius:style:)();
}

uint64_t sub_1007700A0()
{
  return dispatch thunk of RoundedCornerView.applyCorner(radius:style:)();
}

uint64_t sub_1007700B0()
{
  return dispatch thunk of RoundedCornerView.borderView.getter();
}

uint64_t sub_1007700C0()
{
  return dispatch thunk of RoundedCornerView.borderColor.setter();
}

uint64_t sub_1007700D0()
{
  return dispatch thunk of RoundedCornerView.borderWidth.setter();
}

uint64_t sub_1007700E0()
{
  return dispatch thunk of RoundedCornerView.cornerStyle.getter();
}

uint64_t sub_1007700F0()
{
  return dispatch thunk of RoundedCornerView.cornerRadius.getter();
}

uint64_t sub_100770100()
{
  return dispatch thunk of RoundedCornerView.updateBorder()();
}

uint64_t sub_100770110()
{
  return dispatch thunk of RoundedCornerView.roundedCorners.setter();
}

uint64_t sub_100770120()
{
  return RoundedCornerView.__allocating_init(radius:style:)();
}

uint64_t sub_100770130()
{
  return type metadata accessor for RoundedCornerView();
}

uint64_t sub_100770140()
{
  return method lookup function for RoundedCornerView();
}

uint64_t sub_100770150()
{
  return dispatch thunk of SearchAdProviding.searchAd.getter();
}

uint64_t sub_100770160()
{
  return SearchAdProviding.isSearchAd.getter();
}

uint64_t sub_100770170()
{
  return SearchHistoryItem.debugDescription.getter();
}

uint64_t sub_100770180()
{
  return type metadata accessor for SearchHistoryItem();
}

uint64_t sub_100770190()
{
  return static SmallLockupLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_1007701A0()
{
  return SmallLockupLayout.Metrics.init(artworkSize:artworkMargin:ordinalSpaceProvider:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:subtitleExtraTallSpace:tertiaryTitleSpace:offerTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:numberOfLines:)();
}

uint64_t sub_1007701B0()
{
  return SmallLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_1007701C0()
{
  return SmallLockupLayout.Metrics.artworkSize.setter();
}

uint64_t sub_1007701D0()
{
  return SmallLockupLayout.Metrics.bottomSpace.setter();
}

uint64_t sub_1007701E0()
{
  return SmallLockupLayout.Metrics.headingSpace.setter();
}

uint64_t sub_1007701F0()
{
  return SmallLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_100770200()
{
  return SmallLockupLayout.Metrics.artworkMargin.setter();
}

uint64_t sub_100770210()
{
  return SmallLockupLayout.Metrics.numberOfLines.getter();
}

uint64_t sub_100770220()
{
  return SmallLockupLayout.Metrics.numberOfLines.setter();
}

uint64_t sub_100770230()
{
  return SmallLockupLayout.Metrics.subtitleSpace.setter();
}

uint64_t sub_100770240()
{
  return SmallLockupLayout.Metrics.offerTextSpace.setter();
}

uint64_t sub_100770250()
{
  return SmallLockupLayout.Metrics.offerButtonSize.getter();
}

uint64_t sub_100770260()
{
  return SmallLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_100770270()
{
  return SmallLockupLayout.Metrics.titleShortSpace.setter();
}

uint64_t sub_100770280()
{
  return SmallLockupLayout.Metrics.titleMediumSpace.setter();
}

uint64_t sub_100770290()
{
  return SmallLockupLayout.Metrics.offerButtonMargin.getter();
}

uint64_t sub_1007702A0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.getter();
}

uint64_t sub_1007702B0()
{
  return SmallLockupLayout.Metrics.titleRegularSpace.setter();
}

uint64_t sub_1007702C0()
{
  return SmallLockupLayout.Metrics.tertiaryTitleSpace.setter();
}

uint64_t sub_1007702D0()
{
  return SmallLockupLayout.Metrics.titleWithHeadingSpace.setter();
}

uint64_t sub_1007702E0()
{
  return type metadata accessor for SmallLockupLayout.Metrics();
}

uint64_t sub_1007702F0()
{
  return SmallLockupLayout.init(metrics:artworkView:ordinalText:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_100770300()
{
  return type metadata accessor for SmallLockupLayout();
}

uint64_t sub_100770310()
{
  return static TextConfiguration.maxSubtitleWidth(with:)();
}

uint64_t sub_100770320()
{
  return static TextConfiguration.subtitleHorizontalSpacing.getter();
}

uint64_t sub_100770330()
{
  return TextConfiguration.init(metrics:symbolName:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_100770340()
{
  return TextConfiguration.init(metrics:text:subtitleText:subtitlePosition:theme:)();
}

uint64_t sub_100770350()
{
  return type metadata accessor for TextConfiguration();
}

uint64_t sub_100770360()
{
  return TitleEffectUpdate.isAnimated.getter();
}

uint64_t sub_100770370()
{
  return TitleEffectUpdate.timingFunction.getter();
}

uint64_t sub_100770380()
{
  return TitleEffectUpdate.animationDuration.getter();
}

uint64_t sub_100770390()
{
  return TitleEffectUpdate.init(effect:isAnimated:animationDuration:timingFunction:)();
}

uint64_t sub_1007703A0()
{
  return TitleEffectUpdate.effect.getter();
}

uint64_t sub_1007703B0()
{
  return type metadata accessor for TitleEffectUpdate();
}

uint64_t sub_1007703C0()
{
  return TitleHeaderLayout.init(accessoryView:accessoryMargin:accessoryVerticalAlignment:accessoryHorizontalAlignment:children:childrenHorizontalAlignment:allowsAccessibilityLayouts:)();
}

uint64_t sub_1007703D0()
{
  return TitleHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007703E0()
{
  return static TitleHeaderLayout.AccessoryVerticalAlignment.== infix(_:_:)();
}

uint64_t sub_1007703F0()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryVerticalAlignment();
}

uint64_t sub_100770400()
{
  return type metadata accessor for TitleHeaderLayout.ChildrenHorizontalAlignment();
}

uint64_t sub_100770410()
{
  return type metadata accessor for TitleHeaderLayout.AccessoryHorizontalAlignment();
}

uint64_t sub_100770420()
{
  return TitleHeaderLayout.Child.init(decorationView:contentView:decorationViewMargin:firstLineSpace:bottomSpace:trailingView:shortTrailingView:trailingViewMargin:trailingFirstLineSpace:trailingBottomSpace:)();
}

uint64_t sub_100770430()
{
  return type metadata accessor for TitleHeaderLayout.Child();
}

uint64_t sub_100770440()
{
  return type metadata accessor for TitleHeaderLayout();
}

uint64_t sub_100770450()
{
  return TitledButtonStack.compactLineBreaks.getter();
}

uint64_t sub_100770460()
{
  return TitledButtonStack.regularLineBreaks.getter();
}

uint64_t sub_100770470()
{
  return TitledButtonStack.buttons.getter();
}

uint64_t sub_100770480()
{
  return type metadata accessor for TitledButtonStack();
}

uint64_t sub_100770490()
{
  return static VersionStringUtil.isShortVersionString(_:atLeast:)();
}

uint64_t sub_1007704A0()
{
  return dispatch thunk of VideoViewDelegate.playbackWillEnd(in:videoView:)();
}

uint64_t sub_1007704B0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPlay(for:)();
}

uint64_t sub_1007704C0()
{
  return dispatch thunk of VideoViewDelegate.videoDidPlayToEnd(isLooping:videoView:)();
}

uint64_t sub_1007704D0()
{
  return dispatch thunk of VideoViewDelegate.userInitiatedPause(for:)();
}

uint64_t sub_1007704E0()
{
  return dispatch thunk of VideoViewDelegate.videoDidChangeState(to:for:)();
}

uint64_t sub_1007704F0()
{
  return WriteReviewAction.itemDescription.getter();
}

uint64_t sub_100770500()
{
  return WriteReviewAction.adamId.getter();
}

uint64_t sub_100770510()
{
  return WriteReviewAction.appIcon.getter();
}

uint64_t sub_100770520()
{
  return WriteReviewAction.appName.getter();
}

uint64_t sub_100770530()
{
  return type metadata accessor for WriteReviewAction();
}

uint64_t sub_100770540(NSNumber a1)
{
  return localizedFileSize(_:)(a1).value._countAndFlagsBits;
}

uint64_t sub_100770550()
{
  return type metadata accessor for AccountSectionLink.LinkDisplayType();
}

uint64_t sub_100770560()
{
  return AccountSectionLink.displayType.getter();
}

uint64_t sub_100770570()
{
  return AccountSectionLink.title.getter();
}

uint64_t sub_100770580()
{
  return type metadata accessor for AccountSectionLink();
}

uint64_t sub_100770590()
{
  return AccountSectionText.paragraph.getter();
}

uint64_t sub_1007705A0()
{
  return AchievementSummary.achievements.getter();
}

uint64_t sub_1007705B0()
{
  return AchievementSummary.completedText.getter();
}

uint64_t sub_1007705C0()
{
  return AchievementSummary.totalAchievements.getter();
}

uint64_t sub_1007705D0()
{
  return AchievementSummary.completedAchievements.getter();
}

uint64_t sub_1007705E0()
{
  return type metadata accessor for AchievementSummary();
}

uint64_t sub_1007705F0()
{
  return dispatch thunk of ArcadeFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100770600()
{
  return type metadata accessor for ArcadeFooterLayout.ButtonLocation();
}

uint64_t sub_100770610()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.getter();
}

uint64_t sub_100770620()
{
  return ArcadeFooterLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_100770630()
{
  return ArcadeFooterLayout.Metrics.buttonMinWidth.setter();
}

uint64_t sub_100770640()
{
  return ArcadeFooterLayout.Metrics.footnoteSpaceMultiplier.setter();
}

uint64_t sub_100770650()
{
  return ArcadeFooterLayout.Metrics.init(iconSize:iconSpacing:iconRowCount:firstIconHorizontalOffset:wordmarkTopMargin:wordmarkHeight:buttonLocation:buttonTopMargin:buttonBottomMargin:buttonViewTopSpace:buttonViewBottomSpace:buttonMinWidth:buttonPreferredEdgeInsets:footnoteTopSpace:footnoteBottomSpace:footnoteSpaceMultiplier:layoutMargins:)();
}

uint64_t sub_100770660()
{
  return ArcadeFooterLayout.Metrics.iconSize.setter();
}

uint64_t sub_100770670()
{
  return type metadata accessor for ArcadeFooterLayout.Metrics();
}

uint64_t sub_100770680()
{
  return ArcadeFooterLayout.init(metrics:riverView:wordmarkView:buttonView:footnoteView:)();
}

uint64_t sub_100770690()
{
  return type metadata accessor for ArcadeFooterLayout();
}

uint64_t sub_1007706A0()
{
  return ArcadeLockupLayout.init(wordmarkView:subtitleText:offerButton:metrics:)();
}

uint64_t sub_1007706B0()
{
  return ArcadeLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007706C0()
{
  return ArcadeLockupLayout.Metrics.init(minimumHeight:offerButtonMargin:wordmarkMargin:wordmarkTopSpace:wordmarkSpace:subtitleLeadingSpace:bottomSpace:numberOfLinesForSubtitle:)();
}

uint64_t sub_1007706D0()
{
  return ArcadeLockupLayout.Metrics.wordmarkSpace.getter();
}

uint64_t sub_1007706E0()
{
  return type metadata accessor for ArcadeLockupLayout.Metrics();
}

uint64_t sub_1007706F0()
{
  return type metadata accessor for ArcadeLockupLayout();
}

uint64_t sub_100770700()
{
  return dispatch thunk of ArtworkIconFetcher.fetchArtworkIcons(for:partialCompletion:completion:handlerKey:)();
}

uint64_t sub_100770710()
{
  return ArtworkIconFetcher.init(objectGraph:)();
}

uint64_t sub_100770720()
{
  return dispatch thunk of ArtworkIconFetcher.forgetFetches(for:)();
}

uint64_t sub_100770730()
{
  return type metadata accessor for ArtworkIconFetcher();
}

uint64_t sub_100770740()
{
  return dispatch thunk of BaseShelfPresenter.doesShelfExist(for:)();
}

uint64_t sub_100770750()
{
  return dispatch thunk of BaseShelfPresenter.contentType(for:)();
}

uint64_t sub_100770760()
{
  return dispatch thunk of BaseShelfPresenter.numberOfRows(for:)();
}

uint64_t sub_100770770()
{
  return dispatch thunk of BaseShelfPresenter.sectionCount.getter();
}

uint64_t sub_100770780()
{
  return dispatch thunk of BaseShelfPresenter.titleArtwork(for:)();
}

uint64_t sub_100770790()
{
  return dispatch thunk of BaseShelfPresenter.eyebrowArtwork(for:)();
}

uint64_t sub_1007707A0()
{
  return dispatch thunk of BaseShelfPresenter.model(at:)();
}

uint64_t sub_1007707B0()
{
  return dispatch thunk of BaseShelfPresenter.title(for:)();
}

uint64_t sub_1007707C0()
{
  return dispatch thunk of BaseShelfPresenter.eyebrow(for:)();
}

uint64_t sub_1007707D0()
{
  return BundleSearchResult.lockup.getter();
}

uint64_t sub_1007707E0()
{
  return type metadata accessor for BundleSearchResult();
}

uint64_t sub_1007707F0()
{
  return dispatch thunk of ClearablePresenter.clearContent(shouldSendEventsForPageExit:)();
}

uint64_t sub_100770800()
{
  return ComponentSeparator.frame(forBoundingRect:in:)();
}

uint64_t sub_100770810()
{
  return ComponentSeparator.height(in:)();
}

uint64_t sub_100770820()
{
  return ComponentSeparator.Position.rawValue.getter();
}

uint64_t sub_100770830()
{
  return type metadata accessor for ComponentSeparator.Position();
}

uint64_t sub_100770840()
{
  return ComponentSeparator.init(position:leadingInset:trailingInset:)();
}

uint64_t sub_100770850()
{
  return ComponentSeparator.position.getter();
}

uint64_t sub_100770860()
{
  return static ComponentSeparator.thickness(compatibleWith:)();
}

uint64_t sub_100770870()
{
  return type metadata accessor for ComponentSeparator();
}

uint64_t sub_100770880()
{
  return dispatch thunk of EditorialStoryCard.clickAction.getter();
}

uint64_t sub_100770890()
{
  return EditorialStoryCard.description.getter();
}

uint64_t sub_1007708A0()
{
  return dispatch thunk of EditorialStoryCard.shelfBackground.getter();
}

uint64_t sub_1007708B0()
{
  return EditorialStoryCard.title.getter();
}

uint64_t sub_1007708C0()
{
  return EditorialStoryCard.heading.getter();
}

uint64_t sub_1007708D0()
{
  return EmptyConfiguration.init()();
}

uint64_t sub_1007708E0()
{
  return type metadata accessor for EmptyConfiguration();
}

uint64_t sub_1007708F0()
{
  return FamilyCircleAction.clientName.getter();
}

uint64_t sub_100770900()
{
  return FamilyCircleAction.additionalParameters.getter();
}

uint64_t sub_100770910()
{
  return type metadata accessor for FamilyCircleAction.EventType();
}

uint64_t sub_100770920()
{
  return FamilyCircleAction.eventType.getter();
}

uint64_t sub_100770930()
{
  return type metadata accessor for FamilyCircleAction();
}

uint64_t sub_100770940()
{
  return FlowcaseItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100770950()
{
  return FlowcaseItemLayout.Metrics.init(captionSpace:titleSpace:subtitleSpace:textArtworkMargin:artworkAspectRatio:bottomSpace:textLayoutMargins:)();
}

uint64_t sub_100770960()
{
  return FlowcaseItemLayout.Metrics.captionSpace.getter();
}

uint64_t sub_100770970()
{
  return FlowcaseItemLayout.Metrics.artworkAspectRatio.getter();
}

uint64_t sub_100770980()
{
  return type metadata accessor for FlowcaseItemLayout.Metrics();
}

uint64_t sub_100770990()
{
  return FlowcaseItemLayout.init(metrics:artworkView:captionView:titleText:subtitleText:)();
}

uint64_t sub_1007709A0()
{
  return type metadata accessor for FlowcaseItemLayout();
}

uint64_t sub_1007709B0()
{
  return GenericAccountPage.title.getter();
}

uint64_t sub_1007709C0()
{
  return dispatch thunk of HttpTemplateAction.makeAction(with:body:actionMetrics:)();
}

uint64_t sub_1007709D0()
{
  return HttpTemplateAction.failureAction.getter();
}

uint64_t sub_1007709E0()
{
  return HttpTemplateAction.parameters.getter();
}

uint64_t sub_1007709F0()
{
  return HttpTemplateAction.dictionaryBody.getter();
}

uint64_t sub_100770A00()
{
  return HttpTemplateAction.message.getter();
}

uint64_t sub_100770A10()
{
  return type metadata accessor for ImageAlignedButton.ImageAlignment();
}

uint64_t sub_100770A20()
{
  return dispatch thunk of ImageAlignedButton.imageAlignment.setter();
}

uint64_t sub_100770A30()
{
  return dispatch thunk of ImageAlignedButton.touchOutsideMargin.setter();
}

uint64_t sub_100770A40()
{
  return dispatch thunk of ImageAlignedButton.primaryActionHandler.setter();
}

uint64_t sub_100770A50()
{
  return dispatch thunk of ImageAlignedButton.imageWantsBaselineAlignment.setter();
}

uint64_t sub_100770A60()
{
  return dispatch thunk of JSIntentDispatcher.dispatch<A>(intent:with:fileID:)();
}

uint64_t sub_100770A70()
{
  return type metadata accessor for JSIntentDispatcher();
}

uint64_t sub_100770A80()
{
  return LayoutMarginsAware<>.layoutFrame.getter();
}

uint64_t sub_100770A90()
{
  return MediumLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100770AA0()
{
  return MediumLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleSpace:titleWithHeadingRegularSpace:titleWithHeadingShortSpace:subtitleRegularSpace:subtitleShortSpace:tertiaryTitleRegularSpace:tertiaryTitleShortSpace:offerTextRegularSpace:offerTextShortSpace:offerButtonTopMargin:offerButtonBottomMargin:offerButtonSize:)();
}

uint64_t sub_100770AB0()
{
  return MediumLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100770AC0()
{
  return MediumLockupLayout.Metrics.artworkMargin.getter();
}

uint64_t sub_100770AD0()
{
  return MediumLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_100770AE0()
{
  return type metadata accessor for MediumLockupLayout.Metrics();
}

uint64_t sub_100770AF0()
{
  return MediumLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:)();
}

uint64_t sub_100770B00()
{
  return type metadata accessor for MediumLockupLayout();
}

uint64_t sub_100770B10()
{
  return MetadataRibbonItem.starRating.getter();
}

uint64_t sub_100770B20()
{
  return MetadataRibbonItem.borderedText.getter();
}

uint64_t sub_100770B30()
{
  return MetadataRibbonItem.useAdsLocale.getter();
}

uint64_t sub_100770B40()
{
  return MetadataRibbonItem.highlightedText.getter();
}

uint64_t sub_100770B50()
{
  return dispatch thunk of MetadataRibbonItem.allowsTruncation.getter();
}

uint64_t sub_100770B60()
{
  return dispatch thunk of MetadataRibbonItem.impressionMetrics.getter();
}

uint64_t sub_100770B70()
{
  return dispatch thunk of MetadataRibbonItem.maxCharacterCount.getter();
}

uint64_t sub_100770B80()
{
  return MetadataRibbonItem.viewContainerType.getter();
}

uint64_t sub_100770B90()
{
  return MetadataRibbonItem.borderTextViewPlacement.getter();
}

uint64_t sub_100770BA0()
{
  return MetadataRibbonItem.id.getter();
}

uint64_t sub_100770BB0()
{
  return dispatch thunk of MetadataRibbonItem.truncationLegibilityCharacterCountThreshold.getter();
}

uint64_t sub_100770BC0()
{
  return MetadataRibbonItem.artwork.getter();
}

uint64_t sub_100770BD0()
{
  return MetadataRibbonItem.itemType.getter();
}

uint64_t sub_100770BE0()
{
  return MetadataRibbonItem.labelText.getter();
}

uint64_t sub_100770BF0()
{
  return type metadata accessor for MetadataRibbonItem();
}

uint64_t sub_100770C00()
{
  return static MetricsSuppression.isMetricsSuppressed.setter();
}

uint64_t sub_100770C10()
{
  return OfferButtonMetrics.inAppPurchaseTextSpace.getter();
}

uint64_t sub_100770C20()
{
  return OfferButtonMetrics.init(fontSource:subtitleFontSource:inAppPurchaseTextSpace:contentInsets:redownloadImage:stopImage:symbolConfiguration:redownloadImageSymbolConfiguration:minimumSize:progressDiameter:lineWidth:textShapeLineWidth:expandsToFit:cornerRadius:includeTopPadding:)();
}

uint64_t sub_100770C30()
{
  return OfferButtonMetrics.fontSource.setter();
}

uint64_t sub_100770C40()
{
  return OfferButtonMetrics.minimumSize.getter();
}

uint64_t sub_100770C50()
{
  return OfferButtonMetrics.minimumSize.setter();
}

uint64_t sub_100770C60()
{
  return OfferButtonMetrics.estimatedSize(for:subtitlePosition:in:)();
}

uint64_t sub_100770C70()
{
  return OfferButtonMetrics.estimatedHeight.getter();
}

uint64_t sub_100770C80()
{
  return type metadata accessor for OfferButtonMetrics();
}

uint64_t sub_100770C90()
{
  return static OfferButtonStyling.maxNumberOfLinesForSubtitle.getter();
}

uint64_t sub_100770CA0()
{
  return static PosterLockupLayout.aspectRatio.getter();
}

uint64_t sub_100770CB0()
{
  return PosterLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100770CC0()
{
  return static PosterLockupLayout.maximiumLogoArtworkSize(metrics:containerSize:)();
}

uint64_t sub_100770CD0()
{
  return PosterLockupLayout.Metrics.init(headingTopSpace:logoMargin:titleTopSpace:offerButtonTopSpace:footerTopSpace:footerBottomSpace:)();
}

uint64_t sub_100770CE0()
{
  return type metadata accessor for PosterLockupLayout.Metrics();
}

uint64_t sub_100770CF0()
{
  return PosterLockupLayout.init(metrics:gradient:poster:header:logoArt:fallbackTitle:offerButton:footer:)();
}

uint64_t sub_100770D00()
{
  return type metadata accessor for PosterLockupLayout();
}

uint64_t sub_100770D10()
{
  return PreorderDisclaimer.disclaimer.getter();
}

uint64_t sub_100770D20()
{
  return type metadata accessor for PreorderDisclaimer();
}

uint64_t sub_100770D30()
{
  return ProductDescription.developerAction.getter();
}

uint64_t sub_100770D40()
{
  return ProductDescription.paragraph.getter();
}

uint64_t sub_100770D50()
{
  return type metadata accessor for ProductDescription();
}

uint64_t sub_100770D60()
{
  return PurchasesPresenter.init(objectGraph:bag:)();
}

uint64_t sub_100770D70()
{
  return dispatch thunk of PurchasesPresenter.view.setter();
}

uint64_t sub_100770D80()
{
  return type metadata accessor for PurchasesPresenter();
}

uint64_t sub_100770D90()
{
  return dispatch thunk of SearchAdDisplaying.apply(searchAd:asPartOf:)();
}

uint64_t sub_100770DA0()
{
  return SearchMetricsEvent.init(eventFields:)();
}

uint64_t sub_100770DB0()
{
  return type metadata accessor for SearchMetricsEvent();
}

uint64_t sub_100770DC0()
{
  return SearchTextSnapshot.init(prefixText:prefixIsProvisional:expansionText:)();
}

uint64_t sub_100770DD0()
{
  return type metadata accessor for SearchTextSnapshot();
}

uint64_t sub_100770DE0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.getter();
}

uint64_t sub_100770DF0()
{
  return dispatch thunk of ShelfComponentView.itemLayoutContext.setter();
}

uint64_t sub_100770E00()
{
  return dispatch thunk of ShelfComponentView.applyData(from:asPartOf:)();
}

uint64_t sub_100770E10()
{
  return ShelfLayoutContext.itemLayoutContext(for:at:metadata:)();
}

uint64_t sub_100770E20()
{
  return ShelfLayoutContext.stateStore.getter();
}

uint64_t sub_100770E30()
{
  return ShelfLayoutContext.isFirstShelf.getter();
}

uint64_t sub_100770E40()
{
  return ShelfLayoutContext.contentPageGrid.getter();
}

uint64_t sub_100770E50()
{
  return ShelfLayoutContext.traitCollection.getter();
}

uint64_t sub_100770E60()
{
  return ShelfLayoutContext.traitEnvironment.getter();
}

uint64_t sub_100770E70()
{
  return ShelfLayoutContext.surroundingShelves.getter();
}

uint64_t sub_100770E80()
{
  return ShelfLayoutContext.supplementaryPageGrid.getter();
}

uint64_t sub_100770E90()
{
  return ShelfLayoutContext.shelfPresentationHints.getter();
}

uint64_t sub_100770EA0()
{
  return ShelfLayoutContext.id.getter();
}

uint64_t sub_100770EB0()
{
  return ShelfLayoutContext.index.getter();
}

uint64_t sub_100770EC0()
{
  return ShelfLayoutContext.shelf.getter();
}

uint64_t sub_100770ED0()
{
  return type metadata accessor for ShelfLayoutContext();
}

uint64_t sub_100770EE0()
{
  return TodayCardMediaGrid.artworkGridType.getter();
}

uint64_t sub_100770EF0()
{
  return TodayCardMediaGrid.lockups.getter();
}

uint64_t sub_100770F00()
{
  return type metadata accessor for TodayCardMediaGrid();
}

uint64_t sub_100770F10()
{
  return TodayCardMediaList.isMediaDark.getter();
}

uint64_t sub_100770F20()
{
  return TodayCardMediaList.hasMedia.getter();
}

uint64_t sub_100770F30()
{
  return TodayCardMediaList.marketingText.getter();
}

uint64_t sub_100770F40()
{
  return TodayCardMediaList.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_100770F50()
{
  return TodayCardMediaList.lockups.getter();
}

uint64_t sub_100770F60()
{
  return type metadata accessor for TodayCardMediaList();
}

uint64_t sub_100770F70()
{
  return dispatch thunk of UpdatablePresenter.update(ignoringCache:)();
}

uint64_t sub_100770F80()
{
  return dispatch thunk of UpdatablePresenter.didLoad()();
}

uint64_t sub_100770F90()
{
  return static VideoConfiguration.defaultConfiguration.getter();
}

uint64_t sub_100770FA0()
{
  return VideoConfiguration.aspectRatio.getter();
}

uint64_t sub_100770FB0()
{
  return VideoConfiguration.allowsAutoPlay.getter();
}

uint64_t sub_100770FC0()
{
  return VideoConfiguration.roundedCorners.getter();
}

uint64_t sub_100770FD0()
{
  return VideoConfiguration.playbackControls.getter();
}

uint64_t sub_100770FE0()
{
  return VideoConfiguration.canPlayFullScreen.getter();
}

uint64_t sub_100770FF0()
{
  return VideoConfiguration.canPlayFullScreen.setter();
}

uint64_t sub_100771000()
{
  return VideoConfiguration.autoPlayPlaybackControls.getter();
}

uint64_t sub_100771010()
{
  return VideoConfiguration.deviceCornerRadiusFactor.getter();
}

uint64_t sub_100771020()
{
  return VideoConfiguration.looping.getter();
}

uint64_t sub_100771030()
{
  return VideoConfiguration.init(fillMode:aspectRatio:playbackControls:autoPlayPlaybackControls:canPlayFullScreen:allowsAutoPlay:looping:roundedCorners:deviceCornerRadiusFactor:)();
}

uint64_t sub_100771040()
{
  return VideoConfiguration.fillMode.getter();
}

uint64_t sub_100771050()
{
  return type metadata accessor for VideoConfiguration();
}

uint64_t sub_100771060()
{
  return dispatch thunk of VideoViewContainer.currentlyOwns(videoView:)();
}

uint64_t sub_100771070()
{
  return VideoViewProviding.someVideoView.modify();
}

uint64_t sub_1007710A0()
{
  return makeNetworkInquiry()();
}

uint64_t sub_1007710B0()
{
  return static ASKBootstrapFactory.make(bagProfile:appStateControllerFactory:targetType:)();
}

uint64_t sub_1007710C0()
{
  return dispatch thunk of ActionPresenterView.perform(action:sender:)();
}

uint64_t sub_1007710D0()
{
  return AdInteractionAction.adActionMetrics.getter();
}

uint64_t sub_1007710E0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.getter();
}

uint64_t sub_1007710F0()
{
  return dispatch thunk of AdRotationDisabling.disableAdvertRotation.setter();
}

uint64_t sub_100771100()
{
  return type metadata accessor for AdvertActionMetrics.AdvertType();
}

uint64_t sub_100771110()
{
  return type metadata accessor for AdvertActionMetrics.ReportingDestination();
}

uint64_t sub_100771120()
{
  return type metadata accessor for AdvertActionMetrics();
}

uint64_t sub_100771130()
{
  return type metadata accessor for AdvertDiscardReason();
}

uint64_t sub_100771140()
{
  return AdvertsSearchResult.displaysScreenshots.getter();
}

uint64_t sub_100771150()
{
  return AdvertsSearchResult.lockups.getter();
}

uint64_t sub_100771160()
{
  return type metadata accessor for AdvertsSearchResult();
}

uint64_t sub_100771170()
{
  return type metadata accessor for ArcadeSubscribePage.PageType();
}

uint64_t sub_100771180()
{
  return ArcadeSubscribePage.askToBuyMessage.getter();
}

uint64_t sub_100771190()
{
  return ArcadeSubscribePage.offerButtonAction.getter();
}

uint64_t sub_1007711A0()
{
  return ArcadeSubscribePage.dismissButtonTitle.getter();
}

uint64_t sub_1007711B0()
{
  return ArcadeSubscribePage.offerDisplayProperties.getter();
}

uint64_t sub_1007711C0()
{
  return ArcadeSubscribePage.subscribedOfferButtonAction.getter();
}

uint64_t sub_1007711D0()
{
  return ArcadeSubscribePage.details.getter();
}

uint64_t sub_1007711E0()
{
  return ArcadeSubscribePage.pageType.getter();
}

uint64_t sub_1007711F0()
{
  return type metadata accessor for ArcadeSubscribePage();
}

uint64_t sub_100771200()
{
  return ArtworkItemProvider.init(artworkLoader:config:)();
}

uint64_t sub_100771210()
{
  return type metadata accessor for ArtworkItemProvider();
}

uint64_t sub_100771220()
{
  return ArtworkLoaderConfig.size.getter();
}

uint64_t sub_100771230()
{
  return ArtworkLoaderConfig.scale.getter();
}

uint64_t sub_100771240()
{
  return ArtworkLoaderConfig.init(template:size:scale:crop:format:quality:useWideGamut:)();
}

uint64_t sub_100771250()
{
  return ArtworkLoaderConfig.template.getter();
}

uint64_t sub_100771260()
{
  return type metadata accessor for ArtworkLoaderConfig();
}

uint64_t sub_100771270()
{
  return type metadata accessor for ComponentDecoration();
}

uint64_t sub_100771280()
{
  return dispatch thunk of DynamicTypeTextView.attributedTextShouldOverrideTextViewAttributes.setter();
}

uint64_t sub_100771290()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.getter();
}

uint64_t sub_1007712A0()
{
  return dispatch thunk of DynamicTypeTextView.fontUseCase.setter();
}

uint64_t sub_1007712B0()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.getter();
}

uint64_t sub_1007712C0()
{
  return dispatch thunk of DynamicTypeTextView.lineBreakMode.setter();
}

uint64_t sub_1007712D0()
{
  return dispatch thunk of DynamicTypeTextView.numberOfLines.setter();
}

uint64_t sub_1007712E0()
{
  return dispatch thunk of DynamicTypeTextView.hyphenationFactor.setter();
}

uint64_t sub_1007712F0()
{
  return dispatch thunk of DynamicTypeTextView.contentSizeCategoryMapping.setter();
}

uint64_t sub_100771300()
{
  return dispatch thunk of DynamicTypeTextView.traitCollectionForFontUseCases.getter();
}

uint64_t sub_100771310()
{
  return type metadata accessor for DynamicTypeTextView();
}

uint64_t sub_100771320()
{
  return method lookup function for DynamicTypeTextView();
}

uint64_t sub_100771330()
{
  return EdgeInsetsDimension.init(top:left:bottom:right:source:)();
}

uint64_t sub_100771340()
{
  return EdgeInsetsDimension.value(in:rounded:)();
}

uint64_t sub_100771350()
{
  return type metadata accessor for EdgeInsetsDimension();
}

void sub_100771360()
{
}

void sub_100771370()
{
}

uint64_t sub_100771380()
{
  return JSFreshnessWatchdog.__allocating_init(bag:networkInquiry:)();
}

uint64_t sub_100771390()
{
  return type metadata accessor for JSFreshnessWatchdog();
}

uint64_t sub_1007713A0()
{
  return dispatch thunk of LanguageAwareString.attributedString.getter();
}

uint64_t sub_1007713B0()
{
  return static LanguageAwareString.keepStatisticsOnLanguageComponents.getter();
}

uint64_t sub_1007713C0()
{
  return static LanguageAwareString.alwaysGenerateAttributedString.getter();
}

uint64_t sub_1007713D0()
{
  return dispatch thunk of LanguageAwareString.writingDirectionOfLine(_:maximumLinesShown:withWidth:lineBreakMode:cacheLayoutInfo:)();
}

uint64_t sub_1007713E0()
{
  return dispatch thunk of LanguageAwareString.thresholdBaseWritingDirection.getter();
}

uint64_t sub_1007713F0()
{
  return LanguageAwareString.string.getter();
}

uint64_t sub_100771400()
{
  return dispatch thunk of LanguageAwareString.isEmpty.getter();
}

uint64_t sub_100771410()
{
  return type metadata accessor for LanguageAwareString();
}

uint64_t sub_100771420()
{
  return LanguageAwareString.init(_:baseParagraphStyle:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_100771430()
{
  return LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:keepStatisticsOnLanguageComponents:)();
}

uint64_t sub_100771440()
{
  return LocalAskToBuyAction.completion.getter();
}

uint64_t sub_100771450()
{
  return LocalAskToBuyAction.adamIdString.getter();
}

uint64_t sub_100771460()
{
  return OfferItemDetailPage.offerItem.getter();
}

uint64_t sub_100771470()
{
  return OfferItemDetailPage.additionalInfo.getter();
}

uint64_t sub_100771480()
{
  return OfferItemDetailPage.learnMoreTitle.getter();
}

uint64_t sub_100771490()
{
  return OfferItemDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_1007714A0()
{
  return OfferItemDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_1007714B0()
{
  return OfferItemDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_1007714C0()
{
  return OfferItemDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_1007714D0()
{
  return OfferItemDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_1007714E0()
{
  return OfferItemDetailPage.video.getter();
}

uint64_t sub_1007714F0()
{
  return OfferItemDetailPage.artwork.getter();
}

uint64_t sub_100771500()
{
  return type metadata accessor for OfferItemDetailPage();
}

uint64_t sub_100771510()
{
  return OfferLabelPresenter.init(offerDisplayProperties:adamId:appStateController:arePreordersCancellable:)();
}

uint64_t sub_100771520()
{
  return OfferLabelPresenter.view.setter();
}

uint64_t sub_100771530()
{
  return type metadata accessor for OfferLabelPresenter();
}

uint64_t sub_100771540()
{
  return type metadata accessor for OpenableDestination();
}

uint64_t sub_100771550()
{
  return PageFacetsPresenter.pageFacets.getter();
}

uint64_t sub_100771560()
{
  return static PageFacetsPresenter.selectedFacetsTitle(for:)();
}

uint64_t sub_100771570()
{
  return PageFacetsPresenter.onPerformPageFacetsChangeAction.getter();
}

uint64_t sub_100771580()
{
  return PageFacetsPresenter.FacetsState.selectedFacetOptions.getter();
}

uint64_t sub_100771590()
{
  return PageFacetsPresenter.FacetsState.facets.getter();
}

uint64_t sub_1007715A0()
{
  return type metadata accessor for PageFacetsPresenter.FacetsState();
}

uint64_t sub_1007715B0()
{
  return PageFacetsPresenter.selectedFacetOptions.getter();
}

uint64_t sub_1007715C0()
{
  return PageFacetsPresenter.onFacetStateDidChange.getter();
}

uint64_t sub_1007715D0()
{
  return PageFacetsPresenter.onSelectedFacetOptionsChanged.getter();
}

void sub_1007715E0()
{
}

uint64_t sub_1007715F0()
{
  return PageFacetsPresenter.didSelect(option:in:)();
}

uint64_t sub_100771600()
{
  return PageFacetsPresenter.init()();
}

uint64_t sub_100771610()
{
  return type metadata accessor for PageFacetsPresenter();
}

uint64_t sub_100771620()
{
  return type metadata accessor for PageTabChangeAction();
}

uint64_t sub_100771630()
{
  return dispatch thunk of PlaybackCoordinator.unregister(playableView:)();
}

uint64_t sub_100771640()
{
  return dispatch thunk of PlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_100771650()
{
  return dispatch thunk of PlaybackCoordinator.pause()();
}

uint64_t sub_100771660()
{
  return dispatch thunk of PlaybackCoordinator.resume()();
}

uint64_t sub_100771670()
{
  return dispatch thunk of PlaybackCoordinator.register(playableView:)();
}

uint64_t sub_100771680()
{
  return type metadata accessor for PlaybackCoordinator();
}

uint64_t sub_100771690()
{
  return PrivacyFooterLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007716A0()
{
  return PrivacyFooterLayout.Metrics.init(bodyTopSpace:actionButtonLeadingMargin:maxTextWidth:bottomSpace:)();
}

uint64_t sub_1007716B0()
{
  return type metadata accessor for PrivacyFooterLayout.Metrics();
}

uint64_t sub_1007716C0()
{
  return PrivacyFooterLayout.init(metrics:bodyLabel:actionButtons:)();
}

uint64_t sub_1007716D0()
{
  return type metadata accessor for PrivacyFooterLayout();
}

uint64_t sub_1007716E0()
{
  return PrivacyHeaderLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007716F0()
{
  return PrivacyHeaderLayout.Metrics.init(bodyTopSpace:bodyBottomSpace:supplementaryItemsTopSpace:supplementaryItemsPadding:supplementaryItemsBottomSpace:actionButtonLeadingMargin:bodyOnlyBottomMargin:maxTextWidth:)();
}

uint64_t sub_100771700()
{
  return type metadata accessor for PrivacyHeaderLayout.Metrics();
}

uint64_t sub_100771710()
{
  return PrivacyHeaderLayout.init(metrics:isDetailHeader:bodyLabel:supplementaryItemLabels:topSeparatorView:middleSeparatorView:actionButtons:)();
}

uint64_t sub_100771720()
{
  return type metadata accessor for PrivacyHeaderLayout();
}

uint64_t sub_100771730()
{
  return type metadata accessor for ProductReviewAction.ReviewAction();
}

uint64_t sub_100771740()
{
  return ProductReviewAction.action.getter();
}

uint64_t sub_100771750()
{
  return type metadata accessor for ProductReviewAction();
}

uint64_t sub_100771760()
{
  return ProductReviewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100771770()
{
  return ProductReviewLayout.Metrics.init(titleSpace:ratingSpace:dateSpace:authorSpace:bodyFirstLineSpace:bodySubsequentLineSpace:bodyEstimatedNumberOfLines:responseTitleSpace:responseDateSpace:responseBodyFirstLineSpace:horizontalInterViewSpace:horizontalEdgeSpace:bottomEdgeSpace:badgeSpace:actionsSpace:actionsInterItemSpace:)();
}

uint64_t sub_100771780()
{
  return type metadata accessor for ProductReviewLayout.Metrics();
}

uint64_t sub_100771790()
{
  return ProductReviewLayout.init(metrics:titleText:ratingView:dateText:authorText:bodyText:responseTitleText:responseDateText:responseBodyText:badgeText:actionViews:)();
}

uint64_t sub_1007717A0()
{
  return type metadata accessor for ProductReviewLayout();
}

uint64_t sub_1007717B0()
{
  return ProductWriteAReview.supportAction.getter();
}

uint64_t sub_1007717C0()
{
  return ProductWriteAReview.writeReviewAction.getter();
}

uint64_t sub_1007717D0()
{
  return ReportConcernAction.sendAction.getter();
}

uint64_t sub_1007717E0()
{
  return ReportConcernAction.explanation.getter();
}

uint64_t sub_1007717F0()
{
  return ReportConcernAction.reasons.getter();
}

uint64_t sub_100771800()
{
  return type metadata accessor for ReportConcernAction();
}

uint64_t sub_100771810()
{
  return ReportConcernReason.uppercaseName.getter();
}

uint64_t sub_100771820()
{
  return ReportConcernReason.id.getter();
}

uint64_t sub_100771830()
{
  return ReportConcernReason.name.getter();
}

uint64_t sub_100771840()
{
  return type metadata accessor for ReportConcernReason();
}

uint64_t sub_100771850()
{
  return ReviewSummaryLayout.Metrics.contentPadding.setter();
}

uint64_t sub_100771860()
{
  return ReviewSummaryLayout.Metrics.init(subtitleTopSpace:contentPadding:)();
}

uint64_t sub_100771870()
{
  return type metadata accessor for ReviewSummaryLayout.Metrics();
}

uint64_t sub_100771880()
{
  return ReviewSummaryLayout.init(metrics:bodyLabel:subtitleLabel:)();
}

uint64_t sub_100771890()
{
  return type metadata accessor for ReviewSummaryLayout();
}

uint64_t sub_1007718A0()
{
  return type metadata accessor for RiverRowLayoutStyle();
}

uint64_t sub_1007718B0()
{
  return SearchTextPresenter.inputSource.setter();
}

uint64_t sub_1007718C0()
{
  return SearchTextPresenter.onApplyTermExpansion.getter();
}

uint64_t sub_1007718D0()
{
  return SearchTextPresenter.init(ghostHintMetricsTracker:)();
}

uint64_t sub_1007718E0()
{
  return type metadata accessor for SearchTextPresenter();
}

uint64_t sub_1007718F0()
{
  return SmallBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100771900()
{
  return static SmallBreakoutLayout.rotatedIconFrameOffsets(rotation:iconSize:)();
}

uint64_t sub_100771910()
{
  return SmallBreakoutLayout.Metrics.init(iconSize:iconRotation:iconBottomOffset:detailsTrailingMargin:detailsWidth:layoutMargins:height:)();
}

uint64_t sub_100771920()
{
  return type metadata accessor for SmallBreakoutLayout.Metrics();
}

uint64_t sub_100771930()
{
  return SmallBreakoutLayout.init(metrics:iconView:detailsView:)();
}

uint64_t sub_100771940()
{
  return type metadata accessor for SmallBreakoutLayout();
}

uint64_t sub_100771950()
{
  return static SpacerSupplementary.makeSpacerRegistration(elementKind:)();
}

uint64_t sub_100771960()
{
  return static SpacerSupplementary.topElementKind.getter();
}

uint64_t sub_100771970()
{
  return static SpacerSupplementary.bottomElementKind.getter();
}

uint64_t sub_100771980()
{
  return type metadata accessor for SpacerSupplementary();
}

uint64_t sub_100771990()
{
  return TodayCardMediaRiver.lockups.getter();
}

uint64_t sub_1007719A0()
{
  return type metadata accessor for TodayCardMediaRiver();
}

uint64_t sub_1007719B0()
{
  return type metadata accessor for TodayCardMediaVideo();
}

uint64_t sub_1007719C0()
{
  return type metadata accessor for TriggerBuilderError();
}

uint64_t sub_1007719D0()
{
  return type metadata accessor for URLProtocolDelegate.DialogStyle();
}

uint64_t sub_1007719E0()
{
  return URLProtocolDelegate.init(dialogStyle:)();
}

uint64_t sub_1007719F0()
{
  return URLProtocolDelegate.dialogStyle.setter();
}

uint64_t sub_100771A00()
{
  return URLProtocolDelegate.presentDialog(for:)();
}

uint64_t sub_100771A10()
{
  return URLProtocolDelegate.performAuthentication(for:)();
}

uint64_t sub_100771A20()
{
  return type metadata accessor for URLProtocolDelegate();
}

uint64_t sub_100771A30()
{
  return UpsellGridPresenter.init(objectGraph:contentDictionary:)();
}

uint64_t sub_100771A40()
{
  return UpsellGridPresenter.view.setter();
}

uint64_t sub_100771A50()
{
  return type metadata accessor for UpsellGridPresenter();
}

uint64_t sub_100771A60()
{
  return _VerticalFlowLayout.measurements(fitting:in:)();
}

uint64_t sub_100771A70()
{
  return _VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100771A80()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_100771A90()
{
  return static _VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_100771AA0()
{
  return static _VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_100771AB0()
{
  return type metadata accessor for _VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_100771AC0()
{
  return _VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_100771AD0()
{
  return type metadata accessor for _VerticalFlowLayout.Child.HorizontalAlignment();
}

uint64_t sub_100771AE0()
{
  return static _VerticalFlowLayout.Child.make(forView:placement:horizontalAlignment:topSpace:bottomSpace:excludeWhen:)();
}

uint64_t sub_100771AF0()
{
  return type metadata accessor for _VerticalFlowLayout.Child.Placement();
}

uint64_t sub_100771B00()
{
  return type metadata accessor for _VerticalFlowLayout.Child();
}

uint64_t sub_100771B10()
{
  return _VerticalFlowLayout.addChild(_:)();
}

uint64_t sub_100771B20()
{
  return type metadata accessor for _VerticalFlowLayout();
}

uint64_t sub_100771B30()
{
  return dispatch thunk of ASKBootstrapProtocol.withMetricsEventRecorderProducer(_:)();
}

uint64_t sub_100771B40()
{
  return dispatch thunk of ASKBootstrapProtocol.start()();
}

uint64_t sub_100771B50()
{
  return AchievementGroupView.init(visibleModel:showSecondCard:cardSize:)();
}

uint64_t sub_100771B60()
{
  return type metadata accessor for AchievementGroupView.Size();
}

uint64_t sub_100771B70()
{
  return type metadata accessor for AchievementGroupView();
}

uint64_t sub_100771B80()
{
  return dispatch thunk of AdAttributionManager.performClickThroughAttribution(forAdamID:appState:)();
}

uint64_t sub_100771B90()
{
  return static AdAttributionManager.checkIfParametersContainAttributionParameters(_:)();
}

uint64_t sub_100771BA0()
{
  return dispatch thunk of AdAttributionManager.kickTimerOff()();
}

uint64_t sub_100771BB0()
{
  return AdAttributionManager.init(itemParameters:currentItem:clientBundleID:timerDelay:)();
}

uint64_t sub_100771BC0()
{
  return dispatch thunk of AdAttributionManager.processReengagement(forBundleID:payloadURL:)();
}

uint64_t sub_100771BD0()
{
  return dispatch thunk of AdAttributionManager.processReengagement(forAdamID:)();
}

uint64_t sub_100771BE0()
{
  return dispatch thunk of AdAttributionManager.killTimer()();
}

uint64_t sub_100771BF0()
{
  return type metadata accessor for AdAttributionManager();
}

uint64_t sub_100771C00()
{
  return AdTransparencyAction.adTransparencyData.getter();
}

uint64_t sub_100771C10()
{
  return static AppleAccountBranding.localizedString(_:)();
}

uint64_t sub_100771C20()
{
  return ArcadeWelcomeContent.familyAction.getter();
}

uint64_t sub_100771C30()
{
  return ArcadeWelcomeContent.continueAction.getter();
}

uint64_t sub_100771C40()
{
  return ArcadeWelcomeContent.items.getter();
}

uint64_t sub_100771C50()
{
  return ArcadeWelcomeContent.title.getter();
}

uint64_t sub_100771C60()
{
  return ArcadeWelcomeContent.subtitle.getter();
}

uint64_t sub_100771C70()
{
  return dispatch thunk of ArtworkModelProtocol.artwork.getter();
}

uint64_t sub_100771C80()
{
  return type metadata accessor for BoundsBasedPlaceable();
}

uint64_t sub_100771C90()
{
  return CancelPreorderAction.preorderAdamId.getter();
}

uint64_t sub_100771CA0()
{
  return CancelPreorderAction.isArcade.getter();
}

uint64_t sub_100771CB0()
{
  return type metadata accessor for CancelPreorderAction();
}

uint64_t sub_100771CC0()
{
  return dispatch thunk of ChartOrCategoryBrick.brickBadge.getter();
}

uint64_t sub_100771CD0()
{
  return dispatch thunk of ChartOrCategoryBrick.brickTitle.getter();
}

uint64_t sub_100771CE0()
{
  return dispatch thunk of ChartOrCategoryBrick.artworkSafeArea.getter();
}

uint64_t sub_100771CF0()
{
  return ComponentHeightCache.invalidate(items:)();
}

uint64_t sub_100771D00()
{
  return ComponentHeightCache.init()();
}

uint64_t sub_100771D10()
{
  return type metadata accessor for ComponentHeightCache();
}

uint64_t sub_100771D20()
{
  return DynamicUIRequestInfo.clientOptions.getter();
}

uint64_t sub_100771D30()
{
  return DynamicUIRequestInfo.metricsOverlay.getter();
}

uint64_t sub_100771D40()
{
  return DynamicUIRequestInfo.onDismissalAction.getter();
}

uint64_t sub_100771D50()
{
  return DynamicUIRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_100771D60()
{
  return DynamicUIRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_100771D70()
{
  return DynamicUIRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_100771D80()
{
  return DynamicUIRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_100771D90()
{
  return type metadata accessor for DynamicUIRequestInfo();
}

uint64_t sub_100771DA0()
{
  return EditorialQuoteLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100771DB0()
{
  return EditorialQuoteLayout.Metrics.init(quoteTopSpace:attributionTopSpace:horizontalMargin:bottomMargin:maxWidth:minHeight:alignment:)();
}

uint64_t sub_100771DC0()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics.Alignment();
}

uint64_t sub_100771DD0()
{
  return type metadata accessor for EditorialQuoteLayout.Metrics();
}

uint64_t sub_100771DE0()
{
  return EditorialQuoteLayout.init(metrics:quoteLabel:attributionLabel:)();
}

uint64_t sub_100771DF0()
{
  return type metadata accessor for EditorialQuoteLayout();
}

uint64_t sub_100771E00()
{
  return dispatch thunk of static ExactHeightProviding.height(in:asPartOf:)();
}

uint64_t sub_100771E10()
{
  return GenericPagePresenter.init(objectGraph:personalizationProvider:page:pageUrl:supportsFastImpressions:adLifecycleMetricReporter:)();
}

uint64_t sub_100771E20()
{
  return type metadata accessor for GenericPagePresenter();
}

uint64_t sub_100771E30()
{
  return InstallPageOfferMode.rawValue.getter();
}

uint64_t sub_100771E40()
{
  return LoadingPagePresenter.init(objectGraph:pageUrl:isIncomingURL:referrerData:)();
}

uint64_t sub_100771E50()
{
  return dispatch thunk of LoadingPagePresenter.view.setter();
}

uint64_t sub_100771E60()
{
  return type metadata accessor for LoadingPagePresenter();
}

uint64_t sub_100771E70()
{
  return dispatch thunk of MetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_100771E80()
{
  return dispatch thunk of MetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_100771E90()
{
  return dispatch thunk of MetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_100771EA0()
{
  return dispatch thunk of MetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_100771EB0()
{
  return dispatch thunk of MetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_100771EC0()
{
  return dispatch thunk of MetricsPagePresenter.referrer.getter();
}

uint64_t sub_100771ED0()
{
  return MetricsPagePresenter.observe(lifecycleEvent:)();
}

uint64_t sub_100771EE0()
{
  return MetricsTopicProvider.createEventDecorator()();
}

uint64_t sub_100771EF0()
{
  return MetricsTopicProvider.shouldHaveAnonymousEvents.getter();
}

uint64_t sub_100771F00()
{
  return MetricsTopicProvider.init(bag:)();
}

uint64_t sub_100771F10()
{
  return type metadata accessor for MetricsTopicProvider();
}

uint64_t sub_100771F20()
{
  return dispatch thunk of OfferButtonPresenter.offerDisplayProperties.getter();
}

uint64_t sub_100771F30()
{
  return dispatch thunk of OfferButtonPresenter.view.setter();
}

uint64_t sub_100771F40()
{
  return dispatch thunk of OfferButtonPresenter.update(ignoringCache:)();
}

uint64_t sub_100771F50()
{
  return type metadata accessor for PrivacyCategoryStyle();
}

uint64_t sub_100771F60()
{
  return ProductMediaMetadata.hasPortraitMedia.getter();
}

uint64_t sub_100771F70()
{
  return ProductMediaMetadata.hasPortraitPhoneMedia.getter();
}

uint64_t sub_100771F80()
{
  return ProductMediaMetadata.allPlatforms.getter();
}

uint64_t sub_100771F90()
{
  return ProductMediaMetadata.platformDescription.getter();
}

uint64_t sub_100771FA0()
{
  return ProductMediaMetadata.descriptionPlacement(when:)();
}

uint64_t sub_100771FB0()
{
  return ProductMediaMetadata.allPlatformsDescription.getter();
}

uint64_t sub_100771FC0()
{
  return ProductMediaMetadata.platform.getter();
}

uint64_t sub_100771FD0()
{
  return type metadata accessor for ProductMediaMetadata();
}

uint64_t sub_100771FE0()
{
  return ProductRatingsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100771FF0()
{
  return static ProductRatingsLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_100772000()
{
  return ProductRatingsLayout.Metrics.columnWidth.setter();
}

uint64_t sub_100772010()
{
  return ProductRatingsLayout.Metrics.columnMargin.setter();
}

uint64_t sub_100772020()
{
  return ProductRatingsLayout.Metrics.layoutMargins.setter();
}

uint64_t sub_100772030()
{
  return ProductRatingsLayout.Metrics.init(averageRatingTextSpace:compactDenominatorTextSpace:denominatorLeadingMargin:columnWidth:columnMargin:histogramLeadingMargin:progressBarMargin:histogramStarSpacing:histogramBarHeight:bottomSpace:layoutMargins:)();
}

uint64_t sub_100772040()
{
  return type metadata accessor for ProductRatingsLayout.Metrics();
}

uint64_t sub_100772050()
{
  return ProductRatingsLayout.init(metrics:averageRatingText:denominatorRatingText:ratingCountText:histogramStarViews:histogramRatingProgressViews:)();
}

uint64_t sub_100772060()
{
  return type metadata accessor for ProductRatingsLayout();
}

uint64_t sub_100772070()
{
  return PurchasesContentMode.displayTitle.getter();
}

uint64_t sub_100772080()
{
  return PurchasesContentMode.segmentIndex.getter();
}

uint64_t sub_100772090()
{
  return PurchasesContentMode.toggleIsHiddenText.getter();
}

uint64_t sub_1007720A0()
{
  return type metadata accessor for PurchasesContentMode();
}

uint64_t sub_1007720B0()
{
  return ReviewsPagePresenter.init(objectGraph:appStateController:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_1007720C0()
{
  return ReviewsPagePresenter.onPerformAction.getter();
}

uint64_t sub_1007720D0()
{
  return dispatch thunk of ReviewsPagePresenter.sortActionTitle(for:)();
}

uint64_t sub_1007720E0()
{
  return dispatch thunk of ReviewsPagePresenter.initialIndexPath.getter();
}

uint64_t sub_1007720F0()
{
  return dispatch thunk of ReviewsPagePresenter.performSortAction(sender:)();
}

uint64_t sub_100772100()
{
  return dispatch thunk of ReviewsPagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_100772110()
{
  return ReviewsPagePresenter.title.getter();
}

uint64_t sub_100772120()
{
  return type metadata accessor for ReviewsPagePresenter();
}

uint64_t sub_100772130()
{
  return SearchHintsPresenter.init(objectGraph:searchTextPresenter:searchGhostHintTracker:)();
}

uint64_t sub_100772140()
{
  return dispatch thunk of SearchHintsPresenter.resultCount.getter();
}

uint64_t sub_100772150()
{
  return dispatch thunk of SearchHintsPresenter.didSelectHint(at:)();
}

uint64_t sub_100772160()
{
  return dispatch thunk of SearchHintsPresenter.hint(at:)();
}

uint64_t sub_100772170()
{
  return dispatch thunk of SearchHintsPresenter.view.setter();
}

uint64_t sub_100772180()
{
  return type metadata accessor for SearchHintsPresenter();
}

uint64_t sub_100772190()
{
  return SearchResultsMessage.primaryText.getter();
}

uint64_t sub_1007721A0()
{
  return SearchResultsMessage.secondaryText.getter();
}

uint64_t sub_1007721B0()
{
  return type metadata accessor for ShelfBackgroundStyle();
}

uint64_t sub_1007721C0()
{
  return SmallStoryCardLayout.init(contentView:headingLabel:descriptionLabel:metrics:)();
}

uint64_t sub_1007721D0()
{
  return SmallStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007721E0()
{
  return static SmallStoryCardLayout.estimatedMeasurements(fitting:using:with:)();
}

uint64_t sub_1007721F0()
{
  return SmallStoryCardLayout.Metrics.init(contentAspectRatio:headingPrimarySpace:descriptionPrimarySpace:headingSecondarySpace:descriptionSecondarySpace:descriptionBottomSpace:descriptionNumberOfLines:headingNumberOfLines:)();
}

uint64_t sub_100772200()
{
  return SmallStoryCardLayout.Metrics.contentAspectRatio.getter();
}

uint64_t sub_100772210()
{
  return type metadata accessor for SmallStoryCardLayout.Metrics();
}

uint64_t sub_100772220()
{
  return type metadata accessor for SmallStoryCardLayout();
}

uint64_t sub_100772230()
{
  return type metadata accessor for TitledParagraphStyle();
}

uint64_t sub_100772240()
{
  return UpsellBreakoutLayout.measuredSize(fitting:in:)();
}

uint64_t sub_100772250()
{
  return UpsellBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100772260()
{
  return UpsellBreakoutLayout.Metrics.init(backgroundMediaAspectRatio:detailsWidth:actionButtonHeight:actionButtonMinWidth:actionButtonTopMargin:buttonDetailsSpace:layoutMargins:height:mediaSafeAreaHeight:)();
}

uint64_t sub_100772270()
{
  return type metadata accessor for UpsellBreakoutLayout.Metrics();
}

uint64_t sub_100772280()
{
  return UpsellBreakoutLayout.init(metrics:backgroundMediaView:detailsView:actionButton:buttonDetailsView:)();
}

uint64_t sub_100772290()
{
  return type metadata accessor for UpsellBreakoutLayout();
}

uint64_t sub_1007722A0()
{
  return type metadata accessor for VideoPlaybackFailure();
}

uint64_t sub_1007722B0()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.getter();
}

uint64_t sub_1007722C0()
{
  return dispatch thunk of AnyVideoViewProviding.someVideoView.setter();
}

uint64_t sub_1007722D0()
{
  return type metadata accessor for ArcadeIntroOfferState();
}

uint64_t sub_1007722E0()
{
  return type metadata accessor for ArcadeSeeAllGamesPage.DisplayStyle();
}

uint64_t sub_1007722F0()
{
  return type metadata accessor for ArcadeSeeAllGamesPage();
}

uint64_t sub_100772300()
{
  return BadgeContentKeyAdamId.getter();
}

uint64_t sub_100772310()
{
  return BadgeContentKeyRating.getter();
}

uint64_t sub_100772320()
{
  return static BadgeViewRibbonLayout.measurements(valueLabelWidth:viewSize:captionWidth:headingLabelWidth:fitting:using:in:)();
}

uint64_t sub_100772330()
{
  return BadgeViewRibbonLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100772340()
{
  return static BadgeViewRibbonLayout.estimatedHeight(fitting:using:with:)();
}

uint64_t sub_100772350()
{
  return BadgeViewRibbonLayout.Metrics.accessibleBadgeInsets.modify();
}

uint64_t sub_100772360()
{
  return BadgeViewRibbonLayout.Metrics.valueViewAlignment.setter();
}

uint64_t sub_100772370()
{
  return BadgeViewRibbonLayout.Metrics.regularBadgeInsets.modify();
}

uint64_t sub_100772380()
{
  return BadgeViewRibbonLayout.Metrics.spacingType.setter();
}

uint64_t sub_100772390()
{
  return BadgeViewRibbonLayout.Metrics.init(headingSpace:captionSpace:captionBottomSpace:badgeValueEditorsChoiceSpace:badgeValueIconSpace:badgeValueTextSpace:badgeValueBaselineOffset:badgeIconSize:valueBufferSpace:spacingType:captionCappingType:badgeType:isLabelLeading:valueViewAlignment:alignment:regularBadgeInsets:accessibleBadgeInsets:)();
}

uint64_t sub_1007723A0()
{
  return BadgeViewRibbonLayout.Metrics.badgeIconSize.getter();
}

uint64_t sub_1007723B0()
{
  return BadgeViewRibbonLayout.Metrics.isLabelLeading.setter();
}

uint64_t sub_1007723C0()
{
  return BadgeViewRibbonLayout.Metrics.captionCappingType.setter();
}

uint64_t sub_1007723D0()
{
  return BadgeViewRibbonLayout.Metrics.badgeValueBaselineOffset.setter();
}

uint64_t sub_1007723E0()
{
  return BadgeViewRibbonLayout.Metrics.alignment.setter();
}

uint64_t sub_1007723F0()
{
  return BadgeViewRibbonLayout.Metrics.badgeType.setter();
}

uint64_t sub_100772400()
{
  return type metadata accessor for BadgeViewRibbonLayout.Metrics();
}

uint64_t sub_100772410()
{
  return BadgeViewRibbonLayout.init(metrics:headingLabel:captionView:valueLabel:valueView:)();
}

uint64_t sub_100772420()
{
  return type metadata accessor for BadgeViewRibbonLayout();
}

uint64_t sub_100772430()
{
  return BreakoutDetailsLayout.measurements(fitting:in:)();
}

uint64_t sub_100772440()
{
  return BreakoutDetailsLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100772450()
{
  return type metadata accessor for BreakoutDetailsLayout.DetailDimension();
}

uint64_t sub_100772460()
{
  return BreakoutDetailsLayout.Metrics.init(titleSpace:titleBehavior:descriptionSpace:badgeTextSpace:badgeWordmarkSpace:callToActionSpace:layoutMargins:)();
}

uint64_t sub_100772470()
{
  return BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior.init(lineCountThreshold:standardUseCase:compressedUseCase:)();
}

uint64_t sub_100772480()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior.CompressionBehavior();
}

uint64_t sub_100772490()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics.TitleTextBehavior();
}

uint64_t sub_1007724A0()
{
  return type metadata accessor for BreakoutDetailsLayout.Metrics();
}

uint64_t sub_1007724B0()
{
  return BreakoutDetailsLayout.init(metrics:titleLabel:descriptionLabel:badgeText:badgeWordmark:callToActionButton:)();
}

uint64_t sub_1007724C0()
{
  return type metadata accessor for BreakoutDetailsLayout();
}

uint64_t sub_1007724D0()
{
  return CommerceDialogHandler.presentingViewController.getter();
}

uint64_t sub_1007724E0()
{
  return CommerceDialogHandler.isActive.setter();
}

uint64_t sub_1007724F0()
{
  return type metadata accessor for CommerceDialogHandler();
}

uint64_t sub_100772500()
{
  return CommerceDialogHandler.init(_:_:)();
}

uint64_t sub_100772510()
{
  return type metadata accessor for DiffablePagePresenter.UpdatePhase();
}

uint64_t sub_100772520()
{
  return dispatch thunk of DiffablePagePresenter.viewDidLoad()();
}

uint64_t sub_100772530()
{
  return dispatch thunk of DiffablePagePresenter.viewDidAppear()();
}

uint64_t sub_100772540()
{
  return dispatch thunk of DiffablePagePresenter.viewWillAppear()();
}

uint64_t sub_100772550()
{
  return dispatch thunk of DiffablePagePresenter.onApplySnapshot.getter();
}

uint64_t sub_100772560()
{
  return DiffablePagePresenter.onPerformAction.getter();
}

uint64_t sub_100772570()
{
  return dispatch thunk of DiffablePagePresenter.paginationState.getter();
}

uint64_t sub_100772580()
{
  return dispatch thunk of DiffablePagePresenter.viewDidDisappear()();
}

uint64_t sub_100772590()
{
  return dispatch thunk of DiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_1007725A0()
{
  return dispatch thunk of DiffablePagePresenter.appExitedWhileAppeared()();
}

uint64_t sub_1007725B0()
{
  return dispatch thunk of DiffablePagePresenter.appEnteredWhileAppeared()();
}

uint64_t sub_1007725C0()
{
  return DiffablePagePresenter.onPaginationStateChanged.getter();
}

uint64_t sub_1007725D0()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomeFullyVisible()();
}

uint64_t sub_1007725E0()
{
  return dispatch thunk of DiffablePagePresenter.viewWillBecomePartiallyVisible()();
}

uint64_t sub_1007725F0()
{
  return DiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_100772600()
{
  return EditorialSearchResult.clickAction.getter();
}

uint64_t sub_100772610()
{
  return EditorialSearchResult.iconArtwork.getter();
}

uint64_t sub_100772620()
{
  return EditorialSearchResult.editorialVideo.getter();
}

uint64_t sub_100772630()
{
  return EditorialSearchResult.artworkGridType.getter();
}

uint64_t sub_100772640()
{
  return dispatch thunk of EditorialSearchResult.typeDisplayText.getter();
}

uint64_t sub_100772650()
{
  return EditorialSearchResult.editorialArtwork.getter();
}

uint64_t sub_100772660()
{
  return EditorialSearchResult.collectionAdamIds.getter();
}

uint64_t sub_100772670()
{
  return EditorialSearchResult.mediaOverlayStyle.getter();
}

uint64_t sub_100772680()
{
  return EditorialSearchResult.appEventFormattedDates.getter();
}

uint64_t sub_100772690()
{
  return EditorialSearchResult.type.getter();
}

uint64_t sub_1007726A0()
{
  return EditorialSearchResult.title.getter();
}

uint64_t sub_1007726B0()
{
  return EditorialSearchResult.subtitle.getter();
}

uint64_t sub_1007726C0()
{
  return EditorialSearchResult.tintColor.getter();
}

uint64_t sub_1007726D0()
{
  return type metadata accessor for EditorialSearchResult();
}

uint64_t sub_1007726E0()
{
  return type metadata accessor for FlowAnimationBehavior();
}

uint64_t sub_1007726F0()
{
  return dispatch thunk of FlowPreviewActionable.flowPreviewActionsConfiguration.getter();
}

uint64_t sub_100772700()
{
  return GuidedSearchPresenter.didToggleToken(at:actionHandler:)();
}

uint64_t sub_100772710()
{
  return GuidedSearchPresenter.onTokensDidChange.getter();
}

uint64_t sub_100772720()
{
  return GuidedSearchPresenter.init()();
}

uint64_t sub_100772730()
{
  return type metadata accessor for GuidedSearchPresenter();
}

uint64_t sub_100772740()
{
  return HttpTemplateParameter.isRequired.getter();
}

uint64_t sub_100772750()
{
  return HttpTemplateParameter.maximumLength.getter();
}

uint64_t sub_100772760()
{
  return HttpTemplateParameter.key.getter();
}

uint64_t sub_100772770()
{
  return HttpTemplateParameter.title.getter();
}

uint64_t sub_100772780()
{
  return type metadata accessor for HttpTemplateParameter.InputType();
}

uint64_t sub_100772790()
{
  return HttpTemplateParameter.inputType.getter();
}

uint64_t sub_1007727A0()
{
  return type metadata accessor for HttpTemplateParameter();
}

uint64_t sub_1007727B0()
{
  return ImpressionableArtwork.impressionMetrics.getter();
}

uint64_t sub_1007727C0()
{
  return ImpressionableArtwork.art.getter();
}

uint64_t sub_1007727D0()
{
  return dispatch thunk of ImpressionableArtwork.artwork.getter();
}

uint64_t sub_1007727E0()
{
  return ImpressionsCalculator.childCalculator(for:viewBounds:)();
}

uint64_t sub_1007727F0()
{
  return ImpressionsCalculator.makeChildCalculator(for:)();
}

uint64_t sub_100772800()
{
  return ImpressionsCalculator.addElement(_:at:)();
}

uint64_t sub_100772810()
{
  return ImpressionsCalculator.viewBounds.setter();
}

uint64_t sub_100772820()
{
  return ImpressionsCalculator.removeElement(_:)();
}

void sub_100772830()
{
}

uint64_t sub_100772840()
{
  return ImpressionsCalculator.init(impressionableThreshold:tracker:)();
}

uint64_t sub_100772850()
{
  return ImpressionsCalculator.increaseImpressionableFrame(forElement:by:isContainer:)();
}

uint64_t sub_100772860()
{
  return ImpressionsCalculator.isVisible.setter();
}

uint64_t sub_100772870()
{
  return type metadata accessor for ImpressionsCalculator();
}

uint64_t sub_100772880()
{
  return OverlayViewController.init(overlayView:)();
}

uint64_t sub_100772890()
{
  return type metadata accessor for OverlayViewController();
}

uint64_t sub_1007728A0()
{
  return PrivacyCategoryLayout.measurements(fitting:in:)();
}

uint64_t sub_1007728B0()
{
  return PrivacyCategoryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007728C0()
{
  return PrivacyCategoryLayout.Metrics.titleTopSpace.setter();
}

uint64_t sub_1007728D0()
{
  return PrivacyCategoryLayout.Metrics.init(textLeadingMargin:titleTopSpace:iconHorizontalCenterMargin:iconSize:dataTypesTopSpace:dataTypesBottomSpace:bottomMargin:)();
}

uint64_t sub_1007728E0()
{
  return PrivacyCategoryLayout.Metrics.iconSize.getter();
}

uint64_t sub_1007728F0()
{
  return PrivacyCategoryLayout.Metrics.iconSize.setter();
}

uint64_t sub_100772900()
{
  return type metadata accessor for PrivacyCategoryLayout.Metrics();
}

uint64_t sub_100772910()
{
  return PrivacyCategoryLayout.init(metrics:iconView:titleLabel:dataTypesLabel:)();
}

uint64_t sub_100772920()
{
  return type metadata accessor for PrivacyCategoryLayout();
}

uint64_t sub_100772930()
{
  return ProgressConfiguration.init(metrics:progress:alignment:theme:isInstalling:)();
}

uint64_t sub_100772940()
{
  return type metadata accessor for ProgressConfiguration();
}

uint64_t sub_100772950()
{
  return static ReviewComposerUtility.lockupStyle(from:)();
}

uint64_t sub_100772960()
{
  return ShelfBasedProductPage.fullProductFetchedAction.getter();
}

uint64_t sub_100772970()
{
  return dispatch thunk of ShelfBasedProductPage.__allocating_init(from:)();
}

uint64_t sub_100772980()
{
  return ShelfBasedProductPage.init(from:)();
}

uint64_t sub_100772990()
{
  return type metadata accessor for ShelfBasedProductPage();
}

uint64_t sub_1007729A0()
{
  return type metadata accessor for SmallGameCenterPlayer();
}

uint64_t sub_1007729B0()
{
  return SponsoredSearchAdvert.init(instanceId:adamId:assetInformation:adData:cppIds:serverCppId:selectedCppId:appBinaryTraits:)();
}

uint64_t sub_1007729C0()
{
  return SponsoredSearchAdvert.instanceId.getter();
}

uint64_t sub_1007729D0()
{
  return SponsoredSearchAdvert.serverCppId.getter();
}

uint64_t sub_1007729E0()
{
  return SponsoredSearchAdvert.selectedCppId.getter();
}

uint64_t sub_1007729F0()
{
  return SponsoredSearchAdvert.appBinaryTraits.getter();
}

uint64_t sub_100772A00()
{
  return SponsoredSearchAdvert.adData.getter();
}

uint64_t sub_100772A10()
{
  return SponsoredSearchAdvert.adamId.getter();
}

uint64_t sub_100772A20()
{
  return SponsoredSearchAdvert.cppIds.getter();
}

uint64_t sub_100772A30()
{
  return type metadata accessor for SponsoredSearchAdvert();
}

uint64_t sub_100772A40()
{
  return static StringCharacteristics.accentedCharacters.getter();
}

uint64_t sub_100772A50()
{
  return static StringCharacteristics.extraTallCharacters.getter();
}

uint64_t sub_100772A60()
{
  return static StringCharacteristics.legacyExtraTallCharacters.getter();
}

uint64_t sub_100772A70()
{
  return static StringCharacteristics.longWords.getter();
}

uint64_t sub_100772A80()
{
  return type metadata accessor for StringCharacteristics();
}

uint64_t sub_100772A90()
{
  return TitleEffectFilterType.compositingFilter.getter();
}

uint64_t sub_100772AA0()
{
  return type metadata accessor for TitleEffectFilterType();
}

uint64_t sub_100772AB0()
{
  return static TitledParagraphLayout.isMultiColumn(compatibleWith:)();
}

uint64_t sub_100772AC0()
{
  return TitledParagraphLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100772AD0()
{
  return TitledParagraphLayout.Metrics.columnWidth.setter();
}

uint64_t sub_100772AE0()
{
  return TitledParagraphLayout.Metrics.columnMargin.setter();
}

uint64_t sub_100772AF0()
{
  return TitledParagraphLayout.Metrics.init(textSpace:bodyTopSpace:columnWidth:columnMargin:)();
}

uint64_t sub_100772B00()
{
  return type metadata accessor for TitledParagraphLayout.Metrics();
}

uint64_t sub_100772B10()
{
  return TitledParagraphLayout.init(metrics:allowsMultiColumn:primaryText:secondaryText:bodyText:)();
}

uint64_t sub_100772B20()
{
  return type metadata accessor for TitledParagraphLayout();
}

uint64_t sub_100772B30()
{
  return static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)();
}

uint64_t sub_100772B40()
{
  return AnnotationImagesLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100772B50()
{
  return AnnotationImagesLayout.init(views:metrics:)();
}

uint64_t sub_100772B60()
{
  return AnnotationImagesLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100772B70()
{
  return AnnotationImagesLayout.Metrics.init(horizontalSpacing:verticalSpacing:artworkSize:)();
}

uint64_t sub_100772B80()
{
  return type metadata accessor for AnnotationImagesLayout.Metrics();
}

uint64_t sub_100772B90()
{
  return type metadata accessor for AnnotationImagesLayout();
}

uint64_t sub_100772BA0()
{
  return ArcadeDownloadPackCard.numberOfPlaceholders.getter();
}

uint64_t sub_100772BB0()
{
  return ArcadeDownloadPackCard.lockups.getter();
}

uint64_t sub_100772BC0()
{
  return type metadata accessor for ArcadeDownloadPackCard();
}

uint64_t sub_100772BD0()
{
  return dispatch thunk of CellWithManagedArtwork.fetch(for:on:asPartOf:)();
}

uint64_t sub_100772BE0()
{
  return static ComponentLayoutBuilder.verticalLayoutHorizontalSubgroups(for:withItemHeights:useEstimatedHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_100772BF0()
{
  return static ComponentLayoutBuilder.verticalLayoutGroup(for:withItemHeights:in:itemSupplementaryProvider:asPartOf:)();
}

uint64_t sub_100772C00()
{
  return static ComponentLayoutBuilder.columnGroup(separatedBy:itemHeight:groupWidth:rowCount:)();
}

uint64_t sub_100772C10()
{
  return static ComponentLayoutOptions.overflowed.getter();
}

uint64_t sub_100772C20()
{
  return static ComponentLayoutOptions.hasBackground.getter();
}

uint64_t sub_100772C30()
{
  return static ComponentLayoutOptions.isFirstSection.getter();
}

uint64_t sub_100772C40()
{
  return static ComponentLayoutOptions.separatorHidden.getter();
}

uint64_t sub_100772C50()
{
  return static ComponentLayoutOptions.fixedHeightContainer.getter();
}

uint64_t sub_100772C60()
{
  return static ComponentLayoutOptions.showSupplementaryText.getter();
}

uint64_t sub_100772C70()
{
  return static ComponentLayoutOptions.isSingleVerticalColumn.getter();
}

uint64_t sub_100772C80()
{
  return ComponentLayoutOptions.init()();
}

uint64_t sub_100772C90()
{
  return type metadata accessor for ComponentLayoutOptions();
}

uint64_t sub_100772CA0()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(orthogonalScrollView:in:)();
}

uint64_t sub_100772CB0()
{
  return dispatch thunk of CompoundScrollObserver.didScroll(in:)();
}

uint64_t sub_100772CC0()
{
  return CompoundScrollObserver.removeChild(_:)();
}

uint64_t sub_100772CD0()
{
  return CompoundScrollObserver.addChild(_:)();
}

uint64_t sub_100772CE0()
{
  return CompoundScrollObserver.init(children:)();
}

uint64_t sub_100772CF0()
{
  return type metadata accessor for CompoundScrollObserver();
}

uint64_t sub_100772D00()
{
  return EngagementToggleAction.identifier.getter();
}

uint64_t sub_100772D10()
{
  return EngagementToggleAction.value.getter();
}

uint64_t sub_100772D20()
{
  return type metadata accessor for EngagementToggleAction();
}

uint64_t sub_100772D30()
{
  return FamilyCircleLookupTask.perform()();
}

uint64_t sub_100772D40()
{
  return FamilyCircleLookupTask.init()();
}

uint64_t sub_100772D50()
{
  return type metadata accessor for FamilyCircleLookupTask();
}

uint64_t sub_100772D60()
{
  return type metadata accessor for FamilyPurchasesSection();
}

uint64_t sub_100772D70()
{
  return FlowPreviewDestination.init(flowAction:sender:contentType:)();
}

uint64_t sub_100772D80()
{
  return FlowPreviewDestination.flowAction.getter();
}

uint64_t sub_100772D90()
{
  return type metadata accessor for FlowPreviewDestination.ContentType();
}

uint64_t sub_100772DA0()
{
  return FlowPreviewDestination.contentType.getter();
}

uint64_t sub_100772DB0()
{
  return FlowPreviewDestination.sender.getter();
}

uint64_t sub_100772DC0()
{
  return type metadata accessor for FlowPreviewDestination();
}

uint64_t sub_100772DD0()
{
  return GameCenterReengagement.badgeGlyph.getter();
}

uint64_t sub_100772DE0()
{
  return dispatch thunk of GameCenterReengagement.heroAction.getter();
}

uint64_t sub_100772DF0()
{
  return GameCenterReengagement.achievement.getter();
}

uint64_t sub_100772E00()
{
  return dispatch thunk of GameCenterReengagement.clickAction.getter();
}

uint64_t sub_100772E10()
{
  return GameCenterReengagement.backgroundColor.getter();
}

uint64_t sub_100772E20()
{
  return GameCenterReengagement.backgroundArtwork.getter();
}

uint64_t sub_100772E30()
{
  return GameCenterReengagement.badge.getter();
}

uint64_t sub_100772E40()
{
  return GameCenterReengagement.title.getter();
}

uint64_t sub_100772E50()
{
  return GameCenterReengagement.lockup.getter();
}

uint64_t sub_100772E60()
{
  return GameCenterReengagement.subtitle.getter();
}

uint64_t sub_100772E70()
{
  return type metadata accessor for GameCenterReengagement();
}

uint64_t sub_100772E80()
{
  return InfiniteScrollObserver.init(paginatedPresenter:triggerDistance:)();
}

uint64_t sub_100772E90()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionType();
}

uint64_t sub_100772EA0()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetType();
}

uint64_t sub_100772EB0()
{
  return type metadata accessor for MediaClickMetricsEvent.ActionContext();
}

uint64_t sub_100772EC0()
{
  return static MediaClickMetricsEvent.fillIn(template:targetType:targetId:actionType:actionContext:position:)();
}

uint64_t sub_100772ED0()
{
  return type metadata accessor for MediaClickMetricsEvent.TargetId();
}

uint64_t sub_100772EE0()
{
  return type metadata accessor for MetadataRibbonItemType();
}

uint64_t sub_100772EF0()
{
  return dispatch thunk of static MetadataRibbonItemView.measurements(for:fitting:in:)();
}

uint64_t sub_100772F00()
{
  return dispatch thunk of MetadataRibbonItemView.labelMaxWidth.setter();
}

uint64_t sub_100772F10()
{
  return dispatch thunk of MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_100772F20()
{
  return dispatch thunk of MetadataRibbonItemView.allowsTruncation.setter();
}

uint64_t sub_100772F30()
{
  return dispatch thunk of static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_100772F40()
{
  return dispatch thunk of MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_100772F50()
{
  return dispatch thunk of MetadataRibbonItemView.truncationLegibilityThreshold.setter();
}

uint64_t sub_100772F60()
{
  return dispatch thunk of MetadataRibbonItemView.id.setter();
}

uint64_t sub_100772F70()
{
  return dispatch thunk of static MetadataRibbonItemView.shouldForceIntrinsicSizeDuringLayout.getter();
}

uint64_t sub_100772F80()
{
  return dispatch thunk of MetadataRibbonItemView.apply(_:asPartOf:)();
}

uint64_t sub_100772F90()
{
  return dispatch thunk of MetadataRibbonItemView.itemType.setter();
}

uint64_t sub_100772FA0()
{
  return MetadataRibbonItemView.layoutContext.getter();
}

uint64_t sub_100772FB0()
{
  return static MetadataRibbonItemView.isBaselineAligned.getter();
}

uint64_t sub_100772FC0()
{
  return MetadataRibbonItemView.searchLayoutContext.getter();
}

uint64_t sub_100772FE0()
{
  return MetadataRibbonItemView.labelText.getter();
}

uint64_t sub_100772FF0()
{
  return dispatch thunk of MetricsReportableError.describeForMetricsEvent(using:)();
}

uint64_t sub_100773000()
{
  return dispatch thunk of MetricsReportableError.metricsErrorDescription.getter();
}

uint64_t sub_100773010()
{
  return type metadata accessor for MixedMediaLockupLayout.LockupPosition();
}

uint64_t sub_100773020()
{
  return MixedMediaLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773030()
{
  return MixedMediaLockupLayout.Metrics.init(lockupPosition:taglineNumberOfLines:taglineSpace:taglineFont:alwaysIncludeTaglineSpace:verticalSpacing:layoutMargins:)();
}

uint64_t sub_100773040()
{
  return MixedMediaLockupLayout.Metrics.alwaysIncludeTaglineSpace.getter();
}

uint64_t sub_100773050()
{
  return type metadata accessor for MixedMediaLockupLayout.Metrics();
}

uint64_t sub_100773060()
{
  return MixedMediaLockupLayout.init(metrics:lockupView:media:tagline:)();
}

uint64_t sub_100773070()
{
  return type metadata accessor for MixedMediaLockupLayout();
}

uint64_t sub_100773080()
{
  return dispatch thunk of OfferDisplayProperties.newOfferDisplayPropertiesChanging(titles:titleSymbolNames:subtitles:style:environment:tint:isDeletableSystemApp:isFree:isPreorder:offerLabelStyle:hasDiscount:contentRating:offerToken:subscriptionFamilyId:overrideLocale:useAdsLocale:priceFormatted:isStreamlinedBuy:appCapabilities:)();
}

uint64_t sub_100773090()
{
  return OfferDisplayProperties.isArcadeOffer.getter();
}

uint64_t sub_1007730A0()
{
  return OfferDisplayProperties.environment.getter();
}

uint64_t sub_1007730B0()
{
  return OfferDisplayProperties.offerLabelStyle.getter();
}

uint64_t sub_1007730C0()
{
  return OfferDisplayProperties.isStreamlinedBuy.getter();
}

uint64_t sub_1007730D0()
{
  return OfferDisplayProperties.subscriptionFamilyId.getter();
}

uint64_t sub_1007730E0()
{
  return OfferDisplayProperties.style.getter();
}

uint64_t sub_1007730F0()
{
  return OfferDisplayProperties.adamId.getter();
}

uint64_t sub_100773100()
{
  return OfferDisplayProperties.init(offerType:adamId:parentAdamId:titles:titleSymbolNames:subtitles:style:environment:tint:isDeletableSystemApp:isFree:isPreorder:offerLabelStyle:hasDiscount:contentRating:offerToken:subscriptionFamilyId:overrideLocale:useAdsLocale:priceFormatted:isStreamlinedBuy:appCapabilities:)();
}

uint64_t sub_100773110()
{
  return OfferDisplayProperties.offerType.getter();
}

uint64_t sub_100773120()
{
  return OfferDisplayProperties.subtitles.getter();
}

uint64_t sub_100773130()
{
  return type metadata accessor for OfferDisplayProperties();
}

uint64_t sub_100773140()
{
  return static PageRenderMetricsEvent.lastInteractionTime.setter();
}

uint64_t sub_100773150()
{
  return type metadata accessor for PageRenderMetricsEvent();
}

uint64_t sub_100773160()
{
  return type metadata accessor for PlaybackScrollObserver();
}

uint64_t sub_100773170()
{
  return PlaybackScrollObserver.init(_:)();
}

uint64_t sub_100773180()
{
  return ProductOfferButtonMode.isDisabled.getter();
}

uint64_t sub_100773190()
{
  return ProductOfferButtonMode.isHidden.getter();
}

uint64_t sub_1007731A0()
{
  return ProductReviewsMetadata.hasReviewSummary.getter();
}

uint64_t sub_1007731B0()
{
  return ProductReviewsMetadata.reviewSummaryTitle.getter();
}

uint64_t sub_1007731C0()
{
  return type metadata accessor for ProductReviewsMetadata();
}

uint64_t sub_1007731D0()
{
  return ReviewsContainerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007731E0()
{
  return ReviewsContainerLayout.Metrics.columnSpacer.setter();
}

uint64_t sub_1007731F0()
{
  return ReviewsContainerLayout.Metrics.marginInsets.setter();
}

uint64_t sub_100773200()
{
  return ReviewsContainerLayout.Metrics.init(ratingsBottomSpace:tapToRateTopSpace:tapToRateBottomSpace:reviewSummaryBottomSpace:reviewsShelfTopSpace:editorsChoiceTopSpace:columnSpacer:marginInsets:bottomEdgeSpace:)();
}

uint64_t sub_100773210()
{
  return type metadata accessor for ReviewsContainerLayout.Metrics();
}

uint64_t sub_100773220()
{
  return ReviewsContainerLayout.init(metrics:ratingsView:tapToRateView:actionsView:reviewSummaryView:reviewsShelf:editorsChoiceView:ratingsSeparatorView:)();
}

uint64_t sub_100773230()
{
  return type metadata accessor for ReviewsContainerLayout();
}

uint64_t sub_100773240()
{
  return SearchActionCalculator.searchAction(modifying:with:)();
}

uint64_t sub_100773250()
{
  return SearchActionCalculator.init(optimizationTermProviding:)();
}

uint64_t sub_100773260()
{
  return type metadata accessor for SearchActionCalculator();
}

uint64_t sub_100773270()
{
  return SearchLockupListLayout.Metrics.init(headingLeadingSpace:titleLeadingSpace:lockupCollectionViewTopSpace:layoutMargins:)();
}

uint64_t sub_100773280()
{
  return type metadata accessor for SearchLockupListLayout.Metrics();
}

uint64_t sub_100773290()
{
  return SearchLockupListLayout.init(metrics:iconHeadingView:titleHeadingView:lockupCollectionView:)();
}

uint64_t sub_1007732A0()
{
  return type metadata accessor for SearchLockupListLayout();
}

uint64_t sub_1007732B0()
{
  return dispatch thunk of SearchResultsPresenter.isCondensedSearchLockupsEnabled.getter();
}

uint64_t sub_1007732C0()
{
  return dispatch thunk of SearchResultsPresenter.shouldDisplayAppEvent(for:)();
}

uint64_t sub_1007732D0()
{
  return dispatch thunk of SearchResultsPresenter.didSelectResult(at:)();
}

uint64_t sub_1007732E0()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLink.getter();
}

uint64_t sub_1007732F0()
{
  return dispatch thunk of SearchResultsPresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_100773300()
{
  return dispatch thunk of SearchResultsPresenter.shouldResultHaveCondensedAppearance(at:in:)();
}

uint64_t sub_100773310()
{
  return dispatch thunk of SearchResultsPresenter.result(at:)();
}

uint64_t sub_100773320()
{
  return SponsoredSearchOrganic.assetInformation.getter();
}

uint64_t sub_100773330()
{
  return SponsoredSearchOrganic.adamId.getter();
}

uint64_t sub_100773340()
{
  return type metadata accessor for SponsoredSearchOrganic();
}

uint64_t sub_100773350()
{
  return TextConfigurationTheme.init(from:)();
}

uint64_t sub_100773360()
{
  return static TextConfigurationTheme.disabled.getter();
}

uint64_t sub_100773370()
{
  return type metadata accessor for TextConfigurationTheme();
}

uint64_t sub_100773380()
{
  return TodayCardActionOverlay.action.getter();
}

uint64_t sub_100773390()
{
  return type metadata accessor for TodayCardActionOverlay();
}

uint64_t sub_1007733A0()
{
  return TodayCardArtworkLayout.expandedLayoutInsets.getter();
}

uint64_t sub_1007733B0()
{
  return TodayCardArtworkLayout.collapsedLayoutInsets.getter();
}

uint64_t sub_1007733C0()
{
  return TodayCardArtworkLayout.expandedContentMode.getter();
}

uint64_t sub_1007733D0()
{
  return TodayCardArtworkLayout.collapsedContentMode.getter();
}

uint64_t sub_1007733E0()
{
  return type metadata accessor for TodayCardArtworkLayout();
}

uint64_t sub_1007733F0()
{
  return TodayCardLockupOverlay.displaysIcon.getter();
}

uint64_t sub_100773400()
{
  return TodayCardLockupOverlay.lockup.getter();
}

uint64_t sub_100773410()
{
  return type metadata accessor for TodayCardLockupOverlay();
}

uint64_t sub_100773420()
{
  return AutoScrollConfiguration.init(isAutoScrollEnabled:autoScrollInterval:autoScrollRestartDelay:)();
}

uint64_t sub_100773430()
{
  return AutoScrollConfiguration.isAutoScrollEnabled.getter();
}

uint64_t sub_100773440()
{
  return AutoScrollConfiguration.autoScrollRestartDelay.getter();
}

uint64_t sub_100773450()
{
  return AutoScrollConfiguration.autoScrollInterval.getter();
}

uint64_t sub_100773460()
{
  return type metadata accessor for AutoScrollConfiguration();
}

uint64_t sub_100773470()
{
  return type metadata accessor for BadgeCaptionCappingType();
}

uint64_t sub_100773480()
{
  return type metadata accessor for BadgeValueViewAlignment();
}

uint64_t sub_100773490()
{
  return dispatch thunk of ComponentModelContainer.children.getter();
}

uint64_t sub_1007734A0()
{
  return ComponentPrefetchSizing.contentMode.getter();
}

uint64_t sub_1007734B0()
{
  return ComponentPrefetchSizing.init(size:contentMode:)();
}

uint64_t sub_1007734C0()
{
  return ComponentPrefetchSizing.size.getter();
}

uint64_t sub_1007734D0()
{
  return type metadata accessor for ComponentPrefetchSizing();
}

uint64_t sub_1007734E0()
{
  return CrossfireReferralAction.referrerData.getter();
}

uint64_t sub_1007734F0()
{
  return type metadata accessor for CrossfireReferralAction();
}

uint64_t sub_100773500()
{
  return EditorialDisplayOptions.suppressLockup.getter();
}

uint64_t sub_100773510()
{
  return EditorialDisplayOptions.suppressTagline.getter();
}

uint64_t sub_100773520()
{
  return EditorialDisplayOptions.useMaterialBlur.getter();
}

uint64_t sub_100773530()
{
  return EditorialDisplayOptions.showBadgeInSmallCards.getter();
}

uint64_t sub_100773540()
{
  return type metadata accessor for EditorialDisplayOptions();
}

uint64_t sub_100773550()
{
  return FlowPresentationContext.presentationStyle.getter();
}

uint64_t sub_100773560()
{
  return type metadata accessor for FlowPresentationContext();
}

uint64_t sub_100773570()
{
  return HeroCarouselItemOverlay.OverlayType.displaysModuleGradient.getter();
}

uint64_t sub_100773580()
{
  return type metadata accessor for HeroCarouselItemOverlay.OverlayType();
}

uint64_t sub_100773590()
{
  return HeroCarouselItemOverlay.clickAction.getter();
}

uint64_t sub_1007735A0()
{
  return HeroCarouselItemOverlay.overlayType.getter();
}

uint64_t sub_1007735B0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.verticalStackAlignment.getter();
}

uint64_t sub_1007735C0()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextAlignment.textAlignment(with:)();
}

uint64_t sub_1007735D0()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextAlignment();
}

uint64_t sub_1007735E0()
{
  return HeroCarouselItemOverlay.DisplayOptions.init(textAlignment:horizontalPlacement:textColorOverrides:isOverDarkContent:)();
}

uint64_t sub_1007735F0()
{
  return HeroCarouselItemOverlay.DisplayOptions.textAlignment.getter();
}

uint64_t sub_100773600()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.descriptionColor.getter();
}

uint64_t sub_100773610()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.callToActionColor.getter();
}

uint64_t sub_100773620()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.badgeColor.getter();
}

uint64_t sub_100773630()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.titleColor.getter();
}

uint64_t sub_100773640()
{
  return HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides.init()();
}

uint64_t sub_100773650()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.TextColorOverrides();
}

uint64_t sub_100773660()
{
  return HeroCarouselItemOverlay.DisplayOptions.textColorOverrides.getter();
}

uint64_t sub_100773670()
{
  return HeroCarouselItemOverlay.DisplayOptions.horizontalPlacement.getter();
}

uint64_t sub_100773680()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.textAlignment(with:)();
}

uint64_t sub_100773690()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.verticalStackAlignment.getter();
}

uint64_t sub_1007736A0()
{
  return HeroCarouselItemOverlay.DisplayOptions.Placement.value(with:)();
}

uint64_t sub_1007736B0()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement();
}

uint64_t sub_1007736C0()
{
  return type metadata accessor for HeroCarouselItemOverlay.DisplayOptions();
}

uint64_t sub_1007736D0()
{
  return HeroCarouselItemOverlay.displayOptions.getter();
}

uint64_t sub_1007736E0()
{
  return HeroCarouselItemOverlay.collectionIcons.getter();
}

uint64_t sub_1007736F0()
{
  return HeroCarouselItemOverlay.descriptionText.getter();
}

uint64_t sub_100773700()
{
  return HeroCarouselItemOverlay.callToActionText.getter();
}

uint64_t sub_100773710()
{
  return HeroCarouselItemOverlay.impressionMetrics.getter();
}

uint64_t sub_100773720()
{
  return HeroCarouselItemOverlay.lockup.getter();
}

uint64_t sub_100773730()
{
  return HeroCarouselItemOverlay.badgeText.getter();
}

uint64_t sub_100773740()
{
  return HeroCarouselItemOverlay.titleText.getter();
}

uint64_t sub_100773750()
{
  return dispatch thunk of ItemBackgroundProviding.itemBackground.getter();
}

uint64_t sub_100773760()
{
  return LargeHeroBreakoutLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773770()
{
  return type metadata accessor for LargeHeroBreakoutLayout.DetailsVerticalPostion();
}

uint64_t sub_100773780()
{
  return LargeHeroBreakoutLayout.Metrics.init(headerSpace:headerMaxWidth:detailPosition:detailsWidth:detailsVerticalPostion:layoutMargins:height:)();
}

uint64_t sub_100773790()
{
  return type metadata accessor for LargeHeroBreakoutLayout.Metrics();
}

uint64_t sub_1007737A0()
{
  return LargeHeroBreakoutLayout.init(metrics:backgroundMediaView:headerLabel:detailsView:)();
}

uint64_t sub_1007737B0()
{
  return type metadata accessor for LargeHeroBreakoutLayout();
}

UIFont sub_1007737C0(UITraitCollection compatibleWith)
{
  return MetadataRibbonTextStyle.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_1007737D0()
{
  return static MetadataRibbonTextStyle.useCase(_:)();
}

uint64_t sub_1007737E0()
{
  return type metadata accessor for MetadataRibbonTextStyle();
}

uint64_t sub_1007737F0()
{
  return PrivacyDefinitionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773800()
{
  return PrivacyDefinitionLayout.Metrics.init(titleTopSpace:definitionTopSpace:bottomMargin:maxTextWidth:)();
}

uint64_t sub_100773810()
{
  return type metadata accessor for PrivacyDefinitionLayout.Metrics();
}

uint64_t sub_100773820()
{
  return PrivacyDefinitionLayout.init(metrics:titleLabel:definitionLabel:)();
}

uint64_t sub_100773830()
{
  return type metadata accessor for PrivacyDefinitionLayout();
}

uint64_t sub_100773840()
{
  return ProductAnnotationLayout.ItemLayout.measurements(fitting:in:)();
}

uint64_t sub_100773850()
{
  return ProductAnnotationLayout.ItemLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773860()
{
  return ProductAnnotationLayout.ItemLayout.Metrics.init(headingArtworkTopSpace:headingArtworkBottomSpace:textSpacing:listTextTopSpace:horizontalPairTextSpace:)();
}

uint64_t sub_100773870()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout.Metrics();
}

uint64_t sub_100773880()
{
  return ProductAnnotationLayout.ItemLayout.init(metrics:headingText:headingArtwork:text:listText:leadingTextPairs:trailingTextPairs:)();
}

uint64_t sub_100773890()
{
  return type metadata accessor for ProductAnnotationLayout.ItemLayout();
}

uint64_t sub_1007738A0()
{
  return ProductAnnotationLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007738B0()
{
  return static ProductAnnotationLayout.isSummaryPlacedBelow(in:)();
}

uint64_t sub_1007738C0()
{
  return ProductAnnotationLayout.Metrics.init(disclosureSize:disclosureContentInsets:disclosureMargin:titleSpace:detailSpace:detailMargin:linkSpace:bottomSpace:horizontalSpacing:shouldDisclosureAlignWithContent:)();
}

uint64_t sub_1007738D0()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.getter();
}

uint64_t sub_1007738E0()
{
  return ProductAnnotationLayout.Metrics.disclosureSize.setter();
}

uint64_t sub_1007738F0()
{
  return ProductAnnotationLayout.Metrics.horizontalSpacing.getter();
}

uint64_t sub_100773900()
{
  return type metadata accessor for ProductAnnotationLayout.Metrics();
}

uint64_t sub_100773910()
{
  return ProductAnnotationLayout.init(metrics:titleText:summaryText:detailViews:linkText:disclosureView:isExpanded:)();
}

uint64_t sub_100773920()
{
  return type metadata accessor for ProductAnnotationLayout();
}

uint64_t sub_100773930()
{
  return ProductCapabilityLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773940()
{
  return ProductCapabilityLayout.Metrics.init(iconSize:iconMargin:titleSpace:captionTopSpace:captionBottomSpace:bottomSpace:)();
}

uint64_t sub_100773950()
{
  return ProductCapabilityLayout.Metrics.iconSize.setter();
}

uint64_t sub_100773960()
{
  return type metadata accessor for ProductCapabilityLayout.Metrics();
}

uint64_t sub_100773970()
{
  return ProductCapabilityLayout.init(metrics:iconView:titleText:captionText:)();
}

uint64_t sub_100773980()
{
  return type metadata accessor for ProductCapabilityLayout();
}

uint64_t sub_100773990()
{
  return RedownloadConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_1007739A0()
{
  return type metadata accessor for RedownloadConfiguration();
}

uint64_t sub_1007739B0()
{
  return static RibbonBarItemCellLayout.interItemSpacing.getter();
}

uint64_t sub_1007739C0()
{
  return static RibbonBarItemCellLayout.topPadding.getter();
}

uint64_t sub_1007739D0()
{
  return static RibbonBarItemCellLayout.bottomPadding.getter();
}

uint64_t sub_1007739E0()
{
  return RibbonBarItemCellLayout.Metrics.init(artworkSize:interimSpacing:leadingSpacing:trailingSpacing:artworkBottomSpacing:artworkTopSpacing:labelBottomSpacing:labelTopSpacing:)();
}

uint64_t sub_1007739F0()
{
  return RibbonBarItemCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100773A00()
{
  return RibbonBarItemCellLayout.Metrics.trailingSpacing.getter();
}

uint64_t sub_100773A10()
{
  return type metadata accessor for RibbonBarItemCellLayout.Metrics();
}

uint64_t sub_100773A20()
{
  return RibbonBarItemCellLayout.init(metrics:artwork:titleLabel:)();
}

uint64_t sub_100773A30()
{
  return type metadata accessor for RibbonBarItemCellLayout();
}

uint64_t sub_100773A40()
{
  return ScreenshotsDisplayStyle.shouldShowScreenshots.getter();
}

uint64_t sub_100773A50()
{
  return type metadata accessor for ScreenshotsDisplayStyle();
}

uint64_t sub_100773A60()
{
  return ShareSheetNotesMetadata.url.getter();
}

uint64_t sub_100773A70()
{
  return ShareSheetNotesMetadata.category.getter();
}

uint64_t sub_100773A80()
{
  return ShareSheetNotesMetadata.fileSize.getter();
}

uint64_t sub_100773A90()
{
  return ShareSheetNotesMetadata.itemName.getter();
}

uint64_t sub_100773AA0()
{
  return ShareSheetNotesMetadata.developer.getter();
}

uint64_t sub_100773AB0()
{
  return ShareSheetNotesMetadata.mediaType.getter();
}

uint64_t sub_100773AC0()
{
  return SmallSearchLockupLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773AD0()
{
  return SmallSearchLockupLayout.Metrics.init(artworkSize:artworkMargin:headingSpace:titleRegularSpace:titleMediumSpace:titleShortSpace:titleWithHeadingSpace:subtitleSpace:tertiaryTitleSpace:offerTextSpace:metadataTextSpace:bottomSpace:offerButtonSize:offerButtonMargin:userRatingRightMargin:editorsChoiceMargin:adButtonRightMargin:descriptionSpace:regularWidthColumnSpacing:descriptionTopMargin:)();
}

uint64_t sub_100773AE0()
{
  return SmallSearchLockupLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100773AF0()
{
  return SmallSearchLockupLayout.Metrics.offerButtonSize.setter();
}

uint64_t sub_100773B00()
{
  return type metadata accessor for SmallSearchLockupLayout.Metrics();
}

uint64_t sub_100773B10()
{
  return SmallSearchLockupLayout.init(metrics:artworkView:headingText:titleText:subtitleText:tertiaryTitleText:offerText:offerButton:userRatingView:ratingCountLabel:editorsChoiceView:adButton:description:includesRatings:metadataRibbonView:searchTagsRibbonView:includesMetadataRibbon:includesSearchTagsRibbon:includesMetadataInformationInLockup:)();
}

uint64_t sub_100773B20()
{
  return type metadata accessor for SmallSearchLockupLayout();
}

uint64_t sub_100773B30()
{
  return TitledButtonStackLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773B40()
{
  return TitledButtonStackLayout.Metrics.init(buttonHeight:horizontalInterItemSpace:verticalInterItemSpace:maximumButtonWidth:)();
}

uint64_t sub_100773B50()
{
  return TitledButtonStackLayout.Metrics.buttonHeight.getter();
}

uint64_t sub_100773B60()
{
  return type metadata accessor for TitledButtonStackLayout.Metrics();
}

uint64_t sub_100773B70()
{
  return TitledButtonStackLayout.init(metrics:items:lineBreaks:)();
}

uint64_t sub_100773B80()
{
  return type metadata accessor for TitledButtonStackLayout();
}

uint64_t sub_100773B90()
{
  return static VerticalFlexStackLayout.estimatedChildFitCount(in:metrics:)();
}

uint64_t sub_100773BA0()
{
  return VerticalFlexStackLayout.place(at:with:)();
}

uint64_t sub_100773BB0()
{
  return VerticalFlexStackLayout.Metrics.init(fixedChildHeight:minInterChildSpacing:maxInterChildSpacing:layoutMargins:)();
}

uint64_t sub_100773BC0()
{
  return type metadata accessor for VerticalFlexStackLayout.Metrics();
}

uint64_t sub_100773BD0()
{
  return VerticalFlexStackLayout.init(metrics:children:)();
}

uint64_t sub_100773BE0()
{
  return type metadata accessor for VerticalFlexStackLayout();
}

uint64_t sub_100773BF0()
{
  return tryToCancelArtworkFetch(into:on:asPartOf:deprioritizingFetches:)();
}

uint64_t sub_100773C00()
{
  return AccessibilityConditional.init(value:ax1To3Value:ax4To5Value:)();
}

uint64_t sub_100773C10()
{
  return AccessibilityConditional.value(for:)();
}

uint64_t sub_100773C20()
{
  return AccessibilityConditional.value(with:)();
}

uint64_t sub_100773C30()
{
  return AccessibilityConditional.init(value:axValue:)();
}

uint64_t sub_100773C40()
{
  return type metadata accessor for AccessibilityConditional();
}

uint64_t sub_100773C50()
{
  return AchievementSummaryLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773C60()
{
  return static AchievementSummaryLayout.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_100773C70()
{
  return AchievementSummaryLayout.Metrics.init(achievementStackInsets:outOfTotalLeadingMargin:chevronLeadingMargin:chevronTrailingMargin:componentHeight:)();
}

uint64_t sub_100773C80()
{
  return AchievementSummaryLayout.Metrics.achievementStackInsets.setter();
}

uint64_t sub_100773C90()
{
  return type metadata accessor for AchievementSummaryLayout.Metrics();
}

uint64_t sub_100773CA0()
{
  return AchievementSummaryLayout.init(metrics:achievementGroupView:numberCompletedLabel:outOfTotalLabel:completedLabel:chevronView:)();
}

uint64_t sub_100773CB0()
{
  return type metadata accessor for AchievementSummaryLayout();
}

uint64_t sub_100773CC0()
{
  return dispatch thunk of AdvertRotationController.didInteractWithAdvert()();
}

uint64_t sub_100773CD0()
{
  return dispatch thunk of AdvertRotationController.currentAdvert.getter();
}

uint64_t sub_100773CE0()
{
  return dispatch thunk of AdvertRotationController.didApplyCell(_:in:)();
}

uint64_t sub_100773CF0()
{
  return dispatch thunk of AdvertRotationController.didEndDisplaying(_:in:)();
}

uint64_t sub_100773D00()
{
  return ArcadeSubscribePresenter.init(objectGraph:subscriptionManager:url:sidepack:)();
}

uint64_t sub_100773D10()
{
  return ArcadeSubscribePresenter.isAskToBuyRequest.getter();
}

uint64_t sub_100773D20()
{
  return ArcadeSubscribePresenter.view.setter();
}

void sub_100773D30()
{
}

uint64_t sub_100773D40()
{
  return type metadata accessor for ArcadeSubscribePresenter();
}

uint64_t sub_100773D50()
{
  return type metadata accessor for ArcadeTrialEnrolledState();
}

void sub_100773D60()
{
}

uint64_t sub_100773D80()
{
  return dispatch thunk of BaseGenericPagePresenter.uber.getter();
}

uint64_t sub_100773D90()
{
  return dispatch thunk of BaseGenericPagePresenter.view.setter();
}

uint64_t sub_100773DA0()
{
  return dispatch thunk of BaseGenericPagePresenter.pageTitle.getter();
}

uint64_t sub_100773DB0()
{
  return type metadata accessor for DirectionalTextAlignment();
}

uint64_t sub_100773DC0()
{
  return EditorialStoryCardLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100773DD0()
{
  return EditorialStoryCardLayout.Metrics.init(headerSpace:titleSpace:descriptionSpace:layoutMargins:)();
}

uint64_t sub_100773DE0()
{
  return type metadata accessor for EditorialStoryCardLayout.Metrics();
}

uint64_t sub_100773DF0()
{
  return EditorialStoryCardLayout.init(metrics:artworkView:headerLabel:titleLabel:descriptionLabel:)();
}

uint64_t sub_100773E00()
{
  return type metadata accessor for EditorialStoryCardLayout();
}

uint64_t sub_100773E10()
{
  return dispatch thunk of static EstimatedHeightProviding.estimatedHeight(in:asPartOf:)();
}

uint64_t sub_100773E20()
{
  return type metadata accessor for FamilyCircleLookupResult();
}

uint64_t sub_100773E30()
{
  return dispatch thunk of FamilyPurchasesPresenter.familyPurchasesSection(for:)();
}

uint64_t sub_100773E40()
{
  return dispatch thunk of FamilyPurchasesPresenter.imageForFamilyMember(at:)();
}

uint64_t sub_100773E50()
{
  return FamilyPurchasesPresenter.init(objectGraph:familyPurchasesError:iCloudMemberAppleId:bag:)();
}

uint64_t sub_100773E60()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfRows(in:)();
}

uint64_t sub_100773E70()
{
  return dispatch thunk of FamilyPurchasesPresenter.didSelectItem(at:)();
}

uint64_t sub_100773E80()
{
  return dispatch thunk of FamilyPurchasesPresenter.numberOfSections.getter();
}

uint64_t sub_100773E90()
{
  return dispatch thunk of FamilyPurchasesPresenter.errorBannerLinkableText.getter();
}

uint64_t sub_100773EA0()
{
  return dispatch thunk of FamilyPurchasesPresenter.view.setter();
}

uint64_t sub_100773EB0()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forSection:)();
}

uint64_t sub_100773EC0()
{
  return dispatch thunk of FamilyPurchasesPresenter.title(forItemAt:)();
}

uint64_t sub_100773ED0()
{
  return dispatch thunk of FamilyPurchasesPresenter.pageTitle.getter();
}

uint64_t sub_100773EE0()
{
  return type metadata accessor for FamilyPurchasesPresenter();
}

uint64_t sub_100773EF0()
{
  return dispatch thunk of FlowPreviewablePresenter.actionPresenterView.getter();
}

uint64_t sub_100773F00()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewBackgroundColor(at:)();
}

uint64_t sub_100773F10()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewDestinationForItem(at:)();
}

uint64_t sub_100773F20()
{
  return dispatch thunk of FlowPreviewablePresenter.flowPreviewActionsConfiguration(at:sender:)();
}

uint64_t sub_100773F30()
{
  return MSODiffablePagePresenter.init(objectGraph:personalizationProvider:pageUrl:context:)();
}

uint64_t sub_100773F40()
{
  return type metadata accessor for MSODiffablePagePresenter();
}

uint64_t sub_100773F50()
{
  return MarketingItemRequestInfo.offerHints.getter();
}

uint64_t sub_100773F60()
{
  return MarketingItemRequestInfo.serviceType.getter();
}

uint64_t sub_100773F70()
{
  return MarketingItemRequestInfo.clientOptions.getter();
}

uint64_t sub_100773F80()
{
  return MarketingItemRequestInfo.metricsOverlay.getter();
}

uint64_t sub_100773F90()
{
  return MarketingItemRequestInfo.onDismissalAction.getter();
}

uint64_t sub_100773FA0()
{
  return MarketingItemRequestInfo.purchaseFailureAction.getter();
}

uint64_t sub_100773FB0()
{
  return MarketingItemRequestInfo.purchaseSuccessAction.getter();
}

uint64_t sub_100773FC0()
{
  return MarketingItemRequestInfo.carrierLinkFailureAction.getter();
}

uint64_t sub_100773FD0()
{
  return MarketingItemRequestInfo.carrierLinkSuccessAction.getter();
}

uint64_t sub_100773FE0()
{
  return MarketingItemRequestInfo.seed.getter();
}

uint64_t sub_100773FF0()
{
  return MarketingItemRequestInfo.placement.getter();
}

uint64_t sub_100774000()
{
  return type metadata accessor for MarketingItemRequestInfo();
}

uint64_t sub_100774010()
{
  return MetadataRibbonViewLayout.init(metadataRibbonItemLayoutContexts:metrics:)();
}

uint64_t sub_100774020()
{
  return MetadataRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100774030()
{
  return MetadataRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100774040()
{
  return MetadataRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t _s20ProductPageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0()
{
  return static MetadataRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_100774060()
{
  return type metadata accessor for MetadataRibbonViewLayout.Metrics();
}

uint64_t sub_100774070()
{
  return type metadata accessor for MetadataRibbonViewLayout();
}

uint64_t sub_100774080()
{
  return dispatch thunk of OfferButtonConfiguration.shouldReapply(sizeChanged:)();
}

uint64_t sub_100774090()
{
  return dispatch thunk of OfferButtonConfiguration.disableAnimations(whenUpdatingFrom:)();
}

uint64_t sub_1007740A0()
{
  return dispatch thunk of OfferButtonConfiguration.size(in:)();
}

uint64_t sub_1007740B0()
{
  return dispatch thunk of OfferButtonConfiguration.apply<A>(to:)();
}

uint64_t sub_1007740C0()
{
  return dispatch thunk of OfferButtonConfiguration.layout<A>(button:in:disableAnimations:)();
}

uint64_t sub_1007740D0()
{
  return dispatch thunk of OfferButtonConfiguration.isEqual(to:with:)();
}

uint64_t sub_1007740E0()
{
  return dispatch thunk of OfferButtonConfiguration.reapply<A>(colorsTo:)();
}

uint64_t sub_1007740F0()
{
  return dispatch thunk of OfferButtonConfiguration.unapply<A>(to:)();
}

uint64_t sub_100774100()
{
  return static PageFacetsFieldsProvider.metricsPipelineWithPageFacetsProvider(using:currentPipeline:)();
}

uint64_t sub_100774110()
{
  return PreorderDisclaimerLayout.init(disclaimer:)();
}

uint64_t sub_100774120()
{
  return PreorderDisclaimerLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100774130()
{
  return type metadata accessor for PreorderDisclaimerLayout();
}

uint64_t sub_100774140()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.measurements(fitting:in:)();
}

uint64_t sub_100774150()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100774160()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.Metrics.init(primaryTextSpace:secondaryTextSpace:disclosureMargin:disclosureSize:)();
}

uint64_t sub_100774170()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout.Metrics();
}

uint64_t sub_100774180()
{
  return ProductDescriptionLayout.DeveloperLinkLayout.init(metrics:primaryText:secondaryText:disclosureView:)();
}

uint64_t sub_100774190()
{
  return type metadata accessor for ProductDescriptionLayout.DeveloperLinkLayout();
}

uint64_t sub_1007741A0()
{
  return ProductDescriptionLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007741B0()
{
  return ProductDescriptionLayout.Metrics.init(topPadding:developerTopPadding:horizontalTextPadding:horizontalDeveloperSpace:)();
}

uint64_t sub_1007741C0()
{
  return type metadata accessor for ProductDescriptionLayout.Metrics();
}

uint64_t sub_1007741D0()
{
  return ProductDescriptionLayout.init(metrics:bodyText:developerLink:)();
}

uint64_t sub_1007741E0()
{
  return type metadata accessor for ProductDescriptionLayout();
}

uint64_t sub_1007741F0()
{
  return ProductNavigationBarMode.rawValue.getter();
}

uint64_t sub_100774200()
{
  return ProductPageIconDimension.rawValue.getter();
}

uint64_t sub_100774210()
{
  return type metadata accessor for ProductPageIconDimension();
}

uint64_t sub_100774220()
{
  return ReusableCellRegistration.init(reuseIdentifier:configurationHandler:)();
}

uint64_t sub_100774230()
{
  return SearchResultsContextCard.action.getter();
}

uint64_t sub_100774240()
{
  return SearchResultsContextCard.message.getter();
}

uint64_t sub_100774250()
{
  return type metadata accessor for SearchResultsContextCard();
}

uint64_t sub_100774260()
{
  return dispatch thunk of ShelfBackgroundProviding.shelfBackground.getter();
}

uint64_t sub_100774270()
{
  return UnifiedTabBadgingManager.didVisit(_:)();
}

uint64_t sub_100774280()
{
  return type metadata accessor for UnifiedTabBadgingManager();
}

uint64_t sub_100774290()
{
  return static UserNotificationsManager.userNotificationsDidChangeNotification.getter();
}

uint64_t sub_1007742A0()
{
  return UserNotificationsManager.init(objectGraph:rootViewController:)();
}

uint64_t sub_1007742B0()
{
  return static UserNotificationsManager.appEventIdKey.getter();
}

uint64_t sub_1007742C0()
{
  return static UserNotificationsManager.sourceViewKey.getter();
}

uint64_t sub_1007742D0()
{
  return UserNotificationsManager.getIsAuthorized()();
}

uint64_t sub_1007742E0()
{
  return type metadata accessor for UserNotificationsManager.SchedulingResult();
}

uint64_t sub_1007742F0()
{
  return UserNotificationsManager.scheduleNotification(with:from:)();
}

uint64_t sub_100774300()
{
  return UserNotificationsManager.hasScheduledNotification(with:)();
}

uint64_t sub_100774310()
{
  return UserNotificationsManager.cancelScheduledNotification(with:from:)();
}

uint64_t sub_100774320()
{
  return type metadata accessor for UserNotificationsManager();
}

uint64_t sub_100774330()
{
  return dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo()();
}

uint64_t sub_100774340()
{
  return dispatch thunk of VideoPlaybackCoordinator.startAutoPlayVideo()();
}

uint64_t sub_100774350()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregisterAllVideoViews()();
}

uint64_t sub_100774360()
{
  return dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo()();
}

uint64_t sub_100774370()
{
  return dispatch thunk of VideoPlaybackCoordinator.shouldLoopSingleVideo.setter();
}

uint64_t sub_100774380()
{
  return dispatch thunk of VideoPlaybackCoordinator.unregister(videoView:videoContainer:pausingPlayback:)();
}

uint64_t sub_100774390()
{
  return dispatch thunk of VideoPlaybackCoordinator.isAutoPlayEnabled.setter();
}

uint64_t sub_1007743A0()
{
  return VideoPlaybackCoordinator.init(isGlobalAutoPlayEnabled:metricsPipeline:)();
}

uint64_t sub_1007743B0()
{
  return dispatch thunk of VideoPlaybackCoordinator.setParentViewController(_:)();
}

uint64_t sub_1007743C0()
{
  return dispatch thunk of VideoPlaybackCoordinator.register(videoView:videoContainer:)();
}

uint64_t sub_1007743D0()
{
  return dispatch thunk of VideoPlaybackCoordinator.isPlaying(in:)();
}

uint64_t sub_1007743E0()
{
  return type metadata accessor for VideoPlaybackCoordinator();
}

uint64_t sub_1007743F0(Swift::String _, Swift::Int count, Swift::String comment)
{
  return localizedStringWithCount(_:count:comment:)(_, count, comment)._countAndFlagsBits;
}

void sub_100774400()
{
}

uint64_t sub_100774410()
{
  return ArcadeDownloadPackStorage.init()();
}

uint64_t sub_100774420()
{
  return type metadata accessor for ArcadeDownloadPackStorage();
}

uint64_t sub_100774430()
{
  return ArcadeOfferLabelPresenter.init(subscribedText:nonsubscribedText:subscriptionManager:)();
}

uint64_t sub_100774440()
{
  return ArcadeOfferLabelPresenter.view.setter();
}

uint64_t sub_100774450()
{
  return type metadata accessor for ArcadeOfferLabelPresenter();
}

uint64_t sub_100774460()
{
  return ArcadeSubscribePageIntent.init(url:)();
}

uint64_t sub_100774470()
{
  return type metadata accessor for ArcadeSubscribePageIntent();
}

uint64_t sub_100774480()
{
  return ArcadeSubscriptionManager.addSubscriptionStateObserver(_:action:)();
}

uint64_t sub_100774490()
{
  return ArcadeSubscriptionManager.setSubscriptionState(_:notifyingObservers:)();
}

uint64_t sub_1007744A0()
{
  return ArcadeSubscriptionManager.init(arcadeSubscriptionFamilyId:subscriptionEntitlements:activeStoreAccountProvider:)();
}

uint64_t sub_1007744B0()
{
  return ArcadeSubscriptionManager.removeSubscriptionStateActions(for:)();
}

uint64_t sub_1007744C0()
{
  return ArcadeSubscriptionManager.purchaseSubscription(product:appAdamId:decorator:callbacks:dialogHandler:)();
}

uint64_t sub_1007744D0()
{
  return ArcadeSubscriptionManager.PaymentCallbacks.init(success:failure:)();
}

uint64_t sub_1007744E0()
{
  return type metadata accessor for ArcadeSubscriptionManager.PaymentCallbacks();
}

uint64_t sub_1007744F0()
{
  return ArcadeSubscriptionManager.subscriptionState.getter();
}

uint64_t sub_100774500()
{
  return ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)();
}

uint64_t sub_100774510()
{
  return type metadata accessor for ArcadeSubscriptionManager();
}

uint64_t sub_100774520()
{
  return CappedSizeStaticDimension.init(constant:source:maxSizeCategory:)();
}

uint64_t sub_100774530()
{
  return type metadata accessor for CappedSizeStaticDimension();
}

uint64_t sub_100774540()
{
  return static ChartOrCategoryBrickStyle.tileMetrics.getter();
}

uint64_t sub_100774550()
{
  return type metadata accessor for ChartOrCategoryBrickStyle();
}

uint64_t sub_100774560()
{
  return dispatch thunk of ComponentModelContainment.contentType(for:)();
}

uint64_t sub_100774570()
{
  return dispatch thunk of ComponentModelContainment.numberOfItems.getter();
}

uint64_t sub_100774580()
{
  return dispatch thunk of ComponentModelContainment.model(at:)();
}

uint64_t sub_100774590()
{
  return ContingentOfferDetailPage.contingentOffer.getter();
}

uint64_t sub_1007745A0()
{
  return ContingentOfferDetailPage.mediaOverlayStyle.getter();
}

uint64_t sub_1007745B0()
{
  return ContingentOfferDetailPage.learnMoreActionMetrics.getter();
}

uint64_t sub_1007745C0()
{
  return ContingentOfferDetailPage.backButtonActionMetrics.getter();
}

uint64_t sub_1007745D0()
{
  return ContingentOfferDetailPage.includeBorderInDarkMode.getter();
}

uint64_t sub_1007745E0()
{
  return ContingentOfferDetailPage.closeButtonActionMetrics.getter();
}

uint64_t sub_1007745F0()
{
  return ContingentOfferDetailPage.video.getter();
}

uint64_t sub_100774600()
{
  return ContingentOfferDetailPage.artwork.getter();
}

uint64_t sub_100774610()
{
  return type metadata accessor for ContingentOfferDetailPage();
}

uint64_t sub_100774620()
{
  return CreateCalendarEventAction.notAuthorizedAction.getter();
}

void sub_100774630()
{
}

uint64_t sub_100774640()
{
  return DebugMetricsEventRecorder.$events.getter();
}

uint64_t sub_100774650()
{
  return type metadata accessor for DebugMetricsEventRecorder();
}

uint64_t sub_100774660()
{
  return type metadata accessor for EditorialSearchResultType();
}

uint64_t sub_100774670()
{
  return FlowPreviewOfferPresenter.offerTitles.getter();
}

uint64_t sub_100774680()
{
  return FlowPreviewOfferPresenter.performAction(in:)();
}

uint64_t sub_100774690()
{
  return FlowPreviewOfferPresenter.init(displayProperties:offerAction:asPartOf:)();
}

uint64_t sub_1007746A0()
{
  return type metadata accessor for FlowPreviewOfferPresenter();
}

uint64_t sub_1007746B0()
{
  return type metadata accessor for HorizontalAlignmentLayout.HorizontalGravity();
}

uint64_t sub_1007746C0()
{
  return static HorizontalAlignmentLayout.SizingPolicy.policy(priority:constrainedTo:)();
}

uint64_t sub_1007746D0()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy.Priority();
}

uint64_t sub_1007746E0()
{
  return type metadata accessor for HorizontalAlignmentLayout.SizingPolicy();
}

uint64_t sub_1007746F0()
{
  return static HorizontalAlignmentLayout.VerticalAnchor.anchor(child:at:)();
}

uint64_t sub_100774700()
{
  return type metadata accessor for HorizontalAlignmentLayout.VerticalAnchor();
}

uint64_t sub_100774710()
{
  return type metadata accessor for HorizontalAlignmentLayout.ChildSourceOffset();
}

uint64_t sub_100774720()
{
  return type metadata accessor for HorizontalAlignmentLayout.ContainerDestinationOffset();
}

uint64_t sub_100774730()
{
  return static HorizontalAlignmentLayout.Child.child(view:leadingSpace:trailingSpace:verticalAnchor:horizontalGravity:sizingPolicy:)();
}

uint64_t sub_100774740()
{
  return type metadata accessor for HorizontalAlignmentLayout.Child();
}

uint64_t sub_100774750()
{
  return HorizontalAlignmentLayout.init(children:)();
}

uint64_t sub_100774760()
{
  return type metadata accessor for HorizontalAlignmentLayout();
}

uint64_t sub_100774770()
{
  return HttpTemplateSubstitutions.setParameter(value:for:)();
}

uint64_t sub_100774780()
{
  return HttpTemplateSubstitutions.init(urlQuery:headers:jsonBody:formBody:)();
}

uint64_t sub_100774790()
{
  return type metadata accessor for HttpTemplateSubstitutions();
}

void sub_1007747A0(UIScrollView in)
{
}

uint64_t sub_1007747B0()
{
  return ImpressionsScrollObserver.collectionView.setter();
}

uint64_t sub_1007747C0()
{
  return type metadata accessor for ImpressionsScrollObserver();
}

uint64_t sub_1007747D0()
{
  return ImpressionsScrollObserver.init(_:)();
}

uint64_t sub_1007747E0()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryItems(for:asPartOf:)();
}

uint64_t sub_1007747F0()
{
  return dispatch thunk of ItemSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_100774800()
{
  return dispatch thunk of ManagedVideoViewProviding.registerVideos(with:)();
}

uint64_t sub_100774810()
{
  return dispatch thunk of ManagedVideoViewProviding.unregisterVideos(with:)();
}

uint64_t sub_100774820()
{
  return dispatch thunk of NestedShelfClickableModel.click(for:)();
}

uint64_t sub_100774830()
{
  return type metadata accessor for OnDeviceAdFetchFailReason();
}

uint64_t sub_100774840()
{
  return type metadata accessor for ProductPageScrollPosition();
}

uint64_t sub_100774850()
{
  return ProductReviewCustomLayout.Metrics.init(horizontalContentPadding:verticalContentPadding:ratingsTopSpace:dateAuthorLeadingPadding:dateAuthorTopPadding:ratingsAccessibilityTopPadding:dateAccessibilityTopPadding:bodyTopPadding:responseTitleTopPadding:responseTitleAccessibilityTopPadding:responseDateAccessibilityTopPadding:responseBodyTopPadding:)();
}

uint64_t sub_100774860()
{
  return ProductReviewCustomLayout.Metrics.horizontalContentPadding.setter();
}

uint64_t sub_100774870()
{
  return type metadata accessor for ProductReviewCustomLayout.Metrics();
}

uint64_t sub_100774880()
{
  return ProductReviewCustomLayout.init(metrics:titleLabel:dateLabel:authorLabel:dateAuthorLabel:bodyLabel:responseTitleLabel:responseDateLabel:responseBodyLabel:hasResponse:ratingsView:)();
}

uint64_t sub_100774890()
{
  return type metadata accessor for ProductReviewCustomLayout();
}

uint64_t sub_1007748A0()
{
  return dispatch thunk of PurchasableTodayCardMedia.offerAdamIds.getter();
}

uint64_t sub_1007748B0()
{
  return PurchasesContentPresenter.canHidePurchases.getter();
}

uint64_t sub_1007748C0()
{
  return PurchasesContentPresenter.purchasesContentModes.getter();
}

uint64_t sub_1007748D0()
{
  return PurchasesContentPresenter.init(objectGraph:accountStore:appStateController:familyMember:purchaseHistory:showMacOSCompatibleIOSApps:appleSilicon:)();
}

uint64_t sub_1007748E0()
{
  return PurchasesContentPresenter.hidePurchase(at:)();
}

uint64_t sub_1007748F0()
{
  return PurchasesContentPresenter.sectionCount.getter();
}

uint64_t sub_100774900()
{
  return PurchasesContentPresenter.unhidePurchase(at:)();
}

uint64_t sub_100774910()
{
  return PurchasesContentPresenter.mode.getter();
}

uint64_t sub_100774920()
{
  return PurchasesContentPresenter.mode.setter();
}

uint64_t sub_100774930()
{
  return PurchasesContentPresenter.term.setter();
}

uint64_t sub_100774940()
{
  return PurchasesContentPresenter.view.setter();
}

void sub_100774950()
{
}

uint64_t sub_100774960()
{
  return PurchasesContentPresenter.pageTitle.getter();
}

void sub_100774970()
{
}

uint64_t sub_100774980()
{
  return type metadata accessor for PurchasesContentPresenter();
}

uint64_t sub_100774990()
{
  return static RenderPipelineDiagnostics.errorDidOccurNotification.getter();
}

uint64_t sub_1007749A0()
{
  return static RenderPipelineDiagnostics.incidentsDidOccurNotification.getter();
}

uint64_t sub_1007749B0()
{
  return static RenderPipelineDiagnostics.error(of:)();
}

uint64_t sub_1007749C0()
{
  return RenderPipelineDiagnostics.Recorder.snapshot()();
}

uint64_t sub_1007749D0()
{
  return RenderPipelineDiagnostics.Recorder.init()();
}

uint64_t sub_1007749E0()
{
  return type metadata accessor for RenderPipelineDiagnostics.Recorder();
}

uint64_t sub_1007749F0()
{
  return static RenderPipelineDiagnostics.incidents(of:)();
}

uint64_t sub_100774A00()
{
  return ShareSheetArticleMetadata.id.getter();
}

uint64_t sub_100774A10()
{
  return ShareSheetArticleMetadata.text.getter();
}

uint64_t sub_100774A20()
{
  return ShareSheetArticleMetadata.artwork.getter();
}

uint64_t sub_100774A30()
{
  return ShareSheetArticleMetadata.subtitle.getter();
}

uint64_t sub_100774A40()
{
  return ShareSheetProductMetadata.isMessagesOnlyApp.getter();
}

uint64_t sub_100774A50()
{
  return ShareSheetProductMetadata.notesMetadata.getter();
}

uint64_t sub_100774A60()
{
  return ShareSheetProductMetadata.messagesAppIcon.getter();
}

uint64_t sub_100774A70()
{
  return ShareSheetProductMetadata.screenshots.getter();
}

uint64_t sub_100774A80()
{
  return ShareSheetProductMetadata.storeFrontIdentifier.getter();
}

uint64_t sub_100774A90()
{
  return ShareSheetProductMetadata.icon.getter();
}

uint64_t sub_100774AA0()
{
  return ShareSheetProductMetadata.name.getter();
}

uint64_t sub_100774AB0()
{
  return ShareSheetProductMetadata.adamId.getter();
}

uint64_t sub_100774AC0()
{
  return ShareSheetProductMetadata.videos.getter();
}

uint64_t sub_100774AD0()
{
  return ShareSheetProductMetadata.Platform.rawValue.getter();
}

uint64_t sub_100774AE0()
{
  return type metadata accessor for ShareSheetProductMetadata.Platform();
}

uint64_t sub_100774AF0()
{
  return ShareSheetProductMetadata.platform.getter();
}

uint64_t sub_100774B00()
{
  return ShareSheetProductMetadata.subtitle.getter();
}

uint64_t sub_100774B10()
{
  return ShareSheetProductMetadata.genreName.getter();
}

uint64_t sub_100774B20()
{
  return dispatch thunk of TimedMetricsPagePresenter.pageRenderMetrics.getter();
}

uint64_t sub_100774B30()
{
  return dispatch thunk of TimedMetricsPagePresenter.pendingPageRender.getter();
}

uint64_t sub_100774B40()
{
  return dispatch thunk of TimedMetricsPagePresenter.metricsPipeline.getter();
}

uint64_t sub_100774B50()
{
  return dispatch thunk of TimedMetricsPagePresenter.advertRotationData.setter();
}

uint64_t sub_100774B60()
{
  return TimedMetricsPagePresenter.impressionsTracker.getter();
}

uint64_t sub_100774B70()
{
  return TimedMetricsPagePresenter.onUpdatePhaseChanged.getter();
}

uint64_t sub_100774B80()
{
  return TimedMetricsPagePresenter.impressionsCalculator.getter();
}

uint64_t sub_100774B90()
{
  return dispatch thunk of TimedMetricsPagePresenter.update(ignoringCache:)();
}

uint64_t sub_100774BA0()
{
  return dispatch thunk of TimedMetricsPagePresenter.didLoad()();
}

uint64_t sub_100774BB0()
{
  return dispatch thunk of TimedMetricsPagePresenter.referrer.setter();
}

uint64_t sub_100774BC0()
{
  return dispatch thunk of TodayCardMediaWithArtwork.artworkLayoutsWithMetrics.getter();
}

uint64_t sub_100774BD0()
{
  return TodayCardMediaWithArtwork.prefetchableArtwork(for:)();
}

uint64_t sub_100774BE0()
{
  return TodayCardMediaWithArtwork.video(for:)();
}

uint64_t sub_100774BF0()
{
  return TodayCardMediaWithArtwork.artwork(for:)();
}

uint64_t sub_100774C00()
{
  return TodayCardParagraphOverlay.style.getter();
}

uint64_t sub_100774C10()
{
  return TodayCardParagraphOverlay.paragraph.getter();
}

uint64_t sub_100774C20()
{
  return type metadata accessor for TodayCardParagraphOverlay();
}

uint64_t sub_100774C30()
{
  return TodayCardThreeLineOverlay.description.getter();
}

uint64_t sub_100774C40()
{
  return TodayCardThreeLineOverlay.title.getter();
}

uint64_t sub_100774C50()
{
  return TodayCardThreeLineOverlay.heading.getter();
}

uint64_t sub_100774C60()
{
  return static ViewControllerContainment.add(_:to:frame:)();
}

uint64_t sub_100774C70()
{
  return static ViewControllerContainment.remove(_:)();
}

uint64_t sub_100774C80(NSNumber_optional a1, Swift::Int a2)
{
  return localizedStringForDecimal(_:_:)(a1, a2).value._countAndFlagsBits;
}

uint64_t sub_100774C90()
{
  return AccountSectionInfoListItem.title.getter();
}

uint64_t sub_100774CA0()
{
  return AccountSectionInfoListItem.value.getter();
}

uint64_t sub_100774CB0()
{
  return AdvertActionMetricsHandler.processAdActionMetrics(_:then:)();
}

uint64_t sub_100774CC0()
{
  return AdvertActionMetricsHandler.init(reporters:)();
}

uint64_t sub_100774CD0()
{
  return type metadata accessor for AdvertActionMetricsHandler();
}

uint64_t sub_100774CE0()
{
  return type metadata accessor for AdvertVisibilityCalculator.VisibilityThreshold();
}

uint64_t sub_100774CF0()
{
  return ArcadeDownloadPackCategory.gradientEndColor.getter();
}

uint64_t sub_100774D00()
{
  return ArcadeDownloadPackCategory.impressionMetrics.getter();
}

uint64_t sub_100774D10()
{
  return ArcadeDownloadPackCategory.gradientStartColor.getter();
}

uint64_t sub_100774D20()
{
  return ArcadeDownloadPackCategory.id.getter();
}

uint64_t sub_100774D30()
{
  return ArcadeDownloadPackCategory.title.getter();
}

uint64_t sub_100774D40()
{
  return ArcadeDownloadPackCategory.artwork.getter();
}

uint64_t sub_100774D50()
{
  return ArcadeWelcomeContentLayout.measurements(fitting:in:)();
}

uint64_t sub_100774D60()
{
  return ArcadeWelcomeContentLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100774D70()
{
  return ArcadeWelcomeContentLayout.Metrics.init(titleTopSpace:titleInsets:subtitleTopSpace:subtitleFontSource:subtitleInsets:itemsMinTopPosition:itemsTopSpace:itemsBottomSpace:)();
}

uint64_t sub_100774D80()
{
  return type metadata accessor for ArcadeWelcomeContentLayout.Metrics();
}

uint64_t sub_100774D90()
{
  return ArcadeWelcomeContentLayout.init(metrics:titleText:subtitleText:items:)();
}

uint64_t sub_100774DA0()
{
  return type metadata accessor for ArcadeWelcomeContentLayout();
}

uint64_t sub_100774DB0()
{
  return ArcadeWelcomePagePresenter.init(objectGraph:contentType:welcomePage:url:)();
}

uint64_t sub_100774DC0()
{
  return dispatch thunk of ArcadeWelcomePagePresenter.view.setter();
}

uint64_t sub_100774DD0()
{
  return type metadata accessor for ArcadeWelcomePagePresenter();
}

uint64_t sub_100774DE0()
{
  return dispatch thunk of CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100774DF0()
{
  return dispatch thunk of CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_100774E00()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E10()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E20()
{
  return dispatch thunk of CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E30()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E40()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E50()
{
  return dispatch thunk of CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774E60()
{
  return CollectionElementsObserver.didSelectCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100774E70()
{
  return CollectionElementsObserver.prefetchCells(in:collectionView:asPartOf:)();
}

uint64_t sub_100774E80()
{
  return CollectionElementsObserver.didDequeueCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100774E90()
{
  return CollectionElementsObserver.willDisplayCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100774EA0()
{
  return CollectionElementsObserver.didEndDisplayingCell(_:in:collectionView:asPartOf:)();
}

uint64_t sub_100774EB0()
{
  return CollectionElementsObserver.willDisplayItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774EC0()
{
  return CollectionElementsObserver.willDisplayShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774ED0()
{
  return CollectionElementsObserver.willDisplayGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774EE0()
{
  return CollectionElementsObserver.didEndDisplayingItemSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774EF0()
{
  return CollectionElementsObserver.didEndDisplayingShelfSupplementary(_:in:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774F00()
{
  return CollectionElementsObserver.didEndDisplayingGlobalSupplementary(_:registeredWith:collectionView:asPartOf:)();
}

uint64_t sub_100774F10()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofSubItemAt:)();
}

uint64_t sub_100774F20()
{
  return dispatch thunk of ComponentContainerDelegate.mutableState(ofItem:)();
}

uint64_t sub_100774F30()
{
  return dispatch thunk of ComponentContainerDelegate.numberOfItems.getter();
}

uint64_t sub_100774F40()
{
  return dispatch thunk of ComponentContainerDelegate.containerState.getter();
}

uint64_t sub_100774F50()
{
  return dispatch thunk of ComponentContainerDelegate.scrollObserver.getter();
}

uint64_t sub_100774F60()
{
  return dispatch thunk of ComponentContainerDelegate.propagateSelection(ofItem:)();
}

uint64_t sub_100774F70()
{
  return dispatch thunk of ComponentContainerDelegate.impressionsCalculator.getter();
}

uint64_t sub_100774F80()
{
  return dispatch thunk of ComponentContainerDelegate.model(ofItem:)();
}

uint64_t sub_100774F90()
{
  return dispatch thunk of ComponentContainerDelegate.state(ofItem:)();
}

uint64_t sub_100774FA0()
{
  return type metadata accessor for EntitlementRefeshCondition();
}

uint64_t sub_100774FB0()
{
  return GameCenterActivityFeedCard.appActionMetrics.getter();
}

uint64_t sub_100774FC0()
{
  return GameCenterActivityFeedCard.profileActionMetrics.getter();
}

uint64_t sub_100774FD0()
{
  return GameCenterActivityFeedCard.achievementActionMetrics.getter();
}

uint64_t sub_100774FE0()
{
  return GameCenterActivityFeedCard.leaderboardActionMetrics.getter();
}

uint64_t sub_100774FF0()
{
  return GameCenterActivityFeedCard.profileAvatarActionMetrics.getter();
}

uint64_t sub_100775000()
{
  return GameCenterActivityFeedCard.data.getter();
}

uint64_t sub_100775010()
{
  return type metadata accessor for GameCenterActivityFeedCard();
}

uint64_t sub_100775020()
{
  return type metadata accessor for ImpressionIdScrollObserver();
}

uint64_t sub_100775030()
{
  return ImpressionIdScrollObserver.init(_:impressionID:collectionView:)();
}

void sub_100775040()
{
}

uint64_t sub_100775050()
{
  return type metadata accessor for InvalidateAllWidgetsAction();
}

uint64_t sub_100775060()
{
  return type metadata accessor for MetadataRibbonItemViewType();
}

uint64_t sub_100775070()
{
  return static PlatformSelectorViewLayout.makeFullPlatformString(descriptiveText:badgeString:metrics:style:in:)();
}

uint64_t sub_100775080()
{
  return PlatformSelectorViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100775090()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics.AccessoryAlignment();
}

uint64_t sub_1007750A0()
{
  return PlatformSelectorViewLayout.Metrics.init(badgeHorizontalPadding:textSpaceWhenInline:textSpaceWhenExclusiveLine:badgeSpaceExclusiveLine:accessoryHorizontalPadding:accessoryContentInsets:accessoryAlignment:bottomSpacer:)();
}

uint64_t sub_1007750B0()
{
  return PlatformSelectorViewLayout.Metrics.badgeHorizontalPadding.getter();
}

uint64_t sub_1007750C0()
{
  return type metadata accessor for PlatformSelectorViewLayout.Metrics();
}

uint64_t sub_1007750D0()
{
  return PlatformSelectorViewLayout.init(metrics:style:descriptionLabel:accessoryImageView:)();
}

uint64_t sub_1007750E0()
{
  return type metadata accessor for PlatformSelectorViewLayout();
}

uint64_t sub_1007750F0()
{
  return SearchTagsRibbonViewLayout.init(searchTagsRibbonItemLayoutContexts:metrics:shouldEvenlyDistribute:)();
}

uint64_t sub_100775100()
{
  return SearchTagsRibbonViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100775110()
{
  return SearchTagsRibbonViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100775120()
{
  return SearchTagsRibbonViewLayout.Metrics.maximumNumberOfItems.getter();
}

uint64_t sub_100775130()
{
  return static SearchTagsRibbonViewLayout.Metrics.standard.getter();
}

uint64_t sub_100775140()
{
  return type metadata accessor for SearchTagsRibbonViewLayout.Metrics();
}

uint64_t sub_100775150()
{
  return type metadata accessor for SearchTagsRibbonViewLayout();
}

uint64_t sub_100775160()
{
  return ShelfBasedPageScrollAction.clicksOnScroll.getter();
}

uint64_t sub_100775170()
{
  return ShelfBasedPageScrollAction.index.getter();
}

uint64_t sub_100775180()
{
  return ShelfBasedPageScrollAction.shelfId.getter();
}

uint64_t sub_100775190()
{
  return type metadata accessor for ShelfBasedPageScrollAction();
}

uint64_t sub_1007751A0()
{
  return ShelfLayoutSpacingProvider.topPadding(in:)();
}

uint64_t sub_1007751B0()
{
  return ShelfLayoutSpacingProvider.bottomPadding(in:)();
}

uint64_t sub_1007751C0()
{
  return ShelfLayoutSpacingProvider.topContentInset(in:)();
}

uint64_t sub_1007751D0()
{
  return ShelfLayoutSpacingProvider.topPaddingValue(in:)();
}

uint64_t sub_1007751E0()
{
  return ShelfLayoutSpacingProvider.bottomContentInset(in:)();
}

uint64_t sub_1007751F0()
{
  return ShelfLayoutSpacingProvider.bottomPaddingValue(in:)();
}

uint64_t sub_100775200()
{
  return ShelfLayoutSpacingProvider.topContentInsetValue(in:)();
}

uint64_t sub_100775210()
{
  return dispatch thunk of ShelfSupplementaryProvider.decorationItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_100775220()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryItems(for:shelfLayoutSpacingProvider:asPartOf:)();
}

uint64_t sub_100775230()
{
  return dispatch thunk of ShelfSupplementaryProvider.supplementaryRegistration(for:in:asPartOf:)();
}

uint64_t sub_100775240()
{
  return TodayCardLockupListOverlay.displaysTitle.getter();
}

uint64_t sub_100775250()
{
  return TodayCardLockupListOverlay.lockups.getter();
}

uint64_t sub_100775260()
{
  return type metadata accessor for TodayCardLockupListOverlay();
}

uint64_t sub_100775270()
{
  return TodayCardMediaSingleLockup.condensedAdLockupWithIconBackground.getter();
}

uint64_t sub_100775280()
{
  return type metadata accessor for TodayCardMediaSingleLockup();
}

uint64_t sub_100775290()
{
  return TodayCardTriggerController.persistantStore.getter();
}

uint64_t sub_1007752A0()
{
  return dispatch thunk of TodayCardTriggerController.snapshot()();
}

uint64_t sub_1007752B0()
{
  return type metadata accessor for TodayCardTriggerController();
}

uint64_t sub_1007752C0()
{
  return TodayCardTriggerIdentifier.rawValue.getter();
}

uint64_t sub_1007752D0()
{
  return type metadata accessor for TodayCardTriggerIdentifier();
}

uint64_t sub_1007752E0()
{
  return TodayDiffablePagePresenter.init(objectGraph:pageUrl:triggerController:supportsFastImpressions:accountStore:shouldUpdateOnAccountChange:advertLifecycleMetricsReporter:)();
}

uint64_t sub_1007752F0()
{
  return TodayDiffablePagePresenter.pageLongTitle.getter();
}

uint64_t sub_100775300()
{
  return TodayDiffablePagePresenter.feedPreviewUrl.getter();
}

uint64_t sub_100775310()
{
  return TodayDiffablePagePresenter.pageTitleDetail.getter();
}

uint64_t sub_100775320()
{
  return TodayDiffablePagePresenter.pageShortTitleDetail.getter();
}

uint64_t sub_100775330()
{
  return TodayDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_100775340()
{
  return TodayDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100775350()
{
  return type metadata accessor for TodayDiffablePagePresenter();
}

uint64_t sub_100775360()
{
  return type metadata accessor for TodaySectionDisplayOptions.GroupDisplayStyle();
}

uint64_t sub_100775370()
{
  return TodaySectionDisplayOptions.debugSectionTypeIndicatorColor.getter();
}

uint64_t sub_100775380()
{
  return TodaySectionDisplayOptions.groupDisplayStyle.getter();
}

uint64_t sub_100775390()
{
  return type metadata accessor for TodaySectionDisplayOptions();
}

uint64_t sub_1007753A0()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.applyAvatars(from:asPartOf:)();
}

uint64_t sub_1007753B0()
{
  return dispatch thunk of AnyAvatarShowcaseDisplaying.unapply()();
}

uint64_t sub_1007753C0()
{
  return ArcadeAccountEventGenerator.init(metricsPipeline:)();
}

uint64_t sub_1007753D0()
{
  return dispatch thunk of ArcadeAccountEventGenerator.arcadeStateDidChange()();
}

uint64_t sub_1007753E0()
{
  return type metadata accessor for ArcadeAccountEventGenerator();
}

uint64_t sub_1007753F0()
{
  return ArcadeDiffablePagePresenter.didFetchPage.getter();
}

uint64_t sub_100775400()
{
  return ArcadeDiffablePagePresenter.init(objectGraph:arcadeSubscriptionManager:subscriptionStateFetchTimeout:sidePackedPage:pageUrls:)();
}

uint64_t sub_100775410()
{
  return ArcadeDiffablePagePresenter.titleEffect.getter();
}

uint64_t sub_100775420()
{
  return ArcadeDiffablePagePresenter.onOnPrepareUpsellHandler.getter();
}

uint64_t sub_100775430()
{
  return ArcadeDiffablePagePresenter.onRecordTabVisitIfPossible.getter();
}

uint64_t sub_100775440()
{
  return ArcadeDiffablePagePresenter.tabTitle.getter();
}

uint64_t sub_100775450()
{
  return ArcadeDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100775460()
{
  return type metadata accessor for ArcadeDiffablePagePresenter();
}

uint64_t sub_100775470()
{
  return ArcadeSubscriptionDecorator.init(objectGraph:product:appAdamId:subscriptionToken:)();
}

uint64_t sub_100775480()
{
  return type metadata accessor for ArcadeSubscriptionDecorator();
}

uint64_t sub_100775490()
{
  return ArcadeWelcomeItemViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007754A0()
{
  return ArcadeWelcomeItemViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007754B0()
{
  return ArcadeWelcomeItemViewLayout.Metrics.imageWidth.setter();
}

uint64_t sub_1007754C0()
{
  return ArcadeWelcomeItemViewLayout.Metrics.init(imageAspectRatio:imageWidth:headingTopSpace:bodyTopSpace:textInsets:)();
}

uint64_t sub_1007754D0()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout.Metrics();
}

uint64_t sub_1007754E0()
{
  return ArcadeWelcomeItemViewLayout.init(metrics:headingText:bodyText:image:)();
}

uint64_t sub_1007754F0()
{
  return type metadata accessor for ArcadeWelcomeItemViewLayout();
}

uint64_t sub_100775500()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.badge.getter();
}

uint64_t sub_100775510()
{
  return ChartOrCategoryBrickContext.BrickLabelMetrics.title.getter();
}

uint64_t sub_100775520()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickLabelMetrics();
}

uint64_t sub_100775530()
{
  return type metadata accessor for ChartOrCategoryBrickContext.BrickType();
}

uint64_t sub_100775540()
{
  return ChartOrCategoryBrickContext.LabelMetrics.contentSizeCategoryMapping.getter();
}

uint64_t sub_100775550()
{
  return ChartOrCategoryBrickContext.LabelMetrics.fontUseCase.getter();
}

uint64_t sub_100775560()
{
  return ChartOrCategoryBrickContext.LabelMetrics.numberOfLines.getter();
}

uint64_t sub_100775570()
{
  return type metadata accessor for ChartOrCategoryBrickContext.LabelMetrics();
}

uint64_t sub_100775580()
{
  return ChartOrCategoryBrickContext.layoutMetrics.getter();
}

uint64_t sub_100775590()
{
  return ChartOrCategoryBrickContext.currentArtwork.getter();
}

uint64_t sub_1007755A0()
{
  return ChartOrCategoryBrickContext.init(model:fontStyles:in:)();
}

uint64_t sub_1007755B0()
{
  return ChartOrCategoryBrickContext.model.getter();
}

uint64_t sub_1007755C0()
{
  return ChartOrCategoryBrickContext.style.getter();
}

uint64_t sub_1007755D0()
{
  return ChartOrCategoryBrickContext.labels.getter();
}

uint64_t sub_1007755E0()
{
  return type metadata accessor for ChartOrCategoryBrickContext();
}

uint64_t sub_1007755F0()
{
  return dispatch thunk of GenericAccountPagePresenter.contentItem(at:)();
}

uint64_t sub_100775600()
{
  return GenericAccountPagePresenter.init(objectGraph:url:page:)();
}

uint64_t sub_100775610()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfItems(in:)();
}

uint64_t sub_100775620()
{
  return dispatch thunk of GenericAccountPagePresenter.numberOfSections.getter();
}

uint64_t sub_100775630()
{
  return dispatch thunk of GenericAccountPagePresenter.personalizedRecommendationsEnabled.getter();
}

uint64_t sub_100775640()
{
  return dispatch thunk of GenericAccountPagePresenter.setPersonalizedRecommendationsEnabled(_:)();
}

uint64_t sub_100775650()
{
  return dispatch thunk of GenericAccountPagePresenter.view.setter();
}

uint64_t sub_100775660()
{
  return dispatch thunk of GenericAccountPagePresenter.title(forSection:)();
}

uint64_t sub_100775670()
{
  return dispatch thunk of GenericAccountPagePresenter.title.getter();
}

uint64_t sub_100775680()
{
  return dispatch thunk of GenericAccountPagePresenter.action(at:)();
}

uint64_t sub_100775690()
{
  return dispatch thunk of GenericAccountPagePresenter.footer(forSection:)();
}

uint64_t sub_1007756A0()
{
  return type metadata accessor for GenericAccountPagePresenter();
}

uint64_t sub_1007756B0()
{
  return type metadata accessor for GuidedSearchTokenCollection();
}

uint64_t sub_1007756C0()
{
  return MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_1007756D0()
{
  return MetadataRibbonBarViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007756E0()
{
  return MetadataRibbonBarViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007756F0()
{
  return MetadataRibbonBarViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100775700()
{
  return MetadataRibbonBarViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100775710()
{
  return type metadata accessor for MetadataRibbonBarViewLayout.Metrics();
}

uint64_t sub_100775720()
{
  return type metadata accessor for MetadataRibbonBarViewLayout();
}

uint64_t sub_100775730()
{
  return MetadataRibbonTagViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_100775740()
{
  return MetadataRibbonTagViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100775750()
{
  return MetadataRibbonTagViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100775760()
{
  return MetadataRibbonTagViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100775770()
{
  return MetadataRibbonTagViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100775780()
{
  return type metadata accessor for MetadataRibbonTagViewLayout.Metrics();
}

uint64_t sub_100775790()
{
  return type metadata accessor for MetadataRibbonTagViewLayout();
}

uint64_t sub_1007757A0()
{
  return type metadata accessor for OfferButtonSubtitlePosition();
}

uint64_t sub_1007757B0()
{
  return OnDeviceAdvertFetchResponse.failureReason.getter();
}

uint64_t sub_1007757C0()
{
  return OnDeviceAdvertFetchResponse.init(clientRequestId:iAdId:ad:failureReason:)();
}

uint64_t sub_1007757D0()
{
  return OnDeviceAdvertFetchResponse.ad.getter();
}

uint64_t sub_1007757E0()
{
  return type metadata accessor for OnDeviceAdvertFetchResponse();
}

uint64_t sub_1007757F0()
{
  return type metadata accessor for PaginatedPagePresenterState();
}

uint64_t sub_100775800()
{
  return type metadata accessor for PersonalizationDataProvider();
}

uint64_t sub_100775810()
{
  return dispatch thunk of ProductTopLockupIconFetcher.addIconRecipient(recipient:)();
}

uint64_t sub_100775820()
{
  return dispatch thunk of ProductTopLockupIconFetcher.fetchArtwork(for:in:)();
}

uint64_t sub_100775830()
{
  return ProductTopLockupIconFetcher.init(artworkLoader:)();
}

uint64_t sub_100775840()
{
  return type metadata accessor for ProductTopLockupIconFetcher();
}

uint64_t sub_100775850()
{
  return dispatch thunk of PurchasableTodayCardOverlay.offerAdamIds.getter();
}

uint64_t sub_100775860()
{
  return ReloadableItemPagePresenter.reloadItem(_:)();
}

uint64_t sub_100775870()
{
  return static ResilientDeepLinkController.hasResilientDeepLinks(bag:)();
}

uint64_t sub_100775880()
{
  return static ResilientDeepLinkController.removeAllDeepLinks()();
}

uint64_t sub_100775890()
{
  return static ResilientDeepLinkController.removeNonResilientDeepLinks(bag:)();
}

uint64_t sub_1007758A0()
{
  return static ResilientDeepLinkController.preventDismissingArticlesForFlowUrl(_:bag:)();
}

uint64_t sub_1007758B0()
{
  return ShelfBasedProductPageIntent.init(url:preloading:referrerData:)();
}

uint64_t sub_1007758C0()
{
  return type metadata accessor for ShelfBasedProductPageIntent();
}

uint64_t sub_1007758D0()
{
  return type metadata accessor for VideoPlaybackScrollObserver();
}

uint64_t sub_1007758E0()
{
  return VideoPlaybackScrollObserver.init(_:)();
}

uint64_t sub_1007758F0()
{
  return ArcadeDebugSubscriptionState.arcadeState.getter();
}

uint64_t sub_100775900()
{
  return static ArcadeDebugSubscriptionState.allCases.getter();
}

uint64_t sub_100775910()
{
  return type metadata accessor for ArcadeDebugSubscriptionState();
}

uint64_t sub_100775920()
{
  return ArcadeDownloadPackSuggestion.lockup.getter();
}

uint64_t sub_100775930()
{
  return ArticleDiffablePagePresenter.reloadLink(_:)();
}

uint64_t sub_100775940()
{
  return ArticleDiffablePagePresenter.init(objectGraph:impressionsTracker:pageUrl:sidePackedPage:)();
}

uint64_t sub_100775950()
{
  return ArticleDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_100775960()
{
  return type metadata accessor for ArticleDiffablePagePresenter.FooterLockup();
}

uint64_t sub_100775970()
{
  return ArticleDiffablePagePresenter.onShowFooterLockup.getter();
}

uint64_t sub_100775980()
{
  return ArticleDiffablePagePresenter.shouldTerminateOnClose.getter();
}

uint64_t sub_100775990()
{
  return ArticleDiffablePagePresenter.onPrefetchLinkPresentations.getter();
}

uint64_t sub_1007759A0()
{
  return ArticleDiffablePagePresenter.onPrepareToDisplayTodayCard.getter();
}

uint64_t sub_1007759B0()
{
  return ArticleDiffablePagePresenter.footerVisibilitySectionThreshold.getter();
}

uint64_t sub_1007759C0()
{
  return ArticleDiffablePagePresenter.todayCard.getter();
}

uint64_t sub_1007759D0()
{
  return type metadata accessor for ArticleDiffablePagePresenter();
}

uint64_t sub_1007759E0()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.isAutoPlayEnabled.getter();
}

uint64_t sub_1007759F0()
{
  return dispatch thunk of AutoPlayVideoSettingsManager.defaultAutoPlayVideoSetting.setter();
}

uint64_t sub_100775A00()
{
  return static AutoPlayVideoSettingsManager.shared.getter();
}

uint64_t sub_100775A10()
{
  return type metadata accessor for AutoPlayVideoSettingsManager();
}

uint64_t sub_100775A20()
{
  return BadgeContentKeyChartPosition.getter();
}

uint64_t sub_100775A30()
{
  return BadgeContentKeyParagraphText.getter();
}

uint64_t sub_100775A40()
{
  return ChartOrCategoryBrickSafeArea.size(in:)();
}

uint64_t sub_100775A50()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location.RelativeLocation();
}

uint64_t sub_100775A60()
{
  return ChartOrCategoryBrickSafeArea.Location.relativeLocation.getter();
}

uint64_t sub_100775A70()
{
  return ChartOrCategoryBrickSafeArea.Location.absoluteDistance(in:)();
}

uint64_t sub_100775A80()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea.Location();
}

uint64_t sub_100775A90()
{
  return ChartOrCategoryBrickSafeArea.location.getter();
}

uint64_t sub_100775AA0()
{
  return type metadata accessor for ChartOrCategoryBrickSafeArea();
}

uint64_t sub_100775AB0()
{
  return GameCenterAchievementsAction.achievementIdsToHighlight.getter();
}

uint64_t sub_100775AC0()
{
  return GameCenterAchievementsAction.init(bundleID:achievementIdsToHighlight:actionMetrics:)();
}

uint64_t sub_100775AD0()
{
  return GameCenterAchievementsAction.bundleId.getter();
}

uint64_t sub_100775AE0()
{
  return type metadata accessor for GameCenterAchievementsAction();
}

uint64_t sub_100775AF0()
{
  return type metadata accessor for GameCenterInvitePlayerAction.InvitationType();
}

uint64_t sub_100775B00()
{
  return GameCenterInvitePlayerAction.invitationType.getter();
}

uint64_t sub_100775B10()
{
  return GameCenterLeaderboardsAction.init(leaderboardID:bundleID:actionMetrics:)();
}

uint64_t sub_100775B20()
{
  return GameCenterLeaderboardsAction.leaderboardID.getter();
}

uint64_t sub_100775B30()
{
  return GameCenterLeaderboardsAction.bundleID.getter();
}

uint64_t sub_100775B40()
{
  return type metadata accessor for GameCenterLeaderboardsAction();
}

uint64_t sub_100775B50()
{
  return GameCenterReengagementLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100775B60()
{
  return GameCenterReengagementLayout.Metrics.init(layoutMargins:shelfTopSpace:badgeGlyphSpace:badgeTopSpace:titleTopSpace:subtitleTopSpace:heroContentTopSpace:separatorTopSpace:footerTopSpace:footerBottomSpace:maxColumnWidth:columnSpace:maxHeight:)();
}

uint64_t sub_100775B70()
{
  return type metadata accessor for GameCenterReengagementLayout.Metrics();
}

uint64_t sub_100775B80()
{
  return GameCenterReengagementLayout.init(metrics:badgeGlyph:badgeLabel:titleLabel:subtitleLabel:heroContent:separator:footer:)();
}

uint64_t sub_100775B90()
{
  return type metadata accessor for GameCenterReengagementLayout();
}

uint64_t sub_100775BA0()
{
  return GenericDiffablePagePresenter.init(objectGraph:personalizationProvider:sidePackedPage:sidePackedPageRenderMetrics:pageUrl:)();
}

uint64_t sub_100775BB0()
{
  return type metadata accessor for GenericDiffablePagePresenter();
}

uint64_t sub_100775BC0()
{
  return type metadata accessor for IncompleteShelfFetchStrategy();
}

uint64_t sub_100775BD0()
{
  return LockupCollectionSearchResult.detailAction.getter();
}

uint64_t sub_100775BE0()
{
  return LockupCollectionSearchResult.items.getter();
}

uint64_t sub_100775BF0()
{
  return LockupCollectionSearchResult.title.getter();
}

uint64_t sub_100775C00()
{
  return LockupCollectionSearchResult.heading.getter();
}

uint64_t sub_100775C10()
{
  return type metadata accessor for LockupCollectionSearchResult();
}

uint64_t sub_100775C20()
{
  return OnDeviceSearchHistoryManager.fetchRecents(limit:)();
}

void sub_100775C30()
{
}

uint64_t sub_100775C40()
{
  return type metadata accessor for OnDeviceSearchHistoryManager();
}

void sub_100775C50()
{
}

uint64_t sub_100775C60()
{
  return ProductDiffablePagePresenter.appPromotionDetailPageAction.getter();
}

uint64_t sub_100775C70()
{
  return ProductDiffablePagePresenter.isOfferButtonHiddenByPresenter.getter();
}

void sub_100775C80()
{
}

uint64_t sub_100775C90()
{
  return ProductDiffablePagePresenter.didChangePageWidth(_:)();
}

uint64_t sub_100775CA0()
{
  return type metadata accessor for ProductDiffablePagePresenter.PageWidth();
}

uint64_t sub_100775CB0()
{
  return ProductDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:sidePackedPageRenderMetrics:appStateController:purchaseHistory:restrictions:fullProductFetchedAction:pageWidth:isDownloadingOrderingEnabled:downloadingOrderingTimeout:supportsFastImpressions:advertLifecycleMetricsReporter:referrerData:)();
}

uint64_t sub_100775CC0()
{
  return ProductDiffablePagePresenter.shareAction.getter();
}

uint64_t sub_100775CD0()
{
  return ProductDiffablePagePresenter.didSelectShare(sender:)();
}

uint64_t sub_100775CE0()
{
  return ProductDiffablePagePresenter.offerButtonMode.getter();
}

uint64_t sub_100775CF0()
{
  return ProductDiffablePagePresenter.didSelectDeveloper(sender:)();
}

uint64_t sub_100775D00()
{
  return ProductDiffablePagePresenter.onScrollToPosition.getter();
}

uint64_t sub_100775D10()
{
  return ProductDiffablePagePresenter.didSelectExpandMedia(on:sender:)();
}

uint64_t sub_100775D20()
{
  return ProductDiffablePagePresenter.pageDisappearedAction.getter();
}

uint64_t sub_100775D30()
{
  return ProductDiffablePagePresenter.titleOfferDisplayProperties.getter();
}

uint64_t sub_100775D40()
{
  return ProductDiffablePagePresenter.onDownloadingOrderingItemsRemoved.getter();
}

uint64_t sub_100775D50()
{
  return ProductDiffablePagePresenter.adamId.getter();
}

uint64_t sub_100775D60()
{
  return type metadata accessor for ProductDiffablePagePresenter();
}

uint64_t sub_100775D70()
{
  return ReviewsDiffablePagePresenter.init(objectGraph:reviewsPage:preferSelectedActionTitles:)();
}

uint64_t sub_100775D80()
{
  return ReviewsDiffablePagePresenter.showSortSheet(sender:)();
}

uint64_t sub_100775D90()
{
  return ReviewsDiffablePagePresenter.selectedSortOption.getter();
}

uint64_t sub_100775DA0()
{
  return ReviewsDiffablePagePresenter.isUpdatingSortOption.getter();
}

uint64_t sub_100775DB0()
{
  return ReviewsDiffablePagePresenter.trailingNavBarAction.getter();
}

uint64_t sub_100775DC0()
{
  return ReviewsDiffablePagePresenter.initialFocusedReviewId.getter();
}

uint64_t sub_100775DD0()
{
  return ReviewsDiffablePagePresenter.title.getter();
}

uint64_t sub_100775DE0()
{
  return type metadata accessor for ReviewsDiffablePagePresenter();
}

uint64_t sub_100775DF0()
{
  return SelectableShelfComponentView.didBecomeSelected(in:asPartOf:)();
}

uint64_t sub_100775E00()
{
  return TodayCardArcadeLockupOverlay.arcadeLockup.getter();
}

uint64_t sub_100775E10()
{
  return type metadata accessor for TodayCardArcadeLockupOverlay();
}

uint64_t sub_100775E20()
{
  return dispatch thunk of TopChartsCategoriesPresenter.hasChildren(at:)();
}

uint64_t sub_100775E30()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryCount(at:)();
}

uint64_t sub_100775E40()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryTitle(at:)();
}

uint64_t sub_100775E50()
{
  return dispatch thunk of TopChartsCategoriesPresenter.categoryArtwork(at:)();
}

uint64_t sub_100775E60()
{
  return dispatch thunk of TopChartsCategoriesPresenter.isCategorySelected(at:)();
}

uint64_t sub_100775E70()
{
  return dispatch thunk of TopChartsCategoriesPresenter.selectedCategoryIndexPath.getter();
}

uint64_t sub_100775E80()
{
  return ArcadeSubscriptionStateAction.purchasingAction.getter();
}

uint64_t sub_100775E90()
{
  return ArcadeSubscriptionStateAction.subscribedAction.getter();
}

uint64_t sub_100775EA0()
{
  return ArcadeSubscriptionStateAction.notSubscribedAction.getter();
}

uint64_t sub_100775EB0()
{
  return ArcadeSubscriptionStateAction.unknownAction.getter();
}

uint64_t sub_100775EC0()
{
  return BasePageLayoutSectionProvider.init(componentTypeMappingProvider:visibleItemsObserverProviders:componentHeightCache:useEstimatedLayoutSizing:)();
}

uint64_t sub_100775ED0()
{
  return BasePageLayoutSectionProvider.componentTypeMappingProvider.getter();
}

uint64_t sub_100775EE0()
{
  return BasePageLayoutSectionProvider.addSupplementariesAndInsets(to:for:shelfLayoutSpacingProvider:shelfSupplementaryProvider:asPartOf:)();
}

uint64_t sub_100775EF0()
{
  return BasePageLayoutSectionProvider.visibleItemsObserverProviders.getter();
}

uint64_t sub_100775F00()
{
  return type metadata accessor for BasePageLayoutSectionProvider();
}

uint64_t sub_100775F10()
{
  return method lookup function for BasePageLayoutSectionProvider();
}

uint64_t sub_100775F20()
{
  return BasePageLayoutSectionProvider.deinit();
}

uint64_t sub_100775F30()
{
  return type metadata accessor for DiffablePageContentIdentifier();
}

uint64_t sub_100775F40()
{
  return DiffablePageContentIdentifier.init(_:)();
}

uint64_t sub_100775F50()
{
  return DynamicViewControllerDelegate.init(subscriptionManager:purchaseSuccessHandler:purchaseFailureHandler:carrierLinkSuccessHandler:carrierLinkFailureHandler:didDismissHandler:contentViewConstructor:)();
}

uint64_t sub_100775F60()
{
  return type metadata accessor for DynamicViewControllerDelegate();
}

uint64_t sub_100775F70()
{
  return GameCenterPlayerProfileAction.init(playerId:actionMetrics:)();
}

uint64_t sub_100775F80()
{
  return GameCenterPlayerProfileAction.playerId.getter();
}

uint64_t sub_100775F90()
{
  return type metadata accessor for GameCenterPlayerProfileAction();
}

uint64_t sub_100775FA0()
{
  return ImpressionableSmallPlayerCard.init(id:suggestedFriend:impressionMetrics:)();
}

uint64_t sub_100775FB0()
{
  return ImpressionableSmallPlayerCard.data.getter();
}

uint64_t sub_100775FC0()
{
  return type metadata accessor for ImpressionableSmallPlayerCard();
}

uint64_t sub_100775FD0()
{
  return InlineUnifiedMessagePresenter.actionHandler.setter();
}

uint64_t sub_100775FE0()
{
  return InlineUnifiedMessagePresenter.inlineViewController(for:)();
}

uint64_t sub_100775FF0()
{
  return type metadata accessor for InlineUnifiedMessagePresenter();
}

uint64_t sub_100776000()
{
  return static LabelPlaceholderCompatibility.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100776010()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100776020()
{
  return static LabelPlaceholderCompatibility.measurements(text:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100776030()
{
  return LabelPlaceholderCompatibility.measurements(fitting:with:)();
}

uint64_t sub_100776040()
{
  return LabelPlaceholderCompatibility.init(attributedText:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100776050()
{
  return LabelPlaceholderCompatibility.layoutTextView.getter();
}

uint64_t sub_100776060()
{
  return LabelPlaceholderCompatibility.referableLayoutTextView.getter();
}

uint64_t sub_100776070()
{
  return LabelPlaceholderCompatibility.init(text:font:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:shouldUseLabelPlaceholder:)();
}

uint64_t sub_100776080()
{
  return type metadata accessor for LabelPlaceholderCompatibility();
}

uint64_t sub_100776090()
{
  return dispatch thunk of ModelMappedDiffableDataSource.applySnapshotUsingReloadData(_:animatingDifferences:completion:)();
}

uint64_t sub_1007760A0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_1007760B0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModel(for:)();
}

uint64_t sub_1007760C0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionModel(at:)();
}

uint64_t sub_1007760D0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.itemModels(in:)();
}

uint64_t sub_1007760E0()
{
  return dispatch thunk of ModelMappedDiffableDataSource.sectionIndex(for:)();
}

uint64_t sub_1007760F0()
{
  return ModelMappedDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_100776100()
{
  return dispatch thunk of ModelMappedDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_100776110()
{
  return static OfferButtonPresenterViewTheme.blueColored.getter();
}

uint64_t sub_100776120()
{
  return OfferButtonPresenterViewTheme.environment.getter();
}

uint64_t sub_100776130()
{
  return static OfferButtonPresenterViewTheme.disabled.getter();
}

uint64_t sub_100776140()
{
  return type metadata accessor for OfferButtonPresenterViewTheme();
}

uint64_t sub_100776150()
{
  return SearchChartsAndCategoriesPage.title.getter();
}

uint64_t sub_100776160()
{
  return type metadata accessor for SearchChartsAndCategoriesPage();
}

uint64_t sub_100776170()
{
  return type metadata accessor for SearchGhostHintMetricsTracker();
}

uint64_t sub_100776180()
{
  return type metadata accessor for SearchResultCondensedBehavior();
}

uint64_t sub_100776190()
{
  return dispatch thunk of StorefrontPickerPagePresenter.updateStorefront()();
}

uint64_t sub_1007761A0()
{
  return static StorefrontPickerPagePresenter.currentStorefront()();
}

uint64_t sub_1007761B0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.canUpdateStorefront.getter();
}

uint64_t sub_1007761C0()
{
  return StorefrontPickerPagePresenter.init(objectGraph:impressionsTracker:impressionsCalculator:)();
}

uint64_t sub_1007761D0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectCountry(at:)();
}

uint64_t sub_1007761E0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.didSelectLanguage(at:)();
}

uint64_t sub_1007761F0()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfCountries.getter();
}

uint64_t sub_100776200()
{
  return dispatch thunk of StorefrontPickerPagePresenter.numberOfLanguages.getter();
}

uint64_t sub_100776210()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedCountryIndex.getter();
}

uint64_t sub_100776220()
{
  return dispatch thunk of StorefrontPickerPagePresenter.selectedLanguageIndex.getter();
}

uint64_t sub_100776230()
{
  return dispatch thunk of StorefrontPickerPagePresenter.view.setter();
}

uint64_t sub_100776240()
{
  return dispatch thunk of StorefrontPickerPagePresenter.country(at:)();
}

uint64_t sub_100776250()
{
  return dispatch thunk of StorefrontPickerPagePresenter.language(at:for:)();
}

uint64_t sub_100776260()
{
  return type metadata accessor for StorefrontPickerPagePresenter();
}

uint64_t sub_100776270(Swift::String a1)
{
  return localizedStringForAdsLanguage(_:)(a1)._countAndFlagsBits;
}

uint64_t sub_100776280()
{
  return ArcadeButtonNameFieldsProvider.init(arcadeSubscriptionManager:appStateController:)();
}

uint64_t sub_100776290()
{
  return type metadata accessor for ArcadeButtonNameFieldsProvider();
}

uint64_t sub_1007762A0()
{
  return BadgeContentKeyRatingFormatted.getter();
}

uint64_t sub_1007762B0()
{
  return GameCenterDenylistPlayerAction.contactId.getter();
}

uint64_t sub_1007762C0()
{
  return type metadata accessor for GameCenterDenylistPlayerAction();
}

uint64_t sub_1007762D0()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.onUpdatePageTitleEffect.getter();
}

uint64_t sub_1007762E0()
{
  return dispatch thunk of PageTitleEffectUpdateProviding.currentTitleEffect.getter();
}

uint64_t sub_1007762F0()
{
  return PersonalizationFeedbackRequest.hasDivider.getter();
}

uint64_t sub_100776300()
{
  return PersonalizationFeedbackRequest.description.getter();
}

uint64_t sub_100776310()
{
  return PersonalizationFeedbackRequest.options.getter();
}

uint64_t sub_100776320()
{
  return type metadata accessor for PersonalizationFeedbackRequest();
}

uint64_t sub_100776330()
{
  return PrivacyHeaderSupplementaryItem.bodyText.getter();
}

uint64_t sub_100776340()
{
  return type metadata accessor for PrivacyHeaderSupplementaryItem();
}

uint64_t sub_100776350()
{
  return SearchResultsContextCardLayout.Metrics.maxCardWidth.getter();
}

uint64_t sub_100776360()
{
  return static SearchResultsContextCardLayout.Metrics.standard.getter();
}

uint64_t sub_100776370()
{
  return type metadata accessor for SearchResultsContextCardLayout.Metrics();
}

uint64_t sub_100776380()
{
  return SearchResultsContextCardLayout.init(metrics:message:button:)();
}

uint64_t sub_100776390()
{
  return type metadata accessor for SearchResultsContextCardLayout();
}

uint64_t sub_1007763A0()
{
  return SearchResultsUnavailableReason.contextCard.getter();
}

uint64_t sub_1007763B0()
{
  return SearchResultsUnavailableReason.title.getter();
}

uint64_t sub_1007763C0()
{
  return SearchResultsUnavailableReason.action.getter();
}

uint64_t sub_1007763D0()
{
  return SearchResultsUnavailableReason.message.getter();
}

uint64_t sub_1007763E0()
{
  return type metadata accessor for TopChartsDiffablePagePresenter.UpdatePhase();
}

uint64_t sub_1007763F0()
{
  return TopChartsDiffablePagePresenter.init(objectGraph:pageUrl:sidePackedPage:)();
}

void sub_100776400()
{
}

uint64_t sub_100776410()
{
  return TopChartsDiffablePagePresenter.segmentPresenters.getter();
}

uint64_t sub_100776420()
{
  return TopChartsDiffablePagePresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_100776430()
{
  return TopChartsDiffablePagePresenter.initialSegmentIndex.getter();
}

uint64_t sub_100776440()
{
  return TopChartsDiffablePagePresenter.onSegmentPresentersUpdated.getter();
}

uint64_t sub_100776450()
{
  return TopChartsDiffablePagePresenter.onCategoriesButtonTitleChanged.getter();
}

uint64_t sub_100776460()
{
  return TopChartsDiffablePagePresenter.title.getter();
}

uint64_t sub_100776470()
{
  return TopChartsDiffablePagePresenter.update(toCategoryAt:)();
}

uint64_t sub_100776480()
{
  return TopChartsDiffablePagePresenter.pageUrl.getter();
}

uint64_t sub_100776490()
{
  return type metadata accessor for TopChartsDiffablePagePresenter();
}

uint64_t sub_1007764A0()
{
  return BootstrapPendingClosuresHandler.hasClosures(pending:)();
}

uint64_t sub_1007764B0()
{
  return BootstrapPendingClosuresHandler.didComplete(bootstrapPhase:)();
}

uint64_t sub_1007764C0()
{
  return BootstrapPendingClosuresHandler.performClosure(after:priority:canPerformImmediately:closure:)();
}

uint64_t sub_1007764D0()
{
  return BootstrapPendingClosuresHandler.init()();
}

uint64_t sub_1007764E0()
{
  return type metadata accessor for BootstrapPendingClosuresHandler();
}

uint64_t sub_1007764F0()
{
  return CondensedSearchResultCardLayout.Configuration.headerFont.getter();
}

Swift::Int sub_100776500(UITraitCollection in)
{
  return CondensedSearchResultCardLayout.Configuration.titleNumberOfLines(in:)(in);
}

uint64_t sub_100776510()
{
  return CondensedSearchResultCardLayout.Configuration.headerNumberOfLines.getter();
}

uint64_t sub_100776520()
{
  return CondensedSearchResultCardLayout.Configuration.metrics.getter();
}

uint64_t sub_100776530()
{
  return CondensedSearchResultCardLayout.Configuration.titleFont.getter();
}

uint64_t sub_100776540()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Configuration();
}

uint64_t sub_100776550()
{
  return static CondensedSearchResultCardLayout.estimatedSizeForViewButtonInAXLayouts.getter();
}

uint64_t sub_100776560()
{
  return CondensedSearchResultCardLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100776570()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextSpace.getter();
}

uint64_t sub_100776580()
{
  return CondensedSearchResultCardLayout.Metrics.headerTextSpace.getter();
}

uint64_t sub_100776590()
{
  return CondensedSearchResultCardLayout.Metrics.artworkTopMargin.getter();
}

uint64_t sub_1007765A0()
{
  return CondensedSearchResultCardLayout.Metrics.artworkBottomMargin.getter();
}

uint64_t sub_1007765B0()
{
  return CondensedSearchResultCardLayout.Metrics.artworkAXBottomMargin.getter();
}

uint64_t sub_1007765C0()
{
  return CondensedSearchResultCardLayout.Metrics.titleTextBottomMargin.getter();
}

uint64_t sub_1007765D0()
{
  return CondensedSearchResultCardLayout.Metrics.viewButtonAXTopMargin.getter();
}

uint64_t sub_1007765E0()
{
  return CondensedSearchResultCardLayout.Metrics.overriddingArtworkSize(with:)();
}

uint64_t sub_1007765F0()
{
  return static CondensedSearchResultCardLayout.Metrics.appEvent.getter();
}

uint64_t sub_100776600()
{
  return type metadata accessor for CondensedSearchResultCardLayout.Metrics();
}

uint64_t sub_100776610()
{
  return CondensedSearchResultCardLayout.init(metrics:artwork:headerText:titleText:viewButton:isTextBaselineAligned:)();
}

uint64_t sub_100776620()
{
  return type metadata accessor for CondensedSearchResultCardLayout();
}

void sub_100776630()
{
}

uint64_t sub_100776650()
{
  return FlowPreviewActionsConfiguration.offerActionIndex.getter();
}

uint64_t sub_100776660()
{
  return FlowPreviewActionsConfiguration.destructiveActionIndex.getter();
}

uint64_t sub_100776670()
{
  return FlowPreviewActionsConfiguration.offerDisplayProperties.getter();
}

uint64_t sub_100776680()
{
  return FlowPreviewActionsConfiguration.actions.getter();
}

uint64_t sub_100776690()
{
  return InstallPageInstallingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007766A0()
{
  return InstallPageInstallingViewLayout.Metrics.init(iconSize:ageRatingMargin:ageRatingBaselineOffset:titleSpace:titleHorizontalMargin:subtitleSpace:subtitleHorizontalMargin:descriptionSpace:descriptionHorizontalMargin:offerButtonMargin:offerButtonSize:bottomSpace:)();
}

uint64_t sub_1007766B0()
{
  return InstallPageInstallingViewLayout.Metrics.iconSize.getter();
}

uint64_t sub_1007766C0()
{
  return type metadata accessor for InstallPageInstallingViewLayout.Metrics();
}

uint64_t sub_1007766D0()
{
  return InstallPageInstallingViewLayout.init(metrics:iconView:progressView:titleText:subtitleText:descriptionText:ageRatingView:offerButton:)();
}

uint64_t sub_1007766E0()
{
  return type metadata accessor for InstallPageInstallingViewLayout();
}

uint64_t sub_1007766F0()
{
  return dispatch thunk of NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_100776700()
{
  return dispatch thunk of NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_100776710()
{
  return dispatch thunk of NestedModelImpressionsRecording.impressionsCalculator.setter();
}

uint64_t sub_100776720()
{
  return NestedModelImpressionsRecording.stopRecordingNestedImpressions(using:)();
}

uint64_t sub_100776730()
{
  return NestedModelImpressionsRecording.startRecordingNestedImpressions(for:using:)();
}

uint64_t sub_100776740()
{
  return ShelfBackgroundGradientLocation.point.getter();
}

uint64_t sub_100776750()
{
  return type metadata accessor for ShelfBackgroundGradientLocation();
}

uint64_t sub_100776760()
{
  return SponsoredSearchNativeAdvertData.init(adverts:odmlSuccess:installedStates:)();
}

uint64_t sub_100776770()
{
  return type metadata accessor for SponsoredSearchNativeAdvertData();
}

uint64_t sub_100776780()
{
  return TodayCardMarketingLockupOverlay.hideBackground.getter();
}

uint64_t sub_100776790()
{
  return TodayCardMarketingLockupOverlay.artworkBackgroundColor.getter();
}

uint64_t sub_1007767A0()
{
  return TodayCardMarketingLockupOverlay.lockup.getter();
}

uint64_t sub_1007767B0()
{
  return TodayCardMarketingLockupOverlay.paragraph.getter();
}

uint64_t sub_1007767C0()
{
  return type metadata accessor for TodayCardMarketingLockupOverlay();
}

void sub_1007767D0()
{
}

void sub_1007767E0()
{
}

void sub_1007767F0()
{
}

uint64_t sub_100776800()
{
  return AdvertRotationControllerProvider.viewControllerWillRemoveItems(_:asPartOf:)();
}

void sub_100776810()
{
}

uint64_t sub_100776820()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:createIfRequired:)();
}

uint64_t sub_100776830()
{
  return AdvertRotationControllerProvider.advertController(for:asPartOf:)();
}

uint64_t sub_100776840()
{
  return AdvertRotationControllerProvider.init(supportsAdvertRotation:advertLifecycleMetricsReporter:)();
}

void sub_100776850()
{
}

void sub_100776860()
{
}

uint64_t sub_100776870()
{
  return type metadata accessor for AdvertRotationControllerProvider();
}

uint64_t sub_100776880()
{
  return ArcadeDownloadPackCategoriesPage.categories.getter();
}

uint64_t sub_100776890()
{
  return ArcadeDownloadPackCategoriesPage.dismissAction.getter();
}

uint64_t sub_1007768A0()
{
  return ArcadeDownloadPackCategoriesPage.primaryAction.getter();
}

uint64_t sub_1007768B0()
{
  return ArcadeDownloadPackCategoriesPage.title.getter();
}

uint64_t sub_1007768C0()
{
  return ArcadeSubscriptionFieldsProvider.init(arcadeSubscriptionManager:)();
}

uint64_t sub_1007768D0()
{
  return type metadata accessor for ArcadeSubscriptionFieldsProvider();
}

uint64_t sub_1007768E0()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties.DetailPosition();
}

uint64_t sub_1007768F0()
{
  return BreakoutDetailsDisplayProperties.position.getter();
}

uint64_t sub_100776900()
{
  return BreakoutDetailsDisplayProperties.wantsBlur.getter();
}

uint64_t sub_100776910()
{
  return type metadata accessor for BreakoutDetailsDisplayProperties();
}

uint64_t sub_100776920()
{
  return ReviewSummaryReportConcernAction.sendAction.getter();
}

uint64_t sub_100776930()
{
  return ReviewSummaryReportConcernAction.comment.getter();
}

uint64_t sub_100776940()
{
  return ReviewSummaryReportConcernAction.concerns.getter();
}

uint64_t sub_100776950()
{
  return type metadata accessor for ReviewSummaryReportConcernAction();
}

uint64_t sub_100776960()
{
  return SearchFocusDiffablePagePresenter.init(objectGraph:sidePackedPage:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_100776970()
{
  return type metadata accessor for SearchFocusDiffablePagePresenter();
}

uint64_t sub_100776980()
{
  return TopChartDiffableSegmentPresenter.shortName.getter();
}

uint64_t sub_100776990()
{
  return ArcadeDownloadPackSuggestionsPage.suggestions.getter();
}

uint64_t sub_1007769A0()
{
  return ArcadeDownloadPackSuggestionsPage.getAllAction.getter();
}

uint64_t sub_1007769B0()
{
  return ArcadeDownloadPackSuggestionsPage.primaryAction.getter();
}

uint64_t sub_1007769C0()
{
  return ArcadeDownloadPackSuggestionsPage.getAllButtonStyle.getter();
}

uint64_t sub_1007769D0()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionKind.getter();
}

uint64_t sub_1007769E0()
{
  return ArcadeDownloadPackSuggestionsPage.primaryActionSecondaryTitle.getter();
}

uint64_t sub_1007769F0()
{
  return ArcadeDownloadPackSuggestionsPage.title.getter();
}

uint64_t sub_100776A00()
{
  return AvatarShowcaseLayoutConfiguration.visibleWidth.getter();
}

uint64_t sub_100776A10()
{
  return AvatarShowcaseLayoutConfiguration.overlappedWidth.getter();
}

uint64_t sub_100776A20()
{
  return AvatarShowcaseLayoutConfiguration.width.getter();
}

uint64_t sub_100776A30()
{
  return AvatarShowcaseLayoutConfiguration.init(width:visibleWidth:)();
}

uint64_t sub_100776A40()
{
  return type metadata accessor for AvatarShowcaseLayoutConfiguration();
}

uint64_t sub_100776A50()
{
  return CompoundItemSupplementaryProvider.init(children:)();
}

uint64_t sub_100776A60()
{
  return type metadata accessor for CompoundItemSupplementaryProvider();
}

void sub_100776A70(UIViewController a1)
{
}

void sub_100776A80(UIViewController a1)
{
}

uint64_t sub_100776A90()
{
  return FloatingUnifiedMessageCoordinator.register(accountButton:with:for:)();
}

uint64_t sub_100776AA0()
{
  return type metadata accessor for FloatingUnifiedMessageCoordinator();
}

uint64_t sub_100776AB0()
{
  return type metadata accessor for ImpressionsAppendixMetricsTracker();
}

uint64_t sub_100776AC0()
{
  return type metadata accessor for OfferButtonPresenterViewAlignment();
}

uint64_t sub_100776AD0()
{
  return ReusableSupplementaryRegistration.init(elementKind:reuseIdentifier:configurationHandler:)();
}

uint64_t sub_100776AE0()
{
  return dispatch thunk of ShelfComponentTypeMappingProvider.componentType(for:asPartOf:)();
}

uint64_t sub_100776AF0()
{
  return static AskToBuyRequestNotificationDetails.notificationName.getter();
}

uint64_t sub_100776B00()
{
  return static AskToBuyRequestNotificationDetails.adamIdKey.getter();
}

void sub_100776B10(Swift::OpaquePointer a1)
{
}

uint64_t sub_100776B20()
{
  return CompoundCollectionElementsObserver.removingChildren(where:)();
}

uint64_t sub_100776B30()
{
  return CompoundCollectionElementsObserver.addChild(_:)();
}

uint64_t sub_100776B40()
{
  return CompoundCollectionElementsObserver.init(children:)();
}

uint64_t sub_100776B50()
{
  return type metadata accessor for CompoundCollectionElementsObserver();
}

uint64_t sub_100776B60()
{
  return GameCenterFriendRequestCoordinator.onFriendRequestCountDidUpdate.getter();
}

uint64_t sub_100776B70()
{
  return dispatch thunk of GameCenterFriendRequestCoordinator.currentFriendRequestCount.getter();
}

uint64_t sub_100776B80()
{
  return type metadata accessor for GameCenterFriendRequestCoordinator();
}

uint64_t sub_100776B90()
{
  return IndeterminateProgressConfiguration.init(metrics:alignment:theme:)();
}

uint64_t sub_100776BA0()
{
  return type metadata accessor for IndeterminateProgressConfiguration();
}

uint64_t sub_100776BB0()
{
  return MetadataRibbonStarRatingViewLayout.init(starsView:ratingLabelView:metrics:)();
}

uint64_t sub_100776BC0()
{
  return MetadataRibbonStarRatingViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100776BD0()
{
  return MetadataRibbonStarRatingViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100776BE0()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.withStarSize(_:)();
}

uint64_t sub_100776BF0()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.numberOfStars.getter();
}

uint64_t sub_100776C00()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelLineBreakMode.getter();
}

uint64_t sub_100776C10()
{
  return MetadataRibbonStarRatingViewLayout.Metrics.ratingCountLabelNumberOfLines.getter();
}

uint64_t sub_100776C20()
{
  return static MetadataRibbonStarRatingViewLayout.Metrics.standard.getter();
}

uint64_t sub_100776C30()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout.Metrics();
}

uint64_t sub_100776C40()
{
  return type metadata accessor for MetadataRibbonStarRatingViewLayout();
}

void sub_100776C50()
{
}

uint64_t sub_100776C60()
{
  return type metadata accessor for OnDevicePersonalizationDataManager();
}

uint64_t sub_100776C70()
{
  return SearchLandingDiffablePagePresenter.onFocusPageFetched.getter();
}

uint64_t sub_100776C80()
{
  return SearchLandingDiffablePagePresenter.init(objectGraph:supportsFastImpressions:advertLifecycleMetricsReporter:)();
}

uint64_t sub_100776C90()
{
  return type metadata accessor for SearchLandingDiffablePagePresenter();
}

uint64_t sub_100776CA0()
{
  return SearchResultsDiffablePagePresenter.onBeginTrackingGuidedSearchImpressions.getter();
}

uint64_t sub_100776CB0()
{
  return SearchResultsDiffablePagePresenter.onShowNoResults.getter();
}

uint64_t sub_100776CC0()
{
  return SearchResultsDiffablePagePresenter.onDisplayResultsMessage.getter();
}

uint64_t sub_100776CD0()
{
  return SearchResultsDiffablePagePresenter.init(objectGraph:guidedSearchPresenter:facetsPresenter:sponsoredSearchSessionManager:term:searchEntity:origin:source:isNetworkConstrained:spellCheckEnabled:excludedTerms:originatingTerm:guidedSearchTokens:guidedSearchOptimizationTerm:appStateController:impressionsAppendixDataProvider:)();
}

uint64_t sub_100776CE0()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLink.getter();
}

uint64_t sub_100776CF0()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.isAutoPlayEnabled.getter();
}

uint64_t sub_100776D00()
{
  return dispatch thunk of SearchResultsDiffablePagePresenter.transparencyLinkIndex(columnCount:)();
}

uint64_t sub_100776D10()
{
  return SearchResultsDiffablePagePresenter.term.getter();
}

uint64_t sub_100776D20()
{
  return type metadata accessor for SearchResultsDiffablePagePresenter();
}

uint64_t sub_100776D30()
{
  return ShelfBasedCollectionViewController.collectionViewCellProvider(indexPath:item:asPartOf:)();
}

uint64_t sub_100776D40()
{
  return ShelfBasedCollectionViewController.supplementaryViewProvider(elementKind:indexPath:asPartOf:)();
}

uint64_t sub_100776D50()
{
  return ShelfBasedCollectionViewController.makeStateStore()();
}

uint64_t sub_100776D60()
{
  return ShelfBasedCollectionViewController.pageGridProvider.getter();
}

uint64_t sub_100776D70()
{
  return ShelfBasedCollectionViewController.itemLayoutContext(at:)();
}

uint64_t sub_100776D80()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(containing:)();
}

uint64_t sub_100776D90()
{
  return ShelfBasedCollectionViewController.shelfLayoutContext(for:)();
}

uint64_t sub_100776DA0()
{
  return ShelfBasedCollectionViewController.itemSupplementaryProvider.getter();
}

void sub_100776DB0()
{
}

uint64_t sub_100776DC0()
{
  return ShelfBasedCollectionViewController.collectionElementsObserver.getter();
}

uint64_t sub_100776DD0()
{
  return ShelfBasedCollectionViewController.shelfLayoutSpacingProvider.getter();
}

uint64_t sub_100776DE0()
{
  return ShelfBasedCollectionViewController.shelfSupplementaryProvider.getter();
}

uint64_t sub_100776DF0()
{
  return ShelfBasedCollectionViewController.updateGlobalSupplementaries(fitting:)();
}

uint64_t sub_100776E00()
{
  return ShelfBasedCollectionViewController.shelfComponentTypeMappingProvider.getter();
}

uint64_t sub_100776E10()
{
  return ShelfBasedCollectionViewController.compositionalLayoutSectionProvider(section:layoutEnvironment:asPartOf:)();
}

uint64_t sub_100776E20()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.LayoutSize();
}

uint64_t sub_100776E30()
{
  return TodayCardArtworkSizedLayoutMetrics.expandedSize.getter();
}

uint64_t sub_100776E40()
{
  return TodayCardArtworkSizedLayoutMetrics.collapsedSize.getter();
}

uint64_t sub_100776E50()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceCropOverride(for:)();
}

uint64_t sub_100776E60()
{
  return TodayCardArtworkSizedLayoutMetrics.sourceSizeOverride.getter();
}

uint64_t sub_100776E70()
{
  return TodayCardArtworkSizedLayoutMetrics.layout(for:)();
}

uint64_t sub_100776E80()
{
  return type metadata accessor for TodayCardArtworkSizedLayoutMetrics.Priority();
}

uint64_t sub_100776E90()
{
  return static VideoDecoderUnavailableUserInfoKey.playbackId.getter();
}

uint64_t sub_100776EA0()
{
  return static VideoDecoderUnavailableUserInfoKey.error.getter();
}

uint64_t sub_100776EB0()
{
  return static ArcadeDebugSubscriptionStateManager.state.setter();
}

uint64_t sub_100776EC0()
{
  return static ArcadePageScrollToShelfNotification.notificationName.getter();
}

uint64_t sub_100776ED0()
{
  return static ArcadePageScrollToShelfNotification.shelfId.getter();
}

uint64_t sub_100776EE0()
{
  return CondensedAdLockupWithIconBackground.backgroundArtwork.getter();
}

uint64_t sub_100776EF0()
{
  return CondensedAdLockupWithIconBackground.lockup.getter();
}

uint64_t sub_100776F00()
{
  return type metadata accessor for CondensedAdLockupWithIconBackground();
}

uint64_t sub_100776F10()
{
  return static PurchaseCompleteNotificationDetails.purchaseKey.getter();
}

uint64_t sub_100776F20()
{
  return static PurchaseCompleteNotificationDetails.notificationName.getter();
}

uint64_t sub_100776F30()
{
  return SearchAdsCollectionElementsObserver.init(presenter:advertControllerProvider:)();
}

uint64_t sub_100776F40()
{
  return SearchLandingTrendingDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_100776F50()
{
  return type metadata accessor for SearchLandingTrendingDisplayOptions();
}

uint64_t sub_100776F60()
{
  return type metadata accessor for ShelfHorizontalScrollTargetBehavior();
}

uint64_t sub_100776F70()
{
  return dispatch thunk of AnyReusableSupplementaryRegistration.reconfigureSupplementary(at:in:)();
}

uint64_t sub_100776F80()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.prefetchArtwork(for:with:asPartOf:)();
}

uint64_t sub_100776F90()
{
  return dispatch thunk of static ArtworkPrefetchingShelfComponentView.sizingForArtworkPrefetch(in:asPartOf:)();
}

uint64_t sub_100776FA0()
{
  return AutomationCollectionElementsObserver.init()();
}

uint64_t sub_100776FB0()
{
  return type metadata accessor for AutomationCollectionElementsObserver();
}

uint64_t sub_100776FC0()
{
  return LinkableTextCollectionViewCellLayout.Metrics.init(textTopSpace:)();
}

uint64_t sub_100776FD0()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout.Metrics();
}

uint64_t sub_100776FE0()
{
  return LinkableTextCollectionViewCellLayout.init(metrics:textLabel:)();
}

uint64_t sub_100776FF0()
{
  return type metadata accessor for LinkableTextCollectionViewCellLayout();
}

uint64_t sub_100777000()
{
  return type metadata accessor for MetadataRibbonSecondaryViewPlacement();
}

uint64_t sub_100777010()
{
  return PersonalizationFeedbackRequestOption.title.getter();
}

uint64_t sub_100777020()
{
  return PersonalizationFeedbackRequestOption.action.getter();
}

uint64_t sub_100777030()
{
  return static SelectableShelfComponentViewReaction.reapply.getter();
}

uint64_t sub_100777040()
{
  return static SelectableShelfComponentViewReaction.deselect.getter();
}

uint64_t sub_100777050()
{
  return static SelectableShelfComponentViewReaction.propagate.getter();
}

uint64_t sub_100777060()
{
  return type metadata accessor for SelectableShelfComponentViewReaction();
}

uint64_t sub_100777070()
{
  return dispatch thunk of static SeparatorProvidingShelfComponentView.separator(in:)();
}

uint64_t sub_100777080()
{
  return type metadata accessor for UserNotificationsAuthorizationAction();
}

uint64_t sub_100777090()
{
  return ImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:)();
}

uint64_t sub_1007770A0()
{
  return type metadata accessor for ImpressionsCollectionElementsObserver();
}

uint64_t sub_1007770B0()
{
  return MetadataRibbonEditorsChoiceViewLayout.init(leadingLaurelView:trailingLaurelView:textLabel:metrics:)();
}

uint64_t sub_1007770C0()
{
  return MetadataRibbonEditorsChoiceViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007770D0()
{
  return MetadataRibbonEditorsChoiceViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_1007770E0()
{
  return static MetadataRibbonEditorsChoiceViewLayout.Metrics.standard.getter();
}

uint64_t sub_1007770F0()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout.Metrics();
}

uint64_t sub_100777100()
{
  return type metadata accessor for MetadataRibbonEditorsChoiceViewLayout();
}

uint64_t sub_100777110()
{
  return MetadataRibbonIconWithLabelViewLayout.init(descriptionLabelView:artworkView:metrics:)();
}

uint64_t sub_100777120()
{
  return MetadataRibbonIconWithLabelViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100777130()
{
  return MetadataRibbonIconWithLabelViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100777140()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.labelNumberOfLines.getter();
}

uint64_t sub_100777150()
{
  return MetadataRibbonIconWithLabelViewLayout.Metrics.defaultArtworkHeight.getter();
}

uint64_t sub_100777160()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.standard.getter();
}

uint64_t sub_100777170()
{
  return static MetadataRibbonIconWithLabelViewLayout.Metrics.developer.getter();
}

uint64_t sub_100777180()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout.Metrics();
}

uint64_t sub_100777190()
{
  return type metadata accessor for MetadataRibbonIconWithLabelViewLayout();
}

uint64_t sub_1007771A0()
{
  return type metadata accessor for ShelfBackgroundMaterialGradientColors();
}

uint64_t sub_1007771B0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.facetsPresenter.getter();
}

uint64_t sub_1007771C0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.init(objectGraph:pageUrl:facetsPresenter:metricsPipeline:)();
}

uint64_t sub_1007771D0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.displayStyle.getter();
}

uint64_t sub_1007771E0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.title.getter();
}

uint64_t sub_1007771F0()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData.subtitle.getter();
}

uint64_t sub_100777200()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter.EmptyStateData();
}

uint64_t sub_100777210()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.onShowEmptyState.getter();
}

void sub_100777220()
{
}

void sub_100777230()
{
}

void sub_100777240()
{
}

uint64_t sub_100777250()
{
  return ArcadeSeeAllGamesDiffablePagePresenter.pageTitle.getter();
}

uint64_t sub_100777260()
{
  return type metadata accessor for ArcadeSeeAllGamesDiffablePagePresenter();
}

uint64_t sub_100777270()
{
  return ArcadeSubscriptionOfferButtonPresenter.init(displayProperties:buttonAction:subscribedButtonAction:subtitlePosition:asPartOf:alignment:)();
}

uint64_t sub_100777280()
{
  return type metadata accessor for ArcadeSubscriptionOfferButtonPresenter();
}

uint64_t sub_100777290()
{
  return dispatch thunk of InlineUnifiedMessageProvidingPresenter.inlineUnifiedMessagePresenter.getter();
}

uint64_t sub_1007772A0()
{
  return SearchFocusTwoColumnListDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_1007772B0()
{
  return type metadata accessor for SearchFocusTwoColumnListDisplayOptions();
}

uint64_t sub_1007772C0()
{
  return static StandardSearchResultContentViewMetrics.bottomMargin.getter();
}

uint64_t sub_1007772D0()
{
  return BadgeContentKeyNumberOfAvatarsToDisplay.getter();
}

uint64_t sub_1007772E0()
{
  return MediumAdLockupWithScreenshotsBackground.riverSpeed.getter();
}

uint64_t sub_1007772F0()
{
  return MediumAdLockupWithScreenshotsBackground.screenshots.getter();
}

uint64_t sub_100777300()
{
  return MediumAdLockupWithScreenshotsBackground.backgroundColor.getter();
}

uint64_t sub_100777310()
{
  return MediumAdLockupWithScreenshotsBackground.secondaryTextColor.getter();
}

uint64_t sub_100777320()
{
  return MediumAdLockupWithScreenshotsBackground.lockup.getter();
}

uint64_t sub_100777330()
{
  return type metadata accessor for MediumAdLockupWithScreenshotsBackground();
}

uint64_t sub_100777340()
{
  return MetadataRibbonHighlightedTextViewLayout.init(descriptionLabelTextView:metrics:)();
}

uint64_t sub_100777350()
{
  return MetadataRibbonHighlightedTextViewLayout.measurements(fitting:in:)();
}

uint64_t sub_100777360()
{
  return MetadataRibbonHighlightedTextViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100777370()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.init(maximumNumberofLinesForDescriptionLabel:)();
}

uint64_t sub_100777380()
{
  return MetadataRibbonHighlightedTextViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100777390()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout.Metrics();
}

uint64_t sub_1007773A0()
{
  return type metadata accessor for MetadataRibbonHighlightedTextViewLayout();
}

uint64_t sub_1007773B0()
{
  return Box.read<A>(with:)();
}

uint64_t sub_1007773C0()
{
  return Box.init(value:)();
}

uint64_t sub_1007773D0()
{
  return Box.write(with:)();
}

uint64_t sub_1007773E0()
{
  return ArtworkLoadingCollectionElementsObserver.init(componentTypeMappingProvider:)();
}

uint64_t sub_1007773F0()
{
  return type metadata accessor for ArtworkLoadingCollectionElementsObserver();
}

uint64_t sub_100777400()
{
  return PersonalizationTransparencyPagePresenter.init(objectGraph:)();
}

uint64_t sub_100777410()
{
  return dispatch thunk of PersonalizationTransparencyPagePresenter.view.setter();
}

uint64_t sub_100777420()
{
  return type metadata accessor for PersonalizationTransparencyPagePresenter();
}

uint64_t sub_100777430()
{
  return UpdateGranularNotificationSettingsAction.init(settingIDs:)();
}

uint64_t sub_100777440()
{
  return UpdateGranularNotificationSettingsAction.settingIDs.getter();
}

uint64_t sub_100777450()
{
  return type metadata accessor for UpdateGranularNotificationSettingsAction();
}

uint64_t sub_100777460()
{
  return ArcadeDownloadPackCategoriesPagePresenter.init(objectGraph:subscriptionStatus:)();
}

uint64_t sub_100777470()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapSkipButton()();
}

uint64_t sub_100777480()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapContinueButton()();
}

uint64_t sub_100777490()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.view.setter();
}

uint64_t sub_1007774A0()
{
  return dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.toggle(category:)();
}

uint64_t sub_1007774B0()
{
  return type metadata accessor for ArcadeDownloadPackCategoriesPagePresenter();
}

uint64_t sub_1007774C0()
{
  return TodayCardMediaMediumLockupWithScreenshots.mediumAdLockupWithScreenshotsBackground.getter();
}

uint64_t sub_1007774D0()
{
  return type metadata accessor for TodayCardMediaMediumLockupWithScreenshots();
}

uint64_t sub_1007774E0()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.hasAskToBuy.getter();
}

uint64_t sub_1007774F0()
{
  return ArcadeDownloadPackSuggestionsPagePresenter.init(objectGraph:categories:subscriptionStatus:)();
}

uint64_t sub_100777500()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
}

uint64_t sub_100777510()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapGetAllButton()();
}

uint64_t sub_100777520()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.page.getter();
}

uint64_t sub_100777530()
{
  return dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.view.setter();
}

uint64_t sub_100777540()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePresenter();
}

uint64_t sub_100777550()
{
  return NestedCollectionViewImpressionsCoordinator.init(collectionView:)();
}

uint64_t sub_100777560()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.prepareForReuse()();
}

uint64_t sub_100777570()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.impressionsCalculator.setter();
}

uint64_t sub_100777580()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.models.setter();
}

uint64_t sub_100777590()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(for:at:)();
}

uint64_t sub_1007775A0()
{
  return dispatch thunk of NestedCollectionViewImpressionsCoordinator.register(model:for:)();
}

uint64_t sub_1007775B0()
{
  return type metadata accessor for NestedCollectionViewImpressionsCoordinator();
}

uint64_t sub_1007775C0()
{
  return SelectionHandlerCollectionElementsObserver.init(presenter:componentHeightCache:)();
}

uint64_t sub_1007775D0()
{
  return type metadata accessor for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_1007775E0()
{
  return method lookup function for SelectionHandlerCollectionElementsObserver();
}

uint64_t sub_1007775F0()
{
  return SelectionHandlerCollectionElementsObserver.deinit();
}

uint64_t sub_100777600()
{
  return SearchImpressionsCollectionElementsObserver.init(componentTypeMappingProvider:impressionsCalculator:advertRotationControllerProvider:objectGraph:collectionView:)();
}

uint64_t sub_100777610()
{
  return type metadata accessor for SearchImpressionsCollectionElementsObserver();
}

uint64_t sub_100777620()
{
  return UnimplementedAdvertLifecycleMetricsReporter.init()();
}

uint64_t sub_100777630()
{
  return type metadata accessor for UnimplementedAdvertLifecycleMetricsReporter();
}

uint64_t sub_100777640()
{
  return VideoRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_100777650()
{
  return type metadata accessor for VideoRegistrationCollectionElementsObserver();
}

uint64_t sub_100777660()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.measurements(fitting:in:)();
}

uint64_t sub_100777670()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100777680()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.Metrics.artworkSize.getter();
}

uint64_t sub_100777690()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout.Metrics();
}

uint64_t sub_1007776A0()
{
  return ChartOrCategoryBrickCollectionViewCellLayout.init(context:badgeTextView:titleTextView:artworkView:textExclusionRect:)();
}

uint64_t sub_1007776B0()
{
  return type metadata accessor for ChartOrCategoryBrickCollectionViewCellLayout();
}

uint64_t sub_1007776C0()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.modelContainment.getter();
}

uint64_t sub_1007776D0()
{
  return ComponentContainerCollectionElementsObserver.ContainerDelegate.itemLayoutContext.getter();
}

uint64_t sub_1007776E0()
{
  return dispatch thunk of ComponentContainerCollectionElementsObserver.ContainerDelegate.indexPath(ofItem:)();
}

uint64_t sub_1007776F0()
{
  return ComponentContainerCollectionElementsObserver.init(presenter:parent:scrollObserver:impressionsCalculator:)();
}

uint64_t sub_100777700()
{
  return type metadata accessor for ComponentContainerCollectionElementsObserver();
}

uint64_t sub_100777710()
{
  return ModelMappedDiffableDataSourceContentSnapshot.identifierSnapshot.getter();
}

uint64_t sub_100777720()
{
  return ModelMappedDiffableDataSourceContentSnapshot.itemModel(for:)();
}

uint64_t sub_100777730()
{
  return ModelMappedDiffableDataSourceContentSnapshot.sectionModel(at:)();
}

uint64_t sub_100777740()
{
  return ModelMappedDiffableDataSourceContentSnapshot.reloadedItems.getter();
}

uint64_t sub_100777750()
{
  return BadgeContentKeyNumberOfFriendsBeforeTruncation.getter();
}

uint64_t sub_100777760()
{
  return InlineUnifiedMessageCollectionElementsObserver.init(presenter:parentViewController:)();
}

uint64_t sub_100777770()
{
  return type metadata accessor for InlineUnifiedMessageCollectionElementsObserver();
}

uint64_t sub_100777780()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.columnCount.getter();
}

uint64_t sub_100777790()
{
  return SearchChartsAndCategoriesDiffablePagePresenter.init(objectGraph:pageUrl:)();
}

uint64_t sub_1007777A0()
{
  return type metadata accessor for SearchChartsAndCategoriesDiffablePagePresenter();
}

uint64_t sub_1007777B0()
{
  return SearchLandingChartsAndCategoriesDisplayOptions.numberOfColumns.getter();
}

uint64_t sub_1007777C0()
{
  return type metadata accessor for SearchLandingChartsAndCategoriesDisplayOptions();
}

uint64_t sub_1007777D0()
{
  return ShelfBasedCollectionViewControllerDependencies.init()();
}

uint64_t sub_1007777E0()
{
  return type metadata accessor for ShelfBasedCollectionViewControllerDependencies();
}

uint64_t sub_1007777F0()
{
  return OnDemandShelfFetchingCollectionElementsObserver.init(presenter:)();
}

uint64_t sub_100777800()
{
  return type metadata accessor for OnDemandShelfFetchingCollectionElementsObserver();
}

uint64_t sub_100777810()
{
  return Gate.add(condition:)();
}

uint64_t sub_100777820()
{
  return Gate.init(queue:passingDelay:)();
}

uint64_t sub_100777830()
{
  return Gate.observer.setter();
}

uint64_t sub_100777840()
{
  return dispatch thunk of Gate.Condition.isSatisfied.setter();
}

uint64_t sub_100777850()
{
  return Gate.Condition.init(initialValue:)();
}

uint64_t sub_100777860()
{
  return type metadata accessor for Gate.Condition();
}

uint64_t sub_100777870()
{
  return type metadata accessor for Gate();
}

uint64_t sub_100777880()
{
  return Uber.iconArtwork.getter();
}

uint64_t sub_100777890()
{
  return Uber.compactArtwork.getter();
}

uint64_t sub_1007778A0()
{
  return type metadata accessor for Uber.Style();
}

uint64_t sub_1007778B0()
{
  return Uber.init(style:assetType:artwork:compactArtwork:video:compactVideo:iconArtwork:title:)();
}

uint64_t sub_1007778C0()
{
  return Uber.style.getter();
}

uint64_t sub_1007778D0()
{
  return Uber.title.getter();
}

uint64_t sub_1007778E0()
{
  return Uber.video.getter();
}

uint64_t sub_1007778F0()
{
  return Uber.artwork.getter();
}

uint64_t sub_100777900()
{
  return type metadata accessor for Uber.AssetType();
}

uint64_t sub_100777910()
{
  return Uber.assetType.getter();
}

uint64_t sub_100777920()
{
  return type metadata accessor for Uber();
}

uint64_t sub_100777930()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.countTitle.getter();
}

uint64_t sub_100777940()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.primaryButtonEnabled.getter();
}

uint64_t sub_100777950()
{
  return ArcadeDownloadPackCategoriesPagePresenterViewState.categorySelectionEnabled.getter();
}

uint64_t sub_100777960()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPageGetAllButtonStyle();
}

uint64_t sub_100777970()
{
  return type metadata accessor for ArcadeDownloadPackSuggestionsPagePrimaryActionKind();
}

uint64_t sub_100777980()
{
  return PlayableViewRegistrationCollectionElementsObserver.init()();
}

uint64_t sub_100777990()
{
  return type metadata accessor for PlayableViewRegistrationCollectionElementsObserver();
}

uint64_t sub_1007779A0()
{
  return dispatch thunk of VisibleShelfSupplementaryCollectionElementsObserver.reconfigureVisibleShelfSupplementaries<A>(in:asPartOf:)();
}

uint64_t sub_1007779B0()
{
  return VisibleShelfSupplementaryCollectionElementsObserver.init()();
}

uint64_t sub_1007779C0()
{
  return type metadata accessor for VisibleShelfSupplementaryCollectionElementsObserver();
}

uint64_t sub_1007779D0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.init(borderedTextView:descriptionLabelTextView:metrics:)();
}

uint64_t sub_1007779E0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.measurements(fitting:in:)();
}

uint64_t sub_1007779F0()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100777A00()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.init(borderTextToLabelPadding:maximumNumberofLinesForDescriptionLabel:maximumNumberOfLinesForBorderedLabel:)();
}

uint64_t sub_100777A10()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberOfLinesForBorderedLabel.getter();
}

uint64_t sub_100777A20()
{
  return MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics.maximumNumberofLinesForDescriptionLabel.getter();
}

uint64_t sub_100777A30()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout.Metrics();
}

uint64_t sub_100777A40()
{
  return type metadata accessor for MetadataRibbonBorderedLabelWithDescriptionViewLayout();
}

uint64_t sub_100777A50()
{
  return Badge.clickAction.getter();
}

uint64_t sub_100777A60()
{
  return Badge.longCaption.getter();
}

uint64_t sub_100777A70()
{
  return Badge.isMonochrome.getter();
}

uint64_t sub_100777A80()
{
  return Badge.leadingValue.getter();
}

uint64_t sub_100777A90()
{
  return dispatch thunk of Badge.isTruncatable.getter();
}

uint64_t sub_100777AA0()
{
  return Badge.impressionMetrics.getter();
}

uint64_t sub_100777AB0()
{
  return Badge.accessibilityTitle.getter();
}

uint64_t sub_100777AC0()
{
  return Badge.accessibilityCaption.getter();
}

uint64_t sub_100777AD0()
{
  return dispatch thunk of Badge.accessibilityIdentifier.getter();
}

uint64_t sub_100777AE0()
{
  return Badge.init(id:type:heading:caption:longCaption:content:leadingValue:style:accessibilityTitle:accessibilityCaption:clickAction:artwork:trailingArtwork:isMonochrome:impressionMetrics:)();
}

uint64_t sub_100777AF0()
{
  return Badge.id.getter();
}

uint64_t sub_100777B00()
{
  return Badge.type.getter();
}

uint64_t sub_100777B10()
{
  return Badge.style.getter();
}

uint64_t sub_100777B20()
{
  return Badge.artwork.getter();
}

uint64_t sub_100777B30()
{
  return Badge.caption.getter();
}

uint64_t sub_100777B40()
{
  return Badge.content.getter();
}

uint64_t sub_100777B50()
{
  return Badge.heading.getter();
}

uint64_t sub_100777B60()
{
  return type metadata accessor for Badge();
}

uint64_t sub_100777B70()
{
  return Brick.accessibilityLabel.getter();
}

uint64_t sub_100777B80()
{
  return Brick.shortEditorialDescription.getter();
}

uint64_t sub_100777B90()
{
  return type metadata accessor for Brick();
}

uint64_t sub_100777BA0()
{
  return Quote.isFullWidthArtwork.getter();
}

uint64_t sub_100777BB0()
{
  return Quote.text.getter();
}

uint64_t sub_100777BC0()
{
  return Quote.credit.getter();
}

uint64_t sub_100777BD0()
{
  return Quote.artwork.getter();
}

uint64_t sub_100777BE0()
{
  return type metadata accessor for Quote();
}

uint64_t sub_100777BF0()
{
  return Shelf.background.getter();
}

uint64_t sub_100777C00()
{
  return Shelf.ContentType.doesModelContainment.getter();
}

uint64_t sub_100777C10()
{
  return Shelf.ContentType.string.getter();
}

uint64_t sub_100777C20()
{
  return Shelf.ContentType.rawValue.getter();
}

uint64_t sub_100777C30()
{
  return type metadata accessor for Shelf.ContentType();
}

uint64_t sub_100777C40()
{
  return Shelf.contentType.getter();
}

uint64_t sub_100777C50()
{
  return Shelf.footerTitle.getter();
}

uint64_t sub_100777C60()
{
  return Shelf.isHorizontal.getter();
}

uint64_t sub_100777C70()
{
  return Shelf.seeAllAction.getter();
}

uint64_t sub_100777C80()
{
  return Shelf.titleArtwork.getter();
}

uint64_t sub_100777C90()
{
  return Shelf.rowsPerColumn.getter();
}

uint64_t sub_100777CA0()
{
  return Shelf.eyebrowArtwork.getter();
}

uint64_t sub_100777CB0()
{
  return Shelf.accessoryAction.getter();
}

uint64_t sub_100777CC0()
{
  return Shelf.trailingArtwork.getter();
}

uint64_t sub_100777CD0()
{
  return type metadata accessor for Shelf.ContentsMetadata();
}

uint64_t sub_100777CE0()
{
  return Shelf.contentsMetadata.getter();
}

uint64_t sub_100777CF0()
{
  return static Shelf.PresentationHints.isSeeAllContext.getter();
}

uint64_t sub_100777D00()
{
  return static Shelf.PresentationHints.isAppleArcadeContext.getter();
}

uint64_t sub_100777D10()
{
  return static Shelf.PresentationHints.showSupplementaryText.getter();
}

uint64_t sub_100777D20()
{
  return static Shelf.PresentationHints.inProductPageSpotlight.getter();
}

uint64_t sub_100777D30()
{
  return static Shelf.PresentationHints.accessoriesFollowBackground.getter();
}

uint64_t sub_100777D40()
{
  return static Shelf.PresentationHints.sortable.getter();
}

uint64_t sub_100777D50()
{
  return type metadata accessor for Shelf.PresentationHints();
}

uint64_t sub_100777D60()
{
  return Shelf.impressionMetrics.getter();
}

uint64_t sub_100777D70()
{
  return Shelf.presentationHints.getter();
}

uint64_t sub_100777D80()
{
  return Shelf.prefetchableArtwork.getter();
}

uint64_t sub_100777D90()
{
  return Shelf.placeholderContentType.getter();
}

uint64_t sub_100777DA0()
{
  return Shelf.init(id:contentType:placeholderContentType:marker:items:header:url:mergeWhenFetched:batchGroup:fetchStrategy:footerTitle:footerAction:isHidden:isHorizontal:horizontalScrollTargetBehavior:isPersonalized:rowsPerColumn:background:onShouldRemoveModel:removeModelEvents:presentationHints:contentsMetadata:nextPreferredContentRefreshDate:impressionMetrics:refreshUrl:pageChangeMetrics:adIncidents:)();
}

uint64_t sub_100777DB0()
{
  return Shelf.id.getter();
}

uint64_t sub_100777DC0()
{
  return Shelf.items.getter();
}

uint64_t sub_100777DD0()
{
  return Shelf.title.getter();
}

uint64_t sub_100777DE0()
{
  return Shelf.header.getter();
}

uint64_t sub_100777DF0()
{
  return Shelf.eyebrow.getter();
}

uint64_t sub_100777E00()
{
  return Shelf.isHidden.getter();
}

uint64_t sub_100777E10()
{
  return Shelf.subtitle.getter();
}

uint64_t sub_100777E20()
{
  return type metadata accessor for Shelf();
}

uint64_t sub_100777E30()
{
  return Video.playbackId.getter();
}

uint64_t sub_100777E40()
{
  return Video.allowsAutoPlay.getter();
}

uint64_t sub_100777E50()
{
  return Video.playbackControls.getter();
}

uint64_t sub_100777E60()
{
  return Video.canPlayFullScreen.getter();
}

uint64_t sub_100777E70()
{
  return Video.templateClickEvent.getter();
}

uint64_t sub_100777E80()
{
  return Video.templateMediaEvent.getter();
}

uint64_t sub_100777E90()
{
  return Video.autoPlayPlaybackControls.getter();
}

uint64_t sub_100777EA0()
{
  return Video.looping.getter();
}

uint64_t sub_100777EB0()
{
  return Video.preview.getter();
}

uint64_t sub_100777EC0()
{
  return Video.videoUrl.getter();
}

uint64_t sub_100777ED0()
{
  return type metadata accessor for Video();
}

uint64_t sub_100777EE0()
{
  return dispatch thunk of Action.clickSender.getter();
}

uint64_t sub_100777EF0()
{
  return dispatch thunk of Action.clickSender.setter();
}

uint64_t sub_100777F00()
{
  return Action.actionMetrics.getter();
}

uint64_t sub_100777F10()
{
  return Action.impressionMetrics.getter();
}

uint64_t sub_100777F20()
{
  return Action.presentationStyle.getter();
}

uint64_t sub_100777F30()
{
  return Action.init(id:title:artwork:presentationStyle:actionMetrics:impressionMetrics:)();
}

uint64_t sub_100777F40()
{
  return Action.id.getter();
}

uint64_t sub_100777F50()
{
  return Action.title.getter();
}

uint64_t sub_100777F60()
{
  return Action.artwork.getter();
}

uint64_t sub_100777F70()
{
  return type metadata accessor for Action();
}

uint64_t sub_100777F80()
{
  return AdamId.numberValue.getter();
}

uint64_t sub_100777F90()
{
  return AdamId.stringValue.getter();
}

uint64_t sub_100777FA0()
{
  return static AdamId.== infix(_:_:)();
}

uint64_t sub_100777FB0()
{
  return AdamId.init(value:)();
}

uint64_t sub_100777FC0()
{
  return AdamId.init(value:)();
}

uint64_t sub_100777FD0()
{
  return type metadata accessor for AdamId();
}

uint64_t sub_100777FE0()
{
  return Banner.hideCriteria.getter();
}

uint64_t sub_100777FF0()
{
  return Banner.leadingArtwork.getter();
}

uint64_t sub_100778000()
{
  return Banner.includeBackgroundBorder.getter();
}

uint64_t sub_100778010()
{
  return Banner.leadingArtworkTintColor.getter();
}

uint64_t sub_100778020()
{
  return Banner.action.getter();
}

uint64_t sub_100778030()
{
  return Banner.message.getter();
}

uint64_t sub_100778040()
{
  return type metadata accessor for Banner();
}

uint64_t sub_100778050()
{
  return Lockup.clickAction.getter();
}

uint64_t sub_100778060()
{
  return dispatch thunk of Lockup.clickSender.getter();
}

uint64_t sub_100778070()
{
  return dispatch thunk of Lockup.decorations.getter();
}

uint64_t sub_100778080()
{
  return Lockup.ratingCount.getter();
}

uint64_t sub_100778090()
{
  return Lockup.buttonAction.getter();
}

uint64_t sub_1007780A0()
{
  return Lockup.useAdsLocale.getter();
}

uint64_t sub_1007780B0()
{
  return Lockup.tertiaryTitle.getter();
}

uint64_t sub_1007780C0()
{
  return Lockup.crossLinkTitle.getter();
}

uint64_t sub_1007780D0()
{
  return Lockup.contextMenuData.getter();
}

uint64_t sub_1007780E0()
{
  return Lockup.includeBetaApps.getter();
}

uint64_t sub_1007780F0()
{
  return Lockup.isEditorsChoice.getter();
}

uint64_t sub_100778100()
{
  return Lockup.developerTagline.getter();
}

uint64_t sub_100778110()
{
  return Lockup.editorialTagline.getter();
}

uint64_t sub_100778120()
{
  return Lockup.crossLinkSubtitle.getter();
}

uint64_t sub_100778130()
{
  return Lockup.impressionMetrics.getter();
}

uint64_t sub_100778140()
{
  return Lockup.subtitleTextColor.getter();
}

uint64_t sub_100778150()
{
  return Lockup.subtitleTextFilter.getter();
}

uint64_t sub_100778160()
{
  return Lockup.editorialDescription.getter();
}

uint64_t sub_100778170()
{
  return Lockup.offerDisplayProperties.getter();
}

uint64_t sub_100778180()
{
  return Lockup.shortEditorialDescription.getter();
}

uint64_t sub_100778190()
{
  return Lockup.icon.getter();
}

uint64_t sub_1007781A0()
{
  return Lockup.title.getter();
}

uint64_t sub_1007781B0()
{
  return Lockup.adamId.getter();
}

uint64_t sub_1007781C0()
{
  return Lockup.rating.getter();
}

uint64_t sub_1007781D0()
{
  return dispatch thunk of Lockup.artwork.getter();
}

uint64_t sub_1007781E0()
{
  return Lockup.heading.getter();
}

uint64_t sub_1007781F0()
{
  return Lockup.ordinal.getter();
}

uint64_t sub_100778200()
{
  return Lockup.bundleId.getter();
}

uint64_t sub_100778210()
{
  return Lockup.children.getter();
}

uint64_t sub_100778220()
{
  return Lockup.searchAd.getter();
}

uint64_t sub_100778230()
{
  return Lockup.subtitle.getter();
}

uint64_t sub_100778240()
{
  return Lockup.ageRating.getter();
}

uint64_t sub_100778250()
{
  return type metadata accessor for Lockup();
}

uint64_t sub_100778260()
{
  return Review.moreAction.getter();
}

uint64_t sub_100778270()
{
  return Review.reviewerName.getter();
}

uint64_t sub_100778280()
{
  return Review.dateAuthorText.getter();
}

uint64_t sub_100778290()
{
  return Review.init(id:title:date:dateText:badge:contents:rating:reviewerName:dateAuthorText:response:moreAction:flowPreviewActionsConfiguration:impressionMetrics:voteActions:)();
}

uint64_t sub_1007782A0()
{
  return Review.id.getter();
}

uint64_t sub_1007782B0()
{
  return Review.title.getter();
}

uint64_t sub_1007782C0()
{
  return Review.rating.getter();
}

uint64_t sub_1007782D0()
{
  return Review.contents.getter();
}

uint64_t sub_1007782E0()
{
  return Review.dateText.getter();
}

uint64_t sub_1007782F0()
{
  return Review.response.getter();
}

uint64_t sub_100778300()
{
  return type metadata accessor for Review();
}

uint64_t sub_100778310()
{
  return Shadow.blurRadius.getter();
}

uint64_t sub_100778320()
{
  return Shadow.init(color:blurRadius:offset:)();
}

uint64_t sub_100778330()
{
  return Shadow.color.getter();
}

uint64_t sub_100778340()
{
  return Shadow.offset.getter();
}

uint64_t sub_100778350()
{
  return type metadata accessor for Shadow();
}

uint64_t sub_100778360()
{
  return inject(_:from:)();
}

uint64_t sub_100778370()
{
  return inject(_:from:)();
}

uint64_t sub_100778380()
{
  return inject(_:from:)();
}

uint64_t sub_100778390()
{
  return inject(_:from:)();
}

uint64_t sub_1007783A0()
{
  return inject(_:from:)();
}

uint64_t sub_1007783B0()
{
  return inject(_:from:)();
}

uint64_t sub_1007783C0()
{
  return inject(_:from:)();
}

uint64_t sub_1007783D0()
{
  return inject(_:from:)();
}

uint64_t sub_1007783E0()
{
  return inject(_:from:)();
}

uint64_t sub_1007783F0()
{
  return inject(_:from:)();
}

uint64_t sub_100778400()
{
  return dispatch thunk of Artwork.isPortrait.getter();
}

uint64_t sub_100778410()
{
  return Artwork.URLTemplate.isSystemImage.getter();
}

uint64_t sub_100778420()
{
  return static Artwork.URLTemplate.resourceScheme.getter();
}

uint64_t sub_100778430()
{
  return Artwork.URLTemplate.init(rawValue:)();
}

uint64_t sub_100778440()
{
  return Artwork.URLTemplate.rawValue.getter();
}

uint64_t sub_100778450()
{
  return type metadata accessor for Artwork.URLTemplate();
}

uint64_t sub_100778460()
{
  return dispatch thunk of Artwork.bestVariant(prefersLayeredImage:)();
}

uint64_t sub_100778470()
{
  return Artwork.contentMode.getter();
}

uint64_t sub_100778480()
{
  return dispatch thunk of Artwork.isLandscape.getter();
}

uint64_t sub_100778490()
{
  return dispatch thunk of Artwork.isLocalImage.getter();
}

uint64_t sub_1007784A0()
{
  return dispatch thunk of Artwork.isBundleImage.getter();
}

uint64_t sub_1007784B0()
{
  return dispatch thunk of Artwork.isSystemImage.getter();
}

uint64_t sub_1007784C0()
{
  return Artwork.backgroundColor.getter();
}

uint64_t sub_1007784D0()
{
  return dispatch thunk of Artwork.systemImageName.getter();
}

uint64_t sub_1007784E0()
{
  return Artwork.backgroundGradientColor.getter();
}

uint64_t sub_1007784F0()
{
  return dispatch thunk of Artwork.symbolImageMeasurements(using:fallBackSize:)();
}

uint64_t sub_100778500()
{
  return static Artwork.== infix(_:_:)();
}

uint64_t sub_100778510()
{
  return dispatch thunk of Artwork.__allocating_init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)();
}

uint64_t sub_100778520()
{
  return Artwork.init(id:template:size:backgroundColor:backgroundGradientColor:style:crop:contentMode:variants:impressionMetrics:)();
}

uint64_t sub_100778530()
{
  return static Artwork.Crop.sourceSize.getter();
}

uint64_t sub_100778540()
{
  return static Artwork.Crop.boundingBox.getter();
}

uint64_t sub_100778550()
{
  return Artwork.Crop.preferredContentMode.getter();
}

uint64_t sub_100778560()
{
  return static Artwork.Crop.fn.getter();
}

uint64_t sub_100778570()
{
  return type metadata accessor for Artwork.Crop();
}

uint64_t sub_100778580()
{
  return Artwork.crop.getter();
}

uint64_t sub_100778590()
{
  return Artwork.size.getter();
}

uint64_t sub_1007785A0()
{
  return Artwork.Style.cornerStyle.getter();
}

uint64_t sub_1007785B0()
{
  return Artwork.Style.iconHeight(fromWidth:)();
}

uint64_t sub_1007785C0()
{
  return Artwork.Style.orIfUnspecified(_:)();
}

uint64_t sub_1007785D0()
{
  return Artwork.Style.iconCornerRadius(for:)();
}

uint64_t sub_1007785E0()
{
  return Artwork.Style.iconWidth(fromHeight:)();
}

uint64_t sub_1007785F0()
{
  return type metadata accessor for Artwork.Style();
}

uint64_t sub_100778600()
{
  return Artwork.style.getter();
}

uint64_t sub_100778610()
{
  return type metadata accessor for Artwork.Format();
}

uint64_t sub_100778620()
{
  return Artwork.config(using:cropCodeOverride:prefersLayeredImage:)();
}

uint64_t sub_100778630()
{
  return Artwork.config(using:)();
}

uint64_t sub_100778640()
{
  return Artwork.config(_:mode:prefersLayeredImage:)();
}

uint64_t sub_100778650()
{
  return Artwork.Variant.format.getter();
}

uint64_t sub_100778660()
{
  return Artwork.Variant.quality.getter();
}

uint64_t sub_100778670()
{
  return type metadata accessor for Artwork.Variant();
}

uint64_t sub_100778680()
{
  return Artwork.artwork.getter();
}

uint64_t sub_100778690()
{
  return Artwork.template.getter();
}

uint64_t sub_1007786A0()
{
  return type metadata accessor for Artwork();
}

uint64_t sub_1007786B0()
{
  return type metadata accessor for Feature.iOS();
}

uint64_t sub_1007786C0()
{
  return type metadata accessor for Feature();
}

uint64_t sub_1007786D0()
{
  return PageTab.id.getter();
}

uint64_t sub_1007786E0()
{
  return PageTab.title.getter();
}

uint64_t sub_1007786F0()
{
  return PageTab.action.getter();
}

uint64_t sub_100778700()
{
  return Ratings.totalNumberOfRatings.getter();
}

uint64_t sub_100778710()
{
  return Ratings.ratingCounts.getter();
}

uint64_t sub_100778720()
{
  return Ratings.ratingAverage.getter();
}

uint64_t sub_100778730()
{
  return Ratings.status.getter();
}

uint64_t sub_100778740()
{
  return type metadata accessor for Ratings();
}

uint64_t sub_100778750()
{
  return dispatch thunk of Commerce.cancelPreorder(for:isArcade:)();
}

uint64_t sub_100778760()
{
  return dispatch thunk of Commerce.purchase(with:stateMachine:)();
}

uint64_t sub_100778770()
{
  return type metadata accessor for Commerce();
}

uint64_t sub_100778780()
{
  return Copyable.copyWithOverrides(in:)();
}

uint64_t sub_100778790()
{
  return FlowPage.isPreviewingSupported.getter();
}

uint64_t sub_1007787A0()
{
  return type metadata accessor for FlowPage();
}

uint64_t sub_1007787B0()
{
  return dispatch thunk of Footnote.clickAction.getter();
}

uint64_t sub_1007787C0()
{
  return dispatch thunk of Footnote.clickSender.getter();
}

uint64_t sub_1007787D0()
{
  return Footnote.presentationStyle.getter();
}

uint64_t sub_1007787E0()
{
  return Footnote.text.getter();
}

uint64_t sub_1007787F0()
{
  return type metadata accessor for Footnote();
}

uint64_t sub_100778800()
{
  return static PageGrid.Breakpoint.== infix(_:_:)();
}

uint64_t sub_100778810()
{
  return PageGrid.Breakpoint.init(range:columnCount:columnExtendsToFillWidth:minimumColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_100778820()
{
  return PageGrid.Breakpoint.init(range:columnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_100778830()
{
  return PageGrid.Breakpoint.init(range:centeredColumnWidth:interColumnSpace:interRowSpace:horizontalMargins:additionalSafeAreaHorizontalMargins:)();
}

uint64_t sub_100778840()
{
  return PageGrid.Breakpoint.centered.getter();
}

uint64_t sub_100778850()
{
  return type metadata accessor for PageGrid.Breakpoint();
}

uint64_t sub_100778860()
{
  return PageGrid.columnCount.getter();
}

uint64_t sub_100778870()
{
  return PageGrid.columnWidth.getter();
}

uint64_t sub_100778880()
{
  return PageGrid.interRowSpace.getter();
}

uint64_t sub_100778890()
{
  return PageGrid.containerWidth.getter();
}

uint64_t sub_1007788A0()
{
  return PageGrid.safeAreaInsets.getter();
}

uint64_t sub_1007788B0()
{
  return PageGrid.containerHeight.getter();
}

uint64_t sub_1007788C0()
{
  return PageGrid.DirectionalValue.init(horizontal:vertical:)();
}

uint64_t sub_1007788D0()
{
  return static PageGrid.DirectionalValue<>.zero.getter();
}

uint64_t sub_1007788E0()
{
  return PageGrid.DirectionalValue.init(_:)();
}

uint64_t sub_1007788F0()
{
  return PageGrid.activeBreakPoint.getter();
}

uint64_t sub_100778900()
{
  return PageGrid.interColumnSpace.getter();
}

uint64_t sub_100778910()
{
  return static PageGrid.HorizontalMargins.zero.getter();
}

uint64_t sub_100778920()
{
  return type metadata accessor for PageGrid.HorizontalMargins();
}

uint64_t sub_100778930()
{
  return PageGrid.horizontalMargins.getter();
}

uint64_t sub_100778940()
{
  return PageGrid.componentMeasuringSize(spanning:)();
}

uint64_t sub_100778950()
{
  return PageGrid.smallestPossibleColumnWidth.getter();
}

uint64_t sub_100778960()
{
  return PageGrid.horizontalDirectionalMargins.getter();
}

uint64_t sub_100778970()
{
  return PageGrid.init(from:breakpointOverrides:)();
}

uint64_t sub_100778980()
{
  return PageGrid.init(name:direction:containerSize:safeAreaInsets:requiresAdditionalSafeAreaMargins:breakpoints:)();
}

uint64_t sub_100778990()
{
  return static PageGrid.Direction.== infix(_:_:)();
}

uint64_t sub_1007789A0()
{
  return type metadata accessor for PageGrid.Direction();
}

uint64_t sub_1007789B0()
{
  return PageGrid.direction.getter();
}

uint64_t sub_1007789C0()
{
  return type metadata accessor for PageGrid();
}

uint64_t sub_1007789D0()
{
  return PageTabs.selectedTabId.getter();
}

uint64_t sub_1007789E0()
{
  return PageTabs.tabs.getter();
}

uint64_t sub_1007789F0()
{
  return type metadata accessor for PageTabs();
}

uint64_t sub_100778A00()
{
  return Response.contents.getter();
}

uint64_t sub_100778A10()
{
  return Response.dateText.getter();
}

uint64_t sub_100778A20()
{
  return SearchAd.advertisingText.getter();
}

uint64_t sub_100778A30()
{
  return SearchAd.adTransparencyAction.getter();
}

uint64_t sub_100778A40()
{
  return Trailers.mediaPlatform.getter();
}

uint64_t sub_100778A50()
{
  return Trailers.videos.getter();
}

unint64_t sub_100778A60(UITraitCollection in)
{
  return (unint64_t)Wordmark.asset(in:)(in);
}

uint64_t sub_100778A70()
{
  return type metadata accessor for Wordmark();
}

uint64_t sub_100778A80()
{
  return BadgeType.rendersNatively.getter();
}

uint64_t sub_100778A90()
{
  return type metadata accessor for BadgeType();
}

uint64_t sub_100778AA0()
{
  return dispatch thunk of Gladiator.rule(named:)();
}

uint64_t sub_100778AB0()
{
  return Gladiator.__allocating_init()();
}

uint64_t sub_100778AC0()
{
  return type metadata accessor for Gladiator();
}

uint64_t sub_100778AD0()
{
  return OfferItem.iapArtwork.getter();
}

uint64_t sub_100778AE0()
{
  return OfferItem.description.getter();
}

uint64_t sub_100778AF0()
{
  return OfferItem.offerLockup.getter();
}

uint64_t sub_100778B00()
{
  return OfferItem.moduleArtwork.getter();
}

uint64_t sub_100778B10()
{
  return OfferItem.mediaOverlayStyle.getter();
}

uint64_t sub_100778B20()
{
  return OfferItem.formattedEndDateString.getter();
}

uint64_t sub_100778B30()
{
  return OfferItem.badge.getter();
}

uint64_t sub_100778B40()
{
  return OfferItem.title.getter();
}

uint64_t sub_100778B50()
{
  return OfferItem.subtitle.getter();
}

uint64_t sub_100778B60()
{
  return type metadata accessor for OfferItem();
}

uint64_t sub_100778B70()
{
  return static OfferTint.infer.getter();
}

uint64_t sub_100778B80()
{
  return type metadata accessor for OfferTint();
}

uint64_t sub_100778B90()
{
  return type metadata accessor for OfferType();
}

uint64_t sub_100778BA0()
{
  return Paragraph.isCollapsed.getter();
}

uint64_t sub_100778BB0()
{
  return Paragraph.collapsedText.getter();
}

uint64_t sub_100778BC0()
{
  return Paragraph.suppressVerticalMargins.getter();
}

uint64_t sub_100778BD0()
{
  return Paragraph.init(id:text:wantsCollapsedNewlines:alignment:style:isCollapsed:suppressVerticalMargins:impressionMetrics:)();
}

uint64_t sub_100778BE0()
{
  return Paragraph.text.getter();
}

uint64_t sub_100778BF0()
{
  return Paragraph.Style.smallerTextStyle.getter();
}

uint64_t sub_100778C00()
{
  return Paragraph.Style.textStyle.getter();
}

uint64_t sub_100778C10()
{
  return type metadata accessor for Paragraph.Style();
}

uint64_t sub_100778C20()
{
  return Paragraph.style.getter();
}

uint64_t sub_100778C30()
{
  return type metadata accessor for Paragraph.Alignment();
}

uint64_t sub_100778C40()
{
  return Paragraph.alignment.getter();
}

uint64_t sub_100778C50()
{
  return type metadata accessor for Paragraph();
}

uint64_t sub_100778C60()
{
  return RiverView.init(dataSource:styling:)();
}

uint64_t sub_100778C70()
{
  return dispatch thunk of RiverView.dataSource.getter();
}

uint64_t sub_100778C80()
{
  return dispatch thunk of RiverView.setSpacing(interRowSpacing:interItemSpacing:)();
}

uint64_t sub_100778C90()
{
  return dispatch thunk of RiverView.isAnimating.getter();
}

uint64_t sub_100778CA0()
{
  return dispatch thunk of RiverView.isAnimating.setter();
}

uint64_t sub_100778CB0()
{
  return dispatch thunk of RiverView.setItemSize(size:)();
}

uint64_t sub_100778CC0()
{
  return dispatch thunk of RiverView.interRowSpacing.getter();
}

uint64_t sub_100778CD0()
{
  return dispatch thunk of RiverView.isTransitioning.setter();
}

uint64_t sub_100778CE0()
{
  return dispatch thunk of RiverView.cleanUp()();
}

uint64_t sub_100778CF0()
{
  return dispatch thunk of RiverView.itemSize.getter();
}

uint64_t sub_100778D00()
{
  return dispatch thunk of RiverView.flushRows()();
}

uint64_t sub_100778D10()
{
  return TapToRate.rateAction.getter();
}

uint64_t sub_100778D20()
{
  return TapToRate.title.getter();
}

uint64_t sub_100778D30()
{
  return type metadata accessor for TapToRate();
}

uint64_t sub_100778D40()
{
  return TodayCard.shortTitle.getter();
}

uint64_t sub_100778D50()
{
  return TodayCard.clickAction.getter();
}

uint64_t sub_100778D60()
{
  return TodayCard.titleArtwork.getter();
}

uint64_t sub_100778D70()
{
  return TodayCard.backgroundColor.getter();
}

uint64_t sub_100778D80()
{
  return TodayCard.collapsedHeading.getter();
}

uint64_t sub_100778D90()
{
  return TodayCard.impressionMetrics.getter();
}

uint64_t sub_100778DA0()
{
  return TodayCard.inlineDescription.getter();
}

uint64_t sub_100778DB0()
{
  return TodayCard.titleCharacteristics.getter();
}

uint64_t sub_100778DC0()
{
  return TodayCard.supportsMediaMirroring.getter();
}

uint64_t sub_100778DD0()
{
  return TodayCard.editorialDisplayOptions.getter();
}

uint64_t sub_100778DE0()
{
  return TodayCard.Style.overlayTextColor.getter();
}

uint64_t sub_100778DF0()
{
  return TodayCard.Style.cardTitleTextColor.getter();
}

uint64_t sub_100778E00()
{
  return TodayCard.Style.cardHeadingTextColor.getter();
}

uint64_t sub_100778E10()
{
  return TodayCard.Style.overlayBackgroundColor.getter();
}

uint64_t sub_100778E20()
{
  return TodayCard.Style.overlayDetailTextColor.getter();
}

uint64_t sub_100778E30()
{
  return TodayCard.Style.rawValue.getter();
}

uint64_t sub_100778E40()
{
  return type metadata accessor for TodayCard.Style();
}

uint64_t sub_100778E50()
{
  return TodayCard.media.getter();
}

uint64_t sub_100778E60()
{
  return TodayCard.style.getter();
}

uint64_t sub_100778E70()
{
  return TodayCard.title.getter();
}

uint64_t sub_100778E80()
{
  return TodayCard.heading.getter();
}

uint64_t sub_100778E90()
{
  return TodayCard.overlay.getter();
}

uint64_t sub_100778EA0()
{
  return TodayCard.searchAd.getter();
}

uint64_t sub_100778EB0()
{
  return type metadata accessor for TodayCard();
}

uint64_t sub_100778EC0()
{
  return VideoCard.overlayStyle.getter();
}

uint64_t sub_100778ED0()
{
  return VideoCard.video.getter();
}

uint64_t sub_100778EE0()
{
  return VideoCard.lockup.getter();
}

uint64_t sub_100778EF0()
{
  return type metadata accessor for VideoCard();
}

uint64_t sub_100778F00()
{
  return type metadata accessor for ReviewResult();
}

uint64_t sub_100778F10()
{
  return ReviewContext.init(accentColor:lockupStyle:lockupDetails:mediaTaskType:clientInfo:itemIdentifier:itemVersion:)();
}

uint64_t sub_100778F20()
{
  return type metadata accessor for ReviewContext();
}

uint64_t sub_100778F30()
{
  return ReviewCoordinator.init()();
}

uint64_t sub_100778F40()
{
  return type metadata accessor for ReviewCoordinator();
}

uint64_t sub_100778F50()
{
  return ReviewLockupDetails.init(name:itemDescription:artworkURLTemplate:)();
}

uint64_t sub_100778F60()
{
  return type metadata accessor for ReviewLockupDetails();
}

uint64_t sub_100778F70()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_100778F80()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100778F90()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_100778FA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100778FB0()
{
  return Logger.init()();
}

uint64_t sub_100778FC0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100778FD0()
{
  return static Dimensions.defaultRoundingRule.getter();
}

uint64_t sub_100778FE0()
{
  return FontSource.font(in:for:)();
}

UIFont sub_100778FF0(UITraitCollection compatibleWith)
{
  return FontSource.font(compatibleWith:)(compatibleWith);
}

uint64_t sub_100779000()
{
  return type metadata accessor for FontSource();
}

uint64_t sub_100779010()
{
  return LayoutRect.init(representing:)();
}

uint64_t sub_100779020()
{
  return LayoutRect.size.modify();
}

uint64_t sub_100779030()
{
  return LayoutRect.size.getter();
}

uint64_t sub_100779040()
{
  return LayoutRect.origin.getter();
}

uint64_t sub_100779050()
{
  return type metadata accessor for LayoutRect();
}

uint64_t sub_100779060()
{
  return dispatch thunk of LayoutView.hasContent.getter();
}

uint64_t sub_100779070()
{
  return LayoutView.nilIfHidden()();
}

uint64_t sub_100779080()
{
  return dispatch thunk of LayoutView.frame.getter();
}

uint64_t sub_100779090()
{
  return dispatch thunk of LayoutView.frame.setter();
}

uint64_t sub_1007790A0()
{
  return dispatch thunk of LayoutView.isHidden.getter();
}

uint64_t sub_1007790B0()
{
  return dispatch thunk of LayoutView.isHidden.setter();
}

uint64_t sub_1007790C0()
{
  return LayoutView.withLayoutMargins(_:)();
}

uint64_t sub_1007790D0()
{
  return LayoutView.withMeasurements(providedBy:)();
}

uint64_t sub_1007790E0()
{
  return LayoutView.withMeasurements(representing:)();
}

uint64_t sub_1007790F0()
{
  return LayoutView.withMeasurements(_:)();
}

uint64_t sub_100779100()
{
  return dispatch thunk of Measurable.measurements(fitting:in:)();
}

uint64_t sub_100779110()
{
  return Measurable.measuredSize(fitting:in:)();
}

uint64_t sub_100779120()
{
  return Measurable.measurements(fitting:with:)();
}

uint64_t sub_100779130()
{
  return Measurable.placeable.getter();
}

uint64_t sub_100779140()
{
  return AspectRatio.verticalFraction.getter();
}

uint64_t sub_100779150()
{
  return AspectRatio.horizontalFraction.getter();
}

uint64_t sub_100779160()
{
  return AspectRatio.isPortrait.getter();
}

uint64_t sub_100779170()
{
  return AspectRatio.isLandscape.getter();
}

uint64_t sub_100779180()
{
  return AspectRatio.maxSize(filling:)();
}

uint64_t sub_100779190()
{
  return AspectRatio.maxSize(fitting:)();
}

uint64_t sub_1007791A0()
{
  return AspectRatio.inverted.getter();
}

uint64_t sub_1007791B0()
{
  return AspectRatio.width(fromHeight:)();
}

uint64_t sub_1007791C0()
{
  return AspectRatio.height(fromWidth:)();
}

uint64_t sub_1007791D0()
{
  return static AspectRatio.square.getter();
}

uint64_t sub_1007791E0()
{
  return AspectRatio.isSquare.getter();
}

uint64_t sub_1007791F0()
{
  return type metadata accessor for AspectRatio();
}

uint64_t sub_100779200()
{
  return AspectRatio.init(_:_:)();
}

UIFontDescriptor sub_100779210(UITraitCollection compatibleWith)
{
  return FontUseCase.makeFontDescriptor(compatibleWith:)(compatibleWith);
}

uint64_t sub_100779220()
{
  return static FontUseCase.== infix(_:_:)();
}

uint64_t sub_100779230()
{
  return type metadata accessor for FontUseCase();
}

uint64_t sub_100779240()
{
  return dispatch thunk of AnyDimension.rawValue(in:)();
}

uint64_t sub_100779250()
{
  return AnyDimension.bottomMargin(from:in:)();
}

uint64_t sub_100779260()
{
  return AnyDimension.value(in:rounded:)();
}

uint64_t sub_100779270()
{
  return AnyDimension.value(with:)();
}

uint64_t sub_100779280()
{
  return AnyDimension.topMargin(from:in:)();
}

uint64_t sub_100779290()
{
  return dispatch thunk of CustomLayout.layout.getter();
}

uint64_t sub_1007792D0()
{
  return static DiffableData.makeSnapshot<A, B>(fromSections:withItemsAt:)();
}

uint64_t sub_1007792E0()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.getter();
}

uint64_t sub_1007792F0()
{
  return dispatch thunk of DynamicLabel.dynamicTextAppearance.setter();
}

uint64_t sub_100779300()
{
  return DynamicLabel.__allocating_init(with:)();
}

uint64_t sub_100779310()
{
  return type metadata accessor for DynamicLabel();
}

uint64_t sub_100779320()
{
  return ViewRecycler.init()();
}

uint64_t sub_100779330()
{
  return type metadata accessor for ViewRecycler();
}

uint64_t sub_100779340()
{
  return type metadata accessor for DisjointStack.Placements();
}

uint64_t sub_100779350()
{
  return DisjointStack.Properties.bottomEdge.setter();
}

uint64_t sub_100779360()
{
  return DisjointStack.Properties.leadingEdge.setter();
}

uint64_t sub_100779370()
{
  return DisjointStack.Properties.trailingEdge.setter();
}

uint64_t sub_100779380()
{
  return DisjointStack.Properties.anchorsHugContent.setter();
}

uint64_t sub_100779390()
{
  return DisjointStack.Properties.topEdge.setter();
}

uint64_t sub_1007793A0()
{
  return type metadata accessor for DisjointStack.EdgePosition();
}

uint64_t sub_1007793B0()
{
  return DisjointStack.init(with:)();
}

uint64_t sub_1007793C0()
{
  return DisjointStack.insert(_:at:with:)();
}

uint64_t sub_1007793D0()
{
  return DisjointStack.inserting(_:at:with:)();
}

uint64_t sub_1007793E0()
{
  return type metadata accessor for DisjointStack();
}

uint64_t sub_1007793F0()
{
  return type metadata accessor for VerticalStack.Placements();
}

uint64_t sub_100779400()
{
  return VerticalStack.Properties.shouldSkip.setter();
}

uint64_t sub_100779410()
{
  return VerticalStack.Properties.topSpacing.setter();
}

uint64_t sub_100779420()
{
  return VerticalStack.Properties.bottomSpacing.setter();
}

uint64_t sub_100779430()
{
  return VerticalStack.Properties.edgesAlignedToBaseline.setter();
}

uint64_t sub_100779440()
{
  return VerticalStack.Properties.alignment.setter();
}

uint64_t sub_100779450()
{
  return VerticalStack.add(_:with:)();
}

uint64_t sub_100779460()
{
  return static VerticalStack.Edge.top.getter();
}

uint64_t sub_100779470()
{
  return static VerticalStack.Edge.bottom.getter();
}

uint64_t sub_100779480()
{
  return VerticalStack.Edge.init(rawValue:)();
}

uint64_t sub_100779490()
{
  return VerticalStack.init(with:)();
}

uint64_t sub_1007794A0()
{
  return VerticalStack.adding(_:with:)();
}

uint64_t sub_1007794B0()
{
  return type metadata accessor for VerticalStack();
}

uint64_t sub_1007794C0()
{
  return static ZeroDimension.zero.getter();
}

uint64_t sub_1007794D0()
{
  return type metadata accessor for ZeroDimension();
}

uint64_t sub_1007794E0()
{
  return dispatch thunk of LayoutTextView.isTextExtraTall.getter();
}

uint64_t sub_1007794F0()
{
  return dispatch thunk of LayoutTextView.textLength.getter();
}

uint64_t sub_100779500()
{
  return dispatch thunk of LayoutTextView.lineBreakMode.setter();
}

uint64_t sub_100779510()
{
  return dispatch thunk of LayoutTextView.numberOfLines.setter();
}

uint64_t sub_100779520()
{
  return LayoutTextView.nilIfHasNoContent()();
}

uint64_t sub_100779530()
{
  return LayoutTextView.nilIfHiddenOrHasNoContent()();
}

uint64_t sub_100779540()
{
  return dispatch thunk of LayoutTextView.languageAwareOutsets.getter();
}

uint64_t sub_100779550()
{
  return dispatch thunk of LayoutTextView.font.getter();
}

uint64_t sub_100779560()
{
  return dispatch thunk of LayoutTextView.font.setter();
}

Swift::Int sub_100779570(JUMeasurements from)
{
  return LayoutTextView.estimatedNumberOfLines(from:)(from);
}

uint64_t sub_100779580()
{
  return LayoutTextView.withLanguageAwareOutsets.getter();
}

uint64_t sub_100779590()
{
  return TextAppearance.withTextAlignment(_:)();
}

uint64_t sub_1007795A0()
{
  return TextAppearance.lineSpacing.setter();
}

uint64_t sub_1007795B0()
{
  return TextAppearance.lineBreakMode.setter();
}

uint64_t sub_1007795C0()
{
  return TextAppearance.numberOfLines.setter();
}

uint64_t sub_1007795D0()
{
  return TextAppearance.textAlignment.setter();
}

uint64_t sub_1007795E0()
{
  return TextAppearance.withLineSpacing(_:)();
}

uint64_t sub_1007795F0()
{
  return TextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_100779600()
{
  return TextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_100779610()
{
  return TextAppearance.font.getter();
}

uint64_t sub_100779620()
{
  return TextAppearance.font.setter();
}

uint64_t sub_100779630()
{
  return TextAppearance.withFont(_:)();
}

uint64_t sub_100779640()
{
  return TextAppearance.init()();
}

uint64_t sub_100779650()
{
  return type metadata accessor for TextAppearance();
}

uint64_t sub_100779660()
{
  return static TextMeasurable.defaultTextAlignment.getter();
}

uint64_t sub_100779670()
{
  return static TextMeasurable.measurements(attributedText:fontUseCase:textAlignment:lineBreakMode:lineSpacing:numberOfLines:isLanguageAware:fitting:in:)();
}

uint64_t sub_100779680()
{
  return static TextMeasurable.defaultLineBreakMode.getter();
}

uint64_t sub_100779690()
{
  return static CustomTextStyle<>.metadataRibbon.getter();
}

uint64_t sub_1007796A0()
{
  return dispatch thunk of CustomTextStyle.font(compatibleWith:)();
}

uint64_t sub_1007796B0()
{
  return HorizontalStack.Properties.leadingSpacing.setter();
}

uint64_t sub_1007796C0()
{
  return HorizontalStack.Properties.trailingSpacing.setter();
}

uint64_t sub_1007796D0()
{
  return HorizontalStack.Properties.alignment.setter();
}

uint64_t sub_1007796E0()
{
  return HorizontalStack.add(_:with:)();
}

uint64_t sub_1007796F0()
{
  return HorizontalStack.init(with:)();
}

uint64_t sub_100779700()
{
  return HorizontalStack.adding(_:with:)();
}

uint64_t sub_100779710()
{
  return static HorizontalStack.Alignment.== infix(_:_:)();
}

uint64_t sub_100779720()
{
  return type metadata accessor for HorizontalStack();
}

uint64_t sub_100779730()
{
  return ImageAppearance.withSymbolConfiguration(_:)();
}

uint64_t sub_100779740()
{
  return ImageAppearance.init()();
}

uint64_t sub_100779750()
{
  return type metadata accessor for ImageAppearance();
}

uint64_t sub_100779760()
{
  return dispatch thunk of PrimitiveLayout.layout(relativeTo:with:)();
}

uint64_t sub_100779770()
{
  return StackMeasurable.measurements(fitting:in:)();
}

uint64_t sub_100779780()
{
  return type metadata accessor for StackMeasurable.Axis();
}

uint64_t sub_100779790()
{
  return StackMeasurable.init(axis:skipEmptyChildren:children:)();
}

uint64_t sub_1007797A0()
{
  return type metadata accessor for StackMeasurable();
}

uint64_t sub_1007797B0()
{
  return static StaticDimension.== infix(_:_:)();
}

uint64_t sub_1007797C0()
{
  return StaticDimension.value(compatibleWith:rounded:)();
}

uint64_t sub_1007797D0()
{
  return StaticDimension.rawValue(in:)();
}

uint64_t sub_1007797E0()
{
  return type metadata accessor for StaticDimension();
}

uint64_t sub_1007797F0()
{
  return StaticDimension.init(_:scaledLike:)();
}

uint64_t sub_100779800()
{
  return CustomLayoutView.sizeThatFits(_:)();
}

uint64_t sub_100779810()
{
  return dispatch thunk of CustomLayoutView.invalidateMeasurements()();
}

uint64_t sub_100779820()
{
  return CustomLayoutView.measure(toFit:with:)();
}

uint64_t sub_100779830()
{
  return type metadata accessor for CustomLayoutView();
}

uint64_t sub_100779840()
{
  return method lookup function for CustomLayoutView();
}

uint64_t sub_100779850()
{
  return ImagePlaceholder.measure(toFit:with:)();
}

uint64_t sub_100779860()
{
  return type metadata accessor for ImagePlaceholder();
}

uint64_t sub_100779870()
{
  return ImagePlaceholder.init(_:with:)();
}

uint64_t sub_100779880()
{
  return LabelPlaceholder.layoutTextView.getter();
}

uint64_t sub_100779890()
{
  return static LabelPlaceholder.Options.languageAware.getter();
}

uint64_t sub_1007798A0()
{
  return LabelPlaceholder.Options.init(rawValue:)();
}

uint64_t sub_1007798B0()
{
  return LabelPlaceholder.measure(toFit:with:)();
}

uint64_t sub_1007798C0()
{
  return type metadata accessor for LabelPlaceholder();
}

uint64_t sub_1007798D0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_1007798E0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_1007798F0()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_100779900()
{
  return LabelPlaceholder.init(_:with:where:)();
}

uint64_t sub_100779910()
{
  return MeasurementRange.init(minimum:maximum:)();
}

uint64_t sub_100779920()
{
  return MeasurementRange.contains(_:)();
}

uint64_t sub_100779930()
{
  return MeasurementRange.constrain(_:)();
}

uint64_t sub_100779940()
{
  return dispatch thunk of PlacementSequence.measure.getter();
}

uint64_t sub_100779950()
{
  return type metadata accessor for VerticalFlowLayout.VerticalPlacement();
}

uint64_t sub_100779960()
{
  return VerticalFlowLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100779970()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_100779980()
{
  return static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter();
}

uint64_t sub_100779990()
{
  return static VerticalFlowLayout.ExclusionCondition.isHidden.getter();
}

uint64_t sub_1007799A0()
{
  return type metadata accessor for VerticalFlowLayout.ExclusionCondition();
}

uint64_t sub_1007799B0()
{
  return type metadata accessor for VerticalFlowLayout.HorizontalPlacement();
}

uint64_t sub_1007799C0()
{
  return VerticalFlowLayout.init(expandChildrenToFit:children:)();
}

uint64_t sub_1007799D0()
{
  return static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)();
}

uint64_t sub_1007799E0()
{
  return type metadata accessor for VerticalFlowLayout.Child();
}

uint64_t sub_1007799F0()
{
  return type metadata accessor for VerticalFlowLayout();
}

uint64_t sub_100779A00()
{
  return type metadata accessor for AspectFitMeasurable();
}

uint64_t sub_100779A10()
{
  return AspectFitMeasurable.init(_:)();
}

uint64_t sub_100779A20()
{
  return dispatch thunk of static EstimatedMeasurable.estimatedMeasurements(fitting:using:in:)();
}

uint64_t sub_100779A40()
{
  return static EstimatedMeasurable.estimatedSize(fitting:using:in:)();
}

uint64_t sub_100779A50()
{
  return LineHeightDimension.init(with:multipliedBy:)();
}

uint64_t sub_100779A60()
{
  return type metadata accessor for LineHeightDimension();
}

uint64_t sub_100779A70()
{
  return type metadata accessor for VerticalStackLayout.ExclusionCondition();
}

uint64_t sub_100779A80()
{
  return static VerticalStackLayout.Child.make(forView:space:spaceMultiplier:alignment:excludeWhen:)();
}

uint64_t sub_100779A90()
{
  return type metadata accessor for VerticalStackLayout.Child.Alignment();
}

uint64_t sub_100779AA0()
{
  return type metadata accessor for VerticalStackLayout.Child();
}

uint64_t sub_100779AB0()
{
  return VerticalStackLayout.addChild(_:)();
}

uint64_t sub_100779AC0()
{
  return type metadata accessor for VerticalStackLayout.Alignment();
}

uint64_t sub_100779AD0()
{
  return VerticalStackLayout.init(alignment:spacing:children:)();
}

uint64_t sub_100779AE0()
{
  return type metadata accessor for VerticalStackLayout();
}

uint64_t sub_100779AF0()
{
  return DynamicTextAppearance.withCustomTextStyle(_:)();
}

uint64_t sub_100779B00()
{
  return DynamicTextAppearance.withTextStyle(_:)();
}

uint64_t sub_100779B10()
{
  return DynamicTextAppearance.customTextStyle.getter();
}

uint64_t sub_100779B20()
{
  return DynamicTextAppearance.lineSpacing.getter();
}

uint64_t sub_100779B30()
{
  return DynamicTextAppearance.lineBreakMode.getter();
}

uint64_t sub_100779B40()
{
  return DynamicTextAppearance.numberOfLines.getter();
}

uint64_t sub_100779B50()
{
  return DynamicTextAppearance.textAlignment.getter();
}

uint64_t sub_100779B60()
{
  return DynamicTextAppearance.withFontUseCase(_:)();
}

uint64_t sub_100779B70()
{
  return DynamicTextAppearance.withLineBreakMode(_:)();
}

uint64_t sub_100779B80()
{
  return DynamicTextAppearance.withNumberOfLines(_:)();
}

uint64_t sub_100779B90()
{
  return DynamicTextAppearance.init()();
}

uint64_t sub_100779BA0()
{
  return type metadata accessor for DynamicTextAppearance();
}

uint64_t sub_100779BB0()
{
  return FlankedVerticalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100779BC0()
{
  return type metadata accessor for FlankedVerticalLayout.Alignment();
}

uint64_t sub_100779BD0()
{
  return FlankedVerticalLayout.init(sublayout:topView:topViewAlignment:topMargin:bottomView:bottomViewAlignment:bottomMargin:)();
}

uint64_t sub_100779BE0()
{
  return type metadata accessor for FlankedVerticalLayout();
}

uint64_t sub_100779BF0()
{
  return LayoutViewPlaceholder.hasContent.setter();
}

uint64_t sub_100779C00()
{
  return LayoutViewPlaceholder.init(measureWith:)();
}

uint64_t sub_100779C10()
{
  return LayoutViewPlaceholder.init(measurements:)();
}

uint64_t sub_100779C20()
{
  return LayoutViewPlaceholder.init(representing:)();
}

uint64_t sub_100779C30()
{
  return static LayoutViewPlaceholder.withIdentityMeasurement.getter();
}

uint64_t sub_100779C40()
{
  return LayoutViewPlaceholder.isHidden.setter();
}

uint64_t sub_100779C50()
{
  return type metadata accessor for LayoutViewPlaceholder();
}

uint64_t sub_100779C60()
{
  return measuringBoundingRect(toFit:)();
}

uint64_t sub_100779C70()
{
  return type metadata accessor for FlankedHorizontalLayout.ViewAlignment();
}

uint64_t sub_100779C80()
{
  return FlankedHorizontalLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100779C90()
{
  return FlankedHorizontalLayout.init(sublayout:leadingView:leadingMargin:leadingAlignment:trailingView:trailingMargin:trailingAlignment:)();
}

uint64_t sub_100779CA0()
{
  return type metadata accessor for FlankedHorizontalLayout();
}

uint64_t sub_100779CB0()
{
  return static JULoadingViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_100779CC0()
{
  return type metadata accessor for JULoadingViewController.PresentationContext();
}

uint64_t sub_100779CD0()
{
  return JULoadingViewController.init(label:presentationContext:pageRenderMetrics:)();
}

uint64_t sub_100779CE0()
{
  return type metadata accessor for JULoadingViewController();
}

uint64_t sub_100779CF0()
{
  return type metadata accessor for VerticalSpaceMeasurable();
}

uint64_t sub_100779D00()
{
  return VerticalSpaceMeasurable.init(_:multiplier:)();
}

uint64_t sub_100779D10()
{
  return VerticalMarginsMeasurable.measurements(fitting:in:)();
}

uint64_t sub_100779D20()
{
  return VerticalMarginsMeasurable.init(child:topMargin:bottomMargin:skipIfEmpty:shouldMeasureToBaseline:)();
}

uint64_t sub_100779D30()
{
  return type metadata accessor for VerticalMarginsMeasurable();
}

uint64_t sub_100779D40()
{
  return TraitEnvironmentPlaceholder.init(traitCollection:)();
}

uint64_t sub_100779D50()
{
  return type metadata accessor for TraitEnvironmentPlaceholder();
}

uint64_t sub_100779D60()
{
  return TraitEnvironmentPlaceholder.__allocating_init(_:)();
}

uint64_t sub_100779D70()
{
  return JUContentUnavailableViewController.init(error:from:includeMetrics:retry:)();
}

uint64_t sub_100779D80()
{
  return static JUContentUnavailableViewController.PresentationContext.placeholder.getter();
}

uint64_t sub_100779D90()
{
  return type metadata accessor for JUContentUnavailableViewController.PresentationContext();
}

uint64_t sub_100779DA0()
{
  return JUContentUnavailableViewController.init(error:presentationContext:retry:)();
}

uint64_t sub_100779DB0()
{
  return type metadata accessor for JUContentUnavailableViewController();
}

uint64_t sub_100779DC0()
{
  return type metadata accessor for Pin.Edge();
}

uint64_t sub_100779DD0()
{
  return type metadata accessor for Pin();
}

uint64_t sub_100779DE0()
{
  return Pin.init(_:to:of:)();
}

uint64_t sub_100779DF0()
{
  return static Center.Axis.horizontal.getter();
}

uint64_t sub_100779E00()
{
  return static Center.Axis.neither.getter();
}

uint64_t sub_100779E10()
{
  return static Center.Axis.vertical.getter();
}

uint64_t sub_100779E20()
{
  return type metadata accessor for Center();
}

uint64_t sub_100779E30()
{
  return Center.init(_:filling:)();
}

uint64_t sub_100779E40()
{
  return dispatch thunk of Layout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100779E50()
{
  return Resize.init(_:size:)();
}

uint64_t sub_100779E60()
{
  return type metadata accessor for Resize.Rule();
}

uint64_t sub_100779E70()
{
  return type metadata accessor for Resize();
}

uint64_t sub_100779E80()
{
  return Resize.init(_:width:height:firstBaseline:lastBaseline:)();
}

uint64_t sub_100779E90()
{
  return type metadata accessor for Margins.Placements();
}

uint64_t sub_100779EA0()
{
  return Margins.init(top:left:bottom:right:child:)();
}

uint64_t sub_100779EB0()
{
  return Margins.init(insets:child:)();
}

uint64_t sub_100779EC0()
{
  return type metadata accessor for Margins();
}

uint64_t sub_100779ED0()
{
  return Margins.init(_:top:leading:bottom:trailing:)();
}

uint64_t sub_100779EE0()
{
  return Adaptive.onCustom<A>(_:_:)();
}

uint64_t sub_100779EF0()
{
  return type metadata accessor for Adaptive();
}

uint64_t sub_100779F00()
{
  return Adaptive.init<A>(_:)();
}

uint64_t sub_100779F10()
{
  return AppStore.CenteredThreeLineTextLayout.init(primaryText:secondaryText:secondarySpace:numberOfLines:)();
}

uint64_t sub_100779F20()
{
  return AppStore.CenteredThreeLineTextLayout.placeChildren(relativeTo:in:)();
}

uint64_t sub_100779F30()
{
  return type metadata accessor for AppStore.CenteredThreeLineTextLayout();
}

uint64_t sub_100779F40()
{
  return type metadata accessor for Constrain();
}

uint64_t sub_100779F50()
{
  return Constrain.init(_:width:height:)();
}

uint64_t sub_100779F60()
{
  return dispatch thunk of Placeable.place(at:with:)();
}

uint64_t sub_100779F70()
{
  return dispatch thunk of Placeable.measure(toFit:with:)();
}

uint64_t sub_100779F80()
{
  return Placement.child.getter();
}

uint64_t sub_100779F90()
{
  return Placement.frame.getter();
}

uint64_t sub_100779FA0()
{
  return type metadata accessor for Placement();
}

void sub_100779FB0()
{
}

uint64_t sub_100779FC0()
{
  return ReusePool.limit.setter();
}

uint64_t sub_100779FD0()
{
  return ReusePool.dequeue(or:)();
}

uint64_t sub_100779FE0()
{
  return ReusePool.dequeue()();
}

uint64_t sub_100779FF0()
{
  return ReusePool.recycle(_:)();
}

uint64_t sub_10077A000()
{
  return ReusePool.init(recycler:limit:)();
}

uint64_t sub_10077A010()
{
  return type metadata accessor for ReusePool();
}

uint64_t sub_10077A020()
{
  return Separator.verticalOutset.getter();
}

uint64_t sub_10077A030()
{
  return Separator.withLeadingInset(_:)();
}

uint64_t sub_10077A040()
{
  return Separator.frame(forBoundingRect:in:)();
}

uint64_t sub_10077A050()
{
  return Separator.height(in:)();
}

uint64_t sub_10077A060()
{
  return type metadata accessor for Separator.Position();
}

uint64_t sub_10077A070()
{
  return Separator.init(position:leadingInset:trailingInset:verticalOutset:)();
}

uint64_t sub_10077A080()
{
  return static Separator.thickness(compatibleWith:)();
}

uint64_t sub_10077A090()
{
  return type metadata accessor for Separator();
}

uint64_t sub_10077A0A0()
{
  return static UICellAccessory.customView(configuration:)();
}

uint64_t sub_10077A0B0()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t sub_10077A0C0()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t sub_10077A0D0()
{
  return UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_10077A0E0()
{
  return type metadata accessor for UICellAccessory.CheckmarkOptions();
}

uint64_t sub_10077A0F0()
{
  return static UICellAccessory.outlineDisclosure(displayed:options:actionHandler:)();
}

uint64_t sub_10077A100()
{
  return static UICellAccessory.disclosureIndicator(displayed:options:)();
}

uint64_t sub_10077A110()
{
  return UICellAccessory.CustomViewConfiguration.init(customView:placement:isHidden:reservedLayoutWidth:tintColor:maintainsFixedSize:)();
}

uint64_t sub_10077A120()
{
  return type metadata accessor for UICellAccessory.CustomViewConfiguration();
}

uint64_t sub_10077A130()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions.Style();
}

uint64_t sub_10077A140()
{
  return UICellAccessory.OutlineDisclosureOptions.init(style:isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_10077A150()
{
  return type metadata accessor for UICellAccessory.OutlineDisclosureOptions();
}

uint64_t sub_10077A160()
{
  return UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_10077A170()
{
  return type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
}

uint64_t sub_10077A180()
{
  return type metadata accessor for UICellAccessory.Placement();
}

uint64_t sub_10077A190()
{
  return static UICellAccessory.checkmark(displayed:options:)();
}

uint64_t sub_10077A1A0()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t sub_10077A1B0()
{
  return UIMutableTraits.userInterfaceLevel.setter();
}

uint64_t sub_10077A1C0()
{
  return UIMutableTraits.userInterfaceStyle.setter();
}

uint64_t sub_10077A1D0()
{
  return UIMutableTraits.horizontalSizeClass.setter();
}

uint64_t sub_10077A1E0()
{
  return UIMutableTraits.preferredContentSizeCategory.getter();
}

uint64_t sub_10077A1F0()
{
  return UIMutableTraits.preferredContentSizeCategory.setter();
}

uint64_t sub_10077A200()
{
  return UIMutableTraits._typesettingLanguageAwareLineHeightRatio.setter();
}

uint64_t sub_10077A210()
{
  return UITraitOverrides.remove(_:)();
}

uint64_t sub_10077A220()
{
  return type metadata accessor for UITraitOverrides();
}

uint64_t sub_10077A230()
{
  return type metadata accessor for UITraitLayoutDirection();
}

uint64_t sub_10077A240()
{
  return type metadata accessor for UITraitLegibilityWeight();
}

uint64_t sub_10077A250()
{
  return type metadata accessor for UITraitVerticalSizeClass();
}

uint64_t sub_10077A260()
{
  return UIBackgroundConfiguration.cornerRadius.setter();
}

uint64_t sub_10077A270()
{
  return static UIBackgroundConfiguration.listPlainCell()();
}

uint64_t sub_10077A280()
{
  return UIBackgroundConfiguration.backgroundColor.setter();
}

uint64_t sub_10077A290()
{
  return UIBackgroundConfiguration.backgroundInsets.setter();
}

uint64_t sub_10077A2A0()
{
  return UIBackgroundConfiguration.backgroundColorTransformer.setter();
}

uint64_t sub_10077A2B0()
{
  return type metadata accessor for UIBackgroundConfiguration();
}

uint64_t sub_10077A2C0()
{
  return type metadata accessor for UITraitUserInterfaceLevel();
}

uint64_t sub_10077A2D0()
{
  return type metadata accessor for UITraitUserInterfaceStyle();
}

uint64_t sub_10077A2E0()
{
  return static UIListContentConfiguration.groupedFooter()();
}

uint64_t sub_10077A2F0()
{
  return static UIListContentConfiguration.groupedHeader()();
}

uint64_t sub_10077A300()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t sub_10077A310()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties.TextAlignment();
}

uint64_t sub_10077A320()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_10077A330()
{
  return UIListContentConfiguration.TextProperties.alignment.setter();
}

uint64_t sub_10077A340()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_10077A350()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t sub_10077A360()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t sub_10077A370()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t sub_10077A380()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t sub_10077A390()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t sub_10077A3A0()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t sub_10077A3B0()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_10077A3C0(Swift::OpaquePointer a1)
{
}

void sub_10077A3D0(Swift::OpaquePointer a1)
{
}

uint64_t sub_10077A3E0()
{
  return NSDiffableDataSourceSnapshot.itemIdentifiers(inSection:)();
}

uint64_t sub_10077A3F0()
{
  return NSDiffableDataSourceSnapshot.numberOfSections.getter();
}

void sub_10077A400(Swift::OpaquePointer a1)
{
}

uint64_t sub_10077A410()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifier(containingItem:)();
}

uint64_t sub_10077A420()
{
  return NSDiffableDataSourceSnapshot.sectionIdentifiers.getter();
}

uint64_t sub_10077A430()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_10077A440()
{
  return UIListSeparatorConfiguration.topSeparatorInsets.setter();
}

uint64_t sub_10077A450()
{
  return UIListSeparatorConfiguration.bottomSeparatorInsets.setter();
}

uint64_t sub_10077A460()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_10077A470()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_10077A480()
{
  return UIContentUnavailableConfiguration.secondaryText.setter();
}

uint64_t sub_10077A490()
{
  return UIContentUnavailableConfiguration.ButtonProperties.primaryAction.setter();
}

uint64_t sub_10077A4A0()
{
  return UIContentUnavailableConfiguration.buttonProperties.modify();
}

uint64_t sub_10077A4B0()
{
  return UIContentUnavailableConfiguration.text.setter();
}

uint64_t sub_10077A4C0()
{
  return UIContentUnavailableConfiguration.button.modify();
}

uint64_t sub_10077A4D0()
{
  return static UIContentUnavailableConfiguration.search()();
}

uint64_t sub_10077A4E0()
{
  return type metadata accessor for UIContentUnavailableConfiguration();
}

uint64_t sub_10077A4F0()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_10077A500()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t sub_10077A510()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_10077A520()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.numberOfSections(in:)();
}

uint64_t sub_10077A530()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_10077A540()
{
  return UICollectionViewDiffableDataSource.apply(_:to:animatingDifferences:completion:)();
}

uint64_t sub_10077A550()
{
  return UICollectionViewDiffableDataSource.snapshot(for:)();
}

uint64_t sub_10077A560()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.snapshot()();
}

uint64_t sub_10077A570()
{
  return NSDiffableDataSourceSectionSnapshot.isExpanded(_:)();
}

uint64_t sub_10077A580()
{
  return NSDiffableDataSourceSectionSnapshot.append(_:to:)();
}

void sub_10077A590(Swift::OpaquePointer a1)
{
}

void sub_10077A5A0(Swift::OpaquePointer a1)
{
}

uint64_t sub_10077A5B0()
{
  return NSDiffableDataSourceSectionSnapshot.init()();
}

uint64_t sub_10077A5C0()
{
  return UICollectionLayoutListConfiguration.trailingSwipeActionsConfigurationProvider.setter();
}

uint64_t sub_10077A5D0()
{
  return UICollectionLayoutListConfiguration.separatorConfiguration.modify();
}

uint64_t sub_10077A5E0()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t sub_10077A5F0()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.FooterMode();
}

uint64_t sub_10077A600()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t sub_10077A610()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t sub_10077A620()
{
  return UICollectionLayoutListConfiguration.footerMode.setter();
}

uint64_t sub_10077A630()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t sub_10077A640()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t sub_10077A650()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_10077A660()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t sub_10077A670()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t sub_10077A680()
{
  return type metadata accessor for UITypesettingLanguageAwareLineHeightRatio();
}

uint64_t sub_10077A690()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_10077A6A0()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_10077A6B0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_10077A6C0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_10077A6D0()
{
  return static Published.subscript.getter();
}

uint64_t sub_10077A6E0()
{
  return static Published.subscript.setter();
}

uint64_t sub_10077A6F0()
{
  return type metadata accessor for Published();
}

uint64_t sub_10077A700()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_10077A710()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_10077A720()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10077A730()
{
  return type metadata accessor for Prominence();
}

uint64_t sub_10077A740()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_10077A750()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_10077A760()
{
  return static Transaction._loading.getter();
}

uint64_t sub_10077A770()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_10077A780()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_10077A790()
{
  return PlainListStyle.init()();
}

uint64_t sub_10077A7A0()
{
  return type metadata accessor for PlainListStyle();
}

uint64_t sub_10077A7B0()
{
  return DisclosureGroup.init(content:label:)();
}

uint64_t sub_10077A7C0()
{
  return DynamicTypeSize.isAccessibilitySize.getter();
}

uint64_t sub_10077A7D0()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_10077A7E0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10077A7F0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10077A800()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10077A810()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10077A820()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10077A830()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10077A840()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10077A850()
{
  return static VerticalAlignment.firstTextBaseline.getter();
}

uint64_t sub_10077A860()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_10077A870()
{
  return static VerticalAlignment.center.getter();
}

void sub_10077A880(Swift::String a1)
{
}

void sub_10077A890(Swift::String a1)
{
}

uint64_t sub_10077A8A0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10077A8B0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_10077A8C0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_10077A8D0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10077A8E0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10077A8F0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10077A900()
{
  return static SymbolRenderingMode.multicolor.getter();
}

uint64_t sub_10077A910()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_10077A920()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_10077A930()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10077A940()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10077A950()
{
  return static SearchFieldPlacement.automatic.getter();
}

uint64_t sub_10077A960()
{
  return type metadata accessor for SearchFieldPlacement();
}

uint64_t sub_10077A970()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_10077A980()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_10077A990()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_10077A9A0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_10077A9B0()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_10077A9C0()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_10077A9D0()
{
  return EnabledTextSelectability.init()();
}

uint64_t sub_10077A9E0()
{
  return type metadata accessor for EnabledTextSelectability();
}

uint64_t sub_10077A9F0()
{
  return static TextInputAutocapitalization.never.getter();
}

uint64_t sub_10077AA00()
{
  return type metadata accessor for TextInputAutocapitalization();
}

uint64_t sub_10077AA10()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10077AA20()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_10077AA30()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_10077AA40()
{
  return static Font.title3.getter();
}

uint64_t sub_10077AA50()
{
  return static Font.caption.getter();
}

uint64_t sub_10077AA60()
{
  return static Font.caption2.getter();
}

uint64_t sub_10077AA70()
{
  return static Font.footnote.getter();
}

uint64_t sub_10077AA80()
{
  return static Font.headline.getter();
}

uint64_t sub_10077AA90()
{
  return List<>.init(content:)();
}

uint64_t sub_10077AAA0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_10077AAB0()
{
  return Text.bold()();
}

uint64_t sub_10077AAC0()
{
  return Text.font(_:)();
}

uint64_t sub_10077AAD0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10077AAE0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10077AAF0()
{
  return View.intentDispatcher(_:with:)();
}

uint64_t sub_10077AB00()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10077AB10()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10077AB20()
{
  return View.searchable(text:placement:prompt:)();
}

uint64_t sub_10077AB30()
{
  return View.keyboardType(_:)();
}

uint64_t sub_10077AB40()
{
  return View.textSelection<A>(_:)();
}

uint64_t sub_10077AB50()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10077AB60()
{
  return View.navigationTitle(_:)();
}

uint64_t sub_10077AB70()
{
  return View.headerProminence(_:)();
}

uint64_t sub_10077AB80()
{
  return View.listRowSeparator(_:edges:)();
}

uint64_t sub_10077AB90()
{
  return View.textInputAutocapitalization(_:)();
}

uint64_t sub_10077ABA0()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_10077ABB0()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_10077ABC0()
{
  return Image.init(systemName:)();
}

uint64_t sub_10077ABD0()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_10077ABE0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_10077ABF0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_10077AC00()
{
  return State.projectedValue.getter();
}

uint64_t sub_10077AC10()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_10077AC20()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_10077AC30()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_10077AC40()
{
  return ShareLink<>.init<>(item:subject:message:label:)();
}

uint64_t sub_10077AC50()
{
  return type metadata accessor for DeviceAppQuery();
}

uint64_t sub_10077AC60()
{
  return DeviceAppStateDataSource.__allocating_init(query:fetcher:updateRegistry:store:)();
}

uint64_t sub_10077AC70()
{
  return type metadata accessor for DeviceAppStateDataSource();
}

uint64_t sub_10077AC80()
{
  return DefaultAppStateDataSource.init()();
}

uint64_t sub_10077AC90()
{
  return type metadata accessor for DefaultAppStateDataSource();
}

uint64_t sub_10077ACA0()
{
  return WaitingAppStateDataSource.init()();
}

uint64_t sub_10077ACB0()
{
  return type metadata accessor for WaitingAppStateDataSource();
}

uint64_t sub_10077ACC0()
{
  return ASDDeviceAppFetcher.init(regulatoryLogger:)();
}

uint64_t sub_10077ACD0()
{
  return type metadata accessor for ASDDeviceAppFetcher();
}

uint64_t sub_10077ACE0()
{
  return type metadata accessor for App.Kind();
}

uint64_t sub_10077ACF0()
{
  return type metadata accessor for AppStoreType();
}

uint64_t sub_10077AD00()
{
  return DeviceUpdateRegistry.__allocating_init()();
}

uint64_t sub_10077AD10()
{
  return type metadata accessor for DeviceUpdateRegistry();
}

uint64_t sub_10077AD20()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_10077AD30()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10077AD40()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_10077AD50()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10077AD60()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_10077AD70()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10077AD80()
{
  return static DispatchTime.now()();
}

uint64_t sub_10077AD90()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10077ADA0()
{
  return dispatch thunk of DispatchWorkItem.isCancelled.getter();
}

uint64_t sub_10077ADB0()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_10077ADC0()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_10077ADD0()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_10077ADE0()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_10077ADF0()
{
  return + infix(_:_:)();
}

uint64_t sub_10077AE00()
{
  return + infix(_:_:)();
}

uint64_t sub_10077AE10()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_10077AE20()
{
  return AsyncEvent.post(_:)();
}

uint64_t sub_10077AE30()
{
  return AsyncEvent.init()();
}

uint64_t sub_10077AE40()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_10077AE50()
{
  return static Dependency.satisfying<A>(_:with:)();
}

uint64_t sub_10077AE60()
{
  return type metadata accessor for Dependency();
}

uint64_t sub_10077AE70()
{
  return JSIncident.description.getter();
}

uint64_t sub_10077AE80()
{
  return JSIncident.contextSummary.getter();
}

uint64_t sub_10077AE90()
{
  return JSIncident.problemSummary.getter();
}

uint64_t sub_10077AEA0()
{
  return type metadata accessor for JSIncident();
}

uint64_t sub_10077AEB0()
{
  return JSONObject.appStoreColor.getter();
}

uint64_t sub_10077AEC0()
{
  return JSONObject.array.getter();
}

uint64_t sub_10077AED0()
{
  return JSONObject.double.getter();
}

uint64_t sub_10077AEE0()
{
  return JSONObject.string.getter();
}

uint64_t sub_10077AEF0()
{
  return JSONObject.init(wrapping:)();
}

uint64_t sub_10077AF00()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_10077AF10()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_10077AF20()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_10077AF30()
{
  return static LogMessage.traceableSensitive(_:)();
}

uint64_t sub_10077AF40()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_10077AF50()
{
  return LogMessage.StringInterpolation.appendInterpolation(identity:)();
}

uint64_t sub_10077AF60()
{
  return LogMessage.StringInterpolation.appendInterpolation(sensitive:)();
}

void sub_10077AF70(Swift::String a1)
{
}

uint64_t sub_10077AF80()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10077AF90()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_10077AFA0()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_10077AFB0()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_10077AFC0()
{
  return static LogMessage.identity(_:)();
}

uint64_t sub_10077AFD0()
{
  return static LogMessage.sensitive(_:)();
}

uint64_t sub_10077AFE0()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_10077AFF0()
{
  return dispatch thunk of ShelfModel.items.getter();
}

uint64_t sub_10077B000()
{
  return StateStore.performTransaction<A>(_:)();
}

uint64_t sub_10077B010()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_10077B020()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_10077B030()
{
  return static IntentModel<>.kind.getter();
}

uint64_t sub_10077B040()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_10077B050()
{
  return MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)();
}

uint64_t sub_10077B060()
{
  return type metadata accessor for MetricsData();
}

uint64_t sub_10077B070()
{
  return static PageMetrics.notInstrumented.getter();
}

uint64_t sub_10077B080()
{
  return type metadata accessor for PageMetrics();
}

uint64_t sub_10077B090()
{
  return dispatch thunk of Preferences.removeValue(forKey:)();
}

uint64_t sub_10077B0A0()
{
  return Preferences.subscript.getter();
}

uint64_t sub_10077B0B0()
{
  return Preferences.subscript.modify();
}

uint64_t sub_10077B0C0()
{
  return Preferences.subscript.getter();
}

uint64_t sub_10077B0D0()
{
  return Preferences.subscript.setter();
}

uint64_t sub_10077B0E0()
{
  return DiffableLens.subscript.getter();
}

uint64_t sub_10077B0F0()
{
  return DiffableLens.value.getter();
}

uint64_t sub_10077B100()
{
  return dispatch thunk of static EventEmitter.defaultScheduler.getter();
}

uint64_t sub_10077B110()
{
  return EventEmitter.addObserver<A>(on:target:method:)();
}

uint64_t sub_10077B120()
{
  return EventEmitter.addObserver(on:singleUse:_:)();
}

uint64_t sub_10077B130()
{
  return EventEmitter.asyncStream.getter();
}

uint64_t sub_10077B140()
{
  return ReadOnlyLens.subscript.getter();
}

uint64_t sub_10077B150()
{
  return ReadOnlyLens.value.getter();
}

uint64_t sub_10077B160()
{
  return ReplayLogger.replay(last:messagesInto:)();
}

uint64_t sub_10077B170()
{
  return ReplayLogger.init()();
}

uint64_t sub_10077B180()
{
  return type metadata accessor for ReplayLogger();
}

uint64_t sub_10077B190()
{
  return static ActionMetrics.notInstrumented.getter();
}

uint64_t sub_10077B1A0()
{
  return ActionMetrics.init(data:custom:)();
}

uint64_t sub_10077B1B0()
{
  return type metadata accessor for ActionMetrics();
}

uint64_t sub_10077B1C0()
{
  return type metadata accessor for ActionOutcome();
}

uint64_t sub_10077B1D0()
{
  return MetricsLogger.init(loggerName:configuration:)();
}

uint64_t sub_10077B1E0()
{
  return type metadata accessor for MetricsLogger.Configuration();
}

uint64_t sub_10077B1F0()
{
  return MetricsLogger.log(contentsOf:)();
}

uint64_t sub_10077B200()
{
  return type metadata accessor for MetricsLogger();
}

uint64_t sub_10077B210()
{
  return static PreferenceKey.== infix(_:_:)();
}

uint64_t sub_10077B220()
{
  return type metadata accessor for PreferenceKey();
}

uint64_t sub_10077B230()
{
  return PreferenceKey.init(_:)();
}

uint64_t sub_10077B240()
{
  return dispatch thunk of TaskScheduler.schedule(task:)();
}

uint64_t sub_10077B250()
{
  return ComponentModel.pairedWith<A>(objectGraph:)();
}

uint64_t sub_10077B260()
{
  return dispatch thunk of ComponentModel.id.getter();
}

uint64_t sub_10077B270()
{
  return CompoundLogger.init(loggers:)();
}

uint64_t sub_10077B280()
{
  return type metadata accessor for CompoundLogger();
}

uint64_t sub_10077B2A0()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_10077B2B0()
{
  return dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)();
}

uint64_t sub_10077B2C0()
{
  return dispatch thunk of BaseObjectGraph.name.setter();
}

uint64_t sub_10077B2D0()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t sub_10077B2E0()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t sub_10077B2F0()
{
  return dispatch thunk of BaseObjectGraph.adding<A>(allDependencies:)();
}

uint64_t sub_10077B300()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t sub_10077B310()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_10077B320()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t sub_10077B330()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_10077B340()
{
  return static MetricsPipeline.objectGraphWithNewPipelineConfiguredWith(optInProviders:optOutProviders:asPartOf:)();
}

uint64_t sub_10077B350()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t sub_10077B360()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t sub_10077B370()
{
  return static PageRenderEvent.willPerformAction()();
}

uint64_t sub_10077B380()
{
  return ActionDispatcher.targetQueue.getter();
}

uint64_t sub_10077B390()
{
  return ActionDispatcher.add<A>(_:)();
}

uint64_t sub_10077B3A0()
{
  return ActionDispatcher.perform(_:withMetrics:asPartOf:)();
}

uint64_t sub_10077B3B0()
{
  return ActionDispatcher.init()();
}

uint64_t sub_10077B3C0()
{
  return LocalPreferences.removeValue(forKey:)();
}

uint64_t sub_10077B3D0()
{
  return static LocalPreferences.currentApplication.getter();
}

uint64_t sub_10077B3E0()
{
  return static LocalPreferences.placeholderDisableShelfHydration.getter();
}

uint64_t sub_10077B3F0()
{
  return static LocalPreferences.AppStoreKitInternal.getter();
}

uint64_t sub_10077B400()
{
  return type metadata accessor for LocalPreferences();
}

uint64_t sub_10077B410()
{
  return ScalarDictionary.init()();
}

uint64_t sub_10077B420()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t sub_10077B430()
{
  return type metadata accessor for EventSubscription();
}

uint64_t sub_10077B440()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_10077B450()
{
  return ImpressionMetrics.withParentId(_:)();
}

uint64_t sub_10077B460()
{
  return ImpressionMetrics.ID.index.getter();
}

uint64_t sub_10077B470()
{
  return ImpressionMetrics.ID.parent.getter();
}

uint64_t sub_10077B480()
{
  return ImpressionMetrics.ID.element.getter();
}

uint64_t sub_10077B490()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t sub_10077B4A0()
{
  return ImpressionMetrics.id.getter();
}

uint64_t sub_10077B4B0()
{
  return ImpressionMetrics.fields.getter();
}

uint64_t sub_10077B4C0()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t sub_10077B4D0()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_10077B4E0()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_10077B4F0()
{
  return WritableStateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_10077B500()
{
  return WritableStateLens<A>.updateValue(_:)();
}

uint64_t sub_10077B510()
{
  return WritableStateLens<A>.currentValue.getter();
}

uint64_t sub_10077B520()
{
  return WritableStateLens<A>.subscript.getter();
}

uint64_t sub_10077B530()
{
  return type metadata accessor for WritableStateLens();
}

uint64_t sub_10077B540()
{
  return WritableStateLens.init(_:)();
}

uint64_t sub_10077B550()
{
  return dispatch thunk of ImpressionsTracker.removeAllImpressions()();
}

uint64_t sub_10077B560()
{
  return dispatch thunk of ImpressionsTracker.elementDidEnterView(_:on:)();
}

uint64_t sub_10077B570()
{
  return dispatch thunk of ImpressionsTracker.elementDidLeaveView(_:on:)();
}

uint64_t sub_10077B580()
{
  return type metadata accessor for LintedMetricsEvent.Issue();
}

uint64_t sub_10077B590()
{
  return LintedMetricsEvent.fields.getter();
}

uint64_t sub_10077B5A0()
{
  return static SignpostAggregator.log.getter();
}

uint64_t sub_10077B5B0()
{
  return type metadata accessor for SignpostAggregator();
}

uint64_t sub_10077B5C0()
{
  return static AutomationSemantics.onboarding(elementName:id:parentId:)();
}

uint64_t sub_10077B5D0()
{
  return static AutomationSemantics.offerButton(id:parentId:)();
}

uint64_t sub_10077B5E0()
{
  return static AutomationSemantics.productPage(elementName:id:parentId:)();
}

uint64_t sub_10077B5F0()
{
  return static AutomationSemantics.searchField()();
}

uint64_t sub_10077B600()
{
  return static AutomationSemantics.accountButton()();
}

uint64_t sub_10077B610()
{
  return static AutomationSemantics.dismissButton()();
}

uint64_t sub_10077B620()
{
  return static AutomationSemantics.shelfItemSubComponent(itemKind:id:parentId:)();
}

uint64_t sub_10077B630()
{
  return static AutomationSemantics.page(name:id:)();
}

uint64_t sub_10077B640()
{
  return static AutomationSemantics.shelf(_:id:parentId:)();
}

uint64_t sub_10077B650()
{
  return AutomationSemantics.attribute(key:value:)();
}

uint64_t sub_10077B660()
{
  return static AutomationSemantics.shelfItem(itemKind:id:parentId:)();
}

uint64_t sub_10077B670()
{
  return type metadata accessor for AutomationSemantics();
}

uint64_t sub_10077B680()
{
  return TransientStateStore.removeState(at:recursively:)();
}

void sub_10077B690()
{
}

uint64_t sub_10077B6A0()
{
  return TransientStateStore.init(isConcurrent:)();
}

uint64_t sub_10077B6B0()
{
  return MetricsEventRecorder._recordAsync(_:on:)();
}

uint64_t sub_10077B6C0()
{
  return static MetricsFieldsContext.emptyContext.getter();
}

uint64_t sub_10077B6D0()
{
  return static MetricsFieldsContext.createFieldsContext(impressionsTracker:adamIdString:pageContextOverride:referrer:participatingInCrossfireReferral:pageFields:preloaded:advertRotationData:searchGhostHintData:contextualAction:deviceWindowData:impressionsAppendixData:)();
}

uint64_t sub_10077B6E0()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t sub_10077B6F0()
{
  return static FlowActionPresentation.stackPush.getter();
}

uint64_t sub_10077B700()
{
  return BasicImpressionsTracker.__allocating_init(threshold:)();
}

uint64_t sub_10077B710()
{
  return type metadata accessor for BasicImpressionsTracker();
}

uint64_t sub_10077B720()
{
  return static StartUpPerformanceEvent.Checkpoint.bootstrapFinished.getter();
}

uint64_t sub_10077B730()
{
  return type metadata accessor for StartUpPerformanceEvent.Checkpoint();
}

uint64_t sub_10077B740()
{
  return StartUpPerformanceEvent.record(checkpoint:)();
}

uint64_t sub_10077B750()
{
  return type metadata accessor for StartUpPerformanceEvent();
}

uint64_t sub_10077B760()
{
  return static ViewWillDisappearReason.inferred(for:)();
}

uint64_t sub_10077B770()
{
  return type metadata accessor for ViewWillDisappearReason();
}

JSValue sub_10077B780(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

JSValue sub_10077B790(JSContext in)
{
  return CustomJSValueConvertible.makeValue(in:)(in);
}

void sub_10077B7B0()
{
}

uint64_t sub_10077B7C0()
{
  return PageRenderMetricsPresenter.viewWillDisappear(forReason:)();
}

uint64_t sub_10077B7D0()
{
  return static MetricsFieldExclusionRequest.arcadeSubscription.getter();
}

uint64_t sub_10077B7E0()
{
  return type metadata accessor for MetricsFieldExclusionRequest();
}

uint64_t sub_10077B7F0()
{
  return static MetricsFieldInclusionRequest.pageFields.getter();
}

uint64_t sub_10077B800()
{
  return static MetricsFieldInclusionRequest.searchGhostHint.getter();
}

uint64_t sub_10077B810()
{
  return static MetricsFieldInclusionRequest.arcadeButtonName.getter();
}

uint64_t sub_10077B820()
{
  return static MetricsFieldInclusionRequest.impressionsSnapshot.getter();
}

uint64_t sub_10077B830()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t sub_10077B840()
{
  return Bag.amsBag.getter();
}

uint64_t sub_10077B850()
{
  return Bag.init(from:)();
}

uint64_t sub_10077B860()
{
  return Bag.Profile.init(name:version:)();
}

uint64_t sub_10077B870()
{
  return type metadata accessor for Bag.Profile();
}

uint64_t sub_10077B880()
{
  return type metadata accessor for Bag();
}

uint64_t sub_10077B890()
{
  return Logger.info(_:)();
}

uint64_t sub_10077B8A0()
{
  return Logger.debug(_:)();
}

uint64_t sub_10077B8B0()
{
  return Logger.error(_:)();
}

uint64_t sub_10077B8C0()
{
  return Logger.warning(_:)();
}

uint64_t sub_10077B8D0()
{
  return inject<A>(_:from:)();
}

uint64_t sub_10077B8E0()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_10077B8F0()
{
  return type metadata accessor for JSError();
}

uint64_t sub_10077B900()
{
  return Promise.isResolved.getter();
}

uint64_t sub_10077B910()
{
  return Promise.pipe(to:)();
}

uint64_t sub_10077B920()
{
  return Promise.map<A>(on:_:)();
}

uint64_t sub_10077B930()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_10077B940()
{
  return Promise.__allocating_init(error:)();
}

uint64_t sub_10077B950()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_10077B960()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_10077B970()
{
  return Promise.reject(_:)();
}

uint64_t sub_10077B980()
{
  return Promise.resolve(_:)();
}

uint64_t sub_10077B990()
{
  return Promise.__allocating_init()();
}

uint64_t sub_10077B9A0()
{
  return type metadata accessor for NilState();
}

uint64_t sub_10077B9B0()
{
  return static OSLogger.inlineUnifiedMessage.getter();
}

uint64_t sub_10077B9C0()
{
  return OSLogger.Subsystem.init(rawValue:)();
}

uint64_t sub_10077B9D0()
{
  return type metadata accessor for OSLogger.Subsystem();
}

uint64_t sub_10077B9E0()
{
  return OSLogger.init(subsystem:category:)();
}

uint64_t sub_10077B9F0()
{
  return type metadata accessor for OSLogger();
}

uint64_t sub_10077BA00()
{
  return type metadata accessor for JSONArray();
}

uint64_t sub_10077BA10()
{
  return type metadata accessor for JSONError();
}

uint64_t sub_10077BA20()
{
  return StateLens.init<A>(contentsOf:in:)();
}

uint64_t sub_10077BA30()
{
  return StateLens<A>.currentValue.getter();
}

uint64_t sub_10077BA40()
{
  return StateLens<A>.subscript.getter();
}

uint64_t sub_10077BA50()
{
  return type metadata accessor for StateLens();
}

uint64_t sub_10077BA60()
{
  return StateLens.init(_:)();
}

uint64_t sub_10077BA70()
{
  return StateLens.init(_:)();
}

uint64_t sub_10077BA80()
{
  return StatePath.init<A>(components:)();
}

uint64_t sub_10077BA90()
{
  return StatePath<A>.init(_:)();
}

uint64_t sub_10077BAA0()
{
  return StatePath.init(component:)();
}

uint64_t sub_10077BAB0()
{
  return SyncEvent.removeObserver(_:)();
}

uint64_t sub_10077BAC0()
{
  return SyncEvent.post(_:)();
}

uint64_t sub_10077BAD0()
{
  return SyncEvent.init()();
}

uint64_t sub_10077BAE0()
{
  return type metadata accessor for SyncEvent();
}

uint64_t sub_10077BAF0()
{
  return dispatch thunk of ViewModel.impressionMetrics.getter();
}

uint64_t sub_10077BB00()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t sub_10077BB10()
{
  return static WidgetCenter.shared.getter();
}

uint64_t sub_10077BB20()
{
  return type metadata accessor for WidgetCenter();
}

NSDictionary sub_10077BB30()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10077BB40()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10077BB50()
{
  return Dictionary.description.getter();
}

uint64_t sub_10077BB60()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t sub_10077BB70()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_10077BB80()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_10077BB90()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_10077BBA0()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_10077BBB0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10077BBC0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10077BBD0()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_10077BBE0()
{
  return BidirectionalCollection<>.starts<A>(with:)();
}

uint64_t sub_10077BBF0()
{
  return dispatch thunk of BidirectionalCollection.formIndex(before:)();
}

uint64_t sub_10077BC00()
{
  return BidirectionalCollection<>.difference<A>(from:)();
}

uint64_t sub_10077BC10()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10077BC20()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_10077BC30()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

void sub_10077BC40(Swift::String a1)
{
}

void sub_10077BC50(Swift::String a1)
{
}

uint64_t sub_10077BC60()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10077BC70()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

NSString sub_10077BC80()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10077BC90()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10077BCA0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10077BCB0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10077BCC0()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_10077BCD0()
{
  return String.init(data:encoding:)();
}

uint64_t sub_10077BCE0()
{
  return String.init(format:_:)();
}

uint64_t sub_10077BCF0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_10077BD00()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_10077BD10()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10077BD20()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10077BD30()
{
  return String.nilIfEmpty.getter();
}

uint64_t sub_10077BD40()
{
  return String.encapsulated(color:scale:shape:style:platterSize:lineWeight:minimumWidth:)();
}

uint64_t sub_10077BD50()
{
  return static String.isNilOrEmpty(_:)();
}

BOOL sub_10077BD60(Swift::String a1)
{
  return String.hasPrefixCaseInsensitive(_:)(a1);
}

uint64_t sub_10077BD70(Swift::String upToCharacter)
{
  return String.prefix(upToCharacter:)(upToCharacter)._countAndFlagsBits;
}

BOOL sub_10077BD80(Swift::String_optional expansionFor)
{
  return String.isValid(expansionFor:)(expansionFor);
}

uint64_t sub_10077BD90()
{
  return String.hash(into:)();
}

uint64_t sub_10077BDA0()
{
  return String.languageAwareOutsets(whenUsedWith:)();
}

uint64_t sub_10077BDB0()
{
  return String.count.getter();
}

uint64_t sub_10077BDC0()
{
  return String.append<A>(contentsOf:)();
}

void sub_10077BDD0(Swift::String a1)
{
}

uint64_t sub_10077BDE0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_10077BDF0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_10077BE10()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_10077BE20()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_10077BE30(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_10077BE40()
{
  return String.hashValue.getter();
}

uint64_t sub_10077BE50(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_10077BE60()
{
  return String.init<A>(_:)();
}

uint64_t sub_10077BE70()
{
  return String.subscript.getter();
}

uint64_t sub_10077BE80()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_10077BE90()
{
  return dispatch thunk of Sequence._copyToContiguousArray()();
}

uint64_t sub_10077BEA0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_10077BEB0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10077BEC0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10077BED0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10077BEE0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10077BEF0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10077BF00()
{
  return Array<A>.bestArtworkLayoutMetrics(for:prioritizing:)();
}

uint64_t sub_10077BF10()
{
  return Array<A>.visibleItemsTransformer(for:observing:asPartOf:)();
}

uint64_t sub_10077BF20()
{
  return Array.isNotEmpty.getter();
}

uint64_t sub_10077BF30()
{
  return Array.chunked(by:)();
}

uint64_t sub_10077BF40()
{
  return Array<A>.totalTopSupplementaryHeight.getter();
}

uint64_t sub_10077BF50()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_10077BF60()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10077BF70()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10077BF80()
{
  return Array<A>.init(tryDeserializing:using:)();
}

uint64_t sub_10077BF90()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10077BFB0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10077BFC0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10077BFD0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10077BFE0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10077BFF0()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_10077C010()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

NSNumber sub_10077C020()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_10077C030()
{
  return Double.description.getter();
}

uint64_t sub_10077C040()
{
  return Double._roundSlowPath(_:)();
}

uint64_t sub_10077C050()
{
  return Double.rawValue(in:)();
}

uint64_t sub_10077C060()
{
  return Float.description.getter();
}

NSSet sub_10077C070()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_10077C080()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10077C090()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10077C0A0()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber sub_10077C0B0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10077C0C0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_10077C0D0()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_10077C0E0()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_10077C0F0()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_10077C100()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_10077C110()
{
  return type metadata accessor for UITextItem.Content();
}

uint64_t sub_10077C120()
{
  return UITextItem.content.getter();
}

uint64_t sub_10077C130()
{
  return CGContextRef.clip(using:)();
}

uint64_t sub_10077C140()
{
  return CGContextRef.move(to:)();
}

uint64_t sub_10077C150()
{
  return CGContextRef.addArc(center:radius:startAngle:endAngle:clockwise:)();
}

uint64_t sub_10077C160()
{
  return CGContextRef.addLine(to:)();
}

uint64_t sub_10077C170()
{
  return CGContextRef.fillPath(using:)();
}

uint64_t sub_10077C180()
{
  return NSDictionary.init(dictionary:)();
}

uint64_t sub_10077C190()
{
  return static UIEdgeInsets.vertical(top:bottom:)();
}

uint64_t sub_10077C1A0()
{
  return static UIEdgeInsets.horizontal(left:right:)();
}

uint64_t sub_10077C1B0()
{
  return UIEdgeInsets.hash(into:)();
}

uint64_t sub_10077C1C0()
{
  return UIRectCorner.caCornerMask.getter();
}

uint64_t sub_10077C1D0()
{
  return static GKLocalPlayer.presentActivitySharingRepromptInOverlay(recipientName:)();
}

uint64_t sub_10077C1E0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10077C1F0()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.getter();
}

uint64_t sub_10077C200()
{
  return NSUserDefaults.shelfOrthogonalScrollingBehavior.setter();
}

UIBarButtonItem sub_10077C210(UIBarButtonSystemItem systemItem, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(systemItem:primaryAction:menu:)(systemItem, primaryAction, menu);
}

UIBarButtonItem sub_10077C220(Swift::String_optional title, UIImage_optional image, UIAction_optional primaryAction, UIMenu_optional menu)
{
  return UIBarButtonItem.init(title:image:primaryAction:menu:)(title, image, primaryAction, menu);
}

uint64_t sub_10077C230()
{
  return NSParagraphStyle.isListItem.getter();
}

uint64_t sub_10077C240()
{
  return static NSParagraphStyle.listItem(withFont:)();
}

uint64_t sub_10077C250()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:in:)();
}

uint64_t sub_10077C260()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t sub_10077C270()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t sub_10077C280()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t sub_10077C290()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t sub_10077C2A0()
{
  return UIViewController.traitOverrides.getter();
}

uint64_t sub_10077C2B0()
{
  return UIViewController.traitOverrides.setter();
}

uint64_t sub_10077C2C0()
{
  return UIViewController.registerForTraitChanges(_:action:)();
}

uint64_t sub_10077C2D0()
{
  return UIViewController.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_10077C2E0()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_10077C2F0()
{
  return static CGAffineTransform.== infix(_:_:)();
}

uint64_t sub_10077C300()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_10077C310()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_10077C320()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_10077C330()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_10077C340()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_10077C350()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10077C360()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10077C370()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_10077C380()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_10077C390()
{
  return UITraitCollection.isRegularPad.getter();
}

UITraitCollection sub_10077C3A0(__C::UIContentSizeCategory_optional min, __C::UIContentSizeCategory_optional max)
{
  return UITraitCollection.clampingContentSizeCategory(min:max:)(min, max);
}

uint64_t sub_10077C3B0()
{
  return UITraitCollection.isSizeClassCompact.getter();
}

uint64_t sub_10077C3C0()
{
  return UITraitCollection.isSizeClassRegular.getter();
}

uint64_t sub_10077C3D0()
{
  return UITraitCollection.prefersRightToLeftLayouts.getter();
}

uint64_t sub_10077C3E0()
{
  return UITraitCollection.prefersAccessibilityLayouts.getter();
}

uint64_t sub_10077C3F0()
{
  return static UITraitCollection.withSystemPreferredContentSizeCategory.getter();
}

uint64_t sub_10077C400()
{
  return UITraitCollection.modifyingTraits(_:)();
}

uint64_t sub_10077C410()
{
  return static UITraitCollection.systemTraitsAffectingImageLookup.getter();
}

uint64_t sub_10077C420()
{
  return static UITraitCollection.systemTraitsAffectingColorAppearance.getter();
}

uint64_t sub_10077C430()
{
  return NSAttributedString.init(_:)();
}

uint64_t sub_10077C440()
{
  return NSAttributedString.byCollapsingNewlines.getter();
}

uint64_t sub_10077C450()
{
  return NSAttributedString.init(images:for:adjustsImageSizeForAccessibilityContentSizeCategory:interItemSpacing:defaultAttributes:imagesShouldRenderAsTemplates:)();
}

NSAttributedString sub_10077C460(NSAttributedString attributedString, Swift::OpaquePointer defaultAttributes)
{
  return NSAttributedString.init(attributedString:defaultAttributes:)(attributedString, defaultAttributes);
}

uint64_t sub_10077C470()
{
  return static NSNotificationName.VideoDecoderUnavailable.getter();
}

uint64_t sub_10077C480()
{
  return static NSNotificationName.AutoPlayVideoSettingsDidChange.getter();
}

uint64_t sub_10077C490()
{
  return UITraitEnvironment.withAccessibleContentSizesDisabled.getter();
}

uint64_t sub_10077C4A0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_10077C4B0()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_10077C4C0()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t sub_10077C4D0()
{
  return UICollectionViewCell.backgroundConfiguration.setter();
}

uint64_t sub_10077C4E0()
{
  return static UIImageConfiguration.symbolConfiguration(textStyle:weight:scale:)();
}

uint64_t sub_10077C4F0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

void sub_10077C500()
{
}

Swift::Int sub_10077C510()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10077C520()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

uint64_t sub_10077C530()
{
  return static UIContentSizeCategory.> infix(_:_:)();
}

uint64_t sub_10077C540()
{
  return static UIContentSizeCategory.< infix(_:_:)();
}

uint64_t sub_10077C550()
{
  return static UIContentSizeCategory.>= infix(_:_:)();
}

uint64_t sub_10077C560()
{
  return static UIContentSizeCategory.<= infix(_:_:)();
}

uint64_t sub_10077C570()
{
  return static UIViewPropertyAnimator.fadeInPropertyAnimator.getter();
}

uint64_t sub_10077C580()
{
  return static NSCollectionLayoutGroup.emptyLayoutGroup(for:)();
}

uint64_t sub_10077C590()
{
  return NSDirectionalEdgeInsets.edgeInsets.getter();
}

uint64_t sub_10077C5A0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(in:)();
}

uint64_t sub_10077C5B0()
{
  return NSDirectionalEdgeInsets.insetsWithLayoutDirection(_:)();
}

uint64_t sub_10077C5C0()
{
  return static UICollectionReusableView.elementKind.getter();
}

uint64_t sub_10077C5D0()
{
  return static UICollectionReusableView.defaultReuseIdentifier.getter();
}

uint64_t sub_10077C5E0()
{
  return static UICollectionReusableView.matchesItemElementKind(_:)();
}

uint64_t sub_10077C5F0()
{
  return static UICollectionReusableView.makeItemScopedElementKind(in:uniquify:)();
}

uint64_t sub_10077C600()
{
  return UICollectionViewListCell.accessories.getter();
}

uint64_t sub_10077C610()
{
  return UICollectionViewListCell.accessories.setter();
}

uint64_t sub_10077C620()
{
  return UIContentUnavailableView.init(configuration:)();
}

uint64_t sub_10077C630()
{
  return UIPresentationController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_10077C640()
{
  return static NSCollectionLayoutSection.emptyLayoutSection(for:)();
}

uint64_t sub_10077C650()
{
  return static NSCollectionLayoutSection.list(using:layoutEnvironment:)();
}

uint64_t sub_10077C660()
{
  return static UIImageSymbolConfiguration.configuration(textStyle:weight:scale:)();
}

uint64_t sub_10077C670()
{
  return UIPopoverPresentationControllerSourceItem.frame(in:)();
}

uint64_t sub_10077C680()
{
  return CGRect.withLayoutDirection(using:relativeTo:)();
}

uint64_t sub_10077C690()
{
  return static CGRect.frame(centeredWithin:of:)();
}

uint64_t sub_10077C6A0()
{
  return static CGRect.frame(pinnedAtTopCenterOf:of:)();
}

uint64_t sub_10077C6B0()
{
  return static CGRect.frame(pinnedAtBottomLeftOf:of:)();
}

uint64_t sub_10077C6C0()
{
  return CGRect.rounded(originRule:sizeRule:)();
}

uint64_t sub_10077C6D0()
{
  return CGRect.rounded(_:)();
}

uint64_t sub_10077C6E0()
{
  return CGRect.subtracting(insets:)();
}

uint64_t sub_10077C6F0()
{
  return CGRect.withLayoutDirection(in:relativeTo:)();
}

uint64_t sub_10077C700()
{
  return CGRect.withLayoutDirection(_:relativeTo:)();
}

uint64_t sub_10077C710()
{
  return CGRect.inset(bySeparator:in:)();
}

uint64_t sub_10077C720()
{
  return CGRect.adding(outsets:)();
}

uint64_t sub_10077C730()
{
  return CGSize.scaled(_:)();
}

uint64_t sub_10077C740()
{
  return CGSize.fitting(_:mode:)();
}

uint64_t sub_10077C750()
{
  return CGSize.rounded(_:)();
}

uint64_t sub_10077C760()
{
  return CGSize.integral.getter();
}

uint64_t sub_10077C770()
{
  return CGSize.subtracting(insets:)();
}

uint64_t sub_10077C780()
{
  return CGSize.add(outsets:)();
}

uint64_t sub_10077C790()
{
  return CGSize.adding(outsets:)();
}

uint64_t sub_10077C7A0()
{
  return CGSize.adding(separator:in:)();
}

uint64_t sub_10077C7B0()
{
  return static CMTime.== infix(_:_:)();
}

unint64_t sub_10077C7C0(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  return (unint64_t)CMTime.init(seconds:preferredTimescale:)(seconds, preferredTimescale);
}

uint64_t sub_10077C7D0()
{
  return static UIFont.preferredFont(forUseWith:in:)();
}

uint64_t sub_10077C7E0()
{
  return static UIFont.preferredFont(forUseWith:compatibleWith:)();
}

uint64_t sub_10077C7F0()
{
  return UIFont.estimatedFirstBaseline.getter();
}

UIMenu sub_10077C800(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_10077C810()
{
  return UIView.annotate(with:)();
}

uint64_t sub_10077C820()
{
  return UIView.boundsBasedPlaceable.getter();
}

uint64_t sub_10077C830()
{
  return static UIView.defaultHighlightAlpha.getter();
}

uint64_t sub_10077C840()
{
  return UIView.setAutomationSemantics(_:)();
}

uint64_t sub_10077C850()
{
  return UIView.withUntransformedFrame.getter();
}

uint64_t sub_10077C860()
{
  return UIView.traitOverrides.getter();
}

uint64_t sub_10077C870()
{
  return UIView.traitOverrides.setter();
}

uint64_t sub_10077C880()
{
  return UIView.registerForTraitChanges(_:action:)();
}

uint64_t sub_10077C890()
{
  return UIView.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_10077C8A0()
{
  return UIView.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_10077C8B0()
{
  return static UIView.animate(springDuration:bounce:initialSpringVelocity:delay:options:animations:completion:)();
}

uint64_t sub_10077C8C0()
{
  return CGPoint.rounded(_:)();
}

uint64_t sub_10077C8D0()
{
  return JSValue.subscript.setter();
}

uint64_t sub_10077C8E0()
{
  return NSArray.makeIterator()();
}

uint64_t sub_10077C8F0()
{
  return static UIColor.defaultLine.getter();
}

uint64_t sub_10077C900()
{
  return static UIColor.mediaBorder.getter();
}

uint64_t sub_10077C910()
{
  return static UIColor.primaryText.getter();
}

uint64_t sub_10077C920()
{
  return static UIColor.tertiaryText.getter();
}

uint64_t sub_10077C930()
{
  return static UIColor.secondaryText.getter();
}

uint64_t sub_10077C940()
{
  return static UIColor.reviewBackground.getter();
}

uint64_t sub_10077C950()
{
  return static UIColor.defaultBackground.getter();
}

uint64_t sub_10077C960()
{
  return static UIColor.tableViewBackground.getter();
}

uint64_t sub_10077C970()
{
  return static UIColor.tableViewCellChevron.getter();
}

uint64_t sub_10077C980()
{
  return static UIColor.placeholderBackground.getter();
}

uint64_t sub_10077C990()
{
  return static UIColor.defaultButtonTitleColor.getter();
}

uint64_t sub_10077C9A0()
{
  return static UIColor.tableViewCellBackground.getter();
}

uint64_t sub_10077C9B0()
{
  return static UIColor.todayCardDefaultBackground.getter();
}

uint64_t sub_10077C9C0()
{
  return static UIColor.componentBackgroundStandout.getter();
}

uint64_t sub_10077C9D0()
{
  return static UIColor.defaultButtonBackgroundColor.getter();
}

uint64_t sub_10077C9E0()
{
  return static UIColor.placeholderBackgroundStandout.getter();
}

uint64_t sub_10077C9F0()
{
  return static UIColor.tableViewCellSelectedBackground.getter();
}

uint64_t sub_10077CA00()
{
  return static UIColor.hex(_:)();
}

UIColor sub_10077CA10(UIColor light, UIColor dark)
{
  return UIColor.init(light:dark:)(light, dark);
}

uint64_t sub_10077CA20()
{
  return UIColor.isDark(threshold:)();
}

uint64_t sub_10077CA30()
{
  return UIColor.isDark.getter();
}

uint64_t sub_10077CA40()
{
  return static UIColor.appTint.getter();
}

uint64_t sub_10077CA50()
{
  return UIColor.highlighted.getter();
}

UIColor sub_10077CA60(UIColor light, UIColor lightHighContrast, UIColor dark, UIColor darkHighContrast)
{
  return UIColor.init(light:lightHighContrast:dark:darkHighContrast:)(light, lightHighContrast, dark, darkHighContrast);
}

UIColor sub_10077CA70(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

uint64_t sub_10077CA80()
{
  return UIImage.baselineOffsetFromBottom.getter();
}

uint64_t sub_10077CA90()
{
  return UILabel.stringValue.getter();
}

uint64_t sub_10077CAA0()
{
  return UILabel.alignment.setter();
}

uint64_t sub_10077CAB0()
{
  return UILabel.textAppearance.setter();
}

uint64_t sub_10077CAC0()
{
  return UILabel.measure(toFit:with:)();
}

uint64_t sub_10077CAD0(Swift::OpaquePointer fromLanguageCodes)
{
  return NSBundle.preferredLocalization(fromLanguageCodes:)(fromLanguageCodes)._countAndFlagsBits;
}

NSNumber sub_10077CAE0(Swift::Double floatLiteral)
{
  return NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber sub_10077CAF0(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_10077CB00(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_10077CB10()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10077CB20()
{
  return NSObject.hash(into:)();
}

uint64_t sub_10077CB30()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_10077CB40()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_10077CB50()
{
  return UIButton.measure(toFit:with:)();
}

uint64_t sub_10077CB60()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.getter();
}

uint64_t sub_10077CB70()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_10077CB80()
{
  return UIButton.Configuration.background.modify();
}

uint64_t sub_10077CB90()
{
  return UIButton.Configuration.background.getter();
}

uint64_t sub_10077CBA0()
{
  return UIButton.Configuration.background.setter();
}

uint64_t sub_10077CBB0()
{
  return UIButton.Configuration.buttonSize.setter();
}

uint64_t sub_10077CBC0()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_10077CBD0()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_10077CBE0()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t sub_10077CBF0()
{
  return UIButton.Configuration.titlePadding.setter();
}

uint64_t sub_10077CC00()
{
  return UIButton.Configuration.contentInsets.modify();
}

uint64_t sub_10077CC10()
{
  return UIButton.Configuration.contentInsets.setter();
}

uint64_t sub_10077CC20()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t sub_10077CC30()
{
  return UIButton.Configuration.attributedTitle.modify();
}

uint64_t sub_10077CC40()
{
  return UIButton.Configuration.attributedTitle.setter();
}

uint64_t sub_10077CC50()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_10077CC60()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_10077CC70()
{
  return UIButton.Configuration.imageColorTransformer.setter();
}

uint64_t sub_10077CC80()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t sub_10077CC90()
{
  return type metadata accessor for UIButton.Configuration.Size();
}

uint64_t sub_10077CCA0()
{
  return static UIButton.Configuration.gray()();
}

uint64_t sub_10077CCB0()
{
  return UIButton.Configuration.image.getter();
}

uint64_t sub_10077CCC0()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_10077CCD0()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_10077CCE0()
{
  return UIButton.Configuration.title.setter();
}

uint64_t sub_10077CCF0()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_10077CD00()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_10077CD10()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_10077CD20()
{
  return UIButton.configuration.getter();
}

uint64_t sub_10077CD30()
{
  return UIButton.configuration.setter();
}

uint64_t sub_10077CD40()
{
  return NSCopying.makeCopy()();
}

uint64_t sub_10077CD50()
{
  return Optional<A>.isNilOrEmpty.getter();
}

uint64_t sub_10077CD60()
{
  return Optional._bridgeToObjectiveC()();
}

uint64_t sub_10077CD70()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10077CD80()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_10077CD90()
{
  return StringProtocol.uppercased(with:)();
}

uint64_t sub_10077CDA0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_10077CDB0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_10077CDC0()
{
  return StringProtocol.enumerateSubstrings<A>(in:options:_:)();
}

uint64_t sub_10077CDD0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_10077CDE0()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t sub_10077CDF0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10077CE00()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t sub_10077CE10()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t sub_10077CE20()
{
  return dispatch thunk of SetAlgebra.insert(_:)();
}

uint64_t sub_10077CE30()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
}

uint64_t sub_10077CE40()
{
  return dispatch thunk of SetAlgebra.subtract(_:)();
}

uint64_t sub_10077CE50()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)();
}

uint64_t sub_10077CE70()
{
  return dispatch thunk of SetAlgebra.init()();
}

uint64_t sub_10077CE80()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10077CE90()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10077CEA0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_10077CEB0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_10077CEC0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_10077CED0()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_10077CEE0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_10077CEF0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_10077CF00()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_10077CF10()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_10077CF20()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_10077CF30()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_10077CF40()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_10077CF50()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_10077CF60()
{
  return debugPrint(_:separator:terminator:)();
}

uint64_t sub_10077CF70()
{
  return AnyHashable.description.getter();
}

Swift::Int sub_10077CF80(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10077CF90()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10077CFA0()
{
  return AnyHashable.hash(into:)();
}

uint64_t sub_10077CFB0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10077CFC0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10077CFD0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10077CFE0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_10077CFF0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10077D000(Swift::Int a1)
{
}

uint64_t sub_10077D010()
{
  return StaticString.description.getter();
}

void sub_10077D020(Swift::Int a1)
{
}

uint64_t sub_10077D030()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10077D040()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10077D050()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10077D060()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10077D070()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10077D080()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10077D090()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10077D0A0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10077D0B0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10077D0C0()
{
  return _NativeDictionary.makeIterator()();
}

uint64_t sub_10077D0D0()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_10077D0E0()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_10077D0F0()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_10077D100()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_10077D110()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10077D120()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10077D130()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_10077D140()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10077D150()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10077D160()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10077D170()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10077D180()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_10077D190()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10077D1A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10077D1C0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_10077D1E0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10077D1F0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10077D200()
{
  return type metadata accessor for FloatingPointRoundingRule();
}

uint64_t sub_10077D210()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10077D220()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_10077D230()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10077D240()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_10077D250()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_10077D260()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_10077D270()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_10077D280()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10077D290()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10077D2A0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10077D2B0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10077D2C0()
{
  return Error._code.getter();
}

uint64_t sub_10077D2D0()
{
  return Error._domain.getter();
}

uint64_t sub_10077D2E0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10077D2F0()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_10077D300()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10077D310()
{
  return Hasher.init(_seed:)();
}

void sub_10077D320(Swift::UInt a1)
{
}

void sub_10077D330(Swift::UInt8 a1)
{
}

void sub_10077D340(Swift::UInt64 a1)
{
}

Swift::Int sub_10077D350()
{
  return Hasher.finalize()();
}

Swift::Int sub_10077D360()
{
  return Hasher._finalize()();
}

uint64_t sub_10077D370()
{
  return Hasher.init()();
}

uint64_t sub_10077D380()
{
  return _typeName(_:qualified:)();
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t ASKBuildTypeGetCurrent()
{
  return _ASKBuildTypeGetCurrent();
}

uint64_t ASKBuildTypeIsAnyOf()
{
  return _ASKBuildTypeIsAnyOf();
}

uint64_t ASKDeviceTypeGetCurrent()
{
  return _ASKDeviceTypeGetCurrent();
}

uint64_t ASKPerformanceProfileGetForCurrentDevice()
{
  return _ASKPerformanceProfileGetForCurrentDevice();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return _CGGradientCreateWithColors(space, colors, locations);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  CGPoint v4 = _CGPointApplyAffineTransform(point, t);
  double y = v4.y;
  double x = v4.x;
  result.double y = y;
  result.double x = x;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
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

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t JUMeasurementsEqual()
{
  return _JUMeasurementsEqual();
}

uint64_t JUScreenClassGetLandscapeWidth()
{
  return _JUScreenClassGetLandscapeWidth();
}

uint64_t JUScreenClassGetMain()
{
  return _JUScreenClassGetMain();
}

uint64_t JUScreenClassGetPortraitWidth()
{
  return _JUScreenClassGetPortraitWidth();
}

uint64_t JUScreenClassHasRoundedCorners()
{
  return _JUScreenClassHasRoundedCorners();
}

uint64_t JUScreenClassIsPhone()
{
  return _JUScreenClassIsPhone();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityButtonShapesEnabled(void)
{
  return _UIAccessibilityButtonShapesEnabled();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  return _UIAccessibilityConvertFrameToScreenCoordinates(rect, view);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

void UIRectFill(CGRect rect)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection()
{
  return __UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return _class_getMethodImplementation(cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
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

void method_exchangeImplementations(Method m1, Method m2)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return _swift_dynamicCastObjCClassUnconditional();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return _swift_dynamicCastUnknownClass();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced()
{
  return _swift_isUniquelyReferenced();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_readAtKeyPath()
{
  return _swift_readAtKeyPath();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return _swift_setAtReferenceWritableKeyPath();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakCopyAssign()
{
  return _swift_weakCopyAssign();
}

uint64_t swift_weakCopyInit()
{
  return _swift_weakCopyInit();
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

uint64_t swift_weakTakeAssign()
{
  return _swift_weakTakeAssign();
}

uint64_t swift_weakTakeInit()
{
  return _swift_weakTakeInit();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

long double tan(long double __x)
{
  return _tan(__x);
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 _baselineOffsetFromBottom];
}

id objc_msgSend__detailsCell(void *a1, const char *a2, ...)
{
  return _[a1 _detailsCell];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__fontWithSize_textStyleAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fontWithSize:textStyleAttribute:");
}

id objc_msgSend__presentationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentationViewController];
}

id objc_msgSend__primaryLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _primaryLabelFont];
}

id objc_msgSend__secondaryLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _secondaryLabelFont];
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerIgnoresDirectTouchEvents:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_applyHighLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyHighLumaSettingsToSettings:");
}

id objc_msgSend_applyLowLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyLowLumaSettingsToSettings:");
}

id objc_msgSend_applyMediumLumaSettingsToSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyMediumLumaSettingsToSettings:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_as_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_presentViewController:animated:completion:");
}

id objc_msgSend_as_viewControllersForVisibilityCallbackForwarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewControllersForVisibilityCallbackForwarding");
}

id objc_msgSend_as_viewDidBecomeFullyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewDidBecomeFullyVisible");
}

id objc_msgSend_as_viewDidBecomePartiallyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewDidBecomePartiallyVisible");
}

id objc_msgSend_as_viewWillBecomeFullyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewWillBecomeFullyVisible");
}

id objc_msgSend_as_viewWillBecomePartiallyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "as_viewWillBecomePartiallyVisible");
}

id objc_msgSend_backTitle(void *a1, const char *a2, ...)
{
  return _[a1 backTitle];
}

id objc_msgSend_backgroundColorForReducedTransparency(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColorForReducedTransparency];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_brightness(void *a1, const char *a2, ...)
{
  return _[a1 brightness];
}

id objc_msgSend_cancelTitle(void *a1, const char *a2, ...)
{
  return _[a1 cancelTitle];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_graphicsQuality(void *a1, const char *a2, ...)
{
  return _[a1 graphicsQuality];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTableView:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keyboardOverlapHeight(void *a1, const char *a2, ...)
{
  return _[a1 keyboardOverlapHeight];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_lineFragmentPadding(void *a1, const char *a2, ...)
{
  return _[a1 lineFragmentPadding];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _[a1 placeholder];
}

id objc_msgSend_placeholderText(void *a1, const char *a2, ...)
{
  return _[a1 placeholderText];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_primaryLabel(void *a1, const char *a2, ...)
{
  return _[a1 primaryLabel];
}

id objc_msgSend_privacyNote(void *a1, const char *a2, ...)
{
  return _[a1 privacyNote];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return _[a1 readableContentGuide];
}

id objc_msgSend_reasonID(void *a1, const char *a2, ...)
{
  return _[a1 reasonID];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _[a1 reasons];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_reportConcernExplanation(void *a1, const char *a2, ...)
{
  return _[a1 reportConcernExplanation];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_secondaryLabel(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabel];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_selectReasonSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 selectReasonSubtitle];
}

id objc_msgSend_selectReasonTitle(void *a1, const char *a2, ...)
{
  return _[a1 selectReasonTitle];
}

id objc_msgSend_selectedReason(void *a1, const char *a2, ...)
{
  return _[a1 selectedReason];
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _[a1 selectedViewController];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBackBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackBarButtonItem:");
}

id objc_msgSend_setBackTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackTitle:");
}

id objc_msgSend_setBackdropVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackdropVisible:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlurRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurRadius:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBrightness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrightness:");
}

id objc_msgSend_setCancelTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelTitle:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColorTint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTint:");
}

id objc_msgSend_setColorTintAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintAlpha:");
}

id objc_msgSend_setColorTintMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintMaskAlpha:");
}

id objc_msgSend_setColorTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTintMaskImage:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFilterMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterMaskAlpha:");
}

id objc_msgSend_setFilterMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilterMaskImage:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGrayscaleTintAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintAlpha:");
}

id objc_msgSend_setGrayscaleTintLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintLevel:");
}

id objc_msgSend_setGrayscaleTintMaskAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintMaskAlpha:");
}

id objc_msgSend_setGrayscaleTintMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGrayscaleTintMaskImage:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setKeyboardOverlapHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardOverlapHeight:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLegibleColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLegibleColor:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineSpacing:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlaceholderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholderText:");
}

id objc_msgSend_setPresentationWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationWindow:");
}

id objc_msgSend_setPrivacyNote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyNote:");
}

id objc_msgSend_setReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReasons:");
}

id objc_msgSend_setReportConcernExplanation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportConcernExplanation:");
}

id objc_msgSend_setRequiresColorStatistics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresColorStatistics:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSaturationDeltaFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaturationDeltaFactor:");
}

id objc_msgSend_setScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreen:");
}

id objc_msgSend_setSelectReasonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectReasonSubtitle:");
}

id objc_msgSend_setSelectReasonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectReasonTitle:");
}

id objc_msgSend_setSelectedReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedReason:");
}

id objc_msgSend_setSizesWindowToScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizesWindowToScene:");
}

id objc_msgSend_setSubmitTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubmitTitle:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
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

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUsesBackdropEffectView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesBackdropEffectView:");
}

id objc_msgSend_setUsesColorTintView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesColorTintView:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_submitTitle(void *a1, const char *a2, ...)
{
  return _[a1 submitTitle];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toastView(void *a1, const char *a2, ...)
{
  return _[a1 toastView];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_uppercaseName(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseName];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}