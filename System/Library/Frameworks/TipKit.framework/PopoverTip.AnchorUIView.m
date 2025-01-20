@interface PopoverTip.AnchorUIView
- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithCoder:(id)a3;
- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithFrame:(CGRect)a3;
@end

@implementation PopoverTip.AnchorUIView

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView___observationRegistrar;
  uint64_t v3 = sub_246386110();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7 = (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *)sub_24632AE04(x, y, width, height);
  swift_release();
  return v7;
}

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView)initWithCoder:(id)a3
{
  sub_2463870F0();
  sub_2463870E0();
  sub_2463870D0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F612AnchorUIView *)sub_2463828AC(a3);
  swift_release();
  return v4;
}

@end