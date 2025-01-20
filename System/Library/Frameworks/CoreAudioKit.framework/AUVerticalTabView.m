@interface AUVerticalTabView
- (NSArray)accessibilityElements;
- (_TtC12CoreAudioKit17AUVerticalTabView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit17AUVerticalTabView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AUVerticalTabView

- (_TtC12CoreAudioKit17AUVerticalTabView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_horizontal) = 0;
  v7 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_tabs) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_accessibleElements) = v7;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_selectedTabIndex) = (Class)-1;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_numActiveTabs) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_maxTabDimension) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit17AUVerticalTabView_tabDimension) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUVerticalTabView();
  return -[AUVerticalTabView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit17AUVerticalTabView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit17AUVerticalTabView *)sub_21E5459F0(a3);
}

- (NSArray)accessibilityElements
{
  v2 = self;
  sub_21E546244();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21E5B6688();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E5473F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end