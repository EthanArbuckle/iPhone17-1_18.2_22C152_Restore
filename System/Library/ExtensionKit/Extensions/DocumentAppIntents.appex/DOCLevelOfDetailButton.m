@interface DOCLevelOfDetailButton
- (_TtC18DocumentAppIntents22DOCLevelOfDetailButton)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation DOCLevelOfDetailButton

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCLevelOfDetailButton(0);
  id v2 = v3.receiver;
  [(DOCLevelOfDetailButton *)&v3 tintColorDidChange];
  objc_msgSend(v2, "setNeedsUpdateConfiguration", v3.receiver, v3.super_class);
}

- (_TtC18DocumentAppIntents22DOCLevelOfDetailButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents22DOCLevelOfDetailButton_observationContext));
  sub_1002B19E8((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents22DOCLevelOfDetailButton_metrics, type metadata accessor for DOCLevelOfDetailButton.Metrics);

  swift_bridgeObjectRelease();
}

@end