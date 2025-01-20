@interface SessionItemsView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC13MediaControls16SessionItemsView)initWithCoder:(id)a3;
- (_TtC13MediaControls16SessionItemsView)initWithFrame:(CGRect)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)cellTapHandler:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableViewPanHandler:(id)a3;
@end

@implementation SessionItemsView

- (_TtC13MediaControls16SessionItemsView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls16SessionItemsView *)sub_1AE939B48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls16SessionItemsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE93CAC8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  uint64_t v5 = *(void *)(sub_1AE9396D8() + 16);
  swift_bridgeObjectRelease();
  if (qword_1E9A8F280 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_1E9A8F7A8;

  double v7 = v6 * (double)v5;
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AE946B28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE946B08();
  id v10 = a3;
  v11 = self;
  sub_1AE93CBE8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v5 = qword_1E9A8F288[0];
  id v6 = a3;
  uint64_t v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_1E9A8F7B0;

  return v8;
}

- (void)cellTapHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AE93BB50(v4);
}

- (void)tableViewPanHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AE93BFF0(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AE93A714(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls16SessionItemsView_viewModel));
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls16SessionItemsView_listener);
  sub_1AE8E7634((uint64_t)self + OBJC_IVAR____TtC13MediaControls16SessionItemsView_animationCoordinator);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls16SessionItemsView____lazy_storage___dataSource));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls16SessionItemsView_stylingProvider);
}

@end