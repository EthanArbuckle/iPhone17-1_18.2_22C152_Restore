@interface CAAUEQViewBase
+ (BOOL)requiresConstraintBasedLayout;
- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)tintColorDidChange;
@end

@implementation CAAUEQViewBase

- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_viewSetup) = 0;
  v7 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_permanentHeaderConstraints) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_permanentGraphConstraints) = v7;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase_temporaryConstraints) = v7;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___headerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___graphView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CAAUEQViewBase();
  return -[CAAUEQViewBase initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit14CAAUEQViewBase)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E5B5494();
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_21E5B3248();
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAAUEQViewBase();
  id v2 = v7.receiver;
  [(CAAUEQViewBase *)&v7 tintColorDidChange];
  id v3 = sub_21E5B3088();
  id v4 = objc_msgSend(v2, sel_tintColor, v7.receiver, v7.super_class);
  objc_msgSend(v3, sel_setTintColor_, v4);

  id v5 = sub_21E5B2FCC();
  id v6 = objc_msgSend(v2, sel_tintColor);
  objc_msgSend(v5, sel_setTintColor_, v6);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___headerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit14CAAUEQViewBase____lazy_storage___graphView);
}

@end