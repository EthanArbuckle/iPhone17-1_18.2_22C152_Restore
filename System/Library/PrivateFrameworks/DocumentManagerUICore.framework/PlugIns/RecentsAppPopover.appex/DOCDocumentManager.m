@interface DOCDocumentManager
- (DOCFullDocumentManagerViewController)documentBrowser;
- (UIDocumentBrowserViewControllerDelegate)uiBrowserDelegate;
- (_TtC17RecentsAppPopover18DOCDocumentManager)init;
- (_TtC17RecentsAppPopover18DOCDocumentManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 hierarchyController:(id)a5;
- (_TtCC17RecentsAppPopover18DOCDocumentManager23DocumentCreationSession)activeDocumentCreationSession;
- (void)configureUIPDocumentLandingStyleIfNecessary;
- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5;
- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toDefaultLocationWithCompletion:(id)a5;
- (void)importDocumentAt:(id)a3 nextTo:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6;
- (void)setActiveDocumentCreationSession:(id)a3;
- (void)setDocumentBrowser:(id)a3;
- (void)setUiBrowserDelegate:(id)a3;
@end

@implementation DOCDocumentManager

- (_TtCC17RecentsAppPopover18DOCDocumentManager23DocumentCreationSession)activeDocumentCreationSession
{
  return (_TtCC17RecentsAppPopover18DOCDocumentManager23DocumentCreationSession *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_activeDocumentCreationSession);
}

- (void)setActiveDocumentCreationSession:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_activeDocumentCreationSession);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_activeDocumentCreationSession) = (Class)a3;
  id v3 = a3;
}

- (UIDocumentBrowserViewControllerDelegate)uiBrowserDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (UIDocumentBrowserViewControllerDelegate *)Strong;
}

- (void)setUiBrowserDelegate:(id)a3
{
}

- (DOCFullDocumentManagerViewController)documentBrowser
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (DOCFullDocumentManagerViewController *)Strong;
}

- (void)setDocumentBrowser:(id)a3
{
}

- (_TtC17RecentsAppPopover18DOCDocumentManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 hierarchyController:(id)a5
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_activeDocumentCreationSession) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_sourceObserver) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_hierarchyController) = (Class)a5;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCDocumentManager();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  return [(DOCDocumentManager *)&v13 init];
}

- (void)configureUIPDocumentLandingStyleIfNecessary
{
}

- (void)importDocumentAt:(id)a3 nextTo:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  unint64_t v32 = a5;
  v29 = self;
  uint64_t v7 = sub_1004BBC60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  id v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v31 = (char *)&v29 - v12;
  __chkstk_darwin(v13);
  v15 = (char *)&v29 - v14;
  v16 = _Block_copy(a6);
  v30 = v15;
  sub_1004BBC10();
  sub_1004BBC10();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  v18 = self;
  v19 = v29;
  id v20 = [v18 defaultManager];
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v15, v7);
  unint64_t v21 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v22 = (v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = sub_1004B5144;
  *((void *)v23 + 3) = v17;
  *((void *)v23 + 4) = v20;
  *((void *)v23 + 5) = v19;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v23[v21], v10, v7);
  v24 = &v23[v22];
  *(void *)v24 = 0;
  *((void *)v24 + 1) = 0;
  *(void *)&v23[(v22 + 23) & 0xFFFFFFFFFFFFFFF8] = v32;
  v25 = v19;
  swift_retain();
  id v26 = v20;
  v27 = v31;
  sub_1004BF2A0();

  swift_release();
  swift_release();

  v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v27, v7);
  v28(v30, v7);
}

- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toDefaultLocationWithCompletion:(id)a5
{
  unint64_t v24 = a4;
  uint64_t v7 = sub_1004BBC60();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v21 - v12;
  uint64_t v14 = _Block_copy(a5);
  sub_1004BBC10();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = type metadata accessor for DOCHierarchyController(0);
  unint64_t v22 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_configuration);
  uint64_t v23 = v16;
  unint64_t v21 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_sourceObserver);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1004B5144;
  *(void *)(v19 + 24) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v10, v7);
  *(void *)(v19 + v18) = self;
  *(void *)(v19 + ((v18 + 15) & 0xFFFFFFFFFFFFFFF8)) = v24;
  id v20 = self;
  swift_retain();
  sub_10008B170(v22, v21, 0, (uint64_t)sub_100033618, v19);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  uint64_t v8 = sub_1004BBC60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  sub_1004BBC10();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = self;
  sub_1004B085C((uint64_t)v11, a4, (uint64_t)sub_1004B4960, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC17RecentsAppPopover18DOCDocumentManager)init
{
  result = (_TtC17RecentsAppPopover18DOCDocumentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_hierarchyController));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_activeDocumentCreationSession));
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover18DOCDocumentManager_uiBrowserDelegate);
  swift_unknownObjectWeakDestroy();
}

@end