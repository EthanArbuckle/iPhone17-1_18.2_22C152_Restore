@interface SiriCoordinator
- (_TtC12ClarityBoard15SiriCoordinator)init;
- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4;
- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5;
- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5;
@end

@implementation SiriCoordinator

- (_TtC12ClarityBoard15SiriCoordinator)init
{
  return (_TtC12ClarityBoard15SiriCoordinator *)sub_100033CF0();
}

- (void)siriPresentation:(id)a3 requestsPresentationWithOptions:(id)a4 withHandler:(id)a5
{
  v7 = _Block_copy(a5);
  _Block_copy(v7);
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  sub_10003469C(v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (void)siriPresentation:(id)a3 requestsDismissalWithOptions:(id)a4 withHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard15SiriCoordinator_presentationController);
  v10 = (void *)swift_allocObject();
  v10[2] = self;
  v10[3] = sub_100034630;
  v10[4] = v8;
  v14[4] = sub_100034678;
  v14[5] = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_100033424;
  v14[3] = &unk_10015DED0;
  v11 = _Block_copy(v14);
  v12 = self;
  swift_unknownObjectRetain();
  id v13 = a4;
  swift_retain();
  swift_release();
  [v9 dismissSiri:1 completion:v11];
  _Block_release(v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)siriPresentation:(id)a3 isEnabledDidChange:(BOOL)a4
{
  if (!a4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v5 = self;
    static Published.subscript.setter();
  }
}

- (void)siriPresentation:(id)a3 requestsPunchout:(id)a4 withHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = (void (*)(void *, void, void))v7[2];
  swift_unknownObjectRetain();
  id v9 = a4;
  v10 = self;
  v8(v7, 0, 0);
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12ClarityBoard15SiriCoordinator__isShowingSiri;
  uint64_t v4 = sub_100029F90(&qword_10017C038);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ClarityBoard15SiriCoordinator_presentationController);
}

@end