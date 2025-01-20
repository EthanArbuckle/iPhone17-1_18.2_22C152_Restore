@interface AFUISiriCarPlayLatencyView
- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithCoder:(id)a3;
- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithFrame:(CGRect)a3;
@end

@implementation AFUISiriCarPlayLatencyView

- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AFUISiriCarPlayLatencyView();
  v7 = -[AFUISiriCarPlayLatencyView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2230EB2D4();

  return v7;
}

- (_TtC11AssistantUI26AFUISiriCarPlayLatencyView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AFUISiriCarPlayLatencyView();
  id v4 = a3;
  v5 = [(AFUISiriCarPlayLatencyView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_2230EB2D4();
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssistantUI26AFUISiriCarPlayLatencyView_latencyLightView));
}

@end