@interface RoomCaptureView
- (NSArray)subviews;
- (_TtC8RoomPlan15RoomCaptureView)initWithCoder:(id)a3;
- (_TtC8RoomPlan15RoomCaptureView)initWithFrame:(CGRect)a3;
- (id)ibDelegate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setIbDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoomCaptureView

- (id)ibDelegate
{
  v2 = (char *)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x237DC8170](v2);

  return v3;
}

- (void)setIbDelegate:(id)a3
{
  if (!a3)
  {
    v9 = self;
    goto LABEL_11;
  }
  swift_unknownObjectRetain_n();
  v5 = self;
  swift_getObjectType();
  uint64_t v6 = swift_conformsToProtocol2();
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = a3;
  }
  else {
    id v8 = 0;
  }
  if (!v8)
  {
    swift_unknownObjectRelease();
LABEL_11:
    uint64_t v7 = 0;
  }
  v10 = (char *)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate;
  swift_beginAccess();
  *((void *)v10 + 1) = v7;
  swift_unknownObjectWeakAssign();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (NSArray)subviews
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_isEncoding);
  v4 = (objc_class *)type metadata accessor for RoomCaptureView();
  if (v3 == 1)
  {
    v12.receiver = self;
    v12.super_class = v4;
    v5 = self;
    uint64_t v6 = [(RoomCaptureView *)&v12 subviews];
    sub_2346A9D9C(0, &qword_2687AE478);
    unint64_t v7 = sub_2347EE7D0();

    sub_2347850B8(v7, (uint64_t)v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = v4;
    id v8 = self;
    v9 = [(RoomCaptureView *)&v13 subviews];
    sub_2346A9D9C(0, &qword_2687AE478);
    sub_2347EE7D0();
  }
  sub_2346A9D9C(0, &qword_2687AE478);
  v10 = (void *)sub_2347EE7C0();
  swift_bridgeObjectRelease();

  return (NSArray *)v10;
}

- (_TtC8RoomPlan15RoomCaptureView)initWithFrame:(CGRect)a3
{
  return (_TtC8RoomPlan15RoomCaptureView *)RoomCaptureView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8RoomPlan15RoomCaptureView)initWithCoder:(id)a3
{
  return (_TtC8RoomPlan15RoomCaptureView *)RoomCaptureView.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_23477DD38(v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  unint64_t v7 = self;
  id v5 = [(RoomCaptureView *)v7 traitCollection];
  unsigned int v6 = objc_msgSend(v5, sel_hasDifferentColorAppearanceComparedToTraitCollection_, v4);

  if (v6) {
    sub_23477E76C();
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoomCaptureView();
  v2 = (char *)v5.receiver;
  [(RoomCaptureView *)&v5 layoutSubviews];
  int v3 = *(void **)&v2[OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_gradientLayer];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (void)dealloc
{
  v2 = self;
  *((void *)sub_23477C658() + 3) = 0;
  swift_unknownObjectWeakAssign();
  swift_release();
  sub_23477E384();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for RoomCaptureView();
  [(RoomCaptureView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_2346BBA5C((uint64_t)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_roomCaptureARView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_worldSpaceManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_coachingOverlayView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2346A7C30((uint64_t)self + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView_sceneObserver, &qword_2687ADFB8);
  swift_release();

  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8RoomPlan15RoomCaptureView____lazy_storage___frameProcessor);

  sub_2347875D0(v3);
}

@end