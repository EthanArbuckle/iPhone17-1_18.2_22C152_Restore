@interface EvaluationVFXView
- (CGRect)bounds;
- (_TtC13HearingTestUI17EvaluationVFXView)init;
- (_TtC13HearingTestUI17EvaluationVFXView)initWithCoder:(id)a3;
- (_TtC13HearingTestUI17EvaluationVFXView)initWithFrame:(CGRect)a3;
- (_TtC13HearingTestUI17EvaluationVFXView)initWithFrame:(CGRect)a3 options:(id)a4;
- (void)setBounds:(CGRect)a3;
@end

@implementation EvaluationVFXView

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EvaluationVFXView();
  [(EvaluationVFXView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for EvaluationVFXView();
  id v7 = v8.receiver;
  -[EvaluationVFXView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  sub_2513D4E40();
}

- (_TtC13HearingTestUI17EvaluationVFXView)init
{
  return (_TtC13HearingTestUI17EvaluationVFXView *)sub_2513D4254();
}

- (_TtC13HearingTestUI17EvaluationVFXView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2513D6694();
}

- (_TtC13HearingTestUI17EvaluationVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  CGRect result = (_TtC13HearingTestUI17EvaluationVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI17EvaluationVFXView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC13HearingTestUI17EvaluationVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI17EvaluationVFXView_blurAnimation));
}

@end