@interface AXTwiceCompanionRendererView
- (BOOL)performAXAction:(int)a3 withValue:(id)a4 onBridgeElement:(id)a5;
- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithCoder:(id)a3;
- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AXTwiceCompanionRendererView

- (void)layoutSubviews
{
  v2 = self;
  sub_22C0532D8();
}

- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithFrame:(CGRect)a3
{
  return (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *)AXTwiceCompanionRendererView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView)initWithCoder:(id)a3
{
  return (_TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView *)AXTwiceCompanionRendererView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_mirroringLayer));
  v3 = (char *)self + OBJC_IVAR____TtC21AXWatchRemoteScreenUI28AXTwiceCompanionRendererView_delegate;

  sub_22C054784((uint64_t)v3);
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 onBridgeElement:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  if (a4)
  {
    id v8 = a5;
    v9 = self;
    swift_unknownObjectRetain();
    sub_22C06CE60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    id v10 = a5;
    v11 = self;
  }
  BOOL v12 = AXTwiceCompanionRendererView.perform(_:withValue:on:)(v6, (uint64_t)v14, (uint64_t)a5);

  sub_22C054724((uint64_t)v14);
  return v12;
}

@end